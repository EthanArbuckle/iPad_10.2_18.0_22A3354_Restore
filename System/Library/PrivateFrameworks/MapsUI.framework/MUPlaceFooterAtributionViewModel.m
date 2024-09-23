@implementation MUPlaceFooterAtributionViewModel

+ (id)nonInteractableVendorAttributionFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("From [Placecard footer]"));
}

+ (id)interactableVendorAttributionFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("More on [Placecard footer]"));
}

+ (id)transitAttributionFormatString
{
  return _MULocalizedStringFromThisBundle(CFSTR("Transit information provided by [Placecard transit footer]"));
}

+ (id)viewModelForMapItemAttribution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "providerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_attributionViewModelForProviderName:attributionURLs:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)viewModelForGeoMapItemAttribution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "providerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_attributionViewModelForProviderName:attributionURLs:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_attributionViewModelForProviderName:(id)a3 attributionURLs:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  MUPlaceFooterAtributionViewModel *v8;
  void *v9;
  MUPlaceFooterAtributionViewModel *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = objc_msgSend(v6, "count");
    if (v7)
      +[MUPlaceFooterAtributionViewModel interactableVendorAttributionFormatString](MUPlaceFooterAtributionViewModel, "interactableVendorAttributionFormatString");
    else
      +[MUPlaceFooterAtributionViewModel nonInteractableVendorAttributionFormatString](MUPlaceFooterAtributionViewModel, "nonInteractableVendorAttributionFormatString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [MUPlaceFooterAtributionViewModel alloc];
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[MUPlaceFooterAtributionViewModel initWithFormatString:providerNames:isInteractable:](v10, "initWithFormatString:providerNames:isInteractable:", v9, v11, v7 != 0);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)viewModelForMapItem:(id)a3 transitLine:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MUPlaceFooterAtributionViewModel *v12;
  void *v13;
  void *v14;
  MUPlaceFooterAtributionViewModel *v15;

  v5 = a4;
  objc_msgSend(a3, "_transitAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "attribution");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "_providerNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = [MUPlaceFooterAtributionViewModel alloc];
    +[MUPlaceFooterAtributionViewModel transitAttributionFormatString](MUPlaceFooterAtributionViewModel, "transitAttributionFormatString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_providerNames");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MUPlaceFooterAtributionViewModel initWithFormatString:providerNames:isInteractable:](v12, "initWithFormatString:providerNames:isInteractable:", v13, v14, 1);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (MUPlaceFooterAtributionViewModel)initWithFormatString:(id)a3 providerNames:(id)a4 isInteractable:(BOOL)a5
{
  id v9;
  id v10;
  MUPlaceFooterAtributionViewModel *v11;
  MUPlaceFooterAtributionViewModel *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUPlaceFooterAtributionViewModel;
  v11 = -[MUPlaceFooterAtributionViewModel init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_formatString, a3);
    objc_storeStrong((id *)&v12->_providerNames, a4);
    v12->_interactable = a5;
  }

  return v12;
}

- (id)attributedText
{
  NSString *formatString;
  uint64_t v4;
  void *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_providerNames, "count"))
    return (id)objc_opt_new();
  formatString = self->_formatString;
  v22 = *MEMORY[0x1E0DC1140];
  v4 = v22;
  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = formatString;
  objc_msgSend(v5, "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v23 = *MEMORY[0x1E0DC1138];
  v8 = v23;
  v9 = *MEMORY[0x1E0DC4AB8];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", self->_providerNames);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  +[MUInfoCardStyle tintColor](MUInfoCardStyle, "tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0DC1160];
  v21[0] = v13;
  v21[1] = &stru_1E2E05448;
  v20[1] = v14;
  v20[2] = v8;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_interactable)
    v17 = v16;
  else
    v17 = v11;
  MUHighlightedAttributionString(v6, v11, v12, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSArray)providerNames
{
  return self->_providerNames;
}

- (void)setProviderNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)formatString
{
  return self->_formatString;
}

- (BOOL)isInteractable
{
  return self->_interactable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong((id *)&self->_providerNames, 0);
}

@end
