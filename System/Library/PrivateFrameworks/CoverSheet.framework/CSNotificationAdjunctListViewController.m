@implementation CSNotificationAdjunctListViewController

- (BOOL)isPresentingTransientContent
{
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_identifiersToItems, "objectForKey:", CFSTR("focus activity identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[NSMutableDictionary count](self->_identifiersToItems, "count") != 1;
  else
    return -[CSNotificationAdjunctListViewController isPresentingContent](self, "isPresentingContent");
}

- (BOOL)isPresentingContent
{
  return -[NSMutableDictionary count](self->_identifiersToItems, "count") != 0;
}

- (CSNotificationAdjunctListViewController)init
{
  CSNotificationAdjunctListViewController *v2;
  CSNotificationAdjunctListViewController *v3;
  CSNowPlayingController *v4;
  CSNowPlayingController *nowPlayingController;
  CSContentActionInterpreter *v6;
  CSContentActionInterpreter *actionInterpreter;
  uint64_t v8;
  NSMutableDictionary *identifiersToItems;
  CSAdjunctListModel *v10;
  CSAdjunctListModel *model;
  CSFocusActivityManager *v12;
  CSFocusActivityManager *focusActivityManager;
  CSAdjunctListActionManager *v14;
  CSAdjunctListActionManager *actionManager;
  CSRemoteContentInlineManager *v16;
  CSRemoteContentInlineManager *remoteContentInlineManager;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CSNotificationAdjunctListViewController;
  v2 = -[CSNotificationAdjunctListViewController init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allowsAddRemoveAnimations = 1;
    v4 = objc_alloc_init(CSNowPlayingController);
    nowPlayingController = v3->_nowPlayingController;
    v3->_nowPlayingController = v4;

    v6 = objc_alloc_init(CSContentActionInterpreter);
    actionInterpreter = v3->_actionInterpreter;
    v3->_actionInterpreter = v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    identifiersToItems = v3->_identifiersToItems;
    v3->_identifiersToItems = (NSMutableDictionary *)v8;

    v10 = objc_alloc_init(CSAdjunctListModel);
    model = v3->_model;
    v3->_model = v10;

    -[CSAdjunctListModel setDelegate:](v3->_model, "setDelegate:", v3);
    v12 = -[CSFocusActivityManager initWithItemDestination:]([CSFocusActivityManager alloc], "initWithItemDestination:", v3->_model);
    focusActivityManager = v3->_focusActivityManager;
    v3->_focusActivityManager = v12;

    -[CSFocusActivityManager setDelegate:](v3->_focusActivityManager, "setDelegate:", v3);
    v14 = -[CSAdjunctListActionManager initWithItemDestination:]([CSAdjunctListActionManager alloc], "initWithItemDestination:", v3->_model);
    actionManager = v3->_actionManager;
    v3->_actionManager = v14;

    v16 = -[CSRemoteContentInlineManager initWithItemDestination:]([CSRemoteContentInlineManager alloc], "initWithItemDestination:", v3->_model);
    remoteContentInlineManager = v3->_remoteContentInlineManager;
    v3->_remoteContentInlineManager = v16;

  }
  return v3;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  CSContentActionInterpreter *actionInterpreter;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSNotificationAdjunctListViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v7, sel_viewDidLoad);
  -[CSNotificationAdjunctListViewController _stackView](self, "_stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSNotificationAdjunctListViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insetMarginsToMimicForAdjunctListViewController:", self);
  objc_msgSend(v3, "setLayoutMargins:");
  objc_msgSend(v4, "interItemSpacingToMimicForAdjunctListViewController:", self);
  objc_msgSend(v3, "setSpacing:");
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setAlignment:", 3);
  actionInterpreter = self->_actionInterpreter;
  -[CSNowPlayingController controlsViewController](self->_nowPlayingController, "controlsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSContentActionInterpreter setNowPlayingViewController:](actionInterpreter, "setNowPlayingViewController:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSNotificationAdjunctListViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CSAdjunctListModel resumeItemHandling](self->_model, "resumeItemHandling");
  -[CSNotificationAdjunctListViewController _updateItemsSizeToMimic](self, "_updateItemsSizeToMimic");
  -[CSNotificationAdjunctListViewController _setIsFocusActivityIndicatorVisible:](self, "_setIsFocusActivityIndicatorVisible:", -[CSFocusActivityManager isFocusActivityIndicatorVisible](self->_focusActivityManager, "isFocusActivityIndicatorVisible"));
  -[CSProminentUISpacerViewController setTopMarginToMimic:](self->_spacerViewController, "setTopMarginToMimic:", self->_prominentElementHeightToMimic);
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSNotificationAdjunctListViewController;
  -[CSCoverSheetViewControllerBase viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (!self->_respondingToSubviewLayoutChange)
  {
    self->_respondingToSubviewLayoutChange = 1;
    -[CSNotificationAdjunctListViewController _didUpdateDisplay](self, "_didUpdateDisplay");
    self->_respondingToSubviewLayoutChange = 0;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CSNotificationAdjunctListViewController;
  v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CSNotificationAdjunctListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8E2EEA0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

uint64_t __94__CSNotificationAdjunctListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateItemsSizeToMimic");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_identifiersToItems, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "contentHost");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          objc_msgSend(v10, "itemView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "invalidateIntrinsicContentSize");

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (CGSize)stackViewContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[CSNotificationAdjunctListViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToMimicForAdjunctListViewController:", self);
  v5 = v4;
  -[CSNotificationAdjunctListViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
  v8 = v7;

  v9 = v5;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)isShowingMediaControls
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKey:](self->_identifiersToItems, "objectForKey:", *MEMORY[0x1E0DAB120]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CGSize)sizeToMimicForHost:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a3;
  -[CSNotificationAdjunctListViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToMimicForAdjunctListViewController:", self);
  v7 = v6;
  v9 = v8;
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v4, "insetsMargins"))
  {
    objc_msgSend(v5, "insetMarginsToMimicForAdjunctListViewController:", self);
    v7 = v7 - v10 - v11;
  }

  v12 = v7;
  v13 = v9;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)listViewContentAnimationDuration
{
  return 1.15;
}

- (double)listViewContentAnimationDampingRatio
{
  return 0.81;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSNotificationAdjunctListViewController;
  if (-[CSCoverSheetViewControllerBase handleEvent:](&v9, sel_handleEvent_, v4))
    v5 = objc_msgSend(v4, "isConsumable");
  else
    v5 = 0;
  v6 = objc_msgSend(v4, "type");
  if (v6 == 8)
  {
    -[CSAdjunctListModel resumeItemHandling](self->_model, "resumeItemHandling");
  }
  else if (v6 == 9)
  {
    -[CSAdjunctListModel suspendItemHandling](self->_model, "suspendItemHandling");
  }
  else if (!v5)
  {
    v7 = 0;
    goto LABEL_10;
  }
  v7 = objc_msgSend(v4, "isConsumable");
LABEL_10:

  return v7;
}

- (void)setContentActionProvider:(id)a3
{
  objc_msgSend(a3, "addActionHandler:", self->_actionManager);
}

- (void)setRemoteContentInlineProvider:(id)a3
{
  CSRemoteContentInlineProviding **p_remoteContentInlineProvider;
  id v5;

  p_remoteContentInlineProvider = &self->_remoteContentInlineProvider;
  v5 = a3;
  objc_storeWeak((id *)p_remoteContentInlineProvider, v5);
  -[CSRemoteContentInlineManager setRemoteContentInlineProvider:](self->_remoteContentInlineManager, "setRemoteContentInlineProvider:", v5);

}

- (void)setDigestOnboardingSuggestionViewController:(id)a3
{
  -[CSContentActionInterpreter setDigestOnboardingSuggestionViewController:](self->_actionInterpreter, "setDigestOnboardingSuggestionViewController:", a3);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  CSProminentUISpacerViewController *spacerViewController;
  CSProminentUISpacerViewController *v8;
  CSProminentUISpacerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  id obja;
  _QWORD v16[5];
  id v17;
  id v18;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_msgSend(obj, "adjunctListViewController:didAddSectionWithIdentifier:", self, CFSTR("AdjunctTopSticky"));
    v6 = -[CSNotificationAdjunctListViewController _hostsTimeInAdjunctList](self, "_hostsTimeInAdjunctList");
    v5 = obj;
    if (v6)
    {
      spacerViewController = self->_spacerViewController;
      if (!spacerViewController)
      {
        v8 = objc_alloc_init(CSProminentUISpacerViewController);
        v9 = self->_spacerViewController;
        self->_spacerViewController = v8;

        -[CSProminentUISpacerViewController setTopMarginToMimic:](self->_spacerViewController, "setTopMarginToMimic:", self->_prominentElementHeightToMimic);
        spacerViewController = self->_spacerViewController;
      }
      -[CSNotificationAdjunctListViewController _createItemViewForHost:recipe:](self, "_createItemViewForHost:recipe:", spacerViewController, 0, obj);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = (void *)MEMORY[0x1E0CEABB0];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __55__CSNotificationAdjunctListViewController_setDelegate___block_invoke;
        v16[3] = &unk_1E8E2DB88;
        v16[4] = self;
        v17 = v10;
        v18 = obja;
        objc_msgSend(v12, "performWithoutAnimation:", v16);
        -[CSNotificationAdjunctListViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setNeedsLayout");

        -[CSNotificationAdjunctListViewController _didUpdateDisplay](self, "_didUpdateDisplay");
      }

      v5 = obja;
    }
  }

}

uint64_t __55__CSNotificationAdjunctListViewController_setDelegate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_addChildViewController:withSuperview:animated:transitionBlock:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152), *(_QWORD *)(a1 + 40), 0, 0);
  return objc_msgSend(*(id *)(a1 + 48), "adjunctListViewController:didAddViewController:withIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1152), CFSTR("com.apple.SpringBoard.prominentUI"));
}

- (void)setProminentElementHeightToMimic:(double)a3
{
  if (self->_prominentElementHeightToMimic != a3)
  {
    self->_prominentElementHeightToMimic = a3;
    -[CSProminentUISpacerViewController setTopMarginToMimic:](self->_spacerViewController, "setTopMarginToMimic:");
  }
}

- (id)itemsGroupSortComparatorForListSectionIdentifier:(id)a3
{
  return &__block_literal_global_6;
}

uint64_t __92__CSNotificationAdjunctListViewController_itemsGroupSortComparatorForListSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)itemsViewControllerSortComparatorForListSectionIdentifier:(id)a3
{
  return &__block_literal_global_30;
}

uint64_t __101__CSNotificationAdjunctListViewController_itemsViewControllerSortComparatorForListSectionIdentifier___block_invoke()
{
  return 0;
}

- (void)adjunctListModel:(id)a3 didAddItem:(id)a4
{
  _BOOL8 v5;
  id v6;

  v6 = a4;
  v5 = objc_msgSend(v6, "animatePresentation")
    && -[CSNotificationAdjunctListViewController _canAnimate](self, "_canAnimate")
    && self->_allowsAddRemoveAnimations;
  -[CSNotificationAdjunctListViewController _insertItem:atPreferredIndex:animated:](self, "_insertItem:atPreferredIndex:animated:", v6, -[CSNotificationAdjunctListViewController _preferredIndexForItem:](self, "_preferredIndexForItem:", v6), v5);

}

- (void)adjunctListModel:(id)a3 didRemoveItem:(id)a4
{
  _BOOL8 v5;
  id v6;

  v6 = a4;
  v5 = objc_msgSend(v6, "animateDismissal")
    && -[CSNotificationAdjunctListViewController _canAnimate](self, "_canAnimate")
    && self->_allowsAddRemoveAnimations;
  -[CSNotificationAdjunctListViewController _removeItem:animated:](self, "_removeItem:animated:", v6, v5);

}

- (void)adjunctListModel:(id)a3 didUpdateItem:(id)a4 withItem:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v7 = a5;
  if (v12 != v7)
  {
    -[CSNotificationAdjunctListViewController _stackView](self, "_stackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "itemView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrangedSubviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "indexOfObject:", v9);
    if (!v11)
      v11 = -[CSNotificationAdjunctListViewController _preferredIndexForItem:](self, "_preferredIndexForItem:", v7);

    -[CSNotificationAdjunctListViewController _removeItem:animated:](self, "_removeItem:animated:", v12, 0);
    -[CSNotificationAdjunctListViewController _insertItem:atPreferredIndex:animated:](self, "_insertItem:atPreferredIndex:animated:", v7, v11, 0);

  }
}

- (void)focusActivityIndicatorDidChangeToVisible:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "focusActivityViewChangedToVisible:", v3);

}

- (BOOL)_hostsTimeInAdjunctList
{
  void *v2;
  void *v3;
  char v4;

  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dashBoardRemoteContentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "shouldHostContentInNotificationList"))
    v4 = objc_msgSend(v3, "includesDateTimeStandinInAdjunctList");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hostsInlineContentInAdjunctList
{
  void *v2;
  void *v3;
  char v4;

  +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dashBoardRemoteContentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "shouldHostContentInNotificationList"))
    v4 = objc_msgSend(v3, "hostsInlineContentNativelyInNotificationList");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_canAnimate
{
  return -[CSNotificationAdjunctListViewController _appearState](self, "_appearState") != 0;
}

- (void)_insertItem:(id)a3 atPreferredIndex:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  CSContentActionInterpreter *actionInterpreter;
  void *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  _QWORD v37[4];
  id v38;
  CSNotificationAdjunctListViewController *v39;
  id v40;
  BOOL v41;
  _QWORD v42[4];
  id v43;
  id v44;
  CSNotificationAdjunctListViewController *v45;
  NSObject *v46;
  int64_t v47;
  BOOL v48;
  _QWORD v49[4];
  id v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v5 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_identifiersToItems, "setObject:forKey:", v8, v9);
  objc_msgSend(v8, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    actionInterpreter = self->_actionInterpreter;
    objc_msgSend(v8, "action");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v11;
    v49[1] = 3221225472;
    v49[2] = __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke;
    v49[3] = &unk_1E8E2EF48;
    v50 = v8;
    -[CSContentActionInterpreter _viewControllerFromAction:completion:](actionInterpreter, "_viewControllerFromAction:completion:", v13, v49);

  }
  objc_msgSend(v8, "contentHost");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v8, "contentHost");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = -[CSNotificationAdjunctListViewController _hostsInlineContentInAdjunctList](self, "_hostsInlineContentInAdjunctList");
    v36 = v5;
    if (v16)
    {
      v17 = 0;
    }
    else
    {
      -[CSNotificationAdjunctListViewController _stackView](self, "_stackView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "sb_materialRecipe");
    if (v19 <= 1)
      v20 = 1;
    else
      v20 = v19;

    -[CSNotificationAdjunctListViewController _createItemViewForHost:recipe:](self, "_createItemViewForHost:recipe:", v15, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItemView:", v21);
    if (v21)
    {
      v34 = v9;
      v22 = (void *)MEMORY[0x1E0CEABB0];
      v23 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_33;
      v42[3] = &unk_1E8E2EF70;
      v48 = v16;
      v24 = v21;
      v43 = v24;
      v35 = v17;
      v25 = v17;
      v47 = a4;
      v44 = v25;
      v45 = self;
      v46 = v15;
      objc_msgSend(v22, "performWithoutAnimation:", v42);
      v37[0] = v23;
      v37[1] = 3221225472;
      v37[2] = __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_2;
      v37[3] = &unk_1E8E2E298;
      v41 = v16;
      v38 = v24;
      v39 = self;
      v40 = v25;
      v26 = (void *)MEMORY[0x1D17E1614](v37);
      -[CSNotificationAdjunctListViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setNeedsLayout");

      v28 = (void *)MEMORY[0x1E0CEABB0];
      if (v36)
      {
        -[CSNotificationAdjunctListViewController listViewContentAnimationDuration](self, "listViewContentAnimationDuration");
        v30 = v29;
        -[CSNotificationAdjunctListViewController listViewContentAnimationDampingRatio](self, "listViewContentAnimationDampingRatio");
        objc_msgSend(v28, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v26, 0, v30, 0.0, v31, 0.0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v26);
      }
      SBLogDashBoard();
      v32 = objc_claimAutoreleasedReturnValue();
      v9 = v34;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v52 = v33;
        _os_log_impl(&dword_1D0337000, v32, OS_LOG_TYPE_DEFAULT, "Inserted adjunct list item with identifier: %@", buf, 0xCu);

      }
      v17 = v35;
    }

  }
  else
  {
    SBLogDashBoard();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CSNotificationAdjunctListViewController _insertItem:atPreferredIndex:animated:].cold.1(v15);
  }

}

void __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    SBLogDashBoard();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_cold_1(v5, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setContentHost:", a2);
  }

}

uint64_t __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_33(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  CGAffineTransform v8;
  CGAffineTransform v9;

  if (!*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 40), "arrangedSubviews");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (v3 >= *(_QWORD *)(a1 + 64))
      v4 = *(_QWORD *)(a1 + 64);
    else
      v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "insertArrangedSubview:atIndex:", *(_QWORD *)(a1 + 32), v4);
    objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
    v5 = *(void **)(a1 + 32);
    CGAffineTransformMakeScale(&v8, 0.5, 0.5);
    CGAffineTransformTranslate(&v9, &v8, 0.0, 0.0);
    objc_msgSend(v5, "setTransform:", &v9);
  }
  objc_msgSend(*(id *)(a1 + 48), "bs_addChildViewController:withSuperview:animated:transitionBlock:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), 0, 0);
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjunctListViewController:didAddViewController:withIdentifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), CFSTR("com.apple.SpringBoard.sleep"));

  }
  return objc_msgSend(*(id *)(a1 + 48), "_didUpdateDisplay");
}

uint64_t __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  if (!*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_didUpdateDisplay");
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
    v2 = *(void **)(a1 + 32);
    v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v5[0] = *MEMORY[0x1E0C9BAA8];
    v5[1] = v3;
    v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v2, "setTransform:", v5);
    objc_msgSend(*(id *)(a1 + 48), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
  }
  return objc_msgSend(*(id *)(a1 + 40), "_didUpdateDisplay");
}

- (void)_removeItem:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  CSNotificationAdjunctListViewController *v37;
  id v38;
  id v39;
  BOOL v40;
  _QWORD v41[4];
  id v42;
  id v43;
  CSNotificationAdjunctListViewController *v44;
  BOOL v45;
  _BYTE buf[32];
  __int128 v47;
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "contentHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CSNotificationAdjunctListViewController _hostsInlineContentInAdjunctList](self, "_hostsInlineContentInAdjunctList");
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    -[CSNotificationAdjunctListViewController _stackView](self, "_stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SBLogDashBoard();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v8;
    _os_log_impl(&dword_1D0337000, v11, OS_LOG_TYPE_DEFAULT, "Removing adjunct list item: %@, and content host: %@, itemView: %@", buf, 0x20u);
  }

  if (v8 && v7)
  {
    v28 = v4;
    if (v9)
    {
      objc_msgSend(v8, "setHidden:", 0);
      objc_msgSend(v8, "setAlpha:", 1.0);
      v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)buf = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&buf[16] = v12;
      v47 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v8, "setTransform:", buf);
    }
    v13 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke;
    v41[3] = &unk_1E8E2E298;
    v45 = v9;
    v14 = v8;
    v42 = v14;
    v27 = v10;
    v15 = v10;
    v43 = v15;
    v44 = self;
    v16 = (void *)MEMORY[0x1D17E1614](v41);
    v34[0] = v13;
    v34[1] = 3221225472;
    v34[2] = __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_2;
    v34[3] = &unk_1E8E2EF98;
    v35 = v14;
    v40 = v9;
    v36 = v15;
    v37 = self;
    v17 = v6;
    v38 = v17;
    v39 = v7;
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_3;
    v32[3] = &unk_1E8E2E5A0;
    v32[4] = self;
    v18 = (id)MEMORY[0x1D17E1614](v34);
    v33 = v18;
    v19 = (void *)MEMORY[0x1D17E1614](v32);
    -[CSNotificationAdjunctListViewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "adjunctListViewController:willRemoveViewWithIdentifier:", self, CFSTR("com.apple.SpringBoard.sleep"));

    v21 = (void *)MEMORY[0x1E0CEABB0];
    if (v28)
    {
      -[CSNotificationAdjunctListViewController listViewContentAnimationDuration](self, "listViewContentAnimationDuration");
      v23 = v22;
      -[CSNotificationAdjunctListViewController listViewContentAnimationDampingRatio](self, "listViewContentAnimationDampingRatio");
      objc_msgSend(v21, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v16, v19, v23, 0.0, v24, 0.0);
    }
    else
    {
      v29[0] = v13;
      v29[1] = 3221225472;
      v29[2] = __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_4;
      v29[3] = &unk_1E8E2E7F0;
      v30 = v16;
      v31 = v19;
      objc_msgSend(v21, "performWithoutAnimation:", v29);

    }
    SBLogDashBoard();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_1D0337000, v25, OS_LOG_TYPE_DEFAULT, "Removed adjunct list item with identifier: %@", buf, 0xCu);

    }
    v10 = v27;
  }

}

uint64_t __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double Height;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGRect v9;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 48), "_didUpdateDisplay");
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
    v2 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 48);
    objc_msgSend(v2, "bounds");
    Height = CGRectGetHeight(v9);
    if (v3)
    {
      objc_msgSend(v3, "_disappearedTransformForContentWithHeight:", Height);
    }
    else
    {
      v7 = 0u;
      v8 = 0u;
      v6 = 0u;
    }
    objc_msgSend(v2, "setTransform:", &v6);
  }
  return objc_msgSend(*(id *)(a1 + 48), "_didUpdateDisplay", v6, v7, v8);
}

void __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(a1 + 32) && objc_msgSend(*(id *)(a1 + 40), "containsView:"))
  {
    if (*(_BYTE *)(a1 + 72))
      objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
    v2 = *(void **)(*(_QWORD *)(a1 + 48) + 1112);
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == *(id *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 48), "bs_removeChildViewController:animated:transitionBlock:", *(_QWORD *)(a1 + 64), 0, 0);
      v4 = *(void **)(*(_QWORD *)(a1 + 48) + 1112);
      objc_msgSend(*(id *)(a1 + 56), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeObjectForKey:", v5);

    }
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjunctListViewController:willRemoveViewWithIdentifier:", *(_QWORD *)(a1 + 48), CFSTR("com.apple.SpringBoard.sleep"));

    objc_msgSend(*(id *)(a1 + 40), "setNeedsLayout");
    objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
    objc_msgSend(*(id *)(a1 + 48), "_didUpdateDisplay");

  }
}

void __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_3(uint64_t a1)
{
  void (**v1)(_QWORD);

  v1 = *(void (***)(_QWORD))(a1 + 40);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1051))
    dispatch_async(MEMORY[0x1E0C80D38], v1);
  else
    v1[2](*(_QWORD *)(a1 + 40));
}

uint64_t __64__CSNotificationAdjunctListViewController__removeItem_animated___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)_preferredIndexForItem:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("focus activity identifier")))
    v4 = 0;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)_createItemViewForHost:(id)a3 recipe:(int64_t)a4
{
  id v6;
  CSAdjunctItemView *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v6 = a3;
  v7 = -[CSAdjunctItemView initWithRecipe:]([CSAdjunctItemView alloc], "initWithRecipe:", a4);
  -[CSNotificationAdjunctListViewController _groupNameBase](self, "_groupNameBase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAdjunctItemView setMaterialGroupNameBase:](v7, "setMaterialGroupNameBase:", v8);

  -[CSAdjunctItemView setContentHost:](v7, "setContentHost:", v6);
  -[CSNotificationAdjunctListViewController sizeToMimicForHost:](self, "sizeToMimicForHost:", v6);
  v10 = v9;
  v12 = v11;

  -[CSAdjunctItemView setSizeToMimic:](v7, "setSizeToMimic:", v10, v12);
  return v7;
}

- (void)_updateItemsSizeToMimic
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
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
  -[CSNotificationAdjunctListViewController _stackView](self, "_stackView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "contentHost");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSNotificationAdjunctListViewController sizeToMimicForHost:](self, "sizeToMimicForHost:", v10);
        objc_msgSend(v9, "setSizeToMimic:");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)_groupNameBase
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "groupNameBaseForAdjunctListViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_didUpdateDisplay
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[CSNotificationAdjunctListViewController _stackView](self, "_stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
  v5 = v4;
  v7 = v6;

  if (-[CSNotificationAdjunctListViewController _hostsTimeInAdjunctList](self, "_hostsTimeInAdjunctList"))
  {
    -[CSProminentUISpacerViewController preferredContentSize](self->_spacerViewController, "preferredContentSize");
    v7 = v7 + v8;
  }
  objc_msgSend(WeakRetained, "adjunctListViewController:didUpdateWithSize:", self, v5, v7);
  -[NSMutableDictionary objectForKey:](self->_identifiersToItems, "objectForKey:", *MEMORY[0x1E0DAB120]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = v9 != 0;
  if (self->_isNowPlayingVisible != v11)
  {
    self->_isNowPlayingVisible = v11;
    objc_msgSend(WeakRetained, "adjunctListViewController:updatedNowPlayingVisbility:", self, v9 != 0);
  }

}

- (CGAffineTransform)_disappearedTransformForContentWithHeight:(SEL)a3
{
  CGAffineTransform v7;
  CGAffineTransform t1;
  CGAffineTransform v9;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, 0.05, 0.05);
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeTranslation(&v9, 0.0, a4 * 0.55);
  t1 = v10;
  v7 = v9;
  return CGAffineTransformConcat(retstr, &t1, &v7);
}

- (void)_setIsFocusActivityIndicatorVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isFocusActivityIndicatorVisible != a3)
  {
    v3 = a3;
    self->_isFocusActivityIndicatorVisible = a3;
    -[CSNotificationAdjunctListViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focusActivityViewChangedToVisible:", v3);

  }
}

- (id)_stackView
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  -[CSNotificationAdjunctListViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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

  return v6;
}

- (double)prominentElementHeightToMimic
{
  return self->_prominentElementHeightToMimic;
}

- (SBFActionProviding)contentActionProvider
{
  return (SBFActionProviding *)objc_loadWeakRetained((id *)&self->_contentActionProvider);
}

- (CSRemoteContentInlineProviding)remoteContentInlineProvider
{
  return (CSRemoteContentInlineProviding *)objc_loadWeakRetained((id *)&self->_remoteContentInlineProvider);
}

- (UIViewController)digestOnboardingSuggestionViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_digestOnboardingSuggestionViewController);
}

- (CSNotificationAdjunctListViewControllerDelegate)delegate
{
  return (CSNotificationAdjunctListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGSize)sizeToMimic
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeToMimic.width;
  height = self->_sizeToMimic.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PRWidgetMetricsProvider)widgetMetricsProvider
{
  return (PRWidgetMetricsProvider *)objc_loadWeakRetained((id *)&self->_widgetMetricsProvider);
}

- (void)setWidgetMetricsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_widgetMetricsProvider, a3);
}

- (CSFocusActivityManager)focusActivityManager
{
  return self->_focusActivityManager;
}

- (void)setFocusActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_focusActivityManager, a3);
}

- (NSMutableDictionary)identifiersToItems
{
  return self->_identifiersToItems;
}

- (void)setIdentifiersToItems:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersToItems, a3);
}

- (CSNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingController, a3);
}

- (CSContentActionInterpreter)actionInterpreter
{
  return self->_actionInterpreter;
}

- (void)setActionInterpreter:(id)a3
{
  objc_storeStrong((id *)&self->_actionInterpreter, a3);
}

- (BOOL)respondingToSubviewLayoutChange
{
  return self->_respondingToSubviewLayoutChange;
}

- (void)setRespondingToSubviewLayoutChange:(BOOL)a3
{
  self->_respondingToSubviewLayoutChange = a3;
}

- (CSRemoteContentInlineManager)remoteContentInlineManager
{
  return self->_remoteContentInlineManager;
}

- (void)setRemoteContentInlineManager:(id)a3
{
  objc_storeStrong((id *)&self->_remoteContentInlineManager, a3);
}

- (CSAdjunctListActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionManager, a3);
}

- (CSProminentUISpacerViewController)spacerViewController
{
  return self->_spacerViewController;
}

- (void)setSpacerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_spacerViewController, a3);
}

- (BOOL)allowsAddRemoveAnimations
{
  return self->_allowsAddRemoveAnimations;
}

- (void)setAllowsAddRemoveAnimations:(BOOL)a3
{
  self->_allowsAddRemoveAnimations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spacerViewController, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_remoteContentInlineManager, 0);
  objc_storeStrong((id *)&self->_actionInterpreter, 0);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_identifiersToItems, 0);
  objc_storeStrong((id *)&self->_focusActivityManager, 0);
  objc_destroyWeak((id *)&self->_widgetMetricsProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_digestOnboardingSuggestionViewController);
  objc_destroyWeak((id *)&self->_remoteContentInlineProvider);
  objc_destroyWeak((id *)&self->_contentActionProvider);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)_insertItem:(os_log_t)log atPreferredIndex:animated:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0337000, log, OS_LOG_TYPE_ERROR, "Cannot present an item that has neither an action or a view controller", v1, 2u);
}

void __81__CSNotificationAdjunctListViewController__insertItem_atPreferredIndex_animated___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0337000, a2, OS_LOG_TYPE_ERROR, "Error loading view controller from action: %@", (uint8_t *)&v4, 0xCu);

}

@end
