@implementation TSRTRoutineManager

void __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0D58708];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D58708], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1BA493000, v8, OS_LOG_TYPE_DEFAULT, "Error when trying to fetch frequent locations: %@", (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v10, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "parseLocation:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

      v5 = v10;
      goto LABEL_7;
    }
    v15 = *MEMORY[0x1E0D58708];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D58708], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1BA493000, v15, OS_LOG_TYPE_DEFAULT, "No frequent locations found", (uint8_t *)&v16, 2u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_7:

}

+ (void)fetchMostFrequentLocationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D18460], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke;
  v7[3] = &unk_1E724B890;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "fetchLocationsOfInterestOfType:withHandler:", 0, v7);

}

void __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0D58708];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D58708], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_1BA493000, v8, OS_LOG_TYPE_DEFAULT, "Error when trying to fetch home locations: %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "parseLocation:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

    v5 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D18460], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke_2;
    v19[3] = &unk_1E724B890;
    v17 = *(id *)(a1 + 32);
    v18 = *(_QWORD *)(a1 + 40);
    v20 = v17;
    v21 = v18;
    objc_msgSend(v15, "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v16, v19);

  }
}

+ (id)parseLocation:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "latitude");
  v7 = v6;
  objc_msgSend(v4, "longitude");
  v9 = v8;

  return (id)objc_msgSend(v5, "initWithLatitude:longitude:", v7, v9);
}

uint64_t __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "visits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "visits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

uint64_t __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "visits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "visits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

@end
