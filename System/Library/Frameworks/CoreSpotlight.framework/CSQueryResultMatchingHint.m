@implementation CSQueryResultMatchingHint

+ (id)randomTokensFromText:(id)a3 maxTokens:(unint64_t)a4 maxTextLength:(unint64_t)a5
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v30;

  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_msgSend(v7, "length");
  if (v9 >= a5)
    v10 = a5;
  else
    v10 = v9;
  objc_msgSend(v7, "substringWithRange:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v14 = 0;
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    v30 = v7;
    objc_msgSend(v13, "removeLastObject");
    v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (a4)
    {
      v16 = 0;
      do
      {
        v17 = objc_msgSend(v15, "count");
        if (v17 >= objc_msgSend(v13, "count"))
          break;
        v18 = arc4random();
        v19 = v18 % objc_msgSend(v13, "count");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v15, "containsObject:", v20);

        if ((v21 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);

          objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByTrimmingCharactersInSet:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", &stru_1E2406B38);

          if (v26)
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v19);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lowercaseString");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v28);

            ++v16;
          }
        }
      }
      while (v16 < a4);
    }
    if (objc_msgSend(v8, "count"))
      v14 = v8;
    else
      v14 = 0;
    v7 = v30;

  }
  return v14;
}

- (CSQueryResultMatchingHint)initWithAttribute:(id)a3 tokens:(id)a4
{
  id v6;
  id v7;
  CSQueryResultMatchingHint *v8;
  uint64_t v9;
  NSString *attribute;
  uint64_t v11;
  NSArray *tokens;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSQueryResultMatchingHint;
  v8 = -[CSQueryResultMatchingHint init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    attribute = v8->_attribute;
    v8->_attribute = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    tokens = v8->_tokens;
    v8->_tokens = (NSArray *)v11;

  }
  return v8;
}

+ (id)_snippetHintAttributeSet
{
  if (_snippetHintAttributeSet_onceToken != -1)
    dispatch_once(&_snippetHintAttributeSet_onceToken, &__block_literal_global_687);
  return (id)_snippetHintAttributeSet_snippetHintAttributeSet;
}

void __53__CSQueryResultMatchingHint__snippetHintAttributeSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("kMDItemAuthors"), CFSTR("kMDItemAuthorEmailAddresses"), CFSTR("kMDItemSubject"), CFSTR("kMDItemTextContent"), CFSTR("kMDItemRecipients"), CFSTR("kMDItemRecipientEmailAddresses"), CFSTR("kMDItemEmailAddresses"), CFSTR("com_apple_mail_attachmentNames"), CFSTR("com_apple_mail_attachmentTypes"), CFSTR("kMDItemAttachmentNames"), CFSTR("kMDItemAttachmentTypes"), CFSTR("kMDItemComment"), CFSTR("kMDItemTitle"), CFSTR("kMDItemPath"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_snippetHintAttributeSet_snippetHintAttributeSet;
  _snippetHintAttributeSet_snippetHintAttributeSet = v0;

}

- (BOOL)isValidAttributeForSnippetHint:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[CSQueryResultMatchingHint _snippetHintAttributeSet](CSQueryResultMatchingHint, "_snippetHintAttributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (CSQueryResultMatchingHint)initWithBackingHint:(id)a3
{
  id v4;
  CSQueryResultMatchingHint *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  NSString *attribute;
  uint64_t v11;
  NSArray *tokens;
  CSQueryResultMatchingHint *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSQueryResultMatchingHint;
  v5 = -[CSQueryResultMatchingHint init](&v15, sel_init);
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v4, "count") < 2
      || (objc_msgSend(v4, "firstObject"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = -[CSQueryResultMatchingHint isValidAttributeForSnippetHint:](v5, "isValidAttributeForSnippetHint:", v6),
          v6,
          !v7))
    {
      v13 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    attribute = v5->_attribute;
    v5->_attribute = (NSString *)v9;

    objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1);
    v11 = objc_claimAutoreleasedReturnValue();
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v11;

  }
  v13 = v5;
LABEL_7:

  return v13;
}

- (id)flattenedHints
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", self->_attribute);
  objc_msgSend(v3, "addObjectsFromArray:", self->_tokens);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[CSQueryResultMatchingHint attribute](self, "attribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSQueryResultMatchingHint tokens](self, "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p attribute: %@ tokens: %@>"), v4, self, v5, v6);

  return v7;
}

- (NSString)attribute
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_attribute, 0);
}

@end
