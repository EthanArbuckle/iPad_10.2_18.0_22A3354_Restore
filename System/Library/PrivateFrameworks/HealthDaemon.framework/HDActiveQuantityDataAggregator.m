@implementation HDActiveQuantityDataAggregator

- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4
{
  id v8;
  id v9;
  HDActiveQuantityDataAggregator *v10;
  HDActiveQuantityDataAggregator *v11;
  id v12;
  HDCyclingDataCollectionForwarder *v13;
  HDDataCollectionForwarder *dataForwarder;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDActiveQuantityDataAggregator.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[quantityType isKindOfClass:[HKQuantityType class]]"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HDActiveQuantityDataAggregator;
  v10 = -[HDActiveDataAggregator initWithDataCollectionManager:](&v17, sel_initWithDataCollectionManager_, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_quantityType, a3);
    v12 = v8;
    if ((objc_msgSend(MEMORY[0x1E0CB6F18], "isDataCollectionForwarderDisabled") & 1) != 0
      || (unint64_t)(objc_msgSend(v12, "code") - 280) > 2)
    {
      v13 = 0;
    }
    else
    {
      v13 = objc_alloc_init(HDCyclingDataCollectionForwarder);
    }

    dataForwarder = v11->_dataForwarder;
    v11->_dataForwarder = (HDDataCollectionForwarder *)v13;

  }
  return v11;
}

- (id)objectType
{
  return self->_quantityType;
}

- (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

- (id)additionalMetadataForCollector:(id)a3
{
  return 0;
}

- (id)aggregateForState:(id)a3 collector:(id)a4 device:(id)a5 requestedAggregationDate:(id)a6 mode:(int64_t)a7 options:(unint64_t)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  HKQuantityType *quantityType;
  void *v25;
  HKQuantityType *v26;
  void *v27;
  void *v28;
  HDDataAggregationState *v29;
  void *v30;
  HDDataAggregationState *v31;
  void *v32;
  uint64_t v33;
  HDDataAggregationResult *v34;
  HDDataAggregationResult *v35;
  void *v36;
  HDDataAggregationResult *v37;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  HDActiveQuantityDataAggregator *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  -[HDActiveDataAggregator aggregationIntervalForCollector:](self, "aggregationIntervalForCollector:", v15);
  v19 = v18;
  v20 = v14;
  v21 = v17;
  if (self)
  {
    -[HDActiveQuantityDataAggregator additionalMetadataForCollector:](self, "additionalMetadataForCollector:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unaggregatedSensorData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      quantityType = self->_quantityType;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HDAggregateQuantitySensorDataThroughDate(v23, quantityType, v25, v21, a7 == 0, v22, v19);
    }
    else
    {
      v26 = self->_quantityType;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HDAggregateQuantitySensorData(v23, v26, v25, v22, v19);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }

  if (v27)
  {
    if ((objc_msgSend(v20, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      _HKInitializeLogging();
      v28 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
      {
        v39 = v28;
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v47 = self;
        v48 = 2114;
        v49 = v41;
        _os_log_fault_impl(&dword_1B7802000, v39, OS_LOG_TYPE_FAULT, "%{public}@: unexpected state object %{public}@", buf, 0x16u);

      }
    }
    v29 = [HDDataAggregationState alloc];
    objc_msgSend(v27, "remainingSensorData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[HDDataAggregationState initWithRemainingSensorData:](v29, "initWithRemainingSensorData:", v30);

    objc_msgSend(v27, "aggregatedSamples");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    v34 = [HDDataAggregationResult alloc];
    v35 = v34;
    if (v33)
    {
      objc_msgSend(v27, "consumedSensorData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __113__HDActiveQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke;
      v42[3] = &unk_1E6CE96D8;
      v42[4] = self;
      v43 = v27;
      v44 = v16;
      v45 = v15;
      v37 = -[HDDataAggregationResult initWithResultingAggregationState:consumedSensorData:persistenceHandler:](v35, "initWithResultingAggregationState:consumedSensorData:persistenceHandler:", v31, v36, v42);

    }
    else
    {
      v37 = -[HDDataAggregationResult initWithResultingAggregationState:consumedSensorData:persistenceHandler:](v34, "initWithResultingAggregationState:consumedSensorData:persistenceHandler:", v31, 0, 0);
    }

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

uint64_t __113__HDActiveQuantityDataAggregator_aggregateForState_collector_device_requestedAggregationDate_mode_options_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "dataCollectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "aggregatedSamples");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v10, v6, 1, a3, CFAbsoluteTimeGetCurrent());

  if (!v11)
    return 0;
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(*(id *)(a1 + 40), "aggregatedSamples");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "sourceForDataAggregator:", *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertSamples:device:source:", v13, v14, v15);

  v16 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "aggregatedSamples");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "consumedSensorData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v16, "didPersistObjects:lastDatum:collector:error:", v17, v19, *(_QWORD *)(a1 + 56), a3);

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDActiveQuantityDataAggregator;
  -[HDActiveQuantityDataAggregator description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityType identifier](self->_quantityType, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_dataForwarder, 0);
}

@end
