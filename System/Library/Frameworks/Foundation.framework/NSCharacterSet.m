@implementation NSCharacterSet

+ (NSCharacterSet)whitespaceAndNewlineCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 16);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 16);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 16);
  }
  return result;
}

+ (NSCharacterSet)whitespaceCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 8);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetWhitespace), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 8);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 8);
  }
  return result;
}

+ (NSCharacterSet)characterSetWithCharactersInString:(NSString *)aString
{
  return (NSCharacterSet *)CFCharacterSetCreateWithCharactersInString(0, (CFStringRef)aString);
}

+ (NSCharacterSet)decimalDigitCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 24);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 24);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 24);
  }
  return result;
}

+ (NSCharacterSet)alphanumericCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 72);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 72);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 72);
  }
  return result;
}

+ (void)initialize
{
  if (NSCharacterSet == a1 && !_CFExecutableLinkedOnOrAfter())
    __NSBuiltinSetTable = (uint64_t)malloc_type_calloc(0xFuLL, 8uLL, 0x80040B8603338uLL);
}

+ (NSCharacterSet)letterCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetLetter);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 32);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetLetter), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 32);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 32);
  }
  return result;
}

+ (NSCharacterSet)controlCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetControl);
  result = *(NSCharacterSet **)__NSBuiltinSetTable;
  if (!*(_QWORD *)__NSBuiltinSetTable)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetControl), 2);
    v3 = (unint64_t *)__NSBuiltinSetTable;
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)__NSBuiltinSetTable;
  }
  return result;
}

+ (NSCharacterSet)newlineCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 112);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetNewline), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 112);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 112);
  }
  return result;
}

+ (NSCharacterSet)characterSetWithRange:(NSRange)aRange
{
  return (NSCharacterSet *)CFCharacterSetCreateWithCharactersInRange(0, (CFRange)aRange);
}

+ (NSCharacterSet)uppercaseLetterCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 48);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 48);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 48);
  }
  return result;
}

+ (NSCharacterSet)punctuationCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 80);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetPunctuation), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 80);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 80);
  }
  return result;
}

+ (NSCharacterSet)illegalCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetIllegal);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 88);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetIllegal), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 88);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 88);
  }
  return result;
}

+ (NSCharacterSet)nonBaseCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 56);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetNonBase), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 56);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 56);
  }
  return result;
}

- (__CFCharacterSet)_expandedCFCharacterSet
{
  return 0;
}

+ (NSCharacterSet)lowercaseLetterCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 40);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 40);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 40);
  }
  return result;
}

+ (NSCharacterSet)decomposableCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetDecomposable);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 64);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetDecomposable), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 64);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 64);
  }
  return result;
}

+ (NSCharacterSet)capitalizedLetterCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetCapitalizedLetter);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 96);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetCapitalizedLetter), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 96);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 96);
  }
  return result;
}

+ (NSCharacterSet)symbolCharacterSet
{
  NSCharacterSet *result;
  unint64_t *v3;

  if (!__NSBuiltinSetTable)
    return (NSCharacterSet *)CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  result = *(NSCharacterSet **)(__NSBuiltinSetTable + 104);
  if (!result)
  {
    result = (NSCharacterSet *)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", CFCharacterSetGetPredefined(kCFCharacterSetSymbol), 2);
    v3 = (unint64_t *)(__NSBuiltinSetTable + 104);
    while (!__ldaxr(v3))
    {
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();

    return *(NSCharacterSet **)(__NSBuiltinSetTable + 104);
  }
  return result;
}

+ (NSCharacterSet)characterSetWithContentsOfFile:(NSString *)fName
{
  NSCharacterSet *result;

  result = (NSCharacterSet *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", fName, 1, 0);
  if (result)
    return (NSCharacterSet *)CFCharacterSetCreateWithBitmapRepresentation(0, (CFDataRef)result);
  return result;
}

+ (NSCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data
{
  return (NSCharacterSet *)CFCharacterSetCreateWithBitmapRepresentation(0, (CFDataRef)data);
}

- (NSCharacterSet)init
{
  NSCharacterSet *v3;
  CFRange v5;

  if (!-[NSCharacterSet isMemberOfClass:](self, "isMemberOfClass:", NSCharacterSet))
    return self;
  v5.location = 0;
  v5.length = 0;
  v3 = (NSCharacterSet *)CFCharacterSetCreateWithCharactersInRange(0, v5);

  return v3;
}

- (unint64_t)hash
{
  return -[NSData hash](-[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation"), "hash");
}

- (NSCharacterSet)invertedSet
{
  return (NSCharacterSet *)(id)objc_msgSend(objc_allocWithZone((Class)_NSPlaceholderCharacterSet), "initWithSet:options:", self, 1);
}

- (BOOL)isEmpty
{
  NSData *v2;
  NSData *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v2 = -[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
  if (!v2)
    return 1;
  v3 = v2;
  v4 = -[NSData bytes](v2, "bytes");
  v5 = -[NSData length](v3, "length");
  if (v5 < 1)
    return 1;
  if (*v4)
    return 0;
  v7 = 1;
  do
  {
    v8 = v7;
    if (v5 == v7)
      break;
    ++v7;
  }
  while (!v4[v8]);
  return v8 >= v5;
}

- (unint64_t)count
{
  _BYTE *v2;
  int8x8_t v3;
  unint64_t v4;
  uint64_t i;
  uint64_t v6;

  v2 = -[NSData bytes](-[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation"), "bytes");
  v4 = 0;
  if (v2)
  {
    for (i = 0; i != 0x2000; ++i)
    {
      if (v2[i])
      {
        v3.i32[0] = v2[i];
        v3 = vcnt_s8(v3);
        v3.i16[0] = vaddlv_u8((uint8x8_t)v3);
        v6 = v3.u32[0];
      }
      else
      {
        v6 = 0;
      }
      v4 += v6;
    }
  }
  return v4;
}

- (BOOL)isMutable
{
  return 0;
}

- (BOOL)characterIsMember:(unichar)aCharacter
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)longCharacterIsMember:(UTF32Char)theLongChar
{
  return -[NSCharacterSet characterIsMember:](self, "characterIsMember:", (unsigned __int16)theLongChar);
}

- (BOOL)isSupersetOfSet:(NSCharacterSet *)theOtherSet
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)hasMemberInPlane:(uint8_t)thePlane
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[NSData isEqual:](-[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation"), "isEqual:", objc_msgSend(a3, "bitmapRepresentation"));
  return 0;
}

- (NSData)bitmapRepresentation
{
  void *v3;
  uint64_t v4;
  unsigned __int16 i;

  v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DF0]), "initWithLength:", 0x2000);
  v4 = objc_msgSend(v3, "mutableBytes");
  for (i = 0; i != 0xFFFF; ++i)
  {
    if (-[NSCharacterSet characterIsMember:](self, "characterIsMember:", i))
      *(_BYTE *)(v4 + (i >> 3)) |= 1 << (i & 7);
  }
  return (NSData *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  const char *Name;

  v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog((NSString *)CFSTR("Abstract class %@ does not implement method %s; it must be implemented in subclasses."),
    v5,
    Name);
  -[NSCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *v4;

  v4 = -[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    if (object_getClass(a3) == (Class)NSKeyedArchiver)
      objc_msgSend(a3, "_encodePropertyList:forKey:", v4, CFSTR("NSBitmap"));
    else
      objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("NSBitmapObject"));
  }
}

- (NSCharacterSet)initWithCoder:(NSCoder *)coder
{
  NSInteger v5;
  _BOOL4 v6;
  __objc2_class *Class;
  _BOOL4 v8;
  _BOOL4 v9;
  const __CFCharacterSet *Predefined;
  _BOOL4 v11;
  uint64_t v12;
  CFIndex v13;
  CFIndex v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  const __CFData *v20;
  const __CFString *v21;
  const __CFData *v22;
  CFRange v24;

  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
    goto LABEL_36;
  v5 = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NSBuiltinID"));
  v6 = -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("NSIsInverted"));
  if (!v5)
    v5 = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NSBuiltinID2"));
  Class = (__objc2_class *)object_getClass(coder);
  v8 = -[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSString"));
  v9 = -[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSStringObject"));
  if ((unint64_t)(v5 - 1) <= 0xE)
  {
    Predefined = CFCharacterSetGetPredefined((CFCharacterSetPredefinedSet)v5);
    if (v6 || -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("NSIsInverted2")))
    {
      Predefined = CFCharacterSetCreateMutableCopy(0, Predefined);
      v6 = 1;
      if (!Predefined)
        goto LABEL_20;
    }
    else
    {
      CFRetain(Predefined);
      v6 = 0;
      if (!Predefined)
      {
LABEL_20:

        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99750];
        v17 = CFSTR("CFCharacterSetGetPredefined -- Predefined Character Set not found");
        goto LABEL_39;
      }
    }
    goto LABEL_33;
  }
  v11 = v9;
  if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSRange")))
  {
    v12 = -[NSCoder decodeInt64ForKey:](coder, "decodeInt64ForKey:", CFSTR("NSRange"));
    v13 = v12 >> 32;
    v14 = v12;
    if ((_CFCharacterSetIsValidRange() & 1) != 0)
    {
      v24.location = v13;
      v24.length = v14;
      Predefined = CFCharacterSetCreateWithCharactersInRange(0, v24);
      if (!Predefined)
      {

        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99750];
        v17 = CFSTR("CFCharacterSetCreateWithCharactersInRange -- Character Set creation with characters in range failed");
        goto LABEL_39;
      }
      goto LABEL_33;
    }

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99750];
    v17 = CFSTR("CFCharacterSetCreateWithCharactersInRange -- Character Set creation with characters in range failed: Invalid range");
LABEL_39:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v17, 0));
  }
  if (v8 || v11)
  {
    v18 = Class == NSKeyedUnarchiver || v8;
    if (v18 == 1)
      v19 = (const __CFString *)-[NSCoder _decodePropertyListForKey:](coder, "_decodePropertyListForKey:", CFSTR("NSString"));
    else
      v19 = -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSStringObject"));
    v21 = v19;
    if (v19 && _NSIsNSString())
    {
      Predefined = CFCharacterSetCreateWithCharactersInString(0, v21);
      if (!Predefined)
      {

        v15 = (void *)MEMORY[0x1E0C99DA0];
        v16 = *MEMORY[0x1E0C99750];
        v17 = CFSTR("CFCharacterSetCreateWithCharactersInString -- Character Set creation with characters in string failed");
        goto LABEL_39;
      }
      goto LABEL_33;
    }
    goto LABEL_35;
  }
  if (Class == NSKeyedUnarchiver
    || -[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSBitmap")))
  {
    v20 = (const __CFData *)-[NSCoder _decodePropertyListForKey:](coder, "_decodePropertyListForKey:", CFSTR("NSBitmap"));
  }
  else
  {
    v20 = -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSBitmapObject"));
  }
  v22 = v20;
  if (!v20 || !_NSIsNSData())
  {
LABEL_35:
    -[NSCoder failWithError:](coder, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4865, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Decoder value not found"), CFSTR("NSLocalizedDescription"))));
LABEL_36:
    Predefined = 0;
    goto LABEL_37;
  }
  Predefined = CFCharacterSetCreateWithBitmapRepresentation(0, v22);
  if (!Predefined)
  {

    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99750];
    v17 = CFSTR("CFCharacterSetCreateWithBitmapRepresentation -- Character Set creation with bitmap representation failed");
    goto LABEL_39;
  }
LABEL_33:
  if (v6)
    _CFCharacterSetSetIsInverted();
LABEL_37:

  return (NSCharacterSet *)Predefined;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_retainedBitmapRepresentation
{
  return -[NSCharacterSet bitmapRepresentation](self, "bitmapRepresentation");
}

- (id)replacementObjectForPortCoder:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isByref") && -[NSCharacterSet isMutable](self, "isMutable"))
  {
    v6.receiver = self;
    v6.super_class = (Class)NSCharacterSet;
    return -[NSCharacterSet replacementObjectForPortCoder:](&v6, sel_replacementObjectForPortCoder_, a3);
  }
  return self;
}

@end
