@implementation MFComposeWebContentVariationView

- (MFComposeWebContentVariationView)initWithFrame:(CGRect)a3
{
  MFComposeWebContentVariationView *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIButton *webContentVariableButton;
  void *v11;
  void *v12;
  UIButton *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MFComposeWebContentVariationView;
  v3 = -[MFComposeWebContentVariationView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEND_WEB_CONTENT_AS"), &stru_1E5A6A588, CFSTR("Main"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebContentVariationView setLabel:](v3, "setLabel:", v5);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v6 = objc_alloc(MEMORY[0x1E0DC3518]);
    v7 = (void *)MEMORY[0x1E0DC3428];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __50__MFComposeWebContentVariationView_initWithFrame___block_invoke;
    v19 = &unk_1E5A666D8;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", CFSTR("No Action Selected"), 0, CFSTR("0"), &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "initWithFrame:primaryAction:", v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v16, v17, v18, v19);
    webContentVariableButton = v3->_webContentVariableButton;
    v3->_webContentVariableButton = (UIButton *)v9;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_webContentVariableButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setContextMenuIsPrimary:](v3->_webContentVariableButton, "setContextMenuIsPrimary:", 1);
    -[UIButton _setDisableAutomaticTitleAnimations:](v3->_webContentVariableButton, "_setDisableAutomaticTitleAnimations:", 1);
    objc_msgSend((id)objc_opt_class(), "defaultFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v3->_webContentVariableButton, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    v13 = v3->_webContentVariableButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 0);

    -[UIButton setAccessibilityIdentifier:](v3->_webContentVariableButton, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B20]);
    -[MFComposeWebContentVariationView addSubview:](v3, "addSubview:", v3->_webContentVariableButton);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __50__MFComposeWebContentVariationView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_flashBackground");

}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double Width;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)MFComposeWebContentVariationView;
  -[MFComposeWebContentVariationView layoutSubviews](&v20, sel_layoutSubviews);
  v3 = -[MFComposeWebContentVariationView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[MFComposeWebContentVariationView _contentRect](self, "_contentRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MFComposeWebContentVariationView bounds](self, "bounds");
  v13 = v12;
  -[MFComposeWebContentVariationView labelView](self, "labelView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  Width = CGRectGetWidth(v21);
  if (v13 >= v11)
    v16 = v13;
  else
    v16 = v11;
  v17 = v16 + -4.0;
  v18 = Width + 5.0;

  v19 = 0.0;
  if (v3 != 1)
    v19 = v18;
  -[UIButton setFrame:](self->_webContentVariableButton, "setFrame:", v5 + v19, v7, v9 - v18, v17);
  -[UIButton setContentHorizontalAlignment:](self->_webContentVariableButton, "setContentHorizontalAlignment:", 4);
}

- (void)setupMenuItemTitles:(id)a3 currentSelection:(unint64_t)a4 handler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  if (objc_msgSend(v12, "count"))
  {
    v9 = (void *)MEMORY[0x1E0DC39D0];
    -[MFComposeWebContentVariationView _generateActionsForTitles:currentSelection:handler:](self, "_generateActionsForTitles:currentSelection:handler:", v12, a4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "menuWithTitle:children:", &stru_1E5A6A588, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](self->_webContentVariableButton, "setMenu:", v11);

    -[MFComposeWebContentVariationView layoutIfNeeded](self, "layoutIfNeeded");
  }

}

- (id)_generateActionsForTitles:(id)a3 currentSelection:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  MFComposeWebContentVariationView *v26;
  id v27;
  id v28;
  _QWORD aBlock[4];
  id v30;
  id v31;

  v8 = a3;
  v9 = a5;
  -[MFComposeWebContentVariationView webContentVariableButton](self, "webContentVariableButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__MFComposeWebContentVariationView__generateActionsForTitles_currentSelection_handler___block_invoke;
  aBlock[3] = &unk_1E5A66700;
  v22 = v10;
  v30 = v22;
  v20 = v9;
  v31 = v20;
  v21 = _Block_copy(aBlock);
  v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v11, "setNumberStyle:", 0, v9);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  for (i = 0; i < objc_msgSend(v8, "count"); ++i)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == i)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37F0], "ef_formatUnsignedInteger:withGrouping:", i, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0DC3428];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __87__MFComposeWebContentVariationView__generateActionsForTitles_currentSelection_handler___block_invoke_2;
    v23[3] = &unk_1E5A66728;
    v24 = v11;
    v25 = v22;
    v26 = self;
    v27 = v8;
    v28 = v21;
    objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v14, v15, v16, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v18);

  }
  return v12;
}

void __87__MFComposeWebContentVariationView__generateActionsForTitles_currentSelection_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v5, 0);

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __87__MFComposeWebContentVariationView__generateActionsForTitles_currentSelection_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  v8 = (void *)MEMORY[0x1E0DC39D0];
  objc_msgSend(*(id *)(a1 + 48), "_generateActionsForTitles:currentSelection:handler:", *(_QWORD *)(a1 + 56), v7, *(_QWORD *)(a1 + 64));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "menuWithTitle:children:", &stru_1E5A6A588, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setMenu:", v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)setSelectedContentVariationLabel:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFComposeWebContentVariationView webContentVariableButton](self, "webContentVariableButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v5, 0);

  -[MFComposeWebContentVariationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)refreshPreferredContentSize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFComposeWebContentVariationView;
  -[MFComposeWebContentVariationView refreshPreferredContentSize](&v7, sel_refreshPreferredContentSize);
  objc_msgSend(MEMORY[0x1E0D13628], "sharedFontMetricCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ensureCacheIsValid");

  -[MFComposeWebContentVariationView webContentVariableButton](self, "webContentVariableButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "defaultFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  -[MFComposeWebContentVariationView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_flashBackground
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];

  -[MFComposeWebContentVariationView background](self, "background");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[MFComposeWebContentVariationView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[MFComposeWebContentVariationView separator](self, "separator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v14 = v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v5, v7 + v14 * -2.0, v9, v11 + v14 * 2.0);
    v16 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mf_imageWithColor:size:", v17, 1.0, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v18);

    objc_msgSend(v15, "setAutoresizingMask:", 2);
    -[MFComposeWebContentVariationView labelView](self, "labelView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeWebContentVariationView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v15, v19);

    -[MFComposeWebContentVariationView setBackground:](self, "setBackground:", v15);
  }
  v20[4] = self;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52__MFComposeWebContentVariationView__flashBackground__block_invoke;
  v21[3] = &unk_1E5A65480;
  v21[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__MFComposeWebContentVariationView__flashBackground__block_invoke_2;
  v20[3] = &unk_1E5A66750;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v21, v20, 0.3);
}

void __52__MFComposeWebContentVariationView__flashBackground__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "background");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __52__MFComposeWebContentVariationView__flashBackground__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__MFComposeWebContentVariationView__flashBackground__block_invoke_3;
  v2[3] = &unk_1E5A65480;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v2, 0.3);
}

void __52__MFComposeWebContentVariationView__flashBackground__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "background");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (NSString)selectedContentVariation
{
  return self->_selectedContentVariation;
}

- (UIButton)webContentVariableButton
{
  return self->_webContentVariableButton;
}

- (void)setWebContentVariableButton:(id)a3
{
  objc_storeStrong((id *)&self->_webContentVariableButton, a3);
}

- (UIView)background
{
  return self->_background;
}

- (void)setBackground:(id)a3
{
  objc_storeStrong((id *)&self->_background, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_webContentVariableButton, 0);
  objc_storeStrong((id *)&self->_selectedContentVariation, 0);
}

@end
