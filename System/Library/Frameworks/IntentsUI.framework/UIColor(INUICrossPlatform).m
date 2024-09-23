@implementation UIColor(INUICrossPlatform)

+ (uint64_t)_inui_colorNamed:()INUICrossPlatform bundle:
{
  return objc_msgSend(a1, "colorNamed:inBundle:compatibleWithTraitCollection:", a3, a4, 0);
}

@end
