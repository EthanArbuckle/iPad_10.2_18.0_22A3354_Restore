@implementation AROSVersionString

void __AROSVersionString_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)AROSVersionString_buildVersion;
  AROSVersionString_buildVersion = v0;

}

@end
