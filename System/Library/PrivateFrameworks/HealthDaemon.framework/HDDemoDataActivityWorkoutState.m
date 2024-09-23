@implementation HDDemoDataActivityWorkoutState

void __90___HDDemoDataActivityWorkoutState_addWorkoutRouteFromFilePath_profile_provenance_workout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *context;
  void *v28;
  uint8_t buf[8];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  context = (void *)MEMORY[0x1BCCACAC4]();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __90___HDDemoDataActivityWorkoutState_addWorkoutRouteFromFilePath_profile_provenance_workout___block_invoke_2;
  v33[3] = &unk_1E6CF6818;
  v35 = *(_QWORD *)(a1 + 56);
  v6 = v5;
  v34 = v6;
  v28 = v3;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v33);
  v7 = (void *)MEMORY[0x1E0CB6E58];
  objc_msgSend(MEMORY[0x1E0CB65C0], "localDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_workoutRouteWithDevice:metadata:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_setCount:", v4);
  objc_msgSend(*(id *)(a1 + 32), "dataManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 40);
  v32 = 0;
  objc_msgSend(v10, "insertDataObjects:withProvenance:creationDate:error:", v11, v12, &v32, CFAbsoluteTimeGetCurrent());
  v13 = v32;

  objc_msgSend(v9, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v31 = v13;
  +[HDLocationSeriesSampleEntity insertLocationData:seriesIdentifier:profile:error:](HDLocationSeriesSampleEntity, "insertLocationData:seriesIdentifier:profile:error:", v6, v14, v15, &v31);
  v16 = v31;

  objc_msgSend(v9, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = *MEMORY[0x1E0CB55D0];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = *MEMORY[0x1E0CB55D8];
  v37[0] = v19;
  v37[1] = &unk_1E6DFC350;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(a1 + 32);
  v30 = v16;
  +[HDSeriesSampleEntity freezeSeriesWithIdentifier:metadata:profile:error:](HDLocationSeriesSampleEntity, "freezeSeriesWithIdentifier:metadata:profile:error:", v17, v20, v21, &v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v30;

  if (v22)
  {
    v24 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v9, "UUID", context);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(*(id *)(v24 + 8), "hk_appendBytesWithUUID:", v25);

  }
  else
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB52C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "Cannot associate workout route due to lack of frozen identifier", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(context);
}

void __90___HDDemoDataActivityWorkoutState_addWorkoutRouteFromFilePath_profile_provenance_workout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  void *v7;
  CLLocationDegrees v8;
  CLLocationCoordinate2D v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  id v28;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = CLLocationCoordinate2DMake(v6, v8);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "dateByAddingTimeInterval:", 1.0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "doubleValue");
  v28 = (id)objc_msgSend(v13, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v9.latitude, v9.longitude, v16, v19, v22, v25, v27);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v28);
}

@end
