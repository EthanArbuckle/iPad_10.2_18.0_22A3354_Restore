@implementation HKMedicalRecord(HealthUI)

- (id)displayName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(a1, "primaryConcept");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedPreferredName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "medicalRecordCodings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_firstObjectPassingTest:", &__block_literal_global_34);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      v4 = v7;
      goto LABEL_5;
    }
    objc_msgSend(a1, "medicalRecordCodings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_firstObjectPassingTest:", &__block_literal_global_184_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "length"))
    {
      objc_msgSend(a1, "fallbackDisplayString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v4 = v3;
LABEL_5:
  v8 = v4;
  v3 = v4;
LABEL_6:

  return v8;
}

- (const)localizedStatusDisplayString
{
  return &stru_1E9C4C428;
}

- (uint64_t)isDateLess
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "sortDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB53A8]);

  return v3;
}

- (id)displayItems
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "recordItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

- (id)recordItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "sortDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_utcDateAdjustedToCalendar:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sortDateTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v5, 10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_DATE_STRING_FORMAT_%1$@_%2$@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
  }
  v11 = v10;
  if ((objc_msgSend(a1, "isDateLess") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_NO_DATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v11;
  }
  objc_msgSend(a1, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v14, v13, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)statusItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_STATUS_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedStatusDisplayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
