@implementation ICSearchToken

- (ICSearchToken)initWithTitle:(id)a3 subQueryString:(id)a4 suggestionType:(unint64_t)a5
{
  id v9;
  id v10;
  ICSearchToken *v11;
  ICSearchToken *v12;
  _CSSuggestionToken *csToken;
  uint64_t v14;
  NSString *iconImageName;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ICSearchToken;
  v11 = -[ICSearchToken init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    csToken = v11->_csToken;
    v11->_csToken = 0;

    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v12->_subQueryString, a4);
    v12->_suggestionType = a5;
    +[ICSearchToken iconImageNameForSuggestionType:](ICSearchToken, "iconImageNameForSuggestionType:", a5);
    v14 = objc_claimAutoreleasedReturnValue();
    iconImageName = v12->_iconImageName;
    v12->_iconImageName = (NSString *)v14;

  }
  return v12;
}

- (ICSearchToken)initWithCSSuggestionToken:(id)a3
{
  id v5;
  ICSearchToken *v6;
  ICSearchToken *v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  NSString *subQueryString;
  uint64_t v12;
  NSString *iconImageName;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSearchToken;
  v6 = -[ICSearchToken init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_csToken, a3);
    objc_msgSend(v5, "displayText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v9;

    subQueryString = v7->_subQueryString;
    v7->_subQueryString = 0;

    v7->_suggestionType = 0;
    +[ICSearchToken iconImageNameForCSToken:](ICSearchToken, "iconImageNameForCSToken:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    iconImageName = v7->_iconImageName;
    v7->_iconImageName = (NSString *)v12;

  }
  return v7;
}

- (NSString)scopeName
{
  _CSSuggestionToken *csToken;
  _CSSuggestionToken **p_csToken;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;

  p_csToken = &self->_csToken;
  csToken = self->_csToken;
  if (!csToken)
  {
LABEL_7:
    v9 = 0;
    return (NSString *)v9;
  }
  v5 = -[_CSSuggestionToken selectedScope](csToken, "selectedScope");
  -[_CSSuggestionToken scopes](*p_csToken, "scopes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v10 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICSearchToken scopeName].cold.1((uint64_t)self, (id *)p_csToken, v10);

    goto LABEL_7;
  }
  -[_CSSuggestionToken scopes](*p_csToken, "scopes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (unint64_t)selectedScopeIndex
{
  unint64_t result;

  result = (unint64_t)self->_csToken;
  if (result)
    return objc_msgSend((id)result, "selectedScope");
  return result;
}

- (NSArray)availableScopes
{
  void *csToken;

  csToken = self->_csToken;
  if (csToken)
  {
    objc_msgSend(csToken, "scopes");
    csToken = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)csToken;
}

- (BOOL)hasMultipleScopes
{
  _CSSuggestionToken *csToken;
  void *v3;
  BOOL v4;

  csToken = self->_csToken;
  if (!csToken)
    return 0;
  -[_CSSuggestionToken scopes](csToken, "scopes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (unint64_t)suggestionTypeOfFirstItemInTokens:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "suggestionType");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)iconImageNameForSuggestionType:(unint64_t)a3
{
  id result;

  result = CFSTR("person.crop.circle");
  switch(a3)
  {
    case 0uLL:
      if (+[ICSearchSuggestionsContext supportsSearchSuggestions](ICSearchSuggestionsContext, "supportsSearchSuggestions"))
      {
        result = CFSTR("magnifyingglass");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICSearchToken iconImageNameForSuggestionType:]", 1, 0, CFSTR("Undefined token type"));
        result = CFSTR("camera.metering.unknown");
      }
      break;
    case 2uLL:
      result = CFSTR("lock.fill");
      break;
    case 3uLL:
      result = CFSTR("checklist");
      break;
    case 4uLL:
      result = CFSTR("number");
      break;
    case 5uLL:
      result = CFSTR("pencil.tip.crop.circle");
      break;
    case 6uLL:
      result = CFSTR("doc.viewfinder");
      break;
    case 7uLL:
      result = CFSTR("paperclip");
      break;
    default:
      return result;
  }
  return result;
}

+ (id)iconImageNameForCSToken:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "tokenKind");
    switch(v5)
    {
      case 2:
        v6 = CFSTR("paperclip");
        break;
      case 3:
        v6 = CFSTR("music.note");
        break;
      case 4:
      case 9:
      case 11:
      case 12:
      case 13:
      case 14:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
LABEL_16:
        v8 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v14 = 134217984;
          v15 = objc_msgSend(v4, "tokenKind");
          _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "Got token kind with unknown icon image name: %ld", (uint8_t *)&v14, 0xCu);
        }

        v6 = CFSTR("magnifyingglass");
        break;
      case 5:
      case 7:
        v6 = CFSTR("calendar");
        break;
      case 6:
        v6 = CFSTR("doc");
        break;
      case 8:
        v6 = CFSTR("folder");
        break;
      case 10:
      case 17:
        v6 = CFSTR("photo");
        break;
      case 15:
        v6 = CFSTR("note");
        break;
      case 16:
        v6 = CFSTR("person");
        break;
      case 24:
        v6 = CFSTR("number");
        break;
      default:
        v6 = 0;
        switch(v5)
        {
          case '"':
            v6 = CFSTR("textformat.size.larger");
            break;
          case '$':
            v6 = CFSTR("video");
            break;
          case '%':
            v6 = CFSTR("link");
            break;
          case '+':
            v9 = (void *)MEMORY[0x1E0C99DC8];
            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "languageCode");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v9, "lineDirectionForLanguage:", v11);
            v13 = CFSTR("text.alignright");
            if (v12 == 1)
              v13 = CFSTR("text.alignleft");
            v6 = v13;

            break;
          case '-':
            goto LABEL_5;
          default:
            goto LABEL_16;
        }
        break;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_5:

  return v6;
}

- (_CSSuggestionToken)csToken
{
  return self->_csToken;
}

- (void)setCsToken:(id)a3
{
  objc_storeStrong((id *)&self->_csToken, a3);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subQueryString
{
  return self->_subQueryString;
}

- (unint64_t)suggestionType
{
  return self->_suggestionType;
}

- (NSString)iconImageName
{
  return self->_iconImageName;
}

- (void)setIconImageName:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageName, 0);
  objc_storeStrong((id *)&self->_subQueryString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_csToken, 0);
}

- (void)scopeName
{
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*a2, "selectedScope");
  objc_msgSend(*a2, "scopes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2048;
  v11 = v6;
  v12 = 2048;
  v13 = objc_msgSend(v7, "count");
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "Search token %@ has selected scope out of range of available scopes (%lu/%lu).", (uint8_t *)&v8, 0x20u);

}

@end
