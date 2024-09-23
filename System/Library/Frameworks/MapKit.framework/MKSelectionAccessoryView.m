@implementation MKSelectionAccessoryView

- (MKSelectionAccessoryView)initWithFrame:(CGRect)a3
{
  MKSelectionAccessoryView *v3;
  MKSelectionAccessoryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKSelectionAccessoryView;
  v3 = -[MKSelectionAccessoryView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MKSelectionAccessoryView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[MKSelectionAccessoryView _updateDismissButtonVisibility](self, "_updateDismissButtonVisibility");
}

- (void)_updateDismissButtonVisibility
{
  id WeakRetained;

  -[MKSelectionAccessoryView _createDismissButtonIfNeeded](self, "_createDismissButtonIfNeeded");
  if (self->_dismissButton)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[UIButton setHidden:](self->_dismissButton, "setHidden:", WeakRetained == 0);

  }
}

+ (id)_imageConfigurationWithXColor:(id)a3 circleColor:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CEA650];
  v14[0] = a3;
  v14[1] = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithPaletteColors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 4, 3, 23.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "configurationByApplyingConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_buttonConfigurationForControlState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "plainButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark.circle.fill"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  objc_msgSend(v5, "setContentInsets:", *MEMORY[0x1E0CEA080], *(double *)(MEMORY[0x1E0CEA080] + 8), *(double *)(MEMORY[0x1E0CEA080] + 16), *(double *)(MEMORY[0x1E0CEA080] + 24));
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 1)
  {
    objc_msgSend(v7, "colorWithAlphaComponent:", 0.25);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageConfigurationWithXColor:circleColor:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v11);

  return v5;
}

- (void)_createDismissButtonIfNeeded
{
  id WeakRetained;
  UIButton *dismissButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  UIButton *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    dismissButton = self->_dismissButton;

    if (!dismissButton)
    {
      _MKLocalizedStringFromThisBundle(CFSTR("Dismiss"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      +[MKSelectionAccessoryView _buttonConfigurationForControlState:](MKSelectionAccessoryView, "_buttonConfigurationForControlState:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CEA3A0];
      v8 = (void *)MEMORY[0x1E0CEA2A8];
      v12 = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __56__MKSelectionAccessoryView__createDismissButtonIfNeeded__block_invoke;
      v15 = &unk_1E20D9218;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v8, "actionWithHandler:", &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "buttonWithConfiguration:primaryAction:", v6, v9, v12, v13, v14, v15);
      v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
      v11 = self->_dismissButton;
      self->_dismissButton = v10;

      -[UIButton setConfigurationUpdateHandler:](self->_dismissButton, "setConfigurationUpdateHandler:", &__block_literal_global_14);
      -[UIButton setPreferredBehavioralStyle:](self->_dismissButton, "setPreferredBehavioralStyle:", 1);
      -[UIButton setAccessibilityLabel:](self->_dismissButton, "setAccessibilityLabel:", v5);
      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dismissButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[MKSelectionAccessoryView addSubview:](self, "addSubview:", self->_dismissButton);
      -[MKSelectionAccessoryView _activateDismissButtonConstraints](self, "_activateDismissButtonConstraints");
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
    }
  }
}

void __56__MKSelectionAccessoryView__createDismissButtonIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestDismissal");

}

void __56__MKSelectionAccessoryView__createDismissButtonIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[MKSelectionAccessoryView _buttonConfigurationForControlState:](MKSelectionAccessoryView, "_buttonConfigurationForControlState:", objc_msgSend(v2, "state"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConfiguration:", v3);

}

- (void)_activateDismissButtonConstraints
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
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[UIButton topAnchor](self->_dismissButton, "topAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKSelectionAccessoryView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 15.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  -[MKSelectionAccessoryView safeAreaLayoutGuide](self, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton trailingAnchor](self->_dismissButton, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 15.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateConstraints:", v12);

}

- (void)_bringDismissButtonToFront
{
  if (self->_dismissButton)
    -[MKSelectionAccessoryView bringSubviewToFront:](self, "bringSubviewToFront:");
}

- (void)_requestDismissal
{
  void *v3;
  char v4;
  id v5;

  -[MKSelectionAccessoryView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MKSelectionAccessoryView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionAccessoryViewDidRequestDismissal:", self);

  }
}

- (MKPlaceCardContentSizeDelegate)placeCardContentSizeDelegate
{
  return (MKPlaceCardContentSizeDelegate *)objc_loadWeakRetained((id *)&self->_placeCardContentSizeDelegate);
}

- (void)setPlaceCardContentSizeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeCardContentSizeDelegate, a3);
}

- (MKSelectionAccessoryViewDelegate)delegate
{
  return (MKSelectionAccessoryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_placeCardContentSizeDelegate);
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end
