@implementation NSError(NanoMail)

+ (uint64_t)errorWithCode:()NanoMail userInfo:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanomail"), a3, a4);
}

+ (uint64_t)errorWithCode:()NanoMail
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanomail"), a3, MEMORY[0x24BDBD1B8]);
}

+ (id)genericErrorWithMessage:()NanoMail
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorWithCode:userInfo:", 999, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)httpErrorWithCode:()NanoMail message:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = *MEMORY[0x24BDD0FC8];
  v12[1] = CFSTR("NNMKErrorHTTPStatusCodeUserInfoKey");
  v13[0] = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "errorWithCode:userInfo:", 998, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isAuthenticationError
{
  return objc_msgSend(a1, "code") == 1032 || objc_msgSend(a1, "code") == 1055 || objc_msgSend(a1, "code") == 1034;
}

@end
