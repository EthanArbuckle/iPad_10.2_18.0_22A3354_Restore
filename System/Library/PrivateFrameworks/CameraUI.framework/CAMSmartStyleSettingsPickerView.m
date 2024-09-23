@implementation CAMSmartStyleSettingsPickerView

- (CAMSmartStyleSettingsPickerView)initWithPHPickerView:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CAMSmartStyleSettingsPickerView *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIButton *continueButton;
  uint64_t v16;
  UIView *pickerOverlayDisablingView;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  CAMSmartStyleSettingsPickerView *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CAMSmartStyleSettingsPickerView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[CAMSmartStyleSettingsPickerView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMSmartStyleSettingsPickerView setBackgroundColor:](v10, "setBackgroundColor:", v11);

    objc_storeStrong((id *)&v10->__pickerView, a3);
    -[CAMSmartStyleSettingsPickerView addSubview:](v10, "addSubview:", v5);
    v12 = (void *)MEMORY[0x1E0DC3518];
    +[CAMSmartStyleSettingsView continueButtonConfiguration](CAMSmartStyleSettingsView, "continueButtonConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "buttonWithConfiguration:primaryAction:", v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    continueButton = v10->_continueButton;
    v10->_continueButton = (UIButton *)v14;

    -[CAMSmartStyleSettingsPickerView _updateContinueButtonConfiguration](v10, "_updateContinueButtonConfiguration");
    -[CAMSmartStyleSettingsPickerView addSubview:](v10, "addSubview:", v10->_continueButton);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v6, v7, v8, v9);
    pickerOverlayDisablingView = v10->__pickerOverlayDisablingView;
    v10->__pickerOverlayDisablingView = (UIView *)v16;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "colorWithAlphaComponent:", 0.3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10->__pickerOverlayDisablingView, "setBackgroundColor:", v19);

    -[UIView setAlpha:](v10->__pickerOverlayDisablingView, "setAlpha:", 0.0);
    -[CAMSmartStyleSettingsPickerView addSubview:](v10, "addSubview:", v10->__pickerOverlayDisablingView);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[CAMSmartStyleSettingsPickerView subviews](v10, "subviews", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v22);
    }

    -[CAMSmartStyleSettingsPickerView _setConstraints](v10, "_setConstraints");
    v25 = v10;
  }

  return v10;
}

- (void)_setConstraints
{
  void *v3;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[13];

  v48[11] = *MEMORY[0x1E0C80C00];
  -[CAMSmartStyleSettingsPickerView _pickerView](self, "_pickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView _pickerOverlayDisablingView](self, "_pickerOverlayDisablingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView continueButton](self, "continueButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v44;
  objc_msgSend(v3, "bottomAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -40.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v40;
  v43 = v3;
  objc_msgSend(v3, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView leadingAnchor](self, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v37;
  objc_msgSend(v3, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView trailingAnchor](self, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v34;
  objc_msgSend(v4, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v28;
  objc_msgSend(v4, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView bottomAnchor](self, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v25;
  v33 = v4;
  objc_msgSend(v4, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView leadingAnchor](self, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v21;
  objc_msgSend(v4, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView trailingAnchor](self, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v18;
  v6 = v5;
  objc_msgSend(v5, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v8, -14.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v9;
  v24 = v6;
  objc_msgSend(v6, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView leadingAnchor](self, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 28.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v12;
  objc_msgSend(v6, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerView trailingAnchor](self, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -28.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "activateConstraints:", v16);

}

- (void)setWaitingOnLoading:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  if (self->_waitingOnLoading != a3)
  {
    self->_waitingOnLoading = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__CAMSmartStyleSettingsPickerView_setWaitingOnLoading___block_invoke;
    v4[3] = &unk_1EA328908;
    v4[4] = self;
    v5 = a3;
    +[CAMView animateIfNeededWithDuration:animations:](CAMView, "animateIfNeededWithDuration:animations:", v4, 0.25);
    -[CAMSmartStyleSettingsPickerView _updateContinueButtonConfiguration](self, "_updateContinueButtonConfiguration");
  }
}

uint64_t __55__CAMSmartStyleSettingsPickerView_setWaitingOnLoading___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", v1);
}

- (void)_updateContinueButtonConfiguration
{
  _BOOL8 v3;
  __CFString *v4;
  UIButton *continueButton;
  void *v6;
  void *v7;
  id v8;

  v3 = -[CAMSmartStyleSettingsPickerView isWaitingOnLoading](self, "isWaitingOnLoading");
  if (v3)
    v4 = CFSTR("SMART_STYLES_SETTINGS_LOADING");
  else
    v4 = CFSTR("SMART_STYLES_SETTINGS_CONTINUE");
  continueButton = self->_continueButton;
  CAMLocalizedFrameworkString(v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitle:forState:](continueButton, "setTitle:forState:", v6, 0);

  -[UIButton configuration](self->_continueButton, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "copy");

  objc_msgSend(v8, "setShowsActivityIndicator:", v3);
  objc_msgSend(v8, "setImagePlacement:", 8);
  objc_msgSend(v8, "setImagePadding:", 8.0);
  objc_msgSend(v8, "setTitleAlignment:", 2);
  -[UIButton setConfiguration:](self->_continueButton, "setConfiguration:", v8);
  -[UIButton setNeedsUpdateConfiguration](self->_continueButton, "setNeedsUpdateConfiguration");

}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (BOOL)isWaitingOnLoading
{
  return self->_waitingOnLoading;
}

- (UIView)_pickerView
{
  return self->__pickerView;
}

- (void)set_pickerView:(id)a3
{
  objc_storeStrong((id *)&self->__pickerView, a3);
}

- (UIView)_pickerOverlayDisablingView
{
  return self->__pickerOverlayDisablingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pickerOverlayDisablingView, 0);
  objc_storeStrong((id *)&self->__pickerView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
}

@end
