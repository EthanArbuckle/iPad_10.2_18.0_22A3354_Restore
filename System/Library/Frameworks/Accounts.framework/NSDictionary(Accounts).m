@implementation NSDictionary(Accounts)

- (id)ac_mapValues:()Accounts
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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+Accounts.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__NSDictionary_Accounts__ac_mapValues___block_invoke;
  v12[3] = &unk_1E4894088;
  v13 = v6;
  v14 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)ac_mapValuesNullable:()Accounts
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
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+Accounts.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__NSDictionary_Accounts__ac_mapValuesNullable___block_invoke;
  v12[3] = &unk_1E48940B0;
  v13 = v6;
  v14 = v5;
  v7 = v6;
  v8 = v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

@end
