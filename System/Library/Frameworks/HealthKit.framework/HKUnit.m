@implementation HKUnit

+ (HKUnit)kilocalorieUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("kcal"));
}

- (double)_valueByConvertingValue:(double)a3 toUnit:(id)a4
{
  id v6;
  double v7;

  v6 = a4;
  if (!-[HKUnit _isCompatibleWithUnit:](self, "_isCompatibleWithUnit:", v6))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempt to convert incompatible units: %@, %@"), self, v6);
  if (!-[HKUnit isEqual:](self, "isEqual:", v6))
  {
    -[HKUnit _convertToBaseUnit:](self, "_convertToBaseUnit:", a3);
    objc_msgSend(v6, "_convertFromBaseUnit:");
    a3 = v7;
  }

  return a3;
}

- (BOOL)_isCompatibleWithUnit:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKUnit _dimensionReduction](self, "_dimensionReduction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_dimensionReduction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)_dimensionReduction
{
  _HKFactorization *dimensionReduction;

  dimensionReduction = self->_dimensionReduction;
  if (!dimensionReduction)
  {
    -[HKUnit _reduceIfNecessaryWithCycleSet:](self, "_reduceIfNecessaryWithCycleSet:", 0);
    dimensionReduction = self->_dimensionReduction;
  }
  return dimensionReduction;
}

- (BOOL)isEqual:(id)a3
{
  HKUnit *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HKUnit *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKUnit unitString](self, "unitString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKUnit unitString](v4, "unitString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (HKUnit)minuteUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("min"));
}

+ (HKUnit)countUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("count"));
}

+ (HKUnit)meterUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("m"));
}

+ (HKUnit)secondUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("s"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKUnit unitString](self, "unitString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HKUnitStringKey"));

}

+ (HKUnit)unitFromString:(NSString *)string
{
  NSString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;

  v3 = string;
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = &stru_1E37FD4C0;
  os_unfair_lock_lock((os_unfair_lock_t)&unitForStringCacheLock);
  objc_msgSend((id)unitForStringCache, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _HKBaseUnitGrammar();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[_HKFactorization factorizationFromString:factorGrammar:](_HKFactorization, "factorizationFromString:factorGrammar:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "factorCount") == 1
      && (objc_msgSend(v7, "anyFactor"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "exponentForFactor:", v8),
          v8,
          v9 == 1))
    {
      objc_msgSend(v7, "anyFactor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_HKCompoundUnit unitWithBaseUnits:](_HKCompoundUnit, "unitWithBaseUnits:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v10;
    if (v10)
    {
      v11 = (void *)unitForStringCache;
      if (!unitForStringCache)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = (void *)unitForStringCache;
        unitForStringCache = (uint64_t)v12;

        v11 = (void *)unitForStringCache;
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, v4);
    }

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unitForStringCacheLock);

  return (HKUnit *)v5;
}

+ (HKUnit)secondUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit secondUnit](HKBaseUnit, "secondUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "secondUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (id)_prefixStringForMetricPrefix:(int64_t)a3
{
  return _prefixStringForMetricPrefix__prefixes[a3];
}

+ (id)_countPerMinuteUnit
{
  if (_countPerMinuteUnit_onceToken != -1)
    dispatch_once(&_countPerMinuteUnit_onceToken, &__block_literal_global_140);
  return (id)_countPerMinuteUnit_unit;
}

- (double)_reducedProportionalSize
{
  -[HKUnit _reduceIfNecessaryWithCycleSet:](self, "_reduceIfNecessaryWithCycleSet:", 0);
  return self->_reducedProportionalSize;
}

- (void)_reduceIfNecessaryWithCycleSet:(id)a3
{
  id v4;
  os_unfair_lock_s *p_dimensionReductionLock;
  id v6;
  void *v7;
  _HKFactorization *v8;
  _HKFactorization *baseUnitReduction;
  void *v10;
  _HKFactorization *v11;
  _HKFactorization *v12;
  _HKFactorization *dimensionReduction;
  _HKFactorization *v14;
  _QWORD v15[4];
  _HKFactorization *v16;

  v4 = a3;
  p_dimensionReductionLock = &self->_dimensionReductionLock;
  os_unfair_lock_lock(&self->_dimensionReductionLock);
  if (!self->_dimensionReduction)
  {
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    -[HKUnit _computeBaseUnitReductionAndProportionalSize:withCycleSet:](self, "_computeBaseUnitReductionAndProportionalSize:withCycleSet:", &self->_reducedProportionalSize, v6);
    v8 = (_HKFactorization *)objc_claimAutoreleasedReturnValue();
    baseUnitReduction = self->_baseUnitReduction;
    self->_baseUnitReduction = v8;

    +[_HKFactorization factorization](_HKMutableFactorization, "factorization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_baseUnitReduction;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__HKUnit__reduceIfNecessaryWithCycleSet___block_invoke;
    v15[3] = &unk_1E37F06D0;
    v12 = v10;
    v16 = v12;
    -[_HKFactorization enumerateFactorsWithHandler:](v11, "enumerateFactorsWithHandler:", v15);
    dimensionReduction = self->_dimensionReduction;
    self->_dimensionReduction = v12;
    v14 = v12;

  }
  os_unfair_lock_unlock(p_dimensionReductionLock);

}

- (double)scaleOffset
{
  return self->_scaleOffset;
}

+ (HKUnit)meterUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit meterUnit](HKBaseUnit, "meterUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "meterUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (id)_countPerSecondUnit
{
  if (_countPerSecondUnit_onceToken != -1)
    dispatch_once(&_countPerSecondUnit_onceToken, &__block_literal_global_100);
  return (id)_countPerSecondUnit_unit;
}

- (HKUnit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HKUnit *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("HKUnitStringKey")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKUnitStringKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit unitFromString:](HKUnit, "unitFromString:", v5);
    v6 = (HKUnit *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HKUnit;
    self = -[HKUnit init](&v8, sel_init);
    v6 = self;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseUnitReduction, 0);
  objc_storeStrong((id *)&self->_dimensionReduction, 0);
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKUnit;
  result = -[HKUnit init](&v3, sel_init);
  if (result)
    *((_DWORD *)result + 8) = 0;
  return result;
}

void __41__HKUnit__reduceIfNecessaryWithCycleSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dimension");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "multiplyByFactor:exponent:", v5, a3);

}

+ (id)_nullUnit
{
  void *v2;
  void *v3;

  +[_HKFactorization factorization](_HKFactorization, "factorization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_HKCompoundUnit unitWithBaseUnits:](_HKCompoundUnit, "unitWithBaseUnits:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_baseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4
{
  -[HKUnit _reduceIfNecessaryWithCycleSet:](self, "_reduceIfNecessaryWithCycleSet:", a4);
  if (a3)
    *a3 = self->_reducedProportionalSize;
  return self->_baseUnitReduction;
}

+ (HKUnit)gramUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit gramUnit](HKBaseUnit, "gramUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "gramUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)gramUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("g"));
}

- (HKUnit)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKUnit)unitMultipliedByUnit:(HKUnit *)unit
{
  HKUnit *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = unit;
  -[HKUnit _baseUnits](self, "_baseUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnit _baseUnits](v4, "_baseUnits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "factorizationByMultiplying:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKCompoundUnit unitWithBaseUnits:](_HKCompoundUnit, "unitWithBaseUnits:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKUnit *)v8;
}

- (HKUnit)unitDividedByUnit:(HKUnit *)unit
{
  HKUnit *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = unit;
  -[HKUnit _baseUnits](self, "_baseUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnit _baseUnits](v4, "_baseUnits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "reciprocal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "factorizationByMultiplying:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKCompoundUnit unitWithBaseUnits:](_HKCompoundUnit, "unitWithBaseUnits:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKUnit *)v9;
}

- (HKUnit)unitRaisedToPower:(NSInteger)power
{
  void *v4;
  void *v5;
  void *v6;

  -[HKUnit _baseUnits](self, "_baseUnits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "factorizationByRaisingToExponent:", power);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKCompoundUnit unitWithBaseUnits:](_HKCompoundUnit, "unitWithBaseUnits:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKUnit *)v6;
}

- (HKUnit)reciprocalUnit
{
  void *v2;
  void *v3;
  void *v4;

  -[HKUnit _baseUnits](self, "_baseUnits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reciprocal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[_HKCompoundUnit unitWithBaseUnits:](_HKCompoundUnit, "unitWithBaseUnits:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKUnit *)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HKUnit unitString](self, "unitString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (HKUnit)poundUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("lb"));
}

+ (HKUnit)ounceUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("oz"));
}

+ (HKUnit)stoneUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("st"));
}

+ (HKUnit)moleUnitWithMetricPrefix:(HKMetricPrefix)prefix molarMass:(double)gramsPerMole
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", gramsPerMole);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit moles](HKBaseUnit, "moles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "moleUnitWithMolarMass:", gramsPerMole);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v8;
}

+ (HKUnit)moleUnitWithMolarMass:(double)gramsPerMole
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", gramsPerMole);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit moles](HKBaseUnit, "moles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", 0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKUnit *)v5;
}

+ (id)moles
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("mol"));
}

+ (HKUnit)mileUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("mi"));
}

+ (HKUnit)footUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("ft"));
}

+ (HKUnit)yardUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("yd"));
}

+ (HKUnit)inchUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("in"));
}

+ (HKUnit)literUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit literUnit](HKBaseUnit, "literUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "literUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)literUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("L"));
}

+ (HKUnit)fluidOunceUSUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("fl_oz_us"));
}

+ (HKUnit)fluidOunceImperialUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("fl_oz_imp"));
}

+ (HKUnit)pintUSUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("pt_us"));
}

+ (HKUnit)pintImperialUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("pt_imp"));
}

+ (HKUnit)cupUSUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("cup_us"));
}

+ (HKUnit)cupImperialUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("cup_imp"));
}

+ (HKUnit)pascalUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit pascalUnit](HKBaseUnit, "pascalUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "pascalUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)pascalUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("Pa"));
}

+ (HKUnit)millimeterOfMercuryUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("mmHg"));
}

+ (HKUnit)centimeterOfWaterUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("cmAq"));
}

+ (HKUnit)atmosphereUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("atm"));
}

+ (HKUnit)decibelAWeightedSoundPressureLevelUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("dBASPL"));
}

+ (HKUnit)inchesOfMercuryUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("inHg"));
}

+ (id)milliseconds
{
  return (id)objc_msgSend(a1, "secondUnitWithMetricPrefix:", 4);
}

+ (HKUnit)hourUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("hr"));
}

+ (HKUnit)dayUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("d"));
}

+ (HKUnit)jouleUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit jouleUnit](HKBaseUnit, "jouleUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "jouleUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)jouleUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("J"));
}

+ (id)kilojoulesUnit
{
  return (id)objc_msgSend(a1, "jouleUnitWithMetricPrefix:", 9);
}

+ (HKUnit)calorieUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("cal"));
}

+ (HKUnit)smallCalorieUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("cal"));
}

+ (HKUnit)largeCalorieUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("Cal"));
}

+ (HKUnit)kelvinUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("K"));
}

+ (HKUnit)degreeCelsiusUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("degC"));
}

+ (HKUnit)degreeFahrenheitUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("degF"));
}

+ (HKUnit)siemenUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit siemenUnit](HKBaseUnit, "siemenUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "siemenUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)siemenUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("S"));
}

+ (HKUnit)voltUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v4;
  void *v5;
  void *v6;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_voltBaseUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "voltUnit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v6;
}

+ (id)_voltBaseUnit
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("V"));
}

+ (HKUnit)hertzUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit hertzUnit](HKBaseUnit, "hertzUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "hertzUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)hertzUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("Hz"));
}

+ (HKUnit)wattUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit wattUnit](HKBaseUnit, "wattUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "wattUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)wattUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("W"));
}

+ (HKUnit)decibelHearingLevelUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("dBHL"));
}

+ (HKUnit)percentUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("%"));
}

+ (id)perMilleUnit
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("‰"));
}

+ (id)titerUnit
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("titer"));
}

+ (HKUnit)diopterUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("D"));
}

+ (HKUnit)prismDiopterUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("pD"));
}

+ (HKUnit)radianAngleUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit radianAngleUnit](HKBaseUnit, "radianAngleUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "radianAngleUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)radianAngleUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("rad"));
}

+ (HKUnit)degreeAngleUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("deg"));
}

+ (HKUnit)luxUnitWithMetricPrefix:(HKMetricPrefix)prefix
{
  void *v3;
  void *v4;
  void *v5;

  if (prefix)
  {
    objc_msgSend(a1, "_prefixStringForMetricPrefix:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUnit luxUnit](HKBaseUnit, "luxUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit _uniquedUnitWithPrefix:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:rootUnit:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "luxUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v5;
}

+ (HKUnit)luxUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("lx"));
}

+ (id)appleEffortScoreUnit
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("appleEffortScore"));
}

+ (id)_internationalUnitWithMetricPrefix:(int64_t)a3 massEquivalent:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_prefixStringForMetricPrefix:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit _internationalUnitWithMassEquivalent](HKBaseUnit, "_internationalUnitWithMassEquivalent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_internationalUnitWithMassEquivalent:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit _internationalUnitWithMassEquivalent](HKBaseUnit, "_internationalUnitWithMassEquivalent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", 0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_internationalUnitWithMassEquivalent
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("IU_mass"));
}

+ (id)_internationalUnitWithMetricPrefix:(int64_t)a3 volumeEquivalent:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_prefixStringForMetricPrefix:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit _internationalUnitWithVolumeEquivalent](HKBaseUnit, "_internationalUnitWithVolumeEquivalent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_internationalUnitWithVolumeEquivalent:(double)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit _internationalUnitWithVolumeEquivalent](HKBaseUnit, "_internationalUnitWithVolumeEquivalent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", 0, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_internationalUnitWithVolumeEquivalent
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("IU_volume"));
}

+ (HKUnit)internationalUnit
{
  return (HKUnit *)+[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("IU"));
}

+ (id)equivalentsUnit
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("Eq"));
}

+ (id)equivalentsUnitWithMolarMass:(double)a3 valence:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3 / (double)a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit equivalentsUnit](HKBaseUnit, "equivalentsUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKBaseUnit _uniquedUnitWithPrefix:conversionConstant:rootUnit:](HKBaseUnit, "_uniquedUnitWithPrefix:conversionConstant:rootUnit:", 0, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __29__HKUnit__countPerSecondUnit__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[HKUnit countUnit](HKUnit, "countUnit");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[HKUnit secondUnit](HKUnit, "secondUnit");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitDividedByUnit:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_countPerSecondUnit_unit;
  _countPerSecondUnit_unit = v1;

}

void __29__HKUnit__countPerMinuteUnit__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[HKUnit countUnit](HKUnit, "countUnit");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitDividedByUnit:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_countPerMinuteUnit_unit;
  _countPerMinuteUnit_unit = v1;

}

+ (id)_milligramsPerDeciliterUnit
{
  if (_milligramsPerDeciliterUnit_onceToken != -1)
    dispatch_once(&_milligramsPerDeciliterUnit_onceToken, &__block_literal_global_141);
  return (id)_milligramsPerDeciliterUnit_unit;
}

void __37__HKUnit__milligramsPerDeciliterUnit__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[HKUnit literUnitWithMetricPrefix:](HKUnit, "literUnitWithMetricPrefix:", 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitDividedByUnit:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_milligramsPerDeciliterUnit_unit;
  _milligramsPerDeciliterUnit_unit = v1;

}

+ (id)_millimolesBloodGlucosePerLiterUnit
{
  if (_millimolesBloodGlucosePerLiterUnit_onceToken != -1)
    dispatch_once(&_millimolesBloodGlucosePerLiterUnit_onceToken, &__block_literal_global_142_0);
  return (id)_millimolesBloodGlucosePerLiterUnit_unit;
}

void __45__HKUnit__millimolesBloodGlucosePerLiterUnit__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[HKUnit moleUnitWithMetricPrefix:molarMass:](HKUnit, "moleUnitWithMetricPrefix:molarMass:", 4, 180.15588);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[HKUnit literUnit](HKUnit, "literUnit");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitDividedByUnit:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_millimolesBloodGlucosePerLiterUnit_unit;
  _millimolesBloodGlucosePerLiterUnit_unit = v1;

}

+ (id)_changeInDegreeCelsiusUnit
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("deltaDegC"));
}

+ (id)_changeInDegreeFahrenheitUnit
{
  return +[HKBaseUnit _uniquedRootUnit:](HKBaseUnit, "_uniquedRootUnit:", CFSTR("deltaDegF"));
}

+ (id)_changeInUnit:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "degreeCelsiusUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(a1, "_changeInDegreeCelsiusUnit");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "degreeFahrenheitUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if (v9)
    {
      objc_msgSend(a1, "_changeInDegreeFahrenheitUnit");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No unit is defined for change in %@"), v4);
      +[HKUnit _nullUnit](HKUnit, "_nullUnit");
    }
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

  return v10;
}

+ (void)_prewarmUnitForStringCache
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  os_unfair_lock_lock((os_unfair_lock_t)&unitForStringCacheLock);
  v3 = (void *)unitForStringCache;
  if (!unitForStringCache)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)unitForStringCache;
    unitForStringCache = (uint64_t)v4;

    v3 = (void *)unitForStringCache;
  }
  objc_msgSend(a1, "_unitForStringPrewarmCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v6);

  os_unfair_lock_unlock((os_unfair_lock_t)&unitForStringCacheLock);
}

+ (id)_unitForStringPrewarmCache
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[43];
  _QWORD v71[45];

  v71[43] = *MEMORY[0x1E0C80C00];
  v70[0] = CFSTR("%");
  +[HKUnit percentUnit](HKUnit, "percentUnit");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v69;
  v70[1] = CFSTR("Cal");
  +[HKUnit largeCalorieUnit](HKUnit, "largeCalorieUnit");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v68;
  v70[2] = CFSTR("IU");
  +[HKUnit internationalUnit](HKUnit, "internationalUnit");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v67;
  v70[3] = CFSTR("L");
  +[HKUnit literUnit](HKUnit, "literUnit");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v66;
  v70[4] = CFSTR("L/min");
  +[HKUnit literUnit](HKUnit, "literUnit");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "unitDividedByUnit:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v63;
  v70[5] = CFSTR("cal");
  +[HKUnit smallCalorieUnit](HKUnit, "smallCalorieUnit");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v62;
  v70[6] = CFSTR("cm");
  +[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v61;
  v70[7] = CFSTR("count");
  +[HKUnit countUnit](HKUnit, "countUnit");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v71[7] = v60;
  v70[8] = CFSTR("count/min");
  +[HKUnit countUnit](HKUnit, "countUnit");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "unitDividedByUnit:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v71[8] = v57;
  v70[9] = CFSTR("cup_imp");
  +[HKUnit cupImperialUnit](HKUnit, "cupImperialUnit");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v71[9] = v56;
  v70[10] = CFSTR("cup_us");
  +[HKUnit cupUSUnit](HKUnit, "cupUSUnit");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v71[10] = v55;
  v70[11] = CFSTR("dBASPL");
  +[HKUnit decibelAWeightedSoundPressureLevelUnit](HKUnit, "decibelAWeightedSoundPressureLevelUnit");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v71[11] = v54;
  v70[12] = CFSTR("degF");
  +[HKUnit degreeFahrenheitUnit](HKUnit, "degreeFahrenheitUnit");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v71[12] = v53;
  v70[13] = CFSTR("fl_oz_imp");
  +[HKUnit fluidOunceImperialUnit](HKUnit, "fluidOunceImperialUnit");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v71[13] = v52;
  v70[14] = CFSTR("fl_oz_us");
  +[HKUnit fluidOunceUSUnit](HKUnit, "fluidOunceUSUnit");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v71[14] = v51;
  v70[15] = CFSTR("ft");
  +[HKUnit footUnit](HKUnit, "footUnit");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v71[15] = v50;
  v70[16] = CFSTR("ft/s");
  +[HKUnit footUnit](HKUnit, "footUnit");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit secondUnit](HKUnit, "secondUnit");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "unitDividedByUnit:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v71[16] = v47;
  v70[17] = CFSTR("g");
  +[HKUnit gramUnit](HKUnit, "gramUnit");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v71[17] = v46;
  v70[18] = CFSTR("hr");
  +[HKUnit hourUnit](HKUnit, "hourUnit");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v71[18] = v45;
  v70[19] = CFSTR("in");
  +[HKUnit inchUnit](HKUnit, "inchUnit");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v71[19] = v44;
  v70[20] = CFSTR("kcal");
  +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v71[20] = v43;
  v70[21] = CFSTR("kg");
  +[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v71[21] = v42;
  v70[22] = CFSTR("km/hr");
  +[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 9);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit hourUnit](HKUnit, "hourUnit");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "unitDividedByUnit:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v71[22] = v39;
  v70[23] = CFSTR("lb");
  +[HKUnit poundUnit](HKUnit, "poundUnit");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v71[23] = v38;
  v70[24] = CFSTR("m");
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v71[24] = v37;
  v70[25] = CFSTR("m/s");
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit secondUnit](HKUnit, "secondUnit");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "unitDividedByUnit:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v71[25] = v34;
  v70[26] = CFSTR("mL");
  +[HKUnit literUnitWithMetricPrefix:](HKUnit, "literUnitWithMetricPrefix:", 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v71[26] = v33;
  v70[27] = CFSTR("mL/min·kg");
  +[HKUnit literUnitWithMetricPrefix:](HKUnit, "literUnitWithMetricPrefix:", 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "unitMultipliedByUnit:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "unitDividedByUnit:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v71[27] = v28;
  v70[28] = CFSTR("m^3");
  +[HKUnit meterUnit](HKUnit, "meterUnit");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "unitRaisedToPower:", 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v71[28] = v26;
  v70[29] = CFSTR("mcS");
  +[HKUnit siemenUnitWithMetricPrefix:](HKUnit, "siemenUnitWithMetricPrefix:", 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v71[29] = v25;
  v70[30] = CFSTR("mcg");
  +[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v71[30] = v24;
  v70[31] = CFSTR("mg");
  +[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[31] = v23;
  v70[32] = CFSTR("mg/dL");
  +[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit literUnitWithMetricPrefix:](HKUnit, "literUnitWithMetricPrefix:", 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "unitDividedByUnit:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v71[32] = v20;
  v70[33] = CFSTR("mi");
  +[HKUnit mileUnit](HKUnit, "mileUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[33] = v19;
  v70[34] = CFSTR("mi/hr");
  +[HKUnit mileUnit](HKUnit, "mileUnit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit hourUnit](HKUnit, "hourUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unitDividedByUnit:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v71[34] = v16;
  v70[35] = CFSTR("min");
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v71[35] = v15;
  v70[36] = CFSTR("ml/(kg*min)");
  +[HKUnit literUnitWithMetricPrefix:](HKUnit, "literUnitWithMetricPrefix:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnit minuteUnit](HKUnit, "minuteUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unitMultipliedByUnit:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unitDividedByUnit:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v71[36] = v5;
  v70[37] = CFSTR("mmHg");
  +[HKUnit millimeterOfMercuryUnit](HKUnit, "millimeterOfMercuryUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v71[37] = v6;
  v70[38] = CFSTR("ms");
  +[HKUnit secondUnitWithMetricPrefix:](HKUnit, "secondUnitWithMetricPrefix:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v71[38] = v7;
  v70[39] = CFSTR("pt_imp");
  +[HKUnit pintImperialUnit](HKUnit, "pintImperialUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v71[39] = v8;
  v70[40] = CFSTR("pt_us");
  +[HKUnit pintUSUnit](HKUnit, "pintUSUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v71[40] = v9;
  v70[41] = CFSTR("s");
  +[HKUnit secondUnit](HKUnit, "secondUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v71[41] = v10;
  v70[42] = CFSTR("yd");
  +[HKUnit yardUnit](HKUnit, "yardUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v71[42] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 43);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_foundationUnit
{
  void *v3;
  void *v4;
  void *v5;

  if (_foundationUnit_onceToken != -1)
    dispatch_once(&_foundationUnit_onceToken, &__block_literal_global_185);
  v3 = (void *)_foundationUnit_nsUnits;
  -[HKUnit unitString](self, "unitString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __25__HKUnit__foundationUnit__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  _QWORD v112[110];
  _QWORD v113[112];

  v113[110] = *MEMORY[0x1E0C80C00];
  v112[0] = CFSTR("m/s^2");
  objc_msgSend(MEMORY[0x1E0CB3A58], "metersPerSecondSquared");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v111;
  v112[1] = CFSTR("nm^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareNanometers");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v110;
  v112[2] = CFSTR("mcm^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMicrometers");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v109;
  v112[3] = CFSTR("mm^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMillimeters");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v108;
  v112[4] = CFSTR("cm^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareCentimeters");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v107;
  v112[5] = CFSTR("m^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMeters");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v106;
  v112[6] = CFSTR("km^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareKilometers");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v113[6] = v105;
  v112[7] = CFSTR("Mm^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMegameters");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v113[7] = v104;
  v112[8] = CFSTR("in^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareInches");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v113[8] = v103;
  v112[9] = CFSTR("ft^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareFeet");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v113[9] = v102;
  v112[10] = CFSTR("yd^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareYards");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v113[10] = v101;
  v112[11] = CFSTR("mi^2");
  objc_msgSend(MEMORY[0x1E0CB3A68], "squareMiles");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v113[11] = v100;
  v112[12] = CFSTR("g/L");
  objc_msgSend(MEMORY[0x1E0CB3A70], "gramsPerLiter");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v113[12] = v99;
  v112[13] = CFSTR("mg/dL");
  objc_msgSend(MEMORY[0x1E0CB3A70], "milligramsPerDeciliter");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v113[13] = v98;
  v112[14] = CFSTR("s");
  objc_msgSend(MEMORY[0x1E0CB3A88], "seconds");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v113[14] = v97;
  v112[15] = CFSTR("min");
  objc_msgSend(MEMORY[0x1E0CB3A88], "minutes");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v113[15] = v96;
  v112[16] = CFSTR("hr");
  objc_msgSend(MEMORY[0x1E0CB3A88], "hours");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v113[16] = v95;
  v112[17] = CFSTR("1/count^6");
  objc_msgSend(MEMORY[0x1E0CB3A80], "partsPerMillion");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v113[17] = v94;
  v112[18] = CFSTR("1/S");
  objc_msgSend(MEMORY[0x1E0CB3AA8], "ohms");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v113[18] = v93;
  v112[19] = CFSTR("kJ");
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilojoules");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v113[19] = v92;
  v112[20] = CFSTR("J");
  objc_msgSend(MEMORY[0x1E0CB3AB0], "joules");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v113[20] = v91;
  v112[21] = CFSTR("kcal");
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v113[21] = v90;
  v112[22] = CFSTR("cal");
  objc_msgSend(MEMORY[0x1E0CB3AB0], "calories");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v113[22] = v89;
  v112[23] = CFSTR("Cal");
  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v113[23] = v88;
  v112[24] = CFSTR("1/ps");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "terahertz");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v113[24] = v87;
  v112[25] = CFSTR("1/ns");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "gigahertz");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v113[25] = v86;
  v112[26] = CFSTR("1/µs");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "megahertz");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v113[26] = v85;
  v112[27] = CFSTR("1/mcs");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "megahertz");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v113[27] = v84;
  v112[28] = CFSTR("1/ms");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "kilohertz");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v113[28] = v83;
  v112[29] = CFSTR("1/s");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "hertz");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v113[29] = v82;
  v112[30] = CFSTR("1/ks");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "millihertz");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v113[30] = v81;
  v112[31] = CFSTR("1/Ms");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "microhertz");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v113[31] = v80;
  v112[32] = CFSTR("1/Gs");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "nanohertz");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v113[32] = v79;
  v112[33] = CFSTR("Hz");
  objc_msgSend(MEMORY[0x1E0CB3AB8], "hertz");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v113[33] = v78;
  v112[34] = CFSTR("Mm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "megameters");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v113[34] = v77;
  v112[35] = CFSTR("km");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v113[35] = v76;
  v112[36] = CFSTR("hm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "hectometers");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v113[36] = v75;
  v112[37] = CFSTR("dam");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "decameters");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v113[37] = v74;
  v112[38] = CFSTR("m");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v113[38] = v73;
  v112[39] = CFSTR("dm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "decimeters");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v113[39] = v72;
  v112[40] = CFSTR("cm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "centimeters");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v113[40] = v71;
  v112[41] = CFSTR("mm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "millimeters");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v113[41] = v70;
  v112[42] = CFSTR("µm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "micrometers");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v113[42] = v69;
  v112[43] = CFSTR("mcm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "micrometers");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v113[43] = v68;
  v112[44] = CFSTR("nm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "nanometers");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v113[44] = v67;
  v112[45] = CFSTR("pm");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "picometers");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v113[45] = v66;
  v112[46] = CFSTR("in");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v113[46] = v65;
  v112[47] = CFSTR("ft");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v113[47] = v64;
  v112[48] = CFSTR("yd");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v113[48] = v63;
  v112[49] = CFSTR("mi");
  objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v113[49] = v62;
  v112[50] = CFSTR("kg");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "kilograms");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v113[50] = v61;
  v112[51] = CFSTR("g");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "grams");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v113[51] = v60;
  v112[52] = CFSTR("dg");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "decigrams");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v113[52] = v59;
  v112[53] = CFSTR("cg");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "centigrams");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v113[53] = v58;
  v112[54] = CFSTR("mg");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "milligrams");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v113[54] = v57;
  v112[55] = CFSTR("µg");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "micrograms");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v113[55] = v56;
  v112[56] = CFSTR("mcg");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "micrograms");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v113[56] = v55;
  v112[57] = CFSTR("ng");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "nanograms");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v113[57] = v54;
  v112[58] = CFSTR("pg");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "picograms");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v113[58] = v53;
  v112[59] = CFSTR("oz");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "ounces");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v113[59] = v52;
  v112[60] = CFSTR("lb");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "poundsMass");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v113[60] = v51;
  v112[61] = CFSTR("st");
  objc_msgSend(MEMORY[0x1E0CB3AE0], "stones");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v113[61] = v50;
  v112[62] = CFSTR("MW");
  objc_msgSend(MEMORY[0x1E0CB3AE8], "megawatts");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v113[62] = v49;
  v112[63] = CFSTR("kW");
  objc_msgSend(MEMORY[0x1E0CB3AE8], "kilowatts");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v113[63] = v48;
  v112[64] = CFSTR("W");
  objc_msgSend(MEMORY[0x1E0CB3AE8], "watts");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v113[64] = v47;
  v112[65] = CFSTR("mW");
  objc_msgSend(MEMORY[0x1E0CB3AE8], "milliwatts");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v113[65] = v46;
  v112[66] = CFSTR("µW");
  objc_msgSend(MEMORY[0x1E0CB3AE8], "microwatts");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v113[66] = v45;
  v112[67] = CFSTR("mcW");
  objc_msgSend(MEMORY[0x1E0CB3AE8], "microwatts");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v113[67] = v44;
  v112[68] = CFSTR("Pa");
  objc_msgSend(MEMORY[0x1E0CB3AF0], "newtonsPerMetersSquared");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v113[68] = v43;
  v112[69] = CFSTR("GPa");
  objc_msgSend(MEMORY[0x1E0CB3AF0], "gigapascals");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v113[69] = v42;
  v112[70] = CFSTR("MPa");
  objc_msgSend(MEMORY[0x1E0CB3AF0], "megapascals");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v113[70] = v41;
  v112[71] = CFSTR("kPa");
  objc_msgSend(MEMORY[0x1E0CB3AF0], "kilopascals");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v113[71] = v40;
  v112[72] = CFSTR("hPa");
  objc_msgSend(MEMORY[0x1E0CB3AF0], "hectopascals");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v113[72] = v39;
  v112[73] = CFSTR("mmHg");
  objc_msgSend(MEMORY[0x1E0CB3AF0], "millimetersOfMercury");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v113[73] = v38;
  v112[74] = CFSTR("inHg");
  objc_msgSend(MEMORY[0x1E0CB3AF0], "inchesOfMercury");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v113[74] = v37;
  v112[75] = CFSTR("m/s");
  objc_msgSend(MEMORY[0x1E0CB3AF8], "metersPerSecond");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v113[75] = v36;
  v112[76] = CFSTR("km/hr");
  objc_msgSend(MEMORY[0x1E0CB3AF8], "kilometersPerHour");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v113[76] = v35;
  v112[77] = CFSTR("mi/hr");
  objc_msgSend(MEMORY[0x1E0CB3AF8], "milesPerHour");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v113[77] = v34;
  v112[78] = CFSTR("degC");
  objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v113[78] = v33;
  v112[79] = CFSTR("degF");
  objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v113[79] = v32;
  v112[80] = CFSTR("K");
  objc_msgSend(MEMORY[0x1E0CB3B00], "kelvin");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v113[80] = v31;
  v112[81] = CFSTR("ML");
  objc_msgSend(MEMORY[0x1E0CB3B08], "megaliters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v113[81] = v30;
  v112[82] = CFSTR("kL");
  objc_msgSend(MEMORY[0x1E0CB3B08], "kiloliters");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v113[82] = v29;
  v112[83] = CFSTR("L");
  objc_msgSend(MEMORY[0x1E0CB3B08], "liters");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v113[83] = v28;
  v112[84] = CFSTR("dL");
  objc_msgSend(MEMORY[0x1E0CB3B08], "deciliters");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v113[84] = v27;
  v112[85] = CFSTR("cL");
  objc_msgSend(MEMORY[0x1E0CB3B08], "centiliters");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v113[85] = v26;
  v112[86] = CFSTR("mL");
  objc_msgSend(MEMORY[0x1E0CB3B08], "milliliters");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v113[86] = v25;
  v112[87] = CFSTR("m^3");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMeters");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v113[87] = v24;
  v112[88] = CFSTR("dm^3");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicDecimeters");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v113[88] = v23;
  v112[89] = CFSTR("cm^3");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicCentimeters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v113[89] = v22;
  v112[90] = CFSTR("mm^3");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMillimeters");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v113[90] = v21;
  v112[91] = CFSTR("in^3");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicInches");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v113[91] = v20;
  v112[92] = CFSTR("ft^3");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicFeet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v113[92] = v19;
  v112[93] = CFSTR("yd^3");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicYards");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v113[93] = v18;
  v112[94] = CFSTR("mi^3");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMiles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v113[94] = v17;
  v112[95] = CFSTR("fl_oz_us");
  objc_msgSend(MEMORY[0x1E0CB3B08], "fluidOunces");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v113[95] = v16;
  v112[96] = CFSTR("cup_us");
  objc_msgSend(MEMORY[0x1E0CB3B08], "cups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v113[96] = v15;
  v112[97] = CFSTR("pt_us");
  objc_msgSend(MEMORY[0x1E0CB3B08], "pints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v113[97] = v14;
  v112[98] = CFSTR("fl_oz_imp");
  objc_msgSend(MEMORY[0x1E0CB3B08], "imperialFluidOunces");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v113[98] = v13;
  v112[99] = CFSTR("pt_imp");
  objc_msgSend(MEMORY[0x1E0CB3B08], "imperialPints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v113[99] = v12;
  v112[100] = CFSTR("cup_imp");
  objc_msgSend(MEMORY[0x1E0CB3B08], "metricCups");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v113[100] = v0;
  v112[101] = CFSTR("µV");
  objc_msgSend(MEMORY[0x1E0CB3AA0], "microvolts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v113[101] = v1;
  v112[102] = CFSTR("mcV");
  objc_msgSend(MEMORY[0x1E0CB3AA0], "microvolts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v113[102] = v2;
  v112[103] = CFSTR("mV");
  objc_msgSend(MEMORY[0x1E0CB3AA0], "millivolts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v113[103] = v3;
  v112[104] = CFSTR("V");
  objc_msgSend(MEMORY[0x1E0CB3AA0], "volts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v113[104] = v4;
  v112[105] = CFSTR("kV");
  objc_msgSend(MEMORY[0x1E0CB3AA0], "kilovolts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v113[105] = v5;
  v112[106] = CFSTR("MV");
  objc_msgSend(MEMORY[0x1E0CB3AA0], "megavolts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v113[106] = v6;
  v112[107] = CFSTR("rad");
  objc_msgSend(MEMORY[0x1E0CB3A60], "radians");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v113[107] = v7;
  v112[108] = CFSTR("deg");
  objc_msgSend(MEMORY[0x1E0CB3A60], "degrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v113[108] = v8;
  v112[109] = CFSTR("lx");
  objc_msgSend(MEMORY[0x1E0CB3AC8], "lux");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v113[109] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 110);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_foundationUnit_nsUnits;
  _foundationUnit_nsUnits = v10;

}

+ (id)_foundationBaseUnits
{
  if (_foundationBaseUnits_onceToken != -1)
    dispatch_once(&_foundationBaseUnits_onceToken, &__block_literal_global_334);
  return (id)_foundationBaseUnits_units;
}

void __30__HKUnit__foundationBaseUnits__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[16];

  v16[14] = *MEMORY[0x1E0C80C00];
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("m/s^2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("m^2"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("g/L"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("s"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("1/S"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v0;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("J"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v1;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("1/s"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v2;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("m"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v3;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("kg"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v4;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("kg*m^2*s^-3"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v5;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("Pa"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v6;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("m/s^2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[11] = v7;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("K"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[12] = v8;
  +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("L"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 14);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_foundationBaseUnits_units;
  _foundationBaseUnits_units = v10;

}

+ (HKUnit)unitFromMassFormatterUnit:(NSMassFormatterUnit)massFormatterUnit
{
  void *v4;

  v4 = 0;
  if (massFormatterUnit <= 1536)
  {
    if (massFormatterUnit == NSMassFormatterUnitGram)
    {
      objc_msgSend(a1, "gramUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (massFormatterUnit == NSMassFormatterUnitKilogram)
    {
      objc_msgSend(a1, "gramUnitWithMetricPrefix:", 9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    switch(massFormatterUnit)
    {
      case NSMassFormatterUnitOunce:
        objc_msgSend(a1, "ounceUnit");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case NSMassFormatterUnitPound:
        objc_msgSend(a1, "poundUnit");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case NSMassFormatterUnitStone:
        objc_msgSend(a1, "stoneUnit");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  return (HKUnit *)v4;
}

+ (NSMassFormatterUnit)massFormatterUnitFromUnit:(HKUnit *)unit
{
  HKUnit *v4;
  void *v5;
  BOOL v6;
  NSMassFormatterUnit v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;

  v4 = unit;
  objc_msgSend(a1, "gramUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKUnit isEqual:](v4, "isEqual:", v5);

  if (v6)
  {
    v7 = NSMassFormatterUnitGram;
  }
  else
  {
    objc_msgSend(a1, "gramUnitWithMetricPrefix:", 9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKUnit isEqual:](v4, "isEqual:", v8);

    if (v9)
    {
      v7 = NSMassFormatterUnitKilogram;
    }
    else
    {
      objc_msgSend(a1, "ounceUnit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HKUnit isEqual:](v4, "isEqual:", v10);

      if (v11)
      {
        v7 = NSMassFormatterUnitOunce;
      }
      else
      {
        objc_msgSend(a1, "poundUnit");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HKUnit isEqual:](v4, "isEqual:", v12);

        if (v13)
        {
          v7 = NSMassFormatterUnitPound;
        }
        else
        {
          objc_msgSend(a1, "stoneUnit");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[HKUnit isEqual:](v4, "isEqual:", v14);

          if (v15)
          {
            v7 = NSMassFormatterUnitStone;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No mapping for unit %@ to NSMassFormatterUnit"), v4);
            v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

+ (HKUnit)unitFromLengthFormatterUnit:(NSLengthFormatterUnit)lengthFormatterUnit
{
  void *v4;
  id v5;
  uint64_t v6;

  v4 = 0;
  switch(lengthFormatterUnit)
  {
    case 8:
      v5 = a1;
      v6 = 4;
      goto LABEL_9;
    case 9:
      v5 = a1;
      v6 = 5;
      goto LABEL_9;
    case 10:
    case 12:
    case 13:
      return (HKUnit *)v4;
    case 11:
      objc_msgSend(a1, "meterUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return (HKUnit *)v4;
    case 14:
      v5 = a1;
      v6 = 9;
LABEL_9:
      objc_msgSend(v5, "meterUnitWithMetricPrefix:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      switch(lengthFormatterUnit)
      {
        case NSLengthFormatterUnitInch:
          objc_msgSend(a1, "inchUnit");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case NSLengthFormatterUnitFoot:
          objc_msgSend(a1, "footUnit");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case NSLengthFormatterUnitYard:
          objc_msgSend(a1, "yardUnit");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        case NSLengthFormatterUnitMile:
          objc_msgSend(a1, "mileUnit");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          return (HKUnit *)v4;
      }
      break;
  }
  return (HKUnit *)v4;
}

+ (NSLengthFormatterUnit)lengthFormatterUnitFromUnit:(HKUnit *)unit
{
  HKUnit *v4;
  void *v5;
  BOOL v6;
  NSLengthFormatterUnit v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;

  v4 = unit;
  objc_msgSend(a1, "meterUnitWithMetricPrefix:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKUnit isEqual:](v4, "isEqual:", v5);

  if (v6)
  {
    v7 = NSLengthFormatterUnitCentimeter;
  }
  else
  {
    objc_msgSend(a1, "footUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKUnit isEqual:](v4, "isEqual:", v8);

    if (v9)
    {
      v7 = NSLengthFormatterUnitFoot;
    }
    else
    {
      objc_msgSend(a1, "inchUnit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HKUnit isEqual:](v4, "isEqual:", v10);

      if (v11)
      {
        v7 = NSLengthFormatterUnitInch;
      }
      else
      {
        objc_msgSend(a1, "meterUnitWithMetricPrefix:", 9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HKUnit isEqual:](v4, "isEqual:", v12);

        if (v13)
        {
          v7 = NSLengthFormatterUnitKilometer;
        }
        else
        {
          objc_msgSend(a1, "meterUnit");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[HKUnit isEqual:](v4, "isEqual:", v14);

          if (v15)
          {
            v7 = NSLengthFormatterUnitMeter;
          }
          else
          {
            objc_msgSend(a1, "mileUnit");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[HKUnit isEqual:](v4, "isEqual:", v16);

            if (v17)
            {
              v7 = NSLengthFormatterUnitMile;
            }
            else
            {
              objc_msgSend(a1, "meterUnitWithMetricPrefix:", 4);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = -[HKUnit isEqual:](v4, "isEqual:", v18);

              if (v19)
              {
                v7 = NSLengthFormatterUnitMillimeter;
              }
              else
              {
                objc_msgSend(a1, "yardUnit");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = -[HKUnit isEqual:](v4, "isEqual:", v20);

                if (v21)
                {
                  v7 = NSLengthFormatterUnitYard;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No mapping for unit %@ to NSLengthFormatterUnit"), v4);
                  v7 = 0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

+ (HKUnit)unitFromEnergyFormatterUnit:(NSEnergyFormatterUnit)energyFormatterUnit
{
  void *v4;

  v4 = 0;
  if (energyFormatterUnit > 1792)
  {
    if (energyFormatterUnit == NSEnergyFormatterUnitKilocalorie)
    {
      objc_msgSend(a1, "kilocalorieUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (energyFormatterUnit == NSEnergyFormatterUnitCalorie)
    {
      objc_msgSend(a1, "smallCalorieUnit");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (energyFormatterUnit == NSEnergyFormatterUnitJoule)
  {
    objc_msgSend(a1, "jouleUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (energyFormatterUnit == NSEnergyFormatterUnitKilojoule)
  {
    objc_msgSend(a1, "kilojoulesUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (HKUnit *)v4;
}

+ (NSEnergyFormatterUnit)energyFormatterUnitFromUnit:(HKUnit *)unit
{
  HKUnit *v4;
  void *v5;
  BOOL v6;
  NSEnergyFormatterUnit v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v14;
  BOOL v15;

  v4 = unit;
  objc_msgSend(a1, "smallCalorieUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKUnit isEqual:](v4, "isEqual:", v5);

  if (v6)
  {
    v7 = NSEnergyFormatterUnitCalorie;
    goto LABEL_9;
  }
  objc_msgSend(a1, "jouleUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKUnit isEqual:](v4, "isEqual:", v8);

  if (v9)
  {
    v7 = NSEnergyFormatterUnitJoule;
    goto LABEL_9;
  }
  objc_msgSend(a1, "kilocalorieUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKUnit isEqual:](v4, "isEqual:", v10))
  {

LABEL_8:
    v7 = NSEnergyFormatterUnitKilocalorie;
    goto LABEL_9;
  }
  objc_msgSend(a1, "largeCalorieUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKUnit isEqual:](v4, "isEqual:", v11);

  if (v12)
    goto LABEL_8;
  objc_msgSend(a1, "kilojoulesUnit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HKUnit isEqual:](v4, "isEqual:", v14);

  if (v15)
  {
    v7 = NSEnergyFormatterUnitKilojoule;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("No mapping for unit %@ to NSEnergyFormatterUnit"), v4);
    v7 = 0;
  }
LABEL_9:

  return v7;
}

- (BOOL)isNull
{
  void *v3;

  +[HKUnit _nullUnit](HKUnit, "_nullUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HKUnit isEqual:](self, "isEqual:", v3);

  return (char)self;
}

- (BOOL)_isMetricDistance
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  +[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKUnit isEqual:](self, "isEqual:", v3))
  {
    v4 = 1;
  }
  else
  {
    +[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKUnit isEqual:](self, "isEqual:", v5))
    {
      v4 = 1;
    }
    else
    {
      +[HKUnit meterUnit](HKUnit, "meterUnit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[HKUnit isEqual:](self, "isEqual:", v6);

    }
  }

  return v4;
}

+ (BOOL)_isValidUnitString:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_msgSend((id)objc_opt_class(), "unitFromString:", v3);

  return 1;
}

- (BOOL)_isCompatibleWithDimension:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKUnit _dimensionReduction](self, "_dimensionReduction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reduction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)_baseUnitReduction
{
  -[HKUnit _reduceIfNecessaryWithCycleSet:](self, "_reduceIfNecessaryWithCycleSet:", 0);
  return self->_baseUnitReduction;
}

- (double)_convertToBaseUnit:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[HKUnit _reducedProportionalSize](self, "_reducedProportionalSize");
  v6 = v5;
  -[HKUnit scaleOffset](self, "scaleOffset");
  return v7 + a3 * v6;
}

- (double)_convertFromBaseUnit:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[HKUnit scaleOffset](self, "scaleOffset");
  v6 = a3 - v5;
  -[HKUnit _reducedProportionalSize](self, "_reducedProportionalSize");
  return v6 / v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_heightUnitForLocale:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C99840]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    +[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 5);
  else
    +[HKUnit footUnit](HKUnit, "footUnit");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_distanceUnitForLocale:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C99840]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    +[HKUnit meterUnitWithMetricPrefix:](HKUnit, "meterUnitWithMetricPrefix:", 9);
  else
    +[HKUnit mileUnit](HKUnit, "mileUnit");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_personMassUnitForLocale:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("en_GB"));

  if (v5)
  {
    +[HKUnit stoneUnit](HKUnit, "stoneUnit");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C99840]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
      +[HKUnit gramUnitWithMetricPrefix:](HKUnit, "gramUnitWithMetricPrefix:", 9);
    else
      +[HKUnit poundUnit](HKUnit, "poundUnit");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v6;

  return v9;
}

+ (id)_temperatureUnitForLocale:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C99840]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    +[HKUnit degreeCelsiusUnit](HKUnit, "degreeCelsiusUnit");
  else
    +[HKUnit degreeFahrenheitUnit](HKUnit, "degreeFahrenheitUnit");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_foodEnergyUnitForLocale:(id)a3
{
  void *v3;
  int v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C99840]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
    +[HKUnit jouleUnitWithMetricPrefix:](HKUnit, "jouleUnitWithMetricPrefix:", 9);
  else
    +[HKUnit kilocalorieUnit](HKUnit, "kilocalorieUnit");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)unitString
{
  NSString *result;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (_HKDimension)dimension
{
  _HKDimension *result;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (_HKFactorization)_baseUnits
{
  _HKFactorization *result;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)_computeBaseUnitReductionAndProportionalSize:(double *)a3 withCycleSet:(id)a4
{
  id result;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_3();
  return result;
}

@end
