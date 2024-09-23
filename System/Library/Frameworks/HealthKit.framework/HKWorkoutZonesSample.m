@implementation HKWorkoutZonesSample

+ (id)zonesSampleWithType:(id)a3 zones:(id)a4 device:(id)a5 metadata:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v10 = a4;
  v11 = (void *)MEMORY[0x1E0C99D68];
  v12 = a6;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v11, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v19 = v18;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__HKWorkoutZonesSample_zonesSampleWithType_zones_device_metadata___block_invoke;
  v23[3] = &unk_1E37EB6A8;
  v24 = v10;
  v20 = v10;
  v21 = (void *)objc_msgSend(a1, "_newSampleWithType:startDate:endDate:device:metadata:config:", v14, v13, v12, v23, v17, v19);

  return v21;
}

void __66__HKWorkoutZonesSample_zonesSampleWithType_zones_device_metadata___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 96), *(id *)(a1 + 32));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSArray *zones;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  zones = self->_zones;
  -[HKSample startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKObject device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p zones=%@, startDate=%@, device=%@>"), v5, self, zones, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setZones:(id)a3
{
  NSArray *v4;
  NSArray *zones;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  zones = self->_zones;
  self->_zones = v4;

}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  _QWORD *v5;
  NSArray *zones;
  NSArray *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v10.receiver = self;
    v10.super_class = (Class)HKWorkoutZonesSample;
    if (!-[HKSample isEquivalent:](&v10, sel_isEquivalent_, v5))
      goto LABEL_7;
    zones = self->_zones;
    v7 = (NSArray *)v5[12];
    if (zones == v7)
    {
      v8 = 1;
      goto LABEL_9;
    }
    if (v7)
      v8 = -[NSArray isEqualToArray:](zones, "isEqualToArray:");
    else
LABEL_7:
      v8 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutZonesSample;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_zones, CFSTR("Zones"), v5.receiver, v5.super_class);

}

- (HKWorkoutZonesSample)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutZonesSample *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *zones;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKWorkoutZonesSample;
  v5 = -[HKSample initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Zones"));
    v9 = objc_claimAutoreleasedReturnValue();
    zones = v5->_zones;
    v5->_zones = (NSArray *)v9;

  }
  return v5;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v4;
  void *v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HKWorkoutZonesSample;
  -[HKSample _validateWithConfiguration:](&v22, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = -[NSArray count](self->_zones, "count");
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      v11 = v7 - 1;
      while (1)
      {
        v12 = (void *)v10;
        -[NSArray objectAtIndexedSubscript:](self->_zones, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          if (v11 == v9)
          {
            v20 = 0;
            v14 = -[HKWorkoutZonesSample _validateLastZone:error:](self, "_validateLastZone:error:", v13, &v20);
            v15 = v20;
          }
          else
          {
            v19 = 0;
            v14 = -[HKWorkoutZonesSample _validateMiddleZones:previousEndQuantity:error:](self, "_validateMiddleZones:previousEndQuantity:error:", v13, v10, &v19);
            v15 = v19;
          }
        }
        else
        {
          v21 = 0;
          v14 = -[HKWorkoutZonesSample _validateFirstZone:error:](self, "_validateFirstZone:error:", v13, &v21);
          v15 = v21;
        }
        v16 = v15;
        v17 = v16;
        if (!v14)
          break;
        objc_msgSend(v13, "endQuantity");
        v10 = objc_claimAutoreleasedReturnValue();

        if (v8 == ++v9)
        {
          v6 = 0;
          v12 = (void *)v10;
          goto LABEL_15;
        }
      }
      v6 = v16;

LABEL_15:
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_validateFirstZone:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;

  v6 = a3;
  objc_msgSend(v6, "endQuantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKWorkoutZonesSample _validateUnit:error:](self, "_validateUnit:error:", v7, a4);

  if (!v8)
    goto LABEL_6;
  objc_msgSend(v6, "startQuantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_5:
    LOBYTE(v14) = 1;
    goto LABEL_7;
  }
  objc_msgSend(v6, "startQuantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKWorkoutZonesSample _validateUnit:error:](self, "_validateUnit:error:", v10, a4);

  if (!v11)
  {
LABEL_6:
    LOBYTE(v14) = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "startQuantity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endQuantity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKWorkoutZonesSample _validateStartAndEnd:end:error:](self, "_validateStartAndEnd:end:error:", v12, v13, a4);

  if (v14)
    goto LABEL_5;
LABEL_7:

  return v14;
}

- (BOOL)_validateLastZone:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v14;

  v6 = a3;
  objc_msgSend(v6, "startQuantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKWorkoutZonesSample _validateUnit:error:](self, "_validateUnit:error:", v7, a4);

  if (!v8)
    goto LABEL_6;
  objc_msgSend(v6, "endQuantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_5:
    LOBYTE(v14) = 1;
    goto LABEL_7;
  }
  objc_msgSend(v6, "endQuantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKWorkoutZonesSample _validateUnit:error:](self, "_validateUnit:error:", v10, a4);

  if (!v11)
  {
LABEL_6:
    LOBYTE(v14) = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "startQuantity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endQuantity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKWorkoutZonesSample _validateStartAndEnd:end:error:](self, "_validateStartAndEnd:end:error:", v12, v13, a4);

  if (v14)
    goto LABEL_5;
LABEL_7:

  return v14;
}

- (BOOL)_validateMiddleZones:(id)a3 previousEndQuantity:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  char v18;
  id v19;
  BOOL v20;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "startQuantity");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v12 = (void *)v11,
        objc_msgSend(v9, "endQuantity"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        !v13))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("zone"), objc_opt_class(), a2, CFSTR("Quantity must not be nil"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;
    if (v19)
    {
      if (!a5)
      {
LABEL_14:
        _HKLogDroppedError(v19);
        v20 = 0;
        goto LABEL_15;
      }
LABEL_9:
      v19 = objc_retainAutorelease(v19);
      v20 = 0;
      *a5 = v19;
      v14 = v19;
      goto LABEL_16;
    }
LABEL_15:
    v14 = v19;
    goto LABEL_16;
  }
  objc_msgSend(v9, "startQuantity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HKWorkoutZonesSample _validateUnit:error:](self, "_validateUnit:error:", v14, a5))
  {
    v20 = 0;
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v9, "endQuantity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKWorkoutZonesSample _validateUnit:error:](self, "_validateUnit:error:", v15, a5);

  if (v16)
  {
    objc_msgSend(v9, "startQuantity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", v10);

    if ((v18 & 1) != 0)
    {
      objc_msgSend(v9, "startQuantity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endQuantity");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = -[HKWorkoutZonesSample _validateStartAndEnd:end:error:](self, "_validateStartAndEnd:end:error:", v14, v19, a5);
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("zone"), objc_opt_class(), a2, CFSTR("Zone start quantity must match previous zone end quantity"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;
    if (v19)
    {
      if (!a5)
        goto LABEL_14;
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)_validateUnit:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  id v13;
  void *v14;

  v7 = a3;
  -[HKSample sampleType](self, "sampleType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKWorkoutZonesType heartRateType](HKWorkoutZonesType, "heartRateType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
    +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("count/min"));
  else
    +[HKUnit wattUnit](HKUnit, "wattUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "isCompatibleWithUnit:", v10);
  if ((v11 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("quantity"), objc_opt_class(), a2, CFSTR("Quantity has incorrect units"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v12 = v13 == 0;
    if (v13)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError(v13);
    }

  }
  return v12;
}

- (BOOL)_validateStartAndEnd:(id)a3 end:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "compare:", v9) == 1 || !objc_msgSend(v8, "compare:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("start"), objc_opt_class(), a2, CFSTR("Start quantity must be greater than end quantity"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v10 = v11 == 0;
    if (v11)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError(v11);
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (NSArray)zones
{
  return self->_zones;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
}

@end
