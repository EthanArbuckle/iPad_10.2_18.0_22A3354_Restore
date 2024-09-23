@implementation NSDateFormatter

- (NSString)stringFromDate:(NSDate *)date
{
  if (date)
    return (NSString *)-[NSDateFormatter stringForObjectValue:](self, "stringForObjectValue:");
  else
    return 0;
}

- (id)stringForObjectValue:(id)a3
{
  uint64_t NoteCount;
  uint64_t v6;
  __CFDateFormatter *formatter;
  __CFString *StringWithDate;
  __CFString *v9;
  _NSStringProxyForContext *v10;
  id *v11;

  if (!a3 || !_NSIsNSDate())
    return 0;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v6 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v6 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  formatter = self->_formatter;
  if (formatter
    && (StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], formatter, (CFDateRef)a3)) != 0)
  {
    v9 = StringWithDate;
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formattingContext")), "intValue") == -1)
  {
    v10 = objc_alloc_init(_NSStringProxyForContext);
    -[_NSStringProxyForContext setString:](v10, "setString:", v9);
    -[_NSStringProxyForContext setItem:](v10, "setItem:", a3);
    v11 = (id *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "init");
    objc_msgSend(v11[1], "setDictionary:", self->_attributes);
    -[_NSStringProxyForContext _retainFormatter:](v10, "_retainFormatter:", v11);

    v9 = v10;
  }
  os_unfair_lock_unlock(&self->_lock);
  return v9;
}

- (void)_regenerateFormatterIfAbsent
{
  if (!self->_formatter)
    -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
}

- (BOOL)generatesCalendarDates
{
  os_unfair_lock_s *p_lock;
  void *v4;
  char v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("generatesCalendarDates"));
  if (v4)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

+ (id)_componentsFromFormatString:(id)a3
{
  uint64_t v4;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  NSString *v7;
  uint64_t v8;
  UniChar v9;
  int64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  UniChar v17;
  int v18;
  int v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  void *v28;
  void *v29;
  uint64_t i;
  UniChar buffer[8];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CFStringRef theString;
  const UniChar *v40;
  const char *v41;
  uint64_t v42;
  int64_t v43;
  int64_t v44;
  int64_t v45;
  uint64_t v46;
  CFRange v47;

  v46 = *MEMORY[0x1E0C80C00];
  v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = objc_msgSend(a3, "length");
  if (qword_1ECD09500 != -1)
    dispatch_once(&qword_1ECD09500, &__block_literal_global_7);
  v28 = (void *)_MergedGlobals_5;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)buffer = 0u;
  v32 = 0u;
  theString = (CFStringRef)a3;
  v42 = 0;
  v43 = v4;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  CStringPtr = 0;
  v40 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  v44 = 0;
  v45 = 0;
  v41 = CStringPtr;
  v7 = +[NSString string](NSMutableString, "string");
  if (v4 < 1)
  {
    v11 = 0;
    v20 = 0;
    v18 = 1;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 1;
    v14 = 64;
    for (i = v4; i != v10; v20 = i)
    {
      if ((unint64_t)v10 >= 4)
        v15 = 4;
      else
        v15 = v10;
      v16 = v43;
      if (v43 <= v10)
      {
        v17 = 0;
      }
      else if (v40)
      {
        v17 = v40[v10 + v42];
      }
      else if (v41)
      {
        v17 = v41[v42 + v10];
      }
      else
      {
        v21 = v44;
        if (v45 <= v10 || v44 > v10)
        {
          v23 = v15 + v8;
          v24 = v14 - v15;
          v25 = v10 - v15;
          v26 = v25 + 64;
          if (v25 + 64 >= v43)
            v26 = v43;
          v44 = v25;
          v45 = v26;
          if (v43 >= v24)
            v16 = v24;
          v47.length = v16 + v23;
          v47.location = v25 + v42;
          CFStringGetCharacters(theString, v47, buffer);
          v21 = v44;
        }
        v17 = buffer[v10 - v21];
      }
      if ((v12 & 1) != 0)
        v18 = 0;
      else
        v18 = objc_msgSend(v28, "characterIsMember:", v17);
      if ((v18 & 1) == 0 && ((v13 ^ 1) & 1) == 0 || (v17 != v9 ? (v19 = v18) : (v19 = 0), v19 == 1))
      {
        if (v10 > v11)
        {
          objc_msgSend(v29, "addObject:", _CreateComponent((uint64_t)v7, v11, v10 - v11, (v13 ^ 1) & 1));
          v7 = +[NSString string](NSMutableString, "string");
          v11 = v10;
        }
      }
      if (v17 == 39)
      {
        if (v9 == 39)
          -[NSString appendString:](v7, "appendString:", CFSTR("'"));
        v12 ^= 1u;
      }
      else
      {
        -[NSString appendFormat:](v7, "appendFormat:", CFSTR("%C"), v17);
      }
      ++v10;
      --v8;
      ++v14;
      v9 = v17;
      v13 = v18;
    }
  }
  if (-[NSString length](v7, "length"))
    objc_msgSend(v29, "addObject:", _CreateComponent((uint64_t)v7, v11, v20 - v11, v18 ^ 1u));
  return v29;
}

- (void)setLocalizedDateFormatFromTemplate:(NSString *)dateFormatTemplate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDateFormatter _setDateFormat:alreadyLocked:](self, "_setDateFormat:alreadyLocked:", _dateFormatFromTemplate((const __CFString *)dateFormatTemplate, 0, (CFLocaleRef)-[NSDateFormatter _getLocaleAlreadyLocked:](self, "_getLocaleAlreadyLocked:", 1)), 1);
  os_unfair_lock_unlock(p_lock);
}

- (void)_setDateFormat:(id)a3 alreadyLocked:(BOOL)a4
{
  void *v7;
  const __CFString *v8;
  __CFDateFormatter *formatter;

  if (!a4)
    os_unfair_lock_lock(&self->_lock);
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateFormat"));
  if ((!a3 || v7) && (objc_msgSend(v7, "isEqualToString:", a3) & 1) != 0)
    goto LABEL_11;
  ++self->_cacheGeneration;
  v8 = (const __CFString *)(id)objc_msgSend(a3, "copyWithZone:", 0);
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v8, CFSTR("dateFormat"));
  if (!v8 || (formatter = self->_formatter) == 0)
  {
    if (!v8)
    {
      -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      if (a4)
        return;
LABEL_14:
      os_unfair_lock_unlock(&self->_lock);
      return;
    }
LABEL_11:
    if (a4)
      return;
    goto LABEL_14;
  }
  CFDateFormatterSetFormat(formatter, v8);
  if (!a4)
    goto LABEL_14;
}

- (id)_getLocaleAlreadyLocked:(BOOL)a3
{
  uint64_t NoteCount;
  uint64_t v6;
  CFLocaleRef Locale;
  __CFDateFormatter *formatter;
  const __CFLocale *v9;

  if (!a3)
    os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v6 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v6 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  Locale = (CFLocaleRef)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("locale"));
  if (!Locale)
  {
    formatter = self->_formatter;
    if (formatter)
      Locale = CFDateFormatterGetLocale(formatter);
    else
      Locale = 0;
  }
  v9 = Locale;
  if (!a3)
    os_unfair_lock_unlock(&self->_lock);
  return Locale;
}

- (void)setTimeStyle:(NSDateFormatterStyle)timeStyle
{
  os_unfair_lock_s *p_lock;
  void *v6;
  NSNumber *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("timeStyle"));
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", timeStyle);
  if (!v6
    || !objc_msgSend(v6, "isEqualToNumber:", v7)
    || -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateFormat")))
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("timeStyle"));
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", 0, CFSTR("dateFormat"));
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v3.receiver = self;
  v3.super_class = (Class)NSDateFormatter;
  -[NSDateFormatter dealloc](&v3, sel_dealloc);
}

- (void)_regenerateFormatter
{
  uint64_t NoteCount;
  uint64_t v4;
  const __CFLocale *v5;
  void *v6;
  void *v7;
  const __CFAllocator **v8;
  const __CFAllocator *v9;
  CFDateFormatterStyle v10;
  __CFDateFormatter *v11;
  const __CFString *v12;
  const void *v13;
  const void *v14;
  const void *v15;
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
  void *v41;
  const void *v42;

  -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  NoteCount = _CFLocaleGetNoteCount();
  v4 = _CFTimeZoneGetNoteCount() + NoteCount;
  self->_counter = v4 + _CFCalendarGetMidnightNoteCount();
  v5 = (const __CFLocale *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("locale"));
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateStyle"));
  v7 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("timeStyle"));
  v8 = (const __CFAllocator **)MEMORY[0x1E0C9AE30];
  if (!v5)
    v5 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = *v8;
  if (v6)
    v6 = (void *)objc_msgSend(v6, "integerValue");
  if (v7)
    v10 = objc_msgSend(v7, "integerValue");
  else
    v10 = kCFDateFormatterNoStyle;
  v11 = CFDateFormatterCreate(v9, v5, (CFDateFormatterStyle)v6, v10);
  self->_formatter = v11;
  if (v11)
  {
    v12 = (const __CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateFormat"));
    if (v12)
      CFDateFormatterSetFormat(self->_formatter, v12);
    v13 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("timeZone"));
    if (v13)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF68], v13);
    v14 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("calendar"));
    if (v14)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AED0], v14);
    v15 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("lenient"));
    if (v15)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AEF8], v15);
    v16 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("twoDigitStartDate"));
    if (v16)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF70], v16);
    v17 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("defaultDate"));
    if (v17)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AED8], v17);
    v18 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("eraSymbols"));
    if (v18)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AEE8], v18);
    v19 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("monthSymbols"));
    if (v19)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF08], v19);
    v20 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortMonthSymbols"));
    if (v20)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF20], v20);
    v21 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("weekdaySymbols"));
    if (v21)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AFA0], v21);
    v22 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortWeekdaySymbols"));
    if (v22)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF48], v22);
    v23 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("AMSymbol"));
    if (v23)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AEC8], v23);
    v24 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("PMSymbol"));
    if (v24)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF10], v24);
    v25 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("longEraSymbols"));
    if (v25)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF00], v25);
    v26 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortMonthSymbols"));
    if (v26)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF80], v26);
    v27 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneMonthSymbols"));
    if (v27)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF50], v27);
    v28 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneMonthSymbols"));
    if (v28)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF30], v28);
    v29 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortStandaloneMonthSymbols"));
    if (v29)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF88], v29);
    v30 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortWeekdaySymbols"));
    if (v30)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF98], v30);
    v31 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneWeekdaySymbols"));
    if (v31)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF60], v31);
    v32 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneWeekdaySymbols"));
    if (v32)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF40], v32);
    v33 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortStandaloneWeekdaySymbols"));
    if (v33)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF90], v33);
    v34 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("quarterSymbols"));
    if (v34)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF18], v34);
    v35 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortQuarterSymbols"));
    if (v35)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF28], v35);
    v36 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneQuarterSymbols"));
    if (v36)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF58], v36);
    v37 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneQuarterSymbols"));
    if (v37)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF38], v37);
    v38 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("gregorianStartDate"));
    if (v38)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AEF0], v38);
    v39 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("doesRelativeDateFormatting"));
    if (v39)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AEE0], v39);
    v40 = (const void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesCharacterDirection"));
    if (v40)
      CFDateFormatterSetProperty(self->_formatter, (CFStringRef)*MEMORY[0x1E0C9AF78], v40);
    v41 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formattingContext"));
    if (v41)
    {
      v42 = v41;
      if (objc_msgSend(v41, "intValue") != -1)
        CFDateFormatterSetProperty(self->_formatter, CFSTR("kCFDateFormatterFormattingContextKey"), v42);
    }
  }
}

- (void)_clearFormatter
{
  __CFDateFormatter *formatter;

  formatter = self->_formatter;
  if (formatter)
    CFRelease(formatter);
  self->_formatter = 0;
  ++self->_cacheGeneration;
}

- (NSDateFormatter)init
{
  NSDateFormatter *v2;
  NSDateFormatter *v3;
  NSMutableDictionary *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSDateFormatter;
  v2 = -[NSDateFormatter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
    v3->_attributes = v4;
    -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "defaultFormatterBehavior")), CFSTR("formatterBehavior"));
  }
  return v3;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("timeZone"));
  if ((timeZone == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", timeZone) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF68];
    ++self->_cacheGeneration;
    v7 = (id)-[NSTimeZone copyWithZone:](timeZone, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("timeZone"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

+ (NSDateFormatterBehavior)defaultFormatterBehavior
{
  return __NSDateFormatterDefaultBehavior;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  char v4;
  uint64_t v5;
  const __CFString *v6;
  NSNumber *v7;
  void *v8;
  id v9;
  __CFDateFormatter *formatter;

  switch(formattingContext)
  {
    case NSFormattingContextUnknown:
      v4 = 0;
      v5 = 256;
      goto LABEL_9;
    case NSFormattingContextDynamic:
      v6 = 0;
      v5 = 0xFFFFFFFFLL;
      v4 = 1;
      goto LABEL_10;
    case NSFormattingContextStandalone:
      v4 = 0;
      v5 = 260;
      goto LABEL_9;
    case NSFormattingContextListItem:
      v4 = 0;
      v5 = 259;
      goto LABEL_9;
    case NSFormattingContextBeginningOfSentence:
      v4 = 0;
      v5 = 258;
      goto LABEL_9;
    case NSFormattingContextMiddleOfSentence:
      v4 = 0;
      v5 = 257;
      goto LABEL_9;
    default:
      v4 = 0;
      v5 = 0;
LABEL_9:
      v6 = CFSTR("kCFDateFormatterFormattingContextKey");
LABEL_10:
      v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5);
      os_unfair_lock_lock(&self->_lock);
      v8 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formattingContext"));
      if ((v7 == 0) == (v8 != 0) || (objc_msgSend(v8, "isEqual:", v7) & 1) == 0)
      {
        ++self->_cacheGeneration;
        v9 = -[NSNumber copyWithZone:](v7, "copyWithZone:", 0);
        -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v9, CFSTR("formattingContext"));
        if ((v4 & 1) == 0)
        {
          if (v9 && (formatter = self->_formatter) != 0)
          {
            CFDateFormatterSetProperty(formatter, v6, v9);
          }
          else if (!v9)
          {
            -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
          }
        }
      }
      os_unfair_lock_unlock(&self->_lock);
      return;
  }
}

- (void)setCalendar:(NSCalendar *)calendar
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("calendar"));
  if ((calendar == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", calendar) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AED0];
    ++self->_cacheGeneration;
    v7 = (id)-[NSCalendar copyWithZone:](calendar, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("calendar"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

+ (NSString)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dstyle timeStyle:(NSDateFormatterStyle)tstyle
{
  void *v8;
  NSString *v9;

  if (!date)
    return 0;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setFormatterBehavior:", 1040);
  objc_msgSend(v8, "setDateStyle:", dstyle);
  objc_msgSend(v8, "setTimeStyle:", tstyle);
  v9 = (NSString *)objc_msgSend(v8, "stringForObjectValue:", date);

  return v9;
}

- (void)setDateStyle:(NSDateFormatterStyle)dateStyle
{
  os_unfair_lock_s *p_lock;
  void *v6;
  NSNumber *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateStyle"));
  v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", dateStyle);
  if (!v6
    || !objc_msgSend(v6, "isEqualToNumber:", v7)
    || -[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateFormat")))
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("dateStyle"));
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", 0, CFSTR("dateFormat"));
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setLocale:(NSLocale *)locale
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("locale"));
  if (locale && !v6 || (objc_msgSend(v6, "isEqual:", locale) & 1) == 0)
  {
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", (id)-[NSLocale copyWithZone:](locale, "copyWithZone:", 0), CFSTR("locale"));
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)dateFormat
{
  os_unfair_lock_s *p_lock;
  uint64_t NoteCount;
  uint64_t v5;
  __CFString *Format;
  __CFDateFormatter *formatter;
  __CFString *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  Format = (__CFString *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateFormat"));
  if (!Format)
  {
    formatter = self->_formatter;
    if (formatter)
      Format = (__CFString *)CFDateFormatterGetFormat(formatter);
    else
      Format = 0;
  }
  v8 = Format;
  os_unfair_lock_unlock(p_lock);
  return (NSString *)Format;
}

- (void)setDateFormat:(NSString *)dateFormat
{
  -[NSDateFormatter _setDateFormat:alreadyLocked:](self, "_setDateFormat:alreadyLocked:", dateFormat, 0);
}

- (NSDate)dateFromString:(NSString *)string
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!string)
    return 0;
  v4[0] = 0;
  if (-[NSDateFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", v4, string, 0))
  {
    return (NSDate *)v4[0];
  }
  else
  {
    return 0;
  }
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  objc_class *v9;
  objc_class *v10;
  IMP MethodImplementation;
  NSError **v12;
  char ObjectValue;
  BOOL v14;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x1E0C80C00];
  v16[0] = 0;
  if (!getObjectValue_forString_errorDescription__baseIMP)
  {
    v9 = objc_lookUpClass("NSDateFormatter");
    getObjectValue_forString_errorDescription__baseIMP = (uint64_t)class_getMethodImplementation(v9, sel_getObjectValue_forString_range_error_);
  }
  v10 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v10, sel_getObjectValue_forString_range_error_);
  if (a5)
    v12 = (NSError **)v16;
  else
    v12 = 0;
  if (MethodImplementation == (IMP)getObjectValue_forString_errorDescription__baseIMP)
    ObjectValue = getObjectValue((uint64_t)self, a3, (__CFString *)a4, 0, 1, v12);
  else
    ObjectValue = -[NSDateFormatter getObjectValue:forString:range:error:](self, "getObjectValue:forString:range:error:", a3, a4, 0, v12);
  v14 = ObjectValue;
  if (a5)
    *a5 = (id)objc_msgSend(v16[0], "localizedDescription");
  return v14;
}

+ (NSString)dateFormatFromTemplate:(NSString *)tmplate options:(NSUInteger)opts locale:(NSLocale *)locale
{
  return (NSString *)_dateFormatFromTemplate((const __CFString *)tmplate, opts, (CFLocaleRef)locale);
}

- (NSString)PMSymbol
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("PMSymbol"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF10];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSString *)v4;
}

- (NSString)AMSymbol
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("AMSymbol"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AEC8];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSString *)v4;
}

+ (void)setDefaultFormatterBehavior:(NSDateFormatterBehavior)defaultFormatterBehavior
{
  NSDateFormatterBehavior v3;

  v3 = NSDateFormatterBehavior10_4;
  if (defaultFormatterBehavior)
    v3 = defaultFormatterBehavior;
  __NSDateFormatterDefaultBehavior = v3;
}

+ (void)initialize
{
  if (!__NSDateFormatterDefaultBehavior)
    objc_msgSend(a1, "setDefaultFormatterBehavior:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  id *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v6[1], "setDictionary:", self->_attributes);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "_clearFormatter");
  return v6;
}

- (NSFormattingContext)formattingContext
{
  __CFDateFormatter *formatter;
  uint64_t NoteCount;
  uint64_t v5;
  __CFDateFormatter *v6;
  __CFDateFormatter *v7;
  int v8;
  NSFormattingContext result;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formattingContext"));
  if (!formatter)
  {
    NoteCount = _CFLocaleGetNoteCount();
    v5 = _CFTimeZoneGetNoteCount() + NoteCount;
    if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter)
      -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
    formatter = self->_formatter;
    if (formatter
      || (-[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter"), (formatter = self->_formatter) != 0))
    {
      formatter = (id)CFDateFormatterCopyProperty(formatter, CFSTR("kCFDateFormatterFormattingContextKey"));
    }
  }
  v6 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  v7 = v6;
  v8 = -[__CFDateFormatter intValue](v7, "intValue");
  if (!v7 && self->_formatter)
    v8 = objc_msgSend((id)(id)CFDateFormatterCopyProperty(self->_formatter, CFSTR("kCFDateFormatterFormattingContextKey")), "intValue");
  switch(v8)
  {
    case 256:
      goto LABEL_14;
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
      if (v8 == -1)
        result = NSFormattingContextDynamic;
      else
LABEL_14:
        result = NSFormattingContextUnknown;
      break;
  }
  return result;
}

- (NSTimeZone)timeZone
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("timeZone"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF68];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSTimeZone *)v4;
}

- (void)setDoesRelativeDateFormatting:(BOOL)doesRelativeDateFormatting
{
  void **v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  __CFDateFormatter *formatter;
  BOOL v10;

  v4 = (void **)MEMORY[0x1E0C9AE50];
  if (!doesRelativeDateFormatting)
    v4 = (void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("doesRelativeDateFormatting"));
  if ((v5 == 0) == (v6 != 0) || (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    v7 = (const __CFString *)*MEMORY[0x1E0C9AEE0];
    ++self->_cacheGeneration;
    v8 = (id)objc_msgSend(v5, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v8, CFSTR("doesRelativeDateFormatting"));
    if (v7)
    {
      formatter = self->_formatter;
      if (v8)
        v10 = formatter == 0;
      else
        v10 = 1;
      if (v10)
      {
        if (!v8)
          -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSCalendar)calendar
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("calendar"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AED0];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSCalendar *)v4;
}

- (void)_invalidateCache
{
  ++self->_cacheGeneration;
}

- (void)_reset
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  v4 = (NSMutableDictionary *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), "initWithCapacity:", 20);
  self->_attributes = v4;
  -[NSMutableDictionary setValue:forKey:](v4, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "defaultFormatterBehavior")), CFSTR("formatterBehavior"));
  -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  os_unfair_lock_unlock(p_lock);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSDateFormatter;
  -[NSFormatter encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateFormatters cannot be encoded by non-keyed archivers"), 0));
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(a3, "encodeObject:forKey:", self->_attributes, CFSTR("NS.attributes"));
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDateFormatter)initWithCoder:(id)a3
{
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  NSMutableDictionary *attributes;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)NSDateFormatter;
  v4 = -[NSFormatter initWithCoder:](&v11, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateFormatters cannot be decoded by non-keyed archivers"), 0));
    }
    v6 = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NS.attributes"));
    v5->_attributes = v6;
    v7 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v6, "objectForKey:", CFSTR("formatterBehavior")), "integerValue");
    if (v7 != 1040)
    {
      attributes = v5->_attributes;
      if (v7)
        v9 = 1040;
      else
        v9 = objc_msgSend((id)objc_opt_class(), "defaultFormatterBehavior");
      -[NSMutableDictionary setValue:forKey:](attributes, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9), CFSTR("formatterBehavior"));
    }
    -[NSDateFormatter _clearFormatter](v5, "_clearFormatter");
  }
  return v5;
}

- (id)_timeZone_forOldMethods
{
  objc_class *v3;
  objc_class *v4;
  void (*MethodImplementation)(void);

  v3 = (objc_class *)objc_opt_class();
  if ((-[NSDateFormatter isMemberOfClass:](self, "isMemberOfClass:", v3) & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v4, sel_timeZone);
  if (MethodImplementation == class_getMethodImplementation(v3, sel_timeZone))
    return (id)objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  else
    return -[NSDateFormatter timeZone](self, "timeZone");
}

- (id)_locale_forOldMethods
{
  if (_CFExecutableLinkedOnOrAfter())
    return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  else
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "dictionaryRepresentation");
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string range:(NSRange *)rangep error:(NSError *)error
{
  return getObjectValue((uint64_t)self, obj, (__CFString *)string, (CFIndex *)rangep, 0, error);
}

- (NSDateFormatterStyle)dateStyle
{
  os_unfair_lock_s *p_lock;
  uint64_t NoteCount;
  uint64_t v5;
  void *v6;
  CFDateFormatterStyle DateStyle;
  __CFDateFormatter *formatter;
  NSDateFormatterStyle v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateStyle"));
  if (v6)
  {
    DateStyle = objc_msgSend(v6, "integerValue");
  }
  else
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      v9 = NSDateFormatterNoStyle;
      goto LABEL_8;
    }
    DateStyle = CFDateFormatterGetDateStyle(formatter);
  }
  v9 = DateStyle;
LABEL_8:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (NSDateFormatterStyle)timeStyle
{
  os_unfair_lock_s *p_lock;
  uint64_t NoteCount;
  uint64_t v5;
  void *v6;
  CFDateFormatterStyle TimeStyle;
  __CFDateFormatter *formatter;
  NSDateFormatterStyle v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("timeStyle"));
  if (v6)
  {
    TimeStyle = objc_msgSend(v6, "integerValue");
  }
  else
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      v9 = NSDateFormatterNoStyle;
      goto LABEL_8;
    }
    TimeStyle = CFDateFormatterGetTimeStyle(formatter);
  }
  v9 = TimeStyle;
LABEL_8:
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (NSLocale)locale
{
  return (NSLocale *)-[NSDateFormatter _getLocaleAlreadyLocked:](self, "_getLocaleAlreadyLocked:", 0);
}

- (void)setGeneratesCalendarDates:(BOOL)generatesCalendarDates
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  _QWORD *v6;

  v3 = generatesCalendarDates;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  v6 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v6 = (_QWORD *)MEMORY[0x1E0C9AE40];
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", *v6, CFSTR("generatesCalendarDates"));
  os_unfair_lock_unlock(p_lock);
}

- (NSDateFormatterBehavior)formatterBehavior
{
  return 1040;
}

- (id)_dateFormat
{
  os_unfair_lock_s *p_lock;
  uint64_t NoteCount;
  uint64_t v5;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("dateFormat"));
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_setDateFormat:(id)a3
{
  os_unfair_lock_s *p_lock;
  const __CFString *v6;
  __CFDateFormatter *formatter;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  v6 = (const __CFString *)(id)objc_msgSend(a3, "copyWithZone:", 0);
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v6, CFSTR("dateFormat"));
  formatter = self->_formatter;
  if (formatter)
    CFDateFormatterSetFormat(formatter, v6);
  os_unfair_lock_unlock(p_lock);
}

- (void)_setIsLenient:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  _QWORD *v6;
  const void *v7;
  __CFDateFormatter *formatter;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  ++self->_cacheGeneration;
  v6 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!v3)
    v6 = (_QWORD *)MEMORY[0x1E0C9AE40];
  v7 = (const void *)*v6;
  -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", *v6, CFSTR("lenient"));
  formatter = self->_formatter;
  if (formatter)
    CFDateFormatterSetProperty(formatter, (CFStringRef)*MEMORY[0x1E0C9AEF8], v7);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isLenient
{
  os_unfair_lock_s *p_lock;
  uint64_t NoteCount;
  uint64_t v5;
  void *v6;
  __CFDateFormatter *formatter;
  char v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("lenient"));
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x1E0C9AEF8]);
  }
  v8 = objc_msgSend(v6, "BOOLValue");
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)setLenient:(BOOL)lenient
{
  void **v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  __CFDateFormatter *formatter;
  BOOL v10;

  v4 = (void **)MEMORY[0x1E0C9AE50];
  if (!lenient)
    v4 = (void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("lenient"));
  if ((v5 == 0) == (v6 != 0) || (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    v7 = (const __CFString *)*MEMORY[0x1E0C9AEF8];
    ++self->_cacheGeneration;
    v8 = (id)objc_msgSend(v5, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v8, CFSTR("lenient"));
    if (v7)
    {
      formatter = self->_formatter;
      if (v8)
        v10 = formatter == 0;
      else
        v10 = 1;
      if (v10)
      {
        if (!v8)
          -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)twoDigitStartDate
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("twoDigitStartDate"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF70];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSDate *)v4;
}

- (void)setTwoDigitStartDate:(NSDate *)twoDigitStartDate
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("twoDigitStartDate"));
  if ((twoDigitStartDate == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", twoDigitStartDate) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF70];
    ++self->_cacheGeneration;
    v7 = (id)-[NSDate copyWithZone:](twoDigitStartDate, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("twoDigitStartDate"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)defaultDate
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("defaultDate"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AED8];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSDate *)v4;
}

- (void)setDefaultDate:(NSDate *)defaultDate
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("defaultDate"));
  if ((defaultDate == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", defaultDate) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AED8];
    ++self->_cacheGeneration;
    v7 = (id)-[NSDate copyWithZone:](defaultDate, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("defaultDate"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)eraSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("eraSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AEE8];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setEraSymbols:(NSArray *)eraSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("eraSymbols"));
  if ((eraSymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", eraSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AEE8];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](eraSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("eraSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)monthSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("monthSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF08];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setMonthSymbols:(NSArray *)monthSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("monthSymbols"));
  if ((monthSymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", monthSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF08];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](monthSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("monthSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortMonthSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  if (!self->_attributes && _CFAppVersionCheckLessThan())
  {
    -[NSDateFormatter init](self, "init");
    _NSDateFormatterNoInit();
  }
  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortMonthSymbols"));
  if (!formatter)
  {
    v6 = (const __CFString **)MEMORY[0x1E0C9AF20];
    NoteCount = _CFLocaleGetNoteCount();
    v8 = _CFTimeZoneGetNoteCount() + NoteCount;
    if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
      -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
    v9 = *v6;
    if (self->_formatter)
    {
      if (v9)
        goto LABEL_10;
    }
    else
    {
      -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
      if (v9)
      {
LABEL_10:
        formatter = self->_formatter;
        if (formatter)
          formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
        goto LABEL_5;
      }
    }
    formatter = 0;
  }
LABEL_5:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortMonthSymbols:(NSArray *)shortMonthSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortMonthSymbols"));
  if ((shortMonthSymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", shortMonthSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF20];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](shortMonthSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("shortMonthSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)weekdaySymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("weekdaySymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AFA0];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setWeekdaySymbols:(NSArray *)weekdaySymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("weekdaySymbols"));
  if ((weekdaySymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", weekdaySymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AFA0];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](weekdaySymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("weekdaySymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortWeekdaySymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortWeekdaySymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF48];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortWeekdaySymbols:(NSArray *)shortWeekdaySymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortWeekdaySymbols"));
  if ((shortWeekdaySymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", shortWeekdaySymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF48];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](shortWeekdaySymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("shortWeekdaySymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setAMSymbol:(NSString *)AMSymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("AMSymbol"));
  if ((AMSymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", AMSymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AEC8];
    ++self->_cacheGeneration;
    v7 = -[NSString copyWithZone:](AMSymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("AMSymbol"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPMSymbol:(NSString *)PMSymbol
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("PMSymbol"));
  if ((PMSymbol == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", PMSymbol) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF10];
    ++self->_cacheGeneration;
    v7 = -[NSString copyWithZone:](PMSymbol, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("PMSymbol"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)longEraSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("longEraSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF00];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setLongEraSymbols:(NSArray *)longEraSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("longEraSymbols"));
  if ((longEraSymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", longEraSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF00];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](longEraSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("longEraSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortMonthSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortMonthSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF80];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setVeryShortMonthSymbols:(NSArray *)veryShortMonthSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortMonthSymbols"));
  if ((veryShortMonthSymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", veryShortMonthSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF80];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](veryShortMonthSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("veryShortMonthSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneMonthSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneMonthSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF50];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setStandaloneMonthSymbols:(NSArray *)standaloneMonthSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneMonthSymbols"));
  if ((standaloneMonthSymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", standaloneMonthSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF50];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](standaloneMonthSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("standaloneMonthSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneMonthSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneMonthSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF30];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortStandaloneMonthSymbols:(NSArray *)shortStandaloneMonthSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneMonthSymbols"));
  if ((shortStandaloneMonthSymbols == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", shortStandaloneMonthSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF30];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](shortStandaloneMonthSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("shortStandaloneMonthSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortStandaloneMonthSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortStandaloneMonthSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF88];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setVeryShortStandaloneMonthSymbols:(NSArray *)veryShortStandaloneMonthSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortStandaloneMonthSymbols"));
  if ((veryShortStandaloneMonthSymbols == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", veryShortStandaloneMonthSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF88];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](veryShortStandaloneMonthSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("veryShortStandaloneMonthSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortWeekdaySymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortWeekdaySymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF98];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setVeryShortWeekdaySymbols:(NSArray *)veryShortWeekdaySymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortWeekdaySymbols"));
  if ((veryShortWeekdaySymbols == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", veryShortWeekdaySymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF98];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](veryShortWeekdaySymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("veryShortWeekdaySymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneWeekdaySymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneWeekdaySymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF60];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setStandaloneWeekdaySymbols:(NSArray *)standaloneWeekdaySymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneWeekdaySymbols"));
  if ((standaloneWeekdaySymbols == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", standaloneWeekdaySymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF60];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](standaloneWeekdaySymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("standaloneWeekdaySymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneWeekdaySymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneWeekdaySymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF40];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortStandaloneWeekdaySymbols:(NSArray *)shortStandaloneWeekdaySymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneWeekdaySymbols"));
  if ((shortStandaloneWeekdaySymbols == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", shortStandaloneWeekdaySymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF40];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](shortStandaloneWeekdaySymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("shortStandaloneWeekdaySymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)veryShortStandaloneWeekdaySymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortStandaloneWeekdaySymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF90];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setVeryShortStandaloneWeekdaySymbols:(NSArray *)veryShortStandaloneWeekdaySymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("veryShortStandaloneWeekdaySymbols"));
  if ((veryShortStandaloneWeekdaySymbols == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", veryShortStandaloneWeekdaySymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF90];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](veryShortStandaloneWeekdaySymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("veryShortStandaloneWeekdaySymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)quarterSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("quarterSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF18];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setQuarterSymbols:(NSArray *)quarterSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("quarterSymbols"));
  if ((quarterSymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", quarterSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF18];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](quarterSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("quarterSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortQuarterSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortQuarterSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF28];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortQuarterSymbols:(NSArray *)shortQuarterSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortQuarterSymbols"));
  if ((shortQuarterSymbols == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", shortQuarterSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF28];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](shortQuarterSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("shortQuarterSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)standaloneQuarterSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneQuarterSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF58];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setStandaloneQuarterSymbols:(NSArray *)standaloneQuarterSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("standaloneQuarterSymbols"));
  if ((standaloneQuarterSymbols == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", standaloneQuarterSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF58];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](standaloneQuarterSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("standaloneQuarterSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)shortStandaloneQuarterSymbols
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneQuarterSymbols"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AF38];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSArray *)v4;
}

- (void)setShortStandaloneQuarterSymbols:(NSArray *)shortStandaloneQuarterSymbols
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("shortStandaloneQuarterSymbols"));
  if ((shortStandaloneQuarterSymbols == 0) == (v5 != 0)
    || (objc_msgSend(v5, "isEqual:", shortStandaloneQuarterSymbols) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AF38];
    ++self->_cacheGeneration;
    v7 = (id)-[NSArray copyWithZone:](shortStandaloneQuarterSymbols, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("shortStandaloneQuarterSymbols"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)gregorianStartDate
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *v4;
  const __CFString **v6;
  uint64_t NoteCount;
  uint64_t v8;
  const __CFString *v9;

  os_unfair_lock_lock(&self->_lock);
  formatter = (__CFDateFormatter *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("gregorianStartDate"));
  if (formatter)
    goto LABEL_2;
  v6 = (const __CFString **)MEMORY[0x1E0C9AEF0];
  NoteCount = _CFLocaleGetNoteCount();
  v8 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v8 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  v9 = *v6;
  if (self->_formatter)
  {
    if (v9)
      goto LABEL_7;
LABEL_10:
    formatter = 0;
    goto LABEL_2;
  }
  -[NSDateFormatter _regenerateFormatter](self, "_regenerateFormatter");
  if (!v9)
    goto LABEL_10;
LABEL_7:
  formatter = self->_formatter;
  if (formatter)
    formatter = (id)CFDateFormatterCopyProperty(formatter, v9);
LABEL_2:
  v4 = formatter;
  os_unfair_lock_unlock(&self->_lock);
  return (NSDate *)v4;
}

- (void)setGregorianStartDate:(NSDate *)gregorianStartDate
{
  void *v5;
  const __CFString *v6;
  id v7;
  __CFDateFormatter *formatter;

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("gregorianStartDate"));
  if ((gregorianStartDate == 0) == (v5 != 0) || (objc_msgSend(v5, "isEqual:", gregorianStartDate) & 1) == 0)
  {
    v6 = (const __CFString *)*MEMORY[0x1E0C9AEF0];
    ++self->_cacheGeneration;
    v7 = (id)-[NSDate copyWithZone:](gregorianStartDate, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v7, CFSTR("gregorianStartDate"));
    if (v6)
    {
      if (v7 && (formatter = self->_formatter) != 0)
      {
        CFDateFormatterSetProperty(formatter, v6, v7);
      }
      else if (!v7)
      {
        -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)doesRelativeDateFormatting
{
  os_unfair_lock_s *p_lock;
  uint64_t NoteCount;
  uint64_t v5;
  void *v6;
  __CFDateFormatter *formatter;
  char v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("doesRelativeDateFormatting"));
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x1E0C9AEE0]);
  }
  v8 = objc_msgSend(v6, "BOOLValue");
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)_usesCharacterDirection
{
  os_unfair_lock_s *p_lock;
  uint64_t NoteCount;
  uint64_t v5;
  void *v6;
  __CFDateFormatter *formatter;
  char v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v5 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v5 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesCharacterDirection"));
  if (!v6)
  {
    formatter = self->_formatter;
    if (!formatter)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = (id)CFDateFormatterCopyProperty(formatter, (CFDateFormatterKey)*MEMORY[0x1E0C9AF78]);
  }
  v8 = objc_msgSend(v6, "BOOLValue");
LABEL_7:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_setUsesCharacterDirection:(BOOL)a3
{
  void **v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  __CFDateFormatter *formatter;
  BOOL v10;

  v4 = (void **)MEMORY[0x1E0C9AE50];
  if (!a3)
    v4 = (void **)MEMORY[0x1E0C9AE40];
  v5 = *v4;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("usesCharacterDirection"));
  if ((v5 == 0) == (v6 != 0) || (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    v7 = (const __CFString *)*MEMORY[0x1E0C9AF78];
    ++self->_cacheGeneration;
    v8 = (id)objc_msgSend(v5, "copyWithZone:", 0);
    -[NSMutableDictionary setValue:forKey:](self->_attributes, "setValue:forKey:", v8, CFSTR("usesCharacterDirection"));
    if (v7)
    {
      formatter = self->_formatter;
      if (v8)
        v10 = formatter == 0;
      else
        v10 = 1;
      if (v10)
      {
        if (!v8)
          -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
      }
      else
      {
        CFDateFormatterSetProperty(formatter, v7, v8);
      }
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)_cacheGenerationCount
{
  uint64_t NoteCount;
  uint64_t v4;

  if (!-[NSDateFormatter _tracksCacheGenerationCount](self, "_tracksCacheGenerationCount"))
    return -1;
  NoteCount = _CFLocaleGetNoteCount();
  v4 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v4 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  return self->_cacheGeneration;
}

- (BOOL)_tracksCacheGenerationCount
{
  return object_getClass(self) == (Class)NSDateFormatter;
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  objc_class *v5;
  IMP MethodImplementation;
  objc_class *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 && (_NSIsNSDate() & 1) != 0)
  {
    v5 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation(v7, sel_attributedStringForObjectValue_withDefaultAttributes_);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSDateFormatter;
    return -[NSFormatter _mayDecorateAttributedStringForObjectValue:](&v9, sel__mayDecorateAttributedStringForObjectValue_, a3);
  }
}

- (id)_attributedStringWithFieldsFromDate:(id)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t NoteCount;
  uint64_t v7;
  void *AttributedStringAndFieldsWithAbsoluteTime;
  NSMutableAttributedString *v9;
  _NSStringProxyForContext *v10;
  id *v11;
  NSMutableAttributedString *v12;
  uint64_t v13;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  if (!a3 || !_NSIsNSDate())
    return 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NoteCount = _CFLocaleGetNoteCount();
  v7 = _CFTimeZoneGetNoteCount() + NoteCount;
  if (v7 + _CFCalendarGetMidnightNoteCount() != self->_counter)
    -[NSDateFormatter _clearFormatter](self, "_clearFormatter");
  -[NSDateFormatter _regenerateFormatterIfAbsent](self, "_regenerateFormatterIfAbsent");
  if (self->_formatter)
  {
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    AttributedStringAndFieldsWithAbsoluteTime = (void *)_CFDateFormatterCreateAttributedStringAndFieldsWithAbsoluteTime();
  }
  else
  {
    AttributedStringAndFieldsWithAbsoluteTime = 0;
  }
  v9 = AttributedStringAndFieldsWithAbsoluteTime;
  if (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_attributes, "objectForKey:", CFSTR("formattingContext")), "intValue") == -1)
  {
    v10 = objc_alloc_init(_NSStringProxyForContext);
    -[_NSStringProxyForContext setString:](v10, "setString:", -[NSAttributedString string](v9, "string"));
    -[_NSStringProxyForContext setItem:](v10, "setItem:", a3);
    v11 = (id *)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "init");
    objc_msgSend(v11[1], "setDictionary:", self->_attributes);
    -[_NSStringProxyForContext _retainFormatter:](v10, "_retainFormatter:", v11);

    v12 = -[NSMutableAttributedString initWithString:]([NSMutableAttributedString alloc], "initWithString:", v10);
    v13 = -[NSAttributedString length](v9, "length");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__NSDateFormatter_Private___attributedStringWithFieldsFromDate___block_invoke;
    v15[3] = &unk_1E0F4D4C8;
    v15[4] = v12;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](v9, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v15);
    v9 = v12;
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

uint64_t __64__NSDateFormatter_Private___attributedStringWithFieldsFromDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

+ (id)_formatStringFromComponents:(id)a3
{
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = +[NSString string](NSMutableString, "string");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = *MEMORY[0x1E0C99740];
    v9 = *MEMORY[0x1E0C99730];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (NSString *)objc_msgSend(v11, "valueForKey:", v8);
        if ((objc_msgSend((id)objc_msgSend(v11, "valueForKey:", v9), "BOOLValue") & 1) != 0)
          goto LABEL_10;
        if (qword_1ECD09510 != -1)
          dispatch_once(&qword_1ECD09510, &__block_literal_global_302);
        if (-[NSString rangeOfCharacterFromSet:](v12, "rangeOfCharacterFromSet:", qword_1ECD09508) != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_10:
          v12 = -[NSString stringByReplacingOccurrencesOfString:withString:](v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''"));
          if (qword_1ECD09500 != -1)
            dispatch_once(&qword_1ECD09500, &__block_literal_global_7);
          if (-[NSString rangeOfCharacterFromSet:](v12, "rangeOfCharacterFromSet:", _MergedGlobals_5) != 0x7FFFFFFFFFFFFFFFLL)
            v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@'"), v12);
        }
        -[NSString appendString:](v4, "appendString:", v12);
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)_nextChangeDateAfterDate:(id)a3
{
  NSString *v5;
  uint64_t SkeletonFromTemplate;
  const void *v7;
  uint64_t UnitsFromDateFormat;
  uint64_t v9;
  uint64_t v10;
  NSDate *v11;
  NSObject *v12;
  NSCalendar *v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  const void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v5 = -[NSDateFormatter dateFormat](self, "dateFormat");
  if (!-[NSString length](v5, "length"))
    return 0;
  -[NSDateFormatter locale](self, "locale");
  SkeletonFromTemplate = _CFDateFormatterCreateSkeletonFromTemplate();
  if (!SkeletonFromTemplate)
    return 0;
  v7 = (const void *)SkeletonFromTemplate;
  UnitsFromDateFormat = _CFCalendarGetUnitsFromDateFormat();
  if (!UnitsFromDateFormat)
  {
    v12 = _NSOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v7;
      _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "Fail to get calendar units from date format %@; skeleton: %@",
        buf,
        0x16u);
    }
    CFRelease(v7);
    return 0;
  }
  v9 = 0;
  while (1)
  {
    v10 = qword_1821CAC20[v9];
    if ((v10 & UnitsFromDateFormat) != 0)
      break;
    if (++v9 == 14)
    {
      v11 = 0;
      goto LABEL_16;
    }
  }
  v14 = -[NSDateFormatter calendar](self, "calendar");
  v11 = -[NSCalendar nextDateAfterDate:matchingUnit:value:options:](v14, "nextDateAfterDate:matchingUnit:value:options:", a3, v10, -[NSCalendar component:fromDate:](v14, "component:fromDate:", v10, a3) + 1, 1024);
LABEL_16:
  CFRelease(v7);
  return v11;
}

- (void)receiveObservedValue:(id)a3
{
  objc_super v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((_NSIsNSDate() & 1) == 0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSObservationFormatterSupport.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!value || _NSIsNSDate(value)"));
    v6.receiver = self;
    v6.super_class = (Class)NSDateFormatter;
    -[NSDateFormatter receiveObservedValue:](&v6, sel_receiveObservedValue_, -[NSDateFormatter stringFromDate:](self, "stringFromDate:", a3));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSDateFormatter;
    -[NSDateFormatter receiveObservedValue:](&v7, sel_receiveObservedValue_, 0);
  }
}

@end
