@implementation FCPersonalizationDecomposedURL

- (FCPersonalizationDecomposedURL)initWithURL:(id)a3
{
  id v4;
  FCPersonalizationDecomposedURL *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *domain;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSArray *paths;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  _QWORD v32[3];
  char v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FCPersonalizationDecomposedURL;
  v5 = -[FCPersonalizationDecomposedURL init](&v34, sel_init);
  if (v5)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v33 = 0;
    v6 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke;
    v29[3] = &unk_1E46457D0;
    v30 = v4;
    v31 = v32;
    __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke((uint64_t)v29);
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_2;
    v27[3] = &unk_1E463ADC8;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v28 = v7;
    __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_2((uint64_t)v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if ((objc_msgSend(v10, "hasSuffix:", CFSTR(".uk")) & 1) != 0)
    {
      v11 = 3;
    }
    else if (objc_msgSend(v10, "hasSuffix:", CFSTR(".au")))
    {
      v11 = 3;
    }
    else
    {
      v11 = 2;
    }
    v12 = objc_msgSend(v9, "count");
    objc_msgSend(v9, "fc_safeSubarrayWithCountFromFront:", (v12 & ~(v12 >> 63)) - v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fc_safeSubarrayWithCountFromBack:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("."));
    v15 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v15;

    v17 = (void *)MEMORY[0x1E0C99D20];
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_4;
    v23[3] = &unk_1E46457F8;
    v18 = v7;
    v24 = v18;
    v26 = v32;
    v19 = v13;
    v25 = v19;
    objc_msgSend(v17, "fc_array:", v23);
    v20 = objc_claimAutoreleasedReturnValue();
    paths = v5->_paths;
    v5->_paths = (NSArray *)v20;

    _Block_object_dispose(v32, 8);
  }

  return v5;
}

id __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(v3, "hasSuffix:", CFSTR("/")))
  {
    do
      objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
    while ((objc_msgSend(v3, "hasSuffix:", CFSTR("/")) & 1) != 0);
  }
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("www.google.com/amp/s/"));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v3, "deleteCharactersInRange:", v4, v5);
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v1, "rangeOfString:", CFSTR("www.")))
  {
    objc_msgSend(v1, "substringFromIndex:", v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v3;
  }
  return v1;
}

void __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "fc_subarrayFromIndex:inclusive:", 1, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "fc_subarrayFromIndex:inclusive:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count") && objc_msgSend(v6, "count"))
    {
      v7 = 0;
      v8 = 0;
      do
      {
        objc_msgSend(v6, "fc_subarrayUpToIndex:inclusive:", objc_msgSend(v6, "count") + v7, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR("/"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("/"), "stringByAppendingString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v11);

        ++v8;
        --v7;
      }
      while (objc_msgSend(v6, "count") > v8);
    }
    v4 = v6;
  }
  objc_msgSend(*(id *)(a1 + 40), "fc_arrayByTransformingWithBlock:", &__block_literal_global_100);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v12);

  objc_msgSend(v13, "addObject:", CFSTR("/"));
}

uint64_t __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("/"), "stringByAppendingString:", a2);
}

- (FCPersonalizationDecomposedURL)initWithURLString:(id)a3
{
  void *v4;
  FCPersonalizationDecomposedURL *v5;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCPersonalizationDecomposedURL initWithURL:](self, "initWithURL:", v4);

  return v5;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&self->_paths, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
