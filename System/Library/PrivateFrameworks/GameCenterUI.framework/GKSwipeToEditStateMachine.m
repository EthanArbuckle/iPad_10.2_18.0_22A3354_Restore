@implementation GKSwipeToEditStateMachine

- (GKSwipeToEditStateMachine)initWithCollectionView:(id)a3
{
  id v4;
  GKSwipeToEditStateMachine *v5;
  GKSwipeToEditStateMachine *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GKCancelSwipeToEditGestureRecognizer *v15;
  GKCancelSwipeToEditGestureRecognizer *editModeCancelRecognizer;
  uint64_t v17;
  UIPanGestureRecognizer *panGestureRecognizer;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _QWORD v44[3];
  const __CFString *v45;
  _QWORD v46[4];
  _QWORD v47[4];
  const __CFString *v48;
  _QWORD v49[5];
  _QWORD v50[7];

  v50[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)GKSwipeToEditStateMachine;
  v5 = -[_GKStateMachine init](&v41, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GKSwipeToEditStateMachine setCollectionView:](v5, "setCollectionView:", v4);
    objc_msgSend(v4, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKSwipeToEditStateMachine setGkDataSource:](v6, "setGkDataSource:", v9);

    }
    v32 = v4;
    -[_GKStateMachine setCurrentState:](v6, "setCurrentState:", CFSTR("NothingState"));
    v48 = CFSTR("TrackingState");
    v49[0] = CFSTR("NothingState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v31;
    v49[1] = CFSTR("TrackingState");
    v47[0] = CFSTR("AnimatingOpenState");
    v47[1] = CFSTR("AnimatingShutState");
    v47[2] = CFSTR("TrackingState");
    v47[3] = CFSTR("NothingState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v10;
    v49[2] = CFSTR("AnimatingOpenState");
    v46[0] = CFSTR("EditingState");
    v46[1] = CFSTR("AnimatingShutState");
    v46[2] = CFSTR("TrackingState");
    v46[3] = CFSTR("NothingState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v11;
    v49[3] = CFSTR("AnimatingShutState");
    v45 = CFSTR("NothingState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v12;
    v49[4] = CFSTR("EditingState");
    v44[0] = CFSTR("TrackingState");
    v44[1] = CFSTR("AnimatingShutState");
    v44[2] = CFSTR("NothingState");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GKStateMachine setValidTransitions:](v6, "setValidTransitions:", v14);

    v15 = -[GKCancelSwipeToEditGestureRecognizer initWithTarget:action:]([GKCancelSwipeToEditGestureRecognizer alloc], "initWithTarget:action:", v6, sel_handleCancelTap_);
    editModeCancelRecognizer = v6->_editModeCancelRecognizer;
    v6->_editModeCancelRecognizer = v15;

    -[GKCancelSwipeToEditGestureRecognizer setNumberOfTapsRequired:](v6->_editModeCancelRecognizer, "setNumberOfTapsRequired:", 1);
    -[GKCancelSwipeToEditGestureRecognizer setCancelsTouchesInView:](v6->_editModeCancelRecognizer, "setCancelsTouchesInView:", 1);
    -[GKCancelSwipeToEditGestureRecognizer setDelegate:](v6->_editModeCancelRecognizer, "setDelegate:", v6);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v6, sel_handlePan_);
    panGestureRecognizer = v6->_panGestureRecognizer;
    v6->_panGestureRecognizer = (UIPanGestureRecognizer *)v17;

    -[UIPanGestureRecognizer setDelegate:](v6->_panGestureRecognizer, "setDelegate:", v6);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[UICollectionView gestureRecognizers](v6->_collectionView, "gestureRecognizers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v38;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v38 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v23);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v24, "requireGestureRecognizerToFail:", v6->_panGestureRecognizer);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v21);
    }

    v4 = v32;
    objc_msgSend(v32, "addGestureRecognizer:", v6->_panGestureRecognizer);
    -[UICollectionView gestureRecognizers](v6->_collectionView, "gestureRecognizers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v34;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v29++), "requireGestureRecognizerToFail:", v6->_editModeCancelRecognizer);
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v27);
    }
    -[UICollectionView addGestureRecognizer:](v6->_collectionView, "addGestureRecognizer:", v6->_editModeCancelRecognizer);

  }
  return v6;
}

- (NSIndexPath)trackedIndexPath
{
  return -[UICollectionView indexPathForCell:](self->_collectionView, "indexPathForCell:", self->_editingCell);
}

- (void)setDelegate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you're not the boss of me"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKCollectionViewController+GKSwipeToEdit.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKSwipeToEditStateMachine setDelegate:]", objc_msgSend(v6, "UTF8String"), 112);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
}

- (void)setEditingCell:(id)a3
{
  objc_storeStrong((id *)&self->_editingCell, a3);
}

- (double)xPositionForTranslation:(CGPoint)a3
{
  return (double)((int)(a3.x + self->_startTrackingX) & ((int)(a3.x + self->_startTrackingX) >> 31));
}

- (void)handlePan:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  if (v5 == 4)
    goto LABEL_13;
  if (v5 != 3)
  {
    if (v5 == 2)
    {
      objc_msgSend(v4, "translationInView:", self->_editingCell);
      -[GKSwipeToEditStateMachine xPositionForTranslation:](self, "xPositionForTranslation:");
      -[GKCollectionViewCell setEditingContentOriginX:](self->_editingCell, "setEditingContentOriginX:");
      -[_GKStateMachine setCurrentState:](self, "setCurrentState:", CFSTR("TrackingState"));
    }
    goto LABEL_14;
  }
  objc_msgSend(v4, "velocityInView:", self->_editingCell);
  v7 = v6;
  -[GKCollectionViewCell editingContentOriginX](self->_editingCell, "editingContentOriginX");
  v9 = v8;
  -[GKCollectionViewCell contentViewOriginXWhileEditing](self->_editingCell, "contentViewOriginXWhileEditing");
  if (v7 >= 0.0 || ((v11 = v10, v7 >= -100.0) ? (v12 = v9 > v10) : (v12 = 0), v12))
  {
LABEL_13:
    -[GKSwipeToEditStateMachine shutActionPaneForEditingCellAnimated:](self, "shutActionPaneForEditingCellAnimated:", 1);
    goto LABEL_14;
  }
  v13 = *MEMORY[0x1E0DC5808];
  v14 = objc_alloc(MEMORY[0x1E0DC4130]);
  v15 = (void *)objc_msgSend(v14, "initWithValue:velocity:unitSize:", v9, v7, *MEMORY[0x1E0DC5810]);
  objc_msgSend(v15, "setFriction:", v13);
  objc_msgSend(v15, "_setUsesNSTimer:", 1);
  objc_msgSend(MEMORY[0x1E0DC4120], "lowerBoundary:ofType:", 1, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addActiveValue:", v16);
  if (v9 > v11)
  {
    objc_msgSend(MEMORY[0x1E0DC4120], "upperBoundary:ofType:", 0, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addActiveValue:", v17);

  }
  -[_GKStateMachine setCurrentState:](self, "setCurrentState:", CFSTR("AnimatingOpenState"));
  v18[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __39__GKSwipeToEditStateMachine_handlePan___block_invoke;
  v19[3] = &unk_1E59C4F10;
  v19[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__GKSwipeToEditStateMachine_handlePan___block_invoke_2;
  v18[3] = &unk_1E59C4430;
  objc_msgSend(v15, "runWithValueApplier:completion:", v19, v18);
  -[GKSwipeToEditStateMachine setOpenAnimation:](self, "setOpenAnimation:", v15);

LABEL_14:
}

uint64_t __39__GKSwipeToEditStateMachine_handlePan___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v5;
  double v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "staticContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");

  v6 = 0.0;
  if (a3 <= 0.0)
    v6 = a3;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setEditingContentOriginX:", v6);
}

uint64_t __39__GKSwipeToEditStateMachine_handlePan___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setCurrentState:", CFSTR("EditingState"));
  return result;
}

- (void)handleCancelTap:(id)a3
{
  -[GKSwipeToEditStateMachine shutActionPaneForEditingCellAnimated:](self, "shutActionPaneForEditingCellAnimated:", 1);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  UICollectionView *collectionView;
  double v12;
  double v13;
  double v14;
  double v15;
  GKCollectionViewCell *v16;
  void *v17;
  void *v18;
  char v19;
  GKCollectionViewCell *editingCell;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  BOOL v25;
  void *v26;
  char v27;
  BOOL v28;
  double v29;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_panGestureRecognizer == v4)
  {
    -[_GKStateMachine currentState](self, "currentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("NothingState")) & 1) == 0)
    {
      -[_GKStateMachine currentState](self, "currentState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("EditingState")))
      {
        -[_GKStateMachine currentState](self, "currentState");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("AnimatingOpenState"));

        if ((v19 & 1) == 0)
          goto LABEL_21;
LABEL_10:
        collectionView = self->_collectionView;
        -[UIPanGestureRecognizer locationInView:](self->_panGestureRecognizer, "locationInView:", collectionView);
        -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIPanGestureRecognizer velocityInView:](self->_panGestureRecognizer, "velocityInView:", self->_collectionView);
        v13 = v12;
        v15 = v14;
        -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v6);
        v16 = (GKCollectionViewCell *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[_GKStateMachine currentState](self, "currentState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NothingState")) & 1) != 0)
          {

          }
          else
          {
            editingCell = self->_editingCell;

            if (v16 != editingCell)
              goto LABEL_20;
          }
          -[GKCollectionViewCell editActions](v16, "editActions");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          v23 = fabs(v15);
          v24 = fabs(v13);
          if (v22)
            v25 = v23 < v24;
          else
            v25 = 0;
          if (v25)
          {
            -[GKCollectionViewCell editingContentOriginX](v16, "editingContentOriginX", v23);
            self->_startTrackingX = v29;
            -[GKSwipeToEditStateMachine setEditingCell:](self, "setEditingCell:", v16);
            -[_GKStateMachine setCurrentState:](self, "setCurrentState:", CFSTR("TrackingState"));

            goto LABEL_25;
          }
        }
LABEL_20:

        goto LABEL_21;
      }

    }
    goto LABEL_10;
  }
  if ((UIPanGestureRecognizer *)self->_editModeCancelRecognizer != v4)
  {
LABEL_26:
    v28 = 1;
    goto LABEL_27;
  }
  -[_GKStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("EditingState")))
  {
LABEL_25:

    goto LABEL_26;
  }
  -[_GKStateMachine currentState](self, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("AnimatingOpenState"));

  if ((v8 & 1) != 0)
    goto LABEL_26;
LABEL_21:
  -[_GKStateMachine currentState](self, "currentState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("NothingState"));

  if ((v27 & 1) == 0)
    -[GKSwipeToEditStateMachine shutActionPaneForEditingCellAnimated:](self, "shutActionPaneForEditingCellAnimated:", 1);
  v28 = 0;
LABEL_27:

  return v28;
}

- (void)didEnterEditingState
{
  -[GKCollectionViewCell setUserInteractionEnabled:](self->_editingCell, "setUserInteractionEnabled:", 1);
  -[GKCollectionViewCell setUserInteractionEnabledForEditing:](self->_editingCell, "setUserInteractionEnabledForEditing:", 1);
}

- (void)didExitEditingState
{
  -[GKCollectionViewCell setUserInteractionEnabledForEditing:](self->_editingCell, "setUserInteractionEnabledForEditing:", 0);
}

- (void)didExitNothingState
{
  -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", 0);
  -[GKCollectionViewCell beginEditing](self->_editingCell, "beginEditing");
}

- (void)didEnterNothingState
{
  -[UICollectionView setScrollEnabled:](self->_collectionView, "setScrollEnabled:", 1);
  self->_startTrackingX = 0.0;
  -[GKCollectionViewCell setUserInteractionEnabled:](self->_editingCell, "setUserInteractionEnabled:", 1);
  -[GKCollectionViewCell finishEditing](self->_editingCell, "finishEditing");
  -[GKSwipeToEditStateMachine setEditingCell:](self, "setEditingCell:", 0);
}

- (void)didEnterAnimatingShutState
{
  -[GKCollectionViewCell setUserInteractionEnabled:](self->_editingCell, "setUserInteractionEnabled:", 0);
  -[GKCollectionViewCell animateOutSwipeToEditAccessories](self->_editingCell, "animateOutSwipeToEditAccessories");
}

- (void)didEnterAnimatingOpenState
{
  -[GKCollectionViewCell setUserInteractionEnabled:](self->_editingCell, "setUserInteractionEnabled:", 0);
  -[GKCancelSwipeToEditGestureRecognizer setCurrentEditingCell:](self->_editModeCancelRecognizer, "setCurrentEditingCell:", self->_editingCell);
}

- (void)didExitAnimatingOpenState
{
  -[_UIDynamicAnimation stop](self->_openAnimation, "stop");
  -[GKSwipeToEditStateMachine setOpenAnimation:](self, "setOpenAnimation:", 0);
}

- (void)shutActionPaneForEditingCellAnimated:(BOOL)a3
{
  _QWORD block[5];

  if (a3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    gk_dispatch_debounce();
  }
}

uint64_t __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke()
{
  return gk_dispatch_debounce();
}

void __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("NothingState"));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", CFSTR("AnimatingShutState"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke_3;
    v6[3] = &unk_1E59C4430;
    v6[4] = v4;
    objc_msgSend(v5, "shutActionPaneAnimated:completion:", 1, v6);
  }
}

uint64_t __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setCurrentState:", CFSTR("NothingState"));
  return result;
}

uint64_t __66__GKSwipeToEditStateMachine_shutActionPaneForEditingCellAnimated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "shutActionPaneAnimated:completion:", 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentState:", CFSTR("NothingState"));
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;

  -[_GKStateMachine currentState](self, "currentState", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("NothingState"));

  if ((v5 & 1) == 0)
    -[GKSwipeToEditStateMachine shutActionPaneForEditingCellAnimated:](self, "shutActionPaneForEditingCellAnimated:", 0);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (GKCollectionViewDataSource)gkDataSource
{
  return self->_gkDataSource;
}

- (void)setGkDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_gkDataSource, a3);
}

- (GKCancelSwipeToEditGestureRecognizer)editModeCancelRecognizer
{
  return self->_editModeCancelRecognizer;
}

- (void)setEditModeCancelRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_editModeCancelRecognizer, a3);
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panGestureRecognizer, a3);
}

- (GKCollectionViewCell)editingCell
{
  return self->_editingCell;
}

- (double)startTrackingX
{
  return self->_startTrackingX;
}

- (void)setStartTrackingX:(double)a3
{
  self->_startTrackingX = a3;
}

- (_UIDynamicAnimation)openAnimation
{
  return self->_openAnimation;
}

- (void)setOpenAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_openAnimation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openAnimation, 0);
  objc_storeStrong((id *)&self->_editingCell, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_editModeCancelRecognizer, 0);
  objc_storeStrong((id *)&self->_gkDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
