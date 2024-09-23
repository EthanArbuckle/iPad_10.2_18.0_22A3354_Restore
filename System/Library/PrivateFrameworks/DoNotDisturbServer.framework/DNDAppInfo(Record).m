@implementation DNDAppInfo(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bs_safeDictionaryForKey:", CFSTR("applicationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v20 = a1;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D1D598], "newWithDictionaryRepresentation:context:", v8, v7);
    objc_msgSend(v6, "bs_safeNumberForKey:", CFSTR("source"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v21 = v7;
    if (v10)
      v12 = objc_msgSend(v10, "unsignedIntegerValue");
    else
      v12 = 0;
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("displayName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("storeIconURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v6, "bs_safeStringForKey:", CFSTR("cachedIconURL"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v13 = objc_msgSend([v20 alloc], "initWithSource:applicationIdentifier:displayName:storeIconURL:cachedIconURL:", v12, v9, v14, v16, v18);

    v7 = v21;
  }
  else
  {
    v9 = 0;
    v13 = 0;
  }

  return v13;
}

- (id)dictionaryRepresentationWithContext:()Record
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(a1, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentationWithContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "source"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("source"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("applicationIdentifier"));
  objc_msgSend(a1, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("displayName"));

  objc_msgSend(a1, "storeIconURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("storeIconURL"));

  objc_msgSend(a1, "cachedIconURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("cachedIconURL"));

  return v7;
}

@end
