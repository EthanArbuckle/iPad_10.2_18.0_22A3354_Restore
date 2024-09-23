@implementation HUCameraFloatingMicrophoneButton

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUCameraFloatingMicrophoneButton)initWithFrame:(CGRect)a3
{
  HUCameraFloatingMicrophoneButton *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIVisualEffectView *backgroundView;
  UILabel *v8;
  UILabel *microphoneLabel;
  void *v10;
  void *v11;
  UIImageView *v12;
  UIImageView *microphoneImageView;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUCameraFloatingMicrophoneButton;
  v3 = -[HUCameraFloatingMicrophoneButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend((id)objc_opt_class(), "_createBackgroundEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithEffect:", v5);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIVisualEffectView *)v6;

    -[UIVisualEffectView _setCornerRadius:](v3->_backgroundView, "_setCornerRadius:", 4.0);
    -[UIVisualEffectView setUserInteractionEnabled:](v3->_backgroundView, "setUserInteractionEnabled:", 0);
    -[HUCameraFloatingMicrophoneButton naui_addAutoLayoutSubview:](v3, "naui_addAutoLayoutSubview:", v3->_backgroundView);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    microphoneLabel = v3->_microphoneLabel;
    v3->_microphoneLabel = v8;

    objc_msgSend(MEMORY[0x1E0D33718], "staticPreferredFontForTextStyle:traits:", *MEMORY[0x1E0CEB588], 64);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_microphoneLabel, "setFont:", v10);

    _HULocalizedStringWithDefaultValue(CFSTR("HUCameraFloatingMicrophoneButtonTitle"), CFSTR("HUCameraFloatingMicrophoneButtonTitle"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_microphoneLabel, "setText:", v11);

    -[UILabel _setTextColorFollowsTintColor:](v3->_microphoneLabel, "_setTextColorFollowsTintColor:", 1);
    -[UILabel setBaselineAdjustment:](v3->_microphoneLabel, "setBaselineAdjustment:", 1);
    -[HUCameraFloatingMicrophoneButton naui_addAutoLayoutSubview:](v3, "naui_addAutoLayoutSubview:", v3->_microphoneLabel);
    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    microphoneImageView = v3->_microphoneImageView;
    v3->_microphoneImageView = v12;

    -[HUCameraFloatingMicrophoneButton naui_addAutoLayoutSubview:](v3, "naui_addAutoLayoutSubview:", v3->_microphoneImageView);
    -[HUCameraFloatingMicrophoneButton _setupConstraintSet](v3, "_setupConstraintSet");
    -[HUCameraFloatingMicrophoneButton _updateSelectionState](v3, "_updateSelectionState");
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[HUCameraFloatingMicrophoneButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)HUCameraFloatingMicrophoneButton;
    -[HUCameraFloatingMicrophoneButton setSelected:](&v5, sel_setSelected_, v3);
    -[HUCameraFloatingMicrophoneButton _updateSelectionState](self, "_updateSelectionState");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraFloatingMicrophoneButton;
  -[HUCameraFloatingMicrophoneButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[HUCameraFloatingMicrophoneButton _updateAlpha](self, "_updateAlpha");
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraFloatingMicrophoneButton;
  -[HUCameraFloatingMicrophoneButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[HUCameraFloatingMicrophoneButton _updateAlpha](self, "_updateAlpha");
}

+ (id)_createBackgroundEffect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA480], "colorEffectSaturate:", 1.5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithBlurRadius:", 12.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEABE0];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.282352941, 0.72);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectCompositingColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEABE0];
  v11[0] = v3;
  v11[1] = v2;
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectCombiningEffects:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateAlpha
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[2];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[HUCameraFloatingMicrophoneButton isEnabled](self, "isEnabled"))
  {
    if (-[HUCameraFloatingMicrophoneButton isHighlighted](self, "isHighlighted"))
      v3 = 0.4;
    else
      v3 = 1.0;
  }
  else
  {
    v3 = 0.4;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[HUCameraFloatingMicrophoneButton microphoneLabel](self, "microphoneLabel", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  -[HUCameraFloatingMicrophoneButton microphoneImageView](self, "microphoneImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setAlpha:", v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (void)_updateSelectionState
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  if ((-[HUCameraFloatingMicrophoneButton isSelected](self, "isSelected") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraFloatingMicrophoneButton setTintColor:](self, "setTintColor:", v3);

  if (-[HUCameraFloatingMicrophoneButton isSelected](self, "isSelected"))
    v4 = CFSTR("floatingMicrophoneOn");
  else
    v4 = CFSTR("floatingMicrophoneOff");
  HUImageNamed(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraFloatingMicrophoneButton microphoneImageView](self, "microphoneImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

- (void)_setupConstraintSet
{
  NAUILayoutConstraintSet *v3;
  NAUILayoutConstraintSet *constraintSet;

  v3 = (NAUILayoutConstraintSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51A18]), "initWithOwningView:constraintBuilder:", self, &__block_literal_global_168);
  constraintSet = self->_constraintSet;
  self->_constraintSet = v3;

}

id __55__HUCameraFloatingMicrophoneButton__setupConstraintSet__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
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
  void *v31;
  _QWORD v32[9];

  v32[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3718];
  v3 = a2;
  objc_msgSend(v3, "backgroundView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v31, v3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v30;
  objc_msgSend(v3, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToConstant:", 45.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v28;
  objc_msgSend(v3, "microphoneImageView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v24;
  objc_msgSend(v3, "microphoneImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v20;
  objc_msgSend(v3, "microphoneLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "microphoneImageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, 4.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v4;
  objc_msgSend(v3, "microphoneLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "centerYAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v8;
  objc_msgSend(v3, "microphoneLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -20.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_arrayByFlattening");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)updateConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUCameraFloatingMicrophoneButton;
  -[HUCameraFloatingMicrophoneButton updateConstraints](&v4, sel_updateConstraints);
  -[HUCameraFloatingMicrophoneButton constraintSet](self, "constraintSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateIfNeeded");

}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (UILabel)microphoneLabel
{
  return self->_microphoneLabel;
}

- (UIImageView)microphoneImageView
{
  return self->_microphoneImageView;
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_microphoneImageView, 0);
  objc_storeStrong((id *)&self->_microphoneLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
