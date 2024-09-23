@implementation NTKUpNextStatusBarDynamicUnderlay

- (NTKUpNextStatusBarDynamicUnderlay)initWithFrame:(CGRect)a3
{
  NTKUpNextStatusBarDynamicUnderlay *v3;
  NTKUpNextStatusBarDynamicUnderlay *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKUpNextStatusBarDynamicUnderlay;
  v3 = -[NTKUpNextStatusBarDynamicUnderlay initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NTKUpNextStatusBarDynamicUnderlay updateBackgroundColor](v3, "updateBackgroundColor");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_updateBackgroundColor, *MEMORY[0x1E0DC45B8], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextStatusBarDynamicUnderlay;
  -[NTKUpNextStatusBarDynamicUnderlay dealloc](&v4, sel_dealloc);
}

- (void)updateBackgroundColor
{
  id v3;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *overlayView;
  UIView *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  else
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 20.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectSaturate:", 0.7, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0DC3660], "colorEffectBrightness:", -0.25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView setBackgroundEffects:](v4, "setBackgroundEffects:", v9);
  }
  overlayView = self->_overlayView;
  self->_overlayView = v4;
  v11 = v4;

  -[NTKUpNextStatusBarDynamicUnderlay addSubview:](self, "addSubview:", v11);
  -[NTKUpNextStatusBarDynamicUnderlay setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double Width;
  _BYTE v8[240];
  double v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;

  v10.receiver = self;
  v10.super_class = (Class)NTKUpNextStatusBarDynamicUnderlay;
  -[NTKUpNextStatusBarDynamicUnderlay layoutSubviews](&v10, sel_layoutSubviews);
  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _LayoutConstants_0(v4, v8);
  v5 = v9;
  v6 = -v9;
  -[NTKUpNextStatusBarDynamicUnderlay bounds](self, "bounds");
  Width = CGRectGetWidth(v11);
  -[NTKUpNextStatusBarDynamicUnderlay bounds](self, "bounds");
  -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, v6, Width, v5 + CGRectGetHeight(v12) + 1.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
