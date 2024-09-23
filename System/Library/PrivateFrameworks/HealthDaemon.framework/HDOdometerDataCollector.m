@implementation HDOdometerDataCollector

- (HDOdometerDataCollector)initWithProfile:(id)a3 collectedDistanceType:(id)a4
{
  id v6;
  HDOdometerDataCollector *v7;
  uint64_t v8;
  HKQuantityType *distanceType;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDOdometerDataCollector;
  v7 = -[HDCoreMotionDataCollector initWithProfile:](&v11, sel_initWithProfile_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    distanceType = v7->_distanceType;
    v7->_distanceType = (HKQuantityType *)v8;

  }
  return v7;
}

- (id)collectedTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_distanceType);
}

- (Class)coreMotionDatumClass
{
  return (Class)objc_opt_class();
}

- (id)queue_newDataSource
{
  return objc_alloc_init(MEMORY[0x1E0CA5680]);
}

- (double)queue_differenceFromDatum:(id)a3 toDatum:(id)a4 type:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v26;

  v9 = a3;
  v10 = a4;
  if ((objc_msgSend(a5, "isEqual:", self->_distanceType) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDOdometerDataCollector.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[type isEqual:_distanceType]"));

  }
  objc_msgSend(v10, "hd_epochDatestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hd_epochDatestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToDate:", v12);

  objc_msgSend(v9, "hd_epochDatestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hd_datestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToDate:", v15))
  {

  }
  else
  {
    objc_msgSend(v10, "hd_epochDatestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hd_datestamp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqualToDate:", v17);

    if (((v13 | v18) & 1) == 0)
    {
      objc_msgSend(v10, "deltaDistance");
      v23 = v24;
      goto LABEL_10;
    }
  }
  objc_msgSend(v10, "deltaDistance");
  v20 = v19;
  objc_msgSend(v9, "deltaDistance");
  v22 = v20 - v21;
  if (v22 >= 0.0)
    v23 = v22;
  else
    v23 = 0.0;
LABEL_10:

  return v23;
}

- (unint64_t)queue_targetCollectionTypeForRequestedCollectionType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_1B7F42850[a3];
}

- (id)persistentIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDOdometerDataCollector.%@"), self->_distanceType);
}

- (BOOL)canResumeCollectionFromLastSensorDatum
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceType, 0);
}

@end
