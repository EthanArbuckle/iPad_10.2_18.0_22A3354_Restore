@implementation WDGenericDataProviderSecondaryValue

- (WDGenericDataProviderSecondaryValue)initWithAverage:(id)a3
{
  id v5;
  WDGenericDataProviderSecondaryValue *v6;
  WDGenericDataProviderSecondaryValue *v7;

  v5 = a3;
  v6 = -[WDGenericDataProviderSecondaryValue init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_average, a3);

  return v7;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v9;
  id v10;
  void *v11;
  NSNumber *average;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  HKLocalizedNoDataString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  average = self->_average;
  if (average)
  {
    HKFormattedStringFromValue(average, v9, v10, 0, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AVERAGE %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  HKAttributedString(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WDGenericDataProviderSecondaryValue date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKLastUpdatedText(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_average, 0);
}

@end
