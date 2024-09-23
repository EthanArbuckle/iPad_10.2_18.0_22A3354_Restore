@implementation NSError(WFUserInterface)

- (BOOL)wf_isUnsupportedUserInterfaceError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("WFUserInterfaceErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 0;
  else
    v3 = 0;

  return v3;
}

- (BOOL)wf_isSiriPunchOutError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("WFUserInterfaceErrorDomain")))
    v3 = objc_msgSend(a1, "code") == 2;
  else
    v3 = 0;

  return v3;
}

+ (uint64_t)wfUnsupportedUserInterfaceError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFUserInterfaceErrorDomain"), 0, 0);
}

+ (uint64_t)wfSiriPunchOutError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFUserInterfaceErrorDomain"), 2, 0);
}

@end
