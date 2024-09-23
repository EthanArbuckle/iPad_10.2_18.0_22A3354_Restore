@implementation AXLoggingSubsystem

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AXLoggingSubsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_System;
}

void __36__AXLoggingSubsystem_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_System;
  sharedInstance_System = (uint64_t)v0;

}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_7);
}

void __32__AXLoggingSubsystem_initialize__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)SubsystemLock;
  SubsystemLock = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)Subsystems;
  Subsystems = (uint64_t)v2;

}

+ (void)initializeSubsytem
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AXLoggingSubsystem_initializeSubsytem__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeSubsytem_onceToken != -1)
    dispatch_once(&initializeSubsytem_onceToken, block);
}

void __40__AXLoggingSubsystem_initializeSubsytem__block_invoke()
{
  uint64_t v0;
  int ClassList;
  Class *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *Superclass;

  v0 = objc_opt_class();
  ClassList = objc_getClassList(0, 0);
  v2 = (Class *)malloc_type_malloc(8 * ClassList, 0x80040B8603338uLL);
  v3 = objc_getClassList(v2, ClassList);
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = v3;
    do
    {
      Superclass = v2[v4];
      do
        Superclass = class_getSuperclass(Superclass);
      while (Superclass && Superclass != (objc_class *)v0);
      if (Superclass)
        objc_msgSend((id)Subsystems, "addObject:", v2[v4]);
      ++v4;
    }
    while (v4 != v5);
  }
  free(v2);
}

+ (id)subsystems
{
  objc_msgSend(a1, "initializeSubsytem");
  return (id)objc_msgSend((id)Subsystems, "copy");
}

+ (id)_errorWithMessage:(id)a3 underlyingError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB2D68]);
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB3388]);
  v10 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(a1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)errorWithDescription:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3940];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v9);

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "_errorWithMessage:underlyingError:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)wrapError:(id)a3 description:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  uint64_t v11;

  v6 = a3;
  if (a4)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB3940];
    v8 = a4;
    a4 = (id)objc_msgSend([v7 alloc], "initWithFormat:arguments:", v8, &v11);

  }
  objc_msgSend(a1, "_errorWithMessage:underlyingError:", a4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)identifier
{
  return CFSTR("AXGeneric");
}

+ (BOOL)shouldIncludeBacktraceInLogs
{
  return 0;
}

+ (BOOL)shouldIncludeFileLineAndFunctionInLogs
{
  return 1;
}

+ (BOOL)shouldProcessMessageForLogs
{
  return 1;
}

+ (double)threshold
{
  return 0.0;
}

+ (int)defaultLogLevel
{
  return 1;
}

+ (BOOL)willLog
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  _AXAssert(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AccessibilityLibraries/Source/AXCoreUtilities/source/Logging/AXLoggingSubsystem.m", (void *)0xA3, (uint64_t)"+[AXLoggingSubsystem willLog]", CFSTR("Should not be relying on this anymore. Logging is always enabled."), v2, v3, v4, vars0);
  return 1;
}

+ (BOOL)willLogInfo
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AXWillLogInfoWithFacility(v2);

  return v3;
}

+ (BOOL)willLogDebug
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AXWillLogDebugWithFacility(v2);

  return v3;
}

- (void)setIgnoreLogging:(BOOL)a3
{
  self->_ignoreLogging = a3;
}

- (BOOL)ignoreLogging
{
  return self->_ignoreLogging;
}

@end
