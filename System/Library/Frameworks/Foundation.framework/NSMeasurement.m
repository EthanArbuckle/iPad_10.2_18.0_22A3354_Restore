@implementation NSMeasurement

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMeasurement;
  -[NSMeasurement dealloc](&v3, sel_dealloc);
}

- (NSMeasurement)measurementByConvertingToUnit:(NSUnit *)unit
{
  NSMeasurement *v5;
  double doubleValue;
  double v7;
  double v8;
  double v9;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;

  if (!-[NSMeasurement canBeConvertedToUnit:](self, "canBeConvertedToUnit:"))
  {
    v11 = objc_opt_class();
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot convert measurements of differing unit types! self: %@ unit: %@"), v11, objc_opt_class());
    goto LABEL_12;
  }
  if (-[NSUnit isEqual:](self->_unit, "isEqual:", unit))
  {
    v5 = [NSMeasurement alloc];
    doubleValue = self->_doubleValue;
    return -[NSMeasurement initWithDoubleValue:unit:](v5, "initWithDoubleValue:unit:", unit, doubleValue);
  }
  if (!isDimensional() || !isDimensional())
  {
    v13 = objc_opt_class();
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot convert differing units that are non-dimensional! lhs: %@ rhs: %@"), v13, objc_opt_class());
LABEL_12:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  objc_msgSend((id)-[NSUnit converter](self->_unit, "converter"), "baseUnitValueFromValue:", self->_doubleValue);
  v8 = v7;
  -[NSUnit dimension](unit, "dimension");
  if (!-[NSUnit isEqual:](unit, "isEqual:", objc_msgSend((id)objc_opt_class(), "baseUnit")))
  {
    objc_msgSend((id)-[NSUnit converter](unit, "converter"), "valueFromBaseUnitValue:", v8);
    v8 = v9;
  }
  v5 = [NSMeasurement alloc];
  doubleValue = v8;
  return -[NSMeasurement initWithDoubleValue:unit:](v5, "initWithDoubleValue:unit:", unit, doubleValue);
}

- (NSMeasurement)initWithDoubleValue:(double)doubleValue unit:(id)unit
{
  NSMeasurement *v7;
  NSMeasurement *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Must pass in an NSUnit object!"), 0));
  }
  v10.receiver = self;
  v10.super_class = (Class)NSMeasurement;
  v7 = -[NSMeasurement init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_doubleValue = doubleValue;
    v7->_unit = (NSUnit *)objc_msgSend(unit, "copy");
  }
  return v8;
}

- (BOOL)canBeConvertedToUnit:(NSUnit *)unit
{
  char isKindOfClass;

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSUnit _effectiveUnitClass](self->_unit, "_effectiveUnitClass");
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (id)unit
{
  return self->_unit;
}

- (id)_performOperation:(int64_t)a3 withMeasurement:(id)a4
{
  double doubleValue;
  double v8;
  double v9;
  double v10;
  double v11;
  NSUnit *unit;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSMeasurement *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  uint64_t v27;
  const __CFString *v28;

  if (!-[NSMeasurement canBeConvertedToUnit:](self, "canBeConvertedToUnit:", objc_msgSend(a4, "unit")))
  {
    v13 = objc_opt_class();
    objc_msgSend(a4, "unit");
    v14 = objc_opt_class();
    if (a3 == 1)
    {
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot subtract measurements of differing unit types! lhs: %@ rhs: %@"), v13, v14);
    }
    else
    {
      if (a3)
        goto LABEL_23;
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot add measurements of differing unit types! lhs: %@ rhs: %@"), v13, v14);
    }
    goto LABEL_31;
  }
  if (-[NSUnit isEqual:](self->_unit, "isEqual:", objc_msgSend(a4, "unit")))
  {
    doubleValue = self->_doubleValue;
    objc_msgSend(a4, "doubleValue");
    v9 = doubleValue - v8;
    v10 = doubleValue + v8;
    if (a3)
      v10 = 0.0;
    if (a3 == 1)
      v11 = v9;
    else
      v11 = v10;
    unit = self->_unit;
    return -[NSMeasurement initWithDoubleValue:unit:]([NSMeasurement alloc], "initWithDoubleValue:unit:", unit, v11);
  }
  objc_msgSend(a4, "unit");
  if (!isDimensional() || !isDimensional())
  {
    v23 = objc_opt_class();
    objc_msgSend(a4, "unit");
    v24 = objc_opt_class();
    if (a3 == 1)
    {
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot subtract differing units that are non-dimensional! lhs: %@ rhs: %@"), v23, v24);
    }
    else
    {
      if (a3)
        goto LABEL_23;
      v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot add differing units that are non-dimensional! lhs: %@ rhs: %@"), v23, v24);
    }
LABEL_31:
    v28 = (const __CFString *)v15;
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    goto LABEL_32;
  }
  objc_msgSend((id)objc_msgSend(a4, "unit"), "dimension");
  -[NSUnit dimension](self->_unit, "dimension");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        v26 = (void *)MEMORY[0x1E0C99DA0];
        v27 = *MEMORY[0x1E0C99778];
        v28 = CFSTR("Cannot add measurements of differing unit types!");
        goto LABEL_32;
      }
LABEL_23:
      unit = 0;
      v11 = 0.0;
      return -[NSMeasurement initWithDoubleValue:unit:]([NSMeasurement alloc], "initWithDoubleValue:unit:", unit, v11);
    }
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99778];
    v28 = CFSTR("Cannot subtract measurements of differing unit types!");
LABEL_32:
    objc_exception_throw((id)objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, v28, 0));
  }
  -[NSUnit dimension](self->_unit, "dimension");
  v16 = -[NSMeasurement measurementByConvertingToUnit:](self, "measurementByConvertingToUnit:", objc_msgSend((id)objc_opt_class(), "baseUnit"));
  -[NSUnit dimension](self->_unit, "dimension");
  v17 = (void *)objc_msgSend(a4, "measurementByConvertingToUnit:", objc_msgSend((id)objc_opt_class(), "baseUnit"));
  -[NSMeasurement doubleValue](v16, "doubleValue");
  v19 = v18;
  objc_msgSend(v17, "doubleValue");
  v21 = v19 - v20;
  v22 = v19 + v20;
  if (a3)
    v22 = 0.0;
  if (a3 == 1)
    v11 = v21;
  else
    v11 = v22;
  unit = -[NSMeasurement unit](v16, "unit", v22, 0.0, v21);
  return -[NSMeasurement initWithDoubleValue:unit:]([NSMeasurement alloc], "initWithDoubleValue:unit:", unit, v11);
}

- (NSMeasurement)measurementByAddingMeasurement:(NSMeasurement *)measurement
{
  return (NSMeasurement *)-[NSMeasurement _performOperation:withMeasurement:](self, "_performOperation:withMeasurement:", 0, measurement);
}

- (NSMeasurement)measurementBySubtractingMeasurement:(NSMeasurement *)measurement
{
  return (NSMeasurement *)-[NSMeasurement _performOperation:withMeasurement:](self, "_performOperation:withMeasurement:", 1, measurement);
}

- (BOOL)isEqual:(id)a3
{
  double doubleValue;
  double v6;

  if (a3 == self)
    return 1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    doubleValue = self->_doubleValue;
    objc_msgSend(a3, "doubleValue");
    if (doubleValue == v6)
      return -[NSUnit isEqual:](self->_unit, "isEqual:", objc_msgSend(a3, "unit"));
  }
  return 0;
}

- (unint64_t)hash
{
  double doubleValue;
  double v3;
  long double v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  doubleValue = self->_doubleValue;
  v3 = -doubleValue;
  if (doubleValue >= 0.0)
    v3 = self->_doubleValue;
  v4 = floor(v3 + 0.5);
  v5 = (v3 - v4) * 1.84467441e19;
  v6 = fmod(v4, 1.84467441e19);
  v7 = 2654435761u * (unint64_t)v6;
  v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0)
    v8 = 2654435761u * (unint64_t)v6;
  v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0)
    return v9;
  else
    return v8;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSMeasurement;
  return (id)objc_msgSend(-[NSMeasurement description](&v3, sel_description), "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" value: %f unit: %@"), *(_QWORD *)&self->_doubleValue, -[NSUnit symbol](self->_unit, "symbol")));
}

- (NSMeasurement)initWithCoder:(id)a3
{
  double v5;
  double v6;
  uint64_t v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSMeasurement cannot be decoded by non-keyed archivers"), 0));
  }
  objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NS.value"));
  v6 = v5;
  v7 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.unit"));
  if (v7)
    return -[NSMeasurement initWithDoubleValue:unit:](self, "initWithDoubleValue:unit:", v7, v6);

  v9 = CFSTR("NSLocalizedDescription");
  v10[0] = CFSTR("Unit class object has been corrupted!");
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSMeasurement cannot be encoded by non-keyed archivers"), 0));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.value"), self->_doubleValue);
  objc_msgSend(a3, "encodeObject:forKey:", self->_unit, CFSTR("NS.unit"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
