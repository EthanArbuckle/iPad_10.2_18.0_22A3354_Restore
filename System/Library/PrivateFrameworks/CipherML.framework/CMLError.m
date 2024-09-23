@implementation CMLError

- (CMLError)initWithCode:(int64_t)a3 description:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  CMLError *v9;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BDD0FC8];
  v13[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CMLError;
  v9 = -[CMLError initWithDomain:code:userInfo:](&v11, sel_initWithDomain_code_userInfo_, CFSTR("com.apple.CipherML"), a3, v8);

  return v9;
}

- (CMLError)initWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CMLError *v15;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v10, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@"), v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x24BDD1398];
  v18[0] = *MEMORY[0x24BDD0FC8];
  v18[1] = v13;
  v19[0] = v12;
  v19[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)CMLError;
  v15 = -[CMLError initWithDomain:code:userInfo:](&v17, sel_initWithDomain_code_userInfo_, CFSTR("com.apple.CipherML"), a3, v14);

  return v15;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCode:description:", a3, v5);

  return v6;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc((Class)objc_opt_class());
  if (v7)
    v10 = objc_msgSend(v9, "initWithCode:underlyingError:description:", a3, v7, v8);
  else
    v10 = objc_msgSend(v9, "initWithCode:description:", a3, v8);
  v11 = (void *)v10;

  return v11;
}

@end
