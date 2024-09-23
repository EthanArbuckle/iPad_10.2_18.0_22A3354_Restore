@implementation History

+ (void)localeChanged:(__CFLocale *)a3
{
  id v4;
  __CFDateFormatter *v5;
  uint64_t v6;
  __CFString *v7;

  if (weekdayMonthDateFormatter)
    CFRelease((CFTypeRef)weekdayMonthDateFormatter);
  v4 = (id)*MEMORY[0x1E0CFA930];
  v5 = CFDateFormatterCreate(0, a3, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (!v5)
    v5 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CPDateFormatStringForFormatType();
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (__CFString *)v6;
  else
    v7 = CFSTR("EEEE, MMMM d");
  CFDateFormatterSetFormat(v5, v7);

  weekdayMonthDateFormatter = (uint64_t)v5;
}

- (Class)_historyItemClass
{
  return (Class)objc_opt_class();
}

- (_WKVisitedLinkStore)visitedLinkStore
{
  _WKVisitedLinkStore *visitedLinkStore;
  _WKVisitedLinkStore *v4;
  _WKVisitedLinkStore *v5;
  NSObject *v6;
  _QWORD block[5];

  visitedLinkStore = self->_visitedLinkStore;
  if (!visitedLinkStore)
  {
    v4 = (_WKVisitedLinkStore *)objc_alloc_init(MEMORY[0x1E0CEF708]);
    v5 = self->_visitedLinkStore;
    self->_visitedLinkStore = v4;

    dispatch_get_global_queue(17, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__History_visitedLinkStore__block_invoke;
    block[3] = &unk_1E9CF31B0;
    block[4] = self;
    dispatch_async(v6, block);

    visitedLinkStore = self->_visitedLinkStore;
  }
  return visitedLinkStore;
}

void __21__History_initialize__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dateFormatter;
  dateFormatter = (uint64_t)v0;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend((id)dateFormatter, "setLocale:");
  v2 = (void *)dateFormatter;
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v2, "setCalendar:", v4);

  objc_msgSend((id)dateFormatter, "setDateFormat:", CFSTR("MMddyyyy"));
  v5 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v6);

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v7);

  objc_storeStrong((id *)&TokenizationCharacterSet, v5);
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)calendar;
  calendar = v8;

}

void __24__History_sharedHistory__block_invoke()
{
  History *v0;
  void *v1;

  v0 = -[WBUHistory initWithDatabaseID:]([History alloc], "initWithDatabaseID:", 0);
  v1 = (void *)+[History sharedHistory]::sharedHistory;
  +[History sharedHistory]::sharedHistory = (uint64_t)v0;

}

+ (void)initialize
{
  if (+[History initialize]::onceToken != -1)
    dispatch_once(&+[History initialize]::onceToken, &__block_literal_global_19);
}

uint64_t __27__History_visitedLinkStore__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__History_visitedLinkStore__block_invoke_3;
  v3[3] = &unk_1E9CF5398;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateItemsUsingBlock:", v3);
}

void __27__History_visitedLinkStore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  +[History sharedHistory](History, "sharedHistory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitUntilHistoryHasLoaded");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__History_visitedLinkStore__block_invoke_2;
  v5[3] = &unk_1E9CF3358;
  v3 = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v7 = v3;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

+ (id)sharedHistory
{
  if (+[History sharedHistory]::onceToken != -1)
    dispatch_once(&+[History sharedHistory]::onceToken, &__block_literal_global_69);
  return (id)+[History sharedHistory]::sharedHistory;
}

+ (id)dayWithPeriodOfDayStringForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 544, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hour");
  v8 = 1;
  if (v7 - 12 >= 6)
    v8 = 2;
  if (v7 >= 0xC)
    v9 = v8;
  else
    v9 = 0;
  if (objc_msgSend(v4, "_web_isToday"))
    objc_msgSend(a1, "_localizedStringForTodayWithPartOfDay:", v9);
  else
    objc_msgSend(a1, "_localizedStringForWeekday:partOfDay:", objc_msgSend(v6, "weekday"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (int64_t)partOfDayFromHourOfDay:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if ((unint64_t)(a3 - 12) >= 6)
    v3 = 2;
  if ((unint64_t)a3 >= 0xC)
    return v3;
  else
    return 0;
}

+ (_NSRange)hourRangeFromPartOfDay:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v3 = 5;
  v4 = 18;
  v5 = 5;
  v6 = 12;
  if (a3 != 1)
  {
    v6 = 0;
    v5 = 0;
  }
  if (a3 != 2)
  {
    v4 = v6;
    v3 = v5;
  }
  if (a3)
    v7 = v4;
  else
    v7 = 0;
  if (a3)
    v8 = v3;
  else
    v8 = 11;
  result.length = v8;
  result.location = v7;
  return result;
}

+ (id)_localizedStringForTodayWithPartOfDay:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return &stru_1E9CFDBB0;
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_localizedStringForWeekday:(int64_t)a3 partOfDay:(int64_t)a4
{
  unsigned __int8 v6;
  int64_t v7;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  void *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  void *v26;
  NSString *v27;
  void *v28;
  NSString *v29;
  void *v30;
  NSString *v31;
  void *v32;
  NSString *v33;
  void *v34;
  NSString *v35;
  void *v36;
  NSString *v37;
  void *v38;
  int64_t v39;
  int64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[23];

  v53[21] = *MEMORY[0x1E0C80C00];
  if ((v6 & 1) == 0
  {
    v39 = a3;
    v40 = a4;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Sunday Morning"), v9);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v52;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Sunday Afternoon"), v10);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v51;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Sunday Evening"), v11);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v50;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Monday Morning"), v12);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v49;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Monday Afternoon"), v13);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v53[4] = v48;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Monday Evening"), v14);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v53[5] = v47;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Tuesday Morning"), v15);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v53[6] = v46;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Tuesday Afternoon"), v16);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v53[7] = v45;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Tuesday Evening"), v17);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v53[8] = v44;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Wednesday Morning"), v18);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53[9] = v43;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Wednesday Afternoon"), v19);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v53[10] = v42;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Wednesday Evening"), v20);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v53[11] = v41;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Thursday Morning"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53[12] = v22;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Thursday Afternoon"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53[13] = v24;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Thursday Evening"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53[14] = v26;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Friday Morning"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v53[15] = v28;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Friday Afternoon"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v53[16] = v30;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Friday Evening"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53[17] = v32;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Saturday Morning"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v53[18] = v34;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Saturday Afternoon"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v53[19] = v36;
    WBSLocalizedStringWithValue((NSString *)CFSTR("Saturday Evening"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v53[20] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 21);
    +[History _localizedStringForWeekday:partOfDay:]::localizedWeekdayPartOfDayArray = objc_claimAutoreleasedReturnValue();

    a3 = v39;
    a4 = v40;
  }
  if ((unint64_t)a4 >= 3)
    v7 = -1;
  else
    v7 = a4;
  objc_msgSend((id)+[History _localizedStringForWeekday:partOfDay:]::localizedWeekdayPartOfDayArray, "objectAtIndexedSubscript:", 3 * a3 + v7 - 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sessionIdentifierFromDate:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "sessionStartDateFromDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sessionIdentifierFromSessionStartDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sessionStartDateFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend((id)dateFormatter, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 32, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = +[History hourRangeFromPartOfDay:](History, "hourRangeFromPartOfDay:", +[History partOfDayFromHourOfDay:](History, "partOfDayFromHourOfDay:", objc_msgSend(v5, "hour")));
  objc_msgSend((id)dateFormatter, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateBySettingHour:minute:second:ofDate:options:", v6, 0, 0, v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sessionIdentifierFromSessionStartDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend((id)dateFormatter, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 32, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = +[History partOfDayFromHourOfDay:](History, "partOfDayFromHourOfDay:", objc_msgSend(v5, "hour"));
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)dateFormatter, "stringFromDate:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%ld"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)lowercaseStringTrimmedForHistorySearch:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByTrimmingCharactersInSet:", TokenizationCharacterSet);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)historyItemTitle:(id)a3 matchesFilterString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  BOOL v14;
  id v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", TokenizationCharacterSet);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", TokenizationCharacterSet);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v16 = v6;
      v10 = *(_QWORD *)v19;
      v11 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v17[0] = v11;
          v17[1] = 3221225472;
          v17[2] = __48__History_historyItemTitle_matchesFilterString___block_invoke;
          v17[3] = &unk_1E9CF5300;
          v17[4] = v13;
          if (objc_msgSend(v7, "indexOfObjectPassingTest:", v17, v16) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v14 = 0;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
          continue;
        break;
      }
      v14 = 1;
LABEL_12:
      v6 = v16;
    }
    else
    {
      v14 = 1;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

BOOL __48__History_historyItemTitle_matchesFilterString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 9) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)historyItemURL:(id)a3 matchesFilter:(id)a4
{
  unint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0D8AD70], "matchLocationForString:inURLString:", a4, a3);
  return (v4 > 8) | (0x24u >> v4) & 1;
}

+ (BOOL)historyItemURL:(id)a3 matchesFilterStrings:(id)a4
{
  id v6;
  void *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  objc_msgSend(a4, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__History_historyItemURL_matchesFilterStrings___block_invoke;
  v11[3] = &unk_1E9CF5328;
  v13 = a1;
  v8 = v6;
  v12 = v8;
  v9 = objc_msgSend(v7, "safari_containsObjectPassingTest:", v11);

  return v9;
}

uint64_t __47__History_historyItemURL_matchesFilterStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v6 = a1 + 32;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v6 + 8);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AD78]), "initWithString:", v3);
  v8 = objc_msgSend(v4, "historyItemURL:matchesFilter:", v5, v7);

  return v8;
}

+ (BOOL)filterString:(id)a3 matchesHistoryItemAnywhereInTitleOrURL:(id)a4
{
  uint64_t v5;
  char v6;
  char v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  char v17;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a3, "components");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = 0;
    v7 = 0;
    v20 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AD78]), "initWithString:", v9);
        v11 = (void *)objc_opt_class();
        objc_msgSend(v21, "urlString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "historyItemURL:matchesFilter:", v12, v10);

        v14 = (void *)objc_opt_class();
        objc_msgSend(v21, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "historyItemTitle:matchesFilterString:", v15, v9);

        if (((v13 | v16) & 1) == 0)
        {

          goto LABEL_11;
        }

        v6 |= v13;
        v7 |= v16;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v5)
        continue;
      break;
    }
    v17 = v6 & v7;
  }
  else
  {
LABEL_11:
    v17 = 0;
  }

  return v17 & 1;
}

- (void)dealloc
{
  objc_super v3;

  -[History cancelDeferredUpdates](self, "cancelDeferredUpdates");
  v3.receiver = self;
  v3.super_class = (Class)History;
  -[History dealloc](&v3, sel_dealloc);
}

+ (id)titleForHistoryItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isFileURL"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayNameAtPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = v10;
        v5 = v11;
        goto LABEL_9;
      }
      v4 = 0;
    }
    objc_msgSend(v7, "safari_userVisibleString");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      _WBSLocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v5, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 4, 1, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = v11;
LABEL_11:

    goto LABEL_12;
  }
  v5 = v4;
  v6 = v5;
LABEL_12:

  return v6;
}

- (id)titleForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)calendar;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDay:", objc_msgSend(v7, "day") - 1);
  objc_msgSend((id)calendar, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:", v8) == -1)
    -[History _weekdayMonthDateStringForDate:](self, "_weekdayMonthDateStringForDate:", v4);
  else
    +[History dayWithPeriodOfDayStringForDate:](History, "dayWithPeriodOfDayStringForDate:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_weekdayMonthDateStringForDate:(id)a3
{
  return (id)(id)CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)weekdayMonthDateFormatter, (CFDateRef)a3);
}

- (void)commitDeferredUpdates
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_deferredUpdates;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  -[NSMutableArray removeAllObjects](self->_deferredUpdates, "removeAllObjects", (_QWORD)v7);
}

- (void)cancelDeferredUpdates
{
  -[NSMutableArray removeAllObjects](self->_deferredUpdates, "removeAllObjects");
}

- (void)removeItem:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistory _removeHistoryItemsInResponseToUserAction:](self, "_removeHistoryItemsInResponseToUserAction:", v5);

}

- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ShouldCheckHistoryStoreDatabaseIntegrity"));
  if ((v4 & 1) == 0)
    objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("ShouldCheckHistoryStoreDatabaseIntegrity"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0DC4768];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__History_historyStoreShouldCheckDatabaseIntegrity___block_invoke;
  v11[3] = &unk_1E9CF5370;
  v7 = v3;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v15[5];
  v15[5] = v8;

  _Block_object_dispose(&v14, 8);
  return v4;
}

void __52__History_historyStoreShouldCheckDatabaseIntegrity___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", CFSTR("ShouldCheckHistoryStoreDatabaseIntegrity"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

void __27__History_visitedLinkStore__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  objc_msgSend(a2, "url");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addVisitedLinkWithURL:");

}

- (void)_updateForWKWebView:(id)a3 browserController:(id)a4 updates:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  NSMutableArray *deferredUpdates;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "shouldDeferHistoryUpdatesForWKWebView:", v14))
  {
    deferredUpdates = self->_deferredUpdates;
    if (!deferredUpdates)
    {
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = self->_deferredUpdates;
      self->_deferredUpdates = v11;

      deferredUpdates = self->_deferredUpdates;
    }
    v13 = (void *)objc_msgSend(v9, "copy");
    -[NSMutableArray addObject:](deferredUpdates, "addObject:", v13);

  }
  else
  {
    v9[2](v9);
  }

}

- (void)_removeAllVisitedLinks
{
  -[_WKVisitedLinkStore removeAll](self->_visitedLinkStore, "removeAll");
}

- (void)_addVisitedLinkForItemIfNeeded:(id)a3 withVisitOrigin:(int64_t)a4
{
  id v6;
  _WKVisitedLinkStore *visitedLinkStore;
  void *v8;
  id v9;

  v6 = a3;
  if (a4)
  {
    visitedLinkStore = self->_visitedLinkStore;
    v9 = v6;
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_WKVisitedLinkStore addVisitedLinkWithURL:](visitedLinkStore, "addVisitedLinkWithURL:", v8);

    v6 = v9;
  }

}

- (void)_webView:(id)a3 didNavigateWithNavigationData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  History *v25;
  void *v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  char v35;
  char v36;
  _QWORD v37[5];
  History *v38;

  v6 = a3;
  v7 = a4;
  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "sessionStateRestorationSource") != 1)
  {
    objc_msgSend(v6, "_unreachableURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {

        v12 = 0;
        v10 = 0;
        goto LABEL_10;
      }
      v10 = objc_msgSend(v14, "statusCode");
      v17 = WBSStatusCodeGroupFromStatusCode();

      if (v17 < 4)
      {
        v12 = 0;
        goto LABEL_10;
      }
    }
    objc_msgSend(v9, "safari_originalDataAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    if (v11)
    {
      v28 = v10;
      v13 = 0;
LABEL_21:
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x3032000000;
      v37[3] = __Block_byref_object_copy__5;
      v37[4] = __Block_byref_object_dispose__5;
      v25 = self;
      v38 = v25;
      objc_msgSend(v8, "browserController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __50__History__webView_didNavigateWithNavigationData___block_invoke;
      v29[3] = &unk_1E9CF53C0;
      v30 = v6;
      v27 = v11;
      v31 = v27;
      v33 = v37;
      v35 = v13;
      v36 = v12;
      v32 = v7;
      v34 = v28;
      -[History _updateForWKWebView:browserController:updates:](v25, "_updateForWKWebView:browserController:updates:", v30, v26, v29);

      _Block_object_dispose(v37, 8);
      goto LABEL_22;
    }
LABEL_10:
    objc_msgSend(v7, "originalRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safari_originalDataAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v10;

    if ((v12 & 1) != 0)
    {
      v13 = 0;
      v12 = 1;
    }
    else
    {
      objc_msgSend(v7, "originalRequest");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "HTTPMethod");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "safari_isCaseInsensitiveEqualToString:", CFSTR("GET")) & 1) != 0)
      {
        v13 = 0;
      }
      else if ((objc_msgSend(v11, "safari_hasCaseInsensitivePrefix:", CFSTR("http:")) & 1) != 0)
      {
        v13 = 1;
      }
      else
      {
        v13 = objc_msgSend(v11, "safari_hasCaseInsensitivePrefix:", CFSTR("https:"));
      }

      if (objc_msgSend(v8, "currentPageLoadedFromReadingList")
        && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "customUserVisibleStringForReadingListBookmarkURL:", v22),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v22,
            v23))
      {
        v24 = v23;

        v12 = 0;
        v11 = v24;
      }
      else
      {
        v12 = 0;
      }
    }
    goto LABEL_21;
  }
LABEL_22:

}

void __50__History__webView_didNavigateWithNavigationData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", *(_QWORD *)(a1 + 32));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastVisit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safari_isSafariWebExtensionURL");

    if ((v6 & 1) == 0)
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemVisitedAtURLString:title:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:", v8, v9, *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), 1, *(_QWORD *)(a1 + 64));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLastVisit:", v10);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(v17, "sameDocumentNavigationToHistoryVisitCorrelator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastVisit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "noteVisit:", v14);

  }
  objc_msgSend(v17, "browserController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tabController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "saveTabDocumentUserActivitySoon:", v17);

}

- (void)_webView:(id)a3 didPerformClientRedirectFromURL:(id)a4 toURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  History *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[5];
  History *v19;

  v7 = a3;
  v8 = a5;
  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "sessionStateRestorationSource") != 1)
  {
    objc_msgSend(v8, "safari_originalDataAsString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__5;
    v18[4] = __Block_byref_object_dispose__5;
    v11 = self;
    v19 = v11;
    objc_msgSend(v9, "browserController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__History__webView_didPerformClientRedirectFromURL_toURL___block_invoke;
    v14[3] = &unk_1E9CF53E8;
    v15 = v9;
    v17 = v18;
    v13 = v10;
    v16 = v13;
    -[History _updateForWKWebView:browserController:updates:](v11, "_updateForWKWebView:browserController:updates:", v7, v12, v14);

    _Block_object_dispose(v18, 8);
  }

}

void __58__History__webView_didPerformClientRedirectFromURL_toURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v2, "lastVisit");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "lastVisit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemRedirectedFrom:to:origin:date:statusCode:", v8, v4, 0, 0, objc_msgSend(v6, "statusCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLastVisit:", v7);

}

- (void)_webView:(id)a3 didPerformServerRedirectFromURL:(id)a4 toURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  History *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  History *v17;

  v7 = a3;
  v8 = a5;
  +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "sessionStateRestorationSource") != 1)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__5;
    v16[4] = __Block_byref_object_dispose__5;
    v10 = self;
    v17 = v10;
    objc_msgSend(v9, "browserController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__History__webView_didPerformServerRedirectFromURL_toURL___block_invoke;
    v12[3] = &unk_1E9CF53E8;
    v13 = v9;
    v15 = v16;
    v14 = v8;
    -[History _updateForWKWebView:browserController:updates:](v10, "_updateForWKWebView:browserController:updates:", v7, v11, v12);

    _Block_object_dispose(v16, 8);
  }

}

void __58__History__webView_didPerformServerRedirectFromURL_toURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v2, "lastVisit");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "safari_originalDataAsString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastVisit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemRedirectedFrom:to:origin:date:statusCode:", v8, v4, 0, 0, objc_msgSend(v6, "statusCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLastVisit:", v7);

}

- (void)_webView:(id)a3 didUpdateHistoryTitle:(id)a4 forURL:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  History *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "websiteDataStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPersistent");

  if ((v11 & 1) != 0)
  {
    +[TabDocument tabDocumentForWKWebView:](TabDocument, "tabDocumentForWKWebView:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "sessionStateRestorationSource") != 1)
    {
      objc_msgSend(v12, "browserController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __49__History__webView_didUpdateHistoryTitle_forURL___block_invoke;
      v14[3] = &unk_1E9CF3C30;
      v15 = v12;
      v16 = self;
      v17 = v8;
      -[History _updateForWKWebView:browserController:updates:](self, "_updateForWKWebView:browserController:updates:", v7, v13, v14);

    }
  }

}

void __49__History__webView_didUpdateHistoryTitle_forURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "lastVisit");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(a1 + 40), "updateTitle:forVisit:", *(_QWORD *)(a1 + 48), v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitedLinkStore, 0);
  objc_storeStrong((id *)&self->_deferredUpdates, 0);
}

@end
