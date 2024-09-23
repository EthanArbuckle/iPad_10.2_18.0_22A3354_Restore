@implementation MUContactsViewModelGenerator

- (MUContactsViewModelGenerator)initWithContact:(id)a3
{
  id v5;
  MUContactsViewModelGenerator *v6;
  MUContactsViewModelGenerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUContactsViewModelGenerator;
  v6 = -[MUContactsViewModelGenerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contact, a3);

  return v7;
}

- (id)viewModelForAddress:(id)a3
{
  id v3;
  MULabeledValueActionViewModel *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(MULabeledValueActionViewModel);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97200], "_mapkit_sharedLocationContactIdentifer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
    v8 = CFSTR("Shared Location Address [Placecard]");
  else
    v8 = CFSTR("Address [Placecard]");
  _MULocalizedStringFromThisBundle(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionViewModel setTitleString:](v4, "setTitleString:", v9);

  v10 = (void *)MEMORY[0x1E0C973B0];
  objc_msgSend(v3, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromPostalAddress:style:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionViewModel setValueString:](v4, "setValueString:", v12);

  -[MULabeledValueActionViewModel setAnalyticsTarget:](v4, "setAnalyticsTarget:", 1502);
  +[MUContactsViewModelGenerator symbolImageForAddressItem](MUContactsViewModelGenerator, "symbolImageForAddressItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MULabeledValueActionViewModel setSymbolName:](v4, "setSymbolName:", v13);

  return v4;
}

- (id)headerLabelFromAddress:(id)a3
{
  id v3;
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96FF8]);

  if (v5)
  {
    v6 = CFSTR("Home [Placecard]");
LABEL_11:
    _MULocalizedStringFromThisBundle(v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v3, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C97070]);

  if (v8)
  {
    v6 = CFSTR("Work [Placecard]");
    goto LABEL_11;
  }
  objc_msgSend(v3, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C97060]);

  if (v10)
  {
    v6 = CFSTR("School [Placecard]");
    goto LABEL_11;
  }
  objc_msgSend(v3, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v6 = CFSTR("Details [Placecard]");
    goto LABEL_11;
  }
  v12 = (void *)MEMORY[0x1E0C97338];
  objc_msgSend(v3, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForLabel:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v14;
  }
  else
  {
    _MULocalizedStringFromThisBundle(CFSTR("Other [Placecard]"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

LABEL_12:
  return v16;
}

- (id)sectionViewsFromContentViews:(id)a3 headerLabels:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__MUContactsViewModelGenerator_sectionViewsFromContentViews_headerLabels___block_invoke;
  v9[3] = &unk_1E2E03918;
  v10 = v5;
  v6 = v5;
  MUMap(a3, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __74__MUContactsViewModelGenerator_sectionViewsFromContentViews_headerLabels___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  MUPlaceSectionHeaderViewModel *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MUPlaceSectionHeaderViewModel initWithTitleString:showSeeMore:]([MUPlaceSectionHeaderViewModel alloc], "initWithTitleString:showSeeMore:", v6, 0);
  +[MUPlaceSectionView cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:](MUPlaceSectionView, "cardShadowSectionViewForContentView:sectionHeaderViewModel:sectionFooterViewModel:alwaysInsetContentView:", v5, v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@Section"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityIdentifier:", v11);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@PlaceDetailsSection"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHeaderAXIdentifierWithBaseString:", v12);

  return v8;
}

+ (id)symbolImageForAddressItem
{
  if (MapKitIdiomIsMacCatalyst())
    return CFSTR("arrow.triangle.turn.up.right.circle");
  else
    return CFSTR("arrow.triangle.turn.up.right.circle.fill");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
