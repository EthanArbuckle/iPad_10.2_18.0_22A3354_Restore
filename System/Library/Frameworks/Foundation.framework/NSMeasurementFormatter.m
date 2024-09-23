@implementation NSMeasurementFormatter

- (NSNumberFormatter)numberFormatter
{
  return (NSNumberFormatter *)objc_msgSend(self->_formatter, "numberFormatter");
}

- (NSMeasurementFormatterUnitOptions)unitOptions
{
  return objc_msgSend(self->_formatter, "unitOptions");
}

- (NSLocale)locale
{
  return (NSLocale *)objc_msgSend(self->_formatter, "locale");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSMeasurementFormatter;
  -[NSMeasurementFormatter dealloc](&v3, sel_dealloc);
}

- (NSMeasurementFormatter)init
{
  NSMeasurementFormatter *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSMeasurementFormatter;
  v2 = -[NSMeasurementFormatter init](&v4, sel_init);
  if (v2)
  {
    v2->_formatter = objc_alloc_init(NSUnitFormatter);
    -[NSMeasurementFormatter setUnitOptions:](v2, "setUnitOptions:", 0);
    -[NSMeasurementFormatter setUnitStyle:](v2, "setUnitStyle:", 2);
    -[NSMeasurementFormatter setLocale:](v2, "setLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
  }
  return v2;
}

- (void)setUnitOptions:(NSMeasurementFormatterUnitOptions)unitOptions
{
  if (unitOptions >= 8)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSMeasurementFormatter.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unitOptions == 0 || !(unitOptions & ~(NSMeasurementFormatterUnitOptionsProvidedUnit | NSMeasurementFormatterUnitOptionsNaturalScale | NSMeasurementFormatterUnitOptionsTemperatureWithoutUnit))"));
  objc_msgSend(self->_formatter, "setUnitOptions:", unitOptions);
}

- (void)setLocale:(NSLocale *)locale
{
  objc_msgSend(self->_formatter, "setLocale:", locale);
}

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
  objc_msgSend(self->_formatter, "setUnitStyle:", unitStyle);
}

- (id)stringForObjectValue:(id)a3
{
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(self->_formatter, "stringForObjectValue:", a3);
  else
    return 0;
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
  objc_msgSend(self->_formatter, "setNumberFormatter:", numberFormatter);
}

- (NSFormattingUnitStyle)unitStyle
{
  return objc_msgSend(self->_formatter, "unitStyle");
}

- (NSString)stringFromMeasurement:(NSMeasurement *)measurement
{
  NSString *result;

  result = -[NSMeasurementFormatter stringForObjectValue:](self, "stringForObjectValue:", measurement);
  if (!result)
    return (NSString *)&stru_1E0F56070;
  return result;
}

- (id)measurementFromString:(id)a3
{
  return 0;
}

- (NSString)stringFromUnit:(NSUnit *)unit
{
  return (NSString *)objc_msgSend(self->_formatter, "stringFromUnit:", unit);
}

- (NSMeasurementFormatter)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  NSMeasurementFormatter *v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSMeasurementFormatter cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.unitFormatter"));
  if (v5)
  {
    v6 = (void *)v5;
    v9.receiver = self;
    v9.super_class = (Class)NSMeasurementFormatter;
    v7 = -[NSMeasurementFormatter init](&v9, sel_init);
    if (v7)
      v7->_formatter = v6;
  }
  else
  {

    v10 = CFSTR("NSLocalizedDescription");
    v11[0] = CFSTR("Formatter has been corrupted!");
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
    return 0;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_formatter, CFSTR("NS.unitFormatter"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
