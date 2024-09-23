@implementation HKAudiogramSensitivityPoint

- (HKAudiogramSensitivityPoint)initWithFrequency:(id)a3 leftEarSensitivity:(id)a4 rightEarSensitivity:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKAudiogramSensitivityPoint *v12;
  HKAudiogramSensitivityPoint *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKAudiogramSensitivityPoint;
  v12 = -[HKAudiogramSensitivityPoint init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_frequency, a3);
    objc_storeStrong((id *)&v13->_leftEarSensitivity, a4);
    objc_storeStrong((id *)&v13->_rightEarSensitivity, a5);
  }

  return v13;
}

+ (HKAudiogramSensitivityPoint)sensitivityPointWithFrequency:(HKQuantity *)frequency leftEarSensitivity:(HKQuantity *)leftEarSensitivity rightEarSensitivity:(HKQuantity *)rightEarSensitivity error:(NSError *)error
{
  HKQuantity *v10;
  HKQuantity *v11;
  HKQuantity *v12;
  HKAudiogramSensitivityPoint *v13;

  v10 = frequency;
  v11 = leftEarSensitivity;
  v12 = rightEarSensitivity;
  if (objc_msgSend(a1, "_validateUnitForFrequency:", v10)
    && objc_msgSend(a1, "_validateUnitForSensitivity:", v11)
    && objc_msgSend(a1, "_validateUnitForSensitivity:", v12)
    && +[HKAudiogramSensitivityPoint validFrequency:error:](HKAudiogramSensitivityPoint, "validFrequency:error:", v10, error)&& +[HKAudiogramSensitivityPoint validSensitivity:error:](HKAudiogramSensitivityPoint, "validSensitivity:error:", v11, error)&& +[HKAudiogramSensitivityPoint validSensitivity:error:](HKAudiogramSensitivityPoint, "validSensitivity:error:", v12, error))
  {
    v13 = -[HKAudiogramSensitivityPoint initWithFrequency:leftEarSensitivity:rightEarSensitivity:]([HKAudiogramSensitivityPoint alloc], "initWithFrequency:leftEarSensitivity:rightEarSensitivity:", v10, v11, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_incompatibleUnit:(id)a3 incompatibleWith:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(a3, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("Unit '%@' is not compatible with unit '%@'"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2D50];
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"), 3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_rangeViolationMin:(id)a3 max:(id)a4 value:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "_unit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v11);
  v13 = v12;

  objc_msgSend(v10, "_unit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unitString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_unit");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValueForUnit:", v16);
  v18 = v17;
  objc_msgSend(v9, "_unit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v19);
  v21 = v20;

  objc_msgSend(v10, "_unit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "unitString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Value %lg %@ is outside the range %lg - %lg %@"), v13, v15, v18, v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0CB35C8];
  v29 = *MEMORY[0x1E0CB2D50];
  v30[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"), 3, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (BOOL)validFrequency:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  BOOL v16;

  v6 = a3;
  +[HKUnit hertzUnit](HKUnit, "hertzUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isCompatibleWithUnit:", v7);

  if ((v8 & 1) != 0)
  {
    +[HKUnit hertzUnit](HKUnit, "hertzUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKUnit hertzUnit](HKUnit, "hertzUnit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v11, 30000.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "compare:", v10) != -1 && objc_msgSend(v6, "compare:", v12) != 1)
    {
      v16 = 1;
      goto LABEL_11;
    }
    objc_msgSend(a1, "_rangeViolationMin:max:value:", v10, v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "_unit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit hertzUnit](HKUnit, "hertzUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_incompatibleUnit:incompatibleWith:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v15 = v14;
  if (v14)
  {
    if (a4)
    {
      v15 = objc_retainAutorelease(v14);
      *a4 = v15;
    }
    else
    {
      _HKLogDroppedError(v14);
    }
  }

  v16 = 0;
LABEL_11:

  return v16;
}

+ (BOOL)validSensitivity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  id v16;

  v6 = a3;
  if (v6)
  {
    +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isCompatibleWithUnit:", v7);

    if ((v8 & 1) != 0)
    {
      +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v9, -20.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v11, 160.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "compare:", v10) != -1 && objc_msgSend(v6, "compare:", v12) != 1)
      {
        v14 = 1;
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(a1, "_rangeViolationMin:max:value:", v10, v12, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "_unit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_incompatibleUnit:incompatibleWith:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v13;
    v16 = v15;
    if (v15)
    {
      if (a4)
      {
        v16 = objc_retainAutorelease(v15);
        *a4 = v16;
      }
      else
      {
        _HKLogDroppedError(v15);
      }
    }

    v14 = 0;
    goto LABEL_13;
  }
  v14 = 1;
LABEL_14:

  return v14;
}

+ (BOOL)_validateUnitForSensitivity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  objc_msgSend(v4, "_unit");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isCompatibleWithUnit:", v8);

  if ((v9 & 1) != 0)
  {
LABEL_4:
    v10 = 1;
  }
  else
  {
LABEL_5:
    objc_msgSend(v5, "_unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit decibelHearingLevelUnit](HKUnit, "decibelHearingLevelUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_incompatibleUnit:incompatibleWith:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v13, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", CFSTR("_HKObjectValidationFailureException"), CFSTR("%@"), v15);

    v10 = 0;
  }

  return v10;
}

+ (BOOL)_validateUnitForFrequency:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Frequency is missing for sensitivity point."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.healthkit"), 3, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v18, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise:format:", CFSTR("_HKObjectValidationFailureException"), CFSTR("%@"), v20);

    goto LABEL_7;
  }
  objc_msgSend(v4, "_unit");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        +[HKUnit hertzUnit](HKUnit, "hertzUnit"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v5, "isCompatibleWithUnit:", v8),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    objc_msgSend(v5, "_unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit hertzUnit](HKUnit, "hertzUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_incompatibleUnit:incompatibleWith:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v13, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "raise:format:", CFSTR("_HKObjectValidationFailureException"), CFSTR("%@"), v15);

LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v10 = 1;
LABEL_8:

  return v10;
}

- (HKQuantity)frequency
{
  return self->_frequency;
}

- (HKQuantity)leftEarSensitivity
{
  return self->_leftEarSensitivity;
}

- (HKQuantity)rightEarSensitivity
{
  return self->_rightEarSensitivity;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HKAudiogramSensitivityPoint *v4;
  HKAudiogramSensitivityPoint *v5;
  BOOL v6;

  v4 = (HKAudiogramSensitivityPoint *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[HKAudiogramSensitivityPoint isEqualToSensitivityPoint:](self, "isEqualToSensitivityPoint:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToSensitivityPoint:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = a3;
  -[HKAudiogramSensitivityPoint frequency](self, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frequency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    objc_msgSend(v5, "frequency");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v17 = 0;
      goto LABEL_27;
    }
    v3 = (void *)v8;
    -[HKAudiogramSensitivityPoint frequency](self, "frequency");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frequency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqual:", v10))
    {
      v17 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v32 = v10;
    v33 = v9;
  }
  -[HKAudiogramSensitivityPoint leftEarSensitivity](self, "leftEarSensitivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftEarSensitivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != v12)
  {
    objc_msgSend(v5, "leftEarSensitivity");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v17 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v14 = (void *)v13;
    -[HKAudiogramSensitivityPoint leftEarSensitivity](self, "leftEarSensitivity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftEarSensitivity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqual:", v16) & 1) == 0)
    {

      v17 = 0;
LABEL_22:
      v25 = v6 == v7;
      goto LABEL_25;
    }
    v28 = v16;
    v29 = v15;
    v30 = v14;
  }
  -[HKAudiogramSensitivityPoint rightEarSensitivity](self, "rightEarSensitivity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightEarSensitivity");
  v19 = objc_claimAutoreleasedReturnValue();
  v17 = v18 == (void *)v19;
  if (v18 == (void *)v19)
  {

    goto LABEL_19;
  }
  v20 = (void *)v19;
  v31 = v11;
  objc_msgSend(v5, "rightEarSensitivity");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {

LABEL_19:
    if (v11 != v12)
    {

    }
    goto LABEL_21;
  }
  v22 = (void *)v21;
  v27 = v3;
  -[HKAudiogramSensitivityPoint rightEarSensitivity](self, "rightEarSensitivity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightEarSensitivity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v23, "isEqual:", v24);

  if (v31 == v12)
  {

  }
  else
  {

  }
  v25 = v6 == v7;
  v3 = v27;
LABEL_25:
  v10 = v32;
  v9 = v33;
  if (!v25)
    goto LABEL_26;
LABEL_27:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HKAudiogramSensitivityPoint frequency](self, "frequency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("FrequencyKey"));

  -[HKAudiogramSensitivityPoint leftEarSensitivity](self, "leftEarSensitivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("LeftEarSensitivityKey"));

  -[HKAudiogramSensitivityPoint rightEarSensitivity](self, "rightEarSensitivity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("RightEarSensitivityKey"));

}

- (HKAudiogramSensitivityPoint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKAudiogramSensitivityPoint *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FrequencyKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LeftEarSensitivityKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RightEarSensitivityKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKAudiogramSensitivityPoint initWithFrequency:leftEarSensitivity:rightEarSensitivity:]([HKAudiogramSensitivityPoint alloc], "initWithFrequency:leftEarSensitivity:rightEarSensitivity:", v5, v6, v7);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarSensitivity, 0);
  objc_storeStrong((id *)&self->_leftEarSensitivity, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
}

@end
