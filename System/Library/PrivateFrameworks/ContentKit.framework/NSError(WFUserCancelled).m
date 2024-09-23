@implementation NSError(WFUserCancelled)

- (BOOL)wf_isUserCancelledError
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    v3 = objc_msgSend(a1, "code") == 3072;
  else
    v3 = 0;

  return v3;
}

+ (uint64_t)userCancelledError
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3072, 0);
}

@end
