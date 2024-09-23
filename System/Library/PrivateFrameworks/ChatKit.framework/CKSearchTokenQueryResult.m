@implementation CKSearchTokenQueryResult

- (CKSearchTokenQueryResult)initWithContentType:(unint64_t)a3 filterOptions:(unint64_t)a4 conversation:(id)a5 itemIdentifier:(id)a6 tokenAddresses:(id)a7
{
  id v12;
  id v13;
  id v14;
  CKSearchTokenQueryResult *v15;
  CKSearchTokenQueryResult *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CKSearchTokenQueryResult;
  v15 = -[CKSearchTokenQueryResult init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    -[CKSearchTokenQueryResult setContentType:](v15, "setContentType:", a3);
    -[CKSearchTokenQueryResult setItemIdentifier:](v16, "setItemIdentifier:", v13);
    -[CKSearchTokenQueryResult setTokenAddresses:](v16, "setTokenAddresses:", v14);
    -[CKSearchTokenQueryResult setFilterOptions:](v16, "setFilterOptions:", a4);
    if (v12)
      -[CKSpotlightQueryResult setConversation:](v16, "setConversation:", v12);
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[CKSearchTokenQueryResult tokenText](v16, "tokenText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%@"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKSpotlightQueryResult setIdentifier:](v16, "setIdentifier:", v20);
  }

  return v16;
}

- (UISearchToken)searchToken
{
  UISearchToken *searchToken;
  CKSearchTokenFilter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UISearchToken *v9;
  UISearchToken *v10;

  searchToken = self->_searchToken;
  if (!searchToken)
  {
    v4 = -[CKSearchTokenFilter initWithContentType:filterOptions:itemIdentifier:tokenAddresses:]([CKSearchTokenFilter alloc], "initWithContentType:filterOptions:itemIdentifier:tokenAddresses:", self->_contentType, self->_filterOptions, self->_itemIdentifier, self->_tokenAddresses);
    -[CKSpotlightQueryResult conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchTokenFilter setConversation:](v4, "setConversation:", v5);

    v6 = (void *)MEMORY[0x1E0CEA988];
    -[CKSearchTokenQueryResult image](self, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchTokenQueryResult tokenText](self, "tokenText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tokenWithIcon:text:", v7, v8);
    v9 = (UISearchToken *)objc_claimAutoreleasedReturnValue();

    -[UISearchToken setRepresentedObject:](v9, "setRepresentedObject:", v4);
    v10 = self->_searchToken;
    self->_searchToken = v9;

    searchToken = self->_searchToken;
  }
  return searchToken;
}

- (id)image
{
  const __CFString *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  v2 = CFSTR("link");
  switch(self->_contentType)
  {
    case 0uLL:
      -[CKSpotlightQueryResult conversation](self, "conversation", CFSTR("link"));
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4
        && (v5 = (void *)v4,
            -[CKSpotlightQueryResult conversation](self, "conversation"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "isGroupConversation"),
            v6,
            v5,
            (v7 & 1) != 0))
      {
        v2 = CFSTR("person.2.circle");
      }
      else
      {
        v2 = CFSTR("person.crop.circle");
      }
      break;
    case 2uLL:
      break;
    case 3uLL:
      v2 = CFSTR("photo");
      break;
    case 4uLL:
      v2 = CFSTR("mappin.and.ellipse");
      break;
    case 5uLL:
      v2 = CFSTR("wallet.pass");
      break;
    case 6uLL:
      v2 = CFSTR("doc");
      break;
    case 8uLL:
      v2 = CFSTR("calendar");
      break;
    default:
      v2 = CFSTR("message");
      break;
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tokenText
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;

  -[CKSpotlightQueryResult conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKSpotlightQueryResult conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasDisplayName");
    -[CKSpotlightQueryResult conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 1) != 0)
      objc_msgSend(v6, "displayName");
    else
      objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKSearchTokenQueryResult itemIdentifier](self, "itemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[CKSearchTokenQueryResult hasFilterOption:](self, "hasFilterOption:", 2))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FROM_%@"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

    if (v14 == 1)
      v15 = CFSTR("\u200F");
    else
      v15 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v12);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v16;
  }
  return v8;
}

- (id)attributedSuggestionTextForSearchText:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKSpotlightQueryResult conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKSpotlightQueryResult conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasDisplayName");
    -[CKSpotlightQueryResult conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v10 & 1) != 0)
      objc_msgSend(v11, "displayName");
    else
      objc_msgSend(v11, "searchDisplayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKSearchTokenQueryResult itemIdentifier](self, "itemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:](CKSpotlightQueryUtilities, "annotatedResultStringWithSearchText:resultText:primaryTextColor:primaryFont:annotatedTextColor:annotatedFont:", v6, v13, v14, v7, v15, v7);
  else
    +[CKSpotlightQueryUtilities annotatedResultStringWithSearchText:resultText:primaryTextColor:annotatedTextColor:](CKSpotlightQueryUtilities, "annotatedResultStringWithSearchText:resultText:primaryTextColor:annotatedTextColor:", v6, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKSearchTokenQueryResult contentType](self, "contentType"))
    goto LABEL_11;
  -[CKSpotlightQueryResult conversation](self, "conversation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    goto LABEL_11;
  if (-[CKSearchTokenQueryResult hasFilterOption:](self, "hasFilterOption:", 2))
  {
    CKFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = CFSTR("MESSAGES_FROM_%@");
  }
  else
  {
    -[CKSpotlightQueryResult conversation](self, "conversation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isGroupConversation");

    CKFrameworkBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    v22 = v24 ? CFSTR("MESSAGES_IN_%@") : CFSTR("MESSAGES_WITH_%@");
  }
  objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E276D870, CFSTR("ChatKit"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_alloc(MEMORY[0x1E0CB3498]);
    v30 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithString:attributes:", v25, v28);

    objc_msgSend(MEMORY[0x1E0CB3498], "localizedAttributedStringWithFormat:", v29, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_11:
    v17 = v16;
  }

  return v17;
}

- (BOOL)hasFilterOption:(unint64_t)a3
{
  return (a3 & ~-[CKSearchTokenQueryResult filterOptions](self, "filterOptions")) == 0;
}

- (void)addFilterOption:(unint64_t)a3
{
  -[CKSearchTokenQueryResult setFilterOptions:](self, "setFilterOptions:", -[CKSearchTokenQueryResult filterOptions](self, "filterOptions") | a3);
}

- (void)setSearchToken:(id)a3
{
  objc_storeStrong((id *)&self->_searchToken, a3);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)tokenAddresses
{
  return self->_tokenAddresses;
}

- (void)setTokenAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_tokenAddresses, a3);
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(unint64_t)a3
{
  self->_filterOptions = a3;
}

- (CKSearchTokenFilter)associatedStagedFilter
{
  return (CKSearchTokenFilter *)objc_loadWeakRetained((id *)&self->_associatedStagedFilter);
}

- (void)setAssociatedStagedFilter:(id)a3
{
  objc_storeWeak((id *)&self->_associatedStagedFilter, a3);
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedStagedFilter);
  objc_storeStrong((id *)&self->_tokenAddresses, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_searchToken, 0);
}

@end
