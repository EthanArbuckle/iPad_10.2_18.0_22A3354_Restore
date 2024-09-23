@implementation CAMOrientationInstructionView

- (CAMOrientationInstructionView)initWithFrame:(CGRect)a3
{
  CAMOrientationInstructionView *v3;
  CAMOrientationInstructionView *v4;
  UILabel *v5;
  UILabel *label;
  id v7;
  void *v8;
  uint64_t v9;
  UIVisualEffectView *effectView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMOrientationInstructionView;
  v3 = -[CAMOrientationInstructionView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMOrientationInstructionView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v4->__interfaceOrientation = 1;
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v4->__label;
    v4->__label = v5;

    -[UILabel setNumberOfLines:](v4->__label, "setNumberOfLines:", 0);
    v7 = objc_alloc(MEMORY[0x1E0DC3F58]);
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 25.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithEffect:", v8);
    effectView = v4->__effectView;
    v4->__effectView = (UIVisualEffectView *)v9;

    v4->_hasBlurredBackground = 1;
    -[CAMOrientationInstructionView addSubview:](v4, "addSubview:", v4->__effectView);
    -[CAMOrientationInstructionView addSubview:](v4, "addSubview:", v4->__label);
    -[CAMOrientationInstructionView _formatLabel](v4, "_formatLabel");
  }
  return v4;
}

- (void)_formatLabel
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  uint64_t v29;
  _QWORD v30[5];

  v30[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v2, "setAlignment:", 1);
  objc_msgSend(v2, "setLineBreakMode:", 0);
  objc_msgSend(v2, "setLineBreakStrategy:", 0xFFFFLL);
  v3 = objc_alloc_init(MEMORY[0x1E0DC1298]);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShadowColor:", v5);

  objc_msgSend(v3, "setShadowOffset:", 0.0, 0.0);
  objc_msgSend(v3, "setShadowBlurRadius:", 2.0);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.portrait.rotate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAttributedString:", v7);

  +[CAMFont cameraMonospacedFontOfSize:weight:](CAMFont, "cameraMonospacedFontOfSize:weight:", 42.0, *MEMORY[0x1E0DC1450]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC1178];
  v28[0] = *MEMORY[0x1E0DC1138];
  v9 = v28[0];
  v28[1] = v10;
  v30[0] = v22;
  v30[1] = v2;
  v29 = *MEMORY[0x1E0DC1198];
  v11 = v29;
  v30[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v28, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttributes:range:", v12, 0, objc_msgSend(v8, "length"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR("\n"));
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  CAMLocalizedFrameworkString(CFSTR("SPATIAL_VIDEO_LANDSCAPE_ORIENTATION_INSTRUCTION_LABEL"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithString:", v15);
  objc_msgSend(v13, "appendAttributedString:", v16);

  +[CAMFont cameraFontForContentSize:](CAMFont, "cameraFontForContentSize:", *MEMORY[0x1E0DC4900]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMFont cameraKerningForFont:](CAMFont, "cameraKerningForFont:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0DC1150];
  v26[0] = v9;
  v26[1] = v19;
  v27[0] = v17;
  v27[1] = v18;
  v26[2] = v10;
  v26[3] = v11;
  v27[2] = v2;
  v27[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttributes:range:", v20, 0, objc_msgSend(v13, "length"));
  objc_msgSend(v8, "appendAttributedString:", v13);
  -[CAMOrientationInstructionView _label](self, "_label");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAttributedText:", v8);

}

- (void)setHasBlurredBackground:(BOOL)a3
{
  -[CAMOrientationInstructionView setHasBlurredBackground:animated:](self, "setHasBlurredBackground:animated:", a3, 0);
}

- (void)setHasBlurredBackground:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  if (self->_hasBlurredBackground != a3)
  {
    self->_hasBlurredBackground = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__CAMOrientationInstructionView_setHasBlurredBackground_animated___block_invoke;
    v4[3] = &unk_1EA328908;
    v4[4] = self;
    v5 = a3;
    +[CAMView animateIfNeededWithDuration:animations:completion:](CAMView, "animateIfNeededWithDuration:animations:completion:", v4, 0, 0.25);
  }
}

void __66__CAMOrientationInstructionView_setHasBlurredBackground_animated___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1.0;
  else
    v1 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_effectView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

- (void)setOrientation:(int64_t)a3
{
  -[CAMOrientationInstructionView setOrientation:animated:](self, "setOrientation:animated:", a3, 0);
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  if (self->_orientation != a3)
  {
    v4 = a4;
    self->_orientation = a3;
    if ((unint64_t)(a3 - 1) <= 1)
      -[CAMOrientationInstructionView set_interfaceOrientation:](self, "set_interfaceOrientation:");
    -[CAMOrientationInstructionView _label](self, "_label");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v6, -[CAMOrientationInstructionView _interfaceOrientation](self, "_interfaceOrientation"), v4);

  }
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v20.receiver = self;
  v20.super_class = (Class)CAMOrientationInstructionView;
  -[CAMOrientationInstructionView layoutSubviews](&v20, sel_layoutSubviews);
  -[CAMOrientationInstructionView bounds](self, "bounds");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  CGRectGetMidX(v21);
  UIRoundToViewScale();
  v19 = v7;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  CGRectGetMidY(v22);
  UIRoundToViewScale();
  v18 = v8;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v24 = CGRectInset(v23, 16.0, 0.0);
  v9 = v24.origin.x;
  v10 = v24.origin.y;
  v11 = v24.size.width;
  v12 = v24.size.height;
  -[CAMOrientationInstructionView _label](self, "_label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", v9, v10, v11, v12);

  -[CAMOrientationInstructionView _label](self, "_label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCenter:", v19, v18);

  -[CAMOrientationInstructionView _effectView](self, "_effectView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCenter:", v19, v18);

  -[CAMOrientationInstructionView _effectView](self, "_effectView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBounds:", x, y, width, height);

  -[CAMOrientationInstructionView _label](self, "_label");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMView rotateView:toInterfaceOrientation:animated:](CAMView, "rotateView:toInterfaceOrientation:animated:", v17, -[CAMOrientationInstructionView _interfaceOrientation](self, "_interfaceOrientation"), 0);

}

- (BOOL)hasBlurredBackground
{
  return self->_hasBlurredBackground;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UILabel)_label
{
  return self->__label;
}

- (int64_t)_interfaceOrientation
{
  return self->__interfaceOrientation;
}

- (void)set_interfaceOrientation:(int64_t)a3
{
  self->__interfaceOrientation = a3;
}

- (UIVisualEffectView)_effectView
{
  return self->__effectView;
}

- (void)set_effectView:(id)a3
{
  objc_storeStrong((id *)&self->__effectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__effectView, 0);
  objc_storeStrong((id *)&self->__label, 0);
}

@end
