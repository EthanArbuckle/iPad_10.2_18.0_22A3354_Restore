@implementation NSDictionary(CDMJSONSerialization)

- (id)_cdm_JSONString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x220744410]();
  if (DeepCopy)
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], DeepCopy, 1uLL);
  objc_msgSend(DeepCopy, "_cdm_safeJSONTraverse");
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", DeepCopy, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);

  objc_autoreleasePoolPop(v2);
  return v4;
}

@end
