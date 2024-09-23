@implementation AMUIPosterCategoryViewController

- (void)dealloc
{
  objc_super v3;

  -[AMUIPosterCategoryViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterCategoryViewController;
  -[AMUIPosterCategoryViewController dealloc](&v3, sel_dealloc);
}

- (void)setConfigurations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  void *v15;
  id v16;
  NSArray *v17;
  NSArray *configurations;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSArray *items;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSArray *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  AMUIPosterCategoryViewController *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AMUISwitcherViewController visibleItems](self->_posterSwitcherViewController, "visibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  -[NSArray bs_map:](self->_configurations, "bs_map:", &__block_literal_global_11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = (NSArray *)MEMORY[0x24BDBD1A8];
  if (v12)
    v15 = (void *)v12;
  else
    v15 = (void *)MEMORY[0x24BDBD1A8];
  v16 = v15;

  v17 = (NSArray *)objc_msgSend(v4, "copy");
  configurations = self->_configurations;
  self->_configurations = v17;

  -[NSArray bs_map:](self->_configurations, "bs_map:", &__block_literal_global_1);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v14;
  v22 = v21;

  objc_msgSend(v22, "differenceFromArray:withOptions:", v16, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v63, "hasChanges") & 1) != 0)
  {
    v59 = v22;
    v60 = v16;
    v61 = v11;
    v62 = v4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v24 = self->_configurations;
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v75 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v29, "serverUUID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v30);

        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
      }
      while (v26);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v64 = self;
    v32 = self->_items;
    v33 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v71;
      do
      {
        v36 = 0;
        do
        {
          if (*(_QWORD *)v71 != v35)
            objc_enumerationMutation(v32);
          v37 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v36);
          if (v37)
            v38 = *(void **)(v37 + 88);
          else
            v38 = 0;
          v39 = v38;
          objc_msgSend(v39, "serverUUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v37, v40);

          ++v36;
        }
        while (v34 != v36);
        v41 = -[NSArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        v34 = v41;
      }
      while (v41);
    }
    v65 = v23;

    if (v64->_items)
      items = v64->_items;
    else
      items = v14;
    v43 = (void *)-[NSArray mutableCopy](items, "mutableCopy");
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v44 = v63;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v67;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v67 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
          v50 = objc_msgSend(v49, "changeType");
          if (v50 == 1)
          {
            objc_msgSend(v43, "removeObjectAtIndex:", objc_msgSend(v49, "index"));
          }
          else if (!v50)
          {
            objc_msgSend(v49, "object");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "objectForKeyedSubscript:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v53)
            {
              +[AMUIPosterCategorySwitcherItem itemWithConfiguration:delegate:]((uint64_t)AMUIPosterCategorySwitcherItem, v52, v64);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v43, "insertObject:atIndex:", v53, objc_msgSend(v49, "index"));

          }
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      }
      while (v46);
    }

    v54 = objc_msgSend(v43, "copy");
    self = v64;
    v55 = v64->_items;
    v64->_items = (NSArray *)v54;

    -[AMUISwitcherViewController reload](v64->_posterSwitcherViewController, "reload");
    v11 = v61;
    v4 = v62;
    v16 = v60;
    v22 = v59;
  }
  if (-[NSArray count](self->_items, "count"))
  {
    v56 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_configurations, "objectAtIndexedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMUIPosterCategorySwitcherItem setConfiguration:]((uint64_t)v58, v57);

      ++v56;
    }
    while (v56 < -[NSArray count](self->_items, "count"));
  }
  if (v11)
    -[AMUISwitcherViewController scrollToIdentifier:animated:](self->_posterSwitcherViewController, "scrollToIdentifier:animated:", v11, 0);

}

uint64_t __54__AMUIPosterCategoryViewController_setConfigurations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serverUUID");
}

uint64_t __54__AMUIPosterCategoryViewController_setConfigurations___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serverUUID");
}

- (NSArray)visibleConfigurations
{
  void *v2;
  void *v3;

  -[AMUISwitcherViewController visibleItems](self->_posterSwitcherViewController, "visibleItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_5_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __57__AMUIPosterCategoryViewController_visibleConfigurations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
    v7 = (void *)v6[11];
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (PRSPosterConfiguration)mostVisibleConfiguration
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  _QWORD *v13;
  void *v14;
  PRSPosterConfiguration *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AMUISwitcherViewController visibleItems](self->_posterSwitcherViewController, "visibleItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v4)
  {

    v6 = 0;
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v18;
  v8 = 0.0;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      -[AMUISwitcherViewController presentationProgressForItem:](self->_posterSwitcherViewController, "presentationProgressForItem:", v10);
      if (v11 > v8)
      {
        v12 = v11;
        v13 = v10;

        v8 = v12;
        v6 = v13;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v5);

  if (!v6)
    goto LABEL_13;
  v14 = (void *)v6[11];
LABEL_14:
  v15 = v14;

  return v15;
}

- (UIView)contentView
{
  void *v3;
  UIView *contentWrapperView;
  UIView *v5;

  -[AMUISwitcherViewController visibleItems](self->_posterSwitcherViewController, "visibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
    contentWrapperView = self->_contentWrapperView;
  else
    contentWrapperView = 0;
  v5 = contentWrapperView;

  return v5;
}

- (UIView)backgroundView
{
  void *v3;
  void *posterSwitcherViewController;
  void *v5;

  -[AMUISwitcherViewController visibleItems](self->_posterSwitcherViewController, "visibleItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
    posterSwitcherViewController = self->_posterSwitcherViewController;
  else
    posterSwitcherViewController = self;
  objc_msgSend(posterSwitcherViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v5;
}

- (void)setDateProvider:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_dateProvider, a3);
  v5 = a3;
  -[AMUIDataLayerViewController setDateProvider:](self->_dataLayerViewController, "setDateProvider:", v5);
  -[AMUIInlineAuthenticationViewController setDateProvider:](self->_inlineAuthenticationViewController, "setDateProvider:", v5);

}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[AMUIDataLayerViewController cancelTouchesForCurrentEventInHostedContent](self->_dataLayerViewController, "cancelTouchesForCurrentEventInHostedContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_addInlineAuthenticationViewWithUnlockDestination:(id)a3
{
  id v4;
  AMUIInlineAuthenticationViewController *v5;
  AMUIInlineAuthenticationViewController *inlineAuthenticationViewController;
  AMUIInlineAuthenticationViewController *v7;
  void *v8;
  void *v9;
  AMUIInlineAuthenticationViewController *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  if (!self->_inlineAuthenticationViewController)
  {
    v5 = -[AMUIInlineAuthenticationViewController initWithUnlockDestination:]([AMUIInlineAuthenticationViewController alloc], "initWithUnlockDestination:", v4);
    inlineAuthenticationViewController = self->_inlineAuthenticationViewController;
    self->_inlineAuthenticationViewController = v5;

    -[AMUIInlineAuthenticationViewController setDelegate:](self->_inlineAuthenticationViewController, "setDelegate:", self);
    v7 = self->_inlineAuthenticationViewController;
    -[AMUIPosterCategoryViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterCategoryViewControllerAuthenticationHandler:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIInlineAuthenticationViewController setAuthenticationHandler:](v7, "setAuthenticationHandler:", v9);

    -[AMUIInlineAuthenticationViewController setDateProvider:](self->_inlineAuthenticationViewController, "setDateProvider:", self->_dateProvider);
    objc_initWeak(&location, self);
    v10 = self->_inlineAuthenticationViewController;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __86__AMUIPosterCategoryViewController__addInlineAuthenticationViewWithUnlockDestination___block_invoke;
    v11[3] = &unk_250764058;
    objc_copyWeak(&v12, &location);
    -[AMUIPosterCategoryViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", v10, 0, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __86__AMUIPosterCategoryViewController__addInlineAuthenticationViewWithUnlockDestination___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(void);

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[121], "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoresizingMask:", 18);
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bringSubviewToFront:", v5);

    objc_msgSend(v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutIfNeeded");

    objc_msgSend(v4, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "posterCategoryViewController:didSetInlineAuthenticationViewVisible:", v4, 1);

  }
  if (v9)
    v9[2]();

}

- (void)_dismissInlineAuthenticationViewAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  AMUIInlineAuthenticationViewController *inlineAuthenticationViewController;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  v6 = a4;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke;
  v18[3] = &unk_250764080;
  objc_copyWeak(&v20, &location);
  v8 = (void (**)(_QWORD))v6;
  v19 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x23B7EA970](v18);
  inlineAuthenticationViewController = self->_inlineAuthenticationViewController;
  if (inlineAuthenticationViewController)
  {
    -[AMUIInlineAuthenticationViewController view](inlineAuthenticationViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v4)
    {
      v13 = (void *)MEMORY[0x24BDF6F90];
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke_2;
      v16[3] = &unk_250763388;
      v17 = v11;
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke_3;
      v14[3] = &unk_250763330;
      v15 = v9;
      objc_msgSend(v13, "animateWithDuration:animations:completion:", v16, v14, 0.2);

    }
    else
    {
      v9[2](v9);
    }

  }
  else if (v8)
  {
    v8[2](v8);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bs_removeChildViewController:", WeakRetained[121]);
    v3 = (void *)v6[121];
    v6[121] = 0;

    objc_msgSend(v6, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "posterCategoryViewController:didSetInlineAuthenticationViewVisible:", v6, 0);

    WeakRetained = v6;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD *))(v5 + 16))(v5, WeakRetained);
    WeakRetained = v6;
  }

}

uint64_t __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateInlineAuthenticationViewLayout
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
  id v12;

  if (self->_inlineAuthenticationViewController)
  {
    -[AMUIPosterCategoryViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[AMUIInlineAuthenticationViewController view](self->_inlineAuthenticationViewController, "view");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  }
}

- (void)viewDidLoad
{
  AMUIPosterSwitcherSettings *v3;
  AMUIPosterSwitcherSettings *settings;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  AMUITouchPassthroughView *v14;
  UIView *contentWrapperView;
  AMUIDataLayerViewController *v16;
  AMUIDataLayerViewController *dataLayerViewController;
  void *v18;
  AMUISwitcherViewController *v19;
  AMUISwitcherViewController *posterSwitcherViewController;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AMUIPosterCategoryViewController;
  -[AMUIPosterCategoryViewController viewDidLoad](&v22, sel_viewDidLoad);
  +[AMUIPosterSwitcherDomain rootSettings](AMUIPosterSwitcherDomain, "rootSettings");
  v3 = (AMUIPosterSwitcherSettings *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  self->_settings = v3;

  -[AMUIPosterCategoryViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "setAutoresizingMask:", 0);
  v14 = -[AMUITouchPassthroughView initWithFrame:]([AMUITouchPassthroughView alloc], "initWithFrame:", v7, v9, v11, v13);
  contentWrapperView = self->_contentWrapperView;
  self->_contentWrapperView = &v14->super;

  -[UIView setAutoresizingMask:](self->_contentWrapperView, "setAutoresizingMask:", 18);
  objc_msgSend(v5, "addSubview:", self->_contentWrapperView);
  v16 = objc_alloc_init(AMUIDataLayerViewController);
  dataLayerViewController = self->_dataLayerViewController;
  self->_dataLayerViewController = v16;

  -[AMUIDataLayerViewController setChromeOrientationPolicy:](self->_dataLayerViewController, "setChromeOrientationPolicy:", 2);
  -[AMUIDataLayerViewController setDelegate:](self->_dataLayerViewController, "setDelegate:", self);
  -[AMUIDataLayerViewController setDateProvider:](self->_dataLayerViewController, "setDateProvider:", self->_dateProvider);
  -[AMUIDataLayerViewController view](self->_dataLayerViewController, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v18, "setAutoresizingMask:", 18);
  -[AMUIPosterCategoryViewController bs_addChildViewController:withSuperview:](self, "bs_addChildViewController:withSuperview:", self->_dataLayerViewController, self->_contentWrapperView);
  v19 = -[AMUISwitcherViewController initWithLayout:]([AMUISwitcherViewController alloc], "initWithLayout:", self);
  posterSwitcherViewController = self->_posterSwitcherViewController;
  self->_posterSwitcherViewController = v19;

  -[AMUISwitcherViewController setDataSource:](self->_posterSwitcherViewController, "setDataSource:", self);
  -[AMUISwitcherViewController setDelegate:](self->_posterSwitcherViewController, "setDelegate:", self);
  -[AMUISwitcherViewController view](self->_posterSwitcherViewController, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v21, "setAutoresizingMask:", 18);
  -[AMUIPosterCategoryViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_posterSwitcherViewController);
  objc_msgSend(v5, "bringSubviewToFront:", self->_contentWrapperView);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  AMUISwitcherViewController *posterSwitcherViewController;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMUIPosterCategoryViewController;
  -[AMUIPosterCategoryViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  posterSwitcherViewController = self->_posterSwitcherViewController;
  -[AMUISwitcherViewController visibleItems](posterSwitcherViewController, "visibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUISwitcherViewController scrollToItem:animated:](posterSwitcherViewController, "scrollToItem:animated:", v6, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterCategoryViewController;
  -[AMUIPosterCategoryViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[AMUIPosterCategoryViewController _dismissInlineAuthenticationViewAnimated:completion:](self, "_dismissInlineAuthenticationViewAnimated:completion:", 0, 0);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterCategoryViewController;
  -[AMUIPosterCategoryViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[AMUIPosterCategoryViewController _updateInlineAuthenticationViewLayout](self, "_updateInlineAuthenticationViewLayout");
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  AMUISwitcherViewController *posterSwitcherViewController;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[AMUIPosterCategoryViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  if (-[AMUISwitcherViewController isScrollingInteractively](self->_posterSwitcherViewController, "isScrollingInteractively"))
  {
    AMUILogSwitcher();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "serverUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_23600A000, v8, OS_LOG_TYPE_INFO, "vertical switcher ignoring update to %{public}@ due to interactive scroll", (uint8_t *)&v14, 0xCu);

    }
    v10 = 0;
  }
  else
  {
    -[AMUIDataLayerViewController updatePosterConfiguration:withAnimationSettings:](self->_dataLayerViewController, "updatePosterConfiguration:withAnimationSettings:", v6, v7);
    posterSwitcherViewController = self->_posterSwitcherViewController;
    objc_msgSend(v6, "serverUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AMUISwitcherViewController scrollToIdentifier:animated:](posterSwitcherViewController, "scrollToIdentifier:animated:", v12, v7 != 0);

  }
  return v10;
}

- (void)invalidate
{
  -[AMUIPosterCategoryViewController setConfigurations:](self, "setConfigurations:", MEMORY[0x24BDBD1A8]);
  -[AMUIDataLayerViewController invalidate](self->_dataLayerViewController, "invalidate");
  -[BSInvalidatable invalidate](self->_unsettledAssertion, "invalidate");
}

- (NSDictionary)activeConfigurationMetadata
{
  return -[AMUIDataLayerViewController activeConfigurationMetadata](self->_dataLayerViewController, "activeConfigurationMetadata");
}

- (void)noteAmbientViewControllingDelegateDidUpdate
{
  -[AMUIDataLayerViewController noteAmbientViewControllingDelegateDidUpdate](self->_dataLayerViewController, "noteAmbientViewControllingDelegateDidUpdate");
}

- (BOOL)handleDismiss
{
  return -[AMUIDataLayerViewController handleDismiss](self->_dataLayerViewController, "handleDismiss");
}

- (int64_t)switcherNumberOfItems:(id)a3
{
  return -[NSArray count](self->_items, "count", a3);
}

- (id)switcher:(id)a3 itemAtIndex:(int64_t)a4
{
  return -[NSArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", a4);
}

- (void)switcher:(id)a3 transitioningFromItem:(id)a4 toItem:(id)a5 progress:(double)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v8 = a4;
  v9 = a5;
  -[AMUIDataLayerViewController viewForOpacityAdjustment](self->_dataLayerViewController, "viewForOpacityAdjustment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v25 = v8;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v25;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  v14 = objc_opt_class();
  v15 = v9;
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  if (BSFloatLessThanFloat())
  {
    v18 = v13;
    if (!v13)
    {
LABEL_13:
      v19 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = v17;
    if (!v17)
      goto LABEL_13;
  }
  v19 = v18[11];
LABEL_16:
  -[AMUIDataLayerViewController updatePosterConfiguration:withAnimationSettings:](self->_dataLayerViewController, "updatePosterConfiguration:withAnimationSettings:", v19, 0);
  -[AMUIPosterCategorySwitcherItem posterViewController](v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIPosterCategoryViewController _currentAppearanceTransitionCoordinator](self, "_currentAppearanceTransitionCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAppearanceTransitionCoordinator:", v21);

  -[AMUIPosterCategorySwitcherItem posterViewController](v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIPosterCategoryViewController _currentAppearanceTransitionCoordinator](self, "_currentAppearanceTransitionCoordinator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAppearanceTransitionCoordinator:", v23);

  -[AMUIDataLayerViewController viewForOpacityAdjustment](self->_dataLayerViewController, "viewForOpacityAdjustment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 != v10)
    objc_msgSend(v10, "setAlpha:", 1.0);

}

- (void)switcher:(id)a3 transitionDidBegin:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;

  v21 = a4;
  objc_msgSend(v21, "fromItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v21, "toItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  -[AMUIPosterCategorySwitcherItem posterViewController](v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIPosterCategoryViewController _currentAppearanceTransitionCoordinator](self, "_currentAppearanceTransitionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAppearanceTransitionCoordinator:", v16);

  -[AMUIPosterCategorySwitcherItem posterViewController](v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUIPosterCategoryViewController _currentAppearanceTransitionCoordinator](self, "_currentAppearanceTransitionCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAppearanceTransitionCoordinator:", v18);

  -[AMUIPosterCategorySwitcherItem noteTransitionDidBegin](v9);
  -[AMUIPosterCategorySwitcherItem noteTransitionDidBegin](v14);
  if (-[AMUIDataLayerViewController currentDataLayout](self->_dataLayerViewController, "currentDataLayout") == 1
    && v9
    && v14)
  {
    v19 = objc_msgSend(v21, "direction");
    v20 = v19 != 1;
    *((_BYTE *)v9 + 80) = 1;
    *((_BYTE *)v9 + 81) = v19 == 1;
    objc_msgSend(v9, "_updateTitleLabelVisibility");
    *((_BYTE *)v14 + 80) = 1;
    *((_BYTE *)v14 + 81) = v20;
    objc_msgSend(v14, "_updateTitleLabelVisibility");
  }

}

- (void)switcher:(id)a3 transitionDidUpdate:(id)a4 withProgress:(double)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  AMUIPosterSwitcherSettings *settings;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;

  v7 = a4;
  objc_msgSend(v7, "fromItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v7, "toItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = v13;
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  v18 = objc_msgSend(v7, "direction");
  if (-[AMUIPosterSwitcherSettings exitingCardBehaviorScaleDownOnly](self->_settings, "exitingCardBehaviorScaleDownOnly"))
  {
    -[AMUIPosterSwitcherSettings verticalScootch](self->_settings, "verticalScootch");
    if ((BSFloatIsZero() & 1) == 0)
    {
      memset(&v50, 0, sizeof(v50));
      objc_msgSend(v12, "itemView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        objc_msgSend(v19, "transform");
      else
        memset(&v50, 0, sizeof(v50));

      memset(&v49, 0, sizeof(v49));
      objc_msgSend(v17, "itemView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
        objc_msgSend(v21, "transform");
      else
        memset(&v49, 0, sizeof(v49));

      -[AMUIPosterSwitcherSettings verticalScootch](self->_settings, "verticalScootch");
      BSFloatByLinearlyInterpolatingFloats();
      v47 = v50;
      CGAffineTransformTranslate(&v48, &v47, 0.0, v23);
      v50 = v48;
      -[AMUIPosterSwitcherSettings verticalScootch](self->_settings, "verticalScootch");
      BSFloatByLinearlyInterpolatingFloats();
      v47 = v49;
      CGAffineTransformTranslate(&v48, &v47, 0.0, v24);
      v49 = v48;
      objc_msgSend(v12, "itemView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v50;
      objc_msgSend(v25, "setTransform:", &v48);

      objc_msgSend(v17, "itemView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v49;
      objc_msgSend(v26, "setTransform:", &v48);

    }
  }
  if (-[AMUIDataLayerViewController currentDataLayout](self->_dataLayerViewController, "currentDataLayout") == 1
    && v12
    && v17)
  {
    settings = self->_settings;
    if (v18)
    {
      -[AMUIPosterSwitcherSettings reverseTimeFadeoutTargetProgress](settings, "reverseTimeFadeoutTargetProgress");
      v29 = v28;
      -[AMUIPosterSwitcherSettings forwardTimeFadeoutTargetProgress](self->_settings, "forwardTimeFadeoutTargetProgress");
    }
    else
    {
      -[AMUIPosterSwitcherSettings forwardTimeFadeoutTargetProgress](settings, "forwardTimeFadeoutTargetProgress");
      v29 = v31;
      -[AMUIPosterSwitcherSettings reverseTimeFadeoutTargetProgress](self->_settings, "reverseTimeFadeoutTargetProgress");
    }
    if (v29 <= a5)
    {
      v33 = 1.0 - v30;
      v32 = 0.0;
      if (v33 < a5)
        v32 = (a5 - v33) / (1.0 - v33) + 0.0;
    }
    else
    {
      v32 = 1.0 - a5 / v29;
    }
    -[AMUIDataLayerViewController viewForOpacityAdjustment](self->_dataLayerViewController, "viewForOpacityAdjustment");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAlpha:", v32);

    -[AMUIPosterSwitcherSettings chromeFadeoutTargetProgress](self->_settings, "chromeFadeoutTargetProgress");
    v36 = 1.0 - v35;
    v37 = 0.0;
    v38 = 0.0;
    if (v35 > a5)
      v38 = 1.0 - a5 / v35;
    if (v36 < a5)
      v37 = (a5 - v36) / (1.0 - v36) + 0.0;
    -[AMUIPosterCategorySwitcherItem posterViewController](v12);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setAppearanceTransitionProgress:", v38);

    -[AMUIPosterCategorySwitcherItem posterViewController](v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAppearanceTransitionProgress:", v37);

    -[AMUIPosterSwitcherSettings labelFadeinTargetProgress](self->_settings, "labelFadeinTargetProgress");
    v42 = 1.0;
    v43 = 1.0 - v41;
    v44 = 1.0;
    if (v41 > a5)
      v44 = a5 / v41 + 0.0;
    if (v43 < a5)
      v42 = 1.0 - (a5 - v43) / (1.0 - v43);
    -[AMUIPosterCategorySwitcherItem titleLabelView]((id *)v12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAlpha:", v44);

    -[AMUIPosterCategorySwitcherItem titleLabelView]((id *)v17);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAlpha:", v42);

  }
}

- (void)switcher:(id)a3 transitionDidEnd:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _WORD *v13;
  _WORD *v14;

  v4 = a4;
  objc_msgSend(v4, "fromItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v14 = v8;

  objc_msgSend(v4, "toItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  if (v14)
  {
    v14[40] = 0;
    objc_msgSend(v14, "_updateTitleLabelVisibility");
  }
  if (v13)
  {
    v13[40] = 0;
    objc_msgSend(v13, "_updateTitleLabelVisibility");
  }

}

- (void)switcher:(id)a3 didSettleOnItem:(id)a4 interactive:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;

  v5 = a5;
  v7 = a4;
  v8 = objc_opt_class();
  v12 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v12;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  if (v10)
  {
    -[AMUIPosterCategoryViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "posterCategoryViewController:didSettleOnConfiguration:interactive:", self, v10[11], v5);

  }
}

- (int64_t)switcherAxis
{
  return 1;
}

- (BOOL)isCircular
{
  return -[AMUIPosterSwitcherSettings verticalSwitcherCircular](self->_settings, "verticalSwitcherCircular");
}

- (double)spacing
{
  return 0.0;
}

- (void)switcher:(id)a3 updateItem:(id)a4 view:(id)a5 forPresentationProgress:(double)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  BSInvalidatable *v17;
  BSInvalidatable *unsettledAssertion;
  double v19;
  double v20;
  double v21;
  AMUIPosterSwitcherSettings *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  double v28;
  id v29;
  id v30;
  id v31;
  AMUIPosterSwitcherSettings *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  AMUIPosterSwitcherSettings *v36;
  id v37;
  id v38;
  double v39;
  double v40;
  double v41;
  _QWORD v42[4];
  id v43;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[AMUIPosterSwitcherSettings exitingCardBehaviorScaleDownOnly](self->_settings, "exitingCardBehaviorScaleDownOnly");
  -[AMUIPosterCategoryViewController _unsettledSentinel](self, "_unsettledSentinel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMUICountingSentinel increment](v14, v15);
  v16 = MEMORY[0x24BDAC760];
  if (!self->_unsettledAssertion)
  {
    -[AMUISwitcherViewController acquireUnsettledAssertionForReason:](self->_posterSwitcherViewController, "acquireUnsettledAssertionForReason:", CFSTR("categorySwitcherTransition"));
    v17 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    unsettledAssertion = self->_unsettledAssertion;
    self->_unsettledAssertion = v17;

    objc_initWeak(location, self);
    v42[0] = v16;
    v42[1] = 3221225472;
    v42[2] = __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke;
    v42[3] = &unk_2507633B0;
    objc_copyWeak(&v43, location);
    -[AMUICountingSentinel performWhenCountAtZero:]((uint64_t)v14, v42);
    objc_destroyWeak(&v43);
    objc_destroyWeak(location);
  }
  v19 = fabs(a6 + -0.5);
  v20 = v19 + v19;
  if (v13)
    v21 = a6;
  else
    v21 = v20;
  v22 = self->_settings;
  location[0] = 0;
  v41 = 0.0;
  -[AMUIPosterSwitcherSettings verticalScaleDampingRatio](v22, "verticalScaleDampingRatio");
  v24 = v23;
  -[AMUIPosterSwitcherSettings verticalScaleResponse](v22, "verticalScaleResponse");
  AMUIConvertSpringDampingRatioAndResponseToTensionAndFriction((double *)location, &v41, v24, v25);
  v26 = (void *)MEMORY[0x24BDF6F90];
  v27 = location[0];
  v28 = v41;
  v35[0] = v16;
  v35[1] = 3221225472;
  v35[2] = __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_2;
  v35[3] = &unk_2507640A8;
  v36 = v22;
  v37 = v12;
  v38 = v11;
  v39 = v21;
  v40 = a6;
  v33[0] = v16;
  v33[1] = 3221225472;
  v33[2] = __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_3;
  v33[3] = &unk_250763610;
  v34 = v14;
  v29 = v14;
  v30 = v11;
  v31 = v12;
  v32 = v22;
  objc_msgSend(v26, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 1, v35, v33, *(double *)&v27, v28);

}

void __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[130], "invalidate");
    v2 = v3[130];
    v3[130] = 0;

    WeakRetained = v3;
  }

}

void __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  CGAffineTransform v12;

  objc_msgSend(*(id *)(a1 + 32), "verticalExitingCardTargetScale");
  BSFloatByLinearlyInterpolatingFloats();
  v2 = *(void **)(a1 + 40);
  CGAffineTransformMakeScale(&v12, v3, v3);
  objc_msgSend(v2, "setTransform:", &v12);
  v4 = *(void **)(a1 + 48);
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[AMUIPosterCategorySwitcherItem posterView](v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v10 = *(void **)(a1 + 40);
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "exitingCardTargetOpacity");
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v11, "setAlpha:");

}

void *__85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_3(uint64_t a1, const char *a2)
{
  return -[AMUICountingSentinel decrement](*(void **)(a1 + 32), a2);
}

- (void)posterCategorySwitcherItem:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6
{
  -[AMUIDataLayerViewController setChromeVisibility:withAnimationSettings:animationFence:](self->_dataLayerViewController, "setChromeVisibility:withAnimationSettings:animationFence:", a4, a5, a6);
}

- (id)posterCategorySwitcherItemPrototypeSettings:(id)a3
{
  return self->_settings;
}

- (id)posterCategorySwitcherItemRequestInstanceIdentifier:(id)a3 preferring:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *availableInstanceIdentifiers;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
  if (availableInstanceIdentifiers)
  {
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    +[AMUIPosterViewController suggestedInstanceIdentifiers](AMUIPosterViewController, "suggestedInstanceIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
    v11 = self->_availableInstanceIdentifiers;
    self->_availableInstanceIdentifiers = v10;

    availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
    if (!v7)
      goto LABEL_8;
  }
  if ((-[NSMutableArray containsObject:](availableInstanceIdentifiers, "containsObject:", v7) & 1) != 0)
  {
    v12 = v7;
    -[NSMutableArray removeObject:](self->_availableInstanceIdentifiers, "removeObject:", v12);
    goto LABEL_10;
  }
  availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
LABEL_8:
  -[NSMutableArray lastObject](availableInstanceIdentifiers, "lastObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_availableInstanceIdentifiers, "removeLastObject");
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v12;
}

- (void)posterCategorySwitcherItem:(id)a3 relinquishInstanceIdentifier:(id)a4
{
  id v5;
  NSMutableArray *availableInstanceIdentifiers;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  v5 = a4;
  availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
  v10 = v5;
  if (!availableInstanceIdentifiers)
  {
    +[AMUIPosterViewController suggestedInstanceIdentifiers](AMUIPosterViewController, "suggestedInstanceIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSMutableArray *)objc_msgSend(v7, "mutableCopy");
    v9 = self->_availableInstanceIdentifiers;
    self->_availableInstanceIdentifiers = v8;

    v5 = v10;
    availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
  }
  -[NSMutableArray addObject:](availableInstanceIdentifiers, "addObject:", v5);

}

- (BOOL)posterCategorySwitcherItemIsAuthenticated:(id)a3
{
  AMUIPosterCategoryViewController *v3;
  void *v4;

  v3 = self;
  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "posterCategoryViewControllerIsAuthenticated:", v3);

  return (char)v3;
}

- (void)posterCategorySwitcherItem:(id)a3 didRequestInlineAuthenticationWithUnlockDestination:(id)a4
{
  -[AMUIPosterCategoryViewController _addInlineAuthenticationViewWithUnlockDestination:](self, "_addInlineAuthenticationViewWithUnlockDestination:", a4);
}

- (BOOL)posterCategorySwitcherItemHasInlineAuthenticated:(id)a3
{
  AMUIPosterCategoryViewController *v3;
  void *v4;

  v3 = self;
  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "posterCategoryViewControllerHasInlineAuthenticated:", v3);

  return (char)v3;
}

- (id)createUnlockRequestForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createUnlockRequestForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[AMUIPosterCategoryViewController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestUnlockForViewController:withRequest:completion:", self, v8, v7);

}

- (void)viewControllerWillBeginConfiguration:(id)a3
{
  id v4;

  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWillBeginConfiguration:", self);

}

- (void)viewControllerWillEndConfiguration:(id)a3
{
  id v4;

  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerWillEndConfiguration:", self);

}

- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[AMUIPosterCategoryViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didUpdateActiveConfigurationMetadata:", self, v5);

}

- (id)widgetHostManagerForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetHostManagerForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ambientDefaultsForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientDefaultsForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultWidgetDescriptorStacksForViewController:(id)a3
{
  void *v4;
  void *v5;

  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultWidgetDescriptorStacksForViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMUIPosterCategoryViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerWillBeginShowingTemporaryOverlay:", v4);

}

- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMUIPosterCategoryViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerWillEndShowingTemporaryOverlay:", v4);

}

- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[AMUIPosterCategoryViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "viewController:isApplicationVisibleWithBundleIdentifier:", v7, v6);

  return v9;
}

- (id)_currentAppearanceTransitionCoordinator
{
  AMUIPosterAppearanceTransitionCoordinator *photosCoordinator;
  AMUIPosterPhotosAppearanceTransitionCoordinator *v4;
  AMUIPosterAppearanceTransitionCoordinator *v5;
  AMUIPosterAppearanceTransitionCoordinator *v6;

  if (-[AMUIDataLayerViewController currentDataLayout](self->_dataLayerViewController, "currentDataLayout") == 1)
  {
    photosCoordinator = self->_photosCoordinator;
    if (!photosCoordinator)
    {
      v4 = objc_alloc_init(AMUIPosterPhotosAppearanceTransitionCoordinator);
      v5 = self->_photosCoordinator;
      self->_photosCoordinator = &v4->super;

      photosCoordinator = self->_photosCoordinator;
    }
    v6 = photosCoordinator;
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_unsettledSentinel
{
  AMUICountingSentinel *lazy_unsettledSentinel;
  AMUICountingSentinel *v4;
  AMUICountingSentinel *v5;

  lazy_unsettledSentinel = self->_lazy_unsettledSentinel;
  if (!lazy_unsettledSentinel)
  {
    v4 = objc_alloc_init(AMUICountingSentinel);
    v5 = self->_lazy_unsettledSentinel;
    self->_lazy_unsettledSentinel = v4;

    lazy_unsettledSentinel = self->_lazy_unsettledSentinel;
  }
  return lazy_unsettledSentinel;
}

- (void)authenticationViewController:(id)a3 didAuthenticateWithSuccess:(BOOL)a4
{
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AMUIPosterCategoryViewController *v9;

  if (a4)
  {
    -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "posterCategoryViewControllerDidSuccessfulyCompleteInlineAuthentication:", self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __92__AMUIPosterCategoryViewController_authenticationViewController_didAuthenticateWithSuccess___block_invoke;
    v7[3] = &unk_250763400;
    v8 = v5;
    v9 = self;
    v6 = v5;
    -[AMUIPosterCategoryViewController _dismissInlineAuthenticationViewAnimated:completion:](self, "_dismissInlineAuthenticationViewAnimated:completion:", 1, v7);

  }
}

uint64_t __92__AMUIPosterCategoryViewController_authenticationViewController_didAuthenticateWithSuccess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "posterCategoryViewController:didSetPasscodeVisible:", *(_QWORD *)(a1 + 40), 0);
}

- (void)authenticationViewController:(id)a3 setDidSetPasscodeVisible:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterCategoryViewController:didSetPasscodeVisible:", self, v4);

}

- (void)authenticationViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterCategoryViewController:didSetBiometricAuthenticationDisabled:", self, v4);

}

- (BOOL)authenticationViewControllerWantsBiometricAuthenticationBlocked:(id)a3
{
  AMUIPosterCategoryViewController *v3;
  void *v4;

  v3 = self;
  -[AMUIPosterCategoryViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "posterCategoryViewController:wantsBiometricAuthenticationBlockedForDeepUserInteraction:", v3, 0);

  return (char)v3;
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (AMUIPosterCategoryViewControllerDelegate)delegate
{
  return (AMUIPosterCategoryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_unsettledAssertion, 0);
  objc_storeStrong((id *)&self->_lazy_unsettledSentinel, 0);
  objc_storeStrong((id *)&self->_photosCoordinator, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_availableInstanceIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dataLayerViewController, 0);
  objc_storeStrong((id *)&self->_posterSwitcherViewController, 0);
  objc_storeStrong((id *)&self->_inlineAuthenticationViewController, 0);
}

@end
