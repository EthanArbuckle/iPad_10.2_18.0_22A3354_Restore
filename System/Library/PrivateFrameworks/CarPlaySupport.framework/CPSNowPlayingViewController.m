@implementation CPSNowPlayingViewController

- (CPSNowPlayingViewController)initWithNowPlayingTemplate:(id)a3 templateDelegate:(id)a4 environment:(id)a5
{
  CPSAudioPlaybackManager *v5;
  uint64_t v6;
  CPUIThrottle *updateThrottle;
  NAFuture *v8;
  NAFuture *templateProviderFuture;
  CPSNowPlayingViewController *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CPSNowPlayingViewController *v23;
  id v24;
  CPSNowPlayingViewController *v25;
  id v26;
  objc_super v27;
  id v28;
  id v29;
  id v30;
  id location[2];
  CPSNowPlayingViewController *v32;
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = 0;
  objc_storeStrong(&v29, a5);
  v5 = [CPSAudioPlaybackManager alloc];
  v28 = -[CPSAudioPlaybackManager initWithNowPlayingTemplate:templateDelegate:environment:](v5, "initWithNowPlayingTemplate:templateDelegate:environment:", location[0], v30, v29);
  v23 = v32;
  v24 = (id)objc_msgSend(v29, "bundleIdentifier");
  v32 = 0;
  v27.receiver = v23;
  v27.super_class = (Class)CPSNowPlayingViewController;
  v25 = -[CPUINowPlayingViewController initWithBundleIdentifier:dataSource:delegate:](&v27, sel_initWithBundleIdentifier_dataSource_delegate_);
  v32 = v25;
  objc_storeStrong((id *)&v32, v25);

  if (v25)
  {
    objc_storeStrong((id *)&v32->_audioPlaybackManager, v28);
    -[CPSAudioPlaybackManager setNowPlayingViewController:](v32->_audioPlaybackManager, "setNowPlayingViewController:", v32);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE153E0]), "initWithBase:", 2.0);
    updateThrottle = v32->_updateThrottle;
    v32->_updateThrottle = (CPUIThrottle *)v6;

    objc_storeWeak((id *)&v32->_templateEnvironment, v29);
    objc_storeStrong((id *)&v32->_associatedTemplate, location[0]);
    objc_storeStrong((id *)&v32->_templateDelegate, v30);
    v20 = (id)objc_msgSend(location[0], "tabImage");

    if (v20)
    {
      v16 = objc_alloc(MEMORY[0x24BDF6E50]);
      v19 = (id)objc_msgSend(location[0], "tabTitle");
      v18 = (id)objc_msgSend(location[0], "tabImage");
      v17 = (id)objc_msgSend(v16, "initWithTitle:image:tag:", v19);
      -[CPSNowPlayingViewController setTabBarItem:](v32, "setTabBarItem:");

    }
    else
    {
      v12 = objc_alloc(MEMORY[0x24BDF6E50]);
      v13 = (id)objc_msgSend(v12, "initWithTabBarSystemItem:tag:", objc_msgSend(location[0], "tabSystemItem"), 0);
      -[CPSNowPlayingViewController setTabBarItem:](v32, "setTabBarItem:");

      v15 = (id)-[CPSNowPlayingViewController tabBarItem](v32, "tabBarItem");
      v14 = (id)objc_msgSend(location[0], "tabTitle");
      objc_msgSend(v15, "_setInternalTitle:");

    }
    v26 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v32);
      _os_log_impl(&dword_21E389000, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "%@: Creating now playing Future", v33, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    v8 = (NAFuture *)(id)objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v32);
    templateProviderFuture = v32->_templateProviderFuture;
    v32->_templateProviderFuture = v8;

  }
  v11 = v32;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v32, 0);
  return v11;
}

- (id)nowPlayingTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSNowPlayingViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_7(v3, v4);

  return v5;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  CPSNowPlayingViewController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSNowPlayingViewController;
  -[CPUINowPlayingViewController viewDidLoad](&v3, sel_viewDidLoad);
  v2 = (id)-[CPSNowPlayingViewController navigationController](v5, "navigationController");
  objc_msgSend(v2, "setNavigationBarHidden:animated:", 0, 1);

}

- (void)invalidate
{
  os_log_t oslog[2];
  CPSNowPlayingViewController *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_21E389000, oslog[0], OS_LOG_TYPE_DEFAULT, "Invalidating %@", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)&v3->_templateProviderFuture, 0);
  objc_storeStrong((id *)&v3->_audioPlaybackManager, 0);
}

- (void)updateNowPlayingTemplate:(id)a3 withProxyDelegate:(id)a4 canThrottle:(id)a5
{
  NSObject *queue;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  CPSNowPlayingViewController *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id location[2];
  CPSNowPlayingViewController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  queue = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __86__CPSNowPlayingViewController_updateNowPlayingTemplate_withProxyDelegate_canThrottle___block_invoke;
  v12 = &unk_24E26FB20;
  v13 = v20;
  v14 = location[0];
  v15 = v18;
  v16 = v17;
  dispatch_async(queue, &v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __86__CPSNowPlayingViewController_updateNowPlayingTemplate_withProxyDelegate_canThrottle___block_invoke(uint64_t a1)
{
  id v1;
  char v3;
  char v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setAssociatedTemplate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setTemplateDelegate:", *(_QWORD *)(a1 + 48));
  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "audioPlaybackManager");
  objc_msgSend(v1, "updateNowPlayingTemplate:templateDelegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v4 = 0;
  v3 = 1;
  if ((objc_msgSend(*(id *)(a1 + 56), "BOOLValue") & 1) != 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "updateThrottle");
    v4 = 1;
    v3 = objc_msgSend(v5, "incrementAttempts");
  }
  if ((v4 & 1) != 0)

  if ((v3 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)reloadData
{
  CPUIThrottle *v2;
  objc_super v3;
  SEL v4;
  CPSNowPlayingViewController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSNowPlayingViewController;
  -[CPUINowPlayingViewController reloadData](&v3, sel_reloadData);
  v2 = -[CPSNowPlayingViewController updateThrottle](v5, "updateThrottle");
  -[CPUIThrottle unthrottle](v2, "unthrottle");

}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSNowPlayingViewController *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id location[2];
  CPSNowPlayingViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __50__CPSNowPlayingViewController_setControl_enabled___block_invoke;
  v10 = &unk_24E270068;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __50__CPSNowPlayingViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  id v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v8;
  id obj;
  uint64_t v10;
  _QWORD __b[8];
  id v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  memset(__b, 0, sizeof(__b));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "playModeControlView");
  obj = (id)objc_msgSend(v8, "mediaButtons");

  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v10)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v10;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v12 = *(id *)(__b[1] + 8 * v5);
      v1 = (id)objc_msgSend(v12, "identifier");
      v2 = objc_msgSend(v1, "isEqual:", *(_QWORD *)(a1 + 40));

      if ((v2 & 1) != 0)
        objc_msgSend(v12, "setEnabled:", *(_BYTE *)(a1 + 48) & 1);
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v6)
          break;
      }
    }
  }

}

- (void)setControl:(id)a3 selected:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSNowPlayingViewController *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id location[2];
  CPSNowPlayingViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __51__CPSNowPlayingViewController_setControl_selected___block_invoke;
  v10 = &unk_24E270068;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __51__CPSNowPlayingViewController_setControl_selected___block_invoke(uint64_t a1)
{
  id v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v8;
  id obj;
  uint64_t v10;
  _QWORD __b[8];
  id v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  memset(__b, 0, sizeof(__b));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "playModeControlView");
  obj = (id)objc_msgSend(v8, "mediaButtons");

  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v10)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v10;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v12 = *(id *)(__b[1] + 8 * v5);
      v1 = (id)objc_msgSend(v12, "identifier");
      v2 = objc_msgSend(v1, "isEqual:", *(_QWORD *)(a1 + 40));

      if ((v2 & 1) != 0)
        objc_msgSend(v12, "setSelected:", *(_BYTE *)(a1 + 48) & 1);
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v6)
          break;
      }
    }
  }

}

- (void)_cps_viewControllerWasPopped
{
  -[CPSNowPlayingViewController setIsPopping:](self, "setIsPopping:", 1, a2, self);
}

- (void)setIsPopping:(BOOL)a3
{
  if (a3 != self->_isPopping)
    self->_isPopping = a3;
  if (self->_didDisappear && a3)
    -[CPSNowPlayingViewController _cleanup](self, "_cleanup");
}

- (void)setDidDisappear:(BOOL)a3
{
  if (self->_didDisappear != a3)
    self->_didDisappear = a3;
  if (a3 && self->_isPopping)
    -[CPSNowPlayingViewController _cleanup](self, "_cleanup");
}

- (void)removeFromParentViewController
{
  objc_super v2;
  SEL v3;
  CPSNowPlayingViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSNowPlayingViewController;
  -[CPSNowPlayingViewController removeFromParentViewController](&v2, sel_removeFromParentViewController);
  -[CPSNowPlayingViewController _cleanup](v4, "_cleanup");
}

- (void)_cleanup
{
  CPSTemplateViewControllerDelegate *v2;
  os_log_t oslog[2];
  CPSNowPlayingViewController *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, (uint64_t)v4);
    _os_log_impl(&dword_21E389000, oslog[0], OS_LOG_TYPE_DEFAULT, "Cleaning up %@", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)&v4->_templateProviderFuture, 0);
  v2 = -[CPSNowPlayingViewController viewControllerDelegate](v4, "viewControllerDelegate");
  -[CPSTemplateViewControllerDelegate templateViewControllerDidPop:](v2, "templateViewControllerDidPop:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  CPTemplateDelegate *v5;
  CPTemplateDelegate *v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSNowPlayingViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSNowPlayingViewController;
  -[CPUINowPlayingViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[CPSNowPlayingViewController setIsPopping:](v11, "setIsPopping:", 0);
  -[CPSNowPlayingViewController setDidDisappear:](v11, "setDidDisappear:", 0);
  v6 = -[CPSNowPlayingViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSNowPlayingViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSNowPlayingViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateWillAppearWithIdentifier:animated:](v5, "templateWillAppearWithIdentifier:animated:");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  CPTemplateDelegate *v5;
  CPTemplateDelegate *v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSNowPlayingViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSNowPlayingViewController;
  -[CPSNowPlayingViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v6 = -[CPSNowPlayingViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSNowPlayingViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSNowPlayingViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateDidAppearWithIdentifier:animated:](v5, "templateDidAppearWithIdentifier:animated:");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  CPTemplateDelegate *v5;
  CPTemplateDelegate *v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSNowPlayingViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSNowPlayingViewController;
  -[CPUINowPlayingViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  v6 = -[CPSNowPlayingViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSNowPlayingViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSNowPlayingViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateWillDisappearWithIdentifier:animated:](v5, "templateWillDisappearWithIdentifier:animated:");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  CPTemplateDelegate *v5;
  CPTemplateDelegate *v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSNowPlayingViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSNowPlayingViewController;
  -[CPUINowPlayingViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  v6 = -[CPSNowPlayingViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSNowPlayingViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSNowPlayingViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateDidDisappearWithIdentifier:animated:](v5, "templateDidDisappearWithIdentifier:animated:");

  }
  -[CPSNowPlayingViewController setDidDisappear:](v11, "setDidDisappear:", 1);
}

- (void)didSelectButton:(id)a3
{
  CPTemplateDelegate *v3;
  CPTemplateDelegate *v4;
  char v5;
  os_log_t oslog;
  id v7;
  id location[2];
  CPSNowPlayingViewController *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "identifier");
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)v9, (uint64_t)v7);
    _os_log_debug_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEBUG, "%@: button selected with UUID: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = -[CPSNowPlayingViewController templateDelegate](v9, "templateDelegate");
  v5 = -[CPTemplateDelegate conformsToProtocol:](v4, "conformsToProtocol:", &unk_25544C5F8);

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSNowPlayingViewController templateDelegate](v9, "templateDelegate");
    -[CPTemplateDelegate handleActionForControlIdentifier:](v3, "handleActionForControlIdentifier:", v7);

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (CPSAudioPlaybackManager)audioPlaybackManager
{
  return self->_audioPlaybackManager;
}

- (CPTemplate)associatedTemplate
{
  return self->_associatedTemplate;
}

- (void)setAssociatedTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_associatedTemplate, a3);
}

- (CPTemplateDelegate)templateDelegate
{
  return self->_templateDelegate;
}

- (void)setTemplateDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_templateDelegate, a3);
}

- (NAFuture)templateProviderFuture
{
  return self->_templateProviderFuture;
}

- (void)setTemplateProviderFuture:(id)a3
{
  objc_storeStrong((id *)&self->_templateProviderFuture, a3);
}

- (CPSTemplateViewControllerDelegate)viewControllerDelegate
{
  return (CPSTemplateViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
}

- (void)setViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerDelegate, a3);
}

- (BOOL)isPopping
{
  return self->_isPopping;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (CPUIThrottle)updateThrottle
{
  return self->_updateThrottle;
}

- (void)setUpdateThrottle:(id)a3
{
  objc_storeStrong((id *)&self->_updateThrottle, a3);
}

- (CPSTemplateEnvironment)templateEnvironment
{
  return (CPSTemplateEnvironment *)objc_loadWeakRetained((id *)&self->_templateEnvironment);
}

- (void)setTemplateEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_templateEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_templateEnvironment);
  objc_storeStrong((id *)&self->_updateThrottle, 0);
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  objc_storeStrong((id *)&self->_templateDelegate, 0);
  objc_storeStrong((id *)&self->_associatedTemplate, 0);
  objc_storeStrong((id *)&self->_audioPlaybackManager, 0);
}

@end
