@implementation HDHeadphoneAudioExposureStatisticsBucket

+ (id)makeBucketsForProfile:(id)a3 earliestStartDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDBCE60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_makeBucketsForNowDate:earliestStartDate:profile:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_makeBucketsForNowDate:(id)a3 earliestStartDate:(id)a4 profile:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t i;
  void *v13;
  id v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  objc_msgSend(v7, "dateByAddingTimeInterval:", -604800.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 5; ++i)
  {
    objc_msgSend(v11, "dateByAddingTimeInterval:", 3600.0 * (double)i);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDHeadphoneAudioExposureStatisticsBucket _initWithProfile:startDate:earliestStartDate:boundedInterval:]([HDHeadphoneAudioExposureStatisticsBucket alloc], "_initWithProfile:startDate:earliestStartDate:boundedInterval:", v9, v13, v8, i != 4);
    objc_msgSend(v10, "addObject:", v14);

  }
  v15 = (void *)objc_msgSend(v10, "copy");

  return v15;
}

+ (id)_currentDoseStringForEndDate:(id)a3 earliestStartDate:(id)a4 profile:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  __CFString *v22;
  id v24;
  id v25;
  id v26;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "dateByAddingTimeInterval:", -604800.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithProfile:startDate:earliestStartDate:boundedInterval:", v8, v10, v9, 1);

  v26 = 0;
  objc_msgSend(v11, "queryForInitialStatisticsWithError:", &v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v26;
  v14 = v13;
  if (v12)
  {
    v25 = 0;
    objc_msgSend(v11, "snapshotStatisticsWithError:", &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;
    if (v15)
    {
      objc_msgSend(v15, "statistics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      objc_msgSend(v17, "hk_hearingSevenDayDosePercentageWithError:", &v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v24;

      v20 = (void *)MEMORY[0x24BDD17C8];
      if (v18)
      {
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%.2f%%"), v21 * 100.0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("compute dose failed %@"), v19);
      }
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("compute statistics failed %@"), v16);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else if ((objc_msgSend(v13, "hk_isDatabaseAccessibilityError") & 1) != 0)
  {
    v22 = CFSTR("Locked (Data Inaccessible)");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("query dose failed %@"), v14);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

+ (id)_makePrimaryCalculator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE40C28];
  HKHeadphoneAudioExposureType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v3, 0, 66, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C50]), "initWithOverlapProcessingEnabled:", 0);
  objc_msgSend(v4, "setStatisticsConfiguration:", v5);

  return v4;
}

+ (id)_makeJournaledCalculator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE40C28];
  HKHeadphoneAudioExposureType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v3, 0, 66, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C50]), "initWithOverlapProcessingEnabled:", 0);
  objc_msgSend(v4, "setStatisticsConfiguration:", v5);

  return v4;
}

+ (id)_makeDataSourceWithProfile:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE40C38];
  v4 = a3;
  v5 = [v3 alloc];
  HKHeadphoneAudioExposureType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initForProfile:quantityType:predicate:restrictedSourceEntities:", v4, v6, 0, 0);

  objc_msgSend(v7, "setIncludeUnfrozenSeries:", 1);
  return v7;
}

+ (id)_makeSourceOrderProviderWithProfile:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE40C40];
  v4 = a3;
  v5 = [v3 alloc];
  HKHeadphoneAudioExposureType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithProfile:quantityType:", v4, v6);

  return v7;
}

- (id)_initWithProfile:(id)a3 startDate:(id)a4 earliestStartDate:(id)a5 boundedInterval:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  HDHeadphoneAudioExposureStatisticsBucket *v13;
  void *v14;
  HDStatisticsCollectionCalculatorDefaultDataSource *v15;
  uint64_t v16;
  void *v17;
  HDStatisticsCollectionCalculator *primaryCalculator;
  id v19;
  HDStatisticsCollectionCalculator *journaledCalculator;
  NSNumber *anchor;
  HKStatistics *previousStatistics;
  HDStatisticsCollectionCalculatorDefaultDataSource *dataSource;
  HDStatisticsCollectionCalculatorDefaultDataSource *v24;
  HDStatisticsCollectionCalculatorSourceOrderProvider *sourceOrderProvider;
  HDHeadphoneAudioExposureStatisticsBucket *v26;
  id v28;
  objc_super v29;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HDHeadphoneAudioExposureStatisticsBucket;
  v13 = -[HDHeadphoneAudioExposureStatisticsBucket init](&v29, sel_init);
  if (v13)
  {
    objc_msgSend((id)objc_opt_class(), "_makePrimaryCalculator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_makeDataSourceWithProfile:", v10);
    v15 = (HDStatisticsCollectionCalculatorDefaultDataSource *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_makeSourceOrderProviderWithProfile:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDataSource:", v15);
    objc_msgSend(v14, "setSourceOrderProvider:", v16);
    objc_msgSend(MEMORY[0x24BDD1508], "hd_hearingSevenDayLimitIntervalWithStartDate:earliestStartDate:boundedInterval:", v11, v12, v6);
    v28 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDateInterval:", v17);

    v13->_lock._os_unfair_lock_opaque = 0;
    primaryCalculator = v13->_primaryCalculator;
    v13->_primaryCalculator = (HDStatisticsCollectionCalculator *)v14;
    v19 = v14;

    journaledCalculator = v13->_journaledCalculator;
    v13->_journaledCalculator = 0;

    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_earliestStartDate, a5);
    v13->_boundedInterval = v6;
    anchor = v13->_anchor;
    v13->_anchor = 0;

    previousStatistics = v13->_previousStatistics;
    v13->_previousStatistics = 0;

    dataSource = v13->_dataSource;
    v13->_dataSource = v15;
    v24 = v15;

    sourceOrderProvider = v13->_sourceOrderProvider;
    v13->_sourceOrderProvider = (HDStatisticsCollectionCalculatorSourceOrderProvider *)v16;

    v11 = v28;
    v26 = v13;
  }

  return v13;
}

- (id)_initWithProfile:(id)a3 primaryCalculator:(id)a4 journaledCalculator:(id)a5 startDate:(id)a6 earliestStartDate:(id)a7 boundedInterval:(BOOL)a8 anchor:(id)a9 previousStatistics:(id)a10 includesPrunableData:(BOOL)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  HDHeadphoneAudioExposureStatisticsBucket *v32;
  HDStatisticsCollectionCalculatorDefaultDataSource *v33;
  uint64_t v34;
  HDStatisticsCollectionCalculatorDefaultDataSource *dataSource;
  HDStatisticsCollectionCalculatorDefaultDataSource *v36;
  HDStatisticsCollectionCalculatorSourceOrderProvider *sourceOrderProvider;
  HDHeadphoneAudioExposureStatisticsBucket *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id obj;
  id v51;
  id v53;
  id v54;
  objc_super v56;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  obj = a6;
  v18 = a6;
  v51 = a7;
  v19 = a7;
  v54 = a9;
  v53 = a10;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryCalculator"));

  }
  objc_msgSend(v16, "quantityType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "code");

  if (v21 != 173)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryCalculator.quantityType.code == _HKDataTypeHeadphoneAudioExposure"));

  }
  objc_msgSend(v16, "dateInterval");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryCalculator.dateInterval"));

  }
  objc_msgSend(v16, "dataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryCalculator.dataSource == nil"));

  }
  objc_msgSend(v16, "sourceOrderProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("primaryCalculator.sourceOrderProvider == nil"));

    if (!v17)
      goto LABEL_19;
  }
  else if (!v17)
  {
    goto LABEL_19;
  }
  objc_msgSend(v17, "quantityType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "code");

  if (v26 != 173)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("journaledCalculator.quantityType.code == _HKDataTypeHeadphoneAudioExposure"));

  }
  objc_msgSend(v17, "dateInterval");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateInterval");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "isEqualToDateInterval:", v28);

  if ((v29 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[journaledCalculator.dateInterval isEqualToDateInterval:primaryCalculator.dateInterval]"));

  }
  objc_msgSend(v17, "dataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("journaledCalculator.dataSource == nil"));

  }
  objc_msgSend(v17, "sourceOrderProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("journaledCalculator.sourceOrderProvider == nil"));

  }
LABEL_19:
  v56.receiver = self;
  v56.super_class = (Class)HDHeadphoneAudioExposureStatisticsBucket;
  v32 = -[HDHeadphoneAudioExposureStatisticsBucket init](&v56, sel_init);
  if (v32)
  {
    objc_msgSend((id)objc_opt_class(), "_makeDataSourceWithProfile:", v15);
    v33 = (HDStatisticsCollectionCalculatorDefaultDataSource *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_makeSourceOrderProviderWithProfile:", v15);
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDataSource:", v33);
    objc_msgSend(v16, "setSourceOrderProvider:", v34);
    if (v17)
    {
      objc_msgSend(v17, "setDataSource:", v33);
      objc_msgSend(v17, "setSourceOrderProvider:", v34);
    }
    v32->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v32->_primaryCalculator, a4);
    objc_storeStrong((id *)&v32->_journaledCalculator, a5);
    objc_storeStrong((id *)&v32->_startDate, obj);
    objc_storeStrong((id *)&v32->_earliestStartDate, v51);
    v32->_boundedInterval = a8;
    objc_storeStrong((id *)&v32->_anchor, a9);
    objc_storeStrong((id *)&v32->_previousStatistics, a10);
    v32->_includesPrunableData = a11;
    dataSource = v32->_dataSource;
    v32->_dataSource = v33;
    v36 = v33;

    sourceOrderProvider = v32->_sourceOrderProvider;
    v32->_sourceOrderProvider = (HDStatisticsCollectionCalculatorSourceOrderProvider *)v34;

    v38 = v32;
  }

  return v32;
}

- (id)copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  os_unfair_lock_s *p_lock;
  id v9;
  void *v10;

  v6 = a4;
  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDHeadphoneAudioExposureStatisticsBucket _lock_copyWithEarliestStartDate:resetDoseToZero:error:](self, "_lock_copyWithEarliestStartDate:resetDoseToZero:error:", v9, v6, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)_lock_copyWithEarliestStartDate:(id)a3 resetDoseToZero:(BOOL)a4 error:(id *)a5
{
  NSDate *v8;
  char v9;
  NSDate *startDate;
  NSDate *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v8 = (NSDate *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v9 = -[NSDate hk_isAfterDate:](self->_startDate, "hk_isAfterDate:", v8);
  startDate = v8;
  if ((v9 & 1) == 0)
    startDate = self->_startDate;
  v11 = startDate;
  v12 = objc_alloc((Class)objc_opt_class());
  -[HDStatisticsCollectionCalculatorDefaultDataSource profile](self->_dataSource, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "_initWithProfile:startDate:earliestStartDate:boundedInterval:", v13, v11, v8, self->_boundedInterval);

  v15 = *(void **)(v14 + 56);
  *(_QWORD *)(v14 + 56) = 0;

  if (!a4)
  {
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_currentStatisticsWithError:](self, "_lock_currentStatisticsWithError:", a5);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v18 = 0;
      goto LABEL_8;
    }
    v17 = *(void **)(v14 + 64);
    *(_QWORD *)(v14 + 64) = v16;

    *(_BYTE *)(v14 + 72) = self->_includesPrunableData;
  }
  v18 = (id)v14;
LABEL_8:

  return v18;
}

- (id)archivedRepresentationWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDHeadphoneAudioExposureStatisticsBucket _lock_archivedRepresentationWithError:](self, "_lock_archivedRepresentationWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_archivedRepresentationWithError:(id *)a3
{
  void *v4;
  HDStatisticsCollectionCalculator *journaledCalculator;
  NSDate *earliestStartDate;
  HKStatistics *previousStatistics;
  void *v8;

  os_unfair_lock_assert_owner(&self->_lock);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v4, "encodeObject:forKey:", self->_primaryCalculator, CFSTR("primaryCalculator"));
  journaledCalculator = self->_journaledCalculator;
  if (journaledCalculator)
    objc_msgSend(v4, "encodeObject:forKey:", journaledCalculator, CFSTR("journaledCalculator"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  earliestStartDate = self->_earliestStartDate;
  if (earliestStartDate)
    objc_msgSend(v4, "encodeObject:forKey:", earliestStartDate, CFSTR("earliestStartDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_boundedInterval, CFSTR("boundedInterval"));
  previousStatistics = self->_previousStatistics;
  if (previousStatistics)
    objc_msgSend(v4, "encodeObject:forKey:", previousStatistics, CFSTR("previousStatistics"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includesPrunableData, CFSTR("includesPrunableData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchor, CFSTR("anchor"));
  objc_msgSend(v4, "finishEncoding");
  objc_msgSend(v4, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)bucketForArchivedRepresentation:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;

  v7 = a4;
  v8 = (objc_class *)MEMORY[0x24BDD1620];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initForReadingFromData:error:", v9, a5);

  if (v10)
  {
    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryCalculator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 || (objc_msgSend(v10, "error"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
    {
      objc_msgSend(v10, "error");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v13);
        else
          _HKLogDroppedError();
      }

      objc_msgSend(v10, "finishDecoding");
      v14 = 0;
      goto LABEL_33;
    }
    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("journaledCalculator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v10, "error");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v17);
        else
          _HKLogDroppedError();
      }

      objc_msgSend(v10, "finishDecoding");
      v14 = 0;
      goto LABEL_32;
    }
    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_msgSend(v10, "error"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, v19))
    {
      objc_msgSend(v10, "error");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v20);
        else
          _HKLogDroppedError();
      }

      objc_msgSend(v10, "finishDecoding");
      v14 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("earliestStartDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22
      || (v23 = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("boundedInterval")),
          objc_msgSend(v10, "error"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v24,
          v24))
    {
      objc_msgSend(v10, "error");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v25);
        else
          _HKLogDroppedError();
      }

      objc_msgSend(v10, "finishDecoding");
      v14 = 0;
      goto LABEL_30;
    }
    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor"));
    v38 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v10, "error");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v28);
        else
          _HKLogDroppedError();
      }

      objc_msgSend(v10, "finishDecoding");
      v14 = 0;
      v31 = (void *)v38;
      goto LABEL_50;
    }
    objc_msgSend(v10, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previousStatistics"));
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = v10;
    }
    else
    {
      v36 = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("includesPrunableData"));
      objc_msgSend(v10, "error");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v10;
      if (!v32)
      {
        objc_msgSend(v10, "finishDecoding");
        LOBYTE(v35) = v36;
        v34 = (void *)v37;
        v31 = (void *)v38;
        v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithProfile:primaryCalculator:journaledCalculator:startDate:earliestStartDate:boundedInterval:anchor:previousStatistics:includesPrunableData:", v7, v11, v15, v18, v21, v23, v38, v37, v35);
LABEL_49:

LABEL_50:
LABEL_30:

LABEL_31:
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
    }
    objc_msgSend(v30, "error");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v37;
    if (v33)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v33);
      else
        _HKLogDroppedError();
    }

    objc_msgSend(v10, "finishDecoding");
    v14 = 0;
    v31 = (void *)v38;
    goto LABEL_49;
  }
  v14 = 0;
LABEL_34:

  return v14;
}

- (NSDateInterval)dateInterval
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDHeadphoneAudioExposureStatisticsBucket _lock_dateInterval](self, "_lock_dateInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSDateInterval *)v4;
}

- (BOOL)includesJournaledSamples
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_journaledCalculator)
    v4 = 1;
  else
    v4 = self->_previousStatistics != 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasPreviousStatistics
{
  HDHeadphoneAudioExposureStatisticsBucket *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_previousStatistics != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)snapshotStatisticsWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  _BOOL4 includesPrunableData;
  void *v7;
  HDHeadphoneAudioExposureStatisticsSnapshot *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  includesPrunableData = self->_includesPrunableData;
  -[HDHeadphoneAudioExposureStatisticsBucket _lock_currentStatisticsWithError:](self, "_lock_currentStatisticsWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v7)
    v8 = -[HDHeadphoneAudioExposureStatisticsSnapshot initWithStatistics:includesPrunableData:previousNotificationDate:]([HDHeadphoneAudioExposureStatisticsSnapshot alloc], "initWithStatistics:includesPrunableData:previousNotificationDate:", v7, includesPrunableData, self->_earliestStartDate);
  else
    v8 = 0;

  return v8;
}

- (id)_lock_currentStatisticsWithError:(id *)a3
{
  void *v5;
  HKStatistics *previousStatistics;
  id v7;
  HDStatisticsCollectionCalculator *journaledCalculator;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;

  os_unfair_lock_assert_owner(&self->_lock);
  -[HDStatisticsCollectionCalculator currentStatistics](self->_primaryCalculator, "currentStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    previousStatistics = self->_previousStatistics;
    if (previousStatistics)
    {
      -[HKStatistics statisticsByCombiningWithNoiseLevelStatistics:error:](previousStatistics, "statisticsByCombiningWithNoiseLevelStatistics:error:", v5, a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_14;
    }
    else
    {
      v7 = v5;
    }
    journaledCalculator = self->_journaledCalculator;
    if (journaledCalculator)
    {
      -[HDStatisticsCollectionCalculator currentStatistics](journaledCalculator, "currentStatistics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "statisticsByCombiningWithNoiseLevelStatistics:error:", v9, a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v10;
        v11 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 100, CFSTR("unable compute journaled statistics"));
        _HKInitializeLogging();
        v12 = *MEMORY[0x24BDD3000];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
          -[HDHeadphoneAudioExposureStatisticsBucket _lock_currentStatisticsWithError:].cold.1(v12);
        v11 = 0;
      }

      v7 = v11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 100, CFSTR("unable compute primary statistics"));
    v7 = 0;
  }
LABEL_14:

  return v7;
}

- (BOOL)isExpiredForNowDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HDHeadphoneAudioExposureStatisticsBucket dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hk_isBeforeDate:", v4);

  return v7;
}

- (id)queryForInitialStatisticsWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDHeadphoneAudioExposureStatisticsBucket _lock_queryForInitialStatisticsWithError:](self, "_lock_queryForInitialStatisticsWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)updateWithSampleBatch:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (objc_msgSend(v6, "isJournaled"))
  {
    objc_msgSend(v6, "samples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_journalQuantitySamples:error:](self, "_lock_journalQuantitySamples:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(v6, "anchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "samples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_addQuantitySamples:anchor:error:](self, "_lock_addQuantitySamples:anchor:error:", v7, v10, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
    -[HDHeadphoneAudioExposureStatisticsBucket updateWithSampleBatch:error:].cold.1(v13, v6);
  v8 = 0;
LABEL_6:
  if (!self->_includesPrunableData)
  {
    objc_msgSend(v6, "samples");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_includesPrunableData = objc_msgSend(v11, "hk_containsObjectPassingTest:", &__block_literal_global_3);

  }
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

uint64_t __72__HDHeadphoneAudioExposureStatisticsBucket_updateWithSampleBatch_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v10;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD43A8];
  v10 = 0;
  objc_msgSend(v3, "hk_safeNumberIfExistsForKeyPath:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  if (v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      __72__HDHeadphoneAudioExposureStatisticsBucket_updateWithSampleBatch_error___block_invoke_cold_1(v7, v2, (uint64_t)v6);
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(v5, "BOOLValue");
  }

  return v8;
}

- (void)unitTesting_setPreviousStatistics:(id)a3
{
  HKStatistics *v4;
  HKStatistics *previousStatistics;

  v4 = (HKStatistics *)a3;
  os_unfair_lock_lock(&self->_lock);
  previousStatistics = self->_previousStatistics;
  self->_previousStatistics = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)unitTesting_setIncludesPrunableData:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_includesPrunableData = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_dateInterval
{
  os_unfair_lock_assert_owner(&self->_lock);
  return (id)-[HDStatisticsCollectionCalculator dateInterval](self->_primaryCalculator, "dateInterval");
}

- (id)_lock_journalQuantitySamples:(id)a3 error:(id *)a4
{
  id v6;
  HDStatisticsCollectionCalculator *v7;
  void *v8;
  void *v9;

  v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v7 = self->_journaledCalculator;
  if (!v7)
  {
    objc_msgSend((id)objc_opt_class(), "_makeJournaledCalculator");
    v7 = (HDStatisticsCollectionCalculator *)objc_claimAutoreleasedReturnValue();
    -[HDStatisticsCollectionCalculator setDataSource:](v7, "setDataSource:", self->_dataSource);
    -[HDStatisticsCollectionCalculator setSourceOrderProvider:](v7, "setSourceOrderProvider:", self->_sourceOrderProvider);
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_dateInterval](self, "_lock_dateInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDStatisticsCollectionCalculator setDateInterval:](v7, "setDateInterval:", v8);

    if (!v7)
      goto LABEL_5;
  }
  if (-[HDStatisticsCollectionCalculatorDefaultDataSource addValuesForQuantitySamples:calculator:includeSeries:error:](self->_dataSource, "addValuesForQuantitySamples:calculator:includeSeries:error:", v6, v7, 0, a4))
  {
    objc_storeStrong((id *)&self->_journaledCalculator, v7);
    +[HDHeadphoneExposureStatisticUpdateResult resultForSamplesJournaled:](HDHeadphoneExposureStatisticUpdateResult, "resultForSamplesJournaled:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v9 = 0;
  }

  return v9;
}

- (id)_lock_addQuantitySamples:(id)a3 anchor:(id)a4 error:(id *)a5
{
  id v8;
  NSNumber *v9;
  NSNumber *anchor;
  NSNumber **p_anchor;
  os_log_t *v12;
  uint64_t v13;
  os_log_t v14;
  os_log_t v15;
  NSObject *v16;
  uint64_t v17;
  NSNumber *v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  uint64_t v22;
  NSNumber *v23;
  HDStatisticsCollectionCalculator *journaledCalculator;
  id v25;
  NSObject *v27;
  uint64_t v28;
  NSNumber *v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  NSNumber *v33;
  __int16 v34;
  NSNumber *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (NSNumber *)a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_primaryCalculator)
  {
    p_anchor = &self->_anchor;
    anchor = self->_anchor;
    v12 = (os_log_t *)MEMORY[0x24BDD3000];
    if (anchor)
    {
      v13 = -[NSNumber longLongValue](anchor, "longLongValue");
      if (v13 > -[NSNumber longLongValue](v9, "longLongValue"))
      {
        _HKInitializeLogging();
        v14 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
        {
          v27 = v14;
          v28 = objc_msgSend(v8, "count");
          v29 = *p_anchor;
          v30 = 134218498;
          v31 = v28;
          v32 = 2114;
          v33 = v9;
          v34 = 2114;
          v35 = v29;
          _os_log_error_impl(&dword_21A0AA000, v27, OS_LOG_TYPE_ERROR, "[Warning] Adding %lu samples with anchor (%{public}@) below currentAnchor (%{public}@).", (uint8_t *)&v30, 0x20u);

        }
      }
    }
    _HKInitializeLogging();
    v15 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = objc_msgSend(v8, "count");
      v18 = *p_anchor;
      v30 = 134218498;
      v31 = v17;
      v32 = 2114;
      v33 = v18;
      v34 = 2114;
      v35 = v9;
      _os_log_impl(&dword_21A0AA000, v16, OS_LOG_TYPE_DEFAULT, "Added %lu sample(s) to primary calculator (anchor: %{public}@ -> %{public}@)", (uint8_t *)&v30, 0x20u);

    }
    -[HDStatisticsCollectionCalculatorDefaultDataSource hearing_addQuantitySamples:calculator:error:](self->_dataSource, "hearing_addQuantitySamples:calculator:error:", v8, self->_primaryCalculator, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (self->_journaledCalculator)
      {
        _HKInitializeLogging();
        v20 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          v21 = v20;
          v22 = objc_msgSend(v8, "count");
          v23 = *p_anchor;
          v30 = 134218498;
          v31 = v22;
          v32 = 2114;
          v33 = v23;
          v34 = 2114;
          v35 = v9;
          _os_log_impl(&dword_21A0AA000, v21, OS_LOG_TYPE_DEFAULT, "Invalidated journaled calculator on %lu samples added (anchor: %{public}@ -> %{public}@)", (uint8_t *)&v30, 0x20u);

        }
        journaledCalculator = self->_journaledCalculator;
        self->_journaledCalculator = 0;

      }
      objc_storeStrong((id *)&self->_anchor, a4);
      v25 = v19;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 100, CFSTR("unable to add samples without primary caclulator"));
    v19 = 0;
  }

  return v19;
}

- (void)_enableOverlappingProcessingInPrimaryCalculator:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  HDStatisticsCollectionCalculator *primaryCalculator;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = CFSTR("NO");
    if (v3)
      v8 = CFSTR("YES");
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v9 = v7;
    _os_log_impl(&dword_21A0AA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enable Overlap Processing In Primary Calculator: %@", (uint8_t *)&v12, 0x16u);

  }
  primaryCalculator = self->_primaryCalculator;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40C50]), "initWithOverlapProcessingEnabled:", v3);
  -[HDStatisticsCollectionCalculator setStatisticsConfiguration:](primaryCalculator, "setStatisticsConfiguration:", v11);

}

- (id)_lock_queryForInitialStatisticsWithError:(id *)a3
{
  HDStatisticsCollectionCalculatorDefaultDataSource *v6;
  HDStatisticsCollectionCalculatorDefaultDataSource *dataSource;
  HDStatisticsCollectionCalculatorSourceOrderProvider *v8;
  HDStatisticsCollectionCalculatorSourceOrderProvider *sourceOrderProvider;
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  HDStatisticsCollectionCalculator *primaryCalculator;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  HDStatisticsCollectionCalculator *journaledCalculator;
  NSNumber *v27;
  NSNumber *anchor;
  os_log_t v29;
  NSNumber *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  NSNumber *v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_dataSource || !self->_sourceOrderProvider)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 660, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_dataSource && _sourceOrderProvider"));

  }
  -[HDStatisticsCollectionCalculator dataSource](self->_primaryCalculator, "dataSource");
  v6 = (HDStatisticsCollectionCalculatorDefaultDataSource *)objc_claimAutoreleasedReturnValue();
  dataSource = self->_dataSource;

  if (v6 != dataSource)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 661, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_primaryCalculator.dataSource == _dataSource"));

  }
  -[HDStatisticsCollectionCalculator sourceOrderProvider](self->_primaryCalculator, "sourceOrderProvider");
  v8 = (HDStatisticsCollectionCalculatorSourceOrderProvider *)objc_claimAutoreleasedReturnValue();
  sourceOrderProvider = self->_sourceOrderProvider;

  if (v8 != sourceOrderProvider)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 662, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_primaryCalculator.sourceOrderProvider == _sourceOrderProvider"));

  }
  _HKInitializeLogging();
  v10 = (os_log_t *)MEMORY[0x24BDD3000];
  v11 = (void *)*MEMORY[0x24BDD3000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_dateInterval](self, "_lock_dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v16 = (uint64_t)v15;
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_dateInterval](self, "_lock_dateInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeIntervalSince1970");
    *(_DWORD *)buf = 134218240;
    v49 = v16;
    v50 = 2048;
    v51 = (uint64_t)v19;
    _os_log_impl(&dword_21A0AA000, v12, OS_LOG_TYPE_DEFAULT, "Querying initial HAE statistics for bucket interval: %{time_t}ld to %{time_t}ld", buf, 0x16u);

  }
  -[HDHeadphoneAudioExposureStatisticsBucket _enableOverlappingProcessingInPrimaryCalculator:](self, "_enableOverlappingProcessingInPrimaryCalculator:", 1);
  primaryCalculator = self->_primaryCalculator;
  v47 = 0;
  v21 = -[HDStatisticsCollectionCalculator queryForInitialStatisticsWithError:](primaryCalculator, "queryForInitialStatisticsWithError:", &v47);
  v22 = v47;
  -[HDHeadphoneAudioExposureStatisticsBucket _enableOverlappingProcessingInPrimaryCalculator:](self, "_enableOverlappingProcessingInPrimaryCalculator:", 0);
  if ((v21 & 1) == 0)
  {
    _HKInitializeLogging();
    v40 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      -[HDHeadphoneAudioExposureStatisticsBucket _lock_queryForInitialStatisticsWithError:].cold.1(v40);
    -[HDStatisticsCollectionCalculator dateInterval](self->_primaryCalculator, "dateInterval");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDStatisticsCollectionCalculator setDateInterval:](self->_primaryCalculator, "setDateInterval:", v41);

    v42 = v22;
    if (v42)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v42);
      else
        _HKLogDroppedError();
    }

    goto LABEL_26;
  }
  if (!self->_previousStatistics || !self->_includesPrunableData)
  {
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_fetchIncludesPrunableDataWithError:](self, "_lock_fetchIncludesPrunableDataWithError:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
LABEL_26:
      v39 = 0;
      goto LABEL_27;
    }
    v24 = v23;
    self->_includesPrunableData = objc_msgSend(v23, "BOOLValue");

  }
  -[HDStatisticsCollectionCalculator currentStatistics](self->_primaryCalculator, "currentStatistics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a3, 100, CFSTR("Something went wrong with the calculator and we were unable to compute current statistics."));
    goto LABEL_26;
  }
  journaledCalculator = self->_journaledCalculator;
  self->_journaledCalculator = 0;

  -[HDStatisticsCollectionCalculatorDefaultDataSource anchor](self->_dataSource, "anchor");
  v27 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  anchor = self->_anchor;
  self->_anchor = v27;

  _HKInitializeLogging();
  v29 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    v30 = self->_anchor;
    v31 = v29;
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_dateInterval](self, "_lock_dateInterval");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "startDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeIntervalSince1970");
    v35 = (uint64_t)v34;
    -[HDHeadphoneAudioExposureStatisticsBucket _lock_dateInterval](self, "_lock_dateInterval");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "endDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "timeIntervalSince1970");
    *(_DWORD *)buf = 138543874;
    v49 = (uint64_t)v30;
    v50 = 2048;
    v51 = v35;
    v52 = 2048;
    v53 = (uint64_t)v38;
    _os_log_impl(&dword_21A0AA000, v31, OS_LOG_TYPE_DEFAULT, "Queried initial anchor %{public}@ for HAE statistics in bucket interval: %{time_t}ld to %{time_t}ld", buf, 0x20u);

  }
  v39 = self->_anchor;
LABEL_27:

  return v39;
}

- (id)_lock_fetchIncludesPrunableDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner(&self->_lock);
  -[HDStatisticsCollectionCalculatorDefaultDataSource profile](self->_dataSource, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKHeadphoneAudioExposureType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE40E20];
  HDSampleEntityPredicateForDataType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v7;
  -[HDStatisticsCollectionCalculator dateInterval](self->_primaryCalculator, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDateInterval();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v9;
  objc_msgSend(v4, "metadataManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", MEMORY[0x24BDBD1C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithMetadataKey:allowedValues:", *MEMORY[0x24BDD43A8], v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateMatchingAllPredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  objc_msgSend(MEMORY[0x24BE40B90], "entityEnumeratorWithType:profile:", v5, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIgnoreEntityClassAdditionalPredicateForEnumeration:", 1);
  objc_msgSend(v15, "setPredicate:", v14);
  objc_msgSend(v15, "setLimitCount:", 1);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __85__HDHeadphoneAudioExposureStatisticsBucket__lock_fetchIncludesPrunableDataWithError___block_invoke;
  v19[3] = &unk_24DC5F1E8;
  v19[4] = &v20;
  objc_msgSend(v15, "enumerateWithError:handler:", a3, v19);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v21[5] != 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v20, 8);
  return v16;
}

uint64_t __85__HDHeadphoneAudioExposureStatisticsBucket__lock_fetchIncludesPrunableDataWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

- (HDStatisticsCollectionCalculator)primaryCalculator
{
  return self->_primaryCalculator;
}

- (HDStatisticsCollectionCalculator)journaledCalculator
{
  return self->_journaledCalculator;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)earliestStartDate
{
  return self->_earliestStartDate;
}

- (BOOL)boundedInterval
{
  return self->_boundedInterval;
}

- (NSNumber)anchor
{
  return self->_anchor;
}

- (HKStatistics)previousStatistics
{
  return self->_previousStatistics;
}

- (BOOL)includesPrunableData
{
  return self->_includesPrunableData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOrderProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_previousStatistics, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_earliestStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_journaledCalculator, 0);
  objc_storeStrong((id *)&self->_primaryCalculator, 0);
}

- (void)_lock_currentStatisticsWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21A0AA000, log, OS_LOG_TYPE_FAULT, "unable compute journaled statistics", v1, 2u);
}

- (void)updateWithSampleBatch:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "samples");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134217984;
  v6 = objc_msgSend(v4, "count");
  _os_log_fault_impl(&dword_21A0AA000, v3, OS_LOG_TYPE_FAULT, "Added %lu HAE quantity samples without an anchor!", (uint8_t *)&v5, 0xCu);

}

void __72__HDHeadphoneAudioExposureStatisticsBucket_updateWithSampleBatch_error___block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2114;
  v10 = a3;
  _os_log_fault_impl(&dword_21A0AA000, v5, OS_LOG_TYPE_FAULT, "Incoming HAE sample %@ has invalid metadata: %{public}@", (uint8_t *)&v7, 0x16u);

}

- (void)_lock_queryForInitialStatisticsWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A0AA000, log, OS_LOG_TYPE_ERROR, "Failed to load historical data for primary calculator.", v1, 2u);
}

@end
