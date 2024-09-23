@implementation PDFPageLayer

- (PDFPageLayer)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  PDFPageLayer *v11;
  PDFPageLayer *v12;
  CALayer *v13;
  CALayer *tilesLayer;
  CALayer *v15;
  CALayer *shadowLayer;
  CALayer *v17;
  id v18;
  CALayer *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  CALayer *v27;
  CALayer *v28;
  NSMutableArray *v29;
  NSMutableArray *tiles;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PDFTimer *v35;
  PDFTimer *forcedUpdateTimer;
  void *v37;
  uint64_t v38;
  void *v39;
  CALayer *v40;
  CALayer *effectsLayer;
  NSMutableDictionary *v42;
  NSMutableDictionary *pageLayerEffects;
  CGAffineTransform v45;
  objc_super v46;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)PDFPageLayer;
  v11 = -[PDFPageLayer init](&v46, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_page, v8);
    objc_storeWeak((id *)&v12->_geometryInterface, v9);
    objc_storeWeak((id *)&v12->_renderingProperties, v10);
    v12->_oldPageRotation = objc_msgSend(v8, "rotation");
    v13 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    tilesLayer = v12->_tilesLayer;
    v12->_tilesLayer = v13;

    -[CALayer setMasksToBounds:](v12->_tilesLayer, "setMasksToBounds:", 1);
    -[CALayer setZPosition:](v12->_tilesLayer, "setZPosition:", -800.0);
    -[CALayer setAllowsEdgeAntialiasing:](v12->_tilesLayer, "setAllowsEdgeAntialiasing:", 0);
    -[PDFPageLayer insertSublayer:above:](v12, "insertSublayer:above:", v12->_tilesLayer, v12);
    v15 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    shadowLayer = v12->_shadowLayer;
    v12->_shadowLayer = v15;

    v17 = v12->_shadowLayer;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v17, "setBackgroundColor:", objc_msgSend(v18, "CGColor"));

    -[CALayer setZPosition:](v12->_shadowLayer, "setZPosition:", -1000.0);
    -[PDFPageLayer insertSublayer:below:](v12, "insertSublayer:below:", v12->_shadowLayer, v12->_tilesLayer);
    v19 = v12->_tilesLayer;
    CGAffineTransformMakeScale(&v45, 1.0, -1.0);
    -[CALayer setAffineTransform:](v19, "setAffineTransform:", &v45);
    objc_msgSend(v8, "boundsForBox:", objc_msgSend(v10, "displayBox"));
    v21 = v20;
    v23 = v22;
    v12->_oldBoundsForBox.origin.x = v24;
    v12->_oldBoundsForBox.origin.y = v25;
    v12->_oldBoundsForBox.size.width = v20;
    v12->_oldBoundsForBox.size.height = v22;
    PDFPointMake(0.0, 0.0);
    -[PDFPageLayer setFrame:](v12, "setFrame:", PDFRectToCGRect(v26));
    v27 = v12->_tilesLayer;
    -[PDFPageLayer bounds](v12, "bounds");
    -[CALayer setFrame:](v27, "setFrame:");
    v28 = v12->_shadowLayer;
    -[PDFPageLayer bounds](v12, "bounds");
    -[CALayer setFrame:](v28, "setFrame:");
    v12->_zoomGenerationDelay = 0.25;
    v12->_visibilityDelegateIndex = 0x7FFFFFFFFFFFFFFFLL;
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    tiles = v12->_tiles;
    v12->_tiles = v29;

    v12->_tileLayerHidden = 0;
    v12->_allowUpdate = 1;
    atomic_store(0, (unsigned __int8 *)&v12->_isTiling);
    atomic_store(0, (unsigned __int8 *)&v12->_requestedTiling);
    -[PDFPageLayer setAllowsGroupBlending:](v12, "setAllowsGroupBlending:", 0);
    -[PDFPageLayer _setEnablePageShadows:](v12, "_setEnablePageShadows:", objc_msgSend(v10, "enablePageShadows"));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v12, sel__renderingPropertyUpdate_, CFSTR("PDFRenderingPropertiesChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v12, sel__pageDidRotate_, CFSTR("PDFPageDidRotate"), v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v12, sel__pageDidRotate_, CFSTR("PDFPageDidChangeBounds"), v8);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v12, sel__pageChangedPageRef_, CFSTR("PDFPagePageRefChanged"), v8);

    v35 = -[PDFTimer initWithThrottleDelay:forSelector:forTarget:]([PDFTimer alloc], "initWithThrottleDelay:forSelector:forTarget:", sel__forceTileUpdate, v12, 0.1);
    forcedUpdateTimer = v12->_forcedUpdateTimer;
    v12->_forcedUpdateTimer = v35;

    objc_msgSend(v8, "document");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "indexForPage:", v8);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PDFPageLayer, page index %d"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFPageLayer setName:](v12, "setName:", v39);

    v40 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    effectsLayer = v12->_effectsLayer;
    v12->_effectsLayer = v40;

    -[PDFPageLayer addSublayer:](v12, "addSublayer:", v12->_effectsLayer);
    -[CALayer setFrame:](v12->_effectsLayer, "setFrame:", 0.0, 0.0, v21, v23);
    -[CALayer setAllowsGroupBlending:](v12->_effectsLayer, "setAllowsGroupBlending:", 0);
    v42 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pageLayerEffects = v12->_pageLayerEffects;
    v12->_pageLayerEffects = v42;

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PDFPageLayer;
  -[PDFPageLayer dealloc](&v4, sel_dealloc);
}

- (id)page
{
  return objc_loadWeakRetained((id *)&self->_page);
}

- (id)geometryInterface
{
  return objc_loadWeakRetained((id *)&self->_geometryInterface);
}

- (id)renderingProperties
{
  return objc_loadWeakRetained((id *)&self->_renderingProperties);
}

- (void)setNeedsTilesUpdate
{
  BOOL *p_isTiling;
  _QWORD v5[4];
  id v6;
  id location;

  p_isTiling = &self->_isTiling;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_isTiling))
    {
      __clrex();
      atomic_store(1u, (unsigned __int8 *)&self->_requestedTiling);
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_isTiling));
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PDFPageLayer _updateTiles](self, "_updateTiles");
    -[PDFPageLayer _tileUpdateComplete](self, "_tileUpdateComplete");
  }
  else
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __35__PDFPageLayer_setNeedsTilesUpdate__block_invoke;
    v5[3] = &unk_24C25D090;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __35__PDFPageLayer_setNeedsTilesUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateTiles");
    objc_msgSend(v2, "_tileUpdateComplete");
    WeakRetained = v2;
  }

}

- (int64_t)displayBox
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
  v3 = objc_msgSend(WeakRetained, "displayBox");

  return v3;
}

- (void)_tileUpdateComplete
{
  BOOL *p_requestedTiling;
  int v3;
  _QWORD block[5];

  atomic_store(0, (unsigned __int8 *)&self->_isTiling);
  p_requestedTiling = &self->_requestedTiling;
  while (1)
  {
    v3 = __ldaxr((unsigned __int8 *)p_requestedTiling);
    if (v3 != 1)
      break;
    if (!__stlxr(0, (unsigned __int8 *)p_requestedTiling))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__PDFPageLayer__tileUpdateComplete__block_invoke;
      block[3] = &unk_24C25C350;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      return;
    }
  }
  __clrex();
}

uint64_t __35__PDFPageLayer__tileUpdateComplete__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsTilesUpdate");
}

- (BOOL)isVisible
{
  id WeakRetained;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  CGRect v22;
  CGRect v23;

  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryInterface);
  objc_msgSend(WeakRetained, "rootViewBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "extendedRootViewBounds");
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  -[PDFPageLayer bounds](self, "bounds");
  objc_msgSend(WeakRetained, "convertRectToRootView:fromPageLayer:", self, PDFRectFromCGRect(v16, v17, v18, v19));
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  v20 = PDFRectIntersectsRect(v22, v23);

  return v20;
}

- (void)addPageLayerEffect:(id)a3
{
  id v4;
  NSMutableDictionary *pageLayerEffects;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    pageLayerEffects = self->_pageLayerEffects;
    objc_msgSend(v13, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](pageLayerEffects, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "removeFromSuperlayer");
      v8 = self->_pageLayerEffects;
      objc_msgSend(v7, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

    }
    -[CALayer addSublayer:](self->_effectsLayer, "addSublayer:", v13);
    v10 = self->_pageLayerEffects;
    objc_msgSend(v13, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v13, v11);

    objc_msgSend(v13, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFPageLayer updatePageLayerEffectForID:](self, "updatePageLayerEffectForID:", v12);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    v4 = v13;
  }

}

- (void)removePageLayerEffectForID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_pageLayerEffects, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(v4, "removeFromSuperlayer");
    -[NSMutableDictionary removeObjectForKey:](self->_pageLayerEffects, "removeObjectForKey:", v5);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (id)pageLayerEffectForID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_pageLayerEffects, "objectForKey:", a3);
}

- (id)_pageLayerEffects
{
  return (id)-[NSMutableDictionary allValues](self->_pageLayerEffects, "allValues");
}

- (void)updatePageLayerEffectForID:(id)a3
{
  void *v4;
  uint64_t v5;

  -[PDFPageLayer pageLayerEffectForID:](self, "pageLayerEffectForID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[PDFPageLayer layerEffectTransform](self, "layerEffectTransform");
    -[PDFPageLayer _updateLayerEffect:withPageTransform:](self, "_updateLayerEffect:withPageTransform:", v4, &v5);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (void)updatePageLayerEffects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  -[PDFPageLayer layerEffectTransform](self, "layerEffectTransform");
  -[PDFPageLayer _pageLayerEffects](self, "_pageLayerEffects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9[0] = v14;
        v9[1] = v15;
        v9[2] = v16;
        -[PDFPageLayer _updateLayerEffect:withPageTransform:](self, "_updateLayerEffect:withPageTransform:", v8, v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

}

- (void)_updateLayerEffect:(id)a3 withPageTransform:(CGAffineTransform *)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double CenterPoint;
  double v12;
  double v13;
  double v14;
  float64x2_t v15;
  double v16;
  double v17;
  id WeakRetained;
  uint64_t v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  double v26;
  CGAffineTransform v27;
  _OWORD v28[3];

  v6 = a3;
  objc_msgSend(v6, "pageFrame");
  v8 = v7;
  CenterPoint = PDFRectGetCenterPoint(v9, v10, v7);
  v13 = PDFPointToCGPoint(CenterPoint, v12);
  v15 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v14), *(float64x2_t *)&a4->a, v13));
  v16 = PDFPointFromCGPoint(v15.f64[0], v15.f64[1]);
  PDFRectMakeFromCenter(v16, v17, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v19 = objc_msgSend(WeakRetained, "rotation");
  v20 = objc_loadWeakRetained((id *)&self->_renderingProperties);
  objc_msgSend(WeakRetained, "boundsForBox:", objc_msgSend(v20, "displayBox"));
  v22 = v21;
  v24 = v23;

  PDFRectRotate(v19, v22, v24);
  v25 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v28[0] = *MEMORY[0x24BDBD8B8];
  v28[1] = v25;
  v28[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v6, "setFrame:", PDFRectToCGRect(objc_msgSend(v6, "setAffineTransform:", v28)));
  if (objc_msgSend(v6, "shouldRotateContent"))
  {
    v26 = PDFDegToRad((double)v19);
    CGAffineTransformMakeRotation(&v27, v26);
    objc_msgSend(v6, "setAffineTransform:", &v27);
  }
  objc_msgSend(v6, "update");

}

- (CGAffineTransform)layerEffectTransform
{
  _BOOL8 v5;
  id WeakRetained;
  id v7;
  uint64_t v8;

  v5 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 0);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v7 = objc_loadWeakRetained((id *)&self->_renderingProperties);
  v8 = objc_msgSend(v7, "displayBox");
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "transformForBox:", v8);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return (CGAffineTransform *)+[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v5);
}

- (void)scalePageLayerEffects:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  CALayer *effectsLayer;
  CGAffineTransform v10;

  -[CALayer frame](self->_effectsLayer, "frame");
  v6 = v5;
  v8 = v7;
  effectsLayer = self->_effectsLayer;
  CGAffineTransformMakeScale(&v10, a3, a3);
  -[CALayer setAffineTransform:](effectsLayer, "setAffineTransform:", &v10);
  -[CALayer setFrame:](self->_effectsLayer, "setFrame:", 0.0, 0.0, v6, v8);
}

- (void)setEnableTileUpdates:(BOOL)a3
{
  self->_allowUpdate = a3;
}

- (void)forceTileUpdate
{
  -[PDFTimer update](self->_forcedUpdateTimer, "update");
}

- (void)_forceTileUpdate
{
  if (!self->_isForcingUpdate)
  {
    self->_isForcingUpdate = 1;
    -[PDFPageLayer setNeedsTilesUpdate](self, "setNeedsTilesUpdate");
  }
}

- (BOOL)enablesTileUpdates
{
  return self->_allowUpdate;
}

- (void)saveOriginalTileLayout
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = self->_tiles;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(char **)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v8 = v7 + 112;
        objc_msgSend(v7, "frame", (_QWORD)v16);
        *(double *)v8 = PDFRectFromCGRect(v9, v10, v11, v12);
        *((_QWORD *)v8 + 1) = v13;
        *((_QWORD *)v8 + 2) = v14;
        *((_QWORD *)v8 + 3) = v15;
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

- (void)restoreOriginalTileLayout
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_tiles;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = *MEMORY[0x24BDE5C68];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = PDFRectToCGRect(v3);
        objc_msgSend(v8, "setFrame:", v9, (_QWORD)v10);
        v3 = objc_msgSend(v8, "setContentsGravity:", v6);
        ++v7;
      }
      while (v4 != v7);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
    }
    while (v3);
  }

}

- (void)applyTileLayoutScale:(double)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_tiles;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = *MEMORY[0x24BDE5C98];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10 = PDFRectToCGRect(v4);
        objc_msgSend(v9, "setFrame:", v10, (_QWORD)v11);
        v4 = objc_msgSend(v9, "setContentsGravity:", v7);
        ++v8;
      }
      while (v5 != v8);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = v4;
    }
    while (v4);
  }

}

- (void)setVisibilityDelegateIndex:(unint64_t)a3
{
  self->_visibilityDelegateIndex = a3;
}

- (unint64_t)visibilityDelegateIndex
{
  return self->_visibilityDelegateIndex;
}

- (void)setBounds:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CALayer *tilesLayer;
  CALayer *shadowLayer;
  objc_super v18;
  CGRect v19;
  CGRect v20;

  v18.receiver = self;
  v18.super_class = (Class)PDFPageLayer;
  -[PDFPageLayer setBounds:](&v18, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CALayer frame](self->_tilesLayer, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PDFPageLayer bounds](self, "bounds");
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  if (!CGRectEqualToRect(v19, v20))
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    tilesLayer = self->_tilesLayer;
    -[PDFPageLayer bounds](self, "bounds");
    -[CALayer setFrame:](tilesLayer, "setFrame:");
    shadowLayer = self->_shadowLayer;
    -[PDFPageLayer bounds](self, "bounds");
    -[CALayer setFrame:](shadowLayer, "setFrame:");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)_releaseTiles
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_tiles, "count"))
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v3 = (void *)MEMORY[0x20BD1ACC8](objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1));
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_tiles;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "removeFromSuperlayer", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](self->_tiles, "removeAllObjects");
    objc_autoreleasePoolPop(v3);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)_releasePageLayerEffects
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary objectEnumerator](self->_pageLayerEffects, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperlayer");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[NSMutableDictionary removeAllObjects](self->_pageLayerEffects, "removeAllObjects");

}

- (void)_hideTileLayer:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_tileLayerHidden != a3)
  {
    v3 = a3;
    self->_tileLayerHidden = a3;
    -[CALayer setHidden:](self->_tilesLayer, "setHidden:");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_tiles;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setHidden:", v3, (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_setEnablePageShadows:(BOOL)a3
{
  CALayer *shadowLayer;
  void *v5;
  CALayer *v6;
  PDFPageLayer *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  CALayer *v12;
  PDFPageLayer *v13;
  double v14;
  double v15;
  CALayer *v16;

  shadowLayer = self->_shadowLayer;
  v16 = shadowLayer;
  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDF6950];
    v6 = shadowLayer;
    v7 = self;
    objc_msgSend(v5, "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "colorWithAlphaComponent:", 0.0586);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[PDFPageLayer setBorderColor:](v7, "setBorderColor:", objc_msgSend(v9, "CGColor"));

    -[PDFPageLayer setBorderWidth:](v7, "setBorderWidth:", 1.0);
    -[PDFPageLayer setShadowPathIsBounds:](v7, "setShadowPathIsBounds:", 1);
    LODWORD(v10) = 1043878380;
    -[PDFPageLayer setShadowOpacity:](v7, "setShadowOpacity:", v10);
    -[PDFPageLayer setShadowRadius:](v7, "setShadowRadius:", 2.0);
    -[PDFPageLayer setShadowOffset:](v7, "setShadowOffset:", 0.0, -1.0);

    -[CALayer setShadowPathIsBounds:](v6, "setShadowPathIsBounds:", 1);
    LODWORD(v11) = 1036831949;
    -[CALayer setShadowOpacity:](v6, "setShadowOpacity:", v11);
    -[CALayer setShadowRadius:](v6, "setShadowRadius:", 6.0);
    -[CALayer setShadowOffset:](v6, "setShadowOffset:", 0.0, -2.0);
  }
  else
  {
    v12 = shadowLayer;
    v13 = self;
    -[PDFPageLayer setBorderWidth:](v13, "setBorderWidth:", 0.0);
    LODWORD(v14) = 0;
    -[PDFPageLayer setShadowOpacity:](v13, "setShadowOpacity:", v14);
    -[PDFPageLayer setShadowRadius:](v13, "setShadowRadius:", 0.0);

    LODWORD(v15) = 0;
    -[CALayer setShadowOpacity:](v12, "setShadowOpacity:", v15);
    -[CALayer setShadowRadius:](v12, "setShadowRadius:", 0.0);
  }

}

- (void)tileDrawingComplete:(id)a3
{
  _DWORD *v4;
  id v5;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _DWORD *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  int v29;
  id WeakRetained;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  unint64_t v39;
  void *v40;
  double v41;
  float v42;
  void *context;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  context = (void *)MEMORY[0x20BD1ACC8]();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v7 = self->_tiles;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_DWORD **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isWorking") & 1) == 0)
        {
          v13 = v5;
          if (v12[26] < v4[26] || (v14 = objc_msgSend(v12, "hasContent"), v13 = v6, v14))
            objc_msgSend(v13, "addObject:", v12);
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v9);
  }

  v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
        if (objc_msgSend(v6, "count")
          && -[PDFPageLayer _isTile:occludedByTiles:](self, "_isTile:occludedByTiles:", v21, v6))
        {
          objc_msgSend(v15, "addObject:", v21);
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v18);
  }

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  while (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeLastObject");
    objc_msgSend(v22, "removeFromSuperlayer");
    -[NSMutableArray removeObject:](self->_tiles, "removeObject:", v22);

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v23 = self->_tiles;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v45;
    while (2)
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v45 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "contents");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v29 = 0;
          goto LABEL_34;
        }
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      if (v25)
        continue;
      break;
    }
  }
  v29 = 1;
LABEL_34:

  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v31 = WeakRetained;
  if (v29 && WeakRetained)
  {
    v56[1] = CFSTR("pageViewFrameInPDFView");
    v57[0] = WeakRetained;
    v56[0] = CFSTR("page");
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", self->_lastLayerFrameInRootView.origin.x, self->_lastLayerFrameInRootView.origin.y, self->_lastLayerFrameInRootView.size.width, self->_lastLayerFrameInRootView.size.height);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "postNotificationName:object:userInfo:", CFSTR("PDFPageDrawingComplete"), self, v33);

  }
  if (GetDefaultsWriteLogPerfTimes())
  {
    objc_msgSend(v31, "document");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "indexForPage:", v31);

    if (v29)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSince1970");
      v39 = (unint64_t)(v38 * 1000.0);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeIntervalSinceDate:", self->_lastZoomChange);
      v42 = v41;

      NSLog(CFSTR("PDFKit2_LogPerfTime: Page index %d has recieved its last tile for the current layout. Milliseconds since epoch: %llu. Took %0.3f seconds."), v36, v39, v42);
    }
    NSLog(CFSTR("PDFKit2_LogPerfTime: tileDrawingComplete on Page index %d. Total tiles: %d, oldTiles: %d, newTiles: %d"), v36, -[NSMutableArray count](self->_tiles, "count"), objc_msgSend(v16, "count"), objc_msgSend(v6, "count"), context);
  }

  objc_autoreleasePoolPop(context);
}

- (BOOL)_isTile:(id)a3 occludedByTiles:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  BOOL v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = (void *)MEMORY[0x24BDD1968];
  -[PDFPageLayer _layerTileToRootViewBounds:](self, "_layerTileToRootViewBounds:", v6);
  objc_msgSend(v9, "PDFKitValueWithPDFRect:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(v11);
        -[PDFPageLayer _layerTileToRootViewBounds:](self, "_layerTileToRootViewBounds:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), (_QWORD)v33);
        if (v18 > 0.0001)
        {
          v20 = v19;
          if (v19 > 0.0001)
          {
            v21 = v16;
            v22 = v17;
            v23 = v18;
            if (objc_msgSend(v8, "count"))
            {
              v24 = 0;
              do
              {
                objc_msgSend(v8, "objectAtIndex:", 0);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "removeObjectAtIndex:", 0);
                objc_msgSend(v25, "PDFKitPDFRectValue");
                -[PDFPageLayer _subtractRectB:fromRectA:](self, "_subtractRectB:fromRectA:", v21, v22, v23, v20, v26, v27, v28, v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30 || objc_msgSend(0, "count"))
                  objc_msgSend(v8, "addObjectsFromArray:", v30);

                ++v24;
              }
              while (v24 < objc_msgSend(v8, "count"));
            }
          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v13);
  }

  v31 = objc_msgSend(v8, "count") == 0;
  return v31;
}

- (id)_subtractRectB:(CGRect)a3 fromRectA:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  __n128 v25;
  __n128 v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  double v36;
  double v37;
  __n128 v38;
  __n128 v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  void *v44;
  double v45;
  unint64_t v46;
  unint64_t v47;
  double v48;
  double v49;
  double v50;
  __n128 v51;
  __n128 v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  void *v57;
  double v58;
  unint64_t v59;
  unint64_t v60;
  double v61;
  double v62;
  double v63;
  __n128 v64;
  __n128 v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  double v71;
  unint64_t v72;
  unint64_t v73;
  double v74;
  double v75;
  double v76;
  __n128 v77;
  __n128 v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  void *v83;
  double v84;
  unint64_t v85;
  unint64_t v86;
  double v87;
  double v88;
  double v89;
  __n128 v90;
  __n128 v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  void *v96;
  double v97;
  unint64_t v98;
  unint64_t v99;
  double v100;
  double v101;
  double v102;
  __n128 v103;
  __n128 v104;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  CGFloat v108;
  void *v109;
  double v110;
  unint64_t v111;
  unint64_t v112;
  double v113;
  double v114;
  double v115;
  __n128 v116;
  __n128 v117;
  CGFloat v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  _QWORD v128[2];
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
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
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v128[1] = *MEMORY[0x24BDAC8D0];
  v147.origin.x = v11;
  v147.origin.y = v10;
  v147.size.width = v9;
  v147.size.height = v8;
  if (!PDFRectIntersectsRect(a4, v147))
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", x, y, width, height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v128[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v12;
  }
  v130.origin.x = v11;
  v130.origin.y = v10;
  v130.size.width = v9;
  v130.size.height = v8;
  v148.origin.x = x;
  v148.origin.y = y;
  v148.size.width = width;
  v148.size.height = height;
  if (PDFRectContainsRect(v130, v148))
  {
    v12 = 0;
    return v12;
  }
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (x >= v11)
    v15 = v11;
  else
    v15 = x;
  if (y >= v10)
    v16 = v10;
  else
    v16 = y;
  v17 = x + width;
  v127 = v11 + v9;
  if (x + width < v11 + v9)
    v17 = v11 + v9;
  v124 = v15;
  v125 = v17;
  v18 = y + height;
  v126 = v10 + v8;
  if (y + height < v10 + v8)
    v18 = v10 + v8;
  v122 = v18;
  v123 = v16;
  v19 = PDFPointMake(v15, v16);
  v21 = v20;
  v22 = PDFPointMake(v11, v10);
  v24 = v23;
  v25.n128_f64[0] = v19;
  v26.n128_u64[0] = v21;
  PDFPageLayerTileRectFromPoints(v25, v26, v22, v24);
  v149.origin.x = v27;
  v149.origin.y = v28;
  v149.size.width = v29;
  v149.size.height = v30;
  v131.origin.x = x;
  v131.origin.y = y;
  v131.size.width = width;
  v131.size.height = height;
  v132 = PDFRectIntersection(v131, v149);
  if (v132.size.width > 0.0001 && v132.size.height > 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v132.origin.x, v132.origin.y);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v31);

  }
  v32 = PDFPointMake(v11, v123);
  v34 = v33;
  v35 = PDFPointMake(v127, v10);
  v37 = v36;
  v38.n128_f64[0] = v32;
  v39.n128_u64[0] = v34;
  PDFPageLayerTileRectFromPoints(v38, v39, v35, v37);
  v150.origin.x = v40;
  v150.origin.y = v41;
  v150.size.width = v42;
  v150.size.height = v43;
  v133.origin.x = x;
  v133.origin.y = y;
  v133.size.width = width;
  v133.size.height = height;
  v134 = PDFRectIntersection(v133, v150);
  if (v134.size.width > 0.0001 && v134.size.height > 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v134.origin.x, v134.origin.y);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v44);

  }
  v45 = PDFPointMake(v127, v123);
  v47 = v46;
  v48 = PDFPointMake(v125, v10);
  v50 = v49;
  v51.n128_f64[0] = v45;
  v52.n128_u64[0] = v47;
  PDFPageLayerTileRectFromPoints(v51, v52, v48, v50);
  v151.origin.x = v53;
  v151.origin.y = v54;
  v151.size.width = v55;
  v151.size.height = v56;
  v135.origin.x = x;
  v135.origin.y = y;
  v135.size.width = width;
  v135.size.height = height;
  v136 = PDFRectIntersection(v135, v151);
  if (v136.size.width > 0.0001 && v136.size.height > 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v136.origin.x, v136.origin.y);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v57);

  }
  v58 = PDFPointMake(v124, v10);
  v60 = v59;
  v61 = PDFPointMake(v11, v126);
  v63 = v62;
  v64.n128_f64[0] = v58;
  v65.n128_u64[0] = v60;
  PDFPageLayerTileRectFromPoints(v64, v65, v61, v63);
  v152.origin.x = v66;
  v152.origin.y = v67;
  v152.size.width = v68;
  v152.size.height = v69;
  v137.origin.x = x;
  v137.origin.y = y;
  v137.size.width = width;
  v137.size.height = height;
  v138 = PDFRectIntersection(v137, v152);
  if (v138.size.width > 0.0001 && v138.size.height > 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v138.origin.x, v138.origin.y);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v70);

  }
  v71 = PDFPointMake(v127, v10);
  v73 = v72;
  v74 = PDFPointMake(v125, v126);
  v76 = v75;
  v77.n128_f64[0] = v71;
  v78.n128_u64[0] = v73;
  PDFPageLayerTileRectFromPoints(v77, v78, v74, v76);
  v153.origin.x = v79;
  v153.origin.y = v80;
  v153.size.width = v81;
  v153.size.height = v82;
  v139.origin.x = x;
  v139.origin.y = y;
  v139.size.width = width;
  v139.size.height = height;
  v140 = PDFRectIntersection(v139, v153);
  if (v140.size.width > 0.0001 && v140.size.height > 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v140.origin.x, v140.origin.y);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v83);

  }
  v84 = PDFPointMake(v124, v126);
  v86 = v85;
  v87 = PDFPointMake(v11, v122);
  v89 = v88;
  v90.n128_f64[0] = v84;
  v91.n128_u64[0] = v86;
  PDFPageLayerTileRectFromPoints(v90, v91, v87, v89);
  v154.origin.x = v92;
  v154.origin.y = v93;
  v154.size.width = v94;
  v154.size.height = v95;
  v141.origin.x = x;
  v141.origin.y = y;
  v141.size.width = width;
  v141.size.height = height;
  v142 = PDFRectIntersection(v141, v154);
  if (v142.size.width > 0.0001 && v142.size.height > 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v142.origin.x, v142.origin.y);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v96);

  }
  v97 = PDFPointMake(v11, v126);
  v99 = v98;
  v100 = PDFPointMake(v127, v122);
  v102 = v101;
  v103.n128_f64[0] = v97;
  v104.n128_u64[0] = v99;
  PDFPageLayerTileRectFromPoints(v103, v104, v100, v102);
  v155.origin.x = v105;
  v155.origin.y = v106;
  v155.size.width = v107;
  v155.size.height = v108;
  v143.origin.x = x;
  v143.origin.y = y;
  v143.size.width = width;
  v143.size.height = height;
  v144 = PDFRectIntersection(v143, v155);
  if (v144.size.width > 0.0001 && v144.size.height > 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v144.origin.x, v144.origin.y);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v109);

  }
  v110 = PDFPointMake(v127, v126);
  v112 = v111;
  v113 = PDFPointMake(v125, v122);
  v115 = v114;
  v116.n128_f64[0] = v110;
  v117.n128_u64[0] = v112;
  PDFPageLayerTileRectFromPoints(v116, v117, v113, v115);
  v156.origin.x = v118;
  v156.origin.y = v119;
  v156.size.width = v120;
  v156.size.height = v121;
  v145.origin.x = x;
  v145.origin.y = y;
  v145.size.width = width;
  v145.size.height = height;
  v146 = PDFRectIntersection(v145, v156);
  if (v146.size.width > 0.0001 && v146.size.height > 0.0001)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v146.origin.x, v146.origin.y);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);
    goto LABEL_5;
  }
  return v12;
}

- (CGRect)_layerTileToRootViewBounds:(id)a3
{
  PDFPageLayerGeometryInterface **p_geometryInterface;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v50;
  double v51;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;
  CGRect v59;
  CGRect v60;

  p_geometryInterface = &self->_geometryInterface;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_geometryInterface);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "convertRect:toLayer:", self);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = PDFRectFromCGRect(v8, v10, v12, v14);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PDFPageLayer bounds](self, "bounds");
  v54.origin.x = PDFRectFromCGRect(v22, v23, v24, v25);
  v59.origin.x = v15;
  v59.origin.y = v17;
  v59.size.width = v19;
  v59.size.height = v21;
  v55 = PDFRectIntersection(v54, v59);
  objc_msgSend(WeakRetained, "convertRectToRootView:fromPageLayer:", self, v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  objc_msgSend(WeakRetained, "rootViewBounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "extendedRootViewBounds");
    v35 = v42;
    v37 = v43;
    v39 = v44;
    v41 = v45;
  }
  v56.origin.x = v27;
  v56.origin.y = v29;
  v56.size.width = v31;
  v56.size.height = v33;
  v60.origin.x = v35;
  v60.origin.y = v37;
  v60.size.width = v39;
  v60.size.height = v41;
  v57 = PDFRectIntersection(v56, v60);
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;

  v50 = x;
  v51 = y;
  v52 = width;
  v53 = height;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (CGRect)_pageLayerVisibleRect
{
  id WeakRetained;
  double v4;
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
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryInterface);
  objc_msgSend(WeakRetained, "rootViewBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "extendedRootViewBounds");
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  -[PDFPageLayer frame](self, "frame");
  v20 = PDFRectFromCGRect(v16, v17, v18, v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(WeakRetained, "convertRootViewRect:toPageLayer:", self, v5, v7, v9, v11);
  v42.origin.x = v27;
  v42.origin.y = v28;
  v42.size.width = v29;
  v42.size.height = v30;
  v39.origin.x = v20;
  v39.origin.y = v22;
  v39.size.width = v24;
  v39.size.height = v26;
  v40 = PDFRectIntersection(v39, v42);
  x = v40.origin.x;
  y = v40.origin.y;
  width = v40.size.width;
  height = v40.size.height;

  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (BOOL)_hasTileWithFrameInLayer:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_tiles;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "frame", (_QWORD)v19);
        if (vabdd_f64(PDFRectFromCGRect(v11, v12, v13, v14), x) < 0.0001
          && vabdd_f64(v15, y) < 0.0001
          && vabdd_f64(v16, width) < 0.0001
          && vabdd_f64(v17, height) < 0.0001)
        {
          LOBYTE(v8) = 1;
          goto LABEL_14;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:

  return v8;
}

- (void)_printRectsArray:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  NSLog(CFSTR("Rect count: %d"), objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "PDFKitPDFRectValue");
        PDFRectToString(v9, v10, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("rectValue: %@"), v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)_renderingPropertyUpdate:(id)a3
{
  void *v4;
  uint64_t v5;
  id WeakRetained;
  id v7;

  objc_msgSend(a3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("PDFRenderingPropertyKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5)
  {
    if (v5 == 6)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
      -[PDFPageLayer _setEnablePageShadows:](self, "_setEnablePageShadows:", objc_msgSend(WeakRetained, "enablePageShadows"));

    }
  }
  else
  {
    -[PDFPageLayer setNeedsTilesUpdate](self, "setNeedsTilesUpdate");
    -[PDFPageLayer updatePageLayerEffects](self, "updatePageLayerEffects");
  }

}

- (void)_updateTiles
{
  id WeakRetained;
  void *v4;
  _BOOL4 isForcingUpdate;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  int64_t oldPageRotation;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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
  double v39;
  double v40;
  __n128 v41;
  __n128 v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  double v47;
  dispatch_time_t v48;
  NSDate *v49;
  NSDate *lastZoomChange;
  id v51;
  __n128 v52;
  __n128 v53;
  double v54;
  double v55;
  int v56;
  double v57;
  double v58;
  int v59;
  float v60;
  float v61;
  int v62;
  _OWORD *v63;
  int v64;
  double x;
  double y;
  double width;
  double height;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  PDFPageLayerTile *v77;
  uint64_t generationCount;
  PDFPageLayerTile *v79;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i;
  _DWORD *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double CenterPoint;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  uint64_t v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  __int128 v112;
  __int128 v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  int v119;
  int v120;
  int v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  double v130;
  void *v131;
  double v132;
  CGFloat v133;
  CGFloat v134;
  double v135;
  id v136;
  double obj;
  double obja;
  id objb;
  double v140;
  double v141;
  void *v142;
  void *v143;
  void *v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _QWORD v149[6];
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  CGAffineTransform v154;
  CGAffineTransform v155;
  CGAffineTransform v156;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform location;
  _QWORD block[4];
  id v161;
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;

  v164 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
  v4 = WeakRetained;
  if (!self->_tileLayerHidden && self->_allowUpdate && objc_msgSend(WeakRetained, "enableTileUpdates"))
  {
    if (-[PDFPageLayer isVisible](self, "isVisible") && (GetDefaultsWriteDrawTiles() & 1) != 0)
    {
      isForcingUpdate = self->_isForcingUpdate;
      if (self->_isForcingUpdate)
        ++self->_generationCount;
      v6 = objc_loadWeakRetained((id *)&self->_page);
      objc_msgSend(v6, "boundsForBox:", objc_msgSend(v4, "displayBox"));
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      oldPageRotation = self->_oldPageRotation;
      v144 = v6;
      if (oldPageRotation != objc_msgSend(v6, "rotation")
        || (v167.origin.x = v8,
            v167.origin.y = v10,
            v167.size.width = v12,
            v167.size.height = v14,
            !PDFRectEqualToRect(self->_oldBoundsForBox, v167)))
      {
        self->_oldPageRotation = objc_msgSend(v6, "rotation");
        self->_oldBoundsForBox.origin.x = v8;
        self->_oldBoundsForBox.origin.y = v10;
        self->_oldBoundsForBox.size.width = v12;
        self->_oldBoundsForBox.size.height = v14;
        -[PDFPageLayer clearTiles](self, "clearTiles");
      }
      v140 = v12;
      v16 = objc_loadWeakRetained((id *)&self->_geometryInterface);
      objc_msgSend(v16, "rootViewBounds");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      obj = v14;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "extendedRootViewBounds");
        v18 = v25;
        v20 = v26;
        v22 = v27;
        v24 = v28;
      }
      -[PDFPageLayer bounds](self, "bounds");
      objc_msgSend(v16, "convertRectToRootView:fromPageLayer:", self, PDFRectFromCGRect(v29, v30, v31, v32));
      v34 = v33;
      v118 = v35;
      v37 = v36;
      v39 = v38;
      +[PDFTilePool sharedPool](PDFTilePool, "sharedPool");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (double)(int)objc_msgSend(v143, "tileSurfaceSize");
      v41.n128_u64[0] = 0;
      v42.n128_u64[0] = 0;
      v125 = v16;
      objc_msgSend(v16, "convertRootViewRect:toPageLayer:", self, PDFRectMake(v41, v42, v40, v40));
      v135 = v40;
      v126 = v43;
      v124 = v40 / v43;
      if (vabdd_f64(self->_lastLayoutZoomFactor, v40 / v43) > 0.0001)
      {
        v44 = v34;
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "timeIntervalSinceDate:", self->_lastZoomChange);
        v47 = v46;

        if (self->_lastZoomChange && v47 < self->_zoomGenerationDelay)
        {
          if (!self->_zoomChangeScheduled)
          {
            self->_zoomChangeScheduled = 1;
            objc_initWeak((id *)&location, self);
            v48 = dispatch_time(0, (uint64_t)(self->_zoomGenerationDelay * 1000000000.0));
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __28__PDFPageLayer__updateTiles__block_invoke;
            block[3] = &unk_24C25D090;
            objc_copyWeak(&v161, (id *)&location);
            dispatch_after(v48, MEMORY[0x24BDAC9B8], block);
            objc_destroyWeak(&v161);
            objc_destroyWeak((id *)&location);
          }
LABEL_69:

          goto LABEL_2;
        }
        self->_lastLayoutZoomFactor = v124;
        v34 = v44;
        self->_lastLayerFrameInRootView.origin.x = v44;
        self->_lastLayerFrameInRootView.origin.y = v118;
        self->_lastLayerFrameInRootView.size.width = v37;
        self->_lastLayerFrameInRootView.size.height = v39;
        ++self->_generationCount;
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v49 = (NSDate *)objc_claimAutoreleasedReturnValue();
        lastZoomChange = self->_lastZoomChange;
        self->_lastZoomChange = v49;

        -[PDFPageLayer updatePageLayerEffects](self, "updatePageLayerEffects");
      }
      v51 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v53.n128_f64[0] = v18 - v34;
      if (v34 >= v18)
        v121 = 0;
      else
        v121 = (int)(v53.n128_f64[0] / v135);
      v134 = v22;
      v116 = 224;
      v54 = v20 - v118;
      v142 = v4;
      if (v118 >= v20)
      {
        v56 = 0;
        v55 = v135;
      }
      else
      {
        v55 = v135;
        v56 = (int)(v54 / v135);
      }
      v57 = v24 + v54;
      v133 = v24;
      if (v39 <= v24)
        v57 = v39;
      v120 = (int)(v57 / v55);
      if (v56 <= v120)
      {
        v58 = v22 + v53.n128_f64[0];
        if (v37 <= v22)
          v58 = v37;
        v59 = (int)(v58 / v55);
        v60 = v124 * ceil(v140 * v124) / (v140 * v124);
        v61 = v124 * ceil(obj * v124) / (obj * v124);
        v122 = v61;
        v123 = v60;
        v119 = v59;
        v62 = v59 + 1;
        v63 = (_OWORD *)MEMORY[0x24BDBD8B8];
        v130 = v34;
        v132 = v18;
        do
        {
          if (v121 <= v119)
          {
            obja = v118 + (double)v56 * v55;
            v64 = v121;
            do
            {
              v53.n128_f64[0] = v34 + (double)v64 * v55;
              v52.n128_f64[0] = obja;
              v165.origin.x = PDFRectMake(v53, v52, v55, v55);
              x = v165.origin.x;
              y = v165.origin.y;
              width = v165.size.width;
              height = v165.size.height;
              v168.origin.x = v18;
              v69 = v20;
              v168.origin.y = v20;
              v168.size.height = v133;
              v168.size.width = v134;
              if (PDFRectIntersectsRect(v165, v168))
              {
                v52.n128_f64[0] = v126 * (double)v56;
                v53.n128_f64[0] = v126 * (double)v64;
                v70 = PDFRectMake(v53, v52, v126, v126);
                v74 = v70;
                v75 = v71;
                v141 = v72;
                v76 = v73;
                if (isForcingUpdate
                  || !-[PDFPageLayer _hasTileWithFrameInLayer:](self, "_hasTileWithFrameInLayer:", v70, v71, v72, v73))
                {
                  v129 = v63[1];
                  *(_OWORD *)&location.a = *v63;
                  v128 = *(_OWORD *)&location.a;
                  *(_OWORD *)&location.c = v129;
                  *(_OWORD *)&location.tx = v63[2];
                  v127 = *(_OWORD *)&location.tx;
                  CGAffineTransformMakeTranslation(&t2, -v74, -v75);
                  *(_OWORD *)&t1.a = v128;
                  *(_OWORD *)&t1.c = v129;
                  *(_OWORD *)&t1.tx = v127;
                  CGAffineTransformConcat(&location, &t1, &t2);
                  CGAffineTransformMakeScale(&v156, v123, v122);
                  v155 = location;
                  CGAffineTransformConcat(&t1, &v155, &v156);
                  location = t1;
                  v77 = [PDFPageLayerTile alloc];
                  generationCount = self->_generationCount;
                  t1 = location;
                  v79 = -[PDFPageLayerTile initWithFrame:forPageLayer:withRenderingTransform:tileContentsScale:generationID:](v77, "initWithFrame:forPageLayer:withRenderingTransform:tileContentsScale:generationID:", self, &t1, generationCount, v74, v75, v141, v76, v124);
                  -[PDFPageLayerTile setRootViewFrame:](v79, "setRootViewFrame:", x, y, width, height);
                  if (objc_msgSend(v125, "flipsTileContents"))
                  {
                    CGAffineTransformMakeScale(&v154, 1.0, -1.0);
                    -[PDFPageLayerTile setAffineTransform:](v79, "setAffineTransform:", &v154);
                  }
                  objc_msgSend(v51, "addObject:", v79, v116);

                }
              }
              ++v64;
              v34 = v130;
              v18 = v132;
              v20 = v69;
              v55 = v135;
            }
            while (v62 != v64);
          }
        }
        while (v56++ != v120);
      }
      v131 = v51;
      -[NSMutableArray sortedArrayUsingComparator:](self->_tiles, "sortedArrayUsingComparator:", &__block_literal_global_7, v116);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v150 = 0u;
      v151 = 0u;
      v152 = 0u;
      v153 = 0u;
      objb = v81;
      v83 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v150, v163, 16);
      if (v83)
      {
        v84 = v83;
        v85 = *(_QWORD *)v151;
        do
        {
          for (i = 0; i != v84; ++i)
          {
            if (*(_QWORD *)v151 != v85)
              objc_enumerationMutation(objb);
            v87 = *(_DWORD **)(*((_QWORD *)&v150 + 1) + 8 * i);
            if (v87[26] >= self->_generationCount - 8
              && ((objc_msgSend(*(id *)(*((_QWORD *)&v150 + 1) + 8 * i), "isWorking") & 1) != 0
               || (objc_msgSend(v87, "hasContent") & 1) != 0
               || v87[26] >= self->_generationCount))
            {
              objc_msgSend(v87, "bounds");
              objc_msgSend(v87, "convertRect:toLayer:", self);
              objc_msgSend(v125, "convertRectToRootView:fromPageLayer:", self, PDFRectFromCGRect(v88, v89, v90, v91));
              v169.origin.x = v18;
              v169.origin.y = v20;
              v169.size.width = v134;
              v169.size.height = v133;
              if (PDFRectIntersectsRect(v166, v169))
                continue;
            }
            objc_msgSend(v82, "addObject:", v87);
          }
          v84 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v150, v163, 16);
        }
        while (v84);
      }

      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      while (objc_msgSend(v82, "count"))
      {
        objc_msgSend(v82, "lastObject");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "removeLastObject");
        objc_msgSend(v92, "removeFromSuperlayer");
        -[NSMutableArray removeObject:](self->_tiles, "removeObject:", v92);

      }
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      objc_msgSend(v125, "rootViewBounds");
      CenterPoint = PDFRectGetCenterPoint(v93, v94, v95);
      v149[0] = MEMORY[0x24BDAC760];
      v149[1] = 3221225472;
      v149[2] = __28__PDFPageLayer__updateTiles__block_invoke_3;
      v149[3] = &__block_descriptor_48_e47_q24__0__PDFPageLayerTile_8__PDFPageLayerTile_16l;
      *(double *)&v149[4] = CenterPoint;
      v149[5] = v97;
      objc_msgSend(v51, "sortedArrayUsingComparator:", v149);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      v147 = 0u;
      v148 = 0u;
      v145 = 0u;
      v146 = 0u;
      v136 = v98;
      v99 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
      if (v99)
      {
        v100 = v99;
        v101 = *(_QWORD *)v146;
        do
        {
          for (j = 0; j != v100; ++j)
          {
            if (*(_QWORD *)v146 != v101)
              objc_enumerationMutation(v136);
            v103 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * j);
            -[CALayer addSublayer:](self->_tilesLayer, "addSublayer:", v103);
            -[NSMutableArray addObject:](self->_tiles, "addObject:", v103);
            objc_msgSend((id)v103, "setZPosition:", -800.0);
            v104 = *(double *)(v103 + 88);
            objc_msgSend((id)v103, "frame");
            v109 = PDFRectFromCGRect(v105, v106, v107, v108);
            v111 = v110;
            ++_updateTiles_requestTag;
            v112 = *(_OWORD *)(v103 + 40);
            v113 = *(_OWORD *)(v103 + 72);
            *(_OWORD *)&location.c = *(_OWORD *)(v103 + 56);
            *(_OWORD *)&location.tx = v113;
            *(_OWORD *)&location.a = v112;
            objc_msgSend(v143, "requestPDFTileSurfaceForTarget:forPage:withRenderingProperties:atZoomFactor:frame:transform:tag:", v103, v144, v142, &location, v104, v109, v114, v111, v115);
          }
          v100 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v145, v162, 16);
        }
        while (v100);
      }

      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      if (isForcingUpdate)
        *((_BYTE *)&self->super.super.isa + v117) = 0;

      v4 = v142;
      goto LABEL_69;
    }
    self->_isForcingUpdate = 0;
    -[PDFPageLayer _releaseTiles](self, "_releaseTiles");
  }
LABEL_2:

}

void __28__PDFPageLayer__updateTiles__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[168] = 0;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateTiles");
    WeakRetained = v2;
  }

}

uint64_t __28__PDFPageLayer__updateTiles__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a2 + 104) < *(_DWORD *)(a3 + 104))
    return 1;
  else
    return -1;
}

uint64_t __28__PDFPageLayer__updateTiles__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double CenterPoint;
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

  v5 = a3;
  objc_msgSend(a2, "rootViewFrame");
  CenterPoint = PDFRectGetCenterPoint(v6, v7, v8);
  v11 = sqrt((v10 - *(double *)(a1 + 40)) * (v10 - *(double *)(a1 + 40))+ (CenterPoint - *(double *)(a1 + 32)) * (CenterPoint - *(double *)(a1 + 32)));
  objc_msgSend(v5, "rootViewFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = PDFRectGetCenterPoint(v13, v15, v17);
  if (v11 >= sqrt((v19 - *(double *)(a1 + 40)) * (v19 - *(double *)(a1 + 40))+ (v18 - *(double *)(a1 + 32)) * (v18 - *(double *)(a1 + 32))))return 1;
  else
    return -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageLayerEffects, 0);
  objc_storeStrong((id *)&self->_effectsLayer, 0);
  objc_storeStrong((id *)&self->_forcedUpdateTimer, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_lastZoomChange, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_tilesLayer, 0);
  objc_destroyWeak((id *)&self->_renderingProperties);
  objc_destroyWeak((id *)&self->_geometryInterface);
  objc_destroyWeak((id *)&self->_page);
}

@end
