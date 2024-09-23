@implementation HUSideBarWindowToolbarManager

+ (id)sharedToolbarManager
{
  return (id)sharedToolbarManager;
}

- (id)initForTest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUSideBarWindowToolbarManager;
  return -[HUSideBarWindowToolbarManager init](&v3, sel_init);
}

- (HUSideBarWindowToolbarManager)initWithAppNavigator:(id)a3
{
  id v5;
  HUSideBarWindowToolbarManager *v6;
  HUSideBarWindowToolbarManager *v7;
  void *v8;
  uint64_t v9;
  NSString *tabIdentifier;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HUSideBarWindowToolbarManager;
  v6 = -[HUSideBarWindowToolbarManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_appNavigator, a3);
    objc_msgSend(MEMORY[0x1E0D31838], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedHomeAppTabIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    tabIdentifier = v7->_tabIdentifier;
    v7->_tabIdentifier = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addHomeManagerObserver:", v7);

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addHomeObserver:", v7);

    objc_storeStrong((id *)&sharedToolbarManager, v7);
  }

  return v7;
}

- (id)currentHome
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D306D0]) & 1) != 0)
  {

  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = v5;
  objc_msgSend(v5, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setTabIdentifier:(id)a3
{
  BOOL v5;
  void *v6;
  HUDashboardContext *dashboardContext;
  void *v8;
  id v9;

  v9 = a3;
  v5 = -[NSString isEqualToString:](self->_tabIdentifier, "isEqualToString:", v9);
  v6 = v9;
  if (!v5)
  {
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D306D0]) & 1) == 0)
    {
      dashboardContext = self->_dashboardContext;
      self->_dashboardContext = 0;

    }
    objc_storeStrong((id *)&self->_tabIdentifier, a3);
    -[HUSideBarWindowToolbarManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetToolbar");

    v6 = v9;
  }

}

- (void)setDashboardContext:(id)a3
{
  NSArray *dashboardStatusItems;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[HUDashboardContext isEqual:](self->_dashboardContext, "isEqual:"))
  {
    dashboardStatusItems = self->_dashboardStatusItems;
    self->_dashboardStatusItems = 0;

    objc_storeStrong((id *)&self->_dashboardContext, a3);
    -[HUSideBarWindowToolbarManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetToolbar");

  }
}

- (void)setDashboardStatusItems:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[NSArray isEqual:](self->_dashboardStatusItems, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dashboardStatusItems, a3);
    -[HUSideBarWindowToolbarManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetToolbar");

  }
}

- (void)setDiscoverTabStyle:(unint64_t)a3
{
  id v3;

  if (self->_discoverTabStyle != a3)
  {
    self->_discoverTabStyle = a3;
    -[HUSideBarWindowToolbarManager delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetToolbar");

  }
}

- (void)setDiscoverTabPosition:(unint64_t)a3
{
  id v3;

  if (self->_discoverTabPosition != a3)
  {
    self->_discoverTabPosition = a3;
    -[HUSideBarWindowToolbarManager delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetToolbarTitleStyle");

  }
}

- (void)setViewStyle:(unint64_t)a3
{
  id v3;

  if (self->_viewStyle != a3)
  {
    self->_viewStyle = a3;
    -[HUSideBarWindowToolbarManager delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resetToolbar");

  }
}

- (id)itemIdentifiersForToolbar
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[HUSideBarWindowToolbarManager viewStyle](self, "viewStyle") == 1)
    return v3;
  -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overrideDashboardTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_6;
  }
  objc_msgSend(v3, "addObject:", CFSTR("DashboardTabBackButtonToolbarItemIdentifier"));
LABEL_6:
  -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D306C8]))
  {
    v9 = -[HUSideBarWindowToolbarManager discoverTabStyle](self, "discoverTabStyle");

    if (v9 == 2)
      objc_msgSend(v3, "addObject:", CFSTR("DiscoverTabBackButtonToolbarItemIdentifier"));
  }
  else
  {

  }
  -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D306D0];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D306D0]))
  {

  }
  else
  {
    -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D306D8]);

    if (!v13)
      goto LABEL_17;
  }
  -[HUSideBarWindowToolbarManager currentHome](self, "currentHome");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "hf_currentUserIsAdministrator") & 1) != 0)
  {
    -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hf_shouldBlockCurrentUserFromHome");

    if ((v17 & 1) == 0)
      objc_msgSend(v3, "addObject:", CFSTR("AddMenuToolbarItemIdentifier"));
  }
  else
  {

  }
LABEL_17:
  -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", v11);

  if (v19)
  {
    -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "room");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = CFSTR("RoomMenuToolbarItemIdentifier");
LABEL_22:
      objc_msgSend(v3, "addObject:", v22);
      return v3;
    }
    -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v22 = CFSTR("HomeMenuToolbarItemIdentifier");
      goto LABEL_22;
    }
  }
  return v3;
}

- (SEL)actionForToolbarItemIdentifier:(id)a3
{
  id v3;
  const char *v4;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("DiscoverTabBackButtonToolbarItemIdentifier")))
  {
    v4 = sel__discoverTabBackButton;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DashboardTabBackButtonToolbarItemIdentifier")))
  {
    v4 = sel__dashboardTabBackButton;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)imageForToolbarItemIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiscoverTabBackButtonToolbarItemIdentifier")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("DashboardTabBackButtonToolbarItemIdentifier")))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.left"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)navigationBarButtonForToolbarItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  void *v13;
  const char *v14;
  HUSideBarWindowToolbarManager *v15;
  objc_class *v16;
  HUSideBarWindowToolbarManager *v17;
  __int16 v19;
  __int16 v20;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HomeMenuToolbarItemIdentifier")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("RoomMenuToolbarItemIdentifier")))
  {
    -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        +[HUNavigationBarButton homeButtonWithOwner:](HUNavigationBarButton, "homeButtonWithOwner:", self);
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v12 = (void *)v8;
        goto LABEL_17;
      }
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        v12 = 0;
        goto LABEL_17;
      }
      v19 = 0;
      v10 = "stop home button creation due to no home found on dashboard context";
      v11 = (uint8_t *)&v19;
    }
    else
    {
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v20 = 0;
      v10 = "stop home button creation due to no dashboard context found";
      v11 = (uint8_t *)&v20;
    }
    _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("AddMenuToolbarItemIdentifier")))
  {
    +[HUNavigationBarButton addButtonWithOwner:](HUNavigationBarButton, "addButtonWithOwner:", self);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[HUSideBarWindowToolbarManager imageForToolbarItemIdentifier:](self, "imageForToolbarItemIdentifier:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUSideBarWindowToolbarManager actionForToolbarItemIdentifier:](self, "actionForToolbarItemIdentifier:", v4);
  if (v14)
    v15 = self;
  else
    v15 = 0;
  v16 = (objc_class *)MEMORY[0x1E0CEA380];
  v17 = v15;
  v12 = (void *)objc_msgSend([v16 alloc], "initWithImage:style:target:action:", v13, 0, v17, v14);

LABEL_17:
  return v12;
}

- (BOOL)shouldUseDarkWindowAppearance
{
  void *v2;
  char v3;

  -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D306D0]);

  return v3;
}

- (id)accessibilityLabelForToolbarItemIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeMenuToolbarItemIdentifier")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("RoomMenuToolbarItemIdentifier")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("AddMenuToolbarItemIdentifier")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DiscoverTabBackButtonToolbarItemIdentifier")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("DashboardTabBackButtonToolbarItemIdentifier")))
  {
    HFLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)windowTitle
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;

  if (-[HUSideBarWindowToolbarManager viewStyle](self, "viewStyle") == 1)
    return 0;
  -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D306D0]);

  if (v5)
  {
    -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "overrideDashboardTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "overrideDashboardTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "room");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      if (v16)
        objc_msgSend(v17, "room");
      else
        objc_msgSend(v17, "home");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "hf_displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    return v10;
  }
  -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D306D8]);

  if (!v12)
  {
    -[HUSideBarWindowToolbarManager tabIdentifier](self, "tabIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D306C8]))
    {
      v15 = -[HUSideBarWindowToolbarManager discoverTabStyle](self, "discoverTabStyle");

      if (!v15)
        goto LABEL_15;
    }
    else
    {

    }
    return 0;
  }
  -[HUSideBarWindowToolbarManager currentHome](self, "currentHome");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "hf_userCanCreateTrigger") & 1) == 0)
  {
    v18 = HFForceAllowAutomationCreation();

    if ((v18 & 1) != 0)
      goto LABEL_15;
    return 0;
  }

LABEL_15:
  HFLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (unint64_t)toolbarItemStyleForToolbarItemIdentifier:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeMenuToolbarItemIdentifier")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("RoomMenuToolbarItemIdentifier")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DiscoverTabBackButtonToolbarItemIdentifier")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DashboardTabBackButtonToolbarItemIdentifier"));
  }

  return v4;
}

- (void)_discoverTabBackButton
{
  void *v3;
  void *v4;
  id v5;

  -[HUSideBarWindowToolbarManager setDiscoverTabStyle:](self, "setDiscoverTabStyle:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0CD28D0]);
  objc_msgSend(v5, "setDuration:", 0.5);
  objc_msgSend(v5, "setType:", *MEMORY[0x1E0CD3188]);
  objc_msgSend(v5, "setSubtype:", *MEMORY[0x1E0CD3178]);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v3);

  objc_msgSend(v5, "setDelegate:", self);
  -[HUSideBarWindowToolbarManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerWithAnimation:", v5);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
    -[HUSideBarWindowToolbarManager setDiscoverTabStyle:](self, "setDiscoverTabStyle:", 0);
}

- (id)roomForNavigationBarButton:(id)a3
{
  void *v3;
  void *v4;

  -[HUSideBarWindowToolbarManager dashboardContext](self, "dashboardContext", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldIncludeRoomsInHomeMenu
{
  return 0;
}

- (id)statusItemsForNavigationBarButton:(id)a3 inHome:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  -[HUSideBarWindowToolbarManager dashboardStatusItems](self, "dashboardStatusItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

- (id)editActionDelegateForNavigationBarButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    objc_opt_class();
    -[HUSideBarWindowToolbarManager appNavigator](self, "appNavigator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_opt_class();
    objc_msgSend(v7, "selectedViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    -[HUSideBarWindowToolbarManager appNavigator](self, "appNavigator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rootViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v7 = v11;

    objc_opt_class();
    objc_msgSend(v7, "viewControllerForColumn:", 2);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v8;

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v4;

  -[HUSideBarWindowToolbarManager delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetToolbarItemMenuForItemIdentifier:", CFSTR("HomeMenuToolbarItemIdentifier"));

}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v4;

  -[HUSideBarWindowToolbarManager delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetToolbarItemMenuForItemIdentifier:", CFSTR("HomeMenuToolbarItemIdentifier"));

}

- (void)homeManagerDidUpdateCurrentHome:(id)a3
{
  id v3;

  -[HUSideBarWindowToolbarManager delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetToolbarItemMenuForItemIdentifier:", CFSTR("HomeMenuToolbarItemIdentifier"));

}

- (void)homeDidUpdateName:(id)a3
{
  void *v4;
  id v5;

  -[HUSideBarWindowToolbarManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetToolbarItemMenuForItemIdentifier:", CFSTR("HomeMenuToolbarItemIdentifier"));

  -[HUSideBarWindowToolbarManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetToolbarTitle");

}

- (void)homeManager:(id)a3 didUpdateStateForIncomingInvitations:(id)a4
{
  id v4;

  -[HUSideBarWindowToolbarManager delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetToolbarItemMenuForItemIdentifier:", CFSTR("HomeMenuToolbarItemIdentifier"));

}

- (void)home:(id)a3 didUpdateNameForRoom:(id)a4
{
  id v4;

  -[HUSideBarWindowToolbarManager delegate](self, "delegate", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetToolbarTitle");

}

- (NSString)tabIdentifier
{
  return self->_tabIdentifier;
}

- (HUDashboardContext)dashboardContext
{
  return self->_dashboardContext;
}

- (NSArray)dashboardStatusItems
{
  return self->_dashboardStatusItems;
}

- (unint64_t)discoverTabStyle
{
  return self->_discoverTabStyle;
}

- (unint64_t)discoverTabPosition
{
  return self->_discoverTabPosition;
}

- (unint64_t)viewStyle
{
  return self->_viewStyle;
}

- (HUSideBarWindowToolbarManagerDelegate)delegate
{
  return (HUSideBarWindowToolbarManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HOAppNavigator)appNavigator
{
  return self->_appNavigator;
}

- (void)setAppNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_appNavigator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNavigator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dashboardStatusItems, 0);
  objc_storeStrong((id *)&self->_dashboardContext, 0);
  objc_storeStrong((id *)&self->_tabIdentifier, 0);
}

@end
