@implementation HKProfileIdentifier(CloudSync)

+ (id)hd_profileIdentifierWithSyncCircleIdentifier:()CloudSync
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("$"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);

    if (v6)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      if ((unint64_t)(v8 - 1) < 4 || (v9 = 0, v8 == 100))
      {
        objc_msgSend(MEMORY[0x1E0CB6A10], "_profileWithUUID:type:", v6, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (__CFString)hd_syncCircleIdentifier
{
  void *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = objc_msgSend(a1, "type");
  if ((unint64_t)(v2 - 1) < 3)
    return CFSTR("PrimarySyncCircle");
  if (v2 == 4)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = objc_msgSend(v1, "type");
    objc_msgSend(v1, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%ld$%@"), v5, v7);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v2 == 100)
  {
    return CFSTR("PrimarySyncCircle");
  }
  return (__CFString *)v1;
}

@end
