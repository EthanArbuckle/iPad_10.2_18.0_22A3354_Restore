@implementation HDInsertValuesToQuantitySampleSeriesOperation

- (HDInsertValuesToQuantitySampleSeriesOperation)initWithSeries:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  HDInsertValuesToQuantitySampleSeriesOperation *v8;
  uint64_t v9;
  HKQuantitySample *series;
  uint64_t v11;
  NSArray *values;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDInsertValuesToQuantitySampleSeriesOperation;
  v8 = -[HDInsertValuesToQuantitySampleSeriesOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    series = v8->_series;
    v8->_series = (HKQuantitySample *)v9;

    v11 = objc_msgSend(v7, "copy");
    values = v8->_values;
    v8->_values = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  HKQuantitySample *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SEL v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = self->_series;
  if (!v11)
  {
    +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDQuantitySampleSeriesEntity, "objectWithUUID:encodingOptions:profile:error:", self->_legacySeriesIdentifier, MEMORY[0x1E0C9AA70], v9, a5);
    v11 = (HKQuantitySample *)objc_claimAutoreleasedReturnValue();
  }
  if (!self->_didAwakeFromJournal)
  {
    v25 = a2;
    objc_msgSend(v10, "protectedDatabase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantitySample UUID](v11, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HDDataEntityPredicateForDataUUID();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    +[HDDataEntity anyInDatabase:predicate:error:](HDQuantitySampleSeriesEntity, "anyInDatabase:predicate:error:", v15, v17, &v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v26;

    if (v18)
    {
      v14 = objc_msgSend(v18, "insertValues:transaction:error:", self->_values, v10, a5);
LABEL_15:

      goto LABEL_16;
    }
    if (v19)
    {
      v19 = v19;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = objc_opt_class();
      -[HKQuantitySample UUID](v11, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v21, v25, CFSTR("Unable to find quantity series '%@' when inserting journaled series values."), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v23;
      if (!v19)
      {
LABEL_14:
        v14 = 0;
        goto LABEL_15;
      }
    }
    if (a5)
      *a5 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();

    goto LABEL_14;
  }
  objc_msgSend(v9, "dataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "quantitySeriesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "insertValues:series:error:", self->_values, v11, a5);

LABEL_16:
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertValuesToQuantitySampleSeriesOperation)initWithCoder:(id)a3
{
  id v4;
  HDInsertValuesToQuantitySampleSeriesOperation *v5;
  uint64_t v6;
  HKQuantitySample *series;
  uint64_t v8;
  NSUUID *legacySeriesIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *values;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDInsertValuesToQuantitySampleSeriesOperation;
  v5 = -[HDInsertValuesToQuantitySampleSeriesOperation init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("series"));
    v6 = objc_claimAutoreleasedReturnValue();
    series = v5->_series;
    v5->_series = (HKQuantitySample *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
    v8 = objc_claimAutoreleasedReturnValue();
    legacySeriesIdentifier = v5->_legacySeriesIdentifier;
    v5->_legacySeriesIdentifier = (NSUUID *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("values"));
    v13 = objc_claimAutoreleasedReturnValue();
    values = v5->_values;
    v5->_values = (NSArray *)v13;

    v5->_didAwakeFromJournal = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *legacySeriesIdentifier;
  id v5;

  legacySeriesIdentifier = self->_legacySeriesIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", legacySeriesIdentifier, CFSTR("sid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_series, CFSTR("series"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_values, CFSTR("values"));

}

- (HKQuantitySample)series
{
  return self->_series;
}

- (NSArray)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_legacySeriesIdentifier, 0);
}

@end
