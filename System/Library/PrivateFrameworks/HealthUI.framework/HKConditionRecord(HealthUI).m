@implementation HKConditionRecord(HealthUI)

- (id)displayItems
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "recordItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  objc_msgSend(a1, "verificationStatusItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v4);

  objc_msgSend(a1, "categoryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v5);

  objc_msgSend(a1, "abatementItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v6);

  objc_msgSend(a1, "asserterItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v7);

  v8 = (void *)objc_msgSend(v2, "copy");
  return v8;
}

- (id)verificationStatusItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_VERIFICATION_STATUS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "verificationStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedPreferredName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v3, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)categoryItem
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "categories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hk_map:", &__block_literal_global_220);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_CATEGORY_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)abatementItem
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "abatement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "abatement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "valueType");

  if (v4 == 3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_ABATEMENT_TITLE_ALLEVIATED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sortDateTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(a1, "abatement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v7, v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)asserterItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_ASSERTER_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "asserter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
