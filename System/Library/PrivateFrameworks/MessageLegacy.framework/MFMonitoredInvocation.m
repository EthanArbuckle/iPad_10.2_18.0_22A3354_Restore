@implementation MFMonitoredInvocation

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object:(id)a5 taskName:(id)a6 priority:(int)a7 canBeCancelled:(BOOL)a8
{
  MFMonitoredInvocation *v8;
  id v10;

  v10 = a5;
  v8 = (MFMonitoredInvocation *)objc_msgSend(a1, "invocationWithSelector:target:taskName:priority:canBeCancelled:", a3, a4, a6, *(_QWORD *)&a7, a8);
  if ((unint64_t)objc_msgSend((id)-[MFMonitoredInvocation methodSignature](v8, "methodSignature"), "numberOfArguments") >= 3)-[MFMonitoredInvocation setArgument:atIndex:](v8, "setArgument:atIndex:", &v10, 2);
  return v8;
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 taskName:(id)a5 priority:(int)a6 canBeCancelled:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  MFMonitoredInvocation *v10;
  MFActivityMonitor *v11;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v10 = (MFMonitoredInvocation *)objc_msgSend(a1, "mf_invocationWithSelector:target:", a3, a4);
  v11 = -[MFMonitoredInvocation monitor](v10, "monitor");
  -[MFActivityMonitor setTaskName:](v11, "setTaskName:", a5);
  -[MFActivityMonitor setCanBeCancelled:](v11, "setCanBeCancelled:", v7);
  -[EFPriorityDesignator setPriority:](v11, "setPriority:", v8);
  return v10;
}

- (MFActivityMonitor)monitor
{
  return self->_monitor;
}

+ (MFMonitoredInvocation)invocationWithMethodSignature:(id)a3
{
  MFMonitoredInvocation *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___MFMonitoredInvocation;
  v3 = (MFMonitoredInvocation *)objc_msgSendSuper2(&v5, sel_invocationWithMethodSignature_, a3);
  v3->_monitor = objc_alloc_init(MFActivityMonitor);
  return v3;
}

- (BOOL)mf_shouldLogInvocation
{
  return self->_shouldLogInvocation;
}

- (void)invoke
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1C8839000, log, OS_LOG_TYPE_FAULT, "Exception raised during monitored invocation of %{public}@, exception: %{public}@", buf, 0x16u);
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object1:(id)a5 object2:(id)a6 taskName:(id)a7 priority:(int)a8 canBeCancelled:(BOOL)a9
{
  MFMonitoredInvocation *v9;
  id v11;

  v11 = a6;
  v9 = (MFMonitoredInvocation *)objc_msgSend(a1, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", a3, a4, a5, a7, *(_QWORD *)&a8, a9);
  if ((unint64_t)objc_msgSend((id)-[MFMonitoredInvocation methodSignature](v9, "methodSignature"), "numberOfArguments") >= 4)-[MFMonitoredInvocation setArgument:atIndex:](v9, "setArgument:atIndex:", &v11, 3);
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  MFMonitoredInvocation *v6;
  __int16 v7;
  MFMonitoredInvocation *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_shouldLogInvocation)
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v6 = self;
      v7 = 2112;
      v8 = self;
      _os_log_impl(&dword_1C8839000, v3, OS_LOG_TYPE_DEFAULT, "deallocating %p %@", buf, 0x16u);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)MFMonitoredInvocation;
  -[MFMonitoredInvocation dealloc](&v4, sel_dealloc);
}

- (void)setShouldLogInvocation:(BOOL)a3
{
  self->_shouldLogInvocation = a3;
}

uint64_t __31__MFMonitoredInvocation_invoke__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "cancel");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  unint64_t v6;
  uint64_t v7;
  const char *Name;
  const __CFString *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[EFPriorityDesignator priority](self->_monitor, "priority");
  v7 = -[MFMonitoredInvocation target](self, "target");
  Name = sel_getName((SEL)-[MFMonitoredInvocation selector](self, "selector"));
  if (self->_isLowPriority)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p priority: %lu target: %@ selector: %s lowPriority: %@>"), v5, self, v6, v7, Name, v9);
}

- (BOOL)isLowPriority
{
  return self->_isLowPriority;
}

- (void)setIsLowPriority:(BOOL)a3
{
  self->_isLowPriority = a3;
}

- (NSString)powerAssertionId
{
  return self->_powerAssertionId;
}

- (void)setPowerAssertionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
