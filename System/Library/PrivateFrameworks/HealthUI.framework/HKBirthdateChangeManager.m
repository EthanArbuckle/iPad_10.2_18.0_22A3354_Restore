@implementation HKBirthdateChangeManager

- (HKBirthdateChangeManager)initWithHealthStore:(id)a3
{
  id v4;
  HKBirthdateChangeManager *v5;
  HKBirthdateChangeManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKBirthdateChangeManager;
  v5 = -[HKBirthdateChangeManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HKBirthdateChangeManager setHealthStore:](v5, "setHealthStore:", v4);

  return v6;
}

- (id)setBirthdate:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  int64_t v13;
  int64_t v14;
  HKBirthdateChangeStatus *v15;
  HKBirthdateChangeStatus *v16;
  uint64_t v17;
  _BOOL8 v19;
  id v20;
  id v22;
  id v23;

  v6 = a3;
  -[HKBirthdateChangeManager healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "dateOfBirthComponentsWithError:", &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;

  -[HKBirthdateChangeManager healthStore](self, "healthStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  v11 = objc_msgSend(v10, "_setDateOfBirthComponents:error:", v6, &v22);
  v12 = v22;

  v13 = -[HKBirthdateChangeManager _ageFromBirthDateComponents:](self, "_ageFromBirthDateComponents:", v8);
  v14 = -[HKBirthdateChangeManager _ageFromBirthDateComponents:](self, "_ageFromBirthDateComponents:", v6);

  v15 = objc_alloc_init(HKBirthdateChangeStatus);
  v16 = v15;
  if (v12)
    v17 = 0;
  else
    v17 = v11;
  -[HKBirthdateChangeStatus setSuccess:](v15, "setSuccess:", v17);
  if (-[HKBirthdateChangeStatus success](v16, "success"))
    v19 = v13 >= *MEMORY[0x1E0CB76C0] && v14 < *MEMORY[0x1E0CB76C0];
  else
    v19 = 0;
  -[HKBirthdateChangeStatus setShouldShowWarning:](v16, "setShouldShowWarning:", v19);
  -[HKBirthdateChangeStatus setNewAge:](v16, "setNewAge:", v14);
  v20 = v12;
  if (v12)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v20);
    else
      _HKLogDroppedError();
  }

  return v16;
}

+ (void)showDisabledWarningWithAge:(int64_t)a3 presentingViewController:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "showDisabledWarningWithAge:isHealthChecklistAvailable:presentingViewController:withAlertActions:", a3, 0, v5, MEMORY[0x1E0C9AA60]);

}

+ (void)showDisabledWarningWithHealthChecklistWithAge:(int64_t)a3 presentingViewController:(id)a4 openHealthChecklistInContext:(BOOL)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  BOOL v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0DC3448];
  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = a4;
  objc_msgSend(v8, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EDIT_DETAILS_ACTION_CHECKLIST"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __128__HKBirthdateChangeManager_showDisabledWarningWithHealthChecklistWithAge_presentingViewController_openHealthChecklistInContext___block_invoke;
  v15[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
  v16 = a5;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v11, 0, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_class();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showDisabledWarningWithAge:isHealthChecklistAvailable:presentingViewController:withAlertActions:", a3, 1, v9, v14);

}

void __128__HKBirthdateChangeManager_showDisabledWarningWithHealthChecklistWithAge_presentingViewController_openHealthChecklistInContext___block_invoke(uint64_t a1)
{
  __CFString *v1;
  void *v2;
  __CFString *v3;
  void *v4;
  id v5;

  if (*(_BYTE *)(a1 + 32))
    v1 = CFSTR("x-apple-health://HealthChecklist/CurrentContext");
  else
    v1 = CFSTR("x-apple-health://HealthChecklist");
  v2 = (void *)MEMORY[0x1E0CA5878];
  v3 = v1;
  objc_msgSend(v2, "defaultWorkspace");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "openSensitiveURL:withOptions:", v4, MEMORY[0x1E0C9AA70]);
}

+ (void)showDisabledWarningWithAge:(int64_t)a3 isHealthChecklistAvailable:(BOOL)a4 presentingViewController:(id)a5 withAlertActions:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v7 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EDIT_DETAILS_AGE_UNDER_13_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 < 0 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("EDIT_DETAILS_AGE_REMOVED_TEXT_CHECKLIST_AVAILABLE");
LABEL_4:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v7)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    v19 = CFSTR("EDIT_DETAILS_AGE_%ld_UNDER_13_BODY_CHECKLIST_AVAILABLE");
  }
  else
  {
    if (a3 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = CFSTR("EDIT_DETAILS_AGE_REMOVED_TEXT_CHECKLIST_UNAVAILABLE");
      goto LABEL_4;
    }
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    v19 = CFSTR("EDIT_DETAILS_AGE_%ld_UNDER_13_BODY_CHECKLIST_UNAVAILABLE");
  }
  objc_msgSend(v18, "localizedStringForKey:value:table:", v19, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringWithFormat:", v20, a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, v16, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v10;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v21, "addAction:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v26++));
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v24);
  }

  v27 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("EDIT_DETAILS_ALERT_ACTION_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 0, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAction:", v30);
  objc_msgSend(v21, "setPreferredAction:", v30);
  objc_msgSend(v9, "presentViewController:animated:completion:", v21, 1, 0);

}

- (int64_t)_ageFromBirthDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  if (!a3)
    return -1;
  v4 = a3;
  +[HKBirthdateChangeManager _birthdayCalendar](HKBirthdateChangeManager, "_birthdayCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKBirthdateChangeManager _ageFromBirthDate:](self, "_ageFromBirthDate:", v6);
  return v7;
}

- (int64_t)_ageFromBirthDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v4 = a3;
  +[HKBirthdateChangeManager _birthdayCalendar](HKBirthdateChangeManager, "_birthdayCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKBirthdateChangeManager _nowDate](self, "_nowDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:toDate:options:", 4, v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "year");
  return v8;
}

- (id)_nowDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

+ (id)_birthdayCalendar
{
  if (_birthdayCalendar_onceToken != -1)
    dispatch_once(&_birthdayCalendar_onceToken, &__block_literal_global_31);
  return (id)_birthdayCalendar_calendar;
}

void __45__HKBirthdateChangeManager__birthdayCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_birthdayCalendar_calendar;
  _birthdayCalendar_calendar = v0;

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
