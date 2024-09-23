@implementation MFMonitoredInvocation

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 taskName:(id)a5 priority:(unint64_t)a6 canBeCancelled:(BOOL)a7
{
  _BOOL8 v7;
  void *v9;
  void *v10;

  v7 = a7;
  objc_msgSend(a1, "mf_invocationWithSelector:target:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "monitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCanBeCancelled:", v7);
  objc_msgSend(v10, "setPriority:", a6);

  return (MFMonitoredInvocation *)v9;
}

- (MFActivityMonitor)monitor
{
  return self->_monitor;
}

+ (MFMonitoredInvocation)invocationWithMethodSignature:(id)a3
{
  _QWORD *v3;
  MFActivityMonitor *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MFMonitoredInvocation;
  objc_msgSendSuper2(&v7, sel_invocationWithMethodSignature_, a3);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MFActivityMonitor);
  v5 = (void *)v3[7];
  v3[7] = v4;

  return (MFMonitoredInvocation *)v3;
}

- (BOOL)mf_shouldLogInvocation
{
  return self->_shouldLogInvocation;
}

- (void)invoke
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[29];

  v9[26] = *MEMORY[0x1E0C80C00];
  if (self->_powerAssertionId)
  {
    +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "retainAssertionWithIdentifier:", self->_powerAssertionId);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__MFMonitoredInvocation_invoke__block_invoke;
    v9[3] = &unk_1E4E8ECF8;
    v9[4] = self;
    objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("MFPowerAssertionDidExpire"), 0, 0, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[MFActivityMonitor startActivity](self->_monitor, "startActivity");
  if (!-[MFActivityMonitor shouldCancel](self->_monitor, "shouldCancel"))
  {
    v8.receiver = self;
    v8.super_class = (Class)MFMonitoredInvocation;
    -[MFMonitoredInvocation invoke](&v8, sel_invoke);
    _MFFlushCurrentInvocation();
  }
  -[MFActivityMonitor finishedActivity:](self->_monitor, "finishedActivity:", self);
  if (self->_powerAssertionId)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", v5);

    +[MFPowerController sharedInstance](MFPowerController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "releaseAssertionWithIdentifier:", self->_powerAssertionId);

  }
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
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v6 = self;
      v7 = 2112;
      v8 = self;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "deallocating %p %@", buf, 0x16u);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)MFMonitoredInvocation;
  -[MFMonitoredInvocation dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertionId, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object:(id)a5 taskName:(id)a6 priority:(unint64_t)a7 canBeCancelled:(BOOL)a8
{
  _BOOL8 v8;
  void *v14;
  void *v15;
  unint64_t v16;
  id v18;

  v8 = a8;
  v18 = a5;
  objc_msgSend(a1, "invocationWithSelector:target:taskName:priority:canBeCancelled:", a3, a4, a6, a7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "methodSignature");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "numberOfArguments");

  if (v16 >= 3)
    objc_msgSend(v14, "setArgument:atIndex:", &v18, 2);

  return (MFMonitoredInvocation *)v14;
}

+ (MFMonitoredInvocation)invocationWithSelector:(SEL)a3 target:(id)a4 object1:(id)a5 object2:(id)a6 taskName:(id)a7 priority:(unint64_t)a8 canBeCancelled:(BOOL)a9
{
  void *v15;
  void *v16;
  unint64_t v17;
  id v19;

  v19 = a6;
  objc_msgSend(a1, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:", a3, a4, a5, a7, a8, a9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "methodSignature");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "numberOfArguments");

  if (v17 >= 4)
    objc_msgSend(v15, "setArgument:atIndex:", &v19, 3);

  return (MFMonitoredInvocation *)v15;
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
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EFPriorityDesignator priority](self->_monitor, "priority");
  -[MFMonitoredInvocation target](self, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p priority: %lu target: %@ selector: %s>"), v5, self, v6, v7, sel_getName((SEL)-[MFMonitoredInvocation selector](self, "selector")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
