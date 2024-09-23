@implementation ASAccountManagerTipContent

void __59___ASAccountManagerTipContent__contentForiCloudKeychainTip__block_invoke(uint64_t a1)
{
  _ASAccountManagerTipContent *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = [_ASAccountManagerTipContent alloc];
  objc_msgSend(*(id *)(a1 + 32), "_iCloudKeychainTipImageName");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_iCloudKeychainTipImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_iCloudKeychainTipHasBorderedImage");
  objc_msgSend(*(id *)(a1 + 32), "_iCloudKeychainTipTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_iCloudKeychainTipSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_iCloudKeychainTipButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_iCloudKeychainTipDeclineButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_ASAccountManagerTipContent _initWithImageName:image:hasBorderedImage:title:subtitle:buttonTitle:declineButtonTitle:](v2, "_initWithImageName:image:hasBorderedImage:title:subtitle:buttonTitle:declineButtonTitle:", v11, v3, v4, v5, v6, v7, v8);
  v10 = (void *)_contentForiCloudKeychainTip_iCloudKeychainTipContent;
  _contentForiCloudKeychainTip_iCloudKeychainTipContent = v9;

}

void __51___ASAccountManagerTipContent__contentForFamilyTip__block_invoke(uint64_t a1)
{
  _ASAccountManagerTipContent *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = [_ASAccountManagerTipContent alloc];
  objc_msgSend(*(id *)(a1 + 32), "_imageNameForSharingTips");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_imageForSharingTips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_familySharingTipHasBorderedImage");
  objc_msgSend(*(id *)(a1 + 32), "_familySharingTipTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_familySharingTipSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_familySharingTipButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_familySharingTipDeclineButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_ASAccountManagerTipContent _initWithImageName:image:hasBorderedImage:title:subtitle:buttonTitle:declineButtonTitle:](v2, "_initWithImageName:image:hasBorderedImage:title:subtitle:buttonTitle:declineButtonTitle:", v11, v3, v4, v5, v6, v7, v8);
  v10 = (void *)_contentForFamilyTip_familyTipContent;
  _contentForFamilyTip_familyTipContent = v9;

}

void __52___ASAccountManagerTipContent__contentForGeneralTip__block_invoke(uint64_t a1)
{
  _ASAccountManagerTipContent *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = [_ASAccountManagerTipContent alloc];
  objc_msgSend(*(id *)(a1 + 32), "_imageNameForSharingTips");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_imageForSharingTips");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_generalSharingTipHasBorderedImage");
  objc_msgSend(*(id *)(a1 + 32), "_generalSharingTipTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_generalSharingTipSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_generalSharingTipButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_generalSharingTipDeclineButtonTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_ASAccountManagerTipContent _initWithImageName:image:hasBorderedImage:title:subtitle:buttonTitle:declineButtonTitle:](v2, "_initWithImageName:image:hasBorderedImage:title:subtitle:buttonTitle:declineButtonTitle:", v11, v3, v4, v5, v6, v7, v8);
  v10 = (void *)_contentForGeneralTip_generalTipContent;
  _contentForGeneralTip_generalTipContent = v9;

}

@end
