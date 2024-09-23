@implementation LACError

+ (id)missingEntitlementError:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Caller is missing the required '%@' entitlement."), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:debugDescription:", -1007, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_errorWithCode:userInfo:", a3, 0);
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v10 = CFSTR("Subcode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 debugDescription:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("Subcode");
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  objc_msgSend(v8, "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = *MEMORY[0x24BDD0BA0];
  v15[0] = v10;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)errorWithCode:(int64_t)a3 subcode:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  if (a5)
    v8 = a5;
  else
    v8 = (id)MEMORY[0x24BDBD1B8];
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Subcode"));

  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorWithCode:(int64_t)a3 debugDescription:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0BA0];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 localizedDescription:(id)a4 underlyingError:(id)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BDD1398];
  v15[0] = *MEMORY[0x24BDD0FC8];
  v15[1] = v8;
  v16[0] = a4;
  v16[1] = a5;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11 = *MEMORY[0x24BDD1398];
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "errorWithCode:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 debugDescription:(id)a5
{
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v8 = *MEMORY[0x24BDD1398];
  v15[0] = *MEMORY[0x24BDD0BA0];
  v15[1] = v8;
  v16[0] = a5;
  v16[1] = a4;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_errorWithCode:userInfo:", a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4
{
  return objc_msgSend(a1, "error:hasCode:subcode:", a3, a4, 0);
}

+ (BOOL)error:(id)a3 hasCode:(int64_t)a4 subcode:(int64_t)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;

  v7 = a3;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.LocalAuthentication"));

  if (v9 && objc_msgSend(v7, "code") == a4)
  {
    objc_msgSend(v7, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Subcode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = objc_msgSend(v11, "integerValue") == a5;
    else
      v12 = a5 == 0;
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.LocalAuthentication"), a3, a4);
}

@end
