@implementation _HKBaseDimension

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HKBaseDimension name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKBaseDimension name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)time
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Time"));
}

+ (id)_uniquedDefinedDimensionWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53___HKBaseDimension__uniquedDefinedDimensionWithName___block_invoke;
  v8[3] = &unk_1E37EE850;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_uniquedDimensionWithName:configuration:", v5, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_uniquedDimensionWithName:(id)a3 configuration:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (_uniquedDimensionWithName_configuration__onceToken != -1)
    dispatch_once(&_uniquedDimensionWithName_configuration__onceToken, &__block_literal_global_71);
  os_unfair_lock_lock((os_unfair_lock_t)&_uniquedDimensionWithName_configuration__uniquingLock);
  objc_msgSend((id)_uniquedDimensionWithName_configuration____dimensionsByName, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithName:", v6);
    if (v7)
      v7[2](v7, v8);
    objc_msgSend((id)_uniquedDimensionWithName_configuration____dimensionsByName, "setObject:forKey:", v8, v6);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_uniquedDimensionWithName_configuration__uniquingLock);

  return v8;
}

- (BOOL)canBeReduced
{
  return self->_reducibleBaseUnit && self->_reducedUnit != 0;
}

+ (id)nullDimension
{
  return (id)objc_msgSend(a1, "_uniquedDimensionWithName:configuration:", CFSTR("(null)"), &__block_literal_global_49);
}

- (id)_initWithName:(id)a3
{
  id v4;
  _HKBaseDimension *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKBaseDimension;
  v5 = -[_HKDimension init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (void)setReducibleBaseUnit:(id)a3
{
  objc_storeStrong((id *)&self->_reducibleBaseUnit, a3);
}

- (void)setReducedUnit:(id)a3
{
  objc_storeStrong((id *)&self->_reducedUnit, a3);
}

- (HKBaseUnit)reducibleBaseUnit
{
  return self->_reducibleBaseUnit;
}

- (double)reductionCoefficient
{
  return self->_reductionCoefficient;
}

- (HKUnit)reducedUnit
{
  return self->_reducedUnit;
}

+ (id)length
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Length"));
}

+ (id)mass
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Mass"));
}

+ (id)volume
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Volume"));
}

+ (id)pressure
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Pressure"));
}

+ (id)energy
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Energy"));
}

+ (id)temperature
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Temperature"));
}

+ (id)changeInTemperature
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("TemperatureChange"));
}

+ (id)conductance
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Conductance"));
}

+ (id)frequency
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Frequency"));
}

+ (id)nonConvertibleMole
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("NonConvertibleMole"));
}

+ (id)nonConvertibleIU
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("NonConvertibleIU"));
}

+ (id)equivalents
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Equivalents"));
}

+ (id)hearingSensitivity
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("HearingSensitivity"));
}

+ (id)soundPressureLevel
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("SoundPressureLevel"));
}

+ (id)titer
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Titer"));
}

+ (id)electricPotentialDifference
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("ElectricPotentialDifference"));
}

+ (id)power
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Power"));
}

+ (id)diopter
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Diopter"));
}

+ (id)prismDiopter
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("PrismDiopter"));
}

+ (id)angle
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Angle"));
}

+ (id)illuminance
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("Illuminance"));
}

+ (id)unitLess
{
  return (id)objc_msgSend(a1, "_uniquedDefinedDimensionWithName:", CFSTR("UnitLess"));
}

- (id)_baseDimensions
{
  return +[_HKFactorization factorizationWithFactor:exponent:](_HKFactorization, "factorizationWithFactor:exponent:", self, 1);
}

- (void)setReductionCoefficient:(double)a3
{
  self->_reductionCoefficient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reducedUnit, 0);
  objc_storeStrong((id *)&self->_reducibleBaseUnit, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
