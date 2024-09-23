@implementation HRElectrocardiogramResultViewItem

+ (id)viewItemWithClassification:(unint64_t)a3 sampleAlgorithmVersion:(id)a4 forAlgorithmVersion:(int64_t)a5 learnMoreDelegate:(id)a6
{
  return +[HRElectrocardiogramResultViewItem viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRElectrocardiogramResultViewItem, "viewItemWithClassification:sampleAlgorithmVersion:forAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", a3, a4, a5, *MEMORY[0x24BDD4290], a6);
}

+ (id)viewItemWithClassification:(unint64_t)a3 sampleAlgorithmVersion:(id)a4 forAlgorithmVersion:(int64_t)a5 upgradingFromAlgorithmVersion:(int64_t)a6 learnMoreDelegate:(id)a7
{
  id v12;
  id v13;
  os_log_t *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v21;
  _BYTE v22[10];
  int64_t v23;
  _DWORD v24[4];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a7;
  _HKInitializeLogging();
  v14 = (os_log_t *)MEMORY[0x24BDD3010];
  v15 = (void *)*MEMORY[0x24BDD3010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v21 = 67175683;
    *(_DWORD *)v22 = a3;
    *(_WORD *)&v22[4] = 1026;
    *(_DWORD *)&v22[6] = objc_msgSend(v12, "intValue");
    LOWORD(v23) = 1026;
    *(_DWORD *)((char *)&v23 + 2) = a5;
    HIWORD(v23) = 1026;
    v24[0] = a6;
    LOWORD(v24[1]) = 2114;
    *(_QWORD *)((char *)&v24[1] + 2) = v13;
    _os_log_impl(&dword_215454000, v16, OS_LOG_TYPE_DEFAULT, "Generate result view item for classification: %{private}i sampleAlgVersion: %{public}i forAlgorithmVersion: %{public}i fromAlgorithmVersion: %{public}i delegate: %{public}@", (uint8_t *)&v21, 0x24u);

  }
  v17 = 0;
  switch(a3)
  {
    case 0uLL:
      goto LABEL_32;
    case 1uLL:
      if (a5 != 2)
        goto LABEL_13;
      objc_msgSend(a1, "_makeItemForPoorRecordingAlgorithmVersionTwoUpgradingFromAlgorithmVersion:withLearnMoreDelegate:", a6, v13);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 2uLL:
      if (a5 != 2)
      {
LABEL_13:
        if (a5 != 1)
          goto LABEL_25;
        goto LABEL_14;
      }
      if (v12 && objc_msgSend(v12, "integerValue") == 1)
      {
LABEL_14:
        objc_msgSend(a1, "_makeItemForInconclusiveAlgorithmVersionOneWithLearnMoreDelegate:", v13);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
      objc_msgSend(a1, "_makeItemForInconclusiveAlgorithmVersionTwoUpgradingFromAlgorithmVersion:withLearnMoreDelegate:", a6, v13);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_31:
      v17 = (void *)v18;
      goto LABEL_32;
    case 3uLL:
      if ((unint64_t)(a5 - 1) > 1)
        goto LABEL_25;
      objc_msgSend(a1, "_makeItemForSinusRhythmAlgorithmVersionOne");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 4uLL:
      if (a5 != 2 && a5 != 1)
        goto LABEL_25;
      objc_msgSend(a1, "_makeItemForAtrialFibrillationAlgorithmVersionOne");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 5uLL:
      if ((unint64_t)(a5 - 1) > 1)
        goto LABEL_25;
      goto LABEL_24;
    case 6uLL:
      if (a5 == 2)
      {
        if (!v12 || objc_msgSend(v12, "integerValue") != 1)
        {
LABEL_6:
          objc_msgSend(a1, "_makeItemForHighOrLowAbove150Below50AlgorithmVersionTwoUpgradingFromAlgorithmVersion:", a6);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        goto LABEL_24;
      }
      if (a5 == 1)
      {
LABEL_24:
        objc_msgSend(a1, "_makeItemForHighOrLowAbove120Below50AlgorithmVersionOne");
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      }
LABEL_25:
      _HKInitializeLogging();
      v19 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
      {
        v21 = 134218496;
        *(_QWORD *)v22 = a5;
        *(_WORD *)&v22[8] = 2048;
        v23 = a6;
        LOWORD(v24[0]) = 2048;
        *(_QWORD *)((char *)v24 + 2) = a3;
        _os_log_impl(&dword_215454000, v19, OS_LOG_TYPE_INFO, "Failed to create a result view item. For algorithm version: %li, updating from algoritm version: %li classification: %lu", (uint8_t *)&v21, 0x20u);
      }
LABEL_27:
      v17 = 0;
LABEL_32:

      return v17;
    case 7uLL:
    case 0xAuLL:
      if (a5 == 1)
        goto LABEL_27;
      if (a5 == 2)
        goto LABEL_6;
      goto LABEL_25;
    case 8uLL:
    case 9uLL:
      if (a5 == 1)
        goto LABEL_27;
      if (a5 != 2)
        goto LABEL_25;
      objc_msgSend(a1, "_makeItemForAtrialFibrillationAlgorithmVersionTwoUpgradingFromAlgorithmVersion:", a6);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    default:
      goto LABEL_25;
  }
}

- (HRElectrocardiogramResultViewItem)initWithBadge:(id)a3 title:(id)a4 numberedTitle:(id)a5 visibleBodyText:(id)a6 videoPath:(id)a7 expandedContentItems:(id)a8
{
  id v15;
  id v16;
  id v17;
  HRElectrocardiogramResultViewItem *v18;
  HRElectrocardiogramResultViewItem *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HRElectrocardiogramResultViewItem;
  v18 = -[HRElectrocardiogramResultViewItem init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_badge, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_numberedTitle, a5);
    objc_storeStrong((id *)&v19->_visibleBodyText, a6);
    objc_storeStrong((id *)&v19->_videoPath, a7);
    objc_storeStrong((id *)&v19->_expandedContentItems, a8);
  }

  return v19;
}

- (NSString)badge
{
  return self->_badge;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)numberedTitle
{
  return self->_numberedTitle;
}

- (NSString)visibleBodyText
{
  return self->_visibleBodyText;
}

- (NSString)videoPath
{
  return self->_videoPath;
}

- (NSArray)expandedContentItems
{
  return self->_expandedContentItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedContentItems, 0);
  objc_storeStrong((id *)&self->_videoPath, 0);
  objc_storeStrong((id *)&self->_visibleBodyText, 0);
  objc_storeStrong((id *)&self->_numberedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

+ (id)_makeItemForAtrialFibrillationAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HRElectrocardiogramResultViewItem *v8;

  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_NUMBERED_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_VISIBLE_BODY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "hrui_atrialFibrillationVideoPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRExpandedContentItem atrialFibrillationItemsForAlgorithmVersion:](HRExpandedContentItem, "atrialFibrillationItemsForAlgorithmVersion:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HRElectrocardiogramResultViewItem initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:]([HRElectrocardiogramResultViewItem alloc], "initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:", 0, v3, v4, v5, v6, v7);

  return v8;
}

+ (id)_makeItemForHighOrLowAbove150Below50AlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HRElectrocardiogramResultViewItem *v10;

  if (a3 == 1)
  {
    HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_UPDATED_BADGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_3_VISIBLE_BODY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "hrui_highOrLowHeartRateVideoPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRExpandedContentItem highOrLowAbove150Below50HeartRateItemsForAlgorithmVersion:upgradingFromAlgorithmVersion:](HRExpandedContentItem, "highOrLowAbove150Below50HeartRateItemsForAlgorithmVersion:upgradingFromAlgorithmVersion:", 2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HRElectrocardiogramResultViewItem initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:]([HRElectrocardiogramResultViewItem alloc], "initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:", v4, v5, v6, v7, v8, v9);

  return v10;
}

+ (id)_makeItemForInconclusiveAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3 withLearnMoreDelegate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HRElectrocardiogramResultViewItem *v12;

  v5 = a4;
  if (a3 == 1)
  {
    HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_UPDATED_BADGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_4_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_4_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_4_VISIBLE_BODY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "hrui_inconclusiveVideoPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRExpandedContentItem inconclusiveItemsForAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRExpandedContentItem, "inconclusiveItemsForAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", 2, a3, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HRElectrocardiogramResultViewItem initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:]([HRElectrocardiogramResultViewItem alloc], "initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:", v6, v7, v8, v9, v10, v11);

  return v12;
}

+ (id)_makeItemForPoorRecordingAlgorithmVersionTwoUpgradingFromAlgorithmVersion:(int64_t)a3 withLearnMoreDelegate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HRElectrocardiogramResultViewItem *v11;

  v5 = a4;
  if (a3 == 1)
  {
    HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_NEW_BADGE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_V2_ONBOARDING_3_SECTION_5_VISIBLE_BODY"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRExpandedContentItem poorRecordingItemsForAlgorithmVersion:learnMoreDelegate:](HRExpandedContentItem, "poorRecordingItemsForAlgorithmVersion:learnMoreDelegate:", 2, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HRElectrocardiogramResultViewItem initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:]([HRElectrocardiogramResultViewItem alloc], "initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:", v6, v7, v8, v9, 0, v10);

  return v11;
}

+ (id)_makeItemForSinusRhythmAlgorithmVersionOne
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HRElectrocardiogramResultViewItem *v7;

  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_1_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_1_NUMBERED_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_1_VISIBLE_BODY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "hrui_sinusRhythmVideoPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRExpandedContentItem sinusRhythmItemsForAlgorithmVersion:](HRExpandedContentItem, "sinusRhythmItemsForAlgorithmVersion:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HRElectrocardiogramResultViewItem initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:]([HRElectrocardiogramResultViewItem alloc], "initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:", 0, v2, v3, v4, v5, v6);

  return v7;
}

+ (id)_makeItemForAtrialFibrillationAlgorithmVersionOne
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HRElectrocardiogramResultViewItem *v7;

  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_NUMBERED_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_2_VISIBLE_BODY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "hrui_atrialFibrillationVideoPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRExpandedContentItem atrialFibrillationItemsForAlgorithmVersion:](HRExpandedContentItem, "atrialFibrillationItemsForAlgorithmVersion:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HRElectrocardiogramResultViewItem initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:]([HRElectrocardiogramResultViewItem alloc], "initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:", 0, v2, v3, v4, v5, v6);

  return v7;
}

+ (id)_makeItemForHighOrLowAbove120Below50AlgorithmVersionOne
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HRElectrocardiogramResultViewItem *v7;

  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_NUMBERED_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_3_VISIBLE_BODY"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "hrui_highOrLowHeartRateVideoPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRExpandedContentItem highOrLowAbove120Below50HeartRateItemsForAlgorithmVersion:](HRExpandedContentItem, "highOrLowAbove120Below50HeartRateItemsForAlgorithmVersion:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HRElectrocardiogramResultViewItem initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:]([HRElectrocardiogramResultViewItem alloc], "initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:", 0, v2, v3, v4, v5, v6);

  return v7;
}

+ (id)_makeItemForInconclusiveAlgorithmVersionOneWithLearnMoreDelegate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HRElectrocardiogramResultViewItem *v9;

  v3 = a3;
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_3_SECTION_4_VISIBLE_BODY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "hrui_inconclusiveVideoPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRExpandedContentItem inconclusiveItemsForAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:](HRExpandedContentItem, "inconclusiveItemsForAlgorithmVersion:upgradingFromAlgorithmVersion:learnMoreDelegate:", 1, 0, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HRElectrocardiogramResultViewItem initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:]([HRElectrocardiogramResultViewItem alloc], "initWithBadge:title:numberedTitle:visibleBodyText:videoPath:expandedContentItems:", 0, v4, v5, v6, v7, v8);
  return v9;
}

@end
