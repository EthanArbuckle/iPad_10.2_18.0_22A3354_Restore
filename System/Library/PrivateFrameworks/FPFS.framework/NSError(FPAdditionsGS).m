@implementation NSError(FPAdditionsGS)

- (BOOL)fp_isGSErrorWithCode:()FPAdditionsGS
{
  void *v5;
  void *v6;
  _BOOL8 v7;

  v5 = (void *)*MEMORY[0x24BE3AE98];
  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
    v7 = objc_msgSend(a1, "code") == a3;
  else
    v7 = 0;

  return v7;
}

- (uint64_t)fp_isGSInvalidStorageError
{
  return objc_msgSend(a1, "fp_isGSErrorWithCode:", 7);
}

+ (uint64_t)fp_GSInvalidStorageError
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3AE98], 7, 0);
}

@end
