@implementation NSDictionary(CATBoxing)

- (id)cat_errorValue
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Domain"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("UserInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = 0;
  if (v4)
    v12 = v7 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v4, objc_msgSend(v7, "integerValue"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
