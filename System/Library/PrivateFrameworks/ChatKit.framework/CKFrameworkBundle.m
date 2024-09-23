@implementation CKFrameworkBundle

void __CKFrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.chatkit"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CKFrameworkBundle_sCKBundle;
  CKFrameworkBundle_sCKBundle = v0;

}

@end
