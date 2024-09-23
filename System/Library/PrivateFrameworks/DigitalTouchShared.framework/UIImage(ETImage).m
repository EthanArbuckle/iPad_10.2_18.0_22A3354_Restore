@implementation UIImage(ETImage)

+ (id)etImageNamed:()ETImage
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "etImageNamed:inBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)etImageNamed:()ETImage inBundle:
{
  return objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:");
}

@end
