@implementation CNAvatarCardActionsView

- (CNAvatarCardActionsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CNAvatarCardActionsView *v7;
  CNAvatarCardActionsTableView *v8;
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
  objc_super v22;
  _QWORD v23[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23[4] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CNAvatarCardActionsView;
  v7 = -[CNAvatarCardActionsView initWithFrame:](&v22, sel_initWithFrame_);
  -[CNAvatarCardActionsView setBackgroundColor:](v7, "setBackgroundColor:", 0);
  v8 = -[CNAvatarCardActionsTableView initWithFrame:style:]([CNAvatarCardActionsTableView alloc], "initWithFrame:style:", 1, x, y, width, height);
  -[CNAvatarCardActionsTableView setRowHeight:](v8, "setRowHeight:", 62.0);
  -[CNAvatarCardActionsTableView setSeparatorStyle:](v8, "setSeparatorStyle:", 1);
  -[CNAvatarCardActionsTableView setScrollEnabled:](v8, "setScrollEnabled:", 1);
  -[CNAvatarCardActionsTableView setAlwaysBounceVertical:](v8, "setAlwaysBounceVertical:", 0);
  -[CNAvatarCardActionsTableView setBackgroundColor:](v8, "setBackgroundColor:", 0);
  -[CNAvatarCardActionsTableView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNAvatarCardActionsTableView _setDrawsSeparatorAtTopOfSections:](v8, "_setDrawsSeparatorAtTopOfSections:", 0);
  -[CNAvatarCardActionsTableView _setTopPadding:](v8, "_setTopPadding:", 0.0);
  -[CNAvatarCardActionsTableView _setBottomPadding:](v8, "_setBottomPadding:", 0.0);
  -[CNAvatarCardActionsTableView setSectionHeaderHeight:](v8, "setSectionHeaderHeight:", 0.0);
  -[CNAvatarCardActionsTableView setSectionFooterHeight:](v8, "setSectionFooterHeight:", 0.0);
  -[CNAvatarCardActionsTableView _setSeparatorBackdropOverlayBlendMode:](v8, "_setSeparatorBackdropOverlayBlendMode:", 1);
  -[CNAvatarCardActionsView addSubview:](v7, "addSubview:", v8);
  -[CNAvatarCardActionsView setTableView:](v7, "setTableView:", v8);
  v9 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, v7, 3, 1.0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 1, 0, v7, 1, 1.0, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 4, 0, v7, 4, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v12;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 2, 0, v7, 2, 1.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activateConstraints:", v14);

  +[CNAvatarCardActionCell cellNibForActions](CNAvatarCardActionCell, "cellNibForActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsTableView registerNib:forCellReuseIdentifier:](v8, "registerNib:forCellReuseIdentifier:", v15, CFSTR("actionCell"));
  +[CNAvatarCardActionCell cellNibForContacts](CNAvatarCardActionCell, "cellNibForContacts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAvatarCardActionsTableView registerNib:forCellReuseIdentifier:](v8, "registerNib:forCellReuseIdentifier:", v16, CFSTR("contactCell"));
  -[CNAvatarCardActionsTableView setDataSource:](v8, "setDataSource:", v7);
  -[CNAvatarCardActionsTableView setDelegate:](v8, "setDelegate:", v7);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v7, sel_updateRollover_);
  objc_msgSend(v17, "setAllowableMovement:", 0.0);
  objc_msgSend(v17, "setMinimumPressDuration:", 0.0);
  objc_msgSend(v17, "setCancelsTouchesInView:", 0);
  objc_msgSend(v17, "setDelegate:", v7);
  -[CNAvatarCardActionsView addGestureRecognizer:](v7, "addGestureRecognizer:", v17);
  -[CNAvatarCardActionsView setSelectionGestureRecognizer:](v7, "setSelectionGestureRecognizer:", v17);
  objc_msgSend(MEMORY[0x1E0DC4320], "defaultConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tweakedConfigurationForClass:usage:", objc_opt_class(), CFSTR("retarget"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C60]), "initWithConfiguration:coordinateSpace:", v19, v8);
  -[CNAvatarCardActionsView setRetargetBehavior:](v7, "setRetargetBehavior:", v20);

  return v7;
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  id v5;

  -[CNAvatarCardActionsView retargetBehavior](self, "retargetBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "activateWithCompletionBlock:", 0);
  else
    objc_msgSend(v4, "deactivate");

}

- (void)setContacts:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_contacts != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contacts, a3);
    -[CNAvatarCardActionsView setActionsManager:](self, "setActionsManager:", 0);
    v5 = v6;
  }

}

- (void)setActionsImageFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_actionsImageFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_actionsImageFrame = &self->_actionsImageFrame;
  if (!CGRectEqualToRect(a3, self->_actionsImageFrame))
  {
    p_actionsImageFrame->origin.x = x;
    p_actionsImageFrame->origin.y = y;
    p_actionsImageFrame->size.width = width;
    p_actionsImageFrame->size.height = height;
    -[CNAvatarCardActionsView reloadData](self, "reloadData");
  }
}

- (void)setActionsReversed:(BOOL)a3
{
  if (self->_actionsReversed != a3)
  {
    self->_actionsReversed = a3;
    if (!-[CNAvatarCardActionsView expanded](self, "expanded"))
      -[CNAvatarCardActionsView _updateActionsWithBlock:](self, "_updateActionsWithBlock:", 0);
  }
}

- (NSArray)actionCategories
{
  NSArray *actionCategories;

  actionCategories = self->_actionCategories;
  if (actionCategories)
    return actionCategories;
  +[CNQuickActionsManager defaultCategories](CNQuickActionsManager, "defaultCategories");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateActionsWithBlock:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  CGRect v18;
  CGRect v19;

  v5 = a3;
  -[CNAvatarCardActionsView setExpanded:](self, "setExpanded:", 0);
  -[CNAvatarCardActionsView actionsManager](self, "actionsManager");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[CNAvatarCardActionsView contacts](self, "contacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNQuickActionsManager actionsManagerForContacts:](CNQuickActionsManager, "actionsManagerForContacts:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAvatarCardActionsView actionCategories](self, "actionCategories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCategories:", v10);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");
    if (v12
      || (objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "_referenceBounds"),
          CGRectGetHeight(v18) <= 667.0))
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "userInterfaceIdiom"))
      {
        objc_msgSend(v7, "setDesiredNumberOfActions:", 5);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_referenceBounds");
        if (CGRectGetHeight(v19) <= 568.0)
          v15 = 5;
        else
          v15 = 6;
        objc_msgSend(v7, "setDesiredNumberOfActions:", v15);

      }
      if (v12)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(v7, "setDesiredNumberOfActions:", 6);
    }

LABEL_14:
    objc_msgSend(v7, "setBypassActionValidation:", -[CNAvatarCardActionsView bypassActionValidation](self, "bypassActionValidation"));
    objc_msgSend(v7, "setDelegate:", self);
    -[CNAvatarCardActionsView setActionsManager:](self, "setActionsManager:", v7);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __51__CNAvatarCardActionsView__updateActionsWithBlock___block_invoke;
    v16[3] = &unk_1E204F9B0;
    v16[4] = self;
    v17 = v5;
    objc_msgSend(v7, "updateActionsWithBlock:", v16);

    goto LABEL_15;
  }
  v7 = (void *)v6;
  -[CNAvatarCardActionsView _effectiveManagerActions](self, "_effectiveManagerActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView _updateWithActions:withBlock:](self, "_updateWithActions:withBlock:", v8, v5);

LABEL_15:
}

- (void)_updateWithActions:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = a3;
  -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView rolloverGestureRecognizer](self, "rolloverGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView _stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:](self, "_stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:", v7, v8);

  -[CNAvatarCardActionsView setHighlightedIndexPath:](self, "setHighlightedIndexPath:", 0);
  v9 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v14)
  {
    -[CNAvatarCardActionsView reloadDataWithBlock:](self, "reloadDataWithBlock:");
  }
  else
  {
    -[CNAvatarCardActionsView setActions:](self, "setActions:", v9);
    -[CNAvatarCardActionsView reloadData](self, "reloadData");
  }
  -[CNAvatarCardActionsView delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[CNAvatarCardActionsView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cardActionsView:didShowActions:", self, v9);

  }
  -[CNAvatarCardActionsView rolloverGestureRecognizer](self, "rolloverGestureRecognizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView updateRollover:](self, "updateRollover:", v13);

}

- (id)_effectiveManagerActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNAvatarCardActionsView actionsManager](self, "actionsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_actionsReversed)
  {
    objc_msgSend(v4, "reverseObjectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)_actionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CNAvatarCardActionsView actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)reloadData
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__CNAvatarCardActionsView_reloadData__block_invoke;
  v2[3] = &unk_1E204F648;
  v2[4] = self;
  -[CNAvatarCardActionsView reloadDataWithBlock:](self, "reloadDataWithBlock:", v2);
}

- (void)reloadDataWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(_QWORD))a3;
  -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView rolloverGestureRecognizer](self, "rolloverGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView _stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:](self, "_stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:", v5, v6);

  v4[2](v4);
  -[CNAvatarCardActionsView tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateIntrinsicContentSize");

}

- (void)refreshActions
{
  id v2;

  -[CNAvatarCardActionsView actionsManager](self, "actionsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshActions");

}

- (void)reset
{
  -[CNAvatarCardActionsView resetWithBlock:](self, "resetWithBlock:", 0);
}

- (BOOL)performHighlightedAction
{
  void *v3;
  void *v4;

  -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionsView _performActionAtIndexPath:](self, "_performActionAtIndexPath:", v4);

  }
  return v3 != 0;
}

- (void)startTrackingRolloverWithGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CNAvatarCardActionsView setHighlightedIndexPath:](self, "setHighlightedIndexPath:", 0);
  -[CNAvatarCardActionsView setRolloverGestureRecognizer:](self, "setRolloverGestureRecognizer:", v6);
  -[CNAvatarCardActionsView setInitialLocation:](self, "setInitialLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[CNAvatarCardActionsView _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNAvatarCardActionsView tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v5);
    -[CNAvatarCardActionsView setInitialLocation:](self, "setInitialLocation:");

  }
  objc_msgSend(v6, "addTarget:action:", self, sel_updateRollover_);
  -[CNAvatarCardActionsView updateRollover:](self, "updateRollover:", v6);

}

- (void)stopTrackingRollover
{
  void *v3;
  void *v4;
  void *v5;

  -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView rolloverGestureRecognizer](self, "rolloverGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView _stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:](self, "_stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:", v3, v4);

  -[CNAvatarCardActionsView rolloverGestureRecognizer](self, "rolloverGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:", self, sel_updateRollover_);

  -[CNAvatarCardActionsView setRolloverGestureRecognizer:](self, "setRolloverGestureRecognizer:", 0);
}

- (BOOL)isPerformingAction
{
  BOOL v3;
  void *v4;

  if (-[CNAvatarCardActionsView expanded](self, "expanded"))
    return 1;
  -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (id)_indexPathForGestureRecognizer:(id)a3
{
  id v4;
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
  double v16;
  void *v17;
  void *v18;
  CGPoint v20;
  CGRect v21;

  v4 = a3;
  -[CNAvatarCardActionsView tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CNAvatarCardActionsView tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleBounds");
  v20.x = v7;
  v20.y = v9;
  LODWORD(v5) = CGRectContainsPoint(v21, v20);

  if (!(_DWORD)v5)
    goto LABEL_9;
  -[CNAvatarCardActionsView initialLocation](self, "initialLocation");
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v14 == *MEMORY[0x1E0C9D538] && v11 == v13)
    goto LABEL_8;
  -[CNAvatarCardActionsView initialLocation](self, "initialLocation");
  UIDistanceBetweenPoints();
  if (v16 <= 15.0)
  {
LABEL_9:
    v18 = 0;
    return v18;
  }
  -[CNAvatarCardActionsView setInitialLocation:](self, "setInitialLocation:", v12, v13);
LABEL_8:
  -[CNAvatarCardActionsView tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "indexPathForRowAtPoint:", v7, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)updateRollover:(id)a3
{
  void *v3;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  if (objc_msgSend(v17, "state") == 1 || objc_msgSend(v17, "state") == 2 || objc_msgSend(v17, "state") == 4)
  {
    if (objc_msgSend(v17, "state") == 4
      || (-[CNAvatarCardActionsView _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:", v17),
          (v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
      v8 = objc_claimAutoreleasedReturnValue();
      v6 = 0;
      if (!v8)
      {
LABEL_13:

        goto LABEL_14;
      }
      v3 = (void *)v8;
      v7 = 1;
    }
    else
    {
      v6 = (void *)v5;
      v7 = 0;
    }
    -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "isEqual:", v9);

    if (v7)
    if ((v10 & 1) == 0)
    {
      -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarCardActionsView _stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:](self, "_stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:", v11, v17);

      -[CNAvatarCardActionsView _startTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:](self, "_startTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:", v6, v17);
      -[CNAvatarCardActionsView _setHighlightedIndexPath:isChange:](self, "_setHighlightedIndexPath:isChange:", v6, objc_msgSend(v17, "state") == 2);
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v17, "state") == 3)
  {
    -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_18;
    -[CNAvatarCardActionsView tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellForRowAtIndexPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
    v16 = objc_claimAutoreleasedReturnValue();
    -[CNAvatarCardActionsView _stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:](self, "_stopTrackingRolloverOnCellAtIndexPath:withGestureRecognizer:", v16, v17);

    LOBYTE(v16) = objc_msgSend(v15, "swipped");
    if ((v16 & 1) == 0)
LABEL_18:
      -[CNAvatarCardActionsView performHighlightedAction](self, "performHighlightedAction");
  }
LABEL_14:

}

- (void)_startTrackingRolloverOnCellAtIndexPath:(id)a3 withGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[CNAvatarCardActionsView tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "startTrackingWithGestureRecognizer:", v6);
  }
}

- (void)_stopTrackingRolloverOnCellAtIndexPath:(id)a3 withGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    -[CNAvatarCardActionsView tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stopTrackingWithGestureRecognizer:", v6);
  }
}

- (void)_performActionAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  -[CNAvatarCardActionsView _actionAtIndexPath:](self, "_actionAtIndexPath:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v5;
    -[CNAvatarCardActionsView tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "moreHighlighted"))
    {
      -[CNAvatarCardActionsView setExpanded:](self, "setExpanded:", 1);
      v8 = objc_msgSend(v4, "row");
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__53058;
      v33 = __Block_byref_object_dispose__53059;
      v34 = 0;
      objc_msgSend(v5, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke;
      v28[3] = &unk_1E204E958;
      v28[4] = self;
      v28[5] = &v29;
      v28[6] = v8;
      +[CNQuickAction actionWithTitle:image:block:](CNQuickAction, "actionWithTitle:image:block:", v9, v10, v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "category");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCategory:", v13);

      objc_msgSend(v12, "setBackAction:", 1);
      objc_msgSend(v5, "actions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "mutableCopy");
      v17 = (void *)v30[5];
      v30[5] = v16;

      objc_msgSend((id)v30[5], "insertObject:atIndex:", v12, 0);
      -[CNAvatarCardActionsView actions](self, "actions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v30[5];
      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_3;
      v24[3] = &unk_1E204E980;
      v24[4] = self;
      v20 = v18;
      v25 = v20;
      v26 = &v29;
      v27 = v8;
      -[CNAvatarCardActionsView _updateWithActions:withBlock:](self, "_updateWithActions:withBlock:", v19, v24);

      _Block_object_dispose(&v29, 8);
      goto LABEL_10;
    }
    objc_msgSend(v5, "mainAction");
    v21 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v21;
  }
  if (!objc_msgSend(v5, "isBackAction"))
  {
    if (!-[CNAvatarCardActionsView dismissesBeforePerforming](self, "dismissesBeforePerforming"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_4;
      v22[3] = &unk_1E2050400;
      v22[4] = self;
      v5 = v5;
      v23 = v5;
      objc_msgSend(v5, "performWithCompletionBlock:", v22);

      goto LABEL_10;
    }
    -[CNAvatarCardActionsView _dismissCardAnimated:](self, "_dismissCardAnimated:", objc_msgSend(v5, "dismissesWithAnimation"));
  }
  objc_msgSend(v5, "performWithCompletionBlock:", 0);
LABEL_10:

}

- (void)_updateFromActions:(id)a3 toActions:(id)a4 matchingOldIndex:(int64_t)a5 toNewActionIndex:(int64_t)a6 invertedAnimation:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;
  int64_t v30;
  BOOL v31;

  v12 = a3;
  v13 = a4;
  -[CNAvatarCardActionsView tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a6, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke;
  v23[3] = &unk_1E204E9A8;
  v23[4] = self;
  v24 = v15;
  v25 = v13;
  v26 = v14;
  v31 = a7;
  v27 = v16;
  v28 = v12;
  v29 = a6;
  v30 = a5;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke_3;
  v22[3] = &unk_1E204F320;
  v22[4] = self;
  v17 = v12;
  v18 = v16;
  v19 = v14;
  v20 = v13;
  v21 = v15;
  objc_msgSend(v19, "_performBatchUpdates:completion:", v23, v22);

}

- (void)_configureCell:(id)a3 forAction:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (-[CNAvatarCardActionsView expanded](self, "expanded"))
  {
    if (objc_msgSend(v6, "isBackAction"))
    {
      v7 = *MEMORY[0x1E0DC49E8];
      v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
      v11 = 2;
    }
    else
    {
      v7 = 0.0;
      v8 = 75.0;
      v11 = 3;
      v9 = 0.0;
      v10 = 0.0;
    }
  }
  else
  {
    v11 = 0;
    v7 = *MEMORY[0x1E0DC49E8];
    v8 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  objc_msgSend(v12, "setSeparatorInset:", v7, v8, v9, v10);
  objc_msgSend(v12, "setContext:", v11);
  objc_msgSend(v12, "setAction:", v6);
  objc_msgSend(v12, "reloadData");

}

- (void)_dismissCardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[CNAvatarCardActionsView setHighlightedIndexPath:](self, "setHighlightedIndexPath:", 0);
  -[CNAvatarCardActionsView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNAvatarCardActionsView delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerForCardActionsView:animated:", self, v3);

  }
}

- (void)_updateAllSeparators
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNAvatarCardActionsTableView indexPathsForVisibleRows](self->_tableView, "indexPathsForVisibleRows", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[CNAvatarCardActionsTableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAvatarCardActionsView _updateCellSeparator:forIndexPath:](self, "_updateCellSeparator:forIndexPath:", v9, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_updateCellSeparator:(id)a3 forIndexPath:(id)a4
{
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  id v9;

  v9 = a3;
  v6 = objc_msgSend(a4, "row");
  -[CNAvatarCardActionsView actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 != objc_msgSend(v7, "count") - 1;

  objc_msgSend(v9, "setSeparatorStyle:", v8);
}

- (void)_setHighlightedIndexPath:(id)a3 isChange:(BOOL)a4
{
  _BOOL4 v4;
  NSIndexPath *v7;
  NSIndexPath **p_highlightedIndexPath;
  NSIndexPath *highlightedIndexPath;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSIndexPath *v15;

  v4 = a4;
  v7 = (NSIndexPath *)a3;
  p_highlightedIndexPath = &self->_highlightedIndexPath;
  highlightedIndexPath = self->_highlightedIndexPath;
  v15 = v7;
  if (highlightedIndexPath != v7)
  {
    if (highlightedIndexPath)
    {
      -[CNAvatarCardActionsView tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cellForRowAtIndexPath:", *p_highlightedIndexPath);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setHighlighted:", 0);
    }
    objc_storeStrong((id *)&self->_highlightedIndexPath, a3);
    if (*p_highlightedIndexPath)
    {
      -[CNAvatarCardActionsView tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cellForRowAtIndexPath:", *p_highlightedIndexPath);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setHighlighted:", 1);
      if (v4)
      {
        -[CNAvatarCardActionsView retargetBehavior](self, "retargetBehavior");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "selectionChanged");

      }
    }
  }

}

- (void)setHighlightedIndexPath:(id)a3
{
  -[CNAvatarCardActionsView _setHighlightedIndexPath:isChange:](self, "_setHighlightedIndexPath:isChange:", a3, 0);
}

- (id)actionsManager:(id)a3 presentingViewControllerForAction:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[CNAvatarCardActionsView delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNAvatarCardActionsView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerForCardActionsView:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)actionsManager:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  -[CNAvatarCardActionsView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[CNAvatarCardActionsView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardActionsView:orderedPropertiesForProperties:category:", self, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[CNAvatarCardActionsView actions](self, "actions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  const __CFString *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[CNAvatarCardActionsView _actionAtIndexPath:](self, "_actionAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView contacts](self, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {

  }
  else
  {
    if (!-[CNAvatarCardActionsView expanded](self, "expanded"))
    {

LABEL_8:
      v11 = CFSTR("contactCell");
      goto LABEL_9;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_8;
  }
  v11 = CFSTR("actionCell");
LABEL_9:
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardActionsView _configureCell:forAction:](self, "_configureCell:forAction:", v12, v8);
  -[CNAvatarCardActionsView highlightedIndexPath](self, "highlightedIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighlighted:animated:", objc_msgSend(v7, "isEqual:", v13), 0);

  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[CNAvatarCardActionsView _updateCellSeparator:forIndexPath:](self, "_updateCellSeparator:forIndexPath:", a4, a5);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  -[UIGestureRecognizer setEnabled:](self->_selectionGestureRecognizer, "setEnabled:", 0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[UIGestureRecognizer setEnabled:](self->_selectionGestureRecognizer, "setEnabled:", 1);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[UIGestureRecognizer setEnabled:](self->_selectionGestureRecognizer, "setEnabled:", 1);
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if ((-[CNAvatarCardActionsTableView isDragging](self->_tableView, "isDragging", a3, a4) & 1) != 0)
    return 0;
  else
    return -[CNAvatarCardActionsTableView isDecelerating](self->_tableView, "isDecelerating") ^ 1;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIGestureRecognizer *selectionGestureRecognizer;

  selectionGestureRecognizer = self->_selectionGestureRecognizer;
  return selectionGestureRecognizer == a3 || selectionGestureRecognizer == a4;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setActionCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (BOOL)actionsReversed
{
  return self->_actionsReversed;
}

- (BOOL)bypassActionValidation
{
  return self->_bypassActionValidation;
}

- (void)setBypassActionValidation:(BOOL)a3
{
  self->_bypassActionValidation = a3;
}

- (CGRect)actionsImageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_actionsImageFrame.origin.x;
  y = self->_actionsImageFrame.origin.y;
  width = self->_actionsImageFrame.size.width;
  height = self->_actionsImageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CNAvatarCardActionsViewDelegate)delegate
{
  return (CNAvatarCardActionsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)dismissesBeforePerforming
{
  return self->_dismissesBeforePerforming;
}

- (void)setDismissesBeforePerforming:(BOOL)a3
{
  self->_dismissesBeforePerforming = a3;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (CNQuickActionsManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setActionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionsManager, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (CNAvatarCardActionsTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (UIGestureRecognizer)rolloverGestureRecognizer
{
  return self->_rolloverGestureRecognizer;
}

- (void)setRolloverGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_rolloverGestureRecognizer, a3);
}

- (UIGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (void)setSelectionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, a3);
}

- (CGPoint)initialLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialLocation.x;
  y = self->_initialLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialLocation:(CGPoint)a3
{
  self->_initialLocation = a3;
}

- (UISelectionFeedbackGenerator)retargetBehavior
{
  return self->_retargetBehavior;
}

- (void)setRetargetBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_retargetBehavior, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retargetBehavior, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rolloverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionCategories, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

void __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0DC3F10];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke_2;
  v22[3] = &unk_1E204EE88;
  v22[4] = *(_QWORD *)(a1 + 32);
  v21 = v3;
  v23 = v21;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 80);
  v24 = v5;
  v25 = v6;
  objc_msgSend(v4, "animateWithDuration:animations:", v22, 0.25);
  objc_msgSend(*(id *)(a1 + 56), "moveRowAtIndexPath:toIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  if (*(_BYTE *)(a1 + 96))
    v7 = 4;
  else
    v7 = 3;
  if (*(_BYTE *)(a1 + 96))
    v8 = 3;
  else
    v8 = 4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 72), "count") >= 1)
  {
    v11 = 0;
    while (1)
    {
      v12 = *(_QWORD *)(a1 + 88);
      if (v11 < v12)
        break;
      if (v11 > v12)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v10;
        goto LABEL_13;
      }
LABEL_14:
      if (++v11 >= objc_msgSend(*(id *)(a1 + 72), "count"))
        goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
LABEL_13:
    objc_msgSend(v14, "addObject:", v13);

    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 56), "deleteRowsAtIndexPaths:withRowAnimation:", v9, v7);
  objc_msgSend(*(id *)(a1 + 56), "deleteRowsAtIndexPaths:withRowAnimation:", v10, v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "count") >= 1)
  {
    v17 = 0;
    while (1)
    {
      v18 = *(_QWORD *)(a1 + 80);
      if (v17 < v18)
        break;
      if (v17 > v18)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v17, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v16;
        goto LABEL_21;
      }
LABEL_22:
      if (++v17 >= objc_msgSend(*(id *)(a1 + 48), "count"))
        goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v17, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
LABEL_21:
    objc_msgSend(v20, "addObject:", v19);

    goto LABEL_22;
  }
LABEL_23:
  objc_msgSend(*(id *)(a1 + 56), "insertRowsAtIndexPaths:withRowAnimation:", v15, v8);
  objc_msgSend(*(id *)(a1 + 56), "insertRowsAtIndexPaths:withRowAnimation:", v16, v7);
  objc_msgSend(*(id *)(a1 + 32), "setActions:", *(_QWORD *)(a1 + 48));

}

uint64_t __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAllSeparators");
}

uint64_t __108__CNAvatarCardActionsView__updateFromActions_toActions_matchingOldIndex_toNewActionIndex_invertedAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_configureCell:forAction:", v3, v4);

  return objc_msgSend(*(id *)(a1 + 40), "setHighlighted:animated:", 0, 1);
}

uint64_t __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;
  uint64_t v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_2;
  v2[3] = &unk_1E204E958;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend((id)v3, "resetWithBlock:", v2);
}

uint64_t __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFromActions:toActions:matchingOldIndex:toNewActionIndex:invertedAnimation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 56), 0, 0);
}

uint64_t __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissCardAnimated:", objc_msgSend(*(id *)(a1 + 40), "dismissesWithAnimation"));
}

void __53__CNAvatarCardActionsView__performActionAtIndexPath___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  objc_msgSend(v2, "_effectiveManagerActions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateFromActions:toActions:matchingOldIndex:toNewActionIndex:invertedAnimation:", v3, v4, 0, a1[6], 1);

}

void __37__CNAvatarCardActionsView_reloadData__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

void __51__CNAvatarCardActionsView__updateActionsWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_effectiveManagerActions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateWithActions:withBlock:", v3, *(_QWORD *)(a1 + 40));

}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end
