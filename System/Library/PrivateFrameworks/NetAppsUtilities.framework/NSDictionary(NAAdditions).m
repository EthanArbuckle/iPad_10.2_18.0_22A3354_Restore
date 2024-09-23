@implementation NSDictionary(NAAdditions)

- (id)na_dictionaryByMappingValues:()NAAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__NSDictionary_NAAdditions__na_dictionaryByMappingValues___block_invoke;
    v10[3] = &unk_1E6227B80;
    v12 = v4;
    v6 = v5;
    v11 = v6;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = v11;
    v8 = v6;

  }
  else
  {
    v8 = a1;
  }

  return v8;
}

- (void)na_each:()NAAdditions
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__NSDictionary_NAAdditions__na_each___block_invoke;
  v6[3] = &unk_1E6227BF8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (id)na_reduceWithInitialValue:()NAAdditions reducer:
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v8 = v6;
  v20 = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__NSDictionary_NAAdditions__na_reduceWithInitialValue_reducer___block_invoke;
  v12[3] = &unk_1E6227BA8;
  v14 = &v15;
  v9 = v7;
  v13 = v9;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)na_firstKeyPassingTest:()NAAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  objc_msgSend(a1, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__NSDictionary_NAAdditions__na_firstKeyPassingTest___block_invoke;
  v10[3] = &unk_1E6227B58;
  v10[4] = a1;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (id)na_map:()NAAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__NSDictionary_NAAdditions__na_map___block_invoke;
  v11[3] = &unk_1E6227B80;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)na_flatMap:()NAAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__NSDictionary_NAAdditions__na_flatMap___block_invoke;
  v11[3] = &unk_1E6227B80;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)na_filter:()NAAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __39__NSDictionary_NAAdditions__na_filter___block_invoke;
    v12 = &unk_1E6227B80;
    v13 = v5;
    v14 = v4;
    v6 = v5;
    objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v9);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v6, v9, v10, v11, v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a1;
  }

  return v7;
}

- (uint64_t)na_any:()NAAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__NSDictionary_NAAdditions__na_any___block_invoke;
  v8[3] = &unk_1E6227BD0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)na_allSatisfy:()NAAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__NSDictionary_NAAdditions__na_allSatisfy___block_invoke;
  v8[3] = &unk_1E6227BD0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end
