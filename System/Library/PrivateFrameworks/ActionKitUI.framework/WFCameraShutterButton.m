@implementation WFCameraShutterButton

- (WFCameraShutterButton)initWithFrame:(CGRect)a3
{
  WFCameraShutterButton *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFCameraShutterButton;
  v3 = -[WFCameraShutterButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFillRule:", *MEMORY[0x24BDE5988]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setFillColor:", objc_msgSend(v5, "CGColor"));

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

    -[WFCameraShutterButton layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v4);

    -[WFCameraShutterButton setOutlineLayer:](v3, "setOutlineLayer:", v4);
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

    -[WFCameraShutterButton layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v8);

    -[WFCameraShutterButton setButtonLayer:](v3, "setButtonLayer:", v8);
    LODWORD(v12) = 1144750080;
    -[WFCameraShutterButton setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1144750080;
    -[WFCameraShutterButton setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    LODWORD(v14) = 1144750080;
    -[WFCameraShutterButton setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 0, v14);
    LODWORD(v15) = 1144750080;
    -[WFCameraShutterButton setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v15);

  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double MidX;
  double MidY;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v20.receiver = self;
  v20.super_class = (Class)WFCameraShutterButton;
  -[WFCameraShutterButton layoutSubviews](&v20, sel_layoutSubviews);
  -[WFCameraShutterButton bounds](self, "bounds");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  v7 = CGRectGetHeight(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v8 = CGRectGetWidth(v22);
  if (v7 < v8)
    v8 = v7;
  v9 = v8 * 0.5;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MidY = CGRectGetMidY(v24);
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9, 0.0, 6.28318531);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9 + -6.0, 0.0, 6.28318531);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendPath:", v13);

  v14 = objc_retainAutorelease(v12);
  v15 = objc_msgSend(v14, "CGPath");
  -[WFCameraShutterButton outlineLayer](self, "outlineLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPath:", v15);

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9 + -6.0 + -2.0, 0.0, 6.28318531);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "CGPath");
  -[WFCameraShutterButton buttonLayer](self, "buttonLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPath:", v18);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 66.0;
  v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFCameraShutterButton;
  -[WFCameraShutterButton setHighlighted:](&v8, sel_setHighlighted_);
  if (v3)
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.600000024, 1.0);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  -[WFCameraShutterButton buttonLayer](self, "buttonLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFillColor:", v6);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF00];
}

- (id)accessibilityLabel
{
  return WFLocalizedString(CFSTR("Take picture"));
}

- (CAShapeLayer)outlineLayer
{
  return (CAShapeLayer *)objc_loadWeakRetained((id *)&self->_outlineLayer);
}

- (void)setOutlineLayer:(id)a3
{
  objc_storeWeak((id *)&self->_outlineLayer, a3);
}

- (CAShapeLayer)buttonLayer
{
  return (CAShapeLayer *)objc_loadWeakRetained((id *)&self->_buttonLayer);
}

- (void)setButtonLayer:(id)a3
{
  objc_storeWeak((id *)&self->_buttonLayer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buttonLayer);
  objc_destroyWeak((id *)&self->_outlineLayer);
}

@end
