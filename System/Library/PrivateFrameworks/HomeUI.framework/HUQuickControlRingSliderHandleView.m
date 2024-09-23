@implementation HUQuickControlRingSliderHandleView

- (HUQuickControlRingSliderHandleView)initWithFrame:(CGRect)a3 style:(unint64_t)a4
{
  HUQuickControlRingSliderHandleView *v5;
  HUQuickControlRingSliderHandleView *v6;
  void *v7;
  uint64_t v8;
  UIView *lineView;
  void *v10;
  void *v11;
  void *v12;
  CAShapeLayer *v13;
  CAShapeLayer *circleLayer;
  id v15;
  id v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlRingSliderHandleView;
  v5 = -[HUQuickControlRingSliderHandleView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[HUQuickControlRingSliderHandleView setClipsToBounds:](v5, "setClipsToBounds:", 0);
    -[HUQuickControlRingSliderHandleView layer](v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 0);

    v6->_handleViewStyle = a4;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 4.0, 19.0);
    lineView = v6->_lineView;
    v6->_lineView = (UIView *)v8;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6->_lineView, "setBackgroundColor:", v10);

    -[UIView layer](v6->_lineView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 2.0);

    -[UIView layer](v6->_lineView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 1);

    -[HUQuickControlRingSliderHandleView addSubview:](v6, "addSubview:", v6->_lineView);
    v13 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    circleLayer = v6->_circleLayer;
    v6->_circleLayer = v13;

    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v6->_circleLayer, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayTintColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v6->_circleLayer, "setFillColor:", objc_msgSend(v16, "CGColor"));

    -[HUQuickControlRingSliderHandleView layer](v6, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSublayer:", v6->_circleLayer);

    -[HUQuickControlRingSliderHandleView _updateCircleLayer](v6, "_updateCircleLayer");
  }
  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlRingSliderHandleView;
  -[HUQuickControlRingSliderHandleView layoutSubviews](&v10, sel_layoutSubviews);
  -[HUQuickControlRingSliderHandleView lineView](self, "lineView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[HUQuickControlRingSliderHandleView handleViewStyle](self, "handleViewStyle") != 2);

  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", -[HUQuickControlRingSliderHandleView handleViewStyle](self, "handleViewStyle") != 1);

  -[HUQuickControlRingSliderHandleView _updateCircleLayer](self, "_updateCircleLayer");
  -[HUQuickControlRingSliderHandleView bounds](self, "bounds");
  v6 = v5 * 0.5;
  -[HUQuickControlRingSliderHandleView bounds](self, "bounds");
  v8 = v7 * 0.5;
  -[HUQuickControlRingSliderHandleView lineView](self, "lineView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCenter:", v6, v8);

}

- (void)_setColor:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillColor:", v4);

}

- (double)outerRadius
{
  double v3;
  double v4;
  double v5;
  unint64_t v6;
  double result;

  -[HUQuickControlRingSliderHandleView frame](self, "frame");
  v4 = v3;
  -[HUQuickControlRingSliderHandleView frame](self, "frame");
  if (v4 >= v5)
    v4 = v5;
  v6 = -[HUQuickControlRingSliderHandleView handleViewStyle](self, "handleViewStyle");
  if (!v6)
    return 0.0;
  result = v4 * 0.5;
  if (v6 == 1)
    return result + result / 3.0 * 0.5;
  return result;
}

- (void)_updateCircleLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;

  -[HUQuickControlRingSliderHandleView frame](self, "frame");
  v4 = v3;
  -[HUQuickControlRingSliderHandleView frame](self, "frame");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6 * 0.5;
  -[HUQuickControlRingSliderHandleView frame](self, "frame");
  v9 = v8 * 0.5;
  -[HUQuickControlRingSliderHandleView frame](self, "frame");
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v9, v10 * 0.5, v7, 0.0, 6.28318531);
  v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v23, "CGPath");
  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPath:", v11);

  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineWidth:", v7 / 5.0);

  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fillColor");
  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStrokeColor:", v15);

  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowRadius:", v7 * 0.5);

  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1053609165;
  objc_msgSend(v18, "setShadowOpacity:", v19);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = objc_msgSend(v20, "CGColor");
  -[HUQuickControlRingSliderHandleView circleLayer](self, "circleLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setShadowColor:", v21);

}

- (unint64_t)handleViewStyle
{
  return self->_handleViewStyle;
}

- (void)setHandleViewStyle:(unint64_t)a3
{
  self->_handleViewStyle = a3;
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void)setLineView:(id)a3
{
  objc_storeStrong((id *)&self->_lineView, a3);
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_lineView, 0);
}

@end
