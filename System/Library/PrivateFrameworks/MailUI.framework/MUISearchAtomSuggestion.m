@implementation MUISearchAtomSuggestion

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MUISearchAtomSuggestion_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1)
    dispatch_once(&log_onceToken_13, block);
  return (id)log_log_13;
}

void __30__MUISearchAtomSuggestion_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;

}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MUISearchAtomSuggestion;
  -[MUISearchSuggestion description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUISearchAtomSuggestion title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUISearchAtomSuggestion subtitle](self, "subtitle");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR(" - ");
  v7 = &stru_1E99EB1C8;
  if (v5)
    v7 = v5;
  else
    v6 = &stru_1E99EB1C8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@%@%@"), v3, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)ef_publicDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MUISearchAtomSuggestion;
  -[MUISearchSuggestion description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D1EF48];
  -[MUISearchAtomSuggestion title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "partiallyRedactedStringForString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D1EF48];
  -[MUISearchAtomSuggestion subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "partiallyRedactedStringForString:", v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v10 = CFSTR(" - ");
  v11 = &stru_1E99EB1C8;
  if (v9)
    v11 = v9;
  else
    v10 = &stru_1E99EB1C8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@%@%@"), v3, v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)title
{
  -[MUISearchAtomSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUISearchAtomSuggestion title]", "MUISearchSuggestion.m", 103, "0");
}

- (NSString)subtitle
{
  -[MUISearchAtomSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUISearchAtomSuggestion subtitle]", "MUISearchSuggestion.m", 107, "0");
}

- (NSString)contactIdentifier
{
  -[MUISearchAtomSuggestion doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUISearchAtomSuggestion contactIdentifier]", "MUISearchSuggestion.m", 111, "0");
}

- (id)predicateWithSelectedScope:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUISearchSuggestion.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scope"));

  }
  objc_msgSend(v5, "predicateForSuggestion:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[MUISearchSuggestion category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UIColor)focusedTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (UIImage)atomImage
{
  void *v2;
  void *v3;

  -[MUISearchSuggestion category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "atomImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (int64_t)option
{
  return 0;
}

+ (id)suggestionFromSpotlightSuggestion:(id)a3 shouldShowAvaters:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v25;
  id v26;
  id v27;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "suggestionTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "tokenKind");
  if (v4 && v8 == 16)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "displayText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    v13 = NSSelectorFromString(CFSTR("itemSummary"));
    v14 = NSSelectorFromString(CFSTR("name"));
    v15 = NSSelectorFromString(CFSTR("emailAddresses"));
    v16 = NSSelectorFromString(CFSTR("contactIdentifier"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v11;
      v18 = objc_opt_class();
      __79__MUISearchAtomSuggestion_suggestionFromSpotlightSuggestion_shouldShowAvaters___block_invoke(v18, &v27, v14, v17);
      v19 = v27;

      v26 = v12;
      v20 = objc_opt_class();
      __79__MUISearchAtomSuggestion_suggestionFromSpotlightSuggestion_shouldShowAvaters___block_invoke(v20, &v26, v15, v17);
      v21 = v26;

      v25 = 0;
      v22 = objc_opt_class();
      __79__MUISearchAtomSuggestion_suggestionFromSpotlightSuggestion_shouldShowAvaters___block_invoke(v22, &v25, v16, v17);
      v23 = v25;

      v11 = v19;
      v12 = v21;
    }
    +[MUIGenericSuggestion genericSuggestionWithSpotlightSuggestion:](MUIGenericSuggestion, "genericSuggestionWithSpotlightSuggestion:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void __79__MUISearchAtomSuggestion_suggestionFromSpotlightSuggestion_shouldShowAvaters___block_invoke(uint64_t a1, _QWORD *a2, const char *a3, void *a4)
{
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = objc_opt_respondsToSelector();
  v7 = v9;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v9, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *a2 = objc_retainAutorelease(v8);

    v7 = v9;
  }

}

+ (id)allMailboxesSuggestionFromSpotlightSuggestion:(id)a3
{
  return +[MUIGenericSuggestion allMailboxesSuggestionWithSpotlightSuggestion:](MUIGenericSuggestion, "allMailboxesSuggestionWithSpotlightSuggestion:", a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (NSDate)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
