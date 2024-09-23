@implementation HFTimerBasedTimeTriggerBuilder

- (HFTimerBasedTimeTriggerBuilder)initWithExistingObject:(id)a3 inHome:(id)a4 context:(id)a5
{
  id v9;
  HFTimerBasedTimeTriggerBuilder *v10;
  HFTimerBasedTimeTriggerBuilder *v11;
  void *v13;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFTimerBasedTimeTriggerBuilder;
  v10 = -[HFTriggerBuilder initWithExistingObject:inHome:context:](&v14, sel_initWithExistingObject_inHome_context_, v9, a4, a5);
  v11 = v10;
  if (v9 && v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("HFConcreteTimeTriggerBuilder.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[object isKindOfClass:[HMTimerTrigger class]]"));

    }
    -[HFTimerBasedTimeTriggerBuilder _setupWithExistingTrigger:](v11, "_setupWithExistingTrigger:", v9);
  }

  return v11;
}

- (void)_setupWithExistingTrigger:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFCalendarEventBuilder *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTimerBasedTimeTriggerBuilder setTimeZone:](self, "setTimeZone:", v4);

  objc_msgSend(v16, "recurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v16, "recurrences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTimerBasedTimeTriggerBuilder setRecurrences:](self, "setRecurrences:", v6);

  }
  else
  {
    objc_msgSend(v16, "recurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v16, "recurrence");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "na_arrayWithSafeObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFTimerBasedTimeTriggerBuilder setRecurrences:](self, "setRecurrences:", v10);

    }
    else
    {
      -[HFTimerBasedTimeTriggerBuilder setRecurrences:](self, "setRecurrences:", MEMORY[0x1E0C9AA60]);
    }
  }
  objc_msgSend(v16, "fireDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc_init(HFCalendarEventBuilder);
    objc_msgSend(v16, "fireDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCalendarEventBuilder setFireDate:](v12, "setFireDate:", v13);
LABEL_10:

    -[HFTimerBasedTimeTriggerBuilder setEventBuilder:](self, "setEventBuilder:", v12);
    goto LABEL_11;
  }
  objc_msgSend(v16, "significantEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v12 = objc_alloc_init(HFSignificantTimeEventBuilder);
    objc_msgSend(v16, "significantEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCalendarEventBuilder setSignificantEvent:](v12, "setSignificantEvent:", v15);

    objc_msgSend(v16, "significantEventOffset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCalendarEventBuilder setSignificantEventOffset:](v12, "setSignificantEventOffset:", v13);
    goto LABEL_10;
  }
LABEL_11:

}

- (id)commitCreateTrigger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    NSLog(CFSTR("Attempting to create a trigger that we've already created!"));
  -[HFTimerBasedTimeTriggerBuilder eventBuilder](self, "eventBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFTimerTriggerTimeEventAdapter adapterWithEventBuilder:](HFTimerTriggerTimeEventAdapter, "adapterWithEventBuilder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFTimerBasedTimeTriggerBuilder recurrences](self, "recurrences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[HFTimerBasedTimeTriggerBuilder recurrences](self, "recurrences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  -[HFTriggerBuilder name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTimerBasedTimeTriggerBuilder timeZone](self, "timeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createTriggerWithName:timeZone:recurrences:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__HFTimerBasedTimeTriggerBuilder_commitCreateTrigger__block_invoke;
  v13[3] = &unk_1EA734690;
  v13[4] = self;
  objc_msgSend(v10, "addSuccessBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __53__HFTimerBasedTimeTriggerBuilder_commitCreateTrigger__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTrigger:", a2);
}

- (id)commitEditTrigger
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  -[HFTriggerBuilder trigger](self, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    NSLog(CFSTR("Attempting to edit a trigger that we haven't created yet!"));
  -[HFTimerBasedTimeTriggerBuilder eventBuilder](self, "eventBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFTimerTriggerTimeEventAdapter adapterWithEventBuilder:](HFTimerTriggerTimeEventAdapter, "adapterWithEventBuilder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFTriggerBuilder trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTrigger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__HFTimerBasedTimeTriggerBuilder_commitEditTrigger__block_invoke;
  v13[3] = &unk_1EA72F4A8;
  v13[4] = self;
  objc_msgSend(v7, "flatMap:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __51__HFTimerBasedTimeTriggerBuilder_commitEditTrigger__block_invoke_2;
  v12[3] = &unk_1EA726940;
  v12[4] = self;
  objc_msgSend(v9, "flatMap:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __51__HFTimerBasedTimeTriggerBuilder_commitEditTrigger__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRecurrences");
}

uint64_t __51__HFTimerBasedTimeTriggerBuilder_commitEditTrigger__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTimeZone");
}

- (id)_updateRecurrences
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HFTimerBasedTimeTriggerBuilder__updateRecurrences__block_invoke;
  v10[3] = &unk_1EA7268C8;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __52__HFTimerBasedTimeTriggerBuilder__updateRecurrences__block_invoke_2;
  v9[3] = &unk_1EA726338;
  v9[4] = self;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __52__HFTimerBasedTimeTriggerBuilder__updateRecurrences__block_invoke_27;
  v8[3] = &unk_1EA726968;
  v8[4] = self;
  v6 = (id)objc_msgSend(v4, "addFailureBlock:", v8);
  return v4;
}

void __52__HFTimerBasedTimeTriggerBuilder__updateRecurrences__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[HFTimerTriggerCalendarEventAdapter hasWeekdayRecurrenceInRecurrences:](HFTimerTriggerCalendarEventAdapter, "hasWeekdayRecurrenceInRecurrences:", v3);

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "trigger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "recurrences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateRecurrences:completionHandler:", v7, v12);
  }
  else
  {
    objc_msgSend(v5, "recurrences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    objc_msgSend(*(id *)(a1 + 32), "trigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (!v9)
    {
      objc_msgSend(v10, "updateRecurrences:completionHandler:", 0, v12);
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 32), "recurrences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateRecurrence:completionHandler:", v11, v12);

  }
LABEL_7:

}

void __52__HFTimerBasedTimeTriggerBuilder__updateRecurrences__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "recurrences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updated recurrences: %@ for trigger with name: %@", (uint8_t *)&v5, 0x16u);

  }
}

void __52__HFTimerBasedTimeTriggerBuilder__updateRecurrences__block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "recurrences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to update recurrences: %@ for trigger with name: %@. Error: %@", (uint8_t *)&v7, 0x20u);

  }
}

- (id)_updateTimeZone
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__HFTimerBasedTimeTriggerBuilder__updateTimeZone__block_invoke;
  v10[3] = &unk_1EA7268C8;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __49__HFTimerBasedTimeTriggerBuilder__updateTimeZone__block_invoke_2;
  v9[3] = &unk_1EA726338;
  v9[4] = self;
  v5 = (id)objc_msgSend(v4, "addSuccessBlock:", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __49__HFTimerBasedTimeTriggerBuilder__updateTimeZone__block_invoke_29;
  v8[3] = &unk_1EA726968;
  v8[4] = self;
  v6 = (id)objc_msgSend(v4, "addFailureBlock:", v8);
  return v4;
}

void __49__HFTimerBasedTimeTriggerBuilder__updateTimeZone__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "trigger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateTimeZone:completionHandler:", v5, v4);

}

void __49__HFTimerBasedTimeTriggerBuilder__updateTimeZone__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "timeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updated time zone: %@ for trigger with name: %@", (uint8_t *)&v5, 0x16u);

  }
}

void __49__HFTimerBasedTimeTriggerBuilder__updateTimeZone__block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "timeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to update time zone: %@ for trigger with name: %@. Error: %@", (uint8_t *)&v7, 0x20u);

  }
}

- (void)copyCurrentStateFromTriggerBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerBuilder setName:](self, "setName:", v5);

  objc_msgSend(v4, "eventBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTimerBasedTimeTriggerBuilder setEventBuilder:](self, "setEventBuilder:", v6);

  objc_msgSend(v4, "recurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTimerBasedTimeTriggerBuilder setRecurrences:](self, "setRecurrences:", v7);

  objc_msgSend(v4, "timeZone");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HFTimerBasedTimeTriggerBuilder setTimeZone:](self, "setTimeZone:", v8);
}

- (void)triggerEnabledStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  objc_opt_class();
  -[HFTimerBasedTimeTriggerBuilder eventBuilder](self, "eventBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v10 = v6;

  v7 = v10;
  if (v3)
  {
    if (v10)
    {
      -[HFTimerBasedTimeTriggerBuilder recurrences](self, "recurrences");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      v7 = v10;
      if (!v9)
      {
        objc_msgSend(v10, "updateBaseFireDateForTrigger");
        v7 = v10;
      }
    }
  }

}

- (NSArray)recurrences
{
  return self->recurrences;
}

- (void)setRecurrences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (HFTimeEventBuilder)eventBuilder
{
  return self->eventBuilder;
}

- (void)setEventBuilder:(id)a3
{
  objc_storeStrong((id *)&self->eventBuilder, a3);
}

- (NSTimeZone)timeZone
{
  return self->timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->timeZone, 0);
  objc_storeStrong((id *)&self->eventBuilder, 0);
  objc_storeStrong((id *)&self->recurrences, 0);
}

- (id)createNewTriggerBuilder
{
  void *v2;
  void *v3;

  -[HFItemBuilder home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newTimerTriggerBuilder");

  return v3;
}

- (id)updateTriggerBuilder:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFTimerBasedTimeTriggerBuilder;
  -[HFTriggerBuilder updateTriggerBuilder:](&v16, sel_updateTriggerBuilder_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[HFTimerBasedTimeTriggerBuilder timeZone](self, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

    -[HFTimerBasedTimeTriggerBuilder eventBuilder](self, "eventBuilder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFTimerTriggerTimeEventAdapter adapterWithEventBuilder:](HFTimerTriggerTimeEventAdapter, "adapterWithEventBuilder:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFTimerBasedTimeTriggerBuilder recurrences](self, "recurrences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder home](self, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateTriggerBuilder:recurrences:inHome:", v9, v13, v14);

  }
  else
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@:%@ passed a HM trigger builder that isn't a timer trigger builder: %@"), self, v12, v7);
  }

  return v6;
}

@end
