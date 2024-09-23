@implementation NSDate(CalendarAdditions)

- (id)dateForEndOfDayInTimeZone:()CalendarAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  objc_msgSend(a1, "dateForStartOfDayInTimeZone:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isEqual:", v5))
  {
    v6 = a1;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setDay:", 1);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    v21 = 0;
    _EKSharedGregorianCalendarLock();
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__NSDate_CalendarAdditions__dateForEndOfDayInTimeZone___block_invoke;
    block[3] = &unk_1E2A84418;
    block[4] = a1;
    v15 = &v16;
    v12 = v4;
    v13 = v7;
    v14 = v5;
    v9 = v7;
    dispatch_sync(v8, block);

    v6 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

  }
  return v6;
}

- (uint64_t)dateForStartOfDayInTimeZone:()CalendarAdditions
{
  return objc_msgSend(a1, "dateAtHour:minute:second:inTimeZone:", 0, 0, 0, a3);
}

- (id)dateAtHour:()CalendarAdditions minute:second:inTimeZone:
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v10 = a6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  _EKSharedGregorianCalendarLock();
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__NSDate_CalendarAdditions__dateAtHour_minute_second_inTimeZone___block_invoke;
  v15[3] = &unk_1E2A84440;
  v15[4] = a1;
  v16 = v10;
  v19 = a4;
  v20 = a5;
  v17 = &v21;
  v18 = a3;
  v12 = v10;
  dispatch_sync(v11, v15);

  v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)dateWithoutTimeComponentsInTimeZone:()CalendarAdditions
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__NSDate_CalendarAdditions__dateWithoutTimeComponentsInTimeZone___block_invoke;
  v7[3] = &unk_1E2A84468;
  v7[4] = a1;
  v7[5] = &v8;
  objc_msgSend(a1, "_performBlockBehindDispatchSync:inTimeZone:", v7, v4);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_performBlockBehindDispatchSync:()CalendarAdditions inTimeZone:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  _EKSharedGregorianCalendarLock();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__NSDate_CalendarAdditions___performBlockBehindDispatchSync_inTimeZone___block_invoke;
  block[3] = &unk_1E2A84490;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_sync(v7, block);

}

@end
