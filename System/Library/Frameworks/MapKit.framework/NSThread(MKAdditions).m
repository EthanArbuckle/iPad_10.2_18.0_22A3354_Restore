@implementation NSThread(MKAdditions)

+ (id)_mapkit_networkIOThread
{
  pthread_once(&_initNetworkIOThread, (void (*)(void))initNetworkIOThread);
  return (id)qword_1ECE2DA90;
}

+ (void)_mapkit_runThread:()MKAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFRunLoop *Current;
  __CFRunLoopSource *v8;
  const __CFString *v9;
  void *v10;
  CFTimeInterval v11;
  CFRunLoopSourceContext v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x18D778BE4]();
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v3);
  objc_msgSend(MEMORY[0x1E0CB3978], "setThreadPriority:", 0.0);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFRunLoopGetCurrent();
  memset(&v12, 0, sizeof(v12));
  v8 = CFRunLoopSourceCreate(0, 0, &v12);
  v9 = (const __CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopAddSource(Current, v8, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRelease(v8);
  if (v5 == (void *)qword_1ECE2DA90)
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "set_mapkit_networkIORunLoop:", v10);
    pthread_mutex_lock(&stru_1ECE2DB08);
    pthread_cond_signal(&stru_1ECE2DAD8);
    pthread_mutex_unlock(&stru_1ECE2DB08);

  }
  do
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  while (CFRunLoopRunInMode(v9, v11, 0) != kCFRunLoopRunStopped);

  objc_autoreleasePoolPop(v4);
}

@end
