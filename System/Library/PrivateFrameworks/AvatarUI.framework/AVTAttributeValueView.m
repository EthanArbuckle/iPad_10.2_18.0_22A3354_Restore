@implementation AVTAttributeValueView

- (AVTAttributeValueView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  AVTAttributeValueView *v7;
  AVTAttributeValueView *v8;
  uint64_t v14;
  UIView *contentView;
  CALayer *v16;
  CALayer *imageLayer;
  void *v18;
  CALayer *v19;
  CALayer *transitionImageLayer;
  double v21;
  void *v22;
  uint64_t v23;
  CAShapeLayer *selectionLayer;
  id v25;
  id v26;
  double v27;
  void *v28;
  uint64_t v29;
  CAShapeLayer *clippingLayer;
  id v31;
  objc_super v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)AVTAttributeValueView;
  v7 = -[AVTAttributeValueView initWithFrame:](&v33, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    __asm { FMOV            V0.2D, #1.0 }
    v7->_imageSizeRatio = _Q0;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", x, y, width, height);
    contentView = v8->_contentView;
    v8->_contentView = (UIView *)v14;

    -[UIView setAutoresizingMask:](v8->_contentView, "setAutoresizingMask:", 18);
    -[AVTAttributeValueView addSubview:](v8, "addSubview:", v8->_contentView);
    v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    imageLayer = v8->_imageLayer;
    v8->_imageLayer = v16;

    -[AVTAttributeValueView configureImageLayer:](v8, "configureImageLayer:", v8->_imageLayer);
    -[UIView layer](v8->_contentView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSublayer:", v8->_imageLayer);

    v19 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    transitionImageLayer = v8->_transitionImageLayer;
    v8->_transitionImageLayer = v19;

    LODWORD(v21) = 0;
    -[CALayer setOpacity:](v8->_transitionImageLayer, "setOpacity:", v21);
    -[AVTAttributeValueView configureImageLayer:](v8, "configureImageLayer:", v8->_transitionImageLayer);
    -[UIView layer](v8->_contentView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v8->_transitionImageLayer);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v23 = objc_claimAutoreleasedReturnValue();
    selectionLayer = v8->_selectionLayer;
    v8->_selectionLayer = (CAShapeLayer *)v23;

    +[AVTUIColorRepository attributeValueCellSelectedStrokeColor](AVTUIColorRepository, "attributeValueCellSelectedStrokeColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v8->_selectionLayer, "setStrokeColor:", objc_msgSend(v25, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v8->_selectionLayer, "setFillColor:", objc_msgSend(v26, "CGColor"));

    -[CAShapeLayer setLineWidth:](v8->_selectionLayer, "setLineWidth:", 3.0);
    LODWORD(v27) = 0;
    -[CAShapeLayer setOpacity:](v8->_selectionLayer, "setOpacity:", v27);
    -[AVTAttributeValueView layer](v8, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSublayer:", v8->_selectionLayer);

    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v29 = objc_claimAutoreleasedReturnValue();
    clippingLayer = v8->_clippingLayer;
    v8->_clippingLayer = (CAShapeLayer *)v29;

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v8->_clippingLayer, "setFillColor:", objc_msgSend(v31, "CGColor"));

    -[CAShapeLayer setLineWidth:](v8->_clippingLayer, "setLineWidth:", 0.0);
  }
  return v8;
}

- (void)updateSelectionAndMaskLayer
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[AVTAttributeValueView shapeLayerRect](self, "shapeLayerRect");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  if (!CGRectIsEmpty(v30))
  {
    -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    v8 = CGRectEqualToRect(v31, v32);

    if (!v8)
    {
      -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBounds:", x, y, width, height);

      -[AVTAttributeValueView selectionBezierPath](self, "selectionBezierPath");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "CGPath");
      -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPath:", v11);

      -[AVTAttributeValueView clippingLayer](self, "clippingLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBounds:", x, y, width, height);

      -[AVTAttributeValueView clippingBezierPath](self, "clippingBezierPath");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = objc_msgSend(v14, "CGPath");
      -[AVTAttributeValueView clippingLayer](self, "clippingLayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPath:", v15);

    }
    +[AVTUIColorRepository attributeValueCellSelectedStrokeColor](AVTUIColorRepository, "attributeValueCellSelectedStrokeColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setStrokeColor:", v18);

    -[AVTAttributeValueView bounds](self, "bounds");
    UIRectGetCenter();
    v21 = v20;
    v23 = v22;
    -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPosition:", v21, v23);

    -[AVTAttributeValueView clippingLayer](self, "clippingLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setPosition:", v21, v23);

    if (-[AVTAttributeValueView selectionStyle](self, "selectionStyle") == 1
      || -[AVTAttributeValueView isSelected](self, "isSelected"))
    {
      -[AVTAttributeValueView clippingLayer](self, "clippingLayer");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v26 = 1;
    }
    else
    {
      v26 = 0;
      v29 = 0;
    }
    -[AVTAttributeValueView contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMask:", v29);

    if (v26)
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVTAttributeValueView;
  -[AVTAttributeValueView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[AVTAttributeValueView updateSelectionAndMaskLayer](self, "updateSelectionAndMaskLayer");
  if (self->_showPlaceholder)
  {
    v5 = objc_msgSend(v4, "userInterfaceStyle");
    -[AVTAttributeValueView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceStyle");

    if (v5 != v7)
    {
      -[AVTAttributeValueView traitCollection](self, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      AVTFlatSilhouetteImageForTraitCollection(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAttributeValueView updateWithImage:](self, "updateWithImage:", v9);

    }
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVTAttributeValueView;
  -[AVTAttributeValueView layoutSubviews](&v3, sel_layoutSubviews);
  -[AVTAttributeValueView relayoutSublayers](self, "relayoutSublayers");
  -[AVTAttributeValueView updateSelectionAndMaskLayer](self, "updateSelectionAndMaskLayer");
  -[AVTAttributeValueView updateCornerRadii](self, "updateCornerRadii");
}

- (void)relayoutSublayers
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  -[AVTAttributeValueView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AVTAttributeValueView imageSizeRatio](self, "imageSizeRatio");
  v13 = v12;
  v15 = v14;
  -[AVTAttributeValueView window](self, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  objc_msgSend(v3, "imageViewRectForBounds:imageSizeRatio:scale:", v5, v7, v9, v11, v13, v15, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[AVTAttributeValueView bounds](self, "bounds");
  UIRectGetCenter();
  v28 = v27;
  v30 = v29;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVTAttributeValueView imageLayer](self, "imageLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPosition:", v28, v30);

  -[AVTAttributeValueView imageLayer](self, "imageLayer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setBounds:", v20, v22, v24, v26);

  -[AVTAttributeValueView transitionImageLayer](self, "transitionImageLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setPosition:", v28, v30);

  -[AVTAttributeValueView transitionImageLayer](self, "transitionImageLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBounds:", v20, v22, v24, v26);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[AVTAttributeValueView imageLayer](self, "imageLayer", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sublayers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v44;
    do
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v40);
        -[AVTAttributeValueView imageLayer](self, "imageLayer");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bounds");
        objc_msgSend(v41, "setFrame:");

        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v38);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CGRect)selectorRect
{
  CGFloat width;
  CGFloat height;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  void *v8;
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
  CGRect v21;
  CGRect v22;
  CGRect result;

  -[AVTAttributeValueView shapeLayerRect](self, "shapeLayerRect");
  width = v21.size.width;
  height = v21.size.height;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v21.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v21.origin.y = v6;
  CGRectGetWidth(v21);
  v22.origin.x = v5;
  v22.origin.y = v6;
  v22.size.width = width;
  v22.size.height = height;
  CGRectGetHeight(v22);
  UIRectGetCenter();
  -[AVTAttributeValueView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  UIRectCenteredAboutPointScale();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)configureImageLayer:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = *MEMORY[0x1E0CD2A68];
  v4 = a3;
  objc_msgSend(v4, "setCornerCurve:", v3);
  objc_msgSend(v4, "setCornerRadius:", 6.0);
  objc_msgSend(v4, "setMasksToBounds:", 1);
  objc_msgSend(v4, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);

}

+ (CGRect)imageViewRectForBounds:(CGRect)a3 imageSizeRatio:(CGSize)a4 scale:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v7;
  CGFloat v8;
  CGAffineTransform v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGRect v13;
  CGRect v14;

  height = a4.height;
  width = a4.width;
  v8 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  _UIScaleTransformForAspectFitOfSizeInTargetSize();
  memset(&v9, 0, sizeof(v9));
  v13.origin.x = v8;
  v13.origin.y = v7;
  v13.size.width = width;
  v13.size.height = height;
  CGRectApplyAffineTransform(v13, &v9);
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  return CGRectInset(v14, 8.0, 8.0);
}

- (id)selectionBezierPath
{
  double x;
  double y;
  double width;
  double height;
  CGRect v8;
  CGRect v9;

  -[AVTAttributeValueView selectorRect](self, "selectorRect");
  v9 = CGRectInset(v8, 1.5, 1.5);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  if (-[AVTAttributeValueView selectionStyle](self, "selectionStyle") == 1)
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", x, y, width, height);
  else
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 12.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clippingBezierPath
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
  double v12;
  double v13;
  void *v14;
  double x;
  double y;
  double width;
  double height;
  CGRect v20;
  CGRect v21;

  if (-[AVTAttributeValueView selectionStyle](self, "selectionStyle"))
  {
    v3 = (void *)objc_opt_class();
    -[AVTAttributeValueView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[AVTAttributeValueView imageSizeRatio](self, "imageSizeRatio");
    objc_msgSend(v3, "imageViewRectForBounds:imageSizeRatio:scale:", v5, v7, v9, v11, v12, v13, 0.0);
    -[AVTAttributeValueView shapeLayerRect](self, "shapeLayerRect");
    v14 = (void *)MEMORY[0x1E0CEA390];
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    objc_msgSend(v14, "bezierPathWithOvalInRect:");
  }
  else
  {
    -[AVTAttributeValueView selectorRect](self, "selectorRect");
    v21 = CGRectInset(v20, 8.0, 8.0);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    -[AVTAttributeValueView shapeLayerRect](self, "shapeLayerRect");
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 5.5);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSelectionStyle:(unint64_t)a3
{
  if (self->_selectionStyle != a3)
  {
    self->_selectionStyle = a3;
    -[AVTAttributeValueView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateCornerRadii
{
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (-[AVTAttributeValueView selectionStyle](self, "selectionStyle"))
  {
    -[AVTAttributeValueView imageLayer](self, "imageLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0.0;
  }
  else
  {
    v5 = *MEMORY[0x1E0CD2A68];
    -[AVTAttributeValueView imageLayer](self, "imageLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerCurve:", v5);

    -[AVTAttributeValueView imageLayer](self, "imageLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 6.0;
  }
  v7 = v3;
  objc_msgSend(v3, "setCornerRadius:", v4);

}

- (void)setImageSizeRatio:(CGSize)a3
{
  if (self->_imageSizeRatio.width != a3.width || self->_imageSizeRatio.height != a3.height)
  {
    self->_imageSizeRatio = a3;
    -[AVTAttributeValueView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateHighlightedState:(BOOL)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void (**v8)(id, uint64_t);
  __int128 v9;
  CGAffineTransform v10;
  _QWORD v11[5];
  CGAffineTransform v12;
  CGAffineTransform v13;

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  memset(&v13, 0, sizeof(v13));
  if (v6)
  {
    CGAffineTransformMakeScale(&v13, 0.95, 0.95);
    if (!v5)
      goto LABEL_3;
LABEL_6:
    v11[1] = 3221225472;
    v12 = v13;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[2] = __73__AVTAttributeValueView_updateHighlightedState_animated_completionBlock___block_invoke;
    v11[3] = &unk_1EA51EA98;
    v11[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v11, v8, 0.1, 0.0);
    goto LABEL_7;
  }
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v13.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v13.c = v9;
  *(_OWORD *)&v13.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (v5)
    goto LABEL_6;
LABEL_3:
  v10 = v13;
  -[AVTAttributeValueView setTransform:](self, "setTransform:", &v10);
  if (v8)
    v8[2](v8, 1);
LABEL_7:

}

uint64_t __73__AVTAttributeValueView_updateHighlightedState_animated_completionBlock___block_invoke(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

- (void)updateSelectedState:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  float v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  id v12;

  v4 = a4;
  v5 = a3;
  -[AVTAttributeValueView setSelected:](self, "setSelected:");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVTAttributeValueView updateSelectionAndMaskLayer](self, "updateSelectionAndMaskLayer");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    if (v5)
      v7 = 1.0;
    else
      v7 = 0.0;
    -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v8 = v7;
    objc_msgSend(v12, "setOpacity:", v8);

  }
  else
  {
    if (v5)
      v9 = 1.0;
    else
      v9 = 0.0;
    -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = v9;
    objc_msgSend(v10, "setOpacity:", v11);

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)bringSelectionLayersToFront
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[AVTAttributeValueView imageLayer](self, "imageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperlayer");

  -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  -[AVTAttributeValueView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeValueView imageLayer](self, "imageLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", v7);

  -[AVTAttributeValueView layer](self, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeValueView selectionLayer](self, "selectionLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", v8);

}

- (void)updateWithImage:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AVTAttributeValueView image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[AVTAttributeValueView setImage:](self, "setImage:", v4);
    self->_showPlaceholder = 0;
  }
  v8 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v8, "CGImage");
  -[AVTAttributeValueView imageLayer](self, "imageLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

}

- (void)prepareForTransitionToImage:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AVTAttributeValueView image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[AVTAttributeValueView setImage:](self, "setImage:", v4);
    self->_showPlaceholder = 0;
  }
  v8 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v8, "CGImage");
  -[AVTAttributeValueView transitionImageLayer](self, "transitionImageLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContents:", v6);

}

- (void)setShowPlaceholder:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_showPlaceholder != a3)
  {
    self->_showPlaceholder = a3;
    if (a3)
    {
      -[AVTAttributeValueView traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      AVTFlatSilhouetteImageForTraitCollection(v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    -[AVTAttributeValueView updateWithImage:](self, "updateWithImage:", v5);

  }
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (void)cleanupAfterTransition
{
  void *v3;
  id v4;

  -[AVTAttributeValueView imageLayer](self, "imageLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeValueView transitionImageLayer](self, "transitionImageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAttributeValueView setImageLayer:](self, "setImageLayer:", v3);

  -[AVTAttributeValueView bringSelectionLayersToFront](self, "bringSelectionLayersToFront");
  -[AVTAttributeValueView setTransitionImageLayer:](self, "setTransitionImageLayer:", v4);

}

- (void)discardContent
{
  void *v3;
  void (**v4)(id, AVTAttributeValueView *);

  -[AVTAttributeValueView updateWithImage:](self, "updateWithImage:", 0);
  -[AVTAttributeValueView discardableContentHandler](self, "discardableContentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTAttributeValueView discardableContentHandler](self, "discardableContentHandler");
    v4 = (void (**)(id, AVTAttributeValueView *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (CGSize)imageSizeRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSizeRatio.width;
  height = self->_imageSizeRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayer, a3);
}

- (unint64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_displaySessionUUID, a3);
}

- (CAShapeLayer)clippingLayer
{
  return self->_clippingLayer;
}

- (void)setClippingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_clippingLayer, a3);
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectionLayer, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CALayer)transitionImageLayer
{
  return self->_transitionImageLayer;
}

- (void)setTransitionImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_transitionImageLayer, a3);
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionImageLayer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_clippingLayer, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
}

@end
