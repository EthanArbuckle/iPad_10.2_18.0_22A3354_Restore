@implementation _ASAccountManagerTipContent

+ (id)contentForTipType:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 3:
      objc_msgSend(a1, "_contentForGeneralTip");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "_contentForFamilyTip");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "_contentForiCloudKeychainTip");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)_initWithImageName:(id)a3 image:(id)a4 hasBorderedImage:(BOOL)a5 title:(id)a6 subtitle:(id)a7 buttonTitle:(id)a8 declineButtonTitle:(id)a9
{
  id v15;
  id v16;
  id v17;
  _ASAccountManagerTipContent *v18;
  _ASAccountManagerTipContent *v19;
  _ASAccountManagerTipContent *v20;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)_ASAccountManagerTipContent;
  v18 = -[_ASAccountManagerTipContent init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageName, a3);
    objc_storeStrong((id *)&v19->_image, a4);
    v19->_hasBorderedImage = a5;
    objc_storeStrong((id *)&v19->_title, a6);
    objc_storeStrong((id *)&v19->_subtitle, a7);
    objc_storeStrong((id *)&v19->_buttonTitle, a8);
    objc_storeStrong((id *)&v19->_declineButtonTitle, a9);
    v20 = v19;
  }

  return v19;
}

+ (id)_contentForiCloudKeychainTip
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59___ASAccountManagerTipContent__contentForiCloudKeychainTip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_contentForiCloudKeychainTip_onceToken != -1)
    dispatch_once(&_contentForiCloudKeychainTip_onceToken, block);
  return (id)_contentForiCloudKeychainTip_iCloudKeychainTipContent;
}

+ (id)_iCloudKeychainTipImageName
{
  return CFSTR("icloud.slash");
}

+ (id)_iCloudKeychainTipImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "_iCloudKeychainTipImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_iCloudKeychainTipHasBorderedImage
{
  return 0;
}

+ (id)_iCloudKeychainTipTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_iCloudKeychainTipSubtitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_iCloudKeychainTipButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_iCloudKeychainTipDeclineButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_contentForFamilyTip
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51___ASAccountManagerTipContent__contentForFamilyTip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_contentForFamilyTip_onceToken != -1)
    dispatch_once(&_contentForFamilyTip_onceToken, block);
  return (id)_contentForFamilyTip_familyTipContent;
}

+ (id)_contentForGeneralTip
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52___ASAccountManagerTipContent__contentForGeneralTip__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_contentForGeneralTip_onceToken != -1)
    dispatch_once(&_contentForGeneralTip_onceToken, block);
  return (id)_contentForGeneralTip_generalTipContent;
}

+ (BOOL)_familySharingTipHasBorderedImage
{
  return 0;
}

+ (id)_familySharingTipTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_familySharingTipSubtitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_familySharingTipButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_familySharingTipDeclineButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_imageNameForSharingTips
{
  return CFSTR("person.2.fill");
}

+ (id)_imageForSharingTips
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(a1, "_imageNameForSharingTips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_generalSharingTipHasBorderedImage
{
  return 0;
}

+ (id)_generalSharingTipTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_generalSharingTipSubtitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_generalSharingTipButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)_generalSharingTipDeclineButtonTitle
{
  return (id)_WBSLocalizedString();
}

- (NSString)imageName
{
  return self->_imageName;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)hasBorderedImage
{
  return self->_hasBorderedImage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)declineButtonTitle
{
  return self->_declineButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declineButtonTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
