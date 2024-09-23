@implementation MTSnapshotScheduler

- (MTSnapshotScheduler)initWithBundleID:(id)a3
{
  id v5;
  MTSnapshotScheduler *v6;
  MTSnapshotScheduler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTSnapshotScheduler;
  v6 = -[MTSnapshotScheduler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleID, a3);

  return v7;
}

+ (double)_quiescingWindow
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MTSnapshotScheduler__quiescingWindow__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_quiescingWindow_onceToken != -1)
    dispatch_once(&_quiescingWindow_onceToken, block);
  return *(double *)&_quiescingWindow_quiescingWindow;
}

void __39__MTSnapshotScheduler__quiescingWindow__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[MTUserDefaults sharedUserDefaults](MTUserDefaults, "sharedUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MTTimeIntervalIsPositive();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalForKey:isValid:defaultValue:", CFSTR("SnapshotWindow"), v1, 5.0);
  _quiescingWindow_quiescingWindow = v2;

  MTLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = (id)objc_opt_class();
    v7 = 2050;
    v8 = _quiescingWindow_quiescingWindow;
    v4 = v6;
    _os_log_impl(&dword_19AC4E000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Using snapshot quiescing window of %{public}f", (uint8_t *)&v5, 0x16u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
