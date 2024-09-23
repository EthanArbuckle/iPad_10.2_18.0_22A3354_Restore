@implementation __CFN_CoreSchedulingSetRunnable

+ (void)_run:(id)a3
{
  CFRunLoopRef Current;
  __CFRunLoop *v5;
  const __CFString *v6;
  __int128 v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  CFRunLoopSourceContext context;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  Current = CFRunLoopGetCurrent();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  if (a3)
  {
    context.version = 0;
    context.info = a3;
    context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E0C98350];
    context.equal = (Boolean (__cdecl *)(const void *, const void *))MEMORY[0x1E0C98620];
    context.hash = (CFHashCode (__cdecl *)(const void *))MEMORY[0x1E0C98758];
    context.schedule = 0;
    context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))_cancel;
    context.perform = (void (__cdecl *)(void *))_perform;
    *((_QWORD *)a3 + 6) = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &context);
    v5 = CFRunLoopGetCurrent();
    v6 = (const __CFString *)*MEMORY[0x1E0C9B280];
    CFRunLoopAddSource(v5, *((CFRunLoopSourceRef *)a3 + 6), (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    *((_QWORD *)a3 + 3) = pthread_self();
    if (!*((_QWORD *)a3 + 4))
    {
      if (Current)
      {
        *((_QWORD *)a3 + 4) = CFRetain(Current);
        v8 = (void (**)(_QWORD, _QWORD))*((_QWORD *)a3 + 2);
        if (v8)
        {
          *((_QWORD *)a3 + 2) = 0;
          ((void (**)(_QWORD, CFRunLoopRef))v8)[2](v8, Current);
          _Block_release(v8);
        }
        v9 = *((_QWORD *)a3 + 1);
        if (v9)
          v9 = dispatch_semaphore_signal(v9);
        *(_QWORD *)&v7 = 138413058;
        v12 = v7;
        *(_QWORD *)&v7 = 138412290;
        v11 = v7;
        while (1)
        {
          v10 = (void *)MEMORY[0x186DB8C8C](v9);
          switch(CFRunLoopRunInMode(v6, 1.79769313e308, 1u))
          {
            case kCFRunLoopRunFinished:
              -[__CFN_CoreSchedulingSetRunnable __SITUATIONAL_ABORT__:reason:](a3, (uint64_t)"runloop went to finished", (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("count = %ld/%ld/%ld/%ld/%ld, source %@"), *((_QWORD *)a3 + 7), *((_QWORD *)a3 + 8), *((_QWORD *)a3 + 9), *((_QWORD *)a3 + 10), *((_QWORD *)a3 + 11), *((_QWORD *)a3 + 6), v11, v12));
            case kCFRunLoopRunStopped:
              ++*((_QWORD *)a3 + 8);
              break;
            case kCFRunLoopRunTimedOut:
              ++*((_QWORD *)a3 + 9);
              break;
            case kCFRunLoopRunHandledSource:
              ++*((_QWORD *)a3 + 10);
              break;
            default:
              break;
          }
          objc_autoreleasePoolPop(v10);
        }
      }
      __assert_rtn("-[__CFN_CoreSchedulingSetRunnable startedRunLoop:]", "CoreSchedulingSet.mm", 1257, "rl");
    }
    __assert_rtn("-[__CFN_CoreSchedulingSetRunnable startedRunLoop:]", "CoreSchedulingSet.mm", 1256, "_rl == NULL");
  }
}

- (void)dealloc
{
  NSObject *sem;
  id setup;
  __CFRunLoop *rl;
  objc_super v6;

  sem = self->_sem;
  if (sem)
  {
    dispatch_release(sem);
    self->_sem = 0;
  }
  setup = self->_setup;
  if (setup)
  {
    _Block_release(setup);
    self->_setup = 0;
  }
  rl = self->_rl;
  if (rl)
  {
    CFRelease(rl);
    self->_rl = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)__CFN_CoreSchedulingSetRunnable;
  -[__CFN_CoreSchedulingSetRunnable dealloc](&v6, sel_dealloc);
}

- (void)__SITUATIONAL_ABORT__:(void *)a3 reason:
{
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  CFRunLoopRef Current;
  uint64_t v11;
  uint64_t v12;
  const char *label;
  pthread_t v14;
  _opaque_pthread_t *v15;
  uint64_t v16;
  const __CFString *WrappedStringWithFormat;
  uint64_t v18;
  const __CFAllocator *v19;
  const __CFArray *v20;
  const void *v21;
  const __CFString *v22;
  CFIndex Length;
  CFIndex v24;
  char *v25;
  void *v26;
  char *v27;
  int v28;
  NSObject *v29;
  uint8_t buf[8];
  __int16 v31;
  char *v32;
  void *values[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = values;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v7 = objc_opt_class();
  values[0] = (void *)_createWrappedStringWithFormat(CFSTR("%@ Failure: %s"), v7, a2);
  values[1] = (id)objc_msgSend(a1, "description");
  if (a3)
  {
    *(_QWORD *)&v34 = a3;
    v8 = 3;
  }
  else
  {
    v8 = 2;
  }
  v9 = &values[v8];
  *v9 = (void *)_createWrappedStringWithFormat(CFSTR("rl = %@, performCount = %lld"), a1[4], a1[5]);
  Current = CFRunLoopGetCurrent();
  v9[1] = (void *)_createWrappedStringWithFormat(CFSTR("CFRunLoopGetCurrent = %@"), Current);
  v11 = *MEMORY[0x1E0C9A268];
  v12 = pthread_mach_thread_np((pthread_t)*MEMORY[0x1E0C9A268]);
  v9[2] = (void *)_createWrappedStringWithFormat(CFSTR("main queue = %p, main thread = %p, main mach thread = %u"), MEMORY[0x1E0C80D38], v11, v12);
  label = dispatch_queue_get_label(0);
  v14 = pthread_self();
  v15 = pthread_self();
  v16 = pthread_mach_thread_np(v15);
  WrappedStringWithFormat = _createWrappedStringWithFormat(CFSTR("this queue = %s, this thread = %p, this mach thread = %u"), label, v14, v16);
  v18 = v8 | 4;
  v9[3] = (void *)WrappedStringWithFormat;
  v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v20 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, v8 | 4, MEMORY[0x1E0C9B378]);
  do
  {
    v21 = *v6++;
    CFRelease(v21);
    --v18;
  }
  while (v18);
  v22 = CFStringCreateByCombiningStrings(v19, v20, CFSTR("\nCFNETWORK_ABORT: "));
  CFRelease(v20);
  Length = CFStringGetLength(v22);
  v24 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v25 = (char *)malloc_type_malloc(v24, 0x80528050uLL);
  CFStringGetCString(v22, v25, v24, 0x8000100u);
  CFRelease(v22);
  pthread_mutex_lock(&sMessagesLock);
  v26 = (void *)qword_1EDCF8FF0;
  if (qword_1EDCF8FF0)
  {
    *(_QWORD *)buf = 0;
    asprintf((char **)buf, "%s\n--\n%s--\n", (const char *)qword_1EDCF8FF0, v25);
    qword_1EDCF8FF0 = *(_QWORD *)buf;
    free(v26);
  }
  else
  {
    qword_1EDCF8FF0 = (uint64_t)strdup(v25);
  }
  pthread_mutex_unlock(&sMessagesLock);
  v27 = strchr(v25, 10);
  v28 = (int)v27;
  if (!v27)
    v28 = (_DWORD)v25 + strlen(v25);
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v29 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = v28 - (_DWORD)v25;
    v31 = 2080;
    v32 = v25;
    _os_log_error_impl(&dword_183ECA000, v29, OS_LOG_TYPE_ERROR, "CoreSchedulingSet Error: %.*s", buf, 0x12u);
  }
  exit(1);
}

@end
