@implementation NSCalendar

void __56__NSCalendar_CalClassAdditions__CalGregorianGMTCalendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)CalGregorianGMTCalendar_gregorianGMTCalendar;
  CalGregorianGMTCalendar_gregorianGMTCalendar = v1;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)CalGregorianGMTCalendar_gregorianGMTCalendar, "setTimeZone:", v3);

}

void __71__NSCalendar_CalClassAdditions__CalOccurrencesForBirthday_inDateRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  int v8;
  int v9;
  void *v10;

  v6 = a2;
  if (v6
    && (v10 = v6,
        objc_msgSend(*(id *)(a1 + 32), "endDate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v10, "CalIsAfterOrSameAsDate:", v7),
        v7,
        v6 = v10,
        !v8))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "containsDate:", v10);
    v6 = v10;
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
      v6 = v10;
    }
  }
  else
  {
    *a4 = 1;
  }

}

void __66__NSCalendar_CalClassAdditions__sharedAutoupdatingCurrentCalendar__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "autoupdatingCurrentCalendar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)sharedAutoupdatingCurrentCalendar_autoupdatingCalendar;
  sharedAutoupdatingCurrentCalendar_autoupdatingCalendar = v1;

}

void __57__NSCalendar_CalClassAdditions__CalYearlessDateThreshold__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (id)objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v4, "setTimeZone:", v1);
  objc_msgSend(v4, "dateWithEra:year:month:day:hour:minute:second:nanosecond:", 1, 1605, 1, 1, 0, 0, 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)CalYearlessDateThreshold_s_threshold;
  CalYearlessDateThreshold_s_threshold = v2;

}

void __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke(uint64_t a1, void *a2, int a3, _BYTE *a4)
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a2;
  if (a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    if (v8)
    {
LABEL_9:
      *a4 = 1;
      goto LABEL_10;
    }
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke_cold_1(a1, v9, v10, v11, v12, v13, v14, v15);
LABEL_8:

    goto LABEL_9;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(_QWORD *)(v16 + 24);
  *(_QWORD *)(v16 + 24) = v17 + 1;
  if (v17 >= 5)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke_cold_2(a1, v9, v18, v19, v20, v21, v22, v23);
    goto LABEL_8;
  }
LABEL_10:

}

void __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18FC12000, a2, a3, "BirthdayCal: unexpected nil date for birthday components: %@", a5, a6, a7, a8, 2u);
}

void __63__NSCalendar_CalClassAdditions__CalDateFromBirthdayComponents___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18FC12000, a2, a3, "BirthdayCal: enumerateDatesStartingAfterDate seems to be looping forever for birthday components: %@", a5, a6, a7, a8, 2u);
}

@end
