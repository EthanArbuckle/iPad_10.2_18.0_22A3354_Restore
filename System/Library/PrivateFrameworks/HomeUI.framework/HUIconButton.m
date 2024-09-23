@implementation HUIconButton

- (HUIconButton)initWithFrame:(CGRect)a3
{
  HUIconButton *v3;
  HUIconButton *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)HUIconButton;
  v3 = -[HUIconButton initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HUIconButton tintColor](v3, "tintColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[HUIconButton layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v6);

    -[HUIconButton _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 7.0);
    v8 = objc_alloc_init(MEMORY[0x1E0D33720]);
    -[HUIconButton setIconView:](v4, "setIconView:", v8);

    -[HUIconButton iconView](v4, "iconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUIconButton iconView](v4, "iconView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);

    -[HUIconButton iconView](v4, "iconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisableContinuousAnimation:", 1);

    -[HUIconButton iconView](v4, "iconView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUseIntrinsicContentSizeFromAsset:", 0);

    -[HUIconButton iconView](v4, "iconView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton addSubview:](v4, "addSubview:", v13);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton iconView](v4, "iconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton centerXAnchor](v4, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

    -[HUIconButton iconView](v4, "iconView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton centerYAnchor](v4, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v22);

    -[HUIconButton iconView](v4, "iconView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton widthAnchor](v4, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v26);

    -[HUIconButton iconView](v4, "iconView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton heightAnchor](v4, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v30);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
  }
  return v4;
}

- (void)tintColorDidChange
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUIconButton;
  -[HUIconButton tintColorDidChange](&v6, sel_tintColorDidChange);
  -[HUIconButton tintColor](self, "tintColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[HUIconButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUIconButton;
  -[HUIconButton setSelected:](&v7, sel_setSelected_);
  v5 = 0.0;
  if (v3)
    v5 = HURoundToScreenScale(1.5);
  -[HUIconButton layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", v5);

}

- (void)updateWithIconDescriptor:(id)a3 animated:(BOOL)a4
{
  -[HUIconButton updateWithIconDescriptor:displayStyle:animated:](self, "updateWithIconDescriptor:displayStyle:animated:", a3, 1, a4);
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  -[HUIconButton iconView](self, "iconView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithIconDescriptor:displayStyle:animated:", v8, a4, v5);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 48.0;
  v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (HFIconDescriptor)iconDescriptor
{
  void *v2;
  void *v3;

  -[HUIconButton iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFIconDescriptor *)v3;
}

- (int64_t)contentMode
{
  void *v2;
  int64_t v3;

  -[HUIconButton iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentMode");

  return v3;
}

- (void)setContentMode:(int64_t)a3
{
  id v4;

  -[HUIconButton iconView](self, "iconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", a3);

}

- (id)vibrancyEffect
{
  void *v2;
  void *v3;

  -[HUIconButton iconView](self, "iconView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vibrancyEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setVibrancyEffect:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[HUIconButton iconView](self, "iconView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setVibrancyEffect:animated:", v6, v4);

}

- (void)setIconTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUIconButton iconView](self, "iconView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (void)setIconSize:(unint64_t)a3
{
  id v4;

  -[HUIconButton iconView](self, "iconView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIconSize:", a3);

}

- (void)setBackgroundVisualEffect:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  HUIconButton *v36;
  id v37;

  v4 = a4;
  v6 = a3;
  -[HUIconButton backgroundEffectView](self, "backgroundEffectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0CEABB0];
      -[HUIconButton iconView](self, "iconView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "vibrancyEffectAnimationDuration");
      v11 = v10;
      v32 = MEMORY[0x1E0C809B0];
      v33 = 3221225472;
      v34 = __51__HUIconButton_setBackgroundVisualEffect_animated___block_invoke;
      v35 = &unk_1E6F4C638;
      v36 = self;
      v37 = v6;
      objc_msgSend(v8, "animateWithDuration:animations:", &v32, v11);

      goto LABEL_7;
    }
    -[HUIconButton backgroundEffectView](self, "backgroundEffectView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEffect:", v6);
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v6);
    -[HUIconButton frame](self, "frame");
    objc_msgSend(v12, "setFrame:");
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "setClipsToBounds:", 1);
    objc_msgSend(v12, "setUserInteractionEnabled:", 0);
    -[HUIconButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v12, 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton leadingAnchor](self, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v16);

    objc_msgSend(v12, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton trailingAnchor](self, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v19);

    objc_msgSend(v12, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton topAnchor](self, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v22);

    objc_msgSend(v12, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconButton bottomAnchor](self, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v25);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v13);
    -[HUIconButton setBackgroundEffectView:](self, "setBackgroundEffectView:", v12);

  }
LABEL_7:
  -[HUIconButton iconView](self, "iconView", v32, v33, v34, v35, v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x1E0CEABA8];
  objc_opt_class();
  v28 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;
  v30 = v29;

  objc_msgSend(v27, "effectForBlurEffect:style:", v30, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setVibrancyEffect:", v31);

}

void __51__HUIconButton_setBackgroundVisualEffect_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "backgroundEffectView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEffect:", *(_QWORD *)(a1 + 40));

}

- (void)setBackgroundVisualEffectViewCornerRaduis:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[HUIconButton backgroundEffectView](self, "backgroundEffectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUIconButton backgroundEffectView](self, "backgroundEffectView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", a3);

  }
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
