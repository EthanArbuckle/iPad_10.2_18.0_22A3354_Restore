@implementation PKPaletteToolPickerClippingEdgeView

- (PKPaletteToolPickerClippingEdgeView)init
{
  PKPaletteToolPickerClippingEdgeView *v2;
  PKPaletteToolPickerClippingEdgeView *v3;
  CAGradientLayer *v4;
  CAGradientLayer *gradientLayer;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaletteToolPickerClippingEdgeView;
  v2 = -[PKPaletteToolPickerClippingEdgeView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PKPaletteToolPickerClippingEdgeView setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 0);
    v3->_axis = 0;
    v4 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = v4;

    -[CAGradientLayer setGeometryFlipped:](v3->_gradientLayer, "setGeometryFlipped:", 1);
    -[PKPaletteToolPickerClippingEdgeView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSublayer:atIndex:", v3->_gradientLayer, 0);

    -[PKPaletteToolPickerClippingEdgeView _updateUI]((uint64_t)v3);
  }
  return v3;
}

- (void)_updateUI
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CATransform3D v15;
  CATransform3D v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0.5;
    objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "colorWithAlphaComponent:", 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_retainAutorelease(v4);
    v17[0] = objc_msgSend(v6, "CGColor");
    v7 = objc_retainAutorelease(v5);
    v17[1] = objc_msgSend(v7, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 416), "setColors:", v8);

    v9 = *(_QWORD *)(a1 + 432);
    v10 = 0.75;
    if (v9)
      v11 = 0.75;
    else
      v11 = 0.5;
    if (v9)
    {
      v10 = 0.5;
      v12 = 0.5;
    }
    else
    {
      v12 = 1.0;
    }
    if (v9)
      v3 = 1.0;
    objc_msgSend(*(id *)(a1 + 416), "setStartPoint:", v11, v10);
    objc_msgSend(*(id *)(a1 + 416), "setEndPoint:", v3, v12);
    v13 = -1.0;
    if (!*(_BYTE *)(a1 + 424))
      v13 = 1.0;
    CATransform3DMakeScale(&v16, v13, 1.0, 1.0);
    v14 = *(void **)(a1 + 416);
    v15 = v16;
    objc_msgSend(v14, "setTransform:", &v15);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteToolPickerClippingEdgeView;
  -[PKPaletteToolPickerClippingEdgeView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaletteToolPickerClippingEdgeView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
