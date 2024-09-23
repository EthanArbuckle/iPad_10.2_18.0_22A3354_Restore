@implementation NSError(MSDExtension)

+ (id)errorDomainMSDWithCode:()MSDExtension message:
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BDD1540];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDomainMSDCode:message:", a3, v6);

  return v7;
}

+ (id)errorDomainMSDWithCode:()MSDExtension message:reason:
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x24BDD1540];
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithDomainMSDCode:message:reason:", a3, v9, v8);

  return v10;
}

+ (id)masterServerErrorWithCode:()MSDExtension mesage:reason:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x24BDD0FC8]);
  if (v8)
    objc_msgSend(v10, "setObject:forKey:", v8, *MEMORY[0x24BDD0FD8]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MSDMasterServerErrorDomain"), a3, v10);

  return v11;
}

+ (id)masterServerErrorRetryAfter:()MSDExtension
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RetryAfter"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MSDMasterServerErrorDomain"), 202, v5);
  return v6;
}

- (uint64_t)initWithDomainMSDCode:()MSDExtension message:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a4, *MEMORY[0x24BDD0FC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "initWithDomain:code:userInfo:", CFSTR("MSDDemodErrorDomain"), a3, v6);

  return v7;
}

- (uint64_t)initWithDomainMSDCode:()MSDExtension message:reason:
{
  void *v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x24BDD0FC8], a5, *MEMORY[0x24BDD0FD8], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "initWithDomain:code:userInfo:", CFSTR("MSDDemodErrorDomain"), a3, v7);

  return v8;
}

@end
