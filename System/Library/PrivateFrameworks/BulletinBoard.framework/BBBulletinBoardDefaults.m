@implementation BBBulletinBoardDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1)
    dispatch_once(&standardDefaults___once, &__block_literal_global_11);
  return (id)standardDefaults___instance;
}

void __43__BBBulletinBoardDefaults_standardDefaults__block_invoke()
{
  BBBulletinBoardDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(BBBulletinBoardDefaults);
  v1 = (void *)standardDefaults___instance;
  standardDefaults___instance = (uint64_t)v0;

}

- (BBBulletinBoardDefaults)init
{
  return (BBBulletinBoardDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.bulletinboard"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalContentPreviewSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("BBContentPreviewsSetting"), &unk_24C5835B0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalAnnounceSetting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("BBAnnounceSetting"), &unk_24C5835C8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalAnnounceHeadphonesSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("BBAnnounceHeadphonesSetting"), &unk_24C5835B0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalAnnounceCarPlaySetting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("BBAnnounceCarPlaySetting"), &unk_24C5835E0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "announceSupportedForHeadphones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDBD1C0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("BBAnnounceSupportedForHeadPhones"), MEMORY[0x24BDBD1C0], 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "announceSupportedForCarPlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("BBAnnounceSupportedForCarPlay"), v8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "pairedVehiclesForCarPlay");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("BBPairedVehiclesForCarPlay"), v8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalScheduledDeliverySetting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("BBScheduledDeliverySetting"), &unk_24C5835B0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalScheduledDeliveryTimes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("BBScheduledDeliveryTimes"), 0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalScheduledDeliveryShowNextSummarySetting");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("BBScheduledDeliveryShowNextSummary"), &unk_24C5835B0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalNotificationListDisplayStyleSetting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("BBNotificationListDisplayStyleSetting"), &unk_24C5835B0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalSummarizationSetting");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v15, CFSTR("BBSummarizationSetting"), &unk_24C5835B0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalHighlightsSetting");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v16, CFSTR("BBHighlightsSetting"), &unk_24C5835B0, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "globalSpokenNotificationSetting_deprecated");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v17, CFSTR("BBSpokenNotificationSetting"), &unk_24C5835B0, 1);

}

@end
