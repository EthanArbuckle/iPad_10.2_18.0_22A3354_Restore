@implementation CKVideoCancelActionMenuItemView

- (CKVideoCancelActionMenuItemView)initWithFrame:(CGRect)a3
{
  CKVideoCancelActionMenuItemView *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKVideoCancelActionMenuItemView;
  v3 = -[CKVideoCancelActionMenuItemView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithEffect:", v5);

    -[CKVideoCancelActionMenuItemView setBlurView:](v3, "setBlurView:", v6);
    -[CKVideoCancelActionMenuItemView addSubview:](v3, "addSubview:", v6);
    v7 = objc_alloc(MEMORY[0x1E0CEA658]);
    if (CKVideoCancelActionMenuItemViewMask_once != -1)
      dispatch_once(&CKVideoCancelActionMenuItemViewMask_once, &__block_literal_global_220);
    v8 = (void *)objc_msgSend(v7, "initWithImage:", CKVideoCancelActionMenuItemViewMask_sMask);
    -[CKVideoCancelActionMenuItemView setMaskView:](v3, "setMaskView:", v8);
    objc_msgSend(v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMask:", v10);

    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("ActionMenuCancelGlyph"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v12);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v14);

    -[CKVideoCancelActionMenuItemView setXView:](v3, "setXView:", v13);
    -[CKVideoCancelActionMenuItemView addSubview:](v3, "addSubview:", v13);

  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 36.0;
  v4 = 36.0;
  result.height = v4;
  result.width = v3;
  return result;
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
  void *v12;
  void *v13;
  double MidX;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)CKVideoCancelActionMenuItemView;
  -[CKVideoCancelActionMenuItemView layoutSubviews](&v15, sel_layoutSubviews);
  -[CKVideoCancelActionMenuItemView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKVideoCancelActionMenuItemView blurView](self, "blurView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CKVideoCancelActionMenuItemView maskView](self, "maskView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  -[CKVideoCancelActionMenuItemView xView](self, "xView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  objc_msgSend(v13, "setCenter:", MidX, CGRectGetMidY(v17));

}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  if (self->_highlighted != a3)
  {
    v4 = a4;
    self->_highlighted = a3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CKVideoCancelActionMenuItemView_setHighlighted_animated___block_invoke;
    v7[3] = &unk_1E274CA88;
    v8 = a3;
    v7[4] = self;
    v5 = _Block_copy(v7);
    v6 = v5;
    if (v4)
      +[CKActionMenuItem animate:completion:](CKActionMenuItem, "animate:completion:", v5, 0);
    else
      (*((void (**)(void *))v5 + 2))(v5);

  }
}

void __59__CKVideoCancelActionMenuItemView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  if (*(_BYTE *)(a1 + 40))
    v2 = 0.4;
  else
    v2 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "xView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v2);

}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIImageView)maskView
{
  return self->_maskView;
}

- (void)setMaskView:(id)a3
{
  objc_storeStrong((id *)&self->_maskView, a3);
}

- (UIImageView)xView
{
  return self->_xView;
}

- (void)setXView:(id)a3
{
  objc_storeStrong((id *)&self->_xView, a3);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
