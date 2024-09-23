@implementation BCSError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorDescription:(id)a5
{
  __CFString *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v7 = (__CFString *)a5;
    v8 = a3;
    if (-[__CFString length](v7, "length"))
      v9 = v7;
    else
      v9 = &stru_24C39D888;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v9, CFSTR("BCSErrorDescriptionKey"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v8, a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[BCSError errorWithError:](BCSError, "errorWithError:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorDescription:(id)a5 localizedDescription:(id)a6
{
  __CFString *v9;
  __CFString *v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a3)
  {
    v9 = (__CFString *)a6;
    v10 = (__CFString *)a5;
    v11 = a3;
    v12 = -[__CFString length](v10, "length");
    v13 = &stru_24C39D888;
    if (v12)
      v13 = v10;
    v14 = v13;
    if (-[__CFString length](v9, "length"))
      v15 = v9;
    else
      v15 = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v14, CFSTR("BCSErrorDescriptionKey"), v15, *MEMORY[0x24BDD0FC8], 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v11, a4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[BCSError errorWithError:](BCSError, "errorWithError:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

+ (id)errorWithError:(id)a3
{
  id v3;
  BCSError *v4;

  v3 = a3;
  v4 = -[BCSError initWithError:]([BCSError alloc], "initWithError:", v3);

  return v4;
}

- (BCSError)initWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BCSError *v9;
  objc_super v11;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "code");
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11.receiver = self;
    v11.super_class = (Class)BCSError;
    v9 = -[BCSError initWithDomain:code:userInfo:](&v11, sel_initWithDomain_code_userInfo_, v6, v7, v8);

  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (id)errorDescription
{
  void *v2;
  void *v3;

  -[BCSError userInfo](self, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BCSErrorDescriptionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[BCSError userInfo](self, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD0FC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[BCSError errorDescription](self, "errorDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
