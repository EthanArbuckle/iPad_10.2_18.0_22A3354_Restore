@implementation MFMessageHeaderView

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__MFMessageHeaderView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1)
    dispatch_once(&log_onceToken_6, block);
  return (id)log_log_6;
}

void __26__MFMessageHeaderView_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;

}

- (MFMessageHeaderView)initWithFrame:(CGRect)a3
{
  char *v3;
  void *v4;
  id v5;
  void *v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFMessageHeaderView;
  v3 = -[MFMessageHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

    objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    objc_msgSend(v3, "setDistribution:", 0);
    objc_msgSend(v3, "setAxis:", 1);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)*((_QWORD *)v3 + 56);
    *((_QWORD *)v3 + 56) = v5;

    v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    *(_OWORD *)(v3 + 504) = *MEMORY[0x1E0C9D648];
    *(_OWORD *)(v3 + 520) = v7;
  }
  return (MFMessageHeaderView *)v3;
}

- (ConversationSearchOverlayView)findOverlayView
{
  ConversationSearchOverlayView *findOverlayView;
  ConversationSearchOverlayView *v4;
  ConversationSearchOverlayView *v5;
  ConversationSearchOverlayView *v6;

  findOverlayView = self->_findOverlayView;
  if (!findOverlayView)
  {
    v4 = [ConversationSearchOverlayView alloc];
    -[MFMessageHeaderView bounds](self, "bounds");
    v5 = -[ConversationSearchOverlayView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_findOverlayView;
    self->_findOverlayView = v5;

    -[MFMessageHeaderView addSubview:](self, "addSubview:", self->_findOverlayView);
    findOverlayView = self->_findOverlayView;
  }
  return findOverlayView;
}

- (void)layoutSubviews
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
  void *v12;
  objc_super v13;

  -[MFMessageHeaderView displayMetrics](self, "displayMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v13.receiver = self;
    v13.super_class = (Class)MFMessageHeaderView;
    -[MFMessageHeaderView layoutSubviews](&v13, sel_layoutSubviews);
    -[MFMessageHeaderView _updateSeparators](self, "_updateSeparators");
    if (self->_findOverlayView)
    {
      -[MFMessageHeaderView bounds](self, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[MFMessageHeaderView findOverlayView](self, "findOverlayView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    }
    -[MFMessageHeaderView setDraggableArea:](self, "setDraggableArea:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFMessageHeaderView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)MFMessageHeaderView;
  -[MFMessageHeaderView setBounds:](&v19, sel_setBounds_, x, y, width, height);
  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  v16 = CGRectGetHeight(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v17 = v16 - CGRectGetHeight(v21);
  if (v17 < 0.0)
    v17 = -v17;
  if (v17 >= 2.22044605e-16)
  {
    -[MFMessageHeaderView delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "headerViewDidChangeHeight:", self);

  }
}

- (void)drawRect:(CGRect)a3 forViewPrintFormatter:(id)a4
{
  id v4;

  -[MFMessageHeaderView layer](self, "layer", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderInContext:", UIGraphicsGetCurrentContext());

}

- (CGRect)draggableArea
{
  CGRect *p_draggableArea;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MaxY;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double x;
  double y;
  double width;
  double height;
  CGRect v23;
  CGRect result;

  p_draggableArea = &self->_draggableArea;
  if (CGRectIsEmpty(self->_draggableArea))
  {
    -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_firstObjectPassingTest:", &__block_literal_global_7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "separator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      -[MFMessageHeaderView convertRect:fromView:](self, "convertRect:fromView:", v5);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      v23.origin.x = v8;
      v23.origin.y = v10;
      v23.size.width = v12;
      v23.size.height = v14;
      MaxY = CGRectGetMaxY(v23);
      -[MFMessageHeaderView bounds](self, "bounds");
      p_draggableArea->origin.x = v16;
      p_draggableArea->origin.y = v17;
      p_draggableArea->size.width = v18;
      p_draggableArea->size.height = MaxY - v17;
    }

  }
  x = p_draggableArea->origin.x;
  y = p_draggableArea->origin.y;
  width = p_draggableArea->size.width;
  height = p_draggableArea->size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

uint64_t __36__MFMessageHeaderView_draggableArea__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "separatorIsHidden") ^ 1;
}

- (void)addHeaderBlock:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self, "insertHeaderBlock:atIndex:animated:", v7, objc_msgSend(v6, "count"), v4);

}

- (void)insertHeaderBlock:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if ((v10 & 1) == 0)
  {
    v11 = -[MFMessageHeaderView _pinnedBlockIndex](self, "_pinnedBlockIndex");
    -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") > a4
      && (-[MFMessageHeaderView pinnedBlock](self, "pinnedBlock"),
          (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MFMessageHeaderView pinnedBlock](self, "pinnedBlock");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v14 != v8 && v11 <= a4;

      if (v16)
        a4 = v11 + 1;
    }
    else
    {

    }
    -[NSMutableArray insertObject:atIndex:](self->_headerBlocks, "insertObject:atIndex:", v8, a4);
    -[MFMessageHeaderView displayMetrics](self, "displayMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisplayMetrics:", v17);

    -[MFMessageHeaderView viewModel](self, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[MFMessageHeaderView viewModel](self, "viewModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayMessageUsingViewModel:", v19);

    }
    if (v5)
    {
      -[MFMessageHeaderView insertSubview:atIndex:](self, "insertSubview:atIndex:", v8, 0);
      -[MFMessageHeaderView _animationConstraintsForBlockAtIndex:](self, "_animationConstraintsForBlockAtIndex:", a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v20);
      -[MFMessageHeaderView layoutIfNeeded](self, "layoutIfNeeded");
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v20);
      -[MFMessageHeaderView insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", v8, a4);
      -[MFMessageHeaderView _layoutAnimatedWithCompletion:](self, "_layoutAnimatedWithCompletion:", 0);

    }
    else
    {
      -[MFMessageHeaderView insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", v8, a4);
    }
    +[MFMessageHeaderView log](MFMessageHeaderView, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_opt_class();
      -[MFMessageHeaderView viewModel](self, "viewModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "itemID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412802;
      v26 = v22;
      v27 = 2048;
      v28 = v8;
      v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_1D56AF000, v21, OS_LOG_TYPE_DEFAULT, "Inserting headerView block <%@: %p> for itemID: %{public}@", (uint8_t *)&v25, 0x20u);

    }
  }

}

- (void)removeHeaderBlock:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v4 = a4;
  v6 = a3;
  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    -[MFMessageHeaderView pinnedBlock](self, "pinnedBlock");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v6)
      -[MFMessageHeaderView setPinnedBlock:](self, "setPinnedBlock:", 0);
    if (v4)
    {
      -[MFMessageHeaderView removeArrangedSubview:](self, "removeArrangedSubview:", v6);
      -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "indexOfObject:", v6);

      -[MFMessageHeaderView _animationConstraintsForBlockAtIndex:](self, "_animationConstraintsForBlockAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v12);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __50__MFMessageHeaderView_removeHeaderBlock_animated___block_invoke;
      v13[3] = &unk_1E9A03750;
      v13[4] = self;
      v14 = v6;
      -[MFMessageHeaderView _layoutAnimatedWithCompletion:](self, "_layoutAnimatedWithCompletion:", v13);

    }
    else
    {
      -[NSMutableArray removeObject:](self->_headerBlocks, "removeObject:", v6);
      -[MFMessageHeaderView removeArrangedSubview:](self, "removeArrangedSubview:", v6);
      objc_msgSend(v6, "removeFromSuperview");
    }
  }

}

uint64_t __50__MFMessageHeaderView_removeHeaderBlock_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

- (void)removeAllHeaderBlocksAnimated:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MFMessageHeaderView setPinnedBlock:](self, "setPinnedBlock:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MFMessageHeaderView headerBlocks](self, "headerBlocks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "removeFromSuperview");
        -[MFMessageHeaderView removeArrangedSubview:](self, "removeArrangedSubview:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_headerBlocks, "removeAllObjects");
}

- (void)insertHeaderBlock:(id)a3 before:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a3;
  v9 = a4;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageHeaderView.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newBlock"));

  }
  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v9);
  if (objc_msgSend(v10, "indexOfObject:", v14) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageHeaderView.m"), 220, CFSTR("newBlock cannot exist in headerBlocks."));

  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    -[MFMessageHeaderView addHeaderBlock:animated:](self, "addHeaderBlock:animated:", v14, v5);
  else
    -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self, "insertHeaderBlock:atIndex:animated:", v14, v11, v5);

}

- (void)setHeaderBlocks:(id)a3
{
  -[MFMessageHeaderView setHeaderBlocks:animated:](self, "setHeaderBlocks:animated:", a3, 0);
}

- (void)setHeaderBlocks:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  BOOL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((-[NSMutableArray isEqualToArray:](self->_headerBlocks, "isEqualToArray:", v6) & 1) == 0)
  {
    if (-[NSMutableArray count](self->_headerBlocks, "count"))
    {
      objc_msgSend(v6, "differenceFromArray:", self->_headerBlocks);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removals");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __48__MFMessageHeaderView_setHeaderBlocks_animated___block_invoke;
      v21[3] = &unk_1E9A03CB8;
      v21[4] = self;
      v22 = v4;
      objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v21);

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v7, "insertions", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v18;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "index"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFMessageHeaderView addHeaderBlock:animated:](self, "addHeaderBlock:animated:", v13, v4);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
        }
        while (v10);
      }

    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v7 = v6;
      v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v24;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v7);
            -[MFMessageHeaderView addHeaderBlock:animated:](self, "addHeaderBlock:animated:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16++), v4);
          }
          while (v14 != v16);
          v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v14);
      }
    }

  }
}

void __48__MFMessageHeaderView_setHeaderBlocks_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(id **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v4[56], "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHeaderBlock:animated:", v5, *(unsigned __int8 *)(a1 + 40));

}

- (void)setPinnedBlock:(id)a3
{
  MFMessageHeaderViewBlock **p_pinnedBlock;
  void *v7;
  uint64_t v8;
  void *v9;
  MFMessageHeaderViewBlock *v10;

  p_pinnedBlock = &self->_pinnedBlock;
  v10 = (MFMessageHeaderViewBlock *)a3;
  if (*p_pinnedBlock != v10)
  {
    objc_storeStrong((id *)&self->_pinnedBlock, a3);
    if (*p_pinnedBlock)
    {
      -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexOfObject:", *p_pinnedBlock);

      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMessageHeaderView.m"), 263, CFSTR("Blocks must be added to MFMessageHeaderViewBlock before they can be pinned."));

        goto LABEL_5;
      }
      if (v8 >= 1)
      {
LABEL_5:
        -[NSMutableArray removeObject:](self->_headerBlocks, "removeObject:", *p_pinnedBlock);
        -[MFMessageHeaderView removeArrangedSubview:](self, "removeArrangedSubview:", *p_pinnedBlock);
        -[NSMutableArray insertObject:atIndex:](self->_headerBlocks, "insertObject:atIndex:", *p_pinnedBlock, 0);
        -[MFMessageHeaderView insertArrangedSubview:atIndex:](self, "insertArrangedSubview:atIndex:", *p_pinnedBlock, 0);
        -[MFMessageHeaderView setNeedsLayout](self, "setNeedsLayout");
      }
    }
  }

}

- (int64_t)_pinnedBlockIndex
{
  void *v3;
  int64_t v4;

  if (!self->_pinnedBlock)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "indexOfObject:", self->_pinnedBlock);

  return v4;
}

- (id)_animationConstraintsForBlockAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3 - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v6;
    objc_msgSend(v6, "bottomAnchor");
  }
  else
  {
    v24 = 0;
    -[MFMessageHeaderView topAnchor](self, "topAnchor");
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  objc_msgSend(v8, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderView leadingAnchor](self, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  objc_msgSend(v8, "trailingAnchor");
  v13 = objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v24, "backgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v18, "mf_isTranslucent");

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v8, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

  }
  return v17;
}

- (void)_layoutAnimatedWithCompletion:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__MFMessageHeaderView__layoutAnimatedWithCompletion___block_invoke;
  v3[3] = &unk_1E9A02D88;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v3, a3, 0.349999994, 0.0, 1.0, 0.0);
}

uint64_t __53__MFMessageHeaderView__layoutAnimatedWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  MFMessageHeaderView *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMessageHeaderView viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[MFMessageHeaderView setViewModel:](self, "setViewModel:", v4);
    +[MFMessageHeaderView log](MFMessageHeaderView, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      objc_msgSend(v4, "itemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v7;
      v20 = 2048;
      v21 = self;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_1D56AF000, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Setting up view model for itemID: %{public}@", buf, 0x20u);

    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[MFMessageHeaderView headerBlocks](self, "headerBlocks", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "displayMessageUsingViewModel:", v4);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

    -[MFMessageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setMessageFlags:(unint64_t)a3 conversationFlags:(unint64_t)a4
{
  void *v7;
  id v8;
  _QWORD v9[6];

  -[MFMessageHeaderView viewModel](self, "viewModel");
  v9[1] = 3221225472;
  v9[2] = __57__MFMessageHeaderView_setMessageFlags_conversationFlags___block_invoke;
  v9[3] = &__block_descriptor_48_e44_v16__0___MessageItemFlagsViewModelBuilder__8l;
  v9[4] = a3;
  v9[5] = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v8, "updatedFlagsModelWithBuilder:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderView setViewModel:](self, "setViewModel:", v7);

}

void __57__MFMessageHeaderView_setMessageFlags_conversationFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setRead:", *(_DWORD *)(a1 + 32) & 1);
  objc_msgSend(v3, "setFlagged:", (*(_QWORD *)(a1 + 32) >> 4) & 1);
  objc_msgSend(v3, "setReplied:", (*(_QWORD *)(a1 + 32) >> 2) & 1);
  objc_msgSend(v3, "setForwarded:", (*(_QWORD *)(a1 + 32) >> 8) & 1);
  objc_msgSend(v3, "setRedirected:", (*(_QWORD *)(a1 + 32) >> 9) & 1);
  objc_msgSend(v3, "setJunk:", (*(_QWORD *)(a1 + 32) >> 21) & 1);
  objc_msgSend(v3, "setVIP:", (*(_QWORD *)(a1 + 32) >> 24) & 1);
  objc_msgSend(v3, "setNotify:", *(_DWORD *)(a1 + 40) & 1);
  objc_msgSend(v3, "setMute:", (*(_QWORD *)(a1 + 40) >> 2) & 1);

}

- (void)setDisplayMetrics:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[MFMessageHeaderView headerBlocks](self, "headerBlocks", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          -[MFMessageHeaderView displayMetrics](self, "displayMetrics");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setDisplayMetrics:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[MFMessageHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[MFMessageHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)_updateSeparators
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  char v16;

  -[MFMessageHeaderView displayMetrics](self, "displayMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasCompactLayout") & 1) != 0)
    v4 = 0;
  else
    v4 = !-[MFMessageHeaderView bottomSeparatorDrawsFlushWithLeadingEdge](self, "bottomSeparatorDrawsFlushWithLeadingEdge");

  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_firstObjectPassingTest:", &__block_literal_global_35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", v8);

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[MFMessageHeaderView headerBlocks](self, "headerBlocks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__MFMessageHeaderView__updateSeparators__block_invoke_2;
  v13[3] = &unk_1E9A03D20;
  v13[4] = self;
  v16 = v4;
  v12 = v6;
  v14 = v12;
  v15 = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

}

uint64_t __40__MFMessageHeaderView__updateSeparators__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __40__MFMessageHeaderView__updateSeparators__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(*(id *)(a1 + 32), "displayMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prefersFlushSeparator");

  v7 = v20;
  if (*(id *)(a1 + 40) == v20)
  {
    v9 = *(_BYTE *)(a1 + 56) != 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pinnedBlock");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v20;
    if (v8 == v20)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "headerBlocks");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", a3 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "_blockHasWhiteOrClearBackground:", v12);

      v6 = 1;
      v7 = v20;
    }
    else
    {
      v9 = 0;
    }
  }
  if (*(_QWORD *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "headerBlocks");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "indexOfObject:", v20);

    objc_msgSend(*(id *)(a1 + 32), "headerBlocks");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "indexOfObject:", v20);

    objc_msgSend(*(id *)(a1 + 32), "headerBlocks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "indexOfObject:", v20);

    v7 = v20;
    if (v14 == v16 + 1 || v14 == v18 - 1 || v14 == *(_QWORD *)(a1 + 48))
      v9 = 1;
  }
  objc_msgSend(v7, "setSeparatorIsHidden:", v9);
  objc_msgSend(v20, "setSeparatorDrawsFlushWithTrailingEdge:", v6);
  objc_msgSend(*(id *)(a1 + 32), "displayMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSeparatorDrawsFlushWithLeadingEdge:", objc_msgSend(v19, "prefersFlushSeparatorForLeadingEdge"));

}

- (BOOL)_blockHasWhiteOrClearBackground:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(a3, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "isEqual:", v6);

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)prepareForReuse
{
  -[MFMessageHeaderView setViewModel:](self, "setViewModel:", 0);
}

- (void)addConversationSearchOverlay
{
  id v3;
  id v4;

  -[MFMessageHeaderView findOverlayView](self, "findOverlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderView bringSubviewToFront:](self, "bringSubviewToFront:");

  -[MFMessageHeaderView findOverlayView](self, "findOverlayView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "show");

}

- (void)removeConversationSearchOverlay
{
  id v3;
  id v4;

  -[MFMessageHeaderView findOverlayView](self, "findOverlayView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hide");

  -[MFMessageHeaderView findOverlayView](self, "findOverlayView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMessageHeaderView sendSubviewToBack:](self, "sendSubviewToBack:");

}

- (MFMessageHeaderViewDelegate)delegate
{
  return (MFMessageHeaderViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (MFMessageHeaderViewBlock)pinnedBlock
{
  return self->_pinnedBlock;
}

- (NSArray)headerBlocks
{
  return &self->_headerBlocks->super;
}

- (BOOL)bottomSeparatorDrawsFlushWithLeadingEdge
{
  return self->_bottomSeparatorDrawsFlushWithLeadingEdge;
}

- (void)setBottomSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3
{
  self->_bottomSeparatorDrawsFlushWithLeadingEdge = a3;
}

- (MessageHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void)setDraggableArea:(CGRect)a3
{
  self->_draggableArea = a3;
}

- (void)setFindOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_findOverlayView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findOverlayView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_pinnedBlock, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerBlocks, 0);
}

@end
