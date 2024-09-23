@implementation HKGenericDataProviderCurrentValue

- (HKGenericDataProviderCurrentValue)initWithValue:(id)a3
{
  id v5;
  HKGenericDataProviderCurrentValue *v6;
  HKGenericDataProviderCurrentValue *v7;

  v5 = a3;
  v6 = -[HKGenericDataProviderCurrentValue init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "unitForDisplayType:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_valueFormatterForUnit:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:", self->_value, v14, v13, v12, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKGenericDataProviderCurrentValue date](self, "date");
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
  objc_storeStrong((id *)&self->_value, 0);
}

@end
