@implementation EKStringFactory

+ (id)sharedInstance
{
  void *v2;
  id v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  v2 = (void *)sharedInstance___shared;
  if (!sharedInstance___shared)
  {
    v3 = objc_alloc_init((Class)objc_opt_class());
    v4 = (void *)sharedInstance___shared;
    sharedInstance___shared = (uint64_t)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_EKStringFactoryHandleSignificantTimeChange, (CFStringRef)*MEMORY[0x1E0D0C4B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v2 = (void *)sharedInstance___shared;
  }
  return v2;
}

- (EKStringFactory)init
{
  EKStringFactory *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKStringFactory;
  v2 = -[EKStringFactory init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__localeChanged_, *MEMORY[0x1E0C99720], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[EKStringFactory _invalidateFormatters](self, "_invalidateFormatters");
  v4.receiver = self;
  v4.super_class = (Class)EKStringFactory;
  -[EKStringFactory dealloc](&v4, sel_dealloc);
}

- (void)_invalidateFormatters
{
  __CFDateFormatter *standardTimeFormatter;
  __CFDateFormatter *customFormatter;

  standardTimeFormatter = self->_standardTimeFormatter;
  if (standardTimeFormatter)
  {
    CFRelease(standardTimeFormatter);
    self->_standardTimeFormatter = 0;
  }
  customFormatter = self->_customFormatter;
  if (customFormatter)
  {
    CFRelease(customFormatter);
    self->_customFormatter = 0;
  }
}

- (__CFDateFormatter)_customFormatter
{
  __CFDateFormatter *result;
  const __CFLocale *v4;

  result = self->_customFormatter;
  if (!result)
  {
    v4 = CFLocaleCopyCurrent();
    self->_customFormatter = CFDateFormatterCreate(0, v4, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    CFRelease(v4);
    return self->_customFormatter;
  }
  return result;
}

- (__CFDateFormatter)standardTimeFormatter
{
  __CFDateFormatter *result;
  const __CFLocale *v4;

  result = self->_standardTimeFormatter;
  if (!result)
  {
    v4 = CFLocaleCopyCurrent();
    self->_standardTimeFormatter = CFDateFormatterCreate(0, v4, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    CFRelease(v4);
    return self->_standardTimeFormatter;
  }
  return result;
}

- (id)timeStringForDate:(double)a3 inTimeZone:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a4;
  objc_msgSend(v5, "dateFromISO8601String:", CFSTR("2001-01-01T00:00:00Z"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0CD48], "sharedGenerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeStringForDate:inTimeZone:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)dateStringForDate:(double)a3 allDay:(BOOL)a4 shortFormat:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateFromISO8601String:", CFSTR("2001-01-01T00:00:00Z"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0CD48], "sharedGenerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateStringForDate:allDay:shortFormat:", v10, v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dateStringForDate:(double)a3 allDay:(BOOL)a4 standalone:(BOOL)a5 shortFormat:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateFromISO8601String:", CFSTR("2001-01-01T00:00:00Z"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0CD48], "sharedGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateStringForDate:allDay:standalone:shortFormat:", v12, v8, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_stringForTime:(id)a3
{
  double var5;
  unint64_t v4;
  const void *v6;
  CFAbsoluteTime v7;
  CFAllocatorRef *v8;
  __CFString *v9;
  __CFString *v10;
  __CFDateFormatter *v11;
  __CFString *StringWithAbsoluteTime;

  var5 = a3.var5;
  v4 = *(_QWORD *)&a3.var0;
  v6 = (const void *)CalCopySystemTimeZone();
  v7 = MEMORY[0x1B5DFE51C](v4, *(_QWORD *)&var5, v6);
  v8 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (HIBYTE(v4))
    goto LABEL_8;
  CPDateFormatStringForFormatType();
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9
    || -[__CFString rangeOfString:](v9, "rangeOfString:", CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || -[__CFString rangeOfString:](v10, "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL)
  {

LABEL_8:
    StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(*v8, -[EKStringFactory standardTimeFormatter](self, "standardTimeFormatter"), v7);
    goto LABEL_9;
  }
  v11 = -[EKStringFactory _customFormatter](self, "_customFormatter");
  CFDateFormatterSetFormat(v11, v10);
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(*v8, v11, v7);

  if (!StringWithAbsoluteTime)
    goto LABEL_8;
LABEL_9:
  CFRelease(v6);
  return StringWithAbsoluteTime;
}

- (id)_stringForDateTime:(id)a3 timeZone:(__CFTimeZone *)a4
{
  void *v5;
  void *v6;
  __CFString *v7;
  double v8;
  CFAbsoluteTime v9;
  __CFDateFormatter *v10;
  const __CFAllocator *v11;
  const __CFLocale *v12;
  __CFString *StringWithAbsoluteTime;

  if (!a3.var4)
  {
    CPDateFormatStringForFormatType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "rangeOfString:", CFSTR("H")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "rangeOfString:", CFSTR("k"));

    }
    else
    {

    }
  }
  CPDateFormatStringForFormatType();
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone();
  v9 = v8;
  if (v7)
  {
    v10 = -[EKStringFactory _customFormatter](self, "_customFormatter");
    CFDateFormatterSetFormat(v10, v7);
    CFRetain(v10);
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  }
  else
  {
    v12 = CFLocaleCopyCurrent();
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = CFDateFormatterCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, kCFDateFormatterMediumStyle, kCFDateFormatterMediumStyle);
    CFRelease(v12);
  }
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v11, v10, v9);
  CFRelease(v10);

  return StringWithAbsoluteTime;
}

- (id)dateStringForEventInvitation:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isAllDay");

  -[EKStringFactory dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:](self, "dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:", v8, v9, v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dateStringForEventInvitationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6
{
  return -[EKStringFactory _dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:withFormat:showTimeZone:](self, "_dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:withFormat:showTimeZone:", a3, a4, a5, a6, 0, 0);
}

- (id)dateStringForSuggestedEventWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 showTimeZone:(BOOL)a7
{
  return -[EKStringFactory _dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:withFormat:showTimeZone:](self, "_dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:withFormat:showTimeZone:", a3, a4, a5, a6, 1, a7);
}

- (id)_dateStringForEventInvitationWithStartDate:(id)a3 endDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 withFormat:(unint64_t)a7 showTimeZone:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t GregorianDateWithFallbackToDefaultTimeZone;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  const void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _BOOL4 v44;
  id v45;
  void *v46;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  EventKitUIBundle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0D0CD48], "sharedGenerator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringForDate:withLongFormatString:useAbbreviatedFormats:lowerCase:", v14, 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = v8;
    v46 = (void *)v17;
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    GregorianDateWithFallbackToDefaultTimeZone = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
    v23 = v22;
    v45 = v15;
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v24 = CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone();
    v26 = v25;
    if ((GregorianDateWithFallbackToDefaultTimeZone & 0xFFFFFFFFFFFFLL) == (v24 & 0xFFFFFFFFFFFFLL))
    {
      objc_msgSend(MEMORY[0x1E0D0CD48], "sharedGenerator");
      v27 = a7;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringForDate:withLongFormatString:useAbbreviatedFormats:lowerCase:", v14, 0, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[EKStringFactory _stringForTime:](self, "_stringForTime:", GregorianDateWithFallbackToDefaultTimeZone, v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKStringFactory _stringForTime:](self, "_stringForTime:", v24, v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Invitation from start time to end time"), CFSTR("%@ to %@"), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithFormat:", v32, v29, v30);

      if (v27)
      {
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Suggested event date and time format"), CFSTR("%@ from %@"), 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v34, v19, v33);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v19, v33);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v45;
      v8 = v44;

      v18 = v46;
    }
    else
    {
      v35 = (const void *)CalCopySystemTimeZone();
      -[EKStringFactory _stringForDateTime:timeZone:](self, "_stringForDateTime:timeZone:", GregorianDateWithFallbackToDefaultTimeZone, v23, v35);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKStringFactory _stringForDateTime:timeZone:](self, "_stringForDateTime:timeZone:", v24, v26, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0CB3940];
      if (a7)
        v38 = CFSTR("%@ to %@");
      else
        v38 = CFSTR("%@\nto %@");
      v18 = v46;
      objc_msgSend(v46, "localizedStringForKey:value:table:", v38, &stru_1E601DFA8, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringWithFormat:", v39, v19, v36);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      CFRelease(v35);
      v15 = v45;
      v8 = v44;
    }
  }

  if (v16 && v8)
  {
    objc_msgSend(v16, "abbreviationForDate:", v14);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Date/time string with time zone format"), CFSTR("%@ (%@)"), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v41, v20, v40);
    v42 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v42;
  }

  return v20;
}

@end
