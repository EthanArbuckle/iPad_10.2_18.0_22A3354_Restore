@implementation DOCTagEditorViewController

- (DOCTagEditorViewController)initWithCoder:(id)a3
{
  DOCTagEditorViewController *v3;
  DOCTagEditorViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCTagEditorViewController;
  v3 = -[DOCTagEditorViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[DOCTagEditorViewController doc_commonInit](v3, "doc_commonInit");
  return v4;
}

- (DOCTagEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  DOCTagEditorViewController *v4;
  DOCTagEditorViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DOCTagEditorViewController;
  v4 = -[DOCTagEditorViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[DOCTagEditorViewController doc_commonInit](v4, "doc_commonInit");
  return v5;
}

- (void)doc_commonInit
{
  self->_inTagListMode = 1;
}

- (void)registerCells:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        -[DOCTagEditorViewController collectionView](self, "collectionView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "registerClass:forCellWithReuseIdentifier:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)loadView
{
  id v3;
  id v4;
  void *v5;
  id v6;
  UICollectionView *v7;
  UICollectionView *collectionView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  void *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBD470]);
  v4 = objc_alloc(MEMORY[0x24BEBD468]);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __38__DOCTagEditorViewController_loadView__block_invoke;
  v19[3] = &unk_24E327868;
  v19[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithSectionProvider:configuration:", v19, v3);
  v6 = objc_alloc(MEMORY[0x24BEBD450]);
  v7 = (UICollectionView *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v7;

  v21[0] = CFSTR("DOCTagEditorTextFieldCell");
  v22[0] = objc_opt_class();
  v21[1] = CFSTR("DOCTagEditorColorPickerCell");
  v22[1] = objc_opt_class();
  v21[2] = CFSTR("DOCTagEditorTagCell");
  v22[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController registerCells:](self, "registerCells:", v9);

  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsMultipleSelection:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

  v13 = objc_alloc(MEMORY[0x24BEBD978]);
  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithArrangedSubviews:", v15);

  objc_msgSend(v16, "setAxis:", 1);
  objc_msgSend(MEMORY[0x24BE2DED8], "tagEditorContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", v17);

  -[DOCTagEditorViewController setView:](self, "setView:", v16);
  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v18, 15);

}

id __38__DOCTagEditorViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = (objc_class *)MEMORY[0x24BEBD440];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithAppearance:", 4);
  objc_msgSend(v7, "setShowsSeparators:", 0);
  objc_msgSend(MEMORY[0x24BEBD320], "sectionWithListConfiguration:layoutEnvironment:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(double *)(MEMORY[0x24BEBD250] + 8);
  v10 = *(double *)(MEMORY[0x24BEBD250] + 16);
  v11 = *(double *)(MEMORY[0x24BEBD250] + 24);
  if (a2)
  {
    if (a2 == 5)
      objc_msgSend(*(id *)(a1 + 32), "bottomEdgeSpacing");
    else
      v12 = *MEMORY[0x24BEBD250];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "topEdgeSpacing");
  }
  objc_msgSend(v8, "setContentInsets:", v12, v9, v10, v11);
  objc_msgSend(v8, "setInterGroupSpacing:", 0.0);

  return v8;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *collectionViewHeightConstraint;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)DOCTagEditorViewController;
  -[DOCTagEditorViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);

  _DocumentManagerBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Tags [Navigation Bar]"), CFSTR("Tags"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController setNavigationTitleForTagListOnly:](self, "setNavigationTitleForTagListOnly:", v6);

  _DocumentManagerBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Add Tag [Navigation Bar]"), CFSTR("Add Tag"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController setNavigationTitleForTagListInInfoPanel:](self, "setNavigationTitleForTagListInInfoPanel:", v8);

  _DocumentManagerBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Add Tag [Create Tag Navigation Bar]"), CFSTR("Add Tag"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController setNavigationTitleForTagMaker:](self, "setNavigationTitleForTagMaker:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped_);
  -[DOCTagEditorViewController setDoneButton:](self, "setDoneButton:", v11);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped_);
  -[DOCTagEditorViewController setCancelButton:](self, "setCancelButton:", v12);

  -[DOCTagEditorViewController _updateSelection](self, "_updateSelection");
  -[DOCTagEditorViewController _updateNavigationItem](self, "_updateNavigationItem");
  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  DOCConstraintWithPriority();
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  self->_collectionViewHeightConstraint = v16;

  v18 = (void *)MEMORY[0x24BDD1628];
  v22[0] = self->_collectionViewHeightConstraint;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v19);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_tagRegistryDidUpdate, *MEMORY[0x24BE2DEB8], 0);

  if (-[DOCTagEditorViewController modalTransitionStyle](self, "modalTransitionStyle") == 2)
    -[DOCTagEditorViewController _updatePreferredContentSize:](self, "_updatePreferredContentSize:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DOCTagEditorViewController;
  -[DOCTagEditorViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DOCTagEditorViewController _updateNavigationItem](self, "_updateNavigationItem");
  if (!-[DOCTagEditorViewController delayResizingUntilAppeared](self, "delayResizingUntilAppeared"))
    -[DOCTagEditorViewController _updatePreferredContentSize:](self, "_updatePreferredContentSize:", 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCTagEditorViewController;
  -[DOCTagEditorViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[DOCTagEditorViewController userChangedTags](self, "userChangedTags"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("DOCTagEditorTagsDidChangeNotification"), self);

    -[DOCTagEditorViewController scheduleSetTagsOperationWithTag:adding:](self, "scheduleSetTagsOperationWithTag:adding:", 0, 1);
    -[DOCTagEditorViewController setUserChangedTags:](self, "setUserChangedTags:", 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[DOCTagEditorViewController delayResizingUntilAppeared](self, "delayResizingUntilAppeared"))
    -[DOCTagEditorViewController _updatePreferredContentSize:](self, "_updatePreferredContentSize:", 0);
  v5.receiver = self;
  v5.super_class = (Class)DOCTagEditorViewController;
  -[DOCTagEditorViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
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
  v9.super_class = (Class)DOCTagEditorViewController;
  v7 = a4;
  -[DOCTagEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__DOCTagEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24E327890;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __81__DOCTagEditorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateNavigationItem");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DOCTagEditorViewController;
  -[DOCTagEditorViewController dealloc](&v4, sel_dealloc);
}

- (NSOrderedSet)userTags
{
  NSOrderedSet *userTags;
  void *v4;
  void *v5;
  NSOrderedSet *v6;
  NSOrderedSet *v7;

  userTags = self->_userTags;
  if (!userTags)
  {
    objc_msgSend(MEMORY[0x24BE2DF28], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userTags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSOrderedSet *)objc_msgSend(v5, "copy");
    v7 = self->_userTags;
    self->_userTags = v6;

    userTags = self->_userTags;
  }
  return userTags;
}

- (void)tagRegistryDidUpdate
{
  NSOrderedSet *userTags;
  void *v4;
  id v5;

  userTags = self->_userTags;
  self->_userTags = 0;

  -[DOCTagEditorViewController updateDiscoveredTags](self, "updateDiscoveredTags");
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addIndex:", 3);
  objc_msgSend(v5, "addIndex:", 4);
  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSections:", v5);

  -[DOCTagEditorViewController _updateSelection](self, "_updateSelection");
  -[DOCTagEditorViewController _updatePreferredContentSize:](self, "_updatePreferredContentSize:", 0);

}

- (void)doneButtonTapped:(id)a3
{
  id v4;

  if (-[DOCTagEditorViewController isAddingTag](self, "isAddingTag", a3))
  {
    -[DOCTagEditorViewController addTagTextFieldView](self, "addTagTextFieldView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commit");

  }
  else
  {
    -[DOCTagEditorViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)cancelButtonTapped:(id)a3
{
  id v3;

  -[DOCTagEditorViewController addTagTextFieldView](self, "addTagTextFieldView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (id)_panelAppearance
{
  void *v2;
  void *v3;

  if (-[DOCTagEditorViewController isAddingTag](self, "isAddingTag"))
    +[DOCTagAppearance makerUI](DOCTagAppearance, "makerUI");
  else
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)topEdgeSpacing
{
  void *v2;
  double v3;
  double v4;

  -[DOCTagEditorViewController _panelAppearance](self, "_panelAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topMargin");
  v4 = v3;

  return v4;
}

- (double)bottomEdgeSpacing
{
  void *v2;
  double v3;
  double v4;

  -[DOCTagEditorViewController _panelAppearance](self, "_panelAppearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bottomMargin");
  v4 = v3;

  return v4;
}

- (void)updateDiscoveredTags
{
  NSMutableOrderedSet *discoveredTags;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *v5;
  void *v6;
  NSMutableOrderedSet *v7;
  void *v8;
  NSMutableOrderedSet *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  discoveredTags = self->_discoveredTags;
  if (!discoveredTags)
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v4 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_discoveredTags;
    self->_discoveredTags = v4;

    discoveredTags = self->_discoveredTags;
  }
  -[DOCTagEditorViewController unionSelectedTags](self, "unionSelectedTags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet unionSet:](discoveredTags, "unionSet:", v6);

  v7 = self->_discoveredTags;
  -[DOCTagEditorViewController userTags](self, "userTags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet minusOrderedSet:](v7, "minusOrderedSet:", v8);

  v9 = self->_discoveredTags;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("displayName"), 1, sel_localizedStandardCompare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet sortUsingDescriptors:](v9, "sortUsingDescriptors:", v11);

}

- (void)_updatePreferredContentSize:(BOOL)a3
{
  _BOOL4 v3;
  void (**v5)(void *, uint64_t);
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__DOCTagEditorViewController__updatePreferredContentSize___block_invoke;
  aBlock[3] = &unk_24E3278B8;
  aBlock[4] = self;
  v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "setNeedsLayout");

    -[DOCTagEditorViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

    v5[2](v5, 1);
  }
  else
  {
    objc_msgSend(v6, "performBatchUpdates:completion:", &__block_literal_global_1, v5);

  }
}

void __58__DOCTagEditorViewController__updatePreferredContentSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double Width;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  id v22;
  CGRect v23;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewContentSize");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "collectionViewHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v8 = *(void **)(a1 + 32);
  v22 = v8;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  Width = CGRectGetWidth(v23);

  if (objc_msgSend(*(id *)(a1 + 32), "_isInPopoverPresentation"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_existingPresentationControllerImmediate:effective:", 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v15, "preferredContentSize");
    else
      v16 = 0.0;
    if (v16 != 0.0)
      Width = v16;

  }
  if (objc_msgSend(*(id *)(a1 + 32), "modalTransitionStyle") == 2 && Width > 0.0 && v11 == 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frame");
    v11 = v18;

    if (v11 == 0.0)
    {
      v19 = objc_alloc_init(MEMORY[0x24BEBDB08]);
      objc_msgSend(v19, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "frame");
      v11 = v21;

      if (v11 == 0.0)
        v11 = 1024.0;
    }
  }
  objc_msgSend(v22, "setPreferredContentSize:", Width, v11);

}

- (void)_updateSelectionForSection:(unint64_t)a3 withTags:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v6 = objc_msgSend(v15, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", i, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCTagEditorViewController intersectionSelectedTags](self, "intersectionSelectedTags");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "containsObject:", v9);

      -[DOCTagEditorViewController collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v12)
        objc_msgSend(v13, "selectItemAtIndexPath:animated:scrollPosition:", v10, 0, 0);
      else
        objc_msgSend(v13, "deselectItemAtIndexPath:animated:", v10, 0);

    }
  }

}

- (void)_updateMixedSelectionForCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "tagValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController intersectionSelectedTags](self, "intersectionSelectedTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    objc_msgSend(v7, "setMixedSelection:", 0);
  }
  else
  {
    -[DOCTagEditorViewController unionSelectedTags](self, "unionSelectedTags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMixedSelection:", objc_msgSend(v6, "containsObject:", v4));

  }
}

- (void)_updateSelection
{
  void *v3;
  _QWORD v4[5];

  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__DOCTagEditorViewController__updateSelection__block_invoke_2;
  v4[3] = &unk_24E3278B8;
  v4[4] = self;
  objc_msgSend(v3, "performBatchUpdates:completion:", &__block_literal_global_69, v4);

}

void __46__DOCTagEditorViewController__updateSelection__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "userTags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateSelectionForSection:withTags:", 3, v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "discoveredTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateSelectionForSection:withTags:", 4, v5);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "collectionView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preparedCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "_updateMixedSelectionForCell:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_updateNavigationItem
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  if (-[DOCTagEditorViewController isAddingTag](self, "isAddingTag"))
  {
    -[DOCTagEditorViewController navigationTitleForTagMaker](self, "navigationTitleForTagMaker");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[DOCTagEditorViewController inTagListMode](self, "inTagListMode"))
      -[DOCTagEditorViewController navigationTitleForTagListOnly](self, "navigationTitleForTagListOnly");
    else
      -[DOCTagEditorViewController navigationTitleForTagListInInfoPanel](self, "navigationTitleForTagListInInfoPanel");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  -[DOCTagEditorViewController setTitle:](self, "setTitle:", v3);

  v5 = -[DOCTagEditorViewController inTagListMode](self, "inTagListMode");
  -[DOCTagEditorViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesBackButton:", v5);

  _DocumentManagerBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Back"), CFSTR("Back"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackButtonTitle:", v8);

  if (-[DOCTagEditorViewController isAddingTag](self, "isAddingTag"))
  {
    -[DOCTagEditorViewController cancelButton](self, "cancelButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagEditorViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    objc_msgSend(MEMORY[0x24BE2DF28], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagEditorViewController addTagTextFieldView](self, "addTagTextFieldView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isValidNewTagName:", v14);
    -[DOCTagEditorViewController doneButton](self, "doneButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEnabled:", v15);

    -[DOCTagEditorViewController doneButton](self, "doneButton");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[DOCTagEditorViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRightBarButtonItem:", v22);

  }
  else
  {
    if (-[DOCTagEditorViewController isInfoInPopoverMode](self, "isInfoInPopoverMode")
      || (-[DOCTagEditorViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0)
    {
      v18 = 0;
      v19 = 0;
    }
    else
    {
      -[DOCTagEditorViewController doneButton](self, "doneButton");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
    }
    -[DOCTagEditorViewController navigationItem](self, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRightBarButtonItem:", v19);

    if (v18)
    -[DOCTagEditorViewController doneButton](self, "doneButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setEnabled:", 1);

    -[DOCTagEditorViewController navigationItem](self, "navigationItem");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLeftBarButtonItem:", 0);
  }

}

- (void)setItems:(id)a3
{
  NSArray *v6;
  void *v7;
  NSArray *v8;

  v6 = (NSArray *)a3;
  if (self->_items != v6)
  {
    v8 = v6;
    if (!-[NSArray count](v6, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCTagEditorViewController.m"), 419, CFSTR("Number of items must be greater than 0."));

    }
    objc_storeStrong((id *)&self->_items, a3);
    -[DOCTagEditorViewController setUserChangedTags:](self, "setUserChangedTags:", 0);
    -[DOCTagEditorViewController setTagsWithItems:](self, "setTagsWithItems:", v8);
    v6 = v8;
  }

}

- (void)setTagsWithItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[DOCTagEditorViewController items](self, "items", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DOCTagsFromFPTags();
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController items](self, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= 2)
  {
    for (i = 1; i != v10; ++i)
    {
      v12 = (void *)MEMORY[0x24BDBCF20];
      -[DOCTagEditorViewController items](self, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tags");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      DOCTagsFromFPTags();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "intersectSet:", v17);
      objc_msgSend(v8, "unionSet:", v17);

    }
  }
  -[DOCTagEditorViewController setIntersectionSelectedTags:](self, "setIntersectionSelectedTags:", v7);
  -[DOCTagEditorViewController setUnionSelectedTags:](self, "setUnionSelectedTags:", v8);
  -[DOCTagEditorViewController updateSelectedTags](self, "updateSelectedTags");

}

- (void)setSelectedTags:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagEditorViewController setIntersectionSelectedTags:](self, "setIntersectionSelectedTags:", v6);

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DOCTagEditorViewController setUnionSelectedTags:](self, "setUnionSelectedTags:", v7);
  -[DOCTagEditorViewController updateSelectedTags](self, "updateSelectedTags");
}

- (void)updateSelectedTags
{
  void *v3;
  id v4;

  -[DOCTagEditorViewController updateDiscoveredTags](self, "updateDiscoveredTags");
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIndex:", 3);
  objc_msgSend(v4, "addIndex:", 4);
  -[DOCTagEditorViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSections:", v4);

  -[DOCTagEditorViewController _updateSelection](self, "_updateSelection");
}

- (void)setAddingTag:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_addingTag != a3)
  {
    self->_addingTag = a3;
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addIndex:", 2);
    objc_msgSend(v6, "addIndex:", 3);
    objc_msgSend(v6, "addIndex:", 4);
    objc_msgSend(v6, "addIndex:", 5);
    -[DOCTagEditorViewController collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSections:", v6);

    -[DOCTagEditorViewController addTagCell](self, "addTagCell");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateHoverEffects");

    if (!self->_addingTag)
      -[DOCTagEditorViewController _updateSelection](self, "_updateSelection");
    -[DOCTagEditorViewController _updateNavigationItem](self, "_updateNavigationItem");
    -[DOCTagEditorViewController _updatePreferredContentSize:](self, "_updatePreferredContentSize:", 0);

  }
}

- (void)setIsInfoInPopoverMode:(BOOL)a3
{
  self->_isInfoInPopoverMode = a3;
  -[DOCTagEditorViewController _updateNavigationItem](self, "_updateNavigationItem");
}

- (double)maxListPresentationHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxHeight");
  v5 = v4;

  return v5;
}

- (void)scheduleSetTagsOperationWithTag:(id)a3 adding:(BOOL)a4
{
  id v5;
  NSArray *items;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSArray *v28;
  void *v29;
  void *v30;
  NSArray *v31;
  NSArray *v32;
  void *v33;
  DOCTagEditorViewController *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  NSArray *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  items = self->_items;
  if (items)
  {
    v35 = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](items, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDBCF20];
    -[DOCTagEditorViewController intersectionSelectedTags](self, "intersectionSelectedTags");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FPTagsFromDOCTags();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDBCF20];
    -[DOCTagEditorViewController unionSelectedTags](self, "unionSelectedTags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    FPTagsFromDOCTags();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = self;
    v18 = self->_items;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)MEMORY[0x24BDBCEE0];
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "tags");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "orderedSetWithArray:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "unionSet:", v12);
          objc_msgSend(v25, "intersectSet:", v17);
          objc_msgSend(v25, "array");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v26);

        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v20);
    }

    v27 = objc_alloc(MEMORY[0x24BE2DF18]);
    v28 = v34->_items;
    objc_msgSend(MEMORY[0x24BE2DF38], "shared");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithItems:tagsLists:isUndoable:shouldClearUndoStack:undoManager:", v28, v7, 1, 0, v29);

    v31 = v34->_items;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke;
    v36[3] = &unk_24E327920;
    v5 = v35;
    v37 = v35;
    v38 = v31;
    v32 = v31;
    objc_msgSend(v30, "setActionCompletionBlock:", v36);
    objc_msgSend(MEMORY[0x24BDC82F0], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scheduleAction:", v30);

  }
}

void __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;

  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE2DF90];
  v5 = *MEMORY[0x24BE2DF90];
  if (v3)
  {
    if (!v5)
    {
      DOCInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke_cold_2(a1, v5, (uint64_t)v3);
  }
  else
  {
    if (!v5)
    {
      DOCInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke_cold_1(a1, v5);
  }

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v4;
  BOOL v5;

  v4 = a4;
  v5 = objc_msgSend(v4, "section") == 3 || objc_msgSend(v4, "section") == 4;

  return v5;
}

- (id)_tagForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == 4)
  {
    -[DOCTagEditorViewController discoveredTags](self, "discoveredTags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5 != 3)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[DOCTagEditorViewController userTags](self, "userTags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[DOCTagEditorViewController _tagForIndexPath:](self, "_tagForIndexPath:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[DOCTagEditorViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForItemAtIndexPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setMixedSelection:", 0);
    -[DOCTagEditorViewController selectTag:](self, "selectTag:", v5);

  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[DOCTagEditorViewController _tagForIndexPath:](self, "_tagForIndexPath:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[DOCTagEditorViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForItemAtIndexPath:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setMixedSelection:", 0);
    -[DOCTagEditorViewController deselectTag:](self, "deselectTag:", v5);

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  switch(a4)
  {
    case 1:
      v7 = 1;
      break;
    case 2:
      v7 = -[DOCTagEditorViewController isAddingTag](self, "isAddingTag");
      break;
    case 3:
      if (-[DOCTagEditorViewController isAddingTag](self, "isAddingTag"))
        goto LABEL_6;
      -[DOCTagEditorViewController userTags](self, "userTags");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      if (-[DOCTagEditorViewController isAddingTag](self, "isAddingTag"))
        goto LABEL_6;
      -[DOCTagEditorViewController discoveredTags](self, "discoveredTags");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = v8;
      v7 = objc_msgSend(v8, "count");

      break;
    default:
LABEL_6:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __68__DOCTagEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  v21 = &unk_24E327948;
  v22 = v6;
  v8 = v7;
  v23 = v8;
  v9 = v6;
  -[DOCTagEditorViewController cellForIndexPath:dequeueCell:](self, "cellForIndexPath:dequeueCell:", v8, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "section", v18, v19, v20, v21) == 1)
  {
    v11 = v10;
    objc_msgSend(v11, "addTagView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    objc_msgSend(v11, "addTagView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagEditorViewController setAddTagTextFieldView:](self, "setAddTagTextFieldView:", v13);

    -[DOCTagEditorViewController setAddTagCell:](self, "setAddTagCell:", v11);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v8, "section") == 2)
  {
    v14 = v10;
    -[DOCTagEditorViewController collectionView](self, "collectionView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "panGestureRecognizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "changeColorPanGestureRecognizer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "requireGestureRecognizerToFail:", v16);
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

uint64_t __68__DOCTagEditorViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dequeueReusableCellWithReuseIdentifier:forIndexPath:", a2, *(_QWORD *)(a1 + 40));
}

- (id)cellForIndexPath:(id)a3 dequeueCell:(id)a4
{
  id v6;
  void (**v7)(id, const __CFString *);
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void (**)(id, const __CFString *))a4;
  v8 = objc_msgSend(v6, "section");
  if ((unint64_t)(v8 - 3) < 2)
  {
    v7[2](v7, CFSTR("DOCTagEditorTagCell"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagEditorViewController _tagForIndexPath:](self, "_tagForIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTagValue:", v10);

    -[DOCTagEditorViewController _updateMixedSelectionForCell:](self, "_updateMixedSelectionForCell:", v9);
  }
  else
  {
    if (v8 == 2)
    {
      v7[2](v7, CFSTR("DOCTagEditorColorPickerCell"));
    }
    else
    {
      if (v8 != 1)
      {
        v9 = 0;
        goto LABEL_9;
      }
      v7[2](v7, CFSTR("DOCTagEditorTextFieldCell"));
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v9;
}

- (void)addTagTextFieldDidBeginEditing:(id)a3
{
  -[DOCTagEditorViewController setAddingTag:](self, "setAddingTag:", 1);
}

- (BOOL)addTagTextFieldShouldEndEditing:(id)a3
{
  void *v4;
  char v5;

  if (!-[DOCTagEditorViewController isAddingTag](self, "isAddingTag", a3))
    return 1;
  -[DOCTagEditorViewController _existingPresentationControllerImmediate:effective:](self, "_existingPresentationControllerImmediate:effective:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dismissing");

  return v5 ^ 1;
}

- (void)addTagTextFieldDidEndEditing:(id)a3
{
  if (-[DOCTagEditorViewController addTagTextFieldShouldEndEditing:](self, "addTagTextFieldShouldEndEditing:", a3))
    -[DOCTagEditorViewController setAddingTag:](self, "setAddingTag:", 0);
}

- (BOOL)addTagTextField:(id)a3 userDidCreateTagWithName:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE2DF28], "sanitizedTagName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[DOCTagEditorViewController isAddingTag](self, "isAddingTag") || !v6)
  {
    -[DOCTagEditorViewController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2DF20]), "initWithDisplayName:labelIndex:type:", v5, objc_msgSend(v10, "selectedColor"), 1);
    objc_msgSend(MEMORY[0x24BE2DF28], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "insertTag:atIndex:", v11, 0);

    if (v7)
    {
      -[DOCTagEditorViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tagEditor:userDidCreateTag:", self, v11);

      -[DOCTagEditorViewController selectTag:](self, "selectTag:", v11);
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)selectTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DOCTagEditorViewController intersectionSelectedTags](self, "intersectionSelectedTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[DOCTagEditorViewController unionSelectedTags](self, "unionSelectedTags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  -[DOCTagEditorViewController setUserChangedTags:](self, "setUserChangedTags:", 1);
  -[DOCTagEditorViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tagEditor:userDidSelectTag:", self, v4);

}

- (void)deselectTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DOCTagEditorViewController intersectionSelectedTags](self, "intersectionSelectedTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[DOCTagEditorViewController unionSelectedTags](self, "unionSelectedTags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  -[DOCTagEditorViewController setUserChangedTags:](self, "setUserChangedTags:", 1);
  -[DOCTagEditorViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tagEditor:userDidDeselectTag:", self, v4);

}

- (BOOL)useCompactColorPicker
{
  return self->_useCompactColorPicker;
}

- (void)setUseCompactColorPicker:(BOOL)a3
{
  self->_useCompactColorPicker = a3;
}

- (BOOL)delayResizingUntilAppeared
{
  return self->_delayResizingUntilAppeared;
}

- (void)setDelayResizingUntilAppeared:(BOOL)a3
{
  self->_delayResizingUntilAppeared = a3;
}

- (DOCTagEditorDelegate)delegate
{
  return (DOCTagEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (BOOL)isInfoInPopoverMode
{
  return self->_isInfoInPopoverMode;
}

- (BOOL)inTagListMode
{
  return self->_inTagListMode;
}

- (void)setInTagListMode:(BOOL)a3
{
  self->_inTagListMode = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (DOCAddTagView)addTagTextFieldView
{
  return self->_addTagTextFieldView;
}

- (void)setAddTagTextFieldView:(id)a3
{
  objc_storeStrong((id *)&self->_addTagTextFieldView, a3);
}

- (DOCTagEditorTextFieldCell)addTagCell
{
  return self->_addTagCell;
}

- (void)setAddTagCell:(id)a3
{
  objc_storeStrong((id *)&self->_addTagCell, a3);
}

- (NSLayoutConstraint)collectionViewHeightConstraint
{
  return self->_collectionViewHeightConstraint;
}

- (BOOL)isAddingTag
{
  return self->_addingTag;
}

- (NSMutableOrderedSet)discoveredTags
{
  return self->_discoveredTags;
}

- (NSMutableSet)intersectionSelectedTags
{
  return self->_intersectionSelectedTags;
}

- (void)setIntersectionSelectedTags:(id)a3
{
  objc_storeStrong((id *)&self->_intersectionSelectedTags, a3);
}

- (NSMutableSet)unionSelectedTags
{
  return self->_unionSelectedTags;
}

- (void)setUnionSelectedTags:(id)a3
{
  objc_storeStrong((id *)&self->_unionSelectedTags, a3);
}

- (BOOL)userChangedTags
{
  return self->_userChangedTags;
}

- (void)setUserChangedTags:(BOOL)a3
{
  self->_userChangedTags = a3;
}

- (NSString)navigationTitleForTagListOnly
{
  return self->_navigationTitleForTagListOnly;
}

- (void)setNavigationTitleForTagListOnly:(id)a3
{
  objc_storeStrong((id *)&self->_navigationTitleForTagListOnly, a3);
}

- (NSString)navigationTitleForTagListInInfoPanel
{
  return self->_navigationTitleForTagListInInfoPanel;
}

- (void)setNavigationTitleForTagListInInfoPanel:(id)a3
{
  objc_storeStrong((id *)&self->_navigationTitleForTagListInInfoPanel, a3);
}

- (NSString)navigationTitleForTagMaker
{
  return self->_navigationTitleForTagMaker;
}

- (void)setNavigationTitleForTagMaker:(id)a3
{
  objc_storeStrong((id *)&self->_navigationTitleForTagMaker, a3);
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_navigationTitleForTagMaker, 0);
  objc_storeStrong((id *)&self->_navigationTitleForTagListInInfoPanel, 0);
  objc_storeStrong((id *)&self->_navigationTitleForTagListOnly, 0);
  objc_storeStrong((id *)&self->_unionSelectedTags, 0);
  objc_storeStrong((id *)&self->_intersectionSelectedTags, 0);
  objc_storeStrong((id *)&self->_discoveredTags, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_addTagCell, 0);
  objc_storeStrong((id *)&self->_addTagTextFieldView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_userTags, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_21EA4C000, v3, OS_LOG_TYPE_DEBUG, "User did add tag %@ to items: %@", v5, 0x16u);

}

void __69__DOCTagEditorViewController_scheduleSetTagsOperationWithTag_adding___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  __int16 v7;
  uint8_t v8[22];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  v9 = v7;
  v10 = a3;
  _os_log_error_impl(&dword_21EA4C000, v5, OS_LOG_TYPE_ERROR, "Failed to add tag %@ on items: %@. Error: %@", v8, 0x20u);

}

@end
