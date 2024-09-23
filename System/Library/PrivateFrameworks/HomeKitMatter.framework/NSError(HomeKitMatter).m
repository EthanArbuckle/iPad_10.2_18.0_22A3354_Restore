@implementation NSError(HomeKitMatter)

- (uint64_t)hmmtr_isMatterError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDDB490]);

  return v2;
}

- (uint64_t)isHMMTRError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("HMMTRErrorDomain"));

  return v2;
}

+ (uint64_t)hmmtrErrorWithCode:()HomeKitMatter
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTRErrorDomain"), a3, 0);
}

@end
