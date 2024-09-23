@implementation __NSCFString

- (id)copyWithZone:(_NSZone *)a3
{
  return _CFNonObjCStringCreateCopy(0, (uint64_t)self);
}

- (BOOL)isEqualToString:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t i;
  unint64_t Length2;
  __objc2_class *v12;

  if (self == a3)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  if (!a3)
    goto LABEL_27;
  if (((unint64_t)a3 & 0x8000000000000000) == 0)
  {
    if (*(__objc2_class **)a3 == __CFConstantStringClassReferencePtr || *(Class *)a3 == self->super.super.isa)
    {
LABEL_13:
      LOBYTE(v9) = _CFStringEqual((CFStringRef)self, (CFStringRef)a3) != 0;
      return v9;
    }
    v9 = objc_msgSend(a3, "isNSString");
    if (!v9)
      return v9;
    Length2 = _CFStringGetLength2((unint64_t *)self);
    if (Length2 == objc_msgSend(a3, "length"))
    {
      v12 = (__objc2_class *)objc_opt_class();
      if (v12 != __NSCFString && class_getSuperclass((Class)v12) != (Class)__NSCFString)
      {
LABEL_21:
        LOBYTE(v9) = objc_msgSend(a3, "isEqualToString:", self);
        return v9;
      }
      goto LABEL_13;
    }
LABEL_27:
    LOBYTE(v9) = 0;
    return v9;
  }
  v5 = 0;
  v6 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)a3 & 0xC000000000000007) == 0)
    v6 = 0;
  v7 = v6 ^ (unint64_t)a3;
  v8 = v7 & 7;
  while (v8 != *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + v5))
  {
    if (++v5 == 7)
      goto LABEL_16;
  }
  if (v5 == 2)
  {
    LOBYTE(v9) = _NSTaggedPointerStringEqualCFString(a3, self);
    return v9;
  }
LABEL_16:
  for (i = 0; i != 7; ++i)
  {
    if (v8 == *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + i))
      break;
  }
  LOBYTE(v9) = 0;
  if ((~(_BYTE)i & 7) == 0 && ((i | v7) & 0x7F80000000000000) == 0x700000000000000)
    goto LABEL_21;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t i;
  unint64_t Length2;
  __objc2_class *v12;

  if (self == a3)
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  if (!a3)
    goto LABEL_27;
  if (((unint64_t)a3 & 0x8000000000000000) == 0)
  {
    if (*(__objc2_class **)a3 == __CFConstantStringClassReferencePtr || *(Class *)a3 == self->super.super.isa)
    {
LABEL_13:
      LOBYTE(v9) = _CFStringEqual((CFStringRef)self, (CFStringRef)a3) != 0;
      return v9;
    }
    v9 = objc_msgSend(a3, "isNSString");
    if (!v9)
      return v9;
    Length2 = _CFStringGetLength2((unint64_t *)self);
    if (Length2 == objc_msgSend(a3, "length"))
    {
      v12 = (__objc2_class *)objc_opt_class();
      if (v12 != __NSCFString && class_getSuperclass((Class)v12) != (Class)__NSCFString)
      {
LABEL_21:
        LOBYTE(v9) = objc_msgSend(a3, "isEqualToString:", self);
        return v9;
      }
      goto LABEL_13;
    }
LABEL_27:
    LOBYTE(v9) = 0;
    return v9;
  }
  v5 = 0;
  v6 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)a3 & 0xC000000000000007) == 0)
    v6 = 0;
  v7 = v6 ^ (unint64_t)a3;
  v8 = v7 & 7;
  while (v8 != *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + v5))
  {
    if (++v5 == 7)
      goto LABEL_16;
  }
  if (v5 == 2)
  {
    LOBYTE(v9) = _NSTaggedPointerStringEqualCFString(a3, self);
    return v9;
  }
LABEL_16:
  for (i = 0; i != 7; ++i)
  {
    if (v8 == *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + i))
      break;
  }
  LOBYTE(v9) = 0;
  if ((~(_BYTE)i & 7) == 0 && ((i | v7) & 0x7F80000000000000) == 0x700000000000000)
    goto LABEL_21;
  return v9;
}

- (BOOL)isNSString__
{
  return 1;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  if (_CFStringCheckAndGetCharacters((uint64_t)self, a4.location, a4.length, a3))
    -[__NSCFString getCharacters:range:].cold.1((objc_class *)self, a2);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unsigned __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  if (_CFStringCheckAndGetCharacterAtIndex((uint64_t)self, a3, &v6))
    -[__NSCFString characterAtIndex:].cold.1((objc_class *)self, a2);
  return v6;
}

- (BOOL)hasPrefix:(id)a3
{
  if (!a3)
    -[__NSCFString hasPrefix:].cold.1((objc_class *)self, a2);
  return CFStringHasPrefix((CFStringRef)self, (CFStringRef)a3) != 0;
}

- (BOOL)hasSuffix:(id)a3
{
  if (!a3)
    -[__NSCFString hasSuffix:].cold.1((objc_class *)self, a2);
  return CFStringHasSuffix((CFStringRef)self, (CFStringRef)a3) != 0;
}

- (const)_fastCStringContents:(BOOL)a3
{
  _BOOL4 v3;
  CFStringEncoding SystemEncoding;

  v3 = a3;
  SystemEncoding = enc;
  if (enc == -1)
  {
    SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }
  return (const char *)_CFNonObjCStringGetCStringPtr((uint64_t)self, SystemEncoding, v3);
}

- (void)appendString:(id)a3
{
  unint64_t Length2;
  int v7;

  Length2 = _CFStringGetLength2((unint64_t *)self);
  v7 = __CFStringCheckAndReplace((__CFString *)self, Length2, 0, (__CFString *)a3);
  if (v7)
    mutateError(a2, v7, self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return CFStringCreateMutableCopy(0, 0, (CFStringRef)self);
}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  if (!__CFStringMtbl((uint64_t)self))
    -[__NSCFString appendCharacters:length:].cold.1(a2);
  CFStringAppendCharacters((CFMutableStringRef)self, a3, a4);
}

- (unint64_t)replaceOccurrencesOfString:(id)a3 withString:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  unint64_t Length2;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  const char *v24;
  objc_super v25;
  uint64_t v26;
  CFRange v27;

  length = a6.length;
  location = a6.location;
  v26 = *MEMORY[0x1E0C80C00];
  if (!__CFStringMtbl((uint64_t)self))
    -[__NSCFString replaceOccurrencesOfString:withString:options:range:].cold.1(a2);
  Length2 = _CFStringGetLength2((unint64_t *)self);
  if (!a3 || !a4)
    -[__NSCFString replaceOccurrencesOfString:withString:options:range:].cold.2((objc_class *)self, a2);
  v14 = Length2;
  if (location + length > Length2)
  {
    v23 = __CFExceptionProem((objc_class *)self, a2);
    v24 = "";
    if (length == 64)
      v24 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu%s"),
      v23,
      location,
      length,
      v14,
      v24);
  }
  if ((Length2 < length || location > Length2 - length)
    && (replaceOccurrencesOfString_withString_options_range__warnonce & 1) == 0)
  {
    replaceOccurrencesOfString_withString_options_range__warnonce = 1;
    v15 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(4, (uint64_t)CFSTR("*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution."),
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v15);
  }
  if ((a5 & 0x400) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)__NSCFString;
    return -[__NSCFString replaceOccurrencesOfString:withString:options:range:](&v25, sel_replaceOccurrencesOfString_withString_options_range_, a3, a4, a5, location, length);
  }
  else
  {
    v27.location = location;
    v27.length = length;
    return CFStringFindAndReplace((CFMutableStringRef)self, (CFStringRef)a3, (CFStringRef)a4, v27, ~(8 * (_BYTE)a5) & 0x10 | a5);
  }
}

- (void)appendFormat:(id)a3
{
  __int16 v6;

  if (!__CFStringMtbl((uint64_t)self))
    -[__NSCFString appendFormat:].cold.1(a2);
  _CFStringAppendFormatAndArgumentsAux2((uint64_t)self, (uint64_t)_DescriptionWithLocaleFunc, (uint64_t)_DescriptionWithStringProxyFunc, 0, 0, (uint64_t)a3, &v6);
}

- (Class)classForCoder
{
  if (__CFStringMtbl((uint64_t)self))
    return objc_lookUpClass("NSMutableString");
  else
    return objc_lookUpClass("NSString");
}

- (const)cStringUsingEncoding:(unint64_t)a3
{
  const char *result;
  CFStringEncoding v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (__CFStringMtbl((uint64_t)self))
    goto LABEL_2;
  v6 = CFStringConvertNSStringEncodingToEncoding(a3);
  if (v6 == -1)
  {
    if (a3 != 134217984 && a3)
      return 0;
    if (_CFExecutableLinkedOnOrAfter(6uLL))
      CFLog(4, (uint64_t)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSStringEncodingASCII. Will stop this compatibility mapping behavior in the near future."), v7, v8, v9, v10, v11, v12, a3);
    v6 = 1536;
  }
  result = (const char *)_CFNonObjCStringGetCStringPtr((uint64_t)self, v6, 1);
  if (!result)
  {
LABEL_2:
    v13.receiver = self;
    v13.super_class = (Class)__NSCFString;
    return -[__NSCFString cStringUsingEncoding:](&v13, sel_cStringUsingEncoding_, a3);
  }
  return result;
}

- (const)UTF8String
{
  const char *result;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (__CFStringMtbl((uint64_t)self)
    || (result = (const char *)_CFNonObjCStringGetCStringPtr((uint64_t)self, 0x8000100u, 1)) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)__NSCFString;
    return -[__NSCFString UTF8String](&v4, sel_UTF8String);
  }
  return result;
}

- (BOOL)getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unint64_t)a5
{
  CFStringEncoding v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = CFStringConvertNSStringEncodingToEncoding(a5);
  if (v9 != -1)
    return CFStringGetCString((CFStringRef)self, a3, a4, v9) != 0;
  if (a5 == 134217984 || !a5)
  {
    if (_CFExecutableLinkedOnOrAfter(6uLL))
      CFLog(4, (uint64_t)CFSTR("Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSStringEncodingASCII. Will stop this compatibility mapping behavior in the near future."), v10, v11, v12, v13, v14, v15, a5);
    v9 = 1536;
    return CFStringGetCString((CFStringRef)self, a3, a4, v9) != 0;
  }
  return 0;
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t Length2;
  unint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  const char *v18;
  CFRange v19;

  length = a3.length;
  location = a3.location;
  Length2 = _CFStringGetLength2((unint64_t *)self);
  v8 = Length2;
  if (location + length > Length2)
  {
    v17 = __CFExceptionProem((objc_class *)self, a2);
    v18 = "";
    if (length == 64)
      v18 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu%s"),
      v17,
      location,
      length,
      v8,
      v18);
  }
  if ((Length2 < length || location > Length2 - length) && (substringWithRange__warnonce & 1) == 0)
  {
    substringWithRange__warnonce = 1;
    v9 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(4, (uint64_t)CFSTR("*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution."),
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      v9);
  }
  v19.location = location;
  v19.length = length;
  return (id)(id)CFStringCreateWithSubstring(0, (CFStringRef)self, v19);
}

- (id)copy
{
  return _CFNonObjCStringCreateCopy(0, (uint64_t)self);
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  int v6;

  v6 = __CFStringCheckAndReplace((__CFString *)self, a3.location, a3.length, (__CFString *)a4);
  if (v6)
    mutateError(a2, v6, self);
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t Length2;
  unint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  const char *v19;
  CFRange v20;

  length = a3.length;
  location = a3.location;
  Length2 = _CFStringGetLength2((unint64_t *)self);
  v9 = Length2;
  if (location + length > Length2)
  {
    v18 = __CFExceptionProem((objc_class *)self, a2);
    v19 = "";
    if (length == 64)
      v19 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu%s"),
      v18,
      location,
      length,
      v9,
      v19);
  }
  if ((Length2 < length || location > Length2 - length) && (_newSubstringWithRange_zone__warnonce & 1) == 0)
  {
    _newSubstringWithRange_zone__warnonce = 1;
    v10 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(4, (uint64_t)CFSTR("*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution."),
      v11,
      v12,
      v13,
      v14,
      v15,
      v16,
      v10);
  }
  v20.location = location;
  v20.length = length;
  return (id)CFStringCreateWithSubstring(0, (CFStringRef)self, v20);
}

- (unint64_t)fastestEncoding
{
  CFStringEncoding FastestEncoding;

  FastestEncoding = CFStringGetFastestEncoding((CFStringRef)self);
  return CFStringConvertEncodingToNSStringEncoding(FastestEncoding);
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  int v6;

  v6 = __CFStringCheckAndReplace((__CFString *)self, a4, 0, (__CFString *)a3);
  if (v6)
    mutateError(a2, v6, self);
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  int v5;

  v5 = __CFStringCheckAndReplace((__CFString *)self, a3.location, a3.length, &stru_1E1337B18);
  if (v5)
    mutateError(a2, v5, self);
}

- (BOOL)_isCString
{
  return __CFStringIsEightBit((uint64_t)self);
}

- (void)setString:(id)a3
{
  unint64_t Length2;
  int v7;

  Length2 = _CFStringGetLength2((unint64_t *)self);
  v7 = __CFStringCheckAndReplace((__CFString *)self, 0, Length2, (__CFString *)a3);
  if (v7)
    mutateError(a2, v7, self);
}

- (void)getLineStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  unint64_t Length2;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  CFRange v24;

  length = a6.length;
  location = a6.location;
  Length2 = _CFStringGetLength2((unint64_t *)self);
  v14 = Length2;
  if (location + length > Length2)
  {
    v22 = __CFExceptionProem((objc_class *)self, a2);
    v23 = "";
    if (length == 64)
      v23 = " (Note that the indicated range may be smaller than the original range passed to the API)";
    _CFThrowFormattedException((uint64_t)CFSTR("NSInvalidArgumentException"), CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu%s"),
      v22,
      location,
      length,
      v14,
      v23);
  }
  if ((Length2 < length || location > Length2 - length) && (getLineStart_end_contentsEnd_forRange__warnonce & 1) == 0)
  {
    getLineStart_end_contentsEnd_forRange__warnonce = 1;
    v15 = __CFExceptionProem((objc_class *)self, a2);
    CFLog(4, (uint64_t)CFSTR("*** %@: Range {%lu, %lu} out of bounds; string length %lu. This will become an exception for apps linked after 10.10 and iOS 8. Warning shown once per app execution."),
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v15);
  }
  v24.location = location;
  v24.length = length;
  CFStringGetLineBounds((CFStringRef)self, v24, (CFIndex *)a3, (CFIndex *)a4, (CFIndex *)a5);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (const)cString
{
  const char *result;
  CFStringEncoding SystemEncoding;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__CFStringMtbl((uint64_t)self))
    goto LABEL_2;
  SystemEncoding = enc;
  if (enc == -1)
  {
    SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }
  result = (const char *)_CFNonObjCStringGetCStringPtr((uint64_t)self, SystemEncoding, 1);
  if (!result)
  {
LABEL_2:
    v5.receiver = self;
    v5.super_class = (Class)__NSCFString;
    return -[__NSCFString cString](&v5, sel_cString);
  }
  return result;
}

- (unint64_t)cStringLength
{
  CFStringEncoding SystemEncoding;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SystemEncoding = enc;
  if (enc == -1)
  {
    SystemEncoding = CFStringGetSystemEncoding();
    enc = SystemEncoding;
  }
  if (_CFNonObjCStringGetCStringPtr((uint64_t)self, SystemEncoding, 0))
    return _CFStringGetLength2((unint64_t *)self);
  v5.receiver = self;
  v5.super_class = (Class)__NSCFString;
  return -[__NSCFString cStringLength](&v5, sel_cStringLength);
}

- (unint64_t)smallestEncoding
{
  CFStringEncoding SmallestEncoding;

  SmallestEncoding = CFStringGetSmallestEncoding((CFStringRef)self);
  return CFStringConvertEncodingToNSStringEncoding(SmallestEncoding);
}

- (void)characterAtIndex:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_8(v2, CFSTR("%@: Range or index out of bounds"));
}

- (void)getCharacters:(objc_class *)a1 range:(const char *)a2 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_8(v2, CFSTR("%@: Range or index out of bounds"));
}

- (void)hasPrefix:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_8(v2, CFSTR("%@: nil argument"));
}

- (void)hasSuffix:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_8(v2, CFSTR("%@: nil argument"));
}

- (void)appendFormat:(const char *)a1 .cold.1(const char *a1)
{
  const char *Name;

  Name = sel_getName(a1);
  OUTLINED_FUNCTION_0_8((uint64_t)Name, CFSTR("Attempt to mutate immutable object with %s"));
}

- (void)appendCharacters:(const char *)a1 length:.cold.1(const char *a1)
{
  const char *Name;

  Name = sel_getName(a1);
  OUTLINED_FUNCTION_0_8((uint64_t)Name, CFSTR("Attempt to mutate immutable object with %s"));
}

- (void)replaceOccurrencesOfString:(const char *)a1 withString:options:range:.cold.1(const char *a1)
{
  const char *Name;

  Name = sel_getName(a1);
  OUTLINED_FUNCTION_0_8((uint64_t)Name, CFSTR("Attempt to mutate immutable object with %s"));
}

- (void)replaceOccurrencesOfString:(objc_class *)a1 withString:(const char *)a2 options:range:.cold.2(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_8(v2, CFSTR("%@: nil argument"));
}

@end
