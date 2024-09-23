@implementation HKDiagnosticTestResult(HealthUI)

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

  objc_msgSend(a1, "valueItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v4);

  objc_msgSend(a1, "statusItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v5);

  v6 = (void *)objc_msgSend(v2, "copy");
  return v6;
}

- (id)valueItem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inspectableValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inspectableValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ontologyConcept");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedPreferredName");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_RECORDS_VALUE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKVerifiableClinicalRecordDisplayItem subtitleItemWithTitleText:detailText:style:](HKVerifiableClinicalRecordDisplayItem, "subtitleItemWithTitleText:detailText:style:", v11, v6, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
