@implementation UNNotificationRequest(HKMenstrualCycles)

+ (uint64_t)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles
{
  return objc_msgSend(a1, "hkmc_requestForCategoryIdentifier:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", a3, 0, 0);
}

+ (id)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x24BDBCE60];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hkmc_requestForCategoryIdentifier:startDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", v10, v11, a4, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)hkmc_requestForCategoryIdentifier:()HKMenstrualCycles fertileWindowEndDayIndex:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a3;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hkmc_requestForCategoryIdentifier:startDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", v7, v8, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_hkmc_requestForCategoryIdentifier:()HKMenstrualCycles startDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __CFString *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  int v47;
  void *v48;
  int v49;
  id v50;
  void *v51;
  __CFString *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  id v57;
  void *v58;
  const __CFString *v59;
  const __CFString *v60;
  __CFString *v61;
  void *v62;
  uint64_t v63;
  int v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v10;
  v14 = v12;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("MenstrualCyclesAppPlugin.AfterPeriodStart")))
  {
    v15 = CFSTR("NOTIFICATION_AFTER_PERIOD_START_BODY");
LABEL_9:
    HKMCLocalizedString(v15);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v17 = (void *)v16;
    goto LABEL_11;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("MenstrualCyclesAppPlugin.AfterLoggedPeriodEnd")))
  {
    v15 = CFSTR("NOTIFICATION_AFTER_LOGGED_PERIOD_END_BODY");
    goto LABEL_9;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("MenstrualCyclesAppPlugin.AfterUnloggedPeriodEnd")))
  {
    v15 = CFSTR("NOTIFICATION_AFTER_UNLOGGED_PERIOD_END_BODY");
    goto LABEL_9;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("MenstrualCyclesAppPlugin.BeforePeriodStart1Day")))
  {
    v15 = CFSTR("NOTIFICATION_BEFORE_PERIOD_START_TOMORROW_BODY");
    goto LABEL_9;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("MenstrualCyclesAppPlugin.UnconfirmedDeviation")))
  {
    HKMCLocalizedStringSelene(CFSTR("NOTIFICATION_UNCONFIRMED_DEVIATION_BODY"));
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v23 = a1;
  HKMCBeforePeriodStartDaysNotificationCategories();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "containsObject:", v13);

  if (v25)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = CFSTR("NOTIFICATION_BEFORE_PERIOD_START_DAYS_BODY_%ld");
LABEL_48:
    HKMCLocalizedString(v27);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", v48, HKMCNotificationDateComponentScalarFromCategory((uint64_t)v13));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_49;
  }
  HKMCBeforePeriodStartWeeksNotificationCategories();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "containsObject:", v13);

  if (v29)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = CFSTR("NOTIFICATION_BEFORE_PERIOD_START_WEEKS_BODY_%ld");
    goto LABEL_48;
  }
  HKMCBeforeFertileWindowStartDaysNotificationCategories();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "containsObject:", v13);

  if (v47)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    v27 = CFSTR("NOTIFICATION_BEFORE_FERTILE_WINDOW_START_DAYS_BODY_%ld");
    goto LABEL_48;
  }
  if (objc_msgSend(CFSTR("MenstrualCyclesAppPlugin.UpdatedFertileWindowEnd"), "isEqualToString:", v13))
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "hk_dateOnDayIndex:atHour:calendar:", a5, 20, v68);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0;
    v49 = objc_msgSend(MEMORY[0x24BDD1500], "hkmc_shouldUseRelativeFormatForFertileWindowEndDate:gregorianCalendar:dateFormatArgumentOut:", v66, v68, &v69);
    v50 = v69;
    v51 = (void *)MEMORY[0x24BDD17C8];
    if (v49)
      v52 = CFSTR("NOTIFICATION_UPDATE_FERTILE_WINDOW_BODY_RELATIVE_%@");
    else
      v52 = CFSTR("NOTIFICATION_UPDATE_FERTILE_WINDOW_BODY_FULL_%@");
    HKMCLocalizedString(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringWithFormat:", v53, v50);
    v54 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v54;
  }
  else
  {
    if (!objc_msgSend(CFSTR("MenstrualCyclesAppPlugin.OvulationConfirmed"), "isEqualToString:", v13))
    {
      v17 = 0;
      goto LABEL_49;
    }
    v55 = objc_msgSend(v14, "integerValue");
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "hk_dateOnDayIndex:atHour:calendar:", a5, 20, v68);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0;
    v56 = objc_msgSend(MEMORY[0x24BDD1500], "hkmc_shouldUseRelativeFormatForFertileWindowEndDate:gregorianCalendar:dateFormatArgumentOut:", v66, v68, &v69);
    v57 = v69;
    v58 = (void *)MEMORY[0x24BDD17C8];
    v59 = CFSTR("NOTIFICATION_OVULATION_CONFIRMED_BODY_RELATIVE_%@");
    if (v55)
      v59 = CFSTR("NOTIFICATION_SHIFTED_OVULATION_CONFIRMED_BODY_RELATIVE_%@");
    v60 = CFSTR("NOTIFICATION_OVULATION_CONFIRMED_BODY_FULL_%@");
    if (v55)
      v60 = CFSTR("NOTIFICATION_SHIFTED_OVULATION_CONFIRMED_BODY_FULL_%@");
    if (v56)
      v61 = (__CFString *)v59;
    else
      v61 = (__CFString *)v60;
    HKMCLocalizedString(v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringWithFormat:", v62, v57);
    v63 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v63;
  }

LABEL_49:
  a1 = v23;
LABEL_11:

  v18 = v13;
  HKMCBeforePeriodStartNotificationCategories();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", v18);

  if (v20)
  {
    v21 = CFSTR("NOTIFICATION_BEFORE_PERIOD_START_TITLE");
LABEL_31:
    HKMCLocalizedString(v21);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  if (objc_msgSend(CFSTR("MenstrualCyclesAppPlugin.AfterPeriodStart"), "isEqualToString:", v18))
  {
    v21 = CFSTR("NOTIFICATION_AFTER_PERIOD_START_TITLE");
    goto LABEL_31;
  }
  if (objc_msgSend(CFSTR("MenstrualCyclesAppPlugin.AfterLoggedPeriodEnd"), "isEqualToString:", v18))
  {
    v21 = CFSTR("NOTIFICATION_AFTER_LOGGED_PERIOD_END_TITLE");
    goto LABEL_31;
  }
  if (objc_msgSend(CFSTR("MenstrualCyclesAppPlugin.AfterUnloggedPeriodEnd"), "isEqualToString:", v18))
  {
    v21 = CFSTR("NOTIFICATION_AFTER_UNLOGGED_PERIOD_END_TITLE");
    goto LABEL_31;
  }
  if (objc_msgSend(CFSTR("MenstrualCyclesAppPlugin.UnconfirmedDeviation"), "isEqualToString:", v18))
  {
    HKMCLocalizedStringSelene(CFSTR("NOTIFICATION_UNCONFIRMED_DEVIATION_TITLE"));
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_32:
    v32 = (void *)v22;
    goto LABEL_33;
  }
  if (objc_msgSend(CFSTR("MenstrualCyclesAppPlugin.OvulationConfirmed"), "isEqualToString:", v18))
  {
    v21 = CFSTR("NOTIFICATION_OVULATION_CONFIRMED_TITLE");
    goto LABEL_31;
  }
  HKMCFertileWindowNotificationCategories();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "containsObject:", v18);

  if (v31)
  {
    v21 = CFSTR("NOTIFICATION_BEFORE_FERTILE_WINDOW_START_TITLE");
    goto LABEL_31;
  }
  v32 = 0;
LABEL_33:

  if (v17)
  {
    v67 = v17;
    v33 = v18;
    v34 = v11;
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "isAppleWatch") & 1) != 0)
    {
      v36 = 0;
LABEL_43:

      goto LABEL_44;
    }
    v65 = v11;
    HKMCBeforePeriodStartDaysNotificationCategories();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "containsObject:", v33))
    {

    }
    else
    {
      HKMCBeforeFertileWindowStartDaysNotificationCategories();
      v39 = a1;
      v40 = v14;
      v41 = a5;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v42, "containsObject:", v33);

      a5 = v41;
      v14 = v40;
      a1 = v39;

      if (!v64)
        goto LABEL_41;
    }
    v43 = HKMCNotificationDateComponentScalarFromCategory((uint64_t)v33);
    if (v43 <= 6)
    {
      v44 = v43;
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dateByAddingUnit:value:toDate:options:", 16, v44, v34, 1024);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v65;
      goto LABEL_43;
    }
LABEL_41:
    v36 = 0;
    v11 = v65;
LABEL_44:

    v17 = v67;
    objc_msgSend(a1, "_hkmc_notificationRequestWithCategory:body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:", v33, v67, v32, v36, a5, v14);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_45;
  }
  v37 = 0;
LABEL_45:

  return v37;
}

+ (id)_hkmc_notificationRequestWithCategory:()HKMenstrualCycles body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF8800], "_hkmc_contentWithCategory:body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hkmc_notificationRequestWithContent:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_hkmc_notificationRequestWithContent:()HKMenstrualCycles
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDF8870];
  v4 = a3;
  objc_msgSend(v3, "soundWithAlertType:", 25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSound:", v5);

  v6 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(v4, "categoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKMCNotificationIdentifierForCategory(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithIdentifier:content:trigger:", v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
