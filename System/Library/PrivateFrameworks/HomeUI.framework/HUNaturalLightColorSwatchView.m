@implementation HUNaturalLightColorSwatchView

- (HUNaturalLightColorSwatchView)initWithFrame:(CGRect)a3
{
  HUNaturalLightColorSwatchView *v3;
  CAShapeLayer *v4;
  CAShapeLayer *circleMaskLayer;
  void *v6;
  uint64_t v7;
  CAGradientLayer *circleGradientLayer;
  void *v9;
  CAShapeLayer *v10;
  CAShapeLayer *selectedCircleMaskLayer;
  id v12;
  id v13;
  uint64_t v14;
  CAGradientLayer *selectedCircleGradientLayer;
  void *v16;
  CAShapeLayer *v17;
  CAShapeLayer *selectedCircleInnerLayer;
  void *v19;
  id v20;
  id v21;
  void *v22;
  CAShapeLayer *v23;
  CAShapeLayer *circleOuterLayer;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  UIImage *truetoneIcon;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)HUNaturalLightColorSwatchView;
  v3 = -[HUNaturalLightColorSwatchView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    circleMaskLayer = v3->_circleMaskLayer;
    v3->_circleMaskLayer = v4;

    -[CAShapeLayer setFillRule:](v3->_circleMaskLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    -[CAShapeLayer setLineWidth:](v3->_circleMaskLayer, "setLineWidth:", 0.5);
    -[HUNaturalLightColorSwatchView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v3->_circleMaskLayer);

    objc_msgSend((id)objc_opt_class(), "_createGradientLayer");
    v7 = objc_claimAutoreleasedReturnValue();
    circleGradientLayer = v3->_circleGradientLayer;
    v3->_circleGradientLayer = (CAGradientLayer *)v7;

    -[CAGradientLayer setMask:](v3->_circleGradientLayer, "setMask:", v3->_circleMaskLayer);
    -[HUNaturalLightColorSwatchView layer](v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", v3->_circleGradientLayer);

    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    selectedCircleMaskLayer = v3->_selectedCircleMaskLayer;
    v3->_selectedCircleMaskLayer = v10;

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_selectedCircleMaskLayer, "setFillColor:", objc_msgSend(v12, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v3->_selectedCircleMaskLayer, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

    -[CAShapeLayer setLineWidth:](v3->_selectedCircleMaskLayer, "setLineWidth:", 3.0);
    objc_msgSend((id)objc_opt_class(), "_createGradientLayer");
    v14 = objc_claimAutoreleasedReturnValue();
    selectedCircleGradientLayer = v3->_selectedCircleGradientLayer;
    v3->_selectedCircleGradientLayer = (CAGradientLayer *)v14;

    -[CAGradientLayer setMask:](v3->_selectedCircleGradientLayer, "setMask:", v3->_selectedCircleMaskLayer);
    -[HUNaturalLightColorSwatchView layer](v3, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v3->_selectedCircleGradientLayer);

    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    selectedCircleInnerLayer = v3->_selectedCircleInnerLayer;
    v3->_selectedCircleInnerLayer = v17;

    -[CAShapeLayer setLineWidth:](v3->_selectedCircleInnerLayer, "setLineWidth:", 0.3);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "colorWithAlphaComponent:", 0.1);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v3->_selectedCircleInnerLayer, "setStrokeColor:", objc_msgSend(v20, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_selectedCircleInnerLayer, "setFillColor:", objc_msgSend(v21, "CGColor"));

    -[HUNaturalLightColorSwatchView layer](v3, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSublayer:", v3->_selectedCircleInnerLayer);

    v23 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    circleOuterLayer = v3->_circleOuterLayer;
    v3->_circleOuterLayer = v23;

    -[CAShapeLayer setLineWidth:](v3->_circleOuterLayer, "setLineWidth:", 0.300000012);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "colorWithAlphaComponent:", 0.1);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v3->_circleOuterLayer, "setStrokeColor:", objc_msgSend(v26, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_circleOuterLayer, "setFillColor:", objc_msgSend(v27, "CGColor"));

    -[HUNaturalLightColorSwatchView layer](v3, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSublayer:", v3->_circleOuterLayer);

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 6, 21.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", CFSTR("truetone"), v29);
    v30 = objc_claimAutoreleasedReturnValue();
    truetoneIcon = v3->_truetoneIcon;
    v3->_truetoneIcon = (UIImage *)v30;

    -[HUNaturalLightColorSwatchView setClipsToBounds:](v3, "setClipsToBounds:", 0);
  }
  return v3;
}

- (void)setSelectionState:(unint64_t)a3
{
  if (self->_selectionState != a3)
  {
    self->_selectionState = a3;
    -[HUNaturalLightColorSwatchView _updateLayout](self, "_updateLayout");
  }
}

- (void)_updateLayout
{
  void *v3;
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;

  -[HUNaturalLightColorSwatchView truetoneIcon](self, "truetoneIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNaturalLightColorSwatchView _buildMaskFromImage:](self, "_buildMaskFromImage:", v3);
  v53 = (id)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v53);
    -[HUNaturalLightColorSwatchView setMaskView:](self, "setMaskView:", v4);

  }
  -[HUNaturalLightColorSwatchView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[HUNaturalLightColorSwatchView circleGradientLayer](self, "circleGradientLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[HUNaturalLightColorSwatchView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[HUNaturalLightColorSwatchView selectedCircleGradientLayer](self, "selectedCircleGradientLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[HUNaturalLightColorSwatchView bounds](self, "bounds");
  v24 = v23;
  -[HUNaturalLightColorSwatchView bounds](self, "bounds");
  if (v24 >= v25)
    v26 = v25;
  else
    v26 = v24;
  v27 = v26 + -0.600000024;
  -[HUNaturalLightColorSwatchView bounds](self, "bounds");
  v29 = v28;
  -[HUNaturalLightColorSwatchView bounds](self, "bounds");
  v31 = v30;
  if ((-[HUNaturalLightColorSwatchView selectionState](self, "selectionState") & 2) != 0
    || (-[HUNaturalLightColorSwatchView selectionState](self, "selectionState") & 1) != 0)
  {
    -[HUNaturalLightColorSwatchView selectedCircleGradientLayer](self, "selectedCircleGradientLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setHidden:", 0);

    -[HUNaturalLightColorSwatchView selectedCircleInnerLayer](self, "selectedCircleInnerLayer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setHidden:", 0);

    v34 = v27 * 0.5;
    v35 = v34 + -3.0;
    v36 = v34 + -3.0 + -3.0;
  }
  else
  {
    -[HUNaturalLightColorSwatchView selectedCircleGradientLayer](self, "selectedCircleGradientLayer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", 1);

    -[HUNaturalLightColorSwatchView selectedCircleInnerLayer](self, "selectedCircleInnerLayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setHidden:", 1);

    v34 = v27 * 0.5;
    v35 = v34 + -3.0;
    v36 = v34;
  }
  v39 = v31 * 0.5;
  v40 = v29 * 0.5;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v40, v39, v36, 0.0, 6.28318531);
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v42 = objc_msgSend(v41, "CGPath");
  -[HUNaturalLightColorSwatchView circleMaskLayer](self, "circleMaskLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setPath:", v42);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v40, v39, v34 + -1.5, 0.0, 6.28318531);
  v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v45 = objc_msgSend(v44, "CGPath");
  -[HUNaturalLightColorSwatchView selectedCircleMaskLayer](self, "selectedCircleMaskLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setPath:", v45);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v40, v39, v35, 0.0, 6.28318531);
  v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v48 = objc_msgSend(v47, "CGPath");
  -[HUNaturalLightColorSwatchView selectedCircleInnerLayer](self, "selectedCircleInnerLayer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setPath:", v48);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v40, v39, v34, 0.0, 6.28318531);
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v51 = objc_msgSend(v50, "CGPath");
  -[HUNaturalLightColorSwatchView circleOuterLayer](self, "circleOuterLayer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPath:", v51);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUNaturalLightColorSwatchView;
  -[HUNaturalLightColorSwatchView layoutSubviews](&v3, sel_layoutSubviews);
  -[HUNaturalLightColorSwatchView _updateLayout](self, "_updateLayout");
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("path")) & 1) != 0
    || (objc_msgSend(v4, "hasPrefix:", CFSTR("fillColor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUNaturalLightColorSwatchView;
    v5 = -[HUNaturalLightColorSwatchView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

+ (id)_createGradientLayer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.859, 0.824, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.918, 0.918, 0.918, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.878, 0.663, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.651, 0.651, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v2);
  v13[0] = objc_msgSend(v6, "CGColor");
  v7 = objc_retainAutorelease(v3);
  v13[1] = objc_msgSend(v7, "CGColor");
  v8 = objc_retainAutorelease(v4);
  v13[2] = objc_msgSend(v8, "CGColor");
  v9 = objc_retainAutorelease(v5);
  v13[3] = objc_msgSend(v9, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0CD2790]);
  objc_msgSend(v11, "setColors:", v10);
  objc_msgSend(v11, "setLocations:", &unk_1E70429C0);
  objc_msgSend(v11, "setStartPoint:", 0.0, 0.0);
  objc_msgSend(v11, "setEndPoint:", 1.0, 1.0);

  return v11;
}

- (id)_buildMaskFromImage:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  void *v9;
  void *v10;
  CGSize v12;
  CGRect v13;
  CGRect v14;

  v4 = a3;
  -[HUNaturalLightColorSwatchView bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  if (CGRectIsEmpty(v13))
  {
    v9 = 0;
  }
  else
  {
    v12.width = width;
    v12.height = height;
    UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
    objc_msgSend(v4, "drawInRect:", 14.0, 14.0, width + -28.0, height + -28.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFill");

    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    UIRectFillUsingBlendMode(v14, kCGBlendModeSourceOut);
    UIGraphicsGetImageFromCurrentImageContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v9;
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (CAShapeLayer)circleMaskLayer
{
  return self->_circleMaskLayer;
}

- (void)setCircleMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleMaskLayer, a3);
}

- (CAGradientLayer)circleGradientLayer
{
  return self->_circleGradientLayer;
}

- (void)setCircleGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleGradientLayer, a3);
}

- (CAShapeLayer)selectedCircleMaskLayer
{
  return self->_selectedCircleMaskLayer;
}

- (void)setSelectedCircleMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCircleMaskLayer, a3);
}

- (CAGradientLayer)selectedCircleGradientLayer
{
  return self->_selectedCircleGradientLayer;
}

- (void)setSelectedCircleGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCircleGradientLayer, a3);
}

- (CAShapeLayer)selectedCircleInnerLayer
{
  return self->_selectedCircleInnerLayer;
}

- (void)setSelectedCircleInnerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCircleInnerLayer, a3);
}

- (CAShapeLayer)circleOuterLayer
{
  return self->_circleOuterLayer;
}

- (void)setCircleOuterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleOuterLayer, a3);
}

- (UIImage)truetoneIcon
{
  return self->_truetoneIcon;
}

- (void)setTruetoneIcon:(id)a3
{
  objc_storeStrong((id *)&self->_truetoneIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truetoneIcon, 0);
  objc_storeStrong((id *)&self->_circleOuterLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleInnerLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleGradientLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleMaskLayer, 0);
  objc_storeStrong((id *)&self->_circleGradientLayer, 0);
  objc_storeStrong((id *)&self->_circleMaskLayer, 0);
}

@end
