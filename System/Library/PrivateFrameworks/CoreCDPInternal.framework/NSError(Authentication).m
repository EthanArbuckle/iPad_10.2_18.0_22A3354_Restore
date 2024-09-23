@implementation NSError(Authentication)

- (unint64_t)isAuthenticationError
{
  void *v2;
  int v3;
  unint64_t v4;
  void *v6;
  int v7;
  void *v9;
  int v10;
  uint64_t v11;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE17C10]);

  if (v3)
  {
    v4 = objc_msgSend(a1, "code");
    if (v4 >= 0x23)
      return 0;
    else
      return (0x400000180uLL >> v4) & 1;
  }
  else
  {
    objc_msgSend(a1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE17B90]);

    if (v7)
    {
      return objc_msgSend(a1, "code") == 305;
    }
    else
    {
      objc_msgSend(a1, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE17B98]);

      if (!v10)
        return 0;
      v11 = objc_msgSend(a1, "code");
      return v11 == 99 || v11 == 102;
    }
  }
}

- (BOOL)isAuthKitUnableToPromptError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE0AB28]))
    v3 = objc_msgSend(a1, "code") == -7013;
  else
    v3 = 0;

  return v3;
}

- (uint64_t)isAuthKitUnableToPromptDueToNetworkError
{
  void *v2;
  void *v3;
  char v4;

  if (objc_msgSend(a1, "isAuthKitUnableToPromptError"))
  {
    objc_msgSend(a1, "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (objc_msgSend(v3, "code") == -7005)
        v4 = -1;
      else
        v4 = 0;
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

@end
