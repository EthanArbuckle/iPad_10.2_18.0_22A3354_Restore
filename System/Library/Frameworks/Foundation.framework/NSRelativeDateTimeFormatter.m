@implementation NSRelativeDateTimeFormatter

- (void)dealloc
{
  __CFRelativeDateTimeFormatter *formatter;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  formatter = self->_formatter;
  if (formatter)
    CFRelease(formatter);
  v4.receiver = self;
  v4.super_class = (Class)NSRelativeDateTimeFormatter;
  -[NSRelativeDateTimeFormatter dealloc](&v4, sel_dealloc);
}

- (void)_clearFormatter
{
  __CFRelativeDateTimeFormatter *formatter;

  formatter = self->_formatter;
  if (formatter)
    CFRelease(formatter);
  self->_formatter = 0;
}

- (void)setLocale:(NSLocale *)locale
{
  NSLocale *v3;

  v3 = self->_locale;
  if (v3 != locale)
  {
    self->_locale = (NSLocale *)-[NSLocale copy](locale, "copy");

    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }
}

- (NSLocale)locale
{
  if (self->_locale)
    return self->_locale;
  else
    return -[NSCalendar locale](-[NSRelativeDateTimeFormatter calendar](self, "calendar"), "locale");
}

- (void)setCalendar:(NSCalendar *)calendar
{
  NSCalendar *v3;

  v3 = self->_calendar;
  if (v3 != calendar)
  {
    self->_calendar = (NSCalendar *)-[NSCalendar copy](calendar, "copy");

    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }
}

- (NSCalendar)calendar
{
  NSCalendar *result;

  result = self->_calendar;
  if (!result)
    return (NSCalendar *)objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  return result;
}

- (void)setUnitsStyle:(NSRelativeDateTimeFormatterUnitsStyle)unitsStyle
{
  if (self->_unitsStyle != unitsStyle)
  {
    self->_unitsStyle = unitsStyle;
    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }
}

- (NSRelativeDateTimeFormatterUnitsStyle)unitsStyle
{
  return self->_unitsStyle;
}

- (void)setDateTimeStyle:(NSRelativeDateTimeFormatterStyle)dateTimeStyle
{
  if (self->_dateTimeStyle != dateTimeStyle)
  {
    self->_dateTimeStyle = dateTimeStyle;
    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }
}

- (NSRelativeDateTimeFormatterStyle)dateTimeStyle
{
  return self->_dateTimeStyle;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  if (self->_formattingContext != formattingContext)
  {
    self->_formattingContext = formattingContext;
    -[NSRelativeDateTimeFormatter _clearFormatter](self, "_clearFormatter");
  }
}

- (NSFormattingContext)formattingContext
{
  return self->_formattingContext;
}

- (NSString)localizedStringFromTimeInterval:(NSTimeInterval)timeInterval
{
  uint64_t v5;

  v5 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
  return -[NSRelativeDateTimeFormatter localizedStringForDate:relativeToDate:](self, "localizedStringForDate:relativeToDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5, timeInterval), v5);
}

- (NSString)localizedStringForDate:(NSDate *)date relativeToDate:(NSDate *)referenceDate
{
  return (NSString *)-[NSRelativeDateTimeFormatter _stringFromDateComponents:](self, "_stringFromDateComponents:", -[NSCalendar components:fromDate:toDate:options:](-[NSRelativeDateTimeFormatter calendar](self, "calendar"), "components:fromDate:toDate:options:", 4348, referenceDate, date, 0));
}

- (NSString)stringForObjectValue:(id)obj
{
  if (obj && _NSIsNSDate())
    return -[NSRelativeDateTimeFormatter localizedStringForDate:relativeToDate:](self, "localizedStringForDate:relativeToDate:", obj, objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  else
    return 0;
}

- (id)_stringForCalendarUnit:(unint64_t)a3 value:(int64_t)a4
{
  const void *StringWithCalendarUnit;

  if (!self->_formatter)
  {
    -[NSRelativeDateTimeFormatter locale](self, "locale", a3, a4);
    self->_formatter = (__CFRelativeDateTimeFormatter *)_CFRelativeDateTimeFormatterCreate();
  }
  StringWithCalendarUnit = (const void *)_CFRelativeDateTimeFormatterCreateStringWithCalendarUnit();
  return (id)CFAutorelease(StringWithCalendarUnit);
}

- (id)_stringFromDateComponents:(id)a3
{
  uint64_t v4;
  id v6;
  _QWORD v8[2];
  uint64_t (*v9)(uint64_t, uint64_t, char *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v4 = 0;
  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E0C809B0];
  v21 = 0;
  v9 = __57__NSRelativeDateTimeFormatter__stringFromDateComponents___block_invoke;
  v10 = &unk_1E0F4F108;
  v14 = 0;
  v15 = &v14;
  v8[1] = 3221225472;
  v11 = a3;
  v12 = &v18;
  v13 = &v14;
  do
  {
    v22 = 0;
    v9((uint64_t)v8, allAllowedUnits[v4], &v22);
    if (v22)
      break;
  }
  while (v4++ != 6);
  if (v19[3] && v15[3] != 0x7FFFFFFFFFFFFFFFLL)
    v6 = -[NSRelativeDateTimeFormatter _stringForCalendarUnit:value:](self, "_stringForCalendarUnit:value:");
  else
    v6 = 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

uint64_t __57__NSRelativeDateTimeFormatter__stringFromDateComponents___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "valueForComponent:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    if (result)
      *a3 = 1;
  }
  return result;
}

@end
