@implementation PKSmartSelectionController

- (PKSmartSelectionController)initWithDelegate:(id)a3 canvasView:(id)a4 drawing:(id)a5 gestureRecognizer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKSmartSelectionController *v14;
  PKSmartSelectionController *v15;
  uint64_t v16;
  PKTiledView *tiledView;
  PKRecognitionController *v18;
  void *v19;
  uint64_t v20;
  PKRecognitionController *recognitionController;
  PKRecognitionController *v22;
  PKRecognitionSessionManager *sessionManager;
  PKRecognitionSessionManager *v24;
  void *v25;
  id *v26;
  PKSelectionController *selectionController;
  void *v28;
  uint64_t v29;
  NSMutableDictionary *uuidToStrokeSpatialCacheDict;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKSmartSelectionController;
  v14 = -[PKSmartSelectionController init](&v32, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_msgSend(v11, "_tiledView");
    v16 = objc_claimAutoreleasedReturnValue();
    tiledView = v15->_tiledView;
    v15->_tiledView = (PKTiledView *)v16;

    v18 = [PKRecognitionController alloc];
    objc_msgSend(v12, "strokes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[PKRecognitionController initWithDrawing:visibleOnscreenStrokes:](v18, "initWithDrawing:visibleOnscreenStrokes:", v12, v19);
    recognitionController = v15->_recognitionController;
    v15->_recognitionController = (PKRecognitionController *)v20;

    v22 = v15->_recognitionController;
    if (v22)
      sessionManager = v22->_sessionManager;
    else
      sessionManager = 0;
    objc_storeStrong((id *)&v15->_sessionManager, sessionManager);
    v24 = v15->_sessionManager;
    objc_msgSend(v12, "uuid");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKRecognitionSessionCache addRecognitionSession:forUUID:]((uint64_t)PKRecognitionSessionCache, v24, v25);

    v26 = -[PKSelectionController initWithTiledView:]((id *)[PKSelectionController alloc], v15->_tiledView);
    selectionController = v15->_selectionController;
    v15->_selectionController = (PKSelectionController *)v26;

    -[PKSelectionController selectionInteraction]((id *)&v15->_selectionController->super.isa);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDelegate:", v15);

    objc_storeStrong((id *)&v15->_gestureRecognizer, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    uuidToStrokeSpatialCacheDict = v15->_uuidToStrokeSpatialCacheDict;
    v15->_uuidToStrokeSpatialCacheDict = (NSMutableDictionary *)v29;

  }
  return v15;
}

- (void)dealloc
{
  PKSelectionController *selectionController;
  PKRecognitionController *recognitionController;
  PKRecognitionSessionManager *sessionManager;
  PKAttachment *currentAttachment;
  objc_super v7;

  selectionController = self->_selectionController;
  self->_selectionController = 0;

  recognitionController = self->_recognitionController;
  self->_recognitionController = 0;

  sessionManager = self->_sessionManager;
  self->_sessionManager = 0;

  currentAttachment = self->_currentAttachment;
  self->_currentAttachment = 0;

  v7.receiver = self;
  v7.super_class = (Class)PKSmartSelectionController;
  -[PKSmartSelectionController dealloc](&v7, sel_dealloc);
}

- (PKDrawing)currentDrawing
{
  return -[PKRecognitionController drawing](self->_recognitionController, "drawing");
}

- (NSArray)currentSelectedStrokes
{
  PKSelectionController *selectionController;
  PKStrokeSelection *v3;
  PKStrokeSelection *v4;
  void *v5;
  void *v6;

  selectionController = self->_selectionController;
  if (!selectionController)
  {
    v4 = 0;
    goto LABEL_5;
  }
  v3 = selectionController->_currentStrokeSelection;
  v4 = v3;
  if (!v3)
  {
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  -[PKStrokeSelection strokes](v3, "strokes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return (NSArray *)v6;
}

- (int64_t)currentSelectionType
{
  PKSelectionController *selectionController;
  PKSelectionController *v3;
  int64_t v4;

  selectionController = self->_selectionController;
  if (selectionController)
    selectionController = (PKSelectionController *)selectionController->_selectionView;
  v3 = selectionController;
  v4 = -[PKSelectionController selectionType](v3, "selectionType");

  return v4;
}

- (PKAttachment)currentAttachment
{
  return self->_currentAttachment;
}

- (UIView)selectionView
{
  PKSelectionController *selectionController;

  selectionController = self->_selectionController;
  if (selectionController)
    return &selectionController->_selectionView->super.super;
  else
    return 0;
}

- (id)interaction
{
  return -[PKSelectionController selectionInteraction]((id *)&self->_selectionController->super.isa);
}

- (PKRecognitionController)recognitionController
{
  return self->_recognitionController;
}

- (void)setExternalAttachment:(id)a3
{
  id v4;
  void *v5;
  PKAttachment *currentAttachment;
  id v7;
  PKStrokeSpatialCache *v8;
  PKStrokeSpatialCache *v9;
  NSMutableDictionary *uuidToStrokeSpatialCacheDict;
  void *v11;
  PKTiledView *tiledView;
  void *v13;
  PKTiledView *v14;
  void *v15;
  PKTiledView *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "drawing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentAttachment = self->_currentAttachment;
  self->_currentAttachment = (PKAttachment *)v4;
  v7 = v4;

  v8 = objc_alloc_init(PKStrokeSpatialCache);
  v9 = v8;
  if (v8)
    objc_storeWeak((id *)&v8->_delegate, self);
  uuidToStrokeSpatialCacheDict = self->_uuidToStrokeSpatialCacheDict;
  objc_msgSend(v5, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](uuidToStrokeSpatialCacheDict, "setObject:forKey:", v9, v11);

  tiledView = self->_tiledView;
  v19[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _setExternalAttachments:](tiledView, "_setExternalAttachments:", v13);

  v14 = self->_tiledView;
  -[PKTiledView canvasView](v14, "canvasView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView canvasView:drawingDidChange:](v14, "canvasView:drawingDidChange:", v15, v5);

  v16 = self->_tiledView;
  v18 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTiledView _selectionRefreshWithChangeToDrawings:completion:](v16, "_selectionRefreshWithChangeToDrawings:completion:", v17, &__block_literal_global_74);

}

- (id)strokeSpatialCacheForAttachment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "drawing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_uuidToStrokeSpatialCacheDict, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidateCacheForBounds:(CGRect)a3 inDrawing:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSMutableDictionary *uuidToStrokeSpatialCacheDict;
  id v9;
  void *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  uuidToStrokeSpatialCacheDict = self->_uuidToStrokeSpatialCacheDict;
  v9 = a4;
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](uuidToStrokeSpatialCacheDict, "objectForKey:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[PKStrokeSpatialCache _invalidateCacheForBounds:inDrawing:force:]((uint64_t)v11, v9, 1, x, y, width, height);
}

- (void)handleDoubleTapInputAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKSelectionController *selectionController;
  PKSelectionController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  y = a3.y;
  x = a3.x;
  -[PKSelectionController _drawingForSelectionRect:]((uint64_t)self->_selectionController, a3.x + -22.0, a3.y + -22.0, 44.0, 44.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSmartSelectionController interaction](self, "interaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentDrawing:", v6);

  if (-[UIGestureRecognizer state](self->_gestureRecognizer, "state") == UIGestureRecognizerStateEnded)
  {
    +[PKSelectionInput inputWithType:location:inputType:](PKSelectionInput, "inputWithType:location:inputType:", -[PKSmartSelectionController selectionTypeForTapCount:](self, "selectionTypeForTapCount:", 2), 1, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSmartSelectionController interaction](self, "interaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    selectionController = self->_selectionController;
    if (selectionController)
      selectionController = (PKSelectionController *)selectionController->_currentStrokeSelection;
    v11 = selectionController;
    -[PKSelectionController strokes](v11, "strokes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_updateProgressiveTapSelectionWithSelectionInput:existingSelection:", v8, v13);

    -[PKSmartSelectionController interaction](self, "interaction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_cancelDeferredPasteFromTappingAction");

    -[PKSmartSelectionController interaction](self, "interaction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "performSelector:withObject:afterDelay:", sel__selectViaContinuousTapWithInput_, v8, 0.35);

  }
  -[PKSmartSelectionController updateGestureHistoryWithLocation:gesture:](self, "updateGestureHistoryWithLocation:gesture:", self->_gestureRecognizer, x, y);
}

- (void)handleDoubleTapInputAtPoint:(CGPoint)a3 inSelectionView:(id)a4
{
  double y;
  double x;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  v7 = objc_opt_class();
  PKDynamicCast(v7, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_handleDoubleTapInputAtPoint:", x, y);
    v8 = v9;
  }

}

- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7
{
  -[PKRecognitionSessionManager fetchIntersectedStrokesAtPoint:selectionType:inputType:visibleOnscreenStrokes:completion:]((uint64_t)self->_sessionManager, a4, a5, a6, a7, a3.x, a3.y);
}

- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6
{
  -[PKRecognitionSessionManager fetchIntersectedStrokesBetweenTopPoint:bottomPoint:liveScrollOffset:isRTL:completion:](&self->_sessionManager->super.isa, 0, a6, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y);
}

- (int64_t)contentTypeForIntersectedStrokes:(id)a3
{
  return -[PKRecognitionSessionManager contentTypeForIntersectedStrokes:]((uint64_t)self->_sessionManager, a3);
}

- (id)firstStrokesInSelectedStrokes:(id)a3 isRTL:(BOOL)a4
{
  return -[PKRecognitionSessionManager _firstStrokesInSelectedStrokes:isRTL:](self->_sessionManager, a3, a4);
}

- (id)lastStrokesInSelectedStrokes:(id)a3 isRTL:(BOOL)a4
{
  return -[PKRecognitionSessionManager _lastStrokesInSelectedStrokes:isRTL:](self->_sessionManager, a3, a4);
}

- (void)straighten:(id)a3 completion:(id)a4
{
  PKSelectionController *selectionController;
  id v6;
  PKStrokeSelection *currentStrokeSelection;
  PKStrokeSelection *v8;
  PKSelectionController *v9;
  id WeakRetained;
  void *v11;
  id v12;

  selectionController = self->_selectionController;
  v6 = a4;
  if (selectionController)
    currentStrokeSelection = selectionController->_currentStrokeSelection;
  else
    currentStrokeSelection = 0;
  v8 = currentStrokeSelection;
  -[PKStrokeSelection drawing](v8, "drawing");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v9 = self->_selectionController;
  if (v9)
    WeakRetained = objc_loadWeakRetained((id *)&v9->_tiledView);
  else
    WeakRetained = 0;
  -[PKSmartSelectionController currentSelectedStrokes](self, "currentSelectedStrokes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_straightenStrokes:drawing:completionBlock:", v11, v12, v6);

}

- (BOOL)canCopyAsText
{
  return -[PKSelectionController supportsCopyAsText]((uint64_t)self->_selectionController);
}

- (void)copyAsText:(id)a3
{
  -[PKSelectionController copyTranscription:]((uint64_t)self->_selectionController);
}

- (BOOL)canTranslate
{
  if (self->_selectionController)
    return objc_msgSend(getLTUITranslationViewControllerClass(), "isAvailable");
  else
    return 0;
}

- (void)translate:(id)a3
{
  -[PKSelectionController translate:]((uint64_t)self->_selectionController);
}

- (void)selectStrokes:(id)a3 forSelectionType:(int64_t)a4 inDrawing:(id)a5
{
  void *v8;
  id v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0C99E40];
  v9 = a5;
  objc_msgSend(v8, "orderedSetWithArray:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController selectStrokes:forSelectionType:inDrawing:]((id *)&self->_selectionController->super.isa, v10, a4, v9);

}

- (void)selectStrokesWithoutDidSelectStrokesUpdate:(id)a3 inDrawing:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C99E40];
  v7 = a4;
  objc_msgSend(v6, "orderedSetWithArray:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKSelectionController _selectStrokesWithoutDidSelectStrokesUpdate:inDrawing:]((uint64_t)self->_selectionController, v8, v7);

}

- (void)clearSelectionIfNecessaryWithCompletion:(id)a3
{
  PKSelectionController *selectionController;
  PKSelectionView *selectionView;
  PKSelectionView *v6;
  id v7;

  selectionController = self->_selectionController;
  v7 = a3;
  if (selectionController)
    selectionView = selectionController->_selectionView;
  else
    selectionView = 0;
  v6 = selectionView;
  -[PKSelectionView removeFromSuperview](v6, "removeFromSuperview");

  -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)self->_selectionController, v7);
}

- (void)installSelectionViewForCurrentSelection
{
  -[PKSelectionController _installSelectionViewForCurrentSelectionFromExternalAttachments]((id *)&self->_selectionController->super.isa);
}

- (int64_t)selectionTypeForTapCount:(int64_t)a3
{
  uint64_t v3;

  v3 = 2;
  if (a3 > 2)
    v3 = a3;
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

- (void)updateGestureHistoryWithLocation:(CGPoint)a3 gesture:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;

  y = a3.y;
  x = a3.x;
  -[UIGestureRecognizer lastTouchTimestamp](self->_gestureRecognizer, "lastTouchTimestamp", a4);
  self->_lastTapLocation.y = y;
  self->_lastTapTimestamp = v7;
  self->_lastTapLocation.x = x;
}

- (void)selectionInteraction:(id)a3 didSelectStrokes:(id)a4 selectionType:(int64_t)a5 inAttachment:(id)a6
{
  id v9;
  id WeakRetained;
  id v11;

  v9 = a4;
  PKProtocolCast(&unk_1EF58B460, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didSelectStrokes:selectionType:inAttachment:", v9, a5, v11);

}

- (void)didFinishCalculatingVisibleOnscreenStrokes:(id)a3 drawing:(id)a4
{
  id v6;
  uint64_t v7;
  PKRecognitionController *recognitionController;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(v9, "count");
  recognitionController = self->_recognitionController;
  if (v7)
    -[PKRecognitionController setDrawing:withVisibleOnscreenStrokes:](recognitionController, "setDrawing:withVisibleOnscreenStrokes:", v6, v9);
  else
    -[PKRecognitionController setDrawing:](recognitionController, "setDrawing:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_recognitionController, 0);
  objc_storeStrong((id *)&self->_selectionController, 0);
  objc_storeStrong((id *)&self->_uuidToStrokeSpatialCacheDict, 0);
  objc_storeStrong((id *)&self->_currentAttachment, 0);
  objc_storeStrong((id *)&self->_tiledView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
