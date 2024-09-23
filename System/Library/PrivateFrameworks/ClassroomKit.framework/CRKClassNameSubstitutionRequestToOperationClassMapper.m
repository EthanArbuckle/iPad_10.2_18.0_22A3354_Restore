@implementation CRKClassNameSubstitutionRequestToOperationClassMapper

- (CRKClassNameSubstitutionRequestToOperationClassMapper)init
{
  void *v3;
  CRKClassNameSubstitutionRequestToOperationClassMapper *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[CRKClassNameSubstitutionRequestToOperationClassMapper initWithAllowedRequestPrefixes:operationPrefix:](self, "initWithAllowedRequestPrefixes:operationPrefix:", v3, &stru_24D9CB490);

  return v4;
}

- (CRKClassNameSubstitutionRequestToOperationClassMapper)initWithAllowedRequestPrefixes:(id)a3 operationPrefix:(id)a4
{
  id v6;
  id v7;
  CRKClassNameSubstitutionRequestToOperationClassMapper *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *mAllowedPrefixes;
  uint64_t v13;
  NSString *mOperationPrefix;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRKClassNameSubstitutionRequestToOperationClassMapper;
  v8 = -[CRKClassNameSubstitutionRequestToOperationClassMapper init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("length"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    mAllowedPrefixes = v8->mAllowedPrefixes;
    v8->mAllowedPrefixes = (NSArray *)v11;

    v13 = objc_msgSend(v7, "copy");
    mOperationPrefix = v8->mOperationPrefix;
    v8->mOperationPrefix = (NSString *)v13;

  }
  return v8;
}

- (Class)operationClassForRequest:(id)a3
{
  objc_class *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CRKClassNameSubstitutionRequestToOperationClassMapper stringByApplyingOperationSuffixToString:](self, "stringByApplyingOperationSuffixToString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CRKClassNameSubstitutionRequestToOperationClassMapper stringByApplyingOperationPrefixToString:](self, "stringByApplyingOperationPrefixToString:", v6);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
        v7 = (NSString *)NSClassFromString(v7);
      v9 = v7;

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

  return (Class)v9;
}

- (id)stringByApplyingOperationSuffixToString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasSuffix:", CFSTR("Request")))
  {
    v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("Request"), 4);
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v4, v5, CFSTR("Operation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)stringByApplyingOperationPrefixToString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *mOperationPrefix;
  void *v9;
  void *v10;

  v4 = a3;
  -[CRKClassNameSubstitutionRequestToOperationClassMapper prefixForString:](self, "prefixForString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    mOperationPrefix = self->mOperationPrefix;
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v5, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), mOperationPrefix, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)prefixForString:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->mAllowedPrefixes;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v4, "hasPrefix:", v9, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOperationPrefix, 0);
  objc_storeStrong((id *)&self->mAllowedPrefixes, 0);
}

@end
