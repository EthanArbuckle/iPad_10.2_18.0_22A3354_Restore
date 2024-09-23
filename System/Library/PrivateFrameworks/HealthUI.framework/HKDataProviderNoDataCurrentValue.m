@implementation HKDataProviderNoDataCurrentValue

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  void *v7;
  void *v8;

  HKLocalizedNoDataString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKAttributedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)date
{
  return 0;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKDataProviderNoDataCurrentValue date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKLastUpdatedText(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
