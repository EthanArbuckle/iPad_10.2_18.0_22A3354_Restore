@implementation AVApplicationIdentifier

void __AVApplicationIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AVApplicationIdentifier_mainAppBundle;
  AVApplicationIdentifier_mainAppBundle = v0;

}

@end
