@implementation GCGameIntentManager

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__GCGameIntentManager_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_dispatcher_0 != -1)
    dispatch_once(&instance_dispatcher_0, block);
  return (id)instance_sharedInstance_0;
}

void __31__GCGameIntentManager_instance__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  if (currentProcessIsGameControllerDaemon())
    v2 = objc_alloc_init(*(Class *)(a1 + 32));
  else
    v2 = 0;
  v3 = (void *)instance_sharedInstance_0;
  instance_sharedInstance_0 = (uint64_t)v2;

}

- (GCGameIntentManager)init
{
  GCGameIntentManager *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  void *v5;
  SBSHomeScreenService *v6;
  SBSHomeScreenService *service;
  NSObject *v9;
  _BOOL4 enabled;
  objc_super v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)GCGameIntentManager;
  v2 = -[GCGameIntentManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)&off_254DEF040), "initWithSuiteName:", CFSTR("com.apple.GameController"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_defaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("GCGameIntentEnable"), 5, 0);
    v2->_enabled = 1;
    -[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("GCGameIntentEnable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v2->_enabled = -[NSUserDefaults BOOLForKey:](v2->_defaults, "BOOLForKey:", CFSTR("GCGameIntentEnable"));
    v6 = (SBSHomeScreenService *)objc_alloc_init((Class)&off_254DFAEF8);
    service = v2->_service;
    v2->_service = v6;

    if (gc_isInternalBuild())
    {
      getGCLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        enabled = v2->_enabled;
        *(_DWORD *)buf = 67109120;
        v13 = enabled;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "GCGameIntentManager enabled = %d", buf, 8u);
      }

    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSUserDefaults removeObserver:forKeyPath:](self->_defaults, "removeObserver:forKeyPath:", self, CFSTR("GCGameIntentEnable"));
  v3.receiver = self;
  v3.super_class = (Class)GCGameIntentManager;
  -[GCGameIntentManager dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  NSUserDefaults *v11;
  id v12;
  NSObject *v13;
  _BOOL4 enabled;
  objc_super v15;
  uint8_t buf[4];
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (NSUserDefaults *)a4;
  v12 = a5;
  if (self->_defaults == v11 && objc_msgSend(v10, "isEqualToString:", CFSTR("GCGameIntentEnable")))
  {
    self->_enabled = -[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("GCGameIntentEnable"));
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        enabled = self->_enabled;
        *(_DWORD *)buf = 67109120;
        v17 = enabled;
        _os_log_impl(&dword_215181000, v13, OS_LOG_TYPE_INFO, "GCGameIntentManager enabled = %d", buf, 8u);
      }

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)GCGameIntentManager;
    -[GCGameIntentManager observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)stepToNextCategory
{
  unint64_t currentCategory;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  currentCategory = self->_currentCategory;
  v4 = 1000;
  v5 = 2;
  if (currentCategory != 1000)
    v5 = 0;
  if (currentCategory != 6014)
    v4 = v5;
  if (currentCategory == 2)
    v4 = 0;
  self->_currentCategory = v4;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_currentCategory;
      v8 = 134218240;
      v9 = currentCategory;
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_DEFAULT, "Stepping to next category: %lu -> %lu", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (id)stringForCategory:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("Games");
  v4 = CFSTR("N/A");
  if (a3 == 1000)
    v4 = CFSTR("Games (alt)");
  if (a3 != 6014)
    v3 = v4;
  if (a3 == 2)
    return CFSTR("Arcade");
  else
    return (id)v3;
}

- (void)tryPresentAppLibraryPod
{
  SBSHomeScreenService *service;
  void *v4;
  _QWORD v5[5];

  service = self->_service;
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("%lu"), self->_currentCategory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke;
  v5[3] = &unk_24D2B4308;
  v5[4] = self;
  -[SBSHomeScreenService presentAppLibraryCategoryPodForCategoryIdentifier:completion:](service, "presentAppLibraryCategoryPodForCategoryIdentifier:completion:", v4, v5);

}

void __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int isInternalBuild;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v3;
        _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_DEFAULT, "Error trying to present library pod: %@", (uint8_t *)&v19, 0xCu);
      }

    }
    v4 = objc_msgSend(v3, "code");
    v5 = *(_QWORD *)(a1 + 32);
    if (v4 == 9)
    {
      objc_msgSend(*(id *)(v5 + 32), "dismissAppLibraryWithCompletion:", &__block_literal_global_14);
      goto LABEL_17;
    }
    if (*(_QWORD *)(v5 + 24))
    {
      if (objc_msgSend(v3, "code") == 4)
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "stringForCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138412290;
            v20 = v16;
            _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_DEFAULT, "%@ lookup failed - stepping to next category and trying again!", (uint8_t *)&v19, 0xCu);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "stepToNextCategory");
LABEL_16:
        objc_msgSend(*(id *)(a1 + 32), "tryPresentAppLibraryPod");
        goto LABEL_17;
      }
      if (objc_msgSend(v3, "code") == 2)
      {
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "stringForCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = 138412290;
            v20 = v18;
            _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_DEFAULT, "%@ not on the home screen! Dismissing frontmost application and trying again...", (uint8_t *)&v19, 0xCu);

          }
        }
        SBSSuspendFrontmostApplication();
        goto LABEL_16;
      }
      v7 = objc_msgSend(v3, "code");
      isInternalBuild = gc_isInternalBuild();
      if (v7 == 9)
      {
        if (!isInternalBuild)
          goto LABEL_17;
        getGCLogger();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "stringForCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412290;
          v20 = v10;
          v11 = "%@ library is already presented!";
          v12 = v9;
          v13 = 12;
LABEL_25:
          _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, v13);

        }
      }
      else
      {
        if (!isInternalBuild)
          goto LABEL_17;
        getGCLogger();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "stringForCategory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412546;
          v20 = v10;
          v21 = 2112;
          v22 = v3;
          v11 = "Presented %@ library! %@";
          v12 = v9;
          v13 = 22;
          goto LABEL_25;
        }
      }

      goto LABEL_17;
    }
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_DEFAULT, "Current category == ATXAppDirectoryCategoryIDSpecialMin. Unable to open library pod.", (uint8_t *)&v19, 2u);
      }

    }
  }
LABEL_17:

}

void __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke_76(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2 && gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke_76_cold_1((uint64_t)v2, v3);

  }
}

- (void)toggleGamesFolder
{
  -[GCGameIntentManager toggleGamesFolderAndDismissOnly:](self, "toggleGamesFolderAndDismissOnly:", 0);
}

- (void)toggleGamesFolderAndDismissOnly:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  SBSHomeScreenService *service;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[16];

  if (self->_enabled)
  {
    +[UIDevice currentDevice](&off_254DFB288, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 1)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215181000, v8, OS_LOG_TYPE_DEFAULT, "Toggling games library...", buf, 2u);
        }

      }
      service = self->_service;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __55__GCGameIntentManager_toggleGamesFolderAndDismissOnly___block_invoke;
      v9[3] = &unk_24D2B45C8;
      v10 = a3;
      v9[4] = self;
      -[SBSHomeScreenService dismissAppLibraryWithCompletion:](service, "dismissAppLibraryWithCompletion:", v9);
    }
  }
}

void __55__GCGameIntentManager_toggleGamesFolderAndDismissOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138412290;
        v6 = v3;
        _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "Unable to dismiss app library: %@", (uint8_t *)&v5, 0xCu);
      }

    }
    if (objc_msgSend(v3, "code") == 7 && !*(_BYTE *)(a1 + 40))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 6014;
      objc_msgSend(*(id *)(a1 + 32), "tryPresentAppLibraryPod");
    }
  }

}

- (void)launchToSpringboard
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (self->_enabled)
  {
    +[UIDevice currentDevice](&off_254DFB288, "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    if (v3 == 1)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl(&dword_215181000, v4, OS_LOG_TYPE_DEFAULT, "Suspending the frontmost application...", v5, 2u);
        }

      }
      SBSSuspendFrontmostApplication();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

void __46__GCGameIntentManager_tryPresentAppLibraryPod__block_invoke_76_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215181000, a2, OS_LOG_TYPE_ERROR, "Unable to dismiss app library: %@", (uint8_t *)&v2, 0xCu);
}

@end
