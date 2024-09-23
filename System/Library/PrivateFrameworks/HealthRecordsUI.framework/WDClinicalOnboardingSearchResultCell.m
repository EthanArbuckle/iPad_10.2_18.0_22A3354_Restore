@implementation WDClinicalOnboardingSearchResultCell

- (WDClinicalOnboardingSearchResultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WDClinicalOnboardingSearchResultCell *v4;
  WDClinicalOnboardingSearchResultCell *v5;
  void *v6;
  NSArray *searchTerms;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDClinicalOnboardingSearchResultCell;
  v4 = -[WDMedicalRecordBrandLogoCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[WDClinicalOnboardingSearchResultCell setAccessoryType:](v4, "setAccessoryType:", 1);
    -[WDMedicalRecordBrandCell brandTitleLabel](v5, "brandTitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("UIA.Health.ClinicalOnboarding.Search.SearchResult.Name"));

    searchTerms = v5->_searchTerms;
    v5->_searchTerms = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (void)setSearchResult:(id)a3 dataProvider:(id)a4 searchTerms:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WDClinicalOnboardingSearchResultCell setSearchResult:](self, "setSearchResult:", v10);
  -[WDClinicalOnboardingSearchResultCell setSearchTerms:](self, "setSearchTerms:", v8);
  -[WDClinicalOnboardingSearchResultCell _updateContentWithSearchResult:dataProvider:searchTerms:](self, "_updateContentWithSearchResult:dataProvider:searchTerms:", v10, v9, v8);

  v11.receiver = self;
  v11.super_class = (Class)WDClinicalOnboardingSearchResultCell;
  -[WDMedicalRecordBrandCell setBrandable:dataProvider:](&v11, sel_setBrandable_dataProvider_, v10, v9);

}

- (void)_updateLabelVisibility
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;

  -[WDMedicalRecordBrandCell brandTitleLabel](self, "brandTitleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") == 0;
  -[WDMedicalRecordBrandCell brandTitleLabel](self, "brandTitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[WDMedicalRecordBrandCell brandSubtitleLabel](self, "brandSubtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length") == 0;
  -[WDMedicalRecordBrandCell brandSubtitleLabel](self, "brandSubtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[WDMedicalRecordBrandCell brandDetailLabel](self, "brandDetailLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length") == 0;
  -[WDMedicalRecordBrandCell brandDetailLabel](self, "brandDetailLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", v13);

  -[WDClinicalOnboardingSearchResultCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)_updateContentWithSearchResult:(id)a3 dataProvider:(id)a4 searchTerms:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  void *v48;

  -[WDClinicalOnboardingSearchResultCell searchResult](self, "searchResult", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDMedicalRecordBrandCell brandTitleLabel](self, "brandTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_fontByAddingSymbolicTraits:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3778];
    v12 = v10;
    -[WDClinicalOnboardingSearchResultCell searchResult](self, "searchResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDClinicalOnboardingSearchResultCell searchTerms](self, "searchTerms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wd_stringWithString:highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:", v14, v15, v16, v12, v17, v18, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[WDMedicalRecordBrandCell brandTitleLabel](self, "brandTitleLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAttributedText:", v19);

    -[WDClinicalOnboardingSearchResultCell searchResult](self, "searchResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "subtitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[WDMedicalRecordBrandCell brandSubtitleLabel](self, "brandSubtitleLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "font");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "hk_fontByAddingSymbolicTraits:", 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB3778];
      -[WDClinicalOnboardingSearchResultCell searchResult](self, "searchResult");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "subtitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDClinicalOnboardingSearchResultCell searchTerms](self, "searchTerms");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "wd_stringWithString:highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:", v27, v28, v29, v24, v30, v31, v25);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDMedicalRecordBrandCell brandSubtitleLabel](self, "brandSubtitleLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAttributedText:", v32);

    }
    -[WDClinicalOnboardingSearchResultCell searchResult](self, "searchResult");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "location");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    -[WDMedicalRecordBrandCell brandDetailLabel](self, "brandDetailLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v35)
    {
      objc_msgSend(v36, "font");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "hk_fontByAddingSymbolicTraits:", 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0CB3778];
      -[WDClinicalOnboardingSearchResultCell searchTerms](self, "searchTerms");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "wd_stringWithString:highlightingStrings:baseColor:baseFont:highlightingBaseColor:highlightColor:highlightFont:", v35, v41, v42, v38, v43, v44, v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setAttributedText:", v45);

    }
    -[WDClinicalOnboardingSearchResultCell _updateLabelVisibility](self, "_updateLabelVisibility");
    -[WDClinicalOnboardingSearchResultCell _setAccessibilityIdentifier](self, "_setAccessibilityIdentifier");
  }
  else
  {
    objc_msgSend(v7, "setAttributedText:", 0);

    -[WDMedicalRecordBrandCell brandSubtitleLabel](self, "brandSubtitleLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAttributedText:", 0);

    -[WDMedicalRecordBrandCell brandDetailLabel](self, "brandDetailLabel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAttributedText:", 0);

    -[WDClinicalOnboardingSearchResultCell _updateLabelVisibility](self, "_updateLabelVisibility");
  }
}

- (void)_updateForContentSizeCategory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDClinicalOnboardingSearchResultCell;
  -[WDMedicalRecordBrandCell _updateForContentSizeCategory:](&v7, sel__updateForContentSizeCategory_, a3);
  -[WDClinicalOnboardingSearchResultCell searchResult](self, "searchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandLogoCell dataProvider](self, "dataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingSearchResultCell searchTerms](self, "searchTerms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingSearchResultCell _updateContentWithSearchResult:dataProvider:searchTerms:](self, "_updateContentWithSearchResult:dataProvider:searchTerms:", v4, v5, v6);

}

- (void)_setAccessibilityIdentifier
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  HKUIJoinStringsForAutomationIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  -[WDMedicalRecordBrandCell brandTitleLabel](self, "brandTitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = &stru_1E74EA150;
  -[__CFString removeSpecialCharactersAndWhiteSpaces](v5, "removeSpecialCharactersAndWhiteSpaces");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandCell brandTitleLabel](self, "brandTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", v9);

  v33[0] = v3;
  -[WDMedicalRecordBrandCell brandSubtitleLabel](self, "brandSubtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = &stru_1E74EA150;
  -[__CFString removeSpecialCharactersAndWhiteSpaces](v12, "removeSpecialCharactersAndWhiteSpaces");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandCell brandSubtitleLabel](self, "brandSubtitleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", v16);

  v32[0] = v3;
  -[WDMedicalRecordBrandCell brandDetailLabel](self, "brandDetailLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "text");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    v19 = &stru_1E74EA150;
  -[__CFString removeSpecialCharactersAndWhiteSpaces](v19, "removeSpecialCharactersAndWhiteSpaces");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordBrandCell brandDetailLabel](self, "brandDetailLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

  -[WDClinicalOnboardingSearchResultCell searchResult](self, "searchResult", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "title");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26)
    v26 = &stru_1E74EA150;
  -[__CFString removeSpecialCharactersAndWhiteSpaces](v26, "removeSpecialCharactersAndWhiteSpaces");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v28;
  v31[2] = CFSTR("tableCell");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDClinicalOnboardingSearchResultCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v30);

}

- (HKClinicalProviderSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end
