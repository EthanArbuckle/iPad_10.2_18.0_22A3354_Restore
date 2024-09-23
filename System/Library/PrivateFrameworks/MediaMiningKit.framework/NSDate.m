@implementation NSDate

void __56__NSDate_CLSNSDateExtensions__dateComponentsFromString___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dateComponentsFromString__formatter1;
  dateComponentsFromString__formatter1 = (uint64_t)v0;

  v2 = (void *)dateComponentsFromString__formatter1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)dateComponentsFromString__formatter1, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss zzz"));
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v5 = (void *)dateComponentsFromString__formatter2;
  dateComponentsFromString__formatter2 = (uint64_t)v4;

  v6 = (void *)dateComponentsFromString__formatter2;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v7);

  objc_msgSend((id)dateComponentsFromString__formatter2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v9 = (void *)dateComponentsFromString__formatter3;
  dateComponentsFromString__formatter3 = (uint64_t)v8;

  v10 = (void *)dateComponentsFromString__formatter3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocale:", v11);

  objc_msgSend((id)dateComponentsFromString__formatter3, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v13 = (void *)dateComponentsFromString__formatter4;
  dateComponentsFromString__formatter4 = (uint64_t)v12;

  v14 = (void *)dateComponentsFromString__formatter4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocale:", v15);

  objc_msgSend((id)dateComponentsFromString__formatter4, "setDateFormat:", CFSTR("HH:mm:ss"));
  v16 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v17 = (void *)dateComponentsFromString__formatter5;
  dateComponentsFromString__formatter5 = (uint64_t)v16;

  v18 = (void *)dateComponentsFromString__formatter5;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLocale:", v19);

  objc_msgSend((id)dateComponentsFromString__formatter5, "setDateFormat:", CFSTR("HH:mm"));
  v20 = objc_alloc(MEMORY[0x1E0C99D48]);
  v21 = objc_msgSend(v20, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v22 = (void *)dateComponentsFromString__calendar;
  dateComponentsFromString__calendar = v21;

}

void __46__NSDate_CLSNSDateExtensions__dateFromString___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dateFromString__formatter1;
  dateFromString__formatter1 = (uint64_t)v0;

  v2 = (void *)dateFromString__formatter1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)dateFromString__formatter1, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss zzz"));
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v5 = (void *)dateFromString__formatter2;
  dateFromString__formatter2 = (uint64_t)v4;

  v6 = (void *)dateFromString__formatter2;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v7);

  objc_msgSend((id)dateFromString__formatter2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v9 = (void *)dateFromString__formatter3;
  dateFromString__formatter3 = (uint64_t)v8;

  v10 = (void *)dateFromString__formatter3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocale:", v11);

  objc_msgSend((id)dateFromString__formatter3, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v13 = (void *)dateFromString__formatter4;
  dateFromString__formatter4 = (uint64_t)v12;

  v14 = (void *)dateFromString__formatter4;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocale:", v15);

  objc_msgSend((id)dateFromString__formatter4, "setDateFormat:", CFSTR("HH:mm:ss"));
  v16 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v17 = (void *)dateFromString__formatter5;
  dateFromString__formatter5 = (uint64_t)v16;

  v18 = (void *)dateFromString__formatter5;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLocale:", v19);

  objc_msgSend((id)dateFromString__formatter5, "setDateFormat:", CFSTR("HH:mm"));
  v20 = objc_alloc(MEMORY[0x1E0C99D48]);
  v21 = objc_msgSend(v20, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v22 = (void *)dateFromString__calendar;
  dateFromString__calendar = v21;

}

@end
