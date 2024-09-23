@implementation DOCTagCheckableDotView

- (DOCTagCheckableDotView)initWithFrame:(CGRect)a3
{
  DOCTagCheckableDotView *v3;
  void *v4;
  DOCTagDotView *v5;
  uint64_t v6;
  DOCTagDotView *tagDotView;
  void *v8;
  CAShapeLayer *v9;
  CAShapeLayer *borderLayer;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)DOCTagCheckableDotView;
  v3 = -[DOCTagCheckableDotView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[DOCTagAppearance makerUI](DOCTagAppearance, "makerUI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [DOCTagDotView alloc];
    v36 = v4;
    objc_msgSend(v4, "rowOfTagsDotSize");
    v6 = -[DOCTagDotView initWithDefaultTagDimension:adjustsSizeForContentSizeCategory:](v5, "initWithDefaultTagDimension:adjustsSizeForContentSizeCategory:", 0);
    tagDotView = v3->_tagDotView;
    v3->_tagDotView = (DOCTagDotView *)v6;

    objc_msgSend(MEMORY[0x24BEBD638], "doc_circleWithInset:", -6.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagDotView setHoverStyle:](v3->_tagDotView, "setHoverStyle:", v8);

    -[DOCTagCheckableDotView setHoverStyle:](v3, "setHoverStyle:", 0);
    v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    borderLayer = v3->_borderLayer;
    v3->_borderLayer = v9;

    -[CAShapeLayer setHidden:](v3->_borderLayer, "setHidden:", 1);
    -[CAShapeLayer setFillColor:](v3->_borderLayer, "setFillColor:", 0);
    objc_msgSend(v4, "rowOfTagsDotSelectionBorderWidth");
    -[CAShapeLayer setLineWidth:](v3->_borderLayer, "setLineWidth:");
    -[DOCTagCheckableDotView updateLayoutOfLayers](v3, "updateLayoutOfLayers");
    -[DOCTagCheckableDotView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagCheckableDotView borderLayer](v3, "borderLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v12);

    -[DOCTagCheckableDotView tagDotView](v3, "tagDotView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagCheckableDotView addSubview:](v3, "addSubview:", v13);

    -[DOCTagCheckableDotView insetForBorderLayer](v3, "insetForBorderLayer");
    v15 = v14;
    v28 = (void *)MEMORY[0x24BDD1628];
    -[DOCTagCheckableDotView topAnchor](v3, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagCheckableDotView tagDotView](v3, "tagDotView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -v15;
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, v16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v32;
    -[DOCTagCheckableDotView tagDotView](v3, "tagDotView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagCheckableDotView bottomAnchor](v3, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v27;
    -[DOCTagCheckableDotView leadingAnchor](v3, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagCheckableDotView tagDotView](v3, "tagDotView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v20;
    -[DOCTagCheckableDotView tagDotView](v3, "tagDotView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCTagCheckableDotView trailingAnchor](v3, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v25);

  }
  return v3;
}

- (double)insetForBorderLayer
{
  double v2;

  -[CAShapeLayer lineWidth](self->_borderLayer, "lineWidth");
  return v2 * 0.5;
}

- (int64_t)tagColor
{
  void *v2;
  void *v3;
  int64_t v4;

  -[DOCTagCheckableDotView tagDotView](self, "tagDotView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "labelIndex");

  return v4;
}

- (void)setTagColor:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE2DF20], "untitledTagForRendering:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[DOCTagCheckableDotView tagDotView](self, "tagDotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItemTag:", v5);

}

- (void)setChecked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_checked != a3)
  {
    v3 = a3;
    self->_checked = a3;
    -[DOCTagCheckableDotView tagDotView](self, "tagDotView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setChecked:", v3);

    -[DOCTagCheckableDotView updateBorderLayerVisibility](self, "updateBorderLayerVisibility");
  }
}

- (void)updateBorderLayerVisibility
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v9;
  id v10;

  v3 = -[DOCTagCheckableDotView tagColor](self, "tagColor");
  -[DOCTagCheckableDotView borderLayer](self, "borderLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineWidth");
  v6 = v5;

  v7 = 1;
  if (-[DOCTagCheckableDotView checked](self, "checked"))
  {
    if (v6 > 0.0 && v3 != 0)
    {
      +[DOCTagRenderer shared](DOCTagRenderer, "shared");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "differentiateWithShapes");

    }
  }
  -[DOCTagCheckableDotView borderLayer](self, "borderLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v7);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DOCTagCheckableDotView;
  -[DOCTagCheckableDotView layoutSubviews](&v11, sel_layoutSubviews);
  +[DOCTagAppearance makerUI](DOCTagAppearance, "makerUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowOfTagsDotSelectionBorderColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "CGColor");
  -[DOCTagCheckableDotView borderLayer](self, "borderLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStrokeColor:", v9);

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCTagCheckableDotView;
  v4 = a3;
  -[DOCTagCheckableDotView layoutSublayersOfLayer:](&v6, sel_layoutSublayersOfLayer_, v4);
  -[DOCTagCheckableDotView layer](self, "layer", v6.receiver, v6.super_class);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[DOCTagCheckableDotView updateLayoutOfLayers](self, "updateLayoutOfLayers");
}

- (void)updateLayoutOfLayers
{
  double v3;
  CGFloat v4;
  double x;
  double y;
  double width;
  double height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  CGRect v21;
  CGRect v22;

  -[DOCTagCheckableDotView insetForBorderLayer](self, "insetForBorderLayer");
  v4 = v3;
  -[DOCTagCheckableDotView bounds](self, "bounds");
  v22 = CGRectInset(v21, v4, v4);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  -[DOCTagCheckableDotView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[DOCTagCheckableDotView borderLayer](self, "borderLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", x, y, width, height);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v20, "CGPath");
  -[DOCTagCheckableDotView borderLayer](self, "borderLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPath:", v18);

}

- (BOOL)checked
{
  return self->_checked;
}

- (DOCTagDotView)tagDotView
{
  return self->_tagDotView;
}

- (CAShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_tagDotView, 0);
}

@end
