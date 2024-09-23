@implementation MUIGenericSuggestion

+ (id)allMailboxesSuggestionWithSpotlightSuggestion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpotlightSuggestion:isAllMailboxes:", v4, 1);

  return v5;
}

+ (id)genericSuggestionWithSpotlightSuggestion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpotlightSuggestion:isAllMailboxes:", v4, 0);

  return v5;
}

- (MUIGenericSuggestion)initWithSpotlightSuggestion:(id)a3 isAllMailboxes:(BOOL)a4
{
  id v7;
  MUIGenericSuggestion *v8;
  MUIGenericSuggestion *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUIGenericSuggestion;
  v8 = -[MUIGenericSuggestion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_spotlightSuggestion, a3);
    v9->_isAllMailboxes = a4;
  }

  return v9;
}

- (MUIGenericSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MUIGenericSuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_spotlightSuggestion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MUIGenericSuggestion initWithSpotlightSuggestion:isAllMailboxes:](self, "initWithSpotlightSuggestion:isAllMailboxes:", v5, 0);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MUIGenericSuggestion spotlightSuggestion](self, "spotlightSuggestion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_spotlightSuggestion"));

}

- (id)category
{
  void *v3;
  void *v4;

  -[MUISearchAtomSuggestion lastUsedTime](self, "lastUsedTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[MUISearchSuggestionCategory recentGenericCategory](MUISearchSuggestionCategory, "recentGenericCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[MUIGenericSuggestion isAllMailboxes](self, "isAllMailboxes"))
      +[MUISearchSuggestionCategory allMailboxesCategory](MUISearchSuggestionCategory, "allMailboxesCategory");
    else
      +[MUISearchSuggestionCategory genericCategory](MUISearchSuggestionCategory, "genericCategory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)title
{
  void *v2;
  void *v3;

  -[MUIGenericSuggestion attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSAttributedString)attributedTitle
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[MUIGenericSuggestion isRecent](self, "isRecent"))
  {
    -[MUIGenericSuggestion _recentsTitle](self, "_recentsTitle");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[MUIGenericSuggestion isAllMailboxes](self, "isAllMailboxes"))
    {
      -[MUIGenericSuggestion spotlightSuggestion](self, "spotlightSuggestion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedAttributedSuggestion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSAttributedString *)v4;
    }
    -[MUIGenericSuggestion _allMailboxesSuggestionTitle](self, "_allMailboxesSuggestionTitle");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  return (NSAttributedString *)v4;
}

- (id)spotlightSuggestion
{
  return self->_spotlightSuggestion;
}

- (id)image
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[MUIGenericSuggestion isRecent](self, "isRecent");
  v4 = (void *)MEMORY[0x1E0DC3870];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "mui_imageWithSystemSymbolName:", CFSTR("clock.arrow.circlepath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MUIGenericSuggestion spotlightSuggestion](self, "spotlightSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mui_imageFromSuggestionToken:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (UIColor)imageTintColor
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  -[MUIGenericSuggestion spotlightSuggestion](self, "spotlightSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tokenKind");

  switch(v4)
  {
    case 26:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 28:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 29:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 30:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 31:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 32:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return (UIColor *)v5;
}

- (id)subtitle
{
  return 0;
}

- (id)contactIdentifier
{
  return 0;
}

- (int64_t)resultCount
{
  void *v2;
  int64_t v3;

  -[MUIGenericSuggestion spotlightSuggestion](self, "spotlightSuggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resultCount");

  return v3;
}

- (id)accessibilityDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[CSSuggestion suggestionTokens](self->_spotlightSuggestion, "suggestionTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tokenKindAccessibilityDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MUIGenericSuggestion attributedTitle](self, "attributedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MUIGenericSuggestion resultCount](self, "resultCount");
  -[MUIGenericSuggestion spotlightSuggestion](self, "spotlightSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestionTokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> attributedTitle=%@ resultCount=%ld lastTokenKind=%ld"), v4, self, v5, v6, objc_msgSend(v9, "tokenKind"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0D1EF48];
  -[MUIGenericSuggestion attributedTitle](self, "attributedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "partiallyRedactedStringForString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MUIGenericSuggestion resultCount](self, "resultCount");
  -[MUIGenericSuggestion spotlightSuggestion](self, "spotlightSuggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestionTokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> attributedTitle=%@ resultCount=%ld lastTokenKind=%ld"), v4, self, v8, v9, objc_msgSend(v12, "tokenKind"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isRecent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MUIGenericSuggestion category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUISearchSuggestionCategory recentGenericCategory](MUISearchSuggestionCategory, "recentGenericCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2 == v3;

  return v4;
}

- (BOOL)isAllMailboxes
{
  return self->_isAllMailboxes;
}

- (id)_allMailboxesSuggestionTitle
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SuggestionsMenuItemTitle"), &stru_1E99EB1C8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithString:", v4);

  return v5;
}

- (id)_recentsTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[MUIGenericSuggestion spotlightSuggestion](self, "spotlightSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E99EB1C8);
  v5 = v4;
  if (v3)
  {
    v29 = *MEMORY[0x1E0DC1140];
    v6 = v29;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v6;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "currentTokens");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __37__MUIGenericSuggestion__recentsTitle__block_invoke;
    v24[3] = &unk_1E99E28C0;
    v12 = v10;
    v25 = v12;
    v13 = v8;
    v26 = v13;
    objc_msgSend(v11, "ef_compactMap:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "userQueryString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (v16)
    {
      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v3, "userQueryString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v18, v12);
      objc_msgSend(v14, "arrayByAddingObject:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
    }
    -[MUIGenericSuggestion _joinRecentsTitleComponents:](self, "_joinRecentsTitleComponents:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v21;
  }
  else
  {
    v22 = v4;
  }

  return v22;
}

id __37__MUIGenericSuggestion__recentsTitle__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "displayText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "scopes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") && (v7 = objc_msgSend(v3, "selectedScope"), v7 < objc_msgSend(v6, "count")))
    {
      v8 = objc_alloc(MEMORY[0x1E0CB3778]);
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v3, "selectedScope"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MUILocalizedTokenAndStringSeparator();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@ "), v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v8, "initWithString:attributes:", v12, *(_QWORD *)(a1 + 40));

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, *(_QWORD *)(a1 + 32));
      objc_msgSend(v13, "appendAttributedString:", v14);

    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, *(_QWORD *)(a1 + 32));
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_joinRecentsTitleComponents:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = (id)0xAAAAAAAAAAAAAAAALL;
  v21 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  MUILocalizedTokenSeparator();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__MUIGenericSuggestion__joinRecentsTitleComponents___block_invoke;
  v13 = &unk_1E99E28E8;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__MUIGenericSuggestion__joinRecentsTitleComponents___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendAttributedString:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "appendAttributedString:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightSuggestion, 0);
}

@end
