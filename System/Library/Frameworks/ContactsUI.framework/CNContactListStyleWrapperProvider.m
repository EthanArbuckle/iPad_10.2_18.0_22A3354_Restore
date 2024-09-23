@implementation CNContactListStyleWrapperProvider

- (BOOL)usesInsetPlatterStyle
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    return 0;
  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesInsetPlatterStyle");

  return v6;
}

- (int64_t)tableSeparatorStyle
{
  void *v2;
  int64_t v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 2 * (objc_msgSend(v2, "separatorStyle") == 0);

  return v3;
}

- (CNContactStyle)contactStyle
{
  return self->_contactStyle;
}

- (BOOL)cellIsOpaque
{
  void *v2;
  char v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesOpaqueBackground");

  return v3;
}

- (id)cellBackgroundColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellNameTextFont
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellNameTextEmphasisedFont
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boldTextFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellNameTextColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CNContactListStyleWrapperProvider)initWithContactStyle:(id)a3
{
  id v5;
  CNContactListStyleWrapperProvider *v6;
  CNContactListStyleWrapperProvider *v7;
  CNContactListStyleWrapperProvider *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactListStyleWrapperProvider;
  v6 = -[CNContactListStyleWrapperProvider init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStyle, a3);
    v8 = v7;
  }

  return v7;
}

- (id)tableBackgroundFilteredColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupedBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tableBackgroundColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)tableIsOpaque
{
  void *v2;
  char v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesOpaqueBackground");

  return v3;
}

- (id)searchBarTextColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)searchBarStyle
{
  void *v2;
  int64_t v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "barStyle");

  return v3;
}

- (id)searchBarPlaceholderTextColor
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
  uint64_t v15;
  double v17;
  double v18;
  double v19;
  double v20;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_4:
    if (v6)
      goto LABEL_8;
    goto LABEL_5;
  }
  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v19 = 0.0;
    v20 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v20, v19, v18, v17 * 0.5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  v4 = 0;
  if (v6)
    goto LABEL_8;
LABEL_5:
  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "readOnlyTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v19 = 0.0;
    v20 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "readOnlyTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v20, v19, v18, v17 * 0.5);
    v15 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v15;
  }
LABEL_8:

  return v4;
}

- (int64_t)searchBarKeyboardAppearance
{
  void *v2;
  int64_t v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardAppearance");

  return v3;
}

- (BOOL)searchBarIsTranslucent
{
  void *v2;
  char v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesTranslucentBarStyle");

  return v3;
}

- (id)searchBarBackgroundColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBarBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)navigationBarStyle
{
  void *v2;
  int64_t v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "barStyle");

  return v3;
}

- (BOOL)navigationBarIsTranslucent
{
  void *v2;
  char v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesTranslucentBarStyle");

  return v3;
}

- (id)bannerTitleTextColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellBackgroundSelectedColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedCellBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellNameTextHighlightedColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightedTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellSearchBackgroundColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchCellBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellSearchResultTextColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellSearchResultTextDisabledColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disabledTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cellBlueSelectionSecondaryTextColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blueSelectionSecondaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)cellIsVibrant
{
  void *v2;
  char v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blurSupported");

  return v3;
}

- (id)headerBackgroundColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "headerBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "headerBackgroundColor");
  else
    objc_msgSend(v5, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)headerIndexTextColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tableSectionIndexBackgroundColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIndexBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tableSeparatorColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)tableNoContactsAvailableStyle
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "barStyle"))
  {
    v4 = 1;
  }
  else
  {
    -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "blurSupported");

  }
  return v4;
}

- (int64_t)tableSeparatorOverlayBlendMode
{
  void *v2;
  int64_t v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "separatorBackdropOverlayBlendMode");

  return v3;
}

- (int64_t)listAppearanceForTraitCollection:(id)a3
{
  return 4 * (objc_msgSend(a3, "_splitViewControllerContext") == 3);
}

- (id)searchBarTextDisabledColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readOnlyTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)searchBarPlaceholderTextDisabledColor
{
  void *v2;
  void *v3;

  -[CNContactListStyleWrapperProvider contactStyle](self, "contactStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStyle, 0);
}

@end
