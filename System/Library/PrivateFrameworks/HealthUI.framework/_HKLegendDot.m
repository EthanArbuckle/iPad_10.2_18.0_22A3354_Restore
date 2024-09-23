@implementation _HKLegendDot

- (_HKLegendDot)init
{
  _HKLegendDot *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)_HKLegendDot;
  v2 = -[_HKLegendDot initWithFrame:](&v20, sel_initWithFrame_, 0.0, 0.0, 8.0, 8.0);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");

    -[_HKLegendDot layer](v2, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[_HKLegendDot layer](v2, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMasksToBounds:", 1);

    -[_HKLegendDot layer](v2, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 4.0);

    LODWORD(v8) = 1148846080;
    -[_HKLegendDot setContentHuggingPriority:forAxis:](v2, "setContentHuggingPriority:forAxis:", 1, v8);
    LODWORD(v9) = 1148846080;
    -[_HKLegendDot setContentHuggingPriority:forAxis:](v2, "setContentHuggingPriority:forAxis:", 0, v9);
    -[_HKLegendDot setInnerDotColor:](v2, "setInnerDotColor:", 0);
    v10 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[_HKLegendDot setInnerDotLayer:](v2, "setInnerDotLayer:", v10);

    -[_HKLegendDot innerDotLayer](v2, "innerDotLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v4);

    -[_HKLegendDot innerDotLayer](v2, "innerDotLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 1);

    -[_HKLegendDot innerDotLayer](v2, "innerDotLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 2.0);

    -[_HKLegendDot innerDotLayer](v2, "innerDotLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBounds:", 0.0, 0.0, 4.0, 4.0);

    -[_HKLegendDot layer](v2, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKLegendDot innerDotLayer](v2, "innerDotLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v16);

    -[_HKLegendDot layer](v2, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", v2);

    -[_HKLegendDot innerDotLayer](v2, "innerDotLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidden:", 1);

  }
  return v2;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[_HKLegendDot layer](self, "layer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[_HKLegendDot innerDotLayer](self, "innerDotLayer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPosition:", v6 + v10 * 0.5, v8 + v10 * 0.5);

}

- (void)setDotColor:(id)a3
{
  UIColor **p_dotColor;
  id v6;
  uint64_t v7;
  void *v8;

  p_dotColor = &self->_dotColor;
  objc_storeStrong((id *)&self->_dotColor, a3);
  v6 = a3;
  v7 = -[UIColor CGColor](*p_dotColor, "CGColor");

  -[_HKLegendDot layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  -[_HKLegendDot setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setInnerDotColor:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_innerDotColor, a3);
  if (v10)
  {
    v5 = objc_msgSend(objc_retainAutorelease(v10), "CGColor");
    -[_HKLegendDot innerDotLayer](self, "innerDotLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[_HKLegendDot innerDotLayer](self, "innerDotLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  else
  {
    -[_HKLegendDot innerDotLayer](self, "innerDotLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  objc_msgSend(v7, "setHidden:", v9);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 8.0;
  v3 = 8.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)dotColor
{
  return self->_dotColor;
}

- (UIColor)innerDotColor
{
  return self->_innerDotColor;
}

- (CALayer)innerDotLayer
{
  return self->_innerDotLayer;
}

- (void)setInnerDotLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerDotLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerDotLayer, 0);
  objc_storeStrong((id *)&self->_innerDotColor, 0);
  objc_storeStrong((id *)&self->_dotColor, 0);
}

@end
