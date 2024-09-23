@implementation WDClinicalSettingsOptInNib

- (id)instantiateWithOwner:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", 0);
  v6 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setScrollEnabled:", 0);
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);
  -[WDClinicalSettingsOptInNib textViewDelegate](self, "textViewDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v9);

  objc_msgSend(v7, "setEditable:", 0);
  objc_msgSend(v7, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(v7, "setDataDetectorTypes:", 2);
  -[WDClinicalSettingsOptInNib _footerTextViewString](self, "_footerTextViewString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAttributedText:", v10);

  objc_msgSend(v5, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v7);

  _NSDictionaryOfVariableBindings(CFSTR("textView"), v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[textView]-|"), 40, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addConstraints:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[textView]-17-|"), 40, 0, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addConstraints:", v15);

  v19[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_footerTextViewString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  HRLocalizedString(CFSTR("CLINICAL_ACCOUNTS_SETTINGS_ANALYTICS_SETTINGS_LINK_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("CLINICAL_ACCOUNTS_SETTINGS_OPT_IN_FOOTER_%@"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HRLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3778]);
  v7 = *MEMORY[0x1E0DC1140];
  v26[0] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  v9 = *MEMORY[0x1E0DC1138];
  v26[1] = *MEMORY[0x1E0DC1138];
  v10 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v12);

  v14 = objc_msgSend(v5, "rangeOfString:", v2);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v14;
    v17 = v15;
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=Privacy&path=PROBLEM_REPORTING/SHARE_HEALTH_RECORDS_DATA"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    HKHealthKeyColor();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0DC1160];
    v25[0] = v20;
    v25[1] = v18;
    v24[1] = v21;
    v24[2] = v9;
    v25[2] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setAttributes:range:", v22, v16, v17);
  }

  return v13;
}

- (UITextViewDelegate)textViewDelegate
{
  return (UITextViewDelegate *)objc_loadWeakRetained((id *)&self->_textViewDelegate);
}

- (void)setTextViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textViewDelegate);
}

@end
