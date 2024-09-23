@implementation CSSuggestion

+ (id)emptySuggestion
{
  CSSuggestion *v2;
  CSSuggestion *v3;

  v2 = [CSSuggestion alloc];
  v3 = -[CSSuggestion initWithUserString:currentSuggestion:updatedSuggestionTokens:](v2, "initWithUserString:currentSuggestion:updatedSuggestionTokens:", 0, 0, MEMORY[0x1E0C9AA60]);
  -[CSSuggestion setEnableFragments:](v3, "setEnableFragments:", 1);
  return v3;
}

- (void)setEnableFragments:(BOOL)a3
{
  self->_enableFragments = a3;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 updatedSuggestionTokens:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSSuggestion *v11;
  CSSuggestion *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSSuggestion;
  v11 = -[CSSuggestion init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v11, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v8, v9, 0, v10);
    v12->_updated = 1;
  }

  return v12;
}

- (void)commonInitWithUserString:(id)a3 currentSuggestion:(id)a4 currentSuggestionToken:(id)a5 updatedSuggestionTokens:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "suggestionTokens");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v14 = objc_msgSend(v10, "enableFragments");
  else
    v14 = 0;
  -[CSSuggestion commonInitWithUserString:currentSuggestionToken:previousSuggestionTokens:updatedSuggestionTokens:enableFragments:](self, "commonInitWithUserString:currentSuggestionToken:previousSuggestionTokens:updatedSuggestionTokens:enableFragments:", v15, v11, v13, v12, v14);

}

- (void)commonInitWithUserString:(id)a3 currentSuggestionToken:(id)a4 previousSuggestionTokens:(id)a5 updatedSuggestionTokens:(id)a6 enableFragments:(BOOL)a7
{
  _CSSuggestionToken *v12;
  NSArray *v13;
  NSArray *v14;
  __CFString *v15;
  id v16;
  NSString *displayString;
  NSString *userQueryString;
  NSArray *previousSuggestionTokens;
  NSArray *v20;
  NSArray *updatedSuggestionTokens;
  NSArray *v22;
  NSAttributedString *localizedAttributedString;
  NSArray *suggestionTokens;
  _CSSuggestionToken *currentSuggestionToken;

  v12 = (_CSSuggestionToken *)a4;
  v13 = (NSArray *)a5;
  v14 = (NSArray *)a6;
  if (a3)
    v15 = (__CFString *)a3;
  else
    v15 = &stru_1E2406B38;
  objc_storeStrong((id *)&self->_searchString, v15);
  v16 = a3;
  displayString = self->_displayString;
  self->_displayString = 0;

  userQueryString = self->_userQueryString;
  self->_userQueryString = 0;

  previousSuggestionTokens = self->_previousSuggestionTokens;
  self->_previousSuggestionTokens = v13;
  v20 = v13;

  updatedSuggestionTokens = self->_updatedSuggestionTokens;
  self->_updatedSuggestionTokens = v14;
  v22 = v14;

  localizedAttributedString = self->_localizedAttributedString;
  self->_localizedAttributedString = 0;

  suggestionTokens = self->_suggestionTokens;
  self->_suggestionTokens = 0;

  currentSuggestionToken = self->_currentSuggestionToken;
  self->_currentSuggestionToken = v12;

  *(_OWORD *)&self->_rank = xmmword_18C4EDFA0;
  self->_resultCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_enableFragments = a7;
  self->_updated = 0;
}

+ (CSSuggestion)suggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5;
  id v6;
  CSSuggestion *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CSSuggestion initWithUserString:currentSuggestion:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:", v6, v5);

  return v7;
}

+ (CSSuggestion)suggestionWithUserString:(id)a3 currentSuggestion:(id)a4 updatedSuggestionTokens:(id)a5
{
  id v7;
  id v8;
  id v9;
  CSSuggestion *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CSSuggestion initWithUserString:currentSuggestion:updatedSuggestionTokens:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:updatedSuggestionTokens:", v9, v8, v7);

  return v10;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 userString:(id)a4 tokens:(id)a5
{
  id v7;
  id v8;
  id v9;
  CSSuggestion *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CSSuggestion initWithUserString:currentSuggestion:updatedSuggestionTokens:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:updatedSuggestionTokens:", v8, v9, v7);

  return v10;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 token:(id)a4 scopeSelection:(unint64_t)a5
{
  id v7;

  v7 = a3;
  if (v7 && a4)
    objc_msgSend(a4, "updateScopeSelection:", a5);
  return v7;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 token:(id)a4 tokenText:(id)a5
{
  id v7;

  v7 = a3;
  if (v7 && a4)
    objc_msgSend(a4, "updateTokenText:", a5);
  return v7;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 highlightedText:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "updatedSuggestionWithCurrentSuggestion:highlightedText:highlightedRange:", v7, v6, 0, objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 highlightedText:(id)a4 highlightedRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  CSTokenScopeParser *v11;
  void *v12;
  CSSuggestion *v13;

  length = a5.length;
  location = a5.location;
  v8 = a3;
  objc_msgSend(a4, "substringWithRange:", location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userQueryString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(CSTokenScopeParser);
  -[CSTokenScopeParser suggestionTokenForString:](v11, "suggestionTokenForString:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[CSSuggestion initWithUserString:currentSuggestion:currentSuggestionToken:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:currentSuggestionToken:", v10, v8, v12);
    -[CSSuggestion setEnableFragments:](v13, "setEnableFragments:", 1);
  }
  else
  {
    v13 = (CSSuggestion *)v8;
  }

  return v13;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 interaction:(int)a4
{
  id v5;
  void *v6;
  CSSuggestion *v7;
  CSTokenScopeParser *v8;
  uint64_t v9;
  void *v10;
  CSSuggestion *v11;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a4 - 10) > 0xFFFFFFFD)
  {
    v8 = objc_alloc_init(CSTokenScopeParser);
    -[CSTokenScopeParser suggestionTokenForString:](v8, "suggestionTokenForString:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (a4 == 9 && !v9)
    {
      -[CSTokenScopeParser messageSuggestionTokenForString:](v8, "messageSuggestionTokenForString:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v10)
    {
      v11 = [CSSuggestion alloc];
      objc_msgSend(v5, "userQueryString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CSSuggestion initWithUserString:currentSuggestion:currentSuggestionToken:](v11, "initWithUserString:currentSuggestion:currentSuggestionToken:", v12, v5, v10);

      -[CSSuggestion setEnableFragments:](v7, "setEnableFragments:", 1);
    }
    else
    {
      v7 = (CSSuggestion *)v5;
    }

  }
  else
  {
    v7 = (CSSuggestion *)v5;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)noreplyTemplates
{
  if (noreplyTemplates_onceToken != -1)
    dispatch_once(&noreplyTemplates_onceToken, &__block_literal_global_821);
  return (id)noreplyTemplates_noreplyTemplates;
}

void __32__CSSuggestion_noreplyTemplates__block_invoke()
{
  void *v0;

  v0 = (void *)noreplyTemplates_noreplyTemplates;
  noreplyTemplates_noreplyTemplates = (uint64_t)&unk_1E242F910;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[CSSuggestion update](self, "update");
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, CFSTR("searchString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayString, CFSTR("displayString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_userQueryString, CFSTR("userQueryString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_previousSuggestionTokens, CFSTR("previousSuggestionTokens"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_updatedSuggestionTokens, CFSTR("updatedSuggestionTokens"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedAttributedString, CFSTR("localizedAttributedString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_suggestionTokens, CFSTR("suggestionTokens"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentSuggestionToken, CFSTR("currentSuggestionToken"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_resultCount, CFSTR("resultCount"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_enableFragments, CFSTR("suggestFragments"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_updated, CFSTR("updated"));

}

- (CSSuggestion)initWithCoder:(id)a3
{
  id v4;
  CSSuggestion *v5;
  CSSuggestion *v6;
  uint64_t v7;
  NSString *searchString;
  uint64_t v9;
  NSString *displayString;
  uint64_t v11;
  NSString *userQueryString;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *previousSuggestionTokens;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *updatedSuggestionTokens;
  uint64_t v23;
  NSAttributedString *localizedAttributedString;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *suggestionTokens;
  uint64_t v30;
  _CSSuggestionToken *currentSuggestionToken;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CSSuggestion;
  v5 = -[CSSuggestion init](&v33, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v5, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", 0, 0, 0, 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v7 = objc_claimAutoreleasedReturnValue();
    searchString = v6->_searchString;
    v6->_searchString = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayString"));
    v9 = objc_claimAutoreleasedReturnValue();
    displayString = v6->_displayString;
    v6->_displayString = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userQueryString"));
    v11 = objc_claimAutoreleasedReturnValue();
    userQueryString = v6->_userQueryString;
    v6->_userQueryString = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("previousSuggestionTokens"));
    v16 = objc_claimAutoreleasedReturnValue();
    previousSuggestionTokens = v6->_previousSuggestionTokens;
    v6->_previousSuggestionTokens = (NSArray *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("updatedSuggestionTokens"));
    v21 = objc_claimAutoreleasedReturnValue();
    updatedSuggestionTokens = v6->_updatedSuggestionTokens;
    v6->_updatedSuggestionTokens = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAttributedString"));
    v23 = objc_claimAutoreleasedReturnValue();
    localizedAttributedString = v6->_localizedAttributedString;
    v6->_localizedAttributedString = (NSAttributedString *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("suggestionTokens"));
    v28 = objc_claimAutoreleasedReturnValue();
    suggestionTokens = v6->_suggestionTokens;
    v6->_suggestionTokens = (NSArray *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentSuggestionToken"));
    v30 = objc_claimAutoreleasedReturnValue();
    currentSuggestionToken = v6->_currentSuggestionToken;
    v6->_currentSuggestionToken = (_CSSuggestionToken *)v30;

    v6->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v6->_resultCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resultCount"));
    v6->_enableFragments = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suggestFragments"));
    v6->_updated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("updated"));
    v6->_rank = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v6;
  id v7;
  CSSuggestion *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSSuggestion;
  v8 = -[CSSuggestion init](&v11, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "suggestionTokens");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v8, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v6, v7, 0, v9);

    v8->_updated = 1;
  }

  return v8;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 currentSuggestionToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSSuggestion *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSSuggestion;
  v11 = -[CSSuggestion init](&v14, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "suggestionTokens");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v11, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v8, v9, v10, v12);

  }
  return v11;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 displayString:(id)a5 score:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CSSuggestion *v14;
  _CSSuggestionToken *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CSSuggestion;
  v14 = -[CSSuggestion init](&v18, sel_init);
  if (v14)
  {
    v15 = -[_CSSuggestionToken initWithUserString:displayString:score:]([_CSSuggestionToken alloc], "initWithUserString:displayString:score:", v10, v12, v13);
    objc_msgSend(v11, "suggestionTokens");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v14, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v10, v11, v15, v16);

  }
  return v14;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 internalType:(int64_t)a5
{
  __CFString *v8;
  id v9;
  __CFString *v10;
  _CSSuggestionToken *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  _CSSuggestionToken *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  CSSuggestion *v24;
  void *v25;
  objc_super v27;

  v8 = (__CFString *)a3;
  v9 = a4;
  objc_msgSend(v9, "searchString");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  switch(a5)
  {
    case 5:
      v11 = -[_CSSuggestionToken initWithUserString:displayString:]([_CSSuggestionToken alloc], "initWithUserString:displayString:", v8, v8);
      goto LABEL_12;
    case 7:
      objc_msgSend(v9, "searchStringByRemovingPrefixForScopeKey:", CFSTR("SUBJECT_TOKEN"));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      +[_CSTokenScope tokenScopesForSubjectContains](_CSTokenScope, "tokenScopesForSubjectContains");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_CSSuggestionToken initWithUserString:tokenScopes:selectedIndex:displayString:internalType:]([_CSSuggestionToken alloc], "initWithUserString:tokenScopes:selectedIndex:displayString:internalType:", v12, v13, 0, v12, 7);
      localizedDisplayText(CFSTR("SUBJECT_CONTAINS_PREFIX"), v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CSSuggestionToken setSuggestionDisplayText:](v11, "setSuggestionDisplayText:", v14);

      v10 = v12;
      goto LABEL_12;
    case 8:
      +[_CSTokenScope tokenScopesForAttachmentNameContains](_CSTokenScope, "tokenScopesForAttachmentNameContains");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_CSSuggestionToken initWithUserString:tokenScopes:selectedIndex:displayString:internalType:]([_CSSuggestionToken alloc], "initWithUserString:tokenScopes:selectedIndex:displayString:internalType:", v10, v15, 0, v10, 8);
      v16 = CFSTR("ATTACHMENT_NAME_CONTAINS_PREFIX");
      v17 = v10;
      goto LABEL_6;
    case 9:
      +[_CSTokenScope tokenScopesForMessageWithAttachments](_CSTokenScope, "tokenScopesForMessageWithAttachments");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = [_CSSuggestionToken alloc];
      CSGetLocalizedString(CFSTR("TOKEN_TEXT_ANY"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[_CSSuggestionToken initWithUserString:tokenScopes:selectedIndex:displayString:internalType:](v18, "initWithUserString:tokenScopes:selectedIndex:displayString:internalType:", &stru_1E2406B38, v15, 0, v19, 9);

      v16 = CFSTR("MESSAGE_WITH_ATTACHMENTS_PREFIX");
      v17 = &stru_1E2406B38;
LABEL_6:
      localizedDisplayText(v16, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CSSuggestionToken setSuggestionDisplayText:](v11, "setSuggestionDisplayText:", v20);

      goto LABEL_11;
    case 10:
      +[_CSTokenScope tokenScopesForSenderContains](_CSTokenScope, "tokenScopesForSenderContains");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[__CFString length](v8, "length"))
        v21 = v8;
      else
        v21 = v10;
      v22 = v21;
      v11 = -[_CSSuggestionToken initWithUserString:tokenScopes:selectedIndex:displayString:internalType:]([_CSSuggestionToken alloc], "initWithUserString:tokenScopes:selectedIndex:displayString:internalType:", v22, v15, 0, v22, 10);
      localizedDisplayText(CFSTR("SENDER_CONTAINS_PREFIX"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[_CSSuggestionToken setSuggestionDisplayText:](v11, "setSuggestionDisplayText:", v23);
LABEL_11:

LABEL_12:
      if (v11)
      {
        v27.receiver = self;
        v27.super_class = (Class)CSSuggestion;
        v24 = -[CSSuggestion init](&v27, sel_init);
        if (v24)
        {
          objc_msgSend(v9, "suggestionTokens");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v24, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v8, v9, v11, v25);

        }
        self = v24;

        v11 = (_CSSuggestionToken *)self;
      }
      break;
    default:
      break;
  }

  return (CSSuggestion *)v11;
}

- (id)searchStringByRemovingPrefixForScopeKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[CSSuggestion searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    CSGetLocalizedString(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedLowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedLowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v10);

    if (v13)
    {
      objc_msgSend(v8, "subarrayWithRange:", 1, objc_msgSend(v8, "count") - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR(":"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "length"))
      {
        v18 = v17;

        v5 = v18;
      }

    }
  }

  return v5;
}

- (id)addSuggestionHighlight:(id)a3 withDisplayText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  __CFString *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v6);
  if (objc_msgSend(v5, "length") && objc_msgSend(v7, "length"))
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__3;
    v34[4] = __Block_byref_object_dispose__3;
    v35 = &stru_1E2406B38;
    v28 = 0;
    v29 = &v28;
    v30 = 0x3010000000;
    v32 = 0;
    v33 = 0;
    v31 = "";
    v8 = objc_msgSend(v7, "length");
    v32 = 0;
    v33 = v8;
    v9 = objc_msgSend(v5, "length");
    v10 = *MEMORY[0x1E0CB2D28];
    v11 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke;
    v21[3] = &unk_1E24018D8;
    v22 = v5;
    v12 = v6;
    v23 = v12;
    v25 = &v28;
    v13 = v7;
    v24 = v13;
    v26 = &v36;
    v27 = v34;
    objc_msgSend(v22, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v9, v10, 6, 0, v21);
    if (*((_DWORD *)v37 + 6) == 1)
    {
      v14 = v29;
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke_3;
      v16[3] = &unk_1E2401900;
      v17 = v12;
      v19 = v34;
      v18 = v13;
      v20 = &v28;
      objc_msgSend(v17, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", v14[4], v14[5], v10, 6, 0, v16);

    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(v34, 8);

    _Block_object_dispose(&v36, 8);
  }

  return v7;
}

void __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  __int128 v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedLowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *MEMORY[0x1E0CB2D28];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke_2;
  v10[3] = &unk_1E24018B0;
  v11 = v4;
  v12 = v3;
  v13 = *(id *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(v5 + 32);
  v8 = *(_QWORD *)(v5 + 40);
  v9 = v3;
  objc_msgSend(v11, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", v7, v8, v6, 6, 0, v10);

}

void __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", *(_QWORD *)(a1 + 40), 393, a3, a4);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v9;
    v12 = v10;
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", CFSTR("CSSuggestionHighlightAttribute"), *(_QWORD *)(a1 + 40), v9, v10);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v11 + v12;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 48), "length")
                                                                - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 32);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 40));
    *a7 = 1;
  }
}

uint64_t __55__CSSuggestion_addSuggestionHighlight_withDisplayText___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:options:range:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 393, a3, a4);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = result;
    v8 = v6;
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", CFSTR("CSSuggestionHighlightAttribute"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), result, v6);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32) = v7 + v8;
    result = objc_msgSend(*(id *)(a1 + 40), "length");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result
                                                                - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 32);
  }
  return result;
}

- (id)displayTextForPeopleSuggestion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "displayString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E2406B38;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  if (objc_msgSend(v4, "shouldDisplayNameAndEmail"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "itemSummary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emailAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ — %@"), v8, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)v13;
  }
  objc_msgSend(v4, "searchString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSuggestion addSuggestionHighlight:withDisplayText:](self, "addSuggestionHighlight:withDisplayText:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)update
{
  id v3;
  id v4;
  NSArray *previousSuggestionTokens;
  id v6;
  void *v7;
  NSString *v8;
  id v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _CSSuggestionToken *currentSuggestionToken;
  id v66;
  void *v67;
  __CFString **p_displayString;
  _CSSuggestionToken *v69;
  _CSSuggestionToken *v70;
  void *v71;
  uint64_t v72;
  NSAttributedString *v73;
  __CFString *v74;
  NSAttributedString *localizedAttributedString;
  NSAttributedString *v76;
  void *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  __CFString *v81;
  uint64_t v82;
  void *v83;
  __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSString **location;
  id *locationa;
  id *p_suggestionTokens;
  NSString *v94;
  void *v95;
  void *v96;
  void *v97;
  CSSuggestion *v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  id obj;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  if (self->_suggestionTokens)
    return;
  p_suggestionTokens = (id *)&self->_suggestionTokens;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v101 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  previousSuggestionTokens = self->_previousSuggestionTokens;
  if (previousSuggestionTokens)
    v6 = (id)-[NSArray mutableCopy](previousSuggestionTokens, "mutableCopy");
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;
  location = &self->_searchString;
  v8 = self->_searchString;
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v100 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (-[NSString length](v8, "length"))
    objc_msgSend(v9, "appendString:", v8, location, p_suggestionTokens);
  v94 = v8;
  v106 = v9;
  if (-[NSArray count](self->_previousSuggestionTokens, "count", location))
  {
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v11 = self->_previousSuggestionTokens;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
    if (!v12)
      goto LABEL_23;
    v13 = v12;
    v14 = *(_QWORD *)v116;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v116 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v15);
        if (!objc_msgSend(v16, "tokenKind") || !-[CSSuggestion enableFragments](self, "enableFragments"))
        {
          v17 = v4;
          goto LABEL_18;
        }
        if (-[NSArray containsObject:](self->_updatedSuggestionTokens, "containsObject:", v16))
        {
          v17 = v3;
LABEL_18:
          objc_msgSend(v17, "addObject:", v16);
          goto LABEL_19;
        }
        objc_msgSend(v7, "removeObject:", v16);
LABEL_19:
        ++v15;
      }
      while (v13 != v15);
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
      v13 = v18;
      if (!v18)
      {
LABEL_23:

        break;
      }
    }
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v19 = self->_updatedSuggestionTokens;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v111, v120, 16);
  if (!v20)
    goto LABEL_38;
  v21 = v20;
  v22 = *(_QWORD *)v112;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v112 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
      if (objc_msgSend(v24, "isValid"))
      {
        if (!objc_msgSend(v24, "tokenKind") || !-[CSSuggestion enableFragments](self, "enableFragments"))
        {
          v27 = objc_msgSend(v4, "containsObject:", v24);
          v26 = v4;
          if ((v27 & 1) != 0)
            continue;
LABEL_35:
          objc_msgSend(v26, "addObject:", v24);
          continue;
        }
        v25 = objc_msgSend(v3, "containsObject:", v24);
        v26 = v3;
        if ((v25 & 1) == 0)
          goto LABEL_35;
      }
    }
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v111, v120, 16);
  }
  while (v21);
LABEL_38:

  v97 = v3;
  v98 = self;
  v99 = v10;
  v95 = v7;
  v96 = v4;
  if (objc_msgSend(v4, "count"))
  {
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    obj = v4;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
    if (v28)
    {
      v29 = v28;
      v104 = 0;
      v30 = *(_QWORD *)v108;
      v31 = v106;
      do
      {
        v32 = 0;
        v102 = v29;
        do
        {
          if (*(_QWORD *)v108 != v30)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v32);
          objc_msgSend(v33, "displayText");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "string");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "localizedLowercaseString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = objc_msgSend(v31, "rangeOfString:options:range:", v36, 1, 0, objc_msgSend(v31, "length"));
          if (v37 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v39 = v37;
            v40 = v38;
            objc_msgSend(v31, "substringWithRange:", v37, v38);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "appendString:", v41);
            if (objc_msgSend(v33, "internalType") != 1)
              objc_msgSend(v100, "appendString:", v41);
            v42 = objc_msgSend(v41, "length");
            objc_msgSend(v31, "replaceCharactersInRange:withString:", v39, v40, &stru_1E2406B38);
            if (objc_msgSend(v31, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v106, "rangeOfCharacterFromSet:options:range:", v43, 8, 0, objc_msgSend(v106, "length"));
              v46 = v45;

              v31 = v106;
              if (v44 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v106, "substringWithRange:", v44, v46);
                v47 = objc_claimAutoreleasedReturnValue();
                v48 = v10;
                v49 = (void *)v47;
                objc_msgSend(v48, "appendString:", v47);
                if (objc_msgSend(v33, "internalType") != 1)
                  objc_msgSend(v100, "appendString:", v49);
                v42 += v46;
                v31 = v106;
                objc_msgSend(v106, "replaceCharactersInRange:withString:", v44, v46, &stru_1E2406B38);

                v10 = v99;
              }
            }
            objc_msgSend(v33, "updateReplacementRange:", v104, v42);
            objc_msgSend(v101, "addObject:", v33);
            v104 += v42;

            v29 = v102;
          }

          ++v32;
        }
        while (v29 != v32);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v107, v119, 16);
      }
      while (v29);
    }
    else
    {
      v104 = 0;
      v31 = v106;
    }

  }
  else
  {
    v104 = 0;
    v31 = v106;
  }
  -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (__CFString *)v94;
  if (v50)
  {
    -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "updateSearchString:", v31);

    v53 = objc_msgSend(v31, "length");
    -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "internalType");

    if (v55 == 9)
    {
      -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "updateSearchString:", &stru_1E2406B38);

    }
    objc_msgSend(v31, "replaceCharactersInRange:withString:", 0, v53, &stru_1E2406B38);
    if (-[CSSuggestion enableFragments](v98, "enableFragments")
      && (-[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken"),
          v57 = (void *)objc_claimAutoreleasedReturnValue(),
          v58 = objc_msgSend(v57, "tokenKind"),
          v57,
          v58))
    {
      -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "updateReplacementRange:", 0, 0);

      -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "addObject:", v60);
    }
    else
    {
      -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "updateReplacementRange:", v104, v53);

      -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "displayString");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "lowercaseString");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend(v10, "appendString:", v60);
        objc_msgSend(v100, "appendString:", v60);
      }
      -[CSSuggestion currentSuggestionToken](v98, "currentSuggestionToken");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "addObject:", v64);

    }
    if (v98->_updated)
    {
      currentSuggestionToken = v98->_currentSuggestionToken;
      v98->_currentSuggestionToken = 0;

    }
  }
  if (objc_msgSend(v31, "length"))
  {
    objc_msgSend(v10, "appendString:", v31);
    objc_msgSend(v100, "appendString:", v31);
  }
  v66 = v101;
  v67 = v66;
  if (objc_msgSend(v97, "count"))
  {
    objc_msgSend(v97, "arrayByAddingObjectsFromArray:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_storeStrong(locationa, v31);
  p_displayString = (__CFString **)&v98->_displayString;
  objc_storeStrong((id *)&v98->_displayString, v100);
  objc_storeStrong((id *)&v98->_userQueryString, v99);
  objc_storeStrong(p_suggestionTokens, v67);
  v98->_updated = 0;
  v69 = v98->_currentSuggestionToken;
  v70 = v69;
  if (!v69)
    goto LABEL_84;
  if (-[_CSSuggestionToken internalType](v69, "internalType") != 10
    && -[_CSSuggestionToken internalType](v70, "internalType") != 7
    && -[_CSSuggestionToken internalType](v70, "internalType") != 8
    && -[_CSSuggestionToken internalType](v70, "internalType") != 9)
  {
    if (-[CSSuggestion enableFragments](v98, "enableFragments")
      && -[_CSSuggestionToken tokenKind](v70, "tokenKind") == 16)
    {
      -[CSSuggestion displayTextForPeopleSuggestion:](v98, "displayTextForPeopleSuggestion:", v70);
      v72 = objc_claimAutoreleasedReturnValue();
LABEL_81:
      v73 = (NSAttributedString *)v72;
    }
    else
    {
      if (!-[CSSuggestion enableFragments](v98, "enableFragments")
        || !-[_CSSuggestionToken tokenKind](v70, "tokenKind"))
      {
        v80 = *p_displayString;
        if (!*p_displayString)
          v80 = &stru_1E2406B38;
        v81 = v80;
        -[_CSSuggestionToken searchString](v70, "searchString");
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = (void *)v82;
        if (v82)
          v84 = (__CFString *)v82;
        else
          v84 = &stru_1E2406B38;
        v74 = v84;

        -[_CSSuggestionToken displayString](v70, "displayString");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "lowercaseString");
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        v87 = (void *)-[__CFString mutableCopy](v81, "mutableCopy");
        if (objc_msgSend(v86, "length"))
          objc_msgSend(v87, "replaceOccurrencesOfString:withString:options:range:", v86, v74, 13, 0, objc_msgSend(v87, "length"));
        if (objc_msgSend(v87, "length") && -[__CFString length](v81, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("´ʹʼˈ‘’‛′"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "componentsSeparatedByCharactersInSet:", v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "componentsJoinedByString:", CFSTR("'"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend(v90, "mutableCopy");

          v87 = (void *)v105;
        }
        -[CSSuggestion addSuggestionHighlight:withDisplayText:](v98, "addSuggestionHighlight:withDisplayText:", v87, v81);
        v73 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

LABEL_83:
        v51 = v74;
        if (!v73)
          goto LABEL_84;
        goto LABEL_85;
      }
      -[_CSSuggestionToken suggestionDisplayText](v70, "suggestionDisplayText");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v77, "length"))
      {
        -[_CSSuggestionToken suggestionDisplayText](v70, "suggestionDisplayText");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "string");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[_CSSuggestionToken displayString](v70, "displayString");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[CSSuggestion addSuggestionHighlight:withDisplayText:](v98, "addSuggestionHighlight:withDisplayText:", v94, v79);
      v73 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

    }
    v74 = (__CFString *)v94;
    goto LABEL_83;
  }
  -[_CSSuggestionToken suggestionDisplayText](v70, "suggestionDisplayText");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    -[_CSSuggestionToken suggestionDisplayText](v70, "suggestionDisplayText");
    v72 = objc_claimAutoreleasedReturnValue();
    goto LABEL_81;
  }
LABEL_84:
  v73 = (NSAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3498]);
  v74 = v51;
LABEL_85:
  localizedAttributedString = v98->_localizedAttributedString;
  v98->_localizedAttributedString = v73;
  v76 = v73;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  -[CSSuggestion update](self, "update", a3);
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", 0, 0, 0, 0);
  objc_msgSend(v4, "updateSearchString:", self->_searchString);
  objc_msgSend(v4, "updateDisplayString:", self->_displayString);
  objc_msgSend(v4, "updateUserQueryString:", self->_userQueryString);
  objc_msgSend(v4, "updatePreviousSuggestionTokens:", self->_previousSuggestionTokens);
  objc_msgSend(v4, "updateUpdatedSuggestionTokens:", self->_updatedSuggestionTokens);
  objc_msgSend(v4, "updateLocalizedAttributedString:", self->_localizedAttributedString);
  objc_msgSend(v4, "updateSuggestionTokens:", self->_suggestionTokens);
  objc_msgSend(v4, "updateCurrentSuggestionToken:", self->_currentSuggestionToken);
  objc_msgSend(v4, "updateVersion:", self->_version);
  objc_msgSend(v4, "updateResultCount:", self->_resultCount);
  objc_msgSend(v4, "updateSuggestFragments:", self->_enableFragments);
  objc_msgSend(v4, "updateUpdatedFlag:", self->_updated);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CSSuggestion *v4;
  BOOL v5;

  v4 = (CSSuggestion *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CSSuggestion isEqualToSuggestion:](self, "isEqualToSuggestion:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSuggestion:(id)a3
{
  id v4;
  CSSuggestionKind v5;
  int64_t v6;
  int64_t v7;
  int v8;
  char v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;

  v4 = a3;
  v5 = -[CSSuggestion suggestionKind](self, "suggestionKind");
  if (v5 != objc_msgSend(v4, "suggestionKind"))
    goto LABEL_5;
  v6 = -[CSSuggestion version](self, "version");
  if (v6 != objc_msgSend(v4, "version"))
    goto LABEL_5;
  v7 = -[CSSuggestion resultCount](self, "resultCount");
  if (v7 != objc_msgSend(v4, "resultCount"))
    goto LABEL_5;
  v8 = -[CSSuggestion enableFragments](self, "enableFragments");
  if (v8 != objc_msgSend(v4, "enableFragments"))
    goto LABEL_5;
  -[CSSuggestion searchString](self, "searchString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v4, "searchString");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_89;
  }
  -[CSSuggestion searchString](self, "searchString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v4, "searchString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    if (!v13)
      goto LABEL_5;
  }
  else
  {

    if (v11)
  }
  -[CSSuggestion searchString](self, "searchString");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v4, "searchString");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[CSSuggestion searchString](self, "searchString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "searchString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if (!v21)
        goto LABEL_5;
    }
    else
    {

    }
  }
  -[CSSuggestion userQueryString](self, "userQueryString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v4, "userQueryString");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_89;
  }
  -[CSSuggestion userQueryString](self, "userQueryString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v4, "userQueryString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    if (!v24)
      goto LABEL_5;
  }
  else
  {

    if (v22)
  }
  -[CSSuggestion userQueryString](self, "userQueryString");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(v4, "userQueryString");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      -[CSSuggestion userQueryString](self, "userQueryString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userQueryString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqualToString:", v30);

      if (!v31)
        goto LABEL_5;
    }
    else
    {

    }
  }
  -[CSSuggestion queryString](self, "queryString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    objc_msgSend(v4, "queryString");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_89;
  }
  -[CSSuggestion queryString](self, "queryString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    objc_msgSend(v4, "queryString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    if (!v34)
      goto LABEL_5;
  }
  else
  {

    if (v32)
  }
  -[CSSuggestion queryString](self, "queryString");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = (void *)v35;
    objc_msgSend(v4, "queryString");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v38 = (void *)v37;
      -[CSSuggestion queryString](self, "queryString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "queryString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "isEqualToString:", v40);

      if (!v41)
        goto LABEL_5;
    }
    else
    {

    }
  }
  -[CSSuggestion localizedAttributedSuggestion](self, "localizedAttributedSuggestion");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    objc_msgSend(v4, "localizedAttributedSuggestion");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_89;
  }
  -[CSSuggestion localizedAttributedSuggestion](self, "localizedAttributedSuggestion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v4, "localizedAttributedSuggestion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    if (!v44)
      goto LABEL_5;
  }
  else
  {

    if (v42)
  }
  -[CSSuggestion localizedAttributedSuggestion](self, "localizedAttributedSuggestion");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    objc_msgSend(v4, "localizedAttributedSuggestion");
    v47 = objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v48 = (void *)v47;
      -[CSSuggestion localizedAttributedSuggestion](self, "localizedAttributedSuggestion");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedAttributedSuggestion");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqualToAttributedString:", v50);

      if (!v51)
        goto LABEL_5;
    }
    else
    {

    }
  }
  -[CSSuggestion currentToken](self, "currentToken");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    objc_msgSend(v4, "currentToken");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_89;
  }
  -[CSSuggestion currentToken](self, "currentToken");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    objc_msgSend(v4, "currentToken");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    if (!v54)
      goto LABEL_5;
  }
  else
  {

    if (v52)
  }
  -[CSSuggestion currentToken](self, "currentToken");
  v55 = objc_claimAutoreleasedReturnValue();
  if (!v55)
  {
LABEL_82:
    -[CSSuggestion suggestionTokens](self, "suggestionTokens");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62 || (objc_msgSend(v4, "suggestionTokens"), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[CSSuggestion suggestionTokens](self, "suggestionTokens");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
      {
        objc_msgSend(v4, "suggestionTokens");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        if (!v64)
          goto LABEL_5;
      }
      else
      {

        if (v62)
      }
      -[CSSuggestion suggestionTokens](self, "suggestionTokens");
      v66 = objc_claimAutoreleasedReturnValue();
      if (!v66)
      {
        v9 = 1;
        goto LABEL_6;
      }
      v65 = (void *)v66;
      objc_msgSend(v4, "suggestionTokens");
      v67 = objc_claimAutoreleasedReturnValue();
      if (v67)
      {
        v68 = (void *)v67;
        -[CSSuggestion suggestionTokens](self, "suggestionTokens");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "suggestionTokens");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v69, "isEqualToArray:", v70);

      }
      else
      {
        v9 = 1;
      }
LABEL_90:

      goto LABEL_6;
    }
LABEL_89:
    v65 = (void *)v14;
    v9 = 0;
    goto LABEL_90;
  }
  v56 = (void *)v55;
  objc_msgSend(v4, "currentToken");
  v57 = objc_claimAutoreleasedReturnValue();
  if (!v57)
  {

    goto LABEL_82;
  }
  v58 = (void *)v57;
  -[CSSuggestion currentToken](self, "currentToken");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentToken");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v59, "isEqualToToken:", v60);

  if (v61)
    goto LABEL_82;
LABEL_5:
  v9 = 0;
LABEL_6:

  return v9;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (int64_t)rank
{
  return self->_rank;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CSSuggestion uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)uniqueIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[CSSuggestion searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%ld"), v5, -[CSSuggestion suggestionKind](self, "suggestionKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CSSuggestion suggestionTokens](self, "suggestionTokens");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "displayText");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "string");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lowercaseString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@:%ld"), v15, objc_msgSend(v11, "tokenKind"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("-"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  -[CSSuggestion userQueryString](self, "userQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[CSSuggestion userQueryString](self, "userQueryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 < 2)
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("\"%@\"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "substringToIndex:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSuggestion userQueryString](self, "userQueryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    -[CSSuggestion userQueryString](self, "userQueryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("\"%@...\"<%lu chars>, hash=%04lX"), v8, v10, (unsigned __int16)objc_msgSend(v11, "hash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = objc_opt_class();
  -[CSSuggestion localizedAttributedSuggestion](self, "localizedAttributedSuggestion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSuggestion score](self, "score");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("<%@:%p; %@; %@; %@>"), v14, self, v15, v12, v16);

  return v17;
}

- (id)debugDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[CSSuggestion userQueryString](self, "userQueryString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[CSSuggestion userQueryString](self, "userQueryString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 < 2)
  {
    objc_msgSend(v5, "stringWithFormat:", CFSTR("\"%@\"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "substringToIndex:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSuggestion userQueryString](self, "userQueryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    -[CSSuggestion userQueryString](self, "userQueryString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("\"%@...\"<%lu chars>, hash=%04lX"), v8, v10, (unsigned __int16)objc_msgSend(v11, "hash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = objc_opt_class();
  -[CSSuggestion localizedAttributedSuggestion](self, "localizedAttributedSuggestion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSuggestion score](self, "score");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSuggestion currentToken](self, "currentToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "debugDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("<%@:%p; %@; %@; %@; %@>"), v14, self, v15, v12, v16, v18);

  return v19;
}

- (NSAttributedString)localizedAttributedSuggestion
{
  -[CSSuggestion update](self, "update");
  return self->_localizedAttributedString;
}

- (CSSuggestionKind)suggestionKind
{
  void *v2;
  _BOOL4 v3;

  -[CSSuggestion currentSuggestionToken](self, "currentSuggestionToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return 2 * v3;
}

- (NSComparisonResult)compareByRank:(CSSuggestion *)other
{
  CSSuggestion *v4;
  NSComparisonResult v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CSSuggestionKind v16;
  CSSuggestionKind v17;

  v4 = other;
  if (-[CSSuggestion rank](self, "rank") != 0x7FFFFFFFFFFFFFFFLL
    && -[CSSuggestion rank](v4, "rank") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CSSuggestion rank](self, "rank"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CSSuggestion rank](v4, "rank"));
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (void *)v7;
    v9 = objc_msgSend(v6, "compare:", v7);
LABEL_9:
    v5 = v9;

    goto LABEL_17;
  }
  if (-[CSSuggestion rank](self, "rank") != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  if (-[CSSuggestion rank](v4, "rank") != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_16;
  if (-[CSSuggestion isEqualToSuggestion:](self, "isEqualToSuggestion:", v4))
  {
    v5 = NSOrderedSame;
    goto LABEL_17;
  }
  -[CSSuggestion currentToken](self, "currentToken");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[CSSuggestion currentToken](v4, "currentToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[CSSuggestion currentSuggestionToken](self, "currentSuggestionToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSuggestion currentSuggestionToken](v4, "currentSuggestionToken");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "compareByRank:", v8);
      goto LABEL_9;
    }
  }
  -[CSSuggestion currentToken](self, "currentToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
LABEL_14:
    v5 = NSOrderedAscending;
    goto LABEL_17;
  }
  -[CSSuggestion currentToken](v4, "currentToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_16:
    v5 = NSOrderedDescending;
    goto LABEL_17;
  }
  v16 = -[CSSuggestion suggestionKind](self, "suggestionKind");
  if (v16 == -[CSSuggestion suggestionKind](v4, "suggestionKind"))
  {
    -[CSSuggestion score](self, "score");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSuggestion score](v4, "score");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v17 = -[CSSuggestion suggestionKind](self, "suggestionKind");
  if (v17 > -[CSSuggestion suggestionKind](v4, "suggestionKind"))
    v5 = NSOrderedAscending;
  else
    v5 = NSOrderedDescending;
LABEL_17:

  return v5;
}

- (NSComparisonResult)compare:(CSSuggestion *)other
{
  return (unint64_t)-[CSSuggestion isEqualToSuggestion:](self, "isEqualToSuggestion:", other);
}

- (id)suggestionTokens
{
  -[CSSuggestion update](self, "update");
  return self->_suggestionTokens;
}

- (id)currentToken
{
  -[CSSuggestion update](self, "update");
  return self->_currentSuggestionToken;
}

- (id)currentTokens
{
  void *v3;
  NSArray *suggestionTokens;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[CSSuggestion update](self, "update");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_suggestionTokens, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  suggestionTokens = self->_suggestionTokens;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__CSSuggestion_currentTokens__block_invoke;
  v8[3] = &unk_1E2401928;
  v9 = v3;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](suggestionTokens, "enumerateObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __29__CSSuggestion_currentTokens__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "tokenKind"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)userQueryString
{
  -[CSSuggestion update](self, "update");
  return self->_userQueryString;
}

- (NSNumber)score
{
  void *v3;
  void *v4;
  void *v5;

  -[CSSuggestion currentSuggestionToken](self, "currentSuggestionToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CSSuggestion currentSuggestionToken](self, "currentSuggestionToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "score");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &unk_1E2430368;
  }

  return (NSNumber *)v5;
}

- (id)queryString
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CSSuggestion update](self, "update");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CSSuggestion suggestionTokens](self, "suggestionTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (-[CSSuggestion enableFragments](self, "enableFragments") && objc_msgSend(v10, "tokenKind"))
          {
            objc_msgSend(v10, "tokenQueryString");
            v11 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v10, "queryString");
            v11 = objc_claimAutoreleasedReturnValue();
          }
          v12 = (void *)v11;
          if (v11)
            objc_msgSend(v3, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

  }
  -[CSSuggestion currentToken](self, "currentToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && !-[NSArray containsObject:](self->_suggestionTokens, "containsObject:", v13))
  {
    if (-[CSSuggestion enableFragments](self, "enableFragments") && objc_msgSend(v13, "tokenKind"))
    {
      objc_msgSend(v13, "tokenQueryString");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "queryString");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;
    if (v14)
      objc_msgSend(v3, "addObject:", v14);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" && "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }

  return v16;
}

- (id)searchString
{
  -[CSSuggestion update](self, "update");
  return self->_searchString;
}

- (BOOL)enableFragments
{
  return self->_enableFragments;
}

- (int64_t)resultCount
{
  return self->_resultCount;
}

- (void)setResultCount:(int64_t)a3
{
  self->_resultCount = a3;
}

- (id)displayString
{
  -[CSSuggestion update](self, "update");
  return self->_displayString;
}

- (id)currentSuggestionToken
{
  return self->_currentSuggestionToken;
}

- (id)previousSuggestionTokens
{
  return self->_previousSuggestionTokens;
}

- (void)updateDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (void)updateUserQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_userQueryString, a3);
}

- (void)updateSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)updatePreviousSuggestionTokens:(id)a3
{
  objc_storeStrong((id *)&self->_previousSuggestionTokens, a3);
}

- (void)updateUpdatedSuggestionTokens:(id)a3
{
  objc_storeStrong((id *)&self->_updatedSuggestionTokens, a3);
}

- (void)updateLocalizedAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_localizedAttributedString, a3);
}

- (void)updateSuggestionTokens:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionTokens, a3);
}

- (void)updateCurrentSuggestionToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentSuggestionToken, a3);
}

- (void)updateVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)updateResultCount:(int64_t)a3
{
  self->_resultCount = a3;
}

- (void)updateSuggestFragments:(BOOL)a3
{
  self->_enableFragments = a3;
}

- (void)updateUpdatedFlag:(BOOL)a3
{
  self->_updated = a3;
}

- (NSArray)suggestionDataSources
{
  id v3;
  void *v4;
  char v5;
  _BOOL4 v6;
  unsigned int v7;
  int v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CSSuggestion currentToken](self, "currentToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "suggestionTokenDataSources")
    && objc_msgSend(v4, "suggestionTokenDataSources"))
  {
    v5 = objc_msgSend(v4, "suggestionTokenDataSources");
    v6 = objc_msgSend(v4, "suggestionTokenDataSources") & 1;
    v7 = (objc_msgSend(v4, "suggestionTokenDataSources") >> 2) & 1;
    if ((v5 & 2) != 0)
      goto LABEL_4;
  }
  else
  {
    if (objc_msgSend(v4, "internalType") == 4 && objc_msgSend(v4, "bundleType") == 1)
      v9 = objc_msgSend(v4, "isMegadomeToken") ^ 1;
    else
      v9 = 0;
    v6 = objc_msgSend(v4, "internalType") == 6 && objc_msgSend(v4, "tokenKind") == 16;
    v7 = objc_msgSend(v4, "isMegadomeToken");
    if (v9)
    {
LABEL_4:
      objc_msgSend(v3, "addObject:", &unk_1E2430108);
      if (!v6)
        goto LABEL_5;
LABEL_17:
      objc_msgSend(v3, "addObject:", &unk_1E242FE50);
      if ((v7 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if (v6)
    goto LABEL_17;
LABEL_5:
  if (v7)
LABEL_6:
    objc_msgSend(v3, "addObject:", &unk_1E2430120);
LABEL_7:

  return (NSArray *)v3;
}

- (BOOL)hasSuggestionTokenWithType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CSSuggestion suggestionTokens](self, "suggestionTokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "internalType") == a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (int64_t)numberOfMessageWithAttachmentTokens
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CSSuggestion suggestionTokens](self, "suggestionTokens", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isMessageWithAttachmentsToken");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasAttachmentsRelatedSearchString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v16;
  _QWORD v17[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  CSGetLocalizedString(CFSTR("ATTACHMENT_VARIANTS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByFoldingWithOptions:locale:", 385, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
      -[CSSuggestion searchString](self, "searchString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSuggestion searchString](self, "searchString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __49__CSSuggestion_hasAttachmentsRelatedSearchString__block_invoke;
      v17[3] = &unk_1E2401950;
      v17[4] = v10;
      v17[5] = &v22;
      objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 1027, v17);

      if (*((_BYTE *)v23 + 24))
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v14 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v14;
}

uint64_t __49__CSSuggestion_hasAttachmentsRelatedSearchString__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(a2, "cs_fuzzyPrefixMatchString:locale:", *(_QWORD *)(a1 + 32), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a7 = 1;
  return result;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instantAnswer, 0);
  objc_storeStrong((id *)&self->_currentSuggestionToken, 0);
  objc_storeStrong((id *)&self->_suggestionTokens, 0);
  objc_storeStrong((id *)&self->_localizedAttributedString, 0);
  objc_storeStrong((id *)&self->_updatedSuggestionTokens, 0);
  objc_storeStrong((id *)&self->_previousSuggestionTokens, 0);
  objc_storeStrong((id *)&self->_userQueryString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionText:(id)a5 queryString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _CSSuggestionToken *v14;
  CSSuggestion *v15;
  void *v16;
  CSSuggestion *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = -[_CSSuggestionToken initWithUserString:displayString:queryString:]([_CSSuggestionToken alloc], "initWithUserString:displayString:queryString:", v10, v13, v12);

  if (v14)
  {
    v19.receiver = self;
    v19.super_class = (Class)CSSuggestion;
    v15 = -[CSSuggestion init](&v19, sel_init);
    if (v15)
    {
      objc_msgSend(v11, "suggestionTokens");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v15, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v10, v11, v14, v16);

    }
    self = v15;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSSuggestion *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSSuggestion;
  v11 = -[CSSuggestion init](&v14, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "suggestionTokens");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v11, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v8, v9, v10, v12);

  }
  return v11;
}

+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionText:(id)a5 queryString:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CSSuggestion *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionText:queryString:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:suggestionText:queryString:", v11, v12, v10, v9);

  return v13;
}

+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionToken:(id)a5
{
  id v7;
  id v8;
  id v9;
  CSSuggestion *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionToken:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:suggestionToken:", v8, v9, v7);

  return v10;
}

- (NSData)features
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  -[CSSuggestion currentToken](self, "currentToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CSSuggestion currentToken](self, "currentToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "features");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;

  return (NSData *)v6;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 itemResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CSSuggestionToken *v11;
  CSSuggestion *v12;
  void *v13;
  CSSuggestion *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_CSSuggestionToken initWithUserString:itemResult:]([_CSSuggestionToken alloc], "initWithUserString:itemResult:", v8, v10);

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)CSSuggestion;
    v12 = -[CSSuggestion init](&v16, sel_init);
    if (v12)
    {
      objc_msgSend(v9, "suggestionTokens");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v12, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v8, v9, v11, v13);

    }
    self = v12;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)mergeSuggestionAndUpdateLocalizedAttributedString:(id)a3 queryContextScopeIsToPerson:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  id v24;

  v4 = a4;
  v24 = a3;
  -[CSSuggestion currentToken](self, "currentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "selectedScope");

  if (_os_feature_enabled_impl())
  {
    -[CSSuggestion currentToken](self, "currentToken");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_9:
      -[CSSuggestion currentToken](self, "currentToken");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "currentToken");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "mergeTokenAttributes:", v14);

      goto LABEL_10;
    }
    v9 = (void *)v8;
    -[CSSuggestion currentToken](self, "currentToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isMegadomeToken"))
    {
      -[CSSuggestion currentToken](self, "currentToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isMailingList") & 1) != 0)
      {
        objc_msgSend(v24, "currentToken");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isMegadomeToken") & 1) == 0)
        {
          objc_msgSend(v24, "currentToken");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isMailingList");

          if ((v21 & 1) != 0)
            goto LABEL_9;
          -[CSSuggestion currentToken](self, "currentToken");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setIsMailingList:", 0);

          objc_msgSend(v24, "currentToken");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v9, "selectedScope");
          -[CSSuggestion currentToken](self, "currentToken");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSelectedScope:", v23);
          goto LABEL_8;
        }

      }
    }
LABEL_8:

    goto LABEL_9;
  }
LABEL_10:
  -[CSSuggestion currentToken](self, "currentToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "currentToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mergeTokenScopesAndSpotlightQueryString:", v16);

  if (v4)
  {
    -[CSSuggestion currentToken](self, "currentToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "selectedScope");

    if (!v18 && v7 == 1)
    {
      -[CSSuggestion currentToken](self, "currentToken");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSelectedScope:", 1);

    }
  }
  -[CSSuggestion updateLocalizedAttributedStringForPersonSuggestion](self, "updateLocalizedAttributedStringForPersonSuggestion");

}

- (void)updateLocalizedAttributedStringForPersonSuggestion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSAttributedString **p_localizedAttributedString;
  NSAttributedString *localizedAttributedString;
  NSObject *v9;

  if (-[CSSuggestion enableFragments](self, "enableFragments"))
  {
    -[CSSuggestion currentToken](self, "currentToken");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "tokenKind");

    if (v4 == 16)
    {
      -[CSSuggestion currentToken](self, "currentToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSuggestion displayTextForPeopleSuggestion:](self, "displayTextForPeopleSuggestion:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6
        && (localizedAttributedString = self->_localizedAttributedString,
            p_localizedAttributedString = &self->_localizedAttributedString,
            (objc_msgSend(v6, "isEqualToAttributedString:", localizedAttributedString) & 1) == 0))
      {
        objc_storeStrong((id *)p_localizedAttributedString, v6);
      }
      else
      {
        logForCSLogCategoryQuery();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[CSSuggestion(Person) updateLocalizedAttributedStringForPersonSuggestion].cold.1((uint64_t)v6, v9);

      }
    }
  }
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionTokenResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CSSuggestionToken *v11;
  CSSuggestion *v12;
  void *v13;
  CSSuggestion *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_CSSuggestionToken initWithUserString:suggestionTokenResult:]([_CSSuggestionToken alloc], "initWithUserString:suggestionTokenResult:", v8, v10);

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)CSSuggestion;
    v12 = -[CSSuggestion init](&v16, sel_init);
    if (v12)
    {
      objc_msgSend(v9, "suggestionTokens");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v12, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v8, v9, v11, v13);

    }
    self = v12;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 suggestionResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CSSuggestionToken *v11;
  CSSuggestion *v12;
  void *v13;
  CSSuggestion *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_CSSuggestionToken initWithUserString:suggestionResult:]([_CSSuggestionToken alloc], "initWithUserString:suggestionResult:", v8, v10);

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)CSSuggestion;
    v12 = -[CSSuggestion init](&v16, sel_init);
    if (v12)
    {
      objc_msgSend(v9, "suggestionTokens");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v12, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v8, v9, v11, v13);

    }
    self = v12;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSDictionary)rankCategories
{
  void *v2;
  void *v3;

  -[CSSuggestion currentSuggestionToken](self, "currentSuggestionToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nlpCompletionCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 displayString:(id)a5 attributeValues:(id)a6 attributeStrings:(id)a7 options:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  CSSuggestion *v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v18, "suggestionTokens");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "enableFragments");

  v22 = -[CSSuggestion initWithUserString:previousSuggestionTokens:displayString:attributeValues:attributeStrings:enableFragements:options:](self, "initWithUserString:previousSuggestionTokens:displayString:attributeValues:attributeStrings:enableFragements:options:", v19, v20, v17, v16, v15, v21, v14);
  return v22;
}

- (CSSuggestion)initWithUserString:(id)a3 previousSuggestionTokens:(id)a4 displayString:(id)a5 attributeValues:(id)a6 attributeStrings:(id)a7 enableFragements:(BOOL)a8 options:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _CSSuggestionToken *v21;
  CSSuggestion *v22;
  CSSuggestion *v23;
  CSSuggestion *v24;
  objc_super v26;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = -[_CSSuggestionToken initWithUserString:displayString:attributeValues:attributeStrings:options:]([_CSSuggestionToken alloc], "initWithUserString:displayString:attributeValues:attributeStrings:options:", v15, v20, v19, v18, v17);

  if (v21)
  {
    v26.receiver = self;
    v26.super_class = (Class)CSSuggestion;
    v22 = -[CSSuggestion init](&v26, sel_init);
    v23 = v22;
    if (v22)
      -[CSSuggestion commonInitWithUserString:currentSuggestionToken:previousSuggestionTokens:updatedSuggestionTokens:enableFragments:](v22, "commonInitWithUserString:currentSuggestionToken:previousSuggestionTokens:updatedSuggestionTokens:enableFragments:", v15, v21, v16, v16, v9);
    self = v23;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)personSuggestionByReplacingCurrentTokenEmailAddresses:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CSSuggestion *v9;
  void *v10;
  void *v11;
  void *v12;
  CSSuggestion *v13;
  void *v14;
  NSArray *previousSuggestionTokens;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  -[CSSuggestion currentToken](self, "currentToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "internalType") == 6 || objc_msgSend(v6, "internalType") == 4)
    && objc_msgSend(v6, "tokenKind") == 16)
  {
    objc_msgSend(v6, "localCompletionAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if ((unint64_t)objc_msgSend(v8, "count") >= 0x15)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithUnsignedLongLong:", objc_msgSend(v11, "unsignedLongLongValue") | 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:atIndexedSubscript:", v12, 20);

      v13 = [CSSuggestion alloc];
      objc_msgSend(v6, "searchString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      previousSuggestionTokens = self->_previousSuggestionTokens;
      objc_msgSend(v6, "displayString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CSSuggestion initWithUserString:previousSuggestionTokens:displayString:attributeValues:attributeStrings:enableFragements:options:](v13, "initWithUserString:previousSuggestionTokens:displayString:attributeValues:attributeStrings:enableFragements:options:", v14, previousSuggestionTokens, v16, v8, v4, self->_enableFragments, MEMORY[0x1E0C9AA70]);

      v17 = objc_msgSend(v6, "internalType");
      -[CSSuggestion currentToken](v9, "currentToken");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setInternalType:", v17);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (CSSuggestion)suggestionWithUserString:(id)a3
{
  id v3;
  CSSuggestion *v4;

  v3 = a3;
  v4 = -[CSSuggestion initWithUserString:currentSuggestion:internalType:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:internalType:", v3, 0, 5);

  return v4;
}

+ (id)subjectSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CSSuggestion *v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(v6, "userQueryString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    CSGetLocalizedString(CFSTR("SUBJECT_TOKEN"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedLowercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", v13);

    if (v16)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v19;
    }

  }
  v20 = -[CSSuggestion initWithUserString:currentSuggestion:internalType:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:internalType:", v9, v7, 7);

  return v20;
}

+ (id)senderContainsSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  CSSuggestion *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(v6, "userQueryString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = -[CSSuggestion initWithUserString:currentSuggestion:internalType:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:internalType:", v8, v7, 10);

  return v10;
}

+ (id)attachmentNameSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  CSSuggestion *v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(v6, "userQueryString");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = -[CSSuggestion initWithUserString:currentSuggestion:internalType:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:internalType:", v8, v7, 8);

  return v10;
}

+ (id)messageWithAttachmentsSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4
{
  id v5;
  id v6;
  id v7;
  CSSuggestion *v8;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "numberOfMessageWithAttachmentTokens")
    || !objc_msgSend(v6, "hasAttachmentsRelatedSearchString"))
  {
    v8 = 0;
  }
  else
  {
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v6, "userQueryString");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v7;
    v8 = -[CSSuggestion initWithUserString:currentSuggestion:internalType:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:internalType:", v7, v6, 9);

  }
  return v8;
}

+ (id)advancedSuggestionWithUserString:(id)a3 currentSuggestion:(id)a4 parseResult:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CSSuggestion *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v27 = a4;
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("suggestions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("suggestionTokenKind"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("suggestionTokenKind"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (int)objc_msgSend(v11, "intValue");

    }
    else
    {
      v25 = 0;
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v9;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v23 = v9;
      v24 = v8;
      v15 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("suggestionTypeKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("kQPTokenMe")) & 1) == 0)
          {
            v19 = v7;
            v12 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionTokenResult:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:suggestionTokenResult:", v7, v27, v17);
            -[CSSuggestion currentToken](v12, "currentToken");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "tokenKind");

            if (v21 == v25)
            {

              v7 = v19;
              goto LABEL_19;
            }

            v7 = v19;
          }

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v14)
          continue;
        break;
      }
      v12 = 0;
LABEL_19:
      v9 = v23;
      v8 = v24;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CSSuggestion)initWithUserString:(id)a3 currentSuggestion:(id)a4 currentToken:(id)a5 tokens:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CSSuggestion *v14;
  CSSuggestion *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CSSuggestion;
  v14 = -[CSSuggestion init](&v17, sel_init);
  v15 = v14;
  if (v14)
    -[CSSuggestion commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:](v14, "commonInitWithUserString:currentSuggestion:currentSuggestionToken:updatedSuggestionTokens:", v10, v11, v12, v13);

  return v15;
}

+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 completion:(id)a5 attributes:(id)a6 scores:(id)a7 options:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CSSuggestion *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[CSSuggestion initWithUserString:currentSuggestion:displayString:attributeValues:attributeStrings:options:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:displayString:attributeValues:attributeStrings:options:", v17, v18, v16, v14, v15, v13);

  return v19;
}

+ (id)suggestionsWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 completionData:(id)a5 options:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t Trusted;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CFTypeRef cf;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v10
    && (v12 = objc_retainAutorelease(v10),
        objc_msgSend(v12, "bytes"),
        objc_msgSend(v12, "length"),
        (Trusted = _MDPlistBytesCreateTrusted()) != 0))
  {
    cf = (CFTypeRef)Trusted;
    v31 = v10;
    v14 = (void *)_MDPlistBytesCopyPlistAtIndex();
    v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
LABEL_5:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v19);
        if ((unint64_t)objc_msgSend(v20, "count", cf) < 0x17)
          break;
        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          break;
        objc_msgSend(v20, "objectAtIndexedSubscript:", 22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v24 = objc_opt_isKindOfClass();

        if ((v24 & 1) == 0)
          break;
        objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", 22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "subarrayWithRange:", 1, objc_msgSend(v20, "count") - 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSSuggestion suggestionWithCurrentSuggestion:userQueryString:completion:attributes:scores:options:](CSSuggestion, "suggestionWithCurrentSuggestion:userQueryString:completion:attributes:scores:options:", v33, v9, v25, v26, v27, v11);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v32, "addObject:", v28);

        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v17)
            goto LABEL_5;
          break;
        }
      }
    }

    CFRelease(cf);
    v10 = v31;
  }
  else
  {
    v32 = (id)MEMORY[0x1E0C9AA60];
  }

  return v32;
}

+ (id)suggestionsWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 suggestionData:(id)a5 options:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CSSuggestion *v18;
  CSSuggestion *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
          v18 = [CSSuggestion alloc];
          v19 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionResult:](v18, "initWithUserString:currentSuggestion:suggestionResult:", v9, v8, v17, (_QWORD)v21);
          if (v19)
            objc_msgSend(v11, "addObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

+ (CSSuggestion)suggestionWithCurrentSuggestion:(id)a3 userQueryString:(id)a4 parseResult:(id)a5
{
  id v7;
  id v8;
  id v9;
  CSSuggestion *v10;

  if (a5)
  {
    v7 = a5;
    v8 = a4;
    v9 = a3;
    v10 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionResult:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:suggestionResult:", v8, v9, v7);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)updatedSuggestionWithCurrentSuggestion:(id)a3 mailboxKind:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  CSTokenScopeParser *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "suggestionTokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc_init(CSTokenScopeParser);
      v9 = -[CSTokenScopeParser indexForScopeKey:](v8, "indexForScopeKey:", CFSTR("FROM_SCOPE_KEY"));
      v10 = -[CSTokenScopeParser indexForScopeKey:](v8, "indexForScopeKey:", CFSTR("TO_SCOPE_KEY"));
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v6, "suggestionTokens", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        if (a4)
          v15 = v10;
        else
          v15 = v9;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v17, "tokenKind") == 16
              && (objc_msgSend(v17, "selectedScope") == v9 || objc_msgSend(v17, "selectedScope") == v10))
            {
              objc_msgSend(v17, "updateScopeSelection:", v15);
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

    }
  }
  return v6;
}

+ (id)instantAnswerWithUserString:(id)a3 currentSuggestion:(id)a4 itemResult:(id)a5 answerAttributes:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  CSSuggestion *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
    goto LABEL_11;
  objc_msgSend(v11, "attributeSet");
  v13 = (CSSuggestion *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v11, "attributeSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "eventType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("flight"));

    if (v16)
    {
      v17 = -[CSInstantAnswers initFlightAnswerWithItem:answerAttributes:]([CSInstantAnswers alloc], "initFlightAnswerWithItem:answerAttributes:", v11, v12);
    }
    else
    {
      objc_msgSend(v11, "attributeSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "eventType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("hotel"));

      if (v20)
      {
        v17 = -[CSInstantAnswers initHotelAnswerWithItem:answerAttributes:]([CSInstantAnswers alloc], "initHotelAnswerWithItem:answerAttributes:", v11, v12);
      }
      else
      {
        objc_msgSend(v11, "attributeSet");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "eventType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("restaurant"));

        if (!v23)
          goto LABEL_11;
        v17 = -[CSInstantAnswers initRestaurantAnswerWithItem:answerAttributes:]([CSInstantAnswers alloc], "initRestaurantAnswerWithItem:answerAttributes:", v11, v12);
      }
    }
    v24 = v17;
    if (v17)
    {
      v13 = -[CSSuggestion initWithUserString:currentSuggestion:]([CSSuggestion alloc], "initWithUserString:currentSuggestion:", v9, v10);
      -[CSSuggestion setInstantAnswer:](v13, "setInstantAnswer:", v24);

      goto LABEL_12;
    }
LABEL_11:
    v13 = 0;
  }
LABEL_12:

  return v13;
}

- (void)setInstantAnswer:(id)a3
{
  objc_storeStrong((id *)&self->_instantAnswer, a3);
}

- (CSInstantAnswers)instantAnswer
{
  return self->_instantAnswer;
}

@end
