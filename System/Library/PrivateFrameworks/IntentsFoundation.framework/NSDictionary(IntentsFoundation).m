@implementation NSDictionary(IntentsFoundation)

- (id)if_compactMap:()IntentsFoundation
{
  size_t v5;
  size_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  Class *v13;
  void *v14;

  v5 = objc_msgSend(a1, "count");
  if (!v5)
    return a1;
  v6 = v5;
  v7 = malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  v8 = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
  objc_msgSend(a1, "getObjects:andKeys:count:", v8, v7, v6);
  v9 = 0;
  v10 = 0;
  do
  {
    if (v9 != v10)
    {
      v7[v10] = v7[v9];
      v8[v10] = v8[v9];
    }
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD *, _QWORD *))(a3 + 16))(a3, v7[v9], v8[v9], &v7[v10], &v8[v10]);
    if (v7[v10] && v8[v10])
      ++v10;
    ++v9;
  }
  while (v6 != v9);
  v11 = (void *)objc_opt_class();
  v12 = objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class());
  v13 = (Class *)0x1E0C99D80;
  if (v12)
    v13 = (Class *)0x1E0C99E08;
  v14 = (void *)objc_msgSend(objc_alloc(*v13), "initWithObjects:forKeys:count:", v8, v7, v10);
  free(v7);
  free(v8);
  return v14;
}

- (id)if_dictionaryByAddingEntriesFromDictionary:()IntentsFoundation
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (__CFString)if_JSONStringRepresentation
{
  void *v1;
  __CFString *v2;

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a1, 2, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);
  else
    v2 = CFSTR("{}");

  return v2;
}

- (id)if_dictionaryWithNonEmptyValues
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "keysOfEntriesPassingTest:", &__block_literal_global_41);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryWithValuesForKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)if_dictionaryWithObjects:()IntentsFoundation forKeys:uniquingKeysWith:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v10, "count");
  v12 = malloc_type_calloc(objc_msgSend(v10, "count"), 8uLL, 0x80040B8603338uLL);
  v13 = malloc_type_calloc(objc_msgSend(v10, "count"), 8uLL, 0x80040B8603338uLL);
  objc_msgSend(v10, "getObjects:range:", v12, 0, v11);
  objc_msgSend(v9, "getObjects:range:", v13, 0, v11);

  v14 = objc_msgSend(v10, "count");
  objc_msgSend(a1, "if_dictionaryWithObjects:forKeys:count:uniquingKeysWith:", v12, v13, v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  free(v12);
  free(v13);
  return v15;
}

+ (id)if_dictionaryWithObjects:()IntentsFoundation forKeys:count:uniquingKeysWith:
{
  void (**v10)(id, void *, id);
  id i;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = a6;
  for (i = objc_alloc_init(MEMORY[0x1E0C99E08]); a5; --a5)
  {
    v12 = *a4;
    v13 = *a3;
    objc_msgSend(i, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v10[2](v10, v14, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "setObject:forKey:", v15, v12);

    }
    else
    {
      objc_msgSend(i, "setObject:forKey:", v13, v12);
    }

    ++a3;
    ++a4;
  }
  objc_msgSend(a1, "dictionaryWithDictionary:", i);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
