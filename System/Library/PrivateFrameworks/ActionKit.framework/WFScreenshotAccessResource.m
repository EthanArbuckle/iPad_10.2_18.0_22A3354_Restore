@implementation WFScreenshotAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)name
{
  return WFLocalizedString(CFSTR("Take a Screenshot"));
}

- (id)icon
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEC14E0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("Image"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)status
{
  return 4;
}

@end
