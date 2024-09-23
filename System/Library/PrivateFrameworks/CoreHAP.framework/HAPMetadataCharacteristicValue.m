@implementation HAPMetadataCharacteristicValue

- (NSNumber)minLength
{
  return self->_minLength;
}

- (NSNumber)maxLength
{
  return self->_maxLength;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSArray)validValues
{
  return self->_validValues;
}

- (NSNumber)stepValue
{
  return self->_stepValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (HAPMetadataCharacteristicValue)initWithMinLength:(id)a3 maxLength:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  HAPMetadataCharacteristicValue *v9;
  HAPMetadataCharacteristicValue *v10;
  NSNumber *v11;
  objc_super v13;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)HAPMetadataCharacteristicValue;
    v9 = -[HAPMetadataCharacteristicValue init](&v13, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_minLength, a3);
      v11 = (NSNumber *)(id)v8;
      self = (HAPMetadataCharacteristicValue *)v10->_maxLength;
      v10->_maxLength = v11;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HAPMetadataCharacteristicValue)initWithMinValue:(id)a3 maxValue:(id)a4 stepValue:(id)a5 validValues:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HAPMetadataCharacteristicValue *v15;
  HAPMetadataCharacteristicValue *v16;
  NSArray *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11 || v12 || v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)HAPMetadataCharacteristicValue;
    v16 = -[HAPMetadataCharacteristicValue init](&v19, sel_init);
    v15 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_minValue, a3);
      objc_storeStrong((id *)&v15->_maxValue, a4);
      objc_storeStrong((id *)&v15->_stepValue, a5);
      v17 = (NSArray *)v14;
      self = (HAPMetadataCharacteristicValue *)v15->_validValues;
      v15->_validValues = v17;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)generateDictionary
{
  void *v3;
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
  uint64_t v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataCharacteristicValue minLength](self, "minLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HAPMetadataCharacteristicValue minLength](self, "minLength");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("MinLength"));

  }
  -[HAPMetadataCharacteristicValue maxLength](self, "maxLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HAPMetadataCharacteristicValue maxLength](self, "maxLength");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("MaxLength"));

  }
  -[HAPMetadataCharacteristicValue minValue](self, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HAPMetadataCharacteristicValue minValue](self, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("MinValue"));

  }
  -[HAPMetadataCharacteristicValue maxValue](self, "maxValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HAPMetadataCharacteristicValue maxValue](self, "maxValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("MaxValue"));

  }
  -[HAPMetadataCharacteristicValue stepValue](self, "stepValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HAPMetadataCharacteristicValue stepValue](self, "stepValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("StepValue"));

  }
  -[HAPMetadataCharacteristicValue validValues](self, "validValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    -[HAPMetadataCharacteristicValue validValues](self, "validValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("ValidValues"));

  }
  return v3;
}

- (id)description
{
  void *v3;
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("ValueMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPMetadataCharacteristicValue minLength](self, "minLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HAPMetadataCharacteristicValue minLength](self, "minLength");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  minLength:%@"), v5);

  }
  -[HAPMetadataCharacteristicValue maxLength](self, "maxLength");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HAPMetadataCharacteristicValue maxLength](self, "maxLength");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  maxLength:%@"), v7);

  }
  -[HAPMetadataCharacteristicValue minValue](self, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HAPMetadataCharacteristicValue minValue](self, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  minValue:%@"), v9);

  }
  -[HAPMetadataCharacteristicValue maxValue](self, "maxValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HAPMetadataCharacteristicValue maxValue](self, "maxValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  maxValue:%@"), v11);

  }
  -[HAPMetadataCharacteristicValue stepValue](self, "stepValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HAPMetadataCharacteristicValue stepValue](self, "stepValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  stepValue:%@"), v13);

  }
  -[HAPMetadataCharacteristicValue validValues](self, "validValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HAPMetadataCharacteristicValue validValues](self, "validValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("  validValues:%@"), v15);

  }
  return v3;
}

- (void)dump
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B7244](self, a2);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPMetadataCharacteristicValue description](self, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@%@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
}

- (void)setMinValue:(id)a3
{
  objc_storeStrong((id *)&self->_minValue, a3);
}

- (void)setMaxValue:(id)a3
{
  objc_storeStrong((id *)&self->_maxValue, a3);
}

- (void)setStepValue:(id)a3
{
  objc_storeStrong((id *)&self->_stepValue, a3);
}

- (void)setMinLength:(id)a3
{
  objc_storeStrong((id *)&self->_minLength, a3);
}

- (void)setMaxLength:(id)a3
{
  objc_storeStrong((id *)&self->_maxLength, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validValues, 0);
  objc_storeStrong((id *)&self->_maxLength, 0);
  objc_storeStrong((id *)&self->_minLength, 0);
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
}

+ (id)initWithDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  HAPMetadataCharacteristicValue *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HAPMetadataCharacteristicValue *v13;
  void *v15;
  void *context;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MinLength"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MaxLength"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
    v6 = -[HAPMetadataCharacteristicValue initWithMinLength:maxLength:]([HAPMetadataCharacteristicValue alloc], "initWithMinLength:maxLength:", v4, v5);
  else
    v6 = 0;
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MinValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("MaxValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("StepValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_arrayForKey:", CFSTR("ValidValues"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || v8 || v9)
  {
    if (v6)
    {
      context = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "hmf_stringForKey:", CFSTR("ShortUUID"));
        *(_DWORD *)buf = 138544898;
        v18 = v15;
        v19 = 2112;
        v20 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v20;
        v21 = 2112;
        v22 = v4;
        v23 = 2112;
        v24 = v5;
        v25 = 2112;
        v26 = v7;
        v27 = 2112;
        v28 = v5;
        v29 = 2112;
        v30 = v9;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Characteristic %@ has both length and value metadata: minLength %@  maxLength %@  minValue %@  maxValue %@  stepValue %@", buf, 0x48u);

      }
      objc_autoreleasePoolPop(context);
    }
    v13 = -[HAPMetadataCharacteristicValue initWithMinValue:maxValue:stepValue:validValues:]([HAPMetadataCharacteristicValue alloc], "initWithMinValue:maxValue:stepValue:validValues:", v7, v8, v9, v10);

    v6 = v13;
  }

  return v6;
}

@end
