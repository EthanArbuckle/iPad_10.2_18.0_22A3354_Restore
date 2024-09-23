@implementation NSEnergyFormatter

- (void)setForFoodEnergyUse:(BOOL)forFoodEnergyUse
{
  self->_isForFoodEnergyUse = forFoodEnergyUse;
}

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
  -[NSUnitFormatter setUnitStyle:](self->_unitFormatter, "setUnitStyle:", unitStyle);
}

- (NSEnergyFormatter)init
{
  NSEnergyFormatter *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSEnergyFormatter;
  v2 = -[NSEnergyFormatter init](&v4, sel_init);
  if (v2)
    v2->_unitFormatter = objc_alloc_init(NSUnitFormatter);
  return v2;
}

- (NSString)unitStringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = 3075;
  v7 = 3072;
  if (unit != NSEnergyFormatterUnitCalorie)
    v7 = 0;
  if (unit != NSEnergyFormatterUnitKilocalorie)
    v6 = v7;
  v8 = 3074;
  v9 = 3076;
  if (unit != NSEnergyFormatterUnitKilojoule)
    v9 = 0;
  if (unit != NSEnergyFormatterUnitJoule)
    v8 = v9;
  if (unit <= 1792)
    v10 = v8;
  else
    v10 = v6;
  if (((unit == NSEnergyFormatterUnitKilocalorie) & -[NSEnergyFormatter isForFoodEnergyUse](self, "isForFoodEnergyUse")) != 0)
    v11 = 3073;
  else
    v11 = v10;
  return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:](self->_unitFormatter, "unitStringFromValue:unit:", v11, value);
}

- (BOOL)isForFoodEnergyUse
{
  return self->_isForFoodEnergyUse;
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
  -[NSUnitFormatter setNumberFormatter:](self->_unitFormatter, "setNumberFormatter:", numberFormatter);
}

- (void)receiveObservedValue:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSObservationFormatterSupport.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!value || _NSIsNSNumber(value)"));
  v6.receiver = self;
  v6.super_class = (Class)NSEnergyFormatter;
  -[NSEnergyFormatter receiveObservedValue:](&v6, sel_receiveObservedValue_, -[NSEnergyFormatter stringForObjectValue:](self, "stringForObjectValue:", a3));
}

- (int64_t)targetUnitFromJoules:(double)a3
{
  NSLocale *v4;
  _QWORD *v5;
  double *v6;
  double *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  double v12;
  double *v13;
  int64_t v14;

  v4 = -[NSNumberFormatter locale](-[NSEnergyFormatter numberFormatter](self, "numberFormatter"), "locale");
  if (objc_msgSend(-[NSLocale objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C99840]), "BOOLValue"))
    v5 = &metric_units_1;
  else
    v5 = &us_units_1;
  v6 = (double *)malloc_type_malloc(0x20uLL, 0x1000040451B5BE8uLL);
  v7 = v6;
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = v5[v8];
    v12 = 0.0;
    if (v11 > 1792)
    {
      if (v11 == 1793)
      {
        v12 = a3 / 4.184;
      }
      else if (v11 == 1794)
      {
        v12 = a3 / 4184.0;
      }
    }
    else
    {
      v12 = a3;
      if (v11 != 11)
      {
        v12 = 0.0;
        if (v11 == 14)
          v12 = a3 / 1000.0;
      }
    }
    v9 = 0;
    v13 = &v6[2 * v8];
    *v13 = v12;
    *((_QWORD *)v13 + 1) = v11;
    v8 = 1;
  }
  while ((v10 & 1) != 0);
  qsort(v6, 2uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))compare_1);
  v14 = *(_QWORD *)&v7[2 * (*v7 <= 1.0) + 1];
  free(v7);
  return v14;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSEnergyFormatter;
  -[NSEnergyFormatter dealloc](&v3, sel_dealloc);
}

- (NSNumberFormatter)numberFormatter
{
  return -[NSUnitFormatter numberFormatter](self->_unitFormatter, "numberFormatter");
}

- (NSFormattingUnitStyle)unitStyle
{
  return -[NSUnitFormatter unitStyle](self->_unitFormatter, "unitStyle");
}

- (NSString)unitStringFromJoules:(double)numberInJoules usedUnit:(NSEnergyFormatterUnit *)unitp
{
  NSEnergyFormatterUnit v7;
  double v8;
  double v9;

  v7 = -[NSEnergyFormatter targetUnitFromJoules:](self, "targetUnitFromJoules:");
  v8 = 0.0;
  if (v7 > 1792)
  {
    if (v7 == NSEnergyFormatterUnitCalorie)
    {
      v9 = 4.184;
    }
    else
    {
      if (v7 != NSEnergyFormatterUnitKilocalorie)
        goto LABEL_11;
      v9 = 4184.0;
    }
  }
  else
  {
    if (v7 == NSEnergyFormatterUnitJoule)
    {
      v8 = numberInJoules;
      goto LABEL_11;
    }
    if (v7 != NSEnergyFormatterUnitKilojoule)
      goto LABEL_11;
    v9 = 1000.0;
  }
  v8 = numberInJoules / v9;
LABEL_11:
  if (unitp)
    *unitp = v7;
  return -[NSEnergyFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, v8);
}

- (NSString)stringFromValue:(double)value unit:(NSEnergyFormatterUnit)unit
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = 3075;
  v7 = 3072;
  if (unit != NSEnergyFormatterUnitCalorie)
    v7 = 0;
  if (unit != NSEnergyFormatterUnitKilocalorie)
    v6 = v7;
  v8 = 3074;
  v9 = 3076;
  if (unit != NSEnergyFormatterUnitKilojoule)
    v9 = 0;
  if (unit != NSEnergyFormatterUnitJoule)
    v8 = v9;
  if (unit <= 1792)
    v10 = v8;
  else
    v10 = v6;
  if (((unit == NSEnergyFormatterUnitKilocalorie) & -[NSEnergyFormatter isForFoodEnergyUse](self, "isForFoodEnergyUse")) != 0)
    v11 = 3073;
  else
    v11 = v10;
  return (NSString *)-[NSUnitFormatter stringForValue:unit:](self->_unitFormatter, "stringForValue:unit:", v11, value);
}

- (NSString)stringFromJoules:(double)numberInJoules
{
  uint64_t v5;
  double v6;
  double v7;

  v5 = -[NSEnergyFormatter targetUnitFromJoules:](self, "targetUnitFromJoules:");
  v6 = 0.0;
  if (v5 > 1792)
  {
    if (v5 == 1793)
    {
      v7 = 4.184;
      goto LABEL_10;
    }
    if (v5 == 1794)
    {
      v7 = 4184.0;
      goto LABEL_10;
    }
  }
  else if (v5 == 11)
  {
    v6 = numberInJoules;
  }
  else if (v5 == 14)
  {
    v7 = 1000.0;
LABEL_10:
    v6 = numberInJoules / v7;
  }
  return -[NSEnergyFormatter stringFromValue:unit:](self, "stringFromValue:unit:", v5, v6);
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || !_NSIsNSNumber())
    return 0;
  objc_msgSend(a3, "doubleValue");
  return -[NSEnergyFormatter stringFromJoules:](self, "stringFromJoules:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  if (!a3 || !_NSIsNSNumber())
    return 0;
  objc_msgSend(a3, "doubleValue");
  return -[NSAttributedString initWithString:attributes:]([NSAttributedString alloc], "initWithString:attributes:", -[NSEnergyFormatter stringFromJoules:](self, "stringFromJoules:"), a4);
}

- (NSEnergyFormatter)initWithCoder:(id)a3
{
  NSEnergyFormatter *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSEnergyFormatter cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSEnergyFormatter;
  v5 = -[NSFormatter initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_unitFormatter = -[NSUnitFormatter initWithCoder:]([NSUnitFormatter alloc], "initWithCoder:", a3);
    v5->_isForFoodEnergyUse = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.forFoodEnergyUse"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSEnergyFormatter cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSEnergyFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  -[NSUnitFormatter encodeWithCoder:](self->_unitFormatter, "encodeWithCoder:", a3);
  if (self->_isForFoodEnergyUse)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.forFoodEnergyUse"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[NSUnitFormatter copyWithZone:](self->_unitFormatter, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 16) = self->_isForFoodEnergyUse;
  return (id)v5;
}

@end
