@implementation FBApplicationProcess

- (BOOL)isApplicationProcess
{
  return 1;
}

- (void)_bootstrapDidComplete
{
  void *v3;
  FBProcessCPUStatistics *v4;
  FBProcessCPUStatistics *cpuStatistics;
  objc_super v6;

  -[FBProcess rbsHandle](self, "rbsHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[FBProcessCPUStatistics initWithProcessHandle:]([FBProcessCPUStatistics alloc], "initWithProcessHandle:", v3);
    cpuStatistics = self->_cpuStatistics;
    self->_cpuStatistics = v4;

  }
  v6.receiver = self;
  v6.super_class = (Class)FBApplicationProcess;
  -[FBProcess _bootstrapDidComplete](&v6, sel__bootstrapDidComplete);

}

- (id)_createBootstrapContext
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  uint64_t v18;
  objc_super v19;
  objc_super v20;

  if (-[FBProcess isCurrentProcess](self, "isCurrentProcess"))
  {
    v20.receiver = self;
    v20.super_class = (Class)FBApplicationProcess;
    -[FBProcess _createBootstrapContext](&v20, sel__createBootstrapContext);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)FBApplicationProcess;
    -[FBProcess _createBootstrapContext](&v19, sel__createBootstrapContext);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBProcess executionContext](self, "executionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->super._rbsHandle)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D22FD8], "environmentAliases");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "environmentRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v8);

      objc_msgSend(v5, "environment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v9);

      +[FBApplicationProcess _internalDebugEnvironmentVariables](FBApplicationProcess, "_internalDebugEnvironmentVariables");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addEntriesFromDictionary:", v10);

      objc_msgSend(v5, "arguments");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "standardOutputURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "standardErrorURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v5, "waitForDebugger");
      v17 = objc_msgSend(v5, "disableASLR");
      objc_msgSend(v4, "setArguments:", v11);
      if (objc_msgSend(v6, "count"))
        objc_msgSend(v4, "_setAdditionalEnvironment:", v6);
      objc_msgSend(v4, "setStandardOutputPath:", v13);
      objc_msgSend(v4, "setStandardErrorPath:", v15);
      if (v17)
        v18 = v16 | 2;
      else
        v18 = v16;
      objc_msgSend(v4, "setExecutionOptions:", v18);

    }
    return v4;
  }
}

+ (id)_internalDebugEnvironmentVariables
{
  id v2;
  int v3;
  CFPropertyListRef v4;
  CFTypeID v5;
  CFPropertyListRef v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBMallocStackLogging"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBMallocStackLoggingAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("1"), CFSTR("MallocStackLogging"));
    CFPreferencesSetAppValue(CFSTR("FBMallocStackLogging"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBMallocScribble"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBMallocScribbleAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("1"), CFSTR("MallocScribble"));
    CFPreferencesSetAppValue(CFSTR("FBMallocScribble"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBMallocGuardEdges"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBMallocGuardEdgesAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("1"), CFSTR("MallocGuardEdges"));
    CFPreferencesSetAppValue(CFSTR("FBMallocGuardEdges"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBMallocCheckHeap"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBMallocCheckHeapAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("1"), CFSTR("MallocCheckHeapStart"));
    objc_msgSend(v2, "setObject:forKey:", CFSTR("1"), CFSTR("MallocCheckHeapAbort"));
    objc_msgSend(v2, "setObject:forKey:", CFSTR("1"), CFSTR("MallocErrorAbort"));
    objc_msgSend(v2, "setObject:forKey:", CFSTR("1"), CFSTR("MallocScribble"));
    CFPreferencesSetAppValue(CFSTR("FBMallocCheckHeap"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBGuardMalloc"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBGuardMallocAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("/usr/lib/libgmalloc.dylib"), CFSTR("DYLD_INSERT_LIBRARIES"));
    CFPreferencesSetAppValue(CFSTR("FBGuardMalloc"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBZombieEnabled"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBZombieEnabledAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("YES"), CFSTR("NSZombieEnabled"));
    CFPreferencesSetAppValue(CFSTR("FBZombieEnabled"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBDeallocateZombies"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBDeallocateZombiesAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("YES"), CFSTR("NSDeallocateZombies"));
    CFPreferencesSetAppValue(CFSTR("FBDeallocateZombies"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBSQLiteAutoTrace"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBSQLiteAutoTraceAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("1"), CFSTR("SQLITE_AUTO_TRACE"));
    CFPreferencesSetAppValue(CFSTR("FBSQLiteAutoTrace"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  if (CFPreferencesGetAppBooleanValue(CFSTR("FBDYLDRegionPrivate"), CFSTR("com.apple.frontboard"), 0)
    || CFPreferencesGetAppBooleanValue(CFSTR("FBDYLDRegionPrivateAlways"), CFSTR("com.apple.frontboard"), 0))
  {
    objc_msgSend(v2, "setObject:forKey:", CFSTR("private"), CFSTR("DYLD_SHARED_REGION"));
    CFPreferencesSetAppValue(CFSTR("FBDYLDRegionPrivate"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
  }
  v7 = CFPreferencesCopyAppValue(CFSTR("FBDYLDAlternateSharedCacheDir"), CFSTR("com.apple.frontboard"));
  if (v7)
  {
    CFPreferencesSetAppValue(CFSTR("FBDYLDAlternateSharedCacheDir"), 0, CFSTR("com.apple.frontboard"));
    v3 = 1;
    v4 = v7;
  }
  else
  {
    v4 = CFPreferencesCopyAppValue(CFSTR("FBDYLDAlternateSharedCacheDirAlways"), CFSTR("com.apple.frontboard"));
    v7 = v4;
    if (!v4)
      goto LABEL_33;
  }
  v5 = CFGetTypeID(v4);
  if (v5 == CFStringGetTypeID())
  {
    objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("DYLD_SHARED_CACHE_DIR"));
    objc_msgSend(v2, "setObject:forKey:", CFSTR("private"), CFSTR("DYLD_SHARED_REGION"));
  }
LABEL_33:
  if (v3)
    CFPreferencesSynchronize(CFSTR("com.apple.frontboard"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  fbs_release();
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuStatistics, 0);
}

- (void)_finishInit
{
  int pid;
  FBProcessExecutionContext *executionContext;
  FBMutableProcessExecutionContext *v5;
  FBMutableProcessExecutionContext *v6;
  FBProcessExecutionContext *v7;
  FBProcessExecutionContext *v8;
  objc_super v9;

  if (!-[FBProcessExecutionContext launchIntent](self->super._executionContext, "launchIntent"))
  {
    pid = self->super._pid;
    if (pid != getpid())
    {
      executionContext = self->super._executionContext;
      if (executionContext)
        v5 = (FBMutableProcessExecutionContext *)-[FBProcessExecutionContext mutableCopy](executionContext, "mutableCopy");
      else
        v5 = objc_alloc_init(FBMutableProcessExecutionContext);
      v6 = v5;
      -[FBProcessExecutionContext setLaunchIntent:](v5, "setLaunchIntent:", 2);
      v7 = (FBProcessExecutionContext *)-[FBMutableProcessExecutionContext copy](v6, "copy");
      v8 = self->super._executionContext;
      self->super._executionContext = v7;

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)FBApplicationProcess;
  -[FBProcess _finishInit](&v9, sel__finishInit);
}

- (void)setRecordingAudio:(BOOL)a3
{
  self->_recordingAudio = a3;
}

- (void)killForReason:(int64_t)a3 andReport:(BOOL)a4 withDescription:(id)a5
{
  -[FBApplicationProcess killForReason:andReport:withDescription:completion:](self, "killForReason:andReport:withDescription:completion:", a3, a4, a5, 0);
}

- (double)elapsedCPUTime
{
  double result;

  -[FBProcessCPUStatistics totalElapsedTime](self->_cpuStatistics, "totalElapsedTime");
  return result;
}

- (BOOL)isRecordingAudio
{
  return self->_recordingAudio;
}

- (BOOL)isNowPlayingWithAudio
{
  return self->_nowPlayingWithAudio;
}

- (void)setNowPlayingWithAudio:(BOOL)a3
{
  self->_nowPlayingWithAudio = a3;
}

- (BOOL)isConnectedToExternalAccessory
{
  return self->_connectedToExternalAccessory;
}

- (void)setConnectedToExternalAccessory:(BOOL)a3
{
  self->_connectedToExternalAccessory = a3;
}

@end
