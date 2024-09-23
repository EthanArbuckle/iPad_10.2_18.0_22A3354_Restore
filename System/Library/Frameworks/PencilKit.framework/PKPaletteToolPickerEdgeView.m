@implementation PKPaletteToolPickerEdgeView

- (PKPaletteToolPickerEdgeView)init
{
  PKPaletteToolPickerEdgeView *v2;
  PKPaletteToolPickerEdgeView *v3;
  CAGradientLayer *v4;
  CAGradientLayer *gradientLayer;
  void *v6;
  CAGradientLayer *v7;
  CAGradientLayer *maskLayer;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPaletteToolPickerEdgeView;
  v2 = -[PKPaletteToolPickerEdgeView init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_axis = 0;
    v2->_flipHorizontally = 0;
    v4 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = v4;

    -[CAGradientLayer setGeometryFlipped:](v3->_gradientLayer, "setGeometryFlipped:", 1);
    -[PKPaletteToolPickerEdgeView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertSublayer:atIndex:", v3->_gradientLayer, 0);

    v7 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E0CD2790]);
    maskLayer = v3->_maskLayer;
    v3->_maskLayer = v7;

    -[CAGradientLayer setGeometryFlipped:](v3->_maskLayer, "setGeometryFlipped:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "colorWithAlphaComponent:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_retainAutorelease(v10);
    v17[0] = objc_msgSend(v12, "CGColor");
    v13 = objc_retainAutorelease(v11);
    v17[1] = objc_msgSend(v13, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setColors:](v3->_maskLayer, "setColors:", v14);

    -[CAGradientLayer setMask:](v3->_gradientLayer, "setMask:", v3->_maskLayer);
    -[PKPaletteToolPickerEdgeView _updateUI]((uint64_t)v3);

  }
  return v3;
}

- (void)_updateUI
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  CATransform3D v24;
  CATransform3D v25;
  CATransform3D v26;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;
  CATransform3D v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceStyle") == 2;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", dbl_1BE4FCCC0[v3]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "colorWithAlphaComponent:", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_retainAutorelease(v5);
    v31[0] = objc_msgSend(v7, "CGColor");
    v8 = objc_retainAutorelease(v6);
    v31[1] = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 416), "setColors:", v9);

    v10 = *(_QWORD *)(a1 + 440);
    if (v10)
      v11 = 1.0;
    else
      v11 = 0.0;
    if (v10)
      v12 = 0.0;
    else
      v12 = 1.0;
    if (v10)
      v13 = 1.0;
    else
      v13 = 0.5;
    if (v10)
      v14 = 0.5;
    else
      v14 = 1.0;
    if (v10)
      v15 = 0.5;
    else
      v15 = 0.75;
    if (v10)
      v16 = 0.75;
    else
      v16 = 0.5;
    objc_msgSend(*(id *)(a1 + 416), "setStartPoint:", v11, v12);
    objc_msgSend(*(id *)(a1 + 416), "setEndPoint:", v14, v13);
    objc_msgSend(*(id *)(a1 + 424), "setStartPoint:", v16, v15);
    objc_msgSend(*(id *)(a1 + 424), "setEndPoint:", v13, v14);
    v17 = -1.0;
    if (!*(_BYTE *)(a1 + 432))
      v17 = 1.0;
    CATransform3DMakeScale(&v30, v17, 1.0, 1.0);
    v18 = *(void **)(a1 + 416);
    v29 = v30;
    objc_msgSend(v18, "setTransform:", &v29);
    v19 = *(void **)(a1 + 416);
    if (v19)
      objc_msgSend(v19, "transform");
    else
      memset(&v27, 0, sizeof(v27));
    if (*(_BYTE *)(a1 + 433))
      v20 = 1.0;
    else
      v20 = -1.0;
    CATransform3DScale(&v28, &v27, 1.0, v20, 1.0);
    v21 = *(void **)(a1 + 416);
    v26 = v28;
    objc_msgSend(v21, "setTransform:", &v26);
    if (v10 == 1)
      v22 = -1.0;
    else
      v22 = 1.0;
    CATransform3DMakeScale(&v25, v22, 1.0, 1.0);
    v23 = *(void **)(a1 + 424);
    v24 = v25;
    objc_msgSend(v23, "setTransform:", &v24);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaletteToolPickerEdgeView;
  -[PKPaletteToolPickerEdgeView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPaletteToolPickerEdgeView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  -[PKPaletteToolPickerEdgeView bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_maskLayer, "setFrame:");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaletteToolPickerEdgeView;
  v4 = a3;
  -[PKPaletteToolPickerEdgeView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[PKPaletteToolPickerEdgeView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[PKPaletteToolPickerEdgeView _updateUI]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
