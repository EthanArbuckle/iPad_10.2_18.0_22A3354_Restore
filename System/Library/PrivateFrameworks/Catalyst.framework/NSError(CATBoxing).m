@implementation NSError(CATBoxing)

- (id)cat_dictionaryValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Code"));

  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("Domain"));

  objc_msgSend(a1, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("UserInfo"));

  v8 = (void *)objc_msgSend(v2, "copy");
  return v8;
}

@end
