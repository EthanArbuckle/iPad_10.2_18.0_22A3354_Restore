@implementation HDDemoDataManager

- (HDDemoDataManager)initWithProfile:(id)a3
{
  id v4;
  HDDemoDataManager *v5;
  HDDemoDataManager *v6;
  uint64_t v7;
  OS_dispatch_queue *demoDataQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataManager;
  v5 = -[HDDemoDataManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialUtilityDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    demoDataQueue = v6->_demoDataQueue;
    v6->_demoDataQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v6, v6->_demoDataQueue);
  }

  return v6;
}

- (void)_queue_generateDemoDataIfNeeded
{
  HDDemoDataGenerator *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CFAbsoluteTime Current;
  void *v15;
  NSObject *v16;
  _QWORD v17[6];
  uint8_t buf[16];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if ((objc_msgSend(MEMORY[0x1E0CB6F50], "shouldGenerateDemoData") & 1) != 0)
    {
      if (!*(_QWORD *)(a1 + 24))
      {
        v2 = [HDDemoDataGenerator alloc];
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        v4 = -[HDDemoDataGenerator initWithProfile:queue:](v2, "initWithProfile:queue:", WeakRetained, *(_QWORD *)(a1 + 8));
        v5 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v4;

        objc_msgSend(*(id *)(a1 + 24), "configuration");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDDemoDataPerson defaultPersonWithBiologicalSex:](HDDemoDataPerson, "defaultPersonWithBiologicalSex:", objc_msgSend(v6, "biologicalSex"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 24), "gregorianCalendar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "birthDateComponents");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dateFromComponents:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setBirthDate:", v10);

        objc_msgSend(v7, "setNutritionTrackingType:", objc_msgSend(v6, "nutritionTrackingType"));
        objc_msgSend(v7, "setResultsTrackingType:", objc_msgSend(v6, "resultsTrackingType"));
        objc_msgSend(v7, "applyProfileType:", objc_msgSend(v6, "profileType"));
        objc_msgSend(v7, "setHighFidelityGeneration:", objc_msgSend(v6, "highFidelityGeneration"));
        objc_msgSend(*(id *)(a1 + 24), "setDemoPerson:", v7);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0CB6F18], "runningInStoreDemoModeF201"))
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hk_startOfDateByAddingDays:toDate:", 1, v11);
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v13;
      }
      Current = CFAbsoluteTimeGetCurrent();
      v15 = *(void **)(a1 + 24);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__HDDemoDataManager__queue_generateDemoDataIfNeeded__block_invoke;
      v17[3] = &unk_1E6D0A128;
      *(CFAbsoluteTime *)&v17[5] = Current;
      v17[4] = a1;
      objc_msgSend(v15, "generateThroughEndDate:completion:", v11, v17);

    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB52C8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "Not generating demo data", buf, 2u);
      }
    }
  }
}

void __52__HDDemoDataManager__queue_generateDemoDataIfNeeded__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  double Current;
  double v9;
  double v10;
  void *v11;
  char v12;
  dispatch_time_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  double v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  if ((a2 & 1) != 0)
  {
    v9 = Current;
    v10 = *(double *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAppleWatch");

    if ((v12 & 1) == 0)
    {
      objc_initWeak(location, *(id *)(a1 + 32));
      v13 = dispatch_time(0, 3600000000000);
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__HDDemoDataManager__queue_generateDemoDataIfNeeded__block_invoke_188;
      block[3] = &unk_1E6CECE78;
      objc_copyWeak(&v22, location);
      dispatch_after(v13, v14, block);
      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shouldPresentNotifications");

    if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall") && v16)
    {
      v17 = v9 - v10;
      v18 = objc_alloc_init(MEMORY[0x1E0D298D0]);
      objc_msgSend(v18, "setTitle:", CFSTR("Health Demo Data"));
      if (v17 <= 10.0)
      {
        if (v17 <= 1.0)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Generation of demo data complete\n %ld ms elapsed\n %ld samples written"), (uint64_t)(v17 * 1000.0), a3);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Generation of demo data complete\n %.1f s elapsed\n %ld samples written"), *(_QWORD *)&v17, a3);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Generation of demo data complete\n %ld s elapsed\n %ld samples written"), (uint64_t)v17, a3);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setMessage:", v20);
      objc_msgSend(v18, "setDefaultButton:", CFSTR("Ok"));
      objc_msgSend(v18, "presentWithResponseHandler:", &__block_literal_global_203);

    }
  }
  else
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v7;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "Failed to generate demo data: %{public}@", (uint8_t *)location, 0xCu);
    }
  }

}

void __52__HDDemoDataManager__queue_generateDemoDataIfNeeded__block_invoke_188(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDDemoDataManager _queue_generateDemoDataIfNeeded]();

}

- (void)profileDidBecomeReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_demoDataQueue);
  -[HDDemoDataManager _queue_generateDemoDataIfNeeded]((uint64_t)self);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDDemoDataGenerator)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_demoDataQueue, 0);
}

@end
