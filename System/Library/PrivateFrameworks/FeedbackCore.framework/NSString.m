@implementation NSString

void __35__NSString_FBKUtils__whitespaceSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)whitespaceSet_set;
  whitespaceSet_set = v0;

}

@end
