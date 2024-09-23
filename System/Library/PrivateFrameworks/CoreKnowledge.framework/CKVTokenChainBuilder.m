@implementation CKVTokenChainBuilder

- (CKVTokenChainBuilder)initWithString:(id)a3 locale:(id)a4
{
  id v7;
  id v8;
  CKVTokenChainBuilder *v9;
  CKVTokenChainBuilder *v10;
  NSMutableArray *v11;
  NSMutableArray *tokens;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKVTokenChainBuilder;
  v9 = -[CKVTokenChainBuilder init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_normalizedString, a3);
    objc_storeStrong((id *)&v10->_locale, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tokens = v10->_tokens;
    v10->_tokens = v11;

  }
  return v10;
}

- (CKVTokenChainBuilder)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use CKVTokenChain +tokenChainBuilderForString to initialize a builder"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)addToken:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v5 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[CKVTokenChainBuilder addToken:]";
      _os_log_error_impl(&dword_1A48B3000, v5, OS_LOG_TYPE_ERROR, "%s Cannot add nil token", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Cannot add nil token"));
  }
  -[NSMutableArray lastObject](self->_tokens, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v4, "beginIndex");
    if (v7 < objc_msgSend(v6, "endIndex"))
    {
      v8 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315138;
        v10 = "-[CKVTokenChainBuilder addToken:]";
        _os_log_error_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_ERROR, "%s Start index of token is not valid", (uint8_t *)&v9, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Start index of token is not valid"));
    }
  }
  -[NSMutableArray addObject:](self->_tokens, "addObject:", v4);

}

- (id)build
{
  return -[CKVTokenChain initWithString:locale:tokens:]([CKVTokenChain alloc], "initWithString:locale:tokens:", self->_normalizedString, self->_locale, self->_tokens);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
}

@end
