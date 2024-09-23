@implementation _ASAccountSharingGroupOnBoardingCreateGroupContent

+ (NSString)headerImageName
{
  return (NSString *)CFSTR("person.2.badge.key.fill");
}

+ (UIImage)headerImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 48.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationByApplyingConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "headerImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_systemImageNamed:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithConfiguration:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v11;
}

+ (NSString)headerTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)firstBulletImageName
{
  return (NSString *)CFSTR("person.crop.circle.fill.badge.plus");
}

+ (UIImage)firstBulletImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "firstBulletImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bulletListItemImageConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

+ (NSString)firstBulletTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)firstBulletDescription
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)secondBulletImageName
{
  return (NSString *)CFSTR("checklist");
}

+ (UIImage)secondBulletImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "secondBulletImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bulletListItemImageConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

+ (NSString)secondBulletTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)secondBulletDescription
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)thirdBulletImageName
{
  return (NSString *)CFSTR("switch.2");
}

+ (UIImage)thirdBulletImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "thirdBulletImageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bulletListItemImageConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

+ (NSString)thirdBulletTitle
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)thirdBulletDescription
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)_bulletListItemImageConfiguration
{
  if (_bulletListItemImageConfiguration_onceToken != -1)
    dispatch_once(&_bulletListItemImageConfiguration_onceToken, &__block_literal_global_4);
  return (id)_bulletListItemImageConfiguration_imageConfiguration;
}

@end
