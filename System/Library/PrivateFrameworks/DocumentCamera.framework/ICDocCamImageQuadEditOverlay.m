@implementation ICDocCamImageQuadEditOverlay

- (ICDocCamImageQuadEditOverlay)initWithCoder:(id)a3
{
  ICDocCamImageQuadEditOverlay *v3;
  ICDocCamImageQuadEditOverlay *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamImageQuadEditOverlay;
  v3 = -[ICDocCamImageQuadEditOverlay initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICDocCamImageQuadEditOverlay commonInit](v3, "commonInit");
  return v4;
}

- (ICDocCamImageQuadEditOverlay)initWithFrame:(CGRect)a3
{
  ICDocCamImageQuadEditOverlay *v3;
  ICDocCamImageQuadEditOverlay *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDocCamImageQuadEditOverlay;
  v3 = -[ICDocCamImageQuadEditOverlay initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICDocCamImageQuadEditOverlay commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  UIColor *v3;
  UIColor *validRectColor;
  UIColor *v5;
  UIColor *invalidRectColor;
  UIColor *v7;
  UIColor *knobColor;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  validRectColor = self->_validRectColor;
  self->_validRectColor = v3;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  invalidRectColor = self->_invalidRectColor;
  self->_invalidRectColor = v5;

  self->_knobHeight = 20.0;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  knobColor = self->_knobColor;
  self->_knobColor = v7;

  -[ICDocCamImageQuadEditOverlay setUpKnobs](self, "setUpKnobs");
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
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ICDocCamImageQuadEditOverlay;
  -[ICDocCamImageQuadEditOverlay layoutSubviews](&v16, sel_layoutSubviews);
  -[ICDocCamImageQuadEditOverlay layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ICDocCamImageQuadEditOverlay knobLayer](self, "knobLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[ICDocCamImageQuadEditOverlay delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quadForOverlay:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICDocCamImageQuadEditOverlay updateKnobLocationsToRect:](self, "updateKnobLocationsToRect:", v14);
  -[ICDocCamImageQuadEditOverlay updateOutlineLayer](self, "updateOutlineLayer");
  -[ICDocCamImageQuadEditOverlay updateOutlineAndKnobColorForCurrentValidityIfNecessary](self, "updateOutlineAndKnobColorForCurrentValidityIfNecessary");
  -[ICDocCamImageQuadEditOverlay delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "overlayDidLayout:", self);

}

- (void)setUpKnobs
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  double v9;
  id v10;
  void *v11;
  ICDocCamImageQuadEditKnobAccessibilityElement *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ICDocCamImageQuadEditPanGestureRecognizer *v21;
  void *v22;
  id v23;

  v3 = objc_alloc_init(MEMORY[0x24BDE56D0]);
  -[ICDocCamImageQuadEditOverlay setKnobLayer:](self, "setKnobLayer:", v3);

  -[ICDocCamImageQuadEditOverlay layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditOverlay knobLayer](self, "knobLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSublayer:", v5);

  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 4;
  do
  {
    v8 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 20.0, 20.0);
    objc_msgSend(v8, "frame");
    objc_msgSend(v8, "setCornerRadius:", v9 * 0.5);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(v8, "setBorderWidth:", 1.0);
    objc_msgSend(v8, "setMasksToBounds:", 1);
    objc_msgSend(v23, "addObject:", v8);
    -[ICDocCamImageQuadEditOverlay knobLayer](self, "knobLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v8);

    v12 = -[ICDocCamImageQuadEditKnobAccessibilityElement initWithKnobLayer:overlayView:]([ICDocCamImageQuadEditKnobAccessibilityElement alloc], "initWithKnobLayer:overlayView:", v8, self);
    objc_msgSend(v6, "addObject:", v12);

    --v7;
  }
  while (v7);
  -[ICDocCamImageQuadEditOverlay setKnobs:](self, "setKnobs:", v23);
  -[ICDocCamImageQuadEditOverlay setKnobAccessibilityElements:](self, "setKnobAccessibilityElements:", v6);
  v13 = objc_alloc_init(MEMORY[0x24BDE5758]);
  -[ICDocCamImageQuadEditOverlay setOutlineLayer:](self, "setOutlineLayer:", v13);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v14, "CGColor");
  -[ICDocCamImageQuadEditOverlay outlineLayer](self, "outlineLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStrokeColor:", v15);

  -[ICDocCamImageQuadEditOverlay outlineLayer](self, "outlineLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFillColor:", 0);

  -[ICDocCamImageQuadEditOverlay outlineLayer](self, "outlineLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineWidth:", 1.0);

  -[ICDocCamImageQuadEditOverlay layer](self, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditOverlay outlineLayer](self, "outlineLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSublayer:", v20);

  v21 = -[ICDocCamImageQuadEditPanGestureRecognizer initWithTarget:action:]([ICDocCamImageQuadEditPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_didPan_);
  -[ICDocCamImageQuadEditPanGestureRecognizer setDelaysTouchesBegan:](v21, "setDelaysTouchesBegan:", 0);
  -[ICDocCamImageQuadEditPanGestureRecognizer setMaximumNumberOfTouches:](v21, "setMaximumNumberOfTouches:", 1);
  -[ICDocCamImageQuadEditOverlay addGestureRecognizer:](self, "addGestureRecognizer:", v21);
  -[ICDocCamImageQuadEditOverlay setPanGR:](self, "setPanGR:", v21);
  -[ICDocCamImageQuadEditOverlay panGR](self, "panGR");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setQuadEditorDelegate:", self);

  -[ICDocCamImageQuadEditOverlay updateOutlineAndKnobColorForIsValid:](self, "updateOutlineAndKnobColorForIsValid:", -[ICDocCamImageQuadEditOverlay isDisplayingValidQuad](self, "isDisplayingValidQuad"));
}

- (void)setTempOverlayQuadIsValid:(BOOL)a3
{
  self->_tempOverlayQuadIsValid = a3;
  -[ICDocCamImageQuadEditOverlay updateOutlineAndKnobColorForCurrentValidityIfNecessary](self, "updateOutlineAndKnobColorForCurrentValidityIfNecessary");
}

- (void)updateOutlineAndKnobColorForCurrentValidityIfNecessary
{
  _BOOL4 v3;
  _BOOL8 v4;

  v3 = -[ICDocCamImageQuadEditOverlay isDisplayingValidQuad](self, "isDisplayingValidQuad");
  if (-[ICDocCamImageQuadEditOverlay isTempOverlay](self, "isTempOverlay"))
    v4 = -[ICDocCamImageQuadEditOverlay tempOverlayQuadIsValid](self, "tempOverlayQuadIsValid");
  else
    v4 = -[ICDocCamImageQuadEditOverlay isQuadValid](self, "isQuadValid");
  if (v3 != v4)
    -[ICDocCamImageQuadEditOverlay updateOutlineAndKnobColorForIsValid:](self, "updateOutlineAndKnobColorForIsValid:", v4);
}

- (void)updateOutlineAndKnobColorForIsValid:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ICDocCamImageQuadEditOverlay setIsDisplayingValidQuad:](self, "setIsDisplayingValidQuad:");
  if (a3)
    -[ICDocCamImageQuadEditOverlay validRectColor](self, "validRectColor");
  else
    -[ICDocCamImageQuadEditOverlay invalidRectColor](self, "invalidRectColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setBorderColor:", objc_msgSend(objc_retainAutorelease(v5), "CGColor"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v11 = objc_retainAutorelease(v5);
  v12 = objc_msgSend(v11, "CGColor");
  -[ICDocCamImageQuadEditOverlay outlineLayer](self, "outlineLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStrokeColor:", v12);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)setTempOverlayMagnification:(double)a3 animationDuration:(double)a4
{
  ICDocCamImageQuadEditOverlay *v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  ICDocCamImageQuadEditOverlay *v30;
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;
  CATransform3D v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v6 = self;
  v40 = *MEMORY[0x24BDAC8D0];
  self->_tempOverlayMagnification = a3;
  if (!-[ICDocCamImageQuadEditOverlay isTempOverlay](self, "isTempOverlay"))
  {
    v7 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICDocCamImageQuadEditOverlay setTempOverlayMagnification:animationDuration:].cold.1(v7);

  }
  if (-[ICDocCamImageQuadEditOverlay isTempOverlay](v6, "isTempOverlay"))
  {
    v8 = 0x24BDE5000uLL;
    if (a4 <= 0.0)
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[ICDocCamImageQuadEditOverlay knobs](v6, "knobs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v10)
    {
      v11 = v10;
      v30 = v6;
      v12 = *(_QWORD *)v36;
      v13 = *MEMORY[0x24BDE5970];
      v14 = 1.0 / a3;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          memset(&v34, 0, sizeof(v34));
          if (v16)
            objc_msgSend(v16, "transform");
          memset(&v33, 0, sizeof(v33));
          CATransform3DMakeScale(&v33, v14, v14, 1.0);
          v32 = v33;
          objc_msgSend(v16, "setTransform:", &v32);
          if (a4 > 0.0)
          {
            objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setDuration:", a4);
            v31 = v34;
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v31);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setFromValue:", v18);

            v31 = v33;
            objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v31);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setToValue:", v19);

            objc_msgSend(v17, "setFillMode:", v13);
            objc_msgSend(v16, "addAnimation:forKey:", v17, 0);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v11);
      v6 = v30;
      v8 = 0x24BDE5000;
    }
    else
    {
      v14 = 1.0 / a3;
    }

    -[ICDocCamImageQuadEditOverlay outlineLayer](v6, "outlineLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lineWidth");
    v22 = v21;

    if (a4 <= 0.0)
    {
      -[ICDocCamImageQuadEditOverlay outlineLayer](v6, "outlineLayer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLineWidth:", v14);

      objc_msgSend(*(id *)(v8 + 2008), "commit");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("lineWidth"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDuration:", a4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setToValue:", v24);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFromValue:", v25);

      -[ICDocCamImageQuadEditOverlay outlineLayer](v6, "outlineLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeAllAnimations");

      -[ICDocCamImageQuadEditOverlay outlineLayer](v6, "outlineLayer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addAnimation:forKey:", v23, 0);

      -[ICDocCamImageQuadEditOverlay outlineLayer](v6, "outlineLayer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setLineWidth:", v14);

    }
  }
}

- (void)setImage:(id)a3 orientation:(int64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (*(_OWORD *)&self->_image != __PAIR128__(a4, (unint64_t)v7))
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_image, a3);
    self->_orientation = a4;
    -[ICDocCamImageQuadEditOverlay setupLoupeLayerIfNeeded](self, "setupLoupeLayerIfNeeded");
    v7 = v8;
  }

}

- (void)setupLoupeLayerIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  void *v25;
  id v26;

  -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[ICDocCamImageQuadEditOverlay image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    v5 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    -[ICDocCamImageQuadEditOverlay setLoupeLayer:](self, "setLoupeLayer:", v5);

    -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFrame:", 0.0, 0.0, 20.0, 20.0);

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "CGColor");
    -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    v10 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    -[ICDocCamImageQuadEditOverlay setLoupeContentsLayer:](self, "setLoupeContentsLayer:", v10);

    -[ICDocCamImageQuadEditOverlay image](self, "image");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "CGImage");
    -[ICDocCamImageQuadEditOverlay loupeContentsLayer](self, "loupeContentsLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContents:", v12);

    -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[ICDocCamImageQuadEditOverlay loupeContentsLayer](self, "loupeContentsLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

    -[ICDocCamImageQuadEditOverlay loupeContentsLayer](self, "loupeContentsLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMasksToBounds:", 1);

    -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditOverlay loupeContentsLayer](self, "loupeContentsLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSublayer:", v25);

    v3 = v26;
  }

}

- (BOOL)containsPointOutsideOfOverlayBounds
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "position");
        v9 = v8;
        v11 = v10;
        -[ICDocCamImageQuadEditOverlay bounds](self, "bounds");
        if (!DCTSDPointInRectInclusive(v9, v11, v12, v13, v14, v15))
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

- (BOOL)isQuadValid
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[ICDocCamImageQuadEditOverlay delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageFrameInOverlayCoordinates");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "position");
        v14 += DCTSDPointInRectInclusive(v17, v18, v5, v7, v9, v11);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
    LODWORD(v13) = v14 == 4;
  }

  -[ICDocCamImageQuadEditOverlay adjustedQuad](self, "adjustedQuad");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if ((_DWORD)v13 && objc_msgSend(v19, "isConvex"))
    v21 = objc_msgSend(v20, "containsAngleOutOfValidThreshold") ^ 1;
  else
    LOBYTE(v21) = 0;

  return v21;
}

- (BOOL)isDraggingKnob
{
  void *v2;
  uint64_t v3;

  -[ICDocCamImageQuadEditOverlay panGR](self, "panGR");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return ((v3 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (ICDocCamImageQuad)adjustedQuad
{
  ICDocCamImageQuad *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(ICDocCamImageQuad);
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "position");
  -[ICDocCamImageQuad setTopLeft:](v3, "setTopLeft:");

  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "position");
  -[ICDocCamImageQuad setTopRight:](v3, "setTopRight:");

  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "position");
  -[ICDocCamImageQuad setBottomRight:](v3, "setBottomRight:");

  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "position");
  -[ICDocCamImageQuad setBottomLeft:](v3, "setBottomLeft:");

  return v3;
}

- (void)updateKnobLocationsToRect:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  v4 = a3;
  objc_msgSend(v4, "topLeft");
  v6 = v5;
  v8 = v7;
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPosition:", v6, v8);

  objc_msgSend(v4, "topRight");
  v12 = v11;
  v14 = v13;
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPosition:", v12, v14);

  objc_msgSend(v4, "bottomRight");
  v18 = v17;
  v20 = v19;
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPosition:", v18, v20);

  objc_msgSend(v4, "bottomLeft");
  v24 = v23;
  v26 = v25;

  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPosition:", v24, v26);

}

- (void)didPan:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
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
  void *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  double v35;
  double v36;
  BOOL v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "locationInView:", self);
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v4, "state");
  if (v9 == 1)
  {
    -[ICDocCamImageQuadEditOverlay closestKnobToPoint:](self, "closestKnobToPoint:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditOverlay setSelectedKnob:](self, "setSelectedKnob:", v10);

    -[ICDocCamImageQuadEditOverlay updateSelectedKnobContents](self, "updateSelectedKnobContents");
    v11 = *MEMORY[0x24BDBEFB0];
    v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    objc_msgSend(v4, "setTranslation:inView:", self, *MEMORY[0x24BDBEFB0], v12);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditOverlay setPanHistory:](self, "setPanHistory:", v13);

    -[ICDocCamImageQuadEditOverlay setPanHistoryIdx:](self, "setPanHistoryIdx:", 0);
  }
  else
  {
    v11 = *MEMORY[0x24BDBEFB0];
    v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  v14 = v12;
  v15 = v11;
  -[ICDocCamImageQuadEditOverlay lastGestureTranslation](self, "lastGestureTranslation");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v4, "translationInView:", self);
  v21 = v20;
  v23 = v22;
  objc_msgSend(v4, "setTranslation:inView:", self, v11, v12);
  -[ICDocCamImageQuadEditOverlay setLastGestureTranslation:](self, "setLastGestureTranslation:", v21, v23);
  if (v9 == 3)
  {
    v62 = v19;
    v26 = CACurrentMediaTime();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    -[ICDocCamImageQuadEditOverlay panHistory](self, "panHistory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    v29 = v12;
    v30 = v11;
    if (v28)
    {
      v31 = v28;
      v32 = *(_QWORD *)v67;
      v29 = v12;
      v30 = v11;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v67 != v32)
            objc_enumerationMutation(v27);
          v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          v63 = 0.0;
          v64 = 0.0;
          v65 = 0.0;
          objc_msgSend(v34, "getValue:", &v63, *(_QWORD *)&v62);
          if (v26 - v63 <= 0.1)
          {
            v30 = DCTSDSubtractPoints(v30, v29, v64);
            v29 = v35;
          }
        }
        v31 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v31);
      v11 = v30;
      v12 = v29;
    }

    v36 = DCTSDPointLength(v11, v12);
    if (v36 <= 20.0)
      v23 = v29;
    else
      v23 = v14;
    if (v36 <= 20.0)
      v21 = v30;
    else
      v21 = v15;
    v19 = v62;
  }
  else
  {
    v64 = v21;
    v65 = v23;
    v63 = CACurrentMediaTime();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v63, "{?=d{CGPoint=dd}}");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditOverlay panHistory](self, "panHistory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, -[ICDocCamImageQuadEditOverlay panHistoryIdx](self, "panHistoryIdx"));

    -[ICDocCamImageQuadEditOverlay setPanHistoryIdx:](self, "setPanHistoryIdx:", (-[ICDocCamImageQuadEditOverlay panHistoryIdx](self, "panHistoryIdx") + 1) % 0xA);
  }
  v37 = v15 == v17;
  if (v14 != v19)
    v37 = 0;
  if (v9 != 2)
    v37 = 1;
  if (v9 == 3 || !v37)
  {
    -[ICDocCamImageQuadEditOverlay selectedKnob](self, "selectedKnob", *(_QWORD *)&v62);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "position");
    v40 = v39;
    v42 = v41;

    -[ICDocCamImageQuadEditOverlay selectedKnob](self, "selectedKnob");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "position");
    v45 = DCTSDAddPoints(v21, v23, v44);
    v47 = v46;

    -[ICDocCamImageQuadEditOverlay knobLayer](self, "knobLayer");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "bounds");
    v53 = DCTSDClampPointInRect(v45, v47, v49, v50, v51, v52);
    v55 = v54;

    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[ICDocCamImageQuadEditOverlay selectedKnob](self, "selectedKnob");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setPosition:", v53, v55);

    -[ICDocCamImageQuadEditOverlay adjustedQuad](self, "adjustedQuad");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDocCamImageQuadEditOverlay delegate](self, "delegate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "imageFrameInOverlayCoordinates");
    objc_msgSend(v57, "setBoundingBox:");

    if ((objc_msgSend(v57, "isValid") & 1) == 0)
    {
      -[ICDocCamImageQuadEditOverlay selectedKnob](self, "selectedKnob");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setPosition:", v40, v42);

    }
    -[ICDocCamImageQuadEditOverlay updateOutlineLayer](self, "updateOutlineLayer");
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[ICDocCamImageQuadEditOverlay updateSelectedKnobContents](self, "updateSelectedKnobContents");

    if (v9 == 3)
    {
      -[ICDocCamImageQuadEditOverlay setSelectedKnob:](self, "setSelectedKnob:", 0);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    }
  }
  -[ICDocCamImageQuadEditOverlay delegate](self, "delegate", *(_QWORD *)&v62);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDocCamImageQuadEditOverlay selectedKnob](self, "selectedKnob");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "frame");
  objc_msgSend(v60, "selectedKnobDidPanToRect:");

  -[ICDocCamImageQuadEditOverlay updateOutlineAndKnobColorForCurrentValidityIfNecessary](self, "updateOutlineAndKnobColorForCurrentValidityIfNecessary");
}

- (id)closestKnobToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x24BDAC8D0];
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = INFINITY;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "position");
        v17 = DCTSDDistance(v15, v16, x, y);
        if (v17 < v12)
        {
          v18 = v17;
          v19 = v14;

          v7 = v19;
          v12 = v18;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)unselectAllKnobs
{
  -[ICDocCamImageQuadEditOverlay setSelectedKnob:](self, "setSelectedKnob:", 0);
}

- (void)setSelectedKnob:(id)a3
{
  CALayer *v5;
  CALayer **p_selectedKnob;
  void *v7;
  CALayer *v8;
  CALayer *v9;
  CALayer *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  double v17;
  CALayer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CALayer *v33;
  double v34;
  void *v35;
  CATransform3D v36;
  CATransform3D v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _OWORD v43[8];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = (CALayer *)a3;
  p_selectedKnob = &self->_selectedKnob;
  if (self->_selectedKnob != v5)
  {
    objc_storeStrong((id *)&self->_selectedKnob, a3);
    if (*p_selectedKnob)
    {
      -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superlayer");
      v8 = (CALayer *)objc_claimAutoreleasedReturnValue();
      v9 = *p_selectedKnob;

      if (v8 != v9)
      {
        objc_msgSend(MEMORY[0x24BDE57D8], "begin");
        objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
        v10 = *p_selectedKnob;
        v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
        v43[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
        v43[5] = v11;
        v12 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
        v43[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
        v43[7] = v12;
        v13 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
        v43[0] = *MEMORY[0x24BDE5598];
        v43[1] = v13;
        v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
        v43[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
        v43[3] = v14;
        -[CALayer setSublayerTransform:](v10, "setSublayerTransform:", v43);
        -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setHidden:", 0);

        -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = 0;
        objc_msgSend(v16, "setOpacity:", v17);

        v18 = *p_selectedKnob;
        -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CALayer addSublayer:](v18, "addSublayer:", v19);

        objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      }
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.15);
    v20 = (void *)MEMORY[0x24BDE57D8];
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAnimationTimingFunction:", v21);

    -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = 1.0;
    objc_msgSend(v22, "setOpacity:", v23);

    if (!*p_selectedKnob)
    {
      -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "superlayer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = 0;
        objc_msgSend(v26, "setOpacity:", v27);

        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __48__ICDocCamImageQuadEditOverlay_setSelectedKnob___block_invoke;
        v42[3] = &unk_24C5B7AE0;
        v42[4] = self;
        objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v42);
      }
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v39;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v39 != v31)
            objc_enumerationMutation(v28);
          v33 = *(CALayer **)(*((_QWORD *)&v38 + 1) + 8 * v32);
          if (v33 == v5)
            v34 = 4.0;
          else
            v34 = 1.0;
          CATransform3DMakeScale(&v37, v34, v34, 1.0);
          v36 = v37;
          -[CALayer setTransform:](v33, "setTransform:", &v36);
          -[CALayer setBorderWidth:](v33, "setBorderWidth:", 1.0 / v34);
          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v30);
    }

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[ICDocCamImageQuadEditOverlay delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "selectedKnobDidChange:", *p_selectedKnob);

  }
}

void __48__ICDocCamImageQuadEditOverlay_setSelectedKnob___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[63])
  {
    objc_msgSend(v2, "loupeLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      objc_msgSend(*(id *)(a1 + 32), "loupeLayer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 1);

      objc_msgSend(*(id *)(a1 + 32), "loupeLayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperlayer");

      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    }
  }
}

- (void)updateSelectedKnobContents
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxX;
  double MaxY;
  void *v21;
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
  uint64_t matched;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double MinX;
  double MinY;
  double v51;
  double v52;
  double v53;
  double v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[ICDocCamImageQuadEditOverlay setupLoupeLayerIfNeeded](self, "setupLoupeLayerIfNeeded");
  -[ICDocCamImageQuadEditOverlay loupeContentsLayer](self, "loupeContentsLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v51 = v4;
  v52 = v5;

  -[CALayer position](self->_selectedKnob, "position");
  v7 = v6 + -10.0;
  -[CALayer position](self->_selectedKnob, "position");
  v9 = v8 + -10.0;
  -[ICDocCamImageQuadEditOverlay delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unitImageRectForOverlayRect:", v7, v9, 20.0, 20.0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v58.origin.x = v12;
  v58.origin.y = v14;
  v58.size.width = v16;
  v58.size.height = v18;
  MinX = CGRectGetMinX(v58);
  v59.origin.x = v12;
  v59.origin.y = v14;
  v59.size.width = v16;
  v59.size.height = v18;
  MinY = CGRectGetMinY(v59);
  v60.origin.x = v12;
  v60.origin.y = v14;
  v60.size.width = v16;
  v60.size.height = v18;
  MaxX = CGRectGetMaxX(v60);
  v61.origin.x = v12;
  v61.origin.y = v14;
  v61.size.width = v16;
  v61.size.height = v18;
  MaxY = CGRectGetMaxY(v61);
  -[ICDocCamImageQuadEditOverlay loupeLayer](self, "loupeLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v23 = v22;
  v25 = v24;
  v53 = v27;
  v54 = v26;

  v28 = v12 - (MaxX + -1.0);
  v29 = v23 - v51 * ((MaxX + -1.0) / v16);
  if (MaxX <= 1.0)
  {
    v28 = v12;
    v29 = v23;
  }
  if (MinX < 0.0)
    v30 = v12 + 0.0 - MinX;
  else
    v30 = v28;
  if (MinX < 0.0)
    v31 = v51 * ((0.0 - MinX) / v16) + v23;
  else
    v31 = v29;
  v32 = v14 - (MaxY + -1.0);
  v33 = v25 - v52 * ((MaxY + -1.0) / v18);
  if (MaxY <= 1.0)
  {
    v32 = v14;
    v33 = v25;
  }
  v34 = v52 * ((0.0 - MinY) / v18) + v25;
  if (MinY < 0.0)
    v35 = v14 + 0.0 - MinY;
  else
    v35 = v32;
  if (MinY < 0.0)
    v36 = v34;
  else
    v36 = v33;
  matched = dc_clockwiseRotationsFromUpToMatchOrientation(-[ICDocCamImageQuadEditOverlay orientation](self, "orientation", *(_QWORD *)&MinX));
  memset(&v57, 0, sizeof(v57));
  CGAffineTransformMakeRotation(&v57, (double)(unint64_t)matched * 1.57079633);
  v56 = v57;
  -[ICDocCamImageQuadEditOverlay loupeContentsLayer](self, "loupeContentsLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v56;
  objc_msgSend(v38, "setAffineTransform:", &v55);

  -[ICDocCamImageQuadEditOverlay rectFromApplyingOrientation:toContentsRect:](self, "rectFromApplyingOrientation:toContentsRect:", -[ICDocCamImageQuadEditOverlay orientation](self, "orientation"), v30, v35, v16, v18);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;
  -[ICDocCamImageQuadEditOverlay loupeContentsLayer](self, "loupeContentsLayer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setContentsRect:", v40, v42, v44, v46);

  -[ICDocCamImageQuadEditOverlay loupeContentsLayer](self, "loupeContentsLayer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v31, v36, v54, v53);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (void)updateOutlineLayer
{
  uint64_t v3;
  void *v4;
  id v5;

  -[ICDocCamImageQuadEditOverlay outlinePath](self, "outlinePath");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v5, "CGPath");
  -[ICDocCamImageQuadEditOverlay outlineLayer](self, "outlineLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", v3);

}

- (UIBezierPath)outlinePath
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDF6870]);
  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "position");
  objc_msgSend(v3, "moveToPoint:");

  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "position");
  objc_msgSend(v3, "addLineToPoint:");

  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "position");
  objc_msgSend(v3, "addLineToPoint:");

  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "position");
  objc_msgSend(v3, "addLineToPoint:");

  -[ICDocCamImageQuadEditOverlay knobs](self, "knobs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "position");
  objc_msgSend(v3, "addLineToPoint:");

  return (UIBezierPath *)v3;
}

- (CGRect)rectFromApplyingOrientation:(int64_t)a3 toContentsRect:(CGRect)a4
{
  void *v5;
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
  CGRect result;

  +[ICDocCamImageQuad quadFromCGRect:](ICDocCamImageQuad, "quadFromCGRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyOrientation:boundingBox:", a3, 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (BOOL)isTempOverlay
{
  return self->_isTempOverlay;
}

- (void)setIsTempOverlay:(BOOL)a3
{
  self->_isTempOverlay = a3;
}

- (BOOL)tempOverlayQuadIsValid
{
  return self->_tempOverlayQuadIsValid;
}

- (ICDocCamImageQuadEditOverlayDelegate)delegate
{
  return (ICDocCamImageQuadEditOverlayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICDocCamImageQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
  objc_storeStrong((id *)&self->_quad, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (double)knobHeight
{
  return self->_knobHeight;
}

- (void)setKnobHeight:(double)a3
{
  self->_knobHeight = a3;
}

- (UIColor)knobColor
{
  return self->_knobColor;
}

- (void)setKnobColor:(id)a3
{
  objc_storeStrong((id *)&self->_knobColor, a3);
}

- (NSArray)knobs
{
  return self->_knobs;
}

- (void)setKnobs:(id)a3
{
  objc_storeStrong((id *)&self->_knobs, a3);
}

- (NSArray)knobAccessibilityElements
{
  return self->_knobAccessibilityElements;
}

- (void)setKnobAccessibilityElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (UIColor)validRectColor
{
  return self->_validRectColor;
}

- (UIColor)invalidRectColor
{
  return self->_invalidRectColor;
}

- (BOOL)isDisplayingValidQuad
{
  return self->_isDisplayingValidQuad;
}

- (void)setIsDisplayingValidQuad:(BOOL)a3
{
  self->_isDisplayingValidQuad = a3;
}

- (CALayer)selectedKnob
{
  return self->_selectedKnob;
}

- (ICDocCamImageQuadEditPanGestureRecognizer)panGR
{
  return self->_panGR;
}

- (void)setPanGR:(id)a3
{
  objc_storeStrong((id *)&self->_panGR, a3);
}

- (CALayer)knobLayer
{
  return self->_knobLayer;
}

- (void)setKnobLayer:(id)a3
{
  objc_storeStrong((id *)&self->_knobLayer, a3);
}

- (CAShapeLayer)outlineLayer
{
  return self->_outlineLayer;
}

- (void)setOutlineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outlineLayer, a3);
}

- (CALayer)loupeLayer
{
  return self->_loupeLayer;
}

- (void)setLoupeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_loupeLayer, a3);
}

- (CALayer)loupeContentsLayer
{
  return self->_loupeContentsLayer;
}

- (void)setLoupeContentsLayer:(id)a3
{
  objc_storeStrong((id *)&self->_loupeContentsLayer, a3);
}

- (double)tempOverlayMagnification
{
  return self->_tempOverlayMagnification;
}

- (void)setTempOverlayMagnification:(double)a3
{
  self->_tempOverlayMagnification = a3;
}

- (CGPoint)lastGestureTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastGestureTranslation.x;
  y = self->_lastGestureTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastGestureTranslation:(CGPoint)a3
{
  self->_lastGestureTranslation = a3;
}

- (NSMutableArray)panHistory
{
  return self->_panHistory;
}

- (void)setPanHistory:(id)a3
{
  objc_storeStrong((id *)&self->_panHistory, a3);
}

- (unint64_t)panHistoryIdx
{
  return self->_panHistoryIdx;
}

- (void)setPanHistoryIdx:(unint64_t)a3
{
  self->_panHistoryIdx = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panHistory, 0);
  objc_storeStrong((id *)&self->_loupeContentsLayer, 0);
  objc_storeStrong((id *)&self->_loupeLayer, 0);
  objc_storeStrong((id *)&self->_outlineLayer, 0);
  objc_storeStrong((id *)&self->_knobLayer, 0);
  objc_storeStrong((id *)&self->_panGR, 0);
  objc_storeStrong((id *)&self->_selectedKnob, 0);
  objc_storeStrong((id *)&self->_invalidRectColor, 0);
  objc_storeStrong((id *)&self->_validRectColor, 0);
  objc_storeStrong((id *)&self->_knobAccessibilityElements, 0);
  objc_storeStrong((id *)&self->_knobs, 0);
  objc_storeStrong((id *)&self->_knobColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTempOverlayMagnification:(os_log_t)log animationDuration:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20CE8E000, log, OS_LOG_TYPE_ERROR, "Trying to set temp overlay magnifiation on a not temp overlay", v1, 2u);
}

@end
