@implementation CPSTabBarViewController

- (CPSTabBarViewController)initWithTabBarTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  CPSTabBarViewController *v5;
  uint64_t v6;
  NAFuture *templateProviderFuture;
  CPSTabBarViewController *v9;
  CPSTabBarViewController *v12;
  objc_super v13;
  id v14;
  id v15;
  id location[2];
  CPSTabBarViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v5 = v17;
  v17 = 0;
  v13.receiver = v5;
  v13.super_class = (Class)CPSTabBarViewController;
  v12 = -[CPSTabBarViewController init](&v13, sel_init);
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    objc_storeStrong((id *)&v17->_associatedTemplate, location[0]);
    objc_storeStrong((id *)&v17->_templateDelegate, v15);
    v6 = objc_opt_new();
    templateProviderFuture = v17->_templateProviderFuture;
    v17->_templateProviderFuture = (NAFuture *)v6;

    objc_storeWeak((id *)&v17->_templateEnvironment, v14);
    -[CPSTabBarViewController setDelegate:](v17, "setDelegate:", v17);
    if ((objc_msgSend(v14, "canBecomeNowPlayingApp") & 1) != 0)
      objc_msgSend(v14, "addTemplateEnvironmentDelegate:", v17);
    if ((objc_msgSend(v14, "isNowPlayingApp") & 1) != 0)
      -[CPSTabBarViewController showNowPlayingButton:](v17, "showNowPlayingButton:", 1);
  }
  v9 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (id)tabBarTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSTabBarViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_6(v3, v4);

  return v5;
}

- (id)tabBarTemplateDelegate
{
  return -[CPSTabBarViewController templateDelegate](self, "templateDelegate", a2, self);
}

- (void)invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id obj;
  uint64_t v8;
  id v9;
  _QWORD __b[8];
  void *v11;
  id v12;
  os_log_type_t v13;
  id location[2];
  CPSTabBarViewController *v15;
  _BYTE v16[128];
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v15);
    _os_log_impl(&dword_21E389000, (os_log_t)location[0], v13, "Invalidating %@", v17, 0xCu);
  }
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15->_templateProviderFuture, 0);
  v6 = (id)-[CPSTabBarViewController viewControllers](v15, "viewControllers");
  v12 = (id)objc_msgSend(v6, "copy");

  memset(__b, 0, sizeof(__b));
  obj = v12;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v8)
  {
    v3 = *(_QWORD *)__b[2];
    v4 = 0;
    v5 = v8;
    while (1)
    {
      v2 = v4;
      if (*(_QWORD *)__b[2] != v3)
        objc_enumerationMutation(obj);
      v11 = *(void **)(__b[1] + 8 * v4);
      v9 = CPSSafeProtocolCast_1(&unk_2553F1430, v11);
      objc_msgSend(v9, "invalidate");
      objc_storeStrong(&v9, 0);
      ++v4;
      if (v2 + 1 >= v5)
      {
        v4 = 0;
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v5)
          break;
      }
    }
  }

  objc_storeStrong(&v12, 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v2;
  SEL v3;
  CPSTabBarViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSTabBarViewController;
  -[CPSTabBarViewController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
  -[CPSTabBarViewController _updateNowPlayingButtonIfNeeded](v4, "_updateNowPlayingButtonIfNeeded");
}

- (void)showNowPlayingButton:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  NSString *v8;
  CPSTemplateEnvironment *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *log;
  os_log_type_t type;
  id v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  uint8_t v24[7];
  os_log_type_t v25;
  id v26;
  uint8_t v27[15];
  os_log_type_t v28;
  id location;
  BOOL v30;
  SEL v31;
  CPSTabBarViewController *v32;
  CGRect v33;

  v32 = self;
  v31 = a2;
  v30 = a3;
  v17 = (id)-[CPSTabBarViewController _accessoryView](self, "_accessoryView");
  v18 = 0;
  if (v17)
    v18 = v30;

  if (v18)
  {
    location = CarPlaySupportGeneralLogging();
    v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      type = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_impl(&dword_21E389000, log, type, "Accessory View already set", v27, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  else if (v30)
  {
    v26 = CarPlaySupportGeneralLogging();
    v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v26;
      v14 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_impl(&dword_21E389000, v13, v14, "Showing Now Playing button in Tab Bar", v24, 2u);
    }
    objc_storeStrong(&v26, 0);
    v7 = objc_alloc(MEMORY[0x24BE153A0]);
    v10 = (id)-[CPSTabBarViewController tabBar](v32, "tabBar");
    objc_msgSend(v10, "bounds");
    CGRectGetHeight(v33);
    CGRectMake_1();
    v19 = v3;
    v20 = v4;
    v21 = v5;
    v22 = v6;
    v9 = -[CPSTabBarViewController templateEnvironment](v32, "templateEnvironment");
    v8 = -[CPSTemplateEnvironment bundleIdentifier](v9, "bundleIdentifier");
    v23 = (id)objc_msgSend(v7, "initWithFrame:bundleIdentifier:", v19, v20, v21, v22);

    v11 = (id)objc_msgSend(v23, "nowPlayingButton");
    objc_msgSend(v11, "addTarget:action:forControlEvents:", v32, sel__nowPlayingButtonTapped, 64);

    v12 = (id)objc_msgSend(v23, "nowPlayingButton");
    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("CPTabBarNowPlayingButton"));

    -[CPSTabBarViewController _setAccessoryView:](v32, "_setAccessoryView:", v23);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    -[CPSTabBarViewController _setAccessoryView:](v32, "_setAccessoryView:", 0);
  }
}

- (void)_nowPlayingButtonTapped
{
  CPTemplateProviding *v2;
  CPSTemplateEnvironment *v3;

  v3 = -[CPSTabBarViewController templateEnvironment](self, "templateEnvironment");
  v2 = -[CPSTemplateEnvironment templateProvider](v3, "templateProvider");
  -[CPTemplateProviding clientRequestNowPlayingTemplateAnimated:](v2, "clientRequestNowPlayingTemplateAnimated:", 1);

}

- (NSArray)tabBarButtons
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v3 = (id)-[CPSTabBarViewController tabBar](self, "tabBar");
  v7[0] = (id)objc_msgSend(v3, "subviews");

  v6 = (id)objc_msgSend(v7[0], "cps_filter:", &__block_literal_global_5);
  v5 = (id)objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_116);
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);
  return (NSArray *)v4;
}

uint64_t __40__CPSTabBarViewController_tabBarButtons__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __40__CPSTabBarViewController_tabBarButtons__block_invoke_2(void *a1, void *a2, void *a3)
{
  double v5;
  double MinX;
  id v7;
  id location[2];
  uint64_t v9;
  CGRect v10;
  CGRect v11;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  objc_msgSend(location[0], "frame");
  MinX = CGRectGetMinX(v10);
  objc_msgSend(v7, "frame");
  v5 = CGRectGetMinX(v11);
  if (MinX >= v5)
    v9 = MinX > v5;
  else
    v9 = -1;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)applicationDidBecomeNowPlayingApp:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPSTabBarViewController *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  CPSTabBarViewController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __61__CPSTabBarViewController_applicationDidBecomeNowPlayingApp___block_invoke;
  v8 = &unk_24E26FF88;
  v9 = v13;
  v10 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __61__CPSTabBarViewController_applicationDidBecomeNowPlayingApp___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_isEligibleForNowPlayingButton") & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "showNowPlayingButton:", *(_BYTE *)(a1 + 40) & 1);
  else
    return objc_msgSend(*(id *)(a1 + 32), "showNowPlayingButton:", 0);
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v4;
  void *v5;
  BOOL v8;
  id v9;
  id v10;
  id location[2];
  CPSTabBarViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = (id)-[CPSTabBarViewController selectedViewController](v12, "selectedViewController");
  v8 = v4 != v10;

  if (!v8)
  {
    v5 = (void *)objc_opt_class();
    v9 = CPSSafeCast_6(v5, v10);
    if (v9)
      objc_msgSend(v9, "scrollToTop");
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id location[2];
  CPSTabBarViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (id)objc_msgSend(v13, "associatedTemplate");
    v4 = (id)objc_msgSend(v9, "identifier");
    v5 = v12;
    v12 = v4;

    v10 = (id)-[CPSTabBarViewController navigationController](v15, "navigationController");
    objc_msgSend(v10, "setNavigationBarHidden:", 1);

  }
  v7 = -[CPSTabBarViewController tabBarTemplateDelegate](v15, "tabBarTemplateDelegate");
  v8 = 0;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_25544C5F8) & 1) != 0)
    v8 = v12 != 0;

  if (v8)
  {
    v6 = -[CPSTabBarViewController tabBarTemplateDelegate](v15, "tabBarTemplateDelegate");
    objc_msgSend(v6, "handleActionForControlIdentifier:", v12);

  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)removeFromParentViewController
{
  objc_super v2;
  SEL v3;
  CPSTabBarViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSTabBarViewController;
  -[CPSTabBarViewController removeFromParentViewController](&v2, sel_removeFromParentViewController);
  -[CPSTabBarViewController _cleanup](v4, "_cleanup");
}

- (void)_cleanup
{
  CPSTemplateViewControllerDelegate *v2;

  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  v2 = -[CPSTabBarViewController viewControllerDelegate](self, "viewControllerDelegate");
  -[CPSTemplateViewControllerDelegate templateViewControllerDidPop:](v2, "templateViewControllerDidPop:", self);

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;
  SEL v4;
  CPSTabBarViewController *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSTabBarViewController;
  -[CPSTabBarViewController viewDidLoad](&v3, sel_viewDidLoad);
  v2 = (id)-[CPSTabBarViewController tabBar](v5, "tabBar");
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("CPTabBar"));

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  id v5;
  id v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSTabBarViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSTabBarViewController;
  -[CPSTabBarViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  v6 = -[CPSTabBarViewController tabBarTemplateDelegate](v11, "tabBarTemplateDelegate");
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSTabBarViewController tabBarTemplateDelegate](v11, "tabBarTemplateDelegate");
    v4 = -[CPSTabBarViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    objc_msgSend(v5, "templateWillAppearWithIdentifier:animated:");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  id v5;
  id v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSTabBarViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSTabBarViewController;
  -[CPSTabBarViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v6 = -[CPSTabBarViewController tabBarTemplateDelegate](v11, "tabBarTemplateDelegate");
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSTabBarViewController tabBarTemplateDelegate](v11, "tabBarTemplateDelegate");
    v4 = -[CPSTabBarViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    objc_msgSend(v5, "templateDidAppearWithIdentifier:animated:");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  id v5;
  id v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSTabBarViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSTabBarViewController;
  -[CPSTabBarViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  v6 = -[CPSTabBarViewController tabBarTemplateDelegate](v11, "tabBarTemplateDelegate");
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSTabBarViewController tabBarTemplateDelegate](v11, "tabBarTemplateDelegate");
    v4 = -[CPSTabBarViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    objc_msgSend(v5, "templateWillDisappearWithIdentifier:animated:");

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3;
  CPTemplate *v4;
  id v5;
  id v6;
  char v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  CPSTabBarViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSTabBarViewController;
  -[CPSTabBarViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  v6 = -[CPSTabBarViewController tabBarTemplateDelegate](v11, "tabBarTemplateDelegate");
  v7 = objc_msgSend(v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSTabBarViewController tabBarTemplateDelegate](v11, "tabBarTemplateDelegate");
    v4 = -[CPSTabBarViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    objc_msgSend(v5, "templateDidDisappearWithIdentifier:animated:");

  }
}

- (BOOL)restoresFocusAfterTransition
{
  id v3;
  char v4;

  v3 = (id)-[CPSTabBarViewController selectedViewController](self, "selectedViewController");
  v4 = objc_msgSend(v3, "restoresFocusAfterTransition");

  return v4 & 1;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  objc_super v5;
  BOOL v6;
  id location[2];
  CPSTabBarViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)CPSTabBarViewController;
  -[CPSTabBarViewController setViewControllers:animated:](&v5, sel_setViewControllers_animated_, location[0], a4);
  -[CPSTabBarViewController _updateNowPlayingButtonIfNeeded](v8, "_updateNowPlayingButtonIfNeeded");
  objc_storeStrong(location, 0);
}

- (BOOL)_isEligibleForNowPlayingButton
{
  id v3;
  id v4;
  BOOL v5;
  CPSTemplateEnvironment *v6;
  BOOL v7;
  BOOL v9;
  CGRect v10;

  v6 = -[CPSTabBarViewController templateEnvironment](self, "templateEnvironment");
  v7 = -[CPSTemplateEnvironment canBecomeNowPlayingApp](v6, "canBecomeNowPlayingApp");

  if (!v7)
    return 0;
  v4 = (id)-[CPSTabBarViewController viewControllers](self, "viewControllers");
  v5 = (unint64_t)objc_msgSend(v4, "count") > 4;

  if (!v5)
    return 1;
  v3 = (id)-[CPSTabBarViewController view](self, "view");
  objc_msgSend(v3, "bounds");
  v9 = CGRectGetWidth(v10) >= 440.0;

  return v9;
}

- (void)_updateNowPlayingButtonIfNeeded
{
  id v2;
  BOOL v3;
  BOOL v4;

  v2 = (id)-[CPSTabBarViewController _accessoryView](self, "_accessoryView");
  v3 = v2 != 0;

  v4 = 0;
  if (v3)
    v4 = -[CPSTabBarViewController _isEligibleForNowPlayingButton](self, "_isEligibleForNowPlayingButton");
  if (v3 != v4)
    -[CPSTabBarViewController showNowPlayingButton:](self, "showNowPlayingButton:", v4);
}

- (NAFuture)templateProviderFuture
{
  return self->_templateProviderFuture;
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

- (CPSTemplateViewControllerDelegate)viewControllerDelegate
{
  return (CPSTemplateViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
}

- (void)setViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_viewControllerDelegate, a3);
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
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_storeStrong((id *)&self->_templateDelegate, 0);
  objc_storeStrong((id *)&self->_associatedTemplate, 0);
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
}

@end
