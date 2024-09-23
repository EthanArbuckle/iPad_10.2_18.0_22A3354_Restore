@implementation AXUIRootViewController

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v6, "bounds");
  v4 = (void *)objc_msgSend(v3, "initWithFrame:");
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[AXUIRootViewController setView:](self, "setView:", v4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[AXUIRootViewController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    v7 = 30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v7 &= objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "supportedInterfaceOrientations");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v5);
    if (!v7)
    {
      if (-[AXUIRootViewController isViewLoaded](self, "isViewLoaded"))
      {
        -[AXUIRootViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "window");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(MEMORY[0x24BDFE4D8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "ignoreLogging");

      if ((v12 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFE4D8], "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        AXLoggerForFacility();
        v14 = objc_claimAutoreleasedReturnValue();

        v15 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v14, v15))
        {
          AXColorizeFormatLog();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "windowLevel");
          _AXStringForArgs();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, v15))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v17;
            _os_log_impl(&dword_215E2A000, v14, v15, "%{public}@", buf, 0xCu);
          }

        }
      }

      v7 = 2;
    }
  }
  else
  {
    v7 = 30;
  }

  return v7;
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  return a3 != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[AXUIRootViewController childViewControllers](self, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXUIRootViewController<%p> Content: %@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
