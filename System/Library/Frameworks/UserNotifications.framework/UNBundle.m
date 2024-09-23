@implementation UNBundle

void __UNBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)UNBundle___userNotificationBundle;
  UNBundle___userNotificationBundle = v0;

}

@end
