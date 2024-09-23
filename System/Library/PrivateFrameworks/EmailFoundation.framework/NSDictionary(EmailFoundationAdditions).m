@implementation NSDictionary(EmailFoundationAdditions)

- (id)ef_objectOfClass:()EmailFoundationAdditions forKey:
{
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (uint64_t)ef_all:()EmailFoundationAdditions
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
  v8[2] = __49__NSDictionary_EmailFoundationAdditions__ef_all___block_invoke;
  v8[3] = &unk_1E62A63F0;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)ef_any:()EmailFoundationAdditions
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
  v8[2] = __49__NSDictionary_EmailFoundationAdditions__ef_any___block_invoke;
  v8[3] = &unk_1E62A63F0;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)ef_filter:()EmailFoundationAdditions
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__NSDictionary_EmailFoundationAdditions__ef_filter___block_invoke;
  v14[3] = &unk_1E62A6418;
  v5 = v4;
  v15 = v5;
  objc_msgSend(a1, "keysOfEntriesPassingTest:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v8 == objc_msgSend(a1, "count"))
  {
    v9 = a1;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectsForKeys:notFoundMarker:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v10, "initWithObjects:forKeys:", v12, v7);

  }
  return v9;
}

- (id)ef_mapValues:()EmailFoundationAdditions
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__NSDictionary_EmailFoundationAdditions__ef_mapValues___block_invoke;
  v11[3] = &unk_1E62A6440;
  v6 = v4;
  v13 = v6;
  v7 = v5;
  v12 = v7;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

@end
