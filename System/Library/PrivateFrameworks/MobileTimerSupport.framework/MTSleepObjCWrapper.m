@implementation MTSleepObjCWrapper

+ (void)turnNextSleepAlarmEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = a4;
  v6 = objc_alloc((Class)getHKSPSleepStoreClass());
  v7 = objc_alloc_init((Class)getHKHealthStoreClass());
  v9 = (id)objc_msgSend(v6, "initWithHealthStore:", v7);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUpcomingWakeUpAlarmEnabled:date:completion:", v4, v8, v5);

}

+ (void)toggleNextSleepAlarmWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD, id);
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  id v12;
  uint64_t v13;

  v3 = (void (**)(id, _QWORD, id))a3;
  v4 = objc_alloc((Class)getHKSPSleepStoreClass());
  v5 = objc_alloc_init((Class)getHKHealthStoreClass());
  v6 = (void *)objc_msgSend(v4, "initWithHealthStore:", v5);

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = (id)objc_msgSend(v6, "upcomingScheduleOccurrenceAfterDate:alarmStatus:error:", v7, &v13, &v12);
  v9 = v12;

  if (v9)
  {
    v3[2](v3, 0, v9);
  }
  else
  {
    v10 = v13 == 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUpcomingWakeUpAlarmEnabled:date:completion:", v10, v11, v3);

  }
}

@end
