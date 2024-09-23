@implementation MUPlaceRibbonItemView

- (MUPlaceRibbonItemView)initWithFrame:(CGRect)a3
{
  MUPlaceRibbonItemView *v3;
  MUPlaceRibbonItemView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUPlaceRibbonItemView;
  v3 = -[MUPlaceRibbonItemView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    -[MUPlaceRibbonItemView _setupSubviews](v3, "_setupSubviews");
    -[MUPlaceRibbonItemView _setupConstraints](v4, "_setupConstraints");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel__updateAppearance, *MEMORY[0x1E0DC48E8], 0);

  }
  return v4;
}

- (void)_setupSubviews
{
  MULabelViewProtocol *v3;
  MULabelViewProtocol *titleLabel;
  MULabelViewProtocol *v5;
  MULabelViewProtocol *valueLabel;
  MUHairlineView *v7;
  MUHairlineView *v8;
  MUHairlineView *trailingHairlineView;

  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 1);
  v3 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MULabelViewProtocol setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_titleLabel, "setAccessibilityIdentifier:", CFSTR("RibbonItemTitle"));
  -[MUPlaceRibbonItemView addSubview:](self, "addSubview:", self->_titleLabel);
  +[MUInfoCardStyle labelForProminence:](MUInfoCardStyle, "labelForProminence:", 0);
  v5 = (MULabelViewProtocol *)objc_claimAutoreleasedReturnValue();
  valueLabel = self->_valueLabel;
  self->_valueLabel = v5;

  -[MULabelViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_valueLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MULabelViewProtocol setNumberOfLines:](self->_valueLabel, "setNumberOfLines:", 1);
  -[MULabelViewProtocol setAccessibilityIdentifier:](self->_valueLabel, "setAccessibilityIdentifier:", CFSTR("RibbonItemValue"));
  -[MUPlaceRibbonItemView addSubview:](self, "addSubview:", self->_valueLabel);
  v7 = [MUHairlineView alloc];
  v8 = -[MUHairlineView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  trailingHairlineView = self->_trailingHairlineView;
  self->_trailingHairlineView = v8;

  -[MUHairlineView setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingHairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUHairlineView setVertical:](self->_trailingHairlineView, "setVertical:", 1);
  -[MUPlaceRibbonItemView setShowTrailingHairline:](self, "setShowTrailingHairline:", 0);
  -[MUPlaceRibbonItemView addSubview:](self, "addSubview:", self->_trailingHairlineView);
  MURegisterForButtonShapeEnablementChanges(self, (uint64_t)sel__updateValueText);
}

- (void)_setupConstraints
{
  MULabelViewProtocol *titleLabel;
  MUHairlineView *v4;
  MUPlaceRibbonItemView *v5;
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
  MUHairlineView *v20;
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
  _QWORD v39[12];

  v39[10] = *MEMORY[0x1E0C80C00];
  v28 = (void *)MEMORY[0x1E0CB3718];
  titleLabel = self->_titleLabel;
  v4 = self->_trailingHairlineView;
  v5 = self;
  -[MULabelViewProtocol leadingAnchor](titleLabel, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemView leadingAnchor](v5, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v36;
  -[MULabelViewProtocol trailingAnchor](self->_titleLabel, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHairlineView leadingAnchor](v4, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -16.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v33;
  -[MULabelViewProtocol topAnchor](self->_titleLabel, "topAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemView topAnchor](v5, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v30;
  -[MULabelViewProtocol bottomAnchor](self->_titleLabel, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabelViewProtocol topAnchor](v5->_valueLabel, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v27, -1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v26;
  -[MULabelViewProtocol leadingAnchor](v5->_valueLabel, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemView leadingAnchor](v5, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v23;
  -[MULabelViewProtocol trailingAnchor](v5->_valueLabel, "trailingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUHairlineView leadingAnchor](v4, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, -16.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v19;
  -[MULabelViewProtocol bottomAnchor](v5->_valueLabel, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemView bottomAnchor](v5, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v16;
  -[MUHairlineView topAnchor](v4, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemView topAnchor](v5, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 2.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v8;
  v20 = v4;
  -[MUHairlineView bottomAnchor](v4, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemView bottomAnchor](v5, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -2.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v11;
  -[MUHairlineView trailingAnchor](v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemView trailingAnchor](v5, "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v15);

}

- (void)_updateAppearance
{
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[MUPlaceRibbonItemViewModel titleStringProvider](self->_viewModel, "titleStringProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUPlaceRibbonItemViewModel titleStringProvider](self->_viewModel, "titleStringProvider");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setAttributedText:](self->_titleLabel, "setAttributedText:", v5);

  }
  -[MUPlaceRibbonItemViewModel valueStringProvider](self->_viewModel, "valueStringProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[MUPlaceRibbonItemView _updateValueText](self, "_updateValueText");
  -[MUPlaceRibbonItemViewModel preferredAccessibilityValue](self->_viewModel, "preferredAccessibilityValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[MUPlaceRibbonItemViewModel preferredAccessibilityValue](self->_viewModel, "preferredAccessibilityValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setAccessibilityLabel:](self->_valueLabel, "setAccessibilityLabel:", v9);

  }
  -[MUPlaceRibbonItemView _updateGestureRecognizers](self, "_updateGestureRecognizers");
}

- (void)_updateGestureRecognizers
{
  BOOL v3;
  UITapGestureRecognizer *tapRecognizer;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *selectRecognizer;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *v9;

  v3 = -[MUPlaceRibbonItemViewModel isTappable](self->_viewModel, "isTappable");
  tapRecognizer = self->_tapRecognizer;
  if (v3)
  {
    if (!tapRecognizer)
    {
      v5 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
      v6 = self->_tapRecognizer;
      self->_tapRecognizer = v5;

      -[UITapGestureRecognizer addTarget:action:](self->_tapRecognizer, "addTarget:action:", self, sel__handleTap);
      tapRecognizer = self->_tapRecognizer;
    }
    -[MUPlaceRibbonItemView addGestureRecognizer:](self, "addGestureRecognizer:", tapRecognizer);
    selectRecognizer = self->_selectRecognizer;
    if (!selectRecognizer)
    {
      v8 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E0DC3D80]);
      v9 = self->_selectRecognizer;
      self->_selectRecognizer = v8;

      -[UITapGestureRecognizer addTarget:action:](self->_selectRecognizer, "addTarget:action:", self, sel__handleTap);
      -[UITapGestureRecognizer setAllowedPressTypes:](self->_selectRecognizer, "setAllowedPressTypes:", &unk_1E2E55C00);
      -[UITapGestureRecognizer setAllowedTouchTypes:](self->_selectRecognizer, "setAllowedTouchTypes:", MEMORY[0x1E0C9AA60]);
      selectRecognizer = self->_selectRecognizer;
    }
    -[MUPlaceRibbonItemView addGestureRecognizer:](self, "addGestureRecognizer:", selectRecognizer);
  }
  else
  {
    -[MUPlaceRibbonItemView removeGestureRecognizer:](self, "removeGestureRecognizer:", tapRecognizer);
    -[MUPlaceRibbonItemView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_selectRecognizer);
  }
}

- (void)_updateValueText
{
  void (**v3)(void);
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[MUPlaceRibbonItemViewModel valueStringProvider](self->_viewModel, "valueStringProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    if (-[MUPlaceRibbonItemViewModel isTappable](self->_viewModel, "isTappable")
      && UIAccessibilityButtonShapesEnabled())
    {
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
      v9 = *MEMORY[0x1E0DC1248];
      v10[0] = &unk_1E2E55470;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAttributes:range:", v6, 0, objc_msgSend(v5, "length"));

      v7 = objc_msgSend(v5, "copy");
      v4 = (void *)v7;
    }
    -[MULabelViewProtocol setAttributedText:](self->_valueLabel, "setAttributedText:", v4);
    objc_msgSend(v4, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULabelViewProtocol setAccessibilityLabel:](self->_valueLabel, "setAccessibilityLabel:", v8);

  }
}

- (void)setViewModel:(id)a3
{
  MUPlaceRibbonItemViewModel **p_viewModel;
  void *v6;
  id v7;

  p_viewModel = &self->_viewModel;
  v7 = a3;
  if (!-[MUPlaceRibbonItemViewModel isEqual:](*p_viewModel, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[MUPlaceRibbonItemViewModel setUpdateDelegate:](*p_viewModel, "setUpdateDelegate:", self);
    -[MUPlaceRibbonItemView _updateAppearance](self, "_updateAppearance");
    -[MUPlaceRibbonItemViewModel typeStringForAX](*p_viewModel, "typeStringForAX");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceRibbonItemView _setAXIdentifierWithItemType:](self, "_setAXIdentifierWithItemType:", v6);

  }
}

- (BOOL)showTrailingHairline
{
  return -[MUHairlineView isHidden](self->_trailingHairlineView, "isHidden") ^ 1;
}

- (void)setShowTrailingHairline:(BOOL)a3
{
  -[MUHairlineView setHidden:](self->_trailingHairlineView, "setHidden:", !a3);
}

- (void)_handleTap
{
  void *v3;
  void (**v4)(id, MUPlaceRibbonItemView *);

  -[MUPlaceRibbonItemView actionHandler](self, "actionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUPlaceRibbonItemView actionHandler](self, "actionHandler");
    v4 = (void (**)(id, MUPlaceRibbonItemView *))objc_claimAutoreleasedReturnValue();
    v4[2](v4, self);

  }
}

- (void)_updateLabelWithAlpha:(double)a3
{
  -[MULabelViewProtocol setAlpha:](self->_valueLabel, "setAlpha:", a3);
}

- (void)_setAXIdentifierWithItemType:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  __CFString *v7;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("Unknown");
  v7 = (__CFString *)v5;
  objc_msgSend(CFSTR("RibbonItemType"), "stringByAppendingString:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceRibbonItemView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v6);

}

- (void)beginAnimatingActivityIndicator
{
  -[MUPlaceRibbonItemView _updateLabelWithAlpha:](self, "_updateLabelWithAlpha:", 0.300000012);
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  -[MUPlaceRibbonItemView _updateLabelWithAlpha:](self, "_updateLabelWithAlpha:", a3, 1.0);
}

- (void)ribbonItemViewModelDidUpdate:(id)a3
{
  id v4;
  void *v5;
  MULabelViewProtocol *valueLabel;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0DC3F10];
  valueLabel = self->_valueLabel;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__MUPlaceRibbonItemView_ribbonItemViewModelDidUpdate___block_invoke;
  v7[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", valueLabel, 5242880, v7, 0, 0.300000012);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __54__MUPlaceRibbonItemView_ribbonItemViewModelDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateAppearance");
    WeakRetained = v2;
  }

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (MUPlaceRibbonItemViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_selectRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_trailingHairlineView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
