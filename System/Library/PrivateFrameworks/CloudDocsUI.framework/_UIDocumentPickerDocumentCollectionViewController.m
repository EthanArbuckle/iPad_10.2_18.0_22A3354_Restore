@implementation _UIDocumentPickerDocumentCollectionViewController

- (_UIDocumentPickerDocumentCollectionViewController)initWithModel:(id)a3
{
  id v4;
  _UIDocumentPickerFlowLayout *v5;
  _UIDocumentPickerTableLayout *v6;
  _UIDocumentPickerDocumentCollectionViewController *v7;
  _UIDocumentPickerDocumentCollectionViewController *v8;
  _UIDocumentPickerDocumentCollectionView *v9;
  uint64_t v10;
  _UIDocumentPickerDocumentCollectionView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  UIViewControllerPreviewing *viewControllerPreviewContext;
  objc_super v40;

  v4 = a3;
  v5 = objc_alloc_init(_UIDocumentPickerFlowLayout);
  +[_UIDocumentPickerCell defaultSizeForCellStyle:traitCollection:](_UIDocumentPickerCell, "defaultSizeForCellStyle:traitCollection:", 1, 0);
  -[UICollectionViewFlowLayout setItemSize:](v5, "setItemSize:");
  -[UICollectionViewFlowLayout setSectionInset:](v5, "setSectionInset:", 25.0, 0.0, 25.0, 0.0);
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v5, "setMinimumInteritemSpacing:", 0.0);
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](v5, "setMinimumLineSpacing:", 23.0);
  v6 = objc_alloc_init(_UIDocumentPickerTableLayout);
  -[UICollectionViewTableLayout setCellLayoutMarginsFollowReadableWidth:](v6, "setCellLayoutMarginsFollowReadableWidth:", 0);
  v40.receiver = self;
  v40.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  v7 = -[_UIDocumentPickerDocumentCollectionViewController initWithCollectionViewLayout:](&v40, sel_initWithCollectionViewLayout_, v5);
  v8 = v7;
  if (v7)
  {
    -[_UIDocumentPickerDocumentCollectionViewController setGridLayout:](v7, "setGridLayout:", v5);
    -[_UIDocumentPickerDocumentCollectionViewController setTableLayout:](v8, "setTableLayout:", v6);
    -[_UIDocumentPickerDocumentCollectionViewController _updateRowHeight](v8, "_updateRowHeight");
    -[_UIDocumentPickerDocumentCollectionViewController setModel:](v8, "setModel:", v4);
    v9 = [_UIDocumentPickerDocumentCollectionView alloc];
    -[_UIDocumentPickerDocumentCollectionViewController collectionView](v8, "collectionView");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "frame");
    v11 = -[_UIDocumentPickerDocumentCollectionView initWithFrame:collectionViewLayout:](v9, "initWithFrame:collectionViewLayout:", v5);
    -[_UIDocumentPickerDocumentCollectionViewController setCollectionView:](v8, "setCollectionView:", v11);

    -[_UIDocumentPickerDocumentCollectionViewController collectionView](v8, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDataSource:", v8);

    -[_UIDocumentPickerDocumentCollectionViewController collectionView](v8, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v8);

    -[_UIDocumentPickerDocumentCollectionViewController collectionView](v8, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPrefetchingEnabled:", 0);

    -[_UIDocumentPickerDocumentCollectionViewController collectionView](v8, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlwaysBounceVertical:", 1);

    -[_UIDocumentPickerDocumentCollectionViewController collectionView](v8, "collectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("_UIDocumentPickerDocumentCellIdentifier"));

    -[_UIDocumentPickerDocumentCollectionViewController collectionView](v8, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsMultipleSelectionDuringEditing:", 1);

    -[_UIDocumentPickerDocumentCollectionViewController model](v8, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v18, "afterInitialUpdate");

    if ((v10 & 1) == 0)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
      -[_UIDocumentPickerDocumentCollectionViewController setInitialActivityView:](v8, "setInitialActivityView:", v19);

      -[_UIDocumentPickerDocumentCollectionViewController initialActivityView](v8, "initialActivityView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[_UIDocumentPickerDocumentCollectionViewController view](v8, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerDocumentCollectionViewController initialActivityView](v8, "initialActivityView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

      -[_UIDocumentPickerDocumentCollectionViewController initialActivityView](v8, "initialActivityView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "centerXAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerDocumentCollectionViewController view](v8, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "centerXAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setActive:", 1);

      -[_UIDocumentPickerDocumentCollectionViewController initialActivityView](v8, "initialActivityView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "centerYAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerDocumentCollectionViewController view](v8, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "centerYAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setActive:", 1);

      -[_UIDocumentPickerDocumentCollectionViewController initialActivityView](v8, "initialActivityView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "startAnimating");

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v8, sel__dynamicTypeSizeChanged_, *MEMORY[0x24BDF7670], 0);

    v35 = (id)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v8, sel__unlockAnimations, 0, 0, 0.5);
    -[_UIDocumentPickerDocumentCollectionViewController collectionView](v8, "collectionView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerDocumentCollectionViewController registerForPreviewingWithDelegate:sourceView:](v8, "registerForPreviewingWithDelegate:sourceView:", v8, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    viewControllerPreviewContext = v8->_viewControllerPreviewContext;
    v8->_viewControllerPreviewContext = (UIViewControllerPreviewing *)v37;

  }
  return v8;
}

- (id)itemForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)actionViewForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_unlockAnimations
{
  -[_UIDocumentPickerDocumentCollectionViewController setUpdatesMayAnimate:](self, "setUpdatesMayAnimate:", 1);
}

- (void)_updateIconSpacing
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double Width;
  void *v17;
  void *v18;
  char v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  unint64_t v26;
  CGFloat v27;
  double v28;
  uint64_t v29;
  double v30;
  id v31;
  CGRect v32;
  CGRect v33;

  -[_UIDocumentPickerDocumentCollectionViewController gridLayout](self, "gridLayout");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDocumentPickerCell defaultSizeForCellStyle:traitCollection:](_UIDocumentPickerCell, "defaultSizeForCellStyle:traitCollection:", 1, v3);
  v5 = v4;
  v29 = v6;

  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v32.origin.x = v9;
  v32.origin.y = v11;
  v32.size.width = v13;
  v32.size.height = v15;
  Width = CGRectGetWidth(v32);
  -[_UIDocumentPickerDocumentCollectionViewController traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_valueForTraitNamed:", CFSTR("TightMargins"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = 2.0;
  v21 = 2.0;
  if ((v19 & 1) == 0)
  {
    -[_UIDocumentPickerDocumentCollectionViewController traitCollection](self, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_valueForTraitNamed:", CFSTR("CompactIcons"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");

    if (v24)
      v21 = 15.0;
    else
      v21 = 25.0;
    if (v24)
      v20 = 15.5;
    else
      v20 = 25.0;
  }
  v25 = Width / (v5 * 1.35);
  if ((unint64_t)v25 <= 3)
    v26 = 3;
  else
    v26 = (unint64_t)v25;
  objc_msgSend(v31, "setMinimumLineSpacing:", 23.0, v29);
  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  v27 = (CGRectGetWidth(v33) - (double)v26 * v5) / (double)(v26 + 1);
  v28 = floor(v27 * 0.5);
  objc_msgSend(v31, "setSectionInset:", v20, v28, v21, v28);
  objc_msgSend(v31, "setItemSize:", v5 + v27, v30);

}

- (BOOL)_smallCells
{
  return -[_UIDocumentPickerDocumentCollectionViewController displayMode](self, "displayMode") == 3;
}

- (void)_updateRowHeight
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[_UIDocumentPickerDocumentCollectionViewController tableLayout](self, "tableLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cellStyle");
  -[_UIDocumentPickerDocumentCollectionViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDocumentPickerCell defaultSizeForCellStyle:traitCollection:](_UIDocumentPickerCell, "defaultSizeForCellStyle:traitCollection:", v4, v5);

  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v7 = v6;
  -[_UIDocumentPickerDocumentCollectionViewController tableLayout](self, "tableLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRowHeight:", v7);

}

- (void)_dynamicTypeSizeChanged:(id)a3
{
  void *v4;
  id v5;

  -[_UIDocumentPickerDocumentCollectionViewController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController traitCollectionDidChange:](self, "traitCollectionDidChange:", v4);

  -[_UIDocumentPickerDocumentCollectionViewController _updateIconSpacing](self, "_updateIconSpacing");
  -[_UIDocumentPickerDocumentCollectionViewController _updateRowHeight](self, "_updateRowHeight");
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)dealloc
{
  objc_super v3;

  -[_UIDocumentPickerDocumentCollectionViewController setMonitoring:](self, "setMonitoring:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  -[_UIDocumentPickerDocumentCollectionViewController dealloc](&v3, sel_dealloc);
}

- (void)containersChangedWithSnapshot:(id)a3 differences:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _UIDocumentPickerDocumentCollectionViewController *v24;

  v6 = a3;
  v7 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController initialActivityView](self, "initialActivityView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopAnimating");

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF80D8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF80D0]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF80E8]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v12, "count") == 0;

      }
    }

  }
  else
  {
    v10 = 0;
  }
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke;
  v22[3] = &unk_24E43A858;
  v14 = v7;
  v23 = v14;
  v24 = self;
  v15 = (void (**)(_QWORD))MEMORY[0x2207C9E60](v22);
  if (v10)
  {
    -[_UIDocumentPickerDocumentCollectionViewController setModelObjects:](self, "setModelObjects:", v6);
    v15[2](v15);
  }
  else if (objc_msgSend(v14, "count") && self->_updatesMayAnimate)
  {
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __95___UIDocumentPickerDocumentCollectionViewController_containersChangedWithSnapshot_differences___block_invoke_2;
    v19[3] = &unk_24E43AD30;
    v19[4] = self;
    v20 = v6;
    v21 = v14;
    v16 = (void *)MEMORY[0x2207C9E60](v19);
    -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "performBatchUpdates:completion:", v16, 0);

    v15[2](v15);
  }
  else
  {
    -[_UIDocumentPickerDocumentCollectionViewController setModelObjects:](self, "setModelObjects:", v6);
    -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadData");

  }
}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[_UIDocumentPickerDocumentCollectionViewController setMonitoring:](self, "setMonitoring:", a3 != 0);
  -[_UIDocumentPickerDocumentCollectionViewController model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController setModelObjects:](self, "setModelObjects:", v5);

  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)setMonitoring:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_monitoring != a3)
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_modelChanged_, CFSTR("_UIDocumentPickerModelUpdatedNotification"), self->_model);

      -[_UIDocumentPickerDocumentCollectionViewController model](self, "model");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startMonitoringChanges");
    }
    else
    {
      objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_UIDocumentPickerModelUpdatedNotification"), self->_model);
    }

    self->_monitoring = v3;
  }
}

- (void)modelChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("model"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("changes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerDocumentCollectionViewController containersChangedWithSnapshot:differences:](self, "containersChangedWithSnapshot:differences:", v14, v7);
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF80D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDF80D8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "count") != 0;

    }
  }
  else
  {
    v9 = 1;
  }
  -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemsOrSelectionDidChange:", v9);

  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  -[_UIDocumentPickerDocumentCollectionViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[_UIDocumentPickerDocumentCollectionViewController _updateIconSpacing](self, "_updateIconSpacing");
}

- (void)setDisplayMode:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (self->_displayMode != a3)
  {
    self->_displayMode = a3;
    if (a3 == 1)
    {
      -[_UIDocumentPickerDocumentCollectionViewController gridLayout](self, "gridLayout");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCellStyle:", 1);
      -[_UIDocumentPickerDocumentCollectionViewController _updateIconSpacing](self, "_updateIconSpacing");
    }
    else
    {
      if (a3 == 3)
      {
        -[_UIDocumentPickerDocumentCollectionViewController tableLayout](self, "tableLayout");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v4;
        v5 = 3;
      }
      else
      {
        if (a3 != 2)
        {
          v7 = 0;
          goto LABEL_10;
        }
        -[_UIDocumentPickerDocumentCollectionViewController tableLayout](self, "tableLayout");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v4;
        v5 = 2;
      }
      objc_msgSend(v4, "setCellStyle:", v5);
      -[_UIDocumentPickerDocumentCollectionViewController _updateRowHeight](self, "_updateRowHeight");
    }
LABEL_10:
    -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCollectionViewLayout:animated:", v7, 1);

  }
}

- (void)setContentSizeAdjustment:(double)a3
{
  void *v5;
  id v6;

  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentSizeAdjustment:", a3);

  -[_UIDocumentPickerDocumentCollectionViewController collectionViewLayout](self, "collectionViewLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentSizeAdjustment:", a3);

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[_UIDocumentPickerDocumentCollectionViewController modelObjects](self, "modelObjects", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("_UIDocumentPickerDocumentCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 7);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Delete..."), CFSTR("Delete…"), CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Rename..."), CFSTR("Rename…"), CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Share..."), CFSTR("Share…"), CFSTR("Localizable"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Move..."), CFSTR("Move…"), CFSTR("Localizable"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Info"), CFSTR("Info"), CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("More..."), CFSTR("More…"), CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", v34, sel__deleteAction_);
    objc_msgSend(v9, "addObject:", v16);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", v35, sel__renameAction_);
    objc_msgSend(v9, "addObject:", v17);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", v36, sel__activityAction_);
    objc_msgSend(v9, "addObject:", v18);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", v31, sel__moveAction_);
    objc_msgSend(v9, "addObject:", v19);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", v32, sel__infoAction_);
    objc_msgSend(v9, "addObject:", v20);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", v33, sel__moreAction_);
    objc_msgSend(v9, "addObject:", v21);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Debug..."), CFSTR("Debug…"), CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", v23, sel__showPickableDiagnostic);
    objc_msgSend(v9, "addObject:", v24);

    -[_UIDocumentPickerDocumentCollectionViewController setActions:](self, "setActions:", v9);
  }
  objc_msgSend(v7, "actions", v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    -[_UIDocumentPickerDocumentCollectionViewController actions](self, "actions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActions:", v26);

  }
  objc_msgSend(v7, "setCollectionView:", self);
  -[_UIDocumentPickerDocumentCollectionViewController modelObjects](self, "modelObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v6, "row");

  objc_msgSend(v27, "objectAtIndex:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setItem:", v29);
  return v7;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  int v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = objc_msgSend(v10, "isEditing");
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEditing");

  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEditing:", objc_msgSend(v9, "isEditing"));

  if (v6 == v8)
    objc_msgSend(v10, "updateForEditingState:", 0);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController modelObjects](self, "modelObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldHighlightItem:", v8);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v5 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didHighlightItem:", v7);

  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v5 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didUnhighlightItem:", v7);

  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v5 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController modelObjects](self, "modelObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerDocumentCollectionViewController firstResponder](self, "firstResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v7) = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
  {
    -[_UIDocumentPickerDocumentCollectionViewController firstResponder](self, "firstResponder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endEditing:", 0);

  }
  if (objc_msgSend(v8, "pickable"))
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "shouldSelectItem:", v8);

    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_UIDocumentPickerDocumentCollectionViewController isEditing](self, "isEditing");
  -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "itemsOrSelectionDidChange:", 1);

    }
  }
  else
  {
    objc_msgSend(v11, "didSelectItem:", v9);

    objc_msgSend(v16, "deselectItemAtIndexPath:animated:", v6, 1);
  }
  objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMenuVisible:", 0);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  char v6;
  id v7;

  if (-[_UIDocumentPickerDocumentCollectionViewController isEditing](self, "isEditing", a3, a4))
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemsOrSelectionDidChange:", 1);

    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "prepareForReuse", a3);
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 editingStyleForRowAtIndexPath:(id)a5
{
  return (-[_UIDocumentPickerDocumentCollectionViewController isEditing](self, "isEditing", a3, a4, a5) & 1) == 0
      && -[_UIDocumentPickerDocumentCollectionViewController displayMode](self, "displayMode") != 3;
}

- (BOOL)supportsActions
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_opt_respondsToSelector() & 1) != 0
      && -[_UIDocumentPickerDocumentCollectionViewController displayMode](self, "displayMode") != 3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)collectionView:(id)a3 tableLayout:(id)a4 accessoryButtonTappedForRowWithIndexPath:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerDocumentCollectionViewController performAction:forRow:view:](self, "performAction:forRow:view:", 2, v6, v8);
}

- (void)performAction:(int64_t)a3 forRow:(id)a4 view:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v8 = a5;
  v9 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modelObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "row");

  objc_msgSend(v11, "objectAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79___UIDocumentPickerDocumentCollectionViewController_performAction_forRow_view___block_invoke;
  v15[3] = &unk_24E43A808;
  v15[4] = self;
  objc_msgSend(v14, "performAction:item:view:completion:", a3, v13, v8, v15);

}

- (void)_showMoreOptionsForRow:(id)a3 view:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;

  v6 = a3;
  v7 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceView:", v7);

  objc_msgSend(v7, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v11, "popoverPresentationController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSourceRect:", v14, v16, v18, v20);

  v22 = objc_msgSend(v10, "isActionApplicableForItem:", 3);
  v23 = objc_msgSend(v10, "isActionApplicableForItem:", 4);
  v24 = objc_msgSend(v10, "isActionApplicableForItem:", 5);
  v25 = MEMORY[0x24BDAC760];
  if (v22)
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "shouldShowAction:", 3);

    if (v27)
    {
      v28 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Rename..."), CFSTR("Rename…"), CFSTR("Localizable"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke;
      v55[3] = &unk_24E43B350;
      v55[4] = self;
      v56 = v6;
      v57 = v7;
      objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 0, v55);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v31);

      v25 = MEMORY[0x24BDAC760];
    }
  }
  if (v23)
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "shouldShowAction:", 4);

    if (v33)
    {
      v34 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Share..."), CFSTR("Share…"), CFSTR("Localizable"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v25;
      v52[1] = 3221225472;
      v52[2] = __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_2;
      v52[3] = &unk_24E43B350;
      v52[4] = self;
      v53 = v6;
      v54 = v7;
      objc_msgSend(v34, "actionWithTitle:style:handler:", v36, 0, v52);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v37);

    }
  }
  if (v24)
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "shouldShowAction:", 5);

    if (v39)
    {
      v40 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Move..."), CFSTR("Move…"), CFSTR("Localizable"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v25;
      v49[1] = 3221225472;
      v49[2] = __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_3;
      v49[3] = &unk_24E43B350;
      v49[4] = self;
      v50 = v6;
      v51 = v7;
      objc_msgSend(v40, "actionWithTitle:style:handler:", v42, 0, v49);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addAction:", v43);

    }
  }
  v44 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v25;
  v48[1] = 3221225472;
  v48[2] = __81___UIDocumentPickerDocumentCollectionViewController__showMoreOptionsForRow_view___block_invoke_4;
  v48[3] = &unk_24E43B378;
  v48[4] = self;
  objc_msgSend(v44, "actionWithTitle:style:handler:", v46, 1, v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v47);

  -[_UIDocumentPickerDocumentCollectionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (id)collectionView:(id)a3 tableLayout:(id)a4 trailingSwipeActionsForRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _UIDocumentPickerDocumentCollectionViewController *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  int v23;
  int v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  char v39;
  _QWORD v40[4];
  id v41;
  _QWORD *v42;
  _QWORD v43[6];
  _QWORD v44[6];
  _QWORD v45[5];
  _UIDocumentPickerDocumentCollectionViewController *v46;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[_UIDocumentPickerDocumentCollectionViewController supportsActions](self, "supportsActions"))
  {
    -[_UIDocumentPickerDocumentCollectionViewController model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v10, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__2;
    v45[4] = __Block_byref_object_dispose__2;
    v14 = self;
    v46 = v14;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](v14, "serviceViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "shouldShowAction:", 1))
    {
      v17 = objc_msgSend(v13, "isActionApplicableForItem:", 1);

      if (v17)
      {
        v18 = (void *)MEMORY[0x24BDF6938];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("More"), CFSTR("More"), CFSTR("Localizable"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke;
        v44[3] = &unk_24E43B3A0;
        v44[5] = v45;
        v21 = v44;
        v44[4] = v10;
        objc_msgSend(v18, "actionWithStyle:title:handler:", 0, v20, v44);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setResetsSwipedRow:", 0);
        objc_msgSend(v15, "addObject:", v22);
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {

    }
    v23 = objc_msgSend(v13, "isActionApplicableForItem:", 3);
    v24 = objc_msgSend(v13, "isActionApplicableForItem:", 4);
    v25 = objc_msgSend(v13, "isActionApplicableForItem:", 5);
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](v14, "serviceViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "shouldShowAction:", 3) & v23 & 1) == 0)
    {
      -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](v14, "serviceViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "shouldShowAction:", 4) & v24) != 1)
      {
        -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](v14, "serviceViewController");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "shouldShowAction:", 5) & v25;

        if ((v39 & 1) == 0)
        {
LABEL_13:
          -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](v14, "serviceViewController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "shouldShowAction:", 0))
          {
            v32 = objc_msgSend(v13, "isActionApplicableForItem:", 0);

            if (!v32)
            {
LABEL_17:
              _Block_object_dispose(v45, 8);

              goto LABEL_18;
            }
            v33 = (void *)MEMORY[0x24BDF6938];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Delete"), CFSTR("Delete"), CFSTR("Localizable"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v40[0] = MEMORY[0x24BDAC760];
            v40[1] = 3221225472;
            v40[2] = __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke_3;
            v40[3] = &unk_24E43B3A0;
            v42 = v45;
            v41 = v10;
            objc_msgSend(v33, "actionWithStyle:title:handler:", 1, v35, v40);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v36, "setResetsSwipedRow:", 0);
            objc_msgSend(v15, "addObject:", v36);

            v31 = v41;
          }

          goto LABEL_17;
        }
        goto LABEL_11;
      }

    }
LABEL_11:
    v28 = (void *)MEMORY[0x24BDF6938];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("More"), CFSTR("More"), CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __118___UIDocumentPickerDocumentCollectionViewController_collectionView_tableLayout_trailingSwipeActionsForRowAtIndexPath___block_invoke_2;
    v43[3] = &unk_24E43B3A0;
    v43[5] = v45;
    v21 = v43;
    v43[4] = v10;
    objc_msgSend(v28, "actionWithStyle:title:handler:", 0, v30, v43);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setResetsSwipedRow:", 0);
    objc_msgSend(v15, "addObject:", v22);
    goto LABEL_12;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (int64_t)collectionView:(id)a3 tableLayout:(id)a4 indentationLevelForRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v7 = a5;
  if (objc_msgSend(a4, "cellStyle") == 3)
  {
    -[_UIDocumentPickerDocumentCollectionViewController model](self, "model");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "indentationLevel");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  char isKindOfClass;
  void *v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  if (-[_UIDocumentPickerDocumentCollectionViewController isEditing](self, "isEditing") != a3)
  {
    -[_UIDocumentPickerDocumentCollectionViewController firstResponder](self, "firstResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[_UIDocumentPickerDocumentCollectionViewController firstResponder](self, "firstResponder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endEditing:", 0);

    }
    v10.receiver = self;
    v10.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
    -[_UIDocumentPickerDocumentCollectionViewController setEditing:animated:](&v10, sel_setEditing_animated_, v5, v4);
  }
}

- (NSArray)indexPathsForSelectedItems
{
  void *v2;
  void *v3;

  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setIndexPathsForSelectedItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)setSortView:(id)a3
{
  _UIDocumentPickerSortOrderView *v5;
  _UIDocumentPickerSortOrderView *sortView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v5 = (_UIDocumentPickerSortOrderView *)a3;
  sortView = self->_sortView;
  if (sortView != v5)
  {
    -[_UIDocumentPickerSortOrderView removeFromSuperview](sortView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_sortView, a3);
    -[_UIDocumentPickerDocumentCollectionViewController updateContentInset](self, "updateContentInset");
    if (v5)
    {
      -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", v5);

      -[_UIDocumentPickerSortOrderView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v17 = (void *)MEMORY[0x24BDD1628];
      -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView widthAnchor](v5, "widthAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v19;
      -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leftAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView leftAnchor](v5, "leftAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView topAnchor](v5, "topAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDocumentPickerSortOrderView frame](self->_sortView, "frame");
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activateConstraints:", v16);

      -[_UIDocumentPickerDocumentCollectionViewController setShouldHideSortBar:](self, "setShouldHideSortBar:", 1);
      -[_UIDocumentPickerSortOrderView setListMode:](v5, "setListMode:", -[_UIDocumentPickerDocumentCollectionViewController displayMode](self, "displayMode"));
    }
  }

}

- (void)updateContentInset
{
  _UIDocumentPickerSortOrderView *sortView;
  double v4;
  double v5;
  UIView *pinnedHeaderView;
  double v7;
  double v8;
  void *v9;
  id v10;

  sortView = self->_sortView;
  if (sortView)
  {
    -[_UIDocumentPickerSortOrderView bounds](sortView, "bounds");
    v5 = v4 + 0.0;
  }
  else
  {
    v5 = 0.0;
  }
  pinnedHeaderView = self->_pinnedHeaderView;
  if (pinnedHeaderView)
  {
    -[UIView bounds](pinnedHeaderView, "bounds");
    v8 = v7;
    v5 = v5 + v7;
    -[_UIDocumentPickerDocumentCollectionViewController setContentSizeAdjustment:](self, "setContentSizeAdjustment:", -v7);
    -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setScrollIndicatorInsets:", v8, 0.0, 0.0, 0.0);

  }
  -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentInset:", v5, 0.0, 0.0, 0.0);

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UIDocumentPickerDocumentCollectionViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentViewController:animated:completion:", v8, v6, v9);

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
    -[_UIDocumentPickerDocumentCollectionViewController presentViewController:animated:completion:](&v11, sel_presentViewController_animated_completion_, v8, v6, v9);
  }

}

- (void)willPresentSearchController:(id)a3
{
  id v3;

  -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentInset:", 0.0, 0.0, 0.0, 0.0);

}

- (void)willDismissSearchController:(id)a3
{
  -[_UIDocumentPickerDocumentCollectionViewController updateContentInset](self, "updateContentInset", a3);
  -[_UIDocumentPickerDocumentCollectionViewController ensureSortViewInvisible](self, "ensureSortViewInvisible");
}

- (void)setPinnedHeaderView:(id)a3 animated:(BOOL)a4
{
  UIView *v6;
  UIView *pinnedHeaderView;
  UIView *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  UIView *v18;

  v6 = (UIView *)a3;
  pinnedHeaderView = self->_pinnedHeaderView;
  if (pinnedHeaderView != v6)
  {
    v18 = v6;
    v8 = pinnedHeaderView;
    -[UIView removeFromSuperview](v8, "removeFromSuperview");
    objc_storeStrong((id *)&self->_pinnedHeaderView, a3);
    -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v18);

    -[_UIDocumentPickerDocumentCollectionViewController updateContentInset](self, "updateContentInset");
    -[_UIDocumentPickerDocumentCollectionViewController updatePinnedHeader](self, "updatePinnedHeader");
    -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v12 = v11;

    if (v18)
    {
      -[UIView frame](v18, "frame");
      v14 = v12 - v13;
    }
    else
    {
      -[UIView frame](v8, "frame");
      v14 = v12 + v15;
    }
    -[UIView bounds](self->_pinnedHeaderView, "bounds");
    if (v14 < -v16)
      v14 = -v16;
    -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentOffset:animated:", 0, 0.0, v14);

    v6 = v18;
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v21;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  id v29;

  y = a4.y;
  v29 = a3;
  v8 = a5->y;
  -[UIView frame](self->_pinnedHeaderView, "frame");
  v10 = v8 + v9;
  -[_UIDocumentPickerDocumentCollectionViewController sortView](self, "sortView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController sortView](self, "sortView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  objc_msgSend(v12, "convertRect:toView:", v29);
  v15 = v14;
  v17 = v16;

  v18 = v15 + v17;
  if (y > 0.0)
  {
    if (v10 <= v15 || v10 >= v18)
      goto LABEL_26;
    goto LABEL_24;
  }
  if (y < 0.0)
  {
    if (v10 <= v15 || v10 >= v18)
      goto LABEL_26;
LABEL_23:
    objc_msgSend(v29, "contentOffset", v18);
    v25 = v24;
    -[UIView bounds](self->_pinnedHeaderView, "bounds");
    v27 = v26;
LABEL_25:
    a5->x = v25;
    a5->y = -v27;
    goto LABEL_26;
  }
  v21 = v15 + v17 * 0.5;
  if (v10 > v15 && v10 <= v21)
  {
LABEL_24:
    objc_msgSend(v29, "contentOffset", v18);
    v25 = v28;
    objc_msgSend(v29, "contentInset");
    goto LABEL_25;
  }
  if (v10 >= v21 && v10 < v18)
    goto LABEL_23;
LABEL_26:

}

- (void)updatePinnedHeader
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  -[UIView setFrame:](self->_pinnedHeaderView, "setFrame:", v5, v7, v9, 44.0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  -[_UIDocumentPickerDocumentCollectionViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[_UIDocumentPickerDocumentCollectionViewController setShouldHideSortBar:](self, "setShouldHideSortBar:", 1);
  -[_UIDocumentPickerDocumentCollectionViewController updateContentInset](self, "updateContentInset");
  -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[_UIDocumentPickerDocumentCollectionViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "semanticContentAttribute");
  -[_UIDocumentPickerDocumentCollectionViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSemanticContentAttribute:", v8);

  v10.receiver = self;
  v10.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  -[_UIDocumentPickerDocumentCollectionViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerDocumentCollectionViewController;
  -[_UIDocumentPickerDocumentCollectionViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  if (-[_UIDocumentPickerDocumentCollectionViewController shouldHideSortBar](self, "shouldHideSortBar"))
  {
    -[_UIDocumentPickerDocumentCollectionViewController ensureSortViewInvisible](self, "ensureSortViewInvisible");
    -[_UIDocumentPickerDocumentCollectionViewController setShouldHideSortBar:](self, "setShouldHideSortBar:", 0);
  }
}

- (void)ensureSortViewInvisible
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  -[UIView bounds](self->_pinnedHeaderView, "bounds");
  v7 = -v6;

  if (v5 < v7)
  {
    -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self->_pinnedHeaderView, "bounds");
    objc_msgSend(v9, "setContentOffset:animated:", 0, 0.0, -v8);

  }
}

- (void)scrollSortViewToVisible
{
  void *v3;
  double v4;
  id v5;

  -[_UIDocumentPickerDocumentCollectionViewController setShouldHideSortBar:](self, "setShouldHideSortBar:", 0);
  -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerDocumentCollectionViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  objc_msgSend(v5, "setContentOffset:animated:", 0, 0.0, -v4);

}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  -[_UIDocumentPickerDocumentCollectionViewController itemForLocation:](self, "itemForLocation:", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) != 0))
  {
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previewViewControllerForItem:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_setAssociatedObject(v9, &viewControllerItemKey, v5, (void *)0x301);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[_UIDocumentPickerDocumentCollectionViewController previewActionItemsForItem:](self, "previewActionItemsForItem:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPreviewActionItems:", v10);

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)previewActionItemsForItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __79___UIDocumentPickerDocumentCollectionViewController_previewActionItemsForItem___block_invoke;
  v19[3] = &unk_24E43B3F0;
  v19[4] = self;
  v20 = v4;
  v6 = v5;
  v21 = v6;
  v7 = v4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2207C9E60](v19);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Rename..."), CFSTR("Rename…"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v10, 3);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Delete..."), CFSTR("Delete…"), CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v12, 0);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Share..."), CFSTR("Share…"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v14, 4);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Move..."), CFSTR("Move…"), CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, uint64_t))v8)[2](v8, v16, 5);

  v17 = v6;
  return v17;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShowAction:", 6);

  if (v8)
  {
    objc_getAssociatedObject(v6, &viewControllerItemKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerDocumentCollectionViewController serviceViewController](self, "serviceViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sourceView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performAction:item:view:completion:", 6, v9, v11, &__block_literal_global_9);

  }
  else
  {
    -[_UIDocumentPickerDocumentCollectionViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v6, 1);
  }

  objc_setAssociatedObject(v6, &viewControllerItemKey, 0, (void *)0x301);
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (_UIDocumentPickerServiceViewController)serviceViewController
{
  return (_UIDocumentPickerServiceViewController *)objc_loadWeakRetained((id *)&self->_serviceViewController);
}

- (void)setServiceViewController:(id)a3
{
  objc_storeWeak((id *)&self->_serviceViewController, a3);
}

- (_UIDocumentPickerContainerModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (_UIDocumentPickerFlowLayout)gridLayout
{
  return self->_gridLayout;
}

- (void)setGridLayout:(id)a3
{
  objc_storeStrong((id *)&self->_gridLayout, a3);
}

- (_UIDocumentPickerTableLayout)tableLayout
{
  return self->_tableLayout;
}

- (void)setTableLayout:(id)a3
{
  objc_storeStrong((id *)&self->_tableLayout, a3);
}

- (BOOL)monitoring
{
  return self->_monitoring;
}

- (BOOL)shouldHideSortBar
{
  return self->_shouldHideSortBar;
}

- (void)setShouldHideSortBar:(BOOL)a3
{
  self->_shouldHideSortBar = a3;
}

- (_UIDocumentPickerSortOrderView)sortView
{
  return self->_sortView;
}

- (UIView)pinnedHeaderView
{
  return self->_pinnedHeaderView;
}

- (void)setPinnedHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedHeaderView, a3);
}

- (NSArray)modelObjects
{
  return self->_modelObjects;
}

- (void)setModelObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (BOOL)updatesMayAnimate
{
  return self->_updatesMayAnimate;
}

- (void)setUpdatesMayAnimate:(BOOL)a3
{
  self->_updatesMayAnimate = a3;
}

- (UIActivityIndicatorView)initialActivityView
{
  return self->_initialActivityView;
}

- (void)setInitialActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_initialActivityView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialActivityView, 0);
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_pinnedHeaderView, 0);
  objc_storeStrong((id *)&self->_sortView, 0);
  objc_storeStrong((id *)&self->_tableLayout, 0);
  objc_storeStrong((id *)&self->_gridLayout, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_serviceViewController);
  objc_storeStrong((id *)&self->_viewControllerPreviewContext, 0);
}

@end
