@implementation NSError(CDP)

- (BOOL)shouldDisplayToUser
{
  return (unint64_t)objc_msgSend(a1, "code") >> 1 == 0x7FFFFFFFFFFFF5D6;
}

- (BOOL)cdp_indicatesDaemonConnectionWasInterrupted
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    v3 = objc_msgSend(a1, "code") == 4097;
  else
    v3 = 0;

  return v3;
}

@end
