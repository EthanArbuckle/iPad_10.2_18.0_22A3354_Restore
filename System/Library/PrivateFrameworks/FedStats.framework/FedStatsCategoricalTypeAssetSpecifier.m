@implementation FedStatsCategoricalTypeAssetSpecifier

- (FedStatsCategoricalTypeAssetSpecifier)initWithAssetSpecifierKey:(id)a3 dynamic:(BOOL)a4 requiredForCollectionKey:(BOOL)a5
{
  id v9;
  FedStatsCategoricalTypeAssetSpecifier *v10;
  FedStatsCategoricalTypeAssetSpecifier *v11;
  void *v12;
  uint64_t v13;
  NSRegularExpression *regex;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FedStatsCategoricalTypeAssetSpecifier;
  v10 = -[FedStatsCategoricalTypeAssetSpecifier init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetSpecifierKey, a3);
    v11->_isDynamic = a4;
    v11->_isRequiredForCollectionKey = a5;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\\{%@+\\}"), CFSTR("[0-9A-Za-z_]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v12, 16, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    regex = v11->_regex;
    v11->_regex = (NSRegularExpression *)v13;

  }
  return v11;
}

+ (id)assetSpecifierWithKey:(id)a3 requiredForCollectionKey:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  FedStatsCategoricalTypeAssetSpecifier *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;

  v6 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^(%@*(\\{%@+\\})*)*%@*$"), CFSTR("[0-9A-Za-z_]"), CFSTR("[0-9A-Za-z_]"), CFSTR("[0-9A-Za-z_]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v8, 16, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstMatchInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "range");
    objc_msgSend(v7, "substringWithRange:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", v7) & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      if (a5)
      {
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, CFSTR("The asset provider key is malformed"));
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = 1;
    }

  }
  else
  {
    if (a5)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, CFSTR("The asset provider key is malformed"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = 1;
  }

  if (v15)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("^%@+$"), CFSTR("[0-9A-Za-z_]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", v17, 16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstMatchInString:options:range:", v7, 4, 0, objc_msgSend(v7, "length"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = objc_msgSend(v19, "range");
      objc_msgSend(v7, "substringWithRange:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v7, "isEqualToString:", v23);

      v25 = v24 ^ 1u;
    }
    else
    {
      v25 = 1;
    }

    v16 = -[FedStatsCategoricalTypeAssetSpecifier initWithAssetSpecifierKey:dynamic:requiredForCollectionKey:]([FedStatsCategoricalTypeAssetSpecifier alloc], "initWithAssetSpecifierKey:dynamic:requiredForCollectionKey:", v7, v25, v6);
  }

  return v16;
}

- (id)assetSpecifierValueForDataPoint:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v5 = a3;
  -[FedStatsCategoricalTypeAssetSpecifier assetSpecifierKey](self, "assetSpecifierKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    do
    {
      -[FedStatsCategoricalTypeAssetSpecifier regex](self, "regex");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstMatchInString:options:range:", v7, 16, v10, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        break;
      v13 = objc_msgSend(v12, "range");
      objc_msgSend(v7, "substringWithRange:", v13 + 1, v14 - 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        if (a4)
        {
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 601, CFSTR("No value in data to insert into asset specifier"));
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

        v22 = 0;
        goto LABEL_10;
      }
      v17 = (void *)v16;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v12, "range");
      objc_msgSend(v7, "replaceCharactersInRange:withString:", v19, v20, v18);
      v21 = objc_msgSend(v12, "range");
      v10 = v21 + objc_msgSend(v18, "length");
      v9 = objc_msgSend(v7, "length") - v10;

    }
    while (v9);
  }
  v22 = v7;
LABEL_10:

  return v22;
}

- (id)parameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[FedStatsCategoricalTypeAssetSpecifier regex](self, "regex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsCategoricalTypeAssetSpecifier assetSpecifierKey](self, "assetSpecifierKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsCategoricalTypeAssetSpecifier assetSpecifierKey](self, "assetSpecifierKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchesInString:options:range:", v4, 16, 0, objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        -[FedStatsCategoricalTypeAssetSpecifier assetSpecifierKey](self, "assetSpecifierKey", (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "range");
        objc_msgSend(v14, "substringWithRange:", v15 + 1, v16 - 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v17);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)isDynamic
{
  return self->_isDynamic;
}

- (BOOL)isRequiredForCollectionKey
{
  return self->_isRequiredForCollectionKey;
}

- (NSString)assetSpecifierKey
{
  return self->_assetSpecifierKey;
}

- (NSRegularExpression)regex
{
  return (NSRegularExpression *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regex, 0);
  objc_storeStrong((id *)&self->_assetSpecifierKey, 0);
}

@end
