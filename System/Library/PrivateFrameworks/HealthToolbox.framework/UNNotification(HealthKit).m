@implementation UNNotification(HealthKit)

- (uint64_t)wd_domain
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "wd_userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x24BDD46A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "integerValue");
  return v3;
}

- (id)wd_url
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a1, "wd_userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD46B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)wd_userInfo
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "request");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
