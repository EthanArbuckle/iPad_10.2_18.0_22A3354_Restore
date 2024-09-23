@implementation NTKUpNextStocksSampleDataSource

+ (id)bundleIdentifier
{
  return CFSTR("com.apple.stocks.watchapp");
}

- (id)supportedSections
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D843D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(id, void *);
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v24 = (void (**)(id, void *))a4;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setNumberStyle:", 3);
  objc_msgSend(v4, "setMaximumFractionDigits:", 2);
  objc_msgSend(v4, "setMaximumIntegerDigits:", 1);
  objc_msgSend(v4, "setPercentSymbol:", &stru_1E6BDC918);
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "plusSign");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", &unk_1E6CA45D8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", CFSTR("%@%@"), v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setNumberStyle:", 2);
  objc_msgSend(v4, "setMaximumIntegerDigits:", 4);
  objc_msgSend(v4, "setCurrencySymbol:", &stru_1E6BDC918);
  objc_msgSend(v4, "stringFromNumber:", &unk_1E6CA45E8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(CFSTR("UP_NEXT_SAMPLE_STOCK_NAME"), CFSTR("▲ S&P 500"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NTKClockFaceLocalizedString(CFSTR("UP_NEXT_SAMPLE_STOCK_USE_RED_FOR_UP"), CFSTR("See note in strings file for this key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("1"));

  if ((v12 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  REUISampleRelevanceProviderForSamplePosition();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NTKUpNextStocksContent(v15, v16, v17, v13);
  v23 = (void *)v8;
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x1E0D842E8]);
  v26[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithIdentifier:content:action:relevanceProviders:", CFSTR("com.apple.stocks.downtime"), v18, 0, v20);

  v25 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2](v24, v22);

}

@end
