@implementation ATXMicrolocationVisitDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 11;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v31.receiver = self;
  v31.super_class = (Class)ATXMicrolocationVisitDuetDataProvider;
  v24 = v9;
  v25 = v8;
  v23 = v10;
  -[ATXDuetDataProvider fetchEventsBetweenStartDate:andEndDate:withPredicates:](&v31, sel_fetchEventsBetweenStartDate_andEndDate_withPredicates_, v8, v9, v10);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v16, "dominantMicrolocationUUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dominantMicrolocationUUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "isEqual:", v20);

        if ((v21 & 1) == 0)
          objc_msgSend(v11, "addObject:", v16);
        objc_autoreleasePoolPop(v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v13);
  }

  return v11;
}

- (void)adjustDatesForMicrolocationEvents:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v3 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__60;
  v8[4] = __Block_byref_object_dispose__60;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__ATXMicrolocationVisitDuetDataProvider_adjustDatesForMicrolocationEvents___block_invoke;
  v5[3] = &unk_1E82E5648;
  v4 = v3;
  v6 = v4;
  v7 = v8;
  objc_msgSend(v4, "enumerateObjectsWithOptions:usingBlock:", 2, v5);

  _Block_object_dispose(v8, 8);
}

void __75__ATXMicrolocationVisitDuetDataProvider_adjustDatesForMicrolocationEvents___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 != a3)
    objc_msgSend(v8, "setEndDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v8, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
