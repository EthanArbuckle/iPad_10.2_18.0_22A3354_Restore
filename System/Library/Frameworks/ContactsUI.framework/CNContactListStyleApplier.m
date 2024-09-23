@implementation CNContactListStyleApplier

- (void)applyContactListDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3 toLayoutSection:(id)a4 collectionViewIsShowingIndexBar:(BOOL)a5
{
  _BOOL4 v5;
  double trailing;
  void *v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;

  v5 = a5;
  trailing = a3.trailing;
  v20 = a4;
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "usesInsetPlatterStyle");

  if (v9)
  {
    objc_msgSend(v20, "contentInsets");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    if (v5)
    {
      -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "usesInsetPlatterStyle");

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "userInterfaceIdiom");

        if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          trailing = 30.0;
        else
          trailing = 15.0;
      }
    }
    objc_msgSend(v20, "setContentInsets:", v11, v13, v15, trailing);
  }

}

- (void)applyContactListStyleToCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  objc_msgSend(v4, "backgroundConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v4, "defaultBackgroundConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundConfiguration:", v6);

  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class());

    if ((v10 & 1) == 0)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v4, "setBackgroundView:", v11);

    }
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cellBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v15);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

  }
  objc_opt_class();
  objc_msgSend(v4, "contentConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (!v20)
  {
    objc_msgSend(v4, "defaultContentConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", objc_msgSend(v21, "cellIsOpaque"));

  objc_msgSend(v4, "setContentConfiguration:", v18);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __57__CNContactListStyleApplier_applyContactListStyleToCell___block_invoke;
  v23[3] = &unk_1E2048B68;
  v23[4] = self;
  v24 = v18;
  v22 = v18;
  objc_msgSend(v4, "setConfigurationUpdateHandler:", v23);

}

- (void)applyCellSeparatorInsetStyleToConfiguration:(id)a3 superviewDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a4 itemWantsFullLengthBottomSeparator:(BOOL)a5
{
  _BOOL4 v5;
  double trailing;
  double leading;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  double v25;
  void *v26;
  id v27;
  id v28;

  v5 = a5;
  trailing = a4.trailing;
  leading = a4.leading;
  v9 = a3;
  objc_msgSend(v9, "topSeparatorInsets");
  v11 = v10;
  v27 = v12;
  v14 = v13;
  objc_msgSend(v9, "bottomSeparatorInsets");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  if (v5)
    v22 = leading;
  else
    v22 = v15;
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "usesInsetPlatterStyle");

  if (v24)
  {
    v25 = v14;
  }
  else
  {
    v21 = trailing;
    v25 = trailing;
  }
  objc_msgSend(v9, "setTopSeparatorInsets:", v11, leading, *(double *)&v27, v25);
  objc_msgSend(v9, "setBottomSeparatorInsets:", v17, v22, v19, v21);
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBottomSeparatorVisibility:", objc_msgSend(v26, "tableSeparatorStyle"));

  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTopSeparatorVisibility:", objc_msgSend(v28, "tableSeparatorStyle"));

}

- (CNContactListStyle)contactListStyle
{
  return self->_contactListStyle;
}

- (void)applyContactListStyleToContact:(id)a3 usingFormatter:(id)a4 ofCell:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
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
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = *MEMORY[0x1E0DC1138];
  v34[0] = *MEMORY[0x1E0DC1138];
  v10 = a4;
  v11 = a3;
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellNameTextFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v13;
  v34[1] = *MEMORY[0x1E0C96788];
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cellNameTextEmphasisedFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributedStringForObjectValue:withDefaultAttributes:", v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v17, "length"))
  {
    v18 = (void *)objc_msgSend(v16, "mutableCopy");
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cellNameTextFont");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fontDescriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fontDescriptorWithSymbolicTraits:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0DC1350];
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "cellNameTextFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "pointSize");
    objc_msgSend(v23, "fontWithDescriptor:size:", v22);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v9);

    v27 = objc_alloc(MEMORY[0x1E0CB3498]);
    CNContactsUIBundle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E20507A8, CFSTR("Localized"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "initWithString:attributes:", v29, v18);

    v17 = (void *)v30;
  }
  objc_opt_class();
  objc_msgSend(v8, "contentConfiguration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v32 = v31;
  else
    v32 = 0;
  v33 = v32;

  if (!v33)
  {
    objc_msgSend(v8, "defaultContentConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v31, "setAttributedText:", v17);
  objc_msgSend(v8, "setContentConfiguration:", v31);

}

- (void)applyContactListStyleToContentConfiguration:(id)a3 usingState:(id)a4 forCell:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "updatedConfigurationForState:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactListStyleApplier applyTextColorsToContentConfiguration:usingState:forCell:](self, "applyTextColorsToContentConfiguration:usingState:forCell:", v10, v9, v8);

  objc_msgSend(v8, "applyAccessories");
  objc_msgSend(v8, "setContentConfiguration:", v10);

}

- (CNContactListStyleApplier)initWithContactListStyle:(id)a3
{
  id v5;
  CNContactListStyleApplier *v6;
  CNContactListStyleApplier *v7;
  objc_super v9;

  v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)CNContactListStyleApplier,
        v6 = -[CNContactListStyleApplier init](&v9, sel_init),
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_contactListStyle, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)applyContactListStyleToCollectionLayoutConfiguration:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableBackgroundFilteredColor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v14, "appearance");

    if (v7 == 1)
    {
      -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tableBackgroundFilteredColor");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v13 = (void *)v9;
      objc_msgSend(v14, "setBackgroundColor:", v9);

      goto LABEL_9;
    }
  }
  else
  {

  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tableBackgroundColor");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_9:

    goto LABEL_10;
  }
  v11 = (void *)v10;
  v12 = objc_msgSend(v14, "appearance");

  if (v12 != 1)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableBackgroundColor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_10:

}

- (void)applyContactListStyleToSearchBar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBarBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchBarBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v8);

  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "searchBarStyle");

  if (v10)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBarStyle:", objc_msgSend(v11, "searchBarStyle"));

  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "searchBarIsTranslucent");

  if (v13)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTranslucent:", objc_msgSend(v14, "searchBarIsTranslucent"));

  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchBarTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "searchField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEnabled");

    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
      objc_msgSend(v19, "searchBarTextColor");
    else
      objc_msgSend(v19, "searchBarTextDisabledColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchField");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v21);

  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "searchBarKeyboardAppearance");

  if (v24)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "searchBarKeyboardAppearance");
    objc_msgSend(v4, "searchField");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setKeyboardAppearance:", v26);

  }
  objc_msgSend(v4, "searchField");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEnabled");
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if ((v29 & 1) != 0)
    objc_msgSend(v30, "searchBarPlaceholderTextColor");
  else
    objc_msgSend(v30, "searchBarPlaceholderTextDisabledColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "searchField");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "placeholder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 && v32)
  {
    v41 = *MEMORY[0x1E0DC1140];
    v42[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v4, "searchField");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "placeholder");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v36, "initWithString:attributes:", v38, v35);
    objc_msgSend(v4, "searchField");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAttributedPlaceholder:", v39);

  }
}

- (void)applyContactListStyleToNavigationBar:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "navigationBarStyle");

  if (v5)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBarStyle:", objc_msgSend(v6, "navigationBarStyle"));

  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "navigationBarIsTranslucent");

  if (v8)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslucent:", objc_msgSend(v9, "navigationBarIsTranslucent"));

  }
}

- (void)applyContactListStyleToHeaderFooter:(id)a3 withTitle:(id)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "applyDefaultContactListStyleToHeaderFooter:withTitle:isRTL:", v8, v7, v5);

}

- (void)applyContactListStyleToCollectionView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", objc_msgSend(v5, "tableIsOpaque"));

}

- (void)applyContactListStyleToBannerTitle:(id)a3 primaryAppearance:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  if (v4)
  {
    +[CNUIFontRepository contactListBannerTitleFontPrimary](CNUIFontRepository, "contactListBannerTitleFontPrimary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v6);

  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bannerTitleTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

}

- (void)applyContactListStyleToBannerFootnote:(id)a3 primaryAppearance:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (a4)
  {
    +[CNUIFontRepository contactListBannerFootnoteFontPrimary](CNUIFontRepository, "contactListBannerFootnoteFontPrimary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[CNUIColorRepository contactListBannerFootnoteTextColorPrimary](CNUIColorRepository, "contactListBannerFootnoteTextColorPrimary");
  }
  else
  {
    +[CNUIFontRepository contactListBannerFootnoteFontSecondary](CNUIFontRepository, "contactListBannerFootnoteFontSecondary");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[CNUIColorRepository contactListBannerFootnoteTextColorSecondary](CNUIColorRepository, "contactListBannerFootnoteTextColorSecondary");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v7);
  objc_msgSend(v5, "setColor:", v6);

}

+ (void)applyDefaultContactListStyleToHeaderFooter:(id)a3 withTitle:(id)a4 isRTL:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v7 = a4;
  if (v15)
  {
    objc_opt_class();
    objc_msgSend(v15, "contentConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0DC39A8], "plainHeaderConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "setText:", v7);
    v11 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
    objc_msgSend(v8, "textProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", v11);

    if (v5)
    {
      objc_msgSend(v8, "setAxesPreservingSuperviewLayoutMargins:", 0);
      objc_msgSend(v8, "directionalLayoutMargins");
      v14 = v13;
      objc_msgSend(v15, "directionalLayoutMargins");
      objc_msgSend(v15, "directionalLayoutMargins");
      objc_msgSend(v8, "setDirectionalLayoutMargins:", v14);
    }
    objc_msgSend(v15, "setContentConfiguration:", v8);

  }
}

- (double)cellEstimatedHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellNameTextFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_scaledValueForValue:", 44.0);
  v5 = v4;

  return v5;
}

- (unint64_t)tableNoContactsAvailableStyle
{
  void *v2;
  unint64_t v3;

  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tableNoContactsAvailableStyle");

  return v3;
}

- (BOOL)usesInsetPlatterStyle
{
  void *v2;
  char v3;

  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesInsetPlatterStyle");

  return v3;
}

- (void)applyTextColorsToContentConfiguration:(id)a3 usingState:(id)a4 forCell:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "isDisabled"))
  {
    +[CNUIColorRepository contactStyleDefaultDisabledTextColor](CNUIColorRepository, "contactStyleDefaultDisabledTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_14;
  }
  else
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellNameTextColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cellNameTextColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "defaultContentConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "updatedConfigurationForState:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v10)
      goto LABEL_14;
  }
  objc_msgSend(v36, "textProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "color");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", v10);

  v19 = (uint64_t *)MEMORY[0x1E0D13850];
  if ((v18 & 1) == 0)
  {
    objc_msgSend(v36, "textProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setColor:", v10);

    v21 = *v19;
    objc_msgSend(v36, "attributedText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "string");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = (*(uint64_t (**)(uint64_t, void *))(v21 + 16))(v21, v23);

    if ((_DWORD)v21)
    {
      objc_msgSend(v36, "attributedText");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "textProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "color");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListStyleApplier attributedString:foregroundColor:](self, "attributedString:foregroundColor:", v24, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAttributedText:", v27);

    }
  }
  objc_msgSend(v36, "secondaryTextProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "color");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqual:", v10);

  if ((v30 & 1) == 0)
  {
    objc_msgSend(v36, "secondaryTextProperties");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setColor:", v10);

    v32 = *v19;
    objc_msgSend(v36, "secondaryAttributedText");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "string");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = (*(uint64_t (**)(uint64_t, void *))(v32 + 16))(v32, v34);

    if ((_DWORD)v32)
    {
      objc_msgSend(v36, "secondaryAttributedText");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactListStyleApplier applySubtitleTextColorsToSearchCellContentConfiguration:withSubtitleText:forSelectedState:](self, "applySubtitleTextColorsToSearchCellContentConfiguration:withSubtitleText:forSelectedState:", v36, v35, objc_msgSend(v8, "isSelected"));

    }
  }
LABEL_14:

}

- (void)applyEditingStateBackgroundConfigurationToCell:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC34D8];
  v4 = a3;
  objc_msgSend(v3, "clearConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundConfiguration:", v5);

}

- (void)applyContactListStyleToSearchCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CNContactListStyleApplier applyContactListStyleToCell:](self, "applyContactListStyleToCell:");
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellSearchBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellSearchBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
}

- (void)applyContactListStyleToSearchHeader:(id)a3 withTitle:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "groupedHeaderConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setText:", v8);
  v9 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
  objc_msgSend(v11, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", v9);

  objc_msgSend(v7, "setContentConfiguration:", v11);
}

- (id)attributedString:(id)a3 foregroundColor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  objc_msgSend(v6, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v5, 0, v8);
  return v6;
}

- (void)applyContactListStyleToSubtitleText:(id)a3 ofSearchResultCell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  v6 = a3;
  objc_opt_class();
  objc_msgSend(v10, "contentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNContactListStyleApplier applySubtitleTextColorsToSearchCellContentConfiguration:withSubtitleText:forSelectedState:](self, "applySubtitleTextColorsToSearchCellContentConfiguration:withSubtitleText:forSelectedState:", v7, v6, objc_msgSend(v10, "isSelected"));

  objc_msgSend(v10, "setContentConfiguration:", v7);
}

- (void)applySubtitleTextColorsToSearchCellContentConfiguration:(id)a3 withSubtitleText:(id)a4 forSelectedState:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v5 = a5;
  v26 = a3;
  v8 = a4;
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellSearchResultTextDisabledColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "usesInsetPlatterStyle");

    if (v12)
    {
      -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cellBlueSelectionSecondaryTextColor");
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
  }
  -[CNContactListStyleApplier contactListStyle](self, "contactListStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellSearchResultTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(v26, "textProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "color");
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v8, "length"))
    v20 = (void *)objc_msgSend(v8, "mutableCopy");
  else
    v20 = 0;
  objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v10, 0, objc_msgSend(v20, "length"));
  v21 = *MEMORY[0x1E0C97078];
  v22 = objc_msgSend(v20, "length");
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __119__CNContactListStyleApplier_applySubtitleTextColorsToSearchCellContentConfiguration_withSubtitleText_forSelectedState___block_invoke;
  v27[3] = &unk_1E2048B90;
  v28 = v20;
  v29 = v18;
  v23 = v18;
  v24 = v20;
  objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", v21, 0, v22, 0, v27);
  objc_msgSend(v26, "setSecondaryText:", &stru_1E20507A8);
  objc_msgSend(v26, "secondaryTextProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setColor:", v23);

  objc_msgSend(v26, "setSecondaryAttributedText:", v24);
}

- (void)applyContactListStyleToMeContactLabel:(id)a3 ofCell:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  +[CNUIColorRepository contactListMeLabelTextColor](CNUIColorRepository, "contactListMeLabelTextColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (void)applyContactListStyleToEmergencyIcon:(id)a3 ofCell:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0DC3870];
  v7 = a3;
  +[CNUIColorRepository contactListEmergencyContactGlyphColor](CNUIColorRepository, "contactListEmergencyContactGlyphColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", CFSTR("staroflife.fill"), 3, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  objc_msgSend(v7, "sizeToFit");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactListStyle, 0);
}

uint64_t __119__CNContactListStyleApplier_applySubtitleTextColorsToSearchCellContentConfiguration_withSubtitleText_forSelectedState___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "BOOLValue");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1140], *(_QWORD *)(a1 + 40), a3, a4);
  return result;
}

void __57__CNContactListStyleApplier_applyContactListStyleToCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isEditing"))
    objc_msgSend(*(id *)(a1 + 32), "applyEditingStateBackgroundConfigurationToCell:", v6);
  objc_msgSend(*(id *)(a1 + 32), "applyContactListStyleToContentConfiguration:usingState:forCell:", *(_QWORD *)(a1 + 40), v5, v6);

}

+ (void)applyDefaultStyleToContact:(id)a3 usingFormatter:(id)a4 ofCell:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = *MEMORY[0x1E0DC1138];
  v25[0] = *MEMORY[0x1E0DC1138];
  v9 = a4;
  v10 = a3;
  +[CNUIFontRepository contactStyleDefaultTextFont](CNUIFontRepository, "contactStyleDefaultTextFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v25[1] = *MEMORY[0x1E0DC1140];
  +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v12;
  v25[2] = *MEMORY[0x1E0C96788];
  +[CNUIFontRepository contactStyleDefaultBoldTextFont](CNUIFontRepository, "contactStyleDefaultBoldTextFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "attributedStringForObjectValue:withDefaultAttributes:", v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "length"))
  {
    v16 = (void *)objc_msgSend(v14, "mutableCopy");
    +[CNUIFontRepository contactStyleDefaultItalicTextFont](CNUIFontRepository, "contactStyleDefaultItalicTextFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v8);

    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    CNContactsUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NO_NAME"), &stru_1E20507A8, CFSTR("Localized"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "initWithString:attributes:", v20, v16);

    v15 = (void *)v21;
  }
  objc_opt_class();
  objc_msgSend(v7, "contentConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  if (!v24)
  {
    objc_msgSend(v7, "defaultContentConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v22, "setAttributedText:", v15);
  objc_msgSend(v7, "setContentConfiguration:", v22);

}

@end
