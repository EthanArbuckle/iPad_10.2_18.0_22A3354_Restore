@implementation MUWebContentBlocker

+ (id)sharedBlocker
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MUWebContentBlocker_sharedBlocker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED01B6D8 != -1)
    dispatch_once(&qword_1ED01B6D8, block);
  return (id)_MergedGlobals_137;
}

void __36__MUWebContentBlocker_sharedBlocker__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_137;
  _MergedGlobals_137 = (uint64_t)v1;

}

- (BOOL)shouldBlockLoadingOfURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[MUWebContentBlocker _regularExpression](self, "_regularExpression");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
    v7 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0;

  return v7;
}

- (id)_regularExpression
{
  void *v3;
  NSCache *regularExpressionCache;
  NSCache *v5;
  NSCache *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[MUWebContentBlocker patternForBlocking](self, "patternForBlocking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    regularExpressionCache = self->_regularExpressionCache;
    if (!regularExpressionCache)
    {
      v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
      v6 = self->_regularExpressionCache;
      self->_regularExpressionCache = v5;

      -[NSCache setCountLimit:](self->_regularExpressionCache, "setCountLimit:", 1);
      regularExpressionCache = self->_regularExpressionCache;
    }
    -[NSCache objectForKey:](regularExpressionCache, "objectForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v13 = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", v3, 0, &v13);
      v10 = v13;
      if (v9)
      {
        -[NSCache setObject:forKey:](self->_regularExpressionCache, "setObject:forKey:", v9, v3);
      }
      else
      {
        if (qword_1ED01B6E8 != -1)
          dispatch_once(&qword_1ED01B6E8, &__block_literal_global_53);
        v11 = qword_1ED01B6E0;
        if (os_log_type_enabled((os_log_t)qword_1ED01B6E0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v15 = v3;
          v16 = 2112;
          v17 = v10;
          _os_log_impl(&dword_191DB8000, v11, OS_LOG_TYPE_ERROR, "Error parsing regex pattern '%@': %@", buf, 0x16u);
        }
      }
      v8 = v9;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)patternForBlocking
{
  return (id)GEOConfigGetString();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regularExpressionCache, 0);
}

@end
