@implementation HFTimerTriggerSignificantTimeEventAdapter

- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  HFTimerTriggerSignificantTimeEventAdapter *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  HFTimerTriggerSignificantTimeEventAdapter *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  HFTimerTriggerSignificantTimeEventAdapter *v32;
  id v33;

  v7 = a3;
  v8 = a5;
  -[HFTimerTriggerTimeEventAdapter eventBuilder](self, "eventBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performValidation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke;
  v30[3] = &unk_1EA730990;
  v12 = v7;
  v31 = v12;
  v32 = self;
  v13 = v8;
  v33 = v13;
  objc_msgSend(v10, "flatMap:", v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_2;
  v26[3] = &unk_1EA72CB18;
  v15 = v12;
  v27 = v15;
  v28 = self;
  v16 = v13;
  v29 = v16;
  v17 = (id)objc_msgSend(v14, "addSuccessBlock:", v26);
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_32;
  v22[3] = &unk_1EA72CAF0;
  v23 = v15;
  v24 = self;
  v25 = v16;
  v18 = v16;
  v19 = v15;
  v20 = (id)objc_msgSend(v14, "addFailureBlock:", v22);

  return v14;
}

id __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0CBA910]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "eventBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "eventBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "significantEventOffset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithName:significantEvent:significantEventOffset:recurrences:", v3, v5, v7, *(_QWORD *)(a1 + 48));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_2(uint64_t a1)
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
    objc_msgSend(v4, "significantEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Created significant event trigger with name:%@ significant eventBuilder:%@ recurrence:%@", (uint8_t *)&v7, 0x20u);

  }
}

void __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_32(uint64_t a1, void *a2)
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
    objc_msgSend(v6, "significantEvent");
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
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to create significant event trigger with name:%@ significant eventBuilder:%@ recurrence:%@. Error: %@", (uint8_t *)&v9, 0x2Au);

  }
}

- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v12 = a3;
  -[HFTimerTriggerTimeEventAdapter eventBuilder](self, "eventBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "significantEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSignificantEvent:", v9);

  -[HFTimerTriggerTimeEventAdapter eventBuilder](self, "eventBuilder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "significantEventOffset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSignificantEventOffset:", v11);

  objc_msgSend(v12, "setRecurrences:", v7);
}

- (id)updateTrigger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  _QWORD v20[4];
  id v21;
  HFTimerTriggerSignificantTimeEventAdapter *v22;
  _QWORD v23[4];
  id v24;
  HFTimerTriggerSignificantTimeEventAdapter *v25;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke;
  v23[3] = &unk_1EA728590;
  v7 = v4;
  v24 = v7;
  v25 = self;
  objc_msgSend(v5, "futureWithErrorOnlyHandlerAdapterBlock:", v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_2;
  v20[3] = &unk_1EA732620;
  v9 = v7;
  v21 = v9;
  v22 = self;
  objc_msgSend(v8, "flatMap:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_4;
  v18[3] = &unk_1EA72CB68;
  v18[4] = self;
  v11 = v9;
  v19 = v11;
  v12 = (id)objc_msgSend(v10, "addSuccessBlock:", v18);
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_35;
  v16[3] = &unk_1EA726360;
  v16[4] = self;
  v17 = v11;
  v13 = v11;
  v14 = (id)objc_msgSend(v10, "addFailureBlock:", v16);

  return v10;
}

void __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "eventBuilder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSignificantEvent:completionHandler:", v5, v4);

}

id __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_3;
  v7[3] = &unk_1EA728590;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  objc_msgSend(v2, "futureWithErrorOnlyHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "eventBuilder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "significantEventOffset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateSignificantEventOffset:completionHandler:", v5, v4);

}

void __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_4(uint64_t a1)
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
    objc_msgSend(v3, "significantEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEFAULT, "Updated significant event: %@ for trigger with name: %@", (uint8_t *)&v6, 0x16u);

  }
}

void __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_35(uint64_t a1, void *a2)
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
    objc_msgSend(v5, "significantEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Failed to update significant event: %@ for trigger with name: %@. Error: %@", (uint8_t *)&v8, 0x20u);

  }
}

@end
