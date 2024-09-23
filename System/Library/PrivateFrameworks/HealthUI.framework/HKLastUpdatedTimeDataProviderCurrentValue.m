@implementation HKLastUpdatedTimeDataProviderCurrentValue

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[HKLastUpdatedTimeDataProviderCurrentValue date](self, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v9, 27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  v15 = *MEMORY[0x1E0DC1138];
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v12);
  return v13;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKLastUpdatedTimeDataProviderCurrentValue date](self, "date");
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
}

@end
