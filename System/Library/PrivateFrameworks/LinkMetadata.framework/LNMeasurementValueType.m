@implementation LNMeasurementValueType

- (LNMeasurementValueType)initWithUnitType:(int64_t)a3
{
  LNMeasurementValueType *v4;
  LNMeasurementValueType *v5;
  LNMeasurementValueType *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNMeasurementValueType;
  v4 = -[LNValueType _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v4->_unitType = a3;
    v6 = v4;
  }

  return v5;
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (id)typeIdentifierAsString
{
  int64_t v2;

  v2 = -[LNMeasurementValueType unitType](self, "unitType");
  if ((unint64_t)(v2 - 1) > 0x15)
    return CFSTR("Unsupported measurement type");
  else
    return off_1E39A18D8[v2 - 1];
}

- (id)description
{
  int64_t v2;

  v2 = -[LNMeasurementValueType unitType](self, "unitType");
  if ((unint64_t)(v2 - 1) > 0x15)
    return CFSTR("Unsupported measurement type");
  else
    return off_1E39A18D8[v2 - 1];
}

- (LNMeasurementValueType)initWithCoder:(id)a3
{
  return -[LNMeasurementValueType initWithUnitType:](self, "initWithUnitType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("unitType")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNMeasurementValueType unitType](self, "unitType"), CFSTR("unitType"));

}

- (BOOL)isEqual:(id)a3
{
  LNMeasurementValueType *v4;
  LNMeasurementValueType *v5;
  LNMeasurementValueType *v6;
  int64_t v7;
  BOOL v8;

  v4 = (LNMeasurementValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = -[LNMeasurementValueType unitType](self, "unitType");
      v8 = v7 == -[LNMeasurementValueType unitType](v6, "unitType");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int64_t)unitType
{
  return self->_unitType;
}

+ (LNMeasurementValueType)unsupportedMeasurementValueType
{
  if (unsupportedMeasurementValueType_onceToken != -1)
    dispatch_once(&unsupportedMeasurementValueType_onceToken, &__block_literal_global_4812);
  return (LNMeasurementValueType *)(id)unsupportedMeasurementValueType_value;
}

+ (LNMeasurementValueType)accelerationValueType
{
  if (accelerationValueType_onceToken != -1)
    dispatch_once(&accelerationValueType_onceToken, &__block_literal_global_1_4811);
  return (LNMeasurementValueType *)(id)accelerationValueType_value;
}

+ (LNMeasurementValueType)angleValueType
{
  if (angleValueType_onceToken != -1)
    dispatch_once(&angleValueType_onceToken, &__block_literal_global_2_4810);
  return (LNMeasurementValueType *)(id)angleValueType_value;
}

+ (LNMeasurementValueType)areaValueType
{
  if (areaValueType_onceToken != -1)
    dispatch_once(&areaValueType_onceToken, &__block_literal_global_3_4809);
  return (LNMeasurementValueType *)(id)areaValueType_value;
}

+ (LNMeasurementValueType)concentrationMassValueType
{
  if (concentrationMassValueType_onceToken != -1)
    dispatch_once(&concentrationMassValueType_onceToken, &__block_literal_global_4_4808);
  return (LNMeasurementValueType *)(id)concentrationMassValueType_value;
}

+ (LNMeasurementValueType)dispersionValueType
{
  if (dispersionValueType_onceToken != -1)
    dispatch_once(&dispersionValueType_onceToken, &__block_literal_global_5_4807);
  return (LNMeasurementValueType *)(id)dispersionValueType_value;
}

+ (LNMeasurementValueType)durationValueType
{
  if (durationValueType_onceToken != -1)
    dispatch_once(&durationValueType_onceToken, &__block_literal_global_6_4806);
  return (LNMeasurementValueType *)(id)durationValueType_value;
}

+ (LNMeasurementValueType)electricChargeValueType
{
  if (electricChargeValueType_onceToken != -1)
    dispatch_once(&electricChargeValueType_onceToken, &__block_literal_global_7_4805);
  return (LNMeasurementValueType *)(id)electricChargeValueType_value;
}

+ (LNMeasurementValueType)electricCurrentValueType
{
  if (electricCurrentValueType_onceToken != -1)
    dispatch_once(&electricCurrentValueType_onceToken, &__block_literal_global_8_4804);
  return (LNMeasurementValueType *)(id)electricCurrentValueType_value;
}

+ (LNMeasurementValueType)electricPotentialDifferenceValueType
{
  if (electricPotentialDifferenceValueType_onceToken != -1)
    dispatch_once(&electricPotentialDifferenceValueType_onceToken, &__block_literal_global_9_4803);
  return (LNMeasurementValueType *)(id)electricPotentialDifferenceValueType_value;
}

+ (LNMeasurementValueType)electricResistanceValueType
{
  if (electricResistanceValueType_onceToken != -1)
    dispatch_once(&electricResistanceValueType_onceToken, &__block_literal_global_10_4802);
  return (LNMeasurementValueType *)(id)electricResistanceValueType_value;
}

+ (LNMeasurementValueType)energyValueType
{
  if (energyValueType_onceToken != -1)
    dispatch_once(&energyValueType_onceToken, &__block_literal_global_11_4801);
  return (LNMeasurementValueType *)(id)energyValueType_value;
}

+ (LNMeasurementValueType)frequencyValueType
{
  if (frequencyValueType_onceToken != -1)
    dispatch_once(&frequencyValueType_onceToken, &__block_literal_global_12_4800);
  return (LNMeasurementValueType *)(id)frequencyValueType_value;
}

+ (LNMeasurementValueType)fuelEfficiencyValueType
{
  if (fuelEfficiencyValueType_onceToken != -1)
    dispatch_once(&fuelEfficiencyValueType_onceToken, &__block_literal_global_13_4799);
  return (LNMeasurementValueType *)(id)fuelEfficiencyValueType_value;
}

+ (LNMeasurementValueType)illuminanceValueType
{
  if (illuminanceValueType_onceToken != -1)
    dispatch_once(&illuminanceValueType_onceToken, &__block_literal_global_14_4798);
  return (LNMeasurementValueType *)(id)illuminanceValueType_value;
}

+ (LNMeasurementValueType)informationStorageValueType
{
  if (informationStorageValueType_onceToken != -1)
    dispatch_once(&informationStorageValueType_onceToken, &__block_literal_global_15);
  return (LNMeasurementValueType *)(id)informationStorageValueType_value;
}

+ (LNMeasurementValueType)lengthValueType
{
  if (lengthValueType_onceToken != -1)
    dispatch_once(&lengthValueType_onceToken, &__block_literal_global_16_4797);
  return (LNMeasurementValueType *)(id)lengthValueType_value;
}

+ (LNMeasurementValueType)massValueType
{
  if (massValueType_onceToken != -1)
    dispatch_once(&massValueType_onceToken, &__block_literal_global_17);
  return (LNMeasurementValueType *)(id)massValueType_value;
}

+ (LNMeasurementValueType)powerValueType
{
  if (powerValueType_onceToken != -1)
    dispatch_once(&powerValueType_onceToken, &__block_literal_global_18_4796);
  return (LNMeasurementValueType *)(id)powerValueType_value;
}

+ (LNMeasurementValueType)pressureValueType
{
  if (pressureValueType_onceToken != -1)
    dispatch_once(&pressureValueType_onceToken, &__block_literal_global_19);
  return (LNMeasurementValueType *)(id)pressureValueType_value;
}

+ (LNMeasurementValueType)speedValueType
{
  if (speedValueType_onceToken != -1)
    dispatch_once(&speedValueType_onceToken, &__block_literal_global_20_4795);
  return (LNMeasurementValueType *)(id)speedValueType_value;
}

+ (LNMeasurementValueType)temperatureValueType
{
  if (temperatureValueType_onceToken != -1)
    dispatch_once(&temperatureValueType_onceToken, &__block_literal_global_21);
  return (LNMeasurementValueType *)(id)temperatureValueType_value;
}

+ (LNMeasurementValueType)volumeValueType
{
  if (volumeValueType_onceToken != -1)
    dispatch_once(&volumeValueType_onceToken, &__block_literal_global_22_4794);
  return (LNMeasurementValueType *)(id)volumeValueType_value;
}

+ (id)objectClassesForCoding
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __41__LNMeasurementValueType_volumeValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 4);
  v1 = (void *)volumeValueType_value;
  volumeValueType_value = (uint64_t)v0;

}

void __46__LNMeasurementValueType_temperatureValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 3);
  v1 = (void *)temperatureValueType_value;
  temperatureValueType_value = (uint64_t)v0;

}

void __40__LNMeasurementValueType_speedValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 5);
  v1 = (void *)speedValueType_value;
  speedValueType_value = (uint64_t)v0;

}

void __43__LNMeasurementValueType_pressureValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 22);
  v1 = (void *)pressureValueType_value;
  pressureValueType_value = (uint64_t)v0;

}

void __40__LNMeasurementValueType_powerValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 21);
  v1 = (void *)powerValueType_value;
  powerValueType_value = (uint64_t)v0;

}

void __39__LNMeasurementValueType_massValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 2);
  v1 = (void *)massValueType_value;
  massValueType_value = (uint64_t)v0;

}

void __41__LNMeasurementValueType_lengthValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 1);
  v1 = (void *)lengthValueType_value;
  lengthValueType_value = (uint64_t)v0;

}

void __53__LNMeasurementValueType_informationStorageValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 20);
  v1 = (void *)informationStorageValueType_value;
  informationStorageValueType_value = (uint64_t)v0;

}

void __46__LNMeasurementValueType_illuminanceValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 19);
  v1 = (void *)illuminanceValueType_value;
  illuminanceValueType_value = (uint64_t)v0;

}

void __49__LNMeasurementValueType_fuelEfficiencyValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 18);
  v1 = (void *)fuelEfficiencyValueType_value;
  fuelEfficiencyValueType_value = (uint64_t)v0;

}

void __44__LNMeasurementValueType_frequencyValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 17);
  v1 = (void *)frequencyValueType_value;
  frequencyValueType_value = (uint64_t)v0;

}

void __41__LNMeasurementValueType_energyValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 6);
  v1 = (void *)energyValueType_value;
  energyValueType_value = (uint64_t)v0;

}

void __53__LNMeasurementValueType_electricResistanceValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 16);
  v1 = (void *)electricResistanceValueType_value;
  electricResistanceValueType_value = (uint64_t)v0;

}

void __62__LNMeasurementValueType_electricPotentialDifferenceValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 15);
  v1 = (void *)electricPotentialDifferenceValueType_value;
  electricPotentialDifferenceValueType_value = (uint64_t)v0;

}

void __50__LNMeasurementValueType_electricCurrentValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 14);
  v1 = (void *)electricCurrentValueType_value;
  electricCurrentValueType_value = (uint64_t)v0;

}

void __49__LNMeasurementValueType_electricChargeValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 13);
  v1 = (void *)electricChargeValueType_value;
  electricChargeValueType_value = (uint64_t)v0;

}

void __43__LNMeasurementValueType_durationValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 7);
  v1 = (void *)durationValueType_value;
  durationValueType_value = (uint64_t)v0;

}

void __45__LNMeasurementValueType_dispersionValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 12);
  v1 = (void *)dispersionValueType_value;
  dispersionValueType_value = (uint64_t)v0;

}

void __52__LNMeasurementValueType_concentrationMassValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 11);
  v1 = (void *)concentrationMassValueType_value;
  concentrationMassValueType_value = (uint64_t)v0;

}

void __39__LNMeasurementValueType_areaValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 10);
  v1 = (void *)areaValueType_value;
  areaValueType_value = (uint64_t)v0;

}

void __40__LNMeasurementValueType_angleValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 9);
  v1 = (void *)angleValueType_value;
  angleValueType_value = (uint64_t)v0;

}

void __47__LNMeasurementValueType_accelerationValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 8);
  v1 = (void *)accelerationValueType_value;
  accelerationValueType_value = (uint64_t)v0;

}

void __57__LNMeasurementValueType_unsupportedMeasurementValueType__block_invoke()
{
  LNMeasurementValueType *v0;
  void *v1;

  v0 = -[LNMeasurementValueType initWithUnitType:]([LNMeasurementValueType alloc], "initWithUnitType:", 0);
  v1 = (void *)unsupportedMeasurementValueType_value;
  unsupportedMeasurementValueType_value = (uint64_t)v0;

}

@end
