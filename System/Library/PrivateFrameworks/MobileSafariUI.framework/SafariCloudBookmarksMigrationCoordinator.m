@implementation SafariCloudBookmarksMigrationCoordinator

- (SafariCloudBookmarksMigrationCoordinator)initWithSyncAgent:(id)a3
{
  SafariCloudBookmarksMigrationCoordinator *v3;
  SafariCloudBookmarksMigrationCoordinator *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SafariCloudBookmarksMigrationCoordinator *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SafariCloudBookmarksMigrationCoordinator;
  v3 = -[WBSCloudBookmarksMigrationCoordinator initWithSyncAgent:localDataProvider:](&v11, sel_initWithSyncAgent_localDataProvider_, a3, self);
  v4 = v3;
  if (v3)
  {
    -[WBSCloudBookmarksMigrationCoordinator setMigrationEnabled:](v3, "setMigrationEnabled:", -[SafariCloudBookmarksMigrationCoordinator _evaluateMigrationEnabled](v3, "_evaluateMigrationEnabled"));
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v4, *MEMORY[0x1E0D8AF98], 0, kvoContext_1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0DCCBF8];
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel__detectedLocalMigrationStateTransition_, v7, v8);

    v9 = v4;
  }

  return v4;
}

void __108__SafariCloudBookmarksMigrationCoordinator_getLocalMigrationStateForMigrationCoordinator_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "_cloudKitLocalMigrationState");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)_evaluateMigrationEnabled
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;

  if (objc_msgSend(MEMORY[0x1E0D89BE8], "hasInternalContent"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerForKey:", *MEMORY[0x1E0D8AF98]);

    if (v3 == -1)
      return 0;
  }
  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCloudKitBookmarksAvailable");

  return v5;
}

+ (id)migrationCoordinator
{
  if (migrationCoordinator_onceToken != -1)
    dispatch_once(&migrationCoordinator_onceToken, &__block_literal_global_42);
  return (id)migrationCoordinator_coordinator;
}

void __64__SafariCloudBookmarksMigrationCoordinator_migrationCoordinator__block_invoke()
{
  void *v0;
  SafariCloudBookmarksMigrationCoordinator *v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[SafariCloudBookmarksMigrationCoordinator initWithSyncAgent:]([SafariCloudBookmarksMigrationCoordinator alloc], "initWithSyncAgent:", v0);
  v2 = (void *)migrationCoordinator_coordinator;
  migrationCoordinator_coordinator = (uint64_t)v1;

  SafariCloudBookmarksMigrationCoordinatorLogsDirectoryURL();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __64__SafariCloudBookmarksMigrationCoordinator_migrationCoordinator__block_invoke_cold_1(v7, v6);
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89BF0]), "initWithDirectoryURL:logName:maximumLogAge:", v3, CFSTR("migrationEligibility"), 60);
  objc_msgSend((id)migrationCoordinator_coordinator, "setKeyActionsLogger:", v8);

}

- (void)getLocalMigrationStateForMigrationCoordinator:(id)a3 completionHandler:(id)a4
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__SafariCloudBookmarksMigrationCoordinator_getLocalMigrationStateForMigrationCoordinator_completionHandler___block_invoke;
  block[3] = &unk_1E9CF1950;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DCCBF8], 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0D8AF98], kvoContext_1);

  v5.receiver = self;
  v5.super_class = (Class)SafariCloudBookmarksMigrationCoordinator;
  -[SafariCloudBookmarksMigrationCoordinator dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if ((void *)kvoContext_1 == a6)
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D8AF98], a4, a5))
      -[WBSCloudBookmarksMigrationCoordinator setMigrationEnabled:](self, "setMigrationEnabled:", -[SafariCloudBookmarksMigrationCoordinator _evaluateMigrationEnabled](self, "_evaluateMigrationEnabled"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SafariCloudBookmarksMigrationCoordinator;
    -[SafariCloudBookmarksMigrationCoordinator observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_detectedLocalMigrationStateTransition:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  id v12;

  objc_msgSend(a3, "userInfo");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E0DCCC18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E0DCCC50]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = objc_msgSend(v4, "integerValue");
    v9 = objc_msgSend(v6, "integerValue");
    if ((unint64_t)(v8 - 4) >= 0xFFFFFFFFFFFFFFFDLL && v9 == 0)
    {
      -[WBSCloudBookmarksMigrationCoordinator startCoordinatingMigration](self, "startCoordinatingMigration");
      objc_msgSend(MEMORY[0x1E0DCCBA0], "safariBookmarkCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_postBookmarksChangedSyncNotification");

    }
  }

}

void __64__SafariCloudBookmarksMigrationCoordinator_migrationCoordinator__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_ERROR, "Could not create migration coordinator logs directory: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
