@implementation ATXLocationToLaunchCorrelation

- (ATXLocationToLaunchCorrelation)init
{
  void *v3;
  void *v4;
  ATXLocationToLaunchCorrelation *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXLocationToLaunchCorrelation initWithCorrelationMatrix:locationTotals:](self, "initWithCorrelationMatrix:locationTotals:", v3, v4);

  return v5;
}

- (ATXLocationToLaunchCorrelation)initWithCorrelationMatrix:(id)a3 locationTotals:(id)a4
{
  id v6;
  id v7;
  ATXLocationToLaunchCorrelation *v8;
  ATXCorrelationMatrixGuardedData *v9;
  uint64_t v10;
  _PASLock *lock;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXLocationToLaunchCorrelation;
  v8 = -[ATXLocationToLaunchCorrelation init](&v13, sel_init);
  if (v8)
  {
    v9 = -[ATXCorrelationMatrixGuardedData initWithCorrelationMatrix:locationTotals:]([ATXCorrelationMatrixGuardedData alloc], "initWithCorrelationMatrix:locationTotals:", v6, v7);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v9);
    lock = v8->_lock;
    v8->_lock = (_PASLock *)v10;

  }
  return v8;
}

- (void)addVisitForLocation:(id)a3 event:(id)a4 value:(double)a5
{
  id v8;
  id v9;
  _PASLock *lock;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a4;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__ATXLocationToLaunchCorrelation_addVisitForLocation_event_value___block_invoke;
  v13[3] = &unk_1E82DE870;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);

}

void __66__ATXLocationToLaunchCorrelation_addVisitForLocation_event_value___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id *v15;

  v15 = a2;
  objc_msgSend(v15[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v15[1], "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 32));

  }
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:", v8 + *(double *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15[1], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v15[2], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v11, "numberWithDouble:", v13 + *(double *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15[2], "setObject:forKeyedSubscript:", v14, *(_QWORD *)(a1 + 32));

}

- (double)launchProbabilityForEvent:(id)a3 atLocation:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  double v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__ATXLocationToLaunchCorrelation_launchProbabilityForEvent_atLocation___block_invoke;
  v13[3] = &unk_1E82DE898;
  v16 = &v17;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __71__ATXLocationToLaunchCorrelation_launchProbabilityForEvent_atLocation___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = +[ATXLocationToLaunchCorrelation _launchProbabilityForEvent:atLocation:correlationMatrix:locationTotals:](ATXLocationToLaunchCorrelation, "_launchProbabilityForEvent:atLocation:correlationMatrix:locationTotals:", a1[4], a1[5], *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  return result;
}

- (double)totalLaunchesForEvent:(id)a3 atLocation:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  double v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__ATXLocationToLaunchCorrelation_totalLaunchesForEvent_atLocation___block_invoke;
  v13[3] = &unk_1E82DE898;
  v16 = &v17;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __67__ATXLocationToLaunchCorrelation_totalLaunchesForEvent_atLocation___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = +[ATXLocationToLaunchCorrelation _totalLaunchesForEvent:atLocation:correlationMatrix:](ATXLocationToLaunchCorrelation, "_totalLaunchesForEvent:atLocation:correlationMatrix:", a1[4], a1[5], *(_QWORD *)(a2 + 8));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  return result;
}

- (double)totalLaunchesAtLocation:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  double v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ATXLocationToLaunchCorrelation_totalLaunchesAtLocation___block_invoke;
  v9[3] = &unk_1E82DE8C0;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __58__ATXLocationToLaunchCorrelation_totalLaunchesAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = +[ATXLocationToLaunchCorrelation _totalLaunchesAtLocation:locationTotals:](ATXLocationToLaunchCorrelation, "_totalLaunchesAtLocation:locationTotals:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a2 + 16));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (double)totalLaunches
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__ATXLocationToLaunchCorrelation_totalLaunches__block_invoke;
  v5[3] = &unk_1E82DE8E8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__ATXLocationToLaunchCorrelation_totalLaunches__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3[2];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3[2], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                + 24);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (double)launchProbabilityForEvent:(id)a3 atLocationsWithProbabilities:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  double v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__ATXLocationToLaunchCorrelation_launchProbabilityForEvent_atLocationsWithProbabilities___block_invoke;
  v13[3] = &unk_1E82DE910;
  v9 = v7;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v16 = &v17;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __89__ATXLocationToLaunchCorrelation_launchProbabilityForEvent_atLocationsWithProbabilities___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        if (v12 != 0.0)
        {
          +[ATXLocationToLaunchCorrelation _launchProbabilityForEvent:atLocation:correlationMatrix:locationTotals:](ATXLocationToLaunchCorrelation, "_launchProbabilityForEvent:atLocation:correlationMatrix:locationTotals:", *(_QWORD *)(a1 + 40), v9, v3[1], v3[2]);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                              + 8)
                                                                                  + 24)
                                                                      + v12 * v13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXLocationToLaunchCorrelation)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  ATXLocationToLaunchCorrelation *v16;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("correlationMatrix"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("locationTotals"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ATXLocationToLaunchCorrelation initWithCorrelationMatrix:locationTotals:](self, "initWithCorrelationMatrix:locationTotals:", v14, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ATXLocationToLaunchCorrelation_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E82DE938;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

uint64_t __50__ATXLocationToLaunchCorrelation_encodeWithCoder___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v5 = a2;
  objc_msgSend(v3, "encodeObject:forKey:", v4, CFSTR("correlationMatrix"));
  v6 = *(void **)(a1 + 32);
  v7 = v5[2];

  return objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("locationTotals"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  _PASLock *lock;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__28;
  v11 = __Block_byref_object_dispose__28;
  v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__ATXLocationToLaunchCorrelation_copyWithZone___block_invoke;
  v6[3] = &unk_1E82DE960;
  v6[4] = &v7;
  v6[5] = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__ATXLocationToLaunchCorrelation_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  ATXLocationToLaunchCorrelation *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3[1];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3[1], "objectForKeyedSubscript:", v10, (_QWORD)v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v13 = +[ATXLocationToLaunchCorrelation allocWithZone:](ATXLocationToLaunchCorrelation, "allocWithZone:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_msgSend(v3[2], "mutableCopy");
  v15 = -[ATXLocationToLaunchCorrelation initWithCorrelationMatrix:locationTotals:](v13, "initWithCorrelationMatrix:locationTotals:", v4, v14);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

+ (double)_launchProbabilityForEvent:(id)a3 atLocation:(id)a4 correlationMatrix:(id)a5 locationTotals:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  double result;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v15 <= v18)
  {
    result = 0.0;
    if (v18 > 0.0)
      return v15 / v18;
  }
  else
  {
    __atxlog_handle_default();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[ATXLocationToLaunchCorrelation _launchProbabilityForEvent:atLocation:correlationMatrix:locationTotals:].cold.1(v19);

    return 0.0;
  }
  return result;
}

+ (double)_totalLaunchesForEvent:(id)a3 atLocation:(id)a4 correlationMatrix:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v7 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return v11;
}

+ (double)_totalLaunchesAtLocation:(id)a3 locationTotals:(id)a4
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

+ (void)_launchProbabilityForEvent:(os_log_t)log atLocation:correlationMatrix:locationTotals:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Numerator should never be higher than denominator. There cannot be more launches at a location for a specific event than for all events at that location", v1, 2u);
}

@end
