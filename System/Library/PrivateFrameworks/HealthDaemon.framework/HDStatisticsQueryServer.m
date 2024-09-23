@implementation HDStatisticsQueryServer

- (HDStatisticsQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDStatisticsQueryServer *v11;
  uint64_t v12;
  NSDateInterval *dateInterval;
  uint64_t v14;
  HKQuantityType *quantityType;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  uint64_t v20;
  HKQuantityType *v21;
  objc_super v23;
  objc_super v24;

  v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDStatisticsQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v24, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "dateInterval");
    v12 = objc_claimAutoreleasedReturnValue();
    dateInterval = v11->_dateInterval;
    v11->_dateInterval = (NSDateInterval *)v12;

    v11->_statisticsOptions = objc_msgSend(v10, "options");
    v11->_mergeStrategy = objc_msgSend(v10, "mergeStrategy");
    v23.receiver = v11;
    v23.super_class = (Class)HDStatisticsQueryServer;
    -[HDQueryServer quantityType](&v23, sel_quantityType);
    v14 = objc_claimAutoreleasedReturnValue();
    quantityType = v11->_quantityType;
    v11->_quantityType = (HKQuantityType *)v14;

    if (!v11->_quantityType)
    {
      -[HDQueryServer sampleType](v11, "sampleType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[HDQueryServer sampleType](v11, "sampleType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[_HDStatisticsSyntheticQuantityType syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:](_HDStatisticsSyntheticQuantityType, "syntheticQuantityTypeWithUnderlyingSampleType:aggregationStyle:canonicalUnit:", v18, 1, v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v11->_quantityType;
        v11->_quantityType = (HKQuantityType *)v20;

      }
    }
  }

  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  void *v23;
  char isKindOfClass;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = v8;
  objc_opt_self();
  v11 = objc_msgSend(v10, "options");
  if ((_HKStatisticsOptionPercentile() & v11) != 0
    || (v12 = objc_msgSend(v10, "options"), (_HKStatisticsOptionPresence() & v12) != 0)
    || (v13 = objc_msgSend(v10, "options"), (_HKStatisticOptionsAverageSampleDuration() & v13) != 0)
    || (v14 = objc_msgSend(v10, "options"), (_HKStatisticsOptionBaselineRelativeQuantities() & v14) != 0)
    || (v15 = objc_msgSend(v10, "options"), (_HKStatisticsOptionSleepStages() & v15) != 0))
  {

    goto LABEL_7;
  }
  objc_msgSend(v10, "objectType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    if (!objc_msgSend(v9, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB59B0], a5))
      goto LABEL_15;
  }
  v16 = objc_msgSend(v10, "options");
  if ((_HKStatisticsOptionPresence() & v16) != 0)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = CFSTR("Use a sample query with limit 1 for non-collection presence calculations.");
  }
  else
  {
    v19 = objc_msgSend(v10, "options");
    if ((_HKStatisticsOptionBaselineRelativeQuantities() & v19) != 0)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("Use HKStatisticsCollectionQuery for relative quantity calculations");
    }
    else
    {
      v20 = objc_msgSend(v10, "options");
      if ((_HKStatisticsOptionSleepStages() & v20) == 0)
      {
        v25.receiver = a1;
        v25.super_class = (Class)&OBJC_METACLASS___HDStatisticsQueryServer;
        v21 = objc_msgSendSuper2(&v25, sel_validateConfiguration_client_error_, v10, v9, a5);
        goto LABEL_16;
      }
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("This statistics option is currently only intended to be used via HDStatisticsCalculator directly.");
    }
  }
  objc_msgSend(v17, "hk_assignError:code:format:", a5, 3, v18);
LABEL_15:
  v21 = 0;
LABEL_16:

  return v21;
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t statisticsOptions;
  void *v19;
  int v20;
  void *v21;
  HDStatisticsCollectionCalculatorAttenuatedDataSource *v22;
  void *v23;
  id v24;
  HDStatisticsCollectionCalculatorDefaultDataSource *v25;
  void *v26;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v27;
  void *v28;
  HDStatisticsCollectionCalculatorDefaultSourceOrderProvider *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)HDStatisticsQueryServer;
  -[HDQueryServer _queue_start](&v37, sel__queue_start);
  v36 = 0;
  if (!self)
  {
    v32 = 0;
    v8 = 0;
    goto LABEL_24;
  }
  -[HDQueryServer objectType](self, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v3, &v36);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "canRead"))
  {
    -[HDQueryServer filter](self, "filter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HDQueryServer profile](self, "profile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "predicateWithProfile:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v36, 100, CFSTR("Error building predicate for query"));
        v8 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(v4, "authorizationPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "compoundPredicateWithPredicate:otherPredicate:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDStatisticsQueryServer quantityType](self, "quantityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restrictedSourceEntities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v15 = v11;
    v16 = v13;
    v17 = v5;
    statisticsOptions = self->_statisticsOptions;
    if ((_HKStatisticsOptionAttenuateSamples() & statisticsOptions) == 0)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C78]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "isEqual:", v19);

    if (!v20)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 272);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [HDStatisticsCollectionCalculatorAttenuatedDataSource alloc];
    -[HDQueryServer profile](self, "profile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HDStatisticsCollectionCalculatorAttenuatedDataSource initForProfile:quantityType:predicate:restrictedSourceEntities:attenuationType:](v22, "initForProfile:quantityType:predicate:restrictedSourceEntities:attenuationType:", v23, v14, v15, v16, v21);

    if (!v24)
    {
LABEL_12:
      v25 = [HDStatisticsCollectionCalculatorDefaultDataSource alloc];
      -[HDQueryServer profile](self, "profile");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[HDStatisticsCollectionCalculatorDefaultDataSource initForProfile:quantityType:predicate:restrictedSourceEntities:](v25, "initForProfile:quantityType:predicate:restrictedSourceEntities:", v26, v14, v15, v16);

    }
    objc_msgSend(v24, "setFilter:", v17);
    objc_msgSend(v24, "setIncludeUnfrozenSeries:", 1);

    v27 = [HDStatisticsCollectionCalculatorDefaultSourceOrderProvider alloc];
    -[HDQueryServer profile](self, "profile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HDStatisticsCollectionCalculatorDefaultSourceOrderProvider initWithProfile:quantityType:](v27, "initWithProfile:quantityType:", v28, v14);

    +[HDStatisticsCollectionCalculator calculatorForQuantityType:intervalCollection:options:mergeStrategy:](HDStatisticsCollectionCalculator, "calculatorForQuantityType:intervalCollection:options:mergeStrategy:", v14, 0, self->_statisticsOptions, self->_mergeStrategy);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDataSource:", v24);
    objc_msgSend(v30, "setSourceOrderProvider:", v29);
    if (self->_dateInterval)
      objc_msgSend(v30, "setDateInterval:");
    if (objc_msgSend(v30, "queryForInitialStatisticsWithError:", &v36))
    {
      objc_msgSend(v30, "currentStatistics");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "dataCount"))
        v8 = v31;
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

    goto LABEL_22;
  }
  v8 = 0;
LABEL_23:

  v32 = v36;
LABEL_24:
  v33 = v32;
  -[HDQueryServer clientProxy](self, "clientProxy");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || !v33)
  {
    -[HDQueryServer setDataCount:](self, "setDataCount:", objc_msgSend(v8, "dataCount"));
    -[HDQueryServer queryUUID](self, "queryUUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "client_deliverStatistics:forQuery:", v8, v35);
  }
  else
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "client_deliverError:forQuery:", v33, v35);
  }

}

- (id)quantityType
{
  return self->_quantityType;
}

- (unint64_t)statisticsOptions
{
  return self->_statisticsOptions;
}

- (unint64_t)mergeStrategy
{
  return self->_mergeStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
