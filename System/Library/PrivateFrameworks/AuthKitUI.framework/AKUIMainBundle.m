@implementation AKUIMainBundle

void ___AKUIMainBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_AKUIMainBundle_mainBundle;
  _AKUIMainBundle_mainBundle = v0;

}

@end
