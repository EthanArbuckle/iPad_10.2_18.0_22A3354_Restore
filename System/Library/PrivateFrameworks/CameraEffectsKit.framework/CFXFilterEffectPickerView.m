@implementation CFXFilterEffectPickerView

- (id)effectPickerNibName
{
  return CFSTR("CFXFilterEffectPickerView");
}

- (id)effectPickerCellNibName
{
  return CFSTR("CFXFilterPickerCollectionViewCell");
}

- (id)effectPickerCellReuseIdentifier
{
  return CFSTR("EffectCell");
}

- (BOOL)isDisplayingCompactLayout
{
  return !-[CFXFilterEffectPickerView isDisplayingExpandedLayout](self, "isDisplayingExpandedLayout");
}

- (void)configureCell:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int64_t v7;
  double v8;
  int64_t v9;
  void *v10;
  objc_super v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v4 = a3;
  objc_msgSend(v4, "setCompactMode:", -[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout"));
  -[CFXFilterEffectPickerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldRotateCellsForDeviceOrientation");

  if (v6)
  {
    v7 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
    v8 = 0.0;
    if (v7 != 1)
    {
      if (+[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation", 0.0) == 4)
      {
        v8 = -1.57079633;
      }
      else if (+[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation") == 3)
      {
        v8 = 1.57079633;
      }
      else
      {
        v9 = +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation");
        v8 = 3.14159265;
        if (v9 != 2)
          v8 = 0.0;
      }
    }
    CGAffineTransformMakeRotation(&v13, -v8);
    objc_msgSend(v4, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    objc_msgSend(v10, "setTransform:", &v12);

  }
  v11.receiver = self;
  v11.super_class = (Class)CFXFilterEffectPickerView;
  -[CFXEffectPickerView configureCell:](&v11, sel_configureCell_, v4);

}

- (void)subviewsDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CFXFilterEffectPickerView;
  -[CFXEffectPickerView subviewsDidLoad](&v20, sel_subviewsDidLoad);
  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsMultipleSelection:", 0);

  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsHorizontalScrollIndicator:", 0);

  -[CFXFilterEffectPickerView collectionViewLayout](self, "collectionViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumLineSpacing:", 16.0);

  -[CFXFilterEffectPickerView collectionViewLayout](self, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimumInteritemSpacing:", 16.0);

  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInsetAdjustmentBehavior:", 2);

  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutoresizingMask:", 0);

  -[CFXFilterEffectPickerView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setTransfersScrollToContainer:", 0);

  -[CFXFilterEffectPickerView buildCompactSelectionViews](self, "buildCompactSelectionViews");
}

- (void)buildCompactSelectionViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
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
  id v23;

  -[CFXFilterEffectPickerView removeCompactSelectionViews](self, "removeCompactSelectionViews");
  v3 = (void *)objc_opt_new();
  -[CFXFilterEffectPickerView setCompactSelectionView:](self, "setCompactSelectionView:", v3);

  -[CFXFilterEffectPickerView compactSelectionView](self, "compactSelectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderWidth:", 3.0);

  -[CFXFilterEffectPickerView compactSelectionView](self, "compactSelectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", 12.0);

  +[CFXFilterPickerCollectionViewCell selectionColor](CFXFilterPickerCollectionViewCell, "selectionColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[CFXFilterEffectPickerView compactSelectionView](self, "compactSelectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBorderColor:", v9);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFilterEffectPickerView compactSelectionView](self, "compactSelectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  -[CFXFilterEffectPickerView compactSelectionView](self, "compactSelectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInteractionEnabled:", 0);

  -[CFXFilterEffectPickerView compactSelectionView](self, "compactSelectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CFXFilterEffectPickerView compactSelectionView](self, "compactSelectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFilterEffectPickerView addSubview:](self, "addSubview:", v16);

  v17 = (void *)objc_opt_new();
  -[CFXFilterEffectPickerView setCompactSelectedTitleView:](self, "setCompactSelectedTitleView:", v17);

  +[CFXFilterPickerCollectionViewCell selectionColor](CFXFilterPickerCollectionViewCell, "selectionColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFilterEffectPickerView compactSelectedTitleView](self, "compactSelectedTitleView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTextColor:", v18);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFilterEffectPickerView compactSelectedTitleView](self, "compactSelectedTitleView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  -[CFXFilterEffectPickerView compactSelectedTitleView](self, "compactSelectedTitleView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CFXFilterEffectPickerView compactSelectedTitleView](self, "compactSelectedTitleView");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXFilterEffectPickerView addSubview:](self, "addSubview:", v23);

}

- (void)removeCompactSelectionViews
{
  void *v3;
  id v4;

  -[CFXFilterEffectPickerView compactSelectedTitleView](self, "compactSelectedTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CFXFilterEffectPickerView compactSelectionView](self, "compactSelectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)configureCollectionViewLayout
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("compact");
  if ((a1 & 1) != 0)
    v2 = CFSTR("expanded");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "filter picker transitioning to %@ mode", (uint8_t *)&v3, 0xCu);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXFilterEffectPickerView;
  -[CFXFilterEffectPickerView layoutSubviews](&v3, sel_layoutSubviews);
  -[CFXFilterEffectPickerView configureCollectionViewLayout](self, "configureCollectionViewLayout");
}

- (void)reloadData
{
  void *v3;
  objc_super v4;

  -[CFXFilterEffectPickerView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXFilterEffectPickerView setCachedEffectCount:](self, "setCachedEffectCount:", objc_msgSend(v3, "numberOfEffectsInPickerView:", self));

  v4.receiver = self;
  v4.super_class = (Class)CFXFilterEffectPickerView;
  -[CFXEffectPickerView reloadData](&v4, sel_reloadData);
}

- (void)updatePreviewEffectsWhenReloadComplete
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXFilterEffectPickerView;
  -[CFXEffectPickerView updatePreviewEffectsWhenReloadComplete](&v3, sel_updatePreviewEffectsWhenReloadComplete);
  -[CFXFilterEffectPickerView CFX_selectInitialItem](self, "CFX_selectInitialItem");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout", a3))
  {
    -[CFXFilterEffectPickerView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "prepare");

    -[CFXFilterEffectPickerView indexPathForCenterOfCollectionView](self, "indexPathForCenterOfCollectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXFilterEffectPickerView setLastScrollIndexPath:](self, "setLastScrollIndexPath:", v5);

    -[CFXFilterEffectPickerView collectionView](self, "collectionView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentOffset");
    -[CFXFilterEffectPickerView setPreviousScrollOffset:](self, "setPreviousScrollOffset:");

  }
}

- (void)didScrollCollectionView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  double MidX;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  CGRect v25;

  v24.receiver = self;
  v24.super_class = (Class)CFXFilterEffectPickerView;
  -[CFXEffectPickerView didScrollCollectionView](&v24, sel_didScrollCollectionView);
  if (-[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout"))
  {
    -[CFXFilterEffectPickerView collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentOffset");
    -[CFXFilterEffectPickerView setPreviousScrollOffset:](self, "setPreviousScrollOffset:");

    -[CFXFilterEffectPickerView collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    v8 = v7;

    -[CFXFilterEffectPickerView layoutAttributesForNearestItemToCenterWithOffset:](self, "layoutAttributesForNearestItemToCenterWithOffset:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXFilterEffectPickerView lastScrollIndexPath](self, "lastScrollIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) == 0)
    {
      -[CFXFilterEffectPickerView collectionView](self, "collectionView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      MidX = CGRectGetMidX(v25);

      objc_msgSend(v9, "center");
      v16 = v15;
      -[CFXFilterEffectPickerView previousScrollOffset](self, "previousScrollOffset");
      if (v6 > v17)
      {
        if (MidX < v16 - 10.0)
          goto LABEL_12;
LABEL_7:
        -[CFXFilterEffectPickerView collectionView](self, "collectionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isTracking"))
        {

        }
        else
        {
          -[CFXFilterEffectPickerView collectionView](self, "collectionView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isDecelerating");

          if (!v20)
          {
LABEL_11:
            objc_msgSend(v9, "indexPath");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[CFXFilterEffectPickerView setLastScrollIndexPath:](self, "setLastScrollIndexPath:", v22);

            -[CFXFilterEffectPickerView lastScrollIndexPath](self, "lastScrollIndexPath");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[CFXFilterEffectPickerView CFX_updateTitleForCenterItemAtIndex:](self, "CFX_updateTitleForCenterItemAtIndex:", objc_msgSend(v23, "item"));

            goto LABEL_12;
          }
        }
        -[CFXFilterEffectPickerView selectionFeedbackGenerator](self, "selectionFeedbackGenerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "selectionChanged");

        goto LABEL_11;
      }
      if (MidX <= v16 + 10.0)
        goto LABEL_7;
    }
LABEL_12:

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (-[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout", a3))
  {
    if (!a4)
      -[CFXFilterEffectPickerView selectCenterItem](self, "selectCenterItem");
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (-[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout", a3))
    -[CFXFilterEffectPickerView selectCenterItem](self, "selectCenterItem");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  id v12;

  if (-[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout", a3, a4.x, a4.y))
  {
    -[CFXFilterEffectPickerView layoutAttributesForNearestItemToCenterWithOffset:](self, "layoutAttributesForNearestItemToCenterWithOffset:", a5->x, a5->y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v12 = v7;
      objc_msgSend(v7, "frame");
      v9 = v8;
      -[CFXFilterEffectPickerView collectionViewLayout](self, "collectionViewLayout");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sectionInset");
      a5->x = v9 - v11;

      v7 = v12;
    }

  }
}

- (id)layoutAttributesForNearestItemToCenterWithOffset:(CGPoint)a3
{
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  x = a3.x;
  v33 = *MEMORY[0x24BDAC8D0];
  -[CFXFilterEffectPickerView collectionViewLayout](self, "collectionViewLayout", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionInset");
  v7 = x + v6;

  -[CFXEffectPickerView cellSize](self, "cellSize");
  v9 = v7 + v8 * -0.5;
  -[CFXEffectPickerView cellSize](self, "cellSize");
  v11 = v10;
  -[CFXEffectPickerView cellSize](self, "cellSize");
  v13 = v12;
  -[CFXFilterEffectPickerView collectionViewLayout](self, "collectionViewLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutAttributesForElementsInRect:", v9, 0.0, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v29;
    v21 = 1.79769313e308;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v16);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v23, "frame", (_QWORD)v28);
        v25 = vabdd_f64(v7, v24);
        if (v21 > v25)
        {
          v26 = v23;

          v21 = v25;
          v19 = v26;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (UISelectionFeedbackGenerator)selectionFeedbackGenerator
{
  UISelectionFeedbackGenerator *selectionFeedbackGenerator;
  UISelectionFeedbackGenerator *v4;
  UISelectionFeedbackGenerator *v5;

  selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  if (!selectionFeedbackGenerator)
  {
    v4 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x24BDF6D80]);
    v5 = self->_selectionFeedbackGenerator;
    self->_selectionFeedbackGenerator = v4;

    -[UISelectionFeedbackGenerator _setOutputMode:](self->_selectionFeedbackGenerator, "_setOutputMode:", 5);
    selectionFeedbackGenerator = self->_selectionFeedbackGenerator;
  }
  return selectionFeedbackGenerator;
}

- (void)didSelectItemAtCellIndex:(unint64_t)a3
{
  -[CFXFilterEffectPickerView CFX_selectItemAtCellIndex:animated:](self, "CFX_selectItemAtCellIndex:animated:", a3, 1);
  -[CFXEffectPickerView applyEffectAtCellIndex:](self, "applyEffectAtCellIndex:", a3);
}

- (void)selectCenterItem
{
  unint64_t v3;
  id v4;

  -[CFXFilterEffectPickerView indexPathForCenterOfCollectionView](self, "indexPathForCenterOfCollectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CFXFilterEffectPickerView CFX_selectItemAtCellIndex:animated:](self, "CFX_selectItemAtCellIndex:animated:", objc_msgSend(v4, "item"), 1);
  v3 = -[CFXFilterEffectPickerView selectedIndex](self, "selectedIndex");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    -[CFXEffectPickerView applyEffectAtCellIndex:](self, "applyEffectAtCellIndex:", v3);

}

- (void)selectEffectWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[CFXFilterEffectPickerView dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "effectPickerView:indexForEffectID:", self, v7);

    v4 = v7;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CFXFilterEffectPickerView CFX_selectItemAtCellIndex:animated:](self, "CFX_selectItemAtCellIndex:animated:", v6, 1);
      v4 = v7;
    }
  }

}

- (id)indexPathForCenterOfCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;

  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CFXFilterEffectPickerView center](self, "center");
    v7 = v6;
    v9 = v8;
    -[CFXFilterEffectPickerView collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXFilterEffectPickerView convertPoint:toView:](self, "convertPoint:toView:", v10, v7, v9);
    v12 = v11;

    objc_msgSend(v5, "center");
    v14 = v13;
    -[CFXFilterEffectPickerView collectionView](self, "collectionView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "indexPathForItemAtPoint:", v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[CFXFilterEffectPickerView collectionViewLayout](self, "collectionViewLayout");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "minimumInteritemSpacing");
      v19 = v12 + v18;

      -[CFXFilterEffectPickerView collectionView](self, "collectionView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "indexPathForItemAtPoint:", v19, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[CFXFilterEffectPickerView collectionViewLayout](self, "collectionViewLayout");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "minimumInteritemSpacing");
        v23 = v12 - v22;

        -[CFXFilterEffectPickerView collectionView](self, "collectionView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "indexPathForItemAtPoint:", v23, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)selectedIndex
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "item");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)orientationDidChange
{
  void *v3;
  int v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CFXFilterEffectPickerView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldRotateCellsForDeviceOrientation");

  if (v4)
  {
    v5 = 0.0;
    if (+[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation") != 1)
    {
      if (+[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation") == 4)
      {
        v5 = -1.57079633;
      }
      else if (+[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation") == 3)
      {
        v5 = 1.57079633;
      }
      else if (+[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation") == 2)
      {
        v5 = 3.14159265;
      }
      else
      {
        v5 = 0.0;
      }
    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CFXFilterEffectPickerView collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = -v5;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          CGAffineTransformMakeRotation(&v16, v10);
          objc_msgSend(v13, "imageView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v16;
          objc_msgSend(v14, "setTransform:", &v15);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
}

- (void)CFX_selectItemAtCellIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", a3, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout");
  -[CFXFilterEffectPickerView collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfItemsInSection:", 0);

  if (v9 > a3)
  {
    if (v7)
      v10 = 16;
    else
      v10 = 0;
    -[CFXFilterEffectPickerView collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v13, v4, v10);

    if (!-[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout"))
    {
      -[CFXFilterEffectPickerView collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrollToItemAtIndexPath:atScrollPosition:animated:", v13, 0, 1);

    }
    -[CFXFilterEffectPickerView CFX_updateTitleForCenterItemAtIndex:](self, "CFX_updateTitleForCenterItemAtIndex:", a3);
  }

}

- (void)CFX_selectInitialItem
{
  void *v3;
  uint64_t v4;

  -[CFXFilterEffectPickerView dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedFilterIndexForFilterPickerView:", self);

  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[CFXFilterEffectPickerView CFX_selectItemAtCellIndex:animated:](self, "CFX_selectItemAtCellIndex:animated:", v4, 0);
}

- (void)CFX_updateTitleForCenterItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (-[CFXFilterEffectPickerView isDisplayingCompactLayout](self, "isDisplayingCompactLayout"))
  {
    -[CFXFilterEffectPickerView dataSource](self, "dataSource");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectPickerView:effectTitleAtIndex:", self, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CFXFilterEffectPickerView compactSelectedTitleView](self, "compactSelectedTitleView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

  }
}

- (CFXFilterEffectPickerViewDataSource)dataSource
{
  return (CFXFilterEffectPickerViewDataSource *)objc_loadWeakRetained((id *)&self->dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->dataSource, a3);
}

- (CFXFilterEffectPickerViewDelegate)delegate
{
  return (CFXFilterEffectPickerViewDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (JTCollectionView)collectionView
{
  return (JTCollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (JTCollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (UIView)compactSelectionView
{
  return self->_compactSelectionView;
}

- (void)setCompactSelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_compactSelectionView, a3);
}

- (UILabel)compactSelectedTitleView
{
  return self->_compactSelectedTitleView;
}

- (void)setCompactSelectedTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_compactSelectedTitleView, a3);
}

- (unint64_t)cachedEffectCount
{
  return self->_cachedEffectCount;
}

- (void)setCachedEffectCount:(unint64_t)a3
{
  self->_cachedEffectCount = a3;
}

- (BOOL)isDisplayingExpandedLayout
{
  return self->_displayExpandedLayout;
}

- (void)setDisplayExpandedLayout:(BOOL)a3
{
  self->_displayExpandedLayout = a3;
}

- (CGSize)lastViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastViewSize.width;
  height = self->_lastViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastViewSize:(CGSize)a3
{
  self->_lastViewSize = a3;
}

- (void)setSelectionFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, a3);
}

- (NSIndexPath)lastScrollIndexPath
{
  return self->_lastScrollIndexPath;
}

- (void)setLastScrollIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastScrollIndexPath, a3);
}

- (CGPoint)previousScrollOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousScrollOffset.x;
  y = self->_previousScrollOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousScrollOffset:(CGPoint)a3
{
  self->_previousScrollOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScrollIndexPath, 0);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_compactSelectedTitleView, 0);
  objc_storeStrong((id *)&self->_compactSelectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->dataSource);
}

@end
