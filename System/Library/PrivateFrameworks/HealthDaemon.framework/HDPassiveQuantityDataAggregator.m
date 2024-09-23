@implementation HDPassiveQuantityDataAggregator

- (id)initForQuantityType:(id)a3 dataCollectionManager:(id)a4
{
  id v8;
  id v9;
  HDPassiveQuantityDataAggregator *v10;
  HDPassiveQuantityDataAggregator *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDPassiveQuantityDataAggregator.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[quantityType isKindOfClass:[HKQuantityType class]]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HDPassiveQuantityDataAggregator;
  v10 = -[HDDataAggregator initWithDataCollectionManager:](&v14, sel_initWithDataCollectionManager_, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_quantityType, a3);

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

- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4
{
  void *v4;
  HKQuantityType *quantityType;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB6A40];
  quantityType = self->_quantityType;
  v6 = a3;
  objc_msgSend(v6, "quantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "quantitySampleWithType:quantity:startDate:endDate:metadata:", quantityType, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end
