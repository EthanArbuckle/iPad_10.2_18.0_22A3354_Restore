@implementation AMSMockURLOverride

- (AMSMockURLOverride)init
{
  AMSMockURLOverride *v2;
  AMSObservable *v3;
  AMSObservable *executedObservable;
  uint64_t v5;
  NSMutableArray *comparators;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AMSMockURLOverride;
  v2 = -[AMSMockURLOverride init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AMSObservable);
    executedObservable = v2->_executedObservable;
    v2->_executedObservable = v3;

    v5 = objc_opt_new();
    comparators = v2->_comparators;
    v2->_comparators = (NSMutableArray *)v5;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSMockURLOverride *v4;
  void *v5;

  v4 = objc_alloc_init(AMSMockURLOverride);
  -[AMSMockURLOverride response](self, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMockURLOverride setResponse:](v4, "setResponse:", v5);

  return v4;
}

+ (AMSMockURLOverride)overrideWithHost:(id)a3 usingResponse:(id)a4
{
  id v5;
  id v6;
  AMSMockURLOverride *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(AMSMockURLOverride);
  -[AMSMockURLOverride withURLMatchingHost:](v7, "withURLMatchingHost:", v6);

  -[AMSMockURLOverride setResponse:](v7, "setResponse:", v5);
  return v7;
}

+ (AMSMockURLOverride)overrideWithPathComponent:(id)a3 usingResponse:(id)a4
{
  id v5;
  id v6;
  AMSMockURLOverride *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(AMSMockURLOverride);
  -[AMSMockURLOverride withURLContainingPath:](v7, "withURLContainingPath:", v6);

  -[AMSMockURLOverride setResponse:](v7, "setResponse:", v5);
  return v7;
}

+ (AMSMockURLOverride)overrideWithURLRegex:(id)a3 usingResponse:(id)a4
{
  id v5;
  id v6;
  AMSMockURLOverride *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(AMSMockURLOverride);
  -[AMSMockURLOverride withURLRegexValidation:](v7, "withURLRegexValidation:", v6);

  -[AMSMockURLOverride setResponse:](v7, "setResponse:", v5);
  return v7;
}

- (void)withURLMatchingHost:(id)a3
{
  -[AMSMockURLOverride _withURLMatchingHost:containingPath:queryItems:](self, "_withURLMatchingHost:containingPath:queryItems:", a3, 0, 0);
}

- (void)withURLContainingPath:(id)a3
{
  -[AMSMockURLOverride _withURLMatchingHost:containingPath:queryItems:](self, "_withURLMatchingHost:containingPath:queryItems:", 0, a3, 0);
}

- (void)withURLQueryItems:(id)a3
{
  -[AMSMockURLOverride _withURLMatchingHost:containingPath:queryItems:](self, "_withURLMatchingHost:containingPath:queryItems:", 0, 0, a3);
}

- (void)withURLRegexValidation:(id)a3
{
  id v4;
  AMSMockURLRequestComparator *v5;
  id v6;
  AMSMockURLRequestComparator *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [AMSMockURLRequestComparator alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__AMSMockURLOverride_withURLRegexValidation___block_invoke;
  v9[3] = &unk_1E2544090;
  v10 = v4;
  v6 = v4;
  v7 = -[AMSMockURLRequestComparator initWithCriteriaBlock:](v5, "initWithCriteriaBlock:", v9);
  -[AMSMockURLOverride comparators](self, "comparators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

BOOL __45__AMSMockURLOverride_withURLRegexValidation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 1024);

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)withHTTPHeaderValidation:(id)a3
{
  id v4;
  AMSMockURLRequestComparator *v5;
  id v6;
  AMSMockURLRequestComparator *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [AMSMockURLRequestComparator alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__AMSMockURLOverride_withHTTPHeaderValidation___block_invoke;
  v9[3] = &unk_1E25440B8;
  v10 = v4;
  v6 = v4;
  v7 = -[AMSMockURLRequestComparator initWithCriteriaBlock:](v5, "initWithCriteriaBlock:", v9);
  -[AMSMockURLOverride comparators](self, "comparators");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

uint64_t __47__AMSMockURLOverride_withHTTPHeaderValidation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "allHTTPHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v4 = 0;

  return v4;
}

- (void)withHTTPBodyValidation:(id)a3 encoding:(int64_t)a4
{
  id v6;
  AMSMockURLRequestComparator *v7;
  id v8;
  AMSMockURLRequestComparator *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  int64_t v16;

  v6 = a3;
  v7 = [AMSMockURLRequestComparator alloc];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __54__AMSMockURLOverride_withHTTPBodyValidation_encoding___block_invoke;
  v14 = &unk_1E25440E0;
  v15 = v6;
  v16 = a4;
  v8 = v6;
  v9 = -[AMSMockURLRequestComparator initWithCriteriaBlock:](v7, "initWithCriteriaBlock:", &v11);
  -[AMSMockURLOverride comparators](self, "comparators", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

}

uint64_t __54__AMSMockURLOverride_withHTTPBodyValidation_encoding___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AMSData objectWithData:encoding:error:](AMSData, "objectWithData:encoding:error:", v3, *(_QWORD *)(a1 + 40), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldOverrideURLRequest:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSMockURLOverride comparators](self, "comparators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AMSMockURLOverride comparators](self, "comparators", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v6 &= objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "shouldOverrideURLRequest:", v4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)_withURLMatchingHost:(id)a3 containingPath:(id)a4 queryItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSMockURLRequestComparator *v11;
  id v12;
  id v13;
  id v14;
  AMSMockURLRequestComparator *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = [AMSMockURLRequestComparator alloc];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke;
  v17[3] = &unk_1E2544150;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = -[AMSMockURLRequestComparator initWithCriteriaBlock:](v11, "initWithCriteriaBlock:", v17);
  -[AMSMockURLOverride comparators](self, "comparators");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v15);

}

uint64_t __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v3 = a2;
  v4 = v3;
  if (a1[4])
  {
    objc_msgSend(v3, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", a1[4]);

  }
  else
  {
    v7 = 1;
  }
  if (a1[5])
    v8 = (_DWORD)v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v4, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "containsString:", a1[5]);

  }
  if (a1[6] && (_DWORD)v7)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(v4, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithString:", v13);
    objc_msgSend(v14, "queryItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "ams_dictionaryUsingTransform:", &__block_literal_global_96);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = (void *)MEMORY[0x1E0C9AA70];
    if (v16)
      v18 = (void *)v16;
    v19 = v18;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    v20 = (void *)a1[6];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke_3;
    v23[3] = &unk_1E2544128;
    v21 = v19;
    v24 = v21;
    v25 = &v26;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v23);
    v7 = *((_BYTE *)v27 + 24) != 0;

    _Block_object_dispose(&v26, 8);
  }

  return v7;
}

uint64_t __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

void __69__AMSMockURLOverride__withURLMatchingHost_containingPath_queryItems___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_msgSend(v9, "isEqualToString:", v8) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (AMSObservable)executedObservable
{
  return self->_executedObservable;
}

- (void)setExecutedObservable:(id)a3
{
  objc_storeStrong((id *)&self->_executedObservable, a3);
}

- (AMSMockURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSMutableArray)comparators
{
  return self->_comparators;
}

- (void)setComparators:(id)a3
{
  objc_storeStrong((id *)&self->_comparators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparators, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_executedObservable, 0);
}

@end
