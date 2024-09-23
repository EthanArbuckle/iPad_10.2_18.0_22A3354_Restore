@implementation SFPrivacyReportExplanationDetailView

- (SFPrivacyReportExplanationDetailView)initWithFrame:(CGRect)a3
{
  SFPrivacyReportExplanationDetailView *v3;
  void *v4;
  SFPrivacyReportExplanationDetailItemView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFPrivacyReportExplanationDetailItemView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SFPrivacyReportExplanationDetailItemView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SFPrivacyReportExplanationDetailItemView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  SFPrivacyReportExplanationDetailItemView *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  SFPrivacyReportExplanationDetailView *v51;
  unint64_t v53;
  objc_super v54;
  const __CFString *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[3];

  v60[2] = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)SFPrivacyReportExplanationDetailView;
  v3 = -[SFPrivacyReportGridView initWithFrame:](&v54, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationDetailItemView titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    _WBSLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationDetailItemView bodyTextView](v5, "bodyTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    objc_msgSend(v4, "addObject:", v5);
    objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v10, "safari_enableAdvancedPrivacyProtections:", 1);

    v11 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationDetailItemView titleLabel](v11, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportExplanationDetailItemView bodyTextView](v11, "bodyTextView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    objc_msgSend(v4, "addObject:", v11);
    if ((_DWORD)v5)
    {
      v16 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
      _WBSLocalizedString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivacyReportExplanationDetailItemView titleLabel](v16, "titleLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v17);

      _SFDeviceIsPad();
      _WBSLocalizedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivacyReportExplanationDetailItemView bodyTextView](v16, "bodyTextView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v19);

      objc_msgSend(v4, "addObject:", v16);
      v21 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
      _WBSLocalizedString();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivacyReportExplanationDetailItemView titleLabel](v21, "titleLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setText:", v22);

      _WBSLocalizedString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivacyReportExplanationDetailItemView bodyTextView](v21, "bodyTextView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setText:", v24);

      objc_msgSend(v4, "addObject:", v21);
    }
    objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isPrivacyProxyActive");

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isUserAccountInSubscriberTierForPrivacyProxy");

      objc_msgSend(MEMORY[0x1E0D8AAF8], "sharedManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isPrivacyProxyPaidTierUnavailableInUserCountry");

      v32 = objc_alloc_init(SFPrivacyReportExplanationDetailItemView);
      v53 = __PAIR64__(v29, v31);
      _WBSLocalizedString();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPrivacyReportExplanationDetailItemView titleLabel](v32, "titleLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setText:", v33);

      _WBSLocalizedString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_alloc(MEMORY[0x1E0CB3778]);
      v59[0] = *MEMORY[0x1E0DC32A0];
      -[SFPrivacyReportExplanationDetailItemView bodyTextView](v32, "bodyTextView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "font");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v38;
      v59[1] = *MEMORY[0x1E0DC32A8];
      -[SFPrivacyReportExplanationDetailItemView bodyTextView](v32, "bodyTextView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "textColor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v36, "initWithString:attributes:", v35, v41);

      if ((HIDWORD(v53) | v53 ^ 1) == 1)
      {
        v57 = *MEMORY[0x1E0DC32B8];
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D8B2B8]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v43;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "string");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "rangeOfString:", CFSTR("{learn-more-link}"));
        objc_msgSend(v42, "addAttributes:range:", v44, v46, v47);

        _WBSLocalizedString();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = CFSTR("{learn-more-link}");
        v56 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "safari_replaceCharactersWithStringBindings:", v49);

      }
      -[SFPrivacyReportExplanationDetailItemView bodyTextView](v32, "bodyTextView", v53);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setAttributedText:", v42);

      objc_msgSend(v4, "addObject:", v32);
    }
    -[SFPrivacyReportGridView setItemViews:](v3, "setItemViews:", v4);
    v51 = v3;

  }
  return v3;
}

- (double)interItemSpacing
{
  return 25.0;
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_usesInsetStyle != a3)
  {
    v3 = a3;
    self->_usesInsetStyle = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[SFPrivacyReportGridView itemViews](self, "itemViews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setUsesInsetStyle:", v3);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

@end
