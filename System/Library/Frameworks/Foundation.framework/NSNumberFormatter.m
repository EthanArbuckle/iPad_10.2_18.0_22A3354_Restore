@implementation NSNumberFormatter

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  objc_class *v9;
  objc_class *v10;
  IMP MethodImplementation;
  id *v12;
  char ObjectValue_0;
  BOOL v14;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x1E0C80C00];
  v16[0] = 0;
  if (!getObjectValue_forString_errorDescription__baseIMP_0)
  {
    v9 = objc_lookUpClass("NSNumberFormatter");
    getObjectValue_forString_errorDescription__baseIMP_0 = (uint64_t)class_getMethodImplementation(v9, sel_getObjectValue_forString_range_error_);
  }
  v10 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v10, sel_getObjectValue_forString_range_error_);
  if (a5)
    v12 = v16;
  else
    v12 = 0;
  if (MethodImplementation == (IMP)getObjectValue_forString_errorDescription__baseIMP_0)
    ObjectValue_0 = getObjectValue_0((uint64_t)self, a3, (__CFString *)a4, 0, 1, v12);
  else
    ObjectValue_0 = -[NSNumberFormatter getObjectValue:forString:range:error:](self, "getObjectValue:forString:range:error:", a3, a4, 0, v12);
  v14 = ObjectValue_0;
  if (a5)
    *a5 = (id)objc_msgSend(v16[0], "localizedDescription");
  return v14;
}

- (NSString)decimalSeparator
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("decimalSeparator"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B100];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)positiveInfinitySymbol
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positiveInfinitySymbol"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)nilSymbol
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("nilSymbol"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)negativeInfinitySymbol
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativeInfinitySymbol"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)groupingSeparator
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("groupingSeparator"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B118];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (BOOL)allowsFloats
{
  char v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("allowsFloats")), "BOOLValue");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSNumber)minimum
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimum"));
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumber *)v3;
}

- (NSNumber)maximum
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximum"));
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumber *)v3;
}

- (BOOL)generatesDecimalNumbers
{
  void *v3;
  char v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("generatesDecimalNumbers"));
  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (void)_regenerateFormatter
{
  const __CFLocale *v3;
  uint64_t v4;
  void *v5;
  const __CFAllocator *v6;
  CFNumberFormatterStyle v7;
  __CFNumberFormatter *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CFNumberFormatter *formatter;
  const __CFString *v13;
  id v14;
  NSString *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  const void *v36;
  const void *v37;
  const void *v38;
  const void *v39;
  const void *v40;
  const void *v41;
  const void *v42;
  const void *v43;
  const void *v44;
  const void *v45;
  const void *v46;
  const void *v47;
  const void *v48;
  const void *v49;
  const void *v50;
  const void *v51;
  const void *v52;
  void *v53;
  const void *v54;
  const void *v55;

  if (self->_formatter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  self->_counter = _CFLocaleGetNoteCount();
  v3 = (const __CFLocale *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("locale"));
  v4 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("numberStyle"));
  v5 = (void *)v4;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  if (v3)
  {
    if (v4)
    {
LABEL_5:
      v7 = objc_msgSend(v5, "integerValue");
      goto LABEL_8;
    }
  }
  else
  {
    v3 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    if (v5)
      goto LABEL_5;
  }
  v7 = kCFNumberFormatterNoStyle;
LABEL_8:
  v8 = CFNumberFormatterCreate(v6, v3, v7);
  self->_formatter = v8;
  if (!v8)
    return;
  v9 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positiveFormat"));
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativeFormat"));
  v11 = v10;
  if (v9)
  {
    if (!v10 || (objc_msgSend(v10, "isEqualToString:", v9) & 1) != 0)
    {
      formatter = self->_formatter;
      v13 = (const __CFString *)v9;
LABEL_19:
      CFNumberFormatterSetFormat(formatter, v13);
      goto LABEL_20;
    }
    v15 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@;%@"), v9, v11);
    CFNumberFormatterSetFormat(self->_formatter, (CFStringRef)v15);

  }
  else if (v10)
  {
    v14 = objc_autorelease((id)objc_msgSend((id)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(self->_formatter), "componentsSeparatedByString:", CFSTR(";")),
                                 "mutableCopy"));
    if ((unint64_t)objc_msgSend(v14, "count") > 1)
      objc_msgSend(v14, "replaceObjectAtIndex:withObject:", 1, v11);
    else
      objc_msgSend(v14, "addObject:", v11);
    v13 = (const __CFString *)objc_msgSend(v14, "componentsJoinedByString:", CFSTR(";"));
    formatter = self->_formatter;
    goto LABEL_19;
  }
LABEL_20:
  v16 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("alwaysShowsDecimalSeparator"));
  if (v16)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B0D8], v16);
  v17 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("decimalSeparator"));
  if (v17)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B100], v17);
  v18 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyDecimalSeparator"));
  if (v18)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B0E8], v18);
  v19 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesGroupingSeparator"));
  if (v19)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1E8], v19);
  v20 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("zeroSymbol"));
  if (v20)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B200], v20);
  v21 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("notANumberSymbol"));
  if (v21)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B180], v21);
  v22 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("groupingSeparator"));
  if (v22)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B118], v22);
  v23 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positivePrefix"));
  if (v23)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1C0], v23);
  v24 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positiveSuffix"));
  if (v24)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1C8], v24);
  v25 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativePrefix"));
  if (v25)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B188], v25);
  v26 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativeSuffix"));
  if (v26)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B190], v26);
  v27 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyCode"));
  if (v27)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B0E0], v27);
  v28 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencySymbol"));
  if (v28)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B0F8], v28);
  v29 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("internationalCurrencySymbol"));
  if (v29)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B128], v29);
  v30 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("percentSymbol"));
  if (v30)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1B0], v30);
  v31 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("perMillSymbol"));
  if (v31)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1A8], v31);
  v32 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minusSign"));
  if (v32)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B170], v32);
  v33 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("plusSign"));
  if (v33)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1B8], v33);
  v34 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("exponentSymbol"));
  if (v34)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B108], v34);
  v35 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("groupingSize"));
  if (v35)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B120], v35);
  v36 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("secondaryGroupingSize"));
  if (v36)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1E0], v36);
  v37 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formatWidth"));
  if (v37)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B110], v37);
  v38 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("multiplier"));
  if (v38)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B178], v38);
  v39 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("paddingCharacter"));
  if (v39)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B198], v39);
  v40 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("paddingPosition"));
  if (v40)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1A0], v40);
  v41 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("roundingMode"));
  if (v41)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1D8], v41);
  v42 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("roundingIncrement"));
  if (v42)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1D0], v42);
  v43 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumIntegerDigits"));
  if (v43)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B160], v43);
  v44 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumIntegerDigits"));
  if (v44)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B140], v44);
  v45 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumFractionDigits"));
  if (v45)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B150], v45);
  v46 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumFractionDigits"));
  if (v46)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B138], v46);
  v47 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyGroupingSeparator"));
  if (v47)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B0F0], v47);
  v48 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("lenient"));
  if (v48)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B130], v48);
  v49 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesSignificantDigits"));
  if (v49)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1F0], v49);
  v50 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumSignificantDigits"));
  if (v50)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B168], v50);
  v51 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumSignificantDigits"));
  if (v51)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B148], v51);
  v52 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesCharacterDirection"));
  if (v52)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1F8], v52);
  v53 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formattingContext"));
  if (v53)
  {
    v54 = v53;
    if (objc_msgSend(v53, "intValue") != -1)
      CFNumberFormatterSetProperty(self->_formatter, CFSTR("kCFNumberFormatterFormattingContextKey"), v54);
  }
  v55 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumGroupingDigits"));
  if (v55)
    CFNumberFormatterSetProperty(self->_formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B158], v55);
}

+ (NSString)localizedStringFromNumber:(NSNumber *)num numberStyle:(NSNumberFormatterStyle)nstyle
{
  void *v6;
  NSString *v7;

  if (!num)
    return 0;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setFormatterBehavior:", 1040);
  objc_msgSend(v6, "setNumberStyle:", nstyle);
  v7 = (NSString *)objc_msgSend(v6, "stringForObjectValue:", num);

  return v7;
}

- (void)setNumberStyle:(NSNumberFormatterStyle)numberStyle
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  if ((self->_stateBitMask & 2) == 0
    && objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("numberStyle")), "integerValue") != numberStyle)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", numberStyle), CFSTR("numberStyle"));
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)dealloc
{
  __CFNumberFormatter *formatter;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  formatter = self->_formatter;
  if (formatter)
    CFRelease(formatter);

  v4.receiver = self;
  v4.super_class = (Class)NSNumberFormatter;
  -[NSNumberFormatter dealloc](&v4, sel_dealloc);
}

- (id)stringForObjectValue:(id)a3
{
  double v5;
  double v6;
  NSString *v7;
  const __CFString *v9;
  __CFNumberFormatter *formatter;
  _NSStringProxyForContext *v11;
  id *v12;

  if (!a3)
    return -[NSNumberFormatter nilSymbol](self, "nilSymbol");
  if ((_NSIsNSNumber() & 1) == 0)
    return 0;
  -[NSRecursiveLock lock](self->_lock, "lock");
  objc_msgSend(a3, "doubleValue");
  v6 = v5;
  switch(__fpclassifyd(v5))
  {
    case 1:
      v7 = -[NSNumberFormatter notANumberSymbol](self, "notANumberSymbol");
      goto LABEL_11;
    case 2:
      if ((*(_QWORD *)&v6 & 0x8000000000000000) != 0)
        v7 = -[NSNumberFormatter negativeInfinitySymbol](self, "negativeInfinitySymbol");
      else
        v7 = -[NSNumberFormatter positiveInfinitySymbol](self, "positiveInfinitySymbol");
      goto LABEL_11;
    case 3:
    case 5:
      v7 = -[NSNumberFormatter zeroSymbol](self, "zeroSymbol");
LABEL_11:
      v9 = (const __CFString *)v7;
      if (!v7)
        goto LABEL_12;
      goto LABEL_17;
    default:
LABEL_12:
      if (_CFLocaleGetNoteCount() != self->_counter)
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      formatter = self->_formatter;
      if (formatter
        || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"),
            (formatter = self->_formatter) != 0))
      {
        v9 = (id)CFNumberFormatterCreateStringWithNumber((CFAllocatorRef)*MEMORY[0x1E0C9AE30], formatter, (CFNumberRef)a3);
      }
      else
      {
        v9 = 0;
      }
LABEL_17:
      if (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formattingContext")), "intValue") == -1)
      {
        v11 = objc_alloc_init(_NSStringProxyForContext);
        -[_NSStringProxyForContext setString:](v11, "setString:", v9);
        -[_NSStringProxyForContext setItem:](v11, "setItem:", a3);
        v12 = (id *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "init");
        objc_msgSend(v12[1], "setDictionary:", self->_attributes);
        -[_NSStringProxyForContext _retainFormatter:](v11, "_retainFormatter:", v12);
        objc_msgSend(v12, "_clearFormatter");

        v9 = v11;
      }
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      break;
  }
  return (id)v9;
}

- (void)setMaximumFractionDigits:(NSUInteger)maximumFractionDigits
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  __CFNumberFormatter *v13;
  __CFNumberFormatter *v14;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumFractionDigits"));
  if (!v5 || objc_msgSend(v5, "integerValue") != maximumFractionDigits)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B138];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", maximumFractionDigits);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("maximumFractionDigits"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  v9 = (const __CFString *)*MEMORY[0x1E0C9B150];
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumFractionDigits"));
  if (v10)
    goto LABEL_7;
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  if (!self->_formatter)
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (v9)
  {
    v14 = self->_formatter;
    if (v14)
    {
      v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_7:
      if (objc_msgSend(v10, "integerValue") > maximumFractionDigits)
      {
        v11 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumFractionDigits"));
        if (!v11 || objc_msgSend(v11, "integerValue") != maximumFractionDigits)
        {
          v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", maximumFractionDigits);
          -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v12, CFSTR("minimumFractionDigits"));
          ++self->_cacheGeneration;
          if (v9)
          {
            v13 = self->_formatter;
            if (v13)
              CFNumberFormatterSetProperty(v13, v9, v12);
          }
        }
      }
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)zeroSymbol
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("zeroSymbol"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B200];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setRoundingMode:(NSNumberFormatterRoundingMode)roundingMode
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("roundingMode"));
  if (!v5 || objc_msgSend(v5, "integerValue") != roundingMode)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1D8];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", roundingMode);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("roundingMode"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumberFormatter)init
{
  objc_class *v3;
  const char *v4;
  void (*MethodImplementation)(void);
  objc_class *v6;
  const char *v7;
  objc_method *InstanceMethod;
  objc_class *v9;
  const char *v10;
  objc_method *v11;
  objc_class *v12;
  const char *v13;
  objc_method *v14;
  objc_class *v15;
  const char *v16;
  objc_method *v17;
  objc_class *v18;
  const char *v19;
  void (*v20)(void);
  objc_class *v21;
  const char *v22;
  objc_method *v23;
  objc_class *v24;
  const char *v25;
  void (*v26)(void);
  objc_class *v27;
  const char *v28;
  objc_method *v29;
  NSNumberFormatter *v30;
  NSMutableDictionary *v31;
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (objc_lookUpClass("ChartNumberFormatter")
    && objc_msgSend(CFSTR("com.apple.Keynote"), "isEqual:", -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier")))
  {
    v3 = (objc_class *)objc_opt_self();
    v4 = sel_registerName("__Keynote_NOOP");
    MethodImplementation = class_getMethodImplementation(v3, v4);
    v6 = (objc_class *)objc_opt_self();
    v7 = sel_registerName("_getNegative");
    InstanceMethod = class_getInstanceMethod(v6, v7);
    if (InstanceMethod)
      method_setImplementation(InstanceMethod, MethodImplementation);
    v9 = (objc_class *)objc_opt_self();
    v10 = sel_registerName("_setNegativeFormat:");
    v11 = class_getInstanceMethod(v9, v10);
    if (v11)
      method_setImplementation(v11, MethodImplementation);
    v12 = (objc_class *)objc_opt_self();
    v13 = sel_registerName("_getPositive");
    v14 = class_getInstanceMethod(v12, v13);
    if (v14)
      method_setImplementation(v14, MethodImplementation);
    v15 = (objc_class *)objc_opt_self();
    v16 = sel_registerName("_setPositiveFormat:");
    v17 = class_getInstanceMethod(v15, v16);
    if (v17)
      method_setImplementation(v17, MethodImplementation);
    v18 = (objc_class *)objc_opt_self();
    v19 = sel_registerName("setNegativeFormat:");
    v20 = class_getMethodImplementation(v18, v19);
    v21 = objc_lookUpClass("ChartNumberFormatter");
    v22 = sel_registerName("setNegativeFormat:");
    v23 = class_getInstanceMethod(v21, v22);
    if (v23)
      method_setImplementation(v23, v20);
    v24 = (objc_class *)objc_opt_self();
    v25 = sel_registerName("setPositiveFormat:");
    v26 = class_getMethodImplementation(v24, v25);
    v27 = objc_lookUpClass("ChartNumberFormatter");
    v28 = sel_registerName("setPositiveFormat:");
    v29 = class_getInstanceMethod(v27, v28);
    if (v29)
      method_setImplementation(v29, v26);
  }
  v33.receiver = self;
  v33.super_class = (Class)NSNumberFormatter;
  v30 = -[NSNumberFormatter init](&v33, sel_init);
  if (v30)
  {
    v30->_lock = objc_alloc_init(NSRecursiveLock);
    v31 = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
    v30->_attributes = v31;
    -[NSMutableDictionary setValue:forKey:](v31, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "defaultFormatterBehavior")), CFSTR("formatterBehavior"));
    -[NSNumberFormatter setNilSymbol:](v30, "setNilSymbol:", &stru_1E0F56070);
    v34[0] = 0x221E002D221E002BLL;
    -[NSNumberFormatter setPositiveInfinitySymbol:](v30, "setPositiveInfinitySymbol:", +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v34, 2));
    -[NSNumberFormatter setNegativeInfinitySymbol:](v30, "setNegativeInfinitySymbol:", +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", (char *)v34 + 4, 2));
    -[NSNumberFormatter setAllowsFloats:](v30, "setAllowsFloats:", 1);
    -[NSNumberFormatter _clearFormatter](v30, "_clearFormatter");
  }
  return v30;
}

- (void)_clearFormatter
{
  __CFNumberFormatter *formatter;

  formatter = self->_formatter;
  if (formatter)
    CFRelease(formatter);
  self->_formatter = 0;
  ++self->_cacheGeneration;
}

- (void)setAllowsFloats:(BOOL)allowsFloats
{
  _BOOL4 v3;
  _QWORD *v5;

  v3 = allowsFloats;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  v5 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v5 = (_QWORD *)MEMORY[0x1E0C9AE40];
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", *v5, CFSTR("allowsFloats"));
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setNilSymbol:(NSString *)nilSymbol
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("nilSymbol"));
  if ((nilSymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", nilSymbol) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", -[NSString copyWithZone:](nilSymbol, "copyWithZone:", 0), CFSTR("nilSymbol"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setNegativeInfinitySymbol:(NSString *)negativeInfinitySymbol
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativeInfinitySymbol"));
  if ((negativeInfinitySymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", negativeInfinitySymbol) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", -[NSString copyWithZone:](negativeInfinitySymbol, "copyWithZone:", 0), CFSTR("negativeInfinitySymbol"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

+ (NSNumberFormatterBehavior)defaultFormatterBehavior
{
  return __NSNumberFormatterDefaultBehavior;
}

- (void)setPositiveInfinitySymbol:(NSString *)positiveInfinitySymbol
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positiveInfinitySymbol"));
  if ((positiveInfinitySymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", positiveInfinitySymbol) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", -[NSString copyWithZone:](positiveInfinitySymbol, "copyWithZone:", 0), CFSTR("positiveInfinitySymbol"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setUsesGroupingSeparator:(BOOL)usesGroupingSeparator
{
  const void **v4;
  const void *v5;
  __CFNumberFormatter *formatter;

  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!usesGroupingSeparator)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, CFSTR("usesGroupingSeparator"));
  formatter = self->_formatter;
  if (formatter)
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1E8], v5);
  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumber)numberFromString:(NSString *)string
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!string)
    return 0;
  v4[0] = 0;
  if (-[NSNumberFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", v4, string, 0))
  {
    return (NSNumber *)v4[0];
  }
  else
  {
    return 0;
  }
}

- (void)setRoundingIncrement:(NSNumber *)roundingIncrement
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("roundingIncrement"));
  if ((roundingIncrement == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", roundingIncrement) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1D0];
    v7 = -[NSNumber copyWithZone:](roundingIncrement, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("roundingIncrement"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)stringFromNumber:(NSNumber *)number
{
  if (number)
    return (NSString *)-[NSNumberFormatter stringForObjectValue:](self, "stringForObjectValue:");
  else
    return 0;
}

- (void)setMinimumIntegerDigits:(NSUInteger)minimumIntegerDigits
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;
  const __CFString *v9;
  void *v10;
  __CFNumberFormatter *v11;
  void *v12;
  NSNumber *v13;
  __CFNumberFormatter *v14;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumIntegerDigits"));
  if (!v5 || objc_msgSend(v5, "integerValue") != minimumIntegerDigits)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B160];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", minimumIntegerDigits);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("minimumIntegerDigits"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  v9 = (const __CFString *)*MEMORY[0x1E0C9B140];
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumIntegerDigits"));
  if (v10)
    goto LABEL_7;
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  if (!self->_formatter)
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v9)
      goto LABEL_19;
LABEL_22:
    v11 = 0;
    goto LABEL_8;
  }
  if (!v9)
    goto LABEL_22;
LABEL_19:
  v11 = self->_formatter;
  if (!v11)
    goto LABEL_8;
  v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
LABEL_7:
  v11 = (__CFNumberFormatter *)objc_msgSend(v10, "integerValue");
LABEL_8:
  if ((unint64_t)v11 < minimumIntegerDigits)
  {
    v12 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumIntegerDigits"));
    if (!v12 || objc_msgSend(v12, "integerValue") != minimumIntegerDigits)
    {
      v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", minimumIntegerDigits);
      -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v13, CFSTR("maximumIntegerDigits"));
      ++self->_cacheGeneration;
      if (v9)
      {
        v14 = self->_formatter;
        if (v14)
          CFNumberFormatterSetProperty(v14, v9, v13);
      }
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

+ (void)initialize
{
  if (!__NSNumberFormatterDefaultBehavior)
    objc_msgSend(a1, "setDefaultFormatterBehavior:", 0);
}

+ (void)setDefaultFormatterBehavior:(NSNumberFormatterBehavior)behavior
{
  NSNumberFormatterBehavior v3;

  v3 = NSNumberFormatterBehavior10_4;
  if (behavior)
    v3 = behavior;
  __NSNumberFormatterDefaultBehavior = v3;
}

- (void)resetCheckModify
{
  self->_stateBitMask &= ~1uLL;
}

- (void)getFormatter
{
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  if (!self->_formatter)
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  return (void *)_CFNumberFormatterGetFormatter();
}

- (void)setLocale:(NSLocale *)locale
{
  -[NSRecursiveLock lock](self->_lock, "lock");
  if ((objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("locale")), "isEqual:", locale) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSLocale copyWithZone:](locale, "copyWithZone:", 0), CFSTR("locale"));
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    self->_stateBitMask |= 5uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSLocale)locale
{
  CFLocaleRef v3;
  __CFNumberFormatter *formatter;
  CFLocaleRef Locale;
  const __CFLocale *v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = (CFLocaleRef)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("locale"));
  if (!v3)
  {
    formatter = self->_formatter;
    if (formatter
      || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0))
    {
      Locale = CFNumberFormatterGetLocale(formatter);
    }
    else
    {
      Locale = (CFLocaleRef)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    }
    v3 = Locale;
  }
  v6 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSLocale *)v3;
}

- (void)setPropertyBit
{
  self->_stateBitMask |= 2uLL;
}

- (void)clearPropertyBit
{
  self->_stateBitMask &= ~2uLL;
}

- (void)resetCheckLocaleChange
{
  self->_stateBitMask &= ~4uLL;
}

- (NSFormattingContext)formattingContext
{
  void *v3;
  int v4;
  __CFNumberFormatter *formatter;
  int v6;
  NSFormattingContext result;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formattingContext"));
  v4 = objc_msgSend(v3, "intValue");
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      formatter = self->_formatter;
    }
    v4 = objc_msgSend((id)(id)CFNumberFormatterCopyProperty(formatter, CFSTR("kCFNumberFormatterFormattingContextKey")), "intValue");
  }
  v6 = v4;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  switch(v6)
  {
    case 256:
      goto LABEL_9;
    case 257:
      result = NSFormattingContextMiddleOfSentence;
      break;
    case 258:
      result = NSFormattingContextBeginningOfSentence;
      break;
    case 259:
      result = NSFormattingContextListItem;
      break;
    case 260:
      result = NSFormattingContextStandalone;
      break;
    default:
      if (v6 == -1)
        result = NSFormattingContextDynamic;
      else
LABEL_9:
        result = NSFormattingContextUnknown;
      break;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5[1], "setDictionary:", self->_attributes);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  objc_msgSend(v5, "_clearFormatter");
  return v5;
}

- (BOOL)checkLocaleChange
{
  return (LOBYTE(self->_stateBitMask) >> 2) & 1;
}

- (BOOL)checkModify
{
  return self->_stateBitMask & 1;
}

- (NSUInteger)maximumFractionDigits
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumFractionDigits"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B138];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (NSNumberFormatterRoundingMode)roundingMode
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("roundingMode"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B1D8];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumberFormatterRoundingMode)v4;
}

- (void)setMinimumFractionDigits:(NSUInteger)minimumFractionDigits
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;
  const __CFString *v9;
  void *v10;
  __CFNumberFormatter *v11;
  void *v12;
  NSNumber *v13;
  __CFNumberFormatter *v14;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumFractionDigits"));
  if (!v5 || objc_msgSend(v5, "integerValue") != minimumFractionDigits)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B150];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", minimumFractionDigits);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("minimumFractionDigits"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  v9 = (const __CFString *)*MEMORY[0x1E0C9B138];
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumFractionDigits"));
  if (v10)
    goto LABEL_7;
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  if (!self->_formatter)
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v9)
      goto LABEL_19;
LABEL_22:
    v11 = 0;
    goto LABEL_8;
  }
  if (!v9)
    goto LABEL_22;
LABEL_19:
  v11 = self->_formatter;
  if (!v11)
    goto LABEL_8;
  v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
LABEL_7:
  v11 = (__CFNumberFormatter *)objc_msgSend(v10, "integerValue");
LABEL_8:
  if ((unint64_t)v11 < minimumFractionDigits)
  {
    v12 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumFractionDigits"));
    if (!v12 || objc_msgSend(v12, "integerValue") != minimumFractionDigits)
    {
      v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", minimumFractionDigits);
      -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v13, CFSTR("maximumFractionDigits"));
      ++self->_cacheGeneration;
      if (v9)
      {
        v14 = self->_formatter;
        if (v14)
          CFNumberFormatterSetProperty(v14, v9, v13);
      }
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumberFormatterStyle)numberStyle
{
  void *v3;
  CFNumberFormatterStyle Style;
  __CFNumberFormatter *formatter;
  NSNumberFormatterStyle v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("numberStyle"));
  Style = objc_msgSend(v3, "integerValue");
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      formatter = self->_formatter;
      if (!formatter)
      {
        v6 = NSNumberFormatterNoStyle;
        goto LABEL_8;
      }
    }
    Style = CFNumberFormatterGetStyle(formatter);
  }
  v6 = Style;
LABEL_8:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (NSUInteger)minimumFractionDigits
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumFractionDigits"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B150];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setUsesSignificantDigits:(BOOL)usesSignificantDigits
{
  const void **v4;
  const void *v5;
  __CFNumberFormatter *formatter;

  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!usesSignificantDigits)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, CFSTR("usesSignificantDigits"));
  formatter = self->_formatter;
  if (formatter)
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1F0], v5);
  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setMaximumSignificantDigits:(NSUInteger)maximumSignificantDigits
{
  NSUInteger v4;
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  __CFNumberFormatter *v13;
  __CFNumberFormatter *v14;

  if (maximumSignificantDigits <= 1)
    v4 = 1;
  else
    v4 = maximumSignificantDigits;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumSignificantDigits"));
  if (!v5 || objc_msgSend(v5, "integerValue") != v4)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B148];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("maximumSignificantDigits"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  v9 = (const __CFString *)*MEMORY[0x1E0C9B168];
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumSignificantDigits"));
  if (v10)
    goto LABEL_10;
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  if (!self->_formatter)
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (v9)
  {
    v14 = self->_formatter;
    if (v14)
    {
      v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_10:
      if (v4 < objc_msgSend(v10, "integerValue"))
      {
        v11 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumSignificantDigits"));
        if (!v11 || objc_msgSend(v11, "integerValue") != v4)
        {
          v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4);
          -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v12, CFSTR("minimumSignificantDigits"));
          ++self->_cacheGeneration;
          if (v9)
          {
            v13 = self->_formatter;
            if (v13)
              CFNumberFormatterSetProperty(v13, v9, v12);
          }
        }
      }
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setAlwaysShowsDecimalSeparator:(BOOL)alwaysShowsDecimalSeparator
{
  const void **v4;
  const void *v5;
  __CFNumberFormatter *formatter;

  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!alwaysShowsDecimalSeparator)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, CFSTR("alwaysShowsDecimalSeparator"));
  formatter = self->_formatter;
  if (formatter)
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B0D8], v5);
  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setNegativePrefix:(NSString *)negativePrefix
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativePrefix"));
  if ((negativePrefix == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", negativePrefix) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B188];
    v7 = -[NSString copyWithZone:](negativePrefix, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("negativePrefix"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setPositivePrefix:(NSString *)positivePrefix
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positivePrefix"));
  if ((positivePrefix == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", positivePrefix) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1C0];
    v7 = -[NSString copyWithZone:](positivePrefix, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("positivePrefix"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setMinimumSignificantDigits:(NSUInteger)minimumSignificantDigits
{
  NSUInteger v4;
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;
  const __CFString *v9;
  void *v10;
  __CFNumberFormatter *v11;
  void *v12;
  NSNumber *v13;
  __CFNumberFormatter *v14;

  if (minimumSignificantDigits <= 1)
    v4 = 1;
  else
    v4 = minimumSignificantDigits;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumSignificantDigits"));
  if (!v5 || objc_msgSend(v5, "integerValue") != v4)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B168];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("minimumSignificantDigits"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  v9 = (const __CFString *)*MEMORY[0x1E0C9B148];
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumSignificantDigits"));
  if (v10)
  {
LABEL_10:
    if (v4 <= objc_msgSend(v10, "integerValue"))
      goto LABEL_25;
    goto LABEL_20;
  }
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  if (self->_formatter)
  {
    if (!v9)
      goto LABEL_20;
  }
  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (!v9)
      goto LABEL_20;
  }
  v11 = self->_formatter;
  if (v11)
  {
    v10 = (id)CFNumberFormatterCopyProperty(v11, v9);
    goto LABEL_10;
  }
LABEL_20:
  v12 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumSignificantDigits"));
  if (!v12 || objc_msgSend(v12, "integerValue") != v4)
  {
    v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v13, CFSTR("maximumSignificantDigits"));
    ++self->_cacheGeneration;
    if (v9)
    {
      v14 = self->_formatter;
      if (v14)
        CFNumberFormatterSetProperty(v14, v9, v13);
    }
  }
LABEL_25:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  uint64_t v4;
  int v5;
  NSNumber *v6;
  __CFNumberFormatter *formatter;

  switch(formattingContext)
  {
    case NSFormattingContextUnknown:
      v4 = 256;
      goto LABEL_9;
    case NSFormattingContextDynamic:
      v5 = 0;
      v4 = 0xFFFFFFFFLL;
      goto LABEL_10;
    case NSFormattingContextStandalone:
      v4 = 260;
      goto LABEL_9;
    case NSFormattingContextListItem:
      v4 = 259;
      goto LABEL_9;
    case NSFormattingContextBeginningOfSentence:
      v4 = 258;
      goto LABEL_9;
    case NSFormattingContextMiddleOfSentence:
      v4 = 257;
      goto LABEL_9;
    default:
      v4 = 0;
LABEL_9:
      v5 = 1;
LABEL_10:
      v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4);
      -[NSRecursiveLock lock](self->_lock, "lock");
      ++self->_cacheGeneration;
      -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v6, CFSTR("formattingContext"));
      if (v5)
      {
        formatter = self->_formatter;
        if (formatter)
          CFNumberFormatterSetProperty(formatter, CFSTR("kCFNumberFormatterFormattingContextKey"), v6);
      }
      self->_stateBitMask |= 1uLL;
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      return;
  }
}

- (void)setMaximumIntegerDigits:(NSUInteger)maximumIntegerDigits
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;
  const __CFString *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  __CFNumberFormatter *v13;
  __CFNumberFormatter *v14;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumIntegerDigits"));
  if (!v5 || objc_msgSend(v5, "integerValue") != maximumIntegerDigits)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B140];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", maximumIntegerDigits);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("maximumIntegerDigits"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  v9 = (const __CFString *)*MEMORY[0x1E0C9B160];
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumIntegerDigits"));
  if (v10)
    goto LABEL_7;
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  if (!self->_formatter)
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (v9)
  {
    v14 = self->_formatter;
    if (v14)
    {
      v10 = (id)CFNumberFormatterCopyProperty(v14, v9);
LABEL_7:
      if (objc_msgSend(v10, "integerValue") > maximumIntegerDigits)
      {
        v11 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumIntegerDigits"));
        if (!v11 || objc_msgSend(v11, "integerValue") != maximumIntegerDigits)
        {
          v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", maximumIntegerDigits);
          -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v12, CFSTR("minimumIntegerDigits"));
          ++self->_cacheGeneration;
          if (v9)
          {
            v13 = self->_formatter;
            if (v13)
              CFNumberFormatterSetProperty(v13, v9, v12);
          }
        }
      }
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setPositiveFormat:(NSString *)positiveFormat
{
  __CFNumberFormatter *formatter;
  id v6;
  const __CFString *v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", -[NSString copyWithZone:](positiveFormat, "copyWithZone:", 0), CFSTR("positiveFormat"));
  if (!positiveFormat)
    goto LABEL_7;
  formatter = self->_formatter;
  if (formatter
    || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0))
  {
    v6 = objc_autorelease((id)objc_msgSend((id)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(formatter), "componentsSeparatedByString:", CFSTR(";")),
                                "mutableCopy"));
    objc_msgSend(v6, "replaceObjectAtIndex:withObject:", 0, positiveFormat);
    v7 = (const __CFString *)objc_msgSend(v6, "componentsJoinedByString:", CFSTR(";"));
    CFNumberFormatterSetFormat(self->_formatter, v7);
    self->_stateBitMask |= 1uLL;
    if (!v7)
LABEL_7:
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setGeneratesDecimalNumbers:(BOOL)generatesDecimalNumbers
{
  _BOOL4 v3;
  _QWORD *v5;

  v3 = generatesDecimalNumbers;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  v5 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v5 = (_QWORD *)MEMORY[0x1E0C9AE40];
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", *v5, CFSTR("generatesDecimalNumbers"));
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)percentSymbol
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("percentSymbol"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B1B0];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setNotANumberSymbol:(NSString *)notANumberSymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("notANumberSymbol"));
  if ((notANumberSymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", notANumberSymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B180];
    v7 = -[NSString copyWithZone:](notANumberSymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("notANumberSymbol"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setMinusSign:(NSString *)minusSign
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minusSign"));
  if ((minusSign == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", minusSign) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B170];
    v7 = -[NSString copyWithZone:](minusSign, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("minusSign"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setExponentSymbol:(NSString *)exponentSymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("exponentSymbol"));
  if ((exponentSymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", exponentSymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B108];
    v7 = -[NSString copyWithZone:](exponentSymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("exponentSymbol"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setCurrencyCode:(NSString *)currencyCode
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyCode"));
  if ((currencyCode == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", currencyCode) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B0E0];
    v7 = -[NSString copyWithZone:](currencyCode, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("currencyCode"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setNegativeFormat:(NSString *)negativeFormat
{
  __CFNumberFormatter *formatter;
  id v6;
  const __CFString *v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", -[NSString copyWithZone:](negativeFormat, "copyWithZone:", 0), CFSTR("negativeFormat"));
  if (!negativeFormat)
    goto LABEL_10;
  formatter = self->_formatter;
  if (formatter
    || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0))
  {
    v6 = objc_autorelease((id)objc_msgSend((id)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(formatter), "componentsSeparatedByString:", CFSTR(";")),
                                "mutableCopy"));
    if ((unint64_t)objc_msgSend(v6, "count") > 1)
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", 1, negativeFormat);
    else
      objc_msgSend(v6, "addObject:", negativeFormat);
    v7 = (const __CFString *)objc_msgSend(v6, "componentsJoinedByString:", CFSTR(";"));
    CFNumberFormatterSetFormat(self->_formatter, v7);
    self->_stateBitMask |= 1uLL;
    if (!v7)
LABEL_10:
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setPaddingCharacter:(NSString *)paddingCharacter
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("paddingCharacter"));
  if ((paddingCharacter == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", paddingCharacter) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B198];
    v7 = -[NSString copyWithZone:](paddingCharacter, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("paddingCharacter"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setMultiplier:(NSNumber *)multiplier
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("multiplier"));
  if ((multiplier == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", multiplier) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B178];
    v7 = -[NSNumber copyWithZone:](multiplier, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("multiplier"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_invalidateCache
{
  ++self->_cacheGeneration;
}

- (void)__Keynote_NOOP
{
  return 0;
}

- (void)_reset
{
  NSMutableDictionary *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];

  v3 = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
  self->_attributes = v3;
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "defaultFormatterBehavior")), CFSTR("formatterBehavior"));
  -[NSNumberFormatter setNilSymbol:](self, "setNilSymbol:", &stru_1E0F56070);
  v4[0] = 0x221E002D221E002BLL;
  -[NSNumberFormatter setPositiveInfinitySymbol:](self, "setPositiveInfinitySymbol:", +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v4, 2));
  -[NSNumberFormatter setNegativeInfinitySymbol:](self, "setNegativeInfinitySymbol:", +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", (char *)v4 + 4, 2));
  -[NSNumberFormatter setAllowsFloats:](self, "setAllowsFloats:", 1);
  -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSNumberFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSNumberFormatters cannot be encoded by non-keyed archivers"), 0));
  -[NSRecursiveLock lock](self->_lock, "lock");
  objc_msgSend(a3, "encodeObject:forKey:", self->_attributes, CFSTR("NS.attributes"));
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumberFormatter)initWithCoder:(id)a3
{
  NSNumberFormatter *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  NSMutableDictionary *attributes;
  uint64_t v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSNumberFormatter;
  v4 = -[NSFormatter initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v4->_lock = objc_alloc_init(NSRecursiveLock);
    if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSNumberFormatters cannot be decoded by non-keyed archivers"), 0));
    }
    v5 = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NS.attributes"));
    v4->_attributes = v5;
    v6 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v5, "objectForKey:", CFSTR("formatterBehavior")), "integerValue");
    if (v6 != 1040)
    {
      attributes = v4->_attributes;
      if (v6)
        v8 = 1040;
      else
        v8 = objc_msgSend((id)objc_opt_class(), "defaultFormatterBehavior");
      -[NSMutableDictionary setValue:forKey:](attributes, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8), CFSTR("formatterBehavior"));
    }
    v4->_behavior = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v4->_attributes, "objectForKey:", CFSTR("formatterBehavior")), "integerValue");
    -[NSNumberFormatter _clearFormatter](v4, "_clearFormatter");
  }
  return v4;
}

- (BOOL)_tracksCacheGenerationCount
{
  return object_getClass(self) == (Class)NSNumberFormatter;
}

- (int64_t)_cacheGenerationCount
{
  if (!-[NSNumberFormatter _tracksCacheGenerationCount](self, "_tracksCacheGenerationCount"))
    return -1;
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  return self->_cacheGeneration;
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  objc_class *v5;
  void (*MethodImplementation)(void);
  objc_class *v7;
  double v9;
  double v10;
  NSDictionary *v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSNumber() & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)NSNumberFormatter;
    return -[NSFormatter _mayDecorateAttributedStringForObjectValue:](&v12, sel__mayDecorateAttributedStringForObjectValue_, a3);
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    v7 = (objc_class *)objc_opt_class();
    if (MethodImplementation == class_getMethodImplementation(v7, sel_attributedStringForObjectValue_withDefaultAttributes_))
    {
      if (a3)
      {
        objc_msgSend(a3, "doubleValue");
        v10 = v9;
        switch(__fpclassifyd(v9))
        {
          case 1:
            v11 = -[NSNumberFormatter textAttributesForNotANumber](self, "textAttributesForNotANumber");
            break;
          case 2:
            if ((*(_QWORD *)&v10 & 0x8000000000000000) != 0)
              v11 = -[NSNumberFormatter textAttributesForNegativeInfinity](self, "textAttributesForNegativeInfinity");
            else
              v11 = -[NSNumberFormatter textAttributesForPositiveInfinity](self, "textAttributesForPositiveInfinity");
            break;
          case 3:
          case 5:
            v11 = -[NSNumberFormatter textAttributesForZero](self, "textAttributesForZero");
            break;
          default:
            if ((*(_QWORD *)&v10 & 0x8000000000000000) != 0)
              v11 = -[NSNumberFormatter textAttributesForNegativeValues](self, "textAttributesForNegativeValues");
            else
              v11 = -[NSNumberFormatter textAttributesForPositiveValues](self, "textAttributesForPositiveValues");
            break;
        }
      }
      else
      {
        v11 = -[NSNumberFormatter textAttributesForNil](self, "textAttributesForNil");
      }
      return v11 != 0;
    }
    else
    {
      return 1;
    }
  }
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return 0;
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error
{
  return getObjectValue_0((uint64_t)self, obj, (__CFString *)string, (CFIndex *)rangep, 0, error);
}

- (NSNumberFormatterBehavior)formatterBehavior
{
  return 1040;
}

- (NSString)negativeFormat
{
  uint64_t v3;
  void *v4;
  __CFNumberFormatter *formatter;
  void *v6;
  id v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativeFormat"));
  v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
      goto LABEL_10;
  }
  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4)
      goto LABEL_10;
  }
  formatter = self->_formatter;
  if (formatter)
  {
    v6 = (void *)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(formatter), "componentsSeparatedByString:", CFSTR(";"));
    v4 = (void *)objc_msgSend(v6, "objectAtIndex:", (unint64_t)objc_msgSend(v6, "count") > 1);
  }
  else
  {
    v4 = 0;
  }
LABEL_10:
  v7 = v4;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v4;
}

- (NSDictionary)textAttributesForNegativeValues
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForNegativeValues"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNegativeValues:(NSDictionary *)textAttributesForNegativeValues
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForNegativeValues"));
  if ((textAttributesForNegativeValues == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", textAttributesForNegativeValues) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSDictionary copyWithZone:](textAttributesForNegativeValues, "copyWithZone:", 0), CFSTR("textAttributesForNegativeValues"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)positiveFormat
{
  uint64_t v3;
  void *v4;
  __CFNumberFormatter *formatter;
  id v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positiveFormat"));
  v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
      goto LABEL_10;
  }
  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4)
      goto LABEL_10;
  }
  formatter = self->_formatter;
  if (formatter)
    v4 = (void *)objc_msgSend((id)-[__CFString componentsSeparatedByString:]((id)CFNumberFormatterGetFormat(formatter), "componentsSeparatedByString:", CFSTR(";")),
                   "objectAtIndex:",
                   0);
  else
    v4 = 0;
LABEL_10:
  v6 = v4;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v4;
}

- (NSDictionary)textAttributesForPositiveValues
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForPositiveValues"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForPositiveValues:(NSDictionary *)textAttributesForPositiveValues
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForPositiveValues"));
  if ((textAttributesForPositiveValues == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", textAttributesForPositiveValues) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSDictionary copyWithZone:](textAttributesForPositiveValues, "copyWithZone:", 0), CFSTR("textAttributesForPositiveValues"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setDecimalSeparator:(NSString *)decimalSeparator
{
  id v4;
  __CFNumberFormatter *formatter;

  v4 = -[NSString copyWithZone:](decimalSeparator, "copyWithZone:", 0);
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v4, CFSTR("decimalSeparator"));
  if (v4)
  {
    formatter = self->_formatter;
    if (formatter
      || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0))
    {
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B100], v4);
    }
  }
  else
  {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)alwaysShowsDecimalSeparator
{
  void *v3;
  char v4;
  __CFNumberFormatter *formatter;
  BOOL v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("alwaysShowsDecimalSeparator"));
  v4 = objc_msgSend(v3, "BOOLValue");
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      formatter = self->_formatter;
      if (!formatter)
      {
        v6 = 0;
        goto LABEL_8;
      }
    }
    v4 = objc_msgSend((id)(id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B0D8]), "BOOLValue");
  }
  v6 = v4;
LABEL_8:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (NSString)currencyDecimalSeparator
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyDecimalSeparator"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B0E8];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setCurrencyDecimalSeparator:(NSString *)currencyDecimalSeparator
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  if ((self->_stateBitMask & 2) == 0)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyDecimalSeparator"));
    if ((currencyDecimalSeparator == 0) == (v5 != 0)
      || (objc_msgSend(v5, "isEqual:", currencyDecimalSeparator) & 1) == 0)
    {
      v6 = (const __CFString *)*MEMORY[0x1E0C9B0E8];
      v7 = -[NSString copyWithZone:](currencyDecimalSeparator, "copyWithZone:", 0);
      -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("currencyDecimalSeparator"));
      ++self->_cacheGeneration;
      if (v6)
      {
        if (v7 && (formatter = self->_formatter) != 0)
        {
          CFNumberFormatterSetProperty(formatter, v6, v7);
        }
        else if (!v7)
        {
          -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
        }
      }
      self->_stateBitMask |= 1uLL;
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (BOOL)usesGroupingSeparator
{
  void *v3;
  char v4;
  __CFNumberFormatter *formatter;
  BOOL v6;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesGroupingSeparator"));
  v4 = objc_msgSend(v3, "BOOLValue");
  if (!v3)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      formatter = self->_formatter;
      if (!formatter)
      {
        v6 = 0;
        goto LABEL_8;
      }
    }
    v4 = objc_msgSend((id)(id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1E8]), "BOOLValue");
  }
  v6 = v4;
LABEL_8:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v6;
}

- (void)setGroupingSeparator:(NSString *)groupingSeparator
{
  id v5;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  v5 = -[NSString copyWithZone:](groupingSeparator, "copyWithZone:", 0);
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, CFSTR("groupingSeparator"));
  if (v5)
  {
    formatter = self->_formatter;
    if (formatter
      || (-[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0))
    {
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B118], v5);
    }
  }
  else
  {
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  }
  self->_stateBitMask |= 1uLL;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setZeroSymbol:(NSString *)zeroSymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("zeroSymbol"));
  if ((zeroSymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", zeroSymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B200];
    v7 = -[NSString copyWithZone:](zeroSymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("zeroSymbol"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForZero
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForZero"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForZero:(NSDictionary *)textAttributesForZero
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForZero"));
  if ((textAttributesForZero == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", textAttributesForZero) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSDictionary copyWithZone:](textAttributesForZero, "copyWithZone:", 0), CFSTR("textAttributesForZero"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForNil
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForNil"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNil:(NSDictionary *)textAttributesForNil
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForNil"));
  if ((textAttributesForNil == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", textAttributesForNil) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSDictionary copyWithZone:](textAttributesForNil, "copyWithZone:", 0), CFSTR("textAttributesForNil"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)notANumberSymbol
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("notANumberSymbol"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B180];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSDictionary)textAttributesForNotANumber
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForNotANumber"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNotANumber:(NSDictionary *)textAttributesForNotANumber
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForNotANumber"));
  if ((textAttributesForNotANumber == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", textAttributesForNotANumber) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSDictionary copyWithZone:](textAttributesForNotANumber, "copyWithZone:", 0), CFSTR("textAttributesForNotANumber"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForPositiveInfinity
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForPositiveInfinity"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForPositiveInfinity:(NSDictionary *)textAttributesForPositiveInfinity
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForPositiveInfinity"));
  if ((textAttributesForPositiveInfinity == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", textAttributesForPositiveInfinity) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSDictionary copyWithZone:](textAttributesForPositiveInfinity, "copyWithZone:", 0), CFSTR("textAttributesForPositiveInfinity"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSDictionary)textAttributesForNegativeInfinity
{
  void *v3;
  id v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForNegativeInfinity"));
  if (!v3)
  {
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    if (!self->_formatter)
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
  }
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSDictionary *)v3;
}

- (void)setTextAttributesForNegativeInfinity:(NSDictionary *)textAttributesForNegativeInfinity
{
  void *v5;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("textAttributesForNegativeInfinity"));
  if ((textAttributesForNegativeInfinity == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", textAttributesForNegativeInfinity) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSDictionary copyWithZone:](textAttributesForNegativeInfinity, "copyWithZone:", 0), CFSTR("textAttributesForNegativeInfinity"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)positivePrefix
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positivePrefix"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B1C0];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)positiveSuffix
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positiveSuffix"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B1C8];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setPositiveSuffix:(NSString *)positiveSuffix
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("positiveSuffix"));
  if ((positiveSuffix == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", positiveSuffix) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1C8];
    v7 = -[NSString copyWithZone:](positiveSuffix, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("positiveSuffix"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)negativePrefix
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativePrefix"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B188];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)negativeSuffix
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativeSuffix"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B190];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setNegativeSuffix:(NSString *)negativeSuffix
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("negativeSuffix"));
  if ((negativeSuffix == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", negativeSuffix) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B190];
    v7 = -[NSString copyWithZone:](negativeSuffix, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("negativeSuffix"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)currencyCode
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyCode"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B0E0];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (BOOL)_hasSetCurrencyCode
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyCode")) != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSString)currencySymbol
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencySymbol"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B0F8];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (BOOL)_hasSetCurrencySymbol
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencySymbol")) != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setCurrencySymbol:(NSString *)currencySymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencySymbol"));
  if ((currencySymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", currencySymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B0F8];
    v7 = -[NSString copyWithZone:](currencySymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("currencySymbol"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)internationalCurrencySymbol
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("internationalCurrencySymbol"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B128];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setInternationalCurrencySymbol:(NSString *)internationalCurrencySymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("internationalCurrencySymbol"));
  if ((internationalCurrencySymbol == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", internationalCurrencySymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B128];
    v7 = -[NSString copyWithZone:](internationalCurrencySymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("internationalCurrencySymbol"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)_hasSetInternationalCurrencySymbol
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("internationalCurrencySymbol")) != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setPercentSymbol:(NSString *)percentSymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("percentSymbol"));
  if ((percentSymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", percentSymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1B0];
    v7 = -[NSString copyWithZone:](percentSymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("percentSymbol"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)perMillSymbol
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("perMillSymbol"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B1A8];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setPerMillSymbol:(NSString *)perMillSymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("perMillSymbol"));
  if ((perMillSymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", perMillSymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1A8];
    v7 = -[NSString copyWithZone:](perMillSymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("perMillSymbol"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)minusSign
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minusSign"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B170];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSString)plusSign
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("plusSign"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B1B8];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setPlusSign:(NSString *)plusSign
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("plusSign"));
  if ((plusSign == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", plusSign) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1B8];
    v7 = -[NSString copyWithZone:](plusSign, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("plusSign"));
    ++self->_cacheGeneration;
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFNumberFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)exponentSymbol
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("exponentSymbol"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B108];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSUInteger)groupingSize
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("groupingSize"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B120];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setGroupingSize:(NSUInteger)groupingSize
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("groupingSize"));
  if (!v5 || objc_msgSend(v5, "integerValue") != groupingSize)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B120];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", groupingSize);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("groupingSize"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)secondaryGroupingSize
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("secondaryGroupingSize"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B1E0];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setSecondaryGroupingSize:(NSUInteger)secondaryGroupingSize
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("secondaryGroupingSize"));
  if (!v5 || objc_msgSend(v5, "integerValue") != secondaryGroupingSize)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1E0];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", secondaryGroupingSize);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("secondaryGroupingSize"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSUInteger)formatWidth
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formatWidth"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B110];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setFormatWidth:(NSUInteger)formatWidth
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formatWidth"));
  if (!v5 || objc_msgSend(v5, "integerValue") != formatWidth)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B110];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", formatWidth);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("formatWidth"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumber)multiplier
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("multiplier"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B178];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumber *)v3;
}

- (NSString)paddingCharacter
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("paddingCharacter"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B198];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (NSNumberFormatterPadPosition)paddingPosition
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("paddingPosition"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B1A0];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumberFormatterPadPosition)v4;
}

- (void)setPaddingPosition:(NSNumberFormatterPadPosition)paddingPosition
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("paddingPosition"));
  if (!v5 || objc_msgSend(v5, "integerValue") != paddingPosition)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B1A0];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", paddingPosition);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("paddingPosition"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSNumber)roundingIncrement
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("roundingIncrement"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B1D0];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSNumber *)v3;
}

- (NSUInteger)minimumIntegerDigits
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumIntegerDigits"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B160];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (NSUInteger)maximumIntegerDigits
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumIntegerDigits"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B140];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (void)setMinimum:(NSNumber *)minimum
{
  NSNumber *v3;
  void *v5;

  v3 = minimum;
  if (minimum
    && -[NSDecimalNumber isEqual:](+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber"), "isEqual:", minimum))
  {
    v3 = 0;
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimum"));
  if ((v3 == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", v3) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", -[NSNumber copyWithZone:](v3, "copyWithZone:", 0), CFSTR("minimum"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setMaximum:(NSNumber *)maximum
{
  NSNumber *v3;
  void *v5;

  v3 = maximum;
  if (maximum
    && -[NSDecimalNumber isEqual:](+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber"), "isEqual:", maximum))
  {
    v3 = 0;
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximum"));
  if ((v3 == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", v3) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", -[NSNumber copyWithZone:](v3, "copyWithZone:", 0), CFSTR("maximum"));
    ++self->_cacheGeneration;
    self->_stateBitMask |= 1uLL;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (NSString)currencyGroupingSeparator
{
  __CFString *v3;
  __CFString *v4;
  __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyGroupingSeparator"));
  if (!v3)
  {
    v6 = (__CFString **)MEMORY[0x1E0C9B0F0];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v3 = *v6;
    if (self->_formatter)
    {
      if (!v3)
        goto LABEL_2;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v3)
        goto LABEL_2;
    }
    formatter = self->_formatter;
    if (formatter)
      v3 = (id)CFNumberFormatterCopyProperty(formatter, v3);
    else
      v3 = 0;
  }
LABEL_2:
  v4 = v3;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSString *)v3;
}

- (void)setCurrencyGroupingSeparator:(NSString *)currencyGroupingSeparator
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFNumberFormatter *formatter;

  if ((self->_stateBitMask & 2) == 0)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("currencyGroupingSeparator"));
    if ((currencyGroupingSeparator == 0) == (v5 != 0)
      || (objc_msgSend(v5, "isEqual:", currencyGroupingSeparator) & 1) == 0)
    {
      v6 = (const __CFString *)*MEMORY[0x1E0C9B0F0];
      v7 = -[NSString copyWithZone:](currencyGroupingSeparator, "copyWithZone:", 0);
      -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("currencyGroupingSeparator"));
      ++self->_cacheGeneration;
      if (v6)
      {
        if (v7 && (formatter = self->_formatter) != 0)
        {
          CFNumberFormatterSetProperty(formatter, v6, v7);
        }
        else if (!v7)
        {
          -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
        }
      }
      self->_stateBitMask |= 1uLL;
    }
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (BOOL)isLenient
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFNumberFormatter *formatter;
  char v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("lenient"));
  v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      v5 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4)
      goto LABEL_5;
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    v7 = 0;
    goto LABEL_10;
  }
  v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B130]);
LABEL_9:
  v7 = objc_msgSend(v5, "BOOLValue");
LABEL_10:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (void)setLenient:(BOOL)lenient
{
  const void **v4;
  const void *v5;
  __CFNumberFormatter *formatter;

  if (lenient)
    v4 = (const void **)MEMORY[0x1E0C9AE50];
  else
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  -[NSRecursiveLock lock](self->_lock, "lock");
  if ((self->_stateBitMask & 2) == 0)
  {
    v5 = *v4;
    ++self->_cacheGeneration;
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, CFSTR("lenient"));
    formatter = self->_formatter;
    if (formatter)
      CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B130], v5);
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (BOOL)usesSignificantDigits
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFNumberFormatter *formatter;
  char v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesSignificantDigits"));
  v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      v5 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4)
      goto LABEL_5;
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    v7 = 0;
    goto LABEL_10;
  }
  v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1F0]);
LABEL_9:
  v7 = objc_msgSend(v5, "BOOLValue");
LABEL_10:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (NSUInteger)minimumSignificantDigits
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumSignificantDigits"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B168];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (NSUInteger)maximumSignificantDigits
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("maximumSignificantDigits"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B148];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (NSUInteger)v4;
}

- (BOOL)isPartialStringValidationEnabled
{
  void *v3;
  char v4;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("partialStringValidationEnabled"));
  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v4;
}

- (void)setPartialStringValidationEnabled:(BOOL)partialStringValidationEnabled
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = partialStringValidationEnabled;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if ((self->_stateBitMask & 2) == 0)
  {
    if (v3)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    ++self->_cacheGeneration;
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, CFSTR("partialStringValidationEnabled"));
    -[NSRecursiveLock unlock](self->_lock, "unlock");
  }
}

- (BOOL)_usesCharacterDirection
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CFNumberFormatter *formatter;
  char v7;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (_CFLocaleGetNoteCount() != self->_counter)
    -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
  v3 = -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesCharacterDirection"));
  v4 = (void *)v3;
  if (self->_formatter)
  {
    if (v3)
    {
LABEL_5:
      v5 = v4;
      goto LABEL_9;
    }
  }
  else
  {
    -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
    if (v4)
      goto LABEL_5;
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    v7 = 0;
    goto LABEL_10;
  }
  v5 = (id)CFNumberFormatterCopyProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1F8]);
LABEL_9:
  v7 = objc_msgSend(v5, "BOOLValue");
LABEL_10:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v7;
}

- (void)_setUsesCharacterDirection:(BOOL)a3
{
  const void **v4;
  const void *v5;
  __CFNumberFormatter *formatter;

  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  -[NSRecursiveLock lock](self->_lock, "lock");
  ++self->_cacheGeneration;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v5, CFSTR("usesCharacterDirection"));
  formatter = self->_formatter;
  if (formatter)
    CFNumberFormatterSetProperty(formatter, (CFNumberFormatterKey)*MEMORY[0x1E0C9B1F8], v5);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (int64_t)minimumGroupingDigits
{
  void *v3;
  const __CFString *v4;
  const __CFString **v6;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumGroupingDigits"));
  if (!v3)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9B158];
    if (_CFLocaleGetNoteCount() != self->_counter)
      -[NSNumberFormatter _clearFormatter](self, "_clearFormatter");
    v4 = *v6;
    if (self->_formatter)
    {
      if (!v4)
        goto LABEL_3;
    }
    else
    {
      -[NSNumberFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (!v4)
        goto LABEL_3;
    }
    formatter = self->_formatter;
    if (!formatter)
    {
      v4 = 0;
      goto LABEL_3;
    }
    v3 = (id)CFNumberFormatterCopyProperty(formatter, v4);
  }
  v4 = (const __CFString *)objc_msgSend(v3, "integerValue");
LABEL_3:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return (int64_t)v4;
}

- (void)setMinimumGroupingDigits:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  NSNumber *v7;
  __CFNumberFormatter *formatter;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("minimumGroupingDigits"));
  if (!v5 || objc_msgSend(v5, "integerValue") != a3)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9B158];
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("minimumGroupingDigits"));
    ++self->_cacheGeneration;
    if (v6)
    {
      formatter = self->_formatter;
      if (formatter)
        CFNumberFormatterSetProperty(formatter, v6, v7);
    }
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)receiveObservedValue:(id)a3
{
  objc_super v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((_NSIsNSNumber() & 1) == 0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSObservationFormatterSupport.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!value || _NSIsNSNumber(value)"));
    v6.receiver = self;
    v6.super_class = (Class)NSNumberFormatter;
    -[NSNumberFormatter receiveObservedValue:](&v6, sel_receiveObservedValue_, -[NSNumberFormatter stringFromNumber:](self, "stringFromNumber:", a3));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSNumberFormatter;
    -[NSNumberFormatter receiveObservedValue:](&v7, sel_receiveObservedValue_, 0);
  }
}

@end
