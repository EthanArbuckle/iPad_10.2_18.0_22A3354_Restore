@implementation PKSpaceInsertionController

- (BOOL)isCurrentlyAddingSpace
{
  return self->_isCurrentlyAddingSpace;
}

- (PKSpaceInsertionController)initWithSelectionController:(id)a3
{
  PKSpaceInsertionController *v4;
  id v5;
  objc_super v7;
  id location;

  objc_initWeak(&location, a3);
  v7.receiver = self;
  v7.super_class = (Class)PKSpaceInsertionController;
  v4 = -[PKSpaceInsertionController init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_selectionController, v5);

    v4->_topHandleRemovesWhitespace = 1;
  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)didScroll:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  y = a3.y;
  x = a3.x;
  -[PKSpaceInsertionView origin](self->_topInsertionView, "origin");
  v7 = x + v6;
  v9 = y + v8;
  -[PKSpaceInsertionView bounds](self->_topInsertionView, "bounds");
  -[PKSpaceInsertionView setFrame:](self->_topInsertionView, "setFrame:", v7, v9);
  -[PKSpaceInsertionView origin](self->_bottomInsertionView, "origin");
  v11 = x + v10;
  v13 = y + v12;
  -[PKSpaceInsertionView bounds](self->_bottomInsertionView, "bounds");
  -[PKSpaceInsertionView setFrame:](self->_bottomInsertionView, "setFrame:", v11, v13);
}

- (double)_initalBufferBetweenLollipops
{
  return 0.0;
}

- (void)invalidateCachedStrokes
{
  PKStrokeSelection *cachedStrokeSelection;
  NSOrderedSet *cachedStrokesBelow;
  NSOrderedSet *cachedStrokesAbove;

  cachedStrokeSelection = self->_cachedStrokeSelection;
  self->_cachedStrokeSelection = 0;

  cachedStrokesBelow = self->_cachedStrokesBelow;
  self->_cachedStrokesBelow = 0;

  cachedStrokesAbove = self->_cachedStrokesAbove;
  self->_cachedStrokesAbove = 0;

  self->_shouldUseCachedStrokes = 0;
}

- (void)_dragLollipop:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[PKSpaceInsertionController _panGestureDidBegin:](self, "_panGestureDidBegin:", v4);
  }
  else if (objc_msgSend(v4, "state") == 2)
  {
    -[PKSpaceInsertionController _panGestureDidChange:](self, "_panGestureDidChange:", v4);
  }
  else if (objc_msgSend(v4, "state") == 3)
  {
    -[PKSpaceInsertionController _panGestureDidEnd:](self, "_panGestureDidEnd:", v4);
  }
  else if (objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    -[PKSpaceInsertionController _panGestureDidCancelOrFail:](self, "_panGestureDidCancelOrFail:", v4);
  }

}

- (void)_didGrabInsertSpaceAffordance:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  CGFloat MinY;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSOrderedSet *cachedStrokesAbove;
  BOOL v29;
  NSOrderedSet *v30;
  NSOrderedSet *cachedStrokesBelow;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37[3];
  id location;
  CGRect v39;

  v4 = a3;
  -[PKSpaceInsertionController selectionController](self, "selectionController");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController topView](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[PKSpaceInsertionController selectionController](self, "selectionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _drawingForSelectionRect:]((uint64_t)v11, v8 + -60.0, v10 + -60.0, 120.0, 120.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "state") == 1)
  {
    +[PKStatisticsManager sharedStatisticsManager]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStatisticsManager recordInsertSpaceWithType:]((uint64_t)v13, 3);

    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = *(void **)(v14 + 144);
    else
      v16 = 0;
    v17 = v16;
    objc_msgSend(v17, "frame");
    MinY = CGRectGetMinY(v39);

    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = *(void **)(v19 + 120);
    else
      v21 = 0;
    objc_storeStrong((id *)&self->_strokeSelectionBeforeInsertingSpace, v21);

    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = *(void **)(v22 + 144);
    else
      v24 = 0;
    v25 = v24;
    self->_selectionTypeBeforeInsertingSpace = objc_msgSend(v25, "selectionType");

    -[PKStrokeSelection strokeIdentifiers](self->_cachedStrokeSelection, "strokeIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStrokeSelection strokeIdentifiers](self->_strokeSelectionBeforeInsertingSpace, "strokeIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "isEqual:", v27) && self->_cachedStrokesBelow)
    {
      cachedStrokesAbove = self->_cachedStrokesAbove;

      if (cachedStrokesAbove)
      {
        v29 = 1;
LABEL_16:
        self->_shouldUseCachedStrokes = v29;
        self->_insertSpaceAffordancePanDidEnd = 0;
        -[PKSpaceInsertionController selectionController](self, "selectionController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v32, 0, 0);

        objc_initWeak(&location, self);
        -[PKStrokeSelection strokes](self->_strokeSelectionBeforeInsertingSpace, "strokes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "array");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __60__PKSpaceInsertionController__didGrabInsertSpaceAffordance___block_invoke;
        v35[3] = &unk_1E777D470;
        objc_copyWeak(v37, &location);
        v35[4] = self;
        v37[1] = 0;
        v37[2] = *(id *)&MinY;
        v36 = v4;
        -[PKSpaceInsertionController fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:inDrawing:completion:](self, "fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:inDrawing:completion:", v34, v12, v35);

        objc_destroyWeak(v37);
        objc_destroyWeak(&location);
        goto LABEL_22;
      }
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_cachedStrokeSelection, self->_strokeSelectionBeforeInsertingSpace);
    v30 = self->_cachedStrokesAbove;
    self->_cachedStrokesAbove = 0;

    cachedStrokesBelow = self->_cachedStrokesBelow;
    self->_cachedStrokesBelow = 0;

    v29 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v4, "state") == 2)
  {
    -[PKSpaceInsertionController _panGestureDidChange:](self, "_panGestureDidChange:", v4);
  }
  else if (objc_msgSend(v4, "state") == 3)
  {
    objc_storeStrong((id *)&self->_cachedStrokesAbove, self->_strokesAbove);
    objc_storeStrong((id *)&self->_cachedStrokesBelow, self->_strokesBelow);
    -[PKSpaceInsertionController _panGestureDidEnd:](self, "_panGestureDidEnd:", v4);
    -[PKSpaceInsertionController _dismissHandlesAndReselectExistingSelectionInDrawing:](self, "_dismissHandlesAndReselectExistingSelectionInDrawing:", v12);
    self->_insertSpaceAffordancePanDidEnd = 1;
  }
  else if (objc_msgSend(v4, "state") == 5 || objc_msgSend(v4, "state") == 4)
  {
    -[PKSpaceInsertionController _panGestureDidCancelOrFail:](self, "_panGestureDidCancelOrFail:", v4);
    -[PKSpaceInsertionController _dismissHandlesAndReselectExistingSelectionInDrawing:](self, "_dismissHandlesAndReselectExistingSelectionInDrawing:", v12);
  }
LABEL_22:

}

void __60__PKSpaceInsertionController__didGrabInsertSpaceAffordance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  id *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained[177])
  {
    objc_msgSend(*(id *)(a1 + 32), "selectionController");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController insertSpaceAtPoint:addDefaultSpace:strokesAbove:strokesBelow:](v7, 0, v5, v8, *(double *)(a1 + 56), *(double *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 32), "_panGestureDidBegin:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_dismissHandlesAndReselectExistingSelectionInDrawing:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  PKStrokeSelection *strokeSelectionBeforeInsertingSpace;
  id v14;

  v14 = a3;
  -[PKSpaceInsertionController selectionController](self, "selectionController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(*(id *)(v4 + 136), "commitSpacingResize");

  -[PKStrokeSelection strokes](self->_strokeSelectionBeforeInsertingSpace, "strokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDrawing visibleStrokesFromStrokes:inDrawing:](PKDrawing, "visibleStrokesFromStrokes:inDrawing:", v7, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSpaceInsertionController selectionController](self, "selectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _refreshExternalElementsInStrokeSelection:](v9, self->_strokeSelectionBeforeInsertingSpace);

  -[PKStrokeSelection externalElements](self->_strokeSelectionBeforeInsertingSpace, "externalElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpaceInsertionController selectionController](self, "selectionController");
  v11 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:](v11, v12, v10, self->_selectionTypeBeforeInsertingSpace, v14);

  strokeSelectionBeforeInsertingSpace = self->_strokeSelectionBeforeInsertingSpace;
  self->_strokeSelectionBeforeInsertingSpace = 0;

  self->_shouldUseCachedStrokes = 0;
}

- (void)_panGestureDidBegin:(id)a3
{
  uint64_t v4;
  id v5;
  CGFloat v6;
  CGFloat v7;
  id *WeakRetained;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  UIPanGestureRecognizer *v14;

  v14 = (UIPanGestureRecognizer *)a3;
  v4 = 32;
  if (self->_dragBottomLollipopGR == v14)
    v4 = 40;
  v5 = *(id *)((char *)&self->super.isa + v4);
  objc_msgSend(v5, "frame");
  self->_beginDragLocation.x = v6;
  self->_beginDragLocation.y = v7;
  objc_msgSend(v5, "setIsDragging:", 1);
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v9 = WeakRetained;
  if (WeakRetained)
    v10 = objc_loadWeakRetained(WeakRetained + 14);
  else
    v10 = 0;
  -[PKDrawing uuid](self->_drawing, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachmentForUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v13 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _willBeginInsertSpaceInAttachment:](v13, v12);

  }
  -[PKSpaceInsertionController _blitStrokesToViewForSpaceInsertionType:withCompletion:](self, "_blitStrokesToViewForSpaceInsertionType:withCompletion:", objc_msgSend(v5, "insertionType"), 0);

}

- (void)_panGestureDidChange:(id)a3
{
  UIPanGestureRecognizer *v4;
  PKSelectionController **p_selectionController;
  id *WeakRetained;
  void *v7;
  double v8;
  double v9;
  UIPanGestureRecognizer *dragBottomLollipopGR;
  PKSpaceInsertionView *v11;
  PKSpaceInsertionView **p_topInsertionView;
  double v13;
  double v14;
  double v15;
  PKSpaceInsertionView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double y;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id *v34;
  id *v35;
  id v36;
  void *v37;
  void *v38;
  double v39;
  id *v40;
  id *v41;
  id v42;
  id *v43;
  double v44;
  double v45;

  v4 = (UIPanGestureRecognizer *)a3;
  p_selectionController = &self->_selectionController;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController topView](WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSpaceInsertionController _initalBufferBetweenLollipops](self, "_initalBufferBetweenLollipops");
  v9 = v8;
  dragBottomLollipopGR = self->_dragBottomLollipopGR;
  if (dragBottomLollipopGR == v4)
  {
    v11 = self->_bottomInsertionView;
    p_topInsertionView = &self->_topInsertionView;
    -[PKSpaceInsertionView frame](self->_topInsertionView, "frame");
    v14 = v9 + v15;
  }
  else
  {
    v11 = self->_topInsertionView;
    p_topInsertionView = &self->_bottomInsertionView;
    -[PKSpaceInsertionView frame](self->_bottomInsertionView, "frame");
    v14 = v13 - v9;
  }
  v16 = *p_topInsertionView;
  -[UIPanGestureRecognizer translationInView:](v4, "translationInView:", v7);
  v18 = v17 + self->_beginDragLocation.y;
  v19 = fmin(v18, v14);
  v20 = fmax(v18, v14);
  if (dragBottomLollipopGR == v4)
    v19 = v20;
  if (self->_topHandleRemovesWhitespace)
    v21 = v18;
  else
    v21 = v19;
  -[PKSpaceInsertionView origin](v11, "origin");
  v23 = v22;
  -[PKSpaceInsertionView frame](v11, "frame");
  v25 = v24;
  -[PKSpaceInsertionView frame](v11, "frame");
  -[PKSpaceInsertionView setFrame:](v11, "setFrame:", v23, v21, v25);
  y = self->_beginDragLocation.y;
  -[PKSpaceInsertionView origin](v16, "origin");
  v28 = v27;
  -[PKSpaceInsertionController _initalBufferBetweenLollipops](self, "_initalBufferBetweenLollipops");
  v30 = v29;
  -[PKSpaceInsertionView frame](v16, "frame");
  v32 = v31;
  -[PKSpaceInsertionView frame](v16, "frame");
  -[PKSpaceInsertionView setFrame:](v16, "setFrame:", v28, v21 + v30, v32);
  v33 = v21 - y;
  -[PKSpaceInsertionController _temporarilyShiftStrokesWithOffset:spaceInsertionType:](self, "_temporarilyShiftStrokesWithOffset:spaceInsertionType:", -[PKSpaceInsertionView insertionType](v11, "insertionType"), v33);
  v34 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v35 = v34;
  if (v34)
    v36 = objc_loadWeakRetained(v34 + 14);
  else
    v36 = 0;
  -[PKDrawing uuid](self->_drawing, "uuid");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "attachmentForUUID:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v38, "drawingTransform");
    v39 = v33 / sqrt(v45 * v45 + v44 * v44);
    v40 = (id *)objc_loadWeakRetained((id *)p_selectionController);
    v41 = v40;
    if (v40)
      v42 = objc_loadWeakRetained(v40 + 14);
    else
      v42 = 0;
    objc_msgSend(v42, "_transientlyUpdateHeightOfAttachment:delta:", v38, v39);

    v43 = (id *)objc_loadWeakRetained((id *)p_selectionController);
    -[PKSelectionController _didMoveInsertSpace:inAttachment:](v43, v38, v39);

  }
}

- (void)_panGestureDidEnd:(id)a3
{
  id *WeakRetained;
  void *v5;
  double v6;
  double v7;
  UIPanGestureRecognizer *dragBottomLollipopGR;
  PKSpaceInsertionView *v9;
  PKSpaceInsertionView **p_topInsertionView;
  double v11;
  double v12;
  double v13;
  PKSpaceInsertionView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double y;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  UIPanGestureRecognizer *v32;

  v32 = (UIPanGestureRecognizer *)a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController topView](WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSpaceInsertionController _initalBufferBetweenLollipops](self, "_initalBufferBetweenLollipops");
  v7 = v6;
  dragBottomLollipopGR = self->_dragBottomLollipopGR;
  if (dragBottomLollipopGR == v32)
  {
    v9 = self->_bottomInsertionView;
    p_topInsertionView = &self->_topInsertionView;
    -[PKSpaceInsertionView frame](self->_topInsertionView, "frame");
    v12 = v7 + v13;
  }
  else
  {
    v9 = self->_topInsertionView;
    p_topInsertionView = &self->_bottomInsertionView;
    -[PKSpaceInsertionView frame](self->_bottomInsertionView, "frame");
    v12 = v11 - v7;
  }
  v14 = *p_topInsertionView;
  -[UIPanGestureRecognizer translationInView:](v32, "translationInView:", v5);
  v16 = v15;
  -[PKSpaceInsertionView setIsDragging:](v9, "setIsDragging:", 0);
  v17 = v16 + self->_beginDragLocation.y;
  v18 = fmin(v17, v12);
  v19 = fmax(v17, v12);
  if (dragBottomLollipopGR == v32)
    v18 = v19;
  if (self->_topHandleRemovesWhitespace)
    v20 = v16 + self->_beginDragLocation.y;
  else
    v20 = v18;
  -[PKSpaceInsertionView origin](v9, "origin");
  v22 = v21;
  -[PKSpaceInsertionView frame](v9, "frame");
  v24 = v23;
  -[PKSpaceInsertionView frame](v9, "frame");
  -[PKSpaceInsertionView setFrame:](v9, "setFrame:", v22, v20, v24);
  y = self->_beginDragLocation.y;
  -[PKSpaceInsertionView origin](v14, "origin");
  v27 = v26;
  -[PKSpaceInsertionView frame](v14, "frame");
  v29 = v28;
  -[PKSpaceInsertionView frame](v14, "frame");
  -[PKSpaceInsertionView setFrame:](v14, "setFrame:", v27, v20, v29);
  +[PKStatisticsManager sharedStatisticsManager]();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v20 - y;
  -[PKStatisticsManager recordInsertSpaceAddWhitespace:]((uint64_t)v30, v31 > 0.0);

  -[PKSpaceInsertionController _makeSpaceWithOffset:spaceInsertionType:](self, "_makeSpaceWithOffset:spaceInsertionType:", -[PKSpaceInsertionView insertionType](v9, "insertionType"), v31);
}

- (void)_panGestureDidCancelOrFail:(id)a3
{
  -[PKSpaceInsertionController _makeSpaceWithOffset:spaceInsertionType:](self, "_makeSpaceWithOffset:spaceInsertionType:", 0, 0.0);
}

- (void)commitSpacingResize
{
  id v3;

  -[PKSpaceInsertionController _didEndCreatingSpace](self, "_didEndCreatingSpace");
  -[PKSpaceInsertionController _dismissSpacingResizeHandles](self, "_dismissSpacingResizeHandles");
  -[PKSpaceInsertionController selectionController](self, "selectionController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didEndModifyDrawing");

}

- (void)_dismissSpacingResizeHandles
{
  -[PKSpaceInsertionView removeFromSuperview](self->_topInsertionView, "removeFromSuperview");
  -[PKSpaceInsertionView removeFromSuperview](self->_bottomInsertionView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_tapToDismissView, "removeFromSuperview");
  self->_isCurrentlyAddingSpace = 0;
}

- (void)_layoutViewsIfNecessary
{
  id *WeakRetained;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PKSpaceInsertionView *topInsertionView;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PKSpaceInsertionView *bottomInsertionView;
  double v16;
  double v17;
  double v18;
  double v19;

  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController topView](WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;

  +[PKDrawingAdjustmentKnob leftMargin](PKDrawingAdjustmentKnob, "leftMargin");
  v8 = v7;
  topInsertionView = self->_topInsertionView;
  -[PKSpaceInsertionView origin](topInsertionView, "origin");
  v11 = v10;
  v13 = v12;
  v14 = v6 - v8 + -28.0;
  -[PKSpaceInsertionView bounds](self->_topInsertionView, "bounds");
  -[PKSpaceInsertionView setFrame:](topInsertionView, "setFrame:", v11, v13, v14);
  bottomInsertionView = self->_bottomInsertionView;
  -[PKSpaceInsertionView origin](bottomInsertionView, "origin");
  v17 = v16;
  v19 = v18;
  -[PKSpaceInsertionView bounds](self->_bottomInsertionView, "bounds");
  -[PKSpaceInsertionView setFrame:](bottomInsertionView, "setFrame:", v17, v19, v14);
  -[PKSpaceInsertionView setNeedsDisplay](self->_topInsertionView, "setNeedsDisplay");
  -[PKSpaceInsertionView setNeedsDisplay](self->_bottomInsertionView, "setNeedsDisplay");
}

- (void)didBeginCreatingSpaceWithLassoStroke:(id)a3 drawing:(id)a4 addDefaultSpace:(BOOL)a5 strokesAbove:(id)a6 strokesBelow:(id)a7 externalElements:(id)a8
{
  id v14;
  id *WeakRetained;
  id *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableOrderedSet *v25;
  NSMutableOrderedSet *strokesAbove;
  void *v27;
  void *v28;
  void *v29;
  NSMutableOrderedSet *v30;
  NSMutableOrderedSet *strokesBelow;
  id *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id *v42;
  void *v43;
  double v44;
  _BOOL4 v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v45 = a5;
  v47 = a3;
  v14 = a4;
  v49 = a6;
  v48 = a7;
  v46 = a8;
  objc_storeStrong((id *)&self->_drawing, a4);
  objc_storeStrong((id *)&self->_lassoStroke, a3);
  objc_storeStrong((id *)&self->_externalElements, a8);
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v16 = WeakRetained;
  if (WeakRetained)
    v17 = objc_loadWeakRetained(WeakRetained + 14);
  else
    v17 = 0;
  objc_msgSend(v14, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attachmentForUUID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSpaceInsertionController selectionController](self, "selectionController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "didBeginModifyDrawing");

  if (v19)
  {
    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v21 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _willBeginInsertSpaceInAttachment:](v21, v19);

  }
  if (self->_shouldUseCachedStrokes)
  {
    v22 = (void *)MEMORY[0x1E0C99E10];
    -[NSOrderedSet array](self->_cachedStrokesAbove, "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDrawing visibleStrokesFromStrokes:inDrawing:](PKDrawing, "visibleStrokesFromStrokes:inDrawing:", v23, v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "orderedSetWithArray:", v24);
    v25 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    strokesAbove = self->_strokesAbove;
    self->_strokesAbove = v25;

    v27 = (void *)MEMORY[0x1E0C99E10];
    -[NSOrderedSet array](self->_cachedStrokesBelow, "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDrawing visibleStrokesFromStrokes:inDrawing:](PKDrawing, "visibleStrokesFromStrokes:inDrawing:", v28, v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "orderedSetWithArray:", v29);
    v30 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    strokesBelow = self->_strokesBelow;
    self->_strokesBelow = v30;

  }
  else
  {
    -[PKSpaceInsertionController _sortStrokesAboveOrBelowWithStrokesAbove:strokesBelow:](self, "_sortStrokesAboveOrBelowWithStrokesAbove:strokesBelow:", v49, v48);
  }
  if (-[NSMutableOrderedSet count](self->_strokesBelow, "count")
    || -[NSOrderedSet count](self->_externalElements, "count"))
  {
    self->_isCurrentlyAddingSpace = 1;
    v32 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController topView](v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v34;
    v37 = v36;
    v39 = v38;

    +[PKDrawingAdjustmentKnob leftMargin](PKDrawingAdjustmentKnob, "leftMargin");
    v41 = v40;
    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v42 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController topView](v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "effectiveUserInterfaceLayoutDirection"))
      v44 = 28.0;
    else
      v44 = v41;

    -[PKSpaceInsertionController _addSpacingViewsWithFrame:](self, "_addSpacingViewsWithFrame:", v44, v35, v37 - v41 + -28.0, v39);
  }
  else
  {
    -[PKSpaceInsertionController commitSpacingResize](self, "commitSpacingResize");
  }
  if (v45)
    -[PKSpaceInsertionController insertDefaultSpace:](self, "insertDefaultSpace:", 100.0);

}

- (void)_addSpacingViewsWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  UIView *v10;
  UIView *tapToDismissView;
  void *v12;
  id *WeakRetained;
  void *v14;
  CGPath *v15;
  id v16;
  CGFloat a;
  double v18;
  double v19;
  double v20;
  const CGPath *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  id v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  PKSpaceInsertionView *v51;
  PKSpaceInsertionView *topInsertionView;
  UIPanGestureRecognizer *v53;
  UIPanGestureRecognizer *dragTopLollipopGR;
  id *v55;
  void *v56;
  PKSpaceInsertionView *v57;
  PKSpaceInsertionView *bottomInsertionView;
  UIPanGestureRecognizer *v59;
  UIPanGestureRecognizer *dragBottomLollipopGR;
  id *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v69;
  CGAffineTransform transform;
  CGAffineTransform v71;
  CGRect BoundingBox;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_didMoveStrokes = 0;
  -[PKSpaceInsertionController _initalBufferBetweenLollipops](self, "_initalBufferBetweenLollipops");
  v9 = v8;
  v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", x, y, width, height);
  tapToDismissView = self->_tapToDismissView;
  self->_tapToDismissView = v10;

  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_commitSpacingResize);
  -[UIView addGestureRecognizer:](self->_tapToDismissView, "addGestureRecognizer:", v66);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel_commitSpacingResize);
  objc_msgSend(v12, "setMinimumPressDuration:", 0.0);
  -[UIView addGestureRecognizer:](self->_tapToDismissView, "addGestureRecognizer:", v12);
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController topView](WeakRetained);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_tapToDismissView);

  v15 = -[PKStroke _newPathRepresentation](self->_lassoStroke, "_newPathRepresentation");
  v63 = height;
  v16 = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _selectionDrawingTransformForDrawing:]((uint64_t)v16, self->_drawing, (uint64_t)&v71);
  a = v71.a;

  memset(&v71, 0, sizeof(v71));
  v65 = a;
  CGAffineTransformMakeScale(&v71, a, a);
  memset(&transform, 0, sizeof(transform));
  -[PKStroke _bounds](self->_lassoStroke, "_bounds");
  v19 = v18;
  -[PKStroke _bounds](self->_lassoStroke, "_bounds");
  CGAffineTransformMakeTranslation(&transform, -v19, -v20);
  t1 = transform;
  t2 = v71;
  CGAffineTransformConcat(&v69, &t1, &t2);
  transform = v69;
  v21 = CGPathCreateMutableCopyByTransformingPath(v15, &transform);
  -[PKStroke path](self->_lassoStroke, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  -[PKStroke path](self->_lassoStroke, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pointAtIndex:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v9;
  objc_msgSend(v25, "location");
  v28 = v27;
  v30 = v29;

  -[PKStroke path](self->_lassoStroke, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "pointAtIndex:", v23 - 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "location");
  v34 = v33;
  v36 = v35;

  v64 = v26;
  if (v28 >= v34)
  {
    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    v38 = x;
    v39 = width;
    -[PKSelectionController topView](v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "effectiveUserInterfaceLayoutDirection"))
    {
      v41 = v30;
    }
    else
    {
      v28 = v34;
      v41 = v36;
    }
  }
  else
  {
    -[PKSpaceInsertionController projectPath:toEndOfFrame:](self, "projectPath:toEndOfFrame:", v21, x, y, width, v63);
    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    v38 = x;
    v39 = width;
    -[PKSelectionController topView](v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "effectiveUserInterfaceLayoutDirection"))
    {
      v28 = v34;
      v41 = v36;
    }
    else
    {
      v41 = v30;
    }
  }

  v42 = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _selectionOffsetForDrawing:]((uint64_t)v42, self->_drawing);
  v44 = v43;

  -[PKStroke _bounds](self->_lassoStroke, "_bounds");
  v46 = v45;
  v47 = *MEMORY[0x1E0C9D538];
  v48 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (-[PKStroke _pointsCount](self->_lassoStroke, "_pointsCount"))
  {
    v47 = transform.tx + v41 * transform.c + transform.a * v28;
    v48 = transform.ty + v41 * transform.d + transform.b * v28;
  }
  BoundingBox = CGPathGetBoundingBox(v21);
  v49 = v44 + v65 * v46;
  v50 = BoundingBox.size.height + 30.0;
  v51 = -[PKSpaceInsertionView initWithFrame:insertionType:path:handleLocation:scale:]([PKSpaceInsertionView alloc], "initWithFrame:insertionType:path:handleLocation:scale:", 0, v21, v38, v49 - v64 * 0.5 + -15.0, v39, BoundingBox.size.height + 30.0, v47, v48, v65);
  topInsertionView = self->_topInsertionView;
  self->_topInsertionView = v51;

  v53 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__dragLollipop_);
  dragTopLollipopGR = self->_dragTopLollipopGR;
  self->_dragTopLollipopGR = v53;

  -[PKSpaceInsertionView addGestureRecognizer:](self->_topInsertionView, "addGestureRecognizer:", self->_dragTopLollipopGR);
  v55 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController topView](v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addSubview:", self->_topInsertionView);

  v57 = -[PKSpaceInsertionView initWithFrame:insertionType:path:handleLocation:scale:]([PKSpaceInsertionView alloc], "initWithFrame:insertionType:path:handleLocation:scale:", 1, v21, v38, v64 * 0.5 + v49 + -15.0, v39, v50, v47, v48, v65);
  bottomInsertionView = self->_bottomInsertionView;
  self->_bottomInsertionView = v57;

  v59 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__dragLollipop_);
  dragBottomLollipopGR = self->_dragBottomLollipopGR;
  self->_dragBottomLollipopGR = v59;

  -[PKSpaceInsertionView addGestureRecognizer:](self->_bottomInsertionView, "addGestureRecognizer:", self->_dragBottomLollipopGR);
  v61 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController topView](v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addSubview:", self->_bottomInsertionView);

  CGPathRelease(v15);
  CGPathRelease(v21);

}

- (void)projectPath:(CGPath *)a3 toEndOfFrame:(CGRect)a4
{
  double width;
  CGPoint CurrentPoint;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  double *v12;
  double v13;
  double y;
  double x;
  double v16;
  void *__p;
  _BYTE *v18;
  uint64_t v19;

  width = a4.size.width;
  CurrentPoint = CGPathGetCurrentPoint(a3);
  __p = 0;
  v18 = 0;
  v19 = 0;
  PKPointsFromPath(a3, (const void **)&__p, 1.79769313e308, 0.0);
  v7 = (v18 - (_BYTE *)__p) >> 4;
  if ((int)v7 >= 100)
    v8 = 100;
  else
    v8 = v7;
  if ((int)v8 < 3)
    goto LABEL_15;
  if (v7 <= 1)
    v9 = 1;
  else
    v9 = (v18 - (_BYTE *)__p) >> 4;
  if (v9 - 1 <= (unint64_t)(v8 - 3))
    std::vector<double>::__throw_out_of_range[abi:ne180100]();
  v10 = 0;
  v11 = v8 - 2;
  v12 = (double *)((char *)__p + 16 * v7 - 32);
  v13 = 0.0;
  y = CurrentPoint.y;
  x = CurrentPoint.x;
  do
  {
    v16 = x - *v12;
    if (v16 > 1.0)
    {
      v13 = v13 + (y - v12[1]) / v16;
      ++v10;
      y = v12[1];
      x = *v12;
    }
    v12 -= 2;
    --v11;
  }
  while (v11);
  if (v10 <= 0)
LABEL_15:
    CGPathAddLineToPoint(a3, 0, width, CurrentPoint.y);
  else
    CGPathAddQuadCurveToPoint(a3, 0, width * 0.5 + CurrentPoint.x * 0.5, CurrentPoint.y + (width * 0.5 + CurrentPoint.x * 0.5 - CurrentPoint.x) * (v13 / (double)v10), width, (CurrentPoint.y + CurrentPoint.y + (width * 0.5 + CurrentPoint.x * 0.5 - CurrentPoint.x) * (v13 / (double)v10))* 0.5);
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }
}

- (void)_didEndCreatingSpace
{
  id WeakRetained;
  NSMutableOrderedSet *strokesAbove;
  NSMutableOrderedSet *strokesBelow;

  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)WeakRetained);

  -[NSMutableOrderedSet removeAllObjects](self->_strokesAbove, "removeAllObjects");
  -[NSMutableOrderedSet removeAllObjects](self->_strokesBelow, "removeAllObjects");
  strokesAbove = self->_strokesAbove;
  self->_strokesAbove = 0;

  strokesBelow = self->_strokesBelow;
  self->_strokesBelow = 0;

}

- (void)_sortStrokesAboveOrBelowWithStrokesAbove:(id)a3 strokesBelow:(id)a4
{
  id v6;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *strokesAbove;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *strokesBelow;
  NSMutableOrderedSet *v11;
  void *v12;
  void *v13;
  NSMutableOrderedSet *v14;
  void *v15;
  void *v16;
  id *WeakRetained;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  id v46;
  double MaxX;
  double MaxY;
  double v49;
  double v50;
  double v51;
  id v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  id *v66;
  int v67;
  int MinX;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  id *v77;
  double v78;
  NSMutableOrderedSet **p_strokesAbove;
  CGFloat rect;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  NSMutableOrderedSet **p_strokesBelow;
  double v88;
  id *location;
  id v90;
  id obj;
  PKSpaceInsertionController *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v98 = *MEMORY[0x1E0C80C00];
  v90 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  strokesAbove = self->_strokesAbove;
  p_strokesAbove = &self->_strokesAbove;
  self->_strokesAbove = v7;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v9 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
  v92 = self;
  strokesBelow = self->_strokesBelow;
  p_strokesBelow = &self->_strokesBelow;
  self->_strokesBelow = v9;

  if (v90)
  {
    v11 = *p_strokesAbove;
    objc_msgSend(v90, "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDrawing visibleStrokesFromStrokes:inDrawing:](PKDrawing, "visibleStrokesFromStrokes:inDrawing:", v12, self->_drawing);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet addObjectsFromArray:](v11, "addObjectsFromArray:", v13);

  }
  if (v6)
  {
    v14 = *p_strokesBelow;
    objc_msgSend(v6, "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDrawing visibleStrokesFromStrokes:inDrawing:](PKDrawing, "visibleStrokesFromStrokes:inDrawing:", v15, self->_drawing);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet addObjectsFromArray:](v14, "addObjectsFromArray:", v16);

  }
  location = (id *)&self->_selectionController;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController topView](WeakRetained);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v85 = v20;
  v86 = v19;
  v83 = v22;
  v84 = v21;

  -[PKStroke _bounds](self->_lassoStroke, "_bounds");
  v81 = v24;
  v82 = v23;
  v88 = v25;
  rect = v26;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  -[PKDrawing strokes](self->_drawing, "strokes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v94 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v30, p_strokesAbove) & 1) == 0
          && (objc_msgSend(v90, "containsObject:", v30) & 1) == 0)
        {
          objc_msgSend(v30, "ink");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v32, "isEqual:", CFSTR("com.apple.ink.lasso")))
          {

          }
          else
          {
            objc_msgSend(v30, "ink");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "isEqual:", CFSTR("com.apple.ink.generationtool"));

            if ((v35 & 1) == 0)
            {
              v36 = (id *)objc_loadWeakRetained(location);
              -[PKSelectionController topView](v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "frame");
              v39 = v38;
              v41 = v40;
              v43 = v42;
              v45 = v44;

              v46 = objc_loadWeakRetained(location);
              v99.origin.x = v39;
              v99.origin.y = v41;
              v99.size.width = v43;
              v99.size.height = v45;
              MaxX = CGRectGetMaxX(v99);
              v100.origin.x = v39;
              v100.origin.y = v41;
              v100.size.width = v43;
              v100.size.height = v45;
              MaxY = CGRectGetMaxY(v100);
              *(_QWORD *)&v49 = -[PKSelectionController _pointInStrokeSpace:inDrawing:]((uint64_t)v46, v92->_drawing, MaxX, MaxY).n128_u64[0];
              v51 = v50;

              v52 = objc_loadWeakRetained(location);
              v101.origin.y = v85;
              v101.origin.x = v86;
              v101.size.height = v83;
              v101.size.width = v84;
              v53 = CGRectGetMaxY(v101);
              -[PKSelectionController _pointInStrokeSpace:inDrawing:]((uint64_t)v52, v92->_drawing, 0.0, v53);
              v55 = v54;

              objc_msgSend(v30, "_bounds");
              v57 = v56;
              v59 = v58;
              v61 = v60;
              v63 = v62;
              v102.size.width = v81;
              v102.origin.x = v82;
              v102.origin.y = v88;
              v102.size.height = rect;
              v64 = CGRectGetMaxY(v102);
              v103.origin.x = v57;
              v103.origin.y = v59;
              v103.size.width = v61;
              v103.size.height = v63;
              v65 = CGRectGetMaxY(v103);
              v66 = (id *)p_strokesBelow;
              if (v59 <= v64 && (v66 = (id *)p_strokesAbove, v65 >= v88))
              {
                v104.origin.x = v57;
                v104.origin.y = v59;
                v104.size.width = v61;
                v104.size.height = v63;
                v67 = 0;
                MinX = (int)CGRectGetMinX(v104);
                v69 = 0.0;
                while (1)
                {
                  v105.origin.x = v57;
                  v105.origin.y = v59;
                  v105.size.width = v61;
                  v105.size.height = v63;
                  if (CGRectGetMaxX(v105) <= (double)MinX)
                    break;
                  -[PKStroke intersectionFromPoint:toPoint:](v92->_lassoStroke, "intersectionFromPoint:toPoint:", (double)MinX, 0.0, (double)MinX, v55);
                  v69 = v69 + v70;
                  ++v67;
                  ++MinX;
                }
                if (v67)
                {
                  v71 = v69 / (double)v67;
                }
                else
                {
                  -[PKStroke _locationAtIndex:](v92->_lassoStroke, "_locationAtIndex:", -[PKStroke _pointsCount](v92->_lassoStroke, "_pointsCount") - 1);
                  v71 = v72;
                }
                objc_msgSend(v30, "_bounds");
                DKDPercentRectInsideRect(v73, v74, v75, v76, 0.0, v71, v49, v51 - v71);
                v77 = (id *)p_strokesAbove;
                if (v78 > 0.5)
                  v77 = (id *)p_strokesBelow;
                objc_msgSend(*v77, "addObject:", v30);
              }
              else
              {
                objc_msgSend(*v66, "addObject:", v30, v65);
              }
            }
          }
        }
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
    }
    while (v27);
  }

}

- (void)_makeSpaceWithOffset:(double)a3 spaceInsertionType:(unint64_t)a4
{
  PKDrawing *v7;
  uint64_t v8;
  id v9;
  double v10;
  CGFloat v11;
  id WeakRetained;
  void *v13;
  NSMutableOrderedSet *v14;
  NSMutableOrderedSet *strokesBelow;
  PKStrokeSelection *bottomStrokeSelection;
  PKStrokeSelection *topStrokeSelection;
  id *v18;
  id *v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  id *v25;
  NSMutableOrderedSet *v26;
  _QWORD v27[5];

  -[PKSpaceInsertionController initTopAndBottomSelectionIfNecessary](self, "initTopAndBottomSelectionIfNecessary");
  v7 = self->_drawing;
  if (a4 == 1)
  {
    v8 = 96;
  }
  else
  {
    v8 = 96;
    if (!self->_topHandleRemovesWhitespace)
      v8 = 104;
  }
  v9 = *(id *)((char *)&self->super.isa + v8);
  -[PKSpaceInsertionController offsetInStrokeSpaceFromViewOffset:inDrawing:](self, "offsetInStrokeSpaceFromViewOffset:inDrawing:", v7, a3);
  v11 = v10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70__PKSpaceInsertionController__makeSpaceWithOffset_spaceInsertionType___block_invoke;
  v27[3] = &unk_1E7776F38;
  v27[4] = self;
  -[PKSelectionController applySpaceInsertionWithStrokeSelection:inDrawing:offset:completion:]((uint64_t)WeakRetained, v9, v7, v27, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  self->_didMoveStrokes = 1;
  if (a4 == 1 || self->_topHandleRemovesWhitespace)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", v13);
    v14 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    strokesBelow = self->_strokesBelow;
    self->_strokesBelow = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithOrderedSet:", v13);
    v26 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    strokesBelow = self->_strokesAbove;
    self->_strokesAbove = v26;
  }

  bottomStrokeSelection = self->_bottomStrokeSelection;
  self->_bottomStrokeSelection = 0;

  topStrokeSelection = self->_topStrokeSelection;
  self->_topStrokeSelection = 0;

  v18 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v19 = v18;
  if (v18)
    v20 = objc_loadWeakRetained(v18 + 14);
  else
    v20 = 0;
  -[PKDrawing uuid](self->_drawing, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "attachmentForUUID:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v23 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSpaceInsertionController externalElements](self, "externalElements");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _didEndDraggingExternalElements:inAttachment:](v23, v24, v22);

    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v25 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _didEndInsertSpaceInAttachment:](v25, v22);

  }
}

void __70__PKSpaceInsertionController__makeSpaceWithOffset_spaceInsertionType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  *(_QWORD *)(v2 + 120) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeFromSuperview");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 112);
  *(_QWORD *)(v4 + 112) = 0;

}

- (void)_temporarilyShiftStrokesWithOffset:(double)a3 spaceInsertionType:(unint64_t)a4
{
  uint64_t v6;
  id v7;
  double x;
  double y;
  id *WeakRetained;
  id *v11;
  id v12;
  void *v13;
  void *v14;
  double b;
  double d;
  double ty;
  id *v18;
  double v19;
  id *v20;
  void *v21;
  __int128 v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;

  if (a4 == 1)
  {
    v6 = 120;
  }
  else
  {
    v6 = 120;
    if (!self->_topHandleRemovesWhitespace)
      v6 = 112;
  }
  v7 = *(id *)((char *)&self->super.isa + v6);
  x = self->_initialViewLocation.x;
  y = self->_initialViewLocation.y;
  objc_msgSend(v7, "frame");
  objc_msgSend(v7, "setFrame:", x, y + a3);
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v11 = WeakRetained;
  if (WeakRetained)
    v12 = objc_loadWeakRetained(WeakRetained + 14);
  else
    v12 = 0;
  -[PKDrawing uuid](self->_drawing, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attachmentForUUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "drawingTransform");
    CGAffineTransformInvert(&v26, &v25);
    b = v26.b;
    d = v26.d;
    ty = v26.ty;
    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v18 = (id *)objc_claimAutoreleasedReturnValue();
    v19 = ty + d * a3 + b * 0.0;
    -[PKSelectionController _didMoveInsertSpace:inAttachment:](v18, v14, v19);

    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v20 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKSpaceInsertionController externalElements](self, "externalElements");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v23.c = v22;
    *(_OWORD *)&v23.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformTranslate(&v24, &v23, 0.0, v19);
    -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:](v20, v21, &v24, v14);

  }
}

- (void)insertDefaultSpace:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__PKSpaceInsertionController_insertDefaultSpace___block_invoke;
  v3[3] = &unk_1E7779358;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[PKSpaceInsertionController _blitStrokesToViewForSpaceInsertionType:withCompletion:](self, "_blitStrokesToViewForSpaceInsertionType:withCompletion:", 1, v3);
}

uint64_t __49__PKSpaceInsertionController_insertDefaultSpace___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shiftStrokesWithOffset:", *(double *)(a1 + 40));
}

- (void)shiftStrokesWithOffset:(double)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *WeakRetained;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  _QWORD v31[5];
  id v32;
  id v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  -[PKSpaceInsertionView frame](self->_bottomInsertionView, "frame");
  v6 = v5;
  v28 = v8;
  v29 = v7;
  v10 = v9;
  -[PKSpaceInsertionView frame](self->_topInsertionView, "frame");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
  v20 = WeakRetained;
  if (WeakRetained)
    v21 = objc_loadWeakRetained(WeakRetained + 14);
  else
    v21 = 0;

  -[PKDrawing uuid](self->_drawing, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "attachmentForUUID:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0DC3F10];
  v25 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __53__PKSpaceInsertionController_shiftStrokesWithOffset___block_invoke;
  v31[3] = &unk_1E777D498;
  v31[4] = self;
  v34 = a3;
  v35 = v6;
  v36 = v29;
  v37 = v28;
  v38 = v10;
  v39 = v12;
  v40 = v14;
  v41 = v16;
  v42 = v18;
  v26 = v21;
  v32 = v26;
  v33 = v23;
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __53__PKSpaceInsertionController_shiftStrokesWithOffset___block_invoke_2;
  v30[3] = &unk_1E777D4C0;
  v30[4] = self;
  *(double *)&v30[5] = a3;
  v27 = v23;
  objc_msgSend(v24, "animateWithDuration:animations:completion:", v31, v30, 0.75);

}

uint64_t __53__PKSpaceInsertionController_shiftStrokesWithOffset___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "_temporarilyShiftStrokesWithOffset:spaceInsertionType:", 1, *(double *)(a1 + 56));
  v2 = *(double *)(a1 + 72) + *(double *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setFrame:", *(double *)(a1 + 64), v2, *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = *(double *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "_initalBufferBetweenLollipops");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setFrame:", v3, v2 + v4, *(double *)(a1 + 112), *(double *)(a1 + 120));
  return objc_msgSend(*(id *)(a1 + 40), "_transientlyUpdateHeightOfAttachment:delta:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __53__PKSpaceInsertionController_shiftStrokesWithOffset___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makeSpaceWithOffset:spaceInsertionType:", 1, *(double *)(a1 + 40));
}

- (void)initTopAndBottomSelectionIfNecessary
{
  id WeakRetained;
  PKStrokeSelection *v4;
  PKStrokeSelection *bottomStrokeSelection;
  PKStrokeSelection *v6;
  PKStrokeSelection *topStrokeSelection;
  PKImageView *v8;
  PKImageView *bottomImageView;
  PKImageView *v10;
  PKImageView *topImageView;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  memset(&v14, 0, sizeof(v14));
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _selectionDrawingTransformForDrawing:]((uint64_t)WeakRetained, self->_drawing, (uint64_t)&v14);

  if (!self->_bottomStrokeSelection)
  {
    v4 = -[PKStrokeSelection initWithStrokes:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:lassoStroke:drawing:", self->_strokesBelow, self->_lassoStroke, self->_drawing);
    bottomStrokeSelection = self->_bottomStrokeSelection;
    self->_bottomStrokeSelection = v4;

  }
  if (!self->_topStrokeSelection)
  {
    v6 = -[PKStrokeSelection initWithStrokes:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:lassoStroke:drawing:", self->_strokesAbove, self->_lassoStroke, self->_drawing);
    topStrokeSelection = self->_topStrokeSelection;
    self->_topStrokeSelection = v6;

  }
  if (!self->_bottomImageView)
  {
    -[PKStrokeSelection boundsWithoutLasso](self->_bottomStrokeSelection, "boundsWithoutLasso");
    v13 = v14;
    v16 = CGRectApplyAffineTransform(v15, &v13);
    v8 = -[PKImageView initWithFrame:]([PKImageView alloc], "initWithFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    bottomImageView = self->_bottomImageView;
    self->_bottomImageView = v8;

  }
  if (!self->_topImageView)
  {
    -[PKStrokeSelection boundsWithoutLasso](self->_topStrokeSelection, "boundsWithoutLasso");
    v12 = v14;
    v18 = CGRectApplyAffineTransform(v17, &v12);
    v10 = -[PKImageView initWithFrame:]([PKImageView alloc], "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    topImageView = self->_topImageView;
    self->_topImageView = v10;

  }
}

- (void)_blitStrokesToViewForSpaceInsertionType:(unint64_t)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  id WeakRetained;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  id *v41;
  void *v42;
  id v43;
  void *v44;
  PKStrokeSelection *v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGRect v48;
  CGRect v49;

  v6 = (void (**)(_QWORD))a4;
  -[PKSpaceInsertionController initTopAndBottomSelectionIfNecessary](self, "initTopAndBottomSelectionIfNecessary");
  if (a3 == 1)
  {
    v7 = 120;
    v8 = 96;
  }
  else
  {
    v8 = 96;
    if (self->_topHandleRemovesWhitespace)
    {
      v7 = 120;
    }
    else
    {
      v8 = 104;
      v7 = 112;
    }
  }
  v9 = *(id *)((char *)&self->super.isa + v8);
  v10 = *(id *)((char *)&self->super.isa + v7);
  objc_msgSend(v10, "setAlpha:", 1.0);
  objc_msgSend(v9, "strokes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    v16 = 1;
    if (!v6)
      goto LABEL_18;
    goto LABEL_16;
  }
  objc_msgSend(v9, "strokes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpaceInsertionController _visibleStrokesOnPage:](self, "_visibleStrokesOnPage:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = -[PKStrokeSelection initWithStrokes:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:lassoStroke:drawing:", v14, self->_lassoStroke, self->_drawing);
  v15 = objc_msgSend(v14, "count");
  v16 = v15 == 0;
  if (v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
    v18 = -[PKSelectionController _selectionOffsetForDrawing:]((uint64_t)WeakRetained, self->_drawing);
    v20 = v19;

    memset(&v47, 0, sizeof(v47));
    v21 = objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController _selectionDrawingTransformForDrawing:]((uint64_t)v21, self->_drawing, (uint64_t)&v47);

    -[PKStrokeSelection boundsWithoutLasso](v45, "boundsWithoutLasso");
    v46 = v47;
    v49 = CGRectApplyAffineTransform(v48, &v46);
    self->_initialViewLocation.x = v18 + v49.origin.x;
    self->_initialViewLocation.y = v20 + v49.origin.y;
    objc_msgSend(v10, "setFrame:");
    -[PKSpaceInsertionController drawing](self, "drawing");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(v14, "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpaceInsertionController drawing](self, "drawing");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v23, "initWithStrokes:fromDrawing:", v24, v25);

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "scale");
    v28 = v27;

    -[PKStrokeSelection boundsWithoutLasso](v45, "boundsWithoutLasso");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[PKSpaceInsertionController selectionController](self, "selectionController");
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v37;
    if (v37)
      v39 = objc_loadWeakRetained((id *)(v37 + 112));
    else
      v39 = 0;
    v40 = objc_msgSend(v39, "_sixChannelBlendingIsActive");

    objc_msgSend(v10, "setupWithDrawing:imageSize:scale:strokeSpaceClipRect:sixChannel:", v44, v40, v34, v36, v28, v30, v32, v34, v36);
    v41 = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController topView](v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addSubview:", v10);

    v43 = objc_loadWeakRetained((id *)&self->_selectionController);
    -[PKSelectionController hideStrokes:inDrawing:]((uint64_t)v43, v9, self->_drawing);

    if (v6)
      v6[2](v6);

    v16 = 0;
  }

  if (v6)
  {
LABEL_16:
    if (v16)
      v6[2](v6);
  }
LABEL_18:

}

- (id)_visibleStrokesOnPage:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _visibleStrokesWithinExtendedBounds:forDrawing:]((uint64_t)WeakRetained, v4, self->_drawing);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)offsetInStrokeSpaceFromViewOffset:(double)a3 inDrawing:(id)a4
{
  id v6;
  double x;
  double y;
  PKSelectionController **p_selectionController;
  id WeakRetained;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;

  v6 = a4;
  x = self->_beginDragLocation.x;
  y = self->_beginDragLocation.y;
  p_selectionController = &self->_selectionController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _pointInStrokeSpace:inDrawing:]((uint64_t)WeakRetained, v6, x, y);
  v12 = v11;

  v13 = objc_loadWeakRetained((id *)p_selectionController);
  -[PKSelectionController _pointInStrokeSpace:inDrawing:]((uint64_t)v13, v6, x + 0.0, y + a3);
  v15 = v14;

  return v15 - v12;
}

- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 inDrawing:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  -[PKSpaceInsertionController selectionController](self, "selectionController");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    WeakRetained = objc_loadWeakRetained((id *)(v10 + 112));
  else
    WeakRetained = 0;
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "attachmentForUUID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:completion:", v15, v9);

}

- (void)setIsCurrentlyAddingSpace:(BOOL)a3
{
  self->_isCurrentlyAddingSpace = a3;
}

- (PKStroke)lassoStroke
{
  return self->_lassoStroke;
}

- (void)setLassoStroke:(id)a3
{
  objc_storeStrong((id *)&self->_lassoStroke, a3);
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  objc_storeStrong((id *)&self->_drawing, a3);
}

- (PKSelectionController)selectionController
{
  return (PKSelectionController *)objc_loadWeakRetained((id *)&self->_selectionController);
}

- (BOOL)didMoveStrokes
{
  return self->_didMoveStrokes;
}

- (NSOrderedSet)externalElements
{
  return self->_externalElements;
}

- (void)setExternalElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalElements, 0);
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_lassoStroke, 0);
  objc_storeStrong((id *)&self->_cachedStrokesAbove, 0);
  objc_storeStrong((id *)&self->_cachedStrokesBelow, 0);
  objc_storeStrong((id *)&self->_cachedStrokeSelection, 0);
  objc_storeStrong((id *)&self->_strokeSelectionBeforeInsertingSpace, 0);
  objc_storeStrong((id *)&self->_bottomImageView, 0);
  objc_storeStrong((id *)&self->_topImageView, 0);
  objc_storeStrong((id *)&self->_topStrokeSelection, 0);
  objc_storeStrong((id *)&self->_bottomStrokeSelection, 0);
  objc_storeStrong((id *)&self->_dragBottomLollipopGR, 0);
  objc_storeStrong((id *)&self->_dragTopLollipopGR, 0);
  objc_storeStrong((id *)&self->_bottomInsertionView, 0);
  objc_storeStrong((id *)&self->_topInsertionView, 0);
  objc_storeStrong((id *)&self->_tapToDismissView, 0);
  objc_storeStrong((id *)&self->_strokesAbove, 0);
  objc_storeStrong((id *)&self->_strokesBelow, 0);
}

@end
