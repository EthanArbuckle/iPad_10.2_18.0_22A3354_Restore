@implementation UIColor

id __56__UIColor_MobileSafariExtras__sf_barHairlineShadowColor__block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "_barHairlineShadowColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
