@implementation EKUIIOSMacUtils

+ (void)createNewEventInCalendarWithTitle:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 allDay:(BOOL)a7 location:(id)a8 notes:(id)a9 url:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  objc_class *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  id v39;
  void *v40;
  _QWORD v41[6];
  _QWORD v42[7];

  v38 = a7;
  v42[6] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a6;
  v39 = a8;
  v16 = a9;
  v17 = a10;
  v18 = (objc_class *)MEMORY[0x1E0CB3B10];
  v19 = a5;
  v20 = a4;
  v21 = (void *)objc_msgSend([v18 alloc], "initWithActivityType:", CFSTR("com.apple.calendar.event_creation"));
  objc_msgSend(v21, "setTitle:", CFSTR("Creating event"));
  v22 = (void *)objc_opt_new();
  v41[0] = CFSTR("com.apple.calendarUIKit.userActivity.version");
  v41[1] = CFSTR("com.apple.calendarUIKit.userActivity.type");
  v42[0] = &unk_1E606F108;
  v42[1] = &unk_1E606F120;
  v40 = v14;
  v42[2] = v14;
  v41[2] = CFSTR("com.apple.calendarUIKit.userActivity.title");
  v41[3] = CFSTR("com.apple.calendarUIKit.userActivity.startDate");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  v25 = v24;

  objc_msgSend(v23, "numberWithDouble:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v26;
  v41[4] = CFSTR("com.apple.calendarUIKit.userActivity.endDate");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  v29 = v28;

  objc_msgSend(v27, "numberWithDouble:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v30;
  v41[5] = CFSTR("com.apple.calendarUIKit.userActivity.allDay");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addEntriesFromDictionary:", v32);

  objc_msgSend(v15, "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v15, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, CFSTR("com.apple.calendarUIKit.userActivity.timeZone"));

  }
  if (v39)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, CFSTR("com.apple.calendarUIKit.userActivity.location"));
  if (v16)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("com.apple.calendarUIKit.userActivity.notes"));
  objc_msgSend(v17, "absoluteString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v17, "absoluteString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, CFSTR("com.apple.calendarUIKit.userActivity.url"));

  }
  objc_msgSend(v21, "setUserInfo:", v22);
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v21, 0, 0, &__block_literal_global_7);

}

void __106__EKUIIOSMacUtils_createNewEventInCalendarWithTitle_startDate_endDate_timeZone_allDay_location_notes_url___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  EKUIIOSMacLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __106__EKUIIOSMacUtils_createNewEventInCalendarWithTitle_startDate_endDate_timeZone_allDay_location_notes_url___block_invoke_cold_1(a2, (uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "Sent useractivity to create new event in Calendar!", v7, 2u);
  }

}

void __106__EKUIIOSMacUtils_createNewEventInCalendarWithTitle_startDate_endDate_timeZone_allDay_location_notes_url___block_invoke_cold_1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_1AF84D000, log, OS_LOG_TYPE_ERROR, "Failed to launch useractivity, success: %d, error: %@", (uint8_t *)v3, 0x12u);
}

@end
