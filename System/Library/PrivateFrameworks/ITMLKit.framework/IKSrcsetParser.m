@implementation IKSrcsetParser

- (IKSrcsetParser)initWithSrcsetStr:(id)a3 defaultStr:(id)a4
{
  id v6;
  id v7;
  IKSrcsetParser *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  IKSrcSetRule *v15;
  uint64_t v16;
  NSArray *srcsetRules;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)IKSrcsetParser;
  v8 = -[IKSrcsetParser init](&v25, sel_init);
  if (v8)
  {
    if (initWithSrcsetStr_defaultStr__sOnce != -1)
      dispatch_once(&initWithSrcsetStr_defaultStr__sOnce, &__block_literal_global_15);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v10 = (void *)initWithSrcsetStr_defaultStr__sSrcsetRegularExpression;
      v11 = objc_msgSend(v6, "length");
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __47__IKSrcsetParser_initWithSrcsetStr_defaultStr___block_invoke_2;
      v22 = &unk_1E9F4DD48;
      v23 = v6;
      v24 = v9;
      objc_msgSend(v10, "enumerateMatchesInString:options:range:usingBlock:", v23, 0, 0, v11, &v19);

    }
    if (objc_msgSend(v7, "length", v19, v20, v21, v22))
    {
      v12 = objc_alloc(MEMORY[0x1E0C99E98]);
      objc_msgSend(v7, "stringByTrimmingCharactersInSet:", initWithSrcsetStr_defaultStr__sWhiteSpaceChars);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithString:", v13);

      v15 = -[IKSrcSetRule initWithURL:descriptor:]([IKSrcSetRule alloc], "initWithURL:descriptor:", v14, 0);
      objc_msgSend(v9, "addObject:", v15);

    }
    v16 = objc_msgSend(v9, "copy");
    srcsetRules = v8->_srcsetRules;
    v8->_srcsetRules = (NSArray *)v16;

  }
  return v8;
}

void __47__IKSrcsetParser_initWithSrcsetStr_defaultStr___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("([^\\s,]+)(\\s+[^,]+)?"), 0, 0);
  v1 = (void *)initWithSrcsetStr_defaultStr__sSrcsetRegularExpression;
  initWithSrcsetStr_defaultStr__sSrcsetRegularExpression = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithSrcsetStr_defaultStr__sWhiteSpaceChars;
  initWithSrcsetStr_defaultStr__sWhiteSpaceChars = v2;

}

void __47__IKSrcsetParser_initWithSrcsetStr_defaultStr___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  IKSrcSetRule *v15;
  id v16;

  v16 = a2;
  if (objc_msgSend(v16, "numberOfRanges") == 3)
  {
    v3 = objc_msgSend(v16, "rangeAtIndex:", 1);
    v5 = v4;
    v6 = objc_msgSend(v16, "rangeAtIndex:", 2);
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", initWithSrcsetStr_defaultStr__sWhiteSpaceChars);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithString:", v11);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByTrimmingCharactersInSet:", initWithSrcsetStr_defaultStr__sWhiteSpaceChars);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_9;
    }
    else
    {
      v14 = &stru_1E9F50578;
      if (!v12)
        goto LABEL_9;
    }
    if (-[__CFString hasSuffix:](v14, "hasSuffix:", CFSTR("x")))
    {
      v15 = -[IKSrcSetRule initWithURL:descriptor:]([IKSrcSetRule alloc], "initWithURL:descriptor:", v12, v14);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

    }
  }
  else
  {
    v12 = 0;
    v14 = &stru_1E9F50578;
  }
LABEL_9:

}

- (NSURL)resolvedURL
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  NSArray *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_srcsetRules;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "descriptor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "hasSuffix:", CFSTR("x")))
        {
          objc_msgSend(v11, "descriptor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "integerValue") == (uint64_t)v5;

        }
        else
        {
          v14 = 0;
        }

        if (v14 || !v8)
        {
          v15 = v11;

          v8 = v15;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v8, "imageURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srcsetRules, 0);
}

@end
