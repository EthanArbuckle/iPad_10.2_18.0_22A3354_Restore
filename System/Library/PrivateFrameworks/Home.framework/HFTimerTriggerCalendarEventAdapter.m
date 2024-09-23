@implementation HFTimerTriggerCalendarEventAdapter

+ (BOOL)hasWeekdayRecurrenceInRecurrences:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_90);
}

BOOL __72__HFTimerTriggerCalendarEventAdapter_hasWeekdayRecurrenceInRecurrences___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "weekday") >= 1 && objc_msgSend(v2, "weekday") != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  HFTimerTriggerCalendarEventAdapter *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  HFTimerTriggerCalendarEventAdapter *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HFTimerTriggerTimeEventAdapter eventBuilder](self, "eventBuilder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performValidation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke;
  v33[3] = &unk_1EA732668;
  v33[4] = self;
  v14 = v10;
  v34 = v14;
  v15 = v8;
  v35 = v15;
  v36 = v9;
  v16 = v9;
  objc_msgSend(v12, "flatMap:", v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_2;
  v29[3] = &unk_1EA72CB18;
  v18 = v15;
  v30 = v18;
  v31 = self;
  v19 = v14;
  v32 = v19;
  v20 = (id)objc_msgSend(v17, "addSuccessBlock:", v29);
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_38;
  v25[3] = &unk_1EA72CAF0;
  v26 = v18;
  v27 = self;
  v28 = v19;
  v21 = v19;
  v22 = v18;
  v23 = (id)objc_msgSend(v17, "addFailureBlock:", v25);

  return v17;
}

id __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke(uint64_t a1)
{
  int v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_msgSend((id)objc_opt_class(), "hasWeekdayRecurrenceInRecurrences:", *(_QWORD *)(a1 + 40));
  v3 = objc_alloc(MEMORY[0x1E0CBA910]);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "eventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectiveFireDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    v8 = (void *)objc_msgSend(v3, "initWithName:fireDate:timeZone:recurrences:", v4, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initWithName:fireDate:timeZone:recurrence:recurrenceCalendar:", v4, v6, v7, v9, 0);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "eventBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fireDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Created timer trigger with name:%@ fireDate:%@ recurrence:%@", (uint8_t *)&v7, 0x20u);

  }
}

void __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_38(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "eventBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fireDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    v9 = 138413058;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to create timer trigger with name:%@ fireDate:%@ recurrence:%@. Error: %@", (uint8_t *)&v9, 0x2Au);

  }
}

- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v7 = a4;
  -[HFTimerTriggerTimeEventAdapter eventBuilder](self, "eventBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectiveFireDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFireDate:", v9);

  if (objc_msgSend((id)objc_opt_class(), "hasWeekdayRecurrenceInRecurrences:", v7))
  {
    objc_msgSend(v11, "setRecurrences:", v7);
  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setRecurrence:", v10);
    v7 = (id)v10;
  }

}

- (id)updateTrigger:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D519C0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke;
  v22[3] = &unk_1EA728590;
  v22[4] = self;
  v7 = v4;
  v23 = v7;
  objc_msgSend(v6, "futureWithErrorOnlyHandlerAdapterBlock:", v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_2;
  v20[3] = &unk_1EA732690;
  v20[4] = self;
  v9 = v7;
  v21 = v9;
  objc_msgSend(v8, "flatMap:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_3;
  v18[3] = &unk_1EA72CB68;
  v18[4] = self;
  v11 = v9;
  v19 = v11;
  v12 = (id)objc_msgSend(v10, "addSuccessBlock:", v18);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_40;
  v16[3] = &unk_1EA726360;
  v16[4] = self;
  v17 = v11;
  v13 = v11;
  v14 = (id)objc_msgSend(v10, "addFailureBlock:", v16);

  return v10;
}

void __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "eventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateBaseFireDateForTrigger");

  objc_msgSend(*(id *)(a1 + 32), "eventBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveFireDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "updateFireDate:completionHandler:", v7, v4);
}

id __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "fireDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFireDate:", v5);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectiveFireDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updated execution time: %@ for trigger with name: %@", (uint8_t *)&v6, 0x16u);

  }
}

void __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectiveFireDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to update execution time: %@ for trigger with name: %@. Error: %@", (uint8_t *)&v8, 0x20u);

  }
}

@end
