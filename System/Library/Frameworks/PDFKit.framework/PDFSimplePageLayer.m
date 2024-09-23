@implementation PDFSimplePageLayer

- (PDFSimplePageLayer)initWithPage:(id)a3 geometryInterface:(id)a4 andRenderingProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  PDFSimplePageLayer *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  CALayer *v21;
  CALayer *effectsLayer;
  uint64_t v23;
  NSMutableDictionary *pageLayerEffects;
  uint64_t v25;
  void *v26;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PDFSimplePageLayer;
  v11 = -[PDFSimplePageLayer init](&v28, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "document");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_page, v8);
    objc_storeWeak((id *)&v11->_geometryInterface, v9);
    objc_storeWeak((id *)&v11->_renderingProperties, v10);
    -[PDFSimplePageLayer setValue:forKeyPath:](v11, "setValue:forKeyPath:", MEMORY[0x24BDBD1C8], CFSTR("separatedOptions.enableContext"));
    objc_msgSend(v8, "boundsForBox:", objc_msgSend(v10, "displayBox"));
    v14 = v13;
    v16 = v15;
    PDFPointMake(0.0, 0.0);
    -[PDFSimplePageLayer setFrame:](v11, "setFrame:", PDFRectToCGRect(v17));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v11, sel__pageDidRotate_, CFSTR("PDFPageDidRotate"), v12);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v11, sel__pageDidRotate_, CFSTR("PDFPageDidChangeBounds"), v12);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v11, sel__pageChangedPageRef_, CFSTR("PDFPagePageRefChanged"), v8);

    v21 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    effectsLayer = v11->_effectsLayer;
    v11->_effectsLayer = v21;

    -[PDFSimplePageLayer addSublayer:](v11, "addSublayer:", v11->_effectsLayer);
    -[CALayer setFrame:](v11->_effectsLayer, "setFrame:", 0.0, 0.0, v14, v16);
    -[CALayer setAllowsGroupBlending:](v11->_effectsLayer, "setAllowsGroupBlending:", 0);
    v23 = objc_opt_new();
    pageLayerEffects = v11->_pageLayerEffects;
    v11->_pageLayerEffects = (NSMutableDictionary *)v23;

    -[PDFSimplePageLayer setContentsScale:](v11, "setContentsScale:", 2.0);
    -[PDFSimplePageLayer setMinificationFilter:](v11, "setMinificationFilter:", *MEMORY[0x24BDE5C20]);
    v25 = objc_msgSend(v12, "indexForPage:", v8);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PDFPageLayer, page index %d"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFSimplePageLayer setName:](v11, "setName:", v26);

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateGeometry, 0);
  v3.receiver = self;
  v3.super_class = (Class)PDFSimplePageLayer;
  -[PDFSimplePageLayer dealloc](&v3, sel_dealloc);
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
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updateGeometry, 0);
  -[PDFSimplePageLayer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateGeometry, 0, 0.25);
}

- (int64_t)displayBox
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
  v3 = objc_msgSend(WeakRetained, "displayBox");

  return v3;
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
  -[PDFSimplePageLayer bounds](self, "bounds");
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
    -[PDFSimplePageLayer updatePageLayerEffectForID:](self, "updatePageLayerEffectForID:", v12);

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

- (void)updatePageLayerEffectForID:(id)a3
{
  void *v4;
  uint64_t v5;

  -[PDFSimplePageLayer pageLayerEffectForID:](self, "pageLayerEffectForID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[PDFSimplePageLayer layerEffectTransform](self, "layerEffectTransform");
    -[PDFSimplePageLayer _updateLayerEffect:withPageTransform:](self, "_updateLayerEffect:withPageTransform:", v4, &v5);
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
  -[PDFSimplePageLayer layerEffectTransform](self, "layerEffectTransform");
  -[PDFSimplePageLayer _pageLayerEffects](self, "_pageLayerEffects");
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
        -[PDFSimplePageLayer _updateLayerEffect:withPageTransform:](self, "_updateLayerEffect:withPageTransform:", v8, v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
    }
    while (v5);
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

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

- (BOOL)enablesTileUpdates
{
  return 0;
}

- (void)setVisibilityDelegateIndex:(unint64_t)a3
{
  self->_visibilityDelegateIndex = a3;
}

- (unint64_t)visibilityDelegateIndex
{
  return self->_visibilityDelegateIndex;
}

- (void)drawInContext:(CGContext *)a3
{
  CGFloat v5;
  id WeakRetained;
  id v7;
  CGAffineTransform v8;

  CGContextSaveGState(a3);
  -[PDFSimplePageLayer frame](self, "frame");
  v8.b = 0.0;
  v8.c = 0.0;
  v8.a = 1.0;
  *(_OWORD *)&v8.d = xmmword_209DC0750;
  v8.ty = v5;
  CGContextConcatCTM(a3, &v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v7 = objc_loadWeakRetained((id *)&self->_renderingProperties);
  objc_msgSend(WeakRetained, "drawWithBox:inContext:", objc_msgSend(v7, "displayBox"), a3);

  CGContextRestoreGState(a3);
}

- (void)_updateGeometry
{
  __n128 v3;
  __n128 v4;
  double v5;
  double v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryInterface);
  v3.n128_u64[0] = 0;
  v4.n128_u64[0] = 0;
  objc_msgSend(WeakRetained, "convertRootViewRect:toPageLayer:", self, PDFRectMake(v3, v4, 1.0, 1.0));
  v6 = 1.0 / v5;
  -[PDFSimplePageLayer setContentsScale:](self, "setContentsScale:", 1.0 / v5);
  self->_contentsScale = v6;
  -[PDFSimplePageLayer setNeedsDisplay](self, "setNeedsDisplay");

}

- (id)_pageLayerEffects
{
  return (id)-[NSMutableDictionary allValues](self->_pageLayerEffects, "allValues");
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

- (void)_pageDidRotate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id WeakRetained;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("page"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PDFSimplePageLayer page](self, "page");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v8;
  if (v8 == v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_renderingProperties);
    objc_msgSend(v8, "boundsForBox:", objc_msgSend(WeakRetained, "displayBox"));

    PDFPointMake(0.0, 0.0);
    if (objc_msgSend(v8, "rotation") != 90)
      objc_msgSend(v8, "rotation");
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    -[PDFSimplePageLayer setFrame:](self, "setFrame:", PDFRectToCGRect(objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1)));
    -[PDFSimplePageLayer display](self, "display");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[PDFSimplePageLayer updatePageLayerEffects](self, "updatePageLayerEffects");
    v6 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectsLayer, 0);
  objc_storeStrong((id *)&self->_pageLayerEffects, 0);
  objc_destroyWeak((id *)&self->_renderingProperties);
  objc_destroyWeak((id *)&self->_geometryInterface);
  objc_destroyWeak((id *)&self->_page);
}

@end
