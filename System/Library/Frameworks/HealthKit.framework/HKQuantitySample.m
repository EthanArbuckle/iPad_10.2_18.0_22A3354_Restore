@implementation HKQuantitySample

+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate device:(HKDevice *)device metadata:(NSDictionary *)metadata
{
  HKQuantityType *v13;
  HKQuantity *v14;
  NSDate *v15;
  NSDate *v16;
  HKDevice *v17;
  NSDictionary *v18;
  objc_class *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  HKQuantity *v24;
  void *v25;
  _QWORD v27[4];
  HKQuantity *v28;

  v13 = quantityType;
  v14 = quantity;
  v15 = startDate;
  v16 = endDate;
  v17 = device;
  v18 = metadata;
  v19 = -[HKObjectType dataObjectClass](v13, "dataObjectClass");
  if (!v15)
  {
    v21 = 2.22507386e-308;
    if (v16)
      goto LABEL_3;
LABEL_5:
    v23 = 2.22507386e-308;
    goto LABEL_6;
  }
  -[NSDate timeIntervalSinceReferenceDate](v15, "timeIntervalSinceReferenceDate");
  v21 = v20;
  if (!v16)
    goto LABEL_5;
LABEL_3:
  -[NSDate timeIntervalSinceReferenceDate](v16, "timeIntervalSinceReferenceDate");
  v23 = v22;
LABEL_6:
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __86__HKQuantitySample_quantitySampleWithType_quantity_startDate_endDate_device_metadata___block_invoke;
  v27[3] = &unk_1E37F2DF0;
  v28 = v14;
  v24 = v14;
  v25 = (void *)-[objc_class _newSampleWithType:startDate:endDate:device:metadata:config:](v19, "_newSampleWithType:startDate:endDate:device:metadata:config:", v13, v17, v18, v27, v21, v23);

  return (HKQuantitySample *)v25;
}

void __86__HKQuantitySample_quantitySampleWithType_quantity_startDate_endDate_device_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 96), *(id *)(a1 + 32));
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableQuantitySample, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  return (HKQuantitySample *)objc_msgSend(a1, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", quantityType, quantity, startDate, endDate, 0, 0);
}

- (void)_setQuantity:(id)a3
{
  HKQuantity *v4;
  HKQuantity *quantity;

  v4 = (HKQuantity *)objc_msgSend(a3, "copy");
  quantity = self->_quantity;
  self->_quantity = v4;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HKQuantitySample;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantity, CFSTR("Quantity"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_count, CFSTR("Count"));
  if (!self->_freezeState)
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("Unfrozen"));

}

- (id)_valueDescription
{
  return -[HKQuantity description](self->_quantity, "description");
}

+ (HKQuantitySample)quantitySampleWithType:(HKQuantityType *)quantityType quantity:(HKQuantity *)quantity startDate:(NSDate *)startDate endDate:(NSDate *)endDate metadata:(NSDictionary *)metadata
{
  return (HKQuantitySample *)objc_msgSend(a1, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", quantityType, quantity, startDate, endDate, 0, metadata);
}

- (id)asJSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKQuantitySample;
  -[HKSample asJSONObject](&v11, sel_asJSONObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantitySample quantityType](self, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("unit"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantitySample quantity](self, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v5);
  objc_msgSend(v7, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("quantity"));

  return v3;
}

+ (id)_unfrozenQuantitySampleWithQuantityType:(id)a3 quantity:(id)a4 startDate:(id)a5 device:(id)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v9 = a4;
  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(v13, "minimumAllowedDuration");
  objc_msgSend(v10, "dateWithTimeInterval:sinceDate:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "dataObjectClass");
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v17 = v16;

  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  v19 = v18;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__HKQuantitySample__unfrozenQuantitySampleWithQuantityType_quantity_startDate_device___block_invoke;
  v23[3] = &unk_1E37F2DF0;
  v24 = v9;
  v20 = v9;
  v21 = (void *)objc_msgSend(v15, "_newSampleWithType:startDate:endDate:device:metadata:config:", v13, v11, 0, v23, v17, v19);

  return v21;
}

void __86__HKQuantitySample__unfrozenQuantitySampleWithQuantityType_quantity_startDate_device___block_invoke(uint64_t a1, id *a2)
{
  id *v3;

  objc_storeStrong(a2 + 12, *(id *)(a1 + 32));
  v3 = a2;
  v3[13] = 0;

}

+ (BOOL)_isConcreteObjectClass
{
  return 0;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKQuantitySample;
  result = -[HKSample _init](&v3, sel__init);
  if (result)
  {
    *((_QWORD *)result + 14) = 1;
    *((_QWORD *)result + 13) = 2;
  }
  return result;
}

- (BOOL)_shouldNotifyOnInsert
{
  return self->_freezeState == 2;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)HKQuantitySample;
  -[HKSample _validateWithConfiguration:](&v27, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[HKQuantity _unit](self->_quantity, "_unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantitySample quantityType](self, "quantityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCompatibleWithUnit:", v8);

    if ((v10 & 1) != 0)
    {
      +[HKUnit appleEffortScoreUnit](HKUnit, "appleEffortScoreUnit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "isEqual:", v11);

      if (v12)
      {
        -[HKQuantity _value](self->_quantity, "_value");
        v14 = v13;
        if (v13 < 0.0 || v13 > 10.0)
        {
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v17 = objc_opt_class();
          objc_msgSend(v16, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v17, a2, CFSTR("%@ %@ requires a value between 0 and 10. Invalid value: %f"), objc_opt_class(), v8, *(_QWORD *)&v14);
LABEL_14:
          v7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
      if (self->_count <= 0)
      {
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v24 = objc_opt_class();
        objc_msgSend(v23, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v24, a2, CFSTR("%@ %@ requires a count > 0"), objc_opt_class(), self, v26);
        goto LABEL_14;
      }
      v7 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      -[HKQuantitySample quantityType](self, "quantityType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dimension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v19, a2, CFSTR("%@ %@ requires unit of type %@. Incompatible unit: %@"), v20, self, v22, v8);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_15:

    goto LABEL_16;
  }
  v7 = v5;
LABEL_16:

  return v7;
}

+ (id)_quantitySamplesEnforcingDurationWithType:(id)a3 quantity:(id)a4 startDate:(id)a5 endDate:(id)a6 device:(id)a7 metadata:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  id v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t);
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _BYTE *v52;
  double v53;
  id v54;
  void *v55;
  _BYTE buf[24];
  id v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v17, "timeIntervalSinceDate:", v16);
  v21 = v20;
  if (objc_msgSend(v14, "isMaximumDurationRestricted"))
  {
    objc_msgSend(v14, "maximumAllowedDuration");
    if (v21 > v22)
    {
      _HKInitializeLogging();
      v23 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2112;
        v57 = v17;
        _os_log_fault_impl(&dword_19A0E6000, v23, OS_LOG_TYPE_FAULT, "Data duration is longer than allowed for type %@, start date %@, end date %@", buf, 0x20u);
      }
      v24 = objc_msgSend(v14, "aggregationStyle");
      if ((unint64_t)(v24 - 1) >= 3)
      {
        if (v24)
        {
          v25 = 0;
        }
        else
        {
          objc_msgSend(v15, "_unit");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v57 = 0;
          objc_msgSend(v15, "doubleValueForUnit:", v30);
          v57 = v31;
          v32 = *(double *)(*(_QWORD *)&buf[8] + 24) / v21;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __105__HKQuantitySample__quantitySamplesEnforcingDurationWithType_quantity_startDate_endDate_device_metadata___block_invoke;
          aBlock[3] = &unk_1E37F2E18;
          v52 = buf;
          v53 = v32;
          v47 = v17;
          v48 = v30;
          v54 = a1;
          v49 = v14;
          v50 = v18;
          v51 = v19;
          v33 = v30;
          v25 = _Block_copy(aBlock);

          _Block_object_dispose(buf, 8);
        }
      }
      else
      {
        v37 = MEMORY[0x1E0C809B0];
        v38 = 3221225472;
        v39 = __105__HKQuantitySample__quantitySamplesEnforcingDurationWithType_quantity_startDate_endDate_device_metadata___block_invoke_2;
        v40 = &unk_1E37F2E40;
        v45 = a1;
        v41 = v14;
        v42 = v15;
        v43 = v18;
        v44 = v19;
        v25 = _Block_copy(&v37);

      }
      objc_msgSend(a1, "_enumerateValidIntervalsWithStartDate:endDate:sampleType:block:", v16, v17, v14, v25, v37, v38, v39, v40);
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  if (!objc_msgSend(v14, "isMinimumDurationRestricted")
    || (objc_msgSend(v14, "minimumAllowedDuration"), v21 >= v26))
  {
    objc_msgSend(a1, "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v14, v15, v16, v17, v18, v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v28 = (void *)v29;

    goto LABEL_18;
  }
  _HKInitializeLogging();
  v27 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_FAULT))
  {
    v35 = v27;
    objc_msgSend(v14, "minimumAllowedDuration");
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v57 = v17;
    v58 = 2048;
    v59 = v36;
    _os_log_fault_impl(&dword_19A0E6000, v35, OS_LOG_TYPE_FAULT, "Not creating any samples because data duration is shorter than allowed for type %@, start date %@, end date %@. Minimum allowed duration for this type is %f", buf, 0x2Au);

  }
  v28 = (void *)MEMORY[0x1E0C9AA60];
LABEL_18:

  return v28;
}

id __105__HKQuantitySample__quantitySamplesEnforcingDurationWithType_quantity_startDate_endDate_device_metadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (objc_msgSend(v6, "hk_isBeforeDate:", *(_QWORD *)(a1 + 32)))
  {
    v8 = *(double *)(a1 + 80);
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v7 = v8 * v9;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24)
                                                                - v7;
  }
  +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 40), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 88), "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", *(_QWORD *)(a1 + 48), v10, v5, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __105__HKQuantitySample__quantitySamplesEnforcingDurationWithType_quantity_startDate_endDate_device_metadata___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 64), "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuantitySample)initWithCoder:(id)a3
{
  id v4;
  HKQuantitySample *v5;
  uint64_t v6;
  HKQuantity *quantity;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKQuantitySample;
  v5 = -[HKSample initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Quantity"));
    v6 = objc_claimAutoreleasedReturnValue();
    quantity = v5->_quantity;
    v5->_quantity = (HKQuantity *)v6;

    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Count"));
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    v5->_count = v9;
    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Unfrozen"));
    v11 = 2;
    if (v10)
      v11 = 0;
    v5->_freezeState = v11;
  }

  return v5;
}

- (BOOL)_frozen
{
  return self->_freezeState != 0;
}

- (void)_setFrozen:(BOOL)a3
{
  int64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_freezeState = v3;
}

- (void)_setFreezing
{
  self->_freezeState = 1;
}

- (void)_setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)_compareFreezeStateWithSample:(id)a3
{
  int64_t freezeState;
  int64_t v4;
  BOOL v5;
  int64_t v6;

  freezeState = self->_freezeState;
  v4 = *((_QWORD *)a3 + 13);
  v5 = freezeState < v4;
  v6 = freezeState > v4;
  if (v5)
    return -1;
  else
    return v6;
}

- (NSInteger)count
{
  return self->_count;
}

- (HDCodableQuantitySample)codableQuantitySample
{
  return self->_codableQuantitySample;
}

- (void)_setCodableQuantitySample:(id)a3
{
  objc_storeStrong((id *)&self->_codableQuantitySample, a3);
}

@end
