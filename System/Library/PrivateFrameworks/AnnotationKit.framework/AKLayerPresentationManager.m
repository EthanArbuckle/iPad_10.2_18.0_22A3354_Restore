@implementation AKLayerPresentationManager

- (AKLayerPresentationManager)initWithPageController:(id)a3
{
  id v4;
  AKLayerPresentationManager *v5;
  AKLayerPresentationManager *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKLayerPresentationManager;
  v5 = -[AKLayerPresentationManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKLayerPresentationManager setPageController:](v5, "setPageController:", v4);
    v7 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    -[AKLayerPresentationManager setRootLayer:](v6, "setRootLayer:", v7);

    -[AKLayerPresentationManager rootLayer](v6, "rootLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMasksToBounds:", 1);

    -[AKLayerPresentationManager rootLayer](v6, "rootLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    -[AKLayerPresentationManager rootLayer](v6, "rootLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEdgeAntialiasingMask:", 0);

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLayerPresentationManager setAnnotationsToAnnotationLayers:](v6, "setAnnotationsToAnnotationLayers:", v11);

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLayerPresentationManager setAnnotationsToAdornmentLayers:](v6, "setAnnotationsToAdornmentLayers:", v12);

    -[AKLayerPresentationManager setCurrentScaleFactor:](v6, "setCurrentScaleFactor:", 1.0);
    -[AKLayerPresentationManager setAlignmentGuidePositionX:](v6, "setAlignmentGuidePositionX:", 1.79769313e308);
    -[AKLayerPresentationManager setAlignmentGuidePositionY:](v6, "setAlignmentGuidePositionY:", 1.79769313e308);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[AKLayerPresentationManager teardown](self, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)AKLayerPresentationManager;
  -[AKLayerPresentationManager dealloc](&v3, sel_dealloc);
}

- (void)setup
{
  MEMORY[0x24BEDD108](self, sel__startObservingModel);
}

- (void)teardown
{
  MEMORY[0x24BEDD108](self, sel__stopObservingModel);
}

- (void)setShouldPixelate:(BOOL)a3
{
  self->_shouldPixelate = a3;
  -[AKLayerPresentationManager updateScaleFactor:isLiveUpdate:forceUpdate:](self, "updateScaleFactor:isLiveUpdate:forceUpdate:", 0, 1, 9.22337204e18);
}

- (void)setAdornmentsHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_adornmentsHidden != a3)
  {
    v3 = a3;
    self->_adornmentsHidden = a3;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[AKLayerPresentationManager annotationsToAdornmentLayers](self, "annotationsToAdornmentLayers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setHidden:", v3);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)updateScaleFactor:(double)a3 isLiveUpdate:(BOOL)a4 forceUpdate:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  id v10;

  v5 = a5;
  v6 = a4;
  -[AKLayerPresentationManager rootLayer](self, "rootLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sublayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKLayerPresentationManager _applyUpdatesWithScale:toLayers:isLiveUpdate:forceUpdate:](self, "_applyUpdatesWithScale:toLayers:isLiveUpdate:forceUpdate:", v9, v6, v5, a3);

}

- (void)setAlignmentGuidePositionX:(double)a3
{
  void *v5;
  void *v6;
  AKAlignmentGuideLineLayer *v7;
  double v8;
  double v9;
  void *v10;
  AKAlignmentGuideLineLayer *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  CGRect v33;

  if (self->_alignmentGuidePositionX != a3)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    self->_alignmentGuidePositionX = a3;
    -[AKLayerPresentationManager alignmentGuideXLayer](self, "alignmentGuideXLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3 == 1.79769313e308)
    {
      objc_msgSend(v5, "removeFromSuperlayer");

      -[AKLayerPresentationManager setAlignmentGuideXLayer:](self, "setAlignmentGuideXLayer:", 0);
    }
    else
    {

      if (!v6)
      {
        v7 = [AKAlignmentGuideLineLayer alloc];
        -[AKLayerPresentationManager currentScaleFactor](self, "currentScaleFactor");
        v9 = v8;
        -[AKLayerPresentationManager rootLayer](self, "rootLayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bounds");
        v11 = -[AKAlignmentGuideLineLayer initWithScaleFactor:forVerticalOrientation:withMaxSize:](v7, "initWithScaleFactor:forVerticalOrientation:withMaxSize:", 1, v9, CGRectGetHeight(v33));
        -[AKLayerPresentationManager setAlignmentGuideXLayer:](self, "setAlignmentGuideXLayer:", v11);

        v12 = (double)(unint64_t)(AKAdornmentZPositionOffset - 1);
        -[AKLayerPresentationManager alignmentGuideXLayer](self, "alignmentGuideXLayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setZPosition:", v12);

        v14 = *MEMORY[0x24BDBF090];
        v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
        -[AKLayerPresentationManager alignmentGuideXLayer](self, "alignmentGuideXLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFrame:", v14, v15, v16, v17);

        -[AKLayerPresentationManager rootLayer](self, "rootLayer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKLayerPresentationManager alignmentGuideXLayer](self, "alignmentGuideXLayer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSublayer:", v20);

      }
      -[AKLayerPresentationManager alignmentGuideXLayer](self, "alignmentGuideXLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "position");
      v23 = v22;

      -[AKLayerPresentationManager pageController](self, "pageController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "geometryHelper");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKLayerPresentationManager alignmentGuideXLayer](self, "alignmentGuideXLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lineWidth");
      objc_msgSend(v25, "screenStrokeAlignedRectForRect:withStrokeWidth:", a3, v23, 0.0, 0.0, v27);
      v29 = v28;
      v31 = v30;

      -[AKLayerPresentationManager alignmentGuideXLayer](self, "alignmentGuideXLayer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPosition:", v29, v31);

    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (void)setAlignmentGuidePositionY:(double)a3
{
  void *v5;
  void *v6;
  AKAlignmentGuideLineLayer *v7;
  double v8;
  double v9;
  void *v10;
  AKAlignmentGuideLineLayer *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  CGRect v33;

  if (self->_alignmentGuidePositionY != a3)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    self->_alignmentGuidePositionY = a3;
    -[AKLayerPresentationManager alignmentGuideYLayer](self, "alignmentGuideYLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (a3 == 1.79769313e308)
    {
      objc_msgSend(v5, "removeFromSuperlayer");

      -[AKLayerPresentationManager setAlignmentGuideYLayer:](self, "setAlignmentGuideYLayer:", 0);
    }
    else
    {

      if (!v6)
      {
        v7 = [AKAlignmentGuideLineLayer alloc];
        -[AKLayerPresentationManager currentScaleFactor](self, "currentScaleFactor");
        v9 = v8;
        -[AKLayerPresentationManager rootLayer](self, "rootLayer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bounds");
        v11 = -[AKAlignmentGuideLineLayer initWithScaleFactor:forVerticalOrientation:withMaxSize:](v7, "initWithScaleFactor:forVerticalOrientation:withMaxSize:", 0, v9, CGRectGetWidth(v33));
        -[AKLayerPresentationManager setAlignmentGuideYLayer:](self, "setAlignmentGuideYLayer:", v11);

        v12 = (double)(unint64_t)(AKAdornmentZPositionOffset - 1);
        -[AKLayerPresentationManager alignmentGuideYLayer](self, "alignmentGuideYLayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setZPosition:", v12);

        v14 = *MEMORY[0x24BDBF090];
        v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
        v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
        v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
        -[AKLayerPresentationManager alignmentGuideYLayer](self, "alignmentGuideYLayer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFrame:", v14, v15, v16, v17);

        -[AKLayerPresentationManager rootLayer](self, "rootLayer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKLayerPresentationManager alignmentGuideYLayer](self, "alignmentGuideYLayer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addSublayer:", v20);

      }
      -[AKLayerPresentationManager alignmentGuideYLayer](self, "alignmentGuideYLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "position");
      v23 = v22;

      -[AKLayerPresentationManager pageController](self, "pageController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "geometryHelper");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKLayerPresentationManager alignmentGuideYLayer](self, "alignmentGuideYLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lineWidth");
      objc_msgSend(v25, "screenStrokeAlignedRectForRect:withStrokeWidth:", v23, a3, 0.0, 0.0, v27);
      v29 = v28;
      v31 = v30;

      -[AKLayerPresentationManager alignmentGuideYLayer](self, "alignmentGuideYLayer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setPosition:", v29, v31);

    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (id)adornmentLayerForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AKLayerPresentationManager annotationsToAdornmentLayers](self, "annotationsToAdornmentLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t ii;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id obj;
  id obja;
  objc_super v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == CFSTR("AKLayerPresentationManager.modelAnnotationsObservationContext"))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v53 = v11;
    v55 = v10;
    v51 = v14;
    v52 = v13;
    v50 = v15;
    if (v14)
    {
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      obj = v14;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v81 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            -[AKLayerPresentationManager _updateLoupeAnnotationsIntersectingRemovedAnnotation:](self, "_updateLoupeAnnotationsIntersectingRemovedAnnotation:", v20, v50, v51);
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            objc_msgSend(v20, "keysForValuesToObserveForRedrawing");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v77;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v77 != v24)
                    objc_enumerationMutation(v21);
                  objc_msgSend(v20, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j), CFSTR("AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"));
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
              }
              while (v23);
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              -[AKLayerPresentationManager _removeAdornmentLayerForAnnotation:](self, "_removeAdornmentLayerForAnnotation:", v20);
            -[AKLayerPresentationManager _removeLayerForAnnotation:](self, "_removeLayerForAnnotation:", v20);
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
        }
        while (v17);
      }

      v11 = v53;
      v10 = v55;
      v14 = v51;
      v13 = v52;
      v15 = v50;
    }
    if (v15)
    {
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      obja = v15;
      v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v73;
        do
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v73 != v28)
              objc_enumerationMutation(obja);
            v30 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
            -[AKLayerPresentationManager _addLayerForAnnotation:](self, "_addLayerForAnnotation:", v30, v50, v51);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              -[AKLayerPresentationManager _addAdornmentLayerForAnnotation:](self, "_addAdornmentLayerForAnnotation:", v30);
            -[AKLayerPresentationManager _updateLoupeAnnotationsContributedToByAnnotation:](self, "_updateLoupeAnnotationsContributedToByAnnotation:", v30);
            v70 = 0u;
            v71 = 0u;
            v68 = 0u;
            v69 = 0u;
            objc_msgSend(v30, "keysForValuesToObserveForRedrawing");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v69;
              do
              {
                for (m = 0; m != v33; ++m)
                {
                  if (*(_QWORD *)v69 != v34)
                    objc_enumerationMutation(v31);
                  objc_msgSend(v30, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * m), 0, CFSTR("AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"));
                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v68, v86, 16);
              }
              while (v33);
            }

          }
          v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v87, 16);
        }
        while (v27);
      }

      v11 = v53;
      v10 = v55;
      v14 = v51;
      v13 = v52;
      v15 = v50;
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit", v50, v51);

  }
  else if (a6 == CFSTR("AKLayerPresentationManager.modelSelectionsObservationContext"))
  {
    v54 = v11;
    v56 = v10;
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    if (v36)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v38 = v36;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v65;
        do
        {
          for (n = 0; n != v40; ++n)
          {
            if (*(_QWORD *)v65 != v41)
              objc_enumerationMutation(v38);
            v43 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              -[AKLayerPresentationManager _removeAdornmentLayerForAnnotation:](self, "_removeAdornmentLayerForAnnotation:", v43);
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v64, v85, 16);
        }
        while (v40);
      }

    }
    if (v37)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v44 = v37;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v61;
        do
        {
          for (ii = 0; ii != v46; ++ii)
          {
            if (*(_QWORD *)v61 != v47)
              objc_enumerationMutation(v44);
            v49 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              -[AKLayerPresentationManager _addAdornmentLayerForAnnotation:](self, "_addAdornmentLayerForAnnotation:", v49);
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
        }
        while (v46);
      }

    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");

    v11 = v54;
    v10 = v56;
  }
  else if (a6 == CFSTR("AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"))
  {
    -[AKLayerPresentationManager _updateLoupeAnnotationsContributedToByAnnotation:](self, "_updateLoupeAnnotationsContributedToByAnnotation:", v11);
  }
  else
  {
    v59.receiver = self;
    v59.super_class = (Class)AKLayerPresentationManager;
    -[AKLayerPresentationManager observeValueForKeyPath:ofObject:change:context:](&v59, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_updateLoupeAnnotationsContributedToByAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  AKLayerPresentationManager *v16;
  _UNKNOWN **v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[AKLayerPresentationManager pageModelController](self, "pageModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = &off_24F1A6000;
    do
    {
      v11 = 0;
      v22 = v8;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[AKLayerPresentationManager pageController](self, "pageController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "annotationsBeneathLoupe:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "containsObject:", v4))
          {
            -[AKLayerPresentationManager annotationsToAnnotationLayers](self, "annotationsToAnnotationLayers");
            v15 = v9;
            v16 = self;
            v17 = v10;
            v18 = v6;
            v19 = v4;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", v12);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v19;
            v6 = v18;
            v10 = v17;
            self = v16;
            v9 = v15;
            v8 = v22;
            objc_msgSend(v21, "updateContents");

          }
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

}

- (void)_updateLoupeAnnotationsIntersectingRemovedAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[AKLayerPresentationManager pageModelController](self, "pageModelController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "drawingBounds");
          v13 = v12;
          v15 = v14;
          v17 = v16;
          v19 = v18;
          objc_msgSend(v4, "drawingBounds");
          v33.origin.x = v20;
          v33.origin.y = v21;
          v33.size.width = v22;
          v33.size.height = v23;
          v32.origin.x = v13;
          v32.origin.y = v15;
          v32.size.width = v17;
          v32.size.height = v19;
          if (CGRectIntersectsRect(v32, v33))
          {
            -[AKLayerPresentationManager annotationsToAnnotationLayers](self, "annotationsToAnnotationLayers");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKey:", v11);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v25, "updateContents");
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

}

- (void)forceUpdateAnnotationLayer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AKLayerPresentationManager annotationsToAnnotationLayers](self, "annotationsToAnnotationLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "updateContents");
}

- (void)_setNeedsDisplayOnNewLayer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKLayerPresentationManager _applyUpdatesWithScale:toLayers:isLiveUpdate:forceUpdate:](self, "_applyUpdatesWithScale:toLayers:isLiveUpdate:forceUpdate:", v6, 0, 1, 9.22337204e18, v7, v8);
}

- (void)_applyUpdatesWithScale:(double)a3 toLayers:(id)a4 isLiveUpdate:(BOOL)a5 forceUpdate:(BOOL)a6
{
  id v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  double v28;
  double v29;
  id v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  if (a3 == 9.22337204e18)
  {
    -[AKLayerPresentationManager currentScaleFactor](self, "currentScaleFactor");
    if (v10 == 9.22337204e18)
      a3 = 1.0;
    else
      a3 = v10;
  }
  -[AKLayerPresentationManager _hiDPIScaleFactor](self, "_hiDPIScaleFactor");
  v12 = a3 * v11;
  v13 = -[AKLayerPresentationManager shouldPixelate](self, "shouldPixelate");
  v14 = 1.0;
  if (a3 < 2.0)
    v14 = v12;
  v15 = (void *)*MEMORY[0x24BDE5B58];
  v16 = (void *)*MEMORY[0x24BDE5BB0];
  if (a3 < 2.0)
    v16 = (void *)*MEMORY[0x24BDE5B58];
  if (v13)
    v17 = v14;
  else
    v17 = v12;
  if (v13)
    v15 = v16;
  v18 = v15;
  -[AKLayerPresentationManager setCurrentScaleFactor:](self, "setCurrentScaleFactor:", a3);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = v9;
    v19 = v9;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (!v20)
      goto LABEL_34;
    v21 = v20;
    v22 = *(_QWORD *)v34;
    while (1)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || a5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v24, "updateSublayersWithScale:", a3);
          goto LABEL_31;
        }
        objc_msgSend(v24, "annotation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v27 = v24;
          v28 = v12;
          goto LABEL_30;
        }
        if (!a6)
        {
          objc_msgSend(v24, "contentsScale");
          if (vabdd_f64(v29, v17) <= 0.00001)
          {
            objc_msgSend(v24, "minificationFilter");
            v30 = (id)objc_claimAutoreleasedReturnValue();

            if (v30 == v18)
              continue;
          }
        }
        objc_msgSend(v24, "setMinificationFilter:", v18, v31);
        objc_msgSend(v24, "setMagnificationFilter:", v18);
        v27 = v24;
        v28 = v17;
LABEL_30:
        objc_msgSend(v27, "setContentsScale:", v28, v31);
LABEL_31:
        objc_msgSend(v24, "updatePixelAlignment", v31);
        continue;
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (!v21)
      {
LABEL_34:

        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
        v9 = v31;
        break;
      }
    }
  }

}

- (double)_hiDPIScaleFactor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  -[AKLayerPresentationManager pageController](self, "pageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = v8;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v9 = v10;
  }

  return v9;
}

- (void)_startObservingModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id obj;
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
  _QWORD v42[4];
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!-[AKLayerPresentationManager isObservingModel](self, "isObservingModel"))
  {
    -[AKLayerPresentationManager pageController](self, "pageController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pageModelController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKLayerPresentationManager setPageModelController:](self, "setPageModelController:");
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v4 = (void *)MEMORY[0x24BDE57D8];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = sub_22907BACC;
    v42[3] = &unk_24F1A7328;
    v27 = v3;
    v43 = v27;
    objc_msgSend(v4, "setCompletionBlock:", v42);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[AKLayerPresentationManager pageModelController](self, "pageModelController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "annotations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          -[AKLayerPresentationManager _addLayerForAnnotation:](self, "_addLayerForAnnotation:", v11);
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v11, "keysForValuesToObserveForRedrawing");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v35 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v11, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), 0, CFSTR("AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"));
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
            }
            while (v14);
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[AKLayerPresentationManager _addAdornmentLayerForAnnotation:](self, "_addAdornmentLayerForAnnotation:", v11);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v8);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[AKLayerPresentationManager pageModelController](self, "pageModelController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedAnnotations");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          -[AKLayerPresentationManager _addAdornmentLayerForAnnotation:](self, "_addAdornmentLayerForAnnotation:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
      }
      while (v20);
    }

    -[AKLayerPresentationManager pageModelController](self, "pageModelController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "cropAnnotation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[AKLayerPresentationManager pageModelController](self, "pageModelController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "cropAnnotation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKLayerPresentationManager _addAdornmentLayerForAnnotation:](self, "_addAdornmentLayerForAnnotation:", v26);

    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    objc_msgSend(v28, "addObserver:forKeyPath:options:context:", self, CFSTR("annotations"), 3, CFSTR("AKLayerPresentationManager.modelAnnotationsObservationContext"));
    objc_msgSend(v28, "addObserver:forKeyPath:options:context:", self, CFSTR("selectedAnnotations"), 3, CFSTR("AKLayerPresentationManager.modelSelectionsObservationContext"));
    -[AKLayerPresentationManager setIsObservingModel:](self, "setIsObservingModel:", 1);

  }
}

- (void)_stopObservingModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
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
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (-[AKLayerPresentationManager isObservingModel](self, "isObservingModel"))
  {
    -[AKLayerPresentationManager pageModelController](self, "pageModelController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("selectedAnnotations"), CFSTR("AKLayerPresentationManager.modelSelectionsObservationContext"));

    -[AKLayerPresentationManager pageModelController](self, "pageModelController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("annotations"), CFSTR("AKLayerPresentationManager.modelAnnotationsObservationContext"));

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[AKLayerPresentationManager pageModelController](self, "pageModelController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cropAnnotation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AKLayerPresentationManager pageModelController](self, "pageModelController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cropAnnotation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKLayerPresentationManager _removeAdornmentLayerForAnnotation:](self, "_removeAdornmentLayerForAnnotation:", v8);

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[AKLayerPresentationManager pageModelController](self, "pageModelController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedAnnotations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          -[AKLayerPresentationManager _removeAdornmentLayerForAnnotation:](self, "_removeAdornmentLayerForAnnotation:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v12);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[AKLayerPresentationManager pageModelController](self, "pageModelController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "annotations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v16;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v20);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v21, "keysForValuesToObserveForRedrawing");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v29;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v29 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(v21, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v26++), CFSTR("AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"));
              }
              while (v24 != v26);
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            }
            while (v24);
          }

          -[AKLayerPresentationManager _removeLayerForAnnotation:](self, "_removeLayerForAnnotation:", v21);
          ++v20;
        }
        while (v20 != v18);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[AKLayerPresentationManager setPageModelController:](self, "setPageModelController:", 0);
    -[AKLayerPresentationManager setIsObservingModel:](self, "setIsObservingModel:", 0);
  }
}

- (void)_addLayerForAnnotation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[AKLayerPresentationManager pageController](self, "pageController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[AKAnnotationLayer newAnnotationLayerForAnnotation:withPageController:](AKAnnotationLayer, "newAnnotationLayerForAnnotation:withPageController:", v4, v5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AKLayerPresentationManager setCropAnnotationLayer:](self, "setCropAnnotationLayer:", v6);
    -[AKLayerPresentationManager rootLayer](self, "rootLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v6);

    objc_msgSend(v6, "updatePixelAlignment");
    -[AKLayerPresentationManager annotationsToAnnotationLayers](self, "annotationsToAnnotationLayers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v6, v4);

    -[AKLayerPresentationManager _setNeedsDisplayOnNewLayer:](self, "_setNeedsDisplayOnNewLayer:", v6);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v5, "pageModelController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "annotations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v22 = v6;
      v23 = v5;
      v13 = 0;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v10);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[AKLayerPresentationManager annotationsToAnnotationLayers](self, "annotationsToAnnotationLayers", v22, v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "setZPosition:", (double)(v13 + i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v13 += i;
      }
      while (v12);
      v19 = (double)v13;
      v6 = v22;
      v5 = v23;
    }
    else
    {
      v19 = 0.0;
    }

    -[AKLayerPresentationManager cropAnnotationLayer](self, "cropAnnotationLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[AKLayerPresentationManager cropAnnotationLayer](self, "cropAnnotationLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setZPosition:", v19);

    }
  }

}

- (void)_removeLayerForAnnotation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AKLayerPresentationManager annotationsToAnnotationLayers](self, "annotationsToAnnotationLayers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "removeFromSuperlayer");
    -[AKLayerPresentationManager annotationsToAnnotationLayers](self, "annotationsToAnnotationLayers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v8);

    -[AKLayerPresentationManager cropAnnotationLayer](self, "cropAnnotationLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
      -[AKLayerPresentationManager setCropAnnotationLayer:](self, "setCropAnnotationLayer:", 0);
  }

}

- (void)_addAdornmentLayerForAnnotation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AKLayerPresentationManager pageController](self, "pageController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[AKAdornmentLayer newAdornmentLayerForAnnotation:withPageController:](AKAdornmentLayer, "newAdornmentLayerForAnnotation:withPageController:", v4, v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AKLayerPresentationManager setCropAdornmentLayer:](self, "setCropAdornmentLayer:", v6);
  -[AKLayerPresentationManager rootLayer](self, "rootLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", v6);

  objc_msgSend(v6, "updatePixelAlignment");
  -[AKLayerPresentationManager annotationsToAdornmentLayers](self, "annotationsToAdornmentLayers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v4);

  -[AKLayerPresentationManager _setNeedsDisplayOnNewLayer:](self, "_setNeedsDisplayOnNewLayer:", v6);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v5, "pageModelController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "annotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v22 = v5;
    v23 = v4;
    v13 = 0;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v10);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[AKLayerPresentationManager annotationsToAdornmentLayers](self, "annotationsToAdornmentLayers", v22, v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "setZPosition:", (double)(unint64_t)(v13 + i + AKAdornmentZPositionOffset));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v13 += i;
    }
    while (v12);
    v5 = v22;
    v4 = v23;
  }
  else
  {
    v13 = 0;
  }

  -[AKLayerPresentationManager cropAdornmentLayer](self, "cropAdornmentLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (double)(unint64_t)(AKAdornmentZPositionOffset + v13);
    -[AKLayerPresentationManager cropAdornmentLayer](self, "cropAdornmentLayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setZPosition:", v20);

  }
}

- (void)_removeAdornmentLayerForAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AKLayerPresentationManager annotationsToAdornmentLayers](self, "annotationsToAdornmentLayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeFromSuperlayer");
  -[AKLayerPresentationManager annotationsToAdornmentLayers](self, "annotationsToAdornmentLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

  objc_msgSend(v9, "teardown");
  -[AKLayerPresentationManager cropAdornmentLayer](self, "cropAdornmentLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9 == v7)
  {
    -[AKLayerPresentationManager setCropAdornmentLayer:](self, "setCropAdornmentLayer:", 0);
    v8 = v9;
  }

}

- (AKPageController)pageController
{
  return (AKPageController *)objc_loadWeakRetained((id *)&self->_pageController);
}

- (void)setPageController:(id)a3
{
  objc_storeWeak((id *)&self->_pageController, a3);
}

- (CALayer)rootLayer
{
  return (CALayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRootLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)shouldPixelate
{
  return self->_shouldPixelate;
}

- (BOOL)adornmentsHidden
{
  return self->_adornmentsHidden;
}

- (double)alignmentGuidePositionX
{
  return self->_alignmentGuidePositionX;
}

- (double)alignmentGuidePositionY
{
  return self->_alignmentGuidePositionY;
}

- (NSMapTable)annotationsToAnnotationLayers
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAnnotationsToAnnotationLayers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMapTable)annotationsToAdornmentLayers
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAnnotationsToAdornmentLayers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CALayer)cropAnnotationLayer
{
  return (CALayer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCropAnnotationLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CALayer)cropAdornmentLayer
{
  return (CALayer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCropAdornmentLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CAShapeLayer)alignmentGuideXLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlignmentGuideXLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CAShapeLayer)alignmentGuideYLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAlignmentGuideYLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (AKPageModelController)pageModelController
{
  return (AKPageModelController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPageModelController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (BOOL)isObservingModel
{
  return self->_isObservingModel;
}

- (void)setIsObservingModel:(BOOL)a3
{
  self->_isObservingModel = a3;
}

- (double)currentScaleFactor
{
  return self->_currentScaleFactor;
}

- (void)setCurrentScaleFactor:(double)a3
{
  self->_currentScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageModelController, 0);
  objc_storeStrong((id *)&self->_alignmentGuideYLayer, 0);
  objc_storeStrong((id *)&self->_alignmentGuideXLayer, 0);
  objc_storeStrong((id *)&self->_cropAdornmentLayer, 0);
  objc_storeStrong((id *)&self->_cropAnnotationLayer, 0);
  objc_storeStrong((id *)&self->_annotationsToAdornmentLayers, 0);
  objc_storeStrong((id *)&self->_annotationsToAnnotationLayers, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_destroyWeak((id *)&self->_pageController);
}

@end
