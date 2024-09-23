@implementation ATXPrivacyReset

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_32 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_32, &__block_literal_global_182);
  return (id)sharedInstance__pasExprOnceResult_42;
}

void __33__ATXPrivacyReset_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_42;
  sharedInstance__pasExprOnceResult_42 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXPrivacyReset)init
{
  ATXPrivacyReset *v2;
  ATXPrivacyReset *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXPrivacyReset;
  v2 = -[ATXPrivacyReset init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[ATXPrivacyReset _placeholderExists](v2, "_placeholderExists"))
      -[ATXPrivacyReset _removeAllAppActionData](v3, "_removeAllAppActionData");
    -[ATXPrivacyReset _registerForResetPrivacyWarningsNotification](v3, "_registerForResetPrivacyWarningsNotification");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_resetPrivacyWarningsNotificationToken);

  v4.receiver = self;
  v4.super_class = (Class)ATXPrivacyReset;
  -[ATXPrivacyReset dealloc](&v4, sel_dealloc);
}

- (id)_placeholderPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ATXPrivacyResetTriggered"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_placeholderExists
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPrivacyReset _placeholderPath](self, "_placeholderPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (void)_registerForResetPrivacyWarningsNotification
{
  void *v3;
  void *v4;
  id resetPrivacyWarningsNotificationToken;
  _QWORD v6[5];

  if (!self->_resetPrivacyWarningsNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__ATXPrivacyReset__registerForResetPrivacyWarningsNotification__block_invoke;
    v6[3] = &unk_1E82DE9D0;
    v6[4] = self;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.Preferences.ResetPrivacyWarningsNotification"), 0, 0, v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    resetPrivacyWarningsNotificationToken = self->_resetPrivacyWarningsNotificationToken;
    self->_resetPrivacyWarningsNotificationToken = v4;

  }
}

void __63__ATXPrivacyReset__registerForResetPrivacyWarningsNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_handlePrivacyResetNotification");
  exit(0);
}

- (void)_handlePrivacyResetNotification
{
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler:", &__block_literal_global_16_0);
  -[ATXPrivacyReset _writeDeletionPlaceholder](self, "_writeDeletionPlaceholder");
  -[ATXPrivacyReset _removeAllBlendingUICaches](self, "_removeAllBlendingUICaches");

}

void __50__ATXPrivacyReset__handlePrivacyResetNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __50__ATXPrivacyReset__handlePrivacyResetNotification__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)_writeDeletionPlaceholder
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXPrivacyReset _placeholderPath](self, "_placeholderPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createFileAtPath:contents:attributes:", v3, 0, 0);

}

- (void)_removeAllBlendingUICaches
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXPrivacyReset: Error removing blending UI caches. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeAllAppActionData
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXPrivacyReset: Error removing all app/action data. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetPrivacyWarningsNotificationToken, 0);
}

void __50__ATXPrivacyReset__handlePrivacyResetNotification__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "An error occurred while telling home screen clients to relinquish resources: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
