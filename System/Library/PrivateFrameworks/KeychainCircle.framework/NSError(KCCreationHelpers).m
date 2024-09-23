@implementation NSError(KCCreationHelpers)

- (uint64_t)initWithOSStatus:()KCCreationHelpers userInfo:
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a3, a4);
}

- (uint64_t)initWithOSStatus:()KCCreationHelpers description:args:
{
  void *v7;
  uint64_t v8;

  UserInfoFromVA(a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "initWithOSStatus:userInfo:", a3, v7);

  return v8;
}

- (uint64_t)initWithCoreCryptoStatus:()KCCreationHelpers userInfo:
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", CFSTR("kSecCoreCryptoDomain"), a3, a4);
}

- (uint64_t)initWithCoreCryptoStatus:()KCCreationHelpers description:args:
{
  void *v7;
  uint64_t v8;

  UserInfoFromVA(a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "initWithCoreCryptoStatus:userInfo:", a3, v7);

  return v8;
}

+ (id)errorWithOSStatus:()KCCreationHelpers userInfo:
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BDD1540];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithOSStatus:userInfo:", a3, v6);

  return v7;
}

+ (id)errorWithOSStatus:()KCCreationHelpers description:args:
{
  objc_class *v7;
  id v8;
  void *v9;

  v7 = (objc_class *)MEMORY[0x24BDD1540];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithOSStatus:description:args:", a3, v8, a5);

  return v9;
}

+ (id)errorWithCoreCryptoStatus:()KCCreationHelpers userInfo:
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BDD1540];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithCoreCryptoStatus:userInfo:", a3, v6);

  return v7;
}

+ (id)errorWithCoreCryptoStatus:()KCCreationHelpers description:args:
{
  objc_class *v7;
  id v8;
  void *v9;

  v7 = (objc_class *)MEMORY[0x24BDD1540];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithCoreCryptoStatus:description:args:", a3, v8, a5);

  return v9;
}

@end
