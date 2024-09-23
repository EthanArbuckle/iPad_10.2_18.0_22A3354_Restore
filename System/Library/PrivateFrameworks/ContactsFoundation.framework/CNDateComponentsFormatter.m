@implementation CNDateComponentsFormatter

+ (id)os_log
{
  if (os_log_cn_once_token_1_14 != -1)
    dispatch_once(&os_log_cn_once_token_1_14, &__block_literal_global_73);
  return (id)os_log_cn_once_object_1_14;
}

void __35__CNDateComponentsFormatter_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.debug", "date-components-formatter");
  v1 = (void *)os_log_cn_once_object_1_14;
  os_log_cn_once_object_1_14 = (uint64_t)v0;

}

- (CNDateComponentsFormatter)init
{
  CNDateComponentsFormatter *v2;
  uint64_t v3;
  NSLocale *locale;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNDateComponentsFormatter;
  v2 = -[CNDateComponentsFormatter init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    -[CNDateComponentsFormatter regenerateFormatterFutures](v2, "regenerateFormatterFutures");
  }
  return v2;
}

- (id)placeholderSubstitutionStringWithDay:(unint64_t)a3 month:(unint64_t)a4 year:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v9, "setDay:", a3);
  objc_msgSend(v9, "setMonth:", a4);
  objc_msgSend(v9, "setYear:", a5);
  -[CNDateComponentsFormatter locale](self, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C99790]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateFromComponents:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_class();
  -[CNDateComponentsFormatter locale](self, "locale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shortDayMonthYearDateFormatterWithLocale:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v15, "stringFromDate:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)dmyFormatString
{
  NSString *dateFormatPlaceholderString;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;

  dateFormatPlaceholderString = self->_dateFormatPlaceholderString;
  if (!dateFormatPlaceholderString)
  {
    v4 = (void *)objc_opt_class();
    -[CNDateComponentsFormatter locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDayMonthYearDateFormatterWithLocale:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "dateStyle");
    objc_msgSend(v6, "setDateStyle:", 1);
    objc_msgSend(v6, "dateFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDateStyle:", v7);
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSString *)objc_msgSend(v9, "copy");
    v11 = self->_dateFormatPlaceholderString;
    self->_dateFormatPlaceholderString = v10;

    dateFormatPlaceholderString = self->_dateFormatPlaceholderString;
  }
  return dateFormatPlaceholderString;
}

- (id)dateFormatPlaceholderString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNDateComponentsFormatter dateFormatPlaceholderStringForLanguage:](self, "dateFormatPlaceholderStringForLanguage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dateFormatPlaceholderStringForLanguage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  int *v11;
  int v12;
  __CFString *v13;
  const UChar *AppendItemName;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  int v20;
  void *v22;
  __CFString *v23;
  UErrorCode pErrorCode;
  char dest[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CNDateComponentsFormatter shouldUseArabicGregorianPlaceholderStringForLanguage:](self, "shouldUseArabicGregorianPlaceholderStringForLanguage:", v4))
  {
    if (-[CNDateComponentsFormatter shouldUseArabicIslamicPlaceholderStringForLanguage:](self, "shouldUseArabicIslamicPlaceholderStringForLanguage:", v4))
    {
      -[CNDateComponentsFormatter arabicIslamicPlaceholderString](self, "arabicIslamicPlaceholderString");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    -[CNDateComponentsFormatter locale](self, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    pErrorCode = U_ZERO_ERROR;
    v9 = objc_retainAutorelease(v8);
    objc_msgSend(v9, "UTF8String");
    udatpg_open();
    v22 = v9;
    v10 = &stru_1E29BCC70;
    v11 = &dword_18F89108C;
    v12 = 1;
    v13 = &stru_1E29BCC70;
    v23 = &stru_1E29BCC70;
    while (1)
    {
      AppendItemName = (const UChar *)udatpg_getAppendItemName();
      u_strToUTF8(dest, 128, 0, AppendItemName, 0, &pErrorCode);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", dest);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v12 == 1)
      {
        v17 = v23;
        v18 = v13;
        v23 = v15;
      }
      else if (v12 == 9)
      {
        v17 = v10;
        v10 = v15;
        v18 = v13;
      }
      else
      {
        v17 = v13;
        v18 = v15;
        if (v12 != 3)
          goto LABEL_14;
      }
      v19 = v15;

      v13 = v18;
LABEL_14:

      v20 = *v11++;
      v12 = v20;
      if (v20 == 16)
      {
        udatpg_close();
        -[CNDateComponentsFormatter placeholderStringWithLocalizedDay:month:year:](self, "placeholderStringWithLocalizedDay:month:year:", v10, v13, v23);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
    }
  }
  -[CNDateComponentsFormatter arabicGregorianPlaceholderString](self, "arabicGregorianPlaceholderString");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v6 = (void *)v5;
LABEL_16:

  return v6;
}

- (id)placeholderStringWithLocalizedDay:(id)a3 month:(id)a4 year:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CNDateComponentsFormatter shouldUseChinesePlaceholderString](self, "shouldUseChinesePlaceholderString"))
  {
    -[CNDateComponentsFormatter chinesePlaceholderStringWithDay:month:year:](self, "chinesePlaceholderStringWithDay:month:year:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNDateComponentsFormatter placeholderSubstitutionStringWithDay:month:year:](self, "placeholderSubstitutionStringWithDay:month:year:", 4, 2, 13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("0?4"), v8, 1024, 0, objc_msgSend(v11, "length"));
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("0?2"), v9, 1024, 0, objc_msgSend(v11, "length"));
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", CFSTR("13"), v10, 1024, 0, objc_msgSend(v11, "length"));
  }

  return v11;
}

- (BOOL)shouldUseChinesePlaceholderString
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CNDateComponentsFormatter locale](self, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C99790]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("chinese"));

  return v5;
}

- (id)chinesePlaceholderStringWithDay:(id)a3 month:(id)a4 year:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), a5, a4, a3);
}

- (BOOL)shouldUseArabicGregorianPlaceholderStringForLanguage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CNDateComponentsFormatter locale](self, "locale");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "objectForKey:", *MEMORY[0x1E0C99790]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("gregorian"));

  LOBYTE(v5) = objc_msgSend(v4, "isEqualToString:", CFSTR("ar"));
  return v8 & v5;
}

- (BOOL)shouldUseArabicIslamicPlaceholderStringForLanguage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CNDateComponentsFormatter locale](self, "locale");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "objectForKey:", *MEMORY[0x1E0C99790]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("islamic"));

  LOBYTE(v5) = objc_msgSend(v4, "isEqualToString:", CFSTR("ar"));
  return v8 & v5;
}

- (id)arabicGregorianPlaceholderString
{
  return CFSTR("اليوم الشهر، السنة");
}

- (id)arabicIslamicPlaceholderString
{
  return CFSTR("اليوم الشهر الهجري، السنة هـ");
}

+ (id)dateFormatterWithYearFormat:(id)a3 hasLongFormat:(BOOL)a4 locale:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = CFSTR("dM");
  if (v6)
    v9 = CFSTR("dMMMM");
  v10 = v9;
  v11 = v10;
  if (v7)
  {
    -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v7);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", v11, 0, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v14, "setLocale:", v8);
  objc_msgSend(v14, "setDateFormat:", v13);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -1.25138736e10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDefaultDate:", v15);

  }
  return v14;
}

- (void)regenerateFormatterFutures
{
  void *v3;
  NSArray *v4;
  NSArray *lazyFormatterFutures;
  id v6;

  v3 = (void *)objc_opt_class();
  -[CNDateComponentsFormatter locale](self, "locale");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatterFuturesWithLocale:", v6);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  lazyFormatterFutures = self->_lazyFormatterFutures;
  self->_lazyFormatterFutures = v4;

}

- (void)setLocale:(id)a3
{
  NSLocale *v5;
  NSLocale *v6;

  v5 = (NSLocale *)a3;
  if (self->_locale != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_locale, a3);
    -[CNDateComponentsFormatter regenerateFormatterFutures](self, "regenerateFormatterFutures");
    v5 = v6;
  }

}

+ (BOOL)shouldUseChinaSpecificFormattersForLocale:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C99790]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C996A0]);

  return v5;
}

+ (BOOL)shouldUseIslamicSpecificFormattersForLocale:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C996F0];
  v11[0] = *MEMORY[0x1E0C996E8];
  v11[1] = v3;
  v4 = *MEMORY[0x1E0C996F8];
  v11[2] = *MEMORY[0x1E0C99700];
  v11[3] = v4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99790]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "calendarIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "containsObject:", v9);

  return (char)v5;
}

+ (id)formatterFuturesWithLocale:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "shouldUseChinaSpecificFormattersForLocale:", v4);
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke;
    v52[3] = &__block_descriptor_40_e9__16__0__8l;
    v52[4] = a1;
    +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v52);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    v51[0] = v7;
    v51[1] = 3221225472;
    v51[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_2;
    v51[3] = &__block_descriptor_40_e9__16__0__8l;
    v51[4] = a1;
    +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v51);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    v50[0] = v7;
    v50[1] = 3221225472;
    v50[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_3;
    v50[3] = &__block_descriptor_40_e9__16__0__8l;
    v50[4] = a1;
    +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v50);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v10);

    v49[0] = v7;
    v49[1] = 3221225472;
    v49[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_4;
    v49[3] = &__block_descriptor_40_e9__16__0__8l;
    v49[4] = a1;
    +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v49);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

    v48[0] = v7;
    v48[1] = 3221225472;
    v48[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_5;
    v48[3] = &__block_descriptor_40_e9__16__0__8l;
    v48[4] = a1;
    +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

    v47[0] = v7;
    v47[1] = 3221225472;
    v47[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_6;
    v47[3] = &__block_descriptor_40_e9__16__0__8l;
    v47[4] = a1;
    +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v47);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

  }
  v44[0] = v7;
  v44[1] = 3221225472;
  v44[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_7;
  v44[3] = &unk_1E29BC208;
  v46 = a1;
  v14 = v4;
  v45 = v14;
  +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v44);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);

  v41[0] = v7;
  v41[1] = 3221225472;
  v41[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_8;
  v41[3] = &unk_1E29BC208;
  v43 = a1;
  v16 = v14;
  v42 = v16;
  +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);

  v38[0] = v7;
  v38[1] = 3221225472;
  v38[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_9;
  v38[3] = &unk_1E29BC208;
  v40 = a1;
  v18 = v16;
  v39 = v18;
  +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v38);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v19);

  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_10;
  v35[3] = &unk_1E29BC208;
  v37 = a1;
  v20 = v18;
  v36 = v20;
  +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v35);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v21);

  if (objc_msgSend(a1, "shouldUseIslamicSpecificFormattersForLocale:", v20))
  {
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_11;
    v32[3] = &unk_1E29BC208;
    v34 = a1;
    v22 = v20;
    v33 = v22;
    +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", v32);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

    v26 = v7;
    v27 = 3221225472;
    v28 = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_12;
    v29 = &unk_1E29BC208;
    v31 = a1;
    v30 = v22;
    +[CNFuture lazyFutureWithBlock:](CNFuture, "lazyFutureWithBlock:", &v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24, v26, v27, v28, v29);

  }
  return v5;
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chineseRelatedGregorianYearMonthDayFormatter");
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chineseMonthDayFormatter");
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chineseMonthDayHanidayFormatter");
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chineseCyclicYearMonthDayFormatter");
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chineseRelatedGregorianYearMonthDayHanidayFormatter");
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "chineseLongStyleRelatedGregorianYearMonthDayFormatter");
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "shortDayMonthYearDateFormatterWithLocale:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "longDayMonthYearDateFormatterWithLocale:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "shortDayMonthYearlessDateFormatterWithLocale:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "longDayMonthYearlessDateFormatterWithLocale:", *(_QWORD *)(a1 + 32));
}

id __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_11(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "shortDayMonthYearDateFormatterWithLocale:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("G"), &stru_1E29BCC70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDateFormat:", v3);

  objc_msgSend(v1, "setLenient:", 1);
  return v1;
}

id __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_12(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "longDayMonthYearDateFormatterWithLocale:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("G"), &stru_1E29BCC70);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDateFormat:", v3);

  objc_msgSend(v1, "setLenient:", 1);
  return v1;
}

+ (id)longDayMonthYearDateFormatterWithLocale:(id)a3
{
  return (id)objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", CFSTR("y"), 1, a3);
}

+ (id)longDayMonthYearlessDateFormatterWithLocale:(id)a3
{
  return (id)objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", 0, 1, a3);
}

+ (id)shortDayMonthYearDateFormatterWithLocale:(id)a3
{
  return (id)objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", CFSTR("y"), 0, a3);
}

+ (id)shortDayMonthYearlessDateFormatterWithLocale:(id)a3
{
  return (id)objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", 0, 0, a3);
}

+ (id)chineseRelatedGregorianYearMonthDayFormatter
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("zh@calendar=chinese"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", CFSTR("r"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDateStyle:", 1);
  return v4;
}

+ (id)chineseMonthDayFormatter
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("zh@calendar=chinese"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)chineseMonthDayHanidayFormatter
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("zh@calendar=chinese;numbers=hanidays"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)chineseRelatedGregorianYearMonthDayHanidayFormatter
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("zh@calendar=chinese;numbers=hanidays"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", CFSTR("r"), 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDateStyle:", 2);
  return v4;
}

+ (id)chineseCyclicYearMonthDayFormatter
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("zh@calendar=chinese;numbers=hanidays"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatterWithYearFormat:hasLongFormat:locale:", CFSTR("U"), 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultDate:", v5);

  return v4;
}

+ (id)chineseLongStyleRelatedGregorianYearMonthDayFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("zh@calendar=chinese"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("r年M月d日"));
  return v2;
}

- (id)displayFormatterForComponents:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "year");
  objc_msgSend(v4, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C996A0]);

  v9 = (void *)objc_opt_class();
  v10 = v9;
  if (v8)
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "chineseMonthDayFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "chineseRelatedGregorianYearMonthDayHanidayFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDateStyle:", 3);
    }
  }
  else
  {
    -[CNDateComponentsFormatter locale](self, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v10, "longDayMonthYearlessDateFormatterWithLocale:", v12);
    else
      objc_msgSend(v10, "longDayMonthYearDateFormatterWithLocale:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)stringFromDateComponents:(id)a3
{
  if (!a3)
    return 0;
  -[CNDateComponentsFormatter stringForObjectValue:](self, "stringForObjectValue:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dateComponentsFromString:(id)a3
{
  _BOOL4 v3;
  void *v4;
  void *v6;

  if (!a3)
    return 0;
  v6 = 0;
  v3 = -[CNDateComponentsFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", &v6, a3, 0);
  v4 = v6;
  if (!v3)
    v4 = 0;
  return v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  __CFString *v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((objc_msgSend(v4, "_cn_isEmpty") & 1) != 0)
    {
      v5 = &stru_1E29BCC70;
    }
    else
    {
      v7 = v4;
      -[CNDateComponentsFormatter displayFormatterForComponents:](self, "displayFormatterForComponents:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "calendar");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "calendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "copy");

      if (!v9)
        v9 = v10;
      if (objc_msgSend(v11, "year") == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v11, "setYear:", 1604);
      objc_msgSend(v10, "timeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTimeZone:", v12);

      objc_msgSend(v9, "dateFromComponents:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringForObjectValue:", v13);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSArray *v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id *v40;
  NSArray *obj;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  const __CFString *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CNDateComponentsFormatter getObjectValue:forString:errorDescription:].cold.2((uint64_t)v8, v9);

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = self->_lazyFormatterFutures;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v42 = *(_QWORD *)v46;
      v40 = a3;
      while (2)
      {
        v13 = 0;
        v14 = obj;
        do
        {
          if (*(_QWORD *)v46 != v42)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v13), "result:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0;
          v16 = objc_msgSend(v15, "getObjectValue:forString:errorDescription:", &v44, v8, a5);
          v17 = v44;

          objc_msgSend((id)objc_opt_class(), "os_log");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "locale");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localeIdentifier");
            v21 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v21;
            objc_msgSend(v15, "dateFormat");
            v22 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v23 = CFSTR("failed");
            if (v16)
              v23 = CFSTR("succeeded");
            v50 = v21;
            v51 = 2112;
            v52 = v22;
            v24 = (void *)v22;
            v53 = 2112;
            v54 = v23;
            _os_log_debug_impl(&dword_18F80C000, v18, OS_LOG_TYPE_DEBUG, "Parse attempt with locale:%@ date format: %@ %@", buf, 0x20u);

            v14 = obj;
          }

          if ((v16 & 1) != 0)
          {
            v12 = v17;
LABEL_26:
            objc_msgSend(v15, "calendar");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "timeZone");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNDateComponentsFormatter normalizedComponentsFromDate:calendar:timeZone:](self, "normalizedComponentsFromDate:calendar:timeZone:", v12, v32, v33);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)objc_opt_class(), "os_log");
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              -[CNDateComponentsFormatter getObjectValue:forString:errorDescription:].cold.1(v15, (uint64_t)v30, v34);

            v31 = 1;
            a3 = v40;
            goto LABEL_29;
          }
          objc_msgSend(v15, "setLenient:", 1);
          v43 = 0;
          v19 = objc_msgSend(v15, "getObjectValue:forString:errorDescription:", &v43, v8, a5);
          v12 = v43;

          objc_msgSend((id)objc_opt_class(), "os_log");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v15, "locale");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "localeIdentifier");
            v25 = objc_claimAutoreleasedReturnValue();
            v37 = (void *)v25;
            objc_msgSend(v15, "dateFormat");
            v26 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v27 = CFSTR("failed");
            if (v19)
              v27 = CFSTR("succeeded");
            v50 = v25;
            v51 = 2112;
            v52 = v26;
            v28 = (void *)v26;
            v53 = 2112;
            v54 = v27;
            _os_log_debug_impl(&dword_18F80C000, v20, OS_LOG_TYPE_DEBUG, "Parse attempt with lenient option, locale:%@ date format: %@ %@", buf, 0x20u);

            v14 = obj;
          }

          if (v19)
            goto LABEL_26;

          ++v13;
        }
        while (v11 != v13);
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        v11 = v29;
        v30 = 0;
        v31 = 0;
        a3 = v40;
        if (v29)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
      v30 = 0;
      v31 = 0;
    }
LABEL_29:

    if (a3)
      *a3 = objc_retainAutorelease(v30);

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (unint64_t)componentsToExtract
{
  return 1048606;
}

- (id)normalizedComponentsFromDate:(id)a3 calendar:(id)a4 timeZone:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CNDateComponentsFormatter componentsToExtract](self, "componentsToExtract");
  objc_msgSend(v9, "componentsInTimeZone:fromDate:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNDateHelper dateComponentsFromDateComponents:preservingUnits:](CNDateHelper, "dateComponentsFromDateComponents:preservingUnits:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", -1.25138736e10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsInTimeZone:fromDate:", v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNDateHelper dateComponentsFromDateComponents:preservingUnits:](CNDateHelper, "dateComponentsFromDateComponents:preservingUnits:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v13, "year");
  if (v17 == objc_msgSend(v16, "year") && (v18 = objc_msgSend(v13, "era"), v18 == objc_msgSend(v16, "era")))
    v19 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v19 = objc_msgSend(v13, "year");
  objc_msgSend(v13, "setYear:", v19);

  return v13;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatPlaceholderString, 0);
  objc_storeStrong((id *)&self->_lazyFormatterFutures, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)getObjectValue:(void *)a1 forString:(uint64_t)a2 errorDescription:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  v13 = 2112;
  v14 = a2;
  _os_log_debug_impl(&dword_18F80C000, a3, OS_LOG_TYPE_DEBUG, "Locale: %@ Format %@ parsed successfully into date components %@", (uint8_t *)&v9, 0x20u);

}

- (void)getObjectValue:(uint64_t)a1 forString:(NSObject *)a2 errorDescription:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18F80C000, a2, OS_LOG_TYPE_DEBUG, "Attempting to parse string: %@", (uint8_t *)&v2, 0xCu);
}

@end
