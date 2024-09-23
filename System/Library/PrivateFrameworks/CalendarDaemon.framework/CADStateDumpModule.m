@implementation CADStateDumpModule

- (void)activate
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CADStateDumpModule_activate__block_invoke;
  block[3] = &unk_1E6A373A8;
  block[4] = self;
  if (activate_onceToken != -1)
    dispatch_once(&activate_onceToken, block);
}

uint64_t __30__CADStateDumpModule_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerForStateCapture");
}

- (void)registerForStateCapture
{
  NSObject *v2;
  dispatch_queue_t v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.calendar.eventstore.stateCaptureQ", v2);

  CalAddStateCaptureBlock();
  CalAddStateCaptureBlock();

}

id __45__CADStateDumpModule_registerForStateCapture__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  const void *v7;
  __CFString *v8;
  __CFString *v9;
  int IsIgnoringEventAlerts;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  CFTypeRef cf;
  id obj;
  id v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[6];
  _QWORD v28[6];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = (id)objc_opt_new();
  cf = (CFTypeRef)CalDatabaseCreateWithOptions();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v1)
  {
    v2 = v1;
    v21 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(obj);
        v4 = (void *)CalCalendarCopyUUID();
        v5 = (__CFString *)CalCalendarCopyType();
        v6 = (__CFString *)CalCalendarCopyColorString();
        v7 = (const void *)CalCalendarCopyStore();
        v8 = (__CFString *)CalStoreCopyUUID();
        objc_msgSend(*(id *)(a1 + 32), "_storeTypeStringFromType:", CalStoreGetType());
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        IsIgnoringEventAlerts = CalCalendarIsIgnoringEventAlerts();
        if (v4)
        {
          v27[0] = CFSTR("calendarUUID");
          v27[1] = CFSTR("calendarType");
          if (v5)
            v11 = v5;
          else
            v11 = &stru_1E6A39768;
          v28[0] = v4;
          v28[1] = v11;
          if (v6)
            v12 = v6;
          else
            v12 = &stru_1E6A39768;
          v27[2] = CFSTR("colorString");
          v27[3] = CFSTR("storeUUID");
          if (v8)
            v13 = v8;
          else
            v13 = &stru_1E6A39768;
          v28[2] = v12;
          v28[3] = v13;
          if (v9)
            v14 = v9;
          else
            v14 = &stru_1E6A39768;
          v27[4] = CFSTR("storeType");
          v27[5] = CFSTR("ignoreAlerts");
          v15 = CFSTR("No");
          if (IsIgnoringEventAlerts)
            v15 = CFSTR("Yes");
          v28[4] = v14;
          v28[5] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, v4);

        }
        if (v7)
          CFRelease(v7);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v2);
  }

  if (cf)
    CFRelease(cf);

  return v20;
}

id __45__CADStateDumpModule_registerForStateCapture__block_invoke_2()
{
  void *v0;
  __CFString *v1;
  __CFString *v2;
  const void *v3;
  const void *v4;
  __CFString *v5;
  void *v6;
  int v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  v0 = (void *)objc_opt_new();
  v1 = (__CFString *)CalAlarmCopyDefaultTimedAlarmOffset();
  v2 = (__CFString *)CalAlarmCopyDefaultAllDayAlarmOffset();
  v3 = (const void *)CalDatabaseCreateWithOptions();
  v4 = (const void *)CalDatabaseCopyStoreForBirthdayCalendar();
  v5 = (__CFString *)CalStoreCopyDefaultAlarmOffset();
  objc_msgSend(MEMORY[0x1E0D0BB10], "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "get_enableTravelAdvisoriesForAutomaticBehavior");

  v8 = objc_msgSend(MEMORY[0x1E0D0C330], "ttlLocationStatus");
  if (v1)
    v9 = v1;
  else
    v9 = CFSTR("None");
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v9, CFSTR("defaultTimedAlarm"));
  if (v2)
    v10 = v2;
  else
    v10 = CFSTR("None");
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v10, CFSTR("defaultAllDayAlarm"));
  if (v5)
    v11 = v5;
  else
    v11 = CFSTR("None");
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v11, CFSTR("defaultBirthdayAlarm"));
  if (v7)
    v12 = CFSTR("Yes");
  else
    v12 = CFSTR("No");
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v12, CFSTR("timeToLeave"));
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    v13 = CFSTR("Yes");
  else
    v13 = CFSTR("No");
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v13, CFSTR("ttlLocationDisabled"));
  if (v4)
    CFRelease(v4);
  if (v3)
    CFRelease(v3);

  return v0;
}

- (id)_storeTypeStringFromType:(int)a3
{
  if ((a3 - 1) > 5)
    return CFSTR("Local");
  else
    return *(&off_1E6A387F8 + a3 - 1);
}

@end
