@implementation HKLastUpdatedDayDataProviderCurrentValue

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  -[HKLastUpdatedDayDataProviderCurrentValue date](self, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isDateInToday:", v13))
  {

LABEL_4:
    -[HKLastUpdatedDayDataProviderCurrentValue date](self, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForDateAndTemplate(v16, 36);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    v48 = *MEMORY[0x1E0DC1138];
    v49[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v17, v19);
    goto LABEL_9;
  }
  -[HKLastUpdatedDayDataProviderCurrentValue date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isDateInYesterday:", v14);

  if (v15)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLastUpdatedDayDataProviderCurrentValue date](self, "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "components:fromDate:toDate:options:", 16, v22, v23, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v17, "day");
  if (v24 > 0x28)
  {
    -[HKLastUpdatedDayDataProviderCurrentValue date](self, "date");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForDateAndTemplate(v39, 12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = objc_alloc(MEMORY[0x1E0CB3498]);
    v42 = *MEMORY[0x1E0DC1138];
    v43 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v40, "initWithString:attributes:", v19, v31);
  }
  else
  {
    v25 = v24;
    HKIntegerFormatter();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringFromNumber:", v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("%d DAYS_AGO"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v30, v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_alloc(MEMORY[0x1E0CB3778]);
    v46 = *MEMORY[0x1E0DC1138];
    v33 = v46;
    v47 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v32, "initWithString:attributes:", v31, v34);

    v44 = v33;
    v45 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "string");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "rangeOfString:", v19);
    objc_msgSend(v20, "setAttributes:range:", v35, v37, v38);

  }
LABEL_9:

  return v20;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKLastUpdatedDayDataProviderCurrentValue date](self, "date");
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
