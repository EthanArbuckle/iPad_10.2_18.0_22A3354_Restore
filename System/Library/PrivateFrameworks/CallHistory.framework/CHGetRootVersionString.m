@implementation CHGetRootVersionString

void __CHGetRootVersionString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%s"), "CallHistory-", "16.100.1.2.6");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CHGetRootVersionString_version;
  CHGetRootVersionString_version = v0;

}

@end
