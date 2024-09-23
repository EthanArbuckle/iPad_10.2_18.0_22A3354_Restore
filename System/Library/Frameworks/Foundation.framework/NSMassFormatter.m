@implementation NSMassFormatter

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  return 0;
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || !_NSIsNSNumber())
    return 0;
  objc_msgSend(a3, "doubleValue");
  return -[NSMassFormatter stringFromKilograms:](self, "stringFromKilograms:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  if (!a3 || !_NSIsNSNumber())
    return 0;
  objc_msgSend(a3, "doubleValue");
  return -[NSAttributedString initWithString:attributes:]([NSAttributedString alloc], "initWithString:attributes:", -[NSMassFormatter stringFromKilograms:](self, "stringFromKilograms:"), a4);
}

- (int64_t)targetUnitFromKilograms:(double)a3
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

  v4 = -[NSNumberFormatter locale](-[NSMassFormatter numberFormatter](self, "numberFormatter"), "locale");
  if (objc_msgSend(-[NSLocale objectForKey:](v4, "objectForKey:", *MEMORY[0x1E0C99840]), "BOOLValue"))
    v5 = &metric_units_0;
  else
    v5 = &us_units_0;
  v6 = (double *)malloc_type_malloc(0x20uLL, 0x1000040451B5BE8uLL);
  v7 = v6;
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = v5[v8];
    if (v11 <= 1536)
    {
      v12 = a3 / 0.001;
      if (v11 != 11)
      {
        if (v11 == 14)
          v12 = a3;
        else
          v12 = 0.0;
      }
    }
    else
    {
      if (v11 == 1539)
        v12 = a3 * 0.15747;
      else
        v12 = 0.0;
      if (v11 == 1538)
        v12 = a3 * 2.20462262;
      if (v11 == 1537)
        v12 = a3 * 35.273962;
    }
    v9 = 0;
    v13 = &v6[2 * v8];
    *v13 = v12;
    *((_QWORD *)v13 + 1) = v11;
    v8 = 1;
  }
  while ((v10 & 1) != 0);
  qsort(v6, 2uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))compare_0);
  v14 = *(_QWORD *)&v7[2 * (*v7 <= 1.0) + 1];
  free(v7);
  return v14;
}

- (NSMassFormatter)init
{
  NSMassFormatter *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSMassFormatter;
  v2 = -[NSMassFormatter init](&v4, sel_init);
  if (v2)
    v2->_unitFormatter = objc_alloc_init(NSUnitFormatter);
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMassFormatter;
  -[NSMassFormatter dealloc](&v3, sel_dealloc);
}

- (NSNumberFormatter)numberFormatter
{
  return -[NSUnitFormatter numberFormatter](self->_unitFormatter, "numberFormatter");
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
  -[NSUnitFormatter setNumberFormatter:](self->_unitFormatter, "setNumberFormatter:", numberFormatter);
}

- (NSFormattingUnitStyle)unitStyle
{
  return -[NSUnitFormatter unitStyle](self->_unitFormatter, "unitStyle");
}

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
  -[NSUnitFormatter setUnitStyle:](self->_unitFormatter, "setUnitStyle:", unitStyle);
}

- (NSString)unitStringFromKilograms:(double)numberInKilograms usedUnit:(NSMassFormatterUnit *)unitp
{
  NSMassFormatterUnit v7;
  double v8;
  double v9;

  v7 = -[NSMassFormatter targetUnitFromKilograms:](self, "targetUnitFromKilograms:");
  v8 = 0.0;
  if (v7 <= 1536)
  {
    if (v7 == NSMassFormatterUnitGram)
    {
      v8 = numberInKilograms / 0.001;
      if (!unitp)
        return -[NSMassFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, v8);
      goto LABEL_16;
    }
    if (v7 == NSMassFormatterUnitKilogram)
      v8 = numberInKilograms;
    if (unitp)
LABEL_16:
      *unitp = v7;
  }
  else
  {
    switch(v7)
    {
      case NSMassFormatterUnitOunce:
        v9 = 35.273962;
LABEL_12:
        v8 = numberInKilograms * v9;
        if (!unitp)
          return -[NSMassFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, v8);
        goto LABEL_16;
      case NSMassFormatterUnitPound:
        v8 = numberInKilograms * 2.20462262;
        break;
      case NSMassFormatterUnitStone:
        v9 = 0.15747;
        goto LABEL_12;
    }
    if (unitp)
      goto LABEL_16;
  }
  return -[NSMassFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, v8);
}

- (NSString)unitStringFromValue:(double)value unit:(NSMassFormatterUnit)unit
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = 1538;
  v5 = 1539;
  v6 = 1540;
  if (unit != NSMassFormatterUnitStone)
    v6 = 0;
  if (unit != NSMassFormatterUnitPound)
    v5 = v6;
  if (unit != NSMassFormatterUnitOunce)
    v4 = v5;
  v7 = 1536;
  v8 = 1537;
  if (unit != NSMassFormatterUnitKilogram)
    v8 = 0;
  if (unit != NSMassFormatterUnitGram)
    v7 = v8;
  if (unit <= 1536)
    v9 = v7;
  else
    v9 = v4;
  return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:](self->_unitFormatter, "unitStringFromValue:unit:", v9, value);
}

- (NSString)stringFromKilograms:(double)numberInKilograms
{
  uint64_t v5;
  double v6;
  double v7;

  v5 = -[NSMassFormatter targetUnitFromKilograms:](self, "targetUnitFromKilograms:");
  v6 = 0.0;
  if (v5 <= 1536)
  {
    if (v5 == 11)
    {
      v6 = numberInKilograms / 0.001;
    }
    else if (v5 == 14)
    {
      v6 = numberInKilograms;
    }
  }
  else
  {
    switch(v5)
    {
      case 1537:
        v7 = 35.273962;
        goto LABEL_12;
      case 1538:
        v7 = 2.20462262;
        goto LABEL_12;
      case 1539:
        v7 = 0.15747;
LABEL_12:
        v6 = numberInKilograms * v7;
        break;
    }
  }
  return -[NSMassFormatter stringFromValue:unit:](self, "stringFromValue:unit:", v5, v6);
}

- (NSString)stringFromValue:(double)value unit:(NSMassFormatterUnit)unit
{
  double v6;
  uint64_t v8;
  uint64_t v9;
  long double v10[2];

  v10[1] = *(long double *)MEMORY[0x1E0C80C00];
  if (unit <= 1536)
  {
    v8 = 1537;
    if (unit != NSMassFormatterUnitKilogram)
      v8 = 0;
    if (unit == NSMassFormatterUnitGram)
      v9 = 1536;
    else
      v9 = v8;
  }
  else
  {
    switch(unit)
    {
      case NSMassFormatterUnitOunce:
        v9 = 1538;
        break;
      case NSMassFormatterUnitPound:
        v9 = 1539;
        break;
      case NSMassFormatterUnitStone:
        v10[0] = 0.0;
        v6 = modf(value, v10);
        if (v6 > 0.0)
          return (NSString *)-[NSUnitFormatter stringForValue1:unit1:value2:unit2:](self->_unitFormatter, "stringForValue1:unit1:value2:unit2:", 1540, 1539, (double)v10[0], v6 * 14.0);
        v9 = 1540;
        break;
      default:
        v9 = 0;
        break;
    }
  }
  return (NSString *)-[NSUnitFormatter stringForValue:unit:](self->_unitFormatter, "stringForValue:unit:", v9, value);
}

- (NSMassFormatter)initWithCoder:(id)a3
{
  NSMassFormatter *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSMassFormatter cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSMassFormatter;
  v5 = -[NSFormatter initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_unitFormatter = -[NSUnitFormatter initWithCoder:]([NSUnitFormatter alloc], "initWithCoder:", a3);
    v5->_isForPersonMassUse = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.forPersonMassUse"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSMassFormatter cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSMassFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  -[NSUnitFormatter encodeWithCoder:](self->_unitFormatter, "encodeWithCoder:", a3);
  if (self->_isForPersonMassUse)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.forPersonMassUse"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[NSUnitFormatter copyWithZone:](self->_unitFormatter, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 16) = self->_isForPersonMassUse;
  return (id)v5;
}

- (BOOL)isForPersonMassUse
{
  return self->_isForPersonMassUse;
}

- (void)setForPersonMassUse:(BOOL)forPersonMassUse
{
  self->_isForPersonMassUse = forPersonMassUse;
}

- (void)receiveObservedValue:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSObservationFormatterSupport.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!value || _NSIsNSNumber(value)"));
  v6.receiver = self;
  v6.super_class = (Class)NSMassFormatter;
  -[NSMassFormatter receiveObservedValue:](&v6, sel_receiveObservedValue_, -[NSMassFormatter stringForObjectValue:](self, "stringForObjectValue:", a3));
}

@end
