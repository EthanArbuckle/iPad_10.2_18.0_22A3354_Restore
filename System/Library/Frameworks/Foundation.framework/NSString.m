@implementation NSString

- (unsigned)_encodingCantBeStoredInEightBitCFString
{
  NSStringEncoding v2;
  CFStringEncoding *v3;
  CFStringEncoding v4;

  v2 = -[NSString fastestEncoding](self, "fastestEncoding");
  v3 = (CFStringEncoding *)MEMORY[0x1E0C9A950];
  v4 = *MEMORY[0x1E0C9A950];
  if (*MEMORY[0x1E0C9A950] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    v4 = *v3;
  }
  return v2 != CFStringConvertEncodingToNSStringEncoding(v4);
}

- (NSString)stringByAppendingString:(NSString *)aString
{
  malloc_zone_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  NSString *v14;
  void *v16;

  if (!aString)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v16);
  }
  if (!-[NSString length](self, "length"))
  {
    v14 = aString;
LABEL_7:
    v13 = -[NSString copyWithZone:](v14, "copyWithZone:", 0);
    return v13;
  }
  if (!-[NSString length](aString, "length"))
  {
    v14 = self;
    goto LABEL_7;
  }
  v5 = (malloc_zone_t *)-[NSString zone](self, "zone");
  v13 = _NSNewStringByAppendingStrings(v5, v6, v7, v8, v9, v10, v11, v12, (size_t)self, (uint64_t)aString);
  return v13;
}

- (NSArray)componentsSeparatedByString:(NSString *)separator
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSUInteger v14;
  uint64_t v15;
  id v16;

  v5 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", separator, 0, 0, -[NSString length](self, "length"));
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    v9 = -[NSString length](self, "length");
    v10 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = -[NSString zone](self, "zone");
    v12 = 0;
    do
    {
      v13 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v7 - v12, v11);
      -[NSArray addObject:](v10, "addObject:", v13);

      v12 = v7 + v8;
      v14 = v9 - (v7 + v8);
      v7 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", separator, 0, v7 + v8, v14);
      v8 = v15;
    }
    while (v15);
    v16 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v14, v11);
    -[NSArray addObject:](v10, "addObject:", v16);
  }
  else
  {
    v16 = (id)-[NSString copy](self, "copy");
    v10 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v16);
  }

  return v10;
}

- (BOOL)localizedStandardContainsString:(NSString *)str
{
  NSUInteger v5;

  v5 = -[NSString length](self, "length");
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", str, 129, 0, v5, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(NSLocale *)locale
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v13;
  NSUInteger v14;
  NSString *v15;
  NSString *v16;
  CFIndex v17;
  CFIndex v18;
  NSString *v19;
  void *v20;
  _QWORD *v21;
  CFRange result;
  uint64_t v23;
  NSRange v24;
  NSRange v25;
  CFRange v26;

  length = rangeOfReceiverToSearch.length;
  location = rangeOfReceiverToSearch.location;
  v23 = *MEMORY[0x1E0C80C00];
  result.location = 0;
  result.length = 0;
  v13 = -[NSString length](searchString, "length");
  v14 = -[NSString length](self, "length");
  if (v14 < length || location > v14 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
              _NSMethodExceptionProem((objc_class *)self, a2),
              location,
              length,
              v14);
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = (_QWORD *)MEMORY[0x1E0C99858];
LABEL_17:
      objc_exception_throw((id)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", *v21, v19, 0));
    }
    if ((rangeOfString_options_range_locale__warnonce & 1) == 0)
    {
      rangeOfString_options_range_locale__warnonce = 1;
      v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      v24.location = location;
      v24.length = length;
      v16 = NSStringFromRange(v24);
      NSLog((NSString *)CFSTR("*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution."),
        v15,
        v16);
    }
  }
  if (!searchString)
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2));
    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_17;
  }
  if ((mask & 0x400) != 0)
  {
    v18 = -[NSString _rangeOfRegularExpressionPattern:options:range:locale:](self, "_rangeOfRegularExpressionPattern:options:range:locale:", searchString, mask, location, length, locale);
  }
  else
  {
    v17 = 0;
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (length && v13)
    {
      v26.location = location;
      v26.length = length;
      if (CFStringFindWithOptionsAndLocale((CFStringRef)self, (CFStringRef)searchString, v26, ~(8 * (_BYTE)mask) & 0x10 | mask, (CFLocaleRef)locale, &result))
      {
        v18 = result.location;
        v17 = result.length;
      }
      else
      {
        v17 = 0;
        v18 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  v25.length = v17;
  v25.location = v18;
  return v25;
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch
{
  NSUInteger v5;
  NSUInteger v6;
  NSRange result;

  v5 = -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", searchString, mask, rangeOfReceiverToSearch.location, rangeOfReceiverToSearch.length, 0);
  result.length = v6;
  result.location = v5;
  return result;
}

- (BOOL)getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding
{
  _BOOL4 v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (maxBufferCount > 1)
  {
    v8[0] = 0;
    v6 = -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buffer, maxBufferCount - 1, v8, encoding, 4, 0, -[NSString length](self, "length"), 0);
    if (v6)
    {
      buffer[v8[0]] = 0;
      LOBYTE(v6) = 1;
    }
    else
    {
      *buffer = 0;
    }
  }
  else
  {
    if (maxBufferCount == 1)
      *buffer = 0;
    LOBYTE(v6) = -[NSString length](self, "length") == 0;
  }
  return v6;
}

- (NSString)initWithUTF8String:(const char *)nullTerminatedCString
{
  void *v6;

  if (!nullTerminatedCString)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NULL cString"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v6);
  }
  if (self == (NSString *)&__placeholder || _CFExecutableLinkedOnOrAfter())
    return (NSString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], nullTerminatedCString, 0x8000100u);
  else
    return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", nullTerminatedCString, strlen(nullTerminatedCString), 4);
}

+ (NSString)stringWithUTF8String:(const char *)nullTerminatedCString
{
  void *v4;

  if (!nullTerminatedCString)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NULL cString"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
    objc_exception_throw(v4);
  }
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithBytes:length:encoding:", nullTerminatedCString, strlen(nullTerminatedCString), 4);
}

+ (NSString)allocWithZone:(_NSZone *)a3
{
  if ((id)__NSStringClass == a1)
    return (NSString *)&__placeholder;
  else
    return (NSString *)NSAllocateObject((Class)a1, 0, a3);
}

- (BOOL)_allowsDirectEncoding
{
  return 1;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

+ (NSString)stringWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  void *v6;

  if (!a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NULL cString"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
    objc_exception_throw(v6);
  }
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithBytes:length:encoding:", a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = _NSIsNSString();
    if (v5)
      LOBYTE(v5) = -[NSString isEqualToString:](self, "isEqualToString:", a3);
  }
  return v5;
}

- (BOOL)isNSString__
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSComparisonResult)compare:(NSString *)string
{
  if (self == string)
    return 0;
  else
    return -[NSString compare:options:range:](self, "compare:options:range:", string, 0, 0, -[NSString length](self, "length"));
}

- (Class)classForCoder
{
  return (Class)__NSStringClass;
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  _BYTE *v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  NSString *v12;
  NSUInteger v13;
  _BYTE v14[100];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v9 = -[NSString length](self, "length");
    v10 = v9;
    v13 = v9;
    v11 = 6 * v9;
    if (6 * v9 < 0x65)
      v8 = v14;
    else
      v8 = malloc_type_malloc(6 * v9, 0x100004077774924uLL);
    if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", v8, v11, &v13, 4, 0, 0, v10, 0))
    {
      objc_msgSend(a3, "encodeBytes:length:", v8, v13);
      goto LABEL_14;
    }
LABEL_17:
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("couldn't encode string %@"), self);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v12, 0));
  }
  if (object_getClass(a3) == (Class)NSKeyedArchiver)
  {
    objc_msgSend(a3, "_encodePropertyList:forKey:", self, CFSTR("NS.string"));
    return;
  }
  v5 = -[NSString length](self, "length");
  v6 = v5;
  v13 = v5;
  v7 = 6 * v5;
  if (6 * v5 < 0x65)
    v8 = v14;
  else
    v8 = malloc_type_malloc(6 * v5, 0x100004077774924uLL);
  if (!-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", v8, v7, &v13, 4, 0, 0, v6, 0))goto LABEL_17;
  objc_msgSend(a3, "encodeBytes:length:forKey:", v8, v13, CFSTR("NS.bytes"));
LABEL_14:
  if (v8 != v14)
    free(v8);
}

- (NSString)capitalizedString
{
  return -[NSString capitalizedStringWithLocale:](self, "capitalizedStringWithLocale:", 0);
}

- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string
{
  return -[NSString compare:options:range:](self, "compare:options:range:", string, 1, 0, -[NSString length](self, "length"));
}

- (BOOL)isEqualToString:(NSString *)aString
{
  return self == aString
      || -[NSString compare:options:range:](self, "compare:options:range:", aString, 2, 0, -[NSString length](self, "length")) == NSOrderedSame;
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare locale:(id)locale
{
  CFIndex length;
  CFIndex location;
  char isKindOfClass;
  const __CFLocale *v13;
  CFRange v15;

  if (self == string)
    return 0;
  if (!string)
    return 1;
  length = rangeOfReceiverToCompare.length;
  location = rangeOfReceiverToCompare.location;
  if (locale)
  {
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v13 = (const __CFLocale *)locale;
    else
      v13 = 0;
    if ((isKindOfClass & 1) == 0)
      mask |= 0x20uLL;
  }
  else
  {
    v13 = 0;
  }
  v15.location = location;
  v15.length = length;
  return CFStringCompareWithOptionsAndLocale((CFStringRef)self, (CFStringRef)string, v15, ~(8 * (_BYTE)mask) & 0x10 | mask, v13);
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare
{
  if (self == string)
    return 0;
  else
    return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:");
}

- (NSComparisonResult)localizedStandardCompare:(NSString *)string
{
  NSUInteger v5;

  v5 = -[NSString length](self, "length");
  return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:", string, 833, 0, v5, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
}

- (NSComparisonResult)localizedCaseInsensitiveCompare:(NSString *)string
{
  NSUInteger v5;

  v5 = -[NSString length](self, "length");
  return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:", string, 1, 0, v5, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
}

- (NSString)stringByDeletingLastPathComponent
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _WORD *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSString *v13;
  uint64_t v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  v15[0] = v3;
  v4 = MEMORY[0x1E0C80A78](v3);
  v7 = (_WORD *)((char *)v15 - v6);
  if (v4 > 0x100)
    v7 = malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  else
    bzero((char *)v15 - v6, 2 * v5);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v7, 0, v3, v15[0]);
  _NSTransmutePathSlashes(v7, v15);
  v8 = v15[0];
  if (v15[0] >= 2)
  {
    if (v7[v15[0] - 1] != 47)
      goto LABEL_12;
    while ((unint64_t)v8 > 2)
    {
      v9 = (unsigned __int16)v7[v8-- - 2];
      if (v9 != 47)
        goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_8:
  if (v8 == 1)
  {
LABEL_9:
    v10 = *v7 == 47;
    goto LABEL_17;
  }
  if (v8 >= 2)
  {
LABEL_12:
    while (1)
    {
      v11 = v8 - 1;
      if (v8 == 1)
        break;
      v12 = (unsigned __int16)v7[v8-- - 2];
      if (v12 == 47)
      {
        if (v11 == 1)
          v10 = 1;
        else
          v10 = v11 - 1;
        goto LABEL_17;
      }
    }
  }
  v10 = 0;
LABEL_17:
  v13 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v7, v10);
  if (v3 >= 0x101)
    free(v7);
  return v13;
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask
{
  NSUInteger v4;
  NSUInteger v5;
  NSRange result;

  v4 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", searchSet, mask, 0, -[NSString length](self, "length"));
  result.length = v5;
  result.location = v4;
  return result;
}

+ (NSString)localizedStringWithFormat:(NSString *)format
{
  id v4;
  va_list va;

  va_start(va, format);
  v4 = objc_allocWithZone((Class)a1);
  return (NSString *)(id)objc_msgSend(v4, "initWithFormat:locale:arguments:", format, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), va);
}

- (NSString)stringByAppendingFormat:(NSString *)format
{
  NSString *v4;
  malloc_zone_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  va_list va;

  va_start(va, format);
  v4 = -[NSString initWithFormat:arguments:](&__placeholder, "initWithFormat:arguments:", format, va);
  v5 = (malloc_zone_t *)-[NSString zone](self, "zone");
  v13 = _NSNewStringByAppendingStrings(v5, v6, v7, v8, v9, v10, v11, v12, (size_t)self, (uint64_t)v4);

  return v13;
}

- (NSString)initWithFormat:(NSString *)format locale:(id)locale
{
  va_list va;

  va_start(va, locale);
  return -[NSString initWithFormat:locale:arguments:](self, "initWithFormat:locale:arguments:", format, locale, va, va);
}

- (NSString)initWithFormat:(NSString *)format
{
  va_list va;

  va_start(va, format);
  return -[NSString initWithFormat:locale:arguments:](self, "initWithFormat:locale:arguments:", format, 0, va, va);
}

+ (NSString)stringWithFormat:(NSString *)format
{
  NSString *v3;
  NSString *v4;
  va_list va;

  va_start(va, format);
  v3 = (NSString *)objc_msgSend(objc_allocWithZone((Class)a1), "initWithFormat:locale:arguments:", format, 0, va);
  v4 = v3;
  return v3;
}

- (NSAttributedString)__baseAttributedString
{
  return 0;
}

- (NSString)initWithFormat:(NSString *)format arguments:(va_list)argList
{
  return -[NSString initWithFormat:locale:arguments:](self, "initWithFormat:locale:arguments:", format, 0, argList);
}

- (NSString)lowercaseString
{
  return -[NSString lowercaseStringWithLocale:](self, "lowercaseStringWithLocale:", 0);
}

- (NSString)lowercaseStringWithLocale:(NSLocale *)locale
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringLowercase(Mutable, (CFLocaleRef)locale);
  return (NSString *)Mutable;
}

- (BOOL)getBytes:(void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(NSRangePointer)leftover
{
  char v9;
  CFStringEncoding v13;
  NSUInteger v14;
  BOOL v15;

  v9 = options;
  v13 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v13 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      v13 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), encoding);
      v13 = 1536;
    }
  }
  v14 = -[NSString length](self, "length");
  if (!v14)
    goto LABEL_13;
  if (!CFStringIsEncodingAvailable(v13))
  {
    v15 = 0;
    v14 = 0;
    if (!usedBufferCount)
      goto LABEL_17;
    goto LABEL_16;
  }
  v14 = __CFStringEncodeByteStream();
  if ((v9 & 4) == 0 || v14 >= range.length)
  {
    if (v14)
    {
LABEL_13:
      v15 = 1;
      if (!usedBufferCount)
        goto LABEL_17;
LABEL_16:
      *usedBufferCount = 0;
      goto LABEL_17;
    }
  }
  v15 = 0;
  if (usedBufferCount)
    goto LABEL_16;
LABEL_17:
  if (leftover)
  {
    leftover->location = v14 + range.location;
    leftover->length = range.length - v14;
  }
  return v15;
}

- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc
{
  NSUInteger v4;

  v4 = -[NSString length](self, "length");
  if (CFStringConvertNSStringEncodingToEncoding(enc) == -1)
  {
    if (enc != 134217984 && enc)
      return 0;
    if (_CFExecutableLinkedOnOrAfter())
      NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), enc);
  }
  if (__CFStringEncodeByteStream() == v4)
    return 0;
  else
    return 0;
}

+ (NSString)stringWithString:(NSString *)string
{
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithString:", string);
}

- (const)_fastCharacterContents
{
  return 0;
}

- (NSString)stringByTrimmingCharactersInSet:(NSCharacterSet *)set
{
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unsigned __int16 v8;
  _BOOL4 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  NSString *v30;
  unint64_t v31;
  _OWORD v32[4];
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!set)
  {
    v28 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v28);
  }
  v33 = 0u;
  memset(v32, 0, sizeof(v32));
  v29 = 0u;
  v5 = -[NSString length](self, "length");
  v6 = v5;
  v31 = v5;
  *(_QWORD *)&v32[0] = 0;
  v30 = self;
  if (!v5)
  {
    v29 = xmmword_18205FD60;
    WORD4(v33) = -1;
    v12 = 1;
    goto LABEL_21;
  }
  if (v5 >= 0x20)
    v7 = 32;
  else
    v7 = v5;
  *(_QWORD *)&v29 = v7;
  objc_msgSend(self, sel_getUid("getCharacters:range:"), (char *)v32 + 8, 0, v7);
  v8 = WORD4(v32[0]);
  *((_QWORD *)&v29 + 1) = 1;
  WORD4(v33) = WORD4(v32[0]);
  while (1)
  {
    v9 = -[NSCharacterSet characterIsMember:](set, "characterIsMember:", v8);
    v10 = *((_QWORD *)&v29 + 1);
    if (!v9)
      break;
    v11 = v29;
    if (*((_QWORD *)&v29 + 1) >= (unint64_t)v29)
    {
      v13 = *(_QWORD *)&v32[0] + v29;
      if (v31 > *(_QWORD *)&v32[0] + (_QWORD)v29)
      {
        if (v31 - (*(_QWORD *)&v32[0] + (_QWORD)v29) >= 0x20)
          v14 = 32;
        else
          v14 = v31 - (*(_QWORD *)&v32[0] + v29);
        *(_QWORD *)&v32[0] += v29;
        *(_QWORD *)&v29 = v14;
        objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, v13, v14);
        v8 = WORD4(v32[0]);
        WORD4(v33) = WORD4(v32[0]);
        *((_QWORD *)&v29 + 1) = 1;
        v11 = v29;
        v12 = 1;
        goto LABEL_17;
      }
      v12 = v29 + 1;
      *((_QWORD *)&v29 + 1) = v29 + 1;
      v8 = -1;
    }
    else
    {
      v12 = ++*((_QWORD *)&v29 + 1);
      v8 = *((_WORD *)v32 + v10 + 4);
    }
    WORD4(v33) = v8;
LABEL_17:
    if (v12 - 1 >= v11)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)&v29 + 1);
LABEL_21:
  v15 = *(_QWORD *)&v32[0];
  v16 = v12 + *(_QWORD *)&v32[0] - 1;
  if (v16 == v6)
    return (NSString *)&stru_1E0F56070;
  v18 = v6 - 1;
  if (v16 >= v6 - 1)
  {
    v21 = 1;
  }
  else
  {
    if (*(_QWORD *)&v32[0] > v18 || (_QWORD)v29 + *(_QWORD *)&v32[0] <= v18)
    {
      if (v18 > 0xF)
      {
        v20 = v31;
        if (v31 - 16 >= v18)
        {
          v19 = v6 - 17;
        }
        else if (v31 >= 0x20)
        {
          v19 = v31 - 32;
        }
        else
        {
          v19 = 0;
        }
        *(_QWORD *)&v32[0] = v19;
      }
      else
      {
        v19 = 0;
        *(_QWORD *)&v32[0] = 0;
        v20 = v31;
      }
      v22 = v20 - v19;
      if (v22 >= 0x20)
        v23 = 32;
      else
        v23 = v22;
      *(_QWORD *)&v29 = v23;
      objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, v19, v23);
      WORD4(v33) = WORD4(v32[0]);
      v15 = *(_QWORD *)&v32[0];
    }
    v24 = v18 - v15;
    *((_QWORD *)&v29 + 1) = v24 + 1;
    WORD4(v33) = *((_WORD *)v32 + v24 + 4);
    if (-[NSCharacterSet characterIsMember:](set, "characterIsMember:"))
    {
      do
      {
        v25 = *((_QWORD *)&v29 + 1);
        if (*((_QWORD *)&v29 + 1) - 1 + *(_QWORD *)&v32[0] < v16)
          break;
        if (*((_QWORD *)&v29 + 1) < 2uLL)
        {
          if (*(_QWORD *)&v32[0])
          {
            v27 = *(_QWORD *)&v32[0] >= 0x20uLL ? 32 : *(_QWORD *)&v32[0];
            *(_QWORD *)&v29 = v27;
            *((_QWORD *)&v29 + 1) = v27;
            *(_QWORD *)&v32[0] -= v27;
            objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, *(_QWORD *)&v32[0], v27);
            v26 = *((_WORD *)v32 + *((_QWORD *)&v29 + 1) + 3);
          }
          else
          {
            *((_QWORD *)&v29 + 1) = 0;
            v26 = -1;
          }
        }
        else
        {
          --*((_QWORD *)&v29 + 1);
          v26 = *((_WORD *)v32 + v25 + 2);
        }
        WORD4(v33) = v26;
      }
      while (-[NSCharacterSet characterIsMember:](set, "characterIsMember:"));
    }
    v21 = *(_QWORD *)&v32[0] - v16 + *((_QWORD *)&v29 + 1);
  }
  return -[NSString substringWithRange:](self, "substringWithRange:", v16, v21);
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSString *v12;
  NSString *v13;
  int CharacterFromSet;
  BOOL v15;
  CFIndex v16;
  CFIndex v17;
  NSString *v18;
  void *v19;
  _QWORD *v20;
  CFRange result;
  uint64_t v22;
  NSRange v23;
  NSRange v24;
  CFRange v25;

  length = rangeOfReceiverToSearch.length;
  location = rangeOfReceiverToSearch.location;
  v22 = *MEMORY[0x1E0C80C00];
  result.location = 0;
  result.length = 0;
  v11 = -[NSString length](self, "length");
  if (v11 < length || location > v11 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
              _NSMethodExceptionProem((objc_class *)self, a2),
              location,
              length,
              v11);
      v19 = (void *)MEMORY[0x1E0C99DA0];
      v20 = (_QWORD *)MEMORY[0x1E0C99858];
LABEL_16:
      objc_exception_throw((id)objc_msgSend(v19, "exceptionWithName:reason:userInfo:", *v20, v18, 0));
    }
    if ((rangeOfCharacterFromSet_options_range__warnonce & 1) == 0)
    {
      rangeOfCharacterFromSet_options_range__warnonce = 1;
      v12 = _NSMethodExceptionProem((objc_class *)self, a2);
      v23.location = location;
      v23.length = length;
      v13 = NSStringFromRange(v23);
      NSLog((NSString *)CFSTR("*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution."),
        v12,
        v13);
    }
  }
  if (!searchSet)
  {
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2));
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_16;
  }
  v25.location = location;
  v25.length = length;
  CharacterFromSet = CFStringFindCharacterFromSet((CFStringRef)self, (CFCharacterSetRef)searchSet, v25, mask, &result);
  v15 = CharacterFromSet == 0;
  if (CharacterFromSet)
    v16 = result.location;
  else
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v15)
    v17 = 0;
  else
    v17 = result.length;
  v24.length = v17;
  v24.location = v16;
  return v24;
}

- (id)_createSubstringWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v7;
  objc_class *v8;
  NSUInteger v10;
  void *v11;

  length = a3.length;
  location = a3.location;
  if (!_createSubstringWithRange__baseImp)
  {
    v7 = (objc_class *)objc_opt_class();
    _createSubstringWithRange__baseImp = (uint64_t)class_getMethodImplementation(v7, sel_substringWithRange_);
  }
  v8 = (objc_class *)objc_opt_class();
  if ((IMP)_createSubstringWithRange__baseImp != class_getMethodImplementation(v8, sel_substringWithRange_))
    return -[NSString substringWithRange:](self, "substringWithRange:", location, length);
  v10 = -[NSString length](self, "length");
  if (v10 < length || location > v10 - length)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      location,
                      length,
                      v10),
                    0);
    objc_exception_throw(v11);
  }
  return -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", location, length, -[NSString zone](self, "zone"));
}

- (id)_stringRepresentation
{
  NSUInteger v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v15;
  uint64_t v16;
  NSString *v17;
  __int128 v18;
  _OWORD v19[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  if (!v3)
    return CFSTR("\"\");
  v16 = 0;
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v17 = self;
  v18 = v3;
  if (v3 >= 0x20)
    v4 = 32;
  else
    v4 = v3;
  v15 = v4;
  objc_msgSend(self, sel_getUid("getCharacters:range:"), v19, 0, v4);
  v5 = LOWORD(v19[0]);
  LOWORD(v20) = v19[0];
  v16 = 1;
  v6 = 1;
  while (v6 - 1 < v15)
  {
    v7 = (v5 & 0xFFDF) - 65;
    v8 = v5 - 48;
    v10 = v7 < 0x1A || v8 < 0xA;
    if (v6 >= v15)
    {
      v12 = *((_QWORD *)&v18 + 1) + v15;
      if ((unint64_t)v18 <= *((_QWORD *)&v18 + 1) + v15)
      {
        v6 = v15 + 1;
        v16 = v15 + 1;
        v5 = 0xFFFF;
        goto LABEL_22;
      }
      if ((unint64_t)v18 - (*((_QWORD *)&v18 + 1) + v15) >= 0x20)
        v13 = 32;
      else
        v13 = v18 - (*((_QWORD *)&v18 + 1) + v15);
      *((_QWORD *)&v18 + 1) += v15;
      v15 = v13;
      objc_msgSend(v17, sel_getUid("getCharacters:range:"), v19, v12, v13);
      v5 = LOWORD(v19[0]);
      LOWORD(v20) = v19[0];
      v16 = 1;
      v6 = 1;
      if (!v10)
        return -[NSString quotedStringRepresentation](self, "quotedStringRepresentation");
    }
    else
    {
      v11 = (char *)&v15 + 2 * v6++;
      v16 = v6;
      v5 = *((unsigned __int16 *)v11 + 20);
LABEL_22:
      LOWORD(v20) = v5;
      if (!v10)
        return -[NSString quotedStringRepresentation](self, "quotedStringRepresentation");
    }
  }
  return -[NSString copyWithZone:](self, "copyWithZone:", 0);
}

- (id)quotedStringRepresentation
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  id result;
  _BYTE *v7;
  uint64_t v8;
  unsigned __int16 v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  const char *v20;
  unint64_t v21;
  unint64_t v22;
  NSString *v23;
  __int128 v24;
  _OWORD v25[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  if (!v3)
    return CFSTR("\"\");
  v4 = v3;
  if (6 * v3 + 3 <= 0x186A0)
    v5 = 6 * v3 + 3;
  else
    v5 = v3 + 9;
  result = (id)MEMORY[0x186DA6248](0, v5, 3732426528, 0);
  if (result)
  {
    v7 = result;
    *(_BYTE *)result = 34;
    v26 = 0;
    memset(v25, 0, sizeof(v25));
    v23 = self;
    v24 = v4;
    if (v4 >= 0x20)
      v8 = 32;
    else
      v8 = v4;
    v21 = v8;
    objc_msgSend(self, sel_getUid("getCharacters:range:"));
    v9 = v25[0];
    LOWORD(v26) = v25[0];
    v22 = 1;
    v10 = 1;
    v11 = 1;
    while (1)
    {
      if (v11 > v5 - 8)
      {
        v12 = 6 * (v4 + 1 - v10 - *((_QWORD *)&v24 + 1)) + 2;
        if (v5 < v12)
          v12 = v5;
        v5 += v12;
        result = (id)MEMORY[0x186DA80F0](0, v7, v5, 2283257646, 0, 0);
        if (!result)
          return result;
        v7 = result;
        v9 = v26;
      }
      switch(v9)
      {
        case 7u:
          LOBYTE(v9) = 97;
          goto LABEL_27;
        case 8u:
          LOBYTE(v9) = 98;
          goto LABEL_27;
        case 9u:
          LOBYTE(v9) = 116;
          goto LABEL_27;
        case 0xAu:
          LOBYTE(v9) = 110;
          goto LABEL_27;
        case 0xBu:
          LOBYTE(v9) = 118;
          goto LABEL_27;
        case 0xCu:
          LOBYTE(v9) = 102;
          goto LABEL_27;
        default:
          if (v9 == 92)
          {
            LOBYTE(v9) = 92;
            goto LABEL_27;
          }
          if (v9 == 34)
          {
            LOBYTE(v9) = 34;
LABEL_27:
            v13 = v11 + 1;
            v7[v11] = 92;
            v14 = 2;
LABEL_28:
            v11 += v14;
            v7[v13] = v9;
            goto LABEL_29;
          }
          if (v9 >= 0x80u)
          {
            v19 = &v7[v11];
            *(_WORD *)v19 = 21852;
            v19[2] = a0123456789abcd[(unint64_t)v9 >> 12];
            v19[3] = a0123456789abcd[((unint64_t)v9 >> 8) & 0xF];
            v13 = v11 + 5;
            v19[4] = a0123456789abcd[v9 >> 4];
            LOBYTE(v9) = a0123456789abcd[v9 & 0xF];
            v14 = 6;
            goto LABEL_28;
          }
          if ((_BYTE)v9)
          {
            v14 = 1;
            v13 = v11;
            goto LABEL_28;
          }
LABEL_29:
          v16 = v21;
          v15 = v22;
          if (v22 >= v21)
          {
            v17 = *((_QWORD *)&v24 + 1) + v21;
            if ((unint64_t)v24 > *((_QWORD *)&v24 + 1) + v21)
            {
              if ((unint64_t)v24 - (*((_QWORD *)&v24 + 1) + v21) >= 0x20)
                v18 = 32;
              else
                v18 = v24 - (*((_QWORD *)&v24 + 1) + v21);
              *((_QWORD *)&v24 + 1) += v21;
              v21 = v18;
              objc_msgSend(v23, sel_getUid("getCharacters:range:"), v25, v17, v18);
              v9 = v25[0];
              LOWORD(v26) = v25[0];
              v22 = 1;
              v16 = v18;
              v10 = 1;
              goto LABEL_38;
            }
            v10 = v21 + 1;
            v22 = v21 + 1;
            v9 = -1;
          }
          else
          {
            v10 = ++v22;
            v9 = *((_WORD *)v25 + v15);
          }
          LOWORD(v26) = v9;
LABEL_38:
          if (v10 - 1 >= v16)
          {
            *(_WORD *)&v7[v11] = 34;
            v20 = (const char *)MEMORY[0x186DA80F0](0, v7, v11 + 2, 1730934142, 0, 0);
            return (id)(id)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v20, 0x600u, 0);
          }
          break;
      }
    }
  }
  return result;
}

- (int)intValue
{
  unint64_t v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  v3 = 0;
  if (_NSScanIntFromString(self, +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"), &v4, &v3))return v4;
  else
    return 0;
}

- (uint64_t)longLongValue
{
  unint64_t v3;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4[0] = 0;
  if (_NSScanLongLongFromString(self, +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"), v4, &v3))return v4[0];
  else
    return 0;
}

- (NSString)substringWithRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  void *v9;

  length = range.length;
  location = range.location;
  v7 = -[NSString length](self, "length");
  if (v7 < length || location > v7 - length)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     location,
                     length,
                     v7),
                   0);
    objc_exception_throw(v9);
  }
  return (NSString *)-[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", location, length, -[NSString zone](self, "zone"));
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  CFIndex length;
  NSUInteger location;
  NSUInteger v8;
  const char *v10;
  const __CFAllocator *v11;
  const UInt8 *v12;
  CFStringEncoding *v13;
  CFStringEncoding v14;
  malloc_zone_t *v15;
  void *v16;

  length = a3.length;
  location = a3.location;
  v8 = -[NSString length](self, "length");
  if (!length)
    return &stru_1E0F56070;
  if (!location && length == v8)
    return -[NSString copyWithZone:](self, "copyWithZone:", a4);
  v10 = -[NSString _fastCStringContents:](self, "_fastCStringContents:", 0);
  if (v10)
  {
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = (const UInt8 *)&v10[location];
    v13 = (CFStringEncoding *)MEMORY[0x1E0C9A950];
    v14 = *MEMORY[0x1E0C9A950];
    if (*MEMORY[0x1E0C9A950] == -1)
    {
      __CFStringComputeEightBitStringEncoding();
      v14 = *v13;
    }
    return (id)CFStringCreateWithBytes(v11, v12, length, v14, 0);
  }
  else
  {
    v15 = (malloc_zone_t *)a4;
    if (!a4)
      v15 = malloc_default_zone();
    v16 = malloc_type_zone_malloc(v15, 2 * length, 0x4A6F13AEuLL);
    -[NSString getCharacters:range:](self, "getCharacters:range:", v16, location, length);
    return -[NSString initWithCharactersNoCopy:length:freeWhenDone:](+[NSString allocWithZone:](NSString, "allocWithZone:", a4), "initWithCharactersNoCopy:length:freeWhenDone:", v16, length, 1);
  }
}

- (const)_fastCStringContents:(BOOL)a3
{
  return 0;
}

- (unsigned)_fastestEncodingInCFStringEncoding
{
  return CFStringConvertNSStringEncodingToEncoding(-[NSString fastestEncoding](self, "fastestEncoding"));
}

- (NSStringEncoding)fastestEncoding
{
  return 10;
}

- (NSData)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy
{
  NSUInteger v7;
  CFStringEncoding v8;
  uint64_t v9;
  NSData *result;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = -[NSString length](self, "length");
  v15[0] = 0;
  v8 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v8 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      v8 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), encoding);
      v8 = 1536;
    }
  }
  if (CFStringIsEncodingAvailable(v8))
  {
    v9 = __CFStringEncodeByteStream();
    result = 0;
    if (v9 == v7)
    {
      v11 = objc_allocWithZone(MEMORY[0x1E0C99DF0]);
      v12 = (void *)objc_msgSend(v11, "initWithLength:", v15[0], v15);
      v13 = v12;
      if (v15[0])
      {
        objc_msgSend(v12, "mutableBytes");
        if (__CFStringEncodeByteStream() != v7)
        {

          v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: didn't convert all characters"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
          objc_exception_throw(v14);
        }
        objc_msgSend(v13, "setLength:", v15[0], v15);
      }
      return (NSData *)v13;
    }
  }
  else
  {
    NSLog((NSString *)CFSTR("Unknown encoding %ld"), encoding);
    return 0;
  }
  return result;
}

- (NSData)dataUsingEncoding:(NSStringEncoding)encoding
{
  return -[NSString dataUsingEncoding:allowLossyConversion:](self, "dataUsingEncoding:allowLossyConversion:", encoding, 0);
}

- (NSString)stringByResolvingSymlinksInPath
{
  return (NSString *)-[NSString _stringByResolvingSymlinksInPathUsingCache:](self, "_stringByResolvingSymlinksInPathUsingCache:", 0);
}

- (const)UTF8String
{
  return (const char *)bytesInEncoding(self, 4, 0, 0, 0);
}

- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
  NSUInteger length;
  NSUInteger location;
  NSString *v12;
  NSString *v13;
  void *v15;

  if (!replacement)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v15);
  }
  length = searchRange.length;
  location = searchRange.location;
  if ((options & 0x400) != 0)
    return (NSString *)-[NSString _stringByReplacingOccurrencesOfRegularExpressionPattern:withTemplate:options:range:](self, "_stringByReplacingOccurrencesOfRegularExpressionPattern:withTemplate:options:range:", target, replacement, options, searchRange.location, searchRange.length);
  v12 = (NSString *)-[NSString mutableCopy](self, "mutableCopy");
  if (-[NSString replaceOccurrencesOfString:withString:options:range:](v12, "replaceOccurrencesOfString:withString:options:range:", target, replacement, options, location, length))
  {
    v13 = v12;
  }
  else
  {

    v13 = self;
  }
  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[NSString initWithString:](+[NSMutableString allocWithZone:](NSMutableString, "allocWithZone:", a3), "initWithString:", self);
}

- (void)enumerateSubstringsInRange:(NSRange)range options:(NSStringEnumerationOptions)opts usingBlock:(void *)block
{
  unint64_t length;
  unint64_t location;
  BOOL v9;
  unint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  void (**v13)(void *, __CFStringTokenizer *);
  CFOptionFlags v14;
  void (**v15)(void *, __CFStringTokenizer *);
  const __CFLocale *System;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFStringTokenizer *v20;
  CFRange CurrentTokenRange;
  __CFStringTokenizer *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t RangeOfCharacterClusterAtIndex;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NSString *v33;
  uint64_t v34;
  unint64_t v35;
  NSUInteger v36;
  CFIndex v37;
  id v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CFIndex v45;
  CFRange v46;
  CFIndex v47;
  unint64_t *v48;
  NSUInteger v49;
  NSUInteger v50;
  unint64_t v51;
  CFRange v52;
  NSUInteger v53;
  CFRange v54;
  void *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void (**v59)(void *, __CFStringTokenizer *);
  CFIndex v60;
  unint64_t v61;
  __CFStringTokenizer *cf;
  unint64_t v65;
  unint64_t v66;
  __int128 v67;
  _QWORD v68[10];
  BOOL v69;
  _QWORD *v70;
  _OWORD *v71;
  char v72;
  uint64_t v73;
  CFRange v74;
  CFRange v75;

  length = range.length;
  location = range.location;
  v73 = *MEMORY[0x1E0C80C00];
  v9 = (opts & 0x800) == 0;
  v10 = range.location + range.length;
  if ((opts & 0x100) != 0)
    v11 = range.location + range.length - 1;
  else
    v11 = range.location;
  v72 = 0;
  v12 = -[NSString length](self, "length");
  if (v12 < length || location > v12 - length)
  {
    v55 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      location,
                      length,
                      v12),
                    0);
    objc_exception_throw(v55);
  }
  if (!length)
    return;
  v70 = 0;
  v71 = 0;
  if ((unint64_t)opts - 3 > 1)
  {
    v58 = 0;
    v59 = 0;
    v56 = 0;
    v57 = 0;
    v60 = 0;
    v61 = 0;
    cf = 0;
  }
  else
  {
    if ((opts & 0x100) == 0)
    {
      v13 = (void (**)(void *, __CFStringTokenizer *))&__block_literal_global_46_0;
      if (opts != 4)
        v13 = 0;
      if (opts == 3)
        v14 = 4;
      else
        v14 = opts == 4;
      if (opts == 3)
        v15 = (void (**)(void *, __CFStringTokenizer *))&__block_literal_global_49;
      else
        v15 = v13;
      v59 = v15;
      if ((opts & 0x400) != 0)
        System = 0;
      else
        System = CFLocaleGetSystem();
      if ((opts & 0x800) != 0)
      {
        v75.location = 0;
        v75.length = v12;
        v20 = CFStringTokenizerCreate(0, (CFStringRef)self, v75, v14, System);
        if (CFStringTokenizerGoToTokenAtIndex(v20, location))
          goto LABEL_33;
      }
      else
      {
        v74.location = location;
        v74.length = length;
        v20 = CFStringTokenizerCreate(0, (CFStringRef)self, v74, v14, System);
      }
      v59[2](v59, v20);
LABEL_33:
      cf = v20;
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v20);
      v60 = CurrentTokenRange.length;
      v61 = CurrentTokenRange.location;
      v56 = 0;
      v57 = 0;
      v58 = 0;
      if (CurrentTokenRange.location == -1)
      {
        v72 = 1;
        v61 = -1;
      }
      goto LABEL_38;
    }
    v68[0] = MEMORY[0x1E0C809B0];
    if (length >= 0x186A0)
      v17 = 100000;
    else
      v17 = length;
    v68[1] = 3221225472;
    v68[2] = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3;
    v68[3] = &unk_1E0F50F78;
    if (length <= 0x186A0)
      v18 = location;
    else
      v18 = v10 - 100000;
    v69 = v9;
    v68[6] = opts;
    v68[7] = location;
    v68[8] = length;
    v68[9] = v10;
    v68[4] = self;
    v68[5] = opts;
    v57 = v18;
    v19 = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3((uint64_t)v68, (void **)&v71, (void **)&v70, v18, v17);
    if (v19)
    {
      v60 = 0;
      v61 = 0;
      cf = 0;
      v58 = v19 - 1;
      v59 = 0;
    }
    else
    {
      v58 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      cf = 0;
      v72 = 1;
    }
    v56 = v68;
  }
LABEL_38:
  _CFAutoreleasePoolPush();
  if (v72)
  {
LABEL_39:
    _CFAutoreleasePoolPop();
    v22 = cf;
    if (cf)
      goto LABEL_40;
    goto LABEL_41;
  }
  v23 = 0;
  while (1)
  {
    v67 = 0uLL;
    v65 = 0;
    v66 = 0;
    if (opts > 6u)
    {
      v38 = 0;
      v29 = 0;
LABEL_77:
      v67 = xmmword_1822B5320;
      v25 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_110;
    }
    if (((1 << opts) & 0x64) != 0)
      break;
    if (((1 << opts) & 3) != 0)
    {
      -[NSString _getBlockStart:end:contentsEnd:forRange:stopAtLineSeparators:](self, "_getBlockStart:end:contentsEnd:forRange:stopAtLineSeparators:", &v67, &v65, &v66, v11, 0, opts == 0);
      if ((opts & 0x800) != 0)
      {
        v24 = v66;
        v25 = v67;
        v26 = v65;
      }
      else
      {
        v24 = v66;
        v25 = v67;
        if ((unint64_t)v67 < location)
        {
          *(_QWORD *)&v67 = location;
          v25 = location;
          if (v66 < location)
          {
            v66 = location;
            v24 = location;
            v25 = location;
          }
        }
        v26 = v65;
        if (v65 > v10)
        {
          v65 = v10;
          if (v24 <= v10)
          {
            v26 = v10;
          }
          else
          {
            v66 = v10;
            v26 = v10;
            v24 = v10;
          }
        }
      }
      v35 = v24 - v25;
      *((_QWORD *)&v67 + 1) = v24 - v25;
      v29 = v26 - v25;
      if ((opts & 0x200) == 0)
      {
        v33 = self;
        v34 = v25;
        goto LABEL_108;
      }
      goto LABEL_109;
    }
    if ((opts & 0x100) == 0)
    {
      if ((opts & 0x800) != 0)
      {
        v37 = v60;
        v36 = v61;
      }
      else
      {
        v37 = v60;
        v36 = v61;
        if (v61 <= location)
          v36 = location;
        if (v61 + v60 > v10)
          v37 = v10 - v36;
      }
      *(_QWORD *)&v67 = v36;
      *((_QWORD *)&v67 + 1) = v37;
      if (v36 >= v11)
        v25 = v11;
      else
        v25 = v36;
      v44 = ((uint64_t (*)(void *, __CFStringTokenizer *))v59[2])(v59, cf);
      v46 = CFStringTokenizerGetCurrentTokenRange(cf);
      v45 = v46.location;
      v60 = v46.length;
      if (v44)
      {
        v47 = v46.location;
        if (v46.location > v10)
        {
LABEL_94:
          v47 = *((_QWORD *)&v67 + 1) + v67;
          if (*((_QWORD *)&v67 + 1) + (_QWORD)v67 <= v10)
            v47 = v10;
        }
      }
      else
      {
        v47 = v10;
        if ((opts & 0x800) != 0)
          goto LABEL_94;
      }
      v29 = v47 - v25;
      goto LABEL_101;
    }
    if (v58 || v57 == location)
    {
      v67 = v71[v58];
      v48 = &v70[2 * v58];
      v25 = *v48;
      v29 = v48[1];
      --v58;
      if (v29 + *v48 > v11)
      {
        v29 = v11 + 1 - v25;
        if (*((_QWORD *)&v67 + 1) + (_QWORD)v67 > v11)
          *((_QWORD *)&v67 + 1) = v11 + 1 - v67;
      }
      v45 = v61;
LABEL_101:
      v61 = v45;
      if ((opts & 0x200) == 0)
      {
        v35 = *((_QWORD *)&v67 + 1);
        v34 = v67;
        v33 = self;
        goto LABEL_108;
      }
      goto LABEL_109;
    }
    v39 = v70[1];
    v40 = v39 + 100000;
    if (v39 >> 5 < 0xC35)
      v40 = 100000;
    v41 = v39 + *v70;
    if (v41 > v40 && v41 - v40 > location)
      v42 = v41 - v40;
    else
      v42 = location;
    v57 = v42;
    v43 = ((uint64_t (*)(_QWORD *, _OWORD **, _QWORD **))v56[2])(v56, &v71, &v70);
    if (!v43)
    {
      v38 = 0;
      v29 = 0;
      v58 = 0;
      goto LABEL_77;
    }
    v58 = v43 - 1;
LABEL_128:
    if (v72)
      goto LABEL_39;
  }
  RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
  v25 = RangeOfCharacterClusterAtIndex;
  v29 = v28;
  if ((opts & 0x800) == 0)
  {
    if (RangeOfCharacterClusterAtIndex <= location)
      v30 = location;
    else
      v30 = RangeOfCharacterClusterAtIndex;
    v31 = location - RangeOfCharacterClusterAtIndex;
    if (location < RangeOfCharacterClusterAtIndex)
      v31 = 0;
    v32 = v28 - v31;
    if (v32 + v30 <= v10)
      v29 = v32;
    else
      v29 = v10 - v30;
    v25 = v30;
  }
  *(_QWORD *)&v67 = v25;
  *((_QWORD *)&v67 + 1) = v29;
  if ((opts & 0x200) == 0)
  {
    v33 = self;
    v34 = v25;
    v35 = v29;
LABEL_108:
    v38 = -[NSString _newSubstringWithRange:zone:](v33, "_newSubstringWithRange:zone:", v34, v35, 0);
    goto LABEL_110;
  }
LABEL_109:
  v38 = 0;
LABEL_110:
  (*((void (**)(void *, id, _QWORD, _QWORD, unint64_t, unint64_t, char *))block + 2))(block, v38, v67, *((_QWORD *)&v67 + 1), v25, v29, &v72);
  if (v38)

  if (v72)
    goto LABEL_39;
  if ((opts & 0x100) != 0)
  {
    if (v25 <= location)
      goto LABEL_39;
    v11 = v25 - 1;
LABEL_125:
    if (v23 == 1000)
    {
      _CFAutoreleasePoolPop();
      _CFAutoreleasePoolPush();
      v23 = 0;
    }
    else
    {
      ++v23;
    }
    goto LABEL_128;
  }
  v49 = -[NSString length](self, "length");
  v50 = v49 - v12;
  if (v49 == v12)
  {
    v51 = v12;
    goto LABEL_124;
  }
  v51 = v49;
  v29 += v50;
  v10 += v50;
  v22 = cf;
  if (!cf)
  {
LABEL_124:
    v11 = v29 + v25;
    v12 = v51;
    if (v29 + v25 >= v10)
      goto LABEL_39;
    goto LABEL_125;
  }
  v52.location = v29 + v25;
  if ((opts & 0x800) != 0)
    v53 = v49;
  else
    v53 = v10;
  v52.length = v53 - v52.location;
  CFStringTokenizerSetString(cf, (CFStringRef)self, v52);
  v59[2](v59, cf);
  v54 = CFStringTokenizerGetCurrentTokenRange(cf);
  v61 = v54.location;
  if (v54.location != -1)
  {
    v60 = v54.length;
    goto LABEL_124;
  }
  _CFAutoreleasePoolPop();
LABEL_40:
  CFRelease(v22);
LABEL_41:
  if (v71)
    free(v71);
  if (v70)
    free(v70);
}

- (NSRange)paragraphRangeForRange:(NSRange)range
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  _QWORD v6[2];
  NSRange result;

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6[0] = 0;
  -[NSString getParagraphStart:end:contentsEnd:forRange:](self, "getParagraphStart:end:contentsEnd:forRange:", v6, &v5, 0, range.location, range.length);
  v3 = v6[0];
  v4 = v5 - v6[0];
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)_getBlockStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6 stopAtLineSeparators:(BOOL)a7
{
  _BOOL4 v7;
  NSUInteger length;
  NSUInteger location;
  objc_class *v13;
  unint64_t v14;
  NSString *v15;
  NSString *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int16 v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  void *v41;
  unint64_t *v42;
  objc_class *v43;
  __int128 v45;
  __int128 v46;
  _OWORD v47[4];
  __int128 v48;
  uint64_t v49;
  NSRange v50;

  v7 = a7;
  length = a6.length;
  location = a6.location;
  v13 = (objc_class *)self;
  v49 = *MEMORY[0x1E0C80C00];
  v14 = -[NSString length](self, "length");
  v48 = 0u;
  v46 = 0u;
  memset(v47, 0, sizeof(v47));
  v45 = 0u;
  if (v14 < length || location > v14 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v41 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
                        _NSMethodExceptionProem(v13, a2),
                        location,
                        length,
                        v14),
                      0);
      objc_exception_throw(v41);
    }
    if ((_getBlockStart_end_contentsEnd_forRange_stopAtLineSeparators__warnonce & 1) == 0)
    {
      _getBlockStart_end_contentsEnd_forRange_stopAtLineSeparators__warnonce = 1;
      v15 = _NSMethodExceptionProem(v13, a2);
      v50.location = location;
      v50.length = length;
      v16 = NSStringFromRange(v50);
      NSLog((NSString *)CFSTR("*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution."),
        v15,
        v16);
    }
  }
  if (location)
  {
    if (a3)
    {
      v42 = a4;
      v43 = v13;
      *((_QWORD *)&v46 + 1) = v14;
      *(_QWORD *)&v47[0] = location;
      *(_QWORD *)&v46 = v13;
      if (v14 <= location)
      {
        v18 = 0xFFFF;
        WORD4(v48) = -1;
        v19 = location;
      }
      else
      {
        if (v14 - location >= 0x20)
          v17 = 32;
        else
          v17 = v14 - location;
        *(_QWORD *)&v45 = v17;
        objc_msgSend(v13, sel_getUid("getCharacters:range:"), (char *)v47 + 8, location, v17);
        v18 = WORD4(v47[0]);
        v19 = *(_QWORD *)&v47[0];
        WORD4(v48) = WORD4(v47[0]);
        v13 = (objc_class *)v46;
      }
      if (v19 >= 0x20)
        v21 = 32;
      else
        v21 = v19;
      *(_QWORD *)&v45 = v21;
      *((_QWORD *)&v45 + 1) = v21;
      *(_QWORD *)&v47[0] = v19 - v21;
      objc_msgSend(v13, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v19 - v21, v21);
      v22 = v21;
      v23 = *((unsigned __int16 *)v47 + v21 + 3);
      WORD4(v48) = *((_WORD *)v47 + v21 + 3);
      if (v18 == 10)
      {
        v13 = v43;
        if (v23 == 13)
        {
          if (*((_QWORD *)&v45 + 1) < 2uLL)
          {
            v22 = *(_QWORD *)&v47[0];
            if (*(_QWORD *)&v47[0])
            {
              if (*(_QWORD *)&v47[0] >= 0x20uLL)
                v25 = 32;
              else
                v25 = *(_QWORD *)&v47[0];
              *(_QWORD *)&v45 = v25;
              *(_QWORD *)&v47[0] -= v25;
              v13 = v43;
              objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, *(_QWORD *)&v47[0], v25);
              v22 = v25;
              LOWORD(v23) = *((_WORD *)v47 + v25 + 3);
            }
            else
            {
              *((_QWORD *)&v45 + 1) = 0;
              LOWORD(v23) = -1;
            }
          }
          else
          {
            --*((_QWORD *)&v45 + 1);
            LOWORD(v23) = *((_WORD *)v47 + v21 + 2);
            v22 = v21 - 1;
          }
          WORD4(v48) = v23;
        }
      }
      else
      {
        v13 = v43;
      }
      while (1)
      {
        if (v7)
        {
          if ((unsigned __int16)(v23 - 14) >= 0x77u)
          {
            if ((unsigned __int16)v23 > 0x2027u)
            {
              if ((unsigned __int16)v23 - 8232 < 2)
                goto LABEL_60;
            }
            else if ((unsigned __int16)v23 == 10 || (unsigned __int16)v23 == 13 || (unsigned __int16)v23 == 133)
            {
              goto LABEL_60;
            }
          }
        }
        else if ((unsigned __int16)(v23 - 14) >= 0x201Bu
               && ((unsigned __int16)v23 == 10 || (unsigned __int16)v23 == 8233 || (unsigned __int16)v23 == 13))
        {
LABEL_60:
          v24 = *(_QWORD *)&v47[0] + v22;
          goto LABEL_62;
        }
        if ((uint64_t)(*(_QWORD *)&v47[0] + v22 - 1) < 1)
          break;
        if (v22 < 2)
        {
          if (*(_QWORD *)&v47[0])
          {
            if (*(_QWORD *)&v47[0] >= 0x20uLL)
              v26 = 32;
            else
              v26 = *(_QWORD *)&v47[0];
            *(_QWORD *)&v45 = v26;
            *(_QWORD *)&v47[0] -= v26;
            v13 = v43;
            objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, *(_QWORD *)&v47[0], v26);
            v22 = v26;
            LOWORD(v23) = *((_WORD *)v47 + v26 + 3);
          }
          else
          {
            v22 = 0;
            *((_QWORD *)&v45 + 1) = 0;
            LOWORD(v23) = -1;
          }
        }
        else
        {
          *((_QWORD *)&v45 + 1) = v22 - 1;
          LOWORD(v23) = *((_WORD *)v47 + v22-- + 2);
        }
        WORD4(v48) = v23;
      }
      v24 = 0;
LABEL_62:
      a4 = v42;
      v20 = a3;
      goto LABEL_63;
    }
  }
  else
  {
    v20 = a3;
    if (!a5 && v14 == length)
    {
      if (a3)
        *a3 = 0;
      if (a4)
        goto LABEL_120;
      return;
    }
    if (a3)
    {
      v24 = 0;
LABEL_63:
      *v20 = v24;
    }
  }
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    v27 = location + length - (length != 0);
    *((_QWORD *)&v46 + 1) = v14;
    *(_QWORD *)&v47[0] = v27;
    *(_QWORD *)&v46 = v13;
    if (v14 <= v27)
    {
      v32 = -1;
      WORD4(v48) = -1;
      v45 = xmmword_18205FD60;
LABEL_78:
      v33 = 1;
      while (1)
      {
        if (v7)
        {
          if ((unsigned __int16)(v32 - 14) >= 0x77u)
          {
            if (v32 > 0x2027u)
            {
              if (v32 - 8232 < 2)
                goto LABEL_101;
            }
            else if (v32 == 10 || v32 == 13 || v32 == 133)
            {
              goto LABEL_101;
            }
          }
        }
        else if ((unsigned __int16)(v32 - 14) >= 0x201Bu && (v32 == 10 || v32 == 8233 || v32 == 13))
        {
LABEL_101:
          v14 = v33 + *(_QWORD *)&v47[0] - 1;
          if (v33 >= (unint64_t)v45)
          {
            v38 = v45 + *(_QWORD *)&v47[0];
            if (*((_QWORD *)&v46 + 1) <= (_QWORD)v45 + *(_QWORD *)&v47[0])
            {
              *((_QWORD *)&v45 + 1) = v45 + 1;
              v37 = 0xFFFF;
              WORD4(v48) = -1;
            }
            else
            {
              if (*((_QWORD *)&v46 + 1) - ((_QWORD)v45 + *(_QWORD *)&v47[0]) >= 0x20uLL)
                v39 = 32;
              else
                v39 = *((_QWORD *)&v46 + 1) - (v45 + *(_QWORD *)&v47[0]);
              *(_QWORD *)&v47[0] += v45;
              *(_QWORD *)&v45 = v39;
              objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v38, v39);
              v37 = WORD4(v47[0]);
              WORD4(v48) = WORD4(v47[0]);
              *((_QWORD *)&v45 + 1) = 1;
            }
          }
          else
          {
            *((_QWORD *)&v45 + 1) = v33 + 1;
            v37 = *((unsigned __int16 *)v47 + v33 + 4);
            WORD4(v48) = v37;
          }
          if (v32 == 13)
          {
            v40 = v37 == 10;
            v31 = 1;
            if (v40)
              v31 = 2;
            goto LABEL_116;
          }
LABEL_115:
          v31 = 1;
          goto LABEL_116;
        }
        if (v33 + *(_QWORD *)&v47[0] - 1 == v14)
        {
          v31 = 0;
          goto LABEL_116;
        }
        if (v33 >= (unint64_t)v45)
        {
          v35 = v45 + *(_QWORD *)&v47[0];
          if (*((_QWORD *)&v46 + 1) > (_QWORD)v45 + *(_QWORD *)&v47[0])
          {
            if (*((_QWORD *)&v46 + 1) - ((_QWORD)v45 + *(_QWORD *)&v47[0]) >= 0x20uLL)
              v36 = 32;
            else
              v36 = *((_QWORD *)&v46 + 1) - (v45 + *(_QWORD *)&v47[0]);
            *(_QWORD *)&v47[0] += v45;
            *(_QWORD *)&v45 = v36;
            objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v35, v36);
            v32 = WORD4(v47[0]);
            WORD4(v48) = WORD4(v47[0]);
            *((_QWORD *)&v45 + 1) = 1;
            goto LABEL_78;
          }
          v33 = v45 + 1;
          *((_QWORD *)&v45 + 1) = v45 + 1;
          v32 = -1;
          WORD4(v48) = -1;
        }
        else
        {
          v34 = (char *)&v45 + 2 * v33++;
          *((_QWORD *)&v45 + 1) = v33;
          v32 = *((_WORD *)v34 + 20);
          WORD4(v48) = v32;
        }
      }
    }
    if (v14 - v27 >= 0x20)
      v28 = 32;
    else
      v28 = v14 - v27;
    *(_QWORD *)&v45 = v28;
    objc_msgSend(v13, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v27, v28);
    v32 = WORD4(v47[0]);
    WORD4(v48) = WORD4(v47[0]);
    *((_QWORD *)&v45 + 1) = 1;
    if (WORD4(v47[0]) != 10)
      goto LABEL_78;
    v29 = *(_QWORD *)&v47[0];
    if (!*(_QWORD *)&v47[0])
    {
      v14 = 0;
      goto LABEL_115;
    }
    if (*(_QWORD *)&v47[0] >= 0x20uLL)
      v30 = 32;
    else
      v30 = *(_QWORD *)&v47[0];
    *(_QWORD *)&v45 = v30;
    *((_QWORD *)&v45 + 1) = v30;
    *(_QWORD *)&v47[0] -= v30;
    objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v29 - v30, v30);
    v31 = 1;
    if (*((_WORD *)v47 + v30 + 3) == 13)
      v31 = 2;
    v14 = v29 - (*((_WORD *)v47 + *((_QWORD *)&v45 + 1) + 3) == 13);
LABEL_116:
    if (a5)
      *a5 = v14;
    if (a4)
    {
      length = v31 + v14;
LABEL_120:
      *a4 = length;
    }
  }
}

- (void)getParagraphStart:(NSUInteger *)startPtr end:(NSUInteger *)parEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range
{
  -[NSString _getBlockStart:end:contentsEnd:forRange:stopAtLineSeparators:](self, "_getBlockStart:end:contentsEnd:forRange:stopAtLineSeparators:", startPtr, parEndPtr, contentsEndPtr, range.location, range.length, 0);
}

CFStringTokenizerTokenType __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke(int a1, CFStringTokenizerRef tokenizer)
{
  CFStringTokenizerTokenType Token;
  CFStringTokenizerTokenType v4;

  do
  {
    while (1)
    {
      Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      v4 = Token;
      if (!Token)
        break;
      if ((Token & 0x10) == 0)
        return v4;
    }
  }
  while (CFStringTokenizerGetCurrentTokenRange(tokenizer).location != -1);
  return v4;
}

- (id)formatConfiguration
{
  return 0;
}

- (NSRange)rangeOfString:(NSString *)searchString
{
  NSUInteger v3;
  NSUInteger v4;
  NSRange result;

  v3 = -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", searchString, 0, 0, -[NSString length](self, "length"), 0);
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSString)substringFromIndex:(NSUInteger)from
{
  NSUInteger v6;
  void *v8;

  v6 = -[NSString length](self, "length");
  if (v6 < from)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Index %lu out of bounds; string length %lu"),
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     from,
                     v6),
                   0);
    objc_exception_throw(v8);
  }
  return -[NSString substringWithRange:](self, "substringWithRange:", from, v6 - from);
}

- (BOOL)hasSuffix:(NSString *)str
{
  return -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", str, 12, 0, -[NSString length](self, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasPrefix:(NSString *)str
{
  return -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", str, 8, 0, -[NSString length](self, "length")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)getFileSystemRepresentation:(char *)cname maxLength:(NSUInteger)max
{
  return _NSGetFileSystemRepresentation(cname, max, self);
}

- (_NSRange)_rangeOfRegularExpressionPattern:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v11;
  NSString *v12;
  NSRegularExpression *v13;
  NSRegularExpression *v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  v11 = a4 & 1;
  if (_MergedGlobals_144 != -1)
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lx:%@"), v11, a3);
  v13 = (NSRegularExpression *)(id)objc_msgSend((id)qword_1ECD0A628, "objectForKey:", v12);
  if (!v13)
  {
    v14 = -[NSRegularExpression initWithPattern:options:error:]([NSRegularExpression alloc], "initWithPattern:options:error:", a3, v11, 0);
    if (!v14)
    {
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      v19 = 0;
      goto LABEL_8;
    }
    v13 = v14;
    objc_msgSend((id)qword_1ECD0A628, "setObject:forKey:", v14, v12);
  }
  v15 = -[NSRegularExpression rangeOfFirstMatchInString:options:range:](v13, "rangeOfFirstMatchInString:options:range:", self, (a4 >> 1) & 4, location, length);
  v17 = v16;

  v18 = v15;
  v19 = v17;
LABEL_8:
  result.length = v19;
  result.location = v18;
  return result;
}

- (NSString)stringByAppendingPathExtension:(NSString *)str
{
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  _WORD *v10;
  _WORD *v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  unint64_t v17;
  int v18;
  NSString *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!str)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v21);
  }
  v6 = -[NSString length](str, "length");
  v7 = -[NSString length](self, "length");
  v22 = v7;
  if (!v6)
    return (NSString *)(id)-[NSString copy](self, "copy");
  v8 = v7;
  MEMORY[0x1E0C80A78](v7);
  v10 = (_WORD *)((char *)&v22 - v9);
  if (v6 > 0x100)
  {
    v11 = malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
    v10 = v11;
  }
  else
  {
    bzero((char *)&v22 - v9, 2 * v6);
  }
  v13 = v6 + v8 + 1;
  MEMORY[0x1E0C80A78](v11);
  v16 = (unsigned __int16 *)((char *)&v22 - v15);
  if (v13 > 0x100)
    v16 = (unsigned __int16 *)malloc_type_malloc(2 * v14, 0x1000040BDFB0063uLL);
  else
    bzero((char *)&v22 - v15, 2 * v14);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v16, 0, v8, v22, v23);
  -[NSString getCharacters:range:](str, "getCharacters:range:", v10, 0, v6);
  if ((_NSAppendPathExtension(v16, &v22, v6 + v8 + 1, v10, v6) & 1) != 0)
  {
    _NSTransmutePathSlashes(v16, &v22);
    v17 = v22;
    if (v22 >= 2 && v16[v22 - 1] == 47)
    {
      while (v17 > 2)
      {
        v18 = v16[v17-- - 2];
        if (v18 != 47)
          goto LABEL_18;
      }
      v17 = 1;
    }
LABEL_18:
    v20 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v16, v17);
  }
  else
  {
    v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: cannot append extension '%@' to path '%@'"), v19, str, self);
    v20 = 0;
  }
  if (v6 >= 0x101)
    free(v10);
  if (v13 >= 0x101)
    free(v16);
  return v20;
}

- (NSString)pathExtension
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  v13[0] = v3;
  MEMORY[0x1E0C80A78](v3);
  v6 = (_WORD *)((char *)v13 - v5);
  if (v7 > 0x100)
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
  else
    bzero((char *)v13 - v5, 2 * v4);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3, v13[0]);
  _NSTransmutePathSlashes(v6, v13);
  v8 = v13[0];
  if (v13[0] > 1)
  {
    if (v6[v13[0] - 1] == 47)
    {
      while (v8 > 2)
      {
        v9 = (unsigned __int16)v6[v8-- - 2];
        if (v9 != 47)
          goto LABEL_10;
      }
      v8 = 1;
    }
LABEL_10:
    v13[0] = v8;
  }
  v10 = _NSStartOfPathExtension((uint64_t)v6, v8);
  if (v10 < 1)
    v11 = (NSString *)&stru_1E0F56070;
  else
    v11 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", &v6[v10 + 1], v8 + ~v10);
  if (v3 >= 0x101)
    free(v6);
  return v11;
}

- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3
{
  _BOOL4 v3;
  NSUInteger v5;
  uint64_t v7;
  unsigned __int16 v8[1024];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if ((int64_t)-[NSString length](self, "length") > 1023)
    v5 = 1024;
  else
    v5 = -[NSString length](self, "length");
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0, v5);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSResolveSymlinksInPathUsingCache(v8, &v7, v3);
  _NSStandardizePathUsingCache(v8, &v7, v3);
  return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v8, v7);
}

- (id)_stringByStandardizingPathUsingCache:(BOOL)a3
{
  _BOOL4 v3;
  NSUInteger v5;
  uint64_t v7;
  unsigned __int16 v8[1024];
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  if ((int64_t)-[NSString length](self, "length") > 1023)
    v5 = 1024;
  else
    v5 = -[NSString length](self, "length");
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0, v5);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSStandardizePathUsingCache(v8, &v7, v3);
  return +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v8, v7);
}

- (NSString)stringByAppendingPathComponent:(NSString *)str
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  NSString *v19;
  NSString *v20;
  NSObject *v22;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  NSUInteger v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  NSUInteger v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = -[NSString length](str, "length");
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v26 - v8;
  if (v10 > 0x100)
    v9 = (char *)malloc_type_malloc(2 * v7, 0x1000040BDFB0063uLL);
  else
    bzero((char *)&v26 - v8, 2 * v7);
  -[NSString getCharacters:range:](str, "getCharacters:range:", v9, 0, v6);
  v11 = -[NSString length](self, "length");
  v27 = v11;
  v12 = v6 + v11 + 1;
  MEMORY[0x1E0C80A78](v11);
  v15 = (unsigned __int16 *)((char *)&v26 - v14);
  if (v12 > 0x100)
    v15 = (unsigned __int16 *)malloc_type_malloc(2 * v13, 0x1000040BDFB0063uLL);
  else
    bzero((char *)&v26 - v14, 2 * v13);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v15, 0, v11);
  if ((_NSAppendPathComponent(v15, &v27, v12, v9, v6) & 1) == 0)
  {
    v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: cannot append path '%@' to path '%@'"), v19, str, self);
    return 0;
  }
  _NSTransmutePathSlashes(v15, &v27);
  v16 = v27;
  if (v27 < 2)
    goto LABEL_16;
  if (v15[v27 - 1] == 47)
  {
    do
    {
      if ((unint64_t)v16 <= 2)
      {
        v18 = 0;
        v16 = 1;
        goto LABEL_23;
      }
      v17 = v15[v16-- - 2];
    }
    while (v17 == 47);
    if (v16 < 2)
      goto LABEL_16;
  }
  if (*v15 == 92)
    v18 = 2 * (v15[1] == 92);
  else
LABEL_16:
    v18 = 0;
  if (v18 >= v16)
    goto LABEL_18;
LABEL_23:
  if (!v15[v18])
  {
LABEL_27:
    v22 = _NSOSLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v24 = -[NSString length](str, "length");
      v25 = -[NSString length](self, "length");
      *(_DWORD *)buf = 138478595;
      v29 = str;
      v30 = 2048;
      v31 = v24;
      v32 = 2113;
      v33 = self;
      v34 = 2048;
      v35 = v25;
      _os_log_fault_impl(&dword_1817D9000, v22, OS_LOG_TYPE_FAULT, "Appending path component %{private}@ (length: %lu) to string %{private}@ (length: %lu) resulted in an embedded NUL character", buf, 0x2Au);
    }
    return 0;
  }
  while (v16 - 1 != v18)
  {
    if (!v15[++v18])
    {
      if (v18 >= v16)
        break;
      goto LABEL_27;
    }
  }
LABEL_18:
  v20 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v15);
  if (v12 >= 0x101)
    free(v15);
  if (v6 >= 0x101)
    free(v9);
  return v20;
}

- (NSString)lastPathComponent
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSString *v13;
  uint64_t v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  v15[0] = v3;
  MEMORY[0x1E0C80A78](v3);
  v6 = (_WORD *)((char *)v15 - v5);
  if (v7 > 0x100)
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
  else
    bzero((char *)v15 - v5, 2 * v4);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3, v15[0]);
  _NSTransmutePathSlashes(v6, v15);
  v8 = v15[0];
  if (v15[0] >= 2)
  {
    if (v6[v15[0] - 1] != 47)
    {
LABEL_10:
      v11 = v8;
      do
      {
        v10 = v11 - 1;
        if (v11 == 1)
          break;
        v12 = (unsigned __int16)v6[v11-- - 2];
      }
      while (v12 != 47);
      goto LABEL_15;
    }
    do
    {
      if ((unint64_t)v8 <= 2)
      {
        v10 = 0;
        v8 = 1;
        v15[0] = 1;
        goto LABEL_15;
      }
      v9 = (unsigned __int16)v6[v8-- - 2];
    }
    while (v9 == 47);
    v15[0] = v8;
    if (v8 >= 2)
      goto LABEL_10;
  }
  v10 = 0;
LABEL_15:
  v13 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", &v6[v10], v8 - v10, v15[0]);
  if (v3 >= 0x101)
    free(v6);
  return v13;
}

- (BOOL)isAbsolutePath
{
  uint64_t v3;
  _WORD v6[3];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((int64_t)-[NSString length](self, "length") >= 3)
  {
    -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, 3);
  }
  else
  {
    v3 = -[NSString length](self, "length");
    -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3);
    if (v3 < 1)
      return 0;
  }
  return v6[0] == 126 || v6[0] == 47;
}

- (NSString)stringByStandardizingPath
{
  return (NSString *)-[NSString _stringByStandardizingPathUsingCache:](self, "_stringByStandardizingPathUsingCache:", 0);
}

- (NSString)capitalizedStringWithLocale:(NSLocale *)locale
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringCapitalize(Mutable, (CFLocaleRef)locale);
  return (NSString *)Mutable;
}

- (NSString)uppercaseString
{
  return -[NSString uppercaseStringWithLocale:](self, "uppercaseStringWithLocale:", 0);
}

- (NSString)uppercaseStringWithLocale:(NSLocale *)locale
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringUppercase(Mutable, (CFLocaleRef)locale);
  return (NSString *)Mutable;
}

- (NSString)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v9;

  if (!replacement)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  length = range.length;
  location = range.location;
  v7 = (void *)-[NSString mutableCopy](self, "mutableCopy");
  objc_msgSend(v7, "replaceCharactersInRange:withString:", location, length, replacement);
  return (NSString *)v7;
}

- (void)getCharacters:(unichar *)buffer
{
  -[NSString getCharacters:range:](self, "getCharacters:range:", buffer, 0, -[NSString length](self, "length"));
}

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return writeStringToURLOrPath(self, path, useAuxiliaryFile, enc, error);
}

- (BOOL)getExternalRepresentation:(id *)a3 extendedAttributes:(id *)a4 forWritingToURLOrPath:(id)a5 usingEncoding:(unint64_t)a6 error:(id *)a7
{
  uint64_t v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  uint64_t v17;
  BOOL result;
  NSError *v19;
  NSError *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v13 = _NSEncodingToNewDataForExtendedAttribute(a6);
    if (!v13)
    {
      if (a7)
      {
        v20 = _NSErrorWithFilePathAndEncoding(517, (uint64_t)a5, a6);
        result = 0;
        *a7 = v20;
        return result;
      }
      return 0;
    }
    v14 = (void *)v13;
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v13, CFSTR("com.apple.TextEncoding"), 0);

  }
  if (!a3)
    return 1;
  v21 = 0;
  v22[0] = 0;
  v15 = -[NSString length](self, "length");
  if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", 0, 0x7FFFFFFFFFFFFFFELL, v22, a6, 0, 0, v15, 0))
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v22[0]);
    v17 = objc_msgSend(v16, "mutableBytes");
    if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", v17, v22[0], &v21, a6, 0, 0, v15, 0))
    {
      *a3 = v16;
      return 1;
    }
    if (!a7)
      return 0;
    v19 = _NSErrorWithFilePath(512, (uint64_t)a5);
    goto LABEL_15;
  }
  if (a7)
  {
    v19 = _NSErrorWithFilePathAndEncoding(517, (uint64_t)a5, a6);
LABEL_15:
    *a7 = v19;
  }
  return 0;
}

- (BOOL)_getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unsigned int)a5
{
  unint64_t v8;
  BOOL result;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v8 = CFStringConvertEncodingToNSStringEncoding(a5);
  if (v8 == 0xFFFFFFFF
    || (v10[0] = 0,
        !-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", a3, a4, v10, v8, 0, 0, -[NSString length](self, "length"), 0)))
  {
    result = 0;
  }
  else
  {
    a3 += v10[0];
    result = 1;
  }
  *a3 = 0;
  return result;
}

- (BOOL)getBytes:(char *)a3 maxLength:(unint64_t)a4 filledLength:(unint64_t *)a5 encoding:(unint64_t)a6 allowLossyConversion:(BOOL)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  return -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", a3, a4, a5, a6, a7 | 6);
}

- (NSString)stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet *)allowedCharacters
{
  return (NSString *)(id)_CFStringCreateByAddingPercentEncodingWithAllowedCharacters();
}

+ (NSString)stringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  va_list va;

  va_start(va, error);
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format, validFormatSpecifiers, 0, va, error);
}

- (NSArray)pathComponents
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  unint64_t v7;
  NSArray *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  MEMORY[0x1E0C80A78](v3);
  v6 = (_WORD *)((char *)v10 - v5);
  if (v7 > 0x100)
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
  else
    bzero((char *)v10 - v5, 2 * v4);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3);
  v8 = (NSArray *)_NSPathComponents(v6, v3);
  if (v3 >= 0x101)
    free(v6);
  return v8;
}

+ (NSString)stringWithCharacters:(const unichar *)characters length:(NSUInteger)length
{
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithCharacters:length:", characters, length);
}

+ (void)initialize
{
  Class v3;
  objc_class *v4;

  if ((id)objc_opt_class() == a1)
  {
    if (!__NSDefaultStringEncodingFullyInited)
      _NSDefaultCStringEncoding();
    v3 = objc_lookUpClass("NSTaggedPointerString");
    if (v3)
    {
      v4 = v3;
      if (dyld_program_sdk_at_least())
      {
        if (!getenv("NSStringDisableTagged"))
          goto LABEL_10;
      }
      else if (getenv("NSStringEnableTagged"))
      {
LABEL_10:
        class_setSuperclass(v4, (Class)a1);
        -[objc_class _setAsTaggedStringClass](v4, "_setAsTaggedStringClass");
      }
    }
  }
}

- (BOOL)containsString:(NSString *)str
{
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", str, 0, 0, -[NSString length](self, "length"), 0) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)_stringWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithFormat:locale:options:arguments:", a3, a4, a5, a6);
}

- (id)_web_HTTPStyleLanguageCode
{
  void *v3;
  NSString *v4;
  void *v5;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (CFBundleGetLocalizationInfoForLocalization())
  {
    v3 = (void *)CFBundleCopyLocalizationForLocalizationInfo();
    if (v3)
      self = v3;
  }
  v4 = -[NSString lowercaseString](self, "lowercaseString", 0, v7);
  if (-[NSString length](v4, "length") >= 3 && -[NSString characterAtIndex:](v4, "characterAtIndex:", 2) == 95)
  {
    v5 = (void *)-[NSString mutableCopy](v4, "mutableCopy");
    objc_msgSend(v5, "replaceCharactersInRange:withString:", 2, 1, CFSTR("-"));
    return v5;
  }
  return v4;
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet
{
  NSUInteger v3;
  NSUInteger v4;
  NSRange result;

  v3 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", searchSet, 0, 0, -[NSString length](self, "length"));
  result.length = v4;
  result.location = v3;
  return result;
}

- (NSArray)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separator
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSUInteger v14;
  uint64_t v15;
  id v16;

  v5 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", separator, 0, 0, -[NSString length](self, "length"));
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    v9 = -[NSString length](self, "length");
    v10 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = -[NSString zone](self, "zone");
    v12 = 0;
    do
    {
      v13 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v7 - v12, v11);
      -[NSArray addObject:](v10, "addObject:", v13);

      v12 = v7 + v8;
      v14 = v9 - (v7 + v8);
      v7 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", separator, 0, v7 + v8, v14);
      v8 = v15;
    }
    while (v15);
    v16 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v14, v11);
    -[NSArray addObject:](v10, "addObject:", v16);
  }
  else
  {
    v16 = (id)-[NSString copy](self, "copy");
    v10 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v16);
  }

  return v10;
}

+ (NSString)string
{
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "init");
}

+ (NSString)stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc
{
  void *v5;

  if (!cString)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NULL cString"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
    objc_exception_throw(v5);
  }
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithBytes:length:encoding:", cString, strlen(cString), enc);
}

- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5;
  NSUInteger result;

  v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc)
      return 0;
    if (_CFExecutableLinkedOnOrAfter())
      NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), enc);
    v5 = 1536;
  }
  result = CFStringGetMaximumSizeForEncoding(-[NSString length](self, "length"), v5);
  if (result == -1)
    return 0;
  return result;
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask
{
  if (self == string)
    return 0;
  else
    return -[NSString compare:options:range:](self, "compare:options:range:", string, mask, 0, -[NSString length](self, "length"));
}

+ (NSStringEncoding)defaultCStringEncoding
{
  if (__NSDefaultStringEncodingFullyInited)
    return _NSDefaultStringEncoding;
  else
    return _NSDefaultCStringEncoding();
}

- (const)cStringUsingEncoding:(NSStringEncoding)encoding
{
  return (const char *)bytesInEncoding(self, encoding, 0, 0, 0);
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask
{
  NSUInteger v4;
  NSUInteger v5;
  NSRange result;

  v4 = -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", searchString, mask, 0, -[NSString length](self, "length"), 0);
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSString)initWithCoder:(NSCoder *)coder
{
  uint64_t v5;
  NSInteger v7;
  const uint8_t *v8;
  NSString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    v7 = -[NSCoder versionForClassName:](coder, "versionForClassName:", CFSTR("NSString"));
    if (v7 != 1)
    {
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSString cannot decode class version %lu"), v7);

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v9, 0));
    }
    v10[0] = 0;
    v8 = -[NSCoder decodeBytesWithReturnedLength:](coder, "decodeBytesWithReturnedLength:", v10);
    return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", v8, v10[0], 4);
  }
  if (!-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NS.string")))
  {
    v10[0] = 0;
    v8 = -[NSCoder decodeBytesForKey:returnedLength:](coder, "decodeBytesForKey:returnedLength:", CFSTR("NS.bytes"), v10);
    return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", v8, v10[0], 4);
  }
  v5 = -[NSCoder _decodePropertyListForKey:](coder, "_decodePropertyListForKey:", CFSTR("NS.string"));
  if ((_NSIsNSString() & 1) != 0)
    return -[NSString initWithString:](self, "initWithString:", v5);
  -[NSCoder failWithError:](coder, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Decoded object is not a string")));

  return 0;
}

- (NSString)substringToIndex:(NSUInteger)to
{
  NSUInteger v6;
  void *v8;

  v6 = -[NSString length](self, "length");
  if (v6 < to)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Index %lu out of bounds; string length %lu"),
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     to,
                     v6),
                   0);
    objc_exception_throw(v8);
  }
  return -[NSString substringWithRange:](self, "substringWithRange:", 0, to);
}

- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement
{
  return -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self, "stringByReplacingOccurrencesOfString:withString:options:range:", target, replacement, 0, 0, -[NSString length](self, "length"));
}

- (NSString)stringByAddingPercentEscapesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5;

  v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc)
    {
      v5 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), enc);
      v5 = 1536;
    }
  }
  return (NSString *)(id)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)self, 0, 0, v5);
}

- (NSString)stringByRemovingPercentEncoding
{
  return (NSString *)(id)_CFStringCreateByRemovingPercentEncoding();
}

- (NSString)stringByExpandingTildeInPath
{
  NSUInteger v3;
  unint64_t v4;
  int v5;
  uint64_t v7;
  _WORD v8[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((int64_t)-[NSString length](self, "length") > 1023)
    v3 = 1024;
  else
    v3 = -[NSString length](self, "length");
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0, v3);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSTransmutePathSlashes(v8, &v7);
  v4 = v7;
  if (v7 >= 2 && v8[v7 - 1] == 47)
  {
    while (v4 > 2)
    {
      v5 = (unsigned __int16)v8[v4-- - 2];
      if (v5 != 47)
        return (NSString *)+[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v8, v4);
    }
    v4 = 1;
  }
  return (NSString *)+[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v8, v4);
}

- (NSString)precomposedStringWithCanonicalMapping
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormC);
  return (NSString *)Mutable;
}

- (NSRange)rangeOfComposedCharacterSequencesForRange:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSRange result;

  length = range.length;
  location = range.location;
  v6 = -[NSString length](self, "length");
  if (location == v6)
    v7 = location;
  else
    v7 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self, "rangeOfComposedCharacterSequenceAtIndex:", location);
  if (location + length != v6)
  {
    if (length)
      v8 = location + length - 1;
    else
      v8 = location;
    v9 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self, "rangeOfComposedCharacterSequenceAtIndex:", v8);
    v6 = v9 + v10;
  }
  v11 = v6 - v7;
  v12 = v7;
  result.length = v11;
  result.location = v12;
  return result;
}

- (NSString)commonPrefixWithString:(NSString *)str options:(NSStringCompareOptions)mask
{
  uint64_t v5;
  int64_t v6;
  NSString *result;
  const unsigned __int16 *v8;
  UniChar *v9;
  unint64_t v10;
  malloc_zone_t *v11;
  uint64_t v12;
  unint64_t v13;
  __CFString *MutableWithExternalCharactersNoCopy;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const __CFAllocator *externalCharactersAllocator;
  NSString *v25;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = -[NSString length](self, "length");
  v25 = str;
  v6 = -[NSString length](str, "length");
  result = (NSString *)&stru_1E0F56070;
  if (v5 && v6)
  {
    v8 = -[NSString _fastCharacterContents](self, "_fastCharacterContents");
    if (v8)
    {
      v9 = (UniChar *)v8;
      v23 = 0;
      v10 = v5;
    }
    else if (v5 < 101)
    {
      v10 = 0;
      v23 = 0;
      v9 = (UniChar *)&v28;
    }
    else
    {
      v11 = malloc_default_zone();
      v9 = (UniChar *)malloc_type_zone_malloc(v11, 2 * v5, 0x4A6F13AEuLL);
      v10 = 0;
      v23 = 1;
    }
    v12 = 0;
    v13 = 0;
    MutableWithExternalCharactersNoCopy = 0;
    if (v5 >= 0)
      v15 = v5;
    else
      v15 = v5 + 1;
    v16 = v15 >> 1;
    if (v16 >= v6)
      v17 = v6;
    else
      v17 = v16;
    externalCharactersAllocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
    while (1)
    {
      if ((mask & 2) != 0)
      {
        v20 = v17 + 1;
      }
      else
      {
        v18 = -[NSString rangeOfComposedCharacterSequenceAtIndex:](self, "rangeOfComposedCharacterSequenceAtIndex:", v17);
        v20 = v18 + v19;
      }
      if (v20 > v10)
      {
        -[NSString getCharacters:range:](self, "getCharacters:range:", &v9[v10], v10, v20 - v10);
        v10 = v20;
      }
      if (MutableWithExternalCharactersNoCopy)
        CFStringSetExternalCharactersNoCopy(MutableWithExternalCharactersNoCopy, v9, v20, v20);
      else
        MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, v9, v20, v20, externalCharactersAllocator);
      -[NSString rangeOfString:options:range:](v25, "rangeOfString:options:range:", MutableWithExternalCharactersNoCopy, mask | 8, 0, v6);
      if (v21)
        v12 = v17 + 1;
      else
        v5 = v17;
      if (v21)
        v13 = v20;
      if (v12 >= v5)
        break;
      v22 = v12 + v5;
      if (v12 + v5 < 0 != __OFADD__(v12, v5))
        ++v22;
      v17 = v22 >> 1;
    }
    CFRelease(MutableWithExternalCharactersNoCopy);
    if (v23)
      free(v9);
    if (v13)
      return -[NSString substringWithRange:](self, "substringWithRange:", 0, v13);
    else
      return (NSString *)&stru_1E0F56070;
  }
  return result;
}

- (NSRange)rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index
{
  NSUInteger RangeOfCharacterClusterAtIndex;
  NSUInteger v5;
  NSString *v6;
  NSRange result;

  if (-[NSString length](self, "length") <= index)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The index %ld is invalid"), index);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  }
  RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
  result.length = v5;
  result.location = RangeOfCharacterClusterAtIndex;
  return result;
}

- (NSString)stringByDeletingPathExtension
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  NSString *v12;
  uint64_t v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  v14[0] = v3;
  MEMORY[0x1E0C80A78](v3);
  v6 = (_WORD *)((char *)v14 - v5);
  if (v7 > 0x100)
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
  else
    bzero((char *)v14 - v5, 2 * v4);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3, v14[0]);
  _NSTransmutePathSlashes(v6, v14);
  v8 = v14[0];
  if (v14[0] >= 2 && v6[v14[0] - 1] == 47)
  {
    while (v8 > 2)
    {
      v9 = (unsigned __int16)v6[v8-- - 2];
      if (v9 != 47)
        goto LABEL_10;
    }
    v8 = 1;
  }
LABEL_10:
  v10 = _NSStartOfPathExtension((uint64_t)v6, v8);
  if (v10 <= 0)
    v11 = v8;
  else
    v11 = v10;
  v12 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v6, v11);
  if (v3 >= 0x101)
    free(v6);
  return v12;
}

- (float)floatValue
{
  int v2;
  float result;
  unint64_t v4;
  double v5[2];

  v5[1] = *(double *)MEMORY[0x1E0C80C00];
  v4 = 0;
  v5[0] = 0.0;
  v2 = _NSScanDoubleFromString(self, +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"), v5, &v4, 0);
  result = v5[0];
  if (!v2)
    return 0.0;
  return result;
}

- (double)doubleValue
{
  int v2;
  double result;
  unint64_t v4;
  double v5[2];

  v5[1] = *(double *)MEMORY[0x1E0C80C00];
  v4 = 0;
  v5[0] = 0.0;
  v2 = _NSScanDoubleFromString(self, +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"), v5, &v4, 0);
  result = v5[0];
  if (!v2)
    return 0.0;
  return result;
}

- (NSString)initWithCharacters:(const unichar *)characters length:(NSUInteger)length
{
  NSString *v4;
  NSUInteger v5;
  malloc_zone_t *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = self;
  if (length)
  {
    v5 = length;
    v7 = (malloc_zone_t *)-[NSString zone](self, "zone");
    if (!v7)
      v7 = malloc_default_zone();
    v8 = malloc_type_zone_malloc(v7, 2 * v5, 0x4A6F13AEuLL);
    memmove(v8, characters, 2 * v5);
    self = v4;
    v9 = v8;
    length = v5;
    v10 = 1;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  return -[NSString initWithCharactersNoCopy:length:freeWhenDone:](self, "initWithCharactersNoCopy:length:freeWhenDone:", v9, length, v10);
}

+ (NSString)pathWithComponents:(NSArray *)components
{
  return (NSString *)+[NSPathStore2 pathWithComponents:](NSPathStore2, "pathWithComponents:", components);
}

- (BOOL)localizedCaseInsensitiveContainsString:(NSString *)str
{
  NSUInteger v5;

  v5 = -[NSString length](self, "length");
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", str, 1, 0, v5, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_web_looksLikeIPAddress
{
  unsigned int v3;
  const char *v4;
  BOOL v5;
  const char *v6;
  _BYTE v8[255];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self, "length"))
    return 0;
  v3 = -[NSString characterAtIndex:](self, "characterAtIndex:", 0);
  if (v3 != 58 && (v3 > 0xFF || (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v3 + 60) & 0x10000) == 0))
    return 0;
  if (-[NSString isEqualToString:](self, "isEqualToString:", CFSTR(".")))
    return 0;
  if (!-[NSString canBeConvertedToEncoding:](self, "canBeConvertedToEncoding:", 1))
    return 0;
  v4 = -[NSString cStringUsingEncoding:](self, "cStringUsingEncoding:", 1);
  v5 = v4 != 0;
  if (v4)
  {
    v6 = v4;
    if (inet_pton(2, v4, v8) != 1 && inet_pton(30, v6, v8) != 1)
      return 0;
  }
  return v5;
}

- (BOOL)canBeConvertedToEncoding:(NSStringEncoding)encoding
{
  uint64_t v5;

  if (encoding < 0xB && ((0x491u >> encoding) & 1) != 0)
    return 1;
  if (CFStringConvertNSStringEncodingToEncoding(encoding) != -1)
  {
LABEL_7:
    -[NSString length](self, "length");
    v5 = __CFStringEncodeByteStream();
    return v5 == -[NSString length](self, "length", 0);
  }
  if (encoding == 134217984)
  {
    if (_CFExecutableLinkedOnOrAfter())
      NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), 134217984);
    goto LABEL_7;
  }
  return 0;
}

- (NSString)stringByPaddingToLength:(NSUInteger)newLength withString:(NSString *)padString startingAtIndex:(NSUInteger)padIndex
{
  NSUInteger v10;
  NSUInteger v11;
  __CFString *MutableCopy;
  __CFString *v13;
  NSString *v15;
  const char *v16;
  NSString *v17;

  v10 = -[NSString length](self, "length");
  if (v10 < newLength)
  {
    v11 = -[NSString length](padString, "length");
    if (v11)
    {
      if (v11 > padIndex)
      {
        MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFStringRef)self);
        CFStringPad(MutableCopy, (CFStringRef)padString, newLength, padIndex);
        v13 = MutableCopy;
        return (NSString *)v13;
      }
      v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      v16 = "out of range padIndex";
    }
    else
    {
      v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      v16 = "nil or empty padString";
    }
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), v15, v16);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0));
  }
  if (v10 != newLength)
    return -[NSString substringWithRange:](self, "substringWithRange:", 0, newLength);
  v13 = -[NSString copyWithZone:](self, "copyWithZone:", -[NSString zone](self, "zone"));
  return (NSString *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NSString initWithString:](+[NSString allocWithZone:](NSString, "allocWithZone:", a3), "initWithString:", self);
}

- (BOOL)BOOLValue
{
  NSCharacterSet *v3;
  NSUInteger v4;
  uint64_t v5;
  __int16 v6;
  __int128 v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL result;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  NSString *v21;
  NSUInteger v22;
  _OWORD v23[4];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet");
  v4 = -[NSString length](self, "length");
  v24 = 0u;
  memset(v23, 0, sizeof(v23));
  v20 = 0u;
  v21 = self;
  v22 = v4;
  if (v4)
  {
    if (v4 >= 0x20)
      v5 = 32;
    else
      v5 = v4;
    *(_QWORD *)&v20 = v5;
    objc_msgSend(self, sel_getUid("getCharacters:range:"), (char *)v23 + 8, 0, v5);
    v6 = WORD4(v23[0]);
  }
  else
  {
    v6 = -1;
  }
  *((_QWORD *)&v20 + 1) = 1;
  WORD4(v24) = v6;
  if (-[NSCharacterSet characterIsMember:](v3, "characterIsMember:", (_QWORD)v20))
  {
    do
    {
      v7 = v20;
      if (*((_QWORD *)&v20 + 1) >= (unint64_t)v20)
      {
        v9 = *(_QWORD *)&v23[0] + v20;
        if (v22 > *(_QWORD *)&v23[0] + (_QWORD)v20)
        {
          if (v22 - (*(_QWORD *)&v23[0] + (_QWORD)v20) >= 0x20)
            v10 = 32;
          else
            v10 = v22 - (*(_QWORD *)&v23[0] + v20);
          *(_QWORD *)&v23[0] += v20;
          *(_QWORD *)&v20 = v10;
          objc_msgSend(v21, sel_getUid("getCharacters:range:"), (char *)v23 + 8, v9, v10);
          WORD4(v24) = WORD4(v23[0]);
          *((_QWORD *)&v20 + 1) = 1;
          continue;
        }
        *((_QWORD *)&v20 + 1) = v20 + 1;
        v8 = -1;
      }
      else
      {
        ++*((_QWORD *)&v20 + 1);
        v8 = *((_WORD *)v23 + *((_QWORD *)&v7 + 1) + 4);
      }
      WORD4(v24) = v8;
    }
    while (-[NSCharacterSet characterIsMember:](v3, "characterIsMember:"));
  }
  v11 = WORD4(v24);
  result = 1;
  if (WORD4(v24) <= 0x58u)
  {
    if (WORD4(v24) == 43 || WORD4(v24) == 45)
    {
      v13 = v20;
      if (*((_QWORD *)&v20 + 1) >= (unint64_t)v20)
      {
        v14 = *(_QWORD *)&v23[0] + v20;
        if (v22 <= *(_QWORD *)&v23[0] + (_QWORD)v20)
        {
LABEL_45:
          v11 = 0xFFFF;
          return (v11 - 49) < 9;
        }
        if (v22 - (*(_QWORD *)&v23[0] + (_QWORD)v20) >= 0x20)
          v15 = 32;
        else
          v15 = v22 - (*(_QWORD *)&v23[0] + v20);
        *(_QWORD *)&v23[0] += v20;
        *(_QWORD *)&v20 = v15;
        objc_msgSend(v21, sel_getUid("getCharacters:range:"), (char *)v23 + 8, v14, v15);
        v11 = WORD4(v23[0]);
        WORD4(v24) = WORD4(v23[0]);
        *((_QWORD *)&v20 + 1) = 1;
      }
      else
      {
        ++*((_QWORD *)&v20 + 1);
        v11 = *((unsigned __int16 *)v23 + *((_QWORD *)&v13 + 1) + 4);
        WORD4(v24) = *((_WORD *)v23 + *((_QWORD *)&v13 + 1) + 4);
      }
    }
    else if (WORD4(v24) == 84)
    {
      return result;
    }
LABEL_34:
    if (v11 == 48)
    {
      v16 = *((_QWORD *)&v20 + 1);
      do
      {
        if (v16 >= (unint64_t)v20)
        {
          v18 = *(_QWORD *)&v23[0] + v20;
          if (v22 <= *(_QWORD *)&v23[0] + (_QWORD)v20)
            goto LABEL_45;
          if (v22 - (*(_QWORD *)&v23[0] + (_QWORD)v20) >= 0x20)
            v19 = 32;
          else
            v19 = v22 - (*(_QWORD *)&v23[0] + v20);
          *(_QWORD *)&v23[0] += v20;
          *(_QWORD *)&v20 = v19;
          objc_msgSend(v21, sel_getUid("getCharacters:range:"), (char *)v23 + 8, v18, v19);
          v11 = WORD4(v23[0]);
          WORD4(v24) = WORD4(v23[0]);
          *((_QWORD *)&v20 + 1) = 1;
          v16 = 1;
        }
        else
        {
          v17 = (char *)&v20 + 2 * v16++;
          *((_QWORD *)&v20 + 1) = v16;
          v11 = *((unsigned __int16 *)v17 + 20);
          WORD4(v24) = v11;
        }
      }
      while (v11 == 48);
    }
    return (v11 - 49) < 9;
  }
  if (WORD4(v24) != 89 && WORD4(v24) != 116 && WORD4(v24) != 121)
    goto LABEL_34;
  return result;
}

+ (NSString)stringWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithContentsOfURL:encoding:error:", url, enc, error);
}

+ (NSString)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithContentsOfFile:encoding:error:", path, enc, error);
}

- (NSString)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error
{
  NSString *result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13[2];

  v13[1] = *(void **)MEMORY[0x1E0C80C00];
  if (_NSIsNSURL())
    return -[NSString initWithContentsOfURL:encoding:error:](self, "initWithContentsOfURL:encoding:error:", path, enc, error);
  v12 = 0;
  v13[0] = 0;
  v11 = 0;
  LOBYTE(v10) = 0;
  if (objc_msgSend(MEMORY[0x1E0C99D50], "_readBytesFromPath:maxLength:bytes:length:didMap:options:reportProgress:error:", path, 0x7FFFFFFFFFFFFFFFLL, v13, &v12, &v11, 0, v10, error))
  {
    if (v12 || v13[0])
    {
      result = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:](self, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v13[0]);
      if (result)
        return result;
      free(v13[0]);
      if (error)
        *error = _NSErrorWithFilePathAndEncoding(261, (uint64_t)path, enc);
    }
    else
    {
      result = -[NSString init](self, "init");
      if (result)
        return result;
    }
  }

  return 0;
}

- (NSString)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error
{
  id v9;
  NSString *result;
  void *v11;
  void *v12;
  uint64_t v13;
  NSError *v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  if (-[NSURL isFileURL](url, "isFileURL"))
  {
    v9 = -[NSURL path](url, "path");
    if (v9)
      return -[NSString initWithContentsOfFile:encoding:error:](self, "initWithContentsOfFile:encoding:error:", v9, enc, error);
    if (!error)
      goto LABEL_18;
    v13 = 260;
LABEL_16:
    v14 = _NSErrorWithFilePath(v13, (uint64_t)url);
    goto LABEL_17;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:cachePolicy:timeoutInterval:", url, 1, 60.0);
  v15[0] = 0;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C92C58], "sendSynchronousRequest:returningResponse:error:", v11, v15, 0);

  if (v15[0] && v12)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(MEMORY[0x1E0C92C18], "isErrorStatusCode:", objc_msgSend(v15[0], "statusCode")) & 1) != 0)
    {
      goto LABEL_8;
    }
  }
  else if (!v12)
  {
LABEL_8:
    if (!error)
    {
LABEL_18:

      return 0;
    }
    v13 = 256;
    goto LABEL_16;
  }
  result = -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), enc);
  if (error && !result)
  {
    v14 = _NSErrorWithFilePathAndEncoding(261, (uint64_t)url, enc);
LABEL_17:
    *error = v14;
    goto LABEL_18;
  }
  if (!result)
    goto LABEL_18;
  return result;
}

- (NSRange)localizedStandardRangeOfString:(NSString *)str
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange result;

  v5 = -[NSString length](self, "length");
  v6 = -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", str, 129, 0, v5, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
  result.length = v7;
  result.location = v6;
  return result;
}

+ (id)_newZStringWithString:(id)a3
{
  return -[_NSClStr initWithString:]([_NSClStr alloc], "initWithString:", a3);
}

- (NSString)localizedUppercaseString
{
  return -[NSString uppercaseStringWithLocale:](self, "uppercaseStringWithLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
}

- (NSString)stringByReplacingPercentEscapesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5;

  v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc)
    {
      v5 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), enc);
      v5 = 1536;
    }
  }
  return (NSString *)(id)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(0, (CFStringRef)self, &stru_1E0F56070, v5);
}

- (id)_copyFormatStringWithConfiguration:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self = (NSString *)-[NSString baseString](self, "baseString");
  return -[__NSLocalizedString initWithString:withFormatConfiguration:]([__NSLocalizedString alloc], "initWithString:withFormatConfiguration:", self, a3);
}

+ (NSString)localizedStringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  id v8;
  va_list va;

  va_start(va, error);
  v8 = objc_alloc((Class)a1);
  return (NSString *)(id)objc_msgSend(v8, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format, validFormatSpecifiers, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), va, error);
}

- (NSString)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding
{
  return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", -[NSData bytes](data, "bytes"), -[NSData length](data, "length"), encoding);
}

- (NSString)initWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  uint64_t v9;
  uint64_t v10;
  NSString *result;
  uint64_t v12;
  char v13;
  NSStringEncoding v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16[0] = 0;
  v14 = 0xFFFFFFFFLL;
  v13 = 0;
  LOBYTE(v12) = 0;
  if ((objc_msgSend(MEMORY[0x1E0C99D50], "_readBytesAndEncodingFromPath:maxLength:encoding:bytes:length:didMap:options:reportProgress:error:", path, 0x7FFFFFFFFFFFFFFFLL, &v14, v16, &v15, &v13, 0, v12, error) & 1) == 0)
  {
LABEL_19:

    return 0;
  }
  v9 = v15;
  v10 = v16[0];
  if (v14 == 0xFFFFFFFF || !v16[0] || !v15)
  {
LABEL_10:
    if (v9 || v10)
    {
      result = -[NSString _initWithBytesOfUnknownEncoding:length:copy:usedEncoding:](self, "_initWithBytesOfUnknownEncoding:length:copy:usedEncoding:", v10);
    }
    else
    {
      result = -[NSString init](self, "init");
      if (enc)
        *enc = 4;
    }
    if (!error || result)
    {
      if (result)
        return result;
    }
    else
    {
      *error = _NSErrorWithFilePath(264, (uint64_t)path);
    }
    goto LABEL_19;
  }
  result = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:](self, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v16[0], v15);
  if (enc && result)
  {
    *enc = v14;
    return result;
  }
  if (!result)
  {
    v9 = v15;
    v10 = v16[0];
    goto LABEL_10;
  }
  return result;
}

- (NSString)initWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  id v9;
  NSString *result;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  if (-[NSURL isFileURL](url, "isFileURL"))
  {
    v9 = -[NSURL path](url, "path");
    if (v9)
      return -[NSString initWithContentsOfFile:usedEncoding:error:](self, "initWithContentsOfFile:usedEncoding:error:", v9, enc, error);
    if (!error)
      goto LABEL_17;
    v13 = 260;
    goto LABEL_16;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C80]), "initWithURL:cachePolicy:timeoutInterval:", url, 1, 60.0);
  v14[0] = 0;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C92C58], "sendSynchronousRequest:returningResponse:error:", v11, v14, 0);

  if (v14[0] && v12)
  {
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(MEMORY[0x1E0C92C18], "isErrorStatusCode:", objc_msgSend(v14[0], "statusCode")) & 1) != 0)
    {
      goto LABEL_8;
    }
  }
  else if (!v12)
  {
LABEL_8:
    if (!error)
    {
LABEL_17:

      return 0;
    }
    v13 = 256;
LABEL_16:
    *error = _NSErrorWithFilePath(v13, (uint64_t)url);
    goto LABEL_17;
  }
  result = -[NSString _initWithBytesOfUnknownEncoding:length:copy:usedEncoding:](self, "_initWithBytesOfUnknownEncoding:length:copy:usedEncoding:", objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), 1, enc);
  if (error && !result)
  {
    v13 = 264;
    goto LABEL_16;
  }
  if (!result)
    goto LABEL_17;
  return result;
}

- (id)_initWithBytesOfUnknownEncoding:(char *)a3 length:(unint64_t)a4 copy:(BOOL)a5 usedEncoding:(unint64_t *)a6
{
  int v8;
  unint64_t v9;
  id result;

  if (!a3)
    return 0;
  if (a4 < 2 || (a4 & 1) != 0)
  {
LABEL_7:
    v9 = 4;
    if (a5)
      goto LABEL_8;
    goto LABEL_13;
  }
  v8 = *a3;
  if (v8 == 255)
  {
    if (a3[1] != 254)
      goto LABEL_7;
  }
  else if (v8 != 254 || a3[1] != 255)
  {
    goto LABEL_7;
  }
  v9 = 10;
  if (a5)
  {
LABEL_8:
    result = -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", a3);
    if (!result)
      return result;
    goto LABEL_14;
  }
LABEL_13:
  result = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:](self, "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3);
  if (!result)
  {
    free(a3);
    return 0;
  }
LABEL_14:
  if (a6)
    *a6 = v9;
  return result;
}

uint64_t __37__NSString_enumerateLinesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateLinesUsingBlock:(void *)block
{
  NSUInteger v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v5 = -[NSString length](self, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__NSString_enumerateLinesUsingBlock___block_invoke;
  v6[3] = &unk_1E0F4EB18;
  v6[4] = block;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 0, v6);
}

- (BOOL)__swiftFillFileSystemRepresentationWithPointer:(char *)a3 maxLength:(int64_t)a4
{
  NSString *v6;

  v6 = self;
  LOBYTE(a4) = NSString.__swiftFillFileSystemRepresentation(pointer:maxLength:)(a3, a4);

  return a4 & 1;
}

- (NSString)variantFittingPresentationWidth:(NSInteger)width
{
  return self;
}

- (id)_widthVariants
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (unsigned)_smallestEncodingInCFStringEncoding
{
  return CFStringConvertNSStringEncodingToEncoding(-[NSString smallestEncoding](self, "smallestEncoding"));
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  NSScanner *v5;
  NSDecimalNumber *v6;
  __int128 v8;
  int v9;

  _CFAutoreleasePoolPush();
  v5 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", self);
  *(_QWORD *)retstr = 0;
  *(_QWORD *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (!-[NSScanner scanDecimal:](v5, "scanDecimal:", retstr))
  {
    v6 = +[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber");
    if (v6)
    {
      -[NSDecimalNumber decimalValue](v6, "decimalValue");
    }
    else
    {
      v8 = 0uLL;
      v9 = 0;
    }
    *(_OWORD *)retstr = v8;
    *(_DWORD *)&retstr->var5[6] = v9;
  }
  return ($2F068FC02377E22BA03580A8162C781E *)_CFAutoreleasePoolPop();
}

- (id)__escapeString5991
{
  uint64_t v3;
  __CFString *v4;
  uint64_t i;
  int v6;
  UniChar *p_chars;
  CFIndex v8;
  UniChar chars;
  __int16 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  v4 = (__CFString *)objc_opt_new();
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      v6 = -[NSString characterAtIndex:](self, "characterAtIndex:", i);
      chars = 92;
      v11 = v6;
      if ((v6 - 34) <= 0x3B && ((1 << (v6 - 34)) & 0xA00000020000121) != 0)
      {
        p_chars = &chars;
        v8 = 2;
      }
      else
      {
        p_chars = (UniChar *)&v11;
        v8 = 1;
      }
      CFStringAppendCharacters(v4, p_chars, v8);
    }
  }
  return v4;
}

- (NSString)stringByAbbreviatingWithTildeInPath
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unint64_t v8;
  int v9;
  NSString *v10;
  uint64_t v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  if (v3 > 1023)
  {
    v4 = 1024;
  }
  else
  {
    v3 = -[NSString length](self, "length");
    v4 = v3;
  }
  v12[0] = v4;
  MEMORY[0x1E0C80A78](v3);
  v7 = (unsigned __int16 *)((char *)v12 - v6);
  if (v4 > 0x100)
    v7 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  else
    bzero((char *)v12 - v6, 2 * v5);
  -[NSString getCharacters:range:](self, "getCharacters:range:", v7, 0, v4, v12[0]);
  _NSTransmutePathSlashes(v7, v12);
  v8 = v12[0];
  if (v12[0] >= 2)
  {
    if (v7[v12[0] - 1] == 47)
    {
      while (v8 > 2)
      {
        v9 = v7[v8-- - 2];
        if (v9 != 47)
          goto LABEL_13;
      }
      v8 = 1;
    }
LABEL_13:
    v12[0] = v8;
  }
  _NSAbbreviatePathWithTilde(v7, v12);
  v10 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v7, v12[0]);
  if (v4 >= 0x101)
    free(v7);
  return v10;
}

- (NSArray)stringsByAppendingPaths:(NSArray *)paths
{
  uint64_t v7;
  NSArray *v8;
  uint64_t i;
  void *v10;

  if (!paths || (_NSIsNSArray() & 1) == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: paths argument is not an array"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v10);
  }
  if (-[NSString isEqual:](self, "isEqual:", &stru_1E0F56070))
    return (NSArray *)(id)-[NSArray copyWithZone:](paths, "copyWithZone:", -[NSString zone](self, "zone"));
  v7 = -[NSArray count](paths, "count");
  v8 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
      -[NSArray addObject:](v8, "addObject:", -[NSString stringByAppendingPathComponent:](self, "stringByAppendingPathComponent:", -[NSArray objectAtIndex:](paths, "objectAtIndex:", i)));
  }
  return v8;
}

- (NSUInteger)completePathIntoString:(NSString *)outputName caseSensitive:(BOOL)flag matchesIntoArray:(NSArray *)outputArray filterTypes:(NSArray *)filterTypes
{
  NSUInteger v8;
  void *v10;
  NSString *v11;
  BOOL v12;
  passwd *i;
  NSString *v14;
  NSString *v15;
  NSArray *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  NSArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  NSArray *v46;
  uint64_t n;
  NSString *v48;
  NSArray *v49;
  NSArray *v50;
  uint64_t v51;
  char v52;
  BOOL v53;
  uint64_t v54;
  NSArray *v55;
  uint64_t ii;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  NSString *v69;
  uint64_t v70;
  NSArray **v71;
  NSString *v74;
  NSArray *v75;
  id v76;
  NSArray *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSFileManager *v83;
  _BOOL4 v84;
  NSArray *obj;
  id obja;
  NSString *v87;
  NSString *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  NSString *v93;
  uint64_t v94;
  BOOL v95;
  _BYTE v96[128];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  uint64_t v124;

  v84 = flag;
  v124 = *MEMORY[0x1E0C80C00];
  v83 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (-[NSString isEqual:](self, "isEqual:", &stru_1E0F56070))
    return 0;
  if (-[NSString hasPrefix:](self, "hasPrefix:", CFSTR("~"))
    && -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("/"), 0, 0, -[NSString length](self, "length")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E20]), "initWithCapacity:", 32);
    v11 = -[NSString substringWithRange:](self, "substringWithRange:", 1, -[NSString length](self, "length") - 1);
    v12 = -[NSString isEqual:](v11, "isEqual:", &stru_1E0F56070);
    setpwent();
    for (i = getpwent(); i; i = getpwent())
    {
      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", i->pw_name);
      v15 = v14;
      if (v12 || -[NSString hasPrefix:](v14, "hasPrefix:", v11))
        objc_msgSend(v10, "addObject:", objc_msgSend(CFSTR("~"), "stringByAppendingString:", v15));
    }
    endpwent();
    v16 = (NSArray *)objc_msgSend(v10, "allObjects");

    if (outputName)
      *outputName = (NSString *)_NSFindCommonPrefixInStringArray(v16, v84);
    if (outputArray)
      *outputArray = v16;
    return -[NSArray count](v16, "count");
  }
  if (-[NSString hasSuffix:](self, "hasSuffix:", CFSTR("/")) || -[NSString hasSuffix:](self, "hasSuffix:", CFSTR("\\")))
  {
    v17 = (NSString *)&stru_1E0F56070;
  }
  else
  {
    v17 = -[NSString lastPathComponent](self, "lastPathComponent");
    self = -[NSString stringByDeletingLastPathComponent](self, "stringByDeletingLastPathComponent");
  }
  if (v84)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self);
    v19 = 8;
  }
  else
  {
    if (-[NSString isEqual:](self, "isEqual:", &stru_1E0F56070))
    {
      v20 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", &stru_1E0F56070);
      if (!v20)
        return 0;
    }
    else
    {
      v87 = v17;
      v77 = filterTypes;
      v21 = -[NSString pathComponents](self, "pathComponents");
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v119 = 0u;
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      obj = v21;
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v119, v123, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v120;
        v81 = *(_QWORD *)v120;
        do
        {
          v27 = 0;
          v79 = v25;
          do
          {
            if (*(_QWORD *)v120 != v26)
              objc_enumerationMutation(obj);
            v28 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v27);
            if (objc_msgSend(v28, "isEqual:", CFSTR("/")))
            {
              objc_msgSend(v23, "addObject:", v28);
            }
            else if (objc_msgSend(v23, "count"))
            {
              v89 = v27;
              v92 = v23;
              v109 = 0u;
              v110 = 0u;
              v107 = 0u;
              v108 = 0u;
              v29 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v107, v106, 16);
              if (v29)
              {
                v30 = v29;
                v94 = *(_QWORD *)v108;
                do
                {
                  for (j = 0; j != v30; ++j)
                  {
                    if (*(_QWORD *)v108 != v94)
                      objc_enumerationMutation(v92);
                    v32 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * j);
                    v33 = -[NSFileManager contentsOfDirectoryAtPath:error:](v83, "contentsOfDirectoryAtPath:error:", v32, 0);
                    v102 = 0u;
                    v103 = 0u;
                    v104 = 0u;
                    v105 = 0u;
                    v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v102, v101, 16);
                    if (v34)
                    {
                      v35 = v34;
                      v36 = *(_QWORD *)v103;
                      do
                      {
                        for (k = 0; k != v35; ++k)
                        {
                          if (*(_QWORD *)v103 != v36)
                            objc_enumerationMutation(v33);
                          v38 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * k);
                          if (!objc_msgSend(v38, "caseInsensitiveCompare:", v28))
                            objc_msgSend(v22, "addObject:", objc_msgSend(v32, "stringByAppendingPathComponent:", v38));
                        }
                        v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v102, v101, 16);
                      }
                      while (v35);
                    }
                  }
                  v30 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v107, v106, 16);
                }
                while (v30);
              }
              if (!objc_msgSend(v22, "count"))
              {

                return 0;
              }
              objc_msgSend(v92, "removeAllObjects");
              v23 = v22;
              v22 = v92;
              v25 = v79;
              v26 = v81;
              v27 = v89;
            }
            else
            {
              v39 = v23;
              v40 = -[NSFileManager contentsOfDirectoryAtPath:error:](v83, "contentsOfDirectoryAtPath:error:", -[NSFileManager currentDirectoryPath](v83, "currentDirectoryPath"), 0);
              v115 = 0u;
              v116 = 0u;
              v117 = 0u;
              v118 = 0u;
              v41 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v115, &v111, 16);
              if (v41)
              {
                v42 = v41;
                v90 = v27;
                v43 = *(_QWORD *)v116;
                do
                {
                  for (m = 0; m != v42; ++m)
                  {
                    if (*(_QWORD *)v116 != v43)
                      objc_enumerationMutation(v40);
                    v45 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * m);
                    if (!objc_msgSend(v45, "caseInsensitiveCompare:", v28))
                      objc_msgSend(v39, "addObject:", v45);
                  }
                  v42 = -[NSArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v115, &v111, 16);
                }
                while (v42);
                v23 = v39;
                v27 = v90;
                v26 = v81;
              }
              else
              {
                v23 = v39;
              }
            }
            ++v27;
          }
          while (v27 != v25);
          v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v119, v123, 16);
        }
        while (v25);
      }

      v20 = v23;
      filterTypes = v77;
      v17 = v87;
      if (!v20)
        return 0;
    }
    v18 = v20;
    v19 = 9;
  }
  obja = (id)v19;
  v46 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = 0;
  v75 = v46;
  while (1)
  {
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v76 = v18;
    v80 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v97, v96, 16);
    if (v80)
    {
      v78 = *(_QWORD *)v98;
      v88 = v17;
      do
      {
        for (n = 0; n != v80; ++n)
        {
          if (*(_QWORD *)v98 != v78)
            objc_enumerationMutation(v76);
          v48 = *(NSString **)(*((_QWORD *)&v97 + 1) + 8 * n);
          v93 = v48;
          if (!-[NSString length](v48, "length"))
            v48 = -[NSFileManager currentDirectoryPath](v83, "currentDirectoryPath");
          v49 = -[NSFileManager contentsOfDirectoryAtPath:error:](v83, "contentsOfDirectoryAtPath:error:", v48, 0);
          if (!v49)
          {
            v54 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
            goto LABEL_106;
          }
          v50 = v49;
          v82 = n;
          v51 = -[NSArray count](v49, "count");
          v91 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          if (v17)
          {
            v52 = -[NSString isEqual:](v17, "isEqual:", &stru_1E0F56070);
            if (!filterTypes)
              goto LABEL_80;
          }
          else
          {
            v52 = 1;
            if (!filterTypes)
            {
LABEL_80:
              v53 = 1;
              goto LABEL_81;
            }
          }
          v53 = -[NSArray count](filterTypes, "count") == 0;
LABEL_81:
          v95 = v53;
          if (v51 < 1)
            goto LABEL_105;
          v55 = filterTypes;
          for (ii = 0; ii != v51; ++ii)
          {
            v57 = -[NSArray objectAtIndex:](v50, "objectAtIndex:", ii);
            v58 = v57;
            if ((v52 & 1) != 0 || objc_msgSend(v57, "rangeOfString:options:", v88, obja) != 0x7FFFFFFFFFFFFFFFLL)
            {
              v59 = objc_msgSend(v58, "pathExtension");
              if (v95)
                goto LABEL_86;
              v62 = (void *)v59;
              if (v84)
              {
                if (-[NSArray containsObject:](v55, "containsObject:", v59))
                  goto LABEL_86;
              }
              else
              {
                v113 = 0u;
                v114 = 0u;
                v111 = 0u;
                v112 = 0u;
                v63 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
                if (v63)
                {
                  v64 = v63;
                  v65 = *(_QWORD *)v112;
LABEL_95:
                  v66 = 0;
                  while (1)
                  {
                    if (*(_QWORD *)v112 != v65)
                      objc_enumerationMutation(v55);
                    if (!objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * v66), "caseInsensitiveCompare:", v62))
                      break;
                    if (v64 == ++v66)
                    {
                      v64 = -[NSArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
                      if (v64)
                        goto LABEL_95;
                      goto LABEL_101;
                    }
                  }
LABEL_86:
                  v60 = -[NSString stringByAppendingPathComponent:](v93, "stringByAppendingPathComponent:", v58);
                  v61 = (void *)v91;
LABEL_87:
                  objc_msgSend(v61, "addObject:", v60);
                  continue;
                }
              }
LABEL_101:
              if (objc_msgSend(v62, "isEqual:", &stru_1E0F56070))
              {
                v106[0] = 0;
                v67 = -[NSString stringByAppendingPathComponent:](v93, "stringByAppendingPathComponent:", v58);
                if (-[NSFileManager fileExistsAtPath:isDirectory:](v83, "fileExistsAtPath:isDirectory:", v67, v106))
                {
                  if (v106[0])
                  {
                    v61 = (void *)v91;
                    v60 = v67;
                    goto LABEL_87;
                  }
                }
              }
            }
          }
          filterTypes = v55;
          v17 = v88;
          v46 = v75;
LABEL_105:
          n = v82;
          v54 = v91;
LABEL_106:
          -[NSArray addObjectsFromArray:](v46, "addObjectsFromArray:", v54);
        }
        v80 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v97, v96, 16);
      }
      while (v80);
    }
    v68 = -[NSArray count](v46, "count");
    v8 = v68;
    v123[0] = 0;
    v69 = v74;
    if (!v74 && !v68)
      return v8;
    if (v68 >= 2)
      break;
    if (v68 != 1
      || (v69 = -[NSArray objectAtIndex:](v46, "objectAtIndex:", 0),
          -[NSFileManager fileExistsAtPath:isDirectory:](v83, "fileExistsAtPath:isDirectory:", v69, v123))
      && !v123[0])
    {
      if (outputName)
        *outputName = v69;
      if (outputArray)
      {
        v70 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v69);
        v71 = outputArray;
        v46 = (NSArray *)v70;
        v8 = 1;
        goto LABEL_122;
      }
      return 1;
    }
    v74 = v69;
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v69);
    -[NSArray removeAllObjects](v46, "removeAllObjects");
    v17 = (NSString *)&stru_1E0F56070;
  }
  if (outputName)
    *outputName = (NSString *)_NSFindCommonPrefixInStringArray(v46, v84);
  v71 = outputArray;
  if (outputArray)
LABEL_122:
    *v71 = v46;
  return v8;
}

- (id)stringByConvertingPathToURL
{
  return (id)objc_msgSend(CFSTR("file://localhost"), "stringByAppendingString:", -[NSString stringByStandardizingPath](self, "stringByStandardizingPath"));
}

- (id)stringByConvertingURLToPath
{
  NSString *v2;
  NSString *v3;
  NSString *v4;

  v2 = self;
  if (!-[NSString hasPrefix:](self, "hasPrefix:", CFSTR("file:")))
  {
    if (-[NSString rangeOfString:](v2, "rangeOfString:", CFSTR(":")) != 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    goto LABEL_8;
  }
  if (-[NSString hasPrefix:](-[NSString substringFromIndex:](v2, "substringFromIndex:", 5), "hasPrefix:", CFSTR("//")))
  {
    v3 = -[NSString substringFromIndex:](v2, "substringFromIndex:", 2);
    if (v3)
    {
      v4 = v3;
      if (-[NSString characterAtIndex:](v3, "characterAtIndex:", 0) == 47)
        return -[NSString stringByStandardizingPath](v4, "stringByStandardizingPath");
      if (-[NSString hasPrefix:](v4, "hasPrefix:", CFSTR("localhost")))
      {
        v2 = -[NSString substringFromIndex:](v2, "substringFromIndex:", 9);
LABEL_8:
        v4 = v2;
        if (v2)
          return -[NSString stringByStandardizingPath](v4, "stringByStandardizingPath");
      }
    }
  }
  return 0;
}

+ (id)_newZStringWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  return -[_NSClStr initWithCharacters:length:]([_NSClStr alloc], "initWithCharacters:length:", a3, a4);
}

+ (id)_newZStringWithUTF8String:(const char *)a3
{
  return -[_NSClStr initWithUTF8String:]([_NSClStr alloc], "initWithUTF8String:", a3);
}

+ (NSStringEncoding)stringEncodingForData:(NSData *)data encodingOptions:(NSDictionary *)opts convertedString:(NSString *)string usedLossyConversion:(BOOL *)usedLossyConversion
{
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _BOOL4 v23;
  void *v24;
  id v25;
  unint64_t v26;
  unsigned int v27;
  NSStringEncoding v28;
  NSString *StringWithEncoding;
  NSString *v30;
  const void *v31;
  NSData *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  _DWORD *v43;
  double *v44;
  NSString *v45;
  int v46;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSNumber *v58;
  const void *v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  NSNumber *v63;
  _QWORD *v64;
  char v65;
  double v66;
  uint64_t v67;
  _QWORD *v68;
  void *v69;
  NSNumber *v70;
  _DWORD *v71;
  void *v72;
  NSNumber *v73;
  id v74;
  char v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  BOOL v81;
  char v82;
  NSNumber *v83;
  id v84;
  char v85;
  NSNumber *v86;
  id v87;
  char v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSString *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t k;
  NSNumber *v101;
  id v102;
  char v103;
  NSNumber *v104;
  id v105;
  char v106;
  NSNumber *v107;
  id v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
  double v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t m;
  _QWORD *v121;
  size_t v122;
  uint64_t v123;
  _QWORD *v124;
  unint64_t v125;
  double v126;
  unint64_t v127;
  _QWORD *v128;
  double v129;
  double v130;
  double v131;
  uint64_t v132;
  uint64_t *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  uint64_t n;
  uint64_t v139;
  uint64_t ii;
  uint64_t v141;
  uint64_t jj;
  uint64_t v143;
  uint64_t kk;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  unsigned int *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t mm;
  size_t v155;
  id v156;
  double v157;
  unint64_t v158;
  id *v159;
  unint64_t v160;
  double v161;
  _QWORD *v162;
  double v163;
  double v164;
  unint64_t v165;
  double v166;
  double v167;
  BOOL v168;
  double v169;
  uint64_t v170;
  id v171;
  double v172;
  BOOL v173;
  uint64_t v174;
  NSString *v175;
  NSString *v176;
  unint64_t v177;
  size_t v178;
  id *v179;
  _QWORD *v180;
  double v181;
  unint64_t v182;
  _QWORD *v183;
  double v184;
  double v185;
  unint64_t v186;
  double v187;
  double v188;
  unint64_t v189;
  BOOL v190;
  unint64_t v191;
  double v192;
  BOOL v193;
  unint64_t v194;
  unint64_t v195;
  uint64_t v196;
  char v197;
  uint64_t v198;
  uint64_t v199;
  _QWORD *v200;
  int v201;
  NSStringEncoding v202;
  unint64_t v203;
  uint64_t v204;
  _BOOL4 v205;
  int v206;
  BOOL v207;
  BOOL *v208;
  _QWORD *v209;
  _QWORD *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t nn;
  void *v218;
  NSString *v219;
  unint64_t v220;
  size_t v221;
  id v222;
  double v223;
  id *v224;
  double v225;
  size_t v226;
  id *v227;
  double v228;
  NSString *v229;
  void *v230;
  void *v231;
  int v232;
  uint64_t v233;
  BOOL *v234;
  NSString **v235;
  void *v236;
  _QWORD *v237;
  _BOOL4 v238;
  _QWORD *v239;
  int v240;
  char v241;
  int v242;
  _BOOL4 v243;
  id obj;
  NSData *v245;
  int v246;
  uint64_t v247;
  unint64_t v248;
  void *v249;
  void *v250;
  void *v251;
  unsigned int v252;
  _QWORD *v253;
  _QWORD v254[7];
  _QWORD v255[7];
  size_t v256;
  size_t __nel;
  _QWORD block[7];
  size_t iterations;
  BOOL v260;
  _BYTE v261[128];
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  _BYTE v266[128];
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  _BYTE v271[128];
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  _BYTE v276[128];
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  _BYTE v281[128];
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  _BYTE v286[128];
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  _BYTE v291[128];
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  _BYTE v296[128];
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  uint64_t v301;

  v301 = *MEMORY[0x1E0C80C00];
  if (!opts)
  {
    v248 = 0;
    v13 = 0;
    v14 = 0;
    v236 = 0;
    v252 = 0;
    v238 = 0;
    v240 = 0;
    v242 = 1;
    v243 = 0;
    v11 = CFSTR("\uFFFD");
    goto LABEL_29;
  }
  v10 = -[NSDictionary objectForKey:](opts, "objectForKey:", CFSTR("NSStringEncodingDetectionLossySubstitutionKey"));
  if (v10)
  {
    v11 = v10;
    if ((_NSIsNSString() & 1) == 0)
    {
      v12 = CFSTR("[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionLossySubstitutionKey must be an object of NSString.");
      goto LABEL_459;
    }
  }
  else
  {
    v11 = CFSTR("\uFFFD");
  }
  v15 = -[NSDictionary objectForKey:](opts, "objectForKey:", CFSTR("NSStringEncodingDetectionAllowLossyKey"));
  if (v15)
  {
    v16 = v15;
    if ((_NSIsNSNumber() & 1) == 0)
    {
      v12 = CFSTR("[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionAllowLossyKey must be an object of NSNumber.");
      goto LABEL_459;
    }
    v17 = objc_msgSend(v16, "BOOLValue");
  }
  else
  {
    v17 = 1;
  }
  v18 = -[NSDictionary objectForKey:](opts, "objectForKey:", CFSTR("NSStringEncodingDetectionSuggestedEncodingsKey"));
  if (v18)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      v12 = CFSTR("[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionSuggestedEncodingsKey must be an object of NSArray.");
      goto LABEL_459;
    }
    v19 = v18;
    v248 = objc_msgSend(v18, "count");
    v243 = v248 != 0;
  }
  else
  {
    v19 = 0;
    v243 = 0;
    v248 = 0;
  }
  v20 = -[NSDictionary objectForKey:](opts, "objectForKey:", CFSTR("NSStringEncodingDetectionUseOnlySuggestedEncodingsKey"));
  v242 = v17;
  if (!v20)
    goto LABEL_20;
  v21 = v20;
  if ((_NSIsNSNumber() & 1) == 0)
  {
    v12 = CFSTR("[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionUseOnlySuggestedEncodingsKey must be an object of NSNumber.");
    goto LABEL_459;
  }
  if (objc_msgSend(v21, "BOOLValue"))
  {
    v14 = v19;
    v252 = 1;
    if ((unint64_t)objc_msgSend(v19, "count") < 2)
    {
      v13 = 0;
      v236 = 0;
      v238 = 0;
      v240 = 0;
      goto LABEL_29;
    }
  }
  else
  {
LABEL_20:
    v252 = 0;
    v14 = v19;
  }
  v22 = -[NSDictionary objectForKey:](opts, "objectForKey:", CFSTR("NSStringEncodingDetectionFromWindowsKey"));
  v23 = v22 != 0;
  if (v22)
  {
    v24 = v22;
    if ((_NSIsNSNumber() & 1) == 0)
    {
      v12 = CFSTR("[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionFromWindowsKey must be an object of NSNumber.");
      goto LABEL_459;
    }
    v240 = objc_msgSend(v24, "BOOLValue");
  }
  else
  {
    v240 = 0;
  }
  v238 = v23;
  v25 = -[NSDictionary objectForKey:](opts, "objectForKey:", CFSTR("NSStringEncodingDetectionLikelyLanguageKey"));
  if (v25 && (_NSIsNSString() & 1) == 0)
  {
    v12 = CFSTR("[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionLikelyLanguageKey must be an object of NSString.");
    goto LABEL_459;
  }
  v236 = v25;
  v13 = -[NSDictionary objectForKey:](opts, "objectForKey:", CFSTR("NSStringEncodingDetectionDisallowedEncodingsKey"));
  if (v13 && (_NSIsNSArray() & 1) == 0)
  {
    v12 = CFSTR("[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionDisallowedEncodingsKey must be an object of NSArray.");
LABEL_459:
    v229 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v229, 0));
  }
LABEL_29:
  if (!data)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (!-[NSData length](data, "length"))
  {
    if (v243)
    {
      v28 = objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", 0), "integerValue");
      if (!string)
      {
LABEL_65:
        if (usedLossyConversion)
          *usedLossyConversion = 0;
        return v28;
      }
    }
    else
    {
      v28 = 4;
      if (!string)
        goto LABEL_65;
    }
    *string = (NSString *)&stru_1E0F56070;
    goto LABEL_65;
  }
  if (qword_1ECD0A148 != -1)
    dispatch_once(&qword_1ECD0A148, &__block_literal_global_41);
  v26 = v248;
  if (qword_1ECD0A150 != -1)
  {
    dispatch_once(&qword_1ECD0A150, &__block_literal_global_157);
    v26 = v248;
  }
  if (v26 == 1)
    v27 = v252;
  else
    v27 = 0;
  if (v27 == 1)
  {
    LOBYTE(iterations) = 0;
    v28 = objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", 0), "integerValue");
    if (string)
    {
      StringWithEncoding = -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", data, v28);
      if (!StringWithEncoding)
      {
        StringWithEncoding = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", CFStringConvertNSStringEncodingToEncoding(v28), 1);
        if (StringWithEncoding)
        {
          v30 = StringWithEncoding;
          v31 = -[NSData bytes](data, "bytes");
          v32 = data;
          v33 = (uint64_t)v31;
          v34 = -[NSData length](v32, "length");
          -[NSString recognizeString:withDataLength:intoBuffer:](v30, "recognizeString:withDataLength:intoBuffer:", v33, v34, 0);
          StringWithEncoding = (NSString *)generateStringWithEncoding(v30, v33, v34, 0, v242, (uint64_t)v11, (BOOL *)&iterations);
        }
      }
      *string = StringWithEncoding;
      if (usedLossyConversion)
        *usedLossyConversion = iterations;
    }
    return v28;
  }
  v250 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", _MergedGlobals_117);
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v245 = data;
  v234 = usedLossyConversion;
  v235 = string;
  v233 = (uint64_t)v11;
  if (v14)
  {
    v300 = 0u;
    v299 = 0u;
    v298 = 0u;
    v297 = 0u;
    v35 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v297, v296, 16);
    if (v35)
    {
      v36 = v35;
      v246 = 0;
      v37 = *(_QWORD *)v298;
      v38 = v248;
      do
      {
        v39 = v14;
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v298 != v37)
            objc_enumerationMutation(v39);
          v41 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * i);
          v28 = objc_msgSend(v41, "integerValue");
          v42 = CFStringConvertNSStringEncodingToEncoding(v28);
          v43 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", v42, v252);
          if (v43)
          {
            v44 = (double *)v43;
            objc_msgSend(v250, "setObject:forKey:", v43, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v42));
            *((_DWORD *)v44 + 41) = v38--;
            v44[19] = v44[19] * 10.0;
          }
          else if (v248 < 2 || v38 == v248)
          {
            v45 = -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", v245, v28);
            if (v45)
            {
              if (v235)
                *v235 = v45;
              if (v234)
                *v234 = 0;
              return v28;
            }
          }
          else
          {
            objc_msgSend(obj, "addObject:", v41);
            v246 = 1;
          }
        }
        v14 = v39;
        v36 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v297, v296, 16);
      }
      while (v36);
    }
    else
    {
      v246 = 0;
    }
    v46 = v246;
    usedLossyConversion = v234;
    string = v235;
    v11 = (const __CFString *)v233;
    data = v245;
  }
  else
  {
    v46 = 0;
  }
  if (v252)
  {
    if (objc_msgSend(v250, "count"))
    {
      v232 = v46;
LABEL_90:
      v49 = 0;
      goto LABEL_98;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v232 = v46;
  if (objc_msgSend(v13, "count"))
  {
    v48 = v14;
    v49 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", _MergedGlobals_117);
    v292 = 0u;
    v293 = 0u;
    v294 = 0u;
    v295 = 0u;
    v50 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v292, v291, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v293;
      v53 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v293 != v52)
            objc_enumerationMutation(v13);
          objc_msgSend(v49, "setObject:forKey:", v53, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", CFStringConvertNSStringEncodingToEncoding(objc_msgSend(*(id *)(*((_QWORD *)&v292 + 1) + 8 * j), "integerValue"))));
        }
        v51 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v292, v291, 16);
      }
      while (v51);
    }
    if (((!v238 | v240) & 1) != 0)
    {
      string = v235;
      v11 = (const __CFString *)v233;
      data = v245;
      v14 = v48;
      goto LABEL_98;
    }
    string = v235;
    v14 = v48;
    if (v49)
      goto LABEL_93;
  }
  else if (((!v238 | v240) & 1) != 0)
  {
    goto LABEL_90;
  }
  v49 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", _MergedGlobals_117);
LABEL_93:
  v55 = v14;
  v56 = 0;
  v57 = MEMORY[0x1E0C9AAB0];
  do
  {
    v58 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", windowsEncodings[v56]);
    if (!objc_msgSend(v250, "objectForKey:", v58))
      objc_msgSend(v49, "setObject:forKey:", v57, v58);
    ++v56;
  }
  while (v56 != 14);
  v11 = (const __CFString *)v233;
  data = v245;
  v14 = v55;
LABEL_98:
  v260 = 0;
  v59 = -[NSData bytes](data, "bytes");
  v60 = -[NSData length](data, "length");
  v61 = (_QWORD *)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 1536));
  if (v61)
  {
    v62 = v61;
    if (objc_msgSend(v61, "recognizeString:withDataLength:intoBuffer:", v59, v60, 0) && !v62[8])
    {
      objc_msgSend(v62, "softReset");
      if (string)
      {
        *string = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v60, objc_msgSend(v62, "nsEncoding"));
        if (usedLossyConversion)
          *usedLossyConversion = v260;
      }
      return 1;
    }
    objc_msgSend(v62, "softReset");
  }
  v63 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 67109120);
  if (!objc_msgSend(v49, "objectForKey:", v63))
  {
    v64 = (_QWORD *)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 67109120));
    if (v64)
      v65 = 1;
    else
      v65 = v252;
    if ((v65 & 1) == 0)
    {
      v64 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", 67109120, 0);
      objc_msgSend(v250, "setObject:forKey:", v64, v63);
    }
    if (v64)
    {
      if (objc_msgSend(v64, "recognizeString:withDataLength:intoBuffer:", v59, v60, 0))
      {
        if (*((_BYTE *)v64 + 160))
        {
          if (!v64[8] || *((_DWORD *)v64 + 41) && (objc_msgSend(v64, "bytesRatio"), v66 >= 0.99))
          {
            v67 = checkSuggestedEncodings((uint64_t)v59, v60, v250);
            v68 = v67 ? (_QWORD *)v67 : v64;
            if (generateStringWithEncoding(v68, (uint64_t)v59, v60, 1, 0, 0, 0))
            {
              if (string)
              {
                *string = (NSString *)generateStringWithEncoding(v68, (uint64_t)v59, v60, 1, v242, (uint64_t)v11, &v260);
                if (usedLossyConversion)
                  *usedLossyConversion = v260;
              }
              v69 = v68;
              return objc_msgSend(v69, "nsEncoding");
            }
          }
        }
      }
      objc_msgSend(v250, "removeObjectForKey:", &off_1E0FBD9C8);
    }
  }
  v70 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 134217984);
  v247 = v60;
  if (objc_msgSend(v49, "objectForKey:", v70))
  {
    v71 = 0;
LABEL_125:
    v72 = v250;
    goto LABEL_126;
  }
  v71 = (_DWORD *)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 134217984));
  if (v71)
    v75 = 1;
  else
    v75 = v252;
  if ((v75 & 1) == 0)
  {
    v71 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", 134217984, 0);
    objc_msgSend(v250, "setObject:forKey:", v71, v70);
  }
  if (!v71)
    goto LABEL_125;
  if (objc_msgSend(v71, "recognizeString:withDataLength:intoBuffer:", v59, v60, 0)
    && (objc_msgSend(v71, "bytesRatio"), v76 >= 0.85)
    && (objc_msgSend(v71, "multiBytesRatio"), v77 > 0.0)
    && (*((_BYTE *)v71 + 162) || !*((_QWORD *)v71 + 8) || (objc_msgSend(v71, "multiBytesRatio"), v78 >= 0.7))
    || v71[41]
    && (*((_BYTE *)v71 + 162)
     || (objc_msgSend(v71, "bytesRatio"), v79 >= 0.99)
     || (objc_msgSend(v71, "multiBytesRatio"), v80 > 0.7)))
  {
    if (v71[41])
      v81 = v248 != v71[41];
    else
      v81 = v243;
    if (!v81)
    {
      if (string)
      {
        *string = (NSString *)generateStringWithEncoding(v71, (uint64_t)v59, v60, 1, v242, (uint64_t)v11, &v260);
        if (usedLossyConversion)
          *usedLossyConversion = v260;
      }
      return 4;
    }
    goto LABEL_125;
  }
  v72 = v250;
  objc_msgSend(v250, "removeObjectForKey:", &off_1E0FBD9E0);
  v71 = 0;
LABEL_126:
  v73 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 256);
  if (objc_msgSend(v49, "objectForKey:", v73))
  {
    v74 = 0;
  }
  else
  {
    v74 = (id)objc_msgSend(v72, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 256));
    if (v74)
      v82 = 1;
    else
      v82 = v252;
    if ((v82 & 1) == 0)
    {
      v74 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", 256, 0);
      objc_msgSend(v72, "setObject:forKey:", v74, v73);
    }
  }
  v239 = v71;
  v83 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 268435712);
  if (objc_msgSend(v49, "objectForKey:", v83))
  {
    v84 = 0;
  }
  else
  {
    v84 = (id)objc_msgSend(v72, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 268435712));
    if (v84)
      v85 = 1;
    else
      v85 = v252;
    if ((v85 & 1) == 0)
    {
      v84 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", 268435712, 0);
      objc_msgSend(v72, "setObject:forKey:", v84, v83);
    }
  }
  v86 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 335544576);
  if (objc_msgSend(v49, "objectForKey:", v86))
  {
    v87 = 0;
  }
  else
  {
    v87 = (id)objc_msgSend(v72, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 335544576));
    v88 = v252;
    if (v87)
      v88 = 1;
    if ((v88 & 1) == 0)
    {
      v87 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", 335544576, 0);
      objc_msgSend(v72, "setObject:forKey:", v87, v86);
    }
  }
  v89 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v90 = v89;
  if (v74)
    objc_msgSend(v89, "addObject:", v74);
  if (v84)
    objc_msgSend(v90, "addObject:", v84);
  v249 = v14;
  if (v87)
    objc_msgSend(v90, "addObject:", v87);
  v289 = 0u;
  v290 = 0u;
  v287 = 0u;
  v288 = 0u;
  v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v287, v286, 16);
  if (!v91)
  {
LABEL_189:
    v284 = 0u;
    v285 = 0u;
    v282 = 0u;
    v283 = 0u;
    v97 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v282, v281, 16);
    if (v97)
    {
      v98 = v97;
      v99 = *(_QWORD *)v283;
      do
      {
        for (k = 0; k != v98; ++k)
        {
          if (*(_QWORD *)v283 != v99)
            objc_enumerationMutation(v90);
          objc_msgSend(v250, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*((_QWORD *)&v282 + 1) + 8 * k) + 24)));
        }
        v98 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v282, v281, 16);
      }
      while (v98);
    }
    v101 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 201326848);
    if (objc_msgSend(v49, "objectForKey:", v101))
    {
      v102 = 0;
    }
    else
    {
      v102 = (id)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 201326848));
      if (v102)
        v103 = 1;
      else
        v103 = v252;
      if ((v103 & 1) == 0)
      {
        v102 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", 201326848, 0);
        objc_msgSend(v250, "setObject:forKey:", v102, v101);
      }
    }
    v104 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 402653440);
    if (objc_msgSend(v49, "objectForKey:", v104))
    {
      v105 = 0;
    }
    else
    {
      v105 = (id)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 402653440));
      if (v105)
        v106 = 1;
      else
        v106 = v252;
      if ((v106 & 1) == 0)
      {
        v105 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", 402653440, 0);
        objc_msgSend(v250, "setObject:forKey:", v105, v104);
      }
    }
    v107 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 469762304);
    if (objc_msgSend(v49, "objectForKey:", v107))
    {
      v108 = 0;
    }
    else
    {
      v108 = (id)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 469762304));
      if (v108)
        v109 = 1;
      else
        v109 = v252;
      if ((v109 & 1) == 0)
      {
        v108 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", 469762304, 0);
        objc_msgSend(v250, "setObject:forKey:", v108, v107);
      }
    }
    objc_msgSend(v90, "removeAllObjects");
    if (v102)
      objc_msgSend(v90, "addObject:", v102);
    if (v105)
      objc_msgSend(v90, "addObject:", v105);
    if (v108)
      objc_msgSend(v90, "addObject:", v108);
    v279 = 0u;
    v280 = 0u;
    v277 = 0u;
    v278 = 0u;
    v110 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v277, v276, 16);
    if (v110)
    {
      v111 = v110;
      v112 = *(_QWORD *)v278;
LABEL_232:
      v113 = 0;
      while (1)
      {
        if (*(_QWORD *)v278 != v112)
          objc_enumerationMutation(v90);
        v95 = *(_QWORD *)(*((_QWORD *)&v277 + 1) + 8 * v113);
        if (objc_msgSend((id)v95, "recognizeString:withDataLength:intoBuffer:", v59, v247, 0))
        {
          objc_msgSend((id)v95, "bytesRatio");
          if (v114 >= 0.85)
          {
            if (*(_BYTE *)(v95 + 162))
              break;
            objc_msgSend((id)v95, "bytesRatio");
            if (v115 >= 0.99)
              break;
          }
        }
        if (v111 == ++v113)
        {
          v111 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v277, v276, 16);
          if (!v111)
            goto LABEL_241;
          goto LABEL_232;
        }
      }
      if (v235)
      {
        *v235 = (NSString *)generateStringWithEncoding((_QWORD *)v95, (uint64_t)v59, v247, 1, v242, v233, &v260);
        if (v234)
          *v234 = v260;
      }
      goto LABEL_268;
    }
LABEL_241:
    v274 = 0u;
    v275 = 0u;
    v272 = 0u;
    v273 = 0u;
    v116 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v272, v271, 16);
    v117 = v250;
    if (v116)
    {
      v118 = v116;
      v119 = *(_QWORD *)v273;
      do
      {
        for (m = 0; m != v118; ++m)
        {
          if (*(_QWORD *)v273 != v119)
            objc_enumerationMutation(v90);
          objc_msgSend(v250, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*((_QWORD *)&v272 + 1) + 8 * m) + 24)));
        }
        v118 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v272, v271, 16);
      }
      while (v118);
    }
    v121 = malloc_type_malloc(0x30uLL, 0x80040B8603338uLL);
    iterations = 0;
    getAllDetectors((uint64_t)v121, &iterations, codeSchemeEncodings, 6, v250, v49, v252);
    v122 = iterations;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke;
    block[3] = &__block_descriptor_56_e8_v16__0Q8l;
    block[4] = v121;
    block[5] = v59;
    block[6] = v247;
    dispatch_apply(iterations, 0, block);
    if (v122)
    {
      v123 = 0;
      v124 = 0;
      v125 = -1;
      v126 = 0.0;
      v127 = 1;
      do
      {
        v128 = (_QWORD *)v121[v123];
        objc_msgSend(v128, "confidence");
        if (v128[5])
        {
          v130 = v129;
          objc_msgSend(v128, "bytesRatio");
          if (v131 >= 0.85 && (v130 > v126 || v130 == v126 && v125 > v128[8]) && v128[15] >= v127)
          {
            v125 = v128[8];
            v124 = v128;
            v127 = v128[15];
            v126 = v130;
          }
        }
        ++v123;
      }
      while (v122 != v123);
      v117 = v250;
      if (v124)
      {
        if (!v235)
        {
LABEL_262:
          if (v234)
            *v234 = v260;
          free(v121);
          v69 = v124;
          return objc_msgSend(v69, "nsEncoding");
        }
        v132 = generateStringWithEncoding(v124, (uint64_t)v59, v247, 1, v242, v233, &v260);
        if (v132)
        {
          *v235 = (NSString *)v132;
          goto LABEL_262;
        }
        v122 = iterations;
      }
      if (v122)
      {
        v134 = v121;
        do
        {
          v135 = *v134++;
          objc_msgSend(v250, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v135 + 24)));
          --v122;
        }
        while (v122);
      }
    }
    free(v121);
    v136 = malloc_type_malloc(0xD0uLL, 0x80040B8603338uLL);
    v137 = malloc_type_malloc(0x70uLL, 0x80040B8603338uLL);
    v256 = 0;
    __nel = 0;
    getAllDetectors((uint64_t)v136, &__nel, singleByteEncodings, 26, v117, v49, v252);
    getAllDetectors((uint64_t)v137, &v256, multiByteEncodings, 14, v117, v49, v252);
    if (v240)
    {
      for (n = 0; n != 14; ++n)
      {
        v139 = objc_msgSend(v117, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", windowsEncodings[n]));
        if (v139)
          *(double *)(v139 + 152) = *(double *)(v139 + 152) * 5.0;
      }
    }
    v230 = v137;
    v231 = v136;
    if (v236)
    {
      if (objc_msgSend(v236, "hasPrefix:", CFSTR("zh")))
      {
        for (ii = 0; ii != 11; ++ii)
        {
          v141 = objc_msgSend(v117, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", chineseEncodings[ii]));
          if (v141)
            *(double *)(v141 + 152) = *(double *)(v141 + 152) * 5.0;
        }
      }
      else if (objc_msgSend(v236, "hasPrefix:", CFSTR("ja")))
      {
        for (jj = 0; jj != 6; ++jj)
        {
          v143 = objc_msgSend(v117, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", japaneseEncodings[jj]));
          if (v143)
            *(double *)(v143 + 152) = *(double *)(v143 + 152) * 5.0;
        }
      }
      else if (objc_msgSend(v236, "hasPrefix:", CFSTR("ko")))
      {
        for (kk = 0; kk != 3; ++kk)
        {
          v145 = objc_msgSend(v117, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", koreanEncodings[kk]));
          if (v145)
            *(double *)(v145 + 152) = *(double *)(v145 + 152) * 5.0;
        }
      }
      else
      {
        v146 = (void *)objc_msgSend(&unk_1E0FCF0D0, "objectForKey:", objc_msgSend(v236, "substringWithRange:", 0, 2));
        v147 = objc_msgSend(v146, "count");
        if (v147)
        {
          v148 = v147;
          v149 = (unsigned int *)malloc_type_malloc(4 * v147, 0x100004052888210uLL);
          v267 = 0u;
          v268 = 0u;
          v269 = 0u;
          v270 = 0u;
          v150 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v267, v266, 16);
          if (v150)
          {
            v151 = v150;
            v152 = 0;
            v153 = *(_QWORD *)v268;
            do
            {
              for (mm = 0; mm != v151; ++mm)
              {
                if (*(_QWORD *)v268 != v153)
                  objc_enumerationMutation(v146);
                v149[v152 + mm] = objc_msgSend(*(id *)(*((_QWORD *)&v267 + 1) + 8 * mm), "integerValue");
              }
              v151 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v267, v266, 16);
              v152 += mm;
            }
            while (v151);
          }
          increaseWeightsOfEncodings((uint64_t)v250, v149, v148);
          free(v149);
          v137 = v230;
          v136 = v231;
        }
      }
    }
    if (v249)
    {
      mergesort(v136, __nel, 8uLL, (int (__cdecl *)(const void *, const void *))compareTwoDetectors);
      v155 = v256;
      mergesort(v137, v256, 8uLL, (int (__cdecl *)(const void *, const void *))compareTwoDetectors);
    }
    else
    {
      v155 = v256;
    }
    v255[0] = MEMORY[0x1E0C809B0];
    v255[1] = 3221225472;
    v255[2] = __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_2;
    v255[3] = &__block_descriptor_56_e8_v16__0Q8l;
    v255[4] = v137;
    v255[5] = v59;
    v255[6] = v247;
    dispatch_apply(v155, 0, v255);
    if (v155)
    {
      v253 = 0;
      v156 = 0;
      v157 = 0.0;
      v158 = -1;
      v159 = (id *)v137;
      v160 = -1;
      v161 = 0.0;
      while (1)
      {
        v162 = *v159;
        objc_msgSend(*v159, "confidence");
        v164 = v163;
        v165 = v162[8];
        objc_msgSend(v162, "bytesRatio");
        v167 = v166;
        if ((v164 > v161 || (v164 == v161 ? (v168 = v160 >= v165) : (v168 = 0), v168)) && v166 >= 0.85)
        {
          if (v162[8])
          {
            v169 = v164;
            v170 = v165;
            v171 = v162;
          }
          else
          {
            v176 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v247, objc_msgSend(v162, "nsEncoding"));
            v169 = v164;
            v170 = v165;
            v171 = v162;
            if (!v176)
            {
              v169 = v161;
              v170 = v160;
              v171 = v156;
              goto LABEL_336;
            }
          }
        }
        else
        {
          v169 = v161;
          v170 = v160;
          v171 = v156;
        }
        v172 = v164 / *((double *)v162 + 19);
        if ((v172 > v157 || (v172 == v157 ? (v173 = v158 >= v165) : (v173 = 0), v173)) && v167 >= 0.85)
        {
          if (!v162[8])
          {
            v174 = v170;
            v175 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v247, objc_msgSend(v162, "nsEncoding"));
            v170 = v174;
            if (!v175)
              goto LABEL_336;
          }
        }
        else
        {
          v172 = v157;
          v165 = v158;
          v162 = v253;
        }
        v157 = v172;
        v158 = v165;
        v253 = v162;
LABEL_336:
        ++v159;
        v156 = v171;
        v160 = v170;
        v161 = v169;
        if (!--v155)
          goto LABEL_341;
      }
    }
    v171 = 0;
    v253 = 0;
    v170 = -1;
    v169 = 0.0;
LABEL_341:
    v177 = v170;
    v251 = v171;
    v178 = __nel;
    v254[0] = MEMORY[0x1E0C809B0];
    v254[1] = 3221225472;
    v254[2] = __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_3;
    v254[3] = &__block_descriptor_56_e8_v16__0Q8l;
    v179 = (id *)v231;
    v254[4] = v231;
    v254[5] = v59;
    v254[6] = v247;
    dispatch_apply(__nel, 0, v254);
    v180 = 0;
    if (v178)
    {
      v241 = 1;
      v181 = 0.0;
      v182 = -1;
      while (1)
      {
        v183 = *v179;
        objc_msgSend(*v179, "confidence");
        v185 = v184;
        v186 = v183[8];
        objc_msgSend(v183, "bytesRatio");
        v188 = v187;
        if (v185 <= v169)
        {
          v189 = v177;
          v190 = v185 == v169 && v177 >= v186;
          if (!v190 || v187 < 0.85)
            goto LABEL_358;
        }
        else
        {
          v189 = v177;
          if (v187 < 0.85)
            goto LABEL_358;
        }
        v191 = v183[8];
        if (*((_DWORD *)v183 + 6) == 1536 && (double)v191 / (double)(unint64_t)v183[4] > 0.005)
          goto LABEL_372;
        if (v191)
        {
          v241 = 0;
          v169 = v185;
          v189 = v186;
          v251 = v183;
        }
        else
        {
          if (!-[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v247, objc_msgSend(v183, "nsEncoding")))
          {
            v189 = v177;
            goto LABEL_372;
          }
          v241 = 0;
          v169 = v185;
          v189 = v186;
          v251 = v183;
        }
LABEL_358:
        v192 = v185 / *((double *)v183 + 19);
        if ((v192 > v181 || (v192 == v181 ? (v193 = v182 >= v186) : (v193 = 0), v193)) && v188 >= 0.85)
        {
          v194 = v183[8];
          if (*((_DWORD *)v183 + 6) == 1536 && (double)v194 / (double)(unint64_t)v183[4] > 0.005)
            goto LABEL_372;
          if (!v194)
          {
            v195 = v189;
            v196 = generateStringWithEncoding(v183, (uint64_t)v59, v247, 1, 0, 0, 0);
            v189 = v195;
            if (!v196)
              goto LABEL_372;
          }
        }
        else
        {
          v192 = v181;
          v186 = v182;
          v183 = v180;
        }
        v181 = v192;
        v182 = v186;
        v180 = v183;
LABEL_372:
        v177 = v189;
        ++v179;
        if (!--v178)
          goto LABEL_376;
      }
    }
    v241 = 1;
LABEL_376:
    v197 = v241;
    v28 = (NSStringEncoding)v251;
    if (v251)
      v198 = objc_msgSend(v251, "nsEncoding");
    else
      v198 = 0x7FFFFFFFFFFFFFFFLL;
    v199 = v233;
    v200 = v239;
    if (v169 >= 0.05
      || (objc_msgSend(v249, "containsObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v198)) & 1) != 0)
    {
      v201 = v242;
      v202 = (NSStringEncoding)v253;
    }
    else
    {
      v201 = v242;
      v237 = v180;
      if (v232)
      {
        v264 = 0u;
        v265 = 0u;
        v262 = 0u;
        v263 = 0u;
        v214 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v262, v261, 16);
        if (v214)
        {
          v215 = v214;
          v216 = *(_QWORD *)v263;
          while (2)
          {
            for (nn = 0; nn != v215; ++nn)
            {
              if (*(_QWORD *)v263 != v216)
                objc_enumerationMutation(obj);
              v218 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * nn);
              v219 = -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", v245, objc_msgSend(v218, "integerValue"));
              if (v219)
              {
                if (v235)
                  *v235 = v219;
                if (v234)
                  *v234 = 0;
                free(v230);
                free(v231);
                return objc_msgSend(v218, "integerValue");
              }
            }
            v215 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v262, v261, 16);
            v199 = v233;
            v28 = (NSStringEncoding)v251;
            if (v215)
              continue;
            break;
          }
        }
      }
      if (v28)
        v220 = *(_QWORD *)(v28 + 64);
      else
        v220 = -1;
      v221 = v256;
      if (v256)
      {
        v222 = 0;
        v223 = 0.0;
        v224 = (id *)v230;
        v200 = v239;
        do
        {
          if (*((double *)*v224 + 19) == 1.0)
            break;
          objc_msgSend(*v224, "confidence");
          if (v223 < v225 && *((_QWORD *)*v224 + 8) <= v220)
          {
            v197 = 1;
            v223 = v225;
            v222 = *v224;
          }
          ++v224;
          --v221;
        }
        while (v221);
      }
      else
      {
        v222 = 0;
        v223 = 0.0;
        v200 = v239;
      }
      v226 = __nel;
      if (__nel)
      {
        v227 = (id *)v231;
        do
        {
          if (*((double *)*v227 + 19) == 1.0)
            break;
          objc_msgSend(*v227, "confidence");
          if (v223 < v228 && *((_QWORD *)*v227 + 8) <= v220)
          {
            v197 = 0;
            v223 = v228;
            v222 = *v227;
          }
          ++v227;
          --v226;
        }
        while (v226);
      }
      v28 = (NSStringEncoding)v251;
      v202 = (NSStringEncoding)v253;
      if (v222)
        v28 = (NSStringEncoding)v222;
      v180 = v237;
    }
    if ((v197 & 1) == 0)
      v202 = (NSStringEncoding)v180;
    if (v28 && v202 && v28 != v202)
    {
      v203 = *(_QWORD *)(v28 + 64);
      if (v203 && v203 > *(_QWORD *)(v202 + 64))
        v28 = v202;
    }
    else if (!v28)
    {
      v204 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_393:
      if (v200)
        v205 = v243;
      else
        v205 = 0;
      if (v205 && v204 != objc_msgSend((id)objc_msgSend(v249, "objectAtIndex:", 0), "integerValue")
        || (v200 = (_QWORD *)v28) != 0)
      {
        v28 = objc_msgSend(v200, "nsEncoding");
      }
      v206 = v201 ^ 1;
      if (v28)
        v206 = 1;
      if (((v206 | !v243) & 1) != 0)
      {
        if (!v235)
          goto LABEL_415;
        if (!v28)
          goto LABEL_415;
        *v235 = (NSString *)generateStringWithEncoding(v200, (uint64_t)v59, v247, 1, v201, v199, &v260);
        if (!v234)
          goto LABEL_415;
        v207 = v260;
        v208 = v234;
      }
      else
      {
        if (!objc_msgSend(v249, "count"))
          goto LABEL_415;
        v28 = objc_msgSend((id)objc_msgSend(v249, "objectAtIndex:", 0), "integerValue");
        v209 = +[NSEncodingDetector detectorForCFStringEncoding:allowBackupDetectors:](NSEncodingDetector, "detectorForCFStringEncoding:allowBackupDetectors:", CFStringConvertNSStringEncodingToEncoding(v28), 1);
        if (v209)
        {
          v210 = v209;
          v211 = -[NSData bytes](v245, "bytes");
          v212 = -[NSData length](v245, "length");
          objc_msgSend(v210, "recognizeString:withDataLength:intoBuffer:", v211, v212, 0);
          v213 = generateStringWithEncoding(v210, v211, v212, 1, 1, v199, &v260);
          if (v235)
          {
            if (v213)
              *v235 = (NSString *)v213;
          }
        }
        v208 = v234;
        if (!v234)
          goto LABEL_415;
        v207 = 1;
      }
      *v208 = v207;
LABEL_415:
      free(v230);
      free(v231);
      return v28;
    }
    v204 = objc_msgSend((id)v28, "nsEncoding");
    goto LABEL_393;
  }
  v92 = v91;
  v93 = *(_QWORD *)v288;
LABEL_178:
  v94 = 0;
  while (1)
  {
    if (*(_QWORD *)v288 != v93)
      objc_enumerationMutation(v90);
    v95 = *(_QWORD *)(*((_QWORD *)&v287 + 1) + 8 * v94);
    if (objc_msgSend((id)v95, "recognizeString:withDataLength:intoBuffer:", v59, v247, 0))
    {
      if (*(_BYTE *)(v95 + 162) && *(_QWORD *)(v95 + 72) <= 1uLL)
        break;
    }
LABEL_187:
    if (v92 == ++v94)
    {
      v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v287, v286, 16);
      if (!v92)
        goto LABEL_189;
      goto LABEL_178;
    }
  }
  if (!v235)
    goto LABEL_268;
  if (!*(_QWORD *)(v95 + 64))
  {
    v96 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v247, objc_msgSend((id)v95, "nsEncoding"));
    if (-[NSString length](v96, "length"))
      goto LABEL_199;
    goto LABEL_187;
  }
  v96 = (NSString *)generateStringWithEncoding((_QWORD *)v95, (uint64_t)v59, v247, 1, v242, v233, &v260);
LABEL_199:
  *v235 = v96;
  if (v234)
    *v234 = v260;
LABEL_268:
  v69 = (void *)v95;
  return objc_msgSend(v69, "nsEncoding");
}

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1[4] + 8 * a2), "recognizeString:withDataLength:intoBuffer:", a1[5], a1[6], 0);
}

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1[4] + 8 * a2), "recognizeString:withDataLength:intoBuffer:", a1[5], a1[6], 0);
}

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1[4] + 8 * a2), "recognizeString:withDataLength:intoBuffer:", a1[5], a1[6], 0);
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = _MergedGlobals_87();
  v3[1] = off_1ECD04D18();
  v3[2] = off_1ECD04D20();
  v3[3] = off_1ECD04D28();
  v3[4] = off_1ECD04D30();
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
}

+ (id)_newStringFromUTF16InternalData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  int v14;
  id v15;
  uint64_t v16;
  NSError *v17;

  if (!objc_msgSend(a3, "length"))
    return &stru_1E0F56070;
  if ((unint64_t)objc_msgSend(a3, "length") < 2)
  {
    result = 0;
  }
  else
  {
    result = (id)objc_msgSend((id)objc_msgSend(a3, "subdataWithRange:", 0, 2), "bytes");
    if (result)
    {
      v14 = *(unsigned __int16 *)result;
      if (v14 == 65534 || v14 == 65279)
      {
        v15 = objc_alloc((Class)a1);
        v16 = 10;
      }
      else
      {
        v15 = objc_alloc((Class)a1);
        v16 = 2483028224;
      }
      result = (id)objc_msgSend(v15, "initWithData:encoding:", a3, v16);
    }
  }
  if (a5)
  {
    if (!result)
    {
      v17 = _NSIPCocoaErrorWithCode(4864, 0, 0, (uint64_t)CFSTR("The string representation of type “%@” contains invalid data."), v9, v10, v11, v12, (uint64_t)a4);
      result = 0;
      *a5 = v17;
    }
  }
  return result;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSError *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v26[0] = 0;
  v9 = _MergedGlobals_87();
  if (off_1ECD04D40((uint64_t)a4, v9))
    goto LABEL_2;
  v12 = off_1ECD04D18();
  if (off_1ECD04D40((uint64_t)a4, v12))
  {
    v10 = objc_alloc((Class)a1);
    v11 = 10;
    goto LABEL_5;
  }
  v21 = off_1ECD04D20();
  if (off_1ECD04D40((uint64_t)a4, v21))
  {
    v13 = objc_msgSend(a1, "_newStringFromUTF16InternalData:typeIdentifier:error:", a3, a4, v26);
    goto LABEL_6;
  }
  v22 = off_1ECD04D28();
  if (off_1ECD04D40((uint64_t)a4, v22))
  {
LABEL_2:
    v10 = objc_alloc((Class)a1);
    v11 = 4;
LABEL_5:
    v13 = objc_msgSend(v10, "initWithData:encoding:", a3, v11);
LABEL_6:
    v18 = v13;
    goto LABEL_7;
  }
  v23 = off_1ECD04D30();
  if (off_1ECD04D40((uint64_t)a4, v23))
  {
    v24 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "objectWithItemProviderData:typeIdentifier:error:", a3, a4, v26);
    if (v26[0])
      v18 = 0;
    else
      v18 = objc_msgSend(objc_alloc((Class)a1), "initWithString:", objc_msgSend(v24, "absoluteString"));

  }
  else
  {
    v18 = 0;
  }
LABEL_7:
  v19 = (NSError *)v26[0];
  if (!(v18 | v26[0]))
  {
    v19 = _NSIPCocoaErrorWithCode(4864, 0, 0, (uint64_t)CFSTR("A string could not be instantiated because of an unknown error."), v14, v15, v16, v17, v25);
    v26[0] = v19;
  }
  if (a5 && v19)
    *a5 = v19;
  return (id)v18;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = _MergedGlobals_87();
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  NSArray *v3;
  void *v4;
  int v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = _MergedGlobals_87();
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self);
  if (objc_msgSend((id)objc_msgSend(v4, "scheme"), "length"))
  {
    v5 = objc_msgSend(v4, "isFileURL");
    v6 = 32;
    if (v5)
      v6 = 40;
    return -[NSArray arrayByAddingObject:](v3, "arrayByAddingObject:", (*(uint64_t (**)())((char *)&_MergedGlobals_87 + v6))());
  }
  return v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", _MergedGlobals_87()))
  {
    (*((void (**)(id, NSData *, _QWORD))a4 + 2))(a4, -[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4), 0);
  }
  else
  {
    if ((objc_msgSend(a3, "isEqualToString:", off_1ECD04D30()) & 1) != 0
      || objc_msgSend(a3, "isEqualToString:", off_1ECD04D38()))
    {
      return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self), "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", a3, a4);
    }
    (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
  return 0;
}

- (NSUInteger)length
{
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)__NSStringClass);
}

- (unichar)characterAtIndex:(NSUInteger)index
{
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)__NSStringClass);
}

+ (id)stringWithCString:(const char *)bytes
{
  void *v4;

  if (!bytes)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NULL cString"), _NSMethodExceptionProem((objc_class *)a1, a2)), 0);
    objc_exception_throw(v4);
  }
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithCString:", bytes);
}

+ (id)stringWithCString:(const char *)bytes length:(NSUInteger)length
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithCString:length:", bytes, length);
}

+ (NSString)stringWithFormat:(id)a3 locale:(id)a4
{
  uint64_t v5;

  return (NSString *)-[NSPlaceholderString initWithFormat:locale:arguments:](&__placeholder, "initWithFormat:locale:arguments:", a3, a4, &v5, &v5);
}

+ (id)stringWithContentsOfFile:(NSString *)path
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithContentsOfFile:", path);
}

+ (id)stringWithContentsOfURL:(NSURL *)url
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithContentsOfURL:", url);
}

+ (NSString)stringWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithContentsOfURL:usedEncoding:error:", url, enc, error);
}

+ (NSString)stringWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  return (NSString *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithContentsOfFile:usedEncoding:error:", path, enc, error);
}

- (BOOL)_isCString
{
  return -[NSString _fastCStringContents:](self, "_fastCStringContents:", 0) != 0;
}

- (NSComparisonResult)localizedCompare:(NSString *)string
{
  NSUInteger v5;

  v5 = -[NSString length](self, "length");
  return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:", string, 0, 0, v5, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
}

- (BOOL)localizedHasPrefix:(id)a3
{
  NSUInteger v5;

  v5 = -[NSString length](self, "length");
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", a3, 8, 0, v5, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)localizedHasSuffix:(id)a3
{
  NSUInteger v5;

  v5 = -[NSString length](self, "length");
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", a3, 12, 0, v5, objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale")) != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)getCharacters:(unichar *)buffer range:(NSRange)range
{
  NSUInteger length;
  NSUInteger location;

  if (range.length)
  {
    length = range.length;
    location = range.location;
    do
    {
      *buffer++ = -[NSString characterAtIndex:](self, "characterAtIndex:", location++);
      --length;
    }
    while (length);
  }
}

- (NSString)localizedLowercaseString
{
  return -[NSString lowercaseStringWithLocale:](self, "lowercaseStringWithLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
}

- (NSString)localizedCapitalizedString
{
  return -[NSString capitalizedStringWithLocale:](self, "capitalizedStringWithLocale:", objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"));
}

- (NSString)decomposedStringWithCanonicalMapping
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormD);
  return (NSString *)Mutable;
}

- (NSString)decomposedStringWithCompatibilityMapping
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormKD);
  return (NSString *)Mutable;
}

- (NSString)precomposedStringWithCompatibilityMapping
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormKC);
  return (NSString *)Mutable;
}

- (NSString)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(NSLocale *)locale
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringFold(Mutable, options, (CFLocaleRef)locale);
  return (NSString *)Mutable;
}

- (NSString)stringByApplyingTransform:(NSStringTransform)transform reverse:(BOOL)reverse
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  if (CFStringTransform(Mutable, 0, (CFStringRef)transform, reverse))
    return (NSString *)Mutable;

  return 0;
}

- (void)getLineStart:(NSUInteger *)startPtr end:(NSUInteger *)lineEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range
{
  -[NSString _getBlockStart:end:contentsEnd:forRange:stopAtLineSeparators:](self, "_getBlockStart:end:contentsEnd:forRange:stopAtLineSeparators:", startPtr, lineEndPtr, contentsEndPtr, range.location, range.length, 1);
}

- (NSRange)lineRangeForRange:(NSRange)range
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  _QWORD v6[2];
  NSRange result;

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6[0] = 0;
  -[NSString getLineStart:end:contentsEnd:forRange:](self, "getLineStart:end:contentsEnd:forRange:", v6, &v5, 0, range.location, range.length);
  v3 = v6[0];
  v4 = v5 - v6[0];
  result.length = v4;
  result.location = v3;
  return result;
}

CFStringTokenizerTokenType __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_2(int a1, CFStringTokenizerRef tokenizer)
{
  CFStringTokenizerTokenType Token;

  do
    Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
  while (!Token && CFStringTokenizerGetCurrentTokenRange(tokenizer).location != -1);
  return Token;
}

uint64_t __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3(uint64_t a1, void **a2, void **a3, uint64_t a4, unint64_t a5)
{
  double v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v10 = 64.0;
  if (*(_QWORD *)(a1 + 40) == 3)
    v10 = 4.0;
  v23 = vcvtpd_u64_f64((double)a5 / v10);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (*a2)
    free(*a2);
  if (*a3)
    free(*a3);
  *a2 = malloc_type_malloc(16 * v21[3], 0x1000040451B5BE8uLL);
  *a3 = malloc_type_malloc(16 * v21[3], 0x1000040451B5BE8uLL);
  v11 = *(_QWORD *)(a1 + 48) & 0xFFFFFFFFFFFFFCFFLL | 0x200;
  if (!*(_BYTE *)(a1 + 80) && a4 != *(_QWORD *)(a1 + 56) && a4 + a5 != *(_QWORD *)(a1 + 72))
    v11 = *(_QWORD *)(a1 + 48) & 0xFFFFFFFFFFFFF4FFLL | 0x200;
  v12 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_4;
  v15[3] = &unk_1E0F50F50;
  v15[4] = &v16;
  v15[5] = &v20;
  v15[6] = a2;
  v15[7] = a3;
  objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", a4, a5, v11, v15);
  v13 = v17[3];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;

  v10 = result;
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  v12 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (v11 == *(_QWORD *)(v12 + 24))
  {
    *(_QWORD *)(v12 + 24) = 2 * v11;
    **(_QWORD **)(result + 48) = MEMORY[0x186DA80E4](**(_QWORD **)(result + 48), 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24), 0x1000040451B5BE8, 0);
    result = MEMORY[0x186DA80E4](**(_QWORD **)(v10 + 56), 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v10 + 40) + 8) + 24), 0x1000040451B5BE8, 0);
    **(_QWORD **)(v10 + 56) = result;
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v10 + 32) + 8) + 24);
  }
  v13 = *(_QWORD **)(v10 + 56);
  v14 = (_QWORD *)(**(_QWORD **)(v10 + 48) + 16 * v11);
  *v14 = a3;
  v14[1] = a4;
  v15 = (_QWORD *)(*v13 + 16 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v10 + 32) + 8) + 24));
  *v15 = a5;
  v15[1] = a6;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v10 + 32) + 8) + 24);
  return result;
}

- (id)displayableString
{
  NSString *v2;
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  __int16 v6;
  unint64_t v7;
  unsigned int v8;
  int v9;
  unsigned __int16 v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t size;
  __int128 v27;
  NSString *v28;
  NSUInteger v29;
  _OWORD v30[4];
  __int128 v31;
  uint64_t v32;

  v2 = self;
  v32 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  memset(v30, 0, sizeof(v30));
  v27 = 0u;
  v3 = -[NSString length](self, "length");
  v4 = v3;
  v29 = v3;
  *(_QWORD *)&v30[0] = 0;
  size = 6 * v3;
  v28 = v2;
  if (v3)
  {
    if (v3 >= 0x20)
      v5 = 32;
    else
      v5 = v3;
    *(_QWORD *)&v27 = v5;
    objc_msgSend(v2, sel_getUid("getCharacters:range:"), (char *)v30 + 8, 0, v5, size);
    v6 = WORD4(v30[0]);
  }
  else
  {
    *(_QWORD *)&v27 = 0;
    v6 = -1;
  }
  *((_QWORD *)&v27 + 1) = 1;
  WORD4(v31) = v6;
  v7 = 1;
  while (v7 - 1 < (unint64_t)v27)
  {
    v8 = (unsigned __int16)(v6 - 32);
    v9 = v6;
    v10 = v6 - 9;
    v11 = v10;
    v12 = (0xD00000A09uLL >> (8 * v10)) & 0xF;
    if (v11 >= 5)
      LODWORD(v12) = 0;
    if (v8 >= 0x5F)
      v13 = v12;
    else
      v13 = v9;
    if (v7 >= (unint64_t)v27)
    {
      v15 = *(_QWORD *)&v30[0] + v27;
      if (v29 <= *(_QWORD *)&v30[0] + (_QWORD)v27)
      {
        v7 = v27 + 1;
        *((_QWORD *)&v27 + 1) = v27 + 1;
        v6 = -1;
        goto LABEL_23;
      }
      if (v29 - (*(_QWORD *)&v30[0] + (_QWORD)v27) >= 0x20)
        v16 = 32;
      else
        v16 = v29 - (*(_QWORD *)&v30[0] + v27);
      *(_QWORD *)&v30[0] += v27;
      *(_QWORD *)&v27 = v16;
      objc_msgSend(v28, sel_getUid("getCharacters:range:"), (char *)v30 + 8, v15, v16);
      v6 = WORD4(v30[0]);
      WORD4(v31) = WORD4(v30[0]);
      *((_QWORD *)&v27 + 1) = 1;
      v7 = 1;
      if (!v13)
      {
LABEL_24:
        v17 = malloc_type_malloc(size, 0xFC6ED2A6uLL);
        v29 = v4;
        *(_QWORD *)&v30[0] = 0;
        v28 = v2;
        if (v4)
        {
          if (v4 >= 0x20)
            v4 = 32;
          *(_QWORD *)&v27 = v4;
          objc_msgSend(v2, sel_getUid("getCharacters:range:"), (char *)v30 + 8, 0, v4);
          v18 = WORD4(v30[0]);
          *((_QWORD *)&v27 + 1) = 1;
          WORD4(v31) = WORD4(v30[0]);
          v19 = 0;
          if ((_QWORD)v27)
          {
            do
            {
              if ((v18 - 32) < 0x5F || v18 <= 0xD && ((1 << v18) & 0x2600) != 0)
              {
                v17[v19++] = v18;
              }
              else
              {
                v24 = &v17[v19];
                if (v18 > 0x7F)
                {
                  *(_WORD *)v24 = 21852;
                  v24[2] = a0123456789abcd[(unint64_t)v18 >> 12];
                  v24[3] = a0123456789abcd[(v18 >> 8) & 0xF];
                  v24[4] = a0123456789abcd[v18 >> 4];
                  v19 += 6;
                  v24[5] = a0123456789abcd[v18 & 0xF];
                }
                else
                {
                  *v24 = 92;
                  v24[1] = (v18 >> 6) | 0x30;
                  v24[2] = (v18 >> 3) & 7 | 0x30;
                  v19 += 4;
                  v24[3] = v18 & 7 | 0x30;
                }
              }
              v21 = *((_QWORD *)&v27 + 1);
              v20 = v27;
              if (*((_QWORD *)&v27 + 1) >= (unint64_t)v27)
              {
                v22 = *(_QWORD *)&v30[0] + v27;
                if (v29 <= *(_QWORD *)&v30[0] + (_QWORD)v27)
                {
                  *((_QWORD *)&v27 + 1) = v27 + 1;
                  v18 = 0xFFFFLL;
                  WORD4(v31) = -1;
                  v21 = v27;
                }
                else
                {
                  if (v29 - (*(_QWORD *)&v30[0] + (_QWORD)v27) >= 0x20)
                    v23 = 32;
                  else
                    v23 = v29 - (*(_QWORD *)&v30[0] + v27);
                  *(_QWORD *)&v30[0] += v27;
                  *(_QWORD *)&v27 = v23;
                  objc_msgSend(v28, sel_getUid("getCharacters:range:"), (char *)v30 + 8, v22, v23);
                  v21 = 0;
                  v18 = WORD4(v30[0]);
                  WORD4(v31) = WORD4(v30[0]);
                  *((_QWORD *)&v27 + 1) = 1;
                  v20 = v27;
                }
              }
              else
              {
                ++*((_QWORD *)&v27 + 1);
                v18 = *((unsigned __int16 *)v30 + v21 + 4);
                WORD4(v31) = *((_WORD *)v30 + v21 + 4);
              }
            }
            while (v21 < v20);
          }
        }
        else
        {
          v19 = 0;
          v27 = xmmword_18205FD60;
          WORD4(v31) = -1;
        }
        return (id)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithCStringNoCopy:length:freeWhenDone:", MEMORY[0x186DA80E4](v17, v19, 3775710755, 0), v19, 1);
      }
    }
    else
    {
      v14 = (char *)&v27 + 2 * v7++;
      *((_QWORD *)&v27 + 1) = v7;
      v6 = *((_WORD *)v14 + 20);
LABEL_23:
      WORD4(v31) = v6;
      if (!v13)
        goto LABEL_24;
    }
  }
  return v2;
}

- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return writeStringToURLOrPath(self, url, useAuxiliaryFile, enc, error);
}

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile
{
  return -[NSString writeToURL:atomically:](self, "writeToURL:atomically:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", path), useAuxiliaryFile);
}

- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically
{
  _BOOL4 v4;
  uint64_t v7;
  NSError *v9[2];

  v4 = atomically;
  v9[1] = *(NSError **)MEMORY[0x1E0C80C00];
  if (__NSDefaultStringEncodingFullyInited)
    v7 = _NSDefaultStringEncoding;
  else
    v7 = _NSDefaultCStringEncoding();
  v9[0] = 0;
  if ((writeStringToURLOrPath(self, url, v4, v7, v9) & 1) != 0)
    return 1;
  if (-[NSError code](v9[0], "code") == 517)
    return writeStringToURLOrPath(self, url, v4, 10, 0);
  return 0;
}

- (id)initWithCString:(const char *)bytes length:(NSUInteger)length
{
  uint64_t v7;

  if (__NSDefaultStringEncodingFullyInited)
    v7 = _NSDefaultStringEncoding;
  else
    v7 = _NSDefaultCStringEncoding();
  return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", bytes, length, v7);
}

- (id)initWithCString:(const char *)bytes
{
  size_t v5;
  uint64_t v6;
  void *v8;

  if (!bytes)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NULL cString"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v8);
  }
  v5 = strlen(bytes);
  if (__NSDefaultStringEncodingFullyInited)
    v6 = _NSDefaultStringEncoding;
  else
    v6 = _NSDefaultCStringEncoding();
  return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", bytes, v5, v6);
}

- (NSString)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding
{
  void *v5;

  if (!nullTerminatedCString)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NULL cString"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v5);
  }
  return -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", nullTerminatedCString, strlen(nullTerminatedCString), encoding);
}

- (NSString)initWithString:(NSString *)aString
{
  NSUInteger v5;
  NSUInteger v6;
  malloc_zone_t *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  NSUInteger v12;
  uint64_t v13;

  v5 = -[NSString length](aString, "length");
  if (!v5)
  {
    v10 = self;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    return -[NSString initWithCharactersNoCopy:length:freeWhenDone:](v10, "initWithCharactersNoCopy:length:freeWhenDone:", v11, v12, v13);
  }
  v6 = v5;
  v7 = (malloc_zone_t *)-[NSString zone](self, "zone");
  if (!v7)
    v7 = malloc_default_zone();
  v8 = malloc_type_zone_malloc(v7, 2 * v6, 0x4A6F13AEuLL);
  if (v8)
  {
    v9 = v8;
    -[NSString getCharacters:range:](aString, "getCharacters:range:", v8, 0, v6);
    v10 = self;
    v11 = v9;
    v12 = v6;
    v13 = 1;
    return -[NSString initWithCharactersNoCopy:length:freeWhenDone:](v10, "initWithCharactersNoCopy:length:freeWhenDone:", v11, v12, v13);
  }
  -[NSString dealloc](self, "dealloc");
  return 0;
}

- (id)_initWithDataOfUnknownEncoding:(id)a3
{
  unint64_t v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t v8;

  v5 = objc_msgSend(a3, "length");
  v6 = (unsigned __int8 *)objc_msgSend(a3, "bytes");
  if (!a3)
    return 0;
  if (v5 < 2)
    goto LABEL_12;
  if ((v5 & 1) != 0)
    goto LABEL_7;
  v7 = *v6;
  if (v7 == 255)
  {
    if (v6[1] != 254)
      goto LABEL_7;
LABEL_18:
    v8 = 10;
    return -[NSString initWithData:encoding:](self, "initWithData:encoding:", a3, v8);
  }
  if (v7 == 254 && v6[1] == 255)
    goto LABEL_18;
LABEL_7:
  if (v5 < 3 || *v6 != 239 || v6[1] != 187 || v6[2] != 191)
  {
LABEL_12:
    if (__NSDefaultStringEncodingFullyInited)
      v8 = _NSDefaultStringEncoding;
    else
      v8 = _NSDefaultCStringEncoding();
    return -[NSString initWithData:encoding:](self, "initWithData:encoding:", a3, v8);
  }
  v8 = 4;
  return -[NSString initWithData:encoding:](self, "initWithData:encoding:", a3, v8);
}

- (id)initWithContentsOfFile:(NSString *)path
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfMappedFile:", path);
  v5 = -[NSString _initWithDataOfUnknownEncoding:](self, "_initWithDataOfUnknownEncoding:", v4);

  return v5;
}

- (id)initWithContentsOfURL:(NSURL *)url
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", url);
  v5 = -[NSString _initWithDataOfUnknownEncoding:](self, "_initWithDataOfUnknownEncoding:", v4);

  return v5;
}

- (NSString)initWithData:(id)a3 usedEncoding:(unint64_t *)a4
{
  return (NSString *)-[NSString _initWithBytesOfUnknownEncoding:length:copy:usedEncoding:](self, "_initWithBytesOfUnknownEncoding:length:copy:usedEncoding:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 1, a4);
}

- (id)_initWithFormat:(id)a3 options:(id)a4
{
  uint64_t v5;

  return -[NSString _initWithFormat:locale:options:arguments:](self, "_initWithFormat:locale:options:arguments:", a3, 0, a4, &v5, &v5);
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5
{
  uint64_t v6;

  return -[NSString _initWithFormat:locale:options:arguments:](self, "_initWithFormat:locale:options:arguments:", a3, a4, a5, &v6, &v6);
}

- (id)_initWithFormat:(id)a3 options:(id)a4 arguments:(char *)a5
{
  return -[NSString _initWithFormat:locale:options:arguments:](self, "_initWithFormat:locale:options:arguments:", a3, 0, a4, a5);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v7;

  return -[NSString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:](self, "_initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:", a3, a4, 0, a5, a6, &v7, &v7);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v8;

  return -[NSString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:](self, "_initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:", a3, a4, a5, a6, a7, &v8, &v8);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6 arguments:(char *)a7
{
  return -[NSString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:](self, "_initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:", a3, a4, 0, a5, a6, a7);
}

- (NSString)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSString)initWithCharactersNoCopy:(unichar *)chars length:(NSUInteger)len deallocator:(void *)deallocator
{
  _NSRequestConcreteObject((int)self, a2);
}

- (id)initWithCStringNoCopy:(char *)bytes length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding deallocator:(void *)deallocator
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSString)initWithFormat:(NSString *)format locale:(id)locale arguments:(va_list)argList
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  va_list va;

  va_start(va, error);
  return -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:](self, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format, validFormatSpecifiers, 0, va, error, va);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale error:(NSError *)error
{
  va_list va;

  va_start(va, error);
  return -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:](self, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format, validFormatSpecifiers, locale, va, error, va);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers arguments:(va_list)argList error:(NSError *)error
{
  return -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:](self, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format, validFormatSpecifiers, 0, argList, error);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale arguments:(va_list)argList error:(NSError *)error
{
  _NSRequestConcreteObject((int)self, a2);
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  _NSRequestConcreteObject((int)self, a2);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
  _NSRequestConcreteObject((int)self, a2);
}

- (id)propertyList
{
  id v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  return (id)_CFPropertyListCreateFromXMLString();
}

- (NSDictionary)propertyListFromStringsFileFormat
{
  NSDictionary *v2;

  v2 = -[NSString propertyList](self, "propertyList");
  if (_NSIsNSDictionary())
    return v2;
  else
    return 0;
}

- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength range:(NSRange)aRange remainingRange:(NSRangePointer)leftoverRange
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  NSUInteger v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  _QWORD v17[2];

  length = aRange.length;
  location = aRange.location;
  v17[1] = *MEMORY[0x1E0C80C00];
  if (__NSDefaultStringEncodingFullyInited)
    v12 = _NSDefaultStringEncoding;
  else
    v12 = _NSDefaultCStringEncoding();
  v17[0] = 0;
  if (!-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", bytes, maxLength, v17, v12, 0, location, length, leftoverRange))
  {
    v13 = -[NSString length](self, "length");
    v14 = self;
    if (v13 >= 0x18)
      v14 = -[NSString stringByAppendingString:](-[NSString substringWithRange:](self, "substringWithRange:", 0, 20), "stringByAppendingString:", CFSTR("..."));
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Conversion to cString failed for string \"%@\"), v14);
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", CFSTR("NSCharacterConversionException"), v16, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self, CFSTR("_NSString"), 0)));
  }
  bytes[v17[0]] = 0;
}

- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength
{
  -[NSString getCString:maxLength:range:remainingRange:](self, "getCString:maxLength:range:remainingRange:", bytes, maxLength, 0, -[NSString length](self, "length"), 0);
}

- (void)getCString:(char *)bytes
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if ((unint64_t)bytes > 0x8000000000000000)
    v3 = (unint64_t)bytes;
  -[NSString getCString:maxLength:range:remainingRange:](self, "getCString:maxLength:range:remainingRange:", bytes, ~v3, 0, -[NSString length](self, "length"), 0);
}

- (const)cString
{
  uint64_t v3;

  if (__NSDefaultStringEncodingFullyInited)
    v3 = _NSDefaultStringEncoding;
  else
    v3 = _NSDefaultCStringEncoding();
  return (const char *)bytesInEncoding(self, v3, 1, 1, 0);
}

- (NSUInteger)cStringLength
{
  uint64_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (__NSDefaultStringEncodingFullyInited)
    v3 = _NSDefaultStringEncoding;
  else
    v3 = _NSDefaultCStringEncoding();
  v5[0] = 0;
  if (-[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, 0x7FFFFFFFFFFFFFFELL, v5, v3, 6, 0, -[NSString length](self, "length"), 0))
  {
    return v5[0];
  }
  else
  {
    return 0;
  }
}

- (const)lossyCString
{
  uint64_t v3;

  if (__NSDefaultStringEncodingFullyInited)
    v3 = _NSDefaultStringEncoding;
  else
    v3 = _NSDefaultCStringEncoding();
  return (const char *)bytesInEncoding(self, v3, 0, 0, 1u);
}

- (NSStringEncoding)smallestEncoding
{
  NSStringEncoding v3;
  uint64_t v4;

  v3 = 1;
  if (!-[NSString canBeConvertedToEncoding:](self, "canBeConvertedToEncoding:", 1))
  {
    if (__NSDefaultStringEncodingFullyInited)
      v4 = _NSDefaultStringEncoding;
    else
      v4 = _NSDefaultCStringEncoding();
    if (-[NSString canBeConvertedToEncoding:](self, "canBeConvertedToEncoding:", v4))
      return _NSDefaultStringEncoding;
    else
      return 10;
  }
  return v3;
}

+ (const)availableStringEncodings
{
  const NSStringEncoding *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;

  v2 = (const NSStringEncoding *)availableStringEncodings_encodings;
  if (!availableStringEncodings_encodings)
  {
    v3 = (_DWORD *)MEMORY[0x186DA70F4](a1, a2);
    if (*v3 == -1)
    {
      v5 = 0;
    }
    else
    {
      v4 = 0;
      do
      {
        v5 = v4 + 1;
        v6 = v3[++v4];
      }
      while (v6 != -1);
    }
    v7 = MEMORY[0x186DA70F4]();
    v2 = (const NSStringEncoding *)malloc_type_malloc(8 * v5 + 8, 0x100004000313F17uLL);
    v2[v5] = 0;
    v8 = v5 < 1;
    v9 = v5 - 1;
    if (!v8)
    {
      do
      {
        v2[v9] = CFStringConvertEncodingToNSStringEncoding(*(_DWORD *)(v7 + 4 * v9));
        v10 = v9-- + 1;
      }
      while (v10 > 1);
    }
    availableStringEncodings_encodings = (uint64_t)v2;
  }
  return v2;
}

+ (NSString)localizedNameOfStringEncoding:(NSStringEncoding)encoding
{
  CFStringEncoding v4;
  CFStringRef NameOfEncoding;

  v4 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v4 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      v4 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter())
        NSLog((NSString *)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future."), encoding);
      v4 = 1536;
    }
  }
  NameOfEncoding = CFStringGetNameOfEncoding(v4);
  if (NameOfEncoding)
    return (NSString *)objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", NameOfEncoding, &stru_1E0F56070, CFSTR("EncodingNames"));
  else
    return (NSString *)&stru_1E0F56070;
}

- (BOOL)_web_isCaseInsensitiveEqualToString:(id)a3
{
  return -[NSString compare:options:](self, "compare:options:", a3, 3) == NSOrderedSame;
}

- (BOOL)_web_hasCaseInsensitivePrefix:(id)a3
{
  return -[NSString rangeOfString:options:](self, "rangeOfString:options:", a3, 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_web_countOfString:(id)a3
{
  NSUInteger v5;
  int64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;

  v5 = -[NSString length](self, "length");
  v6 = 0;
  v7 = 0;
  v8 = v5;
  do
  {
    v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", a3, 2, v7, v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v8 = v5 - (v9 + v10);
    ++v6;
    v7 = v9 + v10;
  }
  while (v9 + v10 < v5);
  return v6;
}

- (BOOL)_web_hasCountryCodeTLD
{
  uint64_t v4;

  if (-[NSString _web_looksLikeIPAddress](self, "_web_looksLikeIPAddress"))
    return 0;
  v4 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("."), 4);
  return v4 == -[NSString length](self, "length") - 3;
}

- (BOOL)_web_domainMatches:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  if (-[NSString _web_isCaseInsensitiveEqualToString:](self, "_web_isCaseInsensitiveEqualToString:"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "length");
    if (v5)
    {
      if (objc_msgSend(a3, "characterAtIndex:", 0) == 46
        && !-[NSString _web_looksLikeIPAddress](self, "_web_looksLikeIPAddress"))
      {
        v6 = -[NSString length](self, "length");
        if (v6 >= objc_msgSend(a3, "length"))
        {
          v7 = self;
          v8 = a3;
        }
        else
        {
          v7 = a3;
          v8 = self;
        }
        LOBYTE(v5) = objc_msgSend(v7, "rangeOfString:options:", v8, 13) != 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)_web_domainFromHost
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;

  if (-[NSString _web_looksLikeIPAddress](self, "_web_looksLikeIPAddress"))
    return self;
  v4 = -[NSString _web_hasCountryCodeTLD](self, "_web_hasCountryCodeTLD");
  v5 = -[NSString _web_countOfString:](self, "_web_countOfString:", CFSTR("."));
  if (!v4)
  {
    if (v5 > 1)
    {
      v6 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("."), 4);
      return -[NSString substringFromIndex:](self, "substringFromIndex:", -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("."), 4, 0, v6));
    }
    return (id)objc_msgSend(CFSTR("."), "stringByAppendingString:", self);
  }
  if (v5 <= 2)
    return (id)objc_msgSend(CFSTR("."), "stringByAppendingString:", self);
  v6 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("."), 4, 0, -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("."), 4));
  return -[NSString substringFromIndex:](self, "substringFromIndex:", -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("."), 4, 0, v6));
}

- (id)_web_stringByTrimmingWhitespace
{
  NSUInteger v3;
  NSUInteger v4;
  const __CFCharacterSet *Predefined;
  NSUInteger v6;
  NSUInteger v7;
  int IsCharacterMember;
  uint64_t v9;

  v3 = -[NSString length](self, "length");
  if (!v3)
    return self;
  v4 = v3;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  v6 = v4 + 1;
  do
  {
    v7 = v6 - 1;
    if (v6 == 1)
    {
      v9 = 0;
      goto LABEL_10;
    }
    IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, -[NSString characterAtIndex:](self, "characterAtIndex:", v6 - 2));
    v6 = v7;
  }
  while (IsCharacterMember);
  v9 = 0;
  do
  {
    if (!CFCharacterSetIsCharacterMember(Predefined, -[NSString characterAtIndex:](self, "characterAtIndex:", v9)))
      break;
    ++v9;
    --v7;
  }
  while (v7);
LABEL_10:
  if (v4 != v7)
    return -[NSString substringWithRange:](self, "substringWithRange:", v9, v7);
  else
    return self;
}

- (id)_web_stringByExpandingTildeInPath
{
  NSString *v3;

  v3 = -[NSString stringByExpandingTildeInPath](self, "stringByExpandingTildeInPath");
  if (-[NSString hasSuffix:](self, "hasSuffix:", CFSTR("/")) && !-[NSString hasSuffix:](v3, "hasSuffix:", CFSTR("/")))
    return -[NSString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("/"));
  else
    return v3;
}

- (id)_web_fixedCarbonPOSIXPath
{
  NSFileManager *v3;
  id v4;
  void *v5;
  NSString *v6;

  v3 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v3, "fileExistsAtPath:", self))
  {
    v4 = (id)-[NSArray mutableCopy](-[NSString pathComponents](self, "pathComponents"), "mutableCopy");
    v5 = (void *)objc_msgSend(v4, "objectAtIndex:", 1);
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Volumes")))
    {
      v5 = (void *)objc_msgSend(v4, "objectAtIndex:", 2);
      objc_msgSend(v4, "removeObjectAtIndex:", 1);
    }
    if (v5)
    {
      if (objc_msgSend(-[NSFileManager _web_startupVolumeName_nowarn](v3, "_web_startupVolumeName_nowarn"), "isEqualToString:", v5))
      {
        objc_msgSend(v4, "removeObjectAtIndex:", 1);
      }
      else
      {
        if (!-[NSArray containsObject:](-[NSFileManager contentsOfDirectoryAtPath:error:](v3, "contentsOfDirectoryAtPath:error:", CFSTR("/Volumes"), 0), "containsObject:", v5))return self;
        objc_msgSend(v4, "insertObject:atIndex:", CFSTR("Volumes"), 1);
      }
      v6 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", v4);
      if (-[NSFileManager fileExistsAtPath:](v3, "fileExistsAtPath:", v6))
        return v6;
    }
  }
  return self;
}

- (_NSRange)_web_rangeOfURLUserPasswordHostPort
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  _NSRange result;

  v3 = -[NSString _web_rangeOfURLResourceSpecifier_nowarn](self, "_web_rangeOfURLResourceSpecifier_nowarn");
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || (v6 = v3,
        v7 = v4,
        -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("//"), 8, v3, v4) == 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = 0;
  }
  else
  {
    v5 = v6 + 2;
    v9 = v7 - 2;
    v10 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("/"), 0, v6 + 2, v9);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = v9;
    else
      v8 = v10 - v5;
  }
  v11 = v5;
  result.length = v8;
  result.location = v11;
  return result;
}

- (_NSRange)_web_rangeOfURLHost
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  _NSRange result;

  v3 = -[NSString _web_rangeOfURLUserPasswordHostPort](self, "_web_rangeOfURLUserPasswordHostPort");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  v5 = v3;
  v6 = v4;
  v7 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("@"), 0, v3, v4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFELL)
    {
LABEL_4:
      v8 = 0;
      v5 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
    }
    v6 += v5 + ~v7;
    v5 = v7 + 1;
  }
  v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR(":"), 0, v5, v6);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = v6;
  else
    v8 = v9 - v5;
LABEL_9:
  v10 = v5;
  result.length = v8;
  result.location = v10;
  return result;
}

- (BOOL)_web_looksLikeAbsoluteURL
{
  return objc_msgSend(-[NSString _web_stringByTrimmingWhitespace](self, "_web_stringByTrimmingWhitespace"), "_web_rangeOfURLScheme_nowarn") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_web_isFileURL
{
  return -[NSString _web_hasCaseInsensitivePrefix:](self, "_web_hasCaseInsensitivePrefix:", CFSTR("file:"));
}

- (id)_web_URLFragment
{
  uint64_t v3;

  v3 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("#"), 2);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[NSString substringFromIndex:](self, "substringFromIndex:", v3);
}

+ (id)_web_stringRepresentationForBytes:(int64_t)a3
{
  double v4;
  const char *v5;
  id result;
  double v7;
  const char *v8;

  if (a3 >= 0)
    v4 = (double)a3;
  else
    v4 = -(double)a3;
  if (v4 == 0.0)
  {
    v5 = "0 bytes";
LABEL_8:
    result = (id)NSURLLocalizedString(v5);
    goto LABEL_9;
  }
  if (v4 == 1.0)
  {
    v5 = "1 byte";
    goto LABEL_8;
  }
  if (v4 >= 100.0)
  {
    v7 = v4 * 0.0009765625;
    if (v4 >= 1000.0)
    {
      if (v7 >= 9.95)
      {
        if (v7 >= 99.95)
        {
          if (v7 >= 999.5)
          {
            v7 = v7 * 0.0009765625;
            if (v7 >= 9.95)
            {
              if (v7 >= 99.95)
              {
                if (v7 >= 999.5)
                {
                  v7 = v7 * 0.0009765625;
                  if (v7 >= 9.95)
                  {
                    if (v7 >= 99.95)
                      v8 = "%.0f GB";
                    else
                      v8 = "%.1f GB (10.0)";
                  }
                  else
                  {
                    v8 = "%.1f GB (1.0)";
                  }
                }
                else
                {
                  v8 = "%.0f MB";
                }
              }
              else
              {
                v8 = "%.1f MB (10.0)";
              }
            }
            else
            {
              v8 = "%.1f MB (1.0)";
            }
          }
          else
          {
            v8 = "%.0f KB";
          }
        }
        else
        {
          v8 = "%.1f KB (10.0)";
        }
      }
      else
      {
        v8 = "%.1f KB (1.0)";
      }
    }
    else
    {
      v8 = "%.1f KB (0.1)";
    }
    result = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", NSURLLocalizedString(v8), *(_QWORD *)&v7);
  }
  else
  {
    result = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", NSURLLocalizedString("%.0f bytes"), *(_QWORD *)&v4);
  }
LABEL_9:
  if (a3 < 0)
    return (id)objc_msgSend(CFSTR("-"), "stringByAppendingString:", result);
  return result;
}

- (id)_web_stringByCollapsingNonPrintingCharacters
{
  NSString *v3;
  NSMutableCharacterSet *v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = +[NSString string](NSMutableString, "string");
  if (!_MergedGlobals_121)
  {
    v4 = objc_alloc_init(NSMutableCharacterSet);
    -[NSMutableCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", 0, 33);
    -[NSMutableCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", 127, 1);
    _MergedGlobals_121 = -[NSMutableCharacterSet copy](v4, "copy");

    qword_1ECD0A1E0 = (uint64_t)(id)objc_msgSend((id)_MergedGlobals_121, "invertedSet");
  }
  v5 = -[NSString length](self, "length");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", qword_1ECD0A1E0, 0, v7, v6 - v7);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v9 = v8;
      v10 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", _MergedGlobals_121, 0, v8, v6 - v8);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v11 = v6;
      else
        v11 = v10;
      if (v11 > v9)
      {
        if (v7)
          -[NSString appendString:](v3, "appendString:", CFSTR(" "));
        -[NSString appendString:](v3, "appendString:", -[NSString substringWithRange:](self, "substringWithRange:", v9, v11 - v9));
      }
      v7 = v11;
    }
    while (v11 != v6);
  }
  return v3;
}

- (id)_web_filenameByFixingIllegalCharacters
{
  id v2;
  __int16 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = (id)-[NSString mutableCopy](self, "mutableCopy");
  v4 = 0;
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v4, 1), &stru_1E0F56070, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("-"), 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("-"), 0, 0, objc_msgSend(v2, "length"));
  if (objc_msgSend(v2, "hasPrefix:", CFSTR(".")))
  {
    do
      objc_msgSend(v2, "deleteCharactersInRange:", 0, 1);
    while ((objc_msgSend(v2, "hasPrefix:", CFSTR(".")) & 1) != 0);
  }
  return v2;
}

- (unsigned)_web_extractFourCharCode
{
  NSData *v2;
  uint64_t v3;

  v2 = -[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 30);
  v3 = -[NSData length](v2, "length");
  if (v3)
  {
    -[NSData bytes](v2, "bytes");
    __memcpy_chk();
    LODWORD(v3) = bswap32(0);
  }
  return v3;
}

- (id)_web_splitAtNonDateCommas_nowarn
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  -[NSString length](self, "length");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v4 = -[NSString rangeOfString:](self, "rangeOfString:", CFSTR(", "));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v4;
    v7 = 0;
    v5 = 0;
    while (1)
    {
      v8 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR("expires="), 1, v7, v6 - v7);
      v7 = v6 + 1;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = v8;
        v11 = v9;
        v12 = v8 - 1;
        v13 = -[NSString characterAtIndex:](self, "characterAtIndex:", v8 - 1);
        if (v13 > 0x7F)
        {
          if (__maskrune(v13, 0x4000uLL))
            goto LABEL_12;
        }
        else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v13 + 60) & 0x4000) != 0)
        {
          goto LABEL_12;
        }
        if (-[NSString characterAtIndex:](self, "characterAtIndex:", v12) == 59
          || -[NSString characterAtIndex:](self, "characterAtIndex:", v12) == 44)
        {
LABEL_12:
          if (v10 + v11 != v6 && v6 < v10 + v11 + 16)
            goto LABEL_14;
        }
      }
      objc_msgSend(v3, "addObject:", -[NSString substringWithRange:](self, "substringWithRange:", v5, v6 - v5));
      v5 = v6 + 1;
LABEL_14:
      v6 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", CFSTR(", "), 2, v6 + 1, -[NSString length](self, "length") + ~v6);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_15;
    }
  }
  v5 = 0;
LABEL_15:
  objc_msgSend(v3, "addObject:", -[NSString substringWithRange:](self, "substringWithRange:", v5, -[NSString length](self, "length") - v5));
  return v3;
}

- (id)_web_parseAsKeyValuePair_nowarn
{
  return -[NSString _web_parseAsKeyValuePairHandleQuotes_nowarn:](self, "_web_parseAsKeyValuePairHandleQuotes_nowarn:", 0);
}

- (id)_web_parseAsKeyValuePairHandleQuotes_nowarn:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;
  const __CFCharacterSet *Predefined;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v19;
  NSUInteger v20;
  int v21;

  v3 = a3;
  v5 = -[NSString rangeOfString:](self, "rangeOfString:", CFSTR("="));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = -[NSString _web_stringByTrimmingWhitespace](self, "_web_stringByTrimmingWhitespace");
    v7 = 0;
    return +[NSURLKeyValuePair pairWithKey:value:](NSURLKeyValuePair, "pairWithKey:value:", v6, v7);
  }
  v8 = v5;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  if (v8)
  {
    v10 = v8;
    while (1)
    {
      v11 = v10 - 1;
      if (!CFCharacterSetIsCharacterMember(Predefined, -[NSString characterAtIndex:](self, "characterAtIndex:", v10 - 1)))break;
      --v10;
      if (!v11)
        goto LABEL_15;
    }
    if (v10)
    {
      v12 = 0;
      v11 = v10;
      while (CFCharacterSetIsCharacterMember(Predefined, -[NSString characterAtIndex:](self, "characterAtIndex:", v12)))
      {
        ++v12;
        if (!--v11)
          goto LABEL_15;
      }
      v10 = v12;
      goto LABEL_15;
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = 0;
LABEL_15:
  v6 = -[NSString substringWithRange:](self, "substringWithRange:", v10, v11);
  v13 = v8 + 1;
  v14 = -[NSString length](self, "length");
  v15 = v14 - (v8 + 1);
  if (v14 == v8 + 1)
  {
LABEL_19:
    v17 = 0;
  }
  else
  {
    v16 = v14 - 1;
    while (CFCharacterSetIsCharacterMember(Predefined, -[NSString characterAtIndex:](self, "characterAtIndex:", v16)))
    {
      --v16;
      if (!--v15)
        goto LABEL_19;
    }
    v19 = 0;
    v20 = v15 - 2;
    while (1)
    {
      v13 = v8 + v19 + 1;
      if (!CFCharacterSetIsCharacterMember(Predefined, -[NSString characterAtIndex:](self, "characterAtIndex:", v13)))
        break;
      ++v19;
      --v20;
      if (v15 == v19)
      {
        v17 = 0;
        v13 = v8 + v19 + 1;
        goto LABEL_20;
      }
    }
    v17 = v15 - v19;
    if (v15 - v19 >= 2 && v3)
    {
      v21 = -[NSString characterAtIndex:](self, "characterAtIndex:", v8 + v19 + 1);
      if (v21 == 34)
        v13 = v8 + v19 + 2;
      else
        v13 = v8 + v19 + 1;
      if (v21 == 34)
        v17 = v20;
    }
  }
LABEL_20:
  v7 = -[NSString substringWithRange:](self, "substringWithRange:", v13, v17);
  return +[NSURLKeyValuePair pairWithKey:value:](NSURLKeyValuePair, "pairWithKey:value:", v6, v7);
}

- (_NSRange)_web_rangeOfURLScheme_nowarn
{
  uint64_t v3;
  BOOL v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  _NSRange result;

  v3 = -[NSString rangeOfString:](self, "rangeOfString:", CFSTR(":"));
  if (v3)
    v4 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 1;
  if (v4)
    goto LABEL_6;
  v5 = v3;
  if (!_web_rangeOfURLScheme_nowarn_InverseSchemeCharacterSet)
    _web_rangeOfURLScheme_nowarn_InverseSchemeCharacterSet = -[NSCharacterSet invertedSet](+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+.-")), "invertedSet");
  v8 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:");
  v6 = 0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    v5 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)_web_rangeOfURLResourceSpecifier_nowarn
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSString _web_rangeOfURLScheme_nowarn](self, "_web_rangeOfURLScheme_nowarn") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v4 = v3 + 1;
    v5 = -[NSString length](self, "length") - (v3 + 1);
  }
  v6 = v4;
  result.length = v5;
  result.location = v6;
  return result;
}

- (id)_web_mimeTypeFromContentTypeHeader_nowarn
{
  NSArray *v2;
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = -[NSString componentsSeparatedByString:](self, "componentsSeparatedByString:", CFSTR(","));
  v3 = -[NSArray count](v2, "count");
  if (!v3)
    return 0;
  if (v3 == 1)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v2, "objectAtIndex:", 0), "componentsSeparatedByString:", CFSTR(";")),
                             "objectAtIndex:",
                             0),
                       "_web_stringByTrimmingWhitespace"),
                 "lowercaseString");
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v2);
        objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(";")),
                        "objectAtIndex:",
                        0),
                  "_web_stringByTrimmingWhitespace"),
            "lowercaseString"));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v8);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
LABEL_14:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v13)
        objc_enumerationMutation(v6);
      v5 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
      if ((objc_msgSend(v5, "_web_hasCaseInsensitivePrefix:", CFSTR("text/")) & 1) == 0
        && (objc_msgSend(v5, "_web_hasCaseInsensitivePrefix:", CFSTR("application/")) & 1) == 0
        && objc_msgSend(v5, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        break;
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        if (v12)
          goto LABEL_14;
        goto LABEL_24;
      }
    }
    if (v5)
      goto LABEL_25;
  }
LABEL_24:
  v5 = (void *)objc_msgSend(v6, "objectAtIndex:", 0);
LABEL_25:

  return v5;
}

- (id)_web_characterSetFromContentTypeHeader_nowarn
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("charset="), 1);
  if (v4)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](-[NSString substringFromIndex:](self, "substringFromIndex:", v3 + v4), "componentsSeparatedByString:", CFSTR(",")), "objectAtIndex:", 0), "componentsSeparatedByString:", CFSTR(";")),
                             "objectAtIndex:",
                             0),
                       "_web_stringByTrimmingWhitespace"),
                 "lowercaseString");
  else
    return 0;
}

- (id)_web_fileNameFromContentDispositionHeader_nowarn
{
  NSArray *v2;
  id result;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[NSString componentsSeparatedByString:](self, "componentsSeparatedByString:", CFSTR(";"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6), "_web_parseAsKeyValuePairHandleQuotes_nowarn:", 1);
        if (objc_msgSend((id)objc_msgSend(v7, "key"), "_web_isCaseInsensitiveEqualToString:", CFSTR("filename")))return (id)objc_msgSend(v7, "value");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (id)_web_stringByReplacingValidPercentEscapes_nowarn
{
  NSData *v3;
  unsigned __int8 *v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  int v9;
  BOOL v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  BOOL v13;
  unsigned __int8 v14;
  char v15;
  unsigned int v16;
  BOOL v17;
  unsigned __int8 v18;
  unsigned int v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  char v23;
  char v24;
  char v25;
  char v26;
  NSString *v27;

  v3 = -[NSString dataUsingEncoding:](self, "dataUsingEncoding:", 4);
  v4 = -[NSData bytes](v3, "bytes");
  v5 = malloc_type_malloc(-[NSData length](v3, "length"), 0xB2EAAAA7uLL);
  v6 = -[NSData length](v3, "length");
  v7 = v5;
  if (v6)
  {
    v8 = (unint64_t)&v4[v6];
    v7 = v5;
    do
    {
      v9 = *v4;
      v10 = v9 != 37 || (unint64_t)(v4 + 3) > v8;
      if (v10
        || (v11 = v4[1], v12 = v11 - 48, (v11 - 48) >= 0xAu)
        && (v4[1] - 65 <= 0x25 ? (v13 = ((1 << (v11 - 65)) & 0x3F0000003FLL) == 0) : (v13 = 1), v13)
        || (v14 = v4[2], v15 = v14 - 48, v16 = (v14 - 48), v16 >= 0xA)
        && (v4[2] - 65 <= 0x25 ? (v17 = ((1 << (v14 - 65)) & 0x3F0000003FLL) == 0) : (v17 = 1), v17))
      {
        ++v4;
      }
      else
      {
        v18 = v14 - 65;
        v19 = (v11 - 65);
        if ((v11 - 97) >= 6u)
          v20 = 0;
        else
          v20 = v11 - 87;
        v21 = v11 - 55;
        if (v19 <= 5)
          v22 = v21;
        else
          v22 = v20;
        if (v12 < 0xAu)
          v22 = v12;
        v23 = 16 * v22;
        if ((v14 - 97) >= 6u)
          v24 = 0;
        else
          v24 = v14 - 87;
        v25 = v14 - 55;
        if (v18 <= 5u)
          v26 = v25;
        else
          v26 = v24;
        if (v16 < 0xA)
          v26 = v15;
        LOBYTE(v9) = v26 | v23;
        v4 += 3;
      }
      *v7++ = v9;
    }
    while (v4 != (unsigned __int8 *)v8);
  }
  v27 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v5, v7 - v5, 4);
  free(v5);
  if (v27)
    return v27;
  else
    return self;
}

- (BOOL)_web_isJavaScriptURL
{
  return -[NSString rangeOfString:options:](self, "rangeOfString:options:", CFSTR("javascript:"), 9) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)standardizedURLPath
{
  NSArray *v3;
  const __CFString *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;

  v3 = -[NSString pathComponents](self, "pathComponents");
  if (!-[NSArray count](v3, "count") || !-[NSString length](self, "length"))
    return &stru_1E0F56070;
  if (-[NSArray count](v3, "count") != 1
    || (v4 = CFSTR("/"),
        (objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "isEqualToString:", CFSTR("/")) & 1) == 0))
  {
    v5 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0);
    if ((objc_msgSend(v5, "isEqual:", CFSTR("/")) & 1) != 0 || objc_msgSend(v5, "isEqual:", CFSTR("\\")))
    {
      v6 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", 0, &stru_1E0F56070);
      v7 = 1;
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    if (-[NSString characterAtIndex:](self, "characterAtIndex:", -[NSString length](self, "length") - 1) == 47)
    {
      if (!v6)
        v6 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);
      objc_msgSend(v6, "addObject:", &stru_1E0F56070);
    }
    v8 = -[NSArray count](v3, "count");
    if (v7 >= v8)
    {
LABEL_22:
      v4 = (const __CFString *)self;
      if (!v6)
        return (id)v4;
      if (objc_msgSend(v6, "count"))
      {
        if (objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "isEqual:", &stru_1E0F56070))
        {
          objc_msgSend(v6, "removeObjectAtIndex:", 0);
          if (objc_msgSend((id)objc_msgSend(v6, "lastObject"), "isEqual:", &stru_1E0F56070))
          {
            objc_msgSend(v6, "removeLastObject");
            v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@/"), objc_msgSend(v6, "componentsJoinedByString:", CFSTR("/")));
          }
          else
          {
            v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), objc_msgSend(v6, "componentsJoinedByString:", CFSTR("/")));
          }
        }
        else if (objc_msgSend((id)objc_msgSend(v6, "lastObject"), "isEqual:", &stru_1E0F56070))
        {
          objc_msgSend(v6, "removeLastObject");
          v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/"), objc_msgSend(v6, "componentsJoinedByString:", CFSTR("/")));
        }
        else
        {
          v13 = (NSString *)objc_msgSend(v6, "componentsJoinedByString:", CFSTR("/"));
        }
        v4 = (const __CFString *)v13;
      }
      else
      {
        v4 = &stru_1E0F56070;
      }
    }
    else
    {
      v9 = v8;
      while (1)
      {
        v10 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", v7);
        v11 = objc_msgSend(v10, "stringByAddingPercentEscapes");
        if (!v11)
          break;
        v12 = v11;
        if ((id)v11 != v10)
        {
          if (!v6)
            v6 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);
          objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v7, v12);
        }
        if (v9 == ++v7)
          goto LABEL_22;
      }
      v4 = 0;
      if (!v6)
        return (id)v4;
    }

  }
  return (id)v4;
}

- (id)stringByRemovingPercentEscapes
{
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes(0, (CFStringRef)self, &stru_1E0F56070);
}

- (id)stringByAddingPercentEscapes
{
  return (id)(id)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)self, 0, 0, 0x8000100u);
}

- (id)_web_HTTPStyleLanguageCodeWithoutRegion
{
  if (-[NSString length](self, "length") >= 3 && -[NSString characterAtIndex:](self, "characterAtIndex:", 2) == 45)
    return -[NSString substringToIndex:](self, "substringToIndex:", 2);
  else
    return 0;
}

- (NSArray)linguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length;
  NSUInteger location;
  NSLinguisticTagger *v14;
  NSLinguisticTagger *v15;

  length = range.length;
  location = range.location;
  v14 = [NSLinguisticTagger alloc];
  v15 = -[NSLinguisticTagger initWithTagSchemes:options:](v14, "initWithTagSchemes:options:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", scheme), options);
  -[NSLinguisticTagger setString:](v15, "setString:", self);
  if (orthography)
    -[NSLinguisticTagger setOrthography:range:](v15, "setOrthography:range:", orthography, 0, -[NSString length](self, "length"));
  return -[NSLinguisticTagger tagsInRange:scheme:options:tokenRanges:](v15, "tagsInRange:scheme:options:tokenRanges:", location, length, scheme, options, tokenRanges);
}

- (void)enumerateLinguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block
{
  NSUInteger length;
  NSUInteger location;
  NSLinguisticTagger *v14;
  NSLinguisticTagger *v15;

  length = range.length;
  location = range.location;
  v14 = [NSLinguisticTagger alloc];
  v15 = -[NSLinguisticTagger initWithTagSchemes:options:](v14, "initWithTagSchemes:options:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", scheme), options);
  -[NSLinguisticTagger setString:](v15, "setString:", self);
  if (orthography)
    -[NSLinguisticTagger setOrthography:range:](v15, "setOrthography:range:", orthography, 0, -[NSString length](self, "length"));
  -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:](v15, "enumerateTagsInRange:scheme:options:usingBlock:", location, length, scheme, options, block);

}

- (id)_stringByReplacingOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v12;
  NSString *v13;
  NSRegularExpression *v14;
  NSRegularExpression *v15;
  NSString *v16;

  length = a6.length;
  location = a6.location;
  v12 = a5 & 1;
  if (_MergedGlobals_144 != -1)
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lx:%@"), v12, a3);
  v14 = (NSRegularExpression *)(id)objc_msgSend((id)qword_1ECD0A628, "objectForKey:", v13);
  if (v14)
    goto LABEL_6;
  v15 = -[NSRegularExpression initWithPattern:options:error:]([NSRegularExpression alloc], "initWithPattern:options:error:", a3, v12, 0);
  if (v15)
  {
    v14 = v15;
    objc_msgSend((id)qword_1ECD0A628, "setObject:forKey:", v15, v13);
LABEL_6:
    v16 = -[NSRegularExpression stringByReplacingMatchesInString:options:range:withTemplate:](v14, "stringByReplacingMatchesInString:options:range:withTemplate:", self, (a5 >> 1) & 4, location, length, a4);

    return v16;
  }
  return self;
}

- (void)_flushRegularExpressionCaches
{
  objc_msgSend((id)qword_1ECD0A628, "removeAllObjects");
}

- (_NSRange)significantText
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  int v6;
  NSUInteger v7;
  NSUInteger v8;
  _WORD v9[1025];
  uint64_t v10;
  _NSRange result;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString length](self, "length");
  if (v3 <= 0x400)
  {
    -[NSString getCharacters:](self, "getCharacters:", v9);
    v5 = 0;
    if (v3)
    {
      while (1)
      {
        v6 = (unsigned __int16)v9[v5];
        if ((v6 - 48) > 9)
          break;
        if (v3 == ++v5)
        {
          v5 = v3;
          break;
        }
      }
    }
    else
    {
      v6 = 0;
    }
    if (v6 == 95)
      v7 = v5 + 1;
    else
      v7 = v5;
    if (v5 >= v3 - 1)
    {
      v4 = 0;
    }
    else
    {
      v3 -= v7;
      v4 = v7;
    }
  }
  else
  {
    v4 = 0;
  }
  v8 = v3;
  result.length = v8;
  result.location = v4;
  return result;
}

- (void)__graphemeCount
{
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  v9 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    v2 = objc_msgSend(a1, "length");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__NSString_NSPersonNameComponentsFormatter____graphemeCount__block_invoke;
    v4[3] = &unk_1E0F517D8;
    v4[4] = &v5;
    objc_msgSend(v1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v4);
    v1 = (void *)v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __60__NSString_NSPersonNameComponentsFormatter____graphemeCount__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
