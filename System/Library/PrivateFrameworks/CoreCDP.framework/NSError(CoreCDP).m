@implementation NSError(CoreCDP)

+ (uint64_t)cdp_errorWithCode:()CoreCDP
{
  return objc_msgSend(a1, "cdp_errorWithCode:userInfo:", a3, 0);
}

+ (uint64_t)cdp_errorWithCode:()CoreCDP userInfo:
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDPStateError"), a3, a4);
}

+ (id)cdp_errorWithCode:()CoreCDP underlyingError:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v10 = *MEMORY[0x24BDD1398];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:userInfo:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)cdp_isCDPErrorWithCode:()CoreCDP
{
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CDPStateError")))
    v6 = objc_msgSend(a1, "code") == a3;
  else
    v6 = 0;

  return v6;
}

- (uint64_t)cdp_isLoginHardLimit
{
  return objc_msgSend(a1, "cdp_isCDPErrorWithCode:", -5204);
}

- (uint64_t)cdp_isLoginSoftLimit
{
  return objc_msgSend(a1, "cdp_isCDPErrorWithCode:", -5203);
}

@end
