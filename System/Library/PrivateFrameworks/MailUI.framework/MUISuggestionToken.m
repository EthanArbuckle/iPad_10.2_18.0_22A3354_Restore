@implementation MUISuggestionToken

- (MUISuggestionToken)initWithTitle:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MUISuggestionToken;
  v5 = -[MUISuggestionToken init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v7;

    *(_OWORD *)(v5 + 40) = xmmword_1D566EE30;
    v9 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = MEMORY[0x1E0C9AA60];

    *((_QWORD *)v5 + 4) = 0;
    v10 = objc_alloc_init(MEMORY[0x1E0CA6BB0]);
    v11 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v10;

  }
  return (MUISuggestionToken *)v5;
}

- (MUISuggestionToken)initWithCSToken:(id)a3
{
  id v5;
  MUISuggestionToken *v6;
  void *v7;
  uint64_t v8;
  NSString *title;
  NSUInteger v10;
  uint64_t v11;
  NSArray *scopeNames;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MUISuggestionToken;
  v6 = -[MUISuggestionToken init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "displayText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = objc_claimAutoreleasedReturnValue();
    title = v6->_title;
    v6->_title = (NSString *)v8;

    v6->_replacementRange.location = objc_msgSend(v5, "replacementRange");
    v6->_replacementRange.length = v10;
    objc_msgSend(v5, "scopes");
    v11 = objc_claimAutoreleasedReturnValue();
    scopeNames = v6->_scopeNames;
    v6->_scopeNames = (NSArray *)v11;

    v6->_selectedScopeIndex = objc_msgSend(v5, "selectedScope");
    objc_storeStrong((id *)&v6->_csToken, a3);
  }

  return v6;
}

+ (id)csTokensFromMailSuggestionTokens:(id)a3
{
  return (id)objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_35);
}

uint64_t __55__MUISuggestionToken_csTokensFromMailSuggestionTokens___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "csToken");
}

+ (id)suggestionTokenWithTitle:(id)a3
{
  id v3;
  MUISuggestionToken *v4;

  v3 = a3;
  v4 = -[MUISuggestionToken initWithTitle:]([MUISuggestionToken alloc], "initWithTitle:", v3);

  return v4;
}

- (BOOL)hasMultipleScopes
{
  void *v2;
  BOOL v3;

  -[MUISuggestionToken scopeNames](self, "scopeNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (NSString)scopeName
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[MUISuggestionToken scopeNames](self, "scopeNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MUISuggestionToken selectedScopeIndex](self, "selectedScopeIndex");
  if (v4 >= objc_msgSend(v3, "count"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (UIImage)image
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  -[MUISuggestionToken csToken](self, "csToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mui_imageFromSuggestionToken:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (_CSSuggestionToken)csToken
{
  return self->_csToken;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)scopeNames
{
  return self->_scopeNames;
}

- (unint64_t)selectedScopeIndex
{
  return self->_selectedScopeIndex;
}

- (void)setSelectedScopeIndex:(unint64_t)a3
{
  self->_selectedScopeIndex = a3;
}

- (_NSRange)replacementRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_replacementRange.length;
  location = self->_replacementRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeNames, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_csToken, 0);
}

@end
