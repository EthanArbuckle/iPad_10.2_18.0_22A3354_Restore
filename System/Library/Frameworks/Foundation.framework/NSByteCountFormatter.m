@implementation NSByteCountFormatter

- (NSByteCountFormatter)init
{
  NSByteCountFormatter *v2;
  NSByteCountFormatter *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSByteCountFormatter;
  v2 = -[NSByteCountFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NSByteCountFormatter setAdaptive:](v2, "setAdaptive:", 1);
    -[NSByteCountFormatter setAllowsNonnumericFormatting:](v3, "setAllowsNonnumericFormatting:", 1);
    -[NSByteCountFormatter setIncludesUnit:](v3, "setIncludesUnit:", 1);
    -[NSByteCountFormatter setIncludesCount:](v3, "setIncludesCount:", 1);
    -[NSByteCountFormatter setFormattingContext:](v3, "setFormattingContext:", 0);
  }
  return v3;
}

- (void)setIncludesUnit:(BOOL)includesUnit
{
  self->_includesUnit = includesUnit;
}

- (void)setIncludesCount:(BOOL)includesCount
{
  self->_includesCount = includesCount;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  self->_formattingContext = formattingContext;
}

- (void)setAllowsNonnumericFormatting:(BOOL)allowsNonnumericFormatting
{
  self->_allowsNonnumericFormatting = allowsNonnumericFormatting;
}

- (void)setAdaptive:(BOOL)adaptive
{
  self->_adaptive = adaptive;
}

+ (NSString)stringFromByteCount:(uint64_t)byteCount countStyle:(NSByteCountFormatterCountStyle)countStyle
{
  unint64_t v5;

  if ((unint64_t)(countStyle - 1) > 2)
    v5 = 0;
  else
    v5 = qword_1822DA888[countStyle - 1];
  return __NSLocalizedFileSizeDescription(byteCount, 0, v5, 0);
}

- (void)setCountStyle:(NSByteCountFormatterCountStyle)countStyle
{
  self->_countStyle = countStyle;
}

- (NSString)stringFromByteCount:(uint64_t)byteCount
{
  return __NSLocalizedFileSizeDescription(byteCount, 0, -[NSByteCountFormatter _options](self, "_options"), -[NSByteCountFormatter formattingContext](self, "formattingContext"));
}

- (NSFormattingContext)formattingContext
{
  return (uint64_t)self->_formattingContext;
}

- (unint64_t)_options
{
  unint64_t v3;
  uint64_t v4;
  NSByteCountFormatterUnits v5;
  NSByteCountFormatterUnits v6;
  NSByteCountFormatterUnits v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = -[NSByteCountFormatter countStyle](self, "countStyle") - 1;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = qword_1822DA888[v3];
  v5 = -[NSByteCountFormatter allowedUnits](self, "allowedUnits");
  if (v5 == 0xFFFF)
    v6 = 0;
  else
    v6 = v5;
  if (!v5)
    v6 = 0;
  v7 = v6 | v4;
  v8 = -[NSByteCountFormatter allowsNonnumericFormatting](self, "allowsNonnumericFormatting");
  v9 = -[NSByteCountFormatter includesUnit](self, "includesUnit");
  v10 = -[NSByteCountFormatter includesCount](self, "includesCount");
  v11 = -[NSByteCountFormatter includesActualByteCount](self, "includesActualByteCount");
  v12 = -[NSByteCountFormatter isAdaptive](self, "isAdaptive");
  v13 = -[NSByteCountFormatter zeroPadsFractionDigits](self, "zeroPadsFractionDigits");
  v14 = 0x10000000;
  if (v8)
    v14 = 0x8000000;
  v15 = v14 | 0x40000000;
  if (!v9)
  {
    v15 = v14;
    v14 |= 0x20000000uLL;
  }
  if (!v10)
    v14 = v15;
  if (v11)
    v14 |= 0x4000000uLL;
  v16 = 0x400000;
  if (v12)
    v16 = 0x200000;
  v17 = v14 | v16;
  if (v13)
    v17 |= 0x1000000uLL;
  return v7 | v17;
}

- (BOOL)zeroPadsFractionDigits
{
  return self->_zeroPadsFractionDigits;
}

- (BOOL)isAdaptive
{
  return self->_adaptive;
}

- (BOOL)includesUnit
{
  return self->_includesUnit;
}

- (BOOL)includesCount
{
  return self->_includesCount;
}

- (BOOL)includesActualByteCount
{
  return self->_includesActualByteCount;
}

- (NSByteCountFormatterCountStyle)countStyle
{
  return (uint64_t)self->_countStyle;
}

- (BOOL)allowsNonnumericFormatting
{
  return self->_allowsNonnumericFormatting;
}

- (NSByteCountFormatterUnits)allowedUnits
{
  return self->_allowedUnits;
}

- (void)setAllowedUnits:(NSByteCountFormatterUnits)allowedUnits
{
  self->_allowedUnits = allowedUnits;
}

- (void)setIncludesActualByteCount:(BOOL)includesActualByteCount
{
  self->_includesActualByteCount = includesActualByteCount;
}

+ (NSString)stringFromMeasurement:(NSMeasurement *)measurement countStyle:(NSByteCountFormatterCountStyle)countStyle
{
  unint64_t v6;

  NSByteCountFormatterAssertValidMeasurement(measurement);
  if ((unint64_t)(countStyle - 1) > 2)
    v6 = 0;
  else
    v6 = qword_1822DA888[countStyle - 1];
  return __NSLocalizedFileSizeDescriptionWithMeasurement(measurement, v6, 0);
}

- (NSString)stringFromMeasurement:(NSMeasurement *)measurement
{
  NSByteCountFormatterAssertValidMeasurement(measurement);
  return __NSLocalizedFileSizeDescriptionWithMeasurement(measurement, -[NSByteCountFormatter _options](self, "_options"), -[NSByteCountFormatter formattingContext](self, "formattingContext"));
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  objc_class *v5;
  IMP MethodImplementation;
  objc_class *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)NSByteCountFormatter;
    return -[NSFormatter _mayDecorateAttributedStringForObjectValue:](&v9, sel__mayDecorateAttributedStringForObjectValue_, a3);
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation(v7, sel_attributedStringForObjectValue_withDefaultAttributes_);
  }
}

- (NSString)stringForObjectValue:(id)obj
{
  if (_NSIsNSNumber())
    return __NSLocalizedFileSizeDescription(objc_msgSend(obj, "longLongValue"), 0, -[NSByteCountFormatter _options](self, "_options"), -[NSByteCountFormatter formattingContext](self, "formattingContext"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  NSByteCountFormatterAssertValidMeasurement(obj);
  return __NSLocalizedFileSizeDescriptionWithMeasurement(obj, -[NSByteCountFormatter _options](self, "_options"), -[NSByteCountFormatter formattingContext](self, "formattingContext"));
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setAllowedUnits:", -[NSByteCountFormatter allowedUnits](self, "allowedUnits"));
  objc_msgSend(v4, "setCountStyle:", -[NSByteCountFormatter countStyle](self, "countStyle"));
  objc_msgSend(v4, "setAllowsNonnumericFormatting:", -[NSByteCountFormatter allowsNonnumericFormatting](self, "allowsNonnumericFormatting"));
  objc_msgSend(v4, "setIncludesUnit:", -[NSByteCountFormatter includesUnit](self, "includesUnit"));
  objc_msgSend(v4, "setIncludesCount:", -[NSByteCountFormatter includesCount](self, "includesCount"));
  objc_msgSend(v4, "setIncludesActualByteCount:", -[NSByteCountFormatter includesActualByteCount](self, "includesActualByteCount"));
  objc_msgSend(v4, "setAdaptive:", -[NSByteCountFormatter isAdaptive](self, "isAdaptive"));
  objc_msgSend(v4, "setZeroPadsFractionDigits:", -[NSByteCountFormatter zeroPadsFractionDigits](self, "zeroPadsFractionDigits"));
  objc_msgSend(v4, "setFormattingContext:", -[NSByteCountFormatter formattingContext](self, "formattingContext"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSByteCountFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSByteCountFormatter needs keyed archiver"), 0));
  if (-[NSByteCountFormatter allowedUnits](self, "allowedUnits"))
    objc_msgSend(a3, "encodeInt32:forKey:");
  if (-[NSByteCountFormatter countStyle](self, "countStyle"))
    objc_msgSend(a3, "encodeInt32:forKey:");
  if (-[NSByteCountFormatter formattingContext](self, "formattingContext"))
    objc_msgSend(a3, "encodeInt32:forKey:");
  if (-[NSByteCountFormatter zeroPadsFractionDigits](self, "zeroPadsFractionDigits"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSZeroPad"));
  if (-[NSByteCountFormatter includesActualByteCount](self, "includesActualByteCount"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSActual"));
  if (!-[NSByteCountFormatter allowsNonnumericFormatting](self, "allowsNonnumericFormatting"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSNoNonnumeric"));
  if (!-[NSByteCountFormatter includesUnit](self, "includesUnit"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSNoUnit"));
  if (!-[NSByteCountFormatter includesCount](self, "includesCount"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSNoCount"));
  if (!-[NSByteCountFormatter isAdaptive](self, "isAdaptive"))
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSNoAdaptive"));
}

- (NSByteCountFormatter)initWithCoder:(id)a3
{
  NSByteCountFormatter *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSByteCountFormatter;
  v4 = -[NSFormatter initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSByteCountFormatter needs keyed archiver"), 0));
    }
    -[NSByteCountFormatter setFormattingContext:](v4, "setFormattingContext:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSFormattingContext")));
    -[NSByteCountFormatter setAllowedUnits:](v4, "setAllowedUnits:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSUnits")));
    -[NSByteCountFormatter setCountStyle:](v4, "setCountStyle:", (int)objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSKBSize")));
    -[NSByteCountFormatter setZeroPadsFractionDigits:](v4, "setZeroPadsFractionDigits:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSZeroPad")));
    -[NSByteCountFormatter setIncludesActualByteCount:](v4, "setIncludesActualByteCount:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSActual")));
    -[NSByteCountFormatter setAllowsNonnumericFormatting:](v4, "setAllowsNonnumericFormatting:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSNoNonnumeric")) ^ 1);
    -[NSByteCountFormatter setIncludesUnit:](v4, "setIncludesUnit:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSNoUnit")) ^ 1);
    -[NSByteCountFormatter setIncludesCount:](v4, "setIncludesCount:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSNoCount")) ^ 1);
    -[NSByteCountFormatter setAdaptive:](v4, "setAdaptive:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSNoAdaptive")) ^ 1);
  }
  return v4;
}

- (void)setZeroPadsFractionDigits:(BOOL)zeroPadsFractionDigits
{
  self->_zeroPadsFractionDigits = zeroPadsFractionDigits;
}

- (void)receiveObservedValue:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSObservationFormatterSupport.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!value || _NSIsNSNumber(value)"));
  v6.receiver = self;
  v6.super_class = (Class)NSByteCountFormatter;
  -[NSByteCountFormatter receiveObservedValue:](&v6, sel_receiveObservedValue_, -[NSByteCountFormatter stringForObjectValue:](self, "stringForObjectValue:", a3));
}

@end
