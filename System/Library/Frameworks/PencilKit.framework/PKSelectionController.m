@implementation PKSelectionController

- (_QWORD)setupSpaceInsertionControllerIfNecessary
{
  _QWORD *v1;
  void *v2;
  PKSpaceInsertionController *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[17];
    if (!v2)
    {
      v3 = -[PKSpaceInsertionController initWithSelectionController:]([PKSpaceInsertionController alloc], "initWithSelectionController:", a1);
      v4 = (void *)v1[17];
      v1[17] = v3;

      v2 = (void *)v1[17];
    }
    a1 = v2;
  }
  return a1;
}

- (void)setInsertSpaceEnabled:(uint64_t)a1
{
  id v4;
  id v5;

  if (a1)
  {
    if ((_DWORD)a2)
      v4 = -[PKSelectionController setupSpaceInsertionControllerIfNecessary]((_QWORD *)a1);
    *(_BYTE *)(a1 + 106) = a2;
    -[PKSelectionController selectionInteraction]((id *)a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInsertSpaceEnabled:", a2);

  }
}

- (id)selectionInteraction
{
  if (a1)
  {
    objc_msgSend(a1[19], "selectionInteraction");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (CGColor)selectionColor
{
  id WeakRetained;
  id v3;
  CGColor *v4;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "interactionTintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");

  return v4;
}

- (double)scaleForDrawing:(id)a3
{
  id v4;
  double v5;
  _OWORD v7[3];

  v4 = a3;
  -[PKSelectionController _selectionDrawingTransformForDrawing:]((uint64_t)self, v4, (uint64_t)v7);
  v5 = DKDScaleForTransform(v7);

  return v5;
}

- (BOOL)isRTL
{
  id WeakRetained;
  BOOL v3;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  else
    WeakRetained = 0;
  v3 = objc_msgSend(WeakRetained, "effectiveUserInterfaceLayoutDirection") == 1;

  return v3;
}

- (id)initWithTiledView:(id *)a1
{
  id v3;
  id *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  id v9;
  PKSelectionGestureView *v10;
  id WeakRetained;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  objc_super v23;

  v3 = a2;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)PKSelectionController;
    v4 = (id *)objc_msgSendSuper2(&v23, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 14, v3);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", a1, sel_didSelectStrokesNotification_, CFSTR("PKDidSelectStrokesNotification"), 0);

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = dispatch_queue_create("com.apple.pencilkit.selection-hull", v7);
      v9 = a1[8];
      a1[8] = v8;

      v10 = [PKSelectionGestureView alloc];
      WeakRetained = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(WeakRetained, "bounds");
      v12 = -[PKSelectionGestureView initWithFrame:selectionController:](v10, "initWithFrame:selectionController:", a1);
      v13 = a1[19];
      a1[19] = (id)v12;

      v14 = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(v14, "addSubview:", a1[19]);

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);
      v16 = objc_claimAutoreleasedReturnValue();

      v17 = dispatch_queue_create("com.apple.PencilKit.SelectionIntersection", v16);
      v18 = a1[7];
      a1[7] = v17;

      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", a1);
      v20 = a1[10];
      a1[10] = (id)v19;

      v21 = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(v21, "addInteraction:", a1[10]);

    }
  }

  return a1;
}

- (void)didScroll:(double)a3
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  id v23;
  void *v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;

  if (a1)
  {
    if (objc_msgSend(a1[17], "isCurrentlyAddingSpace"))
      objc_msgSend(a1[17], "didScroll:", a2, a3);
    if (a1[15])
    {
      v6 = a1[18];
      if (v6)
      {
        objc_msgSend(v6, "dragGR");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "state");

        if (v8 != 2)
        {
          v9 = a1[15];
          v10 = a1[15];
          objc_msgSend(v10, "drawing");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)a1, v9, v11);
          v14 = v13;
          v16 = v15;
          v18 = v17;

          objc_msgSend(a1[18], "setFrame:", v12, v14, v16, v18);
          memset(&v32, 0, sizeof(v32));
          objc_msgSend(a1[15], "drawing");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKSelectionController _selectionDrawingTransformForDrawing:]((uint64_t)a1, v19, (uint64_t)&v32);

          t1 = v32;
          v20 = a1[18];
          v21 = v20;
          if (v20)
            objc_msgSend(v20, "selectionDrawingTransform");
          else
            memset(&t2, 0, sizeof(t2));
          v22 = CGAffineTransformEqualToTransform(&t1, &t2);

          if (!v22)
          {
            v28 = v32;
            memset(&v29, 0, sizeof(v29));
            v23 = a1[18];
            v24 = v23;
            if (v23)
              objc_msgSend(v23, "selectionDrawingTransform");
            else
              memset(&v26, 0, sizeof(v26));
            CGAffineTransformInvert(&v27, &v26);
            CGAffineTransformConcat(&v29, &v28, &v27);

            v25 = v29;
            objc_msgSend(a1[18], "setTransform:", &v25);
            -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)a1, 0, 0);
          }
        }
      }
    }
  }
}

- (void)didEndScroll
{
  if (self && self->_currentStrokeSelection && !-[PKSelectionView isDragging](self->_selectionView, "isDragging"))
    -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:]((id *)&self->super.isa, self->_currentStrokeSelection, 0);
}

- (void)_selectionDrawingTransformForDrawing:(uint64_t)a3@<X8>
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  __int128 v10;
  id v11;
  double v12;
  CGFloat v13;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform v16;

  v5 = a2;
  if (a1)
  {
    v6 = (id *)(a1 + 112);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&v16, 0, sizeof(v16));
    if (v9)
    {
      objc_msgSend(v9, "drawingTransform");
    }
    else
    {
      v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v16.c = v10;
      *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    v11 = objc_loadWeakRetained(v6);
    objc_msgSend(v11, "canvasZoomScale");
    v13 = v12;

    CGAffineTransformMakeScale(&t1, v13, v13);
    v14 = v16;
    CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &v14);

  }
  else
  {
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
  }

}

- (void)_layoutViewsIfNecessary
{
  id WeakRetained;

  if (a1)
  {
    if (objc_msgSend(a1[17], "isCurrentlyAddingSpace"))
      objc_msgSend(a1[17], "_layoutViewsIfNecessary");
    WeakRetained = objc_loadWeakRetained(a1 + 14);
    objc_msgSend(WeakRetained, "bounds");
    objc_msgSend(a1[19], "setFrame:");

  }
}

- (id)topView
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 14);
  return WeakRetained;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEndSelectionSessionIfNecessary");

  -[PKSelectionController topView]((id *)&self->super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeInteraction:", self->_dropInteraction);

  v5.receiver = self;
  v5.super_class = (Class)PKSelectionController;
  -[PKSelectionController dealloc](&v5, sel_dealloc);
}

- (uint64_t)shouldClampInputPoints
{
  id WeakRetained;
  uint64_t v2;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  v2 = objc_msgSend(WeakRetained, "_shouldUpdateHeightOfAttachments");

  return v2;
}

- (uint64_t)hasStrokesOrElementsSelection
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  -[PKSelectionController selectionInteraction](a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasStrokesOrElementsSelection");

  return v2;
}

- (void)setCurrentStrokeSelection:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id WeakRetained;
  id v14;
  uint8_t v15[16];

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
    {
      objc_msgSend(v3, "strokes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (!v6)
      {
        v7 = os_log_create("com.apple.pencilkit", "Selection");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v15 = 0;
          _os_log_debug_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEBUG, "Selection set to an empty set of strokes. Setting to nil instead", v15, 2u);
        }

        v4 = 0;
      }
    }
    v8 = *(id *)(a1 + 120);
    objc_storeStrong((id *)(a1 + 120), v4);
    if (v8 != v4)
    {
      if (!v4
        || !v8
        || (objc_msgSend(v8, "strokeIdentifiers"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v4, "strokeIdentifiers"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqual:", v10),
            v10,
            v9,
            (v11 & 1) == 0))
      {
        v12 = (void *)MEMORY[0x1E0DE7910];
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
        objc_msgSend(v12, "cancelPreviousPerformRequestsWithTarget:selector:object:", WeakRetained, sel_selectionDidChange, 0);

        v14 = objc_loadWeakRetained((id *)(a1 + 112));
        objc_msgSend(v14, "performSelector:withObject:afterDelay:", sel_selectionDidChange, 0, 0.2);

      }
    }

  }
}

- (id)_visibleOnscreenStrokesForDrawing:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "strokeSpatialCache");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7 && *(_BYTE *)(v7 + 8))
    {
      objc_msgSend(v6, "strokeSpatialCache");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
        v11 = *(void **)(v9 + 24);
      else
        v11 = 0;
      v12 = v11;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)currentIntersectionAlgorithm
{
  return self->_currentIntersectionAlgorithm;
}

- (id)_visibleOnscreenStrokesIncludingCurrentSelection:(void *)a3 forDrawing:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _visibleOnscreenStrokesForDrawing:](a1, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(WeakRetained, "visibleOnscreenBoundsForDrawing:slack:", v6, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v22, "_bounds", (_QWORD)v34);
          v42.origin.x = v23;
          v42.origin.y = v24;
          v42.size.width = v25;
          v42.size.height = v26;
          v40.origin.x = v11;
          v40.origin.y = v13;
          v40.size.width = v15;
          v40.size.height = v17;
          if (!CGRectContainsRect(v40, v42))
          {
            objc_msgSend(v22, "_bounds");
            v43.origin.x = v11;
            v43.origin.y = v13;
            v43.size.width = v15;
            v43.size.height = v17;
            if (!CGRectIntersectsRect(v41, v43))
              continue;
            objc_msgSend(v22, "_bounds");
            DKDPercentRectInsideRect(v27, v28, v29, v30, v11, v13, v15, v17);
            if (v31 <= 0.5)
              continue;
          }
          objc_msgSend(v7, "addObject:", v22);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v19);
    }

    if (v5)
      objc_msgSend(v7, "addObjectsFromArray:", v5);
    objc_msgSend(v7, "array", (_QWORD)v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)fetchStrokesToSelectAtPoint:(uint64_t)a3 inDrawing:(uint64_t)a4 withSelectionType:(void *)a5 inputType:(void *)a6 existingSelection:(double)a7 completion:(double)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;

  v15 = a2;
  v16 = a5;
  v17 = a6;
  if (a1)
  {
    -[PKSelectionController _visibleOnscreenStrokesIncludingCurrentSelection:forDrawing:](a1, v16, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v15, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __120__PKSelectionController_fetchStrokesToSelectAtPoint_inDrawing_withSelectionType_inputType_existingSelection_completion___block_invoke;
    v22[3] = &unk_1E777A1F0;
    v22[4] = a1;
    v25 = a3;
    v23 = v15;
    v24 = v17;
    objc_msgSend(v21, "fetchIntersectedStrokesAtPoint:selectionType:inputType:visibleOnscreenStrokes:completion:", a3, a4, v18, v22, a7, a8);

  }
}

void __120__PKSelectionController_fetchStrokesToSelectAtPoint_inDrawing_withSelectionType_inputType_existingSelection_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PKIntersectionResult *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "intersectedStrokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(v9, "intersectionAlgorithmType");
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 > 6 || ((1 << v4) & 0x43) == 0)
    {
      -[PKSelectionController _visibleOnscreenStrokesForDrawing:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKSelectionController _selectStrandedBitmapStrokesForIntersectedStrokesIfNecessary:visibleOnscreenStrokes:]((uint64_t)PKSelectionController, v3, v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
    +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, v3, *(void **)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  v8 = objc_alloc_init(PKIntersectionResult);
  -[PKIntersectionResult setIntersectedStrokes:](v8, "setIntersectedStrokes:", v3);
  -[PKIntersectionResult setIntersectionAlgorithmType:](v8, "setIntersectionAlgorithmType:", objc_msgSend(v9, "intersectionAlgorithmType"));
  -[PKIntersectionResult setContentType:](v8, "setContentType:", objc_msgSend(v9, "contentType"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (id)_selectStrandedBitmapStrokesForIntersectedStrokesIfNecessary:(void *)a3 visibleOnscreenStrokes:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  _QWORD *v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  v32 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = v32;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v8, "_strokeMask");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 == 0;

        if (!v10)
        {
          objc_msgSend(v8, "_strokeMask");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (_QWORD *)objc_msgSend(v11, "centerlineSlices");
          v13 = v12[1] == *v12;

          if (v13)
          {
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v14 = v34;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v15)
            {
              v16 = *(_QWORD *)v36;
              while (2)
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v36 != v16)
                    objc_enumerationMutation(v14);
                  v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                  objc_msgSend(v8, "_bounds");
                  v20 = v19;
                  v22 = v21;
                  v24 = v23;
                  v26 = v25;
                  objc_msgSend(v18, "_bounds");
                  if (DKDDistanceToRectFromRect(v20, v22, v24, v26, v27, v28, v29, v30) < 20.0)
                  {
                    objc_msgSend(v33, "addObject:", v8);
                    goto LABEL_18;
                  }
                }
                v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                if (v15)
                  continue;
                break;
              }
            }
LABEL_18:

          }
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v5);
  }

  objc_msgSend(v33, "unionOrderedSet:", v34);
  return v33;
}

+ (id)_orderedStrokes:(void *)a3 relativeToStrokeOrderInDrawing:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v5, "strokes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v11))
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v6;
}

- (void)fetchStrokesToSelectBetweenTopPoint:(void *)a3 bottomPoint:(void *)a4 inDrawing:(double)a5 liveScrollOffset:(double)a6 existingSelection:(double)a7 completion:(double)a8
{
  id v19;
  id v20;
  id v21;
  id WeakRetained;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v19 = a2;
  v20 = a3;
  v21 = a4;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v19, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __129__PKSelectionController_fetchStrokesToSelectBetweenTopPoint_bottomPoint_inDrawing_liveScrollOffset_existingSelection_completion___block_invoke;
    v25[3] = &unk_1E777A240;
    v25[4] = a1;
    v26 = v20;
    v27 = v19;
    v29 = a9;
    v30 = a10;
    v31 = a5;
    v32 = a6;
    v33 = a7;
    v34 = a8;
    v28 = v21;
    objc_msgSend(v24, "fetchIntersectedStrokesBetweenTopPoint:bottomPoint:liveScrollOffset:completion:", v25, a5, a6, a7, a8, a9, a10);

  }
}

void __129__PKSelectionController_fetchStrokesToSelectBetweenTopPoint_bottomPoint_inDrawing_liveScrollOffset_existingSelection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PKIntersectionResult *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD *v19;
  void *v20;
  dispatch_block_t v21;
  void *v22;
  dispatch_time_t v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[8];
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  _QWORD *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  id location;

  v3 = a2;
  objc_msgSend(v3, "intersectedStrokes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(v3, "intersectionAlgorithmType");
  if (v3 && v4)
  {
    -[PKSelectionController _visibleOnscreenStrokesForDrawing:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKSelectionController _selectStrandedBitmapStrokesForIntersectedStrokesIfNecessary:visibleOnscreenStrokes:]((uint64_t)PKSelectionController, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, v6, *(void **)(a1 + 48));
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(PKIntersectionResult);
    -[PKIntersectionResult setIntersectedStrokes:](v8, "setIntersectedStrokes:", v7);
    -[PKIntersectionResult setIntersectionAlgorithmType:](v8, "setIntersectionAlgorithmType:", objc_msgSend(v3, "intersectionAlgorithmType"));
    -[PKIntersectionResult setContentType:](v8, "setContentType:", objc_msgSend(v3, "contentType"));
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, PKIntersectionResult *))(v9 + 16))(v9, v8);

    v4 = (void *)v7;
  }
  else
  {
    v10 = os_log_create("com.apple.pencilkit", "Recognition");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Had to fall back to a naive geometry method", buf, 2u);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    -[PKSelectionController _visibleOnscreenStrokesIncludingCurrentSelection:forDrawing:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (*(double *)(a1 + 64) == 0.0 && *(double *)(a1 + 72) == 0.0)
      v13 = (void *)v11;
    else
      v13 = 0;
    v14 = *(_QWORD *)(a1 + 32);
    v24 = *(_OWORD *)(a1 + 96);
    v25 = *(_OWORD *)(a1 + 80);
    v15 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __129__PKSelectionController_fetchStrokesToSelectBetweenTopPoint_bottomPoint_inDrawing_liveScrollOffset_existingSelection_completion___block_invoke_19;
    v26[3] = &unk_1E777A218;
    v16 = *(void **)(a1 + 48);
    v27 = *(id *)(a1 + 56);
    v17 = v16;
    v18 = v13;
    v19 = v26;
    if (v14)
    {
      v20 = *(void **)(v14 + 72);
      if (v20)
        dispatch_block_cancel(v20);
      objc_initWeak(&location, (id)v14);
      *(_QWORD *)buf = v15;
      v29 = 3221225472;
      v30 = __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke;
      v31 = &unk_1E777A2B8;
      v32 = v17;
      v36 = v25;
      v37 = v24;
      v33 = v18;
      v34 = v19;
      objc_copyWeak(&v35, &location);
      v21 = dispatch_block_create((dispatch_block_flags_t)0, buf);
      v22 = *(void **)(v14 + 72);
      *(_QWORD *)(v14 + 72) = v21;

      v23 = dispatch_time(0, 0);
      dispatch_after(v23, *(dispatch_queue_t *)(v14 + 56), *(dispatch_block_t *)(v14 + 72));
      objc_destroyWeak(&v35);

      objc_destroyWeak(&location);
    }

  }
}

void __129__PKSelectionController_fetchStrokesToSelectBetweenTopPoint_bottomPoint_inDrawing_liveScrollOffset_existingSelection_completion___block_invoke_19(uint64_t a1, void *a2)
{
  PKIntersectionResult *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_alloc_init(PKIntersectionResult);
  -[PKIntersectionResult setIntersectedStrokes:](v3, "setIntersectedStrokes:", v5);
  -[PKIntersectionResult setIntersectionAlgorithmType:](v3, "setIntersectionAlgorithmType:", 0);
  -[PKIntersectionResult setContentType:](v3, "setContentType:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, PKIntersectionResult *))(v4 + 16))(v4, v3);

}

void __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v2 = *(double *)(a1 + 64);
  v3 = *(double *)(a1 + 72);
  v4 = *(double *)(a1 + 80);
  v5 = *(double *)(a1 + 88);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke_2;
  v8[3] = &unk_1E777A290;
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  objc_copyWeak(&v11, (id *)(a1 + 56));
  objc_msgSend(v9, "fetchIntersectedStrokesBetweenPoint:otherPoint:visibleOnscreenStrokes:completion:", v7, v8, v2, v3, v4, v5);
  objc_destroyWeak(&v11);

}

void __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, a2, *(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke_3;
    block[3] = &unk_1E777A268;
    v7 = v4;
    v6 = v3;
    objc_copyWeak(&v8, (id *)(a1 + 48));
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v8);

  }
}

void __146__PKSelectionController__findIntersectedStrokesWithoutRecognitionToSelectBetweenTopPoint_bottomPoint_inDrawing_visibleOnscreenStrokes_completion___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[9];
    WeakRetained[9] = 0;
    v4 = WeakRetained;

    WeakRetained = v4;
  }

}

- (uint64_t)contentTypeForIntersectedStrokes:(void *)a3 inDrawing:
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = objc_msgSend(v9, "contentTypeForIntersectedStrokes:", v5);
  }

  return a1;
}

- (void)selectStrokes:(uint64_t)a3 forSelectionType:(void *)a4 inDrawing:
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a4;
  if (a1)
    -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](a1, v8, 0, a3, v7, 0);

}

- (void)selectStrokes:(void *)a3 externalElements:(uint64_t)a4 forSelectionType:(void *)a5 inDrawing:(void *)a6 completion:
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id *v33;
  void (**v34)(_QWORD);
  uint64_t v35;

  v11 = a2;
  v28 = a3;
  v12 = a5;
  v13 = a6;
  if (a1)
  {
    +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordDidMakeSelectionWithType:", a4);

    if (!objc_msgSend(v11, "count") && !objc_msgSend(v28, "count"))
      goto LABEL_5;
    v15 = a1[15];
    objc_msgSend(v15, "strokes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToSet:", v18);

    if ((v19 & 1) == 0)
    {
      if (a4 && a4 != 6)
      {
        +[PKCanvasSessionStatisticsManager sharedStatisticsManager]();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        if (v25)
          -[PKCanvasSessionStatisticsManager logFeatureUsed:](v25, (void *)*MEMORY[0x1E0D167B0]);

      }
      +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, v11, v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __94__PKSelectionController_selectStrokes_externalElements_forSelectionType_inDrawing_completion___block_invoke;
      v29[3] = &unk_1E777A2E0;
      v11 = v27;
      v30 = v11;
      v23 = v28;
      v31 = v28;
      v32 = v12;
      v33 = a1;
      v35 = a4;
      v34 = v13;
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)a1, 0, v29);

    }
    else
    {
LABEL_5:
      WeakRetained = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(v12, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_attachmentForUUID:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v28;
      if (objc_msgSend(v22, "isExternalAttachment")
        && objc_msgSend(v11, "count")
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v11, "array");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "didSelectPreviouslySelectedStrokes:", v24);

      }
      objc_msgSend(a1[18], "setSelectionType:", a4);
      if (v13)
        v13[2](v13);

    }
  }
  else
  {
    v23 = v28;
  }

}

- (void)selectStrokes:(void *)a3 externalElements:(uint64_t)a4 forSelectionType:(void *)a5 inDrawing:
{
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v9 = a3;
  v10 = a5;
  if (a1)
    -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:completion:](a1, v11, v9, a4, v10, 0);

}

void __94__PKSelectionController_selectStrokes_externalElements_forSelectionType_inDrawing_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  PKStrokeSelection *v3;
  __int128 v4;
  uint64_t v5;
  _OWORD v6[3];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.pencilkit", "Selection");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v8 = v5;
    _os_log_debug_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEBUG, "Selected %lu strokes", buf, 0xCu);
  }

  v3 = -[PKStrokeSelection initWithStrokes:externalElements:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:externalElements:lassoStroke:drawing:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v6[0] = *MEMORY[0x1E0C9BAA8];
  v6[1] = v4;
  v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(*(id *)(a1 + 56), "didSelect:lassoStroke:transform:drawing:selectionType:completion:", v3, 0, v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

- (void)clearSelectionIfNecessaryAnimated:(void *)a3 withCompletion:
{
  void (**v5)(_QWORD);
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  int v20;
  id v21;
  void *v22;
  void (**v23)(_QWORD);
  void *v24;
  id v25;
  uint8_t buf[16];
  _QWORD aBlock[5];
  void (**v28)(_QWORD);

  v5 = a3;
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 144), "isDragging"))
    {
      if (v5)
        v5[2](v5);
    }
    else
    {
      *(_BYTE *)(a1 + 104) = 1;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__PKSelectionController_clearSelectionIfNecessaryAnimated_withCompletion___block_invoke;
      aBlock[3] = &unk_1E7776F88;
      aBlock[4] = a1;
      v28 = v5;
      v23 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (objc_msgSend(*(id *)(a1 + 136), "isCurrentlyAddingSpace"))
        objc_msgSend(*(id *)(a1 + 136), "commitSpacingResize");
      v25 = *(id *)(a1 + 120);
      -[PKSelectionController _currentAttachment]((id *)a1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _selectedExternalElementsInAttachment:](a1, v24);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v24;
      -[PKSelectionController selectionInteraction]((id *)a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        -[PKSelectionController _IDsFromExternalElements:]((void *)a1, v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController selectionInteraction]((id *)a1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController selectionInteraction]((id *)a1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "attachmentView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "selectionInteraction:didClearSelectionForElements:inAttachment:", v14, v11, v15);

      }
      if (*(_QWORD *)(a1 + 120))
      {
        v16 = os_log_create("com.apple.pencilkit", "Selection");
        v17 = v23;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEBUG, "Clearing the selection", buf, 2u);
        }

        +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logSelectionAction:", 0);

        WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
        v20 = objc_msgSend(WeakRetained, "editMenuVisible");

        if (v20)
        {
          v21 = objc_loadWeakRetained((id *)(a1 + 112));
          objc_msgSend(v21, "editMenuInteraction");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dismissMenu");

        }
        -[PKSelectionController _removeSelectionViewAnimated:withCompletion:](a1, a2, v23);
        -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
      }
      else
      {
        v17 = v23;
        if (v23)
          v23[2](v23);
      }
      if (v25 == *(id *)(a1 + 120))
        -[PKSelectionController setCurrentStrokeSelection:](a1, 0);

    }
  }

}

- (void)_selectStrokesWithoutDidSelectStrokesUpdate:(void *)a3 inDrawing:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[PKSelectionController _orderedStrokes:relativeToStrokeOrderInDrawing:]((uint64_t)PKSelectionController, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__PKSelectionController__selectStrokesWithoutDidSelectStrokesUpdate_inDrawing___block_invoke;
    v8[3] = &unk_1E7776FB0;
    v8[4] = a1;
    v5 = v7;
    v9 = v5;
    v10 = v6;
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](a1, 0, v8);

  }
}

void __79__PKSelectionController__selectStrokesWithoutDidSelectStrokesUpdate_inDrawing___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  PKStrokeSelection *v5;

  -[PKSelectionController _resetSelectedStrokeStateForRenderer](*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v2 + 168) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v2 + 184) = v4;
    *(_OWORD *)(v2 + 200) = *(_OWORD *)(v3 + 32);
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = -[PKStrokeSelection initWithStrokes:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:lassoStroke:drawing:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
    -[PKSelectionController setCurrentStrokeSelection:](*(_QWORD *)(a1 + 32), v5);

  }
}

- (void)_resetSelectedStrokeStateForRenderer
{
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(WeakRetained, "_resetSelectedStrokeStateForRenderer");

  }
}

- (void)lassoSelectStrokesInDrawing:(void *)a3 withPath:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordDidMakeSelectionWithType:", 0);

    if (*(_QWORD *)(a1 + 120))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __62__PKSelectionController_lassoSelectStrokesInDrawing_withPath___block_invoke;
      v8[3] = &unk_1E7776FB0;
      v8[4] = a1;
      v9 = v5;
      v10 = v6;
      -[PKSelectionController clearSelectionIfNecessaryWithCompletion:](a1, v8);

    }
    else
    {
      -[PKSelectionController _selectionBeganInDrawing:withPath:]((id *)a1, v5, v6);
    }
  }

}

void __62__PKSelectionController_lassoSelectStrokesInDrawing_withPath___block_invoke(uint64_t a1)
{
  -[PKSelectionController _selectionBeganInDrawing:withPath:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_selectionBeganInDrawing:(void *)a3 withPath:
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  PKStrokeSelection *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  PKStrokeSelection *v30;
  void *v31;
  PKStrokeSelection *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _BOOL4 v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  _OWORD v55[3];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v53 = a3;
  if (a1)
  {
    kdebug_trace();
    -[PKSelectionController _strokeForLassoPath:inDrawing:]((uint64_t)a1, v53, v5);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(a1 + 14);
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    -[PKSelectionController _visibleOnscreenStrokesForDrawing:]((uint64_t)a1, v5);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intersectedStrokesFromStroke:visibleOnscreenStrokes:", v54, v8);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v53;
    v10 = (id)v8;
    -[PKSelectionController selectionInteraction](a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attachmentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "selectionInteraction:requestElementsInPath:inAttachment:", v15, v9, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v17, v10);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v51 = 0;
    }

    kdebug_trace();
    v18 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v42 = objc_msgSend(v52, "count");
      objc_msgSend(v10, "strokeSpatialCache");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v43;
      if (v43)
        v45 = *(_BYTE *)(v43 + 8) != 0;
      else
        v45 = 0;
      v46 = objc_msgSend(v50, "count");
      v47 = CFSTR("NO");
      *(_DWORD *)buf = 134218498;
      v57 = v42;
      if (v45)
        v47 = CFSTR("YES");
      v58 = 2112;
      v59 = (uint64_t)v47;
      v60 = 2048;
      v61 = v46;
      _os_log_debug_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEBUG, "Found selected %lu strokes; used cached strokes: %@  visibleOnscreenStrokes:%lu",
        buf,
        0x20u);

    }
    -[PKSelectionController selectionInteraction](a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) == 0)
      goto LABEL_32;
    v22 = -[PKStrokeSelection initWithStrokes:externalElements:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:externalElements:lassoStroke:drawing:", v52, v51, v54, v5);
    -[PKSelectionController selectionInteraction](a1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](a1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStrokeSelection strokeIdentifiers](v22, "strokeIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attachmentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v24, "selectionInteraction:handleLassoSelection:strokes:inAttachment:", v25, v9, v26, v27);

    if ((v28 & 1) == 0)
    {
LABEL_32:
      if (objc_msgSend(v52, "count") || objc_msgSend(v51, "count"))
      {
        v29 = os_log_create("com.apple.pencilkit", "Selection");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v48 = objc_msgSend(v52, "count");
          v49 = objc_msgSend(v51, "count");
          *(_DWORD *)buf = 134218240;
          v57 = v48;
          v58 = 2048;
          v59 = v49;
          _os_log_debug_impl(&dword_1BE213000, v29, OS_LOG_TYPE_DEBUG, "Selected %lu strokes, %lu external elements", buf, 0x16u);
        }

        v30 = -[PKStrokeSelection initWithStrokes:externalElements:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:externalElements:lassoStroke:drawing:", v52, v51, v54, v5);
        +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v30;
        -[PKStrokeSelection strokes](v32, "strokes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        -[PKStrokeSelection externalElements](v32, "externalElements");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        v37 = 5;
        if (v36)
        {
          v38 = v34 == 0;
        }
        else
        {
          v37 = 0;
          v38 = 1;
        }
        v39 = 4;
        if (!v38)
          v39 = 6;
        if (v34)
          v40 = v39;
        else
          v40 = v37;

        objc_msgSend(v31, "recordLassoSelectionEventWithContentType:", v40);
        v41 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v55[0] = *MEMORY[0x1E0C9BAA8];
        v55[1] = v41;
        v55[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        objc_msgSend(a1, "didSelect:lassoStroke:transform:drawing:", v32, v54, v55, v5);

      }
      else
      {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)a1, 1, 0);
      }
    }

  }
}

- (void)clearSelectionIfNecessaryWithCompletion:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](a1, 1, v3);

}

- (id)_strokeForLassoPath:(void *)a3 inDrawing:
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v5 = a2;
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "transformFromViewToStrokeSpaceInDrawing:", v6);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }

  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  objc_msgSend(v5, "applyTransform:", v15);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithIdentifier:color:weight:](PKInk, "inkWithIdentifier:color:weight:", CFSTR("com.apple.ink.lasso"), v9, -1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc((Class)objc_msgSend(v6, "strokeClass"));
  v12 = objc_retainAutorelease(v5);
  v13 = (void *)objc_msgSend(v11, "_initWithPath:ink:inputScale:", objc_msgSend(v12, "CGPath"), v10, 2.0);

  return v13;
}

- (void)didSelectStrokesNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  PKSelectionController *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = objc_opt_class();
  objc_msgSend(v13, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKCheckedDynamicCast(v4, v5);
  v6 = (PKSelectionController *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    if (v6)
      WeakRetained = objc_loadWeakRetained((id *)&v6->_tiledView);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v10 = objc_loadWeakRetained((id *)&self->_tiledView);
    else
      v10 = 0;
    objc_msgSend(v10, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (self && v9 == v12)
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)self, 1, 0);
  }

}

- (void)didSelect:(id)a3 lassoStroke:(id)a4 transform:(CGAffineTransform *)a5 drawing:(id)a6
{
  __int128 v6;
  _OWORD v7[3];

  v6 = *(_OWORD *)&a5->c;
  v7[0] = *(_OWORD *)&a5->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a5->tx;
  -[PKSelectionController didSelect:lassoStroke:transform:drawing:selectionType:completion:](self, "didSelect:lassoStroke:transform:drawing:selectionType:completion:", a3, a4, v7, a6, 0, 0);
}

- (OS_dispatch_queue)selectionHullQueue
{
  return self->_selectionHullQueue;
}

- (void)didSelect:(id)a3 lassoStroke:(id)a4 transform:(CGAffineTransform *)a5 drawing:(id)a6 selectionType:(int64_t)a7 completion:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  id v20;
  _QWORD *v21;
  NSObject *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  PKSelectionView *selectionView;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  PKSelectionView *v44;
  PKSelectionView *v45;
  void *v46;
  int selectionViewCount;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  PKSelectionView *v52;
  void *v53;
  void *v54;
  char v55;
  id WeakRetained;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD *v66;
  id v68;
  _QWORD v69[2];
  uint64_t (*v70)(uint64_t);
  void *v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id location;
  uint8_t buf[8];
  uint64_t v80;
  uint64_t (*v81)(uint64_t);
  void *v82;
  PKSelectionController *v83;
  uint64_t v84;
  uint64_t v85;

  v12 = a3;
  v13 = a6;
  v14 = a8;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("PKDidSelectStrokesNotification"), self);

  -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)self);
  if (self)
  {
    v16 = *(_OWORD *)&a5->a;
    v17 = *(_OWORD *)&a5->c;
    *(_OWORD *)&self->_selectionTransform.tx = *(_OWORD *)&a5->tx;
    *(_OWORD *)&self->_selectionTransform.c = v17;
    *(_OWORD *)&self->_selectionTransform.a = v16;
  }
  objc_initWeak(&location, self);
  v69[1] = 3221225472;
  v70 = __90__PKSelectionController_didSelect_lassoStroke_transform_drawing_selectionType_completion___block_invoke;
  v71 = &unk_1E777A308;
  v69[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v74, &location);
  v18 = *(_OWORD *)&a5->c;
  v75 = *(_OWORD *)&a5->a;
  v76 = v18;
  v77 = *(_OWORD *)&a5->tx;
  v72 = v13;
  v68 = v14;
  v73 = v68;
  v19 = v12;
  v20 = v72;
  v21 = v69;
  if (self && v19)
  {
    v66 = v21;
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)self, 1, 0);
    if (self->_selectionView)
    {
      v22 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE213000, v22, OS_LOG_TYPE_DEBUG, "Tried to add a selection view while another one was up", buf, 2u);
      }

    }
    -[PKSelectionController setCurrentStrokeSelection:]((uint64_t)self, v19);
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    v23 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)self, v19, v20);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    selectionView = self->_selectionView;
    if (selectionView)
    {
      -[PKSelectionView layer](selectionView, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "removeAllAnimations");

      -[PKSelectionController _removeSelectionViewAnimated:withCompletion:]((uint64_t)self, 0, 0);
    }
    -[PKSelectionController _attachmentForStrokeSelection:]((id *)&self->super.isa, v19);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "externalElements");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v65;
    -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_opt_respondsToSelector();

    if ((v36 & 1) != 0)
    {
      -[PKSelectionController _IDsFromExternalElements:](self, v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "attachmentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "selectionInteraction:didSelectElements:inAttachment:", v40, v37, v41);

    }
    objc_msgSend(v19, "strokes");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "count");

    if (v43)
    {
      v44 = -[PKSelectionView initWithFrame:strokeSelection:selectionController:selectionType:]([PKSelectionView alloc], "initWithFrame:strokeSelection:selectionController:selectionType:", v19, self, a7, v23, v25, v27, v29);
      v45 = self->_selectionView;
      self->_selectionView = v44;

      if (objc_msgSend(v33, "isExternalAttachment"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v33, "installSelectionView:", self->_selectionView);
      }
      else
      {
        -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "_didAddSelectionView:", self->_selectionView);

      }
      selectionViewCount = self->_selectionViewCount;
      self->_selectionViewCount = selectionViewCount + 1;
      if (selectionViewCount < 0)
        -[PKSelectionController _removeSelectionViewAnimated:withCompletion:]((uint64_t)self, 0, 0);
      else
        -[PKSelectionController setCurrentStrokeSelection:]((uint64_t)self, v19);
      -[PKSelectionView center](self->_selectionView, "center");
      v49 = v48;
      v51 = v50;
      -[PKSelectionView setCenter:](self->_selectionView, "setCenter:");
      -[PKSelectionView setAlpha:](self->_selectionView, "setAlpha:", 0.5);
      v52 = self->_selectionView;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v80 = 3221225472;
      v81 = __102__PKSelectionController__addViewForStrokeSelection_isDragSource_drawing_selectionType_withCompletion___block_invoke;
      v82 = &unk_1E77771C0;
      v83 = self;
      v84 = v49;
      v85 = v51;
      objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", v52, 5242880, buf, 0, 0.1);
    }
    else
    {
      -[PKSelectionController setCurrentStrokeSelection:]((uint64_t)self, 0);
    }
    ((void (*)(_QWORD *, PKSelectionView *))v70)(v66, self->_selectionView);

    v21 = v66;
  }

  -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "delegate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_opt_respondsToSelector();

  if ((v55 & 1) != 0)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
    else
      WeakRetained = 0;
    objc_msgSend(v20, "uuid");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "delegate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "strokes");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "attachmentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "selectionInteraction:didSelectStrokes:selectionType:inAttachment:", v61, v63, a7, v64);

  }
  objc_destroyWeak(&v74);
  objc_destroyWeak(&location);

}

uint64_t __90__PKSelectionController_didSelect_lassoStroke_transform_drawing_selectionType_completion___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  uint64_t v4;
  id *v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[3];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained[18];

    if (!v4)
      goto LABEL_5;
    v5 = (id *)objc_loadWeakRetained(v2);
    v6 = *(_OWORD *)(a1 + 72);
    v8[0] = *(_OWORD *)(a1 + 56);
    v8[1] = v6;
    v8[2] = *(_OWORD *)(a1 + 88);
    -[PKSelectionController moveSelectionViewBasedOnStrokeTransform:drawing:](v5, (double *)v8, *(void **)(a1 + 32));
  }
  else
  {
    v5 = 0;
  }

LABEL_5:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)moveSelectionViewBasedOnStrokeTransform:(void *)a3 drawing:
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGAffineTransform v48;
  _OWORD v49[3];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGRect v53;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1[15], "bounds");
    v7 = v6;
    v9 = v8;
    v11 = *a2;
    v10 = a2[1];
    v13 = a2[2];
    v12 = a2[3];
    v15 = a2[4];
    v14 = a2[5];
    WeakRetained = objc_loadWeakRetained(a1 + 14);
    v17 = WeakRetained;
    v46 = v11;
    v47 = v10;
    v44 = v14;
    v45 = v12;
    v42 = v15;
    v43 = v13;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v5);
      v18 = *((double *)&v50 + 1);
      v20 = *((double *)&v51 + 1);
      v19 = *(double *)&v51;
      v40 = *((double *)&v52 + 1);
      v21 = *(double *)&v52;
      v41 = *(double *)&v50;
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      v40 = 0.0;
      v41 = 0.0;
      v20 = 0.0;
      v18 = 0.0;
      v21 = 0.0;
      v19 = 0.0;
    }

    objc_msgSend(a1[18], "frame");
    v38 = v23;
    v39 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(a1[18], "setFrame:", v21 + (v44 + v9 * v45 + v47 * v7) * v19 + v41 * (v42 + v9 * v43 + v46 * v7), v40 + (v44 + v9 * v45 + v47 * v7) * v20 + v18 * (v42 + v9 * v43 + v46 * v7), v24, v26);
    v28 = objc_loadWeakRetained(a1 + 14);
    objc_msgSend(v5, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_attachmentForUUID:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30
      && objc_msgSend(v30, "isExternalAttachment")
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v30, "contentWindowCoordinateSpace");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "contentScaledCoordinateSpace");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v31, v32, v49);
      v33 = v49[1];
      *(_OWORD *)a2 = v49[0];
      *((_OWORD *)a2 + 1) = v33;
      *((_OWORD *)a2 + 2) = v49[2];

      v34 = *((_OWORD *)a2 + 1);
      *(_OWORD *)&v48.a = *(_OWORD *)a2;
      *(_OWORD *)&v48.c = v34;
      *(_OWORD *)&v48.tx = *((_OWORD *)a2 + 2);
      *(_QWORD *)&v34 = v38;
      v35 = v39;
      v36 = v25;
      v37 = v27;
      v53 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v34 - 8), &v48);
      objc_msgSend(a1[18], "setFrame:", v53.origin.x, v53.origin.y, v53.size.width, v53.size.height);
    }

  }
}

- (double)calculateFrameForSelectionView:(void *)a3 inDrawing:
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  id WeakRetained;
  void *v16;
  double v17;
  CGAffineTransform v19;
  CGRect v20;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    v16 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v6);
    else
      memset(&v19, 0, sizeof(v19));
    v20.origin.x = v8;
    v20.origin.y = v10;
    v20.size.width = v12;
    v20.size.height = v14;
    *(_QWORD *)&v17 = (unint64_t)CGRectApplyAffineTransform(v20, &v19);

  }
  else
  {
    v17 = 0.0;
  }

  return v17;
}

- (void)_installSelectionViewForCurrentSelectionFromExternalAttachments
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  PKSelectionView *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  _QWORD v23[7];

  if (a1)
  {
    v2 = a1[15];
    if (v2)
    {
      dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
      -[PKSelectionController _attachmentForStrokeSelection:](a1, v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "isExternalAttachment") & 1) != 0)
      {
        objc_msgSend(v3, "drawing");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)a1, v2, v4);
        v7 = v6;
        v9 = v8;
        v11 = v10;

        objc_msgSend(v2, "strokes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          v14 = -[PKSelectionView initWithFrame:strokeSelection:selectionController:selectionType:]([PKSelectionView alloc], "initWithFrame:strokeSelection:selectionController:selectionType:", v2, a1, 2, v5, v7, v9, v11);
          v15 = a1[18];
          a1[18] = v14;

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v3, "installSelectionView:", a1[18]);
          objc_msgSend(a1[18], "center");
          v17 = v16;
          v19 = v18;
          objc_msgSend(a1[18], "setCenter:");
          objc_msgSend(a1[18], "setAlpha:", 0.5);
          v20 = a1[18];
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __88__PKSelectionController__installSelectionViewForCurrentSelectionFromExternalAttachments__block_invoke;
          v23[3] = &unk_1E77771C0;
          v23[4] = a1;
          v23[5] = v17;
          v23[6] = v19;
          objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", v20, 5242880, v23, 0, 0.1);
          if (a1[18])
          {
            objc_msgSend(v3, "drawing", *MEMORY[0x1E0C9BAA8], *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 8), *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 16), *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 24), *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 32), *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 40));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKSelectionController moveSelectionViewBasedOnStrokeTransform:drawing:](a1, (double *)&v22, v21);

          }
        }
      }

    }
  }
}

- (id)_attachmentForStrokeSelection:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "drawing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      WeakRetained = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(WeakRetained, "_attachmentForUUID:", v6);
      a1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }

  }
  return a1;
}

uint64_t __88__PKSelectionController__installSelectionViewForCurrentSelectionFromExternalAttachments__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setAlpha:", 1.0);
}

- (void)_removeSelectionViewAnimated:(void *)a3 withCompletion:
{
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  _QWORD v9[4];
  void (**v10)(_QWORD);
  _QWORD aBlock[5];
  id v12;
  char v13;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke;
  aBlock[3] = &unk_1E777A470;
  aBlock[4] = a1;
  v13 = a2;
  v7 = v5;
  v12 = v7;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v8[2](v8);
  }
  else
  {
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_4;
    v9[3] = &unk_1E7776F60;
    v10 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

uint64_t __102__PKSelectionController__addViewForStrokeSelection_isDragSource_drawing_selectionType_withCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setAlpha:", 1.0);
}

- (void)_imageViewForStrokes:(void *)a3 drawing:(__int128 *)a4 drawingTransform:(void *)a5 coordinateSpace:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PKStrokeSelection *v16;
  __int128 v17;
  PKStrokeSelection *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  PKStrokeSelection *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PKStrokeSelection initWithStrokes:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:lassoStroke:drawing:", v15, 0, v12);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __98__PKSelectionController__imageViewForStrokes_drawing_drawingTransform_coordinateSpace_completion___block_invoke;
    v19[3] = &unk_1E777A358;
    v20 = v13;
    v21 = a1;
    v17 = a4[1];
    v24 = *a4;
    v25 = v17;
    v26 = a4[2];
    v22 = v16;
    v23 = v14;
    v18 = v16;
    -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:](a1, v18, 1, 0, v19);

  }
}

void __98__PKSelectionController__imageViewForStrokes_drawing_drawingTransform_coordinateSpace_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__PKSelectionController__imageViewForStrokes_drawing_drawingTransform_coordinateSpace_completion___block_invoke_2;
  block[3] = &unk_1E777A330;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v7 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 64);
  v16 = v7;
  v17 = *(_OWORD *)(a1 + 96);
  v12 = v6;
  v13 = v3;
  v14 = *(id *)(a1 + 56);
  v8 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __98__PKSelectionController__imageViewForStrokes_drawing_drawingTransform_coordinateSpace_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  __int128 v6;
  PKImageView *v7;
  void *v8;
  void *v9;
  void *v10;
  CGAffineTransform v11;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 112));
  else
    WeakRetained = 0;
  memset(&v15, 0, sizeof(v15));
  objc_msgSend(WeakRetained, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v3, v5, &v15);

  v6 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 104);
  t2 = v15;
  CGAffineTransformConcat(&v14, &t1, &t2);
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 48), "bounds");
  v11 = v15;
  v17 = CGRectApplyAffineTransform(v16, &v11);
  v7 = -[PKImageView initWithFrame:]([PKImageView alloc], "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  objc_msgSend(*(id *)(a1 + 56), "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView setImage:](v7, "setImage:", v8);

  objc_msgSend(*(id *)(a1 + 56), "addImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView setAddImage:](v7, "setAddImage:", v9);

  objc_msgSend(*(id *)(a1 + 56), "mulImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView setMulImage:](v7, "setMulImage:", v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)generateImageForStrokeSelection:(uint64_t)a3 scaleStrategy:(char)a4 highlighted:(void *)a5 withCompletion:
{
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint64_t v14;
  char v15;

  v9 = a2;
  v10 = a5;
  if (a1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__PKSelectionController_generateImageForStrokeSelection_scaleStrategy_highlighted_withCompletion___block_invoke;
    block[3] = &unk_1E777A3F8;
    block[4] = a1;
    v12 = v9;
    v14 = a3;
    v15 = a4;
    v13 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (void)_imageViewForStrokes:(void *)a3 drawing:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  PKStrokeSelection *v11;
  PKStrokeSelection *v12;
  _QWORD v13[5];
  PKStrokeSelection *v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKStrokeSelection initWithStrokes:lassoStroke:drawing:]([PKStrokeSelection alloc], "initWithStrokes:lassoStroke:drawing:", v10, 0, v8);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__PKSelectionController__imageViewForStrokes_drawing_completion___block_invoke;
    v13[3] = &unk_1E777A3A8;
    v13[4] = a1;
    v14 = v11;
    v15 = v8;
    v16 = v9;
    v12 = v11;
    -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:](a1, v12, 1, 0, v13);

  }
}

void __65__PKSelectionController__imageViewForStrokes_drawing_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PKSelectionController__imageViewForStrokes_drawing_completion___block_invoke_2;
  block[3] = &unk_1E777A380;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = *(id *)(a1 + 56);
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __65__PKSelectionController__imageViewForStrokes_drawing_completion___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  PKImageView *v9;

  v2 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  v9 = -[PKImageView initWithFrame:]([PKImageView alloc], "initWithFrame:", v2, v3, v4, v5);
  objc_msgSend(*(id *)(a1 + 56), "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView setImage:](v9, "setImage:", v6);

  objc_msgSend(*(id *)(a1 + 56), "addImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView setAddImage:](v9, "setAddImage:", v7);

  objc_msgSend(*(id *)(a1 + 56), "mulImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKImageView setMulImage:](v9, "setMulImage:", v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)_maskImageForStrokes:(uint64_t)a3 drawing:(void *)a4 imageView:(void *)a5 completion:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  CGImage *v35;
  void *v36;
  id v37;
  CGFloat x;
  _QWORD block[4];
  id v40;
  id v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v7 = a4;
  v8 = a5;
  if (a1)
  {
    objc_msgSend(v7, "addImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v7, "image");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0C9DDB8], "colorMatrixFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRVector:", v14);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGVector:", v15);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBVector:", v16);

    objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAVector:", v17);

    v18 = (void *)MEMORY[0x1E0C9DDC8];
    v19 = objc_retainAutorelease(v12);
    objc_msgSend(v18, "imageWithCGImage:", objc_msgSend(v19, "CGImage"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInputImage:", v20);

    objc_msgSend(v13, "outputImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DDB8], "morphologyMaximumFilter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 2.0;
    objc_msgSend(v22, "setRadius:", v23);
    objc_msgSend(v22, "setInputImage:", v21);
    objc_msgSend(v22, "outputImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "scale");
    v26 = v25;
    objc_msgSend(v7, "frame");
    v47 = CGRectInset(v46, -1.0, -1.0);
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    objc_msgSend(v7, "bounds");
    v49 = CGRectInset(v48, -1.0, -1.0);
    v30 = v49.origin.x;
    v31 = v49.origin.y;
    v32 = v49.size.width;
    v33 = v49.size.height;
    v34 = objc_alloc_init(MEMORY[0x1E0C9DD90]);
    v35 = (CGImage *)objc_msgSend(v34, "createCGImage:fromRect:", v24, v26 * v30, v26 * v31, v26 * v32, v26 * v33);
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", v35, 0, v26);
    CGImageRelease(v35);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__PKSelectionController__maskImageForStrokes_drawing_imageView_completion___block_invoke;
    block[3] = &unk_1E777A3D0;
    v40 = v36;
    v41 = v8;
    v42 = x;
    v43 = y;
    v44 = width;
    v45 = height;
    v37 = v36;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __75__PKSelectionController__maskImageForStrokes_drawing_imageView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (PKStrokeSelectionImageConfig)cachedImageConfigForSelection:(uint64_t)a3 scaleStrategy:(uint64_t)a4 highlighted:
{
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double width;
  double height;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  _BOOL4 v27;
  BOOL v28;
  uint64_t v29;
  double MaxY;
  double v31;
  double v32;
  NSObject *v33;
  id WeakRetained;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double MidX;
  double v46;
  double MaxX;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  BOOL v57;
  id v58;
  id *v59;
  id v60;
  void *v61;
  double x;
  double y;
  double v64;
  double v65;
  PKStrokeSelectionImageConfig *v66;
  id v67;
  PKStrokeSelectionImageConfig *v68;
  double MidY;
  CGFloat v71;
  double v72;
  double v73;
  double rect;
  double v75;
  _BYTE v76[56];
  double v77[6];
  CGAffineTransform v78;
  double v79;
  double v80;
  uint8_t buf[4];
  double v82;
  __int16 v83;
  double v84;
  uint64_t v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;

  v85 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a1)
  {
    objc_msgSend(v7, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v8, "drawing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _selectionDrawingTransformForDrawing:](a1, v17, (uint64_t)&v79);
    v18 = sqrt(v80 * v80 + v79 * v79);
    CGAffineTransformMakeScale(&v78, v18, v18);
    *(CGFloat *)v76 = v10;
    v86.origin.x = v10;
    v86.origin.y = v12;
    v86.size.width = v14;
    v86.size.height = v16;
    v87 = CGRectApplyAffineTransform(v86, &v78);
    width = v87.size.width;
    height = v87.size.height;
    objc_msgSend(v8, "boundsWithoutLasso", v87.origin.x, v87.origin.y);
    v23 = fmax(v18 * v21, width);
    rect = v12;
    v75 = fmax(v18 * v22, height);
    if (a3)
    {
      if (a3 == 1)
      {
        +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", v23, v75);
        v26 = 0;
        v27 = v24 != v23;
        if (v25 != v75)
          v27 = 1;
        v28 = v23 <= 0.0 || !v27;
        if (v28 || v75 <= 0.0)
        {
          v29 = 0;
        }
        else
        {
          v26 = 0;
          v29 = 0;
          v18 = v18 * (v24 / v23);
          v75 = v25;
          v23 = v24;
        }
      }
      else
      {
        v26 = 0;
        v29 = 0;
      }
    }
    else
    {
      if (v23 > 4000.0 || (MaxY = v75, v75 > 4000.0))
      {
        v71 = v16;
        v33 = os_log_create("com.apple.pencilkit", ");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v82 = v23;
          v83 = 2048;
          v84 = v75;
          _os_log_error_impl(&dword_1BE213000, v33, OS_LOG_TYPE_ERROR, "SELECTION: image renderer bounds are too big %f %f, sizing it down", buf, 0x16u);
        }

        WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
        objc_msgSend(v8, "drawing");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "visibleOnscreenBoundsForDrawing:slack:", v35, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        v37 = v36;
        v39 = v38;
        v41 = v40;
        v43 = v42;

        v72 = fmin(v23, 4000.0);
        v44 = v14 * (v72 / v23);
        v88.origin.x = v37;
        v88.origin.y = v39;
        v88.size.width = v41;
        v88.size.height = v43;
        MidX = CGRectGetMidX(v88);
        v89.origin.x = v37;
        v89.origin.y = v39;
        v89.size.width = v41;
        v89.size.height = v43;
        MidY = CGRectGetMidY(v89);
        v73 = v44;
        if (v14 <= v44)
        {
          v49 = *(_QWORD *)v76;
          v31 = *(double *)v76;
          v46 = v71;
        }
        else
        {
          v90.origin.x = *(CGFloat *)v76;
          v90.origin.y = rect;
          v90.size.width = v14;
          v46 = v71;
          v90.size.height = v71;
          MaxX = CGRectGetMaxX(v90);
          v48 = MidX + v44 * -0.5;
          v31 = *(double *)v76;
          v49 = *(_QWORD *)v76;
          if (v48 >= *(double *)v76)
          {
            v50 = MaxX - v44;
            v31 = MidX + v44 * -0.5;
            if (v48 > v50)
              v31 = v50;
          }
        }
        v32 = fmin(v75, 4000.0);
        MaxY = v32 / v75;
        v51 = v46;
        v16 = v46 * (v32 / v75);
        if (v51 > v16)
        {
          v52 = v49;
          v53 = rect;
          v54 = v14;
          MaxY = CGRectGetMaxY(*(CGRect *)(&v51 - 3));
          v55 = MidY + v16 * -0.5;
          if (v55 >= rect)
          {
            MaxY = MaxY - v16;
            rect = MaxY;
            if (v55 <= MaxY)
              rect = MidY + v16 * -0.5;
          }
        }
      }
      else
      {
        v32 = v75;
        v31 = *(double *)v76;
        v72 = v23;
        v73 = v14;
      }
      objc_msgSend(v8, "drawing", MaxY);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _selectionDrawingTransformForDrawing:](a1, v56, (uint64_t)v77);
      v57 = v77[2] * v77[1] - v77[0] * v77[3] > 0.0;

      if (v57)
      {
        v26 = 0;
        v29 = 1;
      }
      else
      {
        v58 = objc_loadWeakRetained((id *)(a1 + 112));
        v26 = objc_msgSend(v58, "_sixChannelBlendingIsActive");

        v29 = 0;
      }
      v75 = v32;
      *(double *)v76 = v31;
      v23 = v72;
      v14 = v73;
    }
    v59 = (id *)(a1 + 112);
    v60 = objc_loadWeakRetained(v59);
    v61 = v60;
    if (v60)
      objc_msgSend(v60, "transformFromStrokeSpaceToViewInDrawing:", v17);
    else
      memset(&v76[8], 0, 48);
    v91.origin.y = rect;
    v91.size.height = v16;
    v91.size.width = v14;
    v91.origin.x = *(CGFloat *)v76;
    v92 = CGRectApplyAffineTransform(v91, (CGAffineTransform *)&v76[8]);
    x = v92.origin.x;
    y = v92.origin.y;
    v64 = v92.size.width;
    v65 = v92.size.height;

    v66 = [PKStrokeSelectionImageConfig alloc];
    v67 = objc_loadWeakRetained(v59);
    v68 = -[PKStrokeSelectionImageConfig initWithStrokeBounds:imageViewBounds:scale:imageSize:invertedColors:rotated:sixChannel:highlighted:](v66, "initWithStrokeBounds:imageViewBounds:scale:imageSize:invertedColors:rotated:sixChannel:highlighted:", objc_msgSend(v67, "invertColors"), v29, v26, a4, *(double *)v76, rect, v14, v16, x, y, v64, v65, *(_QWORD *)&v18, *(_QWORD *)&v23, *(_QWORD *)&v75);

  }
  else
  {
    v68 = 0;
  }

  return v68;
}

void __98__PKSelectionController_generateImageForStrokeSelection_scaleStrategy_highlighted_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  -[PKSelectionController selectionInteraction](*(id **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateImageWithConfig:fullSizeConfig:selectionInteraction:withCompletion:", v5, v2, v4, *(_QWORD *)(a1 + 48));

}

- (void)setImageOnSelectionViewForStrokeSelection:(void *)a3 withCompletion:
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  void (**v21)(_QWORD);

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:]((uint64_t)a1, v5, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[18], "strokeSelectionImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_7;
    objc_msgSend(a1[18], "strokeSelectionImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v7);

    if ((v11 & 1) != 0)
    {
      if (v6)
        v6[2](v6);
      v12 = v7;
    }
    else
    {
LABEL_7:
      -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:]((uint64_t)a1, v5, 1, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke;
      v20[3] = &unk_1E777A420;
      v20[4] = a1;
      v21 = v6;
      objc_msgSend(v5, "generateImageWithConfig:fullSizeConfig:selectionInteraction:withCompletion:", v7, v13, v14, v20);

      -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:]((uint64_t)a1, v5, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSelectionController cachedImageConfigForSelection:scaleStrategy:highlighted:]((uint64_t)a1, v5, 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSelectionController selectionInteraction](a1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v15;
      v18[1] = 3221225472;
      v18[2] = __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke_3;
      v18[3] = &unk_1E77771E8;
      v19 = v5;
      objc_msgSend(v19, "generateImageWithConfig:fullSizeConfig:selectionInteraction:withCompletion:", v12, v16, v17, v18);

    }
  }

}

void __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke_2;
  block[3] = &unk_1E77773F0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 144), "setStrokeSelectionImage:", a1[5]);
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __82__PKSelectionController_setImageOnSelectionViewForStrokeSelection_withCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStrokeImage:", a2);
}

void __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = (int)fmax((double)(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) - 1), 0.0);
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2
    && *(_QWORD *)(v3 + 144)
    && (v4 = objc_msgSend(*(id *)(v3 + 144), "selectionType"), v3 = *(_QWORD *)(a1 + 32), v4 != 6))
  {
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7 = *(_QWORD *)(v3 + 144);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_2;
    v10[3] = &unk_1E7776F38;
    v10[4] = v3;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_3;
    v8[3] = &unk_1E777A448;
    v8[4] = v3;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "transitionWithView:duration:options:animations:completion:", v7, 5242880, v10, v8, 0.2);

  }
  else
  {
    -[PKSelectionController _tearDownSelectionView](v3);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

uint64_t __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setAlpha:", 0.0);
}

uint64_t __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  -[PKSelectionController _tearDownSelectionView](*(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_tearDownSelectionView
{
  void *v2;
  _QWORD v3[5];

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 144), "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __47__PKSelectionController__tearDownSelectionView__block_invoke;
    v3[3] = &unk_1E7776F38;
    v3[4] = a1;
    +[PKToolPicker _performWithVisibilityUpdatesEnabled:window:block:](PKToolPicker, "_performWithVisibilityUpdatesEnabled:window:block:", 0, v2, v3);

  }
}

uint64_t __69__PKSelectionController__removeSelectionViewAnimated_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__PKSelectionController__tearDownSelectionView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;

}

- (id)_commitStrokeSelection:(void *)a3 toDrawing:(uint64_t)a4 selectionAction:(uint64_t)a5 selectionType:
{
  id v9;
  id v10;
  void *v11;

  v9 = a2;
  v10 = a3;
  if (a1)
  {
    -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:inkChanges:selectionType:withCompletion:](a1, v9, v10, a4, 0, a5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_commitStrokeSelection:(void *)a3 toDrawing:(uint64_t)a4 selectionAction:(void *)a5 inkChanges:(uint64_t)a6 selectionType:(void *)a7 withCompletion:
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t i;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  PKInk *v33;
  uint64_t v34;
  void *v35;
  PKInk *v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  id v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  __int128 v74;
  PKStrokeSelection *v75;
  void *v76;
  PKStrokeSelection *v77;
  void **v78;
  void *v79;
  void *v80;
  __int128 v81;
  void *v82;
  void *v83;
  void *v84;
  PKStrokeSelection *v85;
  void *v86;
  void *v87;
  PKStrokeSelection *v88;
  uint64_t v89;
  __int128 v90;
  void *v92;
  void *v93;
  __int128 v94;
  PKStrokeSelection *v95;
  void *v96;
  PKStrokeSelection *v97;
  __int128 v98;
  NSObject *v99;
  uint64_t v101;
  void *v102;
  void *v103;
  dispatch_block_t block;
  void *v105;
  void *v106;
  id v108;
  id v109;
  uint64_t v110;
  void *v111;
  id v112;
  id *location;
  id v114;
  _OWORD v115[3];
  _OWORD v116[3];
  _QWORD v117[4];
  NSObject *v118;
  _QWORD v119[4];
  NSObject *v120;
  _OWORD v121[3];
  _OWORD v122[3];
  _OWORD v123[3];
  CGAffineTransform v124;
  _OWORD v125[3];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v108 = a2;
  v109 = a3;
  v112 = a5;
  block = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = a1;
  v11 = *(id *)(a1 + 120);
  if (!v11)
    v11 = v108;
  v12 = (void *)MEMORY[0x1E0C99D20];
  v105 = v11;
  objc_msgSend(v11, "strokes", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithArray:", v14);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v105, "drawing");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  location = (id *)(a1 + 112);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "undoManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "beginUndoGrouping");

  switch(a4)
  {
    case 3:
      objc_msgSend(v108, "strokes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; objc_msgSend(v24, "count") > i; ++i)
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", i);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "ink");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v28 = v112;
        objc_msgSend(v27, "color");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("PKInkColorProperty"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v28, "objectForKey:", CFSTR("PKInkColorProperty"));
          v32 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v32;
        }
        v33 = [PKInk alloc];
        v34 = objc_msgSend(v27, "version");
        objc_msgSend(v27, "variant");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "weight");
        v36 = -[PKInk initWithIdentifier:color:version:variant:weight:](v33, "initWithIdentifier:color:version:variant:weight:", v30, v29, v34, v35);

        v37 = objc_loadWeakRetained(location);
        LODWORD(v35) = objc_msgSend(v37, "sixChannelBlending");

        if ((_DWORD)v35)
        {
          -[PKInk _sixChannelVersion](v36, "_sixChannelVersion");
          v38 = objc_claimAutoreleasedReturnValue();

          v36 = (PKInk *)v38;
        }

        objc_msgSend(v111, "addObject:", v36);
      }
      objc_msgSend(v109, "undoableSetStrokes:inks:", v24, v111);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
        -[PKSelectionController registerCommandWithUndoManager:](v110, v63);

      v22 = 0;
      break;
    case 0:
      objc_msgSend(v108, "strokes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_OWORD *)(a1 + 184);
      v125[0] = *(_OWORD *)(a1 + 168);
      v125[1] = v19;
      v125[2] = *(_OWORD *)(a1 + 200);
      objc_msgSend(v109, "undoableTransformStrokes:withTransform:concat:", v18, v125, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        -[PKSelectionController registerCommandWithUndoManager:](a1, v20);
      v21 = 0;
      v22 = 0;
LABEL_45:

      v67 = dispatch_group_create();
      goto LABEL_46;
    case 1:
      objc_msgSend(v103, "uuid");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController drawingForUUID:](v110, v64);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v106, "addObject:", v20);
      objc_msgSend(v20, "undoableDeleteStrokes:", v102);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
        -[PKSelectionController registerCommandWithUndoManager:](v110, v65);
      v66 = objc_loadWeakRetained(location);
      objc_msgSend(v66, "didChangeDrawing:", v20);

      v21 = 1;
      goto LABEL_45;
    default:
      v39 = v108;
      v40 = (void *)MEMORY[0x1E0C99DE8];
      v114 = v39;
      objc_msgSend(v39, "strokes");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "arrayWithCapacity:", objc_msgSend(v41, "count"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v132 = 0u;
      v133 = 0u;
      v130 = 0u;
      v131 = 0u;
      objc_msgSend(v114, "strokes");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "array");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v130, v135, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v131;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v131 != v46)
              objc_enumerationMutation(v44);
            v48 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * j), "copyForMutation");
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "_setStrokeUUID:", v49);

            objc_msgSend(v42, "addObject:", v48);
          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v130, v135, 16);
        }
        while (v45);
      }

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      v51 = v42;
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v126, v134, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v127;
        do
        {
          for (k = 0; k != v52; ++k)
          {
            if (*(_QWORD *)v127 != v53)
              objc_enumerationMutation(v51);
            v55 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * k);
            objc_msgSend(v55, "_groupID");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            if (v56)
            {
              objc_msgSend(v50, "objectForKeyedSubscript:", v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v57)
              {
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "setObject:forKeyedSubscript:", v57, v56);
              }
              objc_msgSend(v55, "_setGroupID:", v57);

            }
          }
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v126, v134, 16);
        }
        while (v52);
      }

      objc_msgSend(v109, "undoableAddNewStrokes:", v51);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = *(_OWORD *)(v110 + 184);
      *(_OWORD *)&v124.a = *(_OWORD *)(v110 + 168);
      *(_OWORD *)&v124.c = v59;
      *(_OWORD *)&v124.tx = *(_OWORD *)(v110 + 200);
      if (!CGAffineTransformIsIdentity(&v124))
      {
        v60 = *(_OWORD *)(v110 + 184);
        v123[0] = *(_OWORD *)(v110 + 168);
        v123[1] = v60;
        v123[2] = *(_OWORD *)(v110 + 200);
        objc_msgSend(v109, "transformStrokes:withTransform:concat:", v51, v123, 1);
      }
      v61 = (void *)MEMORY[0x1E0C99E40];
      +[PKDrawing visibleStrokesFromStrokes:inDrawing:](PKDrawing, "visibleStrokesFromStrokes:inDrawing:", v51, v109);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "orderedSetWithArray:", v62);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
        -[PKSelectionController registerCommandWithUndoManager:](v110, v58);

      break;
  }
  v67 = dispatch_group_create();
  if (a4 == 2)
  {
    objc_msgSend(v108, "lassoStroke");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend(v92, "mutableCopy");

    v94 = *(_OWORD *)(v110 + 184);
    v122[0] = *(_OWORD *)(v110 + 168);
    v122[1] = v94;
    v122[2] = *(_OWORD *)(v110 + 200);
    objc_msgSend(v93, "_applyTransform:", v122);
    v95 = [PKStrokeSelection alloc];
    objc_msgSend(v108, "externalElements");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = -[PKStrokeSelection initWithStrokes:externalElements:lassoStroke:drawing:](v95, "initWithStrokes:externalElements:lassoStroke:drawing:", v22, v96, v93, v109);

    dispatch_group_enter(v67);
    v98 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v121[0] = *MEMORY[0x1E0C9BAA8];
    v121[1] = v98;
    v121[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __114__PKSelectionController__commitStrokeSelection_toDrawing_selectionAction_inkChanges_selectionType_withCompletion___block_invoke;
    v119[3] = &unk_1E7776F38;
    v99 = v67;
    v120 = v99;
    objc_msgSend((id)v110, "didSelect:lassoStroke:transform:drawing:selectionType:completion:", v97, v93, v121, v109, v101, v119);

    v21 = 0;
    v67 = v99;
  }
  else
  {
    v21 = 0;
  }
LABEL_46:
  v68 = objc_loadWeakRetained(location);
  objc_msgSend(v68, "undoManager");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "endUndoGrouping");

  v70 = objc_loadWeakRetained(location);
  objc_msgSend(v70, "didChangeDrawing:", v109);

  objc_msgSend(v106, "addObject:", v109);
  dispatch_group_enter(v67);
  v117[0] = MEMORY[0x1E0C809B0];
  v117[1] = 3221225472;
  v117[2] = __114__PKSelectionController__commitStrokeSelection_toDrawing_selectionAction_inkChanges_selectionType_withCompletion___block_invoke_2;
  v117[3] = &unk_1E7776F38;
  v71 = v67;
  v118 = v71;
  -[PKSelectionController _selectionRefreshWithChangeToDrawings:completion:](v110, v106, v117);
  if (v21)
  {
    objc_msgSend(v108, "lassoStroke");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (void *)objc_msgSend(v72, "mutableCopy");

    v74 = *(_OWORD *)(v110 + 184);
    v116[0] = *(_OWORD *)(v110 + 168);
    v116[1] = v74;
    v116[2] = *(_OWORD *)(v110 + 200);
    objc_msgSend(v73, "_applyTransform:", v116);
    v75 = [PKStrokeSelection alloc];
    objc_msgSend(v108, "externalElements");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = -[PKStrokeSelection initWithStrokes:externalElements:lassoStroke:drawing:](v75, "initWithStrokes:externalElements:lassoStroke:drawing:", v22, v76, v73, v109);

    v78 = (void **)v110;
    -[PKSelectionController setCurrentStrokeSelection:](v110, v77);
    objc_msgSend(v78[18], "setStrokeSelection:", v78[15]);
    -[PKSelectionController _refreshExternalElementsInStrokeSelection:](v78, v78[15]);

  }
  if (a4 == 3 || !a4)
  {
    objc_msgSend(v108, "lassoStroke");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v79, "mutableCopy");

    v81 = *(_OWORD *)(v110 + 184);
    v115[0] = *(_OWORD *)(v110 + 168);
    v115[1] = v81;
    v115[2] = *(_OWORD *)(v110 + 200);
    objc_msgSend(v80, "_applyTransform:", v115);
    objc_msgSend(v108, "strokes");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "array");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKDrawing visibleStrokesFromStrokes:inDrawing:](PKDrawing, "visibleStrokesFromStrokes:inDrawing:", v83, v109);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = [PKStrokeSelection alloc];
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v84);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "externalElements");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = -[PKStrokeSelection initWithStrokes:externalElements:lassoStroke:drawing:](v85, "initWithStrokes:externalElements:lassoStroke:drawing:", v86, v87, v80, v109);

    -[PKSelectionController setCurrentStrokeSelection:](v110, v88);
    objc_msgSend(*(id *)(v110 + 144), "setStrokeSelection:", *(_QWORD *)(v110 + 120));
    -[PKSelectionController _refreshExternalElementsInStrokeSelection:]((void *)v110, *(void **)(v110 + 120));
    if (a4 == 3)
      objc_msgSend(*(id *)(v110 + 144), "setStrokeSelectionImage:", 0);

  }
  v89 = MEMORY[0x1E0C9BAA8];
  v90 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)(v110 + 168) = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(v110 + 184) = v90;
  *(_OWORD *)(v110 + 200) = *(_OWORD *)(v89 + 32);
  if (block)
    dispatch_group_notify(v71, MEMORY[0x1E0C80D38], block);

  return v22;
}

- (void)registerCommandWithUndoManager:(uint64_t)a1
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "registerUndoCommand:", v4);

}

- (id)drawingForUUID:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(WeakRetained, "attachmentForUUID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "drawing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __114__PKSelectionController__commitStrokeSelection_toDrawing_selectionAction_inkChanges_selectionType_withCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __114__PKSelectionController__commitStrokeSelection_toDrawing_selectionAction_inkChanges_selectionType_withCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_selectionRefreshWithChangeToDrawings:(void *)a3 completion:
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "_selectionRefreshWithChangeToDrawings:completion:", v7, v5);

}

- (void)_refreshExternalElementsInStrokeSelection:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = v3;
    objc_msgSend(v3, "externalElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _IDsFromExternalElements:](a1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKSelectionController _attachmentForStrokeSelection:]((id *)a1, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _externalElementsForIDs:inAttachment:]((id *)a1, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExternalElements:", v7);

    v3 = v8;
  }

}

- (void)eraseSelection
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
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
  id WeakRetained;
  id v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[PKSelectionController _currentAttachment](a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[18];
  if (objc_msgSend(v3, "selectionType"))
  {
    v4 = objc_msgSend(a1[18], "selectionType");

    if (v4 != 6)
    {
      -[PKSelectionController selectionInteraction](a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        -[PKSelectionController selectionInteraction](a1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController selectionInteraction](a1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[15], "strokes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectionInteraction:handleDeleteForTextStrokes:inAttachment:", v10, v12, v2);

        goto LABEL_11;
      }
    }
  }
  else
  {

  }
  objc_msgSend(a1[15], "drawing");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)a1);
    objc_msgSend(a1[15], "drawing");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(a1[15], "strokes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "undoableDeleteStrokes:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      -[PKSelectionController registerCommandWithUndoManager:]((uint64_t)a1, v19);
    -[PKSelectionController setCurrentStrokeSelection:]((uint64_t)a1, 0);
    WeakRetained = objc_loadWeakRetained(a1 + 14);
    objc_msgSend(WeakRetained, "didChangeDrawing:", v14);

    v23[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _selectionRefreshWithChangeToDrawings:completion:]((uint64_t)a1, v21, 0);

  }
  -[PKSelectionController _selectedExternalElementsInAttachment:]((uint64_t)a1, v2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _didDeleteExternalElements:inAttachment:](a1, v22, v2);

  -[PKSelectionController _removeSelectionViewAnimated:withCompletion:]((uint64_t)a1, 1, 0);
LABEL_11:

}

- (id)_currentAttachment
{
  if (a1)
  {
    -[PKSelectionController _attachmentForStrokeSelection:](a1, a1[15]);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_selectedExternalElementsInAttachment:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    if (v4)
    {
      objc_msgSend(v4, "externalElements");
      a1 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PKSelectionController selectionInteraction]((id *)a1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        -[PKSelectionController selectionInteraction]((id *)a1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController selectionInteraction]((id *)a1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "attachmentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectionInteraction:selectedElementsInAttachment:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[PKSelectionController _externalElementsForIDs:inAttachment:]((id *)a1, v12, v3);
        a1 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        a1 = 0;
      }
    }
  }

  return (id)a1;
}

- (void)_didDeleteExternalElements:(void *)a3 inAttachment:
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[PKSelectionController _IDsFromExternalElements:](a1, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachmentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectionInteraction:didDeleteElements:inAttachment:", v12, v9, v13);

    }
  }

}

- (_QWORD)currentPasteboard
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[16];
    if (v1)
      return v1;
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_addItemsToPasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v4 = a3;
  -[PKSelectionController currentPasteboard](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _currentAttachment]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _selectedExternalElementsInAttachment:]((uint64_t)self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _pasteboardRepresentationsForExternalElements:inAttachment:]((id *)&self->super.isa, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "strokes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v4, "legacyStrokeDataForSelection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "strokeDataForSelection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "containsBitmapData");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v11)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("com.apple.drawing"));
      if (!v13)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("com.apple.pencilkit.strokes"));
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__PKSelectionController__addItemsToPasteboard___block_invoke;
    v17[3] = &unk_1E777A498;
    v18 = v8;
    v19 = v15;
    v20 = v5;
    v16 = v15;
    -[PKSelectionController generateImageForStrokeSelection:scaleStrategy:highlighted:withCompletion:]((uint64_t)self, v4, 1, 0, v17);

  }
  else
  {
    objc_msgSend(v5, "setItems:", v8);
  }

}

- (id)_pasteboardRepresentationsForExternalElements:(void *)a3 inAttachment:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[PKSelectionController _IDsFromExternalElements:](a1, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[15], "strokeIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attachmentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "selectionInteraction:pasteboardRepresentationsForElements:strokes:inAttachment:", v13, v10, v14, v15);
      a1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __47__PKSelectionController__addItemsToPasteboard___block_invoke(uint64_t a1, void *a2)
{
  UIImage *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "combinedImage");
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(*(id *)(a1 + 32), "count");
  v6 = *(void **)(a1 + 40);
  if (v5 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);

    v8 = *(void **)(a1 + 40);
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v9);

    v14[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setItems:", v10);
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v11);

    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setItems:", v12);

  }
}

uint64_t __74__PKSelectionController_clearSelectionIfNecessaryAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  return result;
}

- (void)commitStrokesWithCompletion:(uint64_t)a1
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  _OWORD *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  CGAffineTransform v37;
  CGAffineTransform t1;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;
  CGRect v42;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
    objc_msgSend(*(id *)(a1 + 144), "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PKSelectionController _drawingForSelectionRect:](a1, v4, v6, v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_QWORD *)(a1 + 120))
    {
      -[PKSelectionController _refreshTiledViewWithSelectionForDrawing:completion:](a1, v12, v3);
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(*(id *)(a1 + 144), "strokeSelection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    if (!v12)
    {
      v15 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v42.origin.x = v5;
        v42.origin.y = v7;
        v42.size.width = v9;
        v42.size.height = v11;
        NSStringFromCGRect(v42);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = (uint64_t)v32;
        _os_log_debug_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEBUG, "Current stroke selection doesn't have a drawing for rect %@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 144), "animateViewToOriginalPosition");
      objc_msgSend(*(id *)(a1 + 120), "drawing");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v14[1];
      *(_OWORD *)(a1 + 168) = *v14;
      *(_OWORD *)(a1 + 184) = v17;
      *(_OWORD *)(a1 + 200) = v14[2];
      v12 = (void *)v16;
    }
    v18 = *(_OWORD *)(a1 + 184);
    *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 168);
    *(_OWORD *)&t1.c = v18;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 200);
    v19 = v14[1];
    *(_OWORD *)&v37.a = *v14;
    *(_OWORD *)&v37.c = v19;
    *(_OWORD *)&v37.tx = v14[2];
    if (CGAffineTransformEqualToTransform(&t1, &v37))
    {
      v20 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1BE213000, v20, OS_LOG_TYPE_DEBUG, "Stroke selection was not moved, cancelled drag, or dragged out of the app.  Returning selection back to its original spot", buf, 2u);
      }

      -[PKSelectionController _refreshTiledViewWithSelectionForDrawing:completion:](a1, v12, v3);
      goto LABEL_22;
    }
    objc_msgSend(*(id *)(a1 + 120), "drawing");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uuid");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController drawingForUUID:](a1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (v26)
    {
      v27 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 120), "strokes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");
        *(_DWORD *)buf = 134217984;
        v40 = v34;
        _os_log_debug_impl(&dword_1BE213000, v27, OS_LOG_TYPE_DEBUG, "Moving stroke selection of %lu strokes inside same drawing", buf, 0xCu);

      }
      v28 = objc_msgSend(*(id *)(a1 + 144), "selectionType");
      v29 = 0;
    }
    else
    {
      if (!v23)
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      v30 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 120), "strokes");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");
        *(_DWORD *)buf = 134217984;
        v40 = v36;
        _os_log_debug_impl(&dword_1BE213000, v30, OS_LOG_TYPE_DEBUG, "Committing stroke selection of %lu strokes from one drawing to another", buf, 0xCu);

      }
      v28 = objc_msgSend(*(id *)(a1 + 144), "selectionType");
      v29 = 1;
    }
    v31 = -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:inkChanges:selectionType:withCompletion:](a1, v13, v12, v29, 0, v28, v3);
    goto LABEL_21;
  }
LABEL_24:

}

- (id)_drawingForSelectionRect:(double)a3
{
  void *v5;
  void *v6;

  if (a1)
  {
    -[PKSelectionController _attachmentForSelectionRect:](a1, a2, a3, a4, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "drawing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_refreshTiledViewWithSelectionForDrawing:(void *)a3 completion:
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
  if (v5)
  {
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _selectionRefreshWithChangeToDrawings:completion:](a1, v7, v6);

  }
  else
  {
    v8 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1BE213000, v8, OS_LOG_TYPE_ERROR, "Current stroke selection doesn't have a drawing", v9, 2u);
    }

    if (v6)
      v6[2](v6);
  }

}

- (void)delete:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  if (a1)
  {
    +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logSelectionAction:", 6);

    if (*(_QWORD *)(a1 + 120)
      || (-[PKSelectionController _currentAttachment]((id *)a1),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = -[PKSelectionController _hasExternalElementsInAttachment:]((id *)a1, v5),
          v5,
          v6))
    {
      -[PKSelectionController eraseSelection]((id *)a1);
    }
    else
    {
      v7 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl(&dword_1BE213000, v7, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in delete:", v8, 2u);
      }

    }
  }

}

- (BOOL)_hasExternalElementsInAttachment:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  -[PKSelectionController _externalElementsInAttachment:](a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5 != 0;
}

- (void)copy:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  if (a1)
  {
    +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logSelectionAction:", 4);

    v5 = a1[15];
    if (v5)
    {
LABEL_5:
      objc_msgSend(a1, "_addItemsToPasteboard:", v5);
      goto LABEL_6;
    }
    -[PKSelectionController _currentAttachment]((id *)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKSelectionController _hasExternalElementsInAttachment:]((id *)a1, v6);

    if (v7)
    {
      v5 = a1[15];
      goto LABEL_5;
    }
    v8 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1BE213000, v8, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in copy:", v9, 2u);
    }

  }
LABEL_6:

}

- (void)cut:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  if (a1)
  {
    +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logSelectionAction:", 3);

    v5 = a1[15];
    if (v5)
    {
LABEL_5:
      objc_msgSend(a1, "_addItemsToPasteboard:", v5);
      -[PKSelectionController eraseSelection]((id *)a1);
      goto LABEL_6;
    }
    -[PKSelectionController _currentAttachment]((id *)a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKSelectionController _hasExternalElementsInAttachment:]((id *)a1, v6);

    if (v7)
    {
      v5 = a1[15];
      goto LABEL_5;
    }
    v8 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1BE213000, v8, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in cut:", v9, 2u);
    }

  }
LABEL_6:

}

- (void)duplicate:(id *)a1
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MidX;
  double MidY;
  id WeakRetained;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  double v33;
  double v34;
  uint64_t v35;
  uint8_t buf[16];
  CGRect v37;
  CGRect v38;

  if (a1)
  {
    +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logSelectionAction:", 5);

    -[PKSelectionController _currentAttachment](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[15] || -[PKSelectionController _hasExternalElementsInAttachment:](a1, v3))
    {
      -[PKSelectionController _selectedExternalElementsInAttachment:]((uint64_t)a1, v3);
      v4 = objc_claimAutoreleasedReturnValue();
      if (a1[15])
      {
        v5 = objc_msgSend(a1[18], "selectionType");
        objc_msgSend(a1[18], "frame");
        v7 = v6;
        v9 = v8;
        v11 = v10;
        v13 = v12;
        objc_msgSend(a1[18], "frame");
        v15 = v14;
        v17 = v16;
        v37.origin.x = v7;
        v37.origin.y = v9;
        v37.size.width = v11;
        v37.size.height = v13;
        MidX = CGRectGetMidX(v37);
        v38.origin.x = v7;
        v38.origin.y = v9;
        v38.size.width = v11;
        v38.size.height = v13;
        MidY = CGRectGetMidY(v38);
        WeakRetained = objc_loadWeakRetained(a1 + 14);
        v21 = objc_msgSend(WeakRetained, "_maxFileFormatVersion");

        v22 = a1[15];
        if (v21 == 1)
          objc_msgSend(v22, "legacyStrokeDataForSelection");
        else
          objc_msgSend(v22, "strokeDataForSelection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[15], "drawing");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[PKStrokeSelection strokeSelectionFromData:forDrawingClass:](PKStrokeSelection, "strokeSelectionFromData:forDrawingClass:", v24, objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController _didDuplicateExternalElements:inAttachment:](a1, v4, v3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setExternalElements:", v27);

        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __35__PKSelectionController_duplicate___block_invoke;
        v30[3] = &unk_1E777A4C0;
        v30[4] = a1;
        v28 = v26;
        v31 = v28;
        v33 = v15 * 0.1 + MidX;
        v34 = v17 * 0.1 + MidY;
        v29 = v25;
        v32 = v29;
        v35 = v5;
        -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)a1, v30);

      }
      else
      {
        v23 = -[PKSelectionController _didDuplicateExternalElements:inAttachment:](a1, v4, v3);
      }
    }
    else
    {
      v4 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BE213000, v4, OS_LOG_TYPE_ERROR, "SELECTION: No current selection in duplicate:", buf, 2u);
      }
    }

  }
}

- (id)_didDuplicateExternalElements:(void *)a3 inAttachment:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  -[PKSelectionController selectionInteraction](a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PKSelectionController selectionInteraction](a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
    {
      v16 = 0;
      goto LABEL_7;
    }
    -[PKSelectionController _IDsFromExternalElements:](a1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectionInteraction:didDuplicateElements:inAttachment:", v14, v7, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v8, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

LABEL_7:
  return v16;
}

void __35__PKSelectionController_duplicate___block_invoke(uint64_t a1)
{
  -[PKSelectionController _pasteStrokeSelection:atPoint:inDrawing:withSelectionType:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 72), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_pasteStrokeSelection:(void *)a3 atPoint:(uint64_t)a4 inDrawing:(double)a5 withSelectionType:(double)a6
{
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  id v19;
  _OWORD v20[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v11 = a2;
  v12 = a3;
  if (a1)
  {
    -[PKSelectionController setCurrentStrokeSelection:](a1, v11);
    v13 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v25.c = v13;
    *(_OWORD *)&v25.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    memset(&v24, 0, sizeof(v24));
    -[PKSelectionController _selectionTransformForStrokes:atLocation:dragOffsetInDragView:constrainSelection:inDrawing:]((uint64_t)&v24, a1, v11, 1, v12, a5, a6, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    t1 = v25;
    t2 = v24;
    CGAffineTransformConcat(&v23, &t1, &t2);
    v14 = *(_OWORD *)&v23.c;
    *(_OWORD *)(a1 + 168) = *(_OWORD *)&v23.a;
    *(_OWORD *)(a1 + 184) = v14;
    *(_OWORD *)(a1 + 200) = *(_OWORD *)&v23.tx;
    -[PKSelectionController _attachmentForStrokeSelection:]((id *)a1, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "externalElements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_OWORD *)(a1 + 184);
    v20[0] = *(_OWORD *)(a1 + 168);
    v20[1] = v17;
    v20[2] = *(_OWORD *)(a1 + 200);
    -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:]((id *)a1, v16, v20, v15);

    objc_msgSend(v11, "externalElements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _didEndDraggingExternalElements:inAttachment:]((id *)a1, v18, v15);

    -[PKSelectionController _refreshExternalElementsInStrokeSelection:]((void *)a1, v11);
    v19 = -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:selectionType:](a1, v11, v12, 2, a4);

  }
}

- (void)copyAll:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    -[PKSelectionController selectAll:]((id *)a1, v3);
    objc_msgSend((id)a1, "_addItemsToPasteboard:", *(_QWORD *)(a1 + 120));
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](a1, 1, 0);
  }

}

- (void)selectAll:(id *)a1
{
  id v3;
  double v4;
  double v5;
  void *v6;
  id WeakRetained;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  CGRect v23;
  CGRect v24;

  v22 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v22;
      objc_msgSend(v3, "sourcePoint");
      -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, v4 + -60.0, v5 + -60.0, 120.0, 120.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WeakRetained = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(WeakRetained, "bounds");
      x = v23.origin.x;
      y = v23.origin.y;
      width = v23.size.width;
      height = v23.size.height;
      MidX = CGRectGetMidX(v23);
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      MidY = CGRectGetMidY(v24);

      -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, MidX + -60.0, MidY + -60.0, 120.0, 120.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_loadWeakRetained(a1 + 14);
    objc_msgSend(v6, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_attachmentForUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(v6, "strokes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "orderedSetWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKSelectionController _externalElementsInAttachment:](a1, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:](a1, v19, v20, 1, v6);
    +[PKStatisticsManager sharedStatisticsManager]();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "count");
    objc_msgSend(v20, "count");
    -[PKStatisticsManager recordSelectAllWithStrokeCount:externalElementsCount:]((uint64_t)v21);

  }
}

- (void)paste:(uint64_t)a1
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
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
  double v18;
  double v19;
  double MidX;
  double v21;
  double MidY;
  id WeakRetained;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v28;
  void *v29;
  id *v30;
  id v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  BOOL v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  NSObject *v80;
  void (**v81)(_QWORD);
  void *v82;
  uint64_t v83;
  id v84;
  CGFloat v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  __int128 v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  id obj;
  uint64_t v106;
  char isKindOfClass;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  CGAffineTransform v112;
  CGAffineTransform v113;
  _QWORD v114[4];
  void (**v115)(_QWORD);
  _QWORD aBlock[5];
  id v117;
  id v118;
  double v119;
  double v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  _QWORD v132[2];
  CGAffineTransform v133;
  uint64_t v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;

  v134 = *MEMORY[0x1E0C80C00];
  v102 = a2;
  if (a1)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v102, "sourcePoint");
      v4 = v3;
      v6 = v5;
      -[PKSelectionController _drawingForSelectionRect:](a1, v3, v5, 40.0, 40.0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (*(_QWORD *)(a1 + 120))
      {
        objc_msgSend(*(id *)(a1 + 144), "frame");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        objc_msgSend(*(id *)(a1 + 144), "frame");
        v17 = v16;
        v19 = v18;
        v135.origin.x = v9;
        v135.origin.y = v11;
        v135.size.width = v13;
        v135.size.height = v15;
        MidX = CGRectGetMidX(v135);
        v136.origin.x = v9;
        v136.origin.y = v11;
        v136.size.width = v13;
        v136.size.height = v15;
        v21 = v17 * 0.1 + MidX;
        MidY = v19 * 0.1 + CGRectGetMidY(v136);
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
        objc_msgSend(WeakRetained, "bounds");
        x = v137.origin.x;
        y = v137.origin.y;
        width = v137.size.width;
        height = v137.size.height;
        v21 = CGRectGetMidX(v137);
        v138.origin.x = x;
        v138.origin.y = y;
        v138.size.width = width;
        v138.size.height = height;
        MidY = CGRectGetMidY(v138);

      }
      v126 = 0;
      v4 = -[PKSelectionController closestPointForPastedSelectionRect:withDrawing:](a1, &v126, v21 + -60.0, MidY + -60.0, 120.0, 120.0);
      v6 = v28;
      v7 = v126;
    }
    v29 = v7;
    v30 = (id *)(a1 + 112);
    v31 = objc_loadWeakRetained((id *)(a1 + 112));
    v106 = objc_msgSend(v31, "effectiveMaximumSupportedContentVersion");

    v32 = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v29, "uuid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "_attachmentForUUID:", v33);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = v29;
    *(_QWORD *)&v34 = -[PKSelectionController _pointInStrokeSpace:inDrawing:](a1, v29, v4, v6).n128_u64[0];
    v36 = v35;
    v103 = v101;
    -[PKSelectionController selectionInteraction]((id *)a1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_opt_respondsToSelector();

    if ((v39 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction]((id *)a1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "delegate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction]((id *)a1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "attachmentView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "selectionInteractionDidPaste:atPoint:inAttachment:", v42, v43, v34, v36);

    }
    -[PKSelectionController _selectedExternalElementsInAttachment:](a1, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController currentPasteboard]((_QWORD *)a1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = CFSTR("com.apple.pencilkit.strokes");
    v132[1] = CFSTR("com.apple.drawing");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = a1;
    v46 = objc_msgSend(v44, "containsPasteboardTypes:", v45);

    if (v46)
    {
      -[PKSelectionController currentPasteboard]((_QWORD *)a1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "items");
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
      if (!v47)
        goto LABEL_46;
      v108 = *(_QWORD *)v123;
      while (1)
      {
        v109 = v47;
        for (i = 0; i != v109; ++i)
        {
          if (*(_QWORD *)v123 != v108)
            objc_enumerationMutation(obj);
          v49 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("com.apple.pencilkit.strokes"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("com.apple.drawing"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (v51)
          {
            v52 = objc_loadWeakRetained(v30);
            objc_msgSend(v52, "visibleAttachments");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "count") == 0;

            if (v54)
            {
              objc_opt_class();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v55 = objc_loadWeakRetained(v30);
              objc_msgSend(v55, "visibleAttachments");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "firstObject");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "drawing");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v59 = (void *)objc_claimAutoreleasedReturnValue();

            }
            +[PKStrokeSelection strokeSelectionFromData:forDrawingClass:](PKStrokeSelection, "strokeSelectionFromData:forDrawingClass:", v51, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v60;
            if ((isKindOfClass & 1) != 0)
            {
              v62 = v111;
            }
            else
            {
              v63 = v60;
              objc_msgSend(v63, "bounds");
              v65 = v64;
              v67 = v66;
              v69 = v68;
              v71 = v70;
              objc_msgSend(v63, "drawing");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKSelectionController _selectionDrawingTransformForDrawing:](v110, v72, (uint64_t)&v133);
              v139.origin.x = v65;
              v139.origin.y = v67;
              v139.size.width = v69;
              v139.size.height = v71;
              v140 = CGRectApplyAffineTransform(v139, &v133);
              v73 = v140.size.width;
              v74 = v140.size.height;

              v121 = 0;
              v4 = -[PKSelectionController closestPointForPastedSelectionRect:withDrawing:](v110, &v121, v4 - v73 * 0.5, v6 - v74 * 0.5, v73, v74);
              v6 = v75;
              v62 = v121;

            }
            v111 = v62;
            if (!v62)
              goto LABEL_43;
            v76 = objc_loadWeakRetained(v30);
            v77 = objc_msgSend(v76, "_maxFileFormatVersion");

            if (v50 && v77 == 1)
            {
              +[PKStrokeSelection strokeSelectionFromData:forDrawingClass:](PKStrokeSelection, "strokeSelectionFromData:forDrawingClass:", v50, objc_opt_class());
              v78 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_29;
            }
            if (v77 < 2)
            {
              v79 = 0;
            }
            else
            {
              v78 = v61;
LABEL_29:
              v79 = v78;
            }
            objc_msgSend(v79, "setExternalElements:", v104);
            if (v106 <= 2 && v79)
            {
              if (objc_msgSend(v79, "requiredContentVersion") > v106)
              {
                v80 = os_log_create("com.apple.pencilkit", "Selection");
                if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                {
                  v83 = objc_msgSend(v79, "requiredContentVersion");
                  LODWORD(v133.a) = 134218240;
                  *(_QWORD *)((char *)&v133.a + 4) = v83;
                  WORD2(v133.b) = 2048;
                  *(_QWORD *)((char *)&v133.b + 6) = v106;
                  _os_log_error_impl(&dword_1BE213000, v80, OS_LOG_TYPE_ERROR, "Trying to paste a stroke selection with required version: %ld, into max version: %ld", (uint8_t *)&v133, 0x16u);
                }

LABEL_42:
LABEL_43:

                goto LABEL_44;
              }
            }
            else if (!v79)
            {
              goto LABEL_43;
            }
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __31__PKSelectionController_paste___block_invoke;
            aBlock[3] = &unk_1E777A4E8;
            aBlock[4] = v110;
            v117 = v79;
            v119 = v4;
            v120 = v6;
            v118 = v111;
            v81 = (void (**)(_QWORD))_Block_copy(aBlock);
            v82 = v81;
            if (*(_QWORD *)(v110 + 120))
            {
              v114[0] = MEMORY[0x1E0C809B0];
              v114[1] = 3221225472;
              v114[2] = __31__PKSelectionController_paste___block_invoke_2;
              v114[3] = &unk_1E7776F60;
              v115 = v81;
              -[PKSelectionController clearSelectionIfNecessaryWithCompletion:](v110, v114);

            }
            else
            {
              v81[2](v81);
            }

            goto LABEL_42;
          }
LABEL_44:

        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
        if (!v47)
        {
LABEL_46:

          goto LABEL_56;
        }
      }
    }
    if ((isKindOfClass & 1) != 0)
    {
      v84 = v104;
      v86 = *MEMORY[0x1E0C9D628];
      v85 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v88 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v87 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v127 = 0u;
      v128 = 0u;
      v129 = 0u;
      v130 = 0u;
      v89 = v84;
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v127, &v133, 16);
      if (v90)
      {
        v91 = *(_QWORD *)v128;
        do
        {
          for (j = 0; j != v90; ++j)
          {
            if (*(_QWORD *)v128 != v91)
              objc_enumerationMutation(v89);
            objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * j), "boundingBox");
            v145.origin.x = v93;
            v145.origin.y = v94;
            v145.size.width = v95;
            v145.size.height = v96;
            v141.origin.x = v86;
            v141.origin.y = v85;
            v141.size.width = v88;
            v141.size.height = v87;
            v142 = CGRectUnion(v141, v145);
            v86 = v142.origin.x;
            v85 = v142.origin.y;
            v88 = v142.size.width;
            v87 = v142.size.height;
          }
          v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v127, &v133, 16);
        }
        while (v90);
      }

      v143.origin.x = v86;
      v143.origin.y = v85;
      v143.size.width = v88;
      v143.size.height = v87;
      v97 = CGRectGetMidX(v143);
      v144.origin.x = v86;
      v144.origin.y = v85;
      v144.size.width = v88;
      v144.size.height = v87;
      v98 = CGRectGetMidY(v144);
      memset(&v133, 0, sizeof(v133));
      v99 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v113.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v113.c = v99;
      *(_OWORD *)&v113.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformTranslate(&v133, &v113, v34 - v97, v36 - v98);
      v112 = v133;
      -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:]((id *)a1, v89, &v112, v103);
      -[PKSelectionController _didEndDraggingExternalElements:inAttachment:]((id *)a1, v89, v103);
    }
LABEL_56:

  }
}

- (double)closestPointForPastedSelectionRect:(double)a3 withDrawing:(double)a4
{
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  int v43;
  int v44;
  id v45;
  double v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v53;
  CGFloat MidY;
  double MidX;
  _BYTE v57[32];
  double v58;
  double v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  uint64_t v67;
  CGPoint v68;
  CGPoint v69;
  CGPoint v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  *(double *)&v57[16] = a5;
  *(double *)&v57[24] = a6;
  *(double *)v57 = a3;
  *(double *)&v57[8] = a4;
  v67 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  MidX = *MEMORY[0x1E0C9D538];
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v6 = (id *)(a1 + 112);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "visibleAttachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (!v10)
    goto LABEL_27;
  v11 = *(_QWORD *)v61;
  v59 = 1.79769313e308;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v61 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
      v14 = objc_loadWeakRetained(v6);
      objc_msgSend(v14, "convertRect:fromView:", v14, *(double *)v57, *(double *)&v57[8], *(double *)&v57[16], *(double *)&v57[24]);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      objc_msgSend(v13, "superview");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tileMaskView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      objc_msgSend(v23, "convertRect:fromView:", v13);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      v33 = objc_loadWeakRetained(v6);
      objc_msgSend(v33, "scrollView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "convertRect:fromView:", v34, v26, v28, v30, v32);
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;

      v43 = objc_msgSend(v13, "isAtEndOfDocument");
      if (v18 > v38)
        v44 = v43;
      else
        v44 = 0;
      if (v44 == 1)
      {
        v50 = v13;

        MidX = CGRectGetMidX(*(CGRect *)v57);
        CGRectGetMidY(*(CGRect *)v57);
LABEL_26:
        v9 = v50;
        goto LABEL_27;
      }
      v71.origin.x = v36;
      v71.origin.y = v38;
      v71.size.width = v40;
      v71.size.height = v42;
      v76.origin.x = v16;
      v76.origin.y = v18;
      v76.size.width = v20;
      v76.size.height = v22;
      if (CGRectContainsRect(v71, v76))
      {
        v50 = v13;

        MidX = CGRectGetMidX(*(CGRect *)v57);
        MidY = CGRectGetMidY(*(CGRect *)v57);
        v51 = os_log_create("com.apple.pencilkit", "Paste");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          v70.y = MidY;
          v70.x = MidX;
          NSStringFromCGPoint(v70);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v65 = v53;
          _os_log_debug_impl(&dword_1BE213000, v51, OS_LOG_TYPE_DEBUG, "Pasting stroke inside of existing drawing at point %@", buf, 0xCu);

        }
        goto LABEL_26;
      }
      v58 = DKDDistanceToRectFromRect(v36, v38, v40, v42, v16, v18, v20, v22);
      if (v58 < v59)
      {
        v45 = v13;

        v72.origin.x = v16;
        v72.origin.y = v18;
        v72.size.width = v20;
        v72.size.height = v22;
        MidX = CGRectGetMidX(v72);
        v73.origin.x = v16;
        v73.origin.y = v18;
        v73.size.width = v20;
        v73.size.height = v22;
        v46 = CGRectGetMidY(v73);
        v74.origin.x = v36;
        v74.origin.y = v38;
        v74.size.width = v40;
        v74.size.height = v42;
        CGRectGetMidX(v74);
        v75.origin.x = v36;
        v75.origin.y = v38;
        v75.size.width = v40;
        v75.size.height = v42;
        if (v46 <= CGRectGetMidY(v75))
        {
          v47 = os_log_create("com.apple.pencilkit", "Paste");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v69.y = v22 * 0.5 + v38;
            v69.x = MidX;
            NSStringFromCGPoint(v69);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v65 = v49;
            _os_log_debug_impl(&dword_1BE213000, v47, OS_LOG_TYPE_DEBUG, "Pasting stroke, clamped to the top of a drawing at %@", buf, 0xCu);

          }
        }
        else
        {
          v47 = os_log_create("com.apple.pencilkit", "Paste");
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v68.y = v38 + v42 + v22 * -0.5;
            v68.x = MidX;
            NSStringFromCGPoint(v68);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v65 = v48;
            _os_log_debug_impl(&dword_1BE213000, v47, OS_LOG_TYPE_DEBUG, "Pasting stroke, clamped to the bottom of a drawing at %@", buf, 0xCu);

          }
        }

        v9 = v45;
        v59 = v58;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v10)
      continue;
    break;
  }
LABEL_27:

  objc_msgSend(v9, "drawing");
  *a2 = (id)objc_claimAutoreleasedReturnValue();

  return MidX;
}

- (__n128)_pointInStrokeSpace:(double)a3 inDrawing:(double)a4
{
  id v7;
  id *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v17;
  __int128 v18;
  float64x2_t v19;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v7 = a2;
  if (a1)
  {
    v8 = (id *)(a1 + 112);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "tileContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained(v8);
    objc_msgSend(v12, "convertPoint:fromView:", v13, a3, a4);
    v17 = v15;
    v18 = v14;

    if (v11)
      objc_msgSend(v11, "drawingTransform", v17, v18);
    else
      memset(&v20, 0, sizeof(v20));
    CGAffineTransformInvert(&v21, &v20);
    v19 = vaddq_f64(*(float64x2_t *)&v21.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v21.c, *(double *)&v17), *(float64x2_t *)&v21.a, *(double *)&v18));

  }
  else
  {
    v19 = 0u;
  }

  return (__n128)v19;
}

void __31__PKSelectionController_paste___block_invoke(uint64_t a1)
{
  -[PKSelectionController _pasteStrokeSelection:atPoint:inDrawing:withSelectionType:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __31__PKSelectionController_paste___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didDragExternalElements:(_QWORD *)a3 withTransform:(void *)a4 inAttachment:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[PKSelectionController _IDsFromExternalElements:](a1, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attachmentView", *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "selectionInteraction:didDragElements:withTransform:inAttachment:", v15, v12, &v17, v16);

    }
  }

}

- (void)_didEndDraggingExternalElements:(void *)a3 inAttachment:
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[PKSelectionController _IDsFromExternalElements:](a1, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachmentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectionInteraction:didEndDraggingElements:inAttachment:", v12, v9, v13);

    }
  }

}

- (void)changeColorOfSelection:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    -[PKSelectionController changeColorOfSelection:withCompletion:](a1, v3, 0);

}

- (void)changeColorOfSelection:(void *)a3 withCompletion:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  dispatch_block_t v14;
  dispatch_block_t *v15;
  void *v16;
  dispatch_time_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id location;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logSelectionAction:", 2);

    if (v6)
    {
LABEL_3:
      -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
      v25 = CFSTR("PKInkColorProperty");
      v26[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(a1 + 88) = 1;
      objc_initWeak(&location, (id)a1);
      v9 = *(void **)(a1 + 120);
      objc_msgSend(v9, "drawing");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(*(id *)(a1 + 144), "selectionType");
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__PKSelectionController_changeColorOfSelection_withCompletion___block_invoke_2;
      v18[3] = &unk_1E777A510;
      v19 = v6;
      objc_copyWeak(&v20, &location);
      v12 = -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:inkChanges:selectionType:withCompletion:](a1, v9, v10, 3, v8, v11, v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);

      goto LABEL_10;
    }
    v13 = *(void **)(a1 + 96);
    if (*(_BYTE *)(a1 + 88))
    {
      if (!v13)
        goto LABEL_9;
    }
    else if (!v13)
    {
      goto LABEL_3;
    }
    dispatch_block_cancel(v13);
LABEL_9:
    objc_initWeak(&location, (id)a1);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PKSelectionController_changeColorOfSelection_withCompletion___block_invoke;
    block[3] = &unk_1E7777B58;
    objc_copyWeak(&v23, &location);
    v22 = v5;
    v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
    v16 = *(void **)(a1 + 96);
    v15 = (dispatch_block_t *)(a1 + 96);
    *v15 = v14;

    v17 = dispatch_time(0, 100000000);
    dispatch_after(v17, MEMORY[0x1E0C80D38], *v15);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
LABEL_10:

}

void __63__PKSelectionController_changeColorOfSelection_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[12];
    WeakRetained[12] = 0;

    if (WeakRetained[15])
      -[PKSelectionController changeColorOfSelection:](WeakRetained, *(_QWORD *)(a1 + 32));
  }

}

void __63__PKSelectionController_changeColorOfSelection_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    WeakRetained[88] = 0;

}

- (void)_selectionTransformForStrokes:(void *)a3 atLocation:(int)a4 dragOffsetInDragView:(void *)a5 constrainSelection:(double)a6 inDrawing:(double)a7
{
  id v17;
  id v18;
  void *v19;
  id v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MidX;
  double MidY;
  unint64_t v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v41;
  CGFloat v42;
  id WeakRetained;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  __int128 v51;
  double v52;
  __int128 v53;
  __int128 v54;
  double v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v60;
  CGAffineTransform v61;
  _OWORD v62[3];
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v17 = a3;
  v18 = a5;
  if (a2)
  {
    v19 = *(void **)(a2 + 144);
    v55 = a9;
    if (v19
      && (objc_msgSend(v19, "strokeSelection"),
          v20 = (id)objc_claimAutoreleasedReturnValue(),
          v20,
          v19 = *(void **)(a2 + 144),
          v20 == v17))
    {
      objc_msgSend(v19, "frame");
      v25 = v27;
      v26 = v28;
      v22 = v29;
      v24 = v30;
    }
    else
    {
      objc_msgSend(v19, "frame");
      v22 = v21;
      v24 = v23;
      v25 = a6 - a8 - v21 * 0.5;
      v26 = a7 - a9 - v23 * 0.5;
    }
    v63.origin.x = v25;
    v63.origin.y = v26;
    v63.size.width = v22;
    v63.size.height = v24;
    MidX = CGRectGetMidX(v63);
    v64.origin.x = v25;
    v64.origin.y = v26;
    v64.size.width = v22;
    v64.size.height = v24;
    MidY = CGRectGetMidY(v64);
    v33 = -[PKSelectionController _pointInStrokeSpace:inDrawing:](a2, v18, MidX, MidY).n128_u64[0];
    v35 = v34;
    v36 = a7;
    objc_msgSend(v17, "bounds");
    x = v65.origin.x;
    y = v65.origin.y;
    width = v65.size.width;
    height = v65.size.height;
    v41 = CGRectGetMidX(v65);
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    v42 = CGRectGetMidY(v66);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, -v41, -v42);
    if (a4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a2 + 112));
      objc_msgSend(WeakRetained, "frame");
      v45 = v44;
      -[PKSelectionController _selectionDrawingTransformForDrawing:](a2, v18, (uint64_t)v62);
      v46 = DKDScaleForTransform(v62);

      objc_msgSend(v17, "boundsWithoutLasso");
      v48 = v45 / v46;
      if (v47 > v48)
      {
        memset(&v61, 0, sizeof(v61));
        v49 = v48 / v47;
        CGAffineTransformMakeScale(&v61, v48 / v47, v48 / v47);
        v50 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)&t1.a = *(_OWORD *)a1;
        *(_OWORD *)&t1.c = v50;
        *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
        t2 = v61;
        CGAffineTransformConcat(&v60, &t1, &t2);
        v51 = *(_OWORD *)&v60.c;
        *(_OWORD *)a1 = *(_OWORD *)&v60.a;
        *(_OWORD *)(a1 + 16) = v51;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)&v60.tx;
        v33 = -[PKSelectionController _pointInStrokeSpace:inDrawing:](a2, v18, v48 * 0.5, v36 - v55 * v49).n128_u64[0];
        v35 = v52;
      }
    }
    v53 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&v57.a = *(_OWORD *)a1;
    *(_OWORD *)&v57.c = v53;
    *(_OWORD *)&v57.tx = *(_OWORD *)(a1 + 32);
    CGAffineTransformMakeTranslation(&v56, *(CGFloat *)&v33, v35);
    CGAffineTransformConcat(&v61, &v57, &v56);
    v54 = *(_OWORD *)&v61.c;
    *(_OWORD *)a1 = *(_OWORD *)&v61.a;
    *(_OWORD *)(a1 + 16) = v54;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v61.tx;
  }
  else
  {
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }

}

- (id)_strokeSelectionForDropSession:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "localDragSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "localDragSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __77__PKSelectionController__createSelectionViewForDropSession_removeFromSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "externalElementsItemProvider", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setExternalElementsItemProvider:", v8);

        -[PKSelectionController _createSelectionViewForDropSession:removeFromSource:withStrokeSelection:](*(id **)(a1 + 40), *(void **)(a1 + 48), *(_BYTE *)(a1 + 56), v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)_createSelectionViewForDropSession:(char)a3 removeFromSource:(void *)a4 withStrokeSelection:
{
  id v7;
  id v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id *v23;
  id v24;
  id v25;
  id v26;
  char v27;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 14);
    objc_msgSend(v7, "locationInView:", WeakRetained);
    v11 = v10;
    v13 = v12;

    -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, v11, v13, 120.0, 120.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained(a1 + 14);
    objc_msgSend(v14, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_attachmentForUUID:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "externalElementsItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97__PKSelectionController__createSelectionViewForDropSession_removeFromSource_withStrokeSelection___block_invoke;
    v21[3] = &unk_1E777A560;
    v22 = v8;
    v23 = a1;
    v19 = v17;
    v24 = v19;
    v25 = v7;
    v20 = v14;
    v26 = v20;
    v27 = a3;
    -[PKSelectionController _didDropExternalElementsItemProvider:inAttachment:withCompletion:](a1, v18, v19, v21);

  }
}

id __97__PKSelectionController__createSelectionViewForDropSession_removeFromSource_withStrokeSelection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  __int128 v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  __int128 v12;
  id *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  id *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;

  -[PKSelectionController _externalElementsForIDs:inAttachment:](*(id **)(a1 + 40), a2, *(void **)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExternalElements:", v3);

  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v27.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v27.c = v4;
  *(_OWORD *)&v27.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  memset(&v26, 0, sizeof(v26));
  v6 = *(void **)(a1 + 32);
  v5 = *(id **)(a1 + 40);
  v7 = *(void **)(a1 + 56);
  -[PKSelectionController topView](v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  -[PKSelectionController _selectionTransformForStrokes:atLocation:dragOffsetInDragView:constrainSelection:inDrawing:]((uint64_t)&v26, (uint64_t)v5, v6, 1, *(void **)(a1 + 64), v9, v10, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  t1 = v27;
  t2 = v26;
  CGAffineTransformConcat(&v25, &t1, &t2);
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    v12 = *(_OWORD *)&v25.c;
    *(_OWORD *)(v11 + 168) = *(_OWORD *)&v25.a;
    *(_OWORD *)(v11 + 184) = v12;
    *(_OWORD *)(v11 + 200) = *(_OWORD *)&v25.tx;
    v13 = *(id **)(a1 + 40);
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "externalElements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    v16 = *(_OWORD *)(v15 + 184);
    v20 = *(_OWORD *)(v15 + 168);
    v21 = v16;
    v22 = *(_OWORD *)(v15 + 200);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
  }
  -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:](v13, v14, &v20, *(void **)(a1 + 48));

  v17 = *(id **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "externalElements", v20, v21, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _didEndDraggingExternalElements:inAttachment:](v17, v18, *(void **)(a1 + 48));

  -[PKSelectionController _refreshExternalElementsInStrokeSelection:](*(void **)(a1 + 40), *(void **)(a1 + 32));
  return -[PKSelectionController _commitStrokeSelection:toDrawing:selectionAction:selectionType:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), *(void **)(a1 + 64), 2 * (*(_BYTE *)(a1 + 72) == 0), 0);
}

- (id)_externalElementsForIDs:(void *)a3 inAttachment:
{
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PKExternalElement *v17;
  id v19;
  id obj;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v22 = a3;
  if (a1
    && (-[PKSelectionController selectionInteraction](a1),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v19;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
          -[PKSelectionController selectionInteraction](a1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKSelectionController selectionInteraction](a1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "attachmentView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "selectionInteraction:pathForElement:inAttachment:", v14, v11, v15);

          v17 = -[PKExternalElement initWithIdentifier:path:]([PKExternalElement alloc], "initWithIdentifier:path:", v11, v16);
          objc_msgSend(v21, "addObject:", v17);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v8);
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_didDropExternalElementsItemProvider:(void *)a3 inAttachment:(void *)a4 withCompletion:
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attachmentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectionInteraction:didDropItemProvider:inAttachment:withCompletion:", v14, v16, v15, v8);

    }
    else
    {
      v8[2](v8, 0);
    }
  }

}

- (void)updateCurrentStrokeSelectionTransformForLocation:(double)a3 atLocation:(double)a4 offsetInTouchView:(double)a5
{
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _OWORD v23[3];
  id v24;

  v11 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 144), "frame");
    v13 = v12;
    v15 = v14;
    -[PKSelectionController _drawingForSelectionRect:](a1, a3 - a5, a4 - a6, v12, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v24 = 0;
      -[PKSelectionController closestPointForPastedSelectionRect:withDrawing:](a1, &v24, a3 - a5, a4 - a6, v13, v15);
      v16 = v24;
    }
    -[PKSelectionController _selectionTransformForStrokes:atLocation:dragOffsetInDragView:constrainSelection:inDrawing:]((uint64_t)v23, a1, v11, 0, v16, a3, a4, a5, a6);
    v17 = v23[1];
    *(_OWORD *)(a1 + 168) = v23[0];
    *(_OWORD *)(a1 + 184) = v17;
    *(_OWORD *)(a1 + 200) = v23[2];
    if (!*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(v11, "drawing");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "uuid");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v19;

    }
    objc_msgSend(v16, "uuid");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v21;

  }
}

- (id)_externalElementsInAttachment:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  -[PKSelectionController selectionInteraction](a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKSelectionController selectionInteraction](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attachmentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectionInteraction:elementsInAttachment:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v11, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)didBeginSpaceInsertionWithLassoPath:(double)a3 atLocation:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v7 = a2;
  if (a1)
  {
    -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, a3 + -60.0, a4 + -60.0, 120.0, 120.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _strokeForLassoPath:inDrawing:]((uint64_t)a1, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(a1 + 14);
    v11 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "transformFromViewToStrokeSpaceInDrawing:", v8);
      v13 = v23;
      v12 = v22;
      v14 = v25;
      v15 = v24;
      v16 = v27;
      v17 = v26;
    }
    else
    {
      v16 = 0.0;
      v14 = 0.0;
      v13 = 0.0;
      v17 = 0.0;
      v15 = 0.0;
      v12 = 0.0;
    }

    v18 = objc_loadWeakRetained(a1 + 14);
    objc_msgSend(v8, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_attachmentForUUID:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKSelectionController _elementsForSpaceInsertedAtPoint:inAttachment:](a1, v20, v17 + a4 * v15 + v12 * a3, v16 + a4 * v14 + v13 * a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "didBeginSpaceInsertionWithLassoStroke:drawing:addDefaultSpace:strokesAbove:strokesBelow:externalElements:", v9, v8, 0, 0, 0, v21);

  }
}

- (id)_elementsForSpaceInsertedAtPoint:(double)a3 inAttachment:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a2;
  -[PKSelectionController selectionInteraction](a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PKSelectionController selectionInteraction](a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectionInteraction:elementsForSpaceInsertedAtPoint:inAttachment:", v13, v14, a3, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "attachmentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)didBeginSpaceInsertionWithLassoStroke:(id)a3 drawing:(id)a4 addDefaultSpace:(BOOL)a5 strokesAbove:(id)a6 strokesBelow:(id)a7 externalElements:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BOOL v30;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __130__PKSelectionController_didBeginSpaceInsertionWithLassoStroke_drawing_addDefaultSpace_strokesAbove_strokesBelow_externalElements___block_invoke;
  v24[3] = &unk_1E777A588;
  v24[4] = self;
  v25 = v14;
  v30 = a5;
  v26 = v15;
  v27 = v16;
  v28 = v17;
  v29 = v18;
  v19 = v18;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)self, v24);

}

uint64_t __130__PKSelectionController_didBeginSpaceInsertionWithLassoStroke_drawing_addDefaultSpace_strokesAbove_strokesBelow_externalElements___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "didBeginCreatingSpaceWithLassoStroke:drawing:addDefaultSpace:strokesAbove:strokesBelow:externalElements:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (id)applySpaceInsertionWithStrokeSelection:(void *)a3 inDrawing:(void *)a4 offset:(CGFloat)a5 completion:
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  __int128 v12;
  void *v13;
  void *v14;
  __int128 v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  NSObject *v20;
  _OWORD v22[3];
  CGAffineTransform v23;
  uint8_t buf[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    if (v10)
    {
      CGAffineTransformMakeTranslation(&v23, 0.0, a5);
      v12 = *(_OWORD *)&v23.c;
      *(_OWORD *)(a1 + 168) = *(_OWORD *)&v23.a;
      *(_OWORD *)(a1 + 184) = v12;
      *(_OWORD *)(a1 + 200) = *(_OWORD *)&v23.tx;
      objc_msgSend(v9, "strokes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = *(_OWORD *)(a1 + 184);
      v22[0] = *(_OWORD *)(a1 + 168);
      v22[1] = v15;
      v22[2] = *(_OWORD *)(a1 + 200);
      objc_msgSend(v10, "undoableTransformStrokes:withTransform:concat:", v14, v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      objc_msgSend(WeakRetained, "didChangeDrawing:", v10);

      if (v16)
        -[PKSelectionController registerCommandWithUndoManager:](a1, v16);
      -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _selectionRefreshWithChangeToDrawings:completion:](a1, v18, v11);

      +[PKDrawing visibleStrokesFromStrokes:inDrawing:](PKDrawing, "visibleStrokesFromStrokes:inDrawing:", v14, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v19);
      a1 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v9;
        _os_log_fault_impl(&dword_1BE213000, v20, OS_LOG_TYPE_FAULT, "Trying to fetch strokes for insert space with a nil drawing with stroke selection %@", buf, 0xCu);
      }

      if (v11)
        v11[2](v11);
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
      a1 = objc_claimAutoreleasedReturnValue();
    }
  }

  return (id)a1;
}

- (void)hideStrokes:(void *)a3 inDrawing:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (a1)
  {
    -[PKSelectionController _resetSelectedStrokeStateForRenderer](a1);
    objc_msgSend(v9, "strokes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PKStroke copyStrokes:hidden:](PKStroke, "copyStrokes:hidden:", v7, 1);
    -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:](a1, v8, v5, 0);

  }
}

- (void)_setAdditionalStrokes:(void *)a3 inDrawing:(void *)a4 completion:
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    if (v11)
      v10 = v11;
    else
      v10 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(WeakRetained, "_setAdditionalStrokes:inDrawing:completion:", v10, v7, v8);

  }
}

- (void)insertSpaceAtPoint:(void *)a3 addDefaultSpace:(void *)a4 strokesAbove:(double)a5 strokesBelow:(double)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id WeakRetained;
  id v18;
  void *v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;

  v11 = a3;
  v12 = a4;
  if (a1)
  {
    -[PKSelectionController _drawingForSelectionRect:]((uint64_t)a1, a5 + -60.0, a6 + -60.0, 120.0, 120.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(WeakRetained, "origin");
      objc_msgSend(v16, "moveToPoint:");

      v18 = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(v18, "bounds");
      objc_msgSend(v16, "addLineToPoint:", CGRectGetMaxX(v38), a6);

      -[PKSelectionController _strokeForLassoPath:inDrawing:]((uint64_t)a1, v16, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_loadWeakRetained(a1 + 14);
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "transformFromViewToStrokeSpaceInDrawing:", v15);
        v23 = v33;
        v22 = v32;
        v24 = v35;
        v25 = v34;
        v26 = v37;
        v27 = v36;
      }
      else
      {
        v26 = 0.0;
        v24 = 0.0;
        v23 = 0.0;
        v27 = 0.0;
        v25 = 0.0;
        v22 = 0.0;
      }

      v28 = objc_loadWeakRetained(a1 + 14);
      objc_msgSend(v15, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_attachmentForUUID:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSelectionController _elementsForSpaceInsertedAtPoint:inAttachment:](a1, v30, v27 + a6 * v25 + v22 * a5, v26 + a6 * v24 + v23 * a5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "didBeginSpaceInsertionWithLassoStroke:drawing:addDefaultSpace:strokesAbove:strokesBelow:externalElements:", v19, v15, a2, v11, v12, v31);

    }
  }

}

- (void)insertSpace:(id *)a1
{
  id v3;
  double v4;
  double v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v6;
      objc_msgSend(v3, "sourcePoint");
    }
    else
    {
      v3 = a1[18];
      objc_msgSend(v3, "frame");
    }
    -[PKSelectionController insertSpaceAtPoint:addDefaultSpace:strokesAbove:strokesBelow:](a1, 1, 0, 0, v4, v5);

  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PKSelectionController topView]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  else
    WeakRetained = 0;
  v12 = objc_msgSend(WeakRetained, "_maxFileFormatVersion");

  if (v12 == 1)
  {
    v17[0] = CFSTR("com.apple.pencilkit.strokes");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PKStrokeSelection readableTypeIdentifiersForItemProvider](PKStrokeSelection, "readableTypeIdentifiersForItemProvider");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
  if (objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v13))
    v15 = -[PKSelectionController _isValidDropPointForStrokes:]((uint64_t)self, v8, v10);
  else
    v15 = 0;

  return v15;
}

- (uint64_t)_isValidDropPointForStrokes:(double)a3
{
  id WeakRetained;
  uint64_t v6;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  v6 = objc_msgSend(WeakRetained, "_isValidDropPointForStrokes:", a2, a3);

  return v6;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = a4;
  if (!self->_selectionView)
  {
    v14 = v5;
    -[PKSelectionController _strokeSelectionForDropSession:]((uint64_t)self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "drawing");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController drawingForUUID:]((uint64_t)self, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "strokes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[PKStroke copyStrokes:hidden:](PKStroke, "copyStrokes:hidden:", v11, 1);
      objc_msgSend(v6, "drawing");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)self, v12, v13, 0);

    }
    v5 = v14;
  }

}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a4;
  -[PKSelectionController topView]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[PKSelectionController _strokeSelectionForDropSession:]((uint64_t)self, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _drawingForSelectionRect:]((uint64_t)self, v8, v10, 40.0, 40.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (self && self->_currentStrokeSelection)
  {
    objc_msgSend(v11, "drawing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v12)
    {
      objc_msgSend(v11, "externalElementsItemProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15 != 0;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  if (((-[PKSelectionController _isValidDropPointForStrokes:]((uint64_t)self, v8, v10) ^ 1 | v14) & 1) != 0)
  {
    v16 = objc_alloc(MEMORY[0x1E0DC3788]);
    v17 = 0;
  }
  else
  {
    objc_msgSend(v11, "drawing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController drawingForUUID:]((uint64_t)self, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0DC3788]);
    if (v20)
      v17 = 3;
    else
      v17 = 2;
  }
  v21 = (void *)objc_msgSend(v16, "initWithDropOperation:", v17);

  return v21;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  void *v12;
  os_log_t v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  PKSelectionController *v46;
  id v47;
  id v48;
  _BYTE buf[24];
  void *v50;
  id v51;
  PKSelectionController *v52;
  id v53;
  char v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[PKSelectionController topView]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  self->_dropPosition.x = v7;
  self->_dropPosition.y = v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  v10 = objc_msgSend(WeakRetained, "effectiveMaximumSupportedContentVersion");

  -[PKSelectionController _strokeSelectionForDropSession:]((uint64_t)self, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 > 2 || objc_msgSend(v11, "requiredContentVersion") <= v10)
  {
    v15 = objc_loadWeakRetained((id *)&self->_tiledView);
    objc_msgSend(v5, "locationInView:", v15);
    v17 = v16;
    v19 = v18;

    -[PKSelectionController _drawingForSelectionRect:]((uint64_t)self, v17, v19, 120.0, 120.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _attachmentForStrokeSelection:]((id *)&self->super.isa, v12);
    v13 = (os_log_t)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained((id *)&self->_tiledView);
    objc_msgSend(v14, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_attachmentForUUID:", v21);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_currentStrokeSelection && -[PKSelectionView isDragging](self->_selectionView, "isDragging"))
    {
      objc_msgSend(v12, "externalElements");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController _didDeleteExternalElements:inAttachment:]((id *)&self->super.isa, v22, v13);

      objc_msgSend(v12, "externalElementsItemProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __53__PKSelectionController_dropInteraction_performDrop___block_invoke;
      v44[3] = &unk_1E777A5B0;
      v45 = v12;
      v46 = self;
      v47 = v43;
      v48 = v5;
      -[PKSelectionController _didDropExternalElementsItemProvider:inAttachment:withCompletion:]((id *)&self->super.isa, v23, v47, v44);

    }
    else
    {
      objc_msgSend(v12, "drawing");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController drawingForUUID:]((uint64_t)self, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v12, "externalElements");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKSelectionController _didDeleteExternalElements:inAttachment:]((id *)&self->super.isa, v27, v13);

        v28 = os_log_create("com.apple.pencilkit", "Selection");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1BE213000, v28, OS_LOG_TYPE_DEBUG, "Selection is from drawing originally, but drawing got torn down mid-drag", buf, 2u);
        }

        -[PKSelectionController _createSelectionViewForDropSession:removeFromSource:withStrokeSelection:]((id *)&self->super.isa, v5, 1, v12);
      }
      else
      {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)self, 1, 0);
        v42 = v5;
        v29 = objc_loadWeakRetained((id *)&self->_tiledView);
        objc_msgSend(v29, "visibleAttachments");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v31)
        {
          v32 = objc_loadWeakRetained((id *)&self->_tiledView);
          objc_msgSend(v32, "visibleAttachments");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "firstObject");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "drawing");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "strokeSelectionClass");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v37 = v36;
        -[PKSelectionController _strokeSelectionForDropSession:]((uint64_t)self, v42);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __77__PKSelectionController__createSelectionViewForDropSession_removeFromSource___block_invoke;
        v50 = &unk_1E777A538;
        v51 = v38;
        v52 = self;
        v39 = v42;
        v53 = v39;
        v54 = 0;
        v40 = v38;
        v41 = (id)objc_msgSend(v39, "loadObjectsOfClass:completion:", v37, buf);

      }
    }

  }
  else
  {
    v13 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = objc_msgSend(v12, "requiredContentVersion");
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "Trying to drop a stroke selection with required version: %ld, into max version: %ld", buf, 0x16u);
    }
    v14 = v13;
  }

}

uint64_t __53__PKSelectionController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  -[PKSelectionController _externalElementsForIDs:inAttachment:](*(id **)(a1 + 40), a2, *(void **)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExternalElements:", v3);

  v4 = *(void **)(a1 + 56);
  -[PKSelectionController topView](*(id **)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    v11 = *(void **)(v10 + 144);
  else
    v11 = 0;
  objc_msgSend(v11, "updateLocationForDrop:", v7, v9);
  -[PKSelectionController didMoveStrokeSelectionToLocation:](*(_QWORD *)(a1 + 40), v7, v9);
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    v13 = *(void **)(v12 + 144);
  else
    v13 = 0;
  return objc_msgSend(v13, "_putStrokesBackIntoTiledViewAnimated:", 1);
}

- (void)didMoveStrokeSelectionToLocation:(double)a3
{
  double v6;
  double v7;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 144), "offsetInTouchView");
    -[PKSelectionController updateCurrentStrokeSelectionTransformForLocation:atLocation:offsetInTouchView:](a1, *(void **)(a1 + 120), a2, a3, v6, v7);
  }
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  if (self)
    self = (PKSelectionController *)self->_selectionView;
  return -[PKSelectionController _dropDataOwner](self, "_dropDataOwner", a3, a4);
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  id v19;
  double MidX;
  double MidY;
  id WeakRetained;
  double v23;
  double v24;
  __int128 v25;
  void *v26;
  void *v27;
  _OWORD v29[3];
  CGRect v30;
  CGRect v31;

  v6 = a5;
  -[PKSelectionView offsetInTouchView](self->_selectionView, "offsetInTouchView");
  v8 = v7;
  v10 = v9;
  -[PKSelectionView bounds](self->_selectionView, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = objc_alloc(MEMORY[0x1E0DC3770]);
  v30.origin.x = v12;
  v30.origin.y = v14;
  v30.size.width = v16;
  v30.size.height = v18;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = v12;
  v31.origin.y = v14;
  v31.size.width = v16;
  v31.size.height = v18;
  MidY = CGRectGetMidY(v31);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  v23 = MidX + self->_dropPosition.x - v8;
  v24 = MidY + self->_dropPosition.y - v10;
  v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v29[0] = *MEMORY[0x1E0C9BAA8];
  v29[1] = v25;
  v29[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v26 = (void *)objc_msgSend(v19, "initWithContainer:center:transform:", WeakRetained, v29, v23, v24);

  objc_msgSend(v6, "retargetedPreviewWithTarget:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)didBeginDraggingSelection
{
  id v2;

  if (a1)
  {
    objc_msgSend(a1, "didBeginModifyDrawing");
    -[PKSelectionController selectionInteraction]((id *)a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_didBeginDraggingSelection:", a1[18]);

  }
}

- (void)didEndDraggingSelection
{
  id v2;

  if (a1)
  {
    objc_msgSend(a1, "didEndModifyDrawing");
    -[PKSelectionController selectionInteraction]((id *)a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_didEndDraggingSelection:", a1[18]);

  }
}

- (void)didBeginModifyDrawing
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "attachmentViews", (_QWORD)v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "didBeginModifyDrawing");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)didEndModifyDrawing
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "attachmentViews", (_QWORD)v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "didEndModifyDrawing");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (CGAffineTransform)transformFromStrokeSpaceToViewInDrawing:(SEL)a3
{
  id WeakRetained;
  void *v7;
  CGAffineTransform *result;
  id v9;

  v9 = a4;
  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView)) != 0)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "transformFromStrokeSpaceToViewInDrawing:", v9);
  }
  else
  {
    v7 = 0;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGRect)attachmentBoundsForDrawing:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  if (self)
    self = (PKSelectionController *)objc_loadWeakRetained((id *)&self->_tiledView);
  -[PKSelectionController attachmentBoundsForDrawing:](self, "attachmentBoundsForDrawing:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_firstStrokesInStrokes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_firstStrokesInStrokes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_lastStrokesInStrokes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKSelectionController selectionInteraction]((id *)&self->super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lastStrokesInStrokes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateLiveSelectionForStrokesInLayer:(id)a3 inDrawing:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_tiledView);
  else
    WeakRetained = 0;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_attachmentForUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "updateLiveSelectionForStrokesInLayer:inDrawing:", v10, v6);

}

- (double)_scrollViewDrawingFrame
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");

  return *MEMORY[0x1E0C9D538];
}

- (id)_visibleStrokesWithinExtendedBounds:(void *)a3 forDrawing:
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  id v43;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  uint64_t v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v68;
  CGFloat v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v70 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKSelectionController _scrollViewDrawingFrame](a1);
    v68 = v8;
    v69 = v7;
    v10 = v9;
    v12 = v11;
    v13 = v70;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v13, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "viewRep");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tileContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v16, "tileContainerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertRect:fromView:", v28, v21, v23, v25, v27);
    v30 = v29;
    v32 = v31;

    v33 = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v33, "scrollView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "contentOffset");
    v36 = v35;
    v38 = v37;

    objc_msgSend(v13, "bounds");
    v40 = v39;
    v42 = v41;

    v77.origin.y = v68;
    v77.origin.x = v69;
    v77.size.width = v10;
    v77.size.height = v12;
    v81.origin.x = v30 - v36;
    v81.origin.y = v32 - v38;
    v81.size.width = v40;
    v81.size.height = v42;
    if (CGRectIntersectsRect(v77, v81))
    {
      v43 = v13;
      v78.origin.x = -[PKSelectionController _scrollViewDrawingFrame](a1);
      x = v78.origin.x;
      y = v78.origin.y;
      width = v78.size.width;
      height = v78.size.height;
      MaxX = CGRectGetMaxX(v78);
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      MaxY = CGRectGetMaxY(v79);
      *(_QWORD *)&v50 = -[PKSelectionController _pointInStrokeSpace:inDrawing:](a1, v43, x, y - MaxY).n128_u64[0];
      v52 = v51;
      *(_QWORD *)&v53 = -[PKSelectionController _pointInStrokeSpace:inDrawing:](a1, v43, MaxX + 0.0, MaxY + MaxY).n128_u64[0];
      v55 = v54;

      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v56 = v5;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      if (v57)
      {
        v58 = v53 - v50;
        v59 = v55 - v52;
        v60 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v57; ++i)
          {
            if (*(_QWORD *)v72 != v60)
              objc_enumerationMutation(v56);
            v62 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
            objc_msgSend(v62, "_bounds");
            v82.origin.x = v63;
            v82.origin.y = v64;
            v82.size.width = v65;
            v82.size.height = v66;
            v80.origin.x = v50;
            v80.origin.y = v52;
            v80.size.width = v58;
            v80.size.height = v59;
            if (CGRectIntersectsRect(v80, v82))
              objc_msgSend(v6, "addObject:", v62);
          }
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
        }
        while (v57);
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)updateCurrentSelectionWithNewDrawingIfNecessary:(uint64_t)a1
{
  void *v2;
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  uint64_t v40;
  unsigned int v41;
  id *v42;
  uint8_t buf[8];
  _QWORD v44[4];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    +[PKSelectionGlowRenderer invalidateSharedStrokePathCache]();
    if (*(_QWORD *)(a1 + 120))
    {
      v42 = (id *)a1;
      v5 = objc_msgSend(*(id *)(a1 + 144), "isHidden");
      v6 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "strokes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v42[15];
      objc_msgSend(v9, "strokes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v42[15], "externalElements");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v12, "count");

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      objc_msgSend(v42[15], "strokes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v41 = v5;
      if (v14)
      {
        v15 = 0;
        v16 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v47 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v8, "containsObject:", v18) & 1) == 0)
            {
              objc_msgSend(v18, "_strokeUUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "_strokeForIdentifier:", v19);
              v2 = (void *)objc_claimAutoreleasedReturnValue();

              if (v2 && objc_msgSend(v2, "_visibleSubstrokeCountInDrawing:", v4) >= 1)
              {
                v44[0] = MEMORY[0x1E0C809B0];
                v44[1] = 3221225472;
                v44[2] = __73__PKSelectionController_updateCurrentSelectionWithNewDrawingIfNecessary___block_invoke;
                v44[3] = &unk_1E777A5D8;
                v45 = v11;
                objc_msgSend(v2, "_visitVisibleSubstrokes:inDrawing:", v44, v4);

              }
              objc_msgSend(v11, "removeObject:", v18);

              v15 = 1;
            }
          }
          v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        }
        while (v14);

        if ((v15 & 1) != 0)
        {
          v20 = 0;
          goto LABEL_21;
        }
      }
      else
      {

      }
      objc_msgSend(v4, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v42[15];
      objc_msgSend(v14, "drawing");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:", v18) & 1) != 0)
      {

LABEL_23:
        if (v40)
        {
          -[PKSelectionController _refreshExternalElementsInStrokeSelection:](v42, v42[15]);
          v23 = v42[15];
          v24 = v42[15];
          objc_msgSend(v24, "drawing");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)v42, v23, v25);
          v28 = v27;
          v30 = v29;
          v32 = v31;

          objc_msgSend(v42[18], "setFrame:", v26, v28, v30, v32);
LABEL_34:
          objc_msgSend(v42[18], "setHidden:", v41);

          goto LABEL_35;
        }
        objc_msgSend(v4, "uuid");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = v42[15];
        objc_msgSend(v36, "drawing");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "isEqual:", v38))
        {
          v39 = objc_msgSend(v11, "count") == 0;

          if (v39)
            -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v42, 0, 0);
          goto LABEL_34;
        }

LABEL_33:
        goto LABEL_34;
      }
      v20 = 1;
LABEL_21:
      v21 = objc_msgSend(v11, "count");
      if (v20)
      {
        v22 = v21 == 0;

        if (v22)
          goto LABEL_23;
      }
      else if (!v21)
      {
        goto LABEL_23;
      }
      v33 = os_log_create("com.apple.pencilkit", "Selection");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v33, OS_LOG_TYPE_DEFAULT, "Updated selection based on a drawing change", buf, 2u);
      }

      v34 = objc_msgSend(v42[18], "selectionType");
      v35 = v42[15];
      objc_msgSend(v35, "externalElements");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectStrokes:externalElements:forSelectionType:inDrawing:](v42, v11, v36, v34, v4);
      goto LABEL_33;
    }
  }
LABEL_35:

}

uint64_t __73__PKSelectionController_updateCurrentSelectionWithNewDrawingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "hasSubstrokes") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

- (double)autoscrollForPointIfNecessary:(double)a3
{
  id *v6;
  id WeakRetained;
  void *v8;
  char v9;
  double *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  if (!a1)
    return 0.0;
  v6 = (id *)(a1 + 112);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isScrollEnabled");

  v10 = (double *)MEMORY[0x1E0C9D538];
  v12 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if ((v9 & 1) != 0)
  {
    v13 = objc_loadWeakRetained(v6);
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    if (a3 <= v17 + v21 + -100.0)
    {
      if (a3 < v17 + 100.0)
      {
        v11 = -10.0;
        v12 = 0.0;
      }
    }
    else
    {
      v12 = 0.0;
      v11 = 10.0;
    }
    if (a2 <= v15 + v19 + -100.0)
    {
      v22 = v12 + -10.0;
      v23 = v11 + 0.0;
      if (a2 >= v15 + 100.0)
      {
        v22 = v12;
        v23 = v11;
      }
    }
    else
    {
      v22 = v12 + 10.0;
      v23 = v11 + 0.0;
    }
    v12 = *v10;
    if (*v10 != v22 || v10[1] != v23)
      return -[PKSelectionController _scrollContent:](a1, v22, v23);
  }
  return v12;
}

- (double)_scrollContent:(double)a3
{
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  if (!a1)
    return 0.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "contentOffset");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "_minimumContentOffset");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "_maximumContentOffset");
    v17 = v16;
    v18 = a2 + v8;
    v19 = a3 + v10;
    if (a2 + v8 >= v12)
    {
      if (v18 > v17)
        v18 = v17;
    }
    else
    {
      v18 = v12;
    }
    if (v19 >= v14)
    {
      v14 = a3 + v10;
      if (v19 > v15)
        v14 = v15;
    }
    v20 = v8 - v18;
    if (v8 - v18 != *MEMORY[0x1E0C9D538] || v10 - v14 != *(double *)(MEMORY[0x1E0C9D538] + 8))
      objc_msgSend(v6, "setContentOffset:animated:", 0);
  }
  else
  {
    if (v6 && -[PKSelectionController _scrollContent:]::onceToken != -1)
      dispatch_once(&-[PKSelectionController _scrollContent:]::onceToken, &__block_literal_global_41);
    v20 = *MEMORY[0x1E0C9D538];
  }

  return v20;
}

void __40__PKSelectionController__scrollContent___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_fault_impl(&dword_1BE213000, v0, OS_LOG_TYPE_FAULT, "UIScrollView IPI must have changed.", v1, 2u);
  }

}

- (void)_willBeginInsertSpaceInAttachment:(id *)a1
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attachmentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectionInteraction:willBeginInsertSpaceInAttachment:", v8, v9);

    }
  }

}

- (void)_didMoveInsertSpace:(double)a3 inAttachment:
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attachmentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectionInteraction:insertSpaceDidMove:inAttachment:", v10, v11, a3);

    }
  }

}

- (void)_didEndInsertSpaceInAttachment:(id *)a1
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attachmentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "selectionInteraction:didEndInsertSpaceInAttachment:", v8, v9);

    }
  }

}

- (BOOL)_hasExternalElementsSelectedInAttachment:(uint64_t)a1
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  if (a1)
  {
    -[PKSelectionController _selectedExternalElementsInAttachment:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_hasStrokesOrExternalElementsSelectedInAttachment:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 120);
    if (v4)
      a1 = 1;
    else
      a1 = -[PKSelectionController _hasExternalElementsSelectedInAttachment:](a1, v3);

  }
  return a1;
}

- (id)_externalElementsAtLocation:(double)a3 inAttachment:(double)a4
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  v8 = v7;
  if (a1)
  {
    objc_msgSend(v7, "attachmentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _externalElementsInRect:inAttachment:](a1, v9, a3, a4, 1.0, 1.0);
    a1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

- (id)_externalElementsInRect:(double)a3 inAttachment:(double)a4
{
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v11 = a2;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "attachmentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectionInteraction:requestElementsInRect:inAttachment:", v17, v18, a3, a4, a5, a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKSelectionController _externalElementsForIDs:inAttachment:](a1, v19, v11);
      a1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_IDsFromExternalElements:(void *)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "identifier", (_QWORD)v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "addObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
  return a1;
}

- (void)_didTapElement:(void *)a3 withGesture:(void *)a4 inAttachment:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "attachmentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectionInteraction:didTapElement:withGesture:inAttachment:", v14, v15, v7, v16);

    }
  }

}

- (id)_didLongPressElement:(void *)a3 withGesture:(void *)a4 inAttachment:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attachmentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (id *)objc_msgSend(v14, "selectionInteraction:didLongPressElement:withGesture:inAttachment:", v15, v16, v8, v17);

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_selectedExternalElementsContainsPoint:(double)a3 inAttachment:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attachmentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (id *)objc_msgSend(v12, "selectionInteraction:selectionContainsPoint:inAttachment:", v13, v14, a3, a4);

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (uint64_t)_selectionInteractionCanPerformAction:(void *)a3 withSender:(void *)a4 inAttachment:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  if (a1
    && (-[PKSelectionController selectionInteraction](a1),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    -[PKSelectionController selectionInteraction](a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController selectionInteraction](a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachmentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "selectionInteraction:canPerformAction:withSender:inAttachment:", v14, a2, v7, v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_itemProviderForExternalElements:(void *)a3 inAttachment:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(v6, "attachmentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSelectionController _pasteboardRepresentationsForExternalElements:inAttachment:](a1, v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v14, "valueForKey:", CFSTR("com.apple.paper"), (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (!v16)
          {
            v18 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v14, "valueForKey:", CFSTR("com.apple.paper"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "URLWithDataRepresentation:relativeToURL:", v19, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v20);
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_12:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_dragInteractionWillBeginForExternalElements:(void *)a3 inAttachment:
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[PKSelectionController _IDsFromExternalElements:](a1, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachmentView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectionInteraction:dragInteractionWillBeginForElements:inAttachment:", v12, v9, v13);

    }
  }

}

- (void)_dragInteractionWillEndForExternalElements:(uint64_t)a3 withOperation:(void *)a4 inAttachment:
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a4;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[PKSelectionController _IDsFromExternalElements:](a1, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attachmentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "selectionInteraction:dragInteractionWillEndForElements:withOperation:inAttachment:", v14, v11, a3, v15);

    }
  }

}

- (uint64_t)_externalElements:(void *)a3 locationOutOfBounds:(double)a4 inAttachment:(double)a5
{
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v19;

  v9 = a2;
  v10 = a3;
  if (a1)
  {
    if (objc_msgSend(v9, "count"))
    {
      v11 = *(id *)(a1 + 144);
      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 144), "bounds");
        v13 = v12;
        v15 = v14;
      }
      else
      {
        v13 = 120.0;
        v15 = 120.0;
      }

      -[PKSelectionController _drawingForSelectionRect:](a1, a4, a5, v13, v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v19 = 0;
        -[PKSelectionController closestPointForPastedSelectionRect:withDrawing:](a1, &v19, a4, a5, v13, v15);
        v16 = v19;
      }
      objc_msgSend(v10, "drawing");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      a1 = v16 != v17;

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_resetExternalElements:(void *)a3 inAttachment:
{
  id v5;
  id v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v8.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v8.c = v7;
    *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    CGAffineTransformTranslate(&v9, &v8, 0.0, 0.0);
    -[PKSelectionController _didDragExternalElements:withTransform:inAttachment:](a1, v5, &v9, v6);
    -[PKSelectionController _didEndDraggingExternalElements:inAttachment:](a1, v5, v6);
  }

}

- (void)_didResizeExternalElements
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a1[15], "externalElements");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (v3)
    {
      -[PKSelectionController _refreshExternalElementsInStrokeSelection:](a1, a1[15]);
      v4 = a1[15];
      v5 = a1[15];
      objc_msgSend(v5, "drawing");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[18], "setFrame:", -[PKSelectionController calculateFrameForSelectionView:inDrawing:]((uint64_t)a1, v4, v6));

      -[PKSelectionController setImageOnSelectionViewForStrokeSelection:withCompletion:](a1, a1[15], 0);
    }
  }
}

- (id)_contextMenuInteraction:(void *)a3 configurationForExternalElement:(void *)a4 inAttachment:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attachmentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "selectionInteraction:contextMenuInteraction:configurationForElement:inAttachment:", v15, v7, v8, v16);
      a1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_contextMenuInteraction:(void *)a3 previewForHighlightingMenuWithConfiguration:(void *)a4 forExternalElement:(void *)a5 inAttachment:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attachmentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "selectionInteraction:contextMenuInteraction:previewForHighlightingMenuWithConfiguration:forElement:inAttachment:", v18, v9, v10, v11, v19);
      a1 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_contextMenuInteraction:(void *)a3 willDisplayMenuForConfiguration:(void *)a4 animator:(void *)a5 forExternalElement:(void *)a6 inAttachment:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attachmentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectionInteraction:contextMenuInteraction:willDisplayMenuForConfiguration:animator:forElement:inAttachment:", v20, v22, v11, v12, v13, v21);

    }
  }

}

- (void)_contextMenuInteraction:(void *)a3 willEndForConfiguration:(void *)a4 animator:(void *)a5 forExternalElement:(void *)a6 inAttachment:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a1)
  {
    -[PKSelectionController selectionInteraction](a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[PKSelectionController selectionInteraction](a1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKSelectionController selectionInteraction](a1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "attachmentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectionInteraction:contextMenuInteraction:willEndForConfiguration:animator:forElement:inAttachment:", v20, v22, v11, v12, v13, v21);

    }
  }

}

- (uint64_t)_isValidDropPointForStrokes:(double)a3 didInsertNewAttachment:(double)a4
{
  id WeakRetained;
  uint64_t v8;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  v8 = objc_msgSend(WeakRetained, "_isValidDropPointForStrokes:didInsertNewAttachment:", a2, a3, a4);

  return v8;
}

- (uint64_t)_liveDrawingIsAtEndOfDocument
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "liveAttachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAtEndOfDocument");

  return v3;
}

- (id)_attachmentForSelectionRect:(double)a3
{
  id *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  id v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  char v40;
  char v41;
  CGFloat MidX;
  double v43;
  id v44;
  id v45;
  double v47;
  _QWORD rect[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[16];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;
  CGPoint v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v62 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v18 = 0;
    return v18;
  }
  v5 = (id *)(a1 + 112);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  objc_msgSend(WeakRetained, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v9 = objc_loadWeakRetained(v5);
    objc_msgSend(v9, "_visibleAttachments");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v56;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v56 != v12)
            objc_enumerationMutation(v10);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "isExternalAttachment") & 1) != 0)
          {
            v14 = 1;
            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        if (v11)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_13:

    v53 = 0u;
    v54 = 0u;
    memset(&rect[1], 0, 32);
    v15 = objc_loadWeakRetained(v5);
    objc_msgSend(v15, "_visibleAttachments");
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &rect[1], v60, 16);
    if (v17)
    {
      v18 = 0;
      v19 = *(_QWORD *)rect[3];
      v47 = 0.0;
      while (2)
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)rect[3] != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(rect[2] + 8 * j);
          objc_msgSend(v21, "viewRep", *(_QWORD *)&v47);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "bounds");
          rect[0] = v23;
          v25 = v24;
          v27 = v26;
          v29 = v28;

          objc_msgSend(v21, "viewRep");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_loadWeakRetained(v5);
          objc_msgSend(v30, "convertRect:fromView:", v31, a2, a3, a4, a5);
          v33 = v32;
          v35 = v34;
          v37 = v36;
          v39 = v38;

          v40 = objc_msgSend(v21, "isAtEndOfDocument");
          if (v35 > v25)
            v41 = v40;
          else
            v41 = 0;
          if ((v41 & 1) != 0)
          {
LABEL_30:
            v45 = v21;

            v18 = v45;
            goto LABEL_34;
          }
          if (v14)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              continue;
          }
          v64.origin.x = v33;
          v64.origin.y = v35;
          v64.size.width = v37;
          v64.size.height = v39;
          MidX = CGRectGetMidX(v64);
          v65.origin.x = v33;
          v65.origin.y = v35;
          v65.size.width = v37;
          v65.size.height = v39;
          v63.y = CGRectGetMidY(v65);
          *(_QWORD *)&v66.origin.x = rect[0];
          v66.origin.y = v25;
          v66.size.width = v27;
          v66.size.height = v29;
          v63.x = MidX;
          if (CGRectContainsPoint(v66, v63))
            goto LABEL_30;
          *(_QWORD *)&v67.origin.x = rect[0];
          v67.origin.y = v25;
          v67.size.width = v27;
          v67.size.height = v29;
          v69.origin.x = v33;
          v69.origin.y = v35;
          v69.size.width = v37;
          v69.size.height = v39;
          v68 = CGRectIntersection(v67, v69);
          v43 = v68.size.width * v68.size.height;
          if (v68.size.width * v68.size.height > v47)
          {
            v44 = v21;

            v47 = v43;
            v18 = v44;
          }
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &rect[1], v60, 16);
        if (v17)
          continue;
        goto LABEL_34;
      }
    }
  }
  else
  {
    v16 = os_log_create("com.apple.pencilkit", "Selection");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEBUG, "Tiled view has no attachments", buf, 2u);
    }
  }
  v18 = 0;
LABEL_34:

  return v18;
}

- (double)_selectionOffsetForDrawing:(uint64_t)a1
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  double v27;
  double v28;

  v3 = a2;
  if (a1)
  {
    v4 = (id *)(a1 + 112);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "attachmentContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tileContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v7, "tileContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:fromView:", v19, v12, v14, v16, v18);
    v21 = v20;

    v22 = objc_loadWeakRetained(v4);
    objc_msgSend(v22, "canvasZoomScale");
    v24 = v23;

    v25 = objc_loadWeakRetained(v4);
    objc_msgSend(v25, "scrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentOffset");
    v28 = v21 * v24 - v27;

  }
  else
  {
    v28 = 0.0;
  }

  return v28;
}

- (_QWORD)_didAddDrawingAttachmentView
{
  if (result)
  {
    result = (_QWORD *)result[18];
    if (result)
      return (_QWORD *)objc_msgSend(result, "_didAddNewAttachment");
  }
  return result;
}

- (void)copyTranscription:(uint64_t)a1
{
  void *v2;
  id v3;
  BOOL v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  BOOL v9;

  if (a1)
  {
    +[PKSelectionStatisticsManager sharedStatisticsManager](PKSelectionStatisticsManager, "sharedStatisticsManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logSelectionAction:", 7);

    v3 = *(id *)(a1 + 144);
    if (objc_msgSend(v3, "selectionType"))
      v4 = objc_msgSend(*(id *)(a1 + 144), "selectionType") != 6;
    else
      v4 = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__PKSelectionController_copyTranscription___block_invoke;
    v7[3] = &unk_1E777A600;
    v7[4] = a1;
    v8 = v5;
    v9 = v4;
    v6 = v5;
    -[PKSelectionController findTranscriptionWithCompletion:](a1, v7);

  }
}

void __43__PKSelectionController_copyTranscription___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "transcription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSelectionController addTranscriptionToPasteboard:](*(_QWORD **)(a1 + 32), v4);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  +[PKStatisticsManager sharedStatisticsManager]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transcription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordCopyAsTextWithLength:time:didShowHUD:invokedFromSmartSelection:]((uint64_t)v5, objc_msgSend(v6, "length"), objc_msgSend(v7, "didShowHUD"), *(unsigned __int8 *)(a1 + 48));

}

- (void)addTranscriptionToPasteboard:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[PKSelectionController currentPasteboard](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, v6);

    }
    if (objc_msgSend(v5, "count"))
    {
      v8[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setItems:", v7);

    }
  }

}

- (void)findTranscriptionWithCompletion:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    -[PKSelectionController findTranscriptionForType:withCompletion:](a1, 0, v3);

}

- (void)findTranscriptionForType:(void *)a3 withCompletion:
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  PKTranscriptionController *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (a1)
  {
    -[PKSelectionController _currentAttachment]((id *)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      objc_msgSend(v6, "attachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v5)
      {
        objc_msgSend(*(id *)(a1 + 48), "strokeSelection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 120);

        if (v8 == v9)
        {
LABEL_9:
          objc_msgSend(*(id *)(a1 + 48), "findTranscriptionForType:withCompletion:", a2, v16);

          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v5, "recognitionController");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = *(void **)(v10 + 48);
    else
      v12 = 0;
    v13 = v12;

    v14 = -[PKTranscriptionController initWithRecognitionManager:strokeSelection:attachment:]([PKTranscriptionController alloc], "initWithRecognitionManager:strokeSelection:attachment:", v13, *(_QWORD *)(a1 + 120), v5);
    v15 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v14;

    goto LABEL_9;
  }
LABEL_10:

}

- (uint64_t)supportsCopyAsText
{
  uint64_t v1;
  id WeakRetained;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t j;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[128];
  uint64_t v21;

  v1 = a1;
  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    v3 = objc_msgSend(WeakRetained, "supportsCopyAsText");

    if (v3)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      +[PKRecognitionSessionManager enabledLocales](PKRecognitionSessionManager, "enabledLocales");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v5)
      {
        v6 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v16 != v6)
              objc_enumerationMutation(v4);
            if ((objc_msgSend(MEMORY[0x1E0D16830], "isLocaleSupported:withMode:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), 6) & 1) != 0)
            {

              v13 = 0u;
              v14 = 0u;
              v11 = 0u;
              v12 = 0u;
              objc_msgSend(*(id *)(v1 + 120), "strokes", 0);
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              v1 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
              if (v1)
              {
                v8 = *(_QWORD *)v12;
                while (2)
                {
                  for (j = 0; j != v1; ++j)
                  {
                    if (*(_QWORD *)v12 != v8)
                      objc_enumerationMutation(v4);
                    if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * j), "_shapeType"))
                    {
                      v1 = 1;
                      goto LABEL_23;
                    }
                  }
                  v1 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
                  if (v1)
                    continue;
                  break;
                }
              }
              goto LABEL_23;
            }
          }
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
          if (v5)
            continue;
          break;
        }
      }
      v1 = 0;
LABEL_23:

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)supportsRefinement:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(a1[15], "strokes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = 0;
      v7 = *(_QWORD *)v21;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "_isSynthesizedInk");
        if ((objc_msgSend(v9, "_flags") & 0x20000000000) != 0)
          break;
        v6 |= v10 ^ 1;
        if (v5 == ++v8)
        {
          v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v5)
            goto LABEL_4;

          if ((v6 & 1) != 0)
          {
            v18[0] = 0;
            v18[1] = v18;
            v18[2] = 0x3032000000;
            v18[3] = __Block_byref_object_copy__14;
            v18[4] = __Block_byref_object_dispose__14;
            -[PKSelectionController _currentAttachment](a1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "recognitionController");
            v12 = objc_claimAutoreleasedReturnValue();
            v13 = (void *)v12;
            if (v12)
              v14 = *(void **)(v12 + 48);
            else
              v14 = 0;
            v19 = v14;

            v15[0] = MEMORY[0x1E0C809B0];
            v15[1] = 3221225472;
            v15[2] = __44__PKSelectionController_supportsRefinement___block_invoke;
            v15[3] = &unk_1E777A628;
            v17 = v18;
            v16 = v3;
            -[PKSelectionController findTranscriptionForType:withCompletion:]((uint64_t)a1, 2, v15);

            _Block_object_dispose(v18, 8);
            goto LABEL_17;
          }
          goto LABEL_15;
        }
      }
    }

LABEL_15:
    if (v3)
      (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
  }
LABEL_17:

}

void __44__PKSelectionController_supportsRefinement___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;

  objc_msgSend(a2, "transcription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PKRecognitionSessionManager canSynthesizeDrawingForText:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v5);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, _BOOL8))(v4 + 16))(v4, v3);

}

- (uint64_t)refinementEnabled
{
  if (a1 && _os_feature_enabled_impl() && CHGetPersonalizedSynthesisSupportState() >= 2)
    return PKCurrentAppSupportsRefinement();
  else
    return 0;
}

- (void)getAllHandwritingTranscription:(uint64_t)a1
{
  _QWORD v1[5];

  if (a1)
  {
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __56__PKSelectionController_getAllHandwritingTranscription___block_invoke;
    v1[3] = &unk_1E777A650;
    v1[4] = a1;
    -[PKSelectionController findCompleteTranscriptionForNote:](a1, v1);
  }
}

void __56__PKSelectionController_getAllHandwritingTranscription___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "transcription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[PKSelectionController addTranscriptionToPasteboard:](*(_QWORD **)(a1 + 32), v4);
}

- (void)findCompleteTranscriptionForNote:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PKTranscriptionController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(WeakRetained, "visibleAttachments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      objc_msgSend(v6, "attachment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v5)
      {
        objc_msgSend(*(id *)(a1 + 48), "strokeSelection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
LABEL_7:
          objc_msgSend(*(id *)(a1 + 48), "findCompleteTranscriptionForNote:", v13);

          goto LABEL_8;
        }
      }
      else
      {

      }
    }
    v9 = [PKTranscriptionController alloc];
    objc_msgSend(v5, "recognitionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PKTranscriptionController initWithRecognitionManager:strokeSelection:attachment:](v9, "initWithRecognitionManager:strokeSelection:attachment:", v10, 0, v5);
    v12 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v11;

    goto LABEL_7;
  }
LABEL_8:

}

- (void)translate:(uint64_t)a1
{
  id v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  if (a1)
  {
    v2 = *(id *)(a1 + 120);
    objc_msgSend(v2, "drawing");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_attachmentForUUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __35__PKSelectionController_translate___block_invoke;
    v8[3] = &unk_1E777A678;
    v9 = v6;
    v10 = a1;
    v7 = v6;
    -[PKSelectionController findTranscriptionForType:withCompletion:](a1, 1, v8);

  }
}

void __35__PKSelectionController_translate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a2, "transcription");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc((Class)getLTUITranslationViewControllerClass()), "initWithNibName:bundle:", 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v12);
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(v3, "setModalPresentationStyle:", 7);
  if (objc_msgSend(*(id *)(a1 + 32), "isExternalAttachment"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "translationDidFinishedInViewController:", v3);
  }
  else
  {
    v5 = *(_QWORD **)(a1 + 40);
    if (v5)
      v5 = (_QWORD *)v5[18];
    v6 = v5;
    objc_msgSend(v3, "popoverPresentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourceView:", v6);

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      v9 = *(void **)(v8 + 144);
    else
      v9 = 0;
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v3, 1, 0);

  }
}

- (void)straighten:(uint64_t)a1
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 120), "drawing");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(*(id *)(a1 + 120), "strokes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "straighten:strokes:drawing:", v7, v6, v3);

  }
}

- (void)refine:(uint64_t)a1
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 120), "drawing");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(*(id *)(a1 + 120), "strokes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "refine:strokes:drawing:", v7, v6, v3);

  }
}

- (void)_share:(uint64_t)a1
{
  id v3;
  void (**v4)(_QWORD);
  _QWORD aBlock[5];

  v3 = a2;
  if (a1 && *(_QWORD *)(a1 + 144))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__PKSelectionController__share___block_invoke;
    aBlock[3] = &unk_1E7776F38;
    aBlock[4] = a1;
    v4 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v4[2](v4);
    else
      dispatch_sync(MEMORY[0x1E0C80D38], v4);

  }
}

void __32__PKSelectionController__share___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CEA2D8]);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
    v3 = (_QWORD *)v3[15];
  v4 = v3;
  objc_msgSend(v4, "strokeImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combinedImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithActivityItems:applicationActivities:", v7, 0);

  v9 = *(_QWORD **)(a1 + 32);
  if (v9)
    v9 = (_QWORD *)v9[18];
  v10 = v9;
  objc_msgSend(v8, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceView:", v10);

  objc_msgSend(v8, "setModalTransitionStyle:", 0);
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    v13 = *(void **)(v12 + 144);
  else
    v13 = 0;
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rootViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", v8, 1, 0);

}

- (id)editMenuActionsForConfiguration:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  id location;
  _QWORD v70[5];
  id v71;
  _QWORD v72[5];
  id v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  id v79;
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[6];

  v88[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v54 = v3;
  if (!a1)
  {
    v41 = 0;
    goto LABEL_25;
  }
  v4 = v3;
  _PencilKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Cut"), CFSTR("Cut"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_2;
  v86[3] = &unk_1E7777AE0;
  v86[4] = a1;
  v8 = v4;
  v87 = v8;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v8, v6, (uint64_t)CFSTR("scissors"), v86);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Copy"), CFSTR("Copy"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v7;
  v84[1] = 3221225472;
  v84[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_3;
  v84[3] = &unk_1E7777AE0;
  v84[4] = a1;
  v11 = v8;
  v85 = v11;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v11, v10, (uint64_t)CFSTR("doc.on.doc"), v84);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Delete"), CFSTR("Delete"), CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v7;
  v82[1] = 3221225472;
  v82[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_4;
  v82[3] = &unk_1E7777AE0;
  v82[4] = a1;
  v14 = v11;
  v83 = v14;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v14, v13, (uint64_t)CFSTR("trash"), v82);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Create Image"), CFSTR("Create Image"), CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v7;
  v80[1] = 3221225472;
  v80[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_5;
  v80[3] = &unk_1E7777AE0;
  v80[4] = a1;
  v17 = v14;
  v81 = v17;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v17, v16, 0, v80);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Duplicate"), CFSTR("Duplicate"), CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v7;
  v78[1] = 3221225472;
  v78[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_6;
  v78[3] = &unk_1E7777AE0;
  v78[4] = a1;
  v20 = v17;
  v79 = v20;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v20, v19, (uint64_t)CFSTR("doc.on.doc"), v78);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Copy as Text"), CFSTR("Copy as Text"), CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v7;
  v76[1] = 3221225472;
  v76[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_7;
  v76[3] = &unk_1E7777AE0;
  v76[4] = a1;
  v23 = v20;
  v77 = v23;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v23, v22, (uint64_t)CFSTR("textformat"), v76);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Insert Space Above"), CFSTR("Insert Space Above"), CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v7;
  v74[1] = 3221225472;
  v74[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_8;
  v74[3] = &unk_1E7777AE0;
  v74[4] = a1;
  v26 = v23;
  v75 = v26;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v26, v25, (uint64_t)CFSTR("rectangle.expand.vertical"), v74);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Translate"), CFSTR("Translate"), CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v7;
  v72[1] = 3221225472;
  v72[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_9;
  v72[3] = &unk_1E7777AE0;
  v72[4] = a1;
  v29 = v26;
  v73 = v29;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v29, v28, (uint64_t)CFSTR("character.bubble"), v72);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Straighten"), CFSTR("Straighten"), CFSTR("Localizable"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v7;
  v70[1] = 3221225472;
  v70[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_10;
  v70[3] = &unk_1E7777AE0;
  v70[4] = a1;
  v32 = v29;
  v71 = v32;
  __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke((uint64_t)v32, v31, (uint64_t)CFSTR("wrench"), v70);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, (id)a1);
  v33 = (void *)MEMORY[0x1E0DC36F8];
  v65[0] = v7;
  v65[1] = 3221225472;
  v65[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_11;
  v65[3] = &unk_1E777A6E8;
  objc_copyWeak(&v68, &location);
  v67 = &__block_literal_global_156_0;
  v65[4] = a1;
  v66 = v32;
  objc_msgSend(v33, "elementWithUncachedProvider:", v65);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[PKSelectionController supportsCopyAsText](a1);
  v35 = objc_msgSend(getLTUITranslationViewControllerClass(), "isAvailable");
  objc_msgSend(*(id *)(a1 + 120), "externalElements");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  objc_msgSend(*(id *)(a1 + 120), "strokes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v38, "count");

  v39 = (void *)MEMORY[0x1E0C99DE8];
  v88[0] = v64;
  v88[1] = v63;
  v88[2] = v62;
  v88[3] = v61;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "arrayWithArray:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl() && !PKIsDeviceLocked())
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bundleIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

    if ((v44 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bundleIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if ((os_variant_has_internal_diagnostics() & 1) != 0)
    {
      if ((objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.TestApp")) & 1) != 0
        || (objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.ZoomTestApp")) & 1) != 0
        || (objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.PaperKitTestApp")) & 1) != 0)
      {

      }
      else
      {
        v52 = objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.pencilkit.MultiDrawingCanvasTestApp"));

        if (!v52)
          goto LABEL_12;
      }
LABEL_5:
      +[PKGenerationModelAvailabilityController sharedInstance](PKGenerationModelAvailabilityController, "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isGenerationModelAvailable");
      if (v53)
        v47 = v46;
      else
        v47 = 0;

      if (v47)
        objc_msgSend(v41, "addObject:", v55);
      goto LABEL_12;
    }

  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 144), "shapeMenuActions");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObjectsFromArray:", v50);

  if (-[PKSelectionController refinementEnabled](a1))
    objc_msgSend(v41, "addObject:", v58);
  if (v34 && !v37)
    objc_msgSend(v41, "addObject:", v59);
  if (*(_BYTE *)(a1 + 106))
    objc_msgSend(v41, "addObject:", v60);
  if ((v34 & v35) == 1 && !v37)
    objc_msgSend(v41, "addObject:", v57);
  if (v34)
    objc_msgSend(v41, "addObject:", v56);

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);

LABEL_25:
  return v41;
}

id __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a2;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v6, v9, 0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_2(uint64_t a1)
{
  -[PKSelectionController cut:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_3(uint64_t a1)
{
  -[PKSelectionController copy:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_4(uint64_t a1)
{
  -[PKSelectionController delete:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_5(uint64_t a1)
{
  id *v1;
  id v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id *v35;
  void *v36;
  id *v37;
  id v38;
  id location;

  v1 = *(id **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    +[PKGenerationModelAvailabilityController sharedInstance](PKGenerationModelAvailabilityController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[18], "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "presentGreymatterAvailabilityAlertControllerInWindow:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = objc_initWeak(&location, v1);
      -[PKSelectionController selectionInteraction](v1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        WeakRetained = objc_loadWeakRetained(v1 + 14);
        v38 = v2;
        objc_msgSend(v1[15], "drawing");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_attachmentForUUID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = (id *)objc_loadWeakRetained(&location);
        -[PKSelectionController selectionInteraction](v37);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (id *)objc_loadWeakRetained(&location);
        -[PKSelectionController selectionInteraction](v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_loadWeakRetained(&location);
        v17 = v16;
        if (v16)
          v18 = (void *)*((_QWORD *)v16 + 15);
        else
          v18 = 0;
        v19 = v18;
        objc_msgSend(v19, "strokes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_loadWeakRetained(&location);
        v23 = v22;
        if (v22)
          v24 = (void *)*((_QWORD *)v22 + 18);
        else
          v24 = 0;
        v25 = v24;
        objc_msgSend(v25, "frame");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        objc_msgSend(v13, "attachmentView");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "selectionInteraction:handleGenerationToolForSelectedStrokes:inBounds:inAttachment:", v15, v21, v34, v27, v29, v31, v33);

        v2 = v38;
      }
      objc_destroyWeak(&location);
    }
  }

}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_6(uint64_t a1)
{
  -[PKSelectionController duplicate:](*(id **)(a1 + 32));
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_7(uint64_t a1)
{
  -[PKSelectionController copyTranscription:](*(_QWORD *)(a1 + 32));
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_8(uint64_t a1)
{
  -[PKSelectionController insertSpace:](*(id **)(a1 + 32), *(void **)(a1 + 40));
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_9(uint64_t a1)
{
  -[PKSelectionController translate:](*(_QWORD *)(a1 + 32));
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_10(uint64_t a1)
{
  -[PKSelectionController straighten:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_12;
  v9[3] = &unk_1E777A6C0;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v11 = v5;
  v9[4] = v6;
  v10 = v7;
  v12 = v3;
  v8 = v3;
  -[PKSelectionController supportsRefinement:](WeakRetained, v9);

}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_12(_QWORD *a1, int a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  id v17;

  v4 = (void *)objc_opt_new();
  if (a2)
  {
    v5 = a1[6];
    _PencilKitBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Refine"), CFSTR("Refine"), CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_13;
    v15 = &unk_1E7777AE0;
    v8 = (void *)a1[5];
    v16 = a1[4];
    v17 = v8;
    (*(void (**)(uint64_t, void *, const __CFString *, uint64_t *))(v5 + 16))(v5, v7, CFSTR("wrench"), &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9, v12, v13, v14, v15, v16);

  }
  v10 = a1[7];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

}

void __57__PKSelectionController_editMenuActionsForConfiguration___block_invoke_13(uint64_t a1)
{
  -[PKSelectionController refine:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (double)editMenuTargetRect
{
  double result;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 144), "editMenuTargetRect");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__retainedFirstResponder, 0);
  objc_storeStrong((id *)&self->_selectionGestureView, 0);
  objc_storeStrong((id *)&self->_selectionView, 0);
  objc_storeStrong((id *)&self->_spaceInsertionController, 0);
  objc_storeStrong((id *)&self->_currentPasteboard, 0);
  objc_storeStrong((id *)&self->_currentStrokeSelection, 0);
  objc_destroyWeak((id *)&self->_tiledView);
  objc_storeStrong(&self->_deferredChangingColorBlock, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong(&self->_intersectStrokesBetweenLollipopBlock, 0);
  objc_storeStrong((id *)&self->_selectionHullQueue, 0);
  objc_storeStrong((id *)&self->_intersectionQueue, 0);
  objc_storeStrong((id *)&self->_transcriptionController, 0);
  objc_storeStrong((id *)&self->_previousDrawingUUIDForSelection, 0);
}

@end
