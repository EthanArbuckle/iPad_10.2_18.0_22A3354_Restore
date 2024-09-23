@implementation NSPlaceholderNumber

- (NSPlaceholderNumber)initWithUnsignedLongLong:(unint64_t)a3
{
  const __CFAllocator *v3;
  CFNumberType v4;
  _QWORD valuePtr[3];

  valuePtr[2] = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x8000000000000000) != 0)
  {
    valuePtr[0] = 0;
    valuePtr[1] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }
  else
  {
    valuePtr[0] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = kCFNumberSInt64Type;
  }
  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)initWithInteger:(int64_t)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithLongLong:(int64_t)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithDouble:(double)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  *(double *)v4 = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, v4);
}

- (NSPlaceholderNumber)initWithFloat:(float)a3
{
  float valuePtr;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedInteger:(unint64_t)a3
{
  const __CFAllocator *v3;
  CFNumberType v4;
  _QWORD valuePtr[3];

  valuePtr[2] = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x8000000000000000) != 0)
  {
    valuePtr[0] = 0;
    valuePtr[1] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }
  else
  {
    valuePtr[0] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = kCFNumberSInt64Type;
  }
  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)initWithInt:(int)a3
{
  int valuePtr;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithLong:(int64_t)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithUnsignedLong:(unint64_t)a3
{
  const __CFAllocator *v3;
  CFNumberType v4;
  _QWORD valuePtr[3];

  valuePtr[2] = *MEMORY[0x1E0C80C00];
  if ((a3 & 0x8000000000000000) != 0)
  {
    valuePtr[0] = 0;
    valuePtr[1] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = kCFNumberMaxType|kCFNumberSInt8Type;
  }
  else
  {
    valuePtr[0] = a3;
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = kCFNumberSInt64Type;
  }
  return (NSPlaceholderNumber *)CFNumberCreate(v3, v4, valuePtr);
}

- (NSPlaceholderNumber)initWithBool:(BOOL)a3
{
  CFTypeRef *v3;

  v3 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v3 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
  return (NSPlaceholderNumber *)CFRetain(*v3);
}

- (NSPlaceholderNumber)initWithCoder:(id)a3
{
  id v6;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    return newDecodedNumber(a3);
  if (object_getClass(a3) == (Class)NSKeyedUnarchiver
    || objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.number")))
  {
    v6 = (id)objc_msgSend(a3, "_decodePropertyListForKey:", CFSTR("NS.number"));
    if ((_NSIsNSNumber() & 1) != 0)
    {
      return (NSPlaceholderNumber *)v6;
    }
    else
    {
      objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Decoded object is not a number")));

      return 0;
    }
  }
  else if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.BOOLval")))
  {
    return -[NSPlaceholderNumber initWithBool:](self, "initWithBool:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.BOOLval")));
  }
  else if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.intval")))
  {
    return -[NSPlaceholderNumber initWithLongLong:](self, "initWithLongLong:", objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NS.intval")));
  }
  else
  {
    if (!objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.dblval")))
    {

      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("*** -[NSPlaceholderNumber initWithCoder:]: unknown number type"), 0));
    }
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("NS.dblval"));
    return -[NSPlaceholderNumber initWithDouble:](self, "initWithDouble:");
  }
}

- (NSPlaceholderNumber)initWithUnsignedInt:(unsigned int)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, v4);
}

- (NSPlaceholderNumber)initWithChar:(char)a3
{
  char valuePtr;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt8Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedChar:(unsigned __int8)a3
{
  __int16 valuePtr;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt16Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithShort:(signed __int16)a3
{
  signed __int16 valuePtr;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt16Type, &valuePtr);
}

- (NSPlaceholderNumber)initWithUnsignedShort:(unsigned __int16)a3
{
  int valuePtr;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  return (NSPlaceholderNumber *)CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
}

- (NSPlaceholderNumber)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
