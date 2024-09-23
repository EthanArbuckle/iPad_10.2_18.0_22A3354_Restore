@implementation NSThread

+ (BOOL)setThreadPriority:(double)p
{
  qos_class_t v4;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  int v10;
  int v11;
  qos_class_t v12;

  v4 = qos_class_self();
  if (v4 == QOS_CLASS_DEFAULT || v4 == QOS_CLASS_UNSPECIFIED)
    return -[NSThread _setThreadPriority:](+[NSThread currentThread](NSThread, "currentThread"), "_setThreadPriority:", p);
  v6 = 0.0;
  if (p >= 0.0)
    v6 = p;
  v7 = v6 * -2.0 * -15.0;
  v8 = v6 <= 1.0;
  v9 = 30.0;
  if (v8)
    v9 = v7;
  v10 = vcvtmd_s64_f64(v9);
  if (v10 >= 15)
    v10 = 15;
  v11 = (v10 & ~(v10 >> 31)) - 15;
  v12 = qos_class_self();
  return pthread_set_qos_class_self_np(v12, v11) == 0;
}

+ (double)threadPriority
{
  qos_class_t v2;
  double result;
  _opaque_pthread_t *v4;
  int qos_class_np;
  qos_class_t __qos_class[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = qos_class_self();
  if (v2 != QOS_CLASS_DEFAULT && v2)
  {
    *(_QWORD *)__qos_class = 0;
    v4 = pthread_self();
    qos_class_np = pthread_get_qos_class_np(v4, &__qos_class[1], (int *)__qos_class);
    result = -1.0;
    if (!qos_class_np)
      return (double)(__qos_class[0] + 15) / 30.0;
  }
  else
  {
    -[NSThread threadPriority](+[NSThread currentThread](NSThread, "currentThread"), "threadPriority");
  }
  return result;
}

- (id)description
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;

  v3 = objc_opt_class();
  v4 = (unsigned int *)self->_private;
  v5 = v4[12];
  v6 = (const __CFString *)*((_QWORD *)v4 + 5);
  if (!v6)
  {
    v7 = pthread_main_np();
    v6 = CFSTR("main");
    if (v7 != 1)
      v6 = 0;
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>{number = %d, name = %@}"), v3, self, v5, v6);
}

+ (void)detachNewThreadSelector:(SEL)selector toTarget:(id)target withObject:(id)argument
{
  objc_msgSend((id)objc_msgSend(objc_allocWithZone((Class)NSThread), "initWithTarget:selector:object:", target, selector, argument), "start");
}

- (NSThread)initWithBlock:(void *)block
{
  void *v4;
  NSThread *v5;
  NSString *v7;

  if (!block)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: block targets for threads cannot be nil"), _NSMethodExceptionProem((objc_class *)self, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  v4 = _Block_copy(block);
  v5 = -[NSThread initWithTarget:selector:object:](self, "initWithTarget:selector:object:", v4, sel_invoke, 0);
  _Block_release(v4);
  return v5;
}

- (NSThread)initWithTarget:(id)target selector:(SEL)selector object:(id)argument
{
  NSThread *v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  NSString *v17;
  NSString *v18;

  if (target && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = _NSMethodExceptionProem((objc_class *)self, a2);
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: target does not implement selector (%@)"), v17, _NSMethodExceptionProem((objc_class *)target, selector));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
  }
  v10 = -[NSThread init](self, "init");
  v11 = target;
  v12 = v10->_private;
  if (v12)
  {
    v12[1] = v11;
    v13 = v10->_private;
    if (v13)
      v13[2] = selector;
  }
  v14 = argument;
  v15 = v10->_private;
  if (v15)
    v15[3] = v14;
  return v10;
}

- (BOOL)isMainThread
{
  return +[NSThread mainThread](NSThread, "mainThread") == self;
}

- (NSThread)init
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  double v11;
  sched_param v13[2];

  v13[1] = *(sched_param *)MEMORY[0x1E0C80C00];
  v3 = objc_opt_new();
  *(_QWORD *)(v3 + 32) = objc_opt_new();
  *(_QWORD *)(v3 + 40) = 0;
  *(_BYTE *)(v3 + 52) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 8) = 0;
  do
  {
    v4 = __ldaxr((unsigned int *)&init_seqNum);
    v5 = v4 + 1;
  }
  while (__stlxr(v5, (unsigned int *)&init_seqNum));
  *(_DWORD *)(v3 + 48) = v5;
  *(_BYTE *)(v3 + 54) = 0;
  atomic_store(0, (unsigned __int8 *)(v3 + 55));
  *(_BYTE *)(v3 + 53) = 0;
  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 64) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v3 + 144) = _Q0;
  pthread_attr_init((pthread_attr_t *)(v3 + 72));
  pthread_attr_setscope((pthread_attr_t *)(v3 + 72), 1);
  pthread_attr_setdetachstate((pthread_attr_t *)(v3 + 72), 2);
  *(_QWORD *)(v3 + 136) = 0;
  self->_private = (id)v3;
  v13[0] = 0;
  if (pthread_attr_getschedparam((const pthread_attr_t *)(v3 + 72), v13))
  {
    v11 = *(double *)(v3 + 152);
  }
  else
  {
    v11 = (double)v13[0].sched_priority / 62.0;
    *(double *)(v3 + 152) = v11;
  }
  *(double *)(v3 + 144) = v11;
  return self;
}

+ (NSThread)mainThread
{
  if (!_NSIsMultiThreaded && pthread_main_np() != 1)
  {
    _NSIsMultiThreaded = 1;
    objc_msgSend(+[NSNotificationCenter _defaultCenterWithoutCreating](NSNotificationCenter, "_defaultCenterWithoutCreating"), "postNotificationName:object:userInfo:", CFSTR("NSWillBecomeMultiThreadedNotification"), 0, 0);
  }
  return (NSThread *)_NSThreadGet0(0);
}

- (void)_nq:(id)a3
{
  void *v5;
  __CFRunLoop *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFAllocator *v9;
  uint64_t i;
  const __CFString *v11;
  __CFRunLoopSource *v12;
  CFRunLoopSourceContext v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  v5 = (void *)*((_QWORD *)self->_private + 7);
  if (!v5)
  {
    *((_QWORD *)self->_private + 7) = objc_opt_new();
    v5 = (void *)*((_QWORD *)self->_private + 7);
  }
  objc_msgSend(v5, "addObject:", a3);
  v6 = (__CFRunLoop *)threadRunLoop(*((_opaque_pthread_t **)self->_private + 17));
  if (v6)
  {
    if (!*((_QWORD *)self->_private + 8))
      *((_QWORD *)self->_private + 8) = objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    if (a3)
      a3 = (id)*((_QWORD *)a3 + 4);
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(a3);
          v11 = *(const __CFString **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v12 = (__CFRunLoopSource *)objc_msgSend(*((id *)self->_private + 8), "objectForKey:", v11);
          if (!v12)
          {
            memset(&v13, 0, 72);
            v13.perform = (void (__cdecl *)(void *))__NSThreadPerformPerform;
            v13.info = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
            v12 = CFRunLoopSourceCreate(v9, 0, &v13);
            *(_QWORD *)v13.info = v12;
            CFRunLoopAddSource(v6, v12, v11);
            objc_msgSend(*((id *)self->_private + 8), "setObject:forKey:", v12, v11);
            CFRelease(v12);
          }
          CFRunLoopSourceSignal(v12);
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v7);
    }
    CFRunLoopWakeUp(v6);
  }
  objc_sync_exit(self);
}

- (void)dealloc
{
  id *v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = (id *)self->_private;
  if (v3)
  {

    *((_QWORD *)self->_private + 5) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSThread;
  -[NSThread dealloc](&v4, sel_dealloc);
}

- (NSQualityOfService)qualityOfService
{
  pthread_t *v3;
  NSQualityOfService v4;
  qos_class_t __qos_class[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (pthread_t *)self->_private;
  v4 = *((char *)v3 + 53);
  if (!pthread_equal(v3[17], 0))
  {
    *(_QWORD *)__qos_class = 0;
    pthread_get_qos_class_np(*((pthread_t *)self->_private + 17), &__qos_class[1], (int *)__qos_class);
    v4 = (unint64_t)__qos_class[1];
  }
  if ((_DWORD)v4 == (NSQualityOfServiceUtility|0x4) || v4 == 0)
    return -1;
  else
    return v4;
}

- (void)_endQoSOverride:(pthread_override_s *)a3
{
  if (a3)
    pthread_override_qos_class_end_np(a3);
}

+ (BOOL)isMainThread
{
  return pthread_main_np() == 1;
}

- (void)setName:(NSString *)name
{
  NSString *v3;
  void *v6;
  const char *v7;

  v3 = (NSString *)*((_QWORD *)self->_private + 5);
  if (v3 != name)
  {

    *((_QWORD *)self->_private + 5) = -[NSString copy](name, "copy");
    if (+[NSThread currentThread](NSThread, "currentThread") == self)
    {
      v6 = (void *)*((_QWORD *)self->_private + 5);
      if (v6)
        v7 = (const char *)objc_msgSend(v6, "UTF8String");
      else
        v7 = "";
      pthread_setname_np(v7);
    }
  }
}

+ (NSThread)currentThread
{
  if (!_NSIsMultiThreaded && pthread_main_np() != 1)
  {
    _NSIsMultiThreaded = 1;
    objc_msgSend(+[NSNotificationCenter _defaultCenterWithoutCreating](NSNotificationCenter, "_defaultCenterWithoutCreating"), "postNotificationName:object:userInfo:", CFSTR("NSWillBecomeMultiThreadedNotification"), 0, 0);
  }
  return (NSThread *)_NSThreadGet0(1);
}

- (NSMutableDictionary)threadDictionary
{
  return (NSMutableDictionary *)*((_QWORD *)self->_private + 4);
}

- (NSString)name
{
  id v3;
  NSString *result;
  char v5[300];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = self->_private;
  result = (NSString *)*((_QWORD *)v3 + 5);
  if (!result)
  {
    if (pthread_getname_np(*((pthread_t *)v3 + 17), v5, 0x12CuLL))
      return (NSString *)*((_QWORD *)self->_private + 5);
    else
      return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5);
  }
  return result;
}

- (void)main
{
  _QWORD *v2;
  const char *v3;
  void *v4;

  v2 = self->_private;
  if (v2)
  {
    v3 = (const char *)v2[2];
    if (v3)
    {
      v4 = (void *)v2[1];
      if (v4)
        objc_msgSend(v4, v3, v2[3]);
    }
  }
}

- (void)start
{
  -[NSThread startAndReturnError:](self, "startAndReturnError:", 0);
}

- (BOOL)startAndReturnError:(id *)a3
{
  unsigned __int8 *v6;
  char *v8;
  pthread_attr_t *v10;
  char v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  NSString *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned __int8 *)self->_private + 55;
  do
  {
    if (__ldaxr(v6))
    {
      __clrex();
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: attempt to start the thread again"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
      objc_exception_throw(v15);
    }
  }
  while (__stlxr(0xDu, v6));
  v8 = (char *)self->_private;
  if (v8[54])
  {
    atomic_store(0xFu, (unsigned __int8 *)v8 + 55);
  }
  else
  {
    if (!_NSIsMultiThreaded)
    {
      _NSIsMultiThreaded = 1;
      -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSWillBecomeMultiThreadedNotification"), 0, 0);
      v8 = (char *)self->_private;
    }
    if (v8[53])
    {
      v10 = (pthread_attr_t *)(v8 + 72);
      if (v8[53] == 255)
        v11 = 21;
      else
        v11 = v8[53];
      pthread_attr_set_qos_class_np(v10, (qos_class_t)v11, 0);
      v8 = (char *)self->_private;
    }
    v12 = pthread_create((pthread_t *)v8 + 17, (const pthread_attr_t *)(v8 + 72), (void *(__cdecl *)(void *))__NSThread__start__, self);
    if (v12)
    {
      v13 = v12;
      if (a3)
      {
        *a3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSPOSIXErrorDomain"), v12, 0);
      }
      else
      {
        v14 = _NSOSLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v17 = _NSMethodExceptionProem((objc_class *)self, a2);
          v18 = 1024;
          v19 = v13;
          _os_log_error_impl(&dword_1817D9000, v14, OS_LOG_TYPE_ERROR, "%@: Thread creation failed with error %d", buf, 0x12u);
        }
      }
    }
  }
  return 1;
}

+ (void)exit
{
  pthread_exit(0);
}

+ (NSArray)callStackReturnAddresses
{
  void *v2;

  v2 = malloc_type_malloc(0x800uLL, 0x80040B8603338uLL);
  if (v2)
    thread_stack_async_pcs();
  return (NSArray *)+[_NSCallStackArray arrayWithFrames:count:symbols:](_NSCallStackArray, "arrayWithFrames:count:symbols:", v2, 0, 0);
}

+ (NSArray)callStackSymbols
{
  void *v2;

  v2 = malloc_type_malloc(0x800uLL, 0x80040B8603338uLL);
  if (v2)
    thread_stack_async_pcs();
  return (NSArray *)+[_NSCallStackArray arrayWithFrames:count:symbols:](_NSCallStackArray, "arrayWithFrames:count:symbols:", v2, 0, 1);
}

- (BOOL)isCancelled
{
  return *((_BYTE *)self->_private + 54) != 0;
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  if (pthread_equal(*((pthread_t *)self->_private + 17), 0))
  {
    if ((unint64_t)(qualityOfService + 1) > 0x22
      || ((1 << (qualityOfService + 1)) & 0x404040401) == 0)
    {
      LOBYTE(qualityOfService) = -1;
    }
    *((_QWORD *)self->_private + 18) = *((_QWORD *)self->_private + 19);
    *((_BYTE *)self->_private + 53) = qualityOfService;
  }
}

+ (BOOL)isMultiThreaded
{
  return _NSIsMultiThreaded;
}

+ (void)sleepForTimeInterval:(NSTimeInterval)ti
{
  double v4;
  double v5;
  long double v6;
  double v7;
  double __y;
  timespec __rqtp;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CFGetSystemUptime();
  if (ti > 0.0)
  {
    v5 = v4 + ti;
    do
    {
      __rqtp = (timespec)xmmword_1822B5320;
      if (ti < 9.22337204e18)
      {
        __y = 0.0;
        v6 = modf(ti, &__y);
        __rqtp.tv_sec = (uint64_t)__y;
        __rqtp.tv_nsec = (uint64_t)(v6 * 1000000000.0);
      }
      nanosleep(&__rqtp, 0);
      CFGetSystemUptime();
      ti = v5 - v7;
    }
    while (v5 - v7 > 0.0);
  }
}

- (void)setStackSize:(NSUInteger)stackSize
{
  size_t v3;
  void *v4;
  uint64_t v5;
  NSString *v6;

  v3 = stackSize;
  if (stackSize >> 14)
  {
    if (stackSize >= 0x40000000)
      v3 = 0x40000000;
    if (pthread_attr_setstacksize((pthread_attr_t *)((char *)self->_private + 72), v3)
      && dyld_program_sdk_at_least())
    {
      v4 = (void *)MEMORY[0x1E0C99DA0];
      v5 = *MEMORY[0x1E0C99778];
      v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't set stack size to %lu (it must be a multiple of the system page size and greater than %d)"), v3, 0x4000);
LABEL_9:
      objc_exception_throw((id)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0));
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    v5 = *MEMORY[0x1E0C99778];
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can't set stack size to a value lower than %d (requested %lu)"), 0x4000, v3);
    goto LABEL_9;
  }
}

- (double)threadPriority
{
  thread_inspect_t v3;
  integer_t v4;
  BOOLean_t get_default;
  mach_msg_type_number_t policy_infoCnt;
  integer_t policy_info;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!pthread_equal(*((pthread_t *)self->_private + 17), 0))
  {
    policy_infoCnt = 1;
    policy_info = 0;
    get_default = 0;
    v3 = pthread_mach_thread_np(*((pthread_t *)self->_private + 17));
    if (!thread_policy_get(v3, 3u, &policy_info, &policy_infoCnt, &get_default))
    {
      v4 = policy_info;
      if (policy_info >= 31)
        v4 = 31;
      if (v4 <= -31)
        v4 = -31;
      *((double *)self->_private + 18) = (double)(v4 + 31) / 62.0;
    }
  }
  return *((double *)self->_private + 18);
}

- (BOOL)_setThreadPriority:(double)a3
{
  double v4;
  int v5;
  thread_act_t v6;
  thread_act_t v7;
  integer_t policy_info;
  sched_param v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
    a3 = 0.0;
  if (a3 <= 1.0)
    v4 = a3;
  else
    v4 = 1.0;
  *((double *)self->_private + 18) = v4;
  if (pthread_equal(*((pthread_t *)self->_private + 17), 0))
    *((_BYTE *)self->_private + 53) = 0;
  if (pthread_equal(*((pthread_t *)self->_private + 17), 0))
  {
    pthread_attr_setschedpolicy((pthread_attr_t *)((char *)self->_private + 72), 1);
    *(_DWORD *)v10.__opaque = 0;
    v10.sched_priority = (int)(v4 * 62.0 + 0.5);
    v5 = pthread_attr_setschedparam((pthread_attr_t *)((char *)self->_private + 72), &v10);
  }
  else
  {
    v10.sched_priority = 1;
    v6 = pthread_mach_thread_np(*((pthread_t *)self->_private + 17));
    thread_policy_set(v6, 1u, (thread_policy_t)&v10, 1u);
    policy_info = (int)(v4 * 62.0 + 0.5) - 31;
    v7 = pthread_mach_thread_np(*((pthread_t *)self->_private + 17));
    v5 = thread_policy_set(v7, 3u, &policy_info, 1u);
  }
  return v5 == 0;
}

+ (void)sleepUntilDate:(NSDate *)date
{
  double v4;
  double v5;
  double Current;
  double v7;
  double v8;
  double v9;
  long double v10;
  double v11;
  double __y;
  timespec __rqtp;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  CFGetSystemUptime();
  v5 = v4;
  Current = CFAbsoluteTimeGetCurrent();
  -[NSDate timeIntervalSinceReferenceDate](date, "timeIntervalSinceReferenceDate");
  v8 = v7 - Current;
  if (v8 > 0.0)
  {
    v9 = v5 + v8;
    do
    {
      __rqtp = (timespec)xmmword_1822B5320;
      if (v8 < 9.22337204e18)
      {
        __y = 0.0;
        v10 = modf(v8, &__y);
        __rqtp.tv_sec = (uint64_t)__y;
        __rqtp.tv_nsec = (uint64_t)(v10 * 1000000000.0);
      }
      nanosleep(&__rqtp, 0);
      CFGetSystemUptime();
      v8 = v9 - v11;
    }
    while (v8 > 0.0);
  }
}

- (id)runLoop
{
  void *v2;

  if (*((unsigned __int8 *)self->_private + 52) > 1u)
    return 0;
  _CFAutoreleasePoolPush();
  if (threadRunLoop(*((_opaque_pthread_t **)self->_private + 17)))
    v2 = (void *)_CFRunLoopGet2();
  else
    v2 = 0;
  _CFAutoreleasePoolPop();
  return v2;
}

- (BOOL)isDying
{
  return *((_BYTE *)self->_private + 52) != 0;
}

+ (BOOL)isDying
{
  return -[NSThread isDying](+[NSThread currentThread](NSThread, "currentThread"), "isDying");
}

+ (void)detachNewThreadWithBlock:(void *)block
{
  void *v4;
  void *v5;
  pthread_t v6;
  pthread_attr_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!block)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: block targets for threads cannot be nil"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
    objc_exception_throw(v5);
  }
  v6 = 0;
  memset(&v7, 0, sizeof(v7));
  pthread_attr_init(&v7);
  pthread_attr_setscope(&v7, 1);
  pthread_attr_setdetachstate(&v7, 2);
  v4 = _Block_copy(block);
  pthread_create(&v6, &v7, (void *(__cdecl *)(void *))__NSThread__block_start__, v4);
}

- (NSUInteger)stackSize
{
  size_t v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  pthread_attr_getstacksize((const pthread_attr_t *)((char *)self->_private + 72), v3);
  return v3[0];
}

- (pthread_override_s)_beginQoSOverride:(unsigned int)a3 relativePriority:(int)a4
{
  uint64_t v7;

  v7 = *((_QWORD *)self->_private + 17);
  if (v7 == pthread_main_thread_np())
    return 0;
  else
    return pthread_override_qos_class_start_np(*((pthread_t *)self->_private + 17), (qos_class_t)a3, a4);
}

- (BOOL)isExecuting
{
  int v2;

  v2 = atomic_load((unsigned __int8 *)self->_private + 55);
  return v2 == 14;
}

- (BOOL)isFinished
{
  int v2;

  v2 = atomic_load((unsigned __int8 *)self->_private + 55);
  return v2 == 15;
}

- (void)cancel
{
  if (+[NSThread mainThread](NSThread, "mainThread") != self)
    *((_BYTE *)self->_private + 54) = -86;
}

uint64_t ____NSThread__block_start___block_invoke()
{
  return pthread_key_create((pthread_key_t *)&qword_1ECD09A00, (void (__cdecl *)(void *))__NSThread__block_dispose);
}

@end
