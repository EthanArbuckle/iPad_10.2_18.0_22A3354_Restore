@implementation ICDateHeadersUtilities

+ (int)defaultDateHeadersType
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int result;

  v2 = (void *)cachedDefaultDateHeadersType;
  if (cachedDefaultDateHeadersType)
    goto LABEL_3;
  v3 = objc_opt_class();
  +[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", CFSTR("kICSettingsNoteDateHeadersTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast(v3, (uint64_t)v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)cachedDefaultDateHeadersType;
  cachedDefaultDateHeadersType = v5;

  v2 = (void *)cachedDefaultDateHeadersType;
  if (cachedDefaultDateHeadersType)
  {
LABEL_3:
    result = objc_msgSend(v2, "integerValue");
    if (result)
      return result;
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICDateHeadersUtilities defaultDateHeadersType]", 1, 0, CFSTR("Default should never be stored as user preference. Return fallback default instead."));
  }
  else
  {
    cachedDefaultDateHeadersType = (uint64_t)&unk_1EA832208;

  }
  return 2;
}

+ (void)clearCache
{
  void *v2;
  void *v3;

  v2 = (void *)cachedDefaultDateHeadersType;
  cachedDefaultDateHeadersType = 0;

  v3 = (void *)cachedQueryDateHeadersType;
  cachedQueryDateHeadersType = 0;

}

+ (void)setDefaultDateHeadersType:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  if (objc_msgSend(a1, "defaultDateHeadersType") != a3)
  {
    if ((v3 - 1) >= 2)
    {
      if (!(_DWORD)v3)
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICDateHeadersUtilities setDefaultDateHeadersType:]", 1, 0, CFSTR("Default should never be stored as user preference. Ignore."));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)cachedDefaultDateHeadersType;
      cachedDefaultDateHeadersType = v5;

      objc_msgSend(a1, "setDateHeadersUserPreference:forKey:postNotificationName:", v3, CFSTR("kICSettingsNoteDateHeadersTypeKey"), CFSTR("kICDateHeadersUtilitiesDidChangeDefaultDateHeadersTypeNotification"));
    }
  }
}

+ (int)queryDateHeadersType
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)cachedQueryDateHeadersType;
  if (cachedQueryDateHeadersType)
    return objc_msgSend(v2, "integerValue");
  v3 = objc_opt_class();
  +[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", CFSTR("kICQueryDateHeadersTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast(v3, (uint64_t)v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)cachedQueryDateHeadersType;
  cachedQueryDateHeadersType = v5;

  v2 = (void *)cachedQueryDateHeadersType;
  if (cachedQueryDateHeadersType)
    return objc_msgSend(v2, "integerValue");
  cachedQueryDateHeadersType = (uint64_t)&unk_1EA832220;

  return 0;
}

+ (void)setQueryDateHeadersType:(int)a3
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  void *v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_msgSend(a1, "queryDateHeadersType");
  if (v3 <= 2 && v5 != (_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)cachedQueryDateHeadersType;
    cachedQueryDateHeadersType = v6;

    objc_msgSend(a1, "setDateHeadersUserPreference:forKey:postNotificationName:", v3, CFSTR("kICQueryDateHeadersTypeKey"), CFSTR("kICDateHeadersUtilitiesDidChangeQueryDateHeadersTypeNotification"));
  }
}

+ (BOOL)showsQueryDateHeaders
{
  return objc_msgSend(a1, "isShowingQueryDateHeadersForDateHeadersType:", objc_msgSend(a1, "queryDateHeadersType"));
}

+ (BOOL)supportsQueryDateHeaders
{
  void *v2;
  BOOL v3;

  +[ICFolderCustomNoteSortType querySortType](ICFolderCustomNoteSortType, "querySortType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resolvedCustomSortTypeOrder") != 3;

  return v3;
}

+ (NSString)menuTitle
{
  return (NSString *)+[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Group By Date"), CFSTR("Group By Date"), 0, 1);
}

+ (id)actionItemTitleWithDateHeadersType:(int)a3
{
  const __CFString *v3;

  switch(a3)
  {
    case 2:
      v3 = CFSTR("On");
LABEL_7:
      +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v3, v3, 0, 1);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      return a1;
    case 1:
      v3 = CFSTR("Off");
      goto LABEL_7;
    case 0:
      objc_msgSend(a1, "stringForDateHeadersType:");
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return a1;
}

+ (id)stringForDateHeadersType:(int)a3
{
  int v4;
  void *v5;
  const __CFString *v6;

  v4 = objc_msgSend(a1, "defaultDateHeadersType");
  switch(a3)
  {
    case 2:
LABEL_8:
      v6 = CFSTR("On");
LABEL_12:
      +[ICLocalization localizedFrameworkStringForKey:value:table:allowSiri:](ICLocalization, "localizedFrameworkStringForKey:value:table:allowSiri:", v6, v6, 0, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    case 1:
      v6 = CFSTR("Off");
      goto LABEL_12;
    case 0:
      switch(v4)
      {
        case 2:
          v6 = CFSTR("Default (On)");
          goto LABEL_12;
        case 1:
          v6 = CFSTR("Default (Off)");
          goto LABEL_12;
        case 0:
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICDateHeadersUtilities stringForDateHeadersType:]", 1, 0, CFSTR("Default should never be stored as user preference. Ignore."));
          v5 = 0;
          return v5;
      }
      goto LABEL_8;
  }
  return v5;
}

+ (void)setDateHeadersUserPreference:(int)a3 forKey:(id)a4 postNotificationName:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", v10, v9);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", v8, 0);

}

+ (BOOL)isShowingQueryDateHeadersForDateHeadersType:(int)a3
{
  if (!a3)
    return objc_msgSend(a1, "isShowingQueryDateHeadersForDateHeadersType:", objc_msgSend(a1, "defaultDateHeadersType"));
  if (a3 == 2)
    return objc_msgSend(a1, "supportsQueryDateHeaders");
  return 0;
}

@end
