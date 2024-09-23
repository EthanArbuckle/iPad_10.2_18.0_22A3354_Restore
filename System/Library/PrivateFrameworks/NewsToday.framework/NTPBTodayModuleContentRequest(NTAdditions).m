@implementation NTPBTodayModuleContentRequest(NTAdditions)

- (id)identifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_msgSend(a1, "moduleDescriptorType");
  objc_msgSend(a1, "tagID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%d-%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
