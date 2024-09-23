@implementation NSError(ARAdditions)

- (id)initWithDictionary:()ARAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CB2F70];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2F70]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDictionary:", v8);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v7);

    objc_msgSend(v10, "ar_map:", &__block_literal_global_71);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v9);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domain"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    a1 = (id)objc_msgSend(a1, "initWithDomain:code:userInfo:", v13, objc_msgSend(v14, "integerValue"), v6);
    v15 = a1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)encodeToDictionary
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__NSError_ARAdditions__encodeToDictionary__block_invoke;
  v10[3] = &unk_1E6674C48;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("domain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("code"));

  v8 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("userInfo"));

  return v2;
}

@end
