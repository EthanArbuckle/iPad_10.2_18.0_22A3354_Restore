@implementation IPDateFormat

- (IPDateFormat)initWithOption:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  IPDateFormat *v9;
  IPDateFormat *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPDateFormat;
  v9 = -[IPDateFormat init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_option, a3);
    objc_storeStrong((id *)&v10->_title, a4);
  }

  return v10;
}

+ (double)sampleTime
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D48]);
    v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(v4, "setTimeZone:", v2);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", -1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setHour:", 0);
    objc_msgSend(v6, "setMinute:", 34);
    objc_msgSend(v6, "setSecond:", 0);
    objc_msgSend(v6, "setMonth:", 8);
    objc_msgSend(v6, "setDay:", 19);
    objc_msgSend(v4, "dateFromComponents:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;

  }
  else
  {
    v9 = 978307200.0;
  }

  return v9;
}

+ (id)dateFormatterFromLocale
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v6);

  objc_msgSend(v2, "setDateStyle:", 1);
  return v2;
}

+ (id)dateFormatterFromLanguage
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(a1, "localeFromDeviceLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocale:", v4);

  objc_msgSend(v3, "setDateStyle:", 1);
  return v3;
}

+ (id)dateFormatFromFormatter:(id)a3 style:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(v5, "setDateStyle:", a4);
  objc_msgSend(v5, "dateFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)availableDateFormats
{
  void *v3;
  void *v4;
  void *v5;
  IPDateFormat *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  IPDateFormat *v15;
  void *v16;
  void *v17;
  void *v18;
  IPDateFormat *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  id v26;
  IPDateFormat *v27;
  void *v28;
  void *v29;
  void *v30;
  IPDateFormat *v31;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dateFormatterFromLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatterFromLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [IPDateFormat alloc];
  v7 = (void *)MEMORY[0x1E0C99D68];
  v36 = a1;
  objc_msgSend(a1, "sampleTime");
  objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = -[IPDateFormat initWithOption:title:](v6, "initWithOption:title:", CFSTR("locale"), v9);

  v37 = v5;
  v33 = (void *)v10;
  objc_msgSend(v5, "addObject:", v10);
  v11 = (void *)MEMORY[0x1E0C99E20];
  v34 = v3;
  objc_msgSend(v3, "dateFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v4;
  objc_msgSend(v4, "dateFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v13, "containsObject:", v14);

  if ((v9 & 1) == 0)
  {
    v15 = [IPDateFormat alloc];
    v16 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v36, "sampleTime");
    objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[IPDateFormat initWithOption:title:](v15, "initWithOption:title:", CFSTR("language"), v18);

    objc_msgSend(v5, "addObject:", v19);
    objc_msgSend(v4, "dateFormat");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v20);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = objc_msgSend(&unk_1E706DCC8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(&unk_1E706DCC8);
        v25 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        if ((objc_msgSend(v13, "containsObject:", v25) & 1) == 0)
        {
          v26 = objc_alloc_init(MEMORY[0x1E0CB3578]);
          objc_msgSend(v26, "setDateFormat:", v25);
          v27 = [IPDateFormat alloc];
          v28 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v36, "sampleTime");
          objc_msgSend(v28, "dateWithTimeIntervalSince1970:");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringFromDate:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[IPDateFormat initWithOption:title:](v27, "initWithOption:title:", v25, v30);

          objc_msgSend(v37, "addObject:", v31);
          objc_msgSend(v13, "addObject:", v25);

        }
      }
      v22 = objc_msgSend(&unk_1E706DCC8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v22);
  }

  return v37;
}

+ (id)currentDateFormat
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString **v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateStyle:", 1);
  objc_msgSend(v3, "dateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFormatterFromLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if (v7)
  {
    v8 = IPFormatOptionLocale;
  }
  else
  {
    objc_msgSend(v3, "dateFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dateFormatterFromLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFormat");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if (!v12)
    {
      objc_msgSend(v3, "dateFormat");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v8 = IPFormatOptionLanguage;
  }
  v13 = *v8;
LABEL_7:
  v14 = v13;

  return v14;
}

+ (void)setDateFormat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  void *v25;
  id v26;
  _QWORD v27[4];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("language")))
  {
    objc_msgSend(a1, "dateFormatterFromLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v21;
    objc_msgSend(a1, "dateFormatFromFormatter:style:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v8;
    objc_msgSend(a1, "dateFormatFromFormatter:style:", v6, 2);
    v22 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v10;
    objc_msgSend(a1, "dateFormatFromFormatter:style:", v6, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v12;
    objc_msgSend(a1, "dateFormatFromFormatter:style:", v6, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v22;
  }
  else
  {
    if (!objc_msgSend(&unk_1E706DCE0, "containsObject:", v4))
    {
      objc_msgSend(v5, "removeObjectForKey:inDomain:", CFSTR("AppleICUDateFormatStrings"), *MEMORY[0x1E0CB2B58]);
      goto LABEL_8;
    }
    objc_msgSend(a1, "dateFormatterFromLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    v26 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dateFormatFromFormatter:style:", v6, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(a1, "dateFormatIsAllNumeric:", v16);

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v18;
      v24[0] = v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%zd"), 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v19;
      v24[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v20;
    }
  }
  objc_msgSend(v5, "setObject:forKey:inDomain:", v14, CFSTR("AppleICUDateFormatStrings"), *MEMORY[0x1E0CB2B58]);

LABEL_8:
}

+ (BOOL)dateFormatIsAllNumeric:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  int v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v4 = objc_msgSend(v3, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__IPDateFormat_dateFormatIsAllNumeric___block_invoke;
  v8[3] = &unk_1E7068EC8;
  v8[4] = &v13;
  v8[5] = &v21;
  v8[6] = &v9;
  v8[7] = &v17;
  objc_msgSend(v3, "_enumerateLongCharactersInRange:usingBlock:", 0, v4, v8);
  if (*((_BYTE *)v10 + 24))
  {
    v5 = 0;
  }
  else
  {
    v6 = *((unsigned __int8 *)v14 + 24);
    if (v22[3] > 0)
      ++v6;
    v5 = v6 + *((unsigned __int8 *)v18 + 24) > 1;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v5;
}

uint64_t __39__IPDateFormat_dateFormatIsAllNumeric___block_invoke(uint64_t result, UChar32 c, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v8;

  v5 = result;
  v6 = (c - 76);
  if (v6 <= 0x2D)
  {
    if (((1 << (c - 76)) & 0x224000002000) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
      return result;
    }
    if (((1 << (c - 76)) & 3) != 0)
    {
      if ((uint64_t)++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) < 3)
        return result;
      goto LABEL_10;
    }
    if (v6 == 24)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 56) + 8) + 24) = 1;
      return result;
    }
  }
  result = u_isalpha(c);
  if ((_DWORD)result)
  {
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24) = 1;
    *a3 = 1;
    return result;
  }
  result = u_isspace(c);
  if ((_DWORD)result)
  {
    if (c == 39)
      goto LABEL_10;
  }
  else
  {
    result = u_ispunct(c);
    v8 = c != 8207 && (_DWORD)result == 0;
    if (c == 39 || v8)
      goto LABEL_10;
  }
  return result;
}

- (NSString)option
{
  return self->_option;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_option, 0);
}

@end
