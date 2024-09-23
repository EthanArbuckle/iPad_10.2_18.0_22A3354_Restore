@implementation UIImage(UIImage_MarkupAppIcon)

+ (id)mu_markupAppIcon
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MarkupUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("MarkupActionItemIcon"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
