@implementation PKAttachmentView

- (PKAttachmentView)initWithFrame:(CGRect)a3 drawing:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PKAttachmentView *v11;
  uint64_t v12;
  NSUUID *listenerID;
  id v14;
  uint64_t v15;
  UIView *tileContainerView;
  id v17;
  uint64_t v18;
  UIView *proofreadingContainerView;
  NSMutableDictionary *v20;
  NSMutableDictionary *tiles;
  NSMutableDictionary *v22;
  NSMutableDictionary *offscreenTiles;
  NSMutableDictionary *v24;
  NSMutableDictionary *purgedTiles;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  PKStrokeSpatialCache *v30;
  PKStrokeSpatialCache *strokeSpatialCache;
  PKStrokeSpatialCache *v32;
  objc_super v34;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PKAttachmentView;
  v11 = -[PKAttachmentView initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = objc_claimAutoreleasedReturnValue();
    listenerID = v11->_listenerID;
    v11->_listenerID = (NSUUID *)v12;

    v14 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PKAttachmentView bounds](v11, "bounds");
    v15 = objc_msgSend(v14, "initWithFrame:");
    tileContainerView = v11->_tileContainerView;
    v11->_tileContainerView = (UIView *)v15;

    -[UIView setUserInteractionEnabled:](v11->_tileContainerView, "setUserInteractionEnabled:", 0);
    -[PKAttachmentView addSubview:](v11, "addSubview:", v11->_tileContainerView);
    v17 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PKAttachmentView bounds](v11, "bounds");
    v18 = objc_msgSend(v17, "initWithFrame:");
    proofreadingContainerView = v11->_proofreadingContainerView;
    v11->_proofreadingContainerView = (UIView *)v18;

    -[UIView setUserInteractionEnabled:](v11->_proofreadingContainerView, "setUserInteractionEnabled:", 0);
    -[PKAttachmentView addSubview:](v11, "addSubview:", v11->_proofreadingContainerView);
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tiles = v11->_tiles;
    v11->_tiles = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    offscreenTiles = v11->_offscreenTiles;
    v11->_offscreenTiles = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    purgedTiles = v11->_purgedTiles;
    v11->_purgedTiles = v24;

    objc_storeStrong((id *)&v11->_drawing, a4);
    if (+[PKTiledView showDebugOutlines](PKTiledView, "showDebugOutlines"))
    {
      -[PKAttachmentView layer](v11, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBorderWidth:", 1.0);

      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = objc_msgSend(v27, "CGColor");
      -[PKAttachmentView layer](v11, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setBorderColor:", v28);

    }
    v30 = objc_alloc_init(PKStrokeSpatialCache);
    strokeSpatialCache = v11->_strokeSpatialCache;
    v11->_strokeSpatialCache = v30;

    v32 = v11->_strokeSpatialCache;
    if (v32)
      objc_storeWeak((id *)&v32->_delegate, v11);
    -[PKAttachmentView _initializeRecognitionForDrawingIfNecessary:](v11, "_initializeRecognitionForDrawingIfNecessary:", v11->_drawing);
  }

  return v11;
}

- (PKAttachmentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PKDrawing *v8;
  PKAttachmentView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(PKDrawing);
  v9 = -[PKAttachmentView initWithFrame:drawing:](self, "initWithFrame:drawing:", v8, x, y, width, height);

  return v9;
}

- (PKAttachmentView)initWithCoder:(id)a3
{
  return -[PKAttachmentView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager removeListener:]((uint64_t)v4, self->_listenerID);

  v5.receiver = self;
  v5.super_class = (Class)PKAttachmentView;
  -[PKAttachmentView dealloc](&v5, sel_dealloc);
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAttachmentView;
  -[PKAttachmentView didMoveToSuperview](&v7, sel_didMoveToSuperview);
  -[PKAttachmentView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__toolPickerDidShowHide_, CFSTR("PKToolPickerDidShowNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__toolPickerDidShowHide_, CFSTR("PKToolPickerDidHideNotification"), 0);
  }
  else
  {
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("PKToolPickerDidShowNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("PKToolPickerDidHideNotification"), 0);
  }

}

- (void)setTileDrawingTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  self->_didSetTileDrawingTransform = 1;
  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_tileDrawingTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_tileDrawingTransform.tx = v4;
  *(_OWORD *)&self->_tileDrawingTransform.a = v3;
}

- (CGAffineTransform)tileDrawingTransform
{
  __int128 v3;

  if (!LOBYTE(self[8].ty))
    return (CGAffineTransform *)-[CGAffineTransform drawingTransform](self, "drawingTransform");
  v3 = *(_OWORD *)&self[14].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[14].d;
  return self;
}

- (void)clearTileDrawingTransform
{
  self->_didSetTileDrawingTransform = 0;
}

- (BOOL)wantsFullyRendered
{
  return 0;
}

- (void)setAdditionalStrokes:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PKAttachmentView *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_additionalStrokes, a3);
  if (-[PKAttachmentView wantsProofreadingDetection](self, "wantsProofreadingDetection")
    && self->_previousProofreadingItems
    && objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_previousProofreadingItems);
    v23 = v5;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKStrokeProvider _identifiersForStrokes:](PKStrokeProvider, "_identifiersForStrokes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = self;
    v10 = self->_proofreadingViews;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v15, "proofreadingItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "chStrokeIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setWithArray:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "intersectsSet:", v9))
          {
            objc_msgSend(v15, "proofreadingItem");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeObject:", v20);

          }
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v12);
    }

    v21 = objc_msgSend(v24, "count");
    if (v21 != -[NSMutableArray count](v22->_previousProofreadingItems, "count"))
      -[PKAttachmentView updateDetectionViews:withItems:previousItems:](v22, "updateDetectionViews:withItems:previousItems:", v22->_proofreadingViews, v24, v22->_previousProofreadingItems);

    v5 = v23;
  }

}

- (BOOL)disableTileAnimations
{
  return 0;
}

- (void)setContentHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_contentHidden = a3;
  -[PKAttachmentView tileContainerView](self, "tileContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)setSixChannelBlending:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_sixChannelBlending != a3)
  {
    v3 = a3;
    self->_sixChannelBlending = a3;
    -[PKAttachmentView tileContainerView](self, "tileContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = !v3;
    objc_msgSend(v6, "setAllowsGroupBlending:", v7);

    -[PKAttachmentView proofreadingContainerView](self, "proofreadingContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", v7);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PKAttachmentView tiles](self, "tiles", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          -[PKRendererTile purgeTileLayers](*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

    -[PKAttachmentView tiles](self, "tiles");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllObjects");

    -[NSMutableDictionary removeAllObjects](self->_purgedTiles, "removeAllObjects");
  }
}

- (id)hitMiniMenu:(CGPoint)a3
{
  return 0;
}

- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4
{
  return 0;
}

- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;

  y = a3.y;
  x = a3.x;
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(a4, v7);
}

- (void)_toolPickerDidShowHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKToolPickerNotificationWindowSceneUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAttachmentView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v10;
  if (v5 == v7)
  {
    objc_msgSend(v10, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isVisible"))
      -[PKAttachmentView toolPickerDidShow](self, "toolPickerDidShow");
    else
      -[PKAttachmentView toolPickerDidHide](self, "toolPickerDidHide");

    v8 = v10;
  }

}

- (void)toolPickerDidShow
{
  self->_toolPickerVisible = 1;
  self->_hideUntilScroll = 0;
  -[PKAttachmentView updateDetectionViewVisibility](self, "updateDetectionViewVisibility");
}

- (void)toolPickerDidHide
{
  self->_toolPickerVisible = 0;
  -[PKAttachmentView updateDetectionViewVisibility](self, "updateDetectionViewVisibility");
}

- (void)drawingDidChange
{
  -[PKAttachmentView drawingDidChangeVisibleStrokes:](self, "drawingDidChangeVisibleStrokes:", 1);
}

- (void)drawingDidChangeVisibleStrokes:(BOOL)a3
{
  PKStrokeSpatialCache *strokeSpatialCache;
  void *v5;

  if (a3)
  {
    -[NSMutableDictionary removeAllObjects](self->_purgedTiles, "removeAllObjects");
    strokeSpatialCache = self->_strokeSpatialCache;
    -[PKAttachmentView drawing](self, "drawing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKStrokeSpatialCache _invalidateCacheForBounds:inDrawing:force:]((uint64_t)strokeSpatialCache, v5, 1, self->_cachedBounds.origin.x, self->_cachedBounds.origin.y, self->_cachedBounds.size.width, self->_cachedBounds.size.height);

    self->_hideUntilScroll = !self->_toolPickerVisible;
    -[PKAttachmentView setDetectionViewsHidden:](self, "setDetectionViewsHidden:", 1);
    self->_ignoreInitialDetectionItemsForStatistics = 0;
  }
  else
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->_hashtagViews, "makeObjectsPerformSelector:", sel_updateActivationState);
    -[NSMutableArray makeObjectsPerformSelector:](self->_mentionViews, "makeObjectsPerformSelector:", sel_updateActivationState);
  }
}

- (void)visibleOnscreenBoundsDidChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PKStrokeSpatialCache *strokeSpatialCache;
  void *v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_cachedBounds = a3;
  strokeSpatialCache = self->_strokeSpatialCache;
  -[PKAttachmentView drawing](self, "drawing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (strokeSpatialCache)
  {
    v9 = v8;
    -[PKStrokeSpatialCache _invalidateCacheForBounds:inDrawing:force:]((uint64_t)strokeSpatialCache, v8, 0, x, y, width, height);
    v8 = v9;
  }

}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  PKDrawing *v5;

  v5 = (PKDrawing *)a3;
  if (self->_drawing != v5)
  {
    objc_storeStrong((id *)&self->_drawing, a3);
    -[PKAttachmentView _initializeRecognitionForDrawingIfNecessary:](self, "_initializeRecognitionForDrawingIfNecessary:", v5);
    -[PKAttachmentView drawingDidChange](self, "drawingDidChange");
  }

}

- (NSMutableDictionary)tiles
{
  return self->_tiles;
}

- (NSMutableDictionary)offscreenTiles
{
  return self->_offscreenTiles;
}

- (NSMutableDictionary)purgedTiles
{
  return self->_purgedTiles;
}

- (CGAffineTransform)drawingTransform
{
  double v4;

  -[PKAttachmentView bounds](self, "bounds");
  return CGAffineTransformMakeScale(retstr, v4 / 768.0, v4 / 768.0);
}

- (PKStrokeSpatialCache)strokeSpatialCache
{
  return self->_strokeSpatialCache;
}

- (UIView)tileContainerView
{
  return self->_tileContainerView;
}

- (BOOL)isAtEndOfDocument
{
  return 0;
}

- (BOOL)isExternalAttachment
{
  return 0;
}

- (void)didFinishCalculatingVisibleOnscreenStrokes:(id)a3 drawing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  -[PKAttachmentView drawing](self, "drawing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "PKStrokeSpatialCache drawing did not match current drawing", v11, 2u);
    }

  }
  -[PKAttachmentView _initializeRecognitionForDrawingIfNecessary:withVisibleOnscreenStrokes:](self, "_initializeRecognitionForDrawingIfNecessary:withVisibleOnscreenStrokes:", v7, v6);

}

- (void)containingScrollViewDidScroll
{
  self->_hideUntilScroll = 0;
  if (-[PKAttachmentView detectionViewsHidden](self, "detectionViewsHidden"))
    -[PKAttachmentView revealDetectionViews](self, "revealDetectionViews");
}

- (void)pixelAlignForContentScale:(double)a3 enclosingScrollView:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
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
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;

  v6 = a4;
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAttachmentView bounds](self, "bounds");
  objc_msgSend(v7, "convertRect:fromView:", self);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = DKDRoundedRectForScale(v9, v11, v13, v15, a3);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v6, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "convertRect:toView:", self, v16, v18, v20, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  -[PKAttachmentView tileContainerView](self, "tileContainerView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  -[PKAttachmentView proofreadingContainerView](self, "proofreadingContainerView");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v25, v27, v29, v31);

}

- (double)heightFromDrawing:(id)a3 delta:(double)a4
{
  CGFloat v6;
  double v8;
  double v9;
  CGRect v10;

  objc_msgSend(a3, "bounds");
  v6 = CGRectGetMaxY(v10) + a4;
  -[PKAttachmentView drawingTransform](self, "drawingTransform");
  return v6 * sqrt(v9 * v9 + v8 * v8);
}

- (void)updateDrawingHeight:(double)a3
{
  id v4;

  -[PKAttachmentView drawing](self, "drawing");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_canvasBounds:", 0.0, 0.0, 768.0, a3);

}

- (void)updateDrawingHeight:(double)a3 notifyDrawingDidChange:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[PKAttachmentView updateDrawingHeight:](self, "updateDrawingHeight:", a3);
  if (v4)
    -[PKAttachmentView drawingDidChange](self, "drawingDidChange");
}

- (void)updateTileContainerViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  -[PKAttachmentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKAttachmentView tileContainerView](self, "tileContainerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PKAttachmentView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PKAttachmentView proofreadingContainerView](self, "proofreadingContainerView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAttachmentView;
  -[PKAttachmentView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKAttachmentView updateTileContainerViewFrame](self, "updateTileContainerViewFrame");
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAttachmentView;
  -[PKAttachmentView layoutSubviews](&v4, sel_layoutSubviews);
  -[PKAttachmentView tileMaskView](self, "tileMaskView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  -[PKAttachmentView updateTileContainerViewFrame](self, "updateTileContainerViewFrame");
  -[PKAttachmentView layoutInlineViews](self, "layoutInlineViews");
}

- (void)didBeginDrawing
{
  -[PKAttachmentView setDetectionViewsHidden:](self, "setDetectionViewsHidden:", 1);
}

- (void)endedStroke:(id)a3
{
  self->_latestEndOfStrokeTimestamp = CACurrentMediaTime();
}

- (void)didBeginModifyDrawing
{
  self->_isDraggingSelection = 1;
  -[PKAttachmentView updateDetectionViewVisibility](self, "updateDetectionViewVisibility");
}

- (void)didEndModifyDrawing
{
  self->_isDraggingSelection = 0;
}

- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3
{
  return 0;
}

- (PKRecognitionSessionManager)recognitionManager
{
  PKRecognitionController *recognitionController;

  recognitionController = self->_recognitionController;
  if (recognitionController)
    return recognitionController->_sessionManager;
  else
    return 0;
}

- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3
{
  -[PKAttachmentView _initializeRecognitionForDrawingIfNecessary:withVisibleOnscreenStrokes:](self, "_initializeRecognitionForDrawingIfNecessary:withVisibleOnscreenStrokes:", a3, 0);
}

- (PKRecognitionController)recognitionController
{
  PKRecognitionController *recognitionController;
  void *v4;

  recognitionController = self->_recognitionController;
  if (!recognitionController)
  {
    -[PKAttachmentView drawing](self, "drawing");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAttachmentView _initializeRecognitionForDrawingIfNecessary:withVisibleOnscreenStrokes:createIfDrawingIfEmpty:](self, "_initializeRecognitionForDrawingIfNecessary:withVisibleOnscreenStrokes:createIfDrawingIfEmpty:", v4, 0, 1);

    recognitionController = self->_recognitionController;
  }
  return recognitionController;
}

- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3 withVisibleOnscreenStrokes:(id)a4
{
  -[PKAttachmentView _initializeRecognitionForDrawingIfNecessary:withVisibleOnscreenStrokes:createIfDrawingIfEmpty:](self, "_initializeRecognitionForDrawingIfNecessary:withVisibleOnscreenStrokes:createIfDrawingIfEmpty:", a3, a4, 0);
}

- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3 withVisibleOnscreenStrokes:(id)a4 createIfDrawingIfEmpty:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  PKRecognitionController *recognitionController;
  PKRecognitionController *v12;
  PKRecognitionController *v13;
  PKRecognitionController *v14;
  PKRecognitionController *v15;
  PKRecognitionController *v16;
  void *v17;
  char wantsDataDetection;
  void *v19;
  void *v20;
  char wantsHashtagDetection;
  void *v22;
  void *v23;
  char wantsMentionDetection;
  void *v25;
  void *v26;
  _BOOL4 wantsProofreadingDetection;
  void *v28;
  PKAutoRefineSettingsObserver *v29;
  PKAutoRefineSettingsObserver *v30;
  PKAutoRefineSettingsObserver *settingsObserver;
  _QWORD v32[4];
  id v33;
  id location;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (self->_recognitionController || objc_msgSend(v8, "_isEmpty") && !v5)
  {
    v10 = objc_msgSend(v9, "count");
    recognitionController = self->_recognitionController;
    if (v10)
      -[PKRecognitionController setDrawing:withVisibleOnscreenStrokes:](recognitionController, "setDrawing:withVisibleOnscreenStrokes:", v8, v9);
    else
      -[PKRecognitionController setDrawing:](recognitionController, "setDrawing:", v8);
  }
  else
  {
    v12 = -[PKRecognitionController initWithDrawing:visibleOnscreenStrokes:]([PKRecognitionController alloc], "initWithDrawing:visibleOnscreenStrokes:", v8, v9);
    v13 = self->_recognitionController;
    self->_recognitionController = v12;

    v14 = self->_recognitionController;
    if (v14)
      v14 = (PKRecognitionController *)v14->_sessionManager;
    v15 = v14;
    -[PKRecognitionSessionManager addListener:]((uint64_t)v15, self->_listenerID);

    v16 = self->_recognitionController;
    if (v16)
      objc_storeWeak((id *)&v16->_internalDelegate, self);
    -[PKAttachmentView window](self, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      wantsDataDetection = self->_wantsDataDetection;
    else
      wantsDataDetection = 0;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsDataDetection:]((uint64_t)v19, wantsDataDetection);

    -[PKAttachmentView window](self, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      wantsHashtagDetection = self->_wantsHashtagDetection;
    else
      wantsHashtagDetection = 0;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsHashtagDetection:]((uint64_t)v22, wantsHashtagDetection);

    -[PKAttachmentView window](self, "window");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      wantsMentionDetection = self->_wantsMentionDetection;
    else
      wantsMentionDetection = 0;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsMentionDetection:]((uint64_t)v25, wantsMentionDetection);

    -[PKAttachmentView window](self, "window");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      wantsProofreadingDetection = self->_wantsProofreadingDetection;
    else
      wantsProofreadingDetection = 0;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsProofreadingDetection:]((uint64_t)v28, wantsProofreadingDetection);

    -[PKAttachmentView _handleAutoRefineSettingsDidChange](self, "_handleAutoRefineSettingsDidChange");
    if (!self->_settingsObserver)
    {
      objc_initWeak(&location, self);
      v29 = [PKAutoRefineSettingsObserver alloc];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __114__PKAttachmentView__initializeRecognitionForDrawingIfNecessary_withVisibleOnscreenStrokes_createIfDrawingIfEmpty___block_invoke;
      v32[3] = &unk_1E77785B0;
      objc_copyWeak(&v33, &location);
      v30 = (PKAutoRefineSettingsObserver *)-[PKAutoRefineSettingsObserver initWithHandler:](v29, v32);
      settingsObserver = self->_settingsObserver;
      self->_settingsObserver = v30;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }

}

void __114__PKAttachmentView__initializeRecognitionForDrawingIfNecessary_withVisibleOnscreenStrokes_createIfDrawingIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __114__PKAttachmentView__initializeRecognitionForDrawingIfNecessary_withVisibleOnscreenStrokes_createIfDrawingIfEmpty___block_invoke_2;
  v4[3] = &unk_1E7777588;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  PKPerformOnMainThread(v4);
  objc_destroyWeak(&v5);

}

void __114__PKAttachmentView__initializeRecognitionForDrawingIfNecessary_withVisibleOnscreenStrokes_createIfDrawingIfEmpty___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutoRefineSettingsDidChange");

}

- (void)_handleAutoRefineSettingsDidChange
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint8_t v11[16];

  v3 = os_log_create("com.apple.pencilkit", "AttachmentView");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "handle AutoRefine settings did change", v11, 2u);
  }

  v4 = -[PKAttachmentView wantsAutoRefine](self, "wantsAutoRefine");
  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager setWantsAutoRefine:]((uint64_t)v5, v4);

  if (v4)
  {
    -[PKAttachmentView tiledView](self, "tiledView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setAutoRefineViewDelegate:]((uint64_t)v7, v6);

    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      WeakRetained = objc_loadWeakRetained((id *)(v8 + 192));
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "clearRefinableStrokes");

  }
  else
  {
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setAutoRefineViewDelegate:]((uint64_t)v9, 0);
  }

}

- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7
{
  double y;
  double x;
  id v13;
  id v14;
  id v15;

  y = a3.y;
  x = a3.x;
  v13 = a7;
  v14 = a6;
  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager fetchIntersectedStrokesAtPoint:selectionType:inputType:visibleOnscreenStrokes:completion:]((uint64_t)v15, a4, a5, v14, v13, x, y);

}

- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  _QWORD *v14;

  y = a5.y;
  x = a5.x;
  v8 = a4.y;
  v9 = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v13 = a6;
  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager fetchIntersectedStrokesBetweenTopPoint:bottomPoint:liveScrollOffset:isRTL:completion:](v14, -[PKAttachmentView isRTL](self, "isRTL"), v13, v11, v10, v9, v8, x, y);

}

- (BOOL)isRTL
{
  return -[PKAttachmentView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (id)_firstStrokesInSelectedStrokes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager _firstStrokesInSelectedStrokes:isRTL:](v5, v4, -[PKAttachmentView isRTL](self, "isRTL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_lastStrokesInSelectedStrokes:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager _lastStrokesInSelectedStrokes:isRTL:](v5, v4, -[PKAttachmentView isRTL](self, "isRTL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;

  v6 = a4;
  v7 = a3;
  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:completion:](v8, v7, v6);

}

- (int64_t)contentTypeForIntersectedStrokes:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKRecognitionSessionManager contentTypeForIntersectedStrokes:]((uint64_t)v5, v4);

  return v6;
}

- (void)_willEnterForeground:(id)a3
{
  -[PKRecognitionController tagAsActive](self->_recognitionController, "tagAsActive", a3);
}

- (void)_didEnterBackground:(id)a3
{
  -[PKRecognitionController tagAsIdle](self->_recognitionController, "tagAsIdle", a3);
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAttachmentView;
  -[PKAttachmentView willMoveToWindow:](&v20, sel_willMoveToWindow_, v4);
  -[PKAttachmentView setWantsDataDetection:](self, "setWantsDataDetection:", 0);
  -[PKAttachmentView setWantsHashtagDetection:](self, "setWantsHashtagDetection:", 0);
  -[PKAttachmentView setWantsMentionDetection:](self, "setWantsMentionDetection:", 0);
  -[PKAttachmentView setWantsProofreadingDetection:](self, "setWantsProofreadingDetection:", 0);
  -[PKAttachmentView removeDetectionViews](self, "removeDetectionViews");
  v5 = (uint64_t *)MEMORY[0x1E0DC5338];
  v6 = (uint64_t *)MEMORY[0x1E0DC5318];
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *v5;
    objc_msgSend(v4, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__willEnterForeground_, v8, v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *v6;
    objc_msgSend(v4, "windowScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__didEnterBackground_, v11, v12);

  }
  -[PKAttachmentView window](self, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *v5;
    objc_msgSend(v13, "windowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObserver:name:object:", self, v15, v16);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *v6;
    objc_msgSend(v13, "windowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:name:object:", self, v18, v19);

  }
}

- (void)removeDetectionViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PKAttachmentView dataDetectorViews](self, "dataDetectorViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[PKAttachmentView dataDetectorViews](self, "dataDetectorViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PKAttachmentView previousDataDetectorItems](self, "previousDataDetectorItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[PKAttachmentView hashtagViews](self, "hashtagViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[PKAttachmentView hashtagViews](self, "hashtagViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[PKAttachmentView previousHashtagItems](self, "previousHashtagItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[PKAttachmentView mentionViews](self, "mentionViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[PKAttachmentView mentionViews](self, "mentionViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

  -[PKAttachmentView previousMentionItems](self, "previousMentionItems");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllObjects");

}

- (void)didMoveToWindow
{
  void *v3;
  char wantsDataDetection;
  void *v5;
  char wantsHashtagDetection;
  void *v7;
  char wantsMentionDetection;
  void *v9;
  _BOOL4 wantsProofreadingDetection;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKAttachmentView;
  -[PKAttachmentView didMoveToWindow](&v16, sel_didMoveToWindow);
  -[PKAttachmentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    wantsDataDetection = self->_wantsDataDetection;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsDataDetection:]((uint64_t)v5, wantsDataDetection);

    wantsHashtagDetection = self->_wantsHashtagDetection;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsHashtagDetection:]((uint64_t)v7, wantsHashtagDetection);

    wantsMentionDetection = self->_wantsMentionDetection;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsMentionDetection:]((uint64_t)v9, wantsMentionDetection);

    wantsProofreadingDetection = self->_wantsProofreadingDetection;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsProofreadingDetection:]((uint64_t)v11, wantsProofreadingDetection);

    -[PKAttachmentView window](self, "window");
    v12 = objc_claimAutoreleasedReturnValue();
    -[PKAttachmentView setToolPickerVisible:](self, "setToolPickerVisible:", +[PKToolPicker isActiveToolPickerVisibleForWindow:](PKToolPicker, "isActiveToolPickerVisibleForWindow:", v12));

    self->_ignoreInitialDetectionItemsForStatistics = 1;
    -[PKAttachmentView _handleAutoRefineSettingsDidChange](self, "_handleAutoRefineSettingsDidChange");
    -[PKAttachmentView drawing](self, "drawing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v13, "_isEmpty");

    if ((v12 & 1) == 0)
    {
      -[PKAttachmentView tiledView](self, "tiledView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "welcomeController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "showPencilEducationPane");

    }
  }
}

- (void)setWantsDataDetection:(BOOL)a3
{
  void *v4;
  char wantsDataDetection;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *dataDetectorViews;
  NSMutableArray *v9;
  NSMutableArray *previousDataDetectorItems;

  if (self->_wantsDataDetection != a3)
  {
    self->_wantsDataDetection = a3;
    -[PKAttachmentView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      wantsDataDetection = self->_wantsDataDetection;
    else
      wantsDataDetection = 0;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsDataDetection:]((uint64_t)v6, wantsDataDetection);

    if (self->_wantsDataDetection && !self->_dataDetectorViews)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      dataDetectorViews = self->_dataDetectorViews;
      self->_dataDetectorViews = v7;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      previousDataDetectorItems = self->_previousDataDetectorItems;
      self->_previousDataDetectorItems = v9;

    }
  }
}

- (void)setWantsHashtagDetection:(BOOL)a3
{
  void *v4;
  char wantsHashtagDetection;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *hashtagViews;
  NSMutableArray *v9;
  NSMutableArray *previousHashtagItems;

  if (self->_wantsHashtagDetection != a3)
  {
    self->_wantsHashtagDetection = a3;
    -[PKAttachmentView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      wantsHashtagDetection = self->_wantsHashtagDetection;
    else
      wantsHashtagDetection = 0;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsHashtagDetection:]((uint64_t)v6, wantsHashtagDetection);

    if (self->_wantsHashtagDetection && !self->_hashtagViews)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      hashtagViews = self->_hashtagViews;
      self->_hashtagViews = v7;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      previousHashtagItems = self->_previousHashtagItems;
      self->_previousHashtagItems = v9;

    }
  }
}

- (void)setWantsMentionDetection:(BOOL)a3
{
  void *v4;
  char wantsMentionDetection;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *mentionViews;
  NSMutableArray *v9;
  NSMutableArray *previousMentionItems;

  if (self->_wantsMentionDetection != a3)
  {
    self->_wantsMentionDetection = a3;
    -[PKAttachmentView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      wantsMentionDetection = self->_wantsMentionDetection;
    else
      wantsMentionDetection = 0;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsMentionDetection:]((uint64_t)v6, wantsMentionDetection);

    if (self->_wantsMentionDetection && !self->_mentionViews)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      mentionViews = self->_mentionViews;
      self->_mentionViews = v7;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      previousMentionItems = self->_previousMentionItems;
      self->_previousMentionItems = v9;

    }
  }
}

- (void)setWantsProofreadingDetection:(BOOL)a3
{
  void *v4;
  _BOOL4 wantsProofreadingDetection;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *proofreadingViews;
  NSMutableArray *v9;
  NSMutableArray *previousProofreadingItems;

  if (self->_wantsProofreadingDetection != a3)
  {
    self->_wantsProofreadingDetection = a3;
    -[PKAttachmentView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      wantsProofreadingDetection = self->_wantsProofreadingDetection;
    else
      wantsProofreadingDetection = 0;
    -[PKAttachmentView recognitionManager](self, "recognitionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRecognitionSessionManager setWantsProofreadingDetection:]((uint64_t)v6, wantsProofreadingDetection);

    if (self->_wantsProofreadingDetection && !self->_proofreadingViews)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      proofreadingViews = self->_proofreadingViews;
      self->_proofreadingViews = v7;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      previousProofreadingItems = self->_previousProofreadingItems;
      self->_previousProofreadingItems = v9;

    }
  }
}

- (BOOL)wantsAutoRefine
{
  void *v3;
  void *v4;
  char v5;

  -[PKAttachmentView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PKAttachmentView tiledView](self, "tiledView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAutoRefineEnabled");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)recognitionController:(id)a3 foundDataDetectorItems:(id)a4
{
  -[PKAttachmentView updateDataDetectorResults:](self, "updateDataDetectorResults:", a4);
}

- (void)recognitionController:(id)a3 foundHashtagItems:(id)a4
{
  -[PKAttachmentView updateHashtagResults:](self, "updateHashtagResults:", a4);
}

- (void)recognitionController:(id)a3 foundMentionItems:(id)a4
{
  -[PKAttachmentView updateMentionResults:](self, "updateMentionResults:", a4);
}

- (void)recognitionController:(id)a3 foundProofreadingItems:(id)a4
{
  -[PKAttachmentView updateProofreadingResults:](self, "updateProofreadingResults:", a4);
}

- (BOOL)canConvertTextToHandwriting:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PKAttachmentView recognitionController](self, "recognitionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canConvertTextToHandwriting:", v4);

  return v6;
}

- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 suggestedHeight:(double)a5 inkColor:(id)a6 completion:(id)a7
{
  -[PKAttachmentView convertTextToHandwriting:bounds:suggestedHeight:suggestedDrawing:inkColor:completion:](self, "convertTextToHandwriting:bounds:suggestedHeight:suggestedDrawing:inkColor:completion:", a3, 0, a6, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 inkColor:(id)a5 completion:(id)a6
{
  -[PKAttachmentView convertTextToHandwriting:bounds:suggestedHeight:suggestedDrawing:inkColor:completion:](self, "convertTextToHandwriting:bounds:suggestedHeight:suggestedDrawing:inkColor:completion:", a3, 0, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a4.size.height);
}

- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 suggestedHeight:(double)a5 suggestedDrawing:(id)a6 inkColor:(id)a7 completion:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    -[PKAttachmentView tintColor](self, "tintColor");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;
  -[PKAttachmentView tiledView](self, "tiledView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "inputScale");
  v25 = v24;

  self->_didReceiveTextConversion = 0;
  -[PKAttachmentView recognitionController](self, "recognitionController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v20;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke;
  v30[3] = &unk_1E7778600;
  v30[4] = self;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke_3;
  v28[3] = &unk_1E7778628;
  v28[4] = self;
  v27 = v20;
  objc_msgSend(v26, "convertTextToHandwriting:bounds:inkColor:inputScale:suggestedHeight:suggestedDrawing:progress:completion:", v17, v22, v18, v30, v28, x, y, width, height, v25, a5);

}

void __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke_2;
  block[3] = &unk_1E77785D8;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v5 = WeakRetained;
      v4 = objc_msgSend(WeakRetained, "didReceiveTextConversion");
      v3 = v5;
      if ((v4 & 1) == 0)
      {
        objc_msgSend(v5, "_showHUDWithProgress:", *(_QWORD *)(a1 + 32));
        v3 = v5;
      }
    }
  }

}

void __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 509) = 1;
  if (objc_msgSend(v9, "count") && objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_hideHUD");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)replaceStrokes:(id)a3 withString:(id)a4 inBounds:(CGRect)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[PKAttachmentView tiledView](self, "tiledView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inputScale");
  v18 = v17;

  -[PKAttachmentView recognitionController](self, "recognitionController");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "replaceStrokes:withString:inBounds:inputScale:completion:", v15, v14, v13, x, y, width, height, v18);

}

- (void)_showHUDWithProgress:(id)a3
{
  NSProgress *v4;
  void *v5;
  void *v6;
  void *v7;
  PKProgressAlertController *v8;
  PKProgressAlertController *progressAlertController;
  PKProgressAlertController *v10;
  NSProgress *currentProgress;
  NSProgress *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (NSProgress *)a3;
  _PencilKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Converting text to handwriting…"), CFSTR("Converting text to handwriting…"), CFSTR("Localizable"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  _PencilKitBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Cancel converting to handwriting"), CFSTR("Cancel"), CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = +[PKProgressAlertController newProgressAlertControllerWithTitle:cancel:](PKProgressAlertController, "newProgressAlertControllerWithTitle:cancel:", v16, v7);
  progressAlertController = self->_progressAlertController;
  self->_progressAlertController = v8;

  -[PKProgressAlertController setDelegate:](self->_progressAlertController, "setDelegate:", self);
  v10 = self->_progressAlertController;
  -[NSProgress fractionCompleted](v4, "fractionCompleted");
  -[PKProgressAlertController setProgress:](v10, "setProgress:");
  currentProgress = self->_currentProgress;
  self->_currentProgress = v4;
  v12 = v4;

  -[NSProgress addObserver:forKeyPath:options:context:](self->_currentProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 3, PKInkSynthesisContext);
  -[PKAttachmentView viewRep](self, "viewRep");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rootViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", self->_progressAlertController, 1, &__block_literal_global_10);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  if ((void *)PKInkSynthesisContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3, a4, a5))
    {
      -[PKAttachmentView _progressChanged](self, "_progressChanged");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__PKAttachmentView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E7778020;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __67__PKAttachmentView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_progressChanged");
}

- (void)_progressChanged
{
  void *v3;
  PKProgressAlertController *progressAlertController;

  -[PKProgressAlertController presentingViewController](self->_progressAlertController, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    progressAlertController = self->_progressAlertController;
    -[NSProgress fractionCompleted](self->_currentProgress, "fractionCompleted");
    -[PKProgressAlertController setProgress:](progressAlertController, "setProgress:");
  }
}

- (void)_unregisterProgressObserver
{
  NSProgress *currentProgress;

  -[NSProgress removeObserver:forKeyPath:context:](self->_currentProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), PKInkSynthesisContext);
  currentProgress = self->_currentProgress;
  self->_currentProgress = 0;

}

- (void)_hideHUD
{
  PKProgressAlertController *progressAlertController;
  _QWORD v4[5];

  -[PKAttachmentView _unregisterProgressObserver](self, "_unregisterProgressObserver");
  progressAlertController = self->_progressAlertController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__PKAttachmentView__hideHUD__block_invoke;
  v4[3] = &unk_1E7778020;
  v4[4] = self;
  -[PKProgressAlertController dismissViewControllerAnimated:completion:](progressAlertController, "dismissViewControllerAnimated:completion:", 1, v4);
}

void __28__PKAttachmentView__hideHUD__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 608);
  *(_QWORD *)(v1 + 608) = 0;

}

- (BOOL)_isDrawing
{
  void *v2;
  void *v3;
  char v4;

  -[PKAttachmentView tiledView](self, "tiledView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canvasView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden") ^ 1;

  return v4;
}

- (BOOL)shouldDiscardEndedStroke:(id)a3
{
  return 0;
}

- (void)setHashtagAndMentionsDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagAndMentionsDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_hashtagAndMentionsDelegate, obj);
    -[PKAttachmentView updateAllPossibleParticipantNameTokens](self, "updateAllPossibleParticipantNameTokens");
    v5 = obj;
  }

}

- (void)updateDetectionViews:(id)a3 withItems:(id)a4 previousItems:(id)a5
{
  id v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  void *v64;
  char v65;
  uint64_t v66;
  NSMutableArray *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t n;
  UIView *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  PKProofreadingView *v80;
  void *v81;
  PKDataDetectorView *v82;
  UIView *v83;
  uint64_t v84;
  uint64_t v85;
  UIView *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  PKMentionView *v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  NSMutableDictionary *v99;
  NSMutableDictionary *mentionUUIDtoParticipant;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  int v106;
  PKHashtagView *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  uint64_t v112;
  void *v113;
  UIView *v114;
  NSMutableArray *v115;
  uint64_t v116;
  id v117;
  id v118;
  id obj;
  NSMutableArray *v120;
  id v121;
  id v122;
  _BOOL4 ignoreInitialDetectionItemsForStatistics;
  _QWORD v124[4];
  PKDataDetectorView *v125;
  uint8_t buf[16];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _QWORD v147[5];
  _QWORD v148[5];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v122 = a4;
  v117 = a5;
  ignoreInitialDetectionItemsForStatistics = self->_ignoreInitialDetectionItemsForStatistics;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v10 = (NSMutableArray *)v8;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v154;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v154 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * i);
        objc_msgSend(v15, "item");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v122, "containsObject:", v16);

        if ((v17 & 1) == 0)
        {
          objc_msgSend(v9, "addObject:", v15);
          objc_msgSend(v15, "item");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "removeObject:", v18);

          objc_msgSend(v15, "item");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            +[PKStatisticsManager sharedStatisticsManager]();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "item");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKStatisticsManager recordDataDetectorItemRemove:]((uint64_t)v21, v22);

          }
          else
          {
            objc_msgSend(v15, "item");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v24 = objc_opt_isKindOfClass();

            +[PKStatisticsManager sharedStatisticsManager]();
            v25 = objc_claimAutoreleasedReturnValue();
            v21 = (void *)v25;
            if ((v24 & 1) != 0)
              -[PKStatisticsManager recordHashtagItemRemove](v25);
            else
              -[PKStatisticsManager recordMentionItemRemove](v25);
          }

        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
    }
    while (v12);
  }

  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  obj = v9;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v150;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v150 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * v29);
        if (self->_detectionViewsHidden)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * v29), "removeFromSuperview");
        }
        else
        {
          v148[0] = MEMORY[0x1E0C809B0];
          v148[1] = 3221225472;
          v148[2] = __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke;
          v148[3] = &unk_1E7778020;
          v148[4] = v30;
          v147[0] = MEMORY[0x1E0C809B0];
          v147[1] = 3221225472;
          v147[2] = __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke_2;
          v147[3] = &unk_1E7778650;
          v147[4] = v30;
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v148, v147, 0.15);
        }
        if (!ignoreInitialDetectionItemsForStatistics)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v30, "item");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "active");

            if (v32)
            {
              -[PKAttachmentView hashtagViewWillDeactivateHashtag:](self, "hashtagViewWillDeactivateHashtag:", v30);
              -[PKAttachmentView hashtagViewDidDeactivateHashtag:](self, "hashtagViewDidDeactivateHashtag:", v30);
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v30, "item");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "active");

              if (v34)
              {
                -[PKAttachmentView mentionViewWillDeactivateMention:](self, "mentionViewWillDeactivateMention:", v30);
                -[PKAttachmentView mentionViewDidDeactivateMention:](self, "mentionViewDidDeactivateMention:", v30);
              }
            }
          }
        }
        ++v29;
      }
      while (v27 != v29);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
      v27 = v35;
    }
    while (v35);
  }

  -[NSMutableArray removeObjectsInArray:](v10, "removeObjectsInArray:", obj);
  v36 = 560;
  if (self->_hashtagViews == v10)
  {
    -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "allConfirmedHashtagsForAttachmentView:", self);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v120 = v10;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v143, v161, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v144;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v144 != v41)
            objc_enumerationMutation(v120);
          v43 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * j);
          objc_msgSend(v43, "hashtagItem");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "hashtagUUID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v38, "containsObject:", v45);

          if ((v46 & 1) == 0)
          {
            objc_msgSend(v43, "item");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "active");

            if (v48)
            {
              -[PKAttachmentView hashtagViewWillDeactivateHashtag:](self, "hashtagViewWillDeactivateHashtag:", v43);
              objc_msgSend(v43, "item");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKAttachmentView drawing](self, "drawing");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "clearActiveInDrawing:", v50);

              -[PKAttachmentView hashtagViewDidDeactivateHashtag:](self, "hashtagViewDidDeactivateHashtag:", v43);
            }
          }
        }
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v143, v161, 16);
      }
      while (v40);
    }

    v36 = 560;
  }
  -[NSMutableArray makeObjectsPerformSelector:](v10, "makeObjectsPerformSelector:", sel_setNeedsDisplay);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v117, "count"))
  {
    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    v52 = v122;
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v139, v160, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v140;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(_QWORD *)v140 != v55)
            objc_enumerationMutation(v52);
          v57 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * k);
          if ((objc_msgSend(v117, "containsObject:", v57) & 1) == 0)
            objc_msgSend(v51, "addObject:", v57);
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v139, v160, 16);
      }
      while (v54);
    }

    v36 = 560;
  }
  else
  {
    objc_msgSend(v51, "addObjectsFromArray:", v122);
  }
  objc_msgSend(v117, "addObjectsFromArray:", v51);
  if (!ignoreInitialDetectionItemsForStatistics && objc_msgSend(v51, "count"))
  {
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v58 = v51;
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v135, v159, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v136;
      do
      {
        for (m = 0; m != v60; ++m)
        {
          if (*(_QWORD *)v136 != v61)
            objc_enumerationMutation(v58);
          v63 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PKStatisticsManager sharedStatisticsManager]();
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKStatisticsManager recordDataDetectorItemAdd:]((uint64_t)v64, v63);
          }
          else
          {
            objc_opt_class();
            v65 = objc_opt_isKindOfClass();
            +[PKStatisticsManager sharedStatisticsManager]();
            v66 = objc_claimAutoreleasedReturnValue();
            v64 = (void *)v66;
            if ((v65 & 1) != 0)
              -[PKStatisticsManager recordHashtagItemAdd](v66);
            else
              -[PKStatisticsManager recordMentionItemAdd](v66);
          }

        }
        v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v135, v159, 16);
      }
      while (v60);
    }

    v36 = 560;
  }
  -[PKAttachmentView dataDetectorViews](self, "dataDetectorViews");
  v67 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

  if (v67 == v10)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v122, "count"));
    v121 = (id)objc_claimAutoreleasedReturnValue();
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    v68 = v122;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v131, v158, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v132;
      do
      {
        for (n = 0; n != v70; ++n)
        {
          if (*(_QWORD *)v132 != v71)
            objc_enumerationMutation(v68);
          objc_msgSend(v121, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * n), "coreResult"));
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v131, v158, 16);
      }
      while (v70);
    }

  }
  else
  {
    v121 = 0;
  }
  -[PKAttachmentView tileContainerView](self, "tileContainerView");
  v73 = (UIView *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v118 = v51;
  v74 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v127, v157, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v128;
    v77 = 0x1ECEE3000uLL;
    v115 = v10;
    do
    {
      v78 = 0;
      v116 = v75;
      do
      {
        if (*(_QWORD *)v128 != v76)
          objc_enumerationMutation(v118);
        v79 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v78);
        if (*(NSMutableArray **)((char *)&self->super.super.super.isa + *(int *)(v77 + 3888)) == v10)
        {
          v82 = -[PKDataDetectorView initWithDataDetectorItem:allItems:]([PKDataDetectorView alloc], "initWithDataDetectorItem:allItems:", v79, v121);
          if (!v82)
            goto LABEL_124;
          goto LABEL_120;
        }
        if (*(NSMutableArray **)((char *)&self->super.super.super.isa + v36) != v10)
        {
          if (self->_mentionViews != v10)
          {
            if (self->_proofreadingViews != v10)
              goto LABEL_124;
            v80 = [PKProofreadingView alloc];
            -[PKAttachmentView drawing](self, "drawing");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = -[PKProofreadingView initWithProofreadingItem:inDrawing:](v80, "initWithProofreadingItem:inDrawing:", v79, v81);

            v75 = v116;
            -[PKDataDetectorView setDelegate:](v82, "setDelegate:", self);
            v83 = self->_proofreadingContainerView;

            v73 = v83;
            if (!v82)
              goto LABEL_124;
            goto LABEL_120;
          }
          objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * v78), "mentionResult");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "stringByReplacingCharactersInRange:withString:", 0, 1, &stru_1E777DEE8);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "attachmentView:participantMatchesForMentionText:", self, v91);
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v93, "count"))
          {
            v114 = v73;
            v94 = [PKMentionView alloc];
            -[PKAttachmentView drawing](self, "drawing");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = -[PKMentionView initWithMentionItem:possibleParticipants:inDrawing:](v94, "initWithMentionItem:possibleParticipants:inDrawing:", v79, v93, v95);

            -[PKDataDetectorView setDelegate:](v82, "setDelegate:", self);
            -[PKDataDetectorView mentionItem](v82, "mentionItem");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v95) = objc_msgSend(v96, "active");

            if ((_DWORD)v95)
            {
              v113 = v91;
              -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "allConfirmedMentionsForAttachmentView:", self);
              v98 = objc_claimAutoreleasedReturnValue();

              if (!self->_mentionUUIDtoParticipant)
              {
                v99 = -[NSObject mutableCopy](v98, "mutableCopy");
                mentionUUIDtoParticipant = self->_mentionUUIDtoParticipant;
                self->_mentionUUIDtoParticipant = v99;

              }
              -[PKDataDetectorView mentionItem](v82, "mentionItem");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "mentionUUID");
              v102 = (void *)objc_claimAutoreleasedReturnValue();

              -[NSObject objectForKeyedSubscript:](v98, "objectForKeyedSubscript:", v102);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              if (v103)
              {
LABEL_104:
                objc_msgSend(v103, "color");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKDataDetectorView setMentionColor:](v82, "setMentionColor:", v105);
              }
              else
              {
                -[NSMutableDictionary objectForKeyedSubscript:](self->_mentionUUIDtoParticipant, "objectForKeyedSubscript:", v102);
                v104 = objc_claimAutoreleasedReturnValue();
                if (v104)
                {
                  v103 = (void *)v104;
                  -[PKAttachmentView mentionViewDidActivateMention:withParticpant:](self, "mentionViewDidActivateMention:withParticpant:", v82, v104);
                  goto LABEL_104;
                }
                -[PKDataDetectorView mentionItem](v82, "mentionItem");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                -[PKAttachmentView drawing](self, "drawing");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "clearActiveInDrawing:", v105);
              }

              v36 = 560;
              v91 = v113;
              v73 = v114;
LABEL_116:

            }
            else
            {
              v73 = v114;
            }

            goto LABEL_119;
          }
          v98 = os_log_create("com.apple.pencilkit", ");
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1BE213000, v98, OS_LOG_TYPE_DEBUG, "No particpants provided mention", buf, 2u);
          }
          v82 = 0;
          goto LABEL_116;
        }
        v84 = v76;
        v85 = v36;
        v86 = v73;
        objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * v78), "hashtagUUID");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "allConfirmedHashtagsForAttachmentView:", self);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v89, "containsObject:", v87) & 1) != 0)
        {

        }
        else
        {
          v106 = objc_msgSend(v79, "active");

          if (!v106)
            goto LABEL_109;
          -[PKAttachmentView drawing](self, "drawing");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "clearActiveInDrawing:", v88);
        }

LABEL_109:
        v107 = [PKHashtagView alloc];
        -[PKAttachmentView drawing](self, "drawing");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = -[PKHashtagView initWithHashtagItem:inDrawing:](v107, "initWithHashtagItem:inDrawing:", v79, v108);

        -[PKDataDetectorView setDelegate:](v82, "setDelegate:", self);
        if (!ignoreInitialDetectionItemsForStatistics)
        {
          -[PKDataDetectorView item](v82, "item");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v109, "active");

          if (v110)
            -[PKAttachmentView hashtagViewDidActivateHashtag:](self, "hashtagViewDidActivateHashtag:", v82);
        }

        v73 = v86;
        v36 = v85;
        v76 = v84;
        v10 = v115;
LABEL_119:
        v77 = 0x1ECEE3000;
        v75 = v116;
        if (!v82)
          goto LABEL_124;
LABEL_120:
        -[UIView insertSubview:atIndex:](v73, "insertSubview:atIndex:", v82, 0);
        -[PKDataDetectorView setAlpha:](v82, "setAlpha:", 0.0);
        if (!self->_detectionViewsHidden || v73 == self->_proofreadingContainerView)
        {
          v111 = (void *)MEMORY[0x1E0DC3F10];
          v124[0] = MEMORY[0x1E0C809B0];
          v124[1] = 3221225472;
          v124[2] = __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke_67;
          v124[3] = &unk_1E7778020;
          v125 = v82;
          objc_msgSend(v111, "animateWithDuration:animations:", v124, 0.15);

        }
        -[NSMutableArray addObject:](v10, "addObject:", v82);

LABEL_124:
        ++v78;
      }
      while (v75 != v78);
      v112 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v127, v157, 16);
      v75 = v112;
    }
    while (v112);
  }

  if (objc_msgSend(v118, "count"))
    -[UIView setNeedsLayout](v73, "setNeedsLayout");
  -[PKAttachmentView setNeedsLayout](self, "setNeedsLayout");

}

uint64_t __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke_67(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (PKTiledView)tiledView
{
  return 0;
}

- (void)hashtagView:(id)a3 registerCommand:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKAttachmentView tiledView](self, "tiledView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerUndoCommand:", v5);

}

- (void)hashtagViewDidActivateHashtag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hashtagItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hashtagUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hashtagItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hashtagResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentView:userConfirmedHashtagWithUUID:displayText:", self, v7, v9);

  -[PKAttachmentView drawingDidChangeVisibleStrokes:](self, "drawingDidChangeVisibleStrokes:", 0);
  +[PKStatisticsManager sharedStatisticsManager]();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordHashtagItemActivate]((uint64_t)v10);

}

- (void)hashtagViewWillDeactivateHashtag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hashtagItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hashtagUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentView:userDeletedHashtagWithUUID:", self, v7);

  -[PKAttachmentView drawingDidChangeVisibleStrokes:](self, "drawingDidChangeVisibleStrokes:", 0);
  +[PKStatisticsManager sharedStatisticsManager]();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordHashtagItemDeactivate]((uint64_t)v8);

}

- (void)hashtagViewDidDeactivateHashtag:(id)a3
{
  -[PKAttachmentView drawingDidChangeVisibleStrokes:](self, "drawingDidChangeVisibleStrokes:", 0);
}

- (void)mentionView:(id)a3 registerCommand:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PKAttachmentView tiledView](self, "tiledView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerUndoCommand:", v5);

}

- (void)mentionViewDidActivateMention:(id)a3 withParticpant:(id)a4
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
  NSMutableDictionary *mentionUUIDtoParticipant;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  if (!v6)
  {
    -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allConfirmedMentionsForAttachmentView:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mentionItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mentionUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "mentionItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mentionUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attachmentView:userConfirmedMentionWithUUID:participantIdentifier:", self, v13, v14);

  -[PKAttachmentView drawingDidChangeVisibleStrokes:](self, "drawingDidChangeVisibleStrokes:", 0);
  +[PKStatisticsManager sharedStatisticsManager]();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordMentionItemActivate]((uint64_t)v15);

  mentionUUIDtoParticipant = self->_mentionUUIDtoParticipant;
  if (!mentionUUIDtoParticipant)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v18 = self->_mentionUUIDtoParticipant;
    self->_mentionUUIDtoParticipant = v17;

    mentionUUIDtoParticipant = self->_mentionUUIDtoParticipant;
  }
  objc_msgSend(v21, "mentionItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mentionUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](mentionUUIDtoParticipant, "setObject:forKeyedSubscript:", v6, v20);

}

- (void)mentionViewWillDeactivateMention:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mentionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "mentionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attachmentView:userDeletedMentionWithUUID:", self, v7);

  -[PKAttachmentView drawingDidChangeVisibleStrokes:](self, "drawingDidChangeVisibleStrokes:", 0);
  +[PKStatisticsManager sharedStatisticsManager]();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordMentionItemDeactivate]((uint64_t)v8);

}

- (void)mentionViewDidDeactivateMention:(id)a3
{
  -[PKAttachmentView drawingDidChangeVisibleStrokes:](self, "drawingDidChangeVisibleStrokes:", 0);
}

- (void)proofreadingView:(id)a3 didReplaceWithString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  os_log_t v26;
  void *v27;
  uint8_t v28[15];
  char v29;

  v6 = a3;
  v7 = a4;
  -[PKAttachmentView tiledView](self, "tiledView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionInteraction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v29 = 1;
    -[PKAttachmentView drawing](self, "drawing");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proofreadingItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chStrokeIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "strokesForCHStrokeIdentifiers:didFindAllStrokes:", v14, &v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      +[PKDrawing _boundingBoxForStrokeArray:](PKDrawing, "_boundingBoxForStrokeArray:", v15);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend(v9, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "selectionInteraction:replaceStrokes:withString:inBounds:inAttachment:", v9, v15, v7, self, v17, v19, v21, v23);

      -[PKAttachmentView previousProofreadingItems](self, "previousProofreadingItems");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (os_log_t)objc_msgSend(v25, "mutableCopy");

      objc_msgSend(v6, "proofreadingItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectIdenticalTo:](v26, "removeObjectIdenticalTo:", v27);

      -[PKAttachmentView updateProofreadingResults:](self, "updateProofreadingResults:", v26);
    }
    else
    {
      v26 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v28 = 0;
        _os_log_error_impl(&dword_1BE213000, v26, OS_LOG_TYPE_ERROR, "PKProofreadingView failed to find all the strokes for its group.", v28, 2u);
      }
    }

  }
}

- (id)inlineViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  y = a3.y;
  x = a3.x;
  v46 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v6 = self->_dataDetectorViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v10);
      -[PKAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
      if ((objc_msgSend(v11, "hitTest:") & 1) != 0)
        goto LABEL_34;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = self->_hashtagViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v35;
LABEL_11:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v14)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v15);
      -[PKAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
      if ((objc_msgSend(v11, "hitTest:") & 1) != 0)
        goto LABEL_34;
      if (v13 == ++v15)
      {
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        if (v13)
          goto LABEL_11;
        break;
      }
    }
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = self->_mentionViews;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
LABEL_19:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v18)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v19);
      -[PKAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
      if ((objc_msgSend(v11, "hitTest:") & 1) != 0)
        goto LABEL_34;
      if (v17 == ++v19)
      {
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
        if (v17)
          goto LABEL_19;
        break;
      }
    }
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_proofreadingViews;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
LABEL_27:
    v23 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v22)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v23);
      -[PKAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y, (_QWORD)v26);
      if ((objc_msgSend(v11, "hitTest:") & 1) != 0)
        break;
      if (v21 == ++v23)
      {
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v26, v42, 16);
        if (v21)
          goto LABEL_27;
        goto LABEL_33;
      }
    }
LABEL_34:
    v24 = v11;
    goto LABEL_35;
  }
LABEL_33:
  v24 = 0;
LABEL_35:

  return v24;
}

- (void)layoutInlineViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double x;
  double y;
  double width;
  double height;
  double v35;
  BOOL v36;
  double v37;
  double v38;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CGAffineTransform v52;
  _BYTE v53[128];
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v54 = *MEMORY[0x1E0C80C00];
  memset(&v52, 0, sizeof(v52));
  -[PKAttachmentView drawingTransform](self, "drawingTransform");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAttachmentView dataDetectorViews](self, "dataDetectorViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[PKAttachmentView dataDetectorViews](self, "dataDetectorViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[PKAttachmentView hashtagViews](self, "hashtagViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[PKAttachmentView hashtagViews](self, "hashtagViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v9);

  }
  -[PKAttachmentView mentionViews](self, "mentionViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[PKAttachmentView mentionViews](self, "mentionViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v12);

  }
  -[PKAttachmentView proofreadingViews](self, "proofreadingViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[PKAttachmentView proofreadingViews](self, "proofreadingViews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v15);

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v16 = v3;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v49;
    v43 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v44 = *MEMORY[0x1E0C9D648];
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v49 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v22, "drawingBounds", *(_QWORD *)&v41, *(_QWORD *)&v42, *(_QWORD *)&v43, *(_QWORD *)&v44);
        v47 = v52;
        CGRectApplyAffineTransform(v55, &v47);
        objc_msgSend(v22, "contentScaleFactor");
        UIRectIntegralWithScale();
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        objc_msgSend(v22, "setFrame:");
        if (v22)
          objc_msgSend(v22, "drawingTransform");
        else
          memset(&v46, 0, sizeof(v46));
        v56.origin.x = v24;
        v56.origin.y = v26;
        v56.size.width = v28;
        v56.size.height = v30;
        v57 = CGRectApplyAffineTransform(v56, &v46);
        x = v57.origin.x;
        y = v57.origin.y;
        width = v57.size.width;
        height = v57.size.height;
        v47 = v52;
        v57.origin.x = v24;
        v57.origin.y = v26;
        v57.size.width = v28;
        v57.size.height = v30;
        v58 = CGRectApplyAffineTransform(v57, &v47);
        v35 = vabdd_f64(y, v58.origin.y);
        v36 = vabdd_f64(x, v58.origin.x) < 1.0 && v35 < 1.0;
        v37 = vabdd_f64(width, v58.size.width);
        v38 = vabdd_f64(height, v58.size.height);
        if (!v36 || v37 >= 1.0 || v38 >= 1.0)
        {
          v45 = v52;
          objc_msgSend(v22, "setDrawingTransform:", &v45);
          v59.origin.x = x;
          v59.origin.y = y;
          v59.size.width = width;
          v59.size.height = height;
          v60.origin.y = v43;
          v60.origin.x = v44;
          v60.size.height = v41;
          v60.size.width = v42;
          v19 = !CGRectEqualToRect(v59, v60);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v18);

    if (v19)
    {
      -[PKAttachmentView setDetectionViewsHidden:](self, "setDetectionViewsHidden:", 1);
      +[PKAttachmentView cancelPreviousPerformRequestsWithTarget:selector:object:](PKAttachmentView, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_revealDetectionViews, 0);
      -[PKAttachmentView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_revealDetectionViews, 0, 0.2);
    }
  }
  else
  {

  }
}

- (void)updateDetectionViewVisibility
{
  -[PKAttachmentView revealDetectionViews](self, "revealDetectionViews");
  +[PKAttachmentView cancelPreviousPerformRequestsWithTarget:selector:object:](PKAttachmentView, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_revealDetectionViews, 0);
}

- (void)setDetectionViewsHidden:(BOOL)a3
{
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  self->_detectionViewsHidden = a3;
  v4 = MEMORY[0x1E0C809B0];
  if (a3)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke;
    v10[3] = &unk_1E7778020;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_2;
    v9[3] = &unk_1E7778020;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_3;
    v8[3] = &unk_1E7778020;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_4;
    v7[3] = &unk_1E7778020;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.15);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_5;
    v6[3] = &unk_1E7778020;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.15);
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_6;
    v5[3] = &unk_1E7778020;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.15);
  }
  +[PKAttachmentView cancelPreviousPerformRequestsWithTarget:selector:object:](PKAttachmentView, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_revealDetectionViews, 0);
}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dataDetectorViews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAlpha:", 0.0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "hashtagViews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAlpha:", 0.0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "mentionViews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAlpha:", 0.0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "dataDetectorViews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAlpha:", 1.0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "hashtagViews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAlpha:", 1.0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_6(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "mentionViews", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAlpha:", 1.0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)revealDetectionViews
{
  _BOOL8 v2;

  v2 = self->_isDraggingSelection || self->_toolPickerVisible || self->_hideUntilScroll;
  -[PKAttachmentView setDetectionViewsHidden:](self, "setDetectionViewsHidden:", v2);
}

- (void)updateDataDetectorResults:(id)a3
{
  -[PKAttachmentView updateDetectionViews:withItems:previousItems:](self, "updateDetectionViews:withItems:previousItems:", self->_dataDetectorViews, a3, self->_previousDataDetectorItems);
}

- (void)updateHashtagResults:(id)a3
{
  -[PKAttachmentView updateDetectionViews:withItems:previousItems:](self, "updateDetectionViews:withItems:previousItems:", self->_hashtagViews, a3, self->_previousHashtagItems);
}

- (void)updateMentionResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *previousMentionItems;

  if (self->_deferMentionUpdate)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    previousMentionItems = self->_previousMentionItems;
    self->_previousMentionItems = v4;

  }
  else
  {
    -[PKAttachmentView updateDetectionViews:withItems:previousItems:](self, "updateDetectionViews:withItems:previousItems:", self->_mentionViews, a3, self->_previousMentionItems);
  }
}

- (void)updateProofreadingResults:(id)a3
{
  -[PKAttachmentView updateDetectionViews:withItems:previousItems:](self, "updateDetectionViews:withItems:previousItems:", self->_proofreadingViews, a3, self->_previousProofreadingItems);
}

- (void)updateAllPossibleParticipantNameTokens
{
  PKAttachmentViewHashtagsAndMentionsDelegate **p_hashtagAndMentionsDelegate;
  id WeakRetained;
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  p_hashtagAndMentionsDelegate = &self->_hashtagAndMentionsDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagAndMentionsDelegate);
  self->_deferMentionUpdate = objc_opt_respondsToSelector() & 1;

  if (self->_deferMentionUpdate)
  {
    objc_initWeak(&location, self);
    v5 = objc_loadWeakRetained((id *)p_hashtagAndMentionsDelegate);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__PKAttachmentView_updateAllPossibleParticipantNameTokens__block_invoke;
    v10[3] = &unk_1E7778678;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v5, "allPossibleParticipantNameTokensForAttachmentView:completion:", self, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[PKAttachmentView hashtagAndMentionsDelegate](self, "hashtagAndMentionsDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allPossibleParticipantNameTokensForAttachmentView:", self);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[PKAttachmentView _updateAllPossibleParticipantNameTokens:](self, "_updateAllPossibleParticipantNameTokens:", v9);
    }
  }
}

void __58__PKAttachmentView_updateAllPossibleParticipantNameTokens__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateAllPossibleParticipantNameTokens:", v3);

}

- (void)_updateAllPossibleParticipantNameTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *previousMentionItems;
  NSMutableArray *v9;

  v4 = a3;
  -[PKAttachmentView recognitionManager](self, "recognitionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRecognitionSessionManager setMentionSuffixes:]((uint64_t)v5, v4);

  if (self->_deferMentionUpdate)
  {
    self->_deferMentionUpdate = 0;
    if (-[NSMutableArray count](self->_previousMentionItems, "count"))
    {
      v6 = (void *)MEMORY[0x1E0C99DE8];
      v9 = self->_previousMentionItems;
      objc_msgSend(v6, "array");
      v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      previousMentionItems = self->_previousMentionItems;
      self->_previousMentionItems = v7;

      -[PKAttachmentView updateMentionResults:](self, "updateMentionResults:", v9);
    }
  }
}

- (CGRect)boundingBoxForHashtagOrMentionWithUUID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  double v23;
  double v24;
  double v25;
  double v26;
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
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;
  CGRect result;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v5 = self->_hashtagViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v10, "hashtagItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hashtagUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v10, "frame");
          v23 = v27;
          v24 = v28;
          v25 = v29;
          v26 = v30;

          goto LABEL_20;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v7)
        continue;
      break;
    }
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = self->_mentionViews;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v40;
    while (2)
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v40 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v19, "mentionItem", (_QWORD)v39);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "mentionUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqual:", v4);

        if ((v22 & 1) != 0)
        {
          objc_msgSend(v19, "frame");
          v23 = v31;
          v24 = v32;
          v25 = v33;
          v26 = v34;

          goto LABEL_20;
        }
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      if (v16)
        continue;
      break;
    }
  }

  v23 = *MEMORY[0x1E0C9D648];
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_20:

  v35 = v23;
  v36 = v24;
  v37 = v25;
  v38 = v26;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (id)_accessibilityUserTestingChildren
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v10.receiver = self;
  v10.super_class = (Class)PKAttachmentView;
  -[PKAttachmentView _accessibilityUserTestingChildren](&v10, sel__accessibilityUserTestingChildren);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAttachmentView dataDetectorViews](self, "dataDetectorViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  -[PKAttachmentView hashtagViews](self, "hashtagViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  -[PKAttachmentView mentionViews](self, "mentionViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  return v5;
}

- (void)setRecognitionController:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionController, a3);
}

- (NSArray)additionalStrokes
{
  return self->_additionalStrokes;
}

- (void)setTileContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_tileContainerView, a3);
}

- (UIView)proofreadingContainerView
{
  return self->_proofreadingContainerView;
}

- (void)setProofreadingContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_proofreadingContainerView, a3);
}

- (BOOL)contentHidden
{
  return self->_contentHidden;
}

- (BOOL)sixChannelBlending
{
  return self->_sixChannelBlending;
}

- (BOOL)wantsDataDetection
{
  return self->_wantsDataDetection;
}

- (BOOL)wantsMentionDetection
{
  return self->_wantsMentionDetection;
}

- (BOOL)wantsHashtagDetection
{
  return self->_wantsHashtagDetection;
}

- (BOOL)wantsProofreadingDetection
{
  return self->_wantsProofreadingDetection;
}

- (BOOL)isSharedViaICloud
{
  return self->_isSharedViaICloud;
}

- (void)setIsSharedViaICloud:(BOOL)a3
{
  self->_isSharedViaICloud = a3;
}

- (PKAttachmentViewHashtagsAndMentionsDelegate)hashtagAndMentionsDelegate
{
  return (PKAttachmentViewHashtagsAndMentionsDelegate *)objc_loadWeakRetained((id *)&self->_hashtagAndMentionsDelegate);
}

- (CGRect)cachedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedBounds.origin.x;
  y = self->_cachedBounds.origin.y;
  width = self->_cachedBounds.size.width;
  height = self->_cachedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  self->_cachedBounds = a3;
}

- (NSMutableArray)dataDetectorViews
{
  return self->_dataDetectorViews;
}

- (void)setDataDetectorViews:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectorViews, a3);
}

- (NSMutableArray)mentionViews
{
  return self->_mentionViews;
}

- (void)setMentionViews:(id)a3
{
  objc_storeStrong((id *)&self->_mentionViews, a3);
}

- (NSMutableArray)hashtagViews
{
  return self->_hashtagViews;
}

- (void)setHashtagViews:(id)a3
{
  objc_storeStrong((id *)&self->_hashtagViews, a3);
}

- (NSMutableArray)proofreadingViews
{
  return self->_proofreadingViews;
}

- (void)setProofreadingViews:(id)a3
{
  objc_storeStrong((id *)&self->_proofreadingViews, a3);
}

- (BOOL)detectionViewsHidden
{
  return self->_detectionViewsHidden;
}

- (BOOL)hideUntilScroll
{
  return self->_hideUntilScroll;
}

- (void)setHideUntilScroll:(BOOL)a3
{
  self->_hideUntilScroll = a3;
}

- (BOOL)toolPickerVisible
{
  return self->_toolPickerVisible;
}

- (void)setToolPickerVisible:(BOOL)a3
{
  self->_toolPickerVisible = a3;
}

- (BOOL)isDraggingSelection
{
  return self->_isDraggingSelection;
}

- (void)setIsDraggingSelection:(BOOL)a3
{
  self->_isDraggingSelection = a3;
}

- (BOOL)ignoreInitialDetectionItemsForStatistics
{
  return self->_ignoreInitialDetectionItemsForStatistics;
}

- (void)setIgnoreInitialDetectionItemsForStatistics:(BOOL)a3
{
  self->_ignoreInitialDetectionItemsForStatistics = a3;
}

- (BOOL)deferMentionUpdate
{
  return self->_deferMentionUpdate;
}

- (void)setDeferMentionUpdate:(BOOL)a3
{
  self->_deferMentionUpdate = a3;
}

- (NSMutableArray)previousDataDetectorItems
{
  return self->_previousDataDetectorItems;
}

- (void)setPreviousDataDetectorItems:(id)a3
{
  objc_storeStrong((id *)&self->_previousDataDetectorItems, a3);
}

- (NSMutableArray)previousHashtagItems
{
  return self->_previousHashtagItems;
}

- (void)setPreviousHashtagItems:(id)a3
{
  objc_storeStrong((id *)&self->_previousHashtagItems, a3);
}

- (NSMutableArray)previousMentionItems
{
  return self->_previousMentionItems;
}

- (void)setPreviousMentionItems:(id)a3
{
  objc_storeStrong((id *)&self->_previousMentionItems, a3);
}

- (NSMutableArray)previousProofreadingItems
{
  return self->_previousProofreadingItems;
}

- (void)setPreviousProofreadingItems:(id)a3
{
  objc_storeStrong((id *)&self->_previousProofreadingItems, a3);
}

- (PKProgressAlertController)progressAlertController
{
  return self->_progressAlertController;
}

- (void)setProgressAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_progressAlertController, a3);
}

- (NSProgress)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(id)a3
{
  objc_storeStrong((id *)&self->_currentProgress, a3);
}

- (BOOL)didReceiveTextConversion
{
  return self->_didReceiveTextConversion;
}

- (void)setDidReceiveTextConversion:(BOOL)a3
{
  self->_didReceiveTextConversion = a3;
}

- (NSMutableDictionary)mentionUUIDtoParticipant
{
  return self->_mentionUUIDtoParticipant;
}

- (void)setMentionUUIDtoParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_mentionUUIDtoParticipant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionUUIDtoParticipant, 0);
  objc_storeStrong((id *)&self->_currentProgress, 0);
  objc_storeStrong((id *)&self->_progressAlertController, 0);
  objc_storeStrong((id *)&self->_previousProofreadingItems, 0);
  objc_storeStrong((id *)&self->_previousMentionItems, 0);
  objc_storeStrong((id *)&self->_previousHashtagItems, 0);
  objc_storeStrong((id *)&self->_previousDataDetectorItems, 0);
  objc_storeStrong((id *)&self->_proofreadingViews, 0);
  objc_storeStrong((id *)&self->_hashtagViews, 0);
  objc_storeStrong((id *)&self->_mentionViews, 0);
  objc_storeStrong((id *)&self->_dataDetectorViews, 0);
  objc_destroyWeak((id *)&self->_hashtagAndMentionsDelegate);
  objc_storeStrong((id *)&self->_proofreadingContainerView, 0);
  objc_storeStrong((id *)&self->_additionalStrokes, 0);
  objc_storeStrong((id *)&self->_recognitionController, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);
  objc_storeStrong((id *)&self->_purgedTiles, 0);
  objc_storeStrong((id *)&self->_offscreenTiles, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_strokeSpatialCache, 0);
  objc_storeStrong((id *)&self->_tileContainerView, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_listenerID, 0);
}

@end
