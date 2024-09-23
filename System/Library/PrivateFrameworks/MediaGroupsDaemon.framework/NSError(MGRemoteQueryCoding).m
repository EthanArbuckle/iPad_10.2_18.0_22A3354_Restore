@implementation NSError(MGRemoteQueryCoding)

- (id)rq_coded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rq_coded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "code"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rq_coded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rq_coded");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("domain"));

  objc_msgSend(v6, "rq_coded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, CFSTR("code"));

  return v2;
}

+ (id)rq_instanceFromCoded:()MGRemoteQueryCoding
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(v4, "rq_stringForKey:", CFSTR("domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rq_numberForKey:", CFSTR("code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v5, objc_msgSend(v6, "integerValue"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
