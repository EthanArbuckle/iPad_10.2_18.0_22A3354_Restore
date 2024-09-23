@implementation HDQuantityDatum

- (HDQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContext:(id)a5 quantity:(id)a6
{
  id v10;
  id v11;
  HDQuantityDatum *v12;
  _QWORD v14[4];
  id v15;

  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__HDQuantityDatum_initWithIdentifier_dateInterval_resumeContext_quantity___block_invoke;
  v14[3] = &unk_1E6CF7C00;
  v15 = v10;
  v11 = v10;
  v12 = -[HDQuantityDatum initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:](self, "initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:", a3, a4, a6, 0, v14);

  return v12;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDQuantityDatum;
  v4 = a3;
  -[HDDataCollectorSensorDatum encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantity, CFSTR("hdqd_qt"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("hdqd_md"));

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_saveCompletion, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

- (HDQuantityDatum)initWithCoder:(id)a3
{
  id v4;
  HDQuantityDatum *v5;
  uint64_t v6;
  HKQuantity *quantity;
  void *v8;
  uint64_t v9;
  NSDictionary *metadata;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDQuantityDatum;
  v5 = -[HDDataCollectorSensorDatum initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hdqd_qt"));
    v6 = objc_claimAutoreleasedReturnValue();
    quantity = v5->_quantity;
    v5->_quantity = (HKQuantity *)v6;

    objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("hdqd_md"));
    v9 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v9;

  }
  return v5;
}

+ (id)quantityDataForDifferencesInData:(id)a3 baseDatum:(id)a4 unit:(id)a5 differenceHandler:(id)a6 intervalHandler:(id)a7
{
  id v11;
  id v12;
  double (**v13)(id, void *, id);
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double (**v23)(id, void *, id);
  HDQuantityDatum *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HDQuantityDatum *v29;
  uint64_t v31;
  void (**v32)(id, void *, id);
  id v33;
  uint64_t v34;
  id obj;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v33 = a5;
  v13 = (double (**)(id, void *, id))a6;
  v32 = (void (**)(id, void *, id))a7;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v11;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v38;
    v31 = *(_QWORD *)v38;
    do
    {
      v18 = 0;
      v34 = v15;
      do
      {
        v19 = v12;
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v18);
        v21 = (void *)MEMORY[0x1BCCACAC4]();
        v12 = v20;
        if (v19)
        {
          v22 = v13[2](v13, v19, v12);
          if (fabs(v22) >= 2.22044605e-16)
          {
            v23 = v13;
            if (!v16)
              v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v24 = [HDQuantityDatum alloc];
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v32[2](v32, v19, v12);
            v26 = v16;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v33, v22);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __101__HDQuantityDatum_quantityDataForDifferencesInData_baseDatum_unit_differenceHandler_intervalHandler___block_invoke;
            v36[3] = &unk_1E6CF7C00;
            v36[4] = v12;
            v29 = -[HDQuantityDatum initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:](v24, "initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:", v25, v27, v28, 0, v36);

            v16 = v26;
            objc_msgSend(v26, "addObject:", v29);

            v13 = v23;
            v17 = v31;
            v15 = v34;
          }
        }

        objc_autoreleasePoolPop(v21);
        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __101__HDQuantityDatum_quantityDataForDifferencesInData_baseDatum_unit_differenceHandler_intervalHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (!v3)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_FAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v4;
      _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "Failed to archive %{public}@ when generating resume context for persisted data: %{public}@", buf, 0x16u);
    }
  }

  return v3;
}

id __74__HDQuantityDatum_initWithIdentifier_dateInterval_resumeContext_quantity___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (HDQuantityDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 quantity:(id)a5 metadata:(id)a6 resumeContextProvider:(id)a7
{
  id v12;
  id v13;
  HDQuantityDatum *v14;
  uint64_t v15;
  HKQuantity *quantity;
  uint64_t v17;
  NSDictionary *metadata;
  objc_super v20;

  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDQuantityDatum;
  v14 = -[HDDataCollectorSensorDatum initWithIdentifier:dateInterval:resumeContextProvider:](&v20, sel_initWithIdentifier_dateInterval_resumeContextProvider_, a3, a4, a7);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    quantity = v14->_quantity;
    v14->_quantity = (HKQuantity *)v15;

    v17 = objc_msgSend(v13, "copy");
    metadata = v14->_metadata;
    v14->_metadata = (NSDictionary *)v17;

  }
  return v14;
}

- (id)datumForChangeSince:(id)a3 newIdentifier:(id)a4 newResumeContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HDQuantityDatum *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[HDQuantityDatum quantity](self, "quantity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "quantity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_unit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isCompatibleWithUnit:", v13);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v8, "dateInterval");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDDataCollectorSensorDatum dateInterval](self, "dateInterval");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v16, "hk_isAfterDate:", v18);

      if (!v19)
      {
        -[HDQuantityDatum quantity](self, "quantity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "_unit");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "quantity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValueForUnit:", v29);
        v32 = v31;

        -[HDQuantityDatum quantity](self, "quantity");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValueForUnit:", v29);
        v35 = v34;

        objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v29, v35 - v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_alloc(MEMORY[0x1E0CB3588]);
        objc_msgSend(v8, "dateInterval");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "endDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDataCollectorSensorDatum dateInterval](self, "dateInterval");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "endDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v37, "initWithStartDate:endDate:", v39, v41);

        v26 = -[HDQuantityDatum initWithIdentifier:dateInterval:resumeContext:quantity:]([HDQuantityDatum alloc], "initWithIdentifier:dateInterval:resumeContext:quantity:", v9, v42, v10, v36);
        goto LABEL_11;
      }
      _HKInitializeLogging();
      v20 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
      {
        v21 = v20;
        objc_msgSend(v8, "dateInterval");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "endDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDataCollectorSensorDatum dateInterval](self, "dateInterval");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 138478083;
        v50 = v23;
        v51 = 2113;
        v52 = v25;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "Minuend date %{private}@ must occur at the same time or before subtrahend date %{private}@", (uint8_t *)&v49, 0x16u);

      }
    }
    else
    {
      _HKInitializeLogging();
      v27 = (void *)*MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
      {
        v44 = v27;
        -[HDQuantityDatum quantity](self, "quantity");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "_unit");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "quantity");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "_unit");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 138478083;
        v50 = v46;
        v51 = 2113;
        v52 = v48;
        _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "Couldn't subtract units of type %{private}@ from units of type %{private}@", (uint8_t *)&v49, 0x16u);

      }
    }
    v26 = 0;
  }
  else
  {
    v26 = self;
  }
LABEL_11:

  return v26;
}

+ (HDQuantityDatum)quantityDatumWithHKQuantityDatum:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  HDQuantityDatum *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  HDQuantityDatum *v12;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = [HDQuantityDatum alloc];
  objc_msgSend(v5, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__HDQuantityDatum_quantityDatumWithHKQuantityDatum_metadata___block_invoke;
  v14[3] = &unk_1E6CF7C00;
  v15 = v5;
  v11 = v5;
  v12 = -[HDQuantityDatum initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:](v7, "initWithIdentifier:dateInterval:quantity:metadata:resumeContextProvider:", v8, v9, v10, v6, v14);

  return v12;
}

uint64_t __61__HDQuantityDatum_quantityDatumWithHKQuantityDatum_metadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeContext");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[HKQuantity hash](self->_quantity, "hash");
  return -[NSDictionary hash](self->_metadata, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKQuantity *quantity;
  HKQuantity *v6;
  NSDictionary *metadata;
  NSDictionary *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v11.receiver = self;
  v11.super_class = (Class)HDQuantityDatum;
  if (!-[HDDataCollectorSensorDatum isEqual:](&v11, sel_isEqual_, v4))
    goto LABEL_9;
  quantity = self->_quantity;
  v6 = (HKQuantity *)v4[5];
  if (quantity != v6 && (!v6 || !-[HKQuantity isEqual:](quantity, "isEqual:")))
    goto LABEL_9;
  metadata = self->_metadata;
  v8 = (NSDictionary *)v4[6];
  if (metadata == v8)
  {
    v9 = 1;
    goto LABEL_10;
  }
  if (v8)
    v9 = -[NSDictionary isEqual:](metadata, "isEqual:");
  else
LABEL_9:
    v9 = 0;
LABEL_10:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HDDataCollectorSensorDatum datumIdentifier](self, "datumIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDDataCollectorSensorDatum dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@, quantity: %@>"), v4, v5, self->_quantity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (id)saveCompletion
{
  return self->_saveCompletion;
}

- (void)setSaveCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

+ (id)hdt_quantityDatumForType:(id)a3 startTime:(double)a4 endTime:(double)a5 value:(double)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDQuantityDatum *v14;
  void *v15;
  void *v16;
  HDQuantityDatum *v17;

  v9 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(a3, "canonicalUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [HDQuantityDatum alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v13);
  v17 = -[HDQuantityDatum initWithIdentifier:dateInterval:resumeContext:quantity:](v14, "initWithIdentifier:dateInterval:resumeContext:quantity:", v15, v16, 0, v11);

  return v17;
}

@end
