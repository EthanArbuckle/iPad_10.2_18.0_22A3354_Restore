@implementation MKPlaceCardActionsViewController

- (MKPlaceCardActionsViewController)init
{
  MKPlaceCardActionsViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceCardActionsViewController;
  result = -[MKPlaceCardActionsViewController init](&v3, sel_init);
  if (result)
    result->_useMarginLayout = 1;
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _BOOL8 allowRowSelection;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKPlaceCardActionsViewController;
  -[MKPlaceCardActionsViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStackDelegate:", self);

  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);

  allowRowSelection = self->_allowRowSelection;
  -[MKPlaceSectionViewController sectionView](self, "sectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlightsTouches:", allowRowSelection);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKPlaceCardActionsViewController;
  -[MKPlaceCardActionsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!-[NSArray count](self->_viewArray, "count"))
    -[MKPlaceCardActionsViewController _setUpSectionViews](self, "_setUpSectionViews");
}

- (id)_makePlaceActionButton
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA3A0]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (void)_setUpSectionViews
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void **p_cache;
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
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double Width;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  unint64_t j;
  id v40;
  void *v41;
  _BOOL8 useSmallFonts;
  _BOOL8 useMarginLayout;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  MKPlaceCardActionSectionView *v48;
  void *v49;
  _BOOL8 v50;
  void *v51;
  void *v52;
  NSArray *v53;
  NSArray *viewArray;
  void *v55;
  void *v56;
  NSArray *obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;

  v65 = *MEMORY[0x1E0C80C00];
  -[MKPlaceCardActionsViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[MKPlaceCardActionsViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;

    if (v7 != 0.0)
    {
      p_cache = _MKUIViewControllerRootView.cache;
      if (self->_haveTwoColumns)
      {
        -[MKPlaceCardActionsViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "frame");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        -[MKPlaceCardActionsViewController view](self, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layoutMargins");
        v20 = v13 + v19;
        v23 = v15 - (v21 + v22);
        v66.size.height = v17 - (v19 + v24);
        v66.origin.x = v11 + v21;
        v66.origin.y = v20;
        v66.size.width = v23;
        Width = CGRectGetWidth(v66);

        +[MKPlaceCardActionSectionView _font:](MKPlaceCardActionSectionView, "_font:", self->_useSmallFonts);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        obj = self->_actionItemArray;
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
        if (v27)
        {
          v28 = v27;
          v29 = (Width + -30.0) * 0.5;
          v30 = *(_QWORD *)v59;
          v31 = *MEMORY[0x1E0CEA098];
          while (2)
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v59 != v30)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * i), "displayString");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = v31;
              v63 = v26;
              v34 = 1;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "sizeWithAttributes:", v35);
              v37 = v36;

              if (v37 > v29)
              {
                p_cache = (void **)(_MKUIViewControllerRootView + 16);
                goto LABEL_14;
              }
              p_cache = (void **)(_MKUIViewControllerRootView + 16);
            }
            v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
            if (v28)
              continue;
            break;
          }
        }
        v34 = 0;
LABEL_14:

      }
      else
      {
        v34 = 0;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSArray count](self->_actionItemArray, "count"))
      {
        for (j = 0; j < -[NSArray count](self->_actionItemArray, "count"); ++j)
        {
          if ((v34 & 1) != 0 || !self->_haveTwoColumns)
          {
            v47 = objc_alloc((Class)(p_cache + 173));
            -[NSArray objectAtIndex:](self->_actionItemArray, "objectAtIndex:", j);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            useSmallFonts = self->_useSmallFonts;
            useMarginLayout = self->_useMarginLayout;
            v44 = v47;
            v45 = v41;
            v46 = v34;
          }
          else
          {
            if (j != -[NSArray count](self->_actionItemArray, "count") - 1)
            {
              -[NSArray objectAtIndex:](self->_actionItemArray, "objectAtIndex:", j);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray objectAtIndex:](self->_actionItemArray, "objectAtIndex:", ++j);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = -[MKPlaceCardActionSectionView initWithLeftActionItem:rightActionItem:useSmallFonts:singleItemIsFullWidth:useMarginLayout:]([MKPlaceCardActionSectionView alloc], "initWithLeftActionItem:rightActionItem:useSmallFonts:singleItemIsFullWidth:useMarginLayout:", v41, v49, self->_useSmallFonts, 0, self->_useMarginLayout);

              p_cache = (void **)(_MKUIViewControllerRootView + 16);
              goto LABEL_24;
            }
            v40 = objc_alloc((Class)(p_cache + 173));
            -[NSArray objectAtIndex:](self->_actionItemArray, "objectAtIndex:", j);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            useSmallFonts = self->_useSmallFonts;
            useMarginLayout = self->_useMarginLayout;
            v44 = v40;
            v45 = v41;
            v46 = 0;
          }
          v48 = (MKPlaceCardActionSectionView *)objc_msgSend(v44, "initWithLeftActionItem:rightActionItem:useSmallFonts:singleItemIsFullWidth:useMarginLayout:", v45, 0, useSmallFonts, v46, useMarginLayout);
LABEL_24:

          -[MKPlaceCardActionSectionView setDelegate:](v48, "setDelegate:", self);
          -[MKPlaceCardActionSectionView setTopHairlineHidden:](v48, "setTopHairlineHidden:", !self->_showTopButtonSeparator);
          -[MKViewWithHairline setBottomHairlineHidden:](v48, "setBottomHairlineHidden:", 1);
          objc_msgSend(v38, "addObject:", v48);

        }
      }
      v50 = !self->_showTopSeparator;
      objc_msgSend(v38, "firstObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setTopHairlineHidden:", v50);

      objc_msgSend(v38, "lastObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setBottomHairlineHidden:", 1);

      v53 = (NSArray *)objc_msgSend(v38, "copy");
      viewArray = self->_viewArray;
      self->_viewArray = v53;

      -[MKPlaceSectionViewController sectionView](self, "sectionView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setRowViews:", v38);

      -[MKPlaceCardActionsViewController view](self, "view");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "_mapkit_setNeedsLayout");

    }
  }
}

- (void)setActionItemArray:(id)a3
{
  NSArray *v4;
  NSArray *actionItemArray;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  actionItemArray = self->_actionItemArray;
  self->_actionItemArray = v4;

  -[MKPlaceCardActionsViewController _setUpSectionViews](self, "_setUpSectionViews");
}

- (void)setAllowRowSelection:(BOOL)a3
{
  _BOOL8 allowRowSelection;
  id v5;

  self->_allowRowSelection = a3;
  if (-[MKPlaceCardActionsViewController isViewLoaded](self, "isViewLoaded"))
  {
    allowRowSelection = self->_allowRowSelection;
    -[MKPlaceSectionViewController sectionView](self, "sectionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightsTouches:", allowRowSelection);

  }
}

- (void)sectionView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MKPlaceCardActionsViewController;
  -[MKPlaceSectionViewController sectionView:didSelectRow:atIndex:](&v23, sel_sectionView_didSelectRow_atIndex_, a3, v8, a5);
  if (self->_allowRowSelection)
  {
    objc_msgSend(v8, "leftItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      objc_msgSend(v8, "rightItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_15;
    }
    objc_msgSend(v8, "leftItem");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (v12 = (void *)v11,
          objc_msgSend(v8, "rightItem"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          !v13))
    {
      objc_msgSend(v8, "currentLeftItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        objc_msgSend(v8, "rightItem");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;

      objc_msgSend(v8, "leftItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "enabled");

      if (v19)
      {
        objc_msgSend(v8, "leftItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "selectedItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v8, "leftItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setEnabled:", 0);

        }
        -[MKPlaceCardActionsViewController placeCardActionSectionView:buttonWithActionItemPressed:](self, "placeCardActionSectionView:buttonWithActionItemPressed:", v8, v17);
      }

    }
  }
LABEL_15:

}

- (void)placeCardActionSectionView:(id)a3 buttonWithActionItemPressed:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id WeakRetained;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v10 = CFSTR("view");
    v11[0] = a3;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a3;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  objc_msgSend(WeakRetained, "performAction:options:completion:", v6, a3, &__block_literal_global_20);

}

- (id)infoCardChildPossibleActions
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_actionItemArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "type", (_QWORD)v13) - 1;
        if (v9 <= 0x11 && ((0x201F9u >> v9) & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", qword_18B2A9768[v9]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)haveTwoColumns
{
  return self->_haveTwoColumns;
}

- (void)setHaveTwoColumns:(BOOL)a3
{
  self->_haveTwoColumns = a3;
}

- (BOOL)useSmallFonts
{
  return self->_useSmallFonts;
}

- (void)setUseSmallFonts:(BOOL)a3
{
  self->_useSmallFonts = a3;
}

- (BOOL)showTopSeparator
{
  return self->_showTopSeparator;
}

- (void)setShowTopSeparator:(BOOL)a3
{
  self->_showTopSeparator = a3;
}

- (NSArray)actionItemArray
{
  return self->_actionItemArray;
}

- (NSArray)viewArray
{
  return self->_viewArray;
}

- (void)setViewArray:(id)a3
{
  objc_storeStrong((id *)&self->_viewArray, a3);
}

- (BOOL)allowRowSelection
{
  return self->_allowRowSelection;
}

- (BOOL)useMarginLayout
{
  return self->_useMarginLayout;
}

- (void)setUseMarginLayout:(BOOL)a3
{
  self->_useMarginLayout = a3;
}

- (BOOL)showTopButtonSeparator
{
  return self->_showTopButtonSeparator;
}

- (void)setShowTopButtonSeparator:(BOOL)a3
{
  self->_showTopButtonSeparator = a3;
}

- (MKPlaceActionManager)actionManager
{
  return (MKPlaceActionManager *)objc_loadWeakRetained((id *)&self->_actionManager);
}

- (void)setActionManager:(id)a3
{
  objc_storeWeak((id *)&self->_actionManager, a3);
}

- (_MKPlaceViewControllerDelegate)placeViewControllerDelegate
{
  return (_MKPlaceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
}

- (void)setPlaceViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeViewControllerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeViewControllerDelegate);
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_viewArray, 0);
  objc_storeStrong((id *)&self->_actionItemArray, 0);
}

@end
