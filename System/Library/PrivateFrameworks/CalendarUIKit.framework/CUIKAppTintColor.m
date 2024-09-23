@implementation CUIKAppTintColor

void __CUIKAppTintColor_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CUIKAppTintColor_sAppTintColor;
  CUIKAppTintColor_sAppTintColor = v0;

}

@end
