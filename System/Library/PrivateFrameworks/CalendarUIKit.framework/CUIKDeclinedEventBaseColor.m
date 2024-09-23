@implementation CUIKDeclinedEventBaseColor

void __CUIKDeclinedEventBaseColor_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3658];
  CUIKBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("declinedEventBaseColor"), v3, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)CUIKDeclinedEventBaseColor_sDeclinedEventBaseColor;
  CUIKDeclinedEventBaseColor_sDeclinedEventBaseColor = v1;

}

@end
