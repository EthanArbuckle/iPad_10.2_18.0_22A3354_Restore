@implementation AXLocalizedStringFromQuickActionCategory

void __AXLocalizedStringFromQuickActionCategory_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x24BDAC8D0];
  v8[0] = *MEMORY[0x24BDBAE10];
  accessibilityLocalizedString(CFSTR("quickaction.action.audio-call"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v0;
  v8[1] = *MEMORY[0x24BDBAE30];
  accessibilityLocalizedString(CFSTR("quickaction.action.facetime"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  v8[2] = *MEMORY[0x24BDBAE28];
  accessibilityLocalizedString(CFSTR("quickaction.action.email"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  v8[3] = *MEMORY[0x24BDBAE18];
  accessibilityLocalizedString(CFSTR("quickaction.action.info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  v8[4] = *MEMORY[0x24BDBAE08];
  accessibilityLocalizedString(CFSTR("quickaction.action.add-to-contact"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  v8[5] = *MEMORY[0x24BDBAE20];
  accessibilityLocalizedString(CFSTR("quickaction.action.instant-message"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)AXLocalizedStringFromQuickActionCategory_AXQuickActionCategoryTable;
  AXLocalizedStringFromQuickActionCategory_AXQuickActionCategoryTable = v6;

}

@end
