@implementation WDCategorySampleUndeterminedDurationListDataProvider

- (id)secondaryTextForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "hasUndeterminedDuration"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ONGOING_DATE"), &stru_24D38E7C8, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WDCategorySampleUndeterminedDurationListDataProvider;
    -[WDSampleListDataProvider secondaryTextForObject:](&v8, sel_secondaryTextForObject_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
