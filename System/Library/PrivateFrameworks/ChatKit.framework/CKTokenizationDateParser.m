@implementation CKTokenizationDateParser

+ (id)serializationDateFormatter
{
  if (serializationDateFormatter_onceToken != -1)
    dispatch_once(&serializationDateFormatter_onceToken, &__block_literal_global_207);
  return (id)serializationDateFormatter_dateFormatter;
}

uint64_t __54__CKTokenizationDateParser_serializationDateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)serializationDateFormatter_dateFormatter;
  serializationDateFormatter_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)serializationDateFormatter_dateFormatter, "setDateStyle:", 3);
  return objc_msgSend((id)serializationDateFormatter_dateFormatter, "setTimeStyle:", 3);
}

+ (id)setYearToMostRecentOccurrenceForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 8204, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 28, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setYear:", objc_msgSend(v7, "year"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromComponents:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeIntervalSinceNow");
  if (v12 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 4, -1, v11, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v11;
  }

  return v13;
}

+ (id)setToMostRecentOccurrenceForWeekdayOfDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 8204, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 512, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setYear:", objc_msgSend(v7, "year"));
  objc_msgSend(v9, "setMonth:", objc_msgSend(v7, "month"));
  objc_msgSend(v9, "setWeekOfYear:", objc_msgSend(v7, "weekOfYear"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateFromComponents:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeIntervalSinceNow");
  if (v12 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateByAddingUnit:value:toDate:options:", 0x2000, -1, v11, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v11;
  }

  return v13;
}

+ (id)dateFormatterForFormat:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v6);

  objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", v4);
  return v5;
}

+ (id)dateFormattersForFormats:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[CKTokenizationDateParser dateFormatterForFormat:](CKTokenizationDateParser, "dateFormatterForFormat:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)parsers
{
  if (parsers_onceToken != -1)
    dispatch_once(&parsers_onceToken, &__block_literal_global_40_0);
  return (id)parsers_dateParsers;
}

void __35__CKTokenizationDateParser_parsers__block_invoke()
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  CKTokenizationDateParser *v16;
  uint64_t v17;
  id v18;
  CKTokenizationDateParser *v19;
  id v20;
  CKTokenizationDateParser *v21;
  CKTokenizationDateParser *v22;
  id v23;
  CKTokenizationDateParser *v24;
  CKTokenizationDateParser *v25;
  void *v26;
  void *v27;
  CKTokenizationDateParser *v28;
  CKTokenizationDateParser *v29;
  id v30;
  CKTokenizationDateParser *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  CKTokenizationDateParser *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  CKTokenizationDateParser *v43;
  void *v44;
  void *v45;
  void *v46;
  CKTokenizationDateParser *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[6];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v0, "setYear:", 1);
  v49 = v0;
  objc_msgSend(v0, "setSecond:", -1);
  v1 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v1, "setMonth:", 1);
  v46 = v1;
  objc_msgSend(v1, "setSecond:", -1);
  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setDay:", 1);
  v42 = v2;
  objc_msgSend(v2, "setSecond:", -1);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v4 = objc_msgSend(&unk_1E286FAA8, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v65;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v65 != v6)
          objc_enumerationMutation(&unk_1E286FAA8);
        v8 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x193FF4740]();
        v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLocale:", v11);

        objc_msgSend(v10, "setTimeStyle:", 0);
        objc_msgSend(v10, "setDateStyle:", objc_msgSend(v8, "unsignedIntegerValue"));
        objc_msgSend(v10, "dateFormat");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_1E286FAA8, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
    }
    while (v5);
  }
  v51 = v3;
  +[CKTokenizationDateParser dateFormattersForFormats:](CKTokenizationDateParser, "dateFormattersForFormats:", v3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setLocale:", v13);

  objc_msgSend(v39, "setDateStyle:", 3);
  objc_msgSend(v39, "setTimeStyle:", 0);
  v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocale:", v15);

  objc_msgSend(v14, "setDateStyle:", 4);
  v48 = v14;
  objc_msgSend(v14, "setTimeStyle:", 0);
  v16 = [CKTokenizationDateParser alloc];
  +[CKTokenizationDateParser dateFormattersForFormats:](CKTokenizationDateParser, "dateFormattersForFormats:", &unk_1E286FAC0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __35__CKTokenizationDateParser_parsers__block_invoke_49;
  v62[3] = &unk_1E27586A8;
  v18 = v42;
  v63 = v18;
  v43 = -[CKTokenizationDateParser initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:](v16, "initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:", v44, v14, 16, v62);
  v68[0] = v43;
  v19 = [CKTokenizationDateParser alloc];
  +[CKTokenizationDateParser dateFormattersForFormats:](CKTokenizationDateParser, "dateFormattersForFormats:", &unk_1E286FAD8);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTokenizationDateParser dateFormatterForFormat:](CKTokenizationDateParser, "dateFormatterForFormat:", CFSTR("MMMM y"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v17;
  v60[1] = 3221225472;
  v60[2] = __35__CKTokenizationDateParser_parsers__block_invoke_2;
  v60[3] = &unk_1E27586A8;
  v20 = v46;
  v61 = v20;
  v47 = -[CKTokenizationDateParser initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:](v19, "initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:", v41, v40, 16, v60);
  v68[1] = v47;
  v21 = [CKTokenizationDateParser alloc];
  +[CKTokenizationDateParser dateFormattersForFormats:](CKTokenizationDateParser, "dateFormattersForFormats:", &unk_1E286FAF0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTokenizationDateParser dateFormatterForFormat:](CKTokenizationDateParser, "dateFormatterForFormat:", CFSTR("y"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v17;
  v58[1] = 3221225472;
  v58[2] = __35__CKTokenizationDateParser_parsers__block_invoke_3;
  v58[3] = &unk_1E27586A8;
  v59 = v49;
  v50 = v49;
  v35 = -[CKTokenizationDateParser initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:](v21, "initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:", v38, v37, 16, v58);
  v68[2] = v35;
  v22 = [CKTokenizationDateParser alloc];
  +[CKTokenizationDateParser dateFormattersForFormats:](CKTokenizationDateParser, "dateFormattersForFormats:", &unk_1E286FB08);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v17;
  v56[1] = 3221225472;
  v56[2] = __35__CKTokenizationDateParser_parsers__block_invoke_4;
  v56[3] = &unk_1E27586A8;
  v23 = v18;
  v57 = v23;
  v24 = -[CKTokenizationDateParser initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:](v22, "initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:", v34, v39, 28, v56);
  v68[3] = v24;
  v25 = [CKTokenizationDateParser alloc];
  +[CKTokenizationDateParser dateFormattersForFormats:](CKTokenizationDateParser, "dateFormattersForFormats:", &unk_1E286FB20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTokenizationDateParser dateFormatterForFormat:](CKTokenizationDateParser, "dateFormatterForFormat:", CFSTR("MMMM y"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v17;
  v54[1] = 3221225472;
  v54[2] = __35__CKTokenizationDateParser_parsers__block_invoke_5;
  v54[3] = &unk_1E27586A8;
  v55 = v20;
  v36 = v20;
  v28 = -[CKTokenizationDateParser initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:](v25, "initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:", v26, v27, 16, v54);
  v68[4] = v28;
  v29 = [CKTokenizationDateParser alloc];
  v52[0] = v17;
  v52[1] = 3221225472;
  v52[2] = __35__CKTokenizationDateParser_parsers__block_invoke_6;
  v52[3] = &unk_1E27586A8;
  v53 = v23;
  v30 = v23;
  v31 = -[CKTokenizationDateParser initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:](v29, "initWithMatchingDateFormatters:displayDateFormatter:filterOptions:createDateRangeBlock:", v45, v39, 28, v52);
  v68[5] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 6);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)parsers_dateParsers;
  parsers_dateParsers = v32;

}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_49(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CKTokenizationDateRange *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a2;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTokenizationDateParser setToMostRecentOccurrenceForWeekdayOfDate:](CKTokenizationDateParser, "setToMostRecentOccurrenceForWeekdayOfDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", *(_QWORD *)(a1 + 32), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKTokenizationDateRange initWithStartDate:endDate:]([CKTokenizationDateRange alloc], "initWithStartDate:endDate:", v6, v7);

  return v8;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CKTokenizationDateRange *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a2;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTokenizationDateParser setYearToMostRecentOccurrenceForDate:](CKTokenizationDateParser, "setYearToMostRecentOccurrenceForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", *(_QWORD *)(a1 + 32), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKTokenizationDateRange initWithStartDate:endDate:]([CKTokenizationDateRange alloc], "initWithStartDate:endDate:", v6, v7);

  return v8;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  CKTokenizationDateRange *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "component:fromDate:", 4, v5);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "component:fromDate:", 4, v3);

  v9 = v6 - v8;
  if (v6 - v8 < 0)
    v9 = v8 - v6;
  if (v9 <= 0x3E8)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = v3;
    objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v12, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CKTokenizationDateRange initWithStartDate:endDate:]([CKTokenizationDateRange alloc], "initWithStartDate:endDate:", v13, v14);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CKTokenizationDateRange *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a2;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKTokenizationDateParser setYearToMostRecentOccurrenceForDate:](CKTokenizationDateParser, "setYearToMostRecentOccurrenceForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", *(_QWORD *)(a1 + 32), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKTokenizationDateRange initWithStartDate:endDate:]([CKTokenizationDateRange alloc], "initWithStartDate:endDate:", v6, v7);

  return v8;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  CKTokenizationDateRange *v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKTokenizationDateRange initWithStartDate:endDate:]([CKTokenizationDateRange alloc], "initWithStartDate:endDate:", v6, v7);

  return v8;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  CKTokenizationDateRange *v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKTokenizationDateRange initWithStartDate:endDate:]([CKTokenizationDateRange alloc], "initWithStartDate:endDate:", v6, v7);

  return v8;
}

+ (id)appropriateDateTokensForSearchText:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSearchTokensForDatesEnabled");

  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    +[CKTokenizationDateParser parsers](CKTokenizationDateParser, "parsers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      v10 = (void *)MEMORY[0x1E0C9AA60];
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dateTokenFiltersForSearchText:", v3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = v12;
            v10 = (void *)objc_msgSend(v12, "copy");

            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }
LABEL_14:

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (CKTokenizationDateParser)initWithMatchingDateFormatters:(id)a3 displayDateFormatter:(id)a4 filterOptions:(unint64_t)a5 createDateRangeBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  CKTokenizationDateParser *v14;
  CKTokenizationDateParser *v15;
  void *v16;
  id createDateRangeBlock;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKTokenizationDateParser;
  v14 = -[CKTokenizationDateParser init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_matchingDateFormatters, a3);
    objc_storeStrong((id *)&v15->_displayDateFormatter, a4);
    v15->_filterOptions = a5;
    v16 = _Block_copy(v13);
    createDateRangeBlock = v15->_createDateRangeBlock;
    v15->_createDateRangeBlock = v16;

  }
  return v15;
}

- (id)dateTokenFiltersForSearchText:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSDateFormatter *displayDateFormatter;
  void *v22;
  void *v23;
  id v24;
  unint64_t filterOptions;
  CKSearchTokenFilter *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  CKSearchTokenFilter *v35;
  CKSearchTokenFilter *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __CFString *v44;
  void *v45;
  CKSearchTokenFilter *v46;
  CKSearchTokenFilter *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v5 = self->_matchingDateFormatters;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v9), "dateFromString:", v4);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = (void *)v10;

    (*((void (**)(void))self->_createDateRangeBlock + 2))();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "component:fromDate:", 4, v15);

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "component:fromDate:", 4, v18);

    if (v19 > v16)
    {
LABEL_12:
      v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v13, "serializeToStringArray");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    displayDateFormatter = self->_displayDateFormatter;
    objc_msgSend(v13, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](displayDateFormatter, "stringFromDate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    filterOptions = self->_filterOptions;
    if ((filterOptions & 0x10) != 0)
    {
      v37 = -[CKSearchTokenFilter initWithContentType:filterOptions:itemIdentifier:tokenAddresses:]([CKSearchTokenFilter alloc], "initWithContentType:filterOptions:itemIdentifier:tokenAddresses:", 8, 16, v23, v20);
      objc_msgSend(v24, "addObject:", v37);

      filterOptions = self->_filterOptions;
      if ((filterOptions & 4) == 0)
      {
LABEL_15:
        if ((filterOptions & 8) == 0)
        {
LABEL_20:
          v11 = (void *)objc_msgSend(v24, "copy");

          goto LABEL_21;
        }
LABEL_16:
        v26 = [CKSearchTokenFilter alloc];
        v27 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SEARCH_BEFORE_DATE_TOKEN"), &stru_1E276D870, CFSTR("ChatKit"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", v29, v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "userInterfaceLayoutDirection");

        if (v32 == 1)
          v33 = CFSTR("\u200F");
        else
          v33 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v33, "stringByAppendingString:", v30);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = -[CKSearchTokenFilter initWithContentType:filterOptions:itemIdentifier:tokenAddresses:](v26, "initWithContentType:filterOptions:itemIdentifier:tokenAddresses:", 8, 8, v34, v20);
        objc_msgSend(v24, "addObject:", v35);

        goto LABEL_20;
      }
    }
    else if ((filterOptions & 4) == 0)
    {
      goto LABEL_15;
    }
    v47 = [CKSearchTokenFilter alloc];
    v38 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("SEARCH_AFTER_DATE_TOKEN"), &stru_1E276D870, CFSTR("ChatKit"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", v40, v23);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "userInterfaceLayoutDirection");

    if (v43 == 1)
      v44 = CFSTR("\u200F");
    else
      v44 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v44, "stringByAppendingString:", v41);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = -[CKSearchTokenFilter initWithContentType:filterOptions:itemIdentifier:tokenAddresses:](v47, "initWithContentType:filterOptions:itemIdentifier:tokenAddresses:", 8, 4, v45, v20);
    objc_msgSend(v24, "addObject:", v46);

    if ((self->_filterOptions & 8) == 0)
      goto LABEL_20;
    goto LABEL_16;
  }
LABEL_9:
  v11 = 0;
  v12 = v5;
LABEL_22:

  return v11;
}

- (NSArray)matchingDateFormatters
{
  return self->_matchingDateFormatters;
}

- (NSDateFormatter)displayDateFormatter
{
  return self->_displayDateFormatter;
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (id)createDateRangeBlock
{
  return self->_createDateRangeBlock;
}

- (void)setCreateDateRangeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createDateRangeBlock, 0);
  objc_storeStrong((id *)&self->_displayDateFormatter, 0);
  objc_storeStrong((id *)&self->_matchingDateFormatters, 0);
}

@end
