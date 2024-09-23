@implementation WFContentCoercionNodeView

- (WFContentCoercionNodeView)initWithFrame:(CGRect)a3 isRootNode:(BOOL)a4
{
  double height;
  WFContentCoercionNodeView *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  v20.receiver = self;
  v20.super_class = (Class)WFContentCoercionNodeView;
  v6 = -[WFContentCoercionNodeView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentCoercionNodeView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentCoercionNodeView layer](v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMask:", v8);

    v10 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v10, "setNumberOfLines:", 2);
    objc_msgSend(v10, "setLineBreakMode:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    v12 = 12.0;
    if (height >= 100.0)
      v12 = 17.0;
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v13);

    objc_msgSend(v10, "setTextAlignment:", 1);
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v14);

      -[WFContentCoercionNodeView addSubview:](v6, "addSubview:", v10);
      objc_storeWeak((id *)&v6->_nameLabel, v10);
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentCoercionNodeView setBackgroundColor:](v6, "setBackgroundColor:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v16);

      -[WFContentCoercionNodeView addSubview:](v6, "addSubview:", v10);
      objc_storeWeak((id *)&v6->_nameLabel, v10);
      objc_msgSend(MEMORY[0x24BDE5758], "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "setFillColor:", objc_msgSend(v17, "CGColor"));

      objc_msgSend(v15, "setLineWidth:", 3.0);
      -[WFContentCoercionNodeView layer](v6, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSublayer:", v15);

      objc_storeWeak((id *)&v6->_outlineLayer, v15);
    }

    -[WFContentCoercionNodeView updateColors](v6, "updateColors");
  }
  return v6;
}

- (void)layoutSubviews
{
  CGPath *Mutable;
  CGFloat MidX;
  CGFloat MidY;
  double Width;
  double Height;
  void *v8;
  void *v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v20.receiver = self;
  v20.super_class = (Class)WFContentCoercionNodeView;
  -[WFContentCoercionNodeView layoutSubviews](&v20, sel_layoutSubviews);
  Mutable = CGPathCreateMutable();
  -[WFContentCoercionNodeView bounds](self, "bounds");
  MidX = CGRectGetMidX(v21);
  -[WFContentCoercionNodeView bounds](self, "bounds");
  MidY = CGRectGetMidY(v22);
  -[WFContentCoercionNodeView bounds](self, "bounds");
  Width = CGRectGetWidth(v23);
  -[WFContentCoercionNodeView bounds](self, "bounds");
  Height = CGRectGetHeight(v24);
  if (Width < Height)
    Height = Width;
  CGPathAddArc(Mutable, 0, MidX, MidY, Height * 0.5, 0.0, 6.28318531, 1);
  -[WFContentCoercionNodeView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPath:", Mutable);

  WeakRetained = objc_loadWeakRetained((id *)&self->_outlineLayer);
  objc_msgSend(WeakRetained, "setPath:", Mutable);

  CGPathRelease(Mutable);
  -[WFContentCoercionNodeView bounds](self, "bounds");
  v12 = v11 + 5.0;
  v14 = v13 + 5.0;
  v16 = v15 + -10.0;
  v18 = v17 + -10.0;
  v19 = objc_loadWeakRetained((id *)&self->_nameLabel);
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

}

- (void)updateColors
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v5, "CGColor");
  -[WFContentCoercionNodeView outlineLayer](self, "outlineLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStrokeColor:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFContentCoercionNodeView;
  v4 = a3;
  -[WFContentCoercionNodeView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[WFContentCoercionNodeView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[WFContentCoercionNodeView updateColors](self, "updateColors");
}

- (void)setNode:(id)a3
{
  id v5;
  void *v6;
  id WeakRetained;
  id v8;

  objc_storeStrong((id *)&self->_node, a3);
  v5 = a3;
  objc_msgSend(v5, "itemOrItemClass");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "localizedTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_nameLabel);
  objc_msgSend(WeakRetained, "setText:", v6);

}

- (WFContentCoercionNode)node
{
  return self->_node;
}

- (CAShapeLayer)outlineLayer
{
  return (CAShapeLayer *)objc_loadWeakRetained((id *)&self->_outlineLayer);
}

- (void)setOutlineLayer:(id)a3
{
  objc_storeWeak((id *)&self->_outlineLayer, a3);
}

- (UILabel)nameLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_nameLabel);
}

- (void)setNameLabel:(id)a3
{
  objc_storeWeak((id *)&self->_nameLabel, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nameLabel);
  objc_destroyWeak((id *)&self->_outlineLayer);
  objc_storeStrong((id *)&self->_node, 0);
}

@end
