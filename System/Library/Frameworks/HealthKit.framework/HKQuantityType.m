@implementation HKQuantityType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalUnit, 0);
}

- (HKUnit)canonicalUnit
{
  os_unfair_lock_s *p_canonicalUnitLock;
  HKUnit *v4;
  HKUnit *canonicalUnit;

  p_canonicalUnitLock = &self->_canonicalUnitLock;
  os_unfair_lock_lock(&self->_canonicalUnitLock);
  if (!self->_canonicalUnit)
  {
    +[HKUnit unitFromString:](HKUnit, "unitFromString:", (_QWORD)-[HKObjectType _definition](self, "_definition")[24]);
    v4 = (HKUnit *)objc_claimAutoreleasedReturnValue();
    canonicalUnit = self->_canonicalUnit;
    self->_canonicalUnit = v4;

  }
  os_unfair_lock_unlock(p_canonicalUnitLock);
  return self->_canonicalUnit;
}

- (BOOL)isCompatibleWithUnit:(HKUnit *)unit
{
  HKUnit *v4;
  void *v5;
  char v6;

  v4 = unit;
  -[HKQuantityType canonicalUnit](self, "canonicalUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isCompatibleWithUnit:", v4);

  return v6;
}

- (HKQuantityAggregationStyle)aggregationStyle
{
  return (uint64_t)(char)-[HKObjectType _definition](self, "_definition")[42];
}

- (id)defaultUnitForLocale:(id)a3 version:(int64_t)a4
{
  void *v4;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  char v9;
  void *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  int v18;

  v6 = a3;
  v7 = -[HKObjectType code](self, "code");
  if (v7 <= 255)
  {
    switch(v7)
    {
      case 2:
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v10, "BOOLValue");
        if (v18
          && (objc_msgSend(v6, "localeIdentifier"),
              v4 = (void *)objc_claimAutoreleasedReturnValue(),
              (objc_msgSend(v4, "isEqual:", CFSTR("en_GB")) & 1) == 0))
        {
          +[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          +[HKUnit footUnit](HKUnit, "footUnit");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
            goto LABEL_39;
        }

        break;
      case 3:
      case 4:
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");
        v12 = CFSTR("lb");
        v13 = CFSTR("kg");
        goto LABEL_35;
      case 5:
      case 61:
        v8 = CFSTR("count/min");
        goto LABEL_10;
      case 6:
      case 7:
      case 11:
      case 12:
      case 13:
      case 14:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 26:
      case 27:
      case 28:
      case 30:
      case 57:
      case 59:
      case 60:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 79:
      case 80:
      case 81:
      case 82:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 111:
      case 112:
        goto LABEL_29;
      case 8:
      case 83:
      case 113:
        goto LABEL_8;
      case 9:
      case 10:
      case 29:
        _HKEnergyUnitForLocale(v6);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 15:
        _HKBloodGlucoseUnitForLocale(v6);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 24:
      case 25:
      case 32:
      case 34:
      case 36:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 45:
      case 46:
      case 48:
      case 49:
      case 51:
      case 52:
      case 55:
      case 56:
      case 78:
        v8 = CFSTR("mg");
        goto LABEL_10;
      case 31:
      case 33:
      case 35:
      case 37:
      case 43:
      case 44:
      case 47:
      case 50:
      case 53:
      case 54:
        v8 = CFSTR("mcg");
        goto LABEL_10;
      case 58:
        v8 = CFSTR("mcS");
        goto LABEL_10;
      case 62:
      case 90:
        goto LABEL_27;
      case 89:
        v8 = CFSTR("count");
        goto LABEL_10;
      case 110:
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");
        v12 = CFSTR("yd");
        goto LABEL_34;
      case 114:
LABEL_21:
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");
        v12 = CFSTR("in");
        v13 = CFSTR("cm");
        goto LABEL_35;
      default:
        switch(v7)
        {
          case 187:
            goto LABEL_18;
          case 188:
            goto LABEL_21;
          case 189:
          case 190:
          case 191:
          case 192:
          case 193:
          case 194:
            goto LABEL_29;
          case 195:
          case 196:
            objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "BOOLValue");
            v12 = CFSTR("ft/s");
            v13 = CFSTR("m/s");
            goto LABEL_35;
          case 197:
            v8 = CFSTR("hr");
            goto LABEL_10;
          default:
            if (v7 != 138)
              goto LABEL_29;
            goto LABEL_8;
        }
    }
    goto LABEL_39;
  }
  if (v7 > 276)
  {
    v9 = v7 - 25;
    if ((unint64_t)(v7 - 281) > 0x16)
      goto LABEL_26;
    if (((1 << v9) & 0x700001) == 0)
    {
      if (((1 << v9) & 0x1A000) != 0)
      {
LABEL_8:
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");
        v12 = CFSTR("mi");
        v13 = CFSTR("km");
LABEL_35:
        if (v11)
          v16 = v13;
        else
          v16 = v12;
        +[HKUnit unitFromString:](HKUnit, "unitFromString:", v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

        goto LABEL_40;
      }
      if (v7 == 295)
      {
        v8 = CFSTR("km");
LABEL_10:
        +[HKUnit unitFromString:](HKUnit, "unitFromString:", v8);
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_26:
      if (v7 == 277)
        goto LABEL_27;
      goto LABEL_29;
    }
LABEL_18:
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");
    v12 = CFSTR("mi/hr");
    v13 = CFSTR("km/hr");
    goto LABEL_35;
  }
  switch(v7)
  {
    case 256:
LABEL_27:
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");
      v12 = CFSTR("degF");
      v13 = CFSTR("degC");
      goto LABEL_35;
    case 269:
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C99840]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");
      v12 = CFSTR("ft");
LABEL_34:
      v13 = CFSTR("m");
      goto LABEL_35;
    case 274:
      goto LABEL_18;
  }
LABEL_29:
  -[HKQuantityType canonicalUnit](self, "canonicalUnit");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v15 = (void *)v14;
LABEL_40:

  return v15;
}

- (BOOL)supportsStatisticOptions:(unint64_t)a3
{
  HKQuantityAggregationStyle v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;

  v5 = -[HKQuantityType aggregationStyle](self, "aggregationStyle");
  if ((unint64_t)(v5 - 1) >= 3)
  {
    if (v5 == HKQuantityAggregationStyleCumulative)
    {
      if ((a3 & 2) != 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = CFSTR("HKStatisticsOptionDiscreteAverage");
      }
      else if ((a3 & 4) != 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = CFSTR("HKStatisticsOptionDiscreteMin");
      }
      else if ((a3 & 8) != 0)
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = CFSTR("HKStatisticsOptionDiscreteMax");
      }
      else
      {
        v6 = _HKStatisticsOptionPercentile() & a3;
        if (v6 != _HKStatisticsOptionPercentile())
          return 1;
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = CFSTR("_HKStatisticsOptionPercentile()");
      }
      objc_msgSend(v7, "raise:format:", v8, CFSTR("Statistics option %@ is not compatible with cumulative data type %@"), v9, self);
      return 0;
    }
    return 1;
  }
  if ((a3 & 0x10) == 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Statistics option %@ is not compatible with discrete data type %@"), CFSTR("HKStatisticsOptionCumulativeSum"), self);
  return 0;
}

- (void)validateUnitForStatistic:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[HKSampleType _unitForChangeInCanonicalUnit](self, "_unitForChangeInCanonicalUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isCompatibleWithUnit:", v6);

  if ((v5 & 1) == 0)
    -[HKQuantityType validateUnit:](self, "validateUnit:", v6);

}

- (id)_initWithCode:(int64_t)a3
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKQuantityType;
  result = -[HKObjectType _initWithCode:](&v4, sel__initWithCode_, a3);
  if (result)
    *((_DWORD *)result + 8) = 0;
  return result;
}

- (HKQuantityType)initWithIdentifier:(id)a3
{
  id v4;
  HKQuantityType *v5;

  v4 = a3;
  +[HKObjectType quantityTypeForIdentifier:](HKObjectType, "quantityTypeForIdentifier:", v4);
  v5 = (HKQuantityType *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid %@ identifier \"%@\"), objc_opt_class(), v4);

  return v5;
}

- (_HKDimension)dimension
{
  void *v2;
  void *v3;

  -[HKQuantityType canonicalUnit](self, "canonicalUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dimension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_HKDimension *)v3;
}

- (void)validateUnit:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HKQuantityType canonicalUnit](self, "canonicalUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "_isCompatibleWithUnit:", v4);

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = objc_opt_class();
    -[HKQuantityType dimension](self, "dimension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ %@ requires unit of type %@. Incompatible unit: %@"), v8, self, v9, v10);

  }
}

- (void)validateUnitFromString:(id)a3
{
  id v4;

  +[HKUnit unitFromString:](HKUnit, "unitFromString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKQuantityType validateUnit:](self, "validateUnit:", v4);

}

+ (id)_quantityTypeWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_dataTypeWithCode:expectedClass:", a3, objc_opt_class());
}

@end
