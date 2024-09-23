@implementation CAMExternalStorageButton

- (CAMExternalStorageButton)initWithFrame:(CGRect)a3
{
  CAMExternalStorageButton *v3;
  void *v4;
  void *v5;
  CAMSlashView *v6;
  CAMSlashView *slashView;
  void *v8;
  CAMSlashMaskView *v9;
  CAMSlashMaskView *slashMaskView;
  CAMSlashMaskView *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMExternalStorageButton;
  v3 = -[CAMExternalStorageButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExternalStorageButton setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CAMExternalStorageButton _formattedTitleString](v3, "_formattedTitleString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExternalStorageButton setAttributedTitle:forState:](v3, "setAttributedTitle:forState:", v5, 0);

    v6 = objc_alloc_init(CAMSlashView);
    slashView = v3->__slashView;
    v3->__slashView = v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSlashView setTintColor:](v3->__slashView, "setTintColor:", v8);

    -[CAMExternalStorageButton addSubview:](v3, "addSubview:", v3->__slashView);
    v9 = objc_alloc_init(CAMSlashMaskView);
    slashMaskView = v3->__slashMaskView;
    v3->__slashMaskView = v9;

    v11 = v3->__slashMaskView;
    -[CAMExternalStorageButton titleLabel](v3, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMaskView:", v11);

  }
  return v3;
}

- (id)_formattedTitleString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0DC1138];
  +[CAMFont cameraFontOfSize:weight:](CAMFont, "cameraFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1420]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DC1150];
  v11[0] = v2;
  v11[1] = &unk_1EA3B1AB0;
  v4 = *MEMORY[0x1E0DC1140];
  v10[1] = v3;
  v10[2] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CAMLocalizedFrameworkString(CFSTR("EXTERNAL_STORAGE_INDICATOR_TITLE"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v6);

  return v8;
}

- (void)_updateSlashVisibility:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  -[CAMExternalStorageButton _slashView](self, "_slashView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMExternalStorageButton _slashMaskView](self, "_slashMaskView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "convertRect:fromView:", v8);
  objc_msgSend(v7, "setSlashBounds:animated:", v4);
  objc_msgSend(v8, "setVisible:animated:", v5, v4);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CAMExternalStorageButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMExternalStorageButton;
    -[CAMExternalStorageButton setSelected:](&v5, sel_setSelected_, v3);
    -[CAMExternalStorageButton _updateSlashVisibility:animated:](self, "_updateSlashVisibility:animated:", v3 ^ 1, 0);
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
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAMExternalStorageButton;
  -[CAMExternalStorageButton layoutSubviews](&v14, sel_layoutSubviews);
  -[CAMExternalStorageButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  UIRectGetCenter();
  -[CAMExternalStorageButton _slashView](self, "_slashView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = fmin(v8, v10);
  UIRectCenteredAboutPointScale();
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v12, v12);
  -[CAMExternalStorageButton _slashMaskView](self, "_slashMaskView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  -[CAMExternalStorageButton _updateSlashVisibility:animated:](self, "_updateSlashVisibility:animated:", -[CAMExternalStorageButton isSelected](self, "isSelected") ^ 1, 0);
}

- (CAMSlashMaskView)_slashMaskView
{
  return self->__slashMaskView;
}

- (CAMSlashView)_slashView
{
  return self->__slashView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__slashView, 0);
  objc_storeStrong((id *)&self->__slashMaskView, 0);
}

@end
