@implementation CAMModeIndicatorView

- (CAMModeIndicatorView)initWithFrame:(CGRect)a3
{
  CAMModeIndicatorView *v3;
  void *v4;
  CAMModeDialItem *v5;
  uint64_t v6;
  CAMModeDialItem *modeTextView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImageView *symbolView;
  CAMModeIndicatorView *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CAMModeIndicatorView;
  v3 = -[CAMModeIndicatorView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMModeIndicatorView setTintColor:](v3, "setTintColor:", v4);

    -[CAMModeIndicatorView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = [CAMModeDialItem alloc];
    v6 = -[CAMModeDialItem initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    modeTextView = v3->__modeTextView;
    v3->__modeTextView = (CAMModeDialItem *)v6;

    v8 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageNamed:inBundle:", CFSTR("CAMModeIndicator"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
    symbolView = v3->__symbolView;
    v3->__symbolView = (UIImageView *)v12;

    -[CAMModeIndicatorView addSubview:](v3, "addSubview:", v3->__modeTextView);
    -[CAMModeIndicatorView addSubview:](v3, "addSubview:", v3->__symbolView);
    v14 = v3;

  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGRect recta;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  *(_QWORD *)&recta.origin.y = self;
  *(_QWORD *)&recta.size.width = CAMModeIndicatorView;
  -[CGFloat layoutSubviews]((objc_super *)&recta.origin.y, sel_layoutSubviews);
  -[CAMModeIndicatorView bounds](self, "bounds");
  v4 = v3;
  recta.origin.x = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMModeIndicatorView _modeTextView](self, "_modeTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeIndicatorView _symbolView](self, "_symbolView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v14 = v13;
  v16 = v15;
  v17 = v10 - v15;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  objc_msgSend(v11, "setCenter:", CGRectGetMidX(v26), v17);
  v18 = *MEMORY[0x1E0C9D538];
  v19 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v11, "setBounds:", *MEMORY[0x1E0C9D538], v19, v14, v16);
  -[CAMModeIndicatorView _symbolSize](self, "_symbolSize");
  v21 = v20;
  v23 = v22;
  objc_msgSend(v11, "frame");
  v24 = CGRectGetMinY(v27) - v23;
  v28.origin.x = recta.origin.x;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  objc_msgSend(v12, "setCenter:", CGRectGetMidX(v28), v24);
  objc_msgSend(v12, "setBounds:", v18, v19, v21, v23);
  -[CAMModeIndicatorView _updateModeIndicatorAnimated:](self, "_updateModeIndicatorAnimated:", 0);

}

- (void)setSelectedMode:(int64_t)a3
{
  -[CAMModeIndicatorView setSelectedMode:animated:](self, "setSelectedMode:animated:", a3, 0);
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_selectedMode != a3)
  {
    self->_selectedMode = a3;
    -[CAMModeIndicatorView _updateModeIndicatorAnimated:](self, "_updateModeIndicatorAnimated:", a4);
    if (!a4)
      -[CAMModeIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)_symbolSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 6.0;
  v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateModeIndicatorAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MidX;
  double v22;
  CGFloat v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  CGFloat v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  CGFloat v33;
  CGFloat v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v3 = a3;
  -[CAMModeIndicatorView _modeTextView](self, "_modeTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeIndicatorView _symbolView](self, "_symbolView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "cam_localizedTitleForMode:wantsCompactTitle:", -[CAMModeIndicatorView selectedMode](self, "selectedMode"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

  objc_msgSend(v5, "setSelected:", 1);
  objc_msgSend(v5, "setShouldShadowTitleText:", 1);
  if (v3)
  {
    -[CAMModeIndicatorView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v27 = v16;
    v18 = v17;
    -[CAMModeIndicatorView _symbolSize](self, "_symbolSize");
    v20 = v19;
    v35.origin.x = v9;
    v35.origin.y = v11;
    v35.size.width = v13;
    v35.size.height = v15;
    MidX = CGRectGetMidX(v35);
    objc_msgSend(v5, "frame");
    v28 = CGRectGetMinY(v36) - v20;
    v37.origin.x = v9;
    v37.origin.y = v11;
    v37.size.width = v13;
    v37.size.height = v15;
    v22 = CGRectGetMidX(v37);
    v38.origin.x = v9;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = v15;
    v23 = CGRectGetMidX(v38);
    objc_msgSend(v5, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v27, v18);
    objc_msgSend(v5, "setCenter:", MidX, v15 - v18);
    objc_msgSend(v6, "setCenter:", v22, v15);
    objc_msgSend(v5, "setAlpha:", 0.0);
    objc_msgSend(v6, "setAlpha:", 0.0);
    v24 = (void *)MEMORY[0x1E0DC3F10];
    v25 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __53__CAMModeIndicatorView__updateModeIndicatorAnimated___block_invoke;
    v31[3] = &unk_1EA32B498;
    v32 = v6;
    v33 = v23;
    v34 = v28;
    objc_msgSend(v24, "animateWithDuration:delay:options:animations:completion:", 0x20000, v31, 0, 0.5, 0.0);
    v26 = (void *)MEMORY[0x1E0DC3F10];
    v29[0] = v25;
    v29[1] = 3221225472;
    v29[2] = __53__CAMModeIndicatorView__updateModeIndicatorAnimated___block_invoke_2;
    v29[3] = &unk_1EA328868;
    v30 = v5;
    objc_msgSend(v26, "animateWithDuration:delay:options:animations:completion:", 0x20000, v29, 0, 0.5, 0.2);

  }
}

uint64_t __53__CAMModeIndicatorView__updateModeIndicatorAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __53__CAMModeIndicatorView__updateModeIndicatorAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (CAMModeDialItem)_modeTextView
{
  return self->__modeTextView;
}

- (UIImageView)_symbolView
{
  return self->__symbolView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__symbolView, 0);
  objc_storeStrong((id *)&self->__modeTextView, 0);
}

@end
