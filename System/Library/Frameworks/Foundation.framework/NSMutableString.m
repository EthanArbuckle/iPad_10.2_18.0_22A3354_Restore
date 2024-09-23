@implementation NSMutableString

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

+ (NSMutableString)allocWithZone:(_NSZone *)a3
{
  if ((id)__NSMutableStringClass == a1)
    return (NSMutableString *)&__mutablePlaceholder;
  else
    return (NSMutableString *)NSAllocateObject((Class)a1, 0, a3);
}

+ (NSMutableString)stringWithCapacity:(NSUInteger)capacity
{
  return (NSMutableString *)-[NSPlaceholderMutableString initWithCapacity:](&__mutablePlaceholder, "initWithCapacity:", capacity);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withCharacters:(const unsigned __int16 *)a4 length:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;

  length = a3.length;
  location = a3.location;
  v8 = (id)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithCharacters:length:", a4, a5);
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", location, length, v8);

}

- (void)appendString:(NSString *)aString
{
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", -[NSString length](self, "length"), 0, aString);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withCString:(const char *)a4 length:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;

  length = a3.length;
  location = a3.location;
  v8 = (id)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithCString:length:", a4, a5);
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", location, length, v8);

}

- (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc
{
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", loc, 0, aString);
}

- (void)appendFormat:(NSString *)format
{
  void *v4;
  va_list va;

  va_start(va, format);
  v4 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:arguments:", format, 0, va);
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", -[NSString length](self, "length"), 0, v4);

}

- (void)appendCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  -[NSMutableString replaceCharactersInRange:withCharacters:length:](self, "replaceCharactersInRange:withCharacters:length:", -[NSString length](self, "length"), 0, a3, a4);
}

- (void)_cfAppendCString:(const char *)a3 length:(int64_t)a4
{
  -[NSMutableString replaceCharactersInRange:withCString:length:](self, "replaceCharactersInRange:withCString:length:", -[NSString length](self, "length"), 0, a3, a4);
}

- (void)_cfLowercase:(const void *)a3
{
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, -[NSString length](self, "length", a3), -[NSString lowercaseString](self, "lowercaseString"));
}

- (void)_cfUppercase:(const void *)a3
{
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, -[NSString length](self, "length", a3), -[NSString uppercaseString](self, "uppercaseString"));
}

- (void)_cfCapitalize:(const void *)a3
{
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, -[NSString length](self, "length", a3), -[NSString capitalizedString](self, "capitalizedString"));
}

- (void)_cfPad:(__CFString *)a3 length:(unsigned int)a4 padIndex:(unsigned int)a5
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex Length;
  _BYTE *v13;
  CFIndex v14;
  CFIndex v15;
  uint64_t v16;
  NSUInteger v17;
  BOOL v18;
  _BYTE v19[1024];
  uint64_t v20;
  CFRange v21;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = -[NSString length](self, "length");
  v10 = a4;
  if (v9 > a4)
  {
    -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", a4, v9 - a4);
    return;
  }
  if (v9 < a4)
  {
    v11 = a4 - v9;
    if ((uint64_t)(v10 - v9) >= 512)
    {
      v13 = malloc_type_malloc(2 * v11, 0x1000040BDFB0063uLL);
      Length = CFStringGetLength(a3);
    }
    else
    {
      Length = CFStringGetLength(a3);
      v13 = v19;
      if (v11 < 1)
      {
LABEL_15:
        -[NSMutableString replaceCharactersInRange:withCharacters:length:](self, "replaceCharactersInRange:withCharacters:length:", -[NSString length](self, "length"), 0, v13, v11);
        if (v13 != v19)
          free(v13);
        return;
      }
    }
    v14 = a5;
    if (v11 >= Length - a5)
      v15 = Length - a5;
    else
      v15 = v11;
    v16 = v11;
    do
    {
      v17 = -[NSString length](self, "length");
      v21.location = v14;
      v21.length = v15;
      CFStringGetCharacters(a3, v21, (UniChar *)&v13[2 * (v10 - v16) + -2 * v17]);
      v16 -= v15;
      v18 = v16 < v15;
      v15 = v16;
      if (!v18)
        v15 = CFStringGetLength(a3);
      v14 = 0;
    }
    while (v16 > 0);
    goto LABEL_15;
  }
}

- (void)_cfTrim:(__CFString *)a3
{
  CFIndex v5;
  CFIndex v6;
  CFIndex v7;
  CFRange result;
  uint64_t v9;
  CFRange v10;
  CFRange v11;
  CFRange v12;

  v9 = *MEMORY[0x1E0C80C00];
  result.location = 0;
  result.length = 0;
  v5 = -[NSString length](self, "length");
  v10.location = 0;
  v10.length = v5;
  if (CFStringFindWithOptions((CFStringRef)self, a3, v10, 8uLL, &result))
  {
    do
    {
      v6 = result.length + result.location;
      v7 = v5 - (result.length + result.location);
      v11.location = result.length + result.location;
      v11.length = v7;
    }
    while (CFStringFindWithOptions((CFStringRef)self, a3, v11, 8uLL, &result));
  }
  else
  {
    v6 = 0;
    v7 = v5;
  }
  if (v6 >= v5)
  {
    v6 = v5;
  }
  else
  {
    if (CFStringGetLength(a3) < v7)
    {
      while (1)
      {
        v12.location = v6;
        v12.length = v7;
        if (!CFStringFindWithOptions((CFStringRef)self, a3, v12, 0xCuLL, &result))
          break;
        v7 = result.location - v6;
      }
    }
    -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", v7 + v6, -[NSString length](self, "length") - (v7 + v6));
  }
  -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", 0, v6);
}

- (void)_trimWithCharacterSet:(id)a3
{
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  unsigned __int16 v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  NSMutableString *v28;
  __int128 v29;
  NSMutableString *v30;
  unint64_t v31;
  _OWORD v32[4];
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = -[NSString length](self, "length");
  v6 = v5;
  v33 = 0u;
  memset(v32, 0, sizeof(v32));
  v29 = 0u;
  v30 = self;
  v31 = v5;
  v28 = self;
  if (v5)
  {
    if (v5 >= 0x20)
      v7 = 32;
    else
      v7 = v5;
    *(_QWORD *)&v29 = v7;
    objc_msgSend(self, sel_getUid("getCharacters:range:"), (char *)v32 + 8, 0, v7);
    v8 = WORD4(v32[0]);
  }
  else
  {
    v8 = -1;
  }
  *((_QWORD *)&v29 + 1) = 1;
  WORD4(v33) = v8;
  v9 = 1;
  while (1)
  {
    v10 = v29;
    if (v9 > (unint64_t)v29)
      goto LABEL_23;
    v11 = objc_msgSend(a3, "characterIsMember:", v8);
    v12 = *((_QWORD *)&v29 + 1);
    if (!v11)
      break;
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
        v9 = 1;
        goto LABEL_19;
      }
      v9 = v29 + 1;
      *((_QWORD *)&v29 + 1) = v29 + 1;
      v8 = -1;
    }
    else
    {
      v9 = ++*((_QWORD *)&v29 + 1);
      v8 = *((_WORD *)v32 + v12 + 4);
    }
    WORD4(v33) = v8;
LABEL_19:
    if (!v9)
      goto LABEL_24;
  }
  if (!*((_QWORD *)&v29 + 1))
    goto LABEL_24;
  v9 = *((_QWORD *)&v29 + 1);
  v10 = v29;
LABEL_23:
  if (v9 > v10)
  {
LABEL_24:
    -[NSMutableString setString:](self, "setString:", &stru_1E0F56070);
    return;
  }
  v15 = *(_QWORD *)&v32[0];
  v16 = v6 - 1;
  v17 = *(_QWORD *)&v32[0] <= v6 - 1 && *(_QWORD *)&v32[0] + v10 > v16;
  v18 = *(_QWORD *)&v32[0];
  if (!v17)
  {
    if (v16 > 0xF)
    {
      v20 = v31;
      if (v31 - 16 >= v16)
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
    v21 = v20 - v19;
    if (v21 >= 0x20)
      v22 = 32;
    else
      v22 = v21;
    *(_QWORD *)&v29 = v22;
    objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, v19, v22);
    WORD4(v33) = WORD4(v32[0]);
    v18 = *(_QWORD *)&v32[0];
  }
  v23 = v9 + v15;
  v24 = v16 - v18;
  *((_QWORD *)&v29 + 1) = v24 + 1;
  WORD4(v33) = *((_WORD *)v32 + v24 + 4);
  if (objc_msgSend(a3, "characterIsMember:"))
  {
    do
    {
      v25 = *((_QWORD *)&v29 + 1);
      if (*((_QWORD *)&v29 + 1) < 2uLL)
      {
        if (*(_QWORD *)&v32[0])
        {
          if (*(_QWORD *)&v32[0] >= 0x20uLL)
            v27 = 32;
          else
            v27 = *(_QWORD *)&v32[0];
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
    while ((objc_msgSend(a3, "characterIsMember:") & 1) != 0);
  }
  if (v6 != *((_QWORD *)&v29 + 1) + *(_QWORD *)&v32[0])
    -[NSMutableString replaceCharactersInRange:withString:](v28, "replaceCharactersInRange:withString:", *((_QWORD *)&v29 + 1) + *(_QWORD *)&v32[0], v6 - (*((_QWORD *)&v29 + 1) + *(_QWORD *)&v32[0]), &stru_1E0F56070);
  if (v23 != 1)
    -[NSMutableString replaceCharactersInRange:withString:](v28, "replaceCharactersInRange:withString:", 0, v23 - 1, &stru_1E0F56070);
}

- (void)_cfTrimWS
{
  -[NSMutableString _trimWithCharacterSet:](self, "_trimWithCharacterSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
}

- (void)_cfNormalize:(int64_t)a3
{
  NSUInteger v4;
  NSString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      v4 = -[NSString length](self, "length");
      v5 = -[NSString decomposedStringWithCanonicalMapping](self, "decomposedStringWithCanonicalMapping");
      break;
    case 1:
      v4 = -[NSString length](self, "length");
      v5 = -[NSString decomposedStringWithCompatibilityMapping](self, "decomposedStringWithCompatibilityMapping");
      break;
    case 2:
      v4 = -[NSString length](self, "length");
      v5 = -[NSString precomposedStringWithCanonicalMapping](self, "precomposedStringWithCanonicalMapping");
      break;
    case 3:
      v4 = -[NSString length](self, "length");
      v5 = -[NSString precomposedStringWithCompatibilityMapping](self, "precomposedStringWithCompatibilityMapping");
      break;
    default:
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid normalization form %ld"), objc_opt_class(), a3), 0);
      objc_exception_throw(v6);
  }
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, v4, v5);
}

- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString
{
  NSRequestConcreteImplementation((uint64_t)self, a2, (objc_class *)__NSMutableStringClass);
}

- (void)deleteCharactersInRange:(NSRange)range
{
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", range.location, range.length, &stru_1E0F56070);
}

- (void)setString:(NSString *)aString
{
  -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", 0, -[NSString length](self, "length"), aString);
}

- (NSUInteger)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
  unint64_t length;
  unint64_t location;
  NSUInteger v13;
  const __CFArray *Results;
  const __CFArray *v15;
  CFIndex Count;
  NSUInteger v17;
  CFIndex v18;
  CFIndex v19;
  CFIndex v20;
  _QWORD *ValueAtIndex;
  NSString *v23;
  void *v24;
  _QWORD *v25;
  CFRange v26;

  length = searchRange.length;
  location = searchRange.location;
  v13 = -[NSString length](self, "length");
  if (!target || !replacement)
  {
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2));
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = (_QWORD *)MEMORY[0x1E0C99778];
    goto LABEL_19;
  }
  if (v13 < length || location > v13 - length)
  {
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Range {%lu, %lu} out of bounds; string length %lu"),
            _NSMethodExceptionProem((objc_class *)self, a2),
            location,
            length,
            v13);
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = (_QWORD *)MEMORY[0x1E0C99858];
LABEL_19:
    objc_exception_throw((id)objc_msgSend(v24, "exceptionWithName:reason:userInfo:", *v25, v23, 0));
  }
  if ((options & 0x400) != 0)
    return -[NSMutableString _replaceOccurrencesOfRegularExpressionPattern:withTemplate:options:range:](self, "_replaceOccurrencesOfRegularExpressionPattern:withTemplate:options:range:", target, replacement, options, location, length);
  v26.location = location;
  v26.length = length;
  Results = CFStringCreateArrayWithFindResults(0, (CFStringRef)self, (CFStringRef)target, v26, ~(8 * (_BYTE)options) & 0x10 | options);
  if (!Results)
    return 0;
  v15 = Results;
  Count = CFArrayGetCount(Results);
  v17 = Count;
  if (Count)
  {
    v18 = 0;
    v19 = Count - 1;
    do
    {
      if ((options & 4) != 0)
        v20 = v18;
      else
        v20 = v19;
      ValueAtIndex = CFArrayGetValueAtIndex(v15, v20);
      -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", *ValueAtIndex, ValueAtIndex[1], replacement);
      ++v18;
      --v19;
    }
    while (v19 != -1);
  }
  CFRelease(v15);
  return v17;
}

- (BOOL)applyTransform:(NSStringTransform)transform reverse:(BOOL)reverse range:(NSRange)range updatedRange:(NSRangePointer)resultingRange
{
  int v7;
  NSRange v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = range;
  v7 = CFStringTransform((CFMutableStringRef)self, (CFRange *)&v9, (CFStringRef)transform, reverse);
  if (resultingRange && v7)
    *resultingRange = v9;
  return v7 != 0;
}

- (Class)classForCoder
{
  return (Class)__NSMutableStringClass;
}

- (NSMutableString)initWithCapacity:(NSUInteger)capacity
{
  _NSRequestConcreteObject((int)self, a2);
}

- (unint64_t)_replaceOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v12;
  NSString *v13;
  id v14;
  unint64_t result;
  unint64_t v16;

  length = a6.length;
  location = a6.location;
  v12 = a5 & 1;
  if (_MergedGlobals_144 != -1)
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lx:%@"), v12, a3);
  v14 = (id)objc_msgSend((id)qword_1ECD0A628, "objectForKey:", v13);
  if (!v14)
  {
    result = -[NSRegularExpression initWithPattern:options:error:]([NSRegularExpression alloc], "initWithPattern:options:error:", a3, v12, 0);
    if (!result)
      return result;
    v14 = (id)result;
    objc_msgSend((id)qword_1ECD0A628, "setObject:forKey:", result, v13);
  }
  v16 = objc_msgSend(v14, "replaceMatchesInString:options:range:withTemplate:", self, (a5 >> 1) & 4, location, length, a4);

  return v16;
}

@end
