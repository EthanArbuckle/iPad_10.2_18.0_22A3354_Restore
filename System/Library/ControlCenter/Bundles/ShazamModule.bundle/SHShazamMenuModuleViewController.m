@implementation SHShazamMenuModuleViewController

- (void)dealloc
{
  objc_super v3;

  -[NSUserDefaults removeObserver:forKeyPath:context:](self->_musicRecognitionPreferences, "removeObserver:forKeyPath:context:", self, CFSTR("isControlToggleOn"), 0);
  v3.receiver = self;
  v3.super_class = (Class)SHShazamMenuModuleViewController;
  -[SHShazamMenuModuleViewController dealloc](&v3, sel_dealloc);
}

- (SHShazamMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SHShazamMenuModuleViewController *v4;
  SHToggleManager *v5;
  SHToggleManager *toggleManager;
  uint64_t v7;
  NSUserDefaults *musicRecognitionPreferences;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SHShazamMenuModuleViewController;
  v4 = -[CCUIMenuModuleViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(SHToggleManager);
    toggleManager = v4->_toggleManager;
    v4->_toggleManager = v5;

    -[SHToggleManager setDelegate:](v4->_toggleManager, "setDelegate:", v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("group.com.apple.musicrecognition"));
    musicRecognitionPreferences = v4->_musicRecognitionPreferences;
    v4->_musicRecognitionPreferences = (NSUserDefaults *)v7;

    -[NSUserDefaults addObserver:forKeyPath:options:context:](v4->_musicRecognitionPreferences, "addObserver:forKeyPath:options:context:", v4, CFSTR("isControlToggleOn"), 1, 0);
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SHShazamMenuModuleViewController;
  -[SHShazamMenuModuleViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SHShazamMenuModuleViewController refreshState](self, "refreshState");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SHShazamMenuModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v8, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BE90550], "localizedStringForKey:", CFSTR("SHAZAM_MODULE_RECOGNIZE_MUSIC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setTitle:](self, "setTitle:", v3);

  -[CCUIButtonModuleViewController setValueText:](self, "setValueText:", 0);
  objc_msgSend(MEMORY[0x24BE90550], "localizedStringForKey:", CFSTR("SHAZAM_MODULE_LISTENING"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIButtonModuleViewController setSelectedValueText:](self, "setSelectedValueText:", v4);

  v5 = (void *)MEMORY[0x24BE19B00];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionForPackageNamed:inBundle:", CFSTR("Shazam"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setGlyphPackageDescription:](self, "setGlyphPackageDescription:", v7);

  -[CCUIMenuModuleViewController setUseTrailingCheckmarkLayout:](self, "setUseTrailingCheckmarkLayout:", 0);
  -[CCUIMenuModuleViewController setIndentation:](self, "setIndentation:", 1);
  -[CCUIMenuModuleViewController removeFooterButton](self, "removeFooterButton");
  -[SHShazamMenuModuleViewController configureMenuItems](self, "configureMenuItems");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersContextMenuDisplayStyle
{
  return 1;
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v4;

  -[SHShazamMenuModuleViewController toggleManager](self, "toggleManager", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleRecognitionState");

}

- (void)setContentModuleContext:(id)a3
{
  CCUIContentModuleContext *v4;
  CCUIContentModuleContext *contentModuleContext;
  objc_super v6;

  v4 = (CCUIContentModuleContext *)a3;
  v6.receiver = self;
  v6.super_class = (Class)SHShazamMenuModuleViewController;
  -[CCUIMenuModuleViewController setContentModuleContext:](&v6, sel_setContentModuleContext_, v4);
  contentModuleContext = self->_contentModuleContext;
  self->_contentModuleContext = v4;

}

- (void)toggleManager:(id)a3 didToggleToState:(int64_t)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_23101C5FC;
  block[3] = &unk_24FFE2988;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)refreshState
{
  id v3;

  -[SHShazamMenuModuleViewController toggleManager](self, "toggleManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SHShazamMenuModuleViewController refreshStateWithSelected:expanded:](self, "refreshStateWithSelected:expanded:", objc_msgSend(v3, "isToggleOn"), -[CCUIButtonModuleViewController isExpanded](self, "isExpanded"));

}

- (void)refreshStateWithSelected:(BOOL)a3 expanded:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  BOOL v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_23101C6FC;
  v4[3] = &unk_24FFE29B0;
  v5 = a4;
  v4[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v4);
}

- (void)updateStatusMessage
{
  void *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  -[SHShazamMenuModuleViewController toggleManager](self, "toggleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isToggleOn");

  if (v4)
    v5 = CFSTR("SHAZAM_MODULE_STATUS_MESSAGE_ON");
  else
    v5 = CFSTR("SHAZAM_MODULE_STATUS_MESSAGE_OFF");
  if (v4)
    v6 = 1;
  else
    v6 = 2;
  objc_msgSend(MEMORY[0x24BE90550], "localizedStringForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_23101C838;
  block[3] = &unk_24FFE29D8;
  block[4] = self;
  v10 = v7;
  v11 = v6;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)dismissModule
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_23101C924;
  v2[3] = &unk_24FFE2A00;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)requestAuthenticationIfLockedWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  CCUIContentModuleContext *contentModuleContext;
  _QWORD v6[4];
  void (**v7)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  if (-[SHShazamMenuModuleViewController isDeviceUnlocked](self, "isDeviceUnlocked"))
  {
    v4[2](v4, 1);
  }
  else
  {
    contentModuleContext = self->_contentModuleContext;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_23101CA04;
    v6[3] = &unk_24FFE2A28;
    v7 = v4;
    -[CCUIContentModuleContext requestAuthenticationWithCompletionHandler:](contentModuleContext, "requestAuthenticationWithCompletionHandler:", v6);

  }
}

- (BOOL)isDeviceUnlocked
{
  int v2;

  v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

- (void)requestAuthenticationIfShazamIsInstalledAndProtected:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (-[SHShazamMenuModuleViewController isShazamAppInstalled](self, "isShazamAppInstalled"))
  {
    objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", CFSTR("com.shazam.Shazam"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isLocked") & 1) != 0 || (objc_msgSend(v5, "isHidden") & 1) != 0)
    {
      shcore_log_object();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23101B000, v6, OS_LOG_TYPE_DEFAULT, "Shazam is protected, requesting authentication", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BE04310], "sharedGuard");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = sub_23101CB7C;
      v8[3] = &unk_24FFE2A50;
      v9 = v4;
      objc_msgSend(v7, "authenticateForSubject:completion:", v5, v8);

    }
    else
    {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }

  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

- (BOOL)isShazamAppInstalled
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.shazam.Shazam"), 0, &v7);
  v3 = v7;
  if (!v2)
  {
    shcore_log_object();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_23101B000, v4, OS_LOG_TYPE_ERROR, "No application record for %@ found with error: %@", buf, 0x16u);

    }
  }

  return v2 != 0;
}

- (void)configureMenuItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  -[SHShazamMenuModuleViewController recognizeMusicMenuItem](self, "recognizeMusicMenuItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHShazamMenuModuleViewController historyMenuItem](self, "historyMenuItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setMenuItems:](self, "setMenuItems:", v5);

}

- (id)recognizeMusicMenuItem
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  -[SHShazamMenuModuleViewController toggleManager](self, "toggleManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isToggleOn"))
    v4 = CFSTR("SHAZAM_MODULE_STOP_RECOGNITION");
  else
    v4 = CFSTR("SHAZAM_MODULE_RECOGNIZE_MUSIC");
  objc_msgSend(MEMORY[0x24BE90550], "localizedStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHShazamMenuModuleViewController toggleManager](self, "toggleManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isToggleOn");
  v8 = CFSTR("shazam.logo.fill");
  if (v7)
    v8 = CFSTR("xmark");
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x24BE19B60]);
  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_23101CF94;
  v14[3] = &unk_24FFE2A78;
  objc_copyWeak(&v15, &location);
  v12 = (void *)objc_msgSend(v10, "initWithTitle:identifier:image:handler:", v5, CFSTR("com.apple.shazamkit.controlcenter.ShazamModule.recognize-music"), v11, v14);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v12;
}

- (id)historyMenuItem
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc(MEMORY[0x24BE19B60]);
  objc_msgSend(MEMORY[0x24BE90550], "localizedStringForKey:", CFSTR("SHAZAM_MODULE_HISTORY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("music.square.stack.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_23101D0F8;
  v7[3] = &unk_24FFE2A78;
  objc_copyWeak(&v8, &location);
  v5 = (void *)objc_msgSend(v2, "initWithTitle:identifier:image:handler:", v3, CFSTR("com.apple.shazamkit.controlcenter.ShazamModule.history"), v4, v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (void)presentHistoryWithAuthentication
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_23101D1D8;
  v3[3] = &unk_24FFE2B08;
  objc_copyWeak(&v4, &location);
  -[SHShazamMenuModuleViewController requestAuthenticationIfLockedWithCompletionHandler:](self, "requestAuthenticationIfLockedWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a5;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("isControlToggleOn")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    -[SHShazamMenuModuleViewController toggleManager](self, "toggleManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toggleToState:", v9 ^ 1u);

  }
}

- (NSUserDefaults)musicRecognitionPreferences
{
  return self->_musicRecognitionPreferences;
}

- (void)setMusicRecognitionPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_musicRecognitionPreferences, a3);
}

- (SHToggleManager)toggleManager
{
  return self->_toggleManager;
}

- (void)setToggleManager:(id)a3
{
  objc_storeStrong((id *)&self->_toggleManager, a3);
}

- (BOOL)selectedOnExpansion
{
  return self->_selectedOnExpansion;
}

- (void)setSelectedOnExpansion:(BOOL)a3
{
  self->_selectedOnExpansion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleManager, 0);
  objc_storeStrong((id *)&self->_musicRecognitionPreferences, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
