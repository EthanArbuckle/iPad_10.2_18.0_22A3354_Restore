@implementation NSISO8601DateFormatter

+ (NSString)stringFromDate:(NSDate *)date timeZone:(NSTimeZone *)timeZone formatOptions:(NSISO8601DateFormatOptions)formatOptions
{
  id v8;
  NSString *v9;

  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "setTimeZone:", timeZone);
  objc_msgSend(v8, "setFormatOptions:", formatOptions);
  v9 = (NSString *)objc_msgSend(v8, "stringFromDate:", date);

  return v9;
}

- (NSString)stringFromDate:(NSDate *)date
{
  if (date)
    return (NSString *)-[NSISO8601DateFormatter stringForObjectValue:](self, "stringForObjectValue:");
  else
    return 0;
}

- (id)stringForObjectValue:(id)a3
{
  __CFDateFormatter *formatter;
  __CFString *StringWithDate;

  if (a3
    && _NSIsNSDate()
    && (formatter = self->_formatter) != 0
    && (StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], formatter, (CFDateRef)a3)) != 0)
  {
    return StringWithDate;
  }
  else
  {
    return 0;
  }
}

- (NSISO8601DateFormatter)init
{
  NSISO8601DateFormatter *v2;
  __CFDateFormatter *ISO8601Formatter;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSISO8601DateFormatter;
  v2 = -[NSISO8601DateFormatter init](&v5, sel_init);
  if (v2)
  {
    v2->_timeZone = (NSTimeZone *)(id)objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v2->_formatOptions = 1907;
    ISO8601Formatter = CFDateFormatterCreateISO8601Formatter((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0x773uLL);
    v2->_formatter = ISO8601Formatter;
    if (ISO8601Formatter)
      CFDateFormatterSetProperty(ISO8601Formatter, (CFStringRef)*MEMORY[0x1E0C9AF68], v2->_timeZone);
  }
  return v2;
}

- (void)dealloc
{
  __CFDateFormatter *formatter;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  formatter = self->_formatter;
  if (formatter)
  {
    CFRelease(formatter);
    self->_formatter = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)NSISO8601DateFormatter;
  -[NSISO8601DateFormatter dealloc](&v4, sel_dealloc);
}

- (void)updateFormatter
{
  __CFDateFormatter *formatter;
  __CFDateFormatter *ISO8601Formatter;

  formatter = self->_formatter;
  if (formatter)
  {
    CFRelease(formatter);
    self->_formatter = 0;
  }
  ISO8601Formatter = CFDateFormatterCreateISO8601Formatter((CFAllocatorRef)*MEMORY[0x1E0C9AE30], self->_formatOptions);
  self->_formatter = ISO8601Formatter;
  if (ISO8601Formatter)
    CFDateFormatterSetProperty(ISO8601Formatter, (CFStringRef)*MEMORY[0x1E0C9AF68], self->_timeZone);
}

- (void)setFormatOptions:(NSISO8601DateFormatOptions)formatOptions
{
  if ((formatOptions & 0xFFFFFFFFFFFFF008) != 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSISO8601DateFormatter.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("formatOptions == 0 || !(formatOptions & ~(NSISO8601DateFormatWithYear | NSISO8601DateFormatWithMonth | NSISO8601DateFormatWithWeekOfYear | NSISO8601DateFormatWithDay | NSISO8601DateFormatWithTime | NSISO8601DateFormatWithTimeZone | NSISO8601DateFormatWithSpaceBetweenDateAndTime | NSISO8601DateFormatWithDashSeparatorInDate | NSISO8601DateFormatWithColonSeparatorInTime | NSISO8601DateFormatWithColonSeparatorInTimeZone | NSISO8601DateFormatWithFractionalSeconds | NSISO8601DateFormatWithFullDate | NSISO8601DateFormatWithFullTime | NSISO8601DateFormatWithInternetDateTime))"));
  if (self->_formatOptions != formatOptions)
  {
    self->_formatOptions = formatOptions;
    -[NSISO8601DateFormatter updateFormatter](self, "updateFormatter");
  }
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  NSTimeZone *v4;
  NSTimeZone *v6;

  v4 = self->_timeZone;
  if (!timeZone)
  {
    if (-[NSString isEqualToString:](-[NSTimeZone name](v4, "name"), "isEqualToString:", CFSTR("GMT")))
    {
LABEL_8:
      -[NSISO8601DateFormatter updateFormatter](self, "updateFormatter");
      return;
    }

    self->_timeZone = 0;
    v6 = (NSTimeZone *)(id)objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
LABEL_7:
    self->_timeZone = v6;
    goto LABEL_8;
  }
  if (!-[NSTimeZone isEqualToTimeZone:](v4, "isEqualToTimeZone:"))
  {

    self->_timeZone = 0;
    v6 = (NSTimeZone *)-[NSTimeZone copy](timeZone, "copy");
    goto LABEL_7;
  }
}

- (NSDate)dateFromString:(NSString *)string
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!string)
    return 0;
  v4[0] = 0;
  if (-[NSISO8601DateFormatter getObjectValue:forString:range:error:](self, "getObjectValue:forString:range:error:", v4, string, 0, 0))
  {
    return (NSDate *)v4[0];
  }
  else
  {
    return 0;
  }
}

- (NSISO8601DateFormatOptions)formatOptions
{
  return self->_formatOptions;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id *v6;
  BOOL v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  if (a5)
    v6 = &v9;
  else
    v6 = 0;
  v7 = -[NSISO8601DateFormatter getObjectValue:forString:range:error:](self, "getObjectValue:forString:range:error:", a3, a4, 0, v6, v9, v10);
  if (v9)
    *a5 = (id)objc_msgSend(v9, "localizedDescription");
  return v7;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  BOOL result;
  CFIndex length;
  CFIndex location;
  __CFDateFormatter *formatter;
  CFDateRef v15;
  CFDateRef v16;
  NSError *v17;
  CFRange v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a4 || objc_msgSend(a4, "isEqual:", &stru_1E0F56070))
  {
    if (a3)
      *a3 = 0;
    return 1;
  }
  if (a5)
  {
    location = a5->location;
    length = a5->length;
  }
  else
  {
    length = objc_msgSend(a4, "length");
    location = 0;
  }
  v18.location = location;
  v18.length = length;
  formatter = self->_formatter;
  if (formatter)
  {
    v15 = CFDateFormatterCreateDateFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE30], formatter, (CFStringRef)a4, &v18);
    if (v15)
    {
      v16 = v15;
      CFAutorelease(v15);
      if (a5)
        *(CFRange *)a5 = v18;
      if (a3)
        *a3 = v16;
      return 1;
    }
  }
  if (!a6)
    return 0;
  v19 = CFSTR("NSInvalidValue");
  v20[0] = a4;
  v17 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 2048, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1));
  result = 0;
  *a6 = v17;
  return result;
}

- (NSISO8601DateFormatter)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSISO8601DateFormatter *v7;
  NSISO8601DateFormatter *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSISO8601DateFormatter cannot be decoded by non-keyed archivers"), 0));
  }
  v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.formatOptions"));
  if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.timeZone")))
  {
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NS.timeZone"));
    if (!v6)
    {

      v10 = CFSTR("NSLocalizedDescription");
      v11[0] = CFSTR("Timezone has been corrupted!");
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1)));
      return 0;
    }
  }
  else
  {
    v6 = 0;
  }
  v8 = -[NSISO8601DateFormatter init](self, "init");
  v7 = v8;
  if (v8)
  {
    -[NSISO8601DateFormatter setFormatOptions:](v8, "setFormatOptions:", v5);
    -[NSISO8601DateFormatter setTimeZone:](v7, "setTimeZone:", v6);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSTimeZone *timeZone;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Encoder does not allow key encoding"), 0));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_formatOptions, CFSTR("NS.formatOptions"));
  timeZone = self->_timeZone;
  if (timeZone)
    objc_msgSend(a3, "encodeObject:forKey:", timeZone, CFSTR("NS.timeZone"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
