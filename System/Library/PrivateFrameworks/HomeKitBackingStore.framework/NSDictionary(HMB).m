@implementation NSDictionary(HMB)

- (id)hmbDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(CFSTR("{"), "mutableCopy");
  objc_msgSend(a1, "na_map:", &__block_literal_global_179);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v4);

  objc_msgSend(v2, "appendString:", CFSTR("}"));
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

- (id)hmbOPACKDataFromDictionaryWithError:()HMB
{
  uint64_t v4;
  void *v5;
  int v7;

  v7 = 0;
  v4 = MEMORY[0x1D17B60D4](a1, 8, &v7);
  v5 = (void *)v4;
  if (a3 && !v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v7, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)hmbDictionaryFromOPACKData:()HMB error:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  if (a3)
  {
    v5 = (void *)OPACKDecodeData();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
      v9 = v8;

      if (!a4 || v9)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a4)
      {
        v9 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = 0;
    *a4 = v10;
LABEL_15:

    return v9;
  }
  v9 = 0;
  if (a4)
    *a4 = 0;
  return v9;
}

@end
