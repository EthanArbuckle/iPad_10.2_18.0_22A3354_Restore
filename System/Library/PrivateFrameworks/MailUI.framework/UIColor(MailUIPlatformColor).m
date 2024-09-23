@implementation UIColor(MailUIPlatformColor)

+ (uint64_t)colorNamed:()MailUIPlatformColor bundle:
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorNamed:inBundle:compatibleWithTraitCollection:", a3, a4, 0);
}

@end
