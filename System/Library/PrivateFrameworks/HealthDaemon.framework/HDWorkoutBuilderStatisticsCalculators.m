@implementation HDWorkoutBuilderStatisticsCalculators

- (HDWorkoutBuilderStatisticsCalculators)init
{
  HDWorkoutBuilderStatisticsCalculators *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *calculatorsByTypeAndActivityUUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDWorkoutBuilderStatisticsCalculators;
  v2 = -[HDWorkoutBuilderStatisticsCalculators init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    calculatorsByTypeAndActivityUUID = v2->_calculatorsByTypeAndActivityUUID;
    v2->_calculatorsByTypeAndActivityUUID = v3;

  }
  return v2;
}

- (id)description
{
  return (id)-[NSMutableDictionary description](self->_calculatorsByTypeAndActivityUUID, "description");
}

- (id)allQuantityTypes
{
  return (id)-[NSMutableDictionary allKeys](self->_calculatorsByTypeAndActivityUUID, "allKeys");
}

- (id)calculatorForQuantityType:(id)a3 activityUUID:(id)a4
{
  NSMutableDictionary *calculatorsByTypeAndActivityUUID;
  id v6;
  void *v7;
  void *v8;

  calculatorsByTypeAndActivityUUID = self->_calculatorsByTypeAndActivityUUID;
  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](calculatorsByTypeAndActivityUUID, "objectForKeyedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setCalculator:(id)a3 forQuantityType:(id)a4 activityUUID:(id)a5
{
  NSMutableDictionary *calculatorsByTypeAndActivityUUID;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a4;
  calculatorsByTypeAndActivityUUID = self->_calculatorsByTypeAndActivityUUID;
  v9 = a5;
  v10 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](calculatorsByTypeAndActivityUUID, "objectForKeyedSubscript:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_calculatorsByTypeAndActivityUUID, "setObject:forKeyedSubscript:", v12, v14);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_calculatorsByTypeAndActivityUUID, "objectForKeyedSubscript:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, v9);

}

- (void)enumerateCalculatorsWithHandler:(id)a3
{
  uint64_t (**v4)(id, void *, uint64_t, uint64_t);
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableDictionary *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *, uint64_t, uint64_t))a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_calculatorsByTypeAndActivityUUID;
  v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v18)
  {
    v6 = *(_QWORD *)v26;
    v20 = v5;
    v17 = *(_QWORD *)v26;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v19 = v7;
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v7);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_calculatorsByTypeAndActivityUUID, "objectForKeyedSubscript:", v8, v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_calculatorsByTypeAndActivityUUID, "objectForKeyedSubscript:", v8);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v14);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v14) = v4[2](v4, v16, v8, v14);

              if (!(_DWORD)v14)
              {

                v5 = v20;
                goto LABEL_18;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v7 = v19 + 1;
        v5 = v20;
        v6 = v17;
      }
      while (v19 + 1 != v18);
      v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v18);
  }
LABEL_18:

}

- (void)enumerateCalculatorsForQuantityType:(id)a3 handler:(id)a4
{
  id v6;
  uint64_t (**v7)(id, void *, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (uint64_t (**)(id, void *, _QWORD))a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_calculatorsByTypeAndActivityUUID, "objectForKeyedSubscript:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_calculatorsByTypeAndActivityUUID, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v13) = v7[2](v7, v15, v13);

      if (!(_DWORD)v13)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateCalculatorsForActivityUUID:(id)a3 handler:(id)a4
{
  id v6;
  unsigned int (**v7)(id, void *, _QWORD);
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(id, void *, _QWORD))a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_calculatorsByTypeAndActivityUUID;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_calculatorsByTypeAndActivityUUID, "objectForKeyedSubscript:", v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 && !v7[2](v7, v15, v13))
        {

          goto LABEL_12;
        }

      }
      v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *calculatorsByTypeAndActivityUUID;
  id v4;
  id v5;

  calculatorsByTypeAndActivityUUID = self->_calculatorsByTypeAndActivityUUID;
  v4 = a3;
  -[NSMutableDictionary hk_map:](calculatorsByTypeAndActivityUUID, "hk_map:", &__block_literal_global_209);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("calculators"));

}

void __57__HDWorkoutBuilderStatisticsCalculators_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  void (**v7)(id, id, void *);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HDWorkoutBuilderStatisticsCalculators_encodeWithCoder___block_invoke_2;
  v10[3] = &unk_1E6D0B5F8;
  v11 = v6;
  v9 = v6;
  v7 = a4;
  objc_msgSend(a3, "hk_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9, v8);

}

void __57__HDWorkoutBuilderStatisticsCalculators_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, id, void *);
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v13 = 0;
  objc_msgSend(a3, "archivedRepresentationWithError:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (v9)
  {
    v8[2](v8, v7, v9);
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v15 = v12;
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = v10;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Failed to archive statistics calculator for type %{public}@ and activity %{public}@, %{public}@", buf, 0x20u);
    }
  }

}

- (HDWorkoutBuilderStatisticsCalculators)initWithCoder:(id)a3
{
  id v4;
  HDWorkoutBuilderStatisticsCalculators *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *calculatorsByTypeAndActivityUUID;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  HDWorkoutBuilderStatisticsCalculators *v26;
  void *v27;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  HDWorkoutBuilderStatisticsCalculators *v34;
  id v35;
  void *v36;
  id v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[7];

  v59[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)HDWorkoutBuilderStatisticsCalculators;
  v5 = -[HDWorkoutBuilderStatisticsCalculators init](&v48, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v59[0] = objc_opt_class();
    v59[1] = objc_opt_class();
    v59[2] = objc_opt_class();
    v59[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v8;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("calculators"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0x1E0C99000uLL;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    calculatorsByTypeAndActivityUUID = v5->_calculatorsByTypeAndActivityUUID;
    v5->_calculatorsByTypeAndActivityUUID = v11;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v9;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (v32)
    {
      v13 = *(_QWORD *)v45;
      v34 = v5;
      v35 = v4;
      v31 = *(_QWORD *)v45;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(obj);
          v33 = v14;
          v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v14);
          v16 = objc_alloc_init(*(Class *)(v10 + 3592));
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(obj, "objectForKeyedSubscript:", v15);
          v37 = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v41;
            while (2)
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v41 != v19)
                  objc_enumerationMutation(v37);
                v21 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v20);
                objc_msgSend(obj, "objectForKeyedSubscript:", v15);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKeyedSubscript:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = 0;
                +[HDStatisticsCollectionCalculator calculatorForArchivedRepresentation:error:](HDStatisticsCollectionCalculator, "calculatorForArchivedRepresentation:error:", v23, &v39);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v39;

                if (!v24)
                {
                  _HKInitializeLogging();
                  v27 = (void *)*MEMORY[0x1E0CB5380];
                  v5 = v34;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
                  {
                    v29 = v27;
                    v30 = objc_opt_class();
                    *(_DWORD *)buf = 138544130;
                    v50 = v30;
                    v51 = 2114;
                    v52 = v15;
                    v53 = 2114;
                    v54 = v21;
                    v55 = 2114;
                    v56 = v25;
                    _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "%{public}@: Unable to unarchive calculator for type %{public}@ and activity %{public}@: %{public}@", buf, 0x2Au);

                  }
                  v26 = 0;
                  v4 = v35;
                  goto LABEL_22;
                }
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, v21);

                ++v20;
              }
              while (v18 != v20);
              v18 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
              if (v18)
                continue;
              break;
            }
          }

          v5 = v34;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v34->_calculatorsByTypeAndActivityUUID, "setObject:forKeyedSubscript:", v16, v15);

          v14 = v33 + 1;
          v4 = v35;
          v10 = 0x1E0C99000;
          v13 = v31;
        }
        while (v33 + 1 != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      }
      while (v32);
    }

  }
  v26 = v5;
LABEL_22:

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculatorsByTypeAndActivityUUID, 0);
}

@end
