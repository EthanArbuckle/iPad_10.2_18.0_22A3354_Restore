@implementation CRError

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:description:underlyingError:userInfo:", a3, 0, 0, 0);
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:description:underlyingError:userInfo:", a3, a4, 0, 0);
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5 userInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (v11)
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", v11, 1);
  else
    v12 = objc_opt_new();
  v13 = (void *)v12;
  CRErrorCodeGetName(a3);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v9 && v14)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@: %@"), v14, v9);
    objc_msgSend(v13, "setObject:forKey:", v16, *MEMORY[0x24BDD0FC8]);

  }
  else if (v14)
  {
    objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x24BDD0FC8]);
  }
  if (v10)
    objc_msgSend(v13, "setObject:forKey:", v10, *MEMORY[0x24BDD1398]);
  v17 = (void *)MEMORY[0x24BDD1540];
  if (objc_msgSend(v13, "count"))
    v18 = v13;
  else
    v18 = 0;
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.cards.error"), a3, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
