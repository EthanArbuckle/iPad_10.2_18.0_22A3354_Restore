@implementation FriendKitBundle

void __FriendKitBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.FriendKit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FriendKitBundle___bundle;
  FriendKitBundle___bundle = v0;

}

@end
