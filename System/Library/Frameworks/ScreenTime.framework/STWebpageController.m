@implementation STWebpageController

- (STWebpageController)init
{
  STWebpageController *v2;
  uint64_t v3;
  NSString *bundleIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STWebpageController;
  v2 = -[STWebpageController init](&v6, sel_init);
  +[STWebService clientBundleIdentifier](STWebService, "clientBundleIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  bundleIdentifier = v2->_bundleIdentifier;
  v2->_bundleIdentifier = (NSString *)v3;

  v2->_currentUsageState = 0;
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[STWebpageController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STWebpageController;
  -[STWebpageController dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  STWebRemoteViewController *remoteViewController;

  -[STWebRemoteViewController removeObserver:forKeyPath:context:](self->_remoteViewController, "removeObserver:forKeyPath:context:", self, CFSTR("URLIsBlocked"), "KVOContextSTWebpageController");
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

}

- (void)loadView
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  SEL v8;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  -[STWebpageController setView:](self, "setView:", v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__STWebpageController_loadView__block_invoke;
  v6[3] = &unk_24D996DA0;
  v7 = v4;
  v8 = a2;
  v6[4] = self;
  v5 = v4;
  +[STWebRemoteViewController instantiateWebViewControllerWithConnectionHandler:](STWebRemoteViewController, "instantiateWebViewControllerWithConnectionHandler:", v6);

}

void __31__STWebpageController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v5 = a2;
  v15 = v5;
  if (!v5)
  {
    v12 = (void *)MEMORY[0x24BDD1448];
    v13 = a3;
    objc_msgSend(v12, "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("STWebpageController.m"), 140, CFSTR("Fatal error occured %@"), v13);

    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setRemoteViewController:", v5);
  objc_msgSend(v15, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("URLIsBlocked"), 3, "KVOContextSTWebpageController");
  objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v15);
  objc_msgSend(v15, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("blockingView"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v6);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[blockingView]|"), 0, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[blockingView]|"), 0, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v11);

  objc_msgSend(v15, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_startReportingWebUsage");

}

- (void)viewDidLoad
{
  void *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWebpageController;
  -[STWebpageController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willStartPictureInPicture_, *MEMORY[0x24BDB2768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didStopPictureInPicture_, *MEMORY[0x24BDB2750], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didChangePlaybackState_, *MEMORY[0x24BDB2758], 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_218A7F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STWebpageController.viewDidLoad", v4, 2u);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STWebpageController;
  -[STWebpageController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[STWebpageController setCurrentUsageState:](self, "setCurrentUsageState:", 2);
  -[STWebpageController setURLIsVisibleInForeground:](self, "setURLIsVisibleInForeground:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_218A7F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STWebpageController.viewDidAppear", v5, 2u);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = a3;
  if (!-[STWebpageController URLIsPlayingVideoPictureInPicture](self, "URLIsPlayingVideoPictureInPicture"))
    -[STWebpageController setCurrentUsageState:](self, "setCurrentUsageState:", 0);
  -[STWebpageController setURLIsVisibleInForeground:](self, "setURLIsVisibleInForeground:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF7510], 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF7528], 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218A7F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STWebpageController.viewDidDisappear", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)STWebpageController;
  -[STWebpageController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);

}

- (void)setSuppressUsageRecording:(BOOL)suppressUsageRecording
{
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v8[4];
  BOOL v9;

  if (self->_suppressUsageRecording != suppressUsageRecording)
  {
    self->_suppressUsageRecording = suppressUsageRecording;
    -[STWebpageController URL](self, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_lp_isHTTPFamilyURL"))
    {
      -[STWebpageController bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[STWebpageController currentUsageState](self, "currentUsageState");
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __49__STWebpageController_setSuppressUsageRecording___block_invoke;
      v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
      v9 = suppressUsageRecording;
      -[STWebpageController _setURL:bundleIdentifier:usageState:errorHandler:](self, "_setURL:bundleIdentifier:usageState:errorHandler:", v5, v6, v7, v8);

    }
  }
}

void __49__STWebpageController_setSuppressUsageRecording___block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __49__STWebpageController_setSuppressUsageRecording___block_invoke_cold_1(a1, a2);
}

- (void)setURL:(NSURL *)URL
{
  NSURL *v4;
  NSURL *v5;
  char v6;
  NSURL *v7;
  NSURL *v8;
  NSURL *v9;
  NSURL *v10;
  void *v11;
  NSURL *v12;

  v4 = URL;
  v5 = self->_URL;
  if (v5 != v4)
  {
    v12 = v4;
    v6 = -[NSURL isEqual:](v5, "isEqual:", v4);
    v4 = v12;
    if ((v6 & 1) == 0)
    {
      v7 = (NSURL *)-[NSURL copy](v12, "copy");
      v8 = self->_URL;
      self->_URL = v7;

      if (-[NSURL _lp_isHTTPFamilyURL](v12, "_lp_isHTTPFamilyURL"))
        v9 = v12;
      else
        v9 = 0;
      v10 = v9;
      -[STWebpageController bundleIdentifier](self, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STWebpageController _setURL:bundleIdentifier:usageState:errorHandler:](self, "_setURL:bundleIdentifier:usageState:errorHandler:", v10, v11, -[STWebpageController currentUsageState](self, "currentUsageState"), &__block_literal_global_0);

      v4 = v12;
    }
  }

}

void __30__STWebpageController_setURL___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __30__STWebpageController_setURL___block_invoke_cold_1();
}

- (void)setURLIsPlayingVideo:(BOOL)URLIsPlayingVideo
{
  int64_t v5;

  if (self->_URLIsPlayingVideo != URLIsPlayingVideo)
  {
    self->_URLIsPlayingVideo = URLIsPlayingVideo;
    if (-[STWebpageController URLIsPictureInPicture](self, "URLIsPictureInPicture"))
    {
      if (URLIsPlayingVideo)
        v5 = 2;
      else
        v5 = -[STWebpageController defaultUsageState](self, "defaultUsageState");
      -[STWebpageController setCurrentUsageState:](self, "setCurrentUsageState:", v5);
    }
  }
}

- (void)setURLIsPictureInPicture:(BOOL)URLIsPictureInPicture
{
  int64_t v5;

  if (self->_URLIsPictureInPicture != URLIsPictureInPicture)
  {
    self->_URLIsPictureInPicture = URLIsPictureInPicture;
    if (-[STWebpageController URLIsPlayingVideo](self, "URLIsPlayingVideo"))
    {
      if (URLIsPictureInPicture)
        v5 = 2;
      else
        v5 = -[STWebpageController defaultUsageState](self, "defaultUsageState");
      -[STWebpageController setCurrentUsageState:](self, "setCurrentUsageState:", v5);
    }
  }
}

- (BOOL)setBundleIdentifier:(NSString *)bundleIdentifier error:(NSError *)error
{
  NSString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = bundleIdentifier;
  +[STWebService clientBundleIdentifier](STWebService, "clientBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](v6, "isEqualToString:", v7)
    || (objc_msgSend(MEMORY[0x24BE15820], "supportedWebBrowserBundleIdentifiersForDeviceFamily:", 102),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "containsObject:", v7),
        v8,
        v9))
  {
    -[STWebpageController setBundleIdentifier:](self, "setBundleIdentifier:", v6);
    LOBYTE(error) = 1;
  }
  else if (error)
  {
    +[STScreenTimeBundle bundle](STScreenTimeBundle, "bundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UnsupportedWebBrowserError"), &stru_24D996F80, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BE84710];
    v16 = *MEMORY[0x24BDD0FC8];
    v17[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 100, v15);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

    LOBYTE(error) = 0;
  }

  return (char)error;
}

- (void)setBundleIdentifier:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *bundleIdentifier;
  void *v7;
  id v8;

  v8 = a3;
  -[STWebpageController bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v8) & 1) == 0)
  {
    v5 = (NSString *)objc_msgSend(v8, "copy");
    bundleIdentifier = self->_bundleIdentifier;
    self->_bundleIdentifier = v5;

    -[STWebpageController URL](self, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[STWebpageController suppressUsageRecording](self, "suppressUsageRecording")
      && objc_msgSend(v7, "_lp_isHTTPFamilyURL"))
    {
      -[STWebpageController _setURL:bundleIdentifier:usageState:errorHandler:](self, "_setURL:bundleIdentifier:usageState:errorHandler:", v7, v8, -[STWebpageController currentUsageState](self, "currentUsageState"), &__block_literal_global_45);
    }

  }
}

void __43__STWebpageController_setBundleIdentifier___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __43__STWebpageController_setBundleIdentifier___block_invoke_cold_1();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v10 = a5;
  if (a6 == "KVOContextSTWebpageController")
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("URLIsBlocked")))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v12)
      {

        v11 = 0;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
      {

        v13 = 0;
      }
      -[STWebpageController _URLIsBlockedDidChangeFrom:to:](self, "_URLIsBlockedDidChangeFrom:to:", v11, v13);

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STWebpageController;
    -[STWebpageController observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);
  }

}

- (void)_URLIsBlockedDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  int v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = objc_msgSend(v8, "BOOLValue");
  if (v7 != objc_msgSend(v6, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedSetURLIsBlocked_, v8);
    -[STWebpageController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedSetURLIsBlocked_, v6, (double)arc4random_uniform(0x3Cu) + 1.0);
  }

}

- (void)_delayedSetURLIsBlocked:(id)a3
{
  -[STWebpageController setURLIsBlocked:](self, "setURLIsBlocked:", objc_msgSend(a3, "BOOLValue"));
}

- (int64_t)currentUsageState
{
  if (-[STWebpageController suppressUsageRecording](self, "suppressUsageRecording"))
    return 0;
  else
    return self->_currentUsageState;
}

- (void)setCurrentUsageState:(int64_t)a3
{
  void *v5;
  int v6;
  _QWORD v7[5];

  if (self->_currentUsageState != a3)
  {
    self->_currentUsageState = a3;
    if (!-[STWebpageController suppressUsageRecording](self, "suppressUsageRecording"))
    {
      -[STWebpageController URL](self, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "_lp_isHTTPFamilyURL");

      if (v6)
      {
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = __44__STWebpageController_setCurrentUsageState___block_invoke;
        v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
        v7[4] = a3;
        -[STWebpageController _changeUsageState:errorHandler:](self, "_changeUsageState:errorHandler:", a3, v7);
      }
    }
  }
}

void __44__STWebpageController_setCurrentUsageState___block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __44__STWebpageController_setCurrentUsageState___block_invoke_cold_1(a1, a2);
}

- (int64_t)defaultUsageState
{
  if (-[STWebpageController URLIsVisibleInForeground](self, "URLIsVisibleInForeground"))
    return 2;
  else
    return 0;
}

- (void)_startReportingWebUsage
{
  void *v3;
  void *v4;
  id v5;

  -[STWebpageController URL](self, "URL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[STWebpageController suppressUsageRecording](self, "suppressUsageRecording")
    && objc_msgSend(v5, "_lp_isHTTPFamilyURL"))
  {
    -[STWebpageController serviceProxy](self, "serviceProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWebpageController bundleIdentifier](self, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setURL:bundleIdentifier:usageState:replyHandler:", v5, v4, -[STWebpageController currentUsageState](self, "currentUsageState"), &__block_literal_global_53);

  }
}

void __46__STWebpageController__startReportingWebUsage__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __46__STWebpageController__startReportingWebUsage__block_invoke_cold_1();

}

- (void)_setURL:(id)a3 bundleIdentifier:(id)a4 usageState:(int64_t)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[STWebpageController serviceProxy](self, "serviceProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__STWebpageController__setURL_bundleIdentifier_usageState_errorHandler___block_invoke;
  v15[3] = &unk_24D996E68;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "setURL:bundleIdentifier:usageState:replyHandler:", v12, v11, a5, v15);

}

uint64_t __72__STWebpageController__setURL_bundleIdentifier_usageState_errorHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_changeUsageState:(int64_t)a3 errorHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[STWebpageController serviceProxy](self, "serviceProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__STWebpageController__changeUsageState_errorHandler___block_invoke;
  v9[3] = &unk_24D996E68;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "changeUsageState:replyHandler:", a3, v9);

}

uint64_t __54__STWebpageController__changeUsageState_errorHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (STWebService)serviceProxy
{
  void *v2;
  void *v3;

  -[STWebpageController remoteViewController](self, "remoteViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceViewControllerProxyWithErrorHandler:", &__block_literal_global_54);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (STWebService *)v3;
}

void __35__STWebpageController_serviceProxy__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    __35__STWebpageController_serviceProxy__block_invoke_cold_1();
}

- (BOOL)URLIsPlayingVideoPictureInPicture
{
  _BOOL4 v3;

  v3 = -[STWebpageController URLIsPlayingVideo](self, "URLIsPlayingVideo");
  if (v3)
    LOBYTE(v3) = -[STWebpageController URLIsPictureInPicture](self, "URLIsPictureInPicture");
  return v3;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  -[STWebpageController setURLIsVisibleInForeground:](self, "setURLIsVisibleInForeground:", 1);
  -[STWebpageController setCurrentUsageState:](self, "setCurrentUsageState:", 2);
}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[STWebpageController setURLIsVisibleInForeground:](self, "setURLIsVisibleInForeground:", 0);
  if (!-[STWebpageController URLIsPlayingVideoPictureInPicture](self, "URLIsPlayingVideoPictureInPicture"))
    -[STWebpageController setCurrentUsageState:](self, "setCurrentUsageState:", 0);
}

- (void)_willStartPictureInPicture:(id)a3
{
  id v4;

  v4 = a3;
  -[STWebpageController setURLIsPictureInPicture:](self, "setURLIsPictureInPicture:", 1);
  -[STWebpageController _didChangePlaybackState:](self, "_didChangePlaybackState:", v4);

}

- (void)_didStopPictureInPicture:(id)a3
{
  -[STWebpageController setURLIsPlayingVideo:](self, "setURLIsPlayingVideo:", 0);
  -[STWebpageController setURLIsPictureInPicture:](self, "setURLIsPictureInPicture:", 0);
}

- (void)_didChangePlaybackState:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDB2760]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[STWebpageController setURLIsPlayingVideo:](self, "setURLIsPlayingVideo:", objc_msgSend(v5, "BOOLValue"));
}

- (BOOL)suppressUsageRecording
{
  return self->_suppressUsageRecording;
}

- (NSURL)URL
{
  return self->_URL;
}

- (BOOL)URLIsPlayingVideo
{
  return self->_URLIsPlayingVideo;
}

- (BOOL)URLIsPictureInPicture
{
  return self->_URLIsPictureInPicture;
}

- (BOOL)URLIsBlocked
{
  return self->_URLIsBlocked;
}

- (void)setURLIsBlocked:(BOOL)a3
{
  self->_URLIsBlocked = a3;
}

- (STWebRemoteViewController)remoteViewController
{
  return (STWebRemoteViewController *)objc_getProperty(self, a2, 992, 1);
}

- (void)setRemoteViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (BOOL)URLIsVisibleInForeground
{
  return self->_URLIsVisibleInForeground;
}

- (void)setURLIsVisibleInForeground:(BOOL)a3
{
  self->_URLIsVisibleInForeground = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

void __49__STWebpageController_setSuppressUsageRecording___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 32);
  v3[0] = 67240450;
  v3[1] = v2;
  v4 = 2114;
  v5 = a2;
  _os_log_fault_impl(&dword_218A7F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to set suppressUsageRecording: %{public}d with error: %{public}@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __30__STWebpageController_setURL___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to set URL: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __43__STWebpageController_setBundleIdentifier___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to set bundleIdentifier: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __44__STWebpageController_setCurrentUsageState___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 134218242;
  v4 = v2;
  v5 = 2114;
  v6 = a2;
  _os_log_fault_impl(&dword_218A7F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to change to usage state %ld: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __46__STWebpageController__startReportingWebUsage__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to start recording usage: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __35__STWebpageController_serviceProxy__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218A7F000, MEMORY[0x24BDACB70], v0, "Failed to get web service proxy: %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
