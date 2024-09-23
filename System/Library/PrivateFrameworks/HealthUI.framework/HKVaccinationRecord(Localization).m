@implementation HKVaccinationRecord(Localization)

- (id)sortDateTitle
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "sortDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB60D0]);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("VACCINATION_RECORD_SORT_DATE_TITLE_ADMINISTRATION_DATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Clinical-Health-Records"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
