@implementation EKBundle

void __EKBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.eventkit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)EKBundle_eventKitBundle;
  EKBundle_eventKitBundle = v0;

}

@end
