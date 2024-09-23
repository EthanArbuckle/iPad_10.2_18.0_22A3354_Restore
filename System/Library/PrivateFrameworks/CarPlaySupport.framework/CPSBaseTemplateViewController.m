@implementation CPSBaseTemplateViewController

- (CPSBaseTemplateViewController)initWithTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  CPSBaseTemplateViewController *v5;
  uint64_t v6;
  NAFuture *templateProviderFuture;
  CPSBaseTemplateViewController *v9;
  CPSBaseTemplateViewController *v12;
  objc_super v13;
  id v14;
  id v15;
  id location[2];
  CPSBaseTemplateViewController *v17;

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
  v13.super_class = (Class)CPSBaseTemplateViewController;
  v12 = -[CPSBaseTemplateViewController init](&v13, sel_init);
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    v6 = objc_opt_new();
    templateProviderFuture = v17->_templateProviderFuture;
    v17->_templateProviderFuture = (NAFuture *)v6;

    objc_storeStrong((id *)&v17->_templateEnvironment, v14);
    objc_storeStrong((id *)&v17->_templateDelegate, v15);
    -[CPSBaseTemplateViewController _updateTemplate:](v17, "_updateTemplate:", location[0]);
    if ((objc_msgSend(v14, "canBecomeNowPlayingApp") & 1) != 0)
      objc_msgSend(v14, "addTemplateEnvironmentDelegate:", v17);
    if ((objc_msgSend(v14, "isNowPlayingApp") & 1) != 0)
      -[CPSBaseTemplateViewController _updateTrailingBarButtons](v17, "_updateTrailingBarButtons");
  }
  v9 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (void)_dismissTemplateViewController
{
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __63__CPSBaseTemplateViewController__dismissTemplateViewController__block_invoke;
  v7 = &unk_24E26F1B8;
  v8[0] = self;
  -[CPSBaseTemplateViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v8, 0);
}

void __63__CPSBaseTemplateViewController__dismissTemplateViewController__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "viewControllerDelegate");
  objc_msgSend(v2, "templateViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_wantsNowPlayingButton
{
  return 0;
}

- (void)_updateTemplate:(id)a3
{
  NSString *v3;
  NSString *v4;
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;
  CPTemplate *v10;
  BOOL v11;
  id v12;
  id v13;
  CPTemplate *v14;
  NSString *v15;
  id v16;
  id v17;
  UIImage *v18;
  CPTemplate *v19;
  CPTemplate *v20;
  CPTemplate *v21;
  char v22;
  CPTemplate *v23;
  UIImage *v24;
  double v25;
  double v26;
  char v27;
  CPTemplate *v28;
  NSString *v29;
  id location[2];
  CPSBaseTemplateViewController *v31;

  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v31->_associatedTemplate, location[0]);
  v23 = -[CPSBaseTemplateViewController associatedTemplate](v31, "associatedTemplate");
  v24 = -[CPTemplate tabImage](v23, "tabImage");

  if (v24)
  {
    v21 = -[CPSBaseTemplateViewController associatedTemplate](v31, "associatedTemplate");
    v29 = -[CPTemplate tabTitle](v21, "tabTitle");

    v27 = 0;
    v22 = 0;
    if (!v29)
    {
      v28 = -[CPSBaseTemplateViewController associatedTemplate](v31, "associatedTemplate");
      v27 = 1;
      v22 = objc_opt_respondsToSelector();
    }
    if ((v27 & 1) != 0)

    if ((v22 & 1) != 0)
    {
      v20 = -[CPSBaseTemplateViewController associatedTemplate](v31, "associatedTemplate");
      v3 = (NSString *)(id)-[CPTemplate title](v20, "title");
      v4 = v29;
      v29 = v3;

    }
    v16 = objc_alloc(MEMORY[0x24BDF6E50]);
    v15 = v29;
    v19 = -[CPSBaseTemplateViewController associatedTemplate](v31, "associatedTemplate");
    v18 = -[CPTemplate tabImage](v19, "tabImage");
    v17 = (id)objc_msgSend(v16, "initWithTitle:image:tag:", v15);
    -[CPSBaseTemplateViewController setTabBarItem:](v31, "setTabBarItem:");

    objc_storeStrong((id *)&v29, 0);
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDF6E50]);
    v14 = -[CPSBaseTemplateViewController associatedTemplate](v31, "associatedTemplate");
    v13 = (id)objc_msgSend(v12, "initWithTabBarSystemItem:tag:", -[CPTemplate tabSystemItem](v14, "tabSystemItem"), 0);
    -[CPSBaseTemplateViewController setTabBarItem:](v31, "setTabBarItem:");

  }
  v10 = -[CPSBaseTemplateViewController associatedTemplate](v31, "associatedTemplate");
  v11 = -[CPTemplate showsTabBadge](v10, "showsTabBadge");

  if (v11)
  {
    v9 = (id)-[CPSBaseTemplateViewController tabBarItem](v31, "tabBarItem");
    objc_msgSend(v9, "setBadgeValue:", &stru_24E271FF0);

  }
  else
  {
    v8 = (id)-[CPSBaseTemplateViewController tabBarItem](v31, "tabBarItem");
    objc_msgSend(v8, "setBadgeValue:", 0);

  }
  UIOffsetMake();
  v25 = v5;
  v26 = v6;
  v7 = (id)-[CPSBaseTemplateViewController tabBarItem](v31, "tabBarItem");
  objc_msgSend(v7, "setBadgeOffset:", v25, v26);

  objc_storeStrong(location, 0);
}

- (void)_cps_viewControllerWasPopped
{
  -[CPSBaseTemplateViewController setIsPopping:](self, "setIsPopping:", 1, a2, self);
}

- (void)applicationDidBecomeNowPlayingApp:(BOOL)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPSBaseTemplateViewController *v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  CPSBaseTemplateViewController *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __67__CPSBaseTemplateViewController_applicationDidBecomeNowPlayingApp___block_invoke;
  v8 = &unk_24E26FF88;
  v9 = v13;
  v10 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __67__CPSBaseTemplateViewController_applicationDidBecomeNowPlayingApp___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsNowPlayingApp:", *(_BYTE *)(a1 + 40) & 1);
  return objc_msgSend(*(id *)(a1 + 32), "_updateTrailingBarButtons");
}

- (void)invalidate
{
  os_log_t oslog[2];
  CPSBaseTemplateViewController *v3;
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
}

- (void)viewDidLoad
{
  id v2;
  NAFuture *v3;
  objc_super v4;
  SEL v5;
  CPSBaseTemplateViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSBaseTemplateViewController;
  -[CPSBaseTemplateViewController viewDidLoad](&v4, sel_viewDidLoad);
  v2 = (id)-[CPSBaseTemplateViewController navigationController](v6, "navigationController");
  objc_msgSend(v2, "setNavigationBarHidden:animated:", 0, 1);

  -[CPSBaseTemplateViewController _viewDidLoad](v6, "_viewDidLoad");
  v3 = -[CPSBaseTemplateViewController templateProviderFuture](v6, "templateProviderFuture");
  -[NAFuture finishWithResult:](v3, "finishWithResult:", v6);

}

- (void)_viewDidLoad
{
  id v2;

  v2 = (id)-[CPSBaseTemplateViewController navigationItem](self, "navigationItem");
  objc_msgSend(v2, "setLeftItemsSupplementBackButton:", 1);

  -[CPSBaseTemplateViewController _updateLeadingBarButtons](self, "_updateLeadingBarButtons");
  -[CPSBaseTemplateViewController _updateTrailingBarButtons](self, "_updateTrailingBarButtons");
}

- (void)setIsPopping:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  if (a3 != self->_isPopping)
  {
    self->_isPopping = a3;
    if (-[CPSBaseTemplateViewController didDisappear](self, "didDisappear") && v3)
      -[CPSBaseTemplateViewController _cleanup](self, "_cleanup");
  }
}

- (void)setDidDisappear:(BOOL)a3
{
  if (self->_didDisappear != a3)
  {
    self->_didDisappear = a3;
    if (a3 && -[CPSBaseTemplateViewController isPopping](self, "isPopping"))
      -[CPSBaseTemplateViewController _cleanup](self, "_cleanup");
  }
}

- (void)removeFromParentViewController
{
  objc_super v2;
  SEL v3;
  CPSBaseTemplateViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSBaseTemplateViewController;
  -[CPSBaseTemplateViewController removeFromParentViewController](&v2, sel_removeFromParentViewController);
  -[CPSBaseTemplateViewController _cleanup](v4, "_cleanup");
}

- (void)_cleanup
{
  CPSTemplateViewControllerDelegate *v2;

  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  v2 = -[CPSBaseTemplateViewController viewControllerDelegate](self, "viewControllerDelegate");
  -[CPSTemplateViewControllerDelegate templateViewControllerDidPop:](v2, "templateViewControllerDidPop:", self);

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
  CPSBaseTemplateViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSBaseTemplateViewController;
  -[CPSBaseTemplateViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[CPSBaseTemplateViewController setDidDisappear:](v11, "setDidDisappear:", 0);
  -[CPSBaseTemplateViewController setIsPopping:](v11, "setIsPopping:", 0);
  v6 = -[CPSBaseTemplateViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSBaseTemplateViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSBaseTemplateViewController associatedTemplate](v11, "associatedTemplate");
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
  CPSBaseTemplateViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSBaseTemplateViewController;
  -[CPSBaseTemplateViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  v6 = -[CPSBaseTemplateViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSBaseTemplateViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSBaseTemplateViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateDidAppearWithIdentifier:animated:](v5, "templateDidAppearWithIdentifier:animated:");

  }
  -[CPSBaseTemplateViewController _addGestureRecognizerIfNecessary](v11, "_addGestureRecognizerIfNecessary");
}

- (void)_addGestureRecognizerIfNecessary
{
  id v2;
  id v3;
  UITapGestureRecognizer *v4;
  id v5;
  id v6;
  CPTemplate *v7;
  id v8;
  id v9[2];
  CPSBaseTemplateViewController *v10;

  v10 = self;
  v9[1] = (id)a2;
  v6 = (id)-[CPSBaseTemplateViewController navigationController](self, "navigationController");
  v5 = (id)objc_msgSend(v6, "view");
  v4 = -[CPSBaseTemplateViewController backGestureRecognizer](v10, "backGestureRecognizer");
  objc_msgSend(v5, "removeGestureRecognizer:");

  v7 = -[CPSBaseTemplateViewController associatedTemplate](v10, "associatedTemplate");
  v8 = (id)-[CPTemplate backButton](v7, "backButton");

  if (v8)
  {
    v9[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v10, sel__backGestureFired_);
    objc_msgSend(v9[0], "setAllowedPressTypes:", &unk_24E29A908);
    objc_msgSend(v9[0], "setDelegate:", v10);
    v3 = (id)-[CPSBaseTemplateViewController navigationController](v10, "navigationController");
    v2 = (id)objc_msgSend(v3, "view");
    objc_msgSend(v2, "addGestureRecognizer:", v9[0]);

    -[CPSBaseTemplateViewController setBackGestureRecognizer:](v10, "setBackGestureRecognizer:", v9[0]);
    objc_storeStrong(v9, 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  UITapGestureRecognizer *v3;
  id v4;
  id v5;
  id v6;
  CPTemplate *v7;
  CPTemplateDelegate *v8;
  CPTemplateDelegate *v9;
  char v10;
  objc_super v11;
  BOOL v12;
  SEL v13;
  CPSBaseTemplateViewController *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPSBaseTemplateViewController;
  -[CPSBaseTemplateViewController viewWillDisappear:](&v11, sel_viewWillDisappear_, a3);
  v9 = -[CPSBaseTemplateViewController templateDelegate](v14, "templateDelegate");
  v10 = -[CPTemplateDelegate conformsToProtocol:](v9, "conformsToProtocol:", &unk_25544C5F8);

  if ((v10 & 1) != 0)
  {
    v8 = -[CPSBaseTemplateViewController templateDelegate](v14, "templateDelegate");
    v7 = -[CPSBaseTemplateViewController associatedTemplate](v14, "associatedTemplate");
    v6 = (id)-[CPTemplate identifier](v7, "identifier");
    -[CPTemplateDelegate templateWillDisappearWithIdentifier:animated:](v8, "templateWillDisappearWithIdentifier:animated:");

  }
  v5 = (id)-[CPSBaseTemplateViewController navigationController](v14, "navigationController");
  v4 = (id)objc_msgSend(v5, "view");
  v3 = -[CPSBaseTemplateViewController backGestureRecognizer](v14, "backGestureRecognizer");
  objc_msgSend(v4, "removeGestureRecognizer:");

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
  CPSBaseTemplateViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSBaseTemplateViewController;
  -[CPSBaseTemplateViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  v6 = -[CPSBaseTemplateViewController templateDelegate](v11, "templateDelegate");
  v7 = -[CPTemplateDelegate conformsToProtocol:](v6, "conformsToProtocol:", &unk_25544C5F8);

  if ((v7 & 1) != 0)
  {
    v5 = -[CPSBaseTemplateViewController templateDelegate](v11, "templateDelegate");
    v4 = -[CPSBaseTemplateViewController associatedTemplate](v11, "associatedTemplate");
    v3 = (id)-[CPTemplate identifier](v4, "identifier");
    -[CPTemplateDelegate templateDidDisappearWithIdentifier:animated:](v5, "templateDidDisappearWithIdentifier:animated:");

  }
  -[CPSBaseTemplateViewController setDidDisappear:](v11, "setDidDisappear:", 1);
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  CPSBaseTemplateViewController *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)CPSBaseTemplateViewController;
  -[CPSBaseTemplateViewController dealloc](&v3, sel_dealloc);
}

- (void)didSelectButton:(id)a3
{
  CPTemplateDelegate *v3;
  CPTemplateDelegate *v4;
  char v5;
  void *v6;
  NSString *v7;
  CPSTemplateEnvironment *v8;
  CPSTemplateViewControllerDelegate *v9;
  id v10;
  os_log_type_t v11;
  id v12;
  id v13;
  id location[2];
  CPSBaseTemplateViewController *v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (id)objc_msgSend(location[0], "identifier");
  v12 = CarPlaySupportGeneralLogging();
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v16, (uint64_t)v15, (uint64_t)v13);
    _os_log_impl(&dword_21E389000, (os_log_t)v12, v11, "%@: button selected with UUID: %@", v16, 0x16u);
  }
  objc_storeStrong(&v12, 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BE90820];
    v8 = -[CPSBaseTemplateViewController templateEnvironment](v15, "templateEnvironment");
    v7 = -[CPSTemplateEnvironment bundleIdentifier](v8, "bundleIdentifier");
    v10 = (id)objc_msgSend(v6, "messageComposeDirectActionWithAppBundleId:");

    v9 = -[CPSBaseTemplateViewController viewControllerDelegate](v15, "viewControllerDelegate");
    -[CPSTemplateViewControllerDelegate templateViewController:shouldActivateSiriWithDirectActionContext:](v9, "templateViewController:shouldActivateSiriWithDirectActionContext:", v15, v10);

    objc_storeStrong(&v10, 0);
  }
  else
  {
    v4 = -[CPSBaseTemplateViewController templateDelegate](v15, "templateDelegate");
    v5 = -[CPTemplateDelegate conformsToProtocol:](v4, "conformsToProtocol:", &unk_25544C5F8);

    if ((v5 & 1) != 0)
    {
      v3 = -[CPSBaseTemplateViewController templateDelegate](v15, "templateDelegate");
      -[CPTemplateDelegate handleActionForControlIdentifier:](v3, "handleActionForControlIdentifier:", v13);

    }
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (id)_barButtonItemForIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v14;
  id v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  id location[2];
  CPSBaseTemplateViewController *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  v18 = &v17;
  v19 = 838860800;
  v20 = 48;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  v9 = (id)-[CPSBaseTemplateViewController navigationItem](v25, "navigationItem");
  v8 = (id)objc_msgSend(v9, "leftBarButtonItems");
  v7 = (id)-[CPSBaseTemplateViewController navigationItem](v25, "navigationItem");
  v6 = (id)objc_msgSend(v7, "rightBarButtonItems");
  v16 = (id)objc_msgSend(v8, "arrayByAddingObjectsFromArray:");

  v5 = v16;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __61__CPSBaseTemplateViewController__barButtonItemForIdentifier___block_invoke;
  v14 = &unk_24E2702E8;
  v15[0] = location[0];
  v15[1] = &v17;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);
  v4 = (id)v18[5];
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __61__CPSBaseTemplateViewController__barButtonItemForIdentifier___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v4;
  id v8;
  char v9;
  id v10[2];
  _BYTE *v11;
  uint64_t v12;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12 = a3;
  v11 = a4;
  v10[1] = a1;
  v4 = (void *)objc_opt_class();
  v10[0] = CPSSafeCast_11(v4, location[0]);
  v8 = (id)objc_msgSend(v10[0], "identifier");
  v9 = objc_msgSend(v8, "isEqual:", a1[4]);

  if ((v9 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v10[0]);
    *v11 = 1;
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (id)_nowPlayingBarButtonItem
{
  id v2;
  id v4;
  NSString *v5;
  CPSTemplateEnvironment *v6;
  void *v7;
  id v8[2];
  CPSBaseTemplateViewController *v9;

  v9 = self;
  v8[1] = (id)a2;
  v4 = objc_alloc(MEMORY[0x24BE15398]);
  v6 = -[CPSBaseTemplateViewController templateEnvironment](v9, "templateEnvironment");
  v5 = -[CPSTemplateEnvironment bundleIdentifier](v6, "bundleIdentifier");
  v8[0] = (id)objc_msgSend(v4, "initWithBundleIdentifier:");

  objc_msgSend(v8[0], "addTarget:action:forControlEvents:", v9, sel__nowPlayingButtonTapped_, 64);
  v2 = objc_alloc(MEMORY[0x24BDF6860]);
  v7 = (void *)objc_msgSend(v2, "initWithCustomView:", v8[0]);
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_barButtonItemForBarButton:(id)a3
{
  CPSBarButtonItem *v3;
  CPSBarButtonItem *v5;
  CPSBarButtonItem *v6;
  id location[2];
  CPSBaseTemplateViewController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [CPSBarButtonItem alloc];
  v6 = -[CPSBarButtonItem initWithCPBarButton:](v3, "initWithCPBarButton:", location[0]);
  -[CPSBarButtonItem setDelegate:](v6, "setDelegate:", v8);
  v5 = v6;
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;
  BOOL v8;
  char v9;
  id v10;
  char v11;
  CPTemplate *v12;
  id v13;
  id location[2];
  CPSBaseTemplateViewController *v15;
  BOOL v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v6 = (UITapGestureRecognizer *)location[0];
  v7 = -[CPSBaseTemplateViewController backGestureRecognizer](v15, "backGestureRecognizer");
  v11 = 0;
  v9 = 0;
  v8 = 0;
  if (v6 == v7)
  {
    v12 = -[CPSBaseTemplateViewController associatedTemplate](v15, "associatedTemplate");
    v11 = 1;
    v10 = (id)-[CPTemplate backButton](v12, "backButton");
    v9 = 1;
    v8 = v10 != 0;
  }
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  v16 = v8;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (void)_backGestureFired:(id)a3
{
  CPSBaseTemplateViewController *v3;
  id v4;
  CPTemplate *v5;
  CPTemplate *v6;
  id v7;
  id location[2];
  CPSBaseTemplateViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[CPSBaseTemplateViewController associatedTemplate](v9, "associatedTemplate");
  v7 = (id)-[CPTemplate backButton](v6, "backButton");

  if (v7)
  {
    v3 = v9;
    v5 = -[CPSBaseTemplateViewController associatedTemplate](v9, "associatedTemplate");
    v4 = (id)-[CPTemplate backButton](v5, "backButton");
    -[CPSBaseTemplateViewController didSelectButton:](v3, "didSelectButton:");

  }
  objc_storeStrong(location, 0);
}

- (void)_nowPlayingButtonTapped:(id)a3
{
  id v3;
  CPTemplateProviding *v4;
  CPSTemplateEnvironment *v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id obj;
  uint64_t v17;
  NSObject *log;
  os_log_type_t type;
  uint8_t v20[15];
  os_log_type_t v21;
  os_log_t v22;
  int v23;
  uint8_t v24[15];
  os_log_type_t v25;
  os_log_t oslog;
  _QWORD __b[8];
  uint64_t v28;
  uint8_t v29[7];
  os_log_type_t v30;
  id v31;
  id location[2];
  CPSBaseTemplateViewController *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v31 = CarPlaySupportGeneralLogging();
  v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
  {
    log = v31;
    type = v30;
    __os_log_helper_16_0_0(v29);
    _os_log_impl(&dword_21E389000, log, type, "System Now Playing button tapped", v29, 2u);
  }
  objc_storeStrong(&v31, 0);
  memset(__b, 0, sizeof(__b));
  v15 = (id)-[CPSBaseTemplateViewController navigationController](v33, "navigationController");
  obj = (id)objc_msgSend(v15, "viewControllers");

  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
  if (v17)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v17;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(obj);
      v28 = *(_QWORD *)(__b[1] + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v34, 16);
        if (!v14)
          goto LABEL_13;
      }
    }
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = oslog;
      v10 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_impl(&dword_21E389000, v9, v10, "Popping to existing now playing view controller.", v24, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = (id)-[CPSBaseTemplateViewController navigationController](v33, "navigationController");
    v3 = (id)objc_msgSend(v8, "popToViewController:animated:", v28, 1);

    v23 = 1;
  }
  else
  {
LABEL_13:
    v23 = 0;
  }

  if (!v23)
  {
    v22 = (os_log_t)CarPlaySupportGeneralLogging();
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v22;
      v7 = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_impl(&dword_21E389000, v6, v7, "Requesting Now Playing from client.", v20, 2u);
    }
    objc_storeStrong((id *)&v22, 0);
    v5 = -[CPSBaseTemplateViewController templateEnvironment](v33, "templateEnvironment");
    v4 = -[CPSTemplateEnvironment templateProvider](v5, "templateProvider");
    -[CPTemplateProviding clientRequestNowPlayingTemplateAnimated:](v4, "clientRequestNowPlayingTemplateAnimated:", 1);

    v23 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)setHostBackButton:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPSBaseTemplateViewController *v9;
  id v10;
  id location[2];
  CPSBaseTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __51__CPSBaseTemplateViewController_setHostBackButton___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__CPSBaseTemplateViewController_setHostBackButton___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "associatedTemplate");
  objc_msgSend(v2, "setBackButton:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_updateLeadingBarButtons");
}

- (void)_updateLeadingBarButtons
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  CPTemplate *v8;
  id obj;
  uint64_t v10;
  id v11;
  CPSBarBackButtonItem *v12;
  id v13;
  CPTemplate *v14;
  id v15;
  id v16;
  UITapGestureRecognizer *v17;
  id v18;
  id v19;
  CPTemplate *v20;
  id v21;
  os_log_t oslog;
  id v23;
  _QWORD __b[8];
  uint64_t v25;
  CPSBarBackButtonItem *v26;
  id v27[2];
  CPSBaseTemplateViewController *v28;
  uint8_t v29[32];
  _BYTE v30[128];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v28 = self;
  v27[1] = (id)a2;
  v27[0] = (id)objc_opt_new();
  v19 = (id)-[CPSBaseTemplateViewController view](v28, "view");
  v18 = (id)objc_msgSend(v19, "window");
  v17 = -[CPSBaseTemplateViewController backGestureRecognizer](v28, "backGestureRecognizer");
  objc_msgSend(v18, "removeGestureRecognizer:");

  v20 = -[CPSBaseTemplateViewController associatedTemplate](v28, "associatedTemplate");
  v21 = (id)-[CPTemplate backButton](v20, "backButton");

  if (v21)
  {
    v11 = (id)-[CPSBaseTemplateViewController navigationItem](v28, "navigationItem");
    objc_msgSend(v11, "setHidesBackButton:", 1);

    v12 = [CPSBarBackButtonItem alloc];
    v14 = -[CPSBaseTemplateViewController associatedTemplate](v28, "associatedTemplate");
    v13 = (id)-[CPTemplate backButton](v14, "backButton");
    v26 = -[CPSBarBackButtonItem initWithCPBarButton:](v12, "initWithCPBarButton:");

    -[CPSBarBackButtonItem setAccessibilityIdentifier:](v26, "setAccessibilityIdentifier:", CFSTR("CPBackButton"));
    v16 = (id)CPUILocalizedStringForKey();
    v31[0] = v16;
    v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
    -[CPSBarBackButtonItem setAccessibilityUserInputLabels:](v26, "setAccessibilityUserInputLabels:");

    -[CPSBarButtonItem setDelegate:](v26, "setDelegate:", v28);
    objc_msgSend(v27[0], "addObject:", v26);
    -[CPSBaseTemplateViewController _addGestureRecognizerIfNecessary](v28, "_addGestureRecognizerIfNecessary");
    objc_storeStrong((id *)&v26, 0);
  }
  memset(__b, 0, sizeof(__b));
  v8 = -[CPSBaseTemplateViewController associatedTemplate](v28, "associatedTemplate");
  obj = (id)-[CPTemplate internalLeadingBarButtons](v8, "internalLeadingBarButtons");

  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v10)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v10;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v25 = *(_QWORD *)(__b[1] + 8 * v6);
      v23 = -[CPSBaseTemplateViewController _barButtonItemForBarButton:](v28, "_barButtonItemForBarButton:", v25);
      objc_msgSend(v27[0], "addObject:", v23);
      objc_storeStrong(&v23, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v7)
          break;
      }
    }
  }

  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v28, (uint64_t)v27[0]);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Updating leading bar buttons: %@", v29, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v2 = v27[0];
  v3 = (id)-[CPSBaseTemplateViewController navigationItem](v28, "navigationItem");
  objc_msgSend(v3, "setLeftBarButtonItems:", v2);

  -[CPSBaseTemplateViewController _updateBarButtonAXLabels](v28, "_updateBarButtonAXLabels");
  objc_storeStrong(v27, 0);
}

- (void)_updateTrailingBarButtons
{
  id v2;
  id v3;
  id v4;
  id v5;
  CPSTemplateEnvironment *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  CPTemplate *v12;
  id obj;
  uint64_t v14;
  os_log_t oslog;
  id v16;
  _QWORD __b[8];
  uint64_t v18;
  id v19[2];
  CPSBaseTemplateViewController *v20;
  uint8_t v21[24];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  v12 = -[CPSBaseTemplateViewController associatedTemplate](v20, "associatedTemplate");
  obj = (id)-[CPTemplate internalTrailingBarButtons](v12, "internalTrailingBarButtons");

  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
  if (v14)
  {
    v9 = *(_QWORD *)__b[2];
    v10 = 0;
    v11 = v14;
    while (1)
    {
      v8 = v10;
      if (*(_QWORD *)__b[2] != v9)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(__b[1] + 8 * v10);
      v16 = -[CPSBaseTemplateViewController _barButtonItemForBarButton:](v20, "_barButtonItemForBarButton:", v18);
      objc_msgSend(v19[0], "addObject:", v16);
      objc_storeStrong(&v16, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        v10 = 0;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
        if (!v11)
          break;
      }
    }
  }

  v6 = -[CPSBaseTemplateViewController templateEnvironment](v20, "templateEnvironment");
  v7 = 0;
  if (-[CPSTemplateEnvironment canBecomeNowPlayingApp](v6, "canBecomeNowPlayingApp"))
  {
    v7 = 0;
    if (-[CPSBaseTemplateViewController isNowPlayingApp](v20, "isNowPlayingApp"))
      v7 = -[CPSBaseTemplateViewController _wantsNowPlayingButton](v20, "_wantsNowPlayingButton");
  }

  if (v7)
  {
    v4 = v19[0];
    v5 = -[CPSBaseTemplateViewController _nowPlayingBarButtonItem](v20, "_nowPlayingBarButtonItem");
    objc_msgSend(v4, "insertObject:atIndex:");

  }
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)v20, (uint64_t)v19[0]);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Updating trailing bar buttons: %@", v21, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v2 = v19[0];
  v3 = (id)-[CPSBaseTemplateViewController navigationItem](v20, "navigationItem");
  objc_msgSend(v3, "setRightBarButtonItems:", v2);

  -[CPSBaseTemplateViewController _updateBarButtonAXLabels](v20, "_updateBarButtonAXLabels");
  objc_storeStrong(v19, 0);
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPSBaseTemplateViewController *v9;
  id v10;
  id location[2];
  CPSBaseTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __64__CPSBaseTemplateViewController_setLeadingNavigationBarButtons___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __64__CPSBaseTemplateViewController_setLeadingNavigationBarButtons___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "associatedTemplate");
  objc_msgSend(v2, "setInternalLeadingBarButtons:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_updateLeadingBarButtons");
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CPSBaseTemplateViewController *v9;
  id v10;
  id location[2];
  CPSBaseTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __65__CPSBaseTemplateViewController_setTrailingNavigationBarButtons___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __65__CPSBaseTemplateViewController_setTrailingNavigationBarButtons___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "associatedTemplate");
  objc_msgSend(v2, "setInternalTrailingBarButtons:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_updateTrailingBarButtons");
}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSBaseTemplateViewController *v11;
  id v12;
  BOOL v13;
  BOOL v14;
  id location[2];
  CPSBaseTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = a4;
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__CPSBaseTemplateViewController_setControl_enabled___block_invoke;
  v10 = &unk_24E270068;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSBaseTemplateViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  id v2[3];

  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_barButtonItemForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2[0], "setEnabled:", *(_BYTE *)(a1 + 48) & 1);
  objc_storeStrong(v2, 0);
}

- (void)setControl:(id)a3 selected:(BOOL)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)setBarButton:(id)a3 image:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSBaseTemplateViewController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSBaseTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__CPSBaseTemplateViewController_setBarButton_image___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSBaseTemplateViewController_setBarButton_image___block_invoke(uint64_t a1)
{
  id v2[3];

  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_barButtonItemForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2[0], "setImage:", *(_QWORD *)(a1 + 48));
  objc_storeStrong(v2, 0);
}

- (void)setBarButton:(id)a3 title:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSBaseTemplateViewController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSBaseTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__CPSBaseTemplateViewController_setBarButton_title___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSBaseTemplateViewController_setBarButton_title___block_invoke(uint64_t a1)
{
  id v2[3];

  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_barButtonItemForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2[0], "setTitle:", *(_QWORD *)(a1 + 48));
  objc_storeStrong(v2, 0);
}

- (void)_updateBarButtonAXLabels
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11[2];
  CPSBaseTemplateViewController *v12;

  v12 = self;
  v11[1] = (id)a2;
  v9 = (id)-[CPSBaseTemplateViewController navigationItem](self, "navigationItem");
  v10 = (id)objc_msgSend(v9, "leftBarButtonItems");
  if (v10)
    v2 = v10;
  else
    v2 = MEMORY[0x24BDBD1A8];
  v11[0] = v2;

  v6 = (id)-[CPSBaseTemplateViewController navigationItem](v12, "navigationItem");
  v7 = (id)objc_msgSend(v6, "rightBarButtonItems");
  v8 = (id)objc_msgSend(v7, "bs_reverse");
  if (v8)
    v5 = v8;
  else
    v5 = (id)MEMORY[0x24BDBD1A8];
  v3 = (id)objc_msgSend(v11[0], "arrayByAddingObjectsFromArray:", v5);
  v4 = v11[0];
  v11[0] = v3;

  objc_msgSend(v11[0], "enumerateObjectsUsingBlock:", &__block_literal_global_6);
  objc_storeStrong(v11, 0);
}

void __57__CPSBaseTemplateViewController__updateBarButtonAXLabels__block_invoke(void *a1, void *a2, unint64_t a3, void *a4)
{
  id v4;
  id v5;
  id v6;
  BOOL v10;
  id v11;
  id v12[3];
  unint64_t v13;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13 = a3;
  v12[2] = a4;
  v12[1] = a1;
  v12[0] = (id)objc_msgSend(location[0], "customView");
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (id)objc_msgSend(v12[0], "accessibilityLabel");
  v10 = v4 == 0;

  if (!v10)
  {
    v6 = (id)objc_msgSend(v12[0], "accessibilityLabel");
    objc_msgSend(v11, "addObject:");

  }
  if (v13 <= 3)
    __asm { BR              X8 }
  v5 = (id)objc_msgSend(v11, "copy");
  objc_msgSend(v12[0], "setAccessibilityUserInputLabels:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
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
  return self->_templateEnvironment;
}

- (BOOL)isPopping
{
  return self->_isPopping;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (void)setIsNowPlayingApp:(BOOL)a3
{
  self->_isNowPlayingApp = a3;
}

- (UITapGestureRecognizer)backGestureRecognizer
{
  return self->_backGestureRecognizer;
}

- (void)setBackGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_backGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_templateEnvironment, 0);
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_storeStrong((id *)&self->_templateDelegate, 0);
  objc_storeStrong((id *)&self->_associatedTemplate, 0);
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
}

@end
