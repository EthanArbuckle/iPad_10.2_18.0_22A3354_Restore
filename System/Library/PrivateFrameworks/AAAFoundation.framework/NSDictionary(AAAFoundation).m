@implementation NSDictionary(AAAFoundation)

- (id)aaf_dictionaryByAddingEntriesFromDictionary:()AAAFoundation
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  v6 = objc_msgSend(v4, "count");
  if (!v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "aaf_empty");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v9 = v4;
LABEL_7:
    v10 = objc_msgSend(v9, "copy");
LABEL_9:
    v8 = (void *)v10;
    goto LABEL_10;
  }
  if (!v6)
  {
    v9 = a1;
    goto LABEL_7;
  }
  v7 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v7, "addEntriesFromDictionary:", v4);
  v8 = (void *)objc_msgSend(v7, "copy");

LABEL_10:
  return v8;
}

+ (uint64_t)aaf_empty
{
  return MEMORY[0x1E0C9AA70];
}

- (BOOL)aaf_hasObjects
{
  return objc_msgSend(a1, "count") != 0;
}

- (id)aaf_filter:()AAAFoundation
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __42__NSDictionary_AAAFoundation__aaf_filter___block_invoke;
    v12 = &unk_1E99463A0;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v9);
    v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "aaf_empty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)aaf_map:()AAAFoundation
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__NSDictionary_AAAFoundation__aaf_map___block_invoke;
  v8[3] = &unk_1E99463C8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "aaf_mapStoppable:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)aaf_mapStoppable:()AAAFoundation
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(a1, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __48__NSDictionary_AAAFoundation__aaf_mapStoppable___block_invoke;
    v12 = &unk_1E99463A0;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v9);
    v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "aaf_empty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)aaf_dictionaryByAddingValue:()AAAFoundation forKey:
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    v8 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v8, "setValue:forKey:", v7, v6);

    v9 = (id)objc_msgSend(v8, "copy");
  }
  else
  {
    v9 = a1;
  }
  return v9;
}

- (id)aaf_toUrlQueryString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", CFSTR("/"));
    objc_msgSend(a1, "aaf_toUrlQueryItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setQueryItems:", v3);

    objc_msgSend(v2, "percentEncodedQuery");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("%2B"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)aaf_toUrlQueryItems
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  if (objc_msgSend(a1, "count"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__NSDictionary_AAAFoundation__aaf_toUrlQueryItems__block_invoke;
    v6[3] = &unk_1E99463F0;
    v7 = v2;
    v3 = v2;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v6);
    v4 = (void *)objc_msgSend(v3, "copy");

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "aaf_empty");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
