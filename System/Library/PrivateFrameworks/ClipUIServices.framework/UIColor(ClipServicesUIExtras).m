@implementation UIColor(ClipServicesUIExtras)

+ (id)cps_colorNamed:()ClipServicesUIExtras
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "cps_clipUIServicesBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
