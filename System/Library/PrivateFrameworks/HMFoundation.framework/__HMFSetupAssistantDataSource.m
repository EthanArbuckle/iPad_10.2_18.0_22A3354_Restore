@implementation __HMFSetupAssistantDataSource

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (__HMFSetupAssistantDataSource)init
{
  __HMFSetupAssistantDataSource *v2;
  __HMFSetupAssistantDataSource *v3;
  __HMFSetupAssistantDataSource *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *BYSetupAssistantFinishedDarwinNotification;
  objc_super v8[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0].receiver = self;
  v8[0].super_class = (Class)__HMFSetupAssistantDataSource;
  v2 = -[objc_super init](v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
    if (!_MergedGlobals_74)
    {
      v8[1] = (objc_super)xmmword_1E3B39508;
      v9 = 0;
      _MergedGlobals_74 = _sl_dlopen();
    }
    if (_MergedGlobals_74)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      BYSetupAssistantFinishedDarwinNotification = (const __CFString *)getBYSetupAssistantFinishedDarwinNotification();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)__migrationFinishedCallback, BYSetupAssistantFinishedDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }

  }
  return v3;
}

- (void)dealloc
{
  __HMFSetupAssistantDataSource *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *BYSetupAssistantFinishedDarwinNotification;
  objc_super v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = self;
  if (!_MergedGlobals_74)
  {
    v5[1] = (objc_super)xmmword_1E3B39508;
    v6 = 0;
    _MergedGlobals_74 = _sl_dlopen();
  }
  if (_MergedGlobals_74)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    BYSetupAssistantFinishedDarwinNotification = (const __CFString *)getBYSetupAssistantFinishedDarwinNotification();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v2, BYSetupAssistantFinishedDarwinNotification, 0);
  }

  v5[0].receiver = v2;
  v5[0].super_class = (Class)__HMFSetupAssistantDataSource;
  -[objc_super dealloc](v5, sel_dealloc);
}

- (BOOL)isMigrating
{
  void *v2;
  void *v3;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!_MergedGlobals_74)
  {
    v5 = xmmword_1E3B39508;
    v6 = 0;
    _MergedGlobals_74 = _sl_dlopen();
  }
  if (!_MergedGlobals_74)
    return 0;
  *(_QWORD *)&v5 = 0;
  *((_QWORD *)&v5 + 1) = &v5;
  v6 = 0x2020000000;
  v2 = off_1ED013240;
  v7 = off_1ED013240;
  if (!off_1ED013240)
  {
    v3 = (void *)SetupAssistantLibrary();
    v2 = dlsym(v3, "BYSetupAssistantNeedsToRun");
    *(_QWORD *)(*((_QWORD *)&v5 + 1) + 24) = v2;
    off_1ED013240 = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  return ((uint64_t (*)(void))v2)();
}

- (HMFSystemInfoMigrationDataSourceDelegate)delegate
{
  return (HMFSystemInfoMigrationDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
