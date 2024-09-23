@implementation FCMoveModeCoordinator

- (FCMoveModeCoordinator)initWithDateProvider:(id)a3 profile:(id)a4 serviceQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCMoveModeCoordinator *v12;
  FCMoveModeCoordinator *v13;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)FCMoveModeCoordinator;
  v12 = -[FCMoveModeCoordinator init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dateProvider, a3);
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v13->_serviceQueue, a5);
    WeakRetained = objc_loadWeakRetained((id *)&v13->_profile);
    objc_msgSend(WeakRetained, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addProtectedDataObserver:queue:", v13, v13->_serviceQueue);

    v16 = objc_loadWeakRetained((id *)&v13->_profile);
    objc_msgSend(v16, "registerProfileReadyObserver:queue:", v13, v13->_serviceQueue);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v13, sel__userCharacteristicsDidChange, *MEMORY[0x1E0D29370], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v13, sel__significantTimeChangeOccurred, *MEMORY[0x1E0C99690], 0);

    v19 = objc_loadWeakRetained((id *)&v13->_profile);
    objc_msgSend(v19, "dataManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6978], "activityMoveModeChangeType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:forDataType:", v13, v21);

  }
  return v13;
}

- (void)notificationPosted:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v5, "notificationType"))
  {
    case 0:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_FAULT))
        -[FCMoveModeCoordinator notificationPosted:error:].cold.1();
      break;
    case 1:
      -[FCMoveModeCoordinator _setUpgradeToMoveTimeNotificationDate:](self, "_setUpgradeToMoveTimeNotificationDate:", v6);
      break;
    case 2:
      -[FCMoveModeCoordinator _setLastGraduationNotificationDate:](self, "_setLastGraduationNotificationDate:", v6);
      break;
    case 3:
      -[FCMoveModeCoordinator _setLastGraduationNotificationDate:](self, "_setLastGraduationNotificationDate:", v6);
      v7 = objc_msgSend(v5, "nextActivityMoveMode");
      objc_msgSend(v5, "nextActivityMoveModeStartDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCMoveModeCoordinator _saveMoveModeChangeSampleForActivityMoveMode:date:](self, "_saveMoveModeChangeSampleForActivityMoveMode:date:", v7, v8);

      break;
    case 4:
    case 5:
      -[FCMoveModeCoordinator _setLastModeChangeNotificationDate:](self, "_setLastModeChangeNotificationDate:", v6);
      break;
    case 6:
      v9 = objc_msgSend(v5, "nextActivityMoveMode");
      objc_msgSend(v5, "nextActivityMoveModeStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCMoveModeCoordinator _saveMoveModeChangeSampleForActivityMoveMode:date:](self, "_saveMoveModeChangeSampleForActivityMoveMode:date:", v9, v10);

      -[FCMoveModeCoordinator _setLastWheelchairModeChangeNotificationDate:](self, "_setLastWheelchairModeChangeNotificationDate:", v6);
      break;
    default:
      break;
  }

}

- (void)dealloc
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeProtectedDataObserver:", self);

  v6 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v6, "dataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "activityMoveModeChangeType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:forDataType:", self, v8);

  v9.receiver = self;
  v9.super_class = (Class)FCMoveModeCoordinator;
  -[FCMoveModeCoordinator dealloc](&v9, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProtectedDataAvailable");

  if (v5)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CC30F000, v6, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator received daemon ready and protected data is available; scheduling notification if needed",
        v7,
        2u);
    }
    -[FCMoveModeCoordinator _queue_scheduleNotificationIfNeeded](self, "_queue_scheduleNotificationIfNeeded");
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  NSObject *v5;
  uint8_t v6[16];

  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CC30F000, v5, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator protected data did become available; scheduling notification if needed",
      v6,
      2u);
  }
  -[FCMoveModeCoordinator _queue_scheduleNotificationIfNeeded](self, "_queue_scheduleNotificationIfNeeded");
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  NSObject *v5;
  NSObject *serviceQueue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC30F000, v5, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator received new activity move mode change sample", buf, 2u);
  }
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FCMoveModeCoordinator_samplesAdded_anchor___block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __45__FCMoveModeCoordinator_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleNotificationIfNeeded");
}

- (BOOL)_queue_loadBirthDateComponents
{
  BOOL v3;
  void *v4;
  id WeakRetained;
  void *v6;
  NSDateComponents *v7;
  id v8;
  NSDateComponents *birthDateComponents;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  if (self->_birthDateComponents)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "userCharacteristicForType:error:", v4, &v18);
  v7 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  v8 = v18;

  v3 = v7 != 0;
  if (v7)
  {
    birthDateComponents = self->_birthDateComponents;
    self->_birthDateComponents = v7;
    v7 = birthDateComponents;
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCMoveModeCoordinator _queue_loadBirthDateComponents].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }

  return v3;
}

- (BOOL)_queue_loadMoveModeChangeSample
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6978], "activityMoveModeChangeType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForStartDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D29558];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v6, "entityEnumeratorWithType:profile:", v3, WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29360], objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOrderingTerms:", v10);

  objc_msgSend(v8, "setPredicate:", v5);
  objc_msgSend(v8, "setLimitCount:", 1);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v21[4] = &v23;
  v22 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__FCMoveModeCoordinator__queue_loadMoveModeChangeSample__block_invoke;
  v21[3] = &unk_1E88007C0;
  v11 = objc_msgSend(v8, "enumerateWithError:handler:", &v22, v21);
  v12 = v22;
  if (!v12)
    v11 = 1;
  if ((v11 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_mostRecentActivityMoveModeChangeSample, (id)v24[5]);
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCMoveModeCoordinator _queue_loadMoveModeChangeSample].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
  }

  _Block_object_dispose(&v23, 8);
  return v11;
}

uint64_t __56__FCMoveModeCoordinator__queue_loadMoveModeChangeSample__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

- (void)_saveMoveModeChangeSampleForActivityMoveMode:(int64_t)a3 date:(id)a4
{
  FCCDateProvider *dateProvider;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  dateProvider = self->_dateProvider;
  v6 = a4;
  -[FCCDateProvider coachingCalendar](dateProvider, "coachingCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_startOfDateByAddingDays:toDate:", 1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "components:fromDate:", *MEMORY[0x1E0CB73B0], v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  FIActivityMoveModeChangeSampleForDateComponents();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertDataObjects:error:", v13, 0);

}

- (BOOL)_queue_loadWheelchairUse
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *MEMORY[0x1E0CB49E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "userCharacteristicsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v5, "userCharacteristicForType:error:", v3, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;

  if (v7)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCMoveModeCoordinator _queue_loadWheelchairUse].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v15 = objc_msgSend(v6, "integerValue");
    if (v15 >= 2)
    {
      if (v15 == 2)
        self->_isWheelchairUser = 1;
    }
    else
    {
      self->_isWheelchairUser = 0;
    }
  }

  return v7 == 0;
}

- (void)_queue_scheduleNotificationIfNeeded
{
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  double v10;
  void *v11;
  NSObject *v12;
  id WeakRetained;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  v3 = -[FCMoveModeCoordinator _queue_loadBirthDateComponents](self, "_queue_loadBirthDateComponents");
  v4 = -[FCMoveModeCoordinator _queue_loadMoveModeChangeSample](self, "_queue_loadMoveModeChangeSample");
  v5 = -[FCMoveModeCoordinator _queue_loadWheelchairUse](self, "_queue_loadWheelchairUse");
  if (v3 && v4 && v5)
  {
    v6 = -[FCMoveModeCoordinator _queue_determineActivityMoveModeNotificationType](self, "_queue_determineActivityMoveModeNotificationType");
    if (v6)
    {
      v7 = v6;
      v8 = -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:](self, "_nextActivityMoveModeForNotificationType:", v6);
      -[FCMoveModeCoordinator _nextActivityMoveModeStartDateForNotificationType:](self, "_nextActivityMoveModeStartDateForNotificationType:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCMoveModeCoordinator _delay](self, "_delay");
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D22150]), "initWithNotificationType:nextActivityMoveMode:nextActivityMoveModeStartDate:delay:", v7, v8, v9, v10);
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5298];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1CC30F000, v12, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator scheduling notification %@", (uint8_t *)&v15, 0xCu);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "coordinator:postMoveModeNotification:", self, v11);

    }
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5298];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1CC30F000, v14, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator failed to load data", (uint8_t *)&v15, 2u);
    }
  }
}

- (int64_t)_queue_determineActivityMoveModeNotificationType
{
  void *v3;
  void *v4;
  uint64_t v5;
  os_log_t *v6;
  unint64_t v7;
  HKCategorySample *mostRecentActivityMoveModeChangeSample;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  int v23;
  _BOOL4 v25;
  NSObject *v26;
  const __CFString *v27;
  int64_t v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  NSObject *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  _BOOL4 v43;
  int v44;
  uint64_t v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = FIAgeInYearsForDateOfBirthComponentsWithCurrentDateAndCalendar();
  v6 = (os_log_t *)MEMORY[0x1E0CB5298];
  if (!v5)
  {
    _HKInitializeLogging();
    v21 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      v22 = "FCMoveModeCoordinator - age unknown for move mode notification";
LABEL_64:
      _os_log_impl(&dword_1CC30F000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v44, 2u);
    }
LABEL_65:
    v28 = 0;
    goto LABEL_78;
  }
  v7 = v5;
  mostRecentActivityMoveModeChangeSample = self->_mostRecentActivityMoveModeChangeSample;
  if (!mostRecentActivityMoveModeChangeSample)
  {
    v23 = 0;
    v9 = 1;
    goto LABEL_34;
  }
  v9 = -[HKCategorySample value](mostRecentActivityMoveModeChangeSample, "value");
  -[HKCategorySample startDate](self->_mostRecentActivityMoveModeChangeSample, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");

  _HKActivityCacheDateComponentsFromCacheIndex();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCMoveModeCoordinator _lastModeChangeNotificationDate](self, "_lastModeChangeNotificationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v14 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v44 = 138543618;
    v45 = (uint64_t)v12;
    v46 = 2114;
    v47 = (unint64_t)v13;
    _os_log_impl(&dword_1CC30F000, v14, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - mostRecentMoveModeChangeDate (%{public}@) lastChangeNotificationDate (%{public}@)", (uint8_t *)&v44, 0x16u);
  }
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v16 = v15;
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  if (v16 <= v17)
  {

    if (v9 == 2)
    {
      if (self->_isWheelchairUser)
      {
        -[FCMoveModeCoordinator _lastWheelchairModeChangeNotificationDate](self, "_lastWheelchairModeChangeNotificationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18 || !objc_msgSend(v4, "isDateInToday:", v18))
        {
          _HKInitializeLogging();
          v29 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v44) = 0;
            _os_log_impl(&dword_1CC30F000, v29, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user switched to wheelchair mode and needs a move mode change notification", (uint8_t *)&v44, 2u);
          }
          v28 = 6;
          goto LABEL_77;
        }
        _HKInitializeLogging();
        v19 = *v6;
        if (!os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
LABEL_57:
          v28 = 0;
LABEL_77:

          goto LABEL_78;
        }
        v44 = 138543362;
        v45 = (uint64_t)v18;
        v20 = "FCMoveModeCoordinator - user switched to wheelchair mode but has already been notified about mode change (%{public}@)";
LABEL_56:
        _os_log_impl(&dword_1CC30F000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v44, 0xCu);
        goto LABEL_57;
      }
      v23 = 1;
      v9 = 2;
    }
    else
    {
      v23 = 0;
    }
LABEL_34:
    _HKInitializeLogging();
    v30 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v44 = 134218240;
      v45 = v9;
      v46 = 2048;
      v47 = v7;
      _os_log_impl(&dword_1CC30F000, v30, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - activityMoveModeForToday (%ld) ageInYears (%lu)", (uint8_t *)&v44, 0x16u);
    }
    if (v7 <= *MEMORY[0x1E0D217A8])
      v31 = v23;
    else
      v31 = 0;
    if ((v7 <= *MEMORY[0x1E0D217A8] || v9 == 2) && v31 == 0)
    {
      if (v7 == 17 || v7 == 13)
      {
        _HKInitializeLogging();
        v34 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v44) = 0;
          _os_log_impl(&dword_1CC30F000, v34, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user is in activity move mode graduation year", (uint8_t *)&v44, 2u);
        }
        -[FCMoveModeCoordinator _lastGraduationNotificationDate](self, "_lastGraduationNotificationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18 || !objc_msgSend(v4, "hk_isDate:withinNumberOfCalendarDays:ofDate:", v18, 366, v3))
        {
          if (v7 == 17)
          {
            -[FCMoveModeCoordinator _birthdayForAge:](self, "_birthdayForAge:", 18);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCMoveModeCoordinator _tuesdayBeforeDate:](self, "_tuesdayBeforeDate:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = CFSTR("a mandatory");
            v28 = 3;
            v38 = CFSTR("before");
          }
          else
          {
            -[FCMoveModeCoordinator _birthdayForAge:](self, "_birthdayForAge:", 13);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCMoveModeCoordinator _tuesdayAfterDate:](self, "_tuesdayAfterDate:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = CFSTR("an");
            v28 = 2;
            v38 = CFSTR("after");
          }

          _HKInitializeLogging();
          v39 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            v44 = 138543362;
            v45 = (uint64_t)v36;
            _os_log_impl(&dword_1CC30F000, v39, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - expected notificationDate (%{public}@)", (uint8_t *)&v44, 0xCu);
          }
          if (v36 && objc_msgSend(v3, "hk_isBeforeDate:", v36))
          {
            _HKInitializeLogging();
            v40 = *v6;
            if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
            {
              v44 = 138543362;
              v45 = (uint64_t)v38;
              _os_log_impl(&dword_1CC30F000, v40, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - not enough days %{public}@ birthday to notify about activity move mode graduation", (uint8_t *)&v44, 0xCu);
            }
            v28 = 0;
          }
          else
          {
            _HKInitializeLogging();
            v41 = *v6;
            if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
            {
              v44 = 138543362;
              v45 = (uint64_t)v37;
              _os_log_impl(&dword_1CC30F000, v41, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user needs a notification about %{public}@ activity move mode graduation", (uint8_t *)&v44, 0xCu);
            }
          }

          goto LABEL_77;
        }
        _HKInitializeLogging();
        v19 = *v6;
        if (!os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_57;
        v44 = 138543362;
        v45 = (uint64_t)v18;
        v20 = "FCMoveModeCoordinator - user has already been notified for move mode for this graduation year (%{public}@)";
        goto LABEL_56;
      }
      if (v7 <= *MEMORY[0x1E0D217A8] && !self->_isWheelchairUser)
      {
        -[FCMoveModeCoordinator _upgradeToMoveTimeNotificationDate](self, "_upgradeToMoveTimeNotificationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        v19 = *v6;
        v43 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
        if (!v18)
        {
          if (v43)
          {
            LOWORD(v44) = 0;
            _os_log_impl(&dword_1CC30F000, v19, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user is an upgrade user and needs to be notified to upgrade to move time", (uint8_t *)&v44, 2u);
          }
          v28 = 1;
          goto LABEL_77;
        }
        if (!v43)
          goto LABEL_57;
        v44 = 138543362;
        v45 = (uint64_t)v18;
        v20 = "FCMoveModeCoordinator - user is an upgrade to move time user but has already been notified (%{public}@)";
        goto LABEL_56;
      }
      _HKInitializeLogging();
      v21 = *v6;
      if (!os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_65;
      LOWORD(v44) = 0;
      v22 = "FCMoveModeCoordinator - user does not need to be notified";
      goto LABEL_64;
    }
    _HKInitializeLogging();
    v21 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      v22 = "FCMoveModeCoordinator - user activity move mode and age in combination that doesn't require any notifying";
      goto LABEL_64;
    }
    goto LABEL_65;
  }
  v25 = v7 > 0x11 && v9 == 1;
  _HKInitializeLogging();
  v26 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v27 = &stru_1E8800BC0;
    if (v25)
      v27 = CFSTR("mandatory ");
    v44 = 138543362;
    v45 = (uint64_t)v27;
    _os_log_impl(&dword_1CC30F000, v26, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator - user needs a %{public}@move mode change notification", (uint8_t *)&v44, 0xCu);
  }
  if (v25)
    v28 = 5;
  else
    v28 = 4;

LABEL_78:
  return v28;
}

- (int64_t)_nextActivityMoveModeForNotificationType:(int64_t)a3
{
  int64_t result;
  HKCategorySample *mostRecentActivityMoveModeChangeSample;

  result = 2;
  switch(a3)
  {
    case 0:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_FAULT))
        -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:].cold.2();
      goto LABEL_7;
    case 1:
      return result;
    case 2:
    case 3:
    case 5:
    case 6:
      goto LABEL_2;
    case 4:
      mostRecentActivityMoveModeChangeSample = self->_mostRecentActivityMoveModeChangeSample;
      if (mostRecentActivityMoveModeChangeSample)
        result = -[HKCategorySample value](mostRecentActivityMoveModeChangeSample, "value");
      else
LABEL_2:
        result = 1;
      break;
    default:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_FAULT))
        -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:].cold.1();
LABEL_7:
      result = 0;
      break;
  }
  return result;
}

- (id)_nextActivityMoveModeStartDateForNotificationType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = 0;
  switch(a3)
  {
    case 0:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_FAULT))
        -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:].cold.2();
      goto LABEL_6;
    case 1:
    case 2:
    case 4:
    case 5:
      return v4;
    case 3:
      -[FCMoveModeCoordinator _birthdayForAge:](self, "_birthdayForAge:", 18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startOfDayForDate:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hk_startOfDateByAddingDays:toDate:", 1, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "laterDate:", v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 6:
      -[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCDateProvider coachingDate](self->_dateProvider, "coachingDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "hk_startOfDateByAddingDays:toDate:", 1, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      break;
    default:
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_FAULT))
        -[FCMoveModeCoordinator _nextActivityMoveModeForNotificationType:].cold.1();
LABEL_6:
      v4 = 0;
      break;
  }
  return v4;
}

- (double)_delay
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("FCMoveModeCoordinatorNotificationDelayOverrideKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 600.0;
  }

  return v5;
}

- (void)_userCharacteristicsDidChange
{
  NSObject *v3;
  NSObject *serviceQueue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC30F000, v3, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator received user characteristics change notification", buf, 2u);
  }
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__FCMoveModeCoordinator__userCharacteristicsDidChange__block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __54__FCMoveModeCoordinator__userCharacteristicsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleNotificationIfNeeded");
}

- (void)_significantTimeChangeOccurred
{
  NSObject *v3;
  NSObject *serviceQueue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5298];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CC30F000, v3, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator\x1B did receive significant time change notification", buf, 2u);
  }
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FCMoveModeCoordinator__significantTimeChangeOccurred__block_invoke;
  block[3] = &unk_1E8800798;
  block[4] = self;
  dispatch_async(serviceQueue, block);
}

uint64_t __55__FCMoveModeCoordinator__significantTimeChangeOccurred__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleNotificationIfNeeded");
}

- (id)_lastGraduationNotificationDate
{
  return -[FCMoveModeCoordinator _dateForKey:](self, "_dateForKey:", CFSTR("lastGraduationAlertDate"));
}

- (void)_setLastGraduationNotificationDate:(id)a3
{
  -[FCMoveModeCoordinator _setDate:forKey:](self, "_setDate:forKey:", a3, CFSTR("lastGraduationAlertDate"));
}

- (id)_upgradeToMoveTimeNotificationDate
{
  return -[FCMoveModeCoordinator _dateForKey:](self, "_dateForKey:", CFSTR("upgradeToMoveTimeAlertDate"));
}

- (void)_setUpgradeToMoveTimeNotificationDate:(id)a3
{
  -[FCMoveModeCoordinator _setDate:forKey:](self, "_setDate:forKey:", a3, CFSTR("upgradeToMoveTimeAlertDate"));
}

- (id)_lastModeChangeNotificationDate
{
  return -[FCMoveModeCoordinator _dateForKey:](self, "_dateForKey:", CFSTR("lastModeChangeAlertDate"));
}

- (void)_setLastModeChangeNotificationDate:(id)a3
{
  -[FCMoveModeCoordinator _setDate:forKey:](self, "_setDate:forKey:", a3, CFSTR("lastModeChangeAlertDate"));
}

- (id)_lastWheelchairModeChangeNotificationDate
{
  return -[FCMoveModeCoordinator _dateForKey:](self, "_dateForKey:", CFSTR("lastWheelchairModeChangeAlertDate"));
}

- (void)_setLastWheelchairModeChangeNotificationDate:(id)a3
{
  -[FCMoveModeCoordinator _setDate:forKey:](self, "_setDate:forKey:", a3, CFSTR("lastWheelchairModeChangeAlertDate"));
}

- (id)_dateForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  v4 = a3;
  -[FCMoveModeCoordinator keyValueDomain](self, "keyValueDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v5, "dateForKey:error:", v4, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5298], OS_LOG_TYPE_ERROR))
      -[FCMoveModeCoordinator _dateForKey:].cold.1();
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (void)_setDate:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FCMoveModeCoordinator keyValueDomain](self, "keyValueDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v8, "setDate:forKey:error:", v6, v7, &v12);
  v9 = v12;
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5298];
  v11 = *MEMORY[0x1E0CB5298];
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FCMoveModeCoordinator _setDate:forKey:].cold.1();
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1CC30F000, v10, OS_LOG_TYPE_DEFAULT, "FCMoveModeCoordinator successfully saved data to key value domain for key %{public}@ date: %{public}@", buf, 0x16u);
  }

}

- (id)keyValueDomain
{
  HDKeyValueDomain *keyValueDomain;
  id v4;
  id WeakRetained;
  HDKeyValueDomain *v6;
  HDKeyValueDomain *v7;

  keyValueDomain = self->_keyValueDomain;
  if (!keyValueDomain)
  {
    v4 = objc_alloc(MEMORY[0x1E0D294B8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v6 = (HDKeyValueDomain *)objc_msgSend(v4, "initWithCategory:domainName:profile:", 1, CFSTR("com.apple.nanolifestyle.coaching.activityMoveMode"), WeakRetained);
    v7 = self->_keyValueDomain;
    self->_keyValueDomain = v6;

    keyValueDomain = self->_keyValueDomain;
  }
  return keyValueDomain;
}

- (id)_dateByAddingNumberOfWeeks:(int64_t)a3 toDate:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0C99D78];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  -[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCalendar:", v9);

  objc_msgSend(v8, "setWeekOfMonth:", 1);
  objc_msgSend(v8, "hk_dateByAddingInterval:toDate:", a3, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_tuesdayBeforeDate:(id)a3
{
  FCCDateProvider *dateProvider;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  dateProvider = self->_dateProvider;
  v5 = a3;
  -[FCCDateProvider coachingCalendar](dateProvider, "coachingCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", 3, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isDate:inSameDayAsDate:", v5, v7);

  if (v8)
  {
    -[FCMoveModeCoordinator _dateByAddingNumberOfWeeks:toDate:](self, "_dateByAddingNumberOfWeeks:toDate:", -1, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }

  return v7;
}

- (id)_tuesdayAfterDate:(id)a3
{
  FCCDateProvider *dateProvider;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  dateProvider = self->_dateProvider;
  v5 = a3;
  -[FCCDateProvider coachingCalendar](dateProvider, "coachingCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", 3, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCMoveModeCoordinator _dateByAddingNumberOfWeeks:toDate:](self, "_dateByAddingNumberOfWeeks:toDate:", 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_birthdayForAge:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  -[FCCDateProvider coachingCalendar](self->_dateProvider, "coachingCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v6);

  objc_msgSend(v5, "setYear:", 1);
  -[NSDateComponents date](self->_birthDateComponents, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateByAddingInterval:toDate:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setBirthDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_birthDateComponents, a3);
}

- (void)_setMostRecentActivityMoveModeChangeSample:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentActivityMoveModeChangeSample, a3);
}

- (void)_setisWheelchairUser:(BOOL)a3
{
  self->_isWheelchairUser = a3;
}

- (FCMoveModeCoordinatorDelegate)delegate
{
  return (FCMoveModeCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_mostRecentActivityMoveModeChangeSample, 0);
  objc_storeStrong((id *)&self->_birthDateComponents, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)notificationPosted:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1CC30F000, v0, v1, "FCMoveModeCoordinator - attempted to process notification request with undefined notification type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_loadBirthDateComponents
{
  OUTLINED_FUNCTION_0(&dword_1CC30F000, a2, a3, "FCMoveModeCoordinator failed to get date of birth: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_queue_loadMoveModeChangeSample
{
  OUTLINED_FUNCTION_0(&dword_1CC30F000, a2, a3, "FCMoveModeCoordinator failed to load most recent activity move mode change sample: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_queue_loadWheelchairUse
{
  OUTLINED_FUNCTION_0(&dword_1CC30F000, a2, a3, "FCMoveModeCoordinator failed to get wheelchair use: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_nextActivityMoveModeForNotificationType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1CC30F000, v0, v1, "FCMoveModeCoordinator attempted to present with unknown notification type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_nextActivityMoveModeForNotificationType:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1CC30F000, v0, v1, "FCMoveModeCoordinator attempted to present with undefined notification type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_dateForKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CC30F000, v0, v1, "FCMoveModeCoordinator failed to read data from key value domain for key %{public}@. Error: %{public}@");
  OUTLINED_FUNCTION_3();
}

- (void)_setDate:forKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CC30F000, v0, v1, "FCMoveModeCoordinator failed to save data to value domain for key %{public}@. Error: %{public}@");
  OUTLINED_FUNCTION_3();
}

@end
