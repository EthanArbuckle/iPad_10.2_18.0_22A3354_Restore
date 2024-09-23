@implementation NSLengthFormatter

- (NSLengthFormatter)init
{
  NSLengthFormatter *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)NSLengthFormatter;
  v2 = -[NSLengthFormatter init](&v4, sel_init);
  if (v2)
    v2->_unitFormatter = objc_alloc_init(NSUnitFormatter);
  return v2;
}

- (void)setUnitStyle:(NSFormattingUnitStyle)unitStyle
{
  -[NSUnitFormatter setUnitStyle:](self->_unitFormatter, "setUnitStyle:", unitStyle);
}

- (void)setNumberFormatter:(NSNumberFormatter *)numberFormatter
{
  -[NSUnitFormatter setNumberFormatter:](self->_unitFormatter, "setNumberFormatter:", numberFormatter);
}

- (NSString)unitStringFromValue:(double)value unit:(NSLengthFormatterUnit)unit
{
  uint64_t v5;

  v5 = 0;
  switch(unit)
  {
    case 8:
      v5 = 1283;
      break;
    case 9:
      v5 = 1281;
      break;
    case 10:
    case 12:
    case 13:
      return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:](self->_unitFormatter, "unitStringFromValue:unit:", v5, value);
    case 11:
      v5 = 1280;
      break;
    case 14:
      v5 = 1282;
      break;
    default:
      switch(unit)
      {
        case NSLengthFormatterUnitInch:
          v5 = 1286;
          break;
        case NSLengthFormatterUnitFoot:
          v5 = 1285;
          break;
        case NSLengthFormatterUnitYard:
          v5 = 1288;
          break;
        case NSLengthFormatterUnitMile:
          v5 = 1287;
          break;
        default:
          return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:](self->_unitFormatter, "unitStringFromValue:unit:", v5, value);
      }
      break;
  }
  return (NSString *)-[NSUnitFormatter unitStringFromValue:unit:](self->_unitFormatter, "unitStringFromValue:unit:", v5, value);
}

- (int64_t)targetUnitFromMeters:(double)a3
{
  NSLocale *v5;
  int v6;
  uint64_t *v8;

  v5 = -[NSNumberFormatter locale](-[NSLengthFormatter numberFormatter](self, "numberFormatter"), "locale");
  v6 = objc_msgSend(-[NSLocale objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0C99840]), "BOOLValue");
  if (-[NSLengthFormatter isForPersonHeightUse](self, "isForPersonHeightUse"))
  {
    if (v6 && !-[NSString isEqual:](-[NSLocale localeIdentifier](v5, "localeIdentifier"), "isEqual:", CFSTR("en_GB")))
      return 9;
    else
      return 1282;
  }
  else
  {
    if (v6)
      v8 = (uint64_t *)&metric_units;
    else
      v8 = (uint64_t *)&us_units;
    return findUnit(v8, a3);
  }
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSLengthFormatter;
  -[NSLengthFormatter dealloc](&v3, sel_dealloc);
}

- (NSNumberFormatter)numberFormatter
{
  return -[NSUnitFormatter numberFormatter](self->_unitFormatter, "numberFormatter");
}

- (NSFormattingUnitStyle)unitStyle
{
  return -[NSUnitFormatter unitStyle](self->_unitFormatter, "unitStyle");
}

- (BOOL)isForPersonHeightUse
{
  return self->_isForPersonHeight;
}

- (void)setForPersonHeightUse:(BOOL)forPersonHeightUse
{
  self->_isForPersonHeight = forPersonHeightUse;
}

- (NSString)unitStringFromMeters:(double)numberInMeters usedUnit:(NSLengthFormatterUnit *)unitp
{
  int64_t v7;

  v7 = -[NSLengthFormatter targetUnitFromMeters:](self, "targetUnitFromMeters:");
  if (unitp)
    *unitp = v7;
  return -[NSLengthFormatter unitStringFromValue:unit:](self, "unitStringFromValue:unit:", v7, convertUnitFromMeters(v7, numberInMeters));
}

- (NSString)stringFromMeters:(double)numberInMeters
{
  NSLocale *v5;
  double v6;
  NSLengthFormatter *v7;
  uint64_t v8;
  uint64_t v9;
  double v11;

  if (!-[NSLengthFormatter isForPersonHeightUse](self, "isForPersonHeightUse"))
  {
    v9 = -[NSLengthFormatter targetUnitFromMeters:](self, "targetUnitFromMeters:", numberInMeters);
    v6 = convertUnitFromMeters(v9, numberInMeters);
    v7 = self;
    v8 = v9;
    return -[NSLengthFormatter stringFromValue:unit:](v7, "stringFromValue:unit:", v8, v6);
  }
  v5 = -[NSNumberFormatter locale](-[NSLengthFormatter numberFormatter](self, "numberFormatter"), "locale");
  if (objc_msgSend(-[NSLocale objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0C99840]), "BOOLValue"))
  {
    v6 = numberInMeters / 0.01;
    v7 = self;
    v8 = 9;
    return -[NSLengthFormatter stringFromValue:unit:](v7, "stringFromValue:unit:", v8, v6);
  }
  v11 = floor(numberInMeters * 3.28084);
  return (NSString *)-[NSUnitFormatter stringForValue1:unit1:value2:unit2:](self->_unitFormatter, "stringForValue1:unit1:value2:unit2:", 1285, 1286, v11, (numberInMeters - v11 / 3.28084) * 39.3701);
}

- (NSString)stringFromValue:(double)value unit:(NSLengthFormatterUnit)unit
{
  uint64_t v5;

  v5 = 0;
  switch(unit)
  {
    case 8:
      v5 = 1283;
      break;
    case 9:
      v5 = 1281;
      break;
    case 10:
    case 12:
    case 13:
      return (NSString *)-[NSUnitFormatter stringForValue:unit:](self->_unitFormatter, "stringForValue:unit:", v5, value);
    case 11:
      v5 = 1280;
      break;
    case 14:
      v5 = 1282;
      break;
    default:
      switch(unit)
      {
        case NSLengthFormatterUnitInch:
          v5 = 1286;
          break;
        case NSLengthFormatterUnitFoot:
          v5 = 1285;
          break;
        case NSLengthFormatterUnitYard:
          v5 = 1288;
          break;
        case NSLengthFormatterUnitMile:
          v5 = 1287;
          break;
        default:
          return (NSString *)-[NSUnitFormatter stringForValue:unit:](self->_unitFormatter, "stringForValue:unit:", v5, value);
      }
      break;
  }
  return (NSString *)-[NSUnitFormatter stringForValue:unit:](self->_unitFormatter, "stringForValue:unit:", v5, value);
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
  return -[NSLengthFormatter stringFromMeters:](self, "stringFromMeters:");
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  if (!a3 || !_NSIsNSNumber())
    return 0;
  objc_msgSend(a3, "doubleValue");
  return -[NSAttributedString initWithString:attributes:]([NSAttributedString alloc], "initWithString:attributes:", -[NSLengthFormatter stringFromMeters:](self, "stringFromMeters:"), a4);
}

- (NSLengthFormatter)initWithCoder:(id)a3
{
  NSLengthFormatter *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSLengthFormatter cannot be decoded by non-keyed archivers"), 0));
  }
  v7.receiver = self;
  v7.super_class = (Class)NSLengthFormatter;
  v5 = -[NSFormatter initWithCoder:](&v7, sel_initWithCoder_, a3);
  if (v5)
  {
    v5->_unitFormatter = -[NSUnitFormatter initWithCoder:]([NSUnitFormatter alloc], "initWithCoder:", a3);
    v5->_isForPersonHeight = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.forPersonHeightUse"));
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSLengthFormatter cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSLengthFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  -[NSUnitFormatter encodeWithCoder:](self->_unitFormatter, "encodeWithCoder:", a3);
  if (self->_isForPersonHeight)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.forPersonHeightUse"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[NSUnitFormatter copyWithZone:](self->_unitFormatter, "copyWithZone:", a3);
  *(_BYTE *)(v5 + 16) = self->_isForPersonHeight;
  return (id)v5;
}

- (void)receiveObservedValue:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSObservationFormatterSupport.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!value || _NSIsNSNumber(value)"));
  v6.receiver = self;
  v6.super_class = (Class)NSLengthFormatter;
  -[NSLengthFormatter receiveObservedValue:](&v6, sel_receiveObservedValue_, -[NSLengthFormatter stringForObjectValue:](self, "stringForObjectValue:", a3));
}

@end
