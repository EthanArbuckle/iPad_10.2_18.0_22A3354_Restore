@implementation EKUIClearButton

+ (double)trailingOffsetToMarginForTextFieldClearButtonAlignment
{
  return 5.0;
}

- (EKUIClearButton)initWithColor:(id)a3
{
  id v4;
  EKUIClearButton *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[4];
  id v22;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EKUIClearButton;
  v5 = -[EKUIClearButton init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIClearButton _clearImageSymbolConfig](v5, "_clearImageSymbolConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v6);
    objc_msgSend(v8, "setPreferredSymbolConfigurationForImage:", v7);
    v9 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __33__EKUIClearButton_initWithColor___block_invoke;
    v21[3] = &unk_1E601B268;
    v22 = v4;
    objc_msgSend(v8, "setImageColorTransformer:", v21);
    objc_msgSend(v8, "background");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 0.0);

    objc_msgSend(v8, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    -[EKUIClearButton setConfiguration:](v5, "setConfiguration:", v8);
    -[EKUIClearButton _setTouchInsets:](v5, "_setTouchInsets:", -20.0, -20.0, -20.0, -20.0);
    LODWORD(v11) = 1148846080;
    -[EKUIClearButton setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v11);
    LODWORD(v12) = 1148846080;
    -[EKUIClearButton setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    LODWORD(v13) = 1148846080;
    -[EKUIClearButton setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 0, v13);
    LODWORD(v14) = 1148846080;
    -[EKUIClearButton setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 1, v14);
    objc_initWeak(&location, v5);
    v24[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __33__EKUIClearButton_initWithColor___block_invoke_2;
    v18[3] = &unk_1E6018610;
    objc_copyWeak(&v19, &location);
    v16 = (id)-[EKUIClearButton registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v15, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v5;
}

id __33__EKUIClearButton_initWithColor___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __33__EKUIClearButton_initWithColor___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_clearImageSymbolConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredSymbolConfigurationForImage:", v4);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setConfiguration:", v6);

}

- (id)_clearImageSymbolConfig
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC3888];
  v3 = *MEMORY[0x1E0DC4A88];
  -[EKUIClearButton traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithTextStyle:scale:", v3, +[EKUIConstrainedFontUtilities tableViewCellCappedSymbolImageScaleWithScale:traitCollection:](EKUIConstrainedFontUtilities, "tableViewCellCappedSymbolImageScaleWithScale:traitCollection:", 2, v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
