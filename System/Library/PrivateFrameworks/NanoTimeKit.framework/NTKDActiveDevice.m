@implementation NTKDActiveDevice

void __NTKDActiveDevice_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKDActiveDevice___registry;
  NTKDActiveDevice___registry = v0;

}

@end
