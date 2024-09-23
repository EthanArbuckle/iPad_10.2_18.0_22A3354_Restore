@implementation _ASAccountSharingGroupOnBoardingInvitationAcceptanceFlowContent

+ (NSString)headerImageNameForWelcomeView
{
  return (NSString *)CFSTR("person.2.badge.key.fill");
}

+ (UIImage)headerImageForWelcomeView
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "headerImageNameForWelcomeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_headerImageForString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (id)headerTitleForWelcomeViewWithGroupName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)firstBulletImageNameForWelcomeView
{
  return (NSString *)CFSTR("rectangle.and.pencil.and.ellipsis");
}

+ (UIImage)firstBulletImageForWelcomeView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "firstBulletImageNameForWelcomeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bulletListItemImageConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

+ (NSString)firstBulletTitleForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)firstBulletDescriptionForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)secondBulletImageNameForWelcomeView
{
  return (NSString *)CFSTR("checklist");
}

+ (UIImage)secondBulletImageForWelcomeView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "secondBulletImageNameForWelcomeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bulletListItemImageConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

+ (NSString)secondBulletTitleForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)secondBulletDescriptionForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)thirdBulletImageNameForWelcomeView
{
  return (NSString *)CFSTR("switch.2");
}

+ (UIImage)thirdBulletImageForWelcomeView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "thirdBulletImageNameForWelcomeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bulletListItemImageConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v7;
}

+ (NSString)thirdBulletTitleForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (NSString)thirdBulletDescriptionForWelcomeView
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)_bulletListItemImageConfiguration
{
  if (_bulletListItemImageConfiguration_onceToken_0 != -1)
    dispatch_once(&_bulletListItemImageConfiguration_onceToken_0, &__block_literal_global_5);
  return (id)_bulletListItemImageConfiguration_imageConfiguration_0;
}

+ (NSString)headerTitleForMovingCredentialsToGroup
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)descriptionForMovingCredentialsToGroup:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)headerImageNameForMovingCredentialsToGroup
{
  return (NSString *)CFSTR("person.2.badge.key.fill");
}

+ (UIImage)headerImageForMovingCredentialsToGroup
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "headerImageNameForMovingCredentialsToGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_headerImageForString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (NSString)headerTitleForRemovingDuplicateCredentialsInGroup
{
  return (NSString *)_WBSLocalizedString();
}

+ (id)descriptionForRemovingDuplicateCredentialsInGroup:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)headerImageNameForRemovingDuplicateCredentialsInGroup
{
  return (NSString *)CFSTR("doc.on.doc.fill");
}

+ (UIImage)headerImageForRemovingDuplicateCredentialsInGroup
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "headerImageNameForRemovingDuplicateCredentialsInGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_headerImageForString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

+ (id)headerSubtitleForRemovingDuplicateCredentialsInGroup:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_headerImageForString:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BEBD660];
  v4 = (void *)MEMORY[0x24BEBD4B8];
  v5 = a3;
  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 48.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationByApplyingConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "imageWithConfiguration:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
