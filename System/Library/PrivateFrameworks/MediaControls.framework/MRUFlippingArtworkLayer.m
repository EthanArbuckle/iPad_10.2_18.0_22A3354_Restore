@implementation MRUFlippingArtworkLayer

- (MRUFlippingArtworkLayer)init
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  id v28;
  double v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  CATransform3D v43;
  CATransform3D v44;
  objc_super v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)MRUFlippingArtworkLayer;
  v2 = -[MRUFlippingArtworkLayer init](&v45, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CD28C8]);
    v4 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v3;

    objc_msgSend(*((id *)v2 + 9), "setMasksToBounds:", 1);
    objc_msgSend(v2, "addSublayer:", *((_QWORD *)v2 + 9));
    v5 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v6 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v5;

    v7 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(*((id *)v2 + 10), "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(*((id *)v2 + 10), "setAllowsGroupOpacity:", 1);
    objc_msgSend(*((id *)v2 + 10), "setAllowsEdgeAntialiasing:", 1);
    objc_msgSend(*((id *)v2 + 10), "setMasksToBounds:", 1);
    objc_msgSend(*((id *)v2 + 10), "setDoubleSided:", 0);
    objc_msgSend(*((id *)v2 + 9), "addSublayer:", *((_QWORD *)v2 + 10));
    v8 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v9 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v8;

    v10 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(*((id *)v2 + 12), "setMask:", v10);

    objc_msgSend(*((id *)v2 + 12), "mask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 1061997773;
    objc_msgSend(v11, "setOpacity:", v12);

    objc_msgSend(*((id *)v2 + 10), "addSublayer:", *((_QWORD *)v2 + 12));
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*((id *)v2 + 14), "setBackgroundColor:", objc_msgSend(v15, "CGColor"));

    LODWORD(v16) = 0;
    objc_msgSend(*((id *)v2 + 14), "setOpacity:", v16);
    v17 = *MEMORY[0x1E0CD2EA0];
    objc_msgSend(*((id *)v2 + 14), "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);
    objc_msgSend(*((id *)v2 + 10), "addSublayer:", *((_QWORD *)v2 + 14));
    v18 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v19 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v18;

    objc_msgSend(*((id *)v2 + 11), "setCornerCurve:", v7);
    objc_msgSend(*((id *)v2 + 11), "setAllowsGroupOpacity:", 1);
    objc_msgSend(*((id *)v2 + 11), "setAllowsEdgeAntialiasing:", 1);
    objc_msgSend(*((id *)v2 + 11), "setMasksToBounds:", 1);
    objc_msgSend(*((id *)v2 + 11), "setDoubleSided:", 0);
    objc_msgSend(*((id *)v2 + 11), "setZPosition:", -0.5);
    CATransform3DMakeRotation(&v44, 3.14159265, 0.0, 1.0, 0.0);
    v20 = (void *)*((_QWORD *)v2 + 11);
    v43 = v44;
    objc_msgSend(v20, "setTransform:", &v43);
    objc_msgSend(*((id *)v2 + 9), "addSublayer:", *((_QWORD *)v2 + 11));
    v21 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    v22 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v21;

    v23 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(*((id *)v2 + 13), "setMask:", v23);

    objc_msgSend(*((id *)v2 + 13), "mask");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 1061997773;
    objc_msgSend(v24, "setOpacity:", v25);

    objc_msgSend(*((id *)v2 + 11), "addSublayer:", *((_QWORD *)v2 + 13));
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v26;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(*((id *)v2 + 15), "setBackgroundColor:", objc_msgSend(v28, "CGColor"));

    LODWORD(v29) = 0;
    objc_msgSend(*((id *)v2 + 15), "setOpacity:", v29);
    objc_msgSend(*((id *)v2 + 15), "setCompositingFilter:", v17);
    objc_msgSend(*((id *)v2 + 11), "addSublayer:", *((_QWORD *)v2 + 15));
    objc_msgSend(v2, "makeBlurFilter");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = v30;

    objc_msgSend(v2, "makeBlurFilter");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v32;

    v47[0] = *((_QWORD *)v2 + 18);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v2 + 10), "setFilters:", v34);

    v46 = *((_QWORD *)v2 + 19);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v2 + 11), "setFilters:", v35);

    v2[33] = 0;
    v36 = (void *)*((_QWORD *)v2 + 20);
    *((_QWORD *)v2 + 20) = CFSTR("Front");

    *((_QWORD *)v2 + 27) = 0;
    *(_OWORD *)(v2 + 168) = xmmword_1E581B928;
    *(_OWORD *)(v2 + 184) = unk_1E581B938;
    *(_OWORD *)(v2 + 200) = xmmword_1E581B948;
    v38 = CFSTR("Front");
    v41 = xmmword_1E581B948;
    v40 = unk_1E581B938;
    v39 = xmmword_1E581B928;
    v42 = 0;
    objc_msgSend(v2, "updateStateWithPreviousState:transitionDirection:", &v38, 0);
    objc_msgSend(v2, "updateScale");
  }
  return (MRUFlippingArtworkLayer *)v2;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)MRUFlippingArtworkLayer;
  -[MRUFlippingArtworkLayer setBounds:](&v8, sel_setBounds_);
  -[CATransformLayer setFrame:](self->_rotatorLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_frontLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_backLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_frontGlowLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_backGlowLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_frontLegibilityLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_backLegibilityLayer, "setFrame:", x, y, width, height);
  -[MRUFlippingArtworkLayer updatePlaceholderFrame](self, "updatePlaceholderFrame");
}

- (void)setContentsScale:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRUFlippingArtworkLayer;
  -[MRUFlippingArtworkLayer setContentsScale:](&v5, sel_setContentsScale_);
  -[CALayer setContentsScale:](self->_frontLayer, "setContentsScale:", a3);
  -[CALayer setContentsScale:](self->_backLayer, "setContentsScale:", a3);
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    -[MRUFlippingArtworkLayer updateScale](self, "updateScale");
    -[MRUFlippingArtworkLayer updateOpacity](self, "updateOpacity");
  }
}

- (void)setArtworkCornerRadius:(double)a3
{
  self->_artworkCornerRadius = a3;
  -[CALayer setCornerRadius:](self->_frontLayer, "setCornerRadius:");
  -[CALayer setCornerRadius:](self->_backLayer, "setCornerRadius:", a3);
}

- (void)setImageToCurrentLayer:(CGImage *)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10[8];
  id v11[8];
  id v12;
  uint8_t buf[4];
  CGImage *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[MRUFlippingArtworkLayer state](self, "state");
    *(_DWORD *)buf = 134218242;
    v14 = a3;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].Layer setImageToCurrentLayer:<%p> currentState:%@", buf, 0x16u);

  }
  -[MRUFlippingArtworkLayer state](self, "state");
  if (self)
  {
    -[MRUFlippingArtworkLayer imageLayerForState:](self, "imageLayerForState:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v8 = 0;
  }
  -[MRUFlippingArtworkLayer setImage:toLayer:](self, "setImage:toLayer:", a3, v8);
  -[MRUFlippingArtworkLayer state](self, "state");
  if (self)
  {
    if (-[MRUFlippingArtworkLayer isLayerForStateGlowing:](self, "isLayerForStateGlowing:", v10))
    {
      -[MRUFlippingArtworkLayer state](self, "state");
      -[MRUFlippingArtworkLayer updateGlowForState:reverse:animated:](self, "updateGlowForState:reverse:animated:", &v9, a3 == 0, v4);
    }
  }
  else
  {

  }
}

- (void)transitionToImage:(CGImage *)a3 transitionDirection:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  id v27;
  _OWORD v28[4];
  uint8_t buf[4];
  CGImage *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  memset(v28, 0, sizeof(v28));
  -[MRUFlippingArtworkLayer nextState](self, "nextState");
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[MRUFlippingArtworkLayer state](self, "state");
    MRUFlippingArtworkTransitionDirectionDescription(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v30 = a3;
    v31 = 2112;
    v32 = v27;
    v33 = 2112;
    v34 = *(_QWORD *)&v28[0];
    v35 = 2112;
    v36 = v8;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].Layer transitionToImage:<%p> currentState:%@ nextState:%@ transitionDirection:%@", buf, 0x2Au);

  }
  v9 = *(id *)&v28[0];
  v23 = *(_OWORD *)((char *)v28 + 8);
  v24 = *(_OWORD *)((char *)&v28[1] + 8);
  v25 = *(_OWORD *)((char *)&v28[2] + 8);
  v22 = v9;
  v26 = *((_QWORD *)&v28[3] + 1);
  if (self)
  {
    -[MRUFlippingArtworkLayer imageLayerForState:](self, "imageLayerForState:", &v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v10 = 0;
  }
  -[MRUFlippingArtworkLayer setImage:toLayer:](self, "setImage:toLayer:", a3, v10);
  v11 = *(id *)&v28[0];
  v17 = v11;
  v18 = *(_OWORD *)((char *)v28 + 8);
  v19 = *(_OWORD *)((char *)&v28[1] + 8);
  v20 = *(_OWORD *)((char *)&v28[2] + 8);
  v21 = *((_QWORD *)&v28[3] + 1);
  if (self)
  {
    -[MRUFlippingArtworkLayer animateGlowForState:reverse:](self, "animateGlowForState:reverse:", &v17, a3 == 0);
    v12 = *(id *)&v28[0];
    v13 = *(_OWORD *)((char *)v28 + 8);
    v14 = *(_OWORD *)((char *)&v28[1] + 8);
    v15 = *(_OWORD *)((char *)&v28[2] + 8);
    v16 = *((_QWORD *)&v28[3] + 1);
    -[MRUFlippingArtworkLayer setState:transitionDirection:](self, "setState:transitionDirection:", &v12, a4);
  }
  else
  {

    v12 = *(id *)&v28[0];
    v13 = *(_OWORD *)((char *)v28 + 8);
    v14 = *(_OWORD *)((char *)&v28[1] + 8);
    v15 = *(_OWORD *)((char *)&v28[2] + 8);
    v16 = *((_QWORD *)&v28[3] + 1);
  }

}

- (void)transitionToImage:(CGImage *)a3
{
  -[MRUFlippingArtworkLayer transitionToImage:transitionDirection:](self, "transitionToImage:transitionDirection:", a3, 0);
}

- (void)setPlaceholderImage:(CGImage *)a3
{
  _BOOL8 v5;
  $67169F6E1C541F191F48AAE1416EE838 *p_state;
  void *v7;
  CGImage *v8;
  void *v9;
  __int128 v10;
  NSString *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double v15;
  NSString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double yRotation;

  self->_placeholderImage = a3;
  v5 = a3 == 0;
  p_state = &self->_state;
  v16 = self->_state.identifier;
  v17 = *(_OWORD *)&p_state->frontLayerAlpha;
  v18 = *(_OWORD *)&p_state->frontLayerBlurRadius;
  v19 = *(_OWORD *)&p_state->backLayerBlurRadius;
  yRotation = p_state->yRotation;
  -[MRUFlippingArtworkLayer placeholderLayerForState:](self, "placeholderLayerForState:", &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v5);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
  -[MRUFlippingArtworkLayer updatePlaceholderFrame](self, "updatePlaceholderFrame");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v8 = a3;
  objc_msgSend(v7, "mask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContents:", v8);

  if (a3)
  {
    v11 = p_state->identifier;
    v10 = *(_OWORD *)&p_state->frontLayerBlurRadius;
    v12 = *(_OWORD *)&p_state->frontLayerAlpha;
    v13 = v10;
    v14 = *(_OWORD *)&p_state->backLayerBlurRadius;
    v15 = p_state->yRotation;
    -[MRUFlippingArtworkLayer updateGlowForState:reverse:animated:](self, "updateGlowForState:reverse:animated:", &v11, 0, 1);
  }

}

- (void)updatePlaceholderFrame
{
  $67169F6E1C541F191F48AAE1416EE838 *p_state;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  NSString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double yRotation;
  CGRect v19;

  if (self->_placeholderImage)
  {
    p_state = &self->_state;
    v14 = self->_state.identifier;
    v15 = *(_OWORD *)&p_state->frontLayerAlpha;
    v16 = *(_OWORD *)&p_state->frontLayerBlurRadius;
    v17 = *(_OWORD *)&p_state->backLayerBlurRadius;
    yRotation = p_state->yRotation;
    -[MRUFlippingArtworkLayer placeholderLayerForState:](self, "placeholderLayerForState:", &v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageGetSizeAfterOrientation();
    -[MRUFlippingArtworkLayer bounds](self, "bounds");
    CGRectGetWidth(v19);
    -[MRUFlippingArtworkLayer bounds](self, "bounds");
    UIRectCenteredRect();
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "mask");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (void)setPlaceholderImageTintColor:(CGColor *)a3
{
  self->_placeholderImageTintColor = a3;
  -[CALayer setBackgroundColor:](self->_frontPlaceholderLayer, "setBackgroundColor:");
  -[CALayer setBackgroundColor:](self->_backPlaceholderLayer, "setBackgroundColor:", a3);
}

- (void)setArtworkStyle:(int64_t)a3
{
  if (self->_artworkStyle != a3)
  {
    self->_artworkStyle = a3;
    -[MRUFlippingArtworkLayer updateArtworkStyle](self, "updateArtworkStyle");
  }
}

- (void)updateArtworkStyle
{
  unint64_t v3;
  CALayer *frontLegibilityLayer;
  CALayer *v5;
  CALayer *v6;
  CALayer *v7;
  CALayer *v8;
  CALayer *v9;
  CALayer *backLegibilityLayer;

  v3 = self->_artworkStyle - 7;
  frontLegibilityLayer = self->_frontLegibilityLayer;
  if (v3 > 1)
  {
    if (frontLegibilityLayer || self->_backLegibilityLayer)
    {
      -[CALayer removeFromSuperlayer](frontLegibilityLayer, "removeFromSuperlayer");
      -[CALayer removeFromSuperlayer](self->_backLegibilityLayer, "removeFromSuperlayer");
      v9 = self->_frontLegibilityLayer;
      self->_frontLegibilityLayer = 0;

      backLegibilityLayer = self->_backLegibilityLayer;
      self->_backLegibilityLayer = 0;

    }
  }
  else if (!frontLegibilityLayer)
  {
    -[MRUFlippingArtworkLayer makeLegibilityLayer](self, "makeLegibilityLayer");
    v5 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v6 = self->_frontLegibilityLayer;
    self->_frontLegibilityLayer = v5;

    -[MRUFlippingArtworkLayer makeLegibilityLayer](self, "makeLegibilityLayer");
    v7 = (CALayer *)objc_claimAutoreleasedReturnValue();
    v8 = self->_backLegibilityLayer;
    self->_backLegibilityLayer = v7;

    -[CALayer addSublayer:](self->_frontLayer, "addSublayer:", self->_frontLegibilityLayer);
    -[CALayer addSublayer:](self->_backLayer, "addSublayer:", self->_backLegibilityLayer);
  }
}

- (void)setState:(id *)a3
{
  id v5;
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double var7;

  v5 = a3->var0;
  v6 = v5;
  v7 = *(_OWORD *)&a3->var1;
  v8 = *(_OWORD *)&a3->var3;
  v9 = *(_OWORD *)&a3->var5;
  var7 = a3->var7;
  if (self)
    -[MRUFlippingArtworkLayer setState:transitionDirection:](self, "setState:transitionDirection:", &v6, 0);
  else

}

- (void)setState:(id *)a3 transitionDirection:(int64_t)a4
{
  NSObject *v7;
  id var0;
  void *v9;
  NSString *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  NSString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double v19;
  _BYTE buf[32];
  __int128 v21;
  double yRotation;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    var0 = a3->var0;
    MRUFlippingArtworkTransitionDirectionDescription(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = var0;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].Layer setState:%@ transitionDirection:%@", buf, 0x16u);

  }
  if (!-[NSString isEqualToString:](self->_state.identifier, "isEqualToString:", a3->var0))
  {
    v10 = self->_state.identifier;
    v11 = *(_OWORD *)&self->_state.frontLayerBlurRadius;
    *(_OWORD *)buf = *(_OWORD *)&self->_state.frontLayerAlpha;
    *(_OWORD *)&buf[16] = v11;
    v21 = *(_OWORD *)&self->_state.backLayerBlurRadius;
    yRotation = self->_state.yRotation;
    objc_storeStrong((id *)&self->_state.identifier, a3->var0);
    v12 = *(_OWORD *)&a3->var1;
    v13 = *(_OWORD *)&a3->var3;
    v14 = *(_OWORD *)&a3->var5;
    self->_state.yRotation = a3->var7;
    *(_OWORD *)&self->_state.frontLayerBlurRadius = v13;
    *(_OWORD *)&self->_state.backLayerBlurRadius = v14;
    *(_OWORD *)&self->_state.frontLayerAlpha = v12;
    v15 = v10;
    v16 = *(_OWORD *)buf;
    v17 = *(_OWORD *)&buf[16];
    v18 = v21;
    v19 = yRotation;
    -[MRUFlippingArtworkLayer updateStateWithPreviousState:transitionDirection:](self, "updateStateWithPreviousState:transitionDirection:", &v15, a4);
  }

}

- (void)setImage:(CGImage *)a3 toLayer:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setContents:", a3);
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

}

- (void)animateGlowForState:(id *)a3 reverse:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double var7;

  v4 = a4;
  v7 = a3->var0;
  v8 = v7;
  v9 = *(_OWORD *)&a3->var1;
  v10 = *(_OWORD *)&a3->var3;
  v11 = *(_OWORD *)&a3->var5;
  var7 = a3->var7;
  if (self)
    -[MRUFlippingArtworkLayer updateGlowForState:reverse:animated:](self, "updateGlowForState:reverse:animated:", &v8, v4, 1);
  else

}

- (void)updateGlowForState:(id *)a3 reverse:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v9;
  id var0;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double var7;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v5 = a5;
  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  MCLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    var0 = a3->var0;
    *(_DWORD *)buf = 138412802;
    v25 = var0;
    v26 = 1024;
    v27 = v6;
    v28 = 1024;
    v29 = v5;
    _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEBUG, "[FlippingArtwork].Layer updateGlowForState %@ reverse:%{BOOL}u animated:%{BOOL}u", buf, 0x18u);
  }

  v11 = a3->var0;
  v19 = v11;
  v20 = *(_OWORD *)&a3->var1;
  v21 = *(_OWORD *)&a3->var3;
  v22 = *(_OWORD *)&a3->var5;
  var7 = a3->var7;
  if (self)
  {
    -[MRUFlippingArtworkLayer glowLayerForState:](self, "glowLayerForState:", &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v12 = 0;
  }
  HIDWORD(v13) = 0;
  if (v6)
    v14 = 0.5;
  else
    v14 = 0.0;
  *(float *)&v13 = v14;
  objc_msgSend(v12, "setOpacity:", v13, v19, v20, v21, v22, *(_QWORD *)&var7);
  if (v5)
  {
    v15 = 0.5;
    if (v6)
      v15 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUFlippingArtworkLayer makeAnimation:fromValue:toValue:duration:](self, "makeAnimation:fromValue:toValue:duration:", CFSTR("opacity"), v16, v17, 0.55);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAnimation:forKey:", v18, 0);
  }

}

- (BOOL)isLayerForStateGlowing:(id *)a3
{
  id v5;
  float v6;
  BOOL v7;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  double var7;

  v5 = a3->var0;
  v9 = v5;
  v10 = *(_OWORD *)&a3->var1;
  v11 = *(_OWORD *)&a3->var3;
  v12 = *(_OWORD *)&a3->var5;
  var7 = a3->var7;
  if (self)
  {
    -[MRUFlippingArtworkLayer glowLayerForState:](self, "glowLayerForState:", &v9);
    self = (MRUFlippingArtworkLayer *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

  }
  -[MRUFlippingArtworkLayer opacity](self, "opacity", v9, v10, v11, v12, *(_QWORD *)&var7);
  v7 = v6 > 0.0;

  return v7;
}

- (void)updateStateWithPreviousState:(id *)a3 transitionDirection:(int64_t)a4
{
  void *v7;
  double yRotation;
  void *v9;
  char v10;
  double v11;
  __int128 v12;
  CGFloat v13;
  __int128 v14;
  __int128 v15;
  CATransformLayer *rotatorLayer;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _OWORD v27[5];
  CGFloat v28;
  CGFloat m34;
  __int128 v30;
  __int128 v31;
  CATransform3D v32;
  CATransform3D v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CGFloat m33;

  -[CATransformLayer valueForKeyPath:](self->_rotatorLayer, "valueForKeyPath:", CFSTR("transform.rotation.y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  yRotation = self->_state.yRotation;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", yRotation);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToNumber:", v9);

  if ((v10 & 1) == 0)
  {
    v11 = self->_state.yRotation;
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v32.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v32.m23 = v12;
    *(_OWORD *)&v32.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v13 = *(double *)(MEMORY[0x1E0CD2610] + 80);
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v32.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v32.m13 = v14;
    v32.m33 = v13;
    v32.m34 = -0.000666666667;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v32.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v32.m43 = v15;
    CATransform3DRotate(&v33, &v32, v11, 0.0, 1.0, 0.0);
    v38 = *(_OWORD *)&v33.m21;
    v39 = *(_OWORD *)&v33.m23;
    v40 = *(_OWORD *)&v33.m31;
    m33 = v33.m33;
    v36 = *(_OWORD *)&v33.m11;
    v37 = *(_OWORD *)&v33.m13;
    v34 = *(_OWORD *)&v33.m41;
    v35 = *(_OWORD *)&v33.m43;
    v28 = v33.m33;
    v27[3] = *(_OWORD *)&v33.m23;
    v27[4] = *(_OWORD *)&v33.m31;
    v27[1] = *(_OWORD *)&v33.m13;
    v27[2] = *(_OWORD *)&v33.m21;
    v27[0] = *(_OWORD *)&v33.m11;
    v30 = *(_OWORD *)&v33.m41;
    v31 = *(_OWORD *)&v33.m43;
    rotatorLayer = self->_rotatorLayer;
    m34 = v33.m34;
    -[CATransformLayer setTransform:](rotatorLayer, "setTransform:", v27);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", MRUFlippingArtworkTransitionDirectionFromValue(a4, yRotation));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", yRotation);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUFlippingArtworkLayer makeSpringAnimation:fromValue:toValue:](self, "makeSpringAnimation:fromValue:toValue:", CFSTR("transform.rotation.y"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v20) = 0.5;
    objc_msgSend(v19, "setSpeed:", v20);
    -[CATransformLayer addAnimation:forKey:](self->_rotatorLayer, "addAnimation:forKey:", v19, 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_state.frontLayerBlurRadius);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUFlippingArtworkLayer makeAnimation:fromValue:toValue:duration:](self, "makeAnimation:fromValue:toValue:duration:", CFSTR("filters.gaussianBlur.inputRadius"), v21, v22, 0.5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->var5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_state.backLayerBlurRadius);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUFlippingArtworkLayer makeAnimation:fromValue:toValue:duration:](self, "makeAnimation:fromValue:toValue:duration:", CFSTR("filters.gaussianBlur.inputRadius"), v24, v25, 0.5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setBeginTime:", CACurrentMediaTime() + self->_state.frontLayerBlurAnimationDelay);
  objc_msgSend(v26, "setBeginTime:", CACurrentMediaTime() + self->_state.backLayerBlurAnimationDelay);
  -[CALayer addAnimation:forKey:](self->_frontLayer, "addAnimation:forKey:", v23, 0);
  -[CALayer addAnimation:forKey:](self->_backLayer, "addAnimation:forKey:", v26, 0);

}

- (void)updateScale
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  v3 = MRUFlippingArtworkScale(!self->_playing);
  v4 = MRUFlippingArtworkScale(self->_playing);
  if (vabdd_f64(v3, v4) > 2.22044605e-16)
  {
    -[MRUFlippingArtworkLayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("MRUFlippingArtworkPlaybackStateScaleAnimationKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUFlippingArtworkLayer makeSpringAnimation:fromValue:toValue:](self, "makeSpringAnimation:fromValue:toValue:", CFSTR("transform.scale.xy"), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[MRUFlippingArtworkLayer addAnimation:forKey:](self, "addAnimation:forKey:", v7, 0);
  }
}

- (void)updateOpacity
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = MRUFlippingArtworkOpacity(!self->_playing, self->_dimsWhenPaused);
  v4 = MRUFlippingArtworkOpacity(self->_playing, self->_dimsWhenPaused);
  if (vabdd_f64(v3, v4) > 2.22044605e-16)
  {
    -[MRUFlippingArtworkLayer removeAnimationForKey:](self, "removeAnimationForKey:", CFSTR("MRUFlippingArtworkPlaybackStateOpacityAnimationKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUFlippingArtworkLayer makeAnimation:fromValue:toValue:duration:](self, "makeAnimation:fromValue:toValue:duration:", CFSTR("opacity"), v5, v6, 0.2);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimingFunction:", v7);

    objc_msgSend(v8, "setRemovedOnCompletion:", 0);
    -[MRUFlippingArtworkLayer addAnimation:forKey:](self, "addAnimation:forKey:", v8, CFSTR("MRUFlippingArtworkPlaybackStateOpacityAnimationKey"));

  }
}

- (id)imageLayerForState:(id *)a3
{
  void *v5;

  if (objc_msgSend(a3->var0, "isEqualToString:", CFSTR("Front")))
    -[MRUFlippingArtworkLayer frontLayer](self, "frontLayer");
  else
    -[MRUFlippingArtworkLayer backLayer](self, "backLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)placeholderLayerForState:(id *)a3
{
  void *v5;

  if (objc_msgSend(a3->var0, "isEqualToString:", CFSTR("Front")))
    -[MRUFlippingArtworkLayer frontPlaceholderLayer](self, "frontPlaceholderLayer");
  else
    -[MRUFlippingArtworkLayer backPlaceholderLayer](self, "backPlaceholderLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)glowLayerForState:(id *)a3
{
  void *v5;

  if (objc_msgSend(a3->var0, "isEqualToString:", CFSTR("Front")))
    -[MRUFlippingArtworkLayer frontGlowLayer](self, "frontGlowLayer");
  else
    -[MRUFlippingArtworkLayer backGlowLayer](self, "backGlowLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- ($96BD43AC9783A3841D68D10A686FAFB5)nextState
{
  int v4;
  double *p_var1;
  __CFString *v6;
  $96BD43AC9783A3841D68D10A686FAFB5 *result;
  void *v8;

  -[MRUFlippingArtworkLayer state](self, "state");
  v4 = objc_msgSend(v8, "isEqualToString:", CFSTR("Front"));
  p_var1 = &retstr->var1;
  if (v4)
  {
    *(_OWORD *)p_var1 = xmmword_1E581B968;
    *(_OWORD *)&retstr->var3 = unk_1E581B978;
    *(_OWORD *)&retstr->var5 = xmmword_1E581B988;
    retstr->var7 = -3.14159265;
    v6 = CFSTR("Back");
  }
  else
  {
    retstr->var7 = 0.0;
    *(_OWORD *)p_var1 = xmmword_1E581B928;
    *(_OWORD *)&retstr->var3 = unk_1E581B938;
    *(_OWORD *)&retstr->var5 = xmmword_1E581B948;
    v6 = CFSTR("Front");
  }
  retstr->var0 = v6;

  return result;
}

- (id)makeBlurFilter
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0CD2780]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x1E0CD2C88]);
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E58782C8, *MEMORY[0x1E0CD2D90]);
  objc_msgSend(v3, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
  return v3;
}

- (id)makeLegibilityLayer
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  -[MRUFlippingArtworkLayer makeDynamicIslandLegibilityFilter](self, "makeDynamicIslandLegibilityFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilters:", v6);

  -[MRUFlippingArtworkLayer bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");
  return v3;
}

- (id)makeDynamicIslandLegibilityFilter
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v2 = objc_alloc(MEMORY[0x1E0CD2780]);
  v3 = (void *)objc_msgSend(v2, "initWithType:", *MEMORY[0x1E0CD2F08]);
  v6[0] = 0;
  v6[1] = 0;
  v7 = 1053676274;
  v9 = 0;
  v8 = 0;
  v10 = 1053676274;
  v11 = 0;
  v12 = 0;
  v13 = xmmword_1AAAD6480;
  v14 = 1045086339;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("inputColorMatrix"));

  return v3;
}

- (id)makeSpringAnimation:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CD2848];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "animationWithKeyPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMass:", 1.25);
  objc_msgSend(v10, "setDamping:", 25.0);
  objc_msgSend(v10, "setStiffness:", 300.0);
  objc_msgSend(v10, "setInitialVelocity:", 0.0);
  objc_msgSend(v10, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v10, "setFromValue:", v9);

  objc_msgSend(v10, "setToValue:", v8);
  objc_msgSend(v10, "settlingDuration");
  objc_msgSend(v10, "setDuration:");
  objc_msgSend(v10, "setRemovedOnCompletion:", 0);
  return v10;
}

- (id)makeAnimation:(id)a3 fromValue:(id)a4 toValue:(id)a5 duration:(double)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;

  v9 = (void *)MEMORY[0x1E0CD2710];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "animationWithKeyPath:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDuration:", a6);
  objc_msgSend(v12, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v12, "setFromValue:", v11);

  objc_msgSend(v12, "setToValue:", v10);
  return v12;
}

- (double)artworkCornerRadius
{
  return self->_artworkCornerRadius;
}

- (BOOL)playing
{
  return self->_playing;
}

- (BOOL)dimsWhenPaused
{
  return self->_dimsWhenPaused;
}

- (void)setDimsWhenPaused:(BOOL)a3
{
  self->_dimsWhenPaused = a3;
}

- (CGImage)placeholderImage
{
  return self->_placeholderImage;
}

- (CGColor)placeholderImageTintColor
{
  return self->_placeholderImageTintColor;
}

- (int64_t)artworkStyle
{
  return self->_artworkStyle;
}

- (CATransformLayer)rotatorLayer
{
  return self->_rotatorLayer;
}

- (void)setRotatorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_rotatorLayer, a3);
}

- (CALayer)frontLayer
{
  return self->_frontLayer;
}

- (void)setFrontLayer:(id)a3
{
  objc_storeStrong((id *)&self->_frontLayer, a3);
}

- (CALayer)backLayer
{
  return self->_backLayer;
}

- (void)setBackLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backLayer, a3);
}

- (CALayer)frontPlaceholderLayer
{
  return self->_frontPlaceholderLayer;
}

- (void)setFrontPlaceholderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_frontPlaceholderLayer, a3);
}

- (CALayer)backPlaceholderLayer
{
  return self->_backPlaceholderLayer;
}

- (void)setBackPlaceholderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backPlaceholderLayer, a3);
}

- (CALayer)frontGlowLayer
{
  return self->_frontGlowLayer;
}

- (void)setFrontGlowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_frontGlowLayer, a3);
}

- (CALayer)backGlowLayer
{
  return self->_backGlowLayer;
}

- (void)setBackGlowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backGlowLayer, a3);
}

- (CALayer)frontLegibilityLayer
{
  return self->_frontLegibilityLayer;
}

- (void)setFrontLegibilityLayer:(id)a3
{
  objc_storeStrong((id *)&self->_frontLegibilityLayer, a3);
}

- (CALayer)backLegibilityLayer
{
  return self->_backLegibilityLayer;
}

- (void)setBackLegibilityLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backLegibilityLayer, a3);
}

- (CAFilter)frontBlurFilter
{
  return self->_frontBlurFilter;
}

- (void)setFrontBlurFilter:(id)a3
{
  objc_storeStrong((id *)&self->_frontBlurFilter, a3);
}

- (CAFilter)backBlurFilter
{
  return self->_backBlurFilter;
}

- (void)setBackBlurFilter:(id)a3
{
  objc_storeStrong((id *)&self->_backBlurFilter, a3);
}

- ($96BD43AC9783A3841D68D10A686FAFB5)state
{
  $67169F6E1C541F191F48AAE1416EE838 *p_state;
  $96BD43AC9783A3841D68D10A686FAFB5 *result;

  p_state = &self->_state;
  result = self->_state.identifier;
  retstr->var0 = result;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&p_state->frontLayerAlpha;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&p_state->frontLayerBlurRadius;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&p_state->backLayerBlurRadius;
  retstr->var7 = p_state->yRotation;
  return result;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_backBlurFilter, 0);
  objc_storeStrong((id *)&self->_frontBlurFilter, 0);
  objc_storeStrong((id *)&self->_backLegibilityLayer, 0);
  objc_storeStrong((id *)&self->_frontLegibilityLayer, 0);
  objc_storeStrong((id *)&self->_backGlowLayer, 0);
  objc_storeStrong((id *)&self->_frontGlowLayer, 0);
  objc_storeStrong((id *)&self->_backPlaceholderLayer, 0);
  objc_storeStrong((id *)&self->_frontPlaceholderLayer, 0);
  objc_storeStrong((id *)&self->_backLayer, 0);
  objc_storeStrong((id *)&self->_frontLayer, 0);
  objc_storeStrong((id *)&self->_rotatorLayer, 0);
}

@end
