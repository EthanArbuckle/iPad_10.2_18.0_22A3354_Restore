@implementation NSArray(AppleAccount)

- (id)aa_arrayByRemovingObject:()AppleAccount
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObject:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)aa_filter:()AppleAccount
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+AppleAccount.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__NSArray_AppleAccount__aa_filter___block_invoke;
  v12[3] = &unk_1E416E300;
  v13 = v6;
  v14 = v5;
  v7 = v6;
  v8 = v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

- (id)aa_firstObjectPassingTest:()AppleAccount
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+AppleAccount.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

  }
  v6 = objc_msgSend(a1, "indexOfObjectPassingTest:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)aa_map:()AppleAccount
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+AppleAccount.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__NSArray_AppleAccount__aa_map___block_invoke;
  v12[3] = &unk_1E416E328;
  v13 = v6;
  v14 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)aa_mapNullable:()AppleAccount
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+AppleAccount.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__NSArray_AppleAccount__aa_mapNullable___block_invoke;
  v12[3] = &unk_1E416E300;
  v13 = v6;
  v14 = v5;
  v7 = v6;
  v8 = v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v12);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

- (uint64_t)aa_isSubsetOfArray:()AppleAccount
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", a1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);

  v8 = objc_msgSend(v6, "isSubsetOfSet:", v7);
  return v8;
}

@end
