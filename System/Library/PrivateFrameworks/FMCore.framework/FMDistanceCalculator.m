@implementation FMDistanceCalculator

- (FMDistanceCalculator)init
{
  return -[FMDistanceCalculator initWithDefaultsSuiteName:](self, "initWithDefaultsSuiteName:", 0);
}

- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3
{
  return -[FMDistanceCalculator initWithDefaultsSuiteName:locale:](self, "initWithDefaultsSuiteName:locale:", a3, 0);
}

- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3 locale:(id)a4
{
  return -[FMDistanceCalculator initWithDefaultsSuiteName:locale:measurementSystemLocale:](self, "initWithDefaultsSuiteName:locale:measurementSystemLocale:", a3, a4, 0);
}

- (FMDistanceCalculator)initWithDefaultsSuiteName:(id)a3 locale:(id)a4 measurementSystemLocale:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDistanceCalculator *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *calculationQueue;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FMDistanceCalculator;
  v11 = -[FMDistanceCalculator init](&v19, sel_init);
  if (v11)
  {
    v12 = dispatch_queue_create("FMDistanceCalculator", 0);
    calculationQueue = v11->_calculationQueue;
    v11->_calculationQueue = (OS_dispatch_queue *)v12;

    if (v9)
    {
      -[FMDistanceCalculator setLocale:](v11, "setLocale:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMDistanceCalculator setLocale:](v11, "setLocale:", v14);

    }
    if (v8)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    -[FMDistanceCalculator setUserDefaults:](v11, "setUserDefaults:", v15);

    if (v10)
    {
      -[FMDistanceCalculator setMeasurementSystemLocale:](v11, "setMeasurementSystemLocale:", v10);
    }
    else
    {
      -[FMDistanceCalculator locale](v11, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMDistanceCalculator setMeasurementSystemLocale:](v11, "setMeasurementSystemLocale:", v17);

    }
  }

  return v11;
}

- (int64_t)measurementSystem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;

  -[FMDistanceCalculator measurementSystemLocale](self, "measurementSystemLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[FMDistanceCalculator userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("distanceUnitPref"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("mi")) & 1) != 0)
    {
      v7 = 3;
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("km")) & 1) == 0)
      {
        LogCategory_Unspecified();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[FMDistanceCalculator measurementSystem].cold.1((uint64_t)v6, v8);

      }
      v7 = 2;
    }
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Metric")))
  {
    v7 = 2;
  }
  else
  {
    v7 = 3;
  }

  return v7;
}

- (void)setMeasurementSystem:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int64_t v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  -[FMDistanceCalculator userDefaults](self, "userDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[FMDistanceCalculator measurementSystem](self, "measurementSystem");
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      v6 = CFSTR("km");
      goto LABEL_6;
    }
    if (a3 == 3)
    {
      v6 = CFSTR("mi");
LABEL_6:
      v7 = v5;
      objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("distanceUnitPref"));
      goto LABEL_11;
    }
    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FMDistanceCalculator setMeasurementSystem:].cold.1(a3, v8);

  }
  v7 = v5;
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("distanceUnitPref"));
LABEL_11:
  v9 = (void *)objc_opt_new();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = CFSTR("distanceUnitPref");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:", CFSTR("group.com.apple.icloud.fm"), v12, v14, CFSTR("group.com.apple.icloud.fm"));

  LogCategory_Unspecified();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = CFSTR("distanceUnitPref");
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = CFSTR("group.com.apple.icloud.fm");
    _os_log_impl(&dword_1C9967000, v15, OS_LOG_TYPE_INFO, "Syncronizing pref key: %@ for bundle: %@ container:%@", buf, 0x20u);

  }
  if (v20 != a3)
  {
    LogCategory_Unspecified();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9967000, v18, OS_LOG_TYPE_INFO, "Posting FMDistanceCalculatorMeasurementSystemChangedNotification", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("FMDistanceCalculatorMeasurementSystemChangedNotification"), self);

  }
}

- (double)averageDistanceFromLocation:(id)a3 toLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 1000000000.0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "distanceFromLocation:", v6);
    v10 = v9;
    objc_msgSend(v5, "horizontalAccuracy");
    v12 = v11;
    objc_msgSend(v7, "horizontalAccuracy");
    if (v12 >= v13)
      v13 = v12;
    v14 = 0.0;
    if (v10 > v13)
    {
      objc_msgSend(v5, "horizontalAccuracy");
      v16 = v10 - v15;
      objc_msgSend(v7, "horizontalAccuracy");
      v18 = v16 - v17;
      objc_msgSend(v5, "horizontalAccuracy");
      v20 = v10 + v19;
      objc_msgSend(v7, "horizontalAccuracy");
      v13 = v20 + v21;
      if (v18 >= 0.0)
        v14 = v18;
    }
    v8 = (v14 + v13) * 0.5;
  }

  return v8;
}

- (id)localizedDistanceFromLocation:(id)a3 toLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  __CFString *v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = &stru_1E82AADD8;
  -[FMDistanceCalculator calculationQueue](self, "calculationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__FMDistanceCalculator_localizedDistanceFromLocation_toLocation___block_invoke;
  v13[3] = &unk_1E82AA490;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __65__FMDistanceCalculator_localizedDistanceFromLocation_toLocation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_localizedDistanceFromLocation:toLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)futureLocalizedDistanceFromLocation:(id)a3 toLocation:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D201F8]);
  -[FMDistanceCalculator calculationQueue](self, "calculationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__FMDistanceCalculator_futureLocalizedDistanceFromLocation_toLocation___block_invoke;
  v16[3] = &unk_1E82AA4E0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, v16);

  v13 = v19;
  v14 = v10;

  return v14;
}

void __71__FMDistanceCalculator_futureLocalizedDistanceFromLocation_toLocation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_localizedDistanceFromLocation:toLocation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__FMDistanceCalculator_futureLocalizedDistanceFromLocation_toLocation___block_invoke_2;
  v4[3] = &unk_1E82AA4B8;
  v5 = *(id *)(a1 + 56);
  v6 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __71__FMDistanceCalculator_futureLocalizedDistanceFromLocation_toLocation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

- (id)_scaledAndConvertedMin:(double)a3 andMax:(double)a4
{
  int64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = -[FMDistanceCalculator measurementSystem](self, "measurementSystem");
  if (v7 == 3)
  {
    -[FMDistanceCalculator localizedStringForKey:value:](self, "localizedStringForKey:value:", CFSTR("MILES"), CFSTR("Miles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a3 * 3.2808399 / 5280.0;
    v10 = a4 * 3.2808399 / 5280.0;
  }
  else if (v7 == 2)
  {
    -[FMDistanceCalculator localizedStringForKey:value:](self, "localizedStringForKey:value:", CFSTR("KILOMETERS"), CFSTR("Kilometers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a3 / 1000.0;
    v10 = a4 / 1000.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unhandled measurementSystem: %ld"), -[FMDistanceCalculator measurementSystem](self, "measurementSystem"));
    v8 = 0;
    v9 = a3;
    v10 = a4;
  }
  v11 = 0;
  if (v9 >= 0.0 && v10 > 0.0)
  {
    v12 = a4 - a3;
    v13 = (a4 - a3) / a3;
    v14 = v12 / a4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("min"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("max"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("minRatio"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("maxRatio"));

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("units"));
  }

  return v11;
}

- (id)_localizedStringFromNumber:(id)a3 numberStyle:(unint64_t)a4 fractionDigits:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[FMDistanceCalculator formatter](self, "formatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberStyle:", a4);
  objc_msgSend(v9, "setMaximumFractionDigits:", a5);
  objc_msgSend(v9, "stringForObjectValue:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_localizedDistanceFromLocation:(id)a3 toLocation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  BOOL v31;
  double v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString *v43;

  v6 = a3;
  v7 = a4;
  -[FMDistanceCalculator calculationQueue](self, "calculationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "distanceFromLocation:", v7);
  v10 = v9;
  objc_msgSend(v6, "horizontalAccuracy");
  v12 = v11;
  objc_msgSend(v6, "horizontalAccuracy");
  if (v12 >= v13)
    v14 = v12;
  else
    v14 = v13;
  v15 = 0.0;
  if (v10 > v14)
  {
    objc_msgSend(v6, "horizontalAccuracy");
    v17 = v10 - v16;
    objc_msgSend(v7, "horizontalAccuracy");
    v19 = v17 - v18;
    objc_msgSend(v6, "horizontalAccuracy");
    v21 = v10 + v20;
    objc_msgSend(v7, "horizontalAccuracy");
    v14 = v21 + v22;
    if (v19 >= 0.0)
      v15 = v19;
  }
  -[FMDistanceCalculator _scaledAndConvertedMin:andMax:](self, "_scaledAndConvertedMin:andMax:", v15, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("min"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("max"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v30 = v29;

    v31 = v30 > 1.0 && v30 < 10.0;
    v32 = vabdd_f64(v30, v27);
    if (!v31 || v32 < 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v27 + v30) * 0.5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMDistanceCalculator _localizedStringFromNumber:numberStyle:fractionDigits:](self, "_localizedStringFromNumber:numberStyle:fractionDigits:", v34, 1, v30 < 1.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x1E0CB3940];
      -[FMDistanceCalculator localizedStringForKey:value:](self, "localizedStringForKey:value:", CFSTR("DISTANCE_BADGE_FORMAT"), &stru_1E82AADD8);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("units"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", v39, v37, v41);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMDistanceCalculator _localizedStringFromNumber:numberStyle:fractionDigits:](self, "_localizedStringFromNumber:numberStyle:fractionDigits:", v36, 1, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[FMDistanceCalculator _localizedStringFromNumber:numberStyle:fractionDigits:](self, "_localizedStringFromNumber:numberStyle:fractionDigits:", v38, 1, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)MEMORY[0x1E0CB3940];
      -[FMDistanceCalculator localizedStringForKey:value:](self, "localizedStringForKey:value:", CFSTR("DISTANCE_BADGE_RANGE_FORMAT"), &stru_1E82AADD8);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("units"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", v41, v37, v39, v42);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v43 = &stru_1E82AADD8;
  }

  return v43;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4
{
  return -[FMDistanceCalculator localizedStringForKey:value:table:](self, "localizedStringForKey:value:table:", a3, a4, &stru_1E82AADD8);
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMDistanceCalculator localizationDelegate](self, "localizationDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_3;
  -[FMDistanceCalculator locale](self, "locale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "languageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:table:bundle:languageCode:", v8, v10, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v10;
  if (!v15)
  {
LABEL_3:
    v16 = v10;
    if (objc_msgSend(v10, "isEqualToString:", &stru_1E82AADD8))
    {

      v16 = 0;
    }
    objc_msgSend(v11, "localizedStringForKey:value:table:", v8, v9, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (NSNumberFormatter)formatter
{
  NSNumberFormatter *formatter;
  NSNumberFormatter *v4;
  void *v5;
  NSNumberFormatter *v6;

  formatter = self->_formatter;
  if (!formatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    -[FMDistanceCalculator locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter setLocale:](v4, "setLocale:", v5);

    -[NSNumberFormatter setRoundingMode:](v4, "setRoundingMode:", 5);
    v6 = self->_formatter;
    self->_formatter = v4;

    formatter = self->_formatter;
  }
  return formatter;
}

- (FMDistanceCalculatorLocalizationDelegate)localizationDelegate
{
  return (FMDistanceCalculatorLocalizationDelegate *)objc_loadWeakRetained((id *)&self->_localizationDelegate);
}

- (void)setLocalizationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_localizationDelegate, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSLocale)measurementSystemLocale
{
  return self->_measurementSystemLocale;
}

- (void)setMeasurementSystemLocale:(id)a3
{
  objc_storeStrong((id *)&self->_measurementSystemLocale, a3);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (OS_dispatch_queue)calculationQueue
{
  return self->_calculationQueue;
}

- (void)setCalculationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calculationQueue, a3);
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_calculationQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_measurementSystemLocale, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_localizationDelegate);
}

- (void)measurementSystem
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("distanceUnitPref");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1C9967000, a2, OS_LOG_TYPE_ERROR, "Unknown value for %@ default key: %@", (uint8_t *)&v2, 0x16u);
}

- (void)setMeasurementSystem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1C9967000, a2, OS_LOG_TYPE_ERROR, "Unknown value for setMeasurementSystem: %ld", (uint8_t *)&v2, 0xCu);
}

@end
