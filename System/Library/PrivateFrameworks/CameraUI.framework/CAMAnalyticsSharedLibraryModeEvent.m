@implementation CAMAnalyticsSharedLibraryModeEvent

- (CAMAnalyticsSharedLibraryModeEvent)initWithLibrarySelectionController:(id)a3
{
  id v5;
  CAMAnalyticsSharedLibraryModeEvent *v6;
  CAMAnalyticsSharedLibraryModeEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMAnalyticsSharedLibraryModeEvent;
  v6 = -[CAMAnalyticsEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_librarySelectionController, a3);

  return v7;
}

- (id)eventName
{
  return CFSTR("session.libraryswitch");
}

- (void)publish
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CAMAnalyticsEvent _eventMap](self, "_eventMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CAMSharedLibraryModeDescription(-[CAMLibrarySelectionController sharedLibraryMode](self->_librarySelectionController, "sharedLibraryMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("currentMode"));

  CAMSharedLibraryModeDescription(-[CAMLibrarySelectionController sharedLibraryInitialMode](self->_librarySelectionController, "sharedLibraryInitialMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("initialMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CAMLibrarySelectionController userInteractionsCount](self->_librarySelectionController, "userInteractionsCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("userInteractionCount"));

  v9.receiver = self;
  v9.super_class = (Class)CAMAnalyticsSharedLibraryModeEvent;
  -[CAMAnalyticsEvent publish](&v9, sel_publish);
  v7 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CAMAnalyticsSharedLibraryModeEvent eventName](self, "eventName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v3;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "CoreAnalytics: %{public}@: %{public}@", buf, 0x16u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_librarySelectionController, 0);
}

@end
