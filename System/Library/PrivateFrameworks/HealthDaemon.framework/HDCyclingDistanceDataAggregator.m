@implementation HDCyclingDistanceDataAggregator

- (HDCyclingDistanceDataAggregator)initWithDataCollectionManager:(id)a3
{
  id v4;
  void *v5;
  HDCyclingDistanceDataAggregator *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HDCyclingDistanceDataAggregator;
  v6 = -[HDActiveQuantityDataAggregator initForQuantityType:dataCollectionManager:](&v10, sel_initForQuantityType_dataCollectionManager_, v5, v4);
  if (v6)
  {
    objc_msgSend(v4, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v6->_workoutManager, v8);

  }
  return v6;
}

- (id)additionalMetadataForCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id WeakRetained;
  void *v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sourceForDataAggregator:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB7560]);

  if (!v7)
    goto LABEL_6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_workoutManager);
  objc_msgSend(WeakRetained, "currentWorkoutConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "activityType") != 13 || objc_msgSend(v9, "locationType") != 2)
  {

LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)HDCyclingDistanceDataAggregator;
    -[HDActiveQuantityDataAggregator additionalMetadataForCollector:](&v12, sel_additionalMetadataForCollector_, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v13 = *MEMORY[0x1E0CB5558];
  v14[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_workoutManager);
}

@end
