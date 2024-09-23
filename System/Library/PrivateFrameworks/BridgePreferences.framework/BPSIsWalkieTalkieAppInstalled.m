@implementation BPSIsWalkieTalkieAppInstalled

void __BPSIsWalkieTalkieAppInstalled_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.tincan"));
  v1 = (void *)BPSIsWalkieTalkieAppInstalled__walkieTalkieDomain;
  BPSIsWalkieTalkieAppInstalled__walkieTalkieDomain = v0;

}

@end
