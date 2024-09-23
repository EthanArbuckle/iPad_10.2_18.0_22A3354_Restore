@implementation HKVaccinationRecord(HealthUI)

- (id)localizedStatusDisplayString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "status");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedPreferredName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)displayItems
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "recordItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  objc_msgSend(a1, "performerItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v4);

  objc_msgSend(a1, "lotNumberItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v5);

  v6 = (void *)objc_msgSend(v2, "copy");
  return v6;
}

- (id)performerItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_PERFORMER_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)lotNumberItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_LOT_NUMBER_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lotNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
