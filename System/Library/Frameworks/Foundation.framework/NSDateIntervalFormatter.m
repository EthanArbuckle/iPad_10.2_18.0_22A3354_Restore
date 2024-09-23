@implementation NSDateIntervalFormatter

- (NSDateIntervalFormatter)init
{
  NSDateIntervalFormatter *v2;
  NSDateIntervalFormatter *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSDateIntervalFormatter;
  v2 = -[NSDateIntervalFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_modified = 0;
    v2->_useTemplate = 0;
    v2->_locale = 0;
    v2->_calendar = 0;
    v2->_timeZone = 0;
    v2->_formatter = 0;
    v2->_dateTemplate = (NSString *)&stru_1E0F56070;
    v3->_dateTemplateFromStyles = 0;
    v3->_dateStyle = 1;
    v3->_timeStyle = 1;
    v3->_boundaryStyle = 0;
    updateDateTemplate((uint64_t)v3, v3->_dateStyle, v3->_timeStyle);
    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)dealloc
{
  NSLocale *locale;
  NSCalendar *calendar;
  NSTimeZone *timeZone;
  NSString *dateTemplate;
  NSString *dateTemplateFromStyles;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  locale = self->_locale;
  if (locale)
  {

    self->_locale = 0;
  }
  calendar = self->_calendar;
  if (calendar)
  {

    self->_calendar = 0;
  }
  timeZone = self->_timeZone;
  if (timeZone)
  {

    self->_timeZone = 0;
  }
  if (self->_formatter)
  {
    udtitvfmt_close();
    self->_formatter = 0;
  }
  dateTemplate = self->_dateTemplate;
  if (dateTemplate)
  {

    self->_dateTemplate = 0;
  }
  dateTemplateFromStyles = self->_dateTemplateFromStyles;
  if (dateTemplateFromStyles)
  {

    self->_dateTemplateFromStyles = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NSDateIntervalFormatter;
  -[NSDateIntervalFormatter dealloc](&v8, sel_dealloc);
}

- (NSLocale)locale
{
  os_unfair_lock_s *p_lock;
  NSLocale *locale;
  NSLocale *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  locale = self->_locale;
  if (!locale)
    locale = (NSLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = locale;
  os_unfair_lock_unlock(p_lock);
  return locale;
}

- (void)setLocale:(NSLocale *)locale
{
  os_unfair_lock_s *p_lock;
  NSLocale *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_locale;
  if (v6 != locale)
  {

    self->_locale = (NSLocale *)-[NSLocale copyWithZone:](locale, "copyWithZone:", 0);
    self->_modified = 1;
    updateDateTemplate((uint64_t)self, self->_dateStyle, self->_timeStyle);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSCalendar)calendar
{
  os_unfair_lock_s *p_lock;
  NSCalendar *calendar;
  NSLocale *locale;
  NSCalendar *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  calendar = self->_calendar;
  if (!calendar)
  {
    locale = self->_locale;
    if (!locale)
      locale = (NSLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    calendar = -[NSLocale objectForKey:](locale, "objectForKey:", *MEMORY[0x1E0C99790]);
  }
  v6 = calendar;
  os_unfair_lock_unlock(p_lock);
  return calendar;
}

- (void)setCalendar:(NSCalendar *)calendar
{
  os_unfair_lock_s *p_lock;
  NSCalendar *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_calendar;
  if (v6 != calendar)
  {

    self->_calendar = (NSCalendar *)-[NSCalendar copyWithZone:](calendar, "copyWithZone:", 0);
    self->_modified = 1;
    updateDateTemplate((uint64_t)self, self->_dateStyle, self->_timeStyle);
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSTimeZone)timeZone
{
  os_unfair_lock_s *p_lock;
  NSTimeZone *timeZone;
  NSTimeZone *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timeZone = self->_timeZone;
  if (!timeZone)
    timeZone = (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v5 = timeZone;
  os_unfair_lock_unlock(p_lock);
  return timeZone;
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  os_unfair_lock_s *p_lock;
  NSTimeZone *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_timeZone;
  if (v6 != timeZone)
  {

    self->_timeZone = (NSTimeZone *)-[NSTimeZone copyWithZone:](timeZone, "copyWithZone:", 0);
    self->_modified = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)dateTemplate
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  NSString *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = 6;
  if (!self->_useTemplate)
    v4 = 7;
  v5 = *(NSString **)((char *)&self->super.super.isa + OBJC_IVAR___NSDateIntervalFormatter__modified[v4]);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)setDateTemplate:(NSString *)dateTemplate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSString isEqualToString:](self->_dateTemplate, "isEqualToString:", dateTemplate))
  {

    self->_dateTemplate = (NSString *)-[NSString copyWithZone:](dateTemplate, "copyWithZone:", 0);
    self->_modified = 1;
    self->_useTemplate = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSDateIntervalFormatterStyle)dateStyle
{
  os_unfair_lock_s *p_lock;
  NSDateIntervalFormatterStyle dateStyle;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dateStyle = self->_dateStyle;
  os_unfair_lock_unlock(p_lock);
  return dateStyle;
}

- (void)setDateStyle:(NSDateIntervalFormatterStyle)dateStyle
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_dateStyle = dateStyle;
  self->_modified = 1;
  self->_useTemplate = 0;
  updateDateTemplate((uint64_t)self, self->_dateStyle, self->_timeStyle);
  os_unfair_lock_unlock(p_lock);
}

- (NSDateIntervalFormatterStyle)timeStyle
{
  os_unfair_lock_s *p_lock;
  NSDateIntervalFormatterStyle timeStyle;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timeStyle = self->_timeStyle;
  os_unfair_lock_unlock(p_lock);
  return timeStyle;
}

- (void)setTimeStyle:(NSDateIntervalFormatterStyle)timeStyle
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_timeStyle = timeStyle;
  self->_modified = 1;
  self->_useTemplate = 0;
  updateDateTemplate((uint64_t)self, self->_dateStyle, self->_timeStyle);
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)boundaryStyle
{
  os_unfair_lock_s *p_lock;
  unint64_t boundaryStyle;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  boundaryStyle = self->_boundaryStyle;
  os_unfair_lock_unlock(p_lock);
  return boundaryStyle;
}

- (void)setBoundaryStyle:(unint64_t)a3
{
  if (a3 >= 3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateIntervalFormatter.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("boundaryStyle == NSDateIntervalFormatterBoundaryStyleDefault || boundaryStyle == NSDateIntervalFormatterBoundaryStyleMinimizeAdjacentMonths || boundaryStyle == NSDateIntervalFormatterBoundaryStyleMinimizeAdjacentDays"));
  os_unfair_lock_lock(&self->_lock);
  self->_boundaryStyle = a3;
  self->_modified = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)stringFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
  if (!fromDate)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateIntervalFormatter.m"), 330, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromDate != nil"));
    if (toDate)
      return (NSString *)-[NSDateIntervalFormatter _stringFromDate:toDate:](self, "_stringFromDate:toDate:", fromDate, toDate);
LABEL_5:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateIntervalFormatter.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toDate != nil"));
    return (NSString *)-[NSDateIntervalFormatter _stringFromDate:toDate:](self, "_stringFromDate:toDate:", fromDate, toDate);
  }
  if (!toDate)
    goto LABEL_5;
  return (NSString *)-[NSDateIntervalFormatter _stringFromDate:toDate:](self, "_stringFromDate:toDate:", fromDate, toDate);
}

- (NSString)stringFromDateInterval:(NSDateInterval *)dateInterval
{
  if (!dateInterval)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDateIntervalFormatter.m"), 336, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateInterval != nil"));
  return (NSString *)-[NSDateIntervalFormatter stringForObjectValue:](self, "stringForObjectValue:", dateInterval);
}

- (id)stringForObjectValue:(id)a3
{
  if (a3 && (objc_opt_isKindOfClass() & 1) != 0)
    return -[NSDateIntervalFormatter _stringFromDate:toDate:](self, "_stringFromDate:toDate:", objc_msgSend(a3, "startDate"), objc_msgSend(a3, "endDate"));
  else
    return 0;
}

- (id)_stringFromDate:(id)a3 toDate:(id)a4
{
  os_unfair_lock_s *p_lock;
  NSLocale *locale;
  NSCalendar *calendar;
  uint64_t v10;
  void *v11;
  void *v12;
  NSTimeZone *timeZone;
  NSString *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  NSString *v20;
  const char *v22;
  id v23;
  void *v24;
  _OWORD v25[12];
  uint64_t v26;
  uint8_t buf[4];
  _BYTE *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  NSString *v32;
  __int16 v33;
  const char *v34;
  _DWORD v35[48];
  uint64_t v36;
  _BYTE v37[96];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_modified && self->_formatter)
  {
    udtitvfmt_close();
    self->_formatter = 0;
    self->_modified = 0;
  }
  if (!self->_formatter)
  {
    v23 = a3;
    locale = self->_locale;
    if (!locale)
      locale = (NSLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    calendar = self->_calendar;
    v10 = *MEMORY[0x1E0C99790];
    if (!calendar)
      calendar = -[NSLocale objectForKey:](locale, "objectForKey:", *MEMORY[0x1E0C99790]);
    v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", -[NSLocale localeIdentifier](locale, "localeIdentifier", v23)), "mutableCopy");
    objc_msgSend(v11, "setObject:forKey:", calendar, v10);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v11);

    v38 = 0;
    memset(v37, 0, sizeof(v37));
    objc_msgSend(v12, "getCString:maxLength:encoding:", v37, 100, 4);
    v26 = 0;
    memset(v25, 0, sizeof(v25));
    timeZone = self->_timeZone;
    if (!timeZone)
      timeZone = (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v14 = -[NSTimeZone name](timeZone, "name");
    -[NSString getCharacters:](v14, "getCharacters:", v25);
    v15 = 6;
    if (!self->_useTemplate)
      v15 = 7;
    v16 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NSDateIntervalFormatter__modified[v15]);
    v36 = 0;
    memset(v35, 0, sizeof(v35));
    objc_msgSend(v16, "getCharacters:", v35);
    objc_msgSend(v16, "length");
    -[NSString length](v14, "length");
    self->_formatter = (UDateIntervalFormat *)udtitvfmt_open();
    if (!self->_formatter)
    {
      v17 = _NSOSLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v22 = u_errorName(U_ZERO_ERROR);
        *(_DWORD *)buf = 136315906;
        v28 = v37;
        v29 = 2112;
        v30 = v16;
        v31 = 2112;
        v32 = v14;
        v33 = 2080;
        v34 = v22;
        _os_log_error_impl(&dword_1817D9000, v17, OS_LOG_TYPE_ERROR, "udtitvfmt_open failed!  Formatter is NULL! -- locale: %s, template: %@, timezone: %@, status: %s", buf, 0x2Au);
      }
    }
    if (self->_formatter)
      udtitvfmt_setAttribute();
    a3 = v24;
  }
  if (self->_formatter)
  {
    objc_msgSend(a3, "timeIntervalSince1970");
    objc_msgSend(a4, "timeIntervalSince1970");
    bzero(v25, 0x7D0uLL);
    v35[0] = 0;
    v18 = udtitvfmt_format();
    if (v18 < 1001)
    {
      v20 = +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v25, v18);
    }
    else
    {
      v19 = malloc_type_calloc(v18, 2uLL, 0x1000040BDFB0063uLL);
      v35[0] = 0;
      v20 = +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", v19, (int)udtitvfmt_format());
      free(v19);
    }
  }
  else
  {
    v20 = (NSString *)&stru_1E0F56070;
  }
  os_unfair_lock_unlock(p_lock);
  return v20;
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return 0;
}

- (id)editingStringForObjectValue:(id)a3
{
  return 0;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  return 0;
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v6 + 8) = -[NSLocale copyWithZone:](self->_locale, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 16) = -[NSCalendar copyWithZone:](self->_calendar, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSTimeZone copyWithZone:](self->_timeZone, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_dateTemplate, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_dateTemplateFromStyles, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 56) = self->_dateStyle;
  *(_QWORD *)(v6 + 64) = self->_timeStyle;
  *(_BYTE *)(v6 + 84) = self->_modified;
  *(_BYTE *)(v6 + 85) = self->_useTemplate;
  os_unfair_lock_unlock(p_lock);
  return (id)v6;
}

- (NSDateIntervalFormatter)initWithCoder:(id)a3
{
  NSDateIntervalFormatter *v5;
  NSDateIntervalFormatter *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateIntervalFormatter cannot be decoded by non-keyed archivers"), 0));
  }
  v8.receiver = self;
  v8.super_class = (Class)NSDateIntervalFormatter;
  v5 = -[NSFormatter initWithCoder:](&v8, sel_initWithCoder_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_dateStyle = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NS.dateStyle"));
    v6->_timeStyle = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NS.timeStyle"));
    v6->_dateTemplate = (NSString *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NS.dateTemplate"));
    v6->_dateTemplateFromStyles = (NSString *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NS.dateTemplateFromStyles"));
    v6->_modified = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.modified"));
    v6->_useTemplate = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.useTemplate"));
    v6->_locale = 0;
    v6->_calendar = 0;
    v6->_timeZone = 0;
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.locale")))
      v6->_locale = (NSLocale *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NS.locale"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.calendar")))
      v6->_calendar = (NSCalendar *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NS.calendar"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.timeZone")))
      v6->_timeZone = (NSTimeZone *)(id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NS.timeZone"));
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSLocale *locale;
  NSCalendar *calendar;
  NSTimeZone *timeZone;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSDateIntervalFormatter cannot be encoded by non-keyed archivers"), 0));
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(a3, "encodeInt64:forKey:", self->_dateStyle, CFSTR("NS.dateStyle"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_timeStyle, CFSTR("NS.timeStyle"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_dateTemplate, CFSTR("NS.dateTemplate"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_dateTemplateFromStyles, CFSTR("NS.dateTemplateFromStyles"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_modified, CFSTR("NS.modified"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_useTemplate, CFSTR("NS.useTemplate"));
  locale = self->_locale;
  if (locale)
    objc_msgSend(a3, "encodeObject:forKey:", locale, CFSTR("NS.locale"));
  calendar = self->_calendar;
  if (calendar)
    objc_msgSend(a3, "encodeObject:forKey:", calendar, CFSTR("NS.calendar"));
  timeZone = self->_timeZone;
  if (timeZone)
    objc_msgSend(a3, "encodeObject:forKey:", timeZone, CFSTR("NS.timeZone"));
  os_unfair_lock_unlock(&self->_lock);
}

@end
