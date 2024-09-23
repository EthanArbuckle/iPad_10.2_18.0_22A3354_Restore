@implementation PFUbiquityLogging

+ (void)initialize
{
  objc_opt_self();
  if ((id)objc_opt_class() == a1)
    _singleton = objc_alloc_init(PFUbiquityLogging);
}

- (PFUbiquityLogging)init
{
  PFUbiquityLogging *v2;
  PFUbiquityLogging *v3;
  NSObject *global_queue;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFUbiquityLogging;
  v2 = -[PFUbiquityLogging init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_desiredLogLevel = 0;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__PFUbiquityLogging_init__block_invoke;
    block[3] = &unk_1E1EDD520;
    block[4] = v3;
    dispatch_async(global_queue, block);
  }
  return v3;
}

void __25__PFUbiquityLogging_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x18D76B4E4]();
  v3 = objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_userDefaultsChanged_, *MEMORY[0x1E0CB3420], v3);
  v5 = +[_PFRoutines valueForProcessArgument:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.coredata.ubiquity.logLevel"));
  if (v5)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v5, "intValue");
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      *(_DWORD *)(v6 + 8) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("com.apple.coredata.ubiquity.logLevel"));
  }
  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PFUbiquityLogging;
  -[PFUbiquityLogging dealloc](&v2, sel_dealloc);
}

- (void)userDefaultsChanged:(id)a3
{
  NSObject *global_queue;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PFUbiquityLogging_userDefaultsChanged___block_invoke;
  block[3] = &unk_1E1EDD520;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __41__PFUbiquityLogging_userDefaultsChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    *(_DWORD *)(v3 + 8) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "integerForKey:", CFSTR("com.apple.coredata.ubiquity.logLevel"));
  return objc_msgSend(v2, "drain");
}

+ (void)setLoggingLevel:(int)a3
{
  objc_msgSend((id)_singleton, "setDesiredLogLevel:", *(_QWORD *)&a3);
}

+ (BOOL)canLogMessageAtLevel:(int)a3
{
  return objc_msgSend((id)_singleton, "desiredLogLevel") >= a3;
}

- (int)desiredLogLevel
{
  return self->_desiredLogLevel;
}

- (void)setDesiredLogLevel:(int)a3
{
  self->_desiredLogLevel = a3;
}

@end
