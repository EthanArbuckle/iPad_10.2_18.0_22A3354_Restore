@implementation AXUISettingsSetupCapableListController

- (AXUISettingsSetupCapableListController)init
{
  AXUISettingsSetupCapableListController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsSetupCapableListController;
  v2 = -[AXUISettingsSetupCapableListController init](&v4, sel_init);
  if (v2)
    -[AXUISettingsSetupCapableListController setInSetup:](v2, "setInSetup:", AXProcessIsSetup());
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  AXUISettingsCleanUpWelcomeControllerTableViewObservations(self);
  v3.receiver = self;
  v3.super_class = (Class)AXUISettingsSetupCapableListController;
  -[AXUISettingsSetupCapableListController dealloc](&v3, sel_dealloc);
}

- (AXUISettingsSetupCapableListController)initWithNibName:(id)a3 bundle:(id)a4
{
  AXUISettingsSetupCapableListController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsSetupCapableListController;
  v4 = -[AXUISettingsSetupCapableListController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
    -[AXUISettingsSetupCapableListController setInSetup:](v4, "setInSetup:", AXProcessIsSetup());
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXUISettingsSetupCapableListController;
  -[AXUISettingsSetupCapableListController viewDidLoad](&v10, sel_viewDidLoad);
  if (self->_inSetup)
  {
    sharedBFFStyle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUISettingsSetupCapableListController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    sharedBFFStyle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "setBackgroundColor:", v7);

    -[AXUISettingsSetupCapableListController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", 1);

    -[AXUISettingsSetupCapableListController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", 1);
    -[AXUISettingsSetupCapableListController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 1);
  }
}

- (void)reload
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = *MEMORY[0x1E0D80700];
    v8 = MEMORY[0x1E0C9AAB0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setObject:forKeyedSubscript:", v8, v7);
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)AXUISettingsSetupCapableListController;
  -[AXUISettingsSetupCapableListController reload](&v10, sel_reload);
}

- (void)filterBuddy:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[AXUISettingsSetupCapableListController inSetup](self, "inSetup"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "propertyForKey:", CFSTR("inBuddySetup"), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "BOOLValue");

          if ((v13 & 1) == 0)
            objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v6, "removeObjectsInArray:", v5);
  }

}

- (void)setAllSpecifiersUnsearchable:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = *MEMORY[0x1E0D80918];
    v8 = MEMORY[0x1E0C9AAA0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setProperty:forKey:", v8, v7);
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)setupLongTitleSpecifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = *MEMORY[0x1E0D80780];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "cellType") != 6
          || (objc_msgSend(v9, "objectForKeyedSubscript:", v7),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              v10,
              v10))
        {
          if (objc_msgSend(v9, "cellType") != 2
            && objc_msgSend(v9, "cellType") != 1
            && objc_msgSend(v9, "cellType") != 4)
          {
            continue;
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            continue;
        }
        objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), v7);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (id)createWelcomeControllerWithAXSettingsController:(id)a3 title:(id)a4
{
  return AXUISettingsCreateWelcomeController(self, a3, a4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((AXUISettingsHandleWelcomeControllerTableViewUpdate(self, v10, v11) & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)AXUISettingsSetupCapableListController;
    -[AXUISettingsSetupCapableListController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  AXUISettingsSetupCapableListController *v16;
  AXUISettingsSetupCapableListController *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v8 = -[AXUISettingsSetupCapableListController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    if ((-[AXUISettingsSetupCapableListController isShowingSetupController](self, "isShowingSetupController") & 1) == 0)
    {
      if (-[AXUISettingsSetupCapableListController inSetup](self, "inSetup"))
      {
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "objectAtIndex:", v9);
        v10 = (char *)objc_claimAutoreleasedReturnValue();
        if (*(_QWORD *)&v10[*MEMORY[0x1E0D805B0]] != 2)
        {
          v11 = 0;
LABEL_22:

          goto LABEL_12;
        }
        -[AXUISettingsSetupCapableListController selectSpecifier:](self, "selectSpecifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
LABEL_19:
          if (objc_msgSend(v10, "controllerLoadAction"))
          {
            objc_msgSend(v6, "indexPathForSelectedRow");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v22, 1);
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v11;
        if (v11 != (void *)v12)
        {
          v14 = (void *)v12;
          -[AXUISettingsSetupCapableListController navigationController](self, "navigationController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "topViewController");
          v16 = (AXUISettingsSetupCapableListController *)objc_claimAutoreleasedReturnValue();
          if (v16 == self)
          {
            v20 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EF551F50);

            if ((v20 & 1) != 0)
              goto LABEL_19;
            goto LABEL_16;
          }
          v17 = v16;
          -[AXUISettingsSetupCapableListController navigationController](self, "navigationController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "topViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "childViewControllers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "containsObject:", self))
          {
            v23 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EF551F50);

            if ((v23 & 1) != 0)
              goto LABEL_19;
LABEL_16:
            objc_msgSend(v10, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXUISettingsSetupCapableListController createWelcomeControllerWithAXSettingsController:title:](self, "createWelcomeControllerWithAXSettingsController:title:", v11, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            -[AXUISettingsSetupCapableListController showController:](self, "showController:", v22);
LABEL_21:

            goto LABEL_13;
          }

          v13 = v14;
        }

        goto LABEL_19;
      }
    }
  }
  v11 = 0;
LABEL_12:
  v25.receiver = self;
  v25.super_class = (Class)AXUISettingsSetupCapableListController;
  -[AXUISettingsSetupCapableListController tableView:didSelectRowAtIndexPath:](&v25, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
LABEL_13:

}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  char v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  if (!objc_msgSend(v6, "conformsToProtocol:", &unk_1EF551F50)
    || (v7 = v6,
        objc_msgSend(v7, "setSetupMode:", -[AXUISettingsSetupCapableListController inSetup](self, "inSetup")),
        v8 = objc_msgSend(v7, "presentWithController:", self),
        v7,
        (v8 & 1) == 0))
  {
    v9.receiver = self;
    v9.super_class = (Class)AXUISettingsSetupCapableListController;
    -[AXUISettingsSetupCapableListController showController:animate:](&v9, sel_showController_animate_, v6, v4);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXUISettingsSetupCapableListController;
  -[AXUISettingsSetupCapableListController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  if (-[AXUISettingsSetupCapableListController inSetup](self, "inSetup"))
  {
    -[AXUISettingsSetupCapableListController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "setFrame:", v5, v7, v9, v11);
    AXPerformSafeBlock();
  }
}

uint64_t __63__AXUISettingsSetupCapableListController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSectionContentInsetWithAnimation:", 0);
}

- (BOOL)inSetup
{
  return self->_inSetup;
}

- (void)setInSetup:(BOOL)a3
{
  self->_inSetup = a3;
}

@end
