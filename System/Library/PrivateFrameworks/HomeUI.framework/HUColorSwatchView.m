@implementation HUColorSwatchView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (HUColorSwatchView)initWithFrame:(CGRect)a3
{
  return -[HUColorSwatchView initWithFrame:text:](self, "initWithFrame:text:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HUColorSwatchView)initWithFrame:(CGRect)a3 text:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  HUColorSwatchView *v11;
  CAShapeLayer *v12;
  CAShapeLayer *circleLayer;
  void *v14;
  id v15;
  void *v16;
  CAShapeLayer *v17;
  CAShapeLayer *selectedCircleLayer;
  void *v19;
  CAShapeLayer *v20;
  CAShapeLayer *selectedCircleInnerLayer;
  void *v22;
  id v23;
  id v24;
  void *v25;
  CAShapeLayer *v26;
  CAShapeLayer *selectedCircleOuterLayer;
  void *v28;
  id v29;
  id v30;
  void *v31;
  UILabel *v32;
  UILabel *label;
  void *v34;
  void *v35;
  objc_super v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v37.receiver = self;
  v37.super_class = (Class)HUColorSwatchView;
  v11 = -[HUColorSwatchView initWithFrame:](&v37, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    circleLayer = v11->_circleLayer;
    v11->_circleLayer = v12;

    -[CAShapeLayer setFillRule:](v11->_circleLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    -[CAShapeLayer setLineWidth:](v11->_circleLayer, "setLineWidth:", 0.5);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "colorWithAlphaComponent:", 0.1);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v11->_circleLayer, "setStrokeColor:", objc_msgSend(v15, "CGColor"));

    -[HUColorSwatchView layer](v11, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v11->_circleLayer);

    v17 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    selectedCircleLayer = v11->_selectedCircleLayer;
    v11->_selectedCircleLayer = v17;

    -[HUColorSwatchView layer](v11, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", v11->_selectedCircleLayer);

    v20 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    selectedCircleInnerLayer = v11->_selectedCircleInnerLayer;
    v11->_selectedCircleInnerLayer = v20;

    -[CAShapeLayer setLineWidth:](v11->_selectedCircleInnerLayer, "setLineWidth:", 0.3);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "colorWithAlphaComponent:", 0.1);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v11->_selectedCircleInnerLayer, "setStrokeColor:", objc_msgSend(v23, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v11->_selectedCircleInnerLayer, "setFillColor:", objc_msgSend(v24, "CGColor"));

    -[HUColorSwatchView layer](v11, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", v11->_selectedCircleInnerLayer);

    v26 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    selectedCircleOuterLayer = v11->_selectedCircleOuterLayer;
    v11->_selectedCircleOuterLayer = v26;

    -[CAShapeLayer setLineWidth:](v11->_selectedCircleOuterLayer, "setLineWidth:", 0.3);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "colorWithAlphaComponent:", 0.1);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setStrokeColor:](v11->_selectedCircleOuterLayer, "setStrokeColor:", objc_msgSend(v29, "CGColor"));

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v11->_selectedCircleOuterLayer, "setFillColor:", objc_msgSend(v30, "CGColor"));

    -[HUColorSwatchView layer](v11, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSublayer:", v11->_selectedCircleOuterLayer);

    objc_storeStrong((id *)&v11->_text, a4);
    v32 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    label = v11->_label;
    v11->_label = v32;

    -[UILabel setText:](v11->_label, "setText:", v10);
    -[UILabel setTextAlignment:](v11->_label, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v11->_label, "setTextColor:", v34);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 11.0, *MEMORY[0x1E0CEB5F8]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v11->_label, "setFont:", v35);

    -[UILabel setAdjustsFontSizeToFitWidth:](v11->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v11->_label, "setMinimumScaleFactor:", 0.1);
    -[HUColorSwatchView addSubview:](v11, "addSubview:", v11->_label);
    -[HUColorSwatchView setClipsToBounds:](v11, "setClipsToBounds:", 0);
  }

  return v11;
}

- (void)setText:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_text, a3);
  v5 = a3;
  -[HUColorSwatchView label](self, "label");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

}

- (UIColor)color
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CEA478];
  -[HUColorSwatchView circleLayer](self, "circleLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "fillColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setColor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "CGColor");
  -[HUColorSwatchView circleLayer](self, "circleLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFillColor:", v5);

  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "CGColor");

  -[HUColorSwatchView selectedCircleLayer](self, "selectedCircleLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStrokeColor:", v8);

  -[HUColorSwatchView _updateTextColor](self, "_updateTextColor");
}

- (void)setSelectionState:(unint64_t)a3
{
  if (self->_selectionState != a3)
  {
    self->_selectionState = a3;
    -[HUColorSwatchView _updateLayout](self, "_updateLayout");
    -[HUColorSwatchView _updateTextColor](self, "_updateTextColor");
  }
}

- (void)_updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  id v50;

  -[HUColorSwatchView bounds](self, "bounds");
  v4 = v3;
  -[HUColorSwatchView bounds](self, "bounds");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  -[HUColorSwatchView bounds](self, "bounds");
  v8 = v7;
  -[HUColorSwatchView bounds](self, "bounds");
  v10 = v9;
  if ((-[HUColorSwatchView selectionState](self, "selectionState") & 2) != 0
    || (-[HUColorSwatchView selectionState](self, "selectionState") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "colorWithAlphaComponent:", 0.05);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "CGColor");
    -[HUColorSwatchView circleLayer](self, "circleLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStrokeColor:", v23);

    -[HUColorSwatchView selectedCircleLayer](self, "selectedCircleLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 0);

    -[HUColorSwatchView selectedCircleInnerLayer](self, "selectedCircleInnerLayer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", 0);

    -[HUColorSwatchView selectedCircleOuterLayer](self, "selectedCircleOuterLayer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setHidden:", 0);

    v18 = v6 * 0.5;
    v19 = v18 + -3.0;
    v20 = v18 + -3.0 + -3.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorWithAlphaComponent:", 0.1);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    -[HUColorSwatchView circleLayer](self, "circleLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setStrokeColor:", v13);

    -[HUColorSwatchView selectedCircleLayer](self, "selectedCircleLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

    -[HUColorSwatchView selectedCircleInnerLayer](self, "selectedCircleInnerLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);

    -[HUColorSwatchView selectedCircleOuterLayer](self, "selectedCircleOuterLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 1);

    v18 = v6 * 0.5;
    v19 = v18 + -3.0;
    v20 = v18;
  }
  v28 = v10 * 0.5;
  v29 = v8 * 0.5;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v28, v20, 0.0, 6.28318531);
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = objc_msgSend(v50, "CGPath");
  -[HUColorSwatchView circleLayer](self, "circleLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPath:", v30);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v28, v18 + -1.5, 0.0, 6.28318531);
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v33 = objc_msgSend(v32, "CGPath");
  -[HUColorSwatchView selectedCircleLayer](self, "selectedCircleLayer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setPath:", v33);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36 = objc_msgSend(v35, "CGColor");
  -[HUColorSwatchView selectedCircleLayer](self, "selectedCircleLayer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setFillColor:", v36);

  -[HUColorSwatchView selectedCircleLayer](self, "selectedCircleLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setLineWidth:", 3.0);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v28, v19, 0.0, 6.28318531);
  v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v40 = objc_msgSend(v39, "CGPath");
  -[HUColorSwatchView selectedCircleInnerLayer](self, "selectedCircleInnerLayer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPath:", v40);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v28, v18, 0.0, 6.28318531);
  v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v43 = objc_msgSend(v42, "CGPath");
  -[HUColorSwatchView selectedCircleOuterLayer](self, "selectedCircleOuterLayer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPath:", v43);

  -[HUColorSwatchView frame](self, "frame");
  v46 = v45 + -18.0;
  -[HUColorSwatchView frame](self, "frame");
  v48 = v47 + -18.0;
  -[HUColorSwatchView label](self, "label");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", 9.0, 9.0, v46, v48);

}

- (void)_updateTextColor
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[HUColorSwatchView color](self, "color");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (HUIsLightColor(v8))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUColorSwatchView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == 1)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v3;
  -[HUColorSwatchView label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextColor:", v6);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUColorSwatchView;
  -[HUColorSwatchView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HUColorSwatchView _updateTextColor](self, "_updateTextColor");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUColorSwatchView;
  -[HUColorSwatchView layoutSubviews](&v3, sel_layoutSubviews);
  -[HUColorSwatchView _updateLayout](self, "_updateLayout");
  -[HUColorSwatchView _updateTextColor](self, "_updateTextColor");
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
    v7.super_class = (Class)HUColorSwatchView;
    v5 = -[HUColorSwatchView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)setLabelHidden:(BOOL)a3
{
  void *v5;

  self->_labelHidden = a3;
  -[HUColorSwatchView label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", self->_labelHidden);

  if (!a3)
    -[HUColorSwatchView _updateTextColor](self, "_updateTextColor");
}

- (unint64_t)selectionState
{
  return self->_selectionState;
}

- (BOOL)labelHidden
{
  return self->_labelHidden;
}

- (NSString)text
{
  return self->_text;
}

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleLayer, a3);
}

- (CAShapeLayer)selectedCircleLayer
{
  return self->_selectedCircleLayer;
}

- (void)setSelectedCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCircleLayer, a3);
}

- (CAShapeLayer)selectedCircleInnerLayer
{
  return self->_selectedCircleInnerLayer;
}

- (void)setSelectedCircleInnerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCircleInnerLayer, a3);
}

- (CAShapeLayer)selectedCircleOuterLayer
{
  return self->_selectedCircleOuterLayer;
}

- (void)setSelectedCircleOuterLayer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCircleOuterLayer, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_selectedCircleOuterLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleInnerLayer, 0);
  objc_storeStrong((id *)&self->_selectedCircleLayer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
