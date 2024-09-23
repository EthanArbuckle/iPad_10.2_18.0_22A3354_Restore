@implementation HDQuantitySampleSeriesEntity

+ (id)databaseTable
{
  return CFSTR("quantity_sample_series");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  unsigned __int8 v3;
  int v5;
  unint64_t *v6;

  if ((v3 & 1) == 0)
  {
    v6 = a3;
    a3 = v6;
    if (v5)
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_1, 0, &dword_1B7802000);
      a3 = v6;
    }
  }
  *a3 = 5;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)+[HDQuantitySampleSeriesEntity columnDefinitionsWithCount:]::columnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)indices
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HDQuantitySampleSeriesEntity disambiguatedSQLForProperty:](HDQuantitySampleSeriesEntity, "disambiguatedSQLForProperty:", CFSTR("insertion_era"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ IS NOT NULL"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0D29860]);
  v6 = objc_opt_class();
  v11 = CFSTR("insertion_era");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithEntity:name:columns:unique:predicateString:", v6, CFSTR("unfrozen"), v7, 0, v4);
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (Class)entityClassForEnumeration
{
  return (Class)objc_opt_class();
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("count"), CFSTR("insertion_era"), CFSTR("hfd_key"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend((id)objc_msgSend(a1, "entityClassForEnumeration"), "disambiguatedDatabaseTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v8, a1, 0, CFSTR("data_id"), CFSTR("data_id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HDQuantitySampleSeriesEntity _statisticsProperties]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v4);

    if (!v12)
    {
      objc_msgSend((id)objc_msgSend(a1, "entityClassForEnumeration"), "joinClausesForProperty:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v13 = (void *)MEMORY[0x1E0D29870];
    objc_msgSend(a1, "disambiguatedDatabaseTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leftJoinClauseFromTable:toTargetEntity:as:localReference:targetKey:", v14, objc_opt_class(), 0, CFSTR("data_id"), CFSTR("owner_id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v10;

LABEL_7:
  return v15;
}

+ (uint64_t)_statisticsProperties
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("min"), CFSTR("max"), CFSTR("most_recent"), CFSTR("most_recent_date"), CFSTR("most_recent_duration"), 0);
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ascending");
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5E58]))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDQuantitySampleStatisticsEntity, "disambiguatedSQLForProperty:", CFSTR("most_recent_date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataEntity disambiguatedSQLForProperty:](HDSampleEntity, "disambiguatedSQLForProperty:", CFSTR("start_date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("IFNULL(%@, %@)"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29888]), "initWithExpression:ascending:", v10, v6);
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5E50]))
    {
      v18.receiver = a1;
      v18.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSeriesEntity;
      objc_msgSendSuper2(&v18, sel_orderingTermForSortDescriptor_, v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v12 = (void *)MEMORY[0x1E0CB3940];
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDQuantitySampleStatisticsEntity, "disambiguatedSQLForProperty:", CFSTR("most_recent_date"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDQuantitySampleStatisticsEntity, "disambiguatedSQLForProperty:", CFSTR("most_recent_duration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataEntity disambiguatedSQLForProperty:](HDSampleEntity, "disambiguatedSQLForProperty:", CFSTR("end_date"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("IFNULL(%@ + %@, %@)"), v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29888]), "initWithExpression:ascending:", v10, v6);
  }
  v16 = (void *)v11;

LABEL_7:
  return v16;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  int v10;
  objc_super v11;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D29618]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("data_id")))
  {
    v5 = (void *)objc_msgSend(a1, "entityClassForEnumeration");
  }
  else
  {
    +[HDQuantitySampleSeriesEntity _statisticsProperties]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (!v10)
    {
      v11.receiver = a1;
      v11.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSeriesEntity;
      objc_msgSendSuper2(&v11, sel_disambiguatedSQLForProperty_, v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    v5 = (void *)objc_opt_class();
  }
  objc_msgSend(v5, "disambiguatedSQLForProperty:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v7 = (void *)v6;

  return v7;
}

+ (id)privateSubEntities
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)_insertionEra
{
  objc_opt_self();
  if (_MergedGlobals_215 != -1)
    dispatch_once(&_MergedGlobals_215, &__block_literal_global_149);
  return qword_1ED552468;
}

void __45__HDQuantitySampleSeriesEntity__insertionEra__block_invoke()
{
  qword_1ED552468 = (uint64_t)CFAbsoluteTimeGetCurrent();
}

+ (BOOL)validateEntityWithProfile:(id)a3 error:(id *)a4 validationErrorHandler:(id)a5
{
  return 1;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  +[HDQuantitySampleSeriesEntity _insertDataObject:inDatabase:persistentID:error:]((uint64_t)a1, a3, a5, a6, (uint64_t)a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_insertDataObject:(void *)a3 inDatabase:(void *)a4 persistentID:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  __CFString *v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HDQuantitySampleSeriesEntity *v33;
  _BOOL4 v34;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v42 = a4;
  v10 = objc_opt_self();
  if (objc_msgSend(v8, "count") == 1 && objc_msgSend(v8, "_frozen"))
  {
    v11 = v42;
    goto LABEL_21;
  }
  objc_msgSend(v8, "codableQuantitySample");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "hasFinal") & 1) != 0)
  {
    objc_msgSend(v8, "codableQuantitySample");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "final");

    if ((v14 & 1) == 0)
    {
      v15 = v8;
      v16 = CFSTR("insert");
      objc_opt_self();
      _HKInitializeLogging();
      v17 = (id)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "quantityType");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v41, "code");
        v38 = objc_msgSend(v15, "count");
        objc_msgSend(v15, "codableQuantitySample");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v39, "frozen");
        objc_msgSend(v15, "codableQuantitySample");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v37, "final");
        objc_msgSend(v15, "codableQuantitySample");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "quantitySeriesDatas");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v49 = CFSTR("insert");
        v50 = 2048;
        v51 = v40;
        v52 = 2048;
        v53 = v38;
        v54 = 1024;
        v55 = v36;
        v56 = 1024;
        v57 = v18;
        v58 = 2048;
        v59 = objc_msgSend(v20, "count");
        v60 = 2114;
        v61 = v15;
        _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "Non-final quantity sample %{public}@: type=%ld, count=%ld, frozen=%{BOOL}d, final=%{BOOL}d, datumsCount=%ld, sample=(%{public}@)", buf, 0x40u);

      }
      v21 = objc_opt_class();
      v22 = objc_msgSend(v15, "count");
      objc_msgSend(v15, "codableQuantitySample");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "quantitySeriesDatas");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDAutoBugCaptureReporter reportNotFinalSeriesSampleWithClass:count:datumCount:reason:](HDAutoBugCaptureReporter, "reportNotFinalSeriesSampleWithClass:count:datumCount:reason:", v21, v22, objc_msgSend(v24, "count"), CFSTR("insert"));

      v25 = 0;
      goto LABEL_11;
    }
  }
  else
  {

  }
  v25 = 1;
LABEL_11:
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __80__HDQuantitySampleSeriesEntity__insertDataObject_inDatabase_persistentID_error___block_invoke;
  v43[3] = &unk_1E6CFD918;
  v26 = v42;
  v44 = v26;
  v27 = v8;
  v45 = v27;
  v46 = v10;
  v47 = v25;
  if ((objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO quantity_sample_series (data_id, count, insertion_era, hfd_key, series_location) VALUES (?, ?, ?, (COALESCE((SELECT MAX(hfd_key) + 1 FROM quantity_sample_series), 1)), 2)"), a5, v43, 0) & 1) != 0&& ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)|| +[HDQuantitySampleStatisticsEntity setDiscreteQuantitySampleStatistics:persistentID:database:error:](HDQuantitySampleStatisticsEntity, "setDiscreteQuantitySampleStatistics:persistentID:database:error:", v27, v26, v9, a5))&& +[HDQuantitySampleSeriesEntity _deleteHFDSeriesIfFoundForPersistentID:database:error:](v10, v26, v9, a5))
  {
    objc_msgSend(v27, "codableQuantitySample");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "quantitySeriesDatas");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v27, "codableQuantitySample");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "quantitySeriesDatas");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "hk_map:", &__block_literal_global_234);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = -[HDSQLiteEntity initWithPersistentID:]([HDQuantitySampleSeriesEntity alloc], "initWithPersistentID:", objc_msgSend(v26, "longLongValue"));
      v34 = -[HDQuantitySampleSeriesEntity _insertValues:database:error:](v33, v32, v9, a5);

      if (!v34)
        v26 = 0;
    }
    v11 = v26;
  }
  else
  {
    v11 = 0;
  }

LABEL_21:
  return v11;
}

uint64_t __80__HDQuantitySampleSeriesEntity__insertDataObject_inDatabase_persistentID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v5;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "count"));
  if ((objc_msgSend(*(id *)(a1 + 40), "_frozen") & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 56))
      return sqlite3_bind_null(a2, 3);
    objc_opt_self();
    v5 = -+[HDQuantitySampleSeriesEntity _insertionEra]();
  }
  else
  {
    v5 = +[HDQuantitySampleSeriesEntity _insertionEra]();
  }
  return sqlite3_bind_int64(a2, 3, v5);
}

+ (BOOL)_deleteHFDSeriesIfFoundForPersistentID:(void *)a3 database:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  +[HDSQLiteEntity entityWithPersistentID:](HDQuantitySampleSeriesEntity, "entityWithPersistentID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "HFDKeyWithDatabase:error:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = +[HDQuantitySeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDQuantitySeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", objc_msgSend(v9, "longLongValue"), v7, a4);
  else
    v10 = 0;

  return v10;
}

id __80__HDQuantitySampleSeriesEntity__insertDataObject_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  float v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  v2 = a2;
  if (objc_msgSend(v2, "hasStartDate"))
    objc_msgSend(v2, "startDate");
  else
    objc_msgSend(v2, "endDate");
  v4 = v3;
  v5 = -1.0;
  if (objc_msgSend(v2, "hasStartDate"))
  {
    objc_msgSend(v2, "endDate");
    v7 = v6;
    objc_msgSend(v2, "startDate");
    v5 = v7 - v8;
  }
  v9 = (void *)MEMORY[0x1E0CB6478];
  objc_msgSend(v2, "value");
  *(float *)&v10 = v5;
  objc_msgSend(v9, "datumWithTimestamp:value:duration:", v4, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_insertValues:(void *)a3 database:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  float v21;
  float v22;
  float v23;
  float v24;
  double v25;
  _BOOL8 v26;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(a1, "HFDKeyWithDatabase:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__126;
      v43 = __Block_byref_object_dispose__126;
      v44 = 0;
      v35 = 0;
      v36 = &v35;
      v37 = 0x2020000000;
      v38 = -1;
      v46[0] = CFSTR("start_date");
      v46[1] = CFSTR("data_type");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __61__HDQuantitySampleSeriesEntity__insertValues_database_error___block_invoke;
      v34[3] = &unk_1E6CFD980;
      v34[4] = &v39;
      v34[5] = &v35;
      v11 = objc_msgSend(a1, "getValuesForProperties:database:error:handler:", v10, v8, a4, v34);

      if (v11 && v40[5] && (_HKValidDataTypeCode() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", v36[3]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v40[5], "timeIntervalSinceReferenceDate");
        v14 = v13;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v15 = v7;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v31;
LABEL_8:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v18);
            objc_msgSend(v19, "timeInterval");
            if (v20 < v14)
              break;
            objc_msgSend(v19, "duration");
            if (v21 < 0.0)
            {
              objc_msgSend(v19, "duration");
              if (v22 != -1.0)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Cannot insert datum (%@) because it has an invalid negative duration"), v19);
                goto LABEL_27;
              }
            }
            if (objc_msgSend(v12, "isMinimumDurationRestricted"))
            {
              objc_msgSend(v19, "duration");
              v24 = v23;
              objc_msgSend(v12, "minimumAllowedDuration");
              if (v25 > v24)
              {
                v28 = (void *)MEMORY[0x1E0CB35C8];
                objc_msgSend(v12, "minimumAllowedDuration");
                objc_msgSend(v28, "hk_assignError:code:format:", a4, 100, CFSTR("Cannot insert datum (%@) because duration is too short. Minimum required duration for sample type %@ is %f"), v19, v12, v29);
                goto LABEL_27;
              }
            }
            if (v16 == ++v18)
            {
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
              if (v16)
                goto LABEL_8;
              goto LABEL_18;
            }
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Cannot insert datum (%@) because it occurs before the series start time (%f)"), v19, *(_QWORD *)&v14);
LABEL_27:

          v26 = 0;
          goto LABEL_28;
        }
LABEL_18:

        v26 = +[HDQuantitySampleSeriesEntity primitiveInsertValues:seriesVersion:HFDKey:database:error:](HDQuantitySampleSeriesEntity, "primitiveInsertValues:seriesVersion:HFDKey:database:error:", v15, 1, objc_msgSend(v9, "longLongValue"), v8, a4);
LABEL_28:

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Unable to lookup %@ and %@ for %@ with persistentID %lld"), CFSTR("start_date"), CFSTR("data_type"), objc_opt_class(), objc_msgSend(a1, "persistentID"));
        v26 = 0;
      }
      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(&v39, 8);

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (BOOL)insertValues:(id)a3 series:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  HDInsertValuesToQuantitySampleSeriesOperation *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[HDInsertValuesToQuantitySampleSeriesOperation initWithSeries:values:]([HDInsertValuesToQuantitySampleSeriesOperation alloc], "initWithSeries:values:", v10, v9);
  LOBYTE(a6) = -[HDJournalableOperation performOrJournalWithProfile:error:](v12, "performOrJournalWithProfile:error:", v11, a6);

  return (char)a6;
}

+ (id)objectInsertionFilterForProfile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSeriesEntity;
  objc_msgSendSuper2(&v11, sel_objectInsertionFilterForProfile_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HDQuantitySampleSeriesEntity_objectInsertionFilterForProfile___block_invoke;
  aBlock[3] = &unk_1E6CF7B68;
  v10 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);

  return v7;
}

uint64_t __64__HDQuantitySampleSeriesEntity_objectInsertionFilterForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "_frozen"))
      v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    else
      v5 = 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)insertValues:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySampleSeriesEntity.mm"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQuantitySampleSeriesEntity.mm"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction != nil"));

LABEL_3:
  objc_msgSend(v11, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v13 = -[HDQuantitySampleSeriesEntity _isFrozenInDatabase:error:]((uint64_t)self, v12, (uint64_t)&v20);
  v14 = v20;

  if (v13 == 2)
  {
    objc_msgSend(v11, "protectedDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDQuantitySampleSeriesEntity _insertValues:database:error:](self, v9, v15, (uint64_t)a5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a5, 3, CFSTR("Unable to add data to a frozen series."), v14);
    v16 = 0;
  }

  return v16;
}

- (uint64_t)_isFrozenInDatabase:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v11[4] = &v13;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__HDQuantitySampleSeriesEntity__isFrozenInDatabase_error___block_invoke;
    v12[3] = &unk_1E6CEA6E8;
    v12[4] = a1;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__HDQuantitySampleSeriesEntity__isFrozenInDatabase_error___block_invoke_2;
    v11[3] = &unk_1E6CEA698;
    v7 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT insertion_era FROM quantity_sample_series WHERE data_id = ?"), a3, v12, v11);
    v8 = 1;
    if (!*((_BYTE *)v14 + 24))
      v8 = 2;
    if (v7)
      v9 = v8;
    else
      v9 = 0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __58__HDQuantitySampleSeriesEntity__isFrozenInDatabase_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "persistentID"));
}

uint64_t __58__HDQuantitySampleSeriesEntity__isFrozenInDatabase_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1BCCAB204](a2, 0))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

- (id)HFDKeyWithDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v16[0] = CFSTR("hfd_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__HDQuantitySampleSeriesEntity_HFDKeyWithDatabase_error___block_invoke;
  v11[3] = &unk_1E6CF7BB8;
  v11[4] = &v12;
  v8 = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v6, a4, v11);

  if (!v8)
    goto LABEL_5;
  if (!v13[3])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Unable to get %@ for %@ with persistentID %lld"), CFSTR("hfd_key"), objc_opt_class(), -[HDSQLiteEntity persistentID](self, "persistentID"));
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __57__HDQuantitySampleSeriesEntity_HFDKeyWithDatabase_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (uint64_t)_setHFDKey:(void *)a3 database:(uint64_t)a4 error:
{
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v12[0] = CFSTR("hfd_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HDQuantitySampleSeriesEntity__setHFDKey_database_error___block_invoke;
  v11[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
  v11[4] = a2;
  v9 = objc_msgSend(a1, "updateProperties:database:error:bindingHandler:", v8, v7, a4, v11);

  return v9;
}

void __58__HDQuantitySampleSeriesEntity__setHFDKey_database_error___block_invoke()
{
  JUMPOUT(0x1BCCAB114);
}

uint64_t __61__HDQuantitySampleSeriesEntity__insertValues_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;

  MEMORY[0x1BCCAB198](a3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  result = HDSQLiteColumnAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)primitiveInsertValues:(id)a3 seriesVersion:(int64_t)a4 HFDKey:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  float v19;
  float v20;
  double v21;
  BOOL v22;
  id v23;
  BOOL v24;
  id v25;
  void *v26;
  id *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v28 = a7;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v16, "value", v28);
        v18 = v17;
        v19 = -1.0;
        if (a4 == 1 && objc_msgSend(v16, "hasDuration"))
        {
          objc_msgSend(v16, "duration");
          v19 = v20;
        }
        objc_msgSend(v16, "timeInterval");
        v29 = 0;
        v22 = +[HDQuantitySeriesDataEntity insertOrReplaceEntity:database:value:duration:timestamp:identifier:error:](HDQuantitySeriesDataEntity, "insertOrReplaceEntity:database:value:duration:timestamp:identifier:error:", 1, v11, a5, &v29, v18, v19, v21);
        v23 = v29;
        if (!v22)
        {
          v25 = v23;
          v26 = v25;
          if (v25)
          {
            if (v28)
              *v28 = objc_retainAutorelease(v25);
            else
              _HKLogDroppedError();
          }

          v24 = 0;
          goto LABEL_18;
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v13)
        continue;
      break;
    }
  }
  v24 = 1;
LABEL_18:

  return v24;
}

+ (id)freezeSeriesWithIdentifier:(id)a3 metadata:(id)a4 endDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDFreezeQuantitySampleSeriesOperation *v15;
  HDSeriesFreezeResult *v16;
  uint64_t v17;
  void *v18;
  HDSeriesFreezeResult *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[HDFreezeQuantitySampleSeriesOperation initWithIdentifier:metadata:endDate:]([HDFreezeQuantitySampleSeriesOperation alloc], "initWithIdentifier:metadata:endDate:", v11, v12, v13);
  if (-[HDJournalableOperation performOrJournalWithProfile:error:](v15, "performOrJournalWithProfile:error:", v14, a7))
  {
    v16 = [HDSeriesFreezeResult alloc];
    v17 = -[HDFreezeQuantitySampleSeriesOperation freezeResult](v15, "freezeResult");
    -[HDFreezeQuantitySampleSeriesOperation frozenIdentifier](v15, "frozenIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDSeriesFreezeResult initWithStatus:frozenIdentifier:](v16, "initWithStatus:frozenIdentifier:", v17, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)performPostFirstJournalMergeCleanupWithTransaction:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id obj;
  id v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v23 = a4;
  v24 = v7;
  v30 = 0;
  objc_msgSend(a1, "quantitySampleSeriesEntitiesForAutoFreezeWithTransaction:error:", v7, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v30;
  if (v8)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v27;
      do
      {
        v12 = 0;
        v13 = v9;
        do
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
          objc_msgSend(v24, "protectedDatabase");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUIDForProperty:database:", CFSTR("uuid"), v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v13;
          +[HDQuantitySampleSeriesEntity freezeSeriesWithIdentifier:metadata:endDate:profile:error:](HDQuantitySampleSeriesEntity, "freezeSeriesWithIdentifier:metadata:endDate:profile:error:", v16, 0, 0, v23, &v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v25;

          if (!v17)
          {
            _HKInitializeLogging();
            v18 = (id)*MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = objc_msgSend(v14, "persistentID");
              *(_DWORD *)buf = 134218242;
              v32 = v19;
              v33 = 2114;
              v34 = v9;
              _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Failed to freeze quantity sample series %lld during post-journal-merge cleanup: %{public}@", buf, 0x16u);
            }

          }
          ++v12;
          v13 = v9;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v10);
    }

  }
  else
  {
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v32 = (uint64_t)v9;
      _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Failed to enumerate quantity sample series requiring auto-freeze during post-journal-merge cleanup: %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

+ (id)quantitySampleSeriesEntitiesForAutoFreezeWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "quantitySampleSeriesEntitiesForAutoFreezeSQL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[HDQuantitySampleSeriesEntity _insertionEra]();
  objc_msgSend(v6, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__HDQuantitySampleSeriesEntity_quantitySampleSeriesEntitiesForAutoFreezeWithTransaction_error___block_invoke;
  v16[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[4] = v9;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__HDQuantitySampleSeriesEntity_quantitySampleSeriesEntitiesForAutoFreezeWithTransaction_error___block_invoke_2;
  v14[3] = &unk_1E6CFD9A8;
  v11 = v7;
  v15 = v11;
  LOBYTE(a4) = objc_msgSend(v10, "executeSQL:error:bindingHandler:enumerationHandler:", v8, a4, v16, v14);

  if ((a4 & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

uint64_t __95__HDQuantitySampleSeriesEntity_quantitySampleSeriesEntitiesForAutoFreezeWithTransaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 3, 1209600);
}

uint64_t __95__HDQuantitySampleSeriesEntity_quantitySampleSeriesEntitiesForAutoFreezeWithTransaction_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  HDQuantitySampleSeriesEntity *v2;

  v1 = *(void **)(a1 + 32);
  v2 = -[HDSQLiteEntity initWithPersistentID:]([HDQuantitySampleSeriesEntity alloc], "initWithPersistentID:", HDSQLiteColumnAsInt64());
  objc_msgSend(v1, "addObject:", v2);

  return 1;
}

+ (id)quantitySampleSeriesEntitiesForAutoFreezeSQL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "disambiguatedDatabaseTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE ((%@ IS NOT NULL) AND (%@ != ?) AND ((%@ > 0) OR (ABS(? + %@) > ?)))"), CFSTR("data_id"), v3, CFSTR("insertion_era"), CFSTR("insertion_era"), CFSTR("insertion_era"), CFSTR("insertion_era"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)freezeWithEndDate:(id)a3 transaction:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void (*v47)(uint64_t);
  char v48;
  int v49;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  _QWORD v61[5];
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "protectedDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQuantitySampleSeriesEntity HFDKeyWithDatabase:error:](self, "HFDKeyWithDatabase:error:", v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v54 = v13;
    v55 = v14;
    v56 = v11;
    v57 = v10;
    v52 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    v62 = 0;
    v63 = (uint64_t)&v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__126;
    v66 = __Block_byref_object_dispose__126;
    v67 = 0;
    objc_msgSend((id)objc_opt_self(), "entityEnumeratorWithProfile:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForRowID((uint64_t)v15, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPredicate:", v18);

    objc_msgSend(v17, "setIgnoreEntityClassAdditionalPredicateForEnumeration:", 1);
    v60 = 0;
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __82__HDQuantitySampleSeriesEntity__quantitySampleWithID_canBeUnfrozen_profile_error___block_invoke;
    v61[3] = &unk_1E6CFD7F0;
    v61[4] = &v62;
    objc_msgSend(v17, "enumerateWithError:handler:", &v60, v61);
    v19 = v60;
    v20 = v19;
    v21 = *(void **)(v63 + 40);
    v58 = v21;
    if (v21)
    {
      v22 = v21;
      goto LABEL_12;
    }
    if (v19)
    {
      v20 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Could not find series with ID %@"), v15);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
LABEL_11:

LABEL_12:
        _Block_object_dispose(&v62, 8);

        objc_msgSend(v58, "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)objc_msgSend(v24, "copy");

        v25 = objc_msgSend(v55, "longLongValue");
        v26 = objc_msgSend(v55, "longLongValue");
        v59 = v58;
        v27 = v57;
        v28 = v11;
        v29 = v16;
        v51 = v25;
        if (self)
        {
          -[HDQuantitySampleSeriesEntity _dataOriginProvenanceWithTransaction:profile:error:](self, v28, v29, (uint64_t)a6);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            -[HDQuantitySampleSeriesEntity _updatedSampleForQuantitySeriesSample:HFDKey:endDate:transaction:error:]((uint64_t)self, v59, v26, v27, v28, (uint64_t)a6);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (!v31)
              goto LABEL_17;
            objc_msgSend(v31, "_setFreezing");
            objc_msgSend(v29, "dataManager");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v32;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "_creationTimestamp");
            v35 = objc_msgSend(v33, "insertDataObjects:withProvenance:creationDate:error:", v34, v30, a6);

            if ((v35 & 1) != 0)
            {
              objc_msgSend(v32, "UUID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
LABEL_17:
              v36 = 0;
            }

          }
          else
          {
            v36 = 0;
          }

        }
        else
        {
          v36 = 0;
        }

        if (!v36)
        {
          v23 = 0;
LABEL_31:

          v11 = v56;
          v10 = v57;
          v12 = v52;
          v13 = v54;
          v14 = v55;
          goto LABEL_32;
        }
        HDDataEntityPredicateForDataUUID();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v54, v37, a6);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v39 = (void *)objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDSQLiteEntity persistentID](self, "persistentID"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v38, "persistentID"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v39, "replaceObjectID:replacementObjectID:deleteOriginalSeriesData:profile:transaction:error:", v40, v41, 0, v29, v28, a6);

          if ((v42 & 1) != 0)
          {
            v43 = v38;
            v44 = v53;
            v45 = v54;
            objc_opt_self();
            v61[0] = CFSTR("uuid");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = (void *)MEMORY[0x1E0C809B0];
            v63 = 3221225472;
            v64 = (uint64_t)__136__HDQuantitySampleSeriesEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke;
            v65 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CFD818;
            v47 = (void (*)(uint64_t))v44;
            v66 = v47;
            v48 = objc_msgSend(v43, "updateProperties:database:error:bindingHandler:", v46, v45, a6, &v62);

            if ((v48 & 1) != 0)
            {
              v49 = -[HDQuantitySampleSeriesEntity _setHFDKey:database:error:](v43, v51, v45, (uint64_t)a6);

              if (v49)
              {
                v23 = v43;
LABEL_30:

                goto LABEL_31;
              }
            }
            else
            {

            }
          }
        }
        v23 = 0;
        goto LABEL_30;
      }
    }
    if (a6)
    {
      v20 = objc_retainAutorelease(v20);
      *a6 = v20;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_11;
  }
  v23 = 0;
LABEL_32:

  return v23;
}

+ (BOOL)deleteSeriesWithID:(id)a3 deleteSeriesData:(BOOL)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  _BOOL8 v10;
  id v11;
  id v12;
  id v13;
  HDDataEntityDeletionContext *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__126;
  v25 = __Block_byref_object_dispose__126;
  v26 = 0;
  v14 = -[HDDataEntityDeletionContext initWithProfile:transaction:]([HDDataEntityDeletionContext alloc], "initWithProfile:transaction:", v12, v13);
  -[HDDataEntityDeletionContext setInsertDeletedObjects:](v14, "setInsertDeletedObjects:", 0);
  -[HDDataEntityDeletionContext setCallWillDeleteWithProfileTransaction:](v14, "setCallWillDeleteWithProfileTransaction:", v10);
  HDDataEntityPredicateForRowID((uint64_t)v11, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__HDQuantitySampleSeriesEntity_deleteSeriesWithID_deleteSeriesData_profile_transaction_error___block_invoke;
  v20[3] = &unk_1E6CF7B40;
  v20[4] = &v27;
  v20[5] = &v21;
  +[HDSampleEntity deleteSamplesWithPredicate:limit:deletionContext:completionHandler:](HDSampleEntity, "deleteSamplesWithPredicate:limit:deletionContext:completionHandler:", v15, 0, v14, v20);

  v16 = (id)v22[5];
  v17 = v16;
  if (v16)
  {
    if (a7)
      *a7 = objc_retainAutorelease(v16);
    else
      _HKLogDroppedError();
  }

  v18 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __94__HDQuantitySampleSeriesEntity_deleteSeriesWithID_deleteSeriesData_profile_transaction_error___block_invoke(uint64_t a1, char a2, int a3, int a4, int a5, int a6, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (BOOL)replaceObjectID:(id)a3 replacementObjectID:(id)a4 deleteOriginalSeriesData:(BOOL)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  char v17;

  v11 = a5;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  if (+[HDAssociationEntity copyAssociationsFromChildID:toObjectID:profile:error:](HDAssociationEntity, "copyAssociationsFromChildID:toObjectID:profile:error:", v14, a4, v15, a8))
  {
    v17 = objc_msgSend(a1, "deleteSeriesWithID:deleteSeriesData:profile:transaction:error:", v14, v11, v15, v16, a8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_dataOriginProvenanceWithTransaction:(void *)a3 profile:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a2;
  v8 = a3;
  objc_msgSend(v7, "protectedDatabase");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForProperty:database:", CFSTR("provenance"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "dataProvenanceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "originProvenanceForPersistentID:transaction:error:", v10, v7, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Unable to get %@ for %@ with persistentID %lld"), CFSTR("provenance"), objc_opt_class(), objc_msgSend(a1, "persistentID"));
    v12 = 0;
  }

  return v12;
}

- (id)_updatedSampleForQuantitySeriesSample:(uint64_t)a3 HFDKey:(void *)a4 endDate:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  double *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  _QWORD v78[7];
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[4];
  id v92;
  id v93;
  uint64_t v94;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  v87 = 0;
  v88 = (double *)&v87;
  v89 = 0x2020000000;
  v90 = 0;
  v83 = 0;
  v84 = (double *)&v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = &v79;
  v81 = 0x2020000000;
  v82 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __103__HDQuantitySampleSeriesEntity__updatedSampleForQuantitySeriesSample_HFDKey_endDate_transaction_error___block_invoke;
  v78[3] = &unk_1E6CFD780;
  v78[4] = &v87;
  v78[5] = &v83;
  v78[6] = &v79;
  if (!-[HDQuantitySampleSeriesEntity _getFirstTimeEndTimeCountWithTransaction:HFDKey:error:handler:](a1, v13, a3, a6, v78))goto LABEL_8;
  v15 = v88[3];
  objc_msgSend(v11, "_startTimestamp");
  if (v15 >= v16)
  {
    if (v12)
    {
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      if (v22 < v84[3])
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        v18 = v23;
        v19 = *((_QWORD *)v84 + 3);
        v20 = CFSTR("Cannot freeze series %@ because the specifed sample endTime (%f) is before the last quantity end time (%f)");
        v21 = 3;
        goto LABEL_7;
      }
      objc_msgSend(v11, "quantityType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "isMaximumDurationRestricted") & 1) != 0)
      {
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        v30 = v29;
        objc_msgSend(v11, "_startTimestamp");
        v32 = v31;
        objc_msgSend(v11, "quantityType");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "maximumAllowedDuration");
        v35 = v34;

        if (v30 - v32 > v35)
        {
          v36 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v11, "startDate");
          v37 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "quantityType");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "hk_assignError:code:format:", a6, 3, CFSTR("Cannot freeze series %@ because the series start date (%@) and specified endDate (%@) exceed the maximum allowed duration for sample type (%@)"), v11, v37, v12, v77);
LABEL_18:
          v24 = 0;
LABEL_51:

          goto LABEL_9;
        }
      }
      else
      {

      }
      objc_msgSend(v11, "quantityType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v38, "isMinimumDurationRestricted") & 1) != 0)
      {
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        v40 = v39;
        objc_msgSend(v11, "_startTimestamp");
        v42 = v41;
        objc_msgSend(v11, "quantityType");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "minimumAllowedDuration");
        v45 = v44;

        if (v40 - v42 < v45)
        {
          v46 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v11, "startDate");
          v37 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "quantityType");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "hk_assignError:code:format:", a6, 3, CFSTR("Cannot freeze series %@ because the duration between the series start date (%@) and specified endDate (%@) falls below the minimum allowed duration for sample type (%@)"), v11, v37, v12, v77);
          goto LABEL_18;
        }
      }
      else
      {

      }
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v26 = v84;
    }
    else
    {
      v26 = v84;
      v27 = *((_QWORD *)v84 + 3);
    }
    *((_QWORD *)v26 + 3) = v27;
    v47 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "_setUUID:", v77);
    objc_msgSend(v47, "_setEndTimestamp:", v84[3]);
    objc_msgSend(v47, "_setCount:", v80[3]);
    if (v80[3] < 1)
    {
LABEL_50:
      v37 = v47;
      v24 = v37;
      goto LABEL_51;
    }
    v37 = v47;
    v75 = v13;
    v76 = v12;
    objc_opt_self();
    objc_msgSend(v37, "quantityType");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "aggregationStyle");

    if (v49 >= 4)
      v50 = 0;
    else
      v50 = qword_1B7F41F78[v49];
    objc_msgSend(v37, "quantityType");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDStatisticsCollectionCalculator calculatorForQuantityType:intervalCollection:options:mergeStrategy:](HDStatisticsCollectionCalculator, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v51, 0, v50, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v52;
    v54 = v75;
    objc_opt_self();
    v91[0] = v14;
    v91[1] = 3221225472;
    v91[2] = __93__HDQuantitySampleSeriesEntity__statisticsWithHFDKey_statisticsCalculator_transaction_error___block_invoke;
    v91[3] = &unk_1E6CFD9F8;
    v94 = a3;
    v55 = v54;
    v92 = v55;
    v56 = v53;
    v93 = v56;
    if ((objc_msgSend(v56, "performInitialStatisticsTransaction:error:", v91, a6) & 1) != 0)
    {
      objc_msgSend(v56, "currentStatistics");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57;
      if (v57)
        v59 = v57;
      else
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 100, CFSTR("No statistics for quantity sample series with HFDKey (%lld)"), a3);

    }
    else
    {
      v58 = 0;
    }

    if (!v58)
    {

      v24 = 0;
      v12 = v76;
      goto LABEL_51;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v60 = v58;
      v61 = v37;
      objc_opt_self();
      objc_msgSend(v60, "averageQuantity");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        objc_msgSend(v60, "averageQuantity");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "_setAverageQuantity:", v63);

      }
      objc_msgSend(v60, "minimumQuantity");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        objc_msgSend(v60, "minimumQuantity");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "_setMinimumQuantity:", v65);

      }
      objc_msgSend(v60, "maximumQuantity");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (v66)
      {
        objc_msgSend(v60, "maximumQuantity");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "_setMaximumQuantity:", v67);

      }
      objc_msgSend(v60, "mostRecentQuantity");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      if (v68)
      {
        objc_msgSend(v60, "mostRecentQuantity");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "_setMostRecentQuantity:", v69);

      }
      objc_msgSend(v60, "mostRecentQuantityDateInterval");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v70)
        goto LABEL_48;
      objc_msgSend(v60, "mostRecentQuantityDateInterval");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "_setMostRecentQuantityDateInterval:", v71);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_49:

        v12 = v76;
        goto LABEL_50;
      }
      v72 = v58;
      v73 = v37;
      objc_opt_self();
      objc_msgSend(v72, "sumQuantity");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v74)
      {
LABEL_48:

        goto LABEL_49;
      }
      objc_msgSend(v72, "sumQuantity");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "_setSumQuantity:", v71);
    }

    goto LABEL_48;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v18 = *((_QWORD *)v88 + 3);
  objc_msgSend(v11, "_startTimestamp");
  v20 = CFSTR("Cannot freeze series %@ because the first quantity time (%f) is before the sample start time (%f)");
  v21 = 100;
LABEL_7:
  objc_msgSend(v17, "hk_assignError:code:format:", a6, v21, v20, v11, v18, v19);
LABEL_8:
  v24 = 0;
LABEL_9:
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);

  return v24;
}

+ (BOOL)replaceExistingObject:(id)a3 existingObjectID:(id)a4 replacementObject:(id)a5 replacementObjectID:(id)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unsigned __int8 v24;
  BOOL v25;
  void *v27;
  void *v28;
  objc_super v29;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDQuantitySampleSeriesEntity.mm"), 743, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[existingObject isKindOfClass:[HKQuantitySample class]]"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDQuantitySampleSeriesEntity.mm"), 744, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[replacementObject isKindOfClass:[HKQuantitySample class]]"));

  }
  v22 = v16;
  v23 = v18;
  if ((objc_msgSend(v22, "_frozen") & 1) != 0 || !objc_msgSend(v23, "_frozen"))
  {
    v29.receiver = a1;
    v29.super_class = (Class)&OBJC_METACLASS___HDQuantitySampleSeriesEntity;
    v24 = objc_msgSendSuper2(&v29, sel_replaceExistingObject_existingObjectID_replacementObject_replacementObjectID_profile_transaction_error_, v22, v17, v23, v19, v20, v21, a9);
  }
  else
  {
    v24 = objc_msgSend(a1, "replaceObjectID:replacementObjectID:deleteOriginalSeriesData:profile:transaction:error:", v17, v19, 0, v20, v21, a9);
  }
  v25 = v24;

  return v25;
}

_QWORD *__103__HDQuantitySampleSeriesEntity__updatedSampleForQuantitySeriesSample_HFDKey_endDate_transaction_error___block_invoke(_QWORD *result, uint64_t a2, double a3, double a4)
{
  *(double *)(*(_QWORD *)(result[4] + 8) + 24) = a3;
  *(double *)(*(_QWORD *)(result[5] + 8) + 24) = a4;
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = a2;
  return result;
}

- (BOOL)_getFirstTimeEndTimeCountWithTransaction:(uint64_t)a3 HFDKey:(uint64_t)a4 error:(void *)a5 handler:
{
  id v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  _QWORD v14[4];
  id v15;

  v9 = a2;
  v10 = a5;
  v11 = v10;
  if (a1)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __94__HDQuantitySampleSeriesEntity__getFirstTimeEndTimeCountWithTransaction_HFDKey_error_handler___block_invoke;
    v14[3] = &unk_1E6CFDA98;
    v15 = v10;
    v12 = +[HDQuantitySeriesDataEntity getRangeAndCountForSeriesIdentifier:transaction:error:handler:](HDQuantitySeriesDataEntity, "getRangeAndCountForSeriesIdentifier:transaction:error:handler:", a3, v9, a4, v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

BOOL __93__HDQuantitySampleSeriesEntity__statisticsWithHFDKey_statisticsCalculator_transaction_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__126;
  v17 = __Block_byref_object_dispose__126;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __93__HDQuantitySampleSeriesEntity__statisticsWithHFDKey_statisticsCalculator_transaction_error___block_invoke_2;
  v10[3] = &unk_1E6CFD9D0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v12 = &v13;
  v5 = +[HDQuantitySeriesDataEntity enumerateSeries:transaction:error:handler:](HDQuantitySeriesDataEntity, "enumerateSeries:transaction:error:handler:", v4, v3, a2, v10);
  if (!v5)
  {
    v6 = (void *)v14[5];
    if (v6)
    {
      v7 = v6;
      v8 = v7;
      if (a2)
        *a2 = objc_retainAutorelease(v7);
      else
        _HKLogDroppedError();

    }
  }

  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __93__HDQuantitySampleSeriesEntity__statisticsWithHFDKey_statisticsCalculator_transaction_error___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id obj;

  v5 = -0.0;
  if (a4 != -1.0)
    v5 = a4;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "addSampleValue:startTime:endTime:sourceID:error:", 0, &obj, a3, a2, v5 + a2);
  objc_storeStrong((id *)(v7 + 40), obj);
  return v8;
}

void __136__HDQuantitySampleSeriesEntity__updateFrozenEntityToMatchReplacedUnfrozenEntity_unfrozenSeriesUUID_unfrozenSeriesHFDKey_database_error___block_invoke()
{
  JUMPOUT(0x1BCCAB168);
}

+ (BOOL)enumerateDataWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__HDQuantitySampleSeriesEntity_enumerateDataWithIdentifier_profile_error_handler___block_invoke;
  v16[3] = &unk_1E6CFD868;
  v19 = a1;
  v13 = v10;
  v17 = v13;
  v14 = v11;
  v18 = v14;
  LOBYTE(a5) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDQuantitySampleSeriesEntity, "performReadTransactionWithHealthDatabase:error:block:", v12, a5, v16);

  return (char)a5;
}

uint64_t __82__HDQuantitySampleSeriesEntity_enumerateDataWithIdentifier_profile_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "enumerateDataWithIdentifier:transaction:error:handler:", *(_QWORD *)(a1 + 32), a2, a3, *(_QWORD *)(a1 + 40));
}

+ (BOOL)enumerateDataWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "protectedDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v12, v13, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;

  if (!v14)
  {
    if (v15)
    {
      v15 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Could not find frozen series with ID %@"), v9);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
LABEL_9:

        v16 = 0;
        goto LABEL_10;
      }
    }
    if (a5)
    {
      v15 = objc_retainAutorelease(v15);
      *a5 = v15;
    }
    else
    {
      _HKLogDroppedError();
    }
    goto LABEL_9;
  }
  v16 = objc_msgSend(v14, "enumerateDataWithTransaction:error:handler:", v10, a5, v11);
LABEL_10:

  return v16;
}

+ (id)additionalPredicateForEnumeration
{
  return (id)objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("insertion_era"));
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDQuantitySampleSeriesEntityEncoder *v15;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDQuantitySampleSeriesEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v11, v12, a5, v13, v14);

  return v15;
}

uint64_t __82__HDQuantitySampleSeriesEntity__quantitySampleWithID_canBeUnfrozen_profile_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

+ (id)hasSeriesDataForHFDKey:(int64_t)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HDQuantitySampleSeriesEntity_hasSeriesDataForHFDKey_transaction_error___block_invoke;
  v10[3] = &unk_1E6CFDA20;
  v10[4] = &v11;
  if (+[HDQuantitySeriesDataEntity enumerateSeries:transaction:error:handler:](HDQuantitySeriesDataEntity, "enumerateSeries:transaction:error:handler:", a3, v7, a5, v10))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v12 + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __73__HDQuantitySampleSeriesEntity_hasSeriesDataForHFDKey_transaction_error___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

- (id)hasSeriesDataWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "protectedDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQuantitySampleSeriesEntity HFDKeyWithDatabase:error:](self, "HFDKeyWithDatabase:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "hasSeriesDataForHFDKey:transaction:error:", objc_msgSend(v8, "longLongValue"), v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)countForSeriesWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__126;
  v19 = __Block_byref_object_dispose__126;
  v20 = 0;
  v13[4] = &v15;
  v14 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HDQuantitySampleSeriesEntity_countForSeriesWithTransaction_error___block_invoke;
  v13[3] = &unk_1E6CFD6B8;
  LODWORD(self) = -[HDQuantitySampleSeriesEntity startTimeEndTimeCountForSeriesWithTransaction:error:handler:](self, "startTimeEndTimeCountForSeriesWithTransaction:error:handler:", v6, &v14, v13);
  v7 = v14;
  v8 = v7;
  if ((_DWORD)self)
  {
    v9 = (id)v16[5];
  }
  else if ((objc_msgSend(v7, "hk_isHealthKitErrorWithCode:", 1100) & 1) != 0)
  {
    v9 = &unk_1E6DFE2D0;
  }
  else
  {
    v10 = v8;
    v11 = v10;
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v9 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __68__HDQuantitySampleSeriesEntity_countForSeriesWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)startTimeEndTimeCountForSeriesWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQuantitySampleSeriesEntity HFDKeyWithDatabase:error:](self, "HFDKeyWithDatabase:error:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "protectedDatabase");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSQLiteEntity dateForProperty:database:](self, "dateForProperty:database:", CFSTR("start_date"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_msgSend(v11, "longLongValue");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __92__HDQuantitySampleSeriesEntity_startTimeEndTimeCountForSeriesWithTransaction_error_handler___block_invoke;
      v17[3] = &unk_1E6CFDA48;
      v19 = v9;
      v18 = v13;
      v15 = -[HDQuantitySampleSeriesEntity _getFirstTimeEndTimeCountWithTransaction:HFDKey:error:handler:]((uint64_t)self, v8, v14, (uint64_t)a4, v17);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Unable to get %@ for %@ with persistentID %lld"), CFSTR("start_date"), objc_opt_class(), -[HDSQLiteEntity persistentID](self, "persistentID"));
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __92__HDQuantitySampleSeriesEntity_startTimeEndTimeCountForSeriesWithTransaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (BOOL)enumerateDataWithTransaction:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "protectedDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQuantitySampleSeriesEntity HFDKeyWithDatabase:error:](self, "HFDKeyWithDatabase:error:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = objc_msgSend((id)objc_opt_class(), "enumerateDataWithTransaction:HFDKey:error:handler:", v8, objc_msgSend(v11, "longLongValue"), a4, v9);
  else
    v12 = 0;

  return v12;
}

+ (BOOL)enumerateDataWithTransaction:(id)a3 HFDKey:(int64_t)a4 error:(id *)a5 handler:(id)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v10 = a6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__HDQuantitySampleSeriesEntity_enumerateDataWithTransaction_HFDKey_error_handler___block_invoke;
  v13[3] = &unk_1E6CF0728;
  v14 = v10;
  v11 = v10;
  LOBYTE(a5) = objc_msgSend(a1, "enumerateRawDataWithTransaction:HFDKey:error:handler:", a3, a4, a5, v13);

  return (char)a5;
}

uint64_t __82__HDQuantitySampleSeriesEntity_enumerateDataWithTransaction_HFDKey_error_handler___block_invoke(uint64_t a1, double a2, double a3, float a4)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  if (a4 == -1.0)
    objc_msgSend(MEMORY[0x1E0CB6478], "datumWithValue:timeInterval:", a3, a2);
  else
    objc_msgSend(MEMORY[0x1E0CB6478], "datumWithTimestamp:value:duration:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  return v6;
}

+ (BOOL)enumerateRawDataWithTransaction:(id)a3 HFDKey:(int64_t)a4 error:(id *)a5 handler:(id)a6
{
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__HDQuantitySampleSeriesEntity_enumerateRawDataWithTransaction_HFDKey_error_handler___block_invoke;
  v12[3] = &unk_1E6CFDA70;
  v13 = v9;
  v10 = v9;
  LOBYTE(a5) = +[HDQuantitySeriesDataEntity enumerateSeries:transaction:error:handler:](HDQuantitySeriesDataEntity, "enumerateSeries:transaction:error:handler:", a4, a3, a5, v12);

  return (char)a5;
}

uint64_t __85__HDQuantitySampleSeriesEntity_enumerateRawDataWithTransaction_HFDKey_error_handler___block_invoke(uint64_t a1, __n128 a2, __n128 a3, double a4)
{
  float v4;

  v4 = a4;
  return (*(uint64_t (**)(__n128, __n128, float))(*(_QWORD *)(a1 + 32) + 16))(a2, a3, v4);
}

uint64_t __94__HDQuantitySampleSeriesEntity__getFirstTimeEndTimeCountWithTransaction_HFDKey_error_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  int64_t v14;
  objc_super v15;
  id v16;
  uint8_t buf[4];
  int64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!self)
  {

    goto LABEL_5;
  }
  if (!-[HDSQLiteEntity existsInDatabase:](self, "existsInDatabase:", v6))
  {

    goto LABEL_10;
  }
  v16 = 0;
  -[HDQuantitySampleSeriesEntity HFDKeyWithDatabase:error:](self, "HFDKeyWithDatabase:error:", v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (!v8)
  {
    _HKInitializeLogging();
    v12 = (id)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = -[HDSQLiteEntity persistentID](self, "persistentID");
      *(_DWORD *)buf = 134218242;
      v18 = v14;
      v19 = 2114;
      v20 = v9;
      _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Failed to find HFD Key when deleting object with persistent id %lld: %{public}@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  v10 = +[HDQuantitySeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDQuantitySeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", objc_msgSend(v8, "longLongValue"), v7, a4);

  if (v10)
  {
LABEL_10:
    v15.receiver = self;
    v15.super_class = (Class)HDQuantitySampleSeriesEntity;
    v11 = -[HDSQLiteEntity deleteFromDatabase:error:](&v15, sel_deleteFromDatabase_error_, v7, a4);
    goto LABEL_11;
  }
LABEL_5:
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)willDeleteFromDatabase:(id)a3
{
  -[HDQuantitySampleSeriesEntity deleteFromDatabase:error:](self, "deleteFromDatabase:error:", a3, 0);
}

+ (BOOL)deleteSeriesDataWithKey:(int64_t)a3 database:(id)a4 error:(id *)a5
{
  return +[HDQuantitySeriesDataEntity deleteSeriesDataWithIdentifier:database:error:](HDQuantitySeriesDataEntity, "deleteSeriesDataWithIdentifier:database:error:", a3, a4, a5);
}

+ (BOOL)primitiveRemoveDatums:(id)a3 HFDKey:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a5;
  objc_msgSend(a3, "hk_map:", &__block_literal_global_317_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = +[HDQuantitySeriesDataEntity deleteSeriesDataWithIdentifier:timestamps:database:error:](HDQuantitySeriesDataEntity, "deleteSeriesDataWithIdentifier:timestamps:database:error:", a4, v10, v11, a6);

  return (char)a6;
}

id __79__HDQuantitySampleSeriesEntity_primitiveRemoveDatums_HFDKey_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "startDate");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsObjectMerging
{
  return 1;
}

+ (id)mergeDataObject:(id)a3 provenance:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7 insertHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  int64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v46;
  id v47;
  void *v48;
  BOOL v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  uint8_t buf[8];
  id v56;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "databaseForEntityClass:", a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dataEntityForObject:transaction:error:", v12, v14, a7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v15;
      v18 = objc_msgSend(v16, "existsInDatabase:", v17);

      if ((v18 & 1) != 0)
      {
        v19 = v12;
        v53 = v13;
        v50 = v17;
        objc_msgSend(v19, "codableQuantitySample");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = 0;
        v54 = v50;
        v20 = -[HDQuantitySampleSeriesEntity _isFrozenInDatabase:error:]((uint64_t)v16, v54, (uint64_t)&v56);
        v21 = v56;
        v22 = v21;
        if (v20)
        {
          if (v20 == 2)
          {

            goto LABEL_7;
          }
          v37 = v54;
          v51 = v19;
          objc_msgSend(v16, "HFDKeyWithDatabase:error:", v37, a7);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38)
          {
            v40 = +[HDQuantitySampleSeriesEntity _hasSeriesDataWithDatabase:hfdKey:error:](HDQuantitySampleSeriesEntity, "_hasSeriesDataWithDatabase:hfdKey:error:", v37, objc_msgSend(v38, "longLongValue"), a7);

            if (v40)
            {
              if (v40 != 2)
              {
                v19 = v51;
                _HKInitializeLogging();
                v43 = *MEMORY[0x1E0CB52B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_INFO, "Cannot merge series data with frozen & final series", buf, 2u);
                }

                v23 = v52;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
                v44 = objc_claimAutoreleasedReturnValue();
                goto LABEL_35;
              }
              v19 = v51;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = +[HDQuantitySampleSeriesEntity _deleteHFDSeriesIfFoundForPersistentID:database:error:]((uint64_t)HDQuantitySampleSeriesEntity, v41, v37, (uint64_t)a7);

              if (!v49)
              {
                v34 = 0;
LABEL_39:
                v23 = v52;
                goto LABEL_40;
              }
LABEL_7:
              v23 = v52;
              objc_msgSend(v52, "quantitySeriesDatas");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                objc_msgSend(v52, "quantitySeriesDatas");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "hk_map:", &__block_literal_global_318_0);
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                LODWORD(v25) = -[HDQuantitySampleSeriesEntity _insertValues:database:error:](v16, v26, v54, (uint64_t)a7);
                if (!(_DWORD)v25)
                {
                  v34 = 0;
LABEL_40:
                  v42 = v54;
                  goto LABEL_41;
                }
              }
              if (!objc_msgSend(v52, "hasFinal") || objc_msgSend(v52, "final"))
              {
                v27 = (void *)objc_opt_class();
                objc_msgSend(v19, "UUID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = 0;
                objc_msgSend(v27, "freezeSeriesWithIdentifier:metadata:endDate:profile:error:", v28, 0, 0, v53, &v56);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v56;

                if (objc_msgSend(v29, "status") == 1
                  && (objc_msgSend(v29, "frozenIdentifier"),
                      v31 = (void *)objc_claimAutoreleasedReturnValue(),
                      v31,
                      v31))
                {
                  v47 = v30;
                  objc_msgSend(v29, "frozenIdentifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  HDDataEntityPredicateForDataUUID();
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)buf = 0;
                  +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v54, v32, buf);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = *(id *)buf;

                  if (v48)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v48, "persistentID"));
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a7, 100, CFSTR("Failed to lookup frozen series entity during merge operation."), v33);
                    v34 = 0;
                  }

                  v30 = v47;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a7, 100, CFSTR("Failed to insert frozen series during merge operation."), v30);
                  v34 = 0;
                }

                goto LABEL_39;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
              v44 = objc_claimAutoreleasedReturnValue();
LABEL_35:
              v34 = (void *)v44;
              goto LABEL_40;
            }
LABEL_30:

            v42 = v54;
            v34 = 0;
            v19 = v51;
            v23 = v52;
LABEL_41:

            goto LABEL_42;
          }
        }
        else
        {
          v36 = v21;
          v37 = v36;
          v51 = v19;
          if (v36)
          {
            if (a7)
            {
              v37 = objc_retainAutorelease(v36);
              *a7 = v37;
            }
            else
            {
              _HKLogDroppedError();
            }
          }
        }

        goto LABEL_30;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "persistentID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDQuantitySampleSeriesEntity _insertDataObject:inDatabase:persistentID:error:]((uint64_t)a1, v12, v17, v35, (uint64_t)a7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = 0;
    }
LABEL_42:

    goto LABEL_43;
  }
  v34 = 0;
LABEL_43:

  return v34;
}

id __103__HDQuantitySampleSeriesEntity__mergeCodableSeriesDataFromQuantitySampleSeries_profile_database_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  float v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  v2 = a2;
  if (objc_msgSend(v2, "hasStartDate"))
    objc_msgSend(v2, "startDate");
  else
    objc_msgSend(v2, "endDate");
  v4 = v3;
  v5 = -1.0;
  if (objc_msgSend(v2, "hasStartDate"))
  {
    objc_msgSend(v2, "endDate");
    v7 = v6;
    objc_msgSend(v2, "startDate");
    v5 = v7 - v8;
  }
  v9 = (void *)MEMORY[0x1E0CB6478];
  objc_msgSend(v2, "value");
  *(float *)&v10 = v5;
  objc_msgSend(v9, "datumWithTimestamp:value:duration:", v4, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (int64_t)_hasSeriesDataWithDatabase:(id)a3 hfdKey:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  int64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  +[HDQuantitySeriesDataEntity predicateForSeriesIdentifier:](HDQuantitySeriesDataEntity, "predicateForSeriesIdentifier:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = &v17;
  v16 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__HDQuantitySampleSeriesEntity__hasSeriesDataWithDatabase_hfdKey_error___block_invoke;
  v15[3] = &unk_1E6CFDA20;
  v9 = +[HDQuantitySeriesDataEntity enumerateWithDatabase:predicate:error:handler:](HDQuantitySeriesDataEntity, "enumerateWithDatabase:predicate:error:handler:", v7, v8, &v16, v15);
  v10 = v16;

  if (v9)
  {
    if (*((_BYTE *)v18 + 24))
      v11 = 1;
    else
      v11 = 2;
  }
  else
  {
    v12 = v10;
    v13 = v12;
    if (v12)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    v11 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __72__HDQuantitySampleSeriesEntity__hasSeriesDataWithDatabase_hfdKey_error___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void __64__HDQuantitySampleSeriesEntity__setInsertionEra_database_error___block_invoke()
{
  JUMPOUT(0x1BCCAB114);
}

+ (id)removeValues:(id)a3 fromQuantitySeriesSample:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__126;
  v30 = __Block_byref_object_dispose__126;
  v31 = 0;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__HDQuantitySampleSeriesEntity_removeValues_fromQuantitySeriesSample_profile_error___block_invoke;
  v20[3] = &unk_1E6CFDB20;
  v24 = &v26;
  v25 = a1;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v16 = v12;
  v23 = v16;
  LODWORD(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v13, a6, v20);

  if ((_DWORD)a6)
    v17 = (void *)v27[5];
  else
    v17 = 0;
  v18 = v17;

  _Block_object_dispose(&v26, 8);
  return v18;
}

BOOL __84__HDQuantitySampleSeriesEntity_removeValues_fromQuantitySeriesSample_profile_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  HDDataDeletionConfiguration *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  BOOL v45;
  uint64_t v46;
  void *v47;
  HDDataDeletionConfiguration *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  _BOOL8 v54;
  void *v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  int v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)a1[4];
  v7 = (void *)a1[5];
  v8 = (void *)a1[6];
  v82 = 0;
  v81 = v6;
  v9 = v7;
  v10 = v5;
  v80 = v8;
  objc_opt_self();
  objc_msgSend(v10, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v11, v13, &v83);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v83;

  if (!v14)
  {
    if (v15)
    {
      v21 = v15;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = objc_opt_class();
      objc_msgSend(v9, "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v23, sel__removeValues_fromQuantitySeriesSample_transaction_profile_error_, CFSTR("No quantity series sample found with UUID \"%@\"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v25;
      if (!v21)
      {
        v17 = 0;
        v15 = 0;
LABEL_18:
        v20 = 0;
        goto LABEL_40;
      }
    }
    v17 = objc_retainAutorelease(v21);
    v20 = 0;
    v82 = v17;
    v15 = v17;
    goto LABEL_40;
  }
  objc_msgSend(v10, "protectedDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "HFDKeyWithDatabase:error:", v16, &v82);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (!v17
    || !+[HDQuantitySampleSeriesEntity primitiveRemoveDatums:HFDKey:transaction:error:](HDQuantitySampleSeriesEntity, "primitiveRemoveDatums:HFDKey:transaction:error:", v81, objc_msgSend(v17, "longLongValue"), v10, &v82))
  {
    goto LABEL_18;
  }
  objc_msgSend(v14, "countForSeriesWithTransaction:error:", v10, &v82);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v79 = v18;
    v19 = objc_msgSend(v18, "integerValue");
    if (v19 == objc_msgSend(v9, "count"))
    {
      v20 = v9;
LABEL_38:
      v18 = v79;
      goto LABEL_39;
    }
    if (!v19)
    {
      objc_msgSend(v80, "dataManager");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_alloc_init(HDDataDeletionConfiguration);
      objc_msgSend(v78, "deleteObjectsWithUUIDCollection:configuration:error:", v34, v35, &v82);

      v20 = 0;
      goto LABEL_38;
    }
    v63 = objc_msgSend(v17, "longLongValue");
    v26 = v9;
    v67 = v14;
    v68 = v10;
    v69 = v80;
    v66 = v26;
    objc_opt_self();
    objc_msgSend(v26, "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v19;
    v70 = (void *)objc_msgSend(v27, "copy");

    v72 = v66;
    v76 = v67;
    v77 = v68;
    v73 = v69;
    objc_opt_self();
    -[HDQuantitySampleSeriesEntity _dataOriginProvenanceWithTransaction:profile:error:](v76, v77, v73, (uint64_t)&v82);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v61 = v28;
      objc_msgSend(v72, "endDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDQuantitySampleSeriesEntity _updatedSampleForQuantitySeriesSample:HFDKey:endDate:transaction:error:]((uint64_t)v76, v72, v63, v29, v77, (uint64_t)&v82);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_20;
      objc_msgSend(v73, "dataManager");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v74, "insertDataObjects:withProvenance:creationDate:error:", v31, v61, &v82, CFAbsoluteTimeGetCurrent());

      if ((v32 & 1) != 0)
      {
        objc_msgSend(v30, "UUID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_20:
        v75 = 0;
      }

      v28 = v61;
    }
    else
    {
      v75 = 0;
    }

    if (!v75)
    {
      v20 = 0;
LABEL_37:

      goto LABEL_38;
    }
    objc_msgSend(v77, "protectedDatabase");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v36, v37, &v82);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v62;
    if (v62)
    {
      if (v58 < 2)
        goto LABEL_28;
      v59 = v76;
      v39 = v62;
      v40 = v77;
      objc_msgSend(v40, "databaseForEntityClass:", objc_opt_self());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[HDQuantitySampleSeriesEntity _setHFDKey:database:error:](v59, 0, v41, (uint64_t)&v82) & 1) == 0)
      {

        goto LABEL_35;
      }
      v64 = -[HDQuantitySampleSeriesEntity _setHFDKey:database:error:](v39, v63, v41, (uint64_t)&v82);

      v38 = v62;
      if (v64)
      {
LABEL_28:
        v42 = v76;
        v57 = v70;
        v60 = v38;
        v65 = v73;
        v56 = v42;
        objc_opt_self();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v42, "persistentID"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v60, "persistentID"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = +[HDAssociationEntity copyAssociationsFromChildID:toObjectID:profile:error:](HDAssociationEntity, "copyAssociationsFromChildID:toObjectID:profile:error:", v43, v44, v65, &v82);

        if (v45)
        {
          objc_msgSend(v65, "dataManager");
          v46 = objc_claimAutoreleasedReturnValue();
          v84[0] = v57;
          v71 = (void *)v46;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_alloc_init(HDDataDeletionConfiguration);
          LOBYTE(v46) = objc_msgSend((id)v46, "deleteObjectsWithUUIDCollection:configuration:error:", v47, v48, &v82);

          if ((v46 & 1) != 0)
          {
            v38 = v62;
            +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDQuantitySampleSeriesEntity, "objectWithUUID:encodingOptions:profile:error:", v75, 0, v65, &v82);
            v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

            goto LABEL_37;
          }
        }
        else
        {

        }
LABEL_35:
        v20 = 0;
        v38 = v62;
        goto LABEL_36;
      }
    }
    v20 = 0;
    goto LABEL_36;
  }
  v20 = 0;
LABEL_39:

LABEL_40:
  v49 = v82;
  v50 = *(_QWORD *)(a1[7] + 8);
  v51 = *(void **)(v50 + 40);
  *(_QWORD *)(v50 + 40) = v20;

  v52 = v49;
  v53 = v52;
  if (v52)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v52);
    else
      _HKLogDroppedError();
  }

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    v54 = 1;
  else
    v54 = v53 == 0;

  return v54;
}

+ (void)unitTesting_updateInsertionEra
{
  ++qword_1ED552468;
}

+ (BOOL)unitTesting_insertValues:(id)a3 quantitySample:(id)a4 seriesVersion:(int64_t)a5 profile:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  SEL v27;
  int64_t v28;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDQuantitySampleSeriesEntity.mm"), 1687, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("values != nil"));

  }
  objc_msgSend(v14, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __100__HDQuantitySampleSeriesEntity_unitTesting_insertValues_quantitySample_seriesVersion_profile_error___block_invoke;
  v23[3] = &unk_1E6CFDB48;
  v18 = v16;
  v24 = v18;
  v26 = a1;
  v27 = a2;
  v19 = v13;
  v25 = v19;
  v28 = a5;
  v20 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v17, a7, v23);

  return v20;
}

BOOL __100__HDQuantitySampleSeriesEntity_unitTesting_insertValues_quantitySample_seriesVersion_profile_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v20;
  id v21;
  id v22;

  v5 = a2;
  objc_msgSend(v5, "protectedDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForDataUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v6, v7, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;

  if (v8)
  {
    objc_msgSend(v5, "protectedDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v11 = -[HDQuantitySampleSeriesEntity _isFrozenInDatabase:error:]((uint64_t)v8, v10, (uint64_t)&v21);
    v12 = v21;

    if (v11 == 2)
    {
      objc_msgSend(v5, "protectedDatabase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "HFDKeyWithDatabase:error:", v13, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = a1[5];
        v20 = a1[8];
        v16 = objc_msgSend(v14, "longLongValue");
        objc_msgSend(v5, "protectedDatabase");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = +[HDQuantitySampleSeriesEntity primitiveInsertValues:seriesVersion:HFDKey:database:error:](HDQuantitySampleSeriesEntity, "primitiveInsertValues:seriesVersion:HFDKey:database:error:", v15, v20, v16, v17, a3);

      }
      else
      {
        v18 = 0;
      }

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 3, CFSTR("Unable to add data to a frozen series."), v12);
LABEL_8:
    v18 = 0;
    goto LABEL_16;
  }
  if (v9)
  {
    v12 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[7], CFSTR("Unable to find quantity series '%@'"), a1[4]);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v9 = 0;
      goto LABEL_8;
    }
  }
  if (a3)
  {
    v12 = objc_retainAutorelease(v12);
    v18 = 0;
    *a3 = v12;
  }
  else
  {
    _HKLogDroppedError();
    v18 = 0;
  }
  v9 = v12;
LABEL_16:

  return v18;
}

- (BOOL)unitTesting_setInsertionEra:(int64_t)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v8 = a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HDQuantitySampleSeriesEntity_unitTesting_setInsertionEra_profile_error___block_invoke;
  v12[3] = &unk_1E6CFCE80;
  v12[4] = self;
  v12[5] = a3;
  LOBYTE(a5) = objc_msgSend(v9, "performWriteTransactionWithHealthDatabase:error:block:", v10, a5, v12);

  return (char)a5;
}

uint64_t __74__HDQuantitySampleSeriesEntity_unitTesting_setInsertionEra_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "protectedDatabase");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11[0] = CFSTR("insertion_era");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__HDQuantitySampleSeriesEntity__setInsertionEra_database_error___block_invoke;
    v10[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
    v10[4] = v5;
    v8 = objc_msgSend(v4, "updateProperties:database:error:bindingHandler:", v7, v6, a3, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
