@implementation ATXCoreAnalyticsFieldUtilities

+ (id)_getSalt
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "stringForKey:", CFSTR("coreAnalyticsFieldHashSaltKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("coreAnalyticsFieldHashSaltKey"));
  }

  return v4;
}

+ (id)hashBoundString:(id)a3
{
  return (id)objc_msgSend(a1, "hashBoundString:hashSpaceSize:", a3, 1000000);
}

+ (id)hashBoundString:(id)a3 hashSpaceSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "_getSalt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hash");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v9 % a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
