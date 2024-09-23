@implementation AVTAvatarUIBundle

void __AVTAvatarUIBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AvatarUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AVTAvatarUIBundle___bundle;
  AVTAvatarUIBundle___bundle = v0;

}

@end
