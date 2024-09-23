@implementation PKColorPickerCrosshairView

- (PKColorPickerCrosshairView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PKColorPickerCrosshairView *v7;
  _PKColorPickerSimpleCrosshairView *v8;
  _PKColorPickerSimpleCrosshairView *baseView;
  void *v10;
  void *v11;
  _PKColorPickerCrosshairCornerMaskView *v12;
  _PKColorPickerCrosshairCornerMaskView *baseMaskView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _PKColorPickerSimpleCrosshairView *v18;
  _PKColorPickerSimpleCrosshairView *cornerEdgeView;
  void *v20;
  void *v21;
  _PKColorPickerCrosshairCornerMaskView *v22;
  _PKColorPickerCrosshairCornerMaskView *cornerEdgeMaskView;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29.receiver = self;
  v29.super_class = (Class)PKColorPickerCrosshairView;
  v7 = -[PKColorPickerCrosshairView initWithFrame:](&v29, sel_initWithFrame_);
  v8 = -[_PKColorPickerSimpleCrosshairView initWithFrame:]([_PKColorPickerSimpleCrosshairView alloc], "initWithFrame:", x, y, width, height);
  baseView = v7->_baseView;
  v7->_baseView = v8;

  -[PKColorPickerCrosshairView baseView](v7, "baseView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderCornerRadius:", 0.0);

  -[PKColorPickerCrosshairView baseView](v7, "baseView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPickerCrosshairView addSubview:](v7, "addSubview:", v11);

  v12 = -[_PKColorPickerCrosshairCornerMaskView initWithFrame:]([_PKColorPickerCrosshairCornerMaskView alloc], "initWithFrame:", x, y, width, height);
  baseMaskView = v7->_baseMaskView;
  v7->_baseMaskView = v12;

  -[PKColorPickerCrosshairView baseMaskView](v7, "baseMaskView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExcludeCorner:", 1);

  -[PKColorPickerCrosshairView baseMaskView](v7, "baseMaskView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerPosition:", 1);

  -[PKColorPickerCrosshairView baseMaskView](v7, "baseMaskView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPickerCrosshairView baseView](v7, "baseView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setMaskView:", v16);

  v18 = -[_PKColorPickerSimpleCrosshairView initWithFrame:]([_PKColorPickerSimpleCrosshairView alloc], "initWithFrame:", x, y, width, height);
  cornerEdgeView = v7->_cornerEdgeView;
  v7->_cornerEdgeView = v18;

  -[PKColorPickerCrosshairView cornerEdgeView](v7, "cornerEdgeView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBorderCornerRadius:", 8.0);

  -[PKColorPickerCrosshairView cornerEdgeView](v7, "cornerEdgeView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPickerCrosshairView addSubview:](v7, "addSubview:", v21);

  v22 = -[_PKColorPickerCrosshairCornerMaskView initWithFrame:]([_PKColorPickerCrosshairCornerMaskView alloc], "initWithFrame:", x, y, width, height);
  cornerEdgeMaskView = v7->_cornerEdgeMaskView;
  v7->_cornerEdgeMaskView = v22;

  -[PKColorPickerCrosshairView cornerEdgeMaskView](v7, "cornerEdgeMaskView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setExcludeCorner:", 0);

  -[PKColorPickerCrosshairView cornerEdgeMaskView](v7, "cornerEdgeMaskView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerPosition:", 1);

  -[PKColorPickerCrosshairView cornerEdgeMaskView](v7, "cornerEdgeMaskView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKColorPickerCrosshairView cornerEdgeView](v7, "cornerEdgeView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setMaskView:", v26);

  -[PKColorPickerCrosshairView setClipsToBounds:](v7, "setClipsToBounds:", 0);
  -[PKColorPickerCrosshairView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  return v7;
}

- (void)setCornerPosition:(unint64_t)a3
{
  void *v5;
  id v6;

  if (self->_cornerPosition != a3)
  {
    self->_cornerPosition = a3;
    -[PKColorPickerCrosshairView baseMaskView](self, "baseMaskView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerPosition:", a3);

    -[PKColorPickerCrosshairView cornerEdgeMaskView](self, "cornerEdgeMaskView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerPosition:", a3);

  }
}

- (void)layoutSubviews
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double x;
  double y;
  double width;
  double height;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v35.receiver = self;
  v35.super_class = (Class)PKColorPickerCrosshairView;
  -[PKColorPickerCrosshairView layoutSubviews](&v35, sel_layoutSubviews);
  -[PKColorPickerCrosshairView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKColorPickerCrosshairView baseView](self, "baseView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PKColorPickerCrosshairView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PKColorPickerCrosshairView cornerEdgeView](self, "cornerEdgeView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[PKColorPickerCrosshairView baseView](self, "baseView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  v37 = CGRectInset(v36, -4.0, -4.0);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  -[PKColorPickerCrosshairView baseMaskView](self, "baseMaskView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", x, y, width, height);

  -[PKColorPickerCrosshairView cornerEdgeView](self, "cornerEdgeView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bounds");
  v39 = CGRectInset(v38, -4.0, -4.0);
  v28 = v39.origin.x;
  v29 = v39.origin.y;
  v30 = v39.size.width;
  v31 = v39.size.height;
  -[PKColorPickerCrosshairView cornerEdgeMaskView](self, "cornerEdgeMaskView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v28, v29, v30, v31);

  -[PKColorPickerCrosshairView delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "cornerPositionForColorPickerCrosshairView:", self);

  -[PKColorPickerCrosshairView setCornerPosition:](self, "setCornerPosition:", v34);
}

- (void)update
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

  -[PKColorPickerCrosshairView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frameForColorPickerCrosshairView:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PKColorPickerCrosshairView setFrame:](self, "setFrame:", v5, v7, v9, v11);
  -[PKColorPickerCrosshairView setNeedsLayout](self, "setNeedsLayout");
  -[PKColorPickerCrosshairView layoutIfNeeded](self, "layoutIfNeeded");
}

- (PKColorPickerCrosshairViewDelegate)delegate
{
  return (PKColorPickerCrosshairViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)cornerPosition
{
  return self->_cornerPosition;
}

- (_PKColorPickerSimpleCrosshairView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
  objc_storeStrong((id *)&self->_baseView, a3);
}

- (_PKColorPickerCrosshairCornerMaskView)baseMaskView
{
  return self->_baseMaskView;
}

- (void)setBaseMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_baseMaskView, a3);
}

- (_PKColorPickerSimpleCrosshairView)cornerEdgeView
{
  return self->_cornerEdgeView;
}

- (void)setCornerEdgeView:(id)a3
{
  objc_storeStrong((id *)&self->_cornerEdgeView, a3);
}

- (_PKColorPickerCrosshairCornerMaskView)cornerEdgeMaskView
{
  return self->_cornerEdgeMaskView;
}

- (void)setCornerEdgeMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_cornerEdgeMaskView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerEdgeMaskView, 0);
  objc_storeStrong((id *)&self->_cornerEdgeView, 0);
  objc_storeStrong((id *)&self->_baseMaskView, 0);
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
