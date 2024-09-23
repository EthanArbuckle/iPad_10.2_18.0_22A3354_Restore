@implementation PDFPageView

- (PDFPageView)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  PDFPageView *v13;
  PDFPageViewPrivate *v14;
  PDFPageViewPrivate *v15;
  PDFPageLayer *v16;
  void *v17;
  uint64_t v18;
  PDFPageViewPrivate *v19;
  NSMutableDictionary *activeControls;
  NSMutableArray *v21;
  PDFPageViewPrivate *v22;
  NSMutableArray *pageSignatures;
  PDFPageViewAnnotationController *v24;
  PDFPageViewPrivate *v25;
  PDFPageViewAnnotationController *annotationController;
  NSMutableArray *v27;
  PDFPageViewPrivate *v28;
  NSMutableArray *pageAnnotationEffects;
  PDFPageViewPrivate *v30;
  CALayer *bookmarkLayer;
  CALayer *v32;
  PDFPageViewPrivate *v33;
  CALayer *backgroundLayer;
  uint64_t v35;
  PDFPageViewPrivate *v36;
  PDFPageLayerEffect *searchLayer;
  void *v38;
  void *v39;
  objc_super v41;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "boundsForBox:", objc_msgSend(v10, "displayBox"));
  v11 = *MEMORY[0x24BDBEFB0];
  v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v41.receiver = self;
  v41.super_class = (Class)PDFPageView;
  v13 = -[PDFPageView initWithFrame:](&v41, sel_initWithFrame_, v11, v12);
  if (v13)
  {
    v14 = objc_alloc_init(PDFPageViewPrivate);
    v15 = v13->_private;
    v13->_private = v14;

    objc_storeWeak((id *)&v13->_private->page, v8);
    objc_storeWeak((id *)&v13->_private->geometryInterface, v9);
    objc_storeWeak((id *)&v13->_private->renderingProperties, v10);
    v16 = -[PDFPageLayer initWithPage:geometryInterface:andRenderingProperties:]([PDFPageLayer alloc], "initWithPage:geometryInterface:andRenderingProperties:", v8, v9, v10);
    objc_storeWeak((id *)&v13->_private->pageLayer, v16);
    -[PDFPageLayer setZPosition:](v16, "setZPosition:", -1100.0);
    -[PDFPageView layer](v13, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v16);

    objc_storeWeak((id *)&v13->_private->activeAnnotation, 0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v13->_private;
    activeControls = v19->activeControls;
    v19->activeControls = (NSMutableDictionary *)v18;

    v13->_private->isPerformingUndo = 0;
    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v22 = v13->_private;
    pageSignatures = v22->pageSignatures;
    v22->pageSignatures = v21;

    v24 = -[PDFPageViewAnnotationController initWithPDFPageView:]([PDFPageViewAnnotationController alloc], "initWithPDFPageView:", v13);
    v25 = v13->_private;
    annotationController = v25->annotationController;
    v25->annotationController = v24;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = v13->_private;
    pageAnnotationEffects = v28->pageAnnotationEffects;
    v28->pageAnnotationEffects = v27;

    v13->_private->visibilityDelegateIndex = 0x7FFFFFFFFFFFFFFFLL;
    v30 = v13->_private;
    bookmarkLayer = v30->bookmarkLayer;
    v30->bookmarkLayer = 0;

    v13->_private->bookmarkSize = (CGSize)*MEMORY[0x24BDBF148];
    v32 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    v33 = v13->_private;
    backgroundLayer = v33->backgroundLayer;
    v33->backgroundLayer = v32;

    v13->_private->backgroundQuality = 2;
    -[CALayer setFrame:](v13->_private->backgroundLayer, "setFrame:", PDFRectToCGRect(-[PDFPageView bounds](v13, "bounds")));
    -[PDFPageLayer addSublayer:](v16, "addSublayer:", v13->_private->backgroundLayer);
    -[CALayer setZPosition:](v13->_private->backgroundLayer, "setZPosition:", -900.0);
    -[CALayer setMinificationFilter:](v13->_private->backgroundLayer, "setMinificationFilter:", *MEMORY[0x24BDE5B58]);
    -[PDFPageView _updateBackgroundColor](v13, "_updateBackgroundColor");
    +[PDFPageLayerEffect createPDFSelectionLayerEffectsForSelections:withLayer:](PDFPageLayerEffect, "createPDFSelectionLayerEffectsForSelections:withLayer:", 0, v16);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v13->_private;
    searchLayer = v36->searchLayer;
    v36->searchLayer = (PDFPageLayerEffect *)v35;

    -[PDFPageLayerEffect setZPosition:](v13->_private->searchLayer, "setZPosition:", -500.0);
    -[PDFPageView _setupBookmarkLayer](v13, "_setupBookmarkLayer");
    -[PDFPageView _setuppageAnnotationEffects](v13, "_setuppageAnnotationEffects");
    -[PDFPageView setUserInteractionEnabled:](v13, "setUserInteractionEnabled:", 0);
    if (GetDefaultsWriteHighlightDetectedAnnotations())
      -[PDFPageView enableHighlightDetectedFormFields:](v13, "enableHighlightDetectedFormFields:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v13, sel__didRotatePageNotification_, CFSTR("PDFPageDidRotate"), v8);
    objc_msgSend(v38, "addObserver:selector:name:object:", v13, sel__didRotatePageNotification_, CFSTR("PDFPageDidChangeBounds"), v8);
    objc_msgSend(v8, "document");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v13, sel__formChanged_, CFSTR("PDFFormDidChangeValue"), v39);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  void *v5;
  PDFPageViewPrivate *v6;
  PDFPageLayerEffect *searchLayer;
  PDFPageViewPrivate *v8;
  CALayer *backgroundLayer;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CALayer *bookmarkLayer;
  PDFPageViewPrivate *v24;
  CALayer *v25;
  objc_super v26;
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

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x24BDE57D8], "activateBackground:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  -[PDFPageLayerEffect UUID](self->_private->searchLayer, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "removePageLayerEffectForID:", v5);

  v6 = self->_private;
  searchLayer = v6->searchLayer;
  v6->searchLayer = 0;

  -[CALayer removeFromSuperlayer](self->_private->backgroundLayer, "removeFromSuperlayer");
  v8 = self->_private;
  backgroundLayer = v8->backgroundLayer;
  v8->backgroundLayer = 0;

  objc_msgSend(WeakRetained, "removeFromSuperlayer");
  objc_storeWeak((id *)&self->_private->pageLayer, 0);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_private->pageSignatures;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v14++) + 16), "removeFromSuperlayer");
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->_private->pageSignatures, "removeAllObjects");
  v15 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (v15)
  {
    -[PDFPageView removeControlForAnnotation:](self, "removeControlForAnnotation:", v15);
    v16 = objc_loadWeakRetained((id *)&self->_private->page);
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActiveAnnotation:", 0);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_private->pageAnnotationEffects;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        -[PDFPageView removePageLayerEffectForID:](self, "removePageLayerEffectForID:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  -[NSMutableArray removeAllObjects](self->_private->pageAnnotationEffects, "removeAllObjects");
  bookmarkLayer = self->_private->bookmarkLayer;
  if (bookmarkLayer)
  {
    -[CALayer removeFromSuperlayer](bookmarkLayer, "removeFromSuperlayer");
    v24 = self->_private;
    v25 = v24->bookmarkLayer;
    v24->bookmarkLayer = 0;

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  v26.receiver = self;
  v26.super_class = (Class)PDFPageView;
  -[PDFPageView dealloc](&v26, sel_dealloc);
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;

  if (!a3)
  {
    -[PDFPageView undoManager](self, "undoManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllActionsWithTarget:", self);

  }
}

- (id)renderingProperties
{
  return objc_loadWeakRetained((id *)&self->_private->renderingProperties);
}

- (void)setNeedsTilesUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "setNeedsTilesUpdate");

  -[PDFPageView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (int64_t)displayBox
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  v3 = objc_msgSend(WeakRetained, "displayBox");

  return v3;
}

- (BOOL)isVisible
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  v3 = objc_msgSend(WeakRetained, "isVisible");

  return v3;
}

- (void)addPageLayerEffect:(id)a3
{
  PDFPageLayerInterface **p_pageLayer;
  id v4;
  id WeakRetained;

  p_pageLayer = &self->_private->pageLayer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pageLayer);
  objc_msgSend(WeakRetained, "addPageLayerEffect:", v4);

}

- (void)removePageLayerEffectForID:(id)a3
{
  PDFPageLayerInterface **p_pageLayer;
  id v4;
  id WeakRetained;

  p_pageLayer = &self->_private->pageLayer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pageLayer);
  objc_msgSend(WeakRetained, "removePageLayerEffectForID:", v4);

}

- (id)pageLayerEffectForID:(id)a3
{
  PDFPageLayerInterface **p_pageLayer;
  id v4;
  id WeakRetained;
  void *v6;

  p_pageLayer = &self->_private->pageLayer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pageLayer);
  objc_msgSend(WeakRetained, "pageLayerEffectForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updatePageLayerEffectForID:(id)a3
{
  PDFPageLayerInterface **p_pageLayer;
  id v4;
  id WeakRetained;

  p_pageLayer = &self->_private->pageLayer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_pageLayer);
  objc_msgSend(WeakRetained, "updatePageLayerEffectForID:", v4);

}

- (void)updatePageLayerEffects
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "updatePageLayerEffects");

}

- (CGAffineTransform)layerEffectTransform
{
  id WeakRetained;
  CGAffineTransform *result;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "layerEffectTransform");
    WeakRetained = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)scalePageLayerEffects:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "scalePageLayerEffects:", a3);

}

- (void)setEnableTileUpdates:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "setEnableTileUpdates:", v3);

}

- (BOOL)enablesTileUpdates
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  v3 = objc_msgSend(WeakRetained, "enablesTileUpdates");

  return v3;
}

- (void)forceTileUpdate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "forceTileUpdate");

}

- (void)clearTiles
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "clearTiles");

}

- (void)saveOriginalTileLayout
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "saveOriginalTileLayout");

}

- (void)restoreOriginalTileLayout
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "restoreOriginalTileLayout");

}

- (void)applyTileLayoutScale:(double)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "applyTileLayoutScale:", a3);

}

- (void)setVisibilityDelegateIndex:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "setVisibilityDelegateIndex:", a3);

}

- (unint64_t)visibilityDelegateIndex
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  v3 = objc_msgSend(WeakRetained, "visibilityDelegateIndex");

  return v3;
}

- (void)_updateBackgroundColor
{
  void *v3;
  uint64_t v4;
  CALayer *backgroundLayer;
  id v6;
  id WeakRetained;

  -[CALayer contents](self->_private->backgroundLayer, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
    v4 = objc_msgSend(WeakRetained, "pageBackgroundColorHint");
    backgroundLayer = self->_private->backgroundLayer;
    if (v4)
    {
      -[CALayer setBackgroundColor:](backgroundLayer, "setBackgroundColor:", objc_msgSend(WeakRetained, "pageBackgroundColorHint"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](backgroundLayer, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  }
}

- (id)page
{
  return objc_loadWeakRetained((id *)&self->_private->page);
}

- (id)geometryInterface
{
  return objc_loadWeakRetained((id *)&self->_private->geometryInterface);
}

- (id)pageLayer
{
  return objc_loadWeakRetained((id *)&self->_private->pageLayer);
}

- (void)setBackgroundImage:(id)a3 atBackgroundQuality:(int)a4
{
  id v6;
  UIImage *v7;
  PDFPageViewPrivate *v8;
  CALayer *backgroundLayer;
  id WeakRetained;
  double v11;
  CALayer *v12;
  double v13;
  double v14;
  id v15;
  id v16;
  CGAffineTransform v17;

  v6 = a3;
  v7 = self->_private->backgroundImage;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x24BDE57D8], "activateBackground:", 1);
  v8 = self->_private;
  backgroundLayer = v8->backgroundLayer;
  WeakRetained = objc_loadWeakRetained((id *)&v8->page);
  v11 = PDFDegToRad((double)objc_msgSend(WeakRetained, "rotation"));
  CGAffineTransformMakeRotation(&v17, v11);
  -[CALayer setAffineTransform:](backgroundLayer, "setAffineTransform:", &v17);

  v12 = self->_private->backgroundLayer;
  -[PDFPageView frame](self, "frame");
  v14 = v13;
  -[PDFPageView frame](self, "frame");
  -[CALayer setFrame:](v12, "setFrame:", 0.0, 0.0, v14);
  v15 = objc_retainAutorelease(v6);
  -[CALayer setContents:](self->_private->backgroundLayer, "setContents:", objc_msgSend(v15, "CGImage"));
  objc_storeStrong((id *)&self->_private->backgroundImage, v15);
  self->_private->backgroundQuality = a4;
  v16 = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(v16, "setMasksToBounds:", 0);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  objc_sync_exit(v7);

}

- (BOOL)hasBackgroundImage
{
  PDFPageView *v2;
  UIImage *v3;

  v2 = self;
  v3 = self->_private->backgroundImage;
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_private->backgroundImage != 0;
  objc_sync_exit(v3);

  return (char)v2;
}

- (id)backgroundImage
{
  UIImage *v3;
  UIImage *v4;

  v3 = self->_private->backgroundImage;
  objc_sync_enter(v3);
  v4 = self->_private->backgroundImage;
  objc_sync_exit(v3);

  return v4;
}

- (int)backgroundImageQuality
{
  PDFPageView *v2;
  UIImage *v3;

  v2 = self;
  v3 = self->_private->backgroundImage;
  objc_sync_enter(v3);
  LODWORD(v2) = v2->_private->backgroundQuality;
  objc_sync_exit(v3);

  return (int)v2;
}

- (void)setSearchSelections:(id)a3
{
  -[PDFPageLayerEffect setSelections:](self->_private->searchLayer, "setSelections:", a3);
}

- (void)addSearchSelection:(id)a3
{
  if (a3)
    -[PDFPageLayerEffect addSelection:](self->_private->searchLayer, "addSelection:");
}

- (void)previewRotatePage:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  __int128 v10;
  id WeakRetained;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  v4 = PDFDegToRad(a3);
  -[PDFPageView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v9 = v7 * 0.5;
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v14.c = v10;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v13.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&v13.c = v10;
  *(_OWORD *)&v13.tx = *(_OWORD *)&v14.tx;
  CGAffineTransformTranslate(&v14, &v13, v5 * 0.5, v9);
  v12 = v14;
  CGAffineTransformRotate(&v13, &v12, v4);
  v14 = v13;
  v12 = v13;
  CGAffineTransformTranslate(&v13, &v12, -(v6 * 0.5), -(v8 * 0.5));
  v14 = v13;
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  v13 = v14;
  objc_msgSend(WeakRetained, "setAffineTransform:", &v13);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)hideTileLayer:(BOOL)a3
{
  -[PDFPageLayerEffect setHidden:](self->_private->searchLayer, "setHidden:", a3);
}

- (void)colorWidgetBackgrounds:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "annotations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v11, "valueForAnnotationKey:", CFSTR("/Subtype"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqualToString:", CFSTR("/Widget")))
            -[PDFPageView updateAnnotation:](self, "updateAnnotation:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)enableHighlightDetectedFormFields:(BOOL)a3
{
  PDFHighlightDetectedFormFieldsEffectLayer *detectedFormFieldBoundingBoxesLayer;
  PDFHighlightDetectedFormFieldsEffectLayer *v5;
  id WeakRetained;
  uint64_t v7;
  PDFPageViewPrivate *v8;
  PDFHighlightDetectedFormFieldsEffectLayer *v9;
  void *v10;
  PDFPageViewPrivate *v11;
  PDFHighlightDetectedFormFieldsEffectLayer *v12;

  detectedFormFieldBoundingBoxesLayer = self->_private->detectedFormFieldBoundingBoxesLayer;
  if (a3)
  {
    if (!detectedFormFieldBoundingBoxesLayer)
    {
      v5 = [PDFHighlightDetectedFormFieldsEffectLayer alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
      v7 = -[PDFHighlightDetectedFormFieldsEffectLayer initWithPage:](v5, "initWithPage:", WeakRetained);
      v8 = self->_private;
      v9 = v8->detectedFormFieldBoundingBoxesLayer;
      v8->detectedFormFieldBoundingBoxesLayer = (PDFHighlightDetectedFormFieldsEffectLayer *)v7;

      -[PDFHighlightDetectedFormFieldsEffectLayer setDisplayBox:](self->_private->detectedFormFieldBoundingBoxesLayer, "setDisplayBox:", 1);
      -[PDFPageView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSublayer:", self->_private->detectedFormFieldBoundingBoxesLayer);

      -[PDFHighlightDetectedFormFieldsEffectLayer setFrame:](self->_private->detectedFormFieldBoundingBoxesLayer, "setFrame:", PDFRectToCGRect(-[PDFPageView bounds](self, "bounds")));
      -[PDFHighlightDetectedFormFieldsEffectLayer setZPosition:](self->_private->detectedFormFieldBoundingBoxesLayer, "setZPosition:", 0.0);
      detectedFormFieldBoundingBoxesLayer = self->_private->detectedFormFieldBoundingBoxesLayer;
    }
    -[PDFHighlightDetectedFormFieldsEffectLayer updateVisibleLayers](detectedFormFieldBoundingBoxesLayer, "updateVisibleLayers");
  }
  else if (detectedFormFieldBoundingBoxesLayer)
  {
    -[PDFHighlightDetectedFormFieldsEffectLayer removeFromSuperlayer](detectedFormFieldBoundingBoxesLayer, "removeFromSuperlayer");
    v11 = self->_private;
    v12 = v11->detectedFormFieldBoundingBoxesLayer;
    v11->detectedFormFieldBoundingBoxesLayer = 0;

  }
}

- (void)updateAnnotation:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v6 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (WeakRetained)
  {
    objc_msgSend(v4, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup")) && ShouldRenderAnnotationsInPDFKit())
    {
      objc_msgSend(WeakRetained, "annotations");
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
LABEL_6:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "popup", (_QWORD)v15);
          v13 = (id)objc_claimAutoreleasedReturnValue();

          if (v13 == v4)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
            if (v10)
              goto LABEL_6;
            break;
          }
        }
      }

      -[PDFPageView _updateAnnotationVisibility:](self, "_updateAnnotationVisibility:", v4);
      objc_msgSend(v4, "pdfAnnotationUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFPageView updatePageLayerEffectForID:](self, "updatePageLayerEffectForID:", v14);

    }
    else
    {
      if (!objc_msgSend(v4, "handledByPDFKit"))
      {
LABEL_16:

        goto LABEL_17;
      }
      -[PDFPageView _updateAnnotationVisibility:](self, "_updateAnnotationVisibility:", v4);
      objc_msgSend(v4, "pdfAnnotationUUID");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[PDFPageView updatePageLayerEffectForID:](self, "updatePageLayerEffectForID:", v8);
    }

    goto LABEL_16;
  }
LABEL_17:

}

- (void)_updateAnnotationVisibility:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  if (WeakRetained)
  {
    objc_msgSend(v11, "pdfAnnotationUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFPageView pageLayerEffectForID:](self, "pageLayerEffectForID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v11, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/Widget"));

    if (v8)
    {
      if ((objc_msgSend(v11, "isTextWidget") & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v11, "control");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v9 != 0;

      }
    }
    if ((objc_msgSend(v11, "shouldDisplay") & 1) != 0)
    {
      v10 = objc_msgSend(WeakRetained, "displaysAnnotations") ^ 1 | v8;
      if (objc_msgSend(v6, "isHidden") != (_DWORD)v10)
        goto LABEL_14;
    }
    else if ((objc_msgSend(v6, "isHidden") & 1) == 0)
    {
      v10 = 1;
LABEL_14:
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      objc_msgSend(v6, "setHidden:", v10);
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      goto LABEL_15;
    }
    if ((v8 & 1) == 0)
      objc_msgSend(v6, "setNeedsDisplay");
    goto LABEL_15;
  }
LABEL_16:

}

- (void)removeAnnotation:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _QWORD *v11;
  void *v12;
  NSMutableArray *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Stamp"))
    && objc_msgSend(v4, "isSignature"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_private->pageSignatures;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((id)v11[1] == v4)
          {
            v13 = v11;

            -[objc_class removeFromSuperlayer](v13[2].super.super.isa, "removeFromSuperlayer", (_QWORD)v14);
            -[NSMutableArray removeObject:](self->_private->pageSignatures, "removeObject:", v13);
            v6 = v13;
            goto LABEL_14;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(v4, "pdfAnnotationUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFPageView removePageLayerEffectForID:](self, "removePageLayerEffectForID:", v12);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (id)activeAnnotation
{
  void *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (!WeakRetained)
  {
    -[PDFPageViewAnnotationController activeAnnotation](self->_private->annotationController, "activeAnnotation");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  return WeakRetained;
}

- (void)addControlForAnnotation:(id)a3
{
  id v4;
  NSMutableDictionary *activeControls;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;

  v4 = a3;
  activeControls = self->_private->activeControls;
  v14 = v4;
  objc_msgSend(v4, "pdfAnnotationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeControls, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
    objc_msgSend(WeakRetained, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "isSynthesizedFormField"))
    {
      v10 = objc_loadWeakRetained((id *)&self->_private->page);
      objc_msgSend(v10, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "controller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "activateAnnotation:", v14);
    }
    else
    {
      objc_msgSend(v9, "activeAnnotation");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[PDFPageViewAnnotationController addControlForAnnotation:](self->_private->annotationController, "addControlForAnnotation:", v14);
      if (v10)
        v13 = v10 == v14;
      else
        v13 = 1;
      if (!v13)
        objc_msgSend(v9, "removeControlForAnnotation:", v10);
    }

  }
}

- (void)_rotateActiveAnnotation
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "pdfAnnotationUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NSMutableDictionary objectForKey:](self->_private->activeControls, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v6, "bounds");
        -[PDFPageView _updateWidgetControl:forBounds:](self, "_updateWidgetControl:forBounds:", v5);
      }

    }
    WeakRetained = v6;
  }

}

- (void)removeControlForAnnotation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  -[PDFPageViewAnnotationController removeControlForAnnotation:](self->_private->annotationController, "removeControlForAnnotation:", v8);
  v4 = v8;
  if (v8)
  {
    objc_msgSend(v8, "pdfAnnotationUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary objectForKey:](self->_private->activeControls, "objectForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        objc_msgSend(v8, "setControl:", 0);
        objc_msgSend(v6, "removeFromSuperview");
        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);

        if (WeakRetained == v8)
          objc_storeWeak((id *)&self->_private->activeAnnotation, 0);
        -[NSMutableDictionary removeObjectForKey:](self->_private->activeControls, "removeObjectForKey:", v5);
      }

    }
    v4 = v8;
  }

}

- (void)addMarkupWithStyle:(unint64_t)a3 forIndexSet:(id)a4
{
  -[PDFPageViewAnnotationController addMarkupWithStyle:forIndexSet:](self->_private->annotationController, "addMarkupWithStyle:forIndexSet:", a3, a4);
}

- (id)markupAnnotationsForIndexSet:(id)a3
{
  return -[PDFPageViewAnnotationController markupAnnotationsForIndexSet:](self->_private->annotationController, "markupAnnotationsForIndexSet:", a3);
}

- (void)populateFormFieldsWithAutoFillSuggestion:(id)a3 completionHandler:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  NSUInteger v38;
  uint64_t v39;
  NSUInteger v40;
  unint64_t v41;
  uint64_t v42;
  NSUInteger v43;
  uint64_t j;
  uint64_t v45;
  NSRange v46;
  void *v47;
  void *v48;
  id v49;
  void (**v50)(id, void *);
  uint64_t v51;
  void *v52;
  id WeakRetained;
  id obj;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  PDFPageView *v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[5];
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;
  NSRange v99;
  NSRange v100;

  v98 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v50 = (void (**)(id, void *))a4;
  objc_msgSend(v49, "contents");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v62, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v7 = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  v8 = v7;
  if (v7 && objc_msgSend(v7, "isTextWidget"))
  {
    v9 = v8;
    objc_msgSend(v8, "control");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v8;
    objc_msgSend(WeakRetained, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "activeAnnotation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "isSynthesizedFormField") & 1) != 0)
    {
      v60 = 0;
    }
    else
    {

      v60 = 0;
      v9 = 0;
    }
  }

  v91 = 0;
  v92 = &v91;
  v93 = 0x2050000000;
  v13 = (void *)getAFInsertionManagerClass_softClass;
  v94 = getAFInsertionManagerClass_softClass;
  if (!getAFInsertionManagerClass_softClass)
  {
    v86 = MEMORY[0x24BDAC760];
    v87 = 3221225472;
    v88 = (uint64_t)__getAFInsertionManagerClass_block_invoke;
    v89 = (uint64_t)&unk_24C25C890;
    v90 = &v91;
    __getAFInsertionManagerClass_block_invoke((uint64_t)&v86);
    v13 = (void *)v92[3];
  }
  v63 = v9;
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v91, 8);
  objc_msgSend(v14, "preferredInsertionOrder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "annotations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v9 && (v18 = objc_msgSend(v16, "indexOfObjectIdenticalTo:")) != 0)
  {
    objc_msgSend(v17, "subarrayWithRange:", v18, objc_msgSend(v17, "count") - v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v19;
  }
  else
  {
    v20 = v17;
  }
  v56 = v20;
  if ((unint64_t)objc_msgSend(v20, "count") >= 2)
  {
    v86 = 0;
    v87 = (uint64_t)&v86;
    v88 = 0x2020000000;
    v89 = 0x7FFFFFFFFFFFFFFFLL;
    v85[0] = MEMORY[0x24BDAC760];
    v85[1] = 3221225472;
    v85[2] = __74__PDFPageView_populateFormFieldsWithAutoFillSuggestion_completionHandler___block_invoke;
    v85[3] = &unk_24C25D1B0;
    v85[4] = &v86;
    objc_msgSend(v56, "enumerateObjectsUsingBlock:", v85);
    if (*(_QWORD *)(v87 + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v56, "subarrayWithRange:", 0);
      v21 = objc_claimAutoreleasedReturnValue();

      v56 = (void *)v21;
    }
    _Block_object_dispose(&v86, 8);
  }
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v15;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v82;
    v51 = *MEMORY[0x24BDF7E50];
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v82 != v55)
        {
          v23 = v22;
          objc_enumerationMutation(obj);
          v22 = v23;
        }
        v58 = v22;
        v24 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v22);
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v65 = v56;
        v25 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v78;
          while (2)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v78 != v26)
                objc_enumerationMutation(v65);
              v28 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
              if (objc_msgSend(v28, "isActivatableTextField"))
              {
                objc_msgSend(v28, "autoFillTextContentType");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = v29;
                v30 = v29;
                if (v29)
                {
                  v31 = objc_msgSend(v29, "isEqualToString:", v24);
                  v30 = v68;
                  if (v31)
                  {
                    v73[0] = MEMORY[0x24BDAC760];
                    v73[1] = 3221225472;
                    v73[2] = __74__PDFPageView_populateFormFieldsWithAutoFillSuggestion_completionHandler___block_invoke_2;
                    v73[3] = &unk_24C25D1D8;
                    v74 = v63;
                    v75 = self;
                    v76 = v60;
                    v32 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD1AEB4](v73);
                    objc_msgSend(v28, "autoFillTextContentType");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v62, "objectForKeyedSubscript:", v64);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v67, "length"))
                    {
                      objc_msgSend(WeakRetained, "formFieldGroupForAnnotation:", v28);
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      v33 = objc_msgSend(v64, "isEqualToString:", v51);
                      if (v59)
                        v34 = v33;
                      else
                        v34 = 0;
                      if (v34 == 1)
                      {
                        v35 = objc_msgSend(v67, "length");
                        v36 = objc_msgSend(v59, "count");
                        v37 = objc_msgSend(v59, "count");
                        v38 = objc_msgSend(v67, "length");
                        v71 = 0u;
                        v72 = 0u;
                        v69 = 0u;
                        v70 = 0u;
                        v66 = v59;
                        v39 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v69, v95, 16);
                        if (v39)
                        {
                          v40 = 0;
                          v41 = v35 + v36 - 1;
                          v42 = *(_QWORD *)v70;
                          v43 = v41 / v37;
                          do
                          {
                            for (j = 0; j != v39; ++j)
                            {
                              if (*(_QWORD *)v70 != v42)
                                objc_enumerationMutation(v66);
                              v45 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * j);
                              v99.location = v40;
                              v99.length = v43;
                              v100.location = 0;
                              v100.length = v38;
                              v46 = NSIntersectionRange(v99, v100);
                              if (v46.length)
                              {
                                objc_msgSend(v67, "substringWithRange:", v46.location, v46.length);
                                v47 = (void *)objc_claimAutoreleasedReturnValue();
                                ((void (**)(_QWORD, void *, uint64_t))v32)[2](v32, v47, v45);

                              }
                              v40 += v43;
                            }
                            v39 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v69, v95, 16);
                          }
                          while (v39);
                        }

                      }
                      else
                      {
                        ((void (**)(_QWORD, void *, void *))v32)[2](v32, v67, v28);
                      }
                      objc_msgSend(v28, "autoFillTextContentType");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "removeObject:", v48);

                      goto LABEL_52;
                    }

                    v30 = v68;
                  }
                }

              }
            }
            v25 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v77, v96, 16);
            if (v25)
              continue;
            break;
          }
        }
LABEL_52:

        v22 = v58 + 1;
      }
      while (v58 + 1 != v57);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
    }
    while (v57);
  }

  if (v50)
    v50[2](v50, v52);

}

void __74__PDFPageView_populateFormFieldsWithAutoFillSuggestion_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  id v10;

  v7 = a2;
  v8 = v7;
  if (a3)
  {
    v10 = v7;
    v9 = objc_msgSend(v7, "isAutofillNewContextStart");
    v8 = v10;
    if (v9)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
      *a4 = 1;
    }
  }

}

void __74__PDFPageView_populateFormFieldsWithAutoFillSuggestion_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isTextWidget") && *(id *)(a1 + 32) == v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "setStringValue:onTextWidgetAnnotation:withTextView:", v6, v5, *(_QWORD *)(a1 + 48));
  }
  else if (objc_msgSend(v5, "isTextWidget"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setStringValue:onTextWidgetAnnotation:", v6, v5);
  }
  else if (objc_msgSend(v5, "isSynthesizedFormField"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setStringValue:onTextAnnotation:", v6, v5);
  }
  objc_msgSend(v5, "setAutofillEntryType:", 3);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  id WeakRetained;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  v10.receiver = self;
  v10.super_class = (Class)PDFPageView;
  -[PDFPageView setFrame:](&v10, sel_setFrame_, a3.origin.x, a3.origin.y);
  if (self->_private)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v6 = PDFPointMake(0.0, 0.0);
    v8 = v7;
    WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
    objc_msgSend(WeakRetained, "setFrame:", v6, v8, width, height);

    -[CALayer setFrame:](self->_private->backgroundLayer, "setFrame:", v6, v8, width, height);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[PDFPageView setNeedsTilesUpdate](self, "setNeedsTilesUpdate");
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PDFPageView;
  -[PDFPageView setHidden:](&v6, sel_setHidden_);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  objc_msgSend(WeakRetained, "setHidden:", v3);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)_setupBookmarkLayer
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "displaysBookmarksForPages")
    && objc_msgSend(WeakRetained, "isBookmarked"))
  {
    -[PDFPageView addBookmark](self, "addBookmark");
  }

}

- (void)addBookmark
{
  id WeakRetained;
  CALayer *bookmarkLayer;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  CALayer *v10;
  PDFPageViewPrivate *v11;
  CALayer *v12;
  PDFPageViewPrivate *v13;
  uint64_t v14;
  CGFloat v15;
  CALayer *v16;
  id v17;
  void *v18;
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "document");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 && (objc_msgSend(v19, "allowsDocumentAssembly") & 1) == 0)
  {
    v5 = objc_msgSend(v19, "permissionsStatus");
    v6 = CFSTR("user");
    if (v5 == 2)
      v6 = CFSTR("owner");
    NSLog(CFSTR("Cannot add bookmark. PDF document's %@ permissions does not allow document assembly."), v6);
  }
  else
  {
    bookmarkLayer = self->_private->bookmarkLayer;
    if (bookmarkLayer)
    {
      -[CALayer setHidden:](bookmarkLayer, "setHidden:", 0);
      -[PDFPageView updateBookmark](self, "updateBookmark");
    }
    else
    {
      v7 = (void *)MEMORY[0x24BDF6AC8];
      PDFKitBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("ib_bookmark_on_page"), v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      v11 = self->_private;
      v12 = v11->bookmarkLayer;
      v11->bookmarkLayer = v10;

      v13 = self->_private;
      v13->bookmarkSize.width = PDFSizeMake(v14, 34.0, 44.0);
      v13->bookmarkSize.height = v15;
      v16 = self->_private->bookmarkLayer;
      v17 = objc_retainAutorelease(v9);
      -[CALayer setContents:](v16, "setContents:", objc_msgSend(v17, "CGImage"));
      -[CALayer setZPosition:](self->_private->bookmarkLayer, "setZPosition:", -700.0);
      -[PDFPageView layer](self, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSublayer:", self->_private->bookmarkLayer);

      -[PDFPageView updateBookmark](self, "updateBookmark");
    }
  }

}

- (void)removeBookmark
{
  id WeakRetained;
  void *v4;
  char v5;
  CALayer *bookmarkLayer;
  PDFPageViewPrivate *v7;
  CALayer *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "document");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v11;
  if (v11)
  {
    v5 = objc_msgSend(v11, "allowsDocumentAssembly");
    v4 = v11;
    if ((v5 & 1) == 0)
    {
      v9 = objc_msgSend(v11, "permissionsStatus");
      v10 = CFSTR("user");
      if (v9 == 2)
        v10 = CFSTR("owner");
      NSLog(CFSTR("Cannot remove bookmark. PDF document's %@ permissions does not allow document assembly."), v10);
      goto LABEL_8;
    }
  }
  bookmarkLayer = self->_private->bookmarkLayer;
  if (bookmarkLayer)
  {
    -[CALayer removeFromSuperlayer](bookmarkLayer, "removeFromSuperlayer");
    v7 = self->_private;
    v8 = v7->bookmarkLayer;
    v7->bookmarkLayer = 0;

LABEL_8:
    v4 = v11;
  }

}

- (void)updateBookmark
{
  id v3;
  void *v4;
  BOOL v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  id v14;
  __n128 v15;
  __n128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v3 = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  v4 = v3;
  if (self->_private->bookmarkLayer)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    objc_msgSend(WeakRetained, "boundsForBox:", 1);
    v7 = v6;
    objc_msgSend(WeakRetained, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v7 / v9;
    v11 = (unint64_t)(COERCE__INT64(fabs(v7 / v9)) - 0x10000000000000) >> 53;
    if ((COERCE__INT64(v7 / v9) <= -1 || v11 >= 0x3FF)
      && (unint64_t)(COERCE__INT64(v7 / v9) - 1) >= 0xFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v8, "frame");
      PDFRectToString(v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Bookmark being set on an unreasonable PDFView frame: %@"), v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      -[CALayer setFrame:](self->_private->bookmarkLayer, "setFrame:", v7 - v10 * self->_private->bookmarkSize.width + v10 * -8.0, 0.0, v10 * self->_private->bookmarkSize.width, v10 * self->_private->bookmarkSize.height);
      v14 = objc_loadWeakRetained((id *)&self->_private->geometryInterface);
      v15.n128_u64[0] = 0;
      v16.n128_u64[0] = 0;
      objc_msgSend(v14, "convertRectToRootView:fromPageLayer:", v4, PDFRectMake(v15, v16, self->_private->bookmarkSize.width, self->_private->bookmarkSize.height));
      v18 = v17;

      -[CALayer setContentsScale:](self->_private->bookmarkLayer, "setContentsScale:", fmin(v18 / self->_private->bookmarkSize.width, 4.0));
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    }

  }
}

- (void)_setuppageAnnotationEffects
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_private->pageSignatures;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7++) + 16), "removeFromSuperlayer");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_private->pageSignatures, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  -[PDFPageView removeControlForAnnotation:](self, "removeControlForAnnotation:", WeakRetained);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_private->pageAnnotationEffects;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[PDFPageView removePageLayerEffectForID:](self, "removePageLayerEffectForID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_private->pageAnnotationEffects, "removeAllObjects");
  v14 = objc_loadWeakRetained((id *)&self->_private->page);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__PDFPageView__setuppageAnnotationEffects__block_invoke;
  v15[3] = &unk_24C25D200;
  v15[4] = self;
  objc_msgSend(v14, "fetchAnnotationsWithCompletion:deliveredOnQueue:", v15, MEMORY[0x24BDAC9B8]);
  if (GetDefaultsWriteColorWidgetBackgrounds())
    -[PDFPageView colorWidgetBackgrounds:](self, "colorWidgetBackgrounds:", 1);

}

void __42__PDFPageView__setuppageAnnotationEffects__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "page");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/Subtype"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("/Stamp"))
            && objc_msgSend(v8, "isSignature"))
          {
            objc_msgSend(*(id *)(a1 + 32), "_addPDFAnnotationStampSignature:", v8);
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "_addPDFAnnotation:", v8);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_updateWidgetControl:(id)a3 forBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __int128 v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[PDFPageView convertRectToPageView:](self, "convertRectToPageView:", x, y, width, height);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  -[PDFPageView _rotationTransformForPageView](self, "_rotationTransformForPageView");
  objc_msgSend(v9, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v21 = *MEMORY[0x24BDBD8B8];
  v22 = v19;
  v23 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v18, "setAffineTransform:", &v21);

  objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
  objc_msgSend(v9, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = v24;
  v22 = v25;
  v23 = v26;
  objc_msgSend(v20, "setAffineTransform:", &v21);

}

- (CGRect)convertRectToPageView:(CGRect)a3
{
  double width;
  double CenterPoint;
  double v6;
  double v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  float64x2_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  CGRect result;

  width = a3.size.width;
  CenterPoint = PDFRectGetCenterPoint(a3.origin.x, a3.origin.y, a3.size.width);
  v7 = v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "layerEffectTransform", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0);
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
  }

  v10 = PDFPointToCGPoint(CenterPoint, v7);
  v12 = vaddq_f64(v34, vmlaq_n_f64(vmulq_n_f64(v33, v11), v32, v10));
  v13 = PDFPointFromCGPoint(v12.f64[0], v12.f64[1]);
  v15 = PDFRectMakeFromCenter(v13, v14, width);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  -[PDFPageView page](self, "page");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "boundsForBox:", objc_msgSend(v22, "displayBox"));
  PDFRectRotate(objc_msgSend(v23, "rotation"), v24, v25);
  v27 = v26 - v21 - v17;

  v28 = v15;
  v29 = v27;
  v30 = v19;
  v31 = v21;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGAffineTransform)_rotationTransformForPageView
{
  uint64_t v4;
  double v5;
  CGAffineTransform *result;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v4 = objc_msgSend(WeakRetained, "rotation");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v5 = PDFDegToRad((double)v4);
  CGAffineTransformMakeRotation(retstr, v5);

  return result;
}

- (CGPoint)convertPointToPageView:(CGPoint)a3
{
  id WeakRetained;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  id v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double MinX;
  double v21;
  double v22;
  double MinY;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat rect;
  CGPoint result;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  v5 = PDFRectToCGRect(objc_msgSend(WeakRetained, "boundsForBox:", 0));
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_loadWeakRetained((id *)&self->_private->renderingProperties);
  v13 = PDFRectToCGRect(objc_msgSend(WeakRetained, "boundsForBox:", objc_msgSend(v12, "displayBox")));
  v15 = v14;
  v17 = v16;
  rect = v16;
  v19 = v18;

  v33.origin.x = v13;
  v33.origin.y = v15;
  v33.size.width = v17;
  v33.size.height = v19;
  MinX = CGRectGetMinX(v33);
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  v21 = MinX - CGRectGetMinX(v34);
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  v22 = v21 + CGRectGetMinX(v35);
  v36.origin.x = v13;
  v36.origin.y = v15;
  v36.size.width = rect;
  v36.size.height = v19;
  MinY = CGRectGetMinY(v36);
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  v24 = MinY - CGRectGetMinY(v37);
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  v25 = v24 + CGRectGetMinY(v38);
  -[PDFPageView frame](self, "frame");
  v27 = v25 + v26 - a3.y;

  v28 = a3.x - v22;
  v29 = v27;
  result.y = v29;
  result.x = v28;
  return result;
}

- (void)_addPDFAnnotationTextWidget:(id)a3
{
  id v4;
  PDFKitTextView *v5;
  id WeakRetained;
  void *v7;
  NSMutableDictionary *activeControls;
  void *v9;
  PDFKitTextView *v10;

  v4 = a3;
  v5 = [PDFKitTextView alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PDFKitTextView initWithAnnotation:pdfPageView:pdfView:](v5, "initWithAnnotation:pdfPageView:pdfView:", v4, self, v7);

  objc_msgSend(v4, "bounds");
  -[PDFPageView _updateWidgetControl:forBounds:](self, "_updateWidgetControl:forBounds:", v10);
  objc_storeWeak((id *)&self->_private->activeAnnotation, v4);
  activeControls = self->_private->activeControls;
  objc_msgSend(v4, "pdfAnnotationUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKey:](activeControls, "setObject:forKey:", v10, v9);
}

- (void)_addPDFAnnotationChoiceWidget:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  double v17;
  double v18;
  _BOOL8 v19;
  void *v20;
  id v21;
  void *v22;
  id WeakRetained;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "choices");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetStringValue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "isListChoice");
  objc_msgSend(v4, "font");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pointSize");
  v18 = v17;
  v19 = -[PDFPageView _allowsFormFieldEntry](self, "_allowsFormFieldEntry");
  objc_msgSend(v4, "pdfAnnotationUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 | v14)
  {
    if (!v13)
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v14, 0);
    v43 = v20;
    v44 = v16;
    if (v15)
    {
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E58]), "initWithFrame:", v6, v8, v10, v12);
      -[PDFPageView _updateWidgetControl:forBounds:](self, "_updateWidgetControl:forBounds:", v21, v6, v8, v10, v12);
      objc_msgSend(v21, "setDataSource:", self);
      objc_msgSend(v21, "setDelegate:", self);
      objc_msgSend(v21, "setScrollEnabled:", 1);
      objc_msgSend(v21, "setUserInteractionEnabled:", v19);
      objc_msgSend(v21, "setRowHeight:", v18 + 2.0);
      objc_msgSend(v21, "setSeparatorInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
      objc_msgSend(v21, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBorderWidth:", 1.0);

      WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
      objc_msgSend(WeakRetained, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isUsingPageViewController");

      if ((v25 & 1) == 0)
      {
        objc_msgSend(v21, "panGestureRecognizer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = WeakRetained;
        objc_msgSend(WeakRetained, "view");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "documentScrollView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "panGestureRecognizer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26 && v29)
          objc_msgSend(v29, "requireGestureRecognizerToFail:", v26);

        WeakRetained = v42;
      }
      -[PDFPageView addSubview:](self, "addSubview:", v21);
      objc_msgSend(v21, "layer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setZPosition:", -200.0);

      objc_storeWeak((id *)&self->_private->activeAnnotation, v4);
      v20 = v43;
      -[NSMutableDictionary setObject:forKey:](self->_private->activeControls, "setObject:forKey:", v21, v43);
      objc_msgSend(v21, "reloadData");
      v31 = objc_msgSend((id)v13, "indexOfObject:", v14);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v31, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "selectRowAtIndexPath:animated:scrollPosition:", v32, 0, 0);

    }
    else
    {
      v33 = v8 + -2.0;
      WeakRetained = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6EA8]), "initWithFrame:", v6, v33, v10, v12);
      -[PDFPageView _updateWidgetControl:forBounds:](self, "_updateWidgetControl:forBounds:", WeakRetained, v6, v33, v10, v12);
      objc_msgSend(WeakRetained, "setFont:", v16);
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setTintColor:", v34);

      objc_msgSend(WeakRetained, "setText:", v14);
      objc_msgSend(WeakRetained, "setUserInteractionEnabled:", v19);
      v21 = objc_alloc_init(MEMORY[0x24BDF6C58]);
      objc_msgSend(WeakRetained, "setInputView:", v21);
      objc_storeWeak((id *)&self->_private->activeAnnotation, v4);
      -[NSMutableDictionary setObject:forKey:](self->_private->activeControls, "setObject:forKey:", WeakRetained, v20);
      objc_msgSend(v21, "setDelegate:", self);
      objc_msgSend(v21, "setDataSource:", self);
      -[PDFPageView addSubview:](self, "addSubview:", WeakRetained);
      objc_msgSend(WeakRetained, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setZPosition:", -200.0);

      v36 = objc_alloc_init(MEMORY[0x24BDF6F10]);
      objc_msgSend(v36, "sizeToFit");
      v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      v38 = objc_alloc(MEMORY[0x24BDF6860]);
      PDFKitLocalizedString(CFSTR("Done"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v38, "initWithTitle:style:target:action:", v39, 2, self, sel__choiceWidgetDone);

      v45[0] = v37;
      v45[1] = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setItems:", v41);

      objc_msgSend(WeakRetained, "setInputAccessoryView:", v36);
      objc_msgSend(WeakRetained, "becomeFirstResponder");

      v20 = v43;
    }

    objc_msgSend(v4, "setControl:", v21);
    v16 = v44;
  }

}

- (void)_choiceWidgetDone
{
  void *v3;
  id WeakRetained;
  id v5;

  -[PDFPageView endEditing:](self, "endEditing:", 1);
  -[PDFPageView page](self, "page");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  objc_msgSend(v3, "removeControlForAnnotation:", WeakRetained);

}

- (void)_addPDFAnnotationStampSignature:(id)a3
{
  id v5;
  CGColorSpaceRef v6;
  CGColorSpace *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t AlignedBytesPerRow;
  double v13;
  CGFloat v14;
  CGContext *v15;
  CGContext *v16;
  CGImageRef Image;
  CGImage *v18;
  __int128 v19;
  CGAffineTransform *v20;
  uint64_t v21;
  CGImageRef v22;
  CGImage *v23;
  CALayer *v24;
  void *v25;
  PageSignature *v26;
  CALayer *signatureLayer;
  CALayer *v28;
  _OWORD v29[3];
  CGAffineTransform v30;
  CGAffineTransform v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v5 = a3;
  objc_msgSend(v5, "bounds");
  -[PDFPageView convertRectToPageView:](self, "convertRectToPageView:");
  -[PDFPageView _rotationTransformForPageView](self, "_rotationTransformForPageView");
  v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF218]);
  if (v6)
  {
    v7 = v6;
    -[PDFPageView frame](self, "frame");
    v9 = v8;
    -[PDFPageView frame](self, "frame");
    v11 = v10;
    CGColorSpaceGetNumberOfComponents(v7);
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    -[PDFPageView contentScaleFactor](self, "contentScaleFactor");
    v14 = v13;
    v15 = CGBitmapContextCreate(0, (unint64_t)(v13 * (double)(unint64_t)v9), (unint64_t)(v13 * (double)(unint64_t)v11), 8uLL, (unint64_t)(v13 * (double)(unint64_t)AlignedBytesPerRow), v7, 0x2002u);
    if (v15)
    {
      v16 = v15;
      CGContextScaleCTM(v15, v14, v14);
      objc_msgSend(v5, "drawWithBox:inContext:", 0, v16);
      Image = CGBitmapContextCreateImage(v16);
      if (Image)
      {
        v18 = Image;
        memset(&v31, 0, sizeof(v31));
        v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
        *(_OWORD *)&v30.a = *MEMORY[0x24BDBD8B8];
        *(_OWORD *)&v30.c = v19;
        *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
        v20 = CGAffineTransformScale(&v31, &v30, v14, v14);
        v35.origin.x = PDFRectToCGRect(v20);
        v30 = v31;
        v36 = CGRectApplyAffineTransform(v35, &v30);
        PDFRectFromCGRect(v36.origin.x, v36.origin.y, v36.size.width, v36.size.height);
        v37.origin.x = PDFRectToCGRect(v21);
        v22 = CGImageCreateWithImageInRect(v18, v37);
        if (v22)
        {
          v23 = v22;
          v24 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
          -[CALayer setFrame:](v24, "setFrame:", PDFRectToCGRect(v24));
          -[CALayer setContents:](v24, "setContents:", v23);
          -[CALayer setZPosition:](v24, "setZPosition:", -200.0);
          v29[0] = v32;
          v29[1] = v33;
          v29[2] = v34;
          -[CALayer setAffineTransform:](v24, "setAffineTransform:", v29);
          -[PDFPageView layer](self, "layer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addSublayer:", v24);

          v26 = objc_alloc_init(PageSignature);
          objc_storeStrong((id *)&v26->annotation, a3);
          signatureLayer = v26->signatureLayer;
          v26->signatureLayer = v24;
          v28 = v24;

          -[NSMutableArray addObject:](self->_private->pageSignatures, "addObject:", v26);
          CGImageRelease(v18);
          CGImageRelease(v23);

        }
        else
        {
          CGImageRelease(v18);
        }
      }
      CGContextRelease(v16);
    }
    CGColorSpaceRelease(v7);
  }

}

- (void)_addPDFAnnotation:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->pageLayer);
  if (WeakRetained)
  {
    objc_msgSend(v10, "akAnnotationAdaptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "akAnnotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (objc_msgSend(v10, "isMarkupAnnotationSubtype") && (objc_msgSend(v10, "isRedaction") & 1) == 0)
      {
        +[PDFPageLayerEffect createPDFMarkupLayerEffectsForAnnotation:withLayer:](PDFPageLayerEffect, "createPDFMarkupLayerEffectsForAnnotation:withLayer:", v10, WeakRetained);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      objc_msgSend(v10, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup"));

      if ((v8 & 1) == 0)
      {
        +[PDFPageLayerEffect createPDFAnnotationLayerEffectForAnnotation:withLayer:](PDFPageLayerEffect, "createPDFAnnotationLayerEffectForAnnotation:withLayer:", v10, WeakRetained);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      }
    }
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  objc_msgSend(WeakRetained, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (WeakRetained && objc_msgSend(v5, "isEqualToString:", CFSTR("/Ch")))
  {
    objc_msgSend(WeakRetained, "choices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("MyCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  v9 = WeakRetained;
  if (v7)
  {
    if (!WeakRetained)
      goto LABEL_8;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("MyCell"));
    if (!v9)
      goto LABEL_8;
  }
  objc_msgSend(v9, "choices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v11);

  if (v12)
  {
    objc_msgSend(v7, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v12);

  }
LABEL_8:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  PDFPageViewPrivate *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = self->_private;
  if (!v7->isPerformingUndo)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v7->activeAnnotation);
    objc_msgSend(WeakRetained, "valueForAnnotationKey:", CFSTR("/FT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (WeakRetained && objc_msgSend(v9, "isEqualToString:", CFSTR("/Ch")))
    {
      objc_msgSend(WeakRetained, "choices");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v6, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFPageView setStringValue:onChoiceWidgetAnnotation:withTableView:](self, "setStringValue:onChoiceWidgetAnnotation:withTableView:", v12, WeakRetained, v13);

    }
  }

}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  NSMutableDictionary *activeControls;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  activeControls = self->_private->activeControls;
  objc_msgSend(WeakRetained, "pdfAnnotationUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](activeControls, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "choices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "setWidgetStringValue:", v11);
    if (v9)
      -[PDFPageView setStringValue:onChoiceWidgetAnnotation:withTextField:](self, "setStringValue:onChoiceWidgetAnnotation:withTextField:", v11, WeakRetained, v9);

  }
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  __CFString *v15;

  v9 = a3;
  v10 = a6;
  v11 = v10;
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v11, "setTextAlignment:", 1);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "choices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", a4);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = &stru_24C25F170;
  }
  objc_msgSend(v11, "setText:", v15);

  return v11;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id WeakRetained;
  void *v5;
  void *v6;
  int64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->activeAnnotation);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "choices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (void)_formChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PDFFormFieldName"));
  v5 = objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v5;
  objc_msgSend(v7, "annotationsForFieldName:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "valueForAnnotationKey:", CFSTR("/FT"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", CFSTR("/Ch")))
          objc_msgSend(v14, "removeValueForAnnotationKey:", CFSTR("/AP"));
        objc_msgSend(v14, "pdfAnnotationUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFPageView updatePageLayerEffectForID:](self, "updatePageLayerEffectForID:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (BOOL)_allowsFormFieldEntry
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "allowsFormFieldEntry");
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldRegisterUndo
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsUndo");

  return v4;
}

- (void)setStringValue:(id)a3 onTextWidgetAnnotation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (v19)
  {
    objc_msgSend(v6, "valueForAnnotationKey:", CFSTR("/FT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 && objc_msgSend(v7, "isEqualToString:", CFSTR("/Tx")))
    {
      objc_msgSend(v6, "widgetStringValue");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = (__CFString *)v9;
      else
        v10 = &stru_24C25F170;
      objc_msgSend(v6, "setWidgetStringValue:", v19);
      if (-[PDFPageView shouldRegisterUndo](self, "shouldRegisterUndo"))
      {
        v11 = (void *)MEMORY[0x24BDD17C8];
        PDFKitLocalizedString(CFSTR("Change of %@"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[PDFPageView undoManager](self, "undoManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "prepareWithInvocationTarget:", self);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setStringValue:onTextWidgetAnnotation:", v10, v6);

        -[PDFPageView undoManager](self, "undoManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PDFKitLocalizedString(v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setActionName:", v18);

      }
    }

  }
}

- (void)setStringValue:(id)a3 onTextAnnotation:(id)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  id WeakRetained;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  if (v27)
  {
    if (v6)
    {
      objc_msgSend(v6, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/FreeText"));

      if (v8)
      {
        objc_msgSend(v6, "widgetStringValue");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = (__CFString *)v9;
        else
          v10 = &stru_24C25F170;
        objc_msgSend(v6, "setValue:forAnnotationKey:", v27, CFSTR("/Contents"));
        objc_msgSend(v6, "akAnnotation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
          objc_msgSend(WeakRetained, "document");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "akController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v14, "textEditorController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "annotation");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "akAnnotation");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16 == v17)
            {
              objc_msgSend(v15, "textView");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setText:", v27);

              objc_msgSend(v15, "updateForTextAttributeChange");
            }

          }
        }
        if (-[PDFPageView shouldRegisterUndo](self, "shouldRegisterUndo"))
        {
          v19 = (void *)MEMORY[0x24BDD17C8];
          PDFKitLocalizedString(CFSTR("Change of %@"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "displayName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", v20, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[PDFPageView undoManager](self, "undoManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "prepareWithInvocationTarget:", self);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setStringValue:onTextAnnotation:", v10, v6);

          -[PDFPageView undoManager](self, "undoManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          PDFKitLocalizedString(v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setActionName:", v26);

        }
      }
    }
  }

}

- (void)_setAttributedStringForAnnotation:(id)a3 stringValue:(id)a4 textView:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForAnnotationKey:", CFSTR("/MaxLen"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "integerValue");
  if (!v10)
  {
    v13 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(v7, "frame");
    objc_msgSend(v13, "systemFontOfSize:", v14 + -2.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (double)v12;
  v29 = *MEMORY[0x24BDF65F8];
  v16 = v29;
  v30[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeWithAttributes:", v17);
  v19 = v18;

  v20 = (double)(unint64_t)objc_msgSend(v8, "length");
  objc_msgSend(v7, "frame");
  v22 = (v21 + -v19 / v20 * v15) / v15;
  v23 = objc_msgSend(v8, "length");
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);

  v25 = *MEMORY[0x24BDF6608];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAttribute:value:range:", v25, v26, 0, v23);

  objc_msgSend(v24, "addAttribute:value:range:", v16, v10, 0, v23);
  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  objc_msgSend(v28, "setLineBreakMode:", 2);
  objc_msgSend(v24, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v28, 0, v23);
  objc_msgSend(v7, "setAttributedText:", v24);

}

- (BOOL)_shouldReplaceStringOnAnnotation:(id)a3 withTextView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceTextWidgetWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);
  if ((v10 & 1) == 0)
    -[PDFPageView _setAttributedStringForAnnotation:stringValue:textView:](self, "_setAttributedStringForAnnotation:stringValue:textView:", v6, v9, v7);

  return v10;
}

- (void)setStringValue:(id)a3 onTextWidgetAnnotation:(id)a4 withTextView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = a5;
  if (v21)
  {
    if (v8)
    {
      objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/FT"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("/Tx"));

      if (v11)
      {
        if (-[PDFPageView _shouldReplaceStringOnAnnotation:withTextView:](self, "_shouldReplaceStringOnAnnotation:withTextView:", v8, v9))
        {
          objc_msgSend(v8, "widgetStringValue");
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setWidgetStringValue:", v21);
          if (objc_msgSend(v8, "shouldComb"))
            -[PDFPageView _setAttributedStringForAnnotation:stringValue:textView:](self, "_setAttributedStringForAnnotation:stringValue:textView:", v8, v21, v9);
          else
            objc_msgSend(v9, "setText:", v21);
          objc_msgSend(v9, "setNeedsDisplay");
          if (!v12)
            v12 = &stru_24C25F170;
          if (-[PDFPageView shouldRegisterUndo](self, "shouldRegisterUndo"))
          {
            v13 = (void *)MEMORY[0x24BDD17C8];
            PDFKitLocalizedString(CFSTR("Change of %@"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "displayName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringWithFormat:", v14, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            -[PDFPageView undoManager](self, "undoManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "prepareWithInvocationTarget:", self);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setStringValue:onTextWidgetAnnotation:withTextView:", v12, v8, v9);

            -[PDFPageView undoManager](self, "undoManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            PDFKitLocalizedString(v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setActionName:", v20);

          }
        }
      }
    }
  }

}

- (void)setStringValue:(id)a3 onChoiceWidgetAnnotation:(id)a4 withTextField:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/FT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 && v8 && objc_msgSend(v10, "isEqualToString:", CFSTR("/Ch")))
  {
    objc_msgSend(v8, "widgetStringValue");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWidgetStringValue:", v20);
    objc_msgSend(v9, "setText:", v20);
    objc_msgSend(v9, "setNeedsDisplay");
    if (!v11)
      v11 = &stru_24C25F170;
    if (-[PDFPageView shouldRegisterUndo](self, "shouldRegisterUndo"))
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      PDFKitLocalizedString(CFSTR("Change of %@"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[PDFPageView undoManager](self, "undoManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "prepareWithInvocationTarget:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setStringValue:onChoiceWidgetAnnotation:withTextField:", v11, v8, v9);

      -[PDFPageView undoManager](self, "undoManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PDFKitLocalizedString(v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActionName:", v19);

    }
  }

}

- (void)setStringValue:(id)a3 onChoiceWidgetAnnotation:(id)a4 withTableView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v8 = a4;
  v9 = a5;
  self->_private->isPerformingUndo = 1;
  objc_msgSend(v8, "valueForAnnotationKey:", CFSTR("/FT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    if (v8 && objc_msgSend(v10, "isEqualToString:", CFSTR("/Ch")))
    {
      objc_msgSend(v8, "widgetStringValue");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWidgetStringValue:", v24);
      objc_msgSend(v8, "choices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "indexOfObject:", v24);
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", v14, 1, 0);
      -[PDFPageView tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v9, v14);
      if (!v11)
        v11 = &stru_24C25F170;
      if (-[PDFPageView shouldRegisterUndo](self, "shouldRegisterUndo"))
      {
        v23 = v12;
        v15 = (void *)MEMORY[0x24BDD17C8];
        PDFKitLocalizedString(CFSTR("Change of %@"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[PDFPageView undoManager](self, "undoManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "prepareWithInvocationTarget:", self);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setStringValue:onChoiceWidgetAnnotation:withTableView:", v11, v8, v9);

        -[PDFPageView undoManager](self, "undoManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        PDFKitLocalizedString(v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setActionName:", v22);

        v12 = v23;
      }

    }
    self->_private->isPerformingUndo = 0;
  }

}

- (void)setState:(int64_t)a3 onButtonWidgetAnnotation:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  objc_msgSend(v16, "valueForAnnotationKey:", CFSTR("/FT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Btn")))
    {
      v7 = objc_msgSend(v16, "buttonWidgetState");
      objc_msgSend(v16, "setButtonWidgetState:", a3);
      if (-[PDFPageView shouldRegisterUndo](self, "shouldRegisterUndo"))
      {
        v8 = (void *)MEMORY[0x24BDD17C8];
        PDFKitLocalizedString(CFSTR("Change of %@"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "displayName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[PDFPageView undoManager](self, "undoManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "prepareWithInvocationTarget:", self);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setState:onButtonWidgetAnnotation:", v7, v16);

        -[PDFPageView undoManager](self, "undoManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PDFKitLocalizedString(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setActionName:", v15);

      }
    }
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDFPageView;
  -[PDFPageView hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_private->page);
  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isInMarkupMode") & 1) != 0 || (objc_msgSend(v10, "isFormDetectionEnabled") & 1) != 0)
  {
    objc_msgSend(v10, "hitTestForSubviewsOfView:atLocation:withEvent:", self, v7, x, y);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v8;
    v14 = v13;

  }
  else
  {
    v14 = v8;
  }

  return v14;
}

- (BOOL)isOverlayViewInstalled
{
  return self->_overlayViewInstalled;
}

- (void)setOverlayViewInstalled:(BOOL)a3
{
  self->_overlayViewInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_private, 0);
}

@end
