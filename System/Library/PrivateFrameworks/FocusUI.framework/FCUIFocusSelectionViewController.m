@implementation FCUIFocusSelectionViewController

+ (id)selectionControllerWithSelectedActivityIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v7;
  id v8;
  id v9;
  FCUIFocusSelectionViewController *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[FCUIFocusSelectionViewController initWithSelectedActivityIdentifier:title:subtitle:]([FCUIFocusSelectionViewController alloc], "initWithSelectedActivityIdentifier:title:subtitle:", v9, v8, v7);

  return v10;
}

- (FCUIFocusSelectionViewController)initWithSelectedActivityIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  void *v7;
  id v9;
  id v10;
  id v11;
  FCUIFocusSelectionViewController *v12;
  uint64_t v13;
  FCActivityManager *activityManager;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FCUIFocusSelectionViewController;
  v12 = -[FCUIFocusSelectionViewController init](&v18, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE37EB8], "sharedActivityManager");
    v13 = objc_claimAutoreleasedReturnValue();
    activityManager = v12->_activityManager;
    v12->_activityManager = (FCActivityManager *)v13;

    -[FCActivityManager addObserver:](v12->_activityManager, "addObserver:", v12);
    objc_storeStrong((id *)&v12->_selectedActivityIdentifier, v7);
    if (v10)
    {
      -[FCUIFocusSelectionViewController setTitle:](v12, "setTitle:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FOCUS_SELECTOR_TITLE"), &stru_24D20B520, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCUIFocusSelectionViewController setTitle:](v12, "setTitle:", v15);

    }
    v16 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FOCUS_SELECTOR_HEADLINE"), &stru_24D20B520, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_subtitle, v16);
    if (!v11)
    {

    }
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  MTMaterialView *v14;
  MTMaterialView *backgroundMaterialView;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  FCUIActivityListView *v25;
  FCUIActivityListView *activityListView;
  objc_super v27;
  CGRect v28;

  v27.receiver = self;
  v27.super_class = (Class)FCUIFocusSelectionViewController;
  -[FCUIFocusSelectionViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[FCUIFocusSelectionViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setManualScrollEdgeAppearanceProgress:", 0.0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__closeButtonTapped_);
  objc_msgSend(v3, "setRightBarButtonItem:", v4);
  -[FCUIFocusSelectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:", 54);
  v14 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  backgroundMaterialView = self->_backgroundMaterialView;
  self->_backgroundMaterialView = v14;

  -[MTMaterialView setFrame:](self->_backgroundMaterialView, "setFrame:", v7, v9, v11, v13);
  objc_msgSend(v5, "addSubview:", self->_backgroundMaterialView);
  -[MTMaterialView setAutoresizingMask:](self->_backgroundMaterialView, "setAutoresizingMask:", 18);
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  CGRectInset(v28, 45.0, 0.0);
  -[FCUIFocusSelectionViewController traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayScale");
  UIRectRoundToScale();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = -[FCUIActivityListView initWithFrame:]([FCUIActivityListView alloc], "initWithFrame:", v18, v20, v22, v24);
  activityListView = self->_activityListView;
  self->_activityListView = v25;

  -[FCUIActivityListView setFooterPinnedToBottom:](self->_activityListView, "setFooterPinnedToBottom:", 0);
  -[FCUIActivityListView setDelegate:](self->_activityListView, "setDelegate:", self);
  objc_msgSend(v5, "addSubview:", self->_activityListView);
  -[FCUIActivityListView setAutoresizingMask:](self->_activityListView, "setAutoresizingMask:", 18);
  -[FCUIFocusSelectionViewController _configureActivityListView](self, "_configureActivityListView");

}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(MEMORY[0x24BEBDB00], "_isInAnimationBlock") & 1) == 0)
  {
    objc_msgSend(v9, "adjustedContentInset");
    v5 = v4;
    objc_msgSend(v9, "contentOffset");
    v7 = fmin(fmax((v5 + v6) * 0.0625, 0.0), 1.0);
    -[FCUIFocusSelectionViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setManualScrollEdgeAppearanceProgress:", v7);

  }
}

- (void)_setSelectedControl:(id)a3
{
  int v4;
  FCUIActivityControl *v5;
  int v6;
  uint64_t v7;
  id *p_selectedControl;
  FCUIActivityControl *selectedControl;
  id v10;
  NSString *selectedActivityIdentifier;
  void *v12;
  FCUIActivityControl *v13;

  v13 = (FCUIActivityControl *)a3;
  v4 = -[FCUIActivityControl isSelected](v13, "isSelected");
  v5 = v13;
  v6 = v4;
  v7 = v4 ^ 1u;
  p_selectedControl = (id *)&self->_selectedControl;
  selectedControl = self->_selectedControl;
  if ((v6 & 1) != 0 || selectedControl != v13)
  {
    -[FCUIActivityControl setSelected:](selectedControl, "setSelected:", 0);
    v10 = *p_selectedControl;
    *p_selectedControl = 0;

    selectedActivityIdentifier = self->_selectedActivityIdentifier;
    self->_selectedActivityIdentifier = 0;

    v5 = v13;
  }
  if (v6)
    v5 = 0;
  objc_storeStrong((id *)&self->_selectedControl, v5);
  objc_msgSend(*p_selectedControl, "setSelected:", v7);
  if ((v6 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[FCUIActivityControl activityDescription](v13, "activityDescription");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "activityIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_selectedActivityIdentifier, v12);
  if ((v6 & 1) == 0)
  {

  }
}

- (void)_configureActivityListView
{
  FCUIActivityListView *activityListView;
  _FCUIFocusSelectionHeaderView *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  FCUIActivityListView *v15;
  _FCUIFocusSelectionFooterView *v16;
  void *v17;
  void *v18;
  _FCUIFocusSelectionFooterView *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  activityListView = self->_activityListView;
  v4 = -[_FCUIFocusSelectionHeaderFooterView initWithText:]([_FCUIFocusSelectionHeaderView alloc], "initWithText:", self->_subtitle);
  -[FCUIActivityListView setHeaderView:](activityListView, "setHeaderView:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[FCActivityManager availableActivities](self->_activityManager, "availableActivities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[FCUIFocusSelectionViewController _activityControlForActivity:](self, "_activityControlForActivity:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isPlaceholder") & 1) == 0)
        {
          objc_msgSend(v11, "activityIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", self->_selectedActivityIdentifier);

          if (v14)
            -[FCUIFocusSelectionViewController _setSelectedControl:](self, "_setSelectedControl:", v12);
        }
        objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  -[FCUIActivityListView setActivityViews:](self->_activityListView, "setActivityViews:", v5);
  v15 = self->_activityListView;
  v16 = [_FCUIFocusSelectionFooterView alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FOCUS_SELECTOR_SETTINGS"), &stru_24D20B520, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_FCUIFocusSelectionHeaderFooterView initWithText:](v16, "initWithText:", v18);
  -[FCUIActivityListView setFooterView:](v15, "setFooterView:", v19);

}

- (id)_activityControlForActivity:(id)a3
{
  id v4;
  FCUIActivityControl *v5;
  void *v6;
  id v7;
  FCUIActivityControl *v8;
  void *v9;
  FCUIActivityControl *v10;
  _QWORD v12[4];
  id v13;
  FCUIActivityControl *v14;
  FCUIFocusSelectionViewController *v15;
  id v16;
  id location;

  v4 = a3;
  v5 = -[FCUIActivityControl initWithActivityDescription:style:]([FCUIActivityControl alloc], "initWithActivityDescription:style:", v4, 2);
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BEBD388];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__FCUIFocusSelectionViewController__activityControlForActivity___block_invoke;
  v12[3] = &unk_24D20ABF0;
  objc_copyWeak(&v16, &location);
  v7 = v4;
  v13 = v7;
  v8 = v5;
  v14 = v8;
  v15 = self;
  objc_msgSend(v6, "actionWithHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCUIActivityControl addAction:forControlEvents:](v8, "addAction:forControlEvents:", v9, 64);
  -[FCUIActivityControl setOptionsAction:](v8, "setOptionsAction:", v9);
  v10 = v8;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __64__FCUIFocusSelectionViewController__activityControlForActivity___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "_activityManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "activityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isPlaceholder"))
  {
    objc_msgSend(WeakRetained, "_activityManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "activityDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "promotedPlaceholderActivity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LINK_FOCUS_ALERT_TITLE"), &stru_24D20B520, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LINK_FOCUS_ALERT_UNABLE_TO_CREATE"), &stru_24D20B520, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24D20B520, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v12, 0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v14);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v13, 1, 0);

      goto LABEL_6;
    }
    objc_msgSend(a1[5], "setActivityDescription:", v7);

  }
  objc_msgSend(WeakRetained, "_setSelectedControl:", a1[5]);
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1[5], "isSelected");
  objc_msgSend(a1[5], "activityDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "focusSelectionViewController:hasSelected:activity:", WeakRetained, v9, v10);
LABEL_6:

}

- (void)_closeButtonTapped:(id)a3
{
  -[FCUIFocusSelectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (FCUIFocusSelectionViewControllerDelegate)delegate
{
  return (FCUIFocusSelectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FCActivityManager)_activityManager
{
  return self->_activityManager;
}

- (void)_setActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_activityManager, a3);
}

- (NSString)selectedActivityIdentifier
{
  return self->_selectedActivityIdentifier;
}

- (void)setSelectedActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedActivityIdentifier, a3);
}

- (FCUIActivityControl)selectedControl
{
  return self->_selectedControl;
}

- (void)setSelectedControl:(id)a3
{
  objc_storeStrong((id *)&self->_selectedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedControl, 0);
  objc_storeStrong((id *)&self->_selectedActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_activityListView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end
