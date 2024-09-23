@implementation PKPalettePencilInteractionFeedbackView

- (PKPalettePencilInteractionFeedbackView)init
{
  PKPalettePencilInteractionFeedbackView *v2;
  UIView *v3;
  UIView *clippingView;
  uint64_t v5;
  UIView *backgroundView;
  PKPaletteToolPreview *v7;
  PKPaletteToolPreview *toolPreview;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPalettePencilInteractionFeedbackView;
  v2 = -[PKPalettePencilInteractionFeedbackView init](&v10, sel_init);
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    clippingView = v2->_clippingView;
    v2->_clippingView = v3;

    -[UIView setClipsToBounds:](v2->_clippingView, "setClipsToBounds:", 1);
    -[PKPalettePencilInteractionFeedbackView addSubview:](v2, "addSubview:", v2->_clippingView);
    +[PKPaletteView makeBackgroundView](PKPaletteView, "makeBackgroundView");
    v5 = objc_claimAutoreleasedReturnValue();
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = (UIView *)v5;

    if (v2->_backgroundView)
      -[UIView addSubview:](v2->_clippingView, "addSubview:");
    v7 = objc_alloc_init(PKPaletteToolPreview);
    toolPreview = v2->_toolPreview;
    v2->_toolPreview = v7;

    -[UIView addSubview:](v2->_clippingView, "addSubview:", v2->_toolPreview);
  }
  return v2;
}

- (void)_setCornerRadius:(double)a3
{
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPalettePencilInteractionFeedbackView;
  -[PKPalettePencilInteractionFeedbackView _setCornerRadius:](&v7, sel__setCornerRadius_, a3);
  -[PKPalettePencilInteractionFeedbackView _cornerRadius](self, "_cornerRadius");
  v5 = v4;
  -[PKPalettePencilInteractionFeedbackView clippingView](self, "clippingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCornerRadius:", v5);

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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PKPalettePencilInteractionFeedbackView;
  -[PKPalettePencilInteractionFeedbackView layoutSubviews](&v30, sel_layoutSubviews);
  -[PKPalettePencilInteractionFeedbackView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PKPalettePencilInteractionFeedbackView clippingView](self, "clippingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PKPalettePencilInteractionFeedbackView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PKPalettePencilInteractionFeedbackView backgroundView](self, "backgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[PKPalettePencilInteractionFeedbackView bounds](self, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[PKPalettePencilInteractionFeedbackView toolPreview](self, "toolPreview");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

}

- (void)showPreviewForTool:(id)a3 scalingFactor:(double)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a3;
  -[PKPalettePencilInteractionFeedbackView toolPreview](self, "toolPreview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScalingFactor:", a4);

  -[PKPalettePencilInteractionFeedbackView toolPreview](self, "toolPreview");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "showPreviewForTool:animated:", v8, v5);

}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (PKPaletteToolPreview)toolPreview
{
  return self->_toolPreview;
}

- (void)setToolPreview:(id)a3
{
  objc_storeStrong((id *)&self->_toolPreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolPreview, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end
