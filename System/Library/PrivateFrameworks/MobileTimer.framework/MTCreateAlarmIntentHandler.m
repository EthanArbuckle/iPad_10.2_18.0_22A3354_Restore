@implementation MTCreateAlarmIntentHandler

- (void)resolveLabelForMTCreateAlarm:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, uint64_t);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v11, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  v8 = (void *)MEMORY[0x1E0CBDC40];
  if (v7)
  {
    objc_msgSend(v11, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "successWithResolvedString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, v10);

    v5 = (void (**)(id, uint64_t))v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBDC40], "notRequired");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, (uint64_t)v9);
  }

}

- (void)resolveDateComponentsForMTCreateAlarm:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, void *);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v5 = (void (**)(id, void *))a4;
  objc_msgSend(v23, "time");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v23, "dateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v23, "time");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v14, "setCalendar:", v13);
      objc_msgSend(v14, "setHour:", objc_msgSend(v13, "component:fromDate:", 32, v12));
      objc_msgSend(v14, "setMinute:", objc_msgSend(v13, "component:fromDate:", 64, v12));
      objc_msgSend(v23, "setDateComponents:", v14);

    }
  }
  objc_msgSend(v23, "dateComponents");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v23, "dateComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "hour") == 0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      objc_msgSend(v23, "dateComponents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "minute");

      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = (void *)MEMORY[0x1E0CBD868];
        objc_msgSend(v23, "dateComponents");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "successWithResolvedDateComponents:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v5[2](v5, v22);

        goto LABEL_9;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CBD868], "needsValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v20);
LABEL_9:

}

- (void)resolveRepeatScheduleForMTCreateAlarm:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v5, "repeatSchedule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v5, "repeatSchedule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, v10);
  }
  else
  {
    +[MTIntentRepeatDayResolutionResult notRequired](MTIntentRepeatDayResolutionResult, "notRequired");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12);

  }
}

id __83__MTCreateAlarmIntentHandler_resolveRepeatScheduleForMTCreateAlarm_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MTIntentRepeatDayResolutionResult successWithResolvedRepeatDay:](MTIntentRepeatDayResolutionResult, "successWithResolvedRepeatDay:", a2);
}

- (id)defaultRepeatScheduleForMTCreateAlarm:(id)a3
{
  return MTRepeatDaysForAlarmRepeatSchedule(0);
}

- (void)provideRepeatScheduleOptionsForMTCreateAlarm:(id)a3 withCompletion:(id)a4
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "firstWeekday") - 1;

  MTRepeatDaysForAlarmRepeatSchedule(127);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= objc_msgSend(v6, "count"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    objc_msgSend(v6, "subarrayWithRange:", v5, objc_msgSend(v6, "count") - v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subarrayWithRange:", 0, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v9, 0);

  }
}

- (void)confirmMTCreateAlarm:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  id v7;
  MTCreateAlarmIntentResponse *v8;
  void *v9;
  MTCreateAlarmIntentResponse *v10;

  v6 = (void (**)(id, id))a4;
  v7 = a3;
  v8 = [MTCreateAlarmIntentResponse alloc];
  -[MTCreateAlarmIntentHandler _alarmUserActivityWithIntent:](self, "_alarmUserActivityWithIntent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MTCreateAlarmIntentResponse initWithCode:userActivity:](v8, "initWithCode:userActivity:", 1, v9);
  v6[2](v6, v10);

}

- (void)handleMTCreateAlarm:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void (**v35)(id, id);
  MTCreateAlarmIntentResponse *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  MTCreateAlarmIntentResponse *v42;
  void *v43;
  void (**v44)(id, id);
  _QWORD v45[5];
  id v46;
  void (**v47)(id, id);
  _QWORD v48[5];
  id v49;
  id v50;
  void (**v51)(id, id);
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  objc_msgSend(v6, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_3;
  }
  objc_msgSend(v6, "dateComponents");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(v6, "dateComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "hour") == 0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      objc_msgSend(v6, "dateComponents");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "minute");

      if (v40 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_3:
        objc_msgSend(v6, "dateComponents", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v6, "dateComponents");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "hour");

          objc_msgSend(v6, "dateComponents");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "minute");
        }
        else
        {
          objc_msgSend(v6, "time");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {
            v13 = 0;
            goto LABEL_11;
          }
          v17 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v6, "time");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v20, "component:fromDate:", 32, v12);
          v13 = objc_msgSend(v20, "component:fromDate:", 64, v12);

        }
LABEL_11:
        v54 = 0u;
        v55 = 0u;
        v53 = 0u;
        v52 = 0u;
        objc_msgSend(v6, "repeatSchedule");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v22)
        {
          v23 = v22;
          v24 = 0;
          v25 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v53 != v25)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "value");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v24 |= objc_msgSend(v27, "integerValue");

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          }
          while (v23);
        }
        else
        {
          v24 = 0;
        }

        +[MTAlarm alarmWithHour:minute:](MTMutableAlarm, "alarmWithHour:minute:", v11, v13);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "label");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setTitle:", v29);

        objc_msgSend(v28, "setRepeatSchedule:", v24);
        v30 = v28;
        -[MTAlarmIntentHandler alarmManager](self, "alarmManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addAlarm:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = MEMORY[0x1E0C809B0];
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __61__MTCreateAlarmIntentHandler_handleMTCreateAlarm_completion___block_invoke;
        v48[3] = &unk_1E39CC320;
        v48[4] = self;
        v34 = v6;
        v49 = v34;
        v50 = v30;
        v7 = v44;
        v35 = v44;
        v51 = v35;
        v36 = (MTCreateAlarmIntentResponse *)v30;
        v37 = (id)objc_msgSend(v32, "addSuccessBlock:", v48);
        v45[0] = v33;
        v45[1] = 3221225472;
        v45[2] = __61__MTCreateAlarmIntentHandler_handleMTCreateAlarm_completion___block_invoke_2;
        v45[3] = &unk_1E39CC348;
        v45[4] = self;
        v46 = v34;
        v47 = v35;
        v38 = (id)objc_msgSend(v32, "addFailureBlock:", v45);

        goto LABEL_25;
      }
    }
  }
  MTLogForCategory(3);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    -[MTCreateAlarmIntentHandler handleMTCreateAlarm:completion:].cold.1((uint64_t)self, v41);

  v42 = [MTCreateAlarmIntentResponse alloc];
  -[MTCreateAlarmIntentHandler _alarmUserActivityWithIntent:](self, "_alarmUserActivityWithIntent:", v6);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[MTCreateAlarmIntentResponse initWithCode:userActivity:](v42, "initWithCode:userActivity:", 5, v43);

  v7[2](v7, v36);
LABEL_25:

}

void __61__MTCreateAlarmIntentHandler_handleMTCreateAlarm_completion___block_invoke(uint64_t a1)
{
  MTCreateAlarmIntentResponse *v2;
  void *v3;
  void *v4;
  MTCreateAlarmIntentResponse *v5;

  v2 = [MTCreateAlarmIntentResponse alloc];
  objc_msgSend(*(id *)(a1 + 32), "_alarmUserActivityWithIntent:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTCreateAlarmIntentResponse initWithCode:userActivity:](v2, "initWithCode:userActivity:", 4, v3);

  objc_msgSend(*(id *)(a1 + 48), "intentAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTCreateAlarmIntentResponse setAlarm:](v5, "setAlarm:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __61__MTCreateAlarmIntentHandler_handleMTCreateAlarm_completion___block_invoke_2(uint64_t a1)
{
  MTCreateAlarmIntentResponse *v2;
  void *v3;
  MTCreateAlarmIntentResponse *v4;

  v2 = [MTCreateAlarmIntentResponse alloc];
  objc_msgSend(*(id *)(a1 + 32), "_alarmUserActivityWithIntent:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MTCreateAlarmIntentResponse initWithCode:userActivity:](v2, "initWithCode:userActivity:", 5, v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)_alarmUserActivityWithIntent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3B10];
  v4 = a3;
  objc_msgSend(v3, "mtUserActivityWithActivityType:", CFSTR("com.apple.clock.alarm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_class();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "createUserInfoWithIntentName:alarmIDString:time:label:", v7, 0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUserInfo:", v11);
  return v5;
}

- (void)handleMTCreateAlarm:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@ createAlarm requested without time", (uint8_t *)&v2, 0xCu);
}

@end
