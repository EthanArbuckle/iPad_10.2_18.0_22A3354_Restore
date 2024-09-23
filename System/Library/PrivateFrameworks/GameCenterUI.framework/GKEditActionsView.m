@implementation GKEditActionsView

- (GKEditActionsView)initWithFrame:(CGRect)a3 cell:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  GKCollectionViewCell *v9;
  GKEditActionsView *v10;
  double v11;
  GKEditActionsView *v12;
  double v13;
  CALayer *v14;
  CALayer *maskLayer;
  id v16;
  CALayer *v17;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (GKCollectionViewCell *)a4;
  v20.receiver = self;
  v20.super_class = (Class)GKEditActionsView;
  v10 = -[GKEditActionsView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v12 = v10;
  if (v10)
  {
    LODWORD(v11) = 1148846080;
    -[GKEditActionsView setContentHuggingPriority:forAxis:](v10, "setContentHuggingPriority:forAxis:", 0, v11);
    LODWORD(v13) = 1148846080;
    -[GKEditActionsView setContentCompressionResistancePriority:forAxis:](v12, "setContentCompressionResistancePriority:forAxis:", 0, v13);
    v12->_cell = v9;
    v14 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    maskLayer = v12->_maskLayer;
    v12->_maskLayer = v14;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v12->_maskLayer, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));

    -[CALayer setDelegate:](v12->_maskLayer, "setDelegate:", v12);
    v17 = v12->_maskLayer;
    -[GKEditActionsView layer](v12, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMask:", v17);

    -[GKEditActionsView setVisibleWidth:](v12, "setVisibleWidth:", 0.0);
    -[GKEditActionsView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
  }

  return v12;
}

- (void)setVisibleWidth:(double)a3
{
  double v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  CGFloat v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v3 = a3;
  if (self->_visibleWidth != a3)
  {
    self->_visibleWidth = a3;
    -[GKEditActionsView bounds](self, "bounds");
    x = v11.origin.x;
    y = v11.origin.y;
    width = v11.size.width;
    height = v11.size.height;
    v9 = CGRectGetWidth(v11);
    if (v9 < v3)
      v3 = v9;
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    v10 = CGRectGetWidth(v12) - v3;
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    -[CALayer setFrame:](self->_maskLayer, "setFrame:", v10, 0.0, v3, CGRectGetHeight(v13));
  }
}

- (void)prepareActionButtons
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  if (!self->_actionButtons)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionViewCell editActions](self->_cell, "editActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__GKEditActionsView_prepareActionButtons__block_invoke;
    v16[3] = &unk_1E59C4390;
    v16[4] = self;
    v15 = v3;
    v17 = v15;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);

    -[GKCollectionViewCell editActions](self->_cell, "editActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 >= 3)
    {
      +[GKButton buttonWithType:](GKButton, "buttonWithType:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      GKGameCenterUIFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:forState:", v9, 0);

      objc_msgSend(v7, "titleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNumberOfLines:", 0);

      objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cellActionItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applyTextStyle:", v12);

      objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cellActionColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v14);

      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v7, "setContentEdgeInsets:", 0.0, 9.0, 0.0, 9.0);
      objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_didTouchMoreEditAction_, 64);
      objc_msgSend(v15, "addObject:", v7);

    }
    -[GKEditActionsView setActionButtons:](self, "setActionButtons:", v15);

  }
}

void __41__GKEditActionsView_prepareActionButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  BOOL v17;
  char v18;
  id v19;

  v7 = a2;
  +[GKButton buttonWithType:](GKButton, "buttonWithType:", 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:forState:", v8, 0);

  objc_msgSend(v19, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0D25B28], "textStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellActionItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applyTextStyle:", v11);

  LODWORD(v10) = objc_msgSend(v7, "destructive");
  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((_DWORD)v10)
    objc_msgSend(v12, "cellActionDestructiveColor");
  else
    objc_msgSend(v12, "cellActionColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v14);

  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "setContentEdgeInsets:", 0.0, 9.0, 0.0, 9.0);
  objc_msgSend(v19, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_didTouchEditAction_, 64);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "editActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (a3)
    v17 = 0;
  else
    v17 = v16 > 2;
  v18 = v17;
  *a4 = v18;

}

- (void)setActionButtons:(id)a3
{
  NSArray *v5;
  NSArray **p_actionButtons;
  NSArray *actionButtons;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSArray *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  id v25;
  GKEditActionsView *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  p_actionButtons = &self->_actionButtons;
  actionButtons = self->_actionButtons;
  if (actionButtons != v5)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = actionButtons;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v12++), "removeFromSuperview");
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_actionButtons, a3);
    if (self->_editActionConstraints)
      -[GKEditActionsView removeConstraints:](self, "removeConstraints:");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = *p_actionButtons;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          -[GKEditActionsView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *p_actionButtons;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __38__GKEditActionsView_setActionButtons___block_invoke;
    v24 = &unk_1E59C43B8;
    v25 = v18;
    v26 = self;
    v20 = v18;
    -[NSArray enumerateObjectsUsingBlock:](v19, "enumerateObjectsUsingBlock:", &v21);
    -[GKEditActionsView setEditActionConstraints:](self, "setEditActionConstraints:", v20, v21, v22, v23, v24);
    -[GKEditActionsView addConstraints:](self, "addConstraints:", self->_editActionConstraints);

  }
}

void __38__GKEditActionsView_setActionButtons___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v20 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 8, 0, *(_QWORD *)(a1 + 40), 8, 1.0, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 3, 0, *(_QWORD *)(a1 + 40), 3, 1.0, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3718];
  v11 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    objc_msgSend(*(id *)(v10 + 448), "objectAtIndexedSubscript:", a3 - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 2, 0, v12, 1, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 2, 0, v10, 2, 1.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v14);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 448), "count") - 1 == a3)
  {
    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(_QWORD *)(a1 + 40), 1, 0, v20, 1, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  v17 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v20, 7, 1, 0, 0, 1.0, 72.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v18);

  LODWORD(v19) = 1148846080;
  objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 0, v19);

}

- (void)didTouchEditAction:(id)a3
{
  NSUInteger v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = -[NSArray indexOfObject:](self->_actionButtons, "indexOfObject:", a3);
  -[GKCollectionViewCell editActions](self->_cell, "editActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selector");

  if (v7)
  {
    -[GKEditActionsView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_gkSendAction:viaResponder:withObject:", v7, self, self->_cell);

  }
}

- (void)didTouchMoreEditAction:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  GKEditActionsView *v21;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKCollectionViewCell editActions](self->_cell, "editActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __44__GKEditActionsView_didTouchMoreEditAction___block_invoke;
  v19[3] = &unk_1E59C4390;
  v7 = v4;
  v20 = v7;
  v21 = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);

  v8 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __44__GKEditActionsView_didTouchMoreEditAction___block_invoke_3;
  v18[3] = &unk_1E59C4408;
  v18[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 1, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rootViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "viewControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  objc_msgSend(v15, "presentViewController:animated:completion:", v7, 1, 0);

}

void __44__GKEditActionsView_didTouchMoreEditAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __44__GKEditActionsView_didTouchMoreEditAction___block_invoke_2;
    v16 = &unk_1E59C43E0;
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 40);
    v17 = v10;
    v18 = v11;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v12, v13, v14, v15, v16);

  }
}

void __44__GKEditActionsView_didTouchMoreEditAction___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkSendAction:viaResponder:withObject:", objc_msgSend(*(id *)(a1 + 32), "selector"), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 432));

}

void __44__GKEditActionsView_didTouchMoreEditAction___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkSendAction:viaResponder:withObject:", sel_willDismissActionSheetFromCell_, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));

}

- (double)visibleWidth
{
  return self->_visibleWidth;
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskLayer, a3);
}

- (GKCollectionViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  self->_cell = (GKCollectionViewCell *)a3;
}

- (NSArray)editActionConstraints
{
  return self->_editActionConstraints;
}

- (void)setEditActionConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_editActionConstraints, a3);
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_editActionConstraints, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
}

@end
