@implementation HKDisplayType(OutOfRangeAlertDisplayName)

- (id)wd_outOfRangeAlertDisplayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a1, "displayTypeIdentifier") == 99)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "localization");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayNameKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("OUT_OF_RANGE_ALERT_%@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    HABundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1E55A2388, CFSTR("AddDataLocalization"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
