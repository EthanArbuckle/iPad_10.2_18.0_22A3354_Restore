@implementation CKVTokenChain

- (CKVTokenChain)initWithString:(id)a3 locale:(id)a4 tokens:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKVTokenChain *v11;
  uint64_t v12;
  NSString *normalizedString;
  NSString *v14;
  uint64_t v15;
  NSLocale *locale;
  uint64_t v17;
  NSArray *tokens;
  CKVTokenChain *v19;
  NSObject *v20;
  const char *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CKVTokenChain;
  v11 = -[CKVTokenChain init](&v23, sel_init);
  if (!v11)
    goto LABEL_6;
  v12 = objc_msgSend(v8, "copy");
  normalizedString = v11->_normalizedString;
  v11->_normalizedString = (NSString *)v12;

  v14 = v11->_normalizedString;
  if (!v14 || !-[NSString length](v14, "length"))
  {
    v20 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CKVTokenChain initWithString:locale:tokens:]";
      v22 = "%s Cannot construct tokenChain with nil normalized string";
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  v15 = objc_msgSend(v9, "copy");
  locale = v11->_locale;
  v11->_locale = (NSLocale *)v15;

  if (!v11->_locale)
  {
    v20 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CKVTokenChain initWithString:locale:tokens:]";
      v22 = "%s Cannot construct tokenChain with nil locale";
LABEL_15:
      _os_log_error_impl(&dword_1A48B3000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    }
LABEL_8:
    v19 = 0;
    goto LABEL_9;
  }
  v17 = objc_msgSend(v10, "copy");
  tokens = v11->_tokens;
  v11->_tokens = (NSArray *)v17;

  if (!v11->_tokens)
  {
    v20 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CKVTokenChain initWithString:locale:tokens:]";
      v22 = "%s Cannot construct tokenChain with nil tokens";
      goto LABEL_15;
    }
    goto LABEL_8;
  }
LABEL_6:
  v19 = v11;
LABEL_9:

  return v19;
}

- (CKVTokenChain)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use +tokenChainBuilderForString:"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKVTokenChain;
  -[CKVTokenChain description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" normalizedString: %@, locale: %@, tokens: %@"), self->_normalizedString, self->_locale, self->_tokens);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *normalizedString;
  id v5;

  normalizedString = self->_normalizedString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", normalizedString, CFSTR("normalizedStr"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokens, CFSTR("tokens"));

}

- (CKVTokenChain)initWithCoder:(id)a3
{
  id v4;
  CKVTokenChain *v5;
  uint64_t v6;
  NSString *normalizedString;
  uint64_t v8;
  NSLocale *locale;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *tokens;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKVTokenChain;
  v5 = -[CKVTokenChain init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("normalizedStr"));
    v6 = objc_claimAutoreleasedReturnValue();
    normalizedString = v5->_normalizedString;
    v5->_normalizedString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v8 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("tokens"));
    v13 = objc_claimAutoreleasedReturnValue();
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v13;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_normalizedString, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSLocale copyWithZone:](self->_locale, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSArray copyWithZone:](self->_tokens, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CKVTokenChain *v4;
  CKVTokenChain *v5;
  BOOL v6;

  v4 = (CKVTokenChain *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CKVTokenChain isEqualToTokenChain:](self, "isEqualToTokenChain:", v5);

  return v6;
}

- (BOOL)isEqualToTokenChain:(id)a3
{
  id v4;
  NSString *normalizedString;
  void *v6;
  NSLocale *locale;
  void *v8;
  NSArray *tokens;
  void *v10;
  BOOL v11;

  v4 = a3;
  normalizedString = self->_normalizedString;
  objc_msgSend(v4, "normalizedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(normalizedString) = -[NSString isEqualToString:](normalizedString, "isEqualToString:", v6);

  if ((_DWORD)normalizedString
    && (locale = self->_locale,
        objc_msgSend(v4, "locale"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(locale) = -[NSLocale isEqual:](locale, "isEqual:", v8),
        v8,
        (_DWORD)locale))
  {
    tokens = self->_tokens;
    objc_msgSend(v4, "tokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSArray isEqualToArray:](tokens, "isEqualToArray:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_normalizedString, "hash");
  v4 = -[NSLocale hash](self->_locale, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_tokens, "hash");
}

- (NSString)normalizedString
{
  return self->_normalizedString;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
}

+ (id)tokenChainBuilderForString:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  CKVTokenChainBuilder *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[CKVTokenChainBuilder initWithString:locale:]([CKVTokenChainBuilder alloc], "initWithString:locale:", v6, v5);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
