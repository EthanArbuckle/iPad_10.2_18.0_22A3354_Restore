@implementation UITableViewCell(CNContactStyle)

- (void)_cnui_applyCommonContactStyle:()CNContactStyle
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a3;
  objc_msgSend(v27, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v27;
  if (v4)
  {
    objc_msgSend(a1, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isMemberOfClass:", objc_opt_class());

    if ((v7 & 1) == 0)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(a1, "setBackgroundView:", v8);

    }
    objc_msgSend(v27, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    v5 = v27;
  }
  if ((objc_msgSend(v5, "usesOpaqueBackground") & 1) == 0)
  {
    objc_msgSend(a1, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isMemberOfClass:", objc_opt_class());

    if ((v12 & 1) == 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD9D0]), "initWithProminence:", 3);
      objc_msgSend(a1, "setBackgroundView:", v13);

    }
    objc_msgSend(a1, "setBackgroundColor:", 0);
  }
  objc_msgSend(v27, "textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v27, "textColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v15);

  }
  objc_msgSend(v27, "highlightedTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v27, "highlightedTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHighlightedTextColor:", v18);

  }
  objc_msgSend(a1, "setOpaque:", objc_msgSend(v27, "usesOpaqueBackground"));
  objc_msgSend(a1, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  LODWORD(v22) = 0;
  if (v21)
    *(float *)&v22 = 0.25;
  objc_msgSend(v20, "_setHyphenationFactor:", v22);

  objc_msgSend(v27, "separatorInset");
  if (v26 != *(double *)(MEMORY[0x1E0DC49E8] + 8)
    || v23 != *MEMORY[0x1E0DC49E8]
    || v25 != *(double *)(MEMORY[0x1E0DC49E8] + 24)
    || v24 != *(double *)(MEMORY[0x1E0DC49E8] + 16))
  {
    objc_msgSend(v27, "separatorInset");
    objc_msgSend(a1, "setSeparatorInset:");
  }

}

- (void)_cnui_applyContactStyle
{
  id v2;

  objc_msgSend(a1, "_cnui_contactStyle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_cnui_applyCommonContactStyle:", v2);
  objc_msgSend(a1, "_cnui_applySelectedBackgroundViewStyle:", v2);

}

- (void)_cnui_applySelectedBackgroundViewStyle:()CNContactStyle
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t isKindOfClass;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "selectedCellBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "selectedBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());

    if ((v6 & 1) == 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(a1, "setSelectedBackgroundView:", v7);

    }
    objc_msgSend(a1, "selectedBackgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);

    objc_msgSend(v15, "selectedCellBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "selectedBackgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    if (objc_msgSend(v15, "blurSupported"))
    {
      objc_msgSend(a1, "selectedBackgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setDrawsAsBackdropOverlayWithBlendMode:", 3);

      objc_msgSend(a1, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

      objc_msgSend(a1, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsGroupBlending:", 0);
LABEL_8:

    }
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD9D0]), "initWithProminence:", 3);
      objc_msgSend(a1, "setSelectedBackgroundView:", v13);
      goto LABEL_8;
    }
  }

}

@end
