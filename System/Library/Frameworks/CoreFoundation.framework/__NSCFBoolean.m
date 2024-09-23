@implementation __NSCFBoolean

- (__NSCFBoolean)retain
{
  if (((unint64_t)self & 0x8000000000000000) == 0)
    return (__NSCFBoolean *)_CFNonObjCRetain((unint64_t *)self);
  return self;
}

- (void)release
{
  if (((unint64_t)self & 0x8000000000000000) == 0)
    _CFNonObjCRelease();
}

- (BOOL)BOOLValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3)
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v5 = _NSIsNSNumber((uint64_t)a3);
      if (v5)
        LOBYTE(v5) = -[__NSCFBoolean isEqualToNumber:](self, "isEqualToNumber:", a3);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)descriptionWithLocale:(id)a3
{
  if (-[__NSCFBoolean BOOLValue](self, "BOOLValue", a3))
    return CFSTR("1");
  else
    return CFSTR("0");
}

- (id)description
{
  return -[__NSCFBoolean descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

- (id)stringValue
{
  return -[__NSCFBoolean descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

- (int64_t)_cfNumberType
{
  int v3;
  int64_t result;

  v3 = *-[__NSCFBoolean objCType](self, "objCType");
  result = 7;
  if (v3 <= 80)
  {
    if (v3 > 72)
    {
      if (v3 == 73)
      {
        if ((-[__NSCFBoolean unsignedIntValue](self, "unsignedIntValue") & 0x80000000) != 0)
          return 11;
        else
          return 9;
      }
      if (v3 == 76)
      {
        if ((-[__NSCFBoolean unsignedLongValue](self, "unsignedLongValue") & 0x8000000000000000) == 0)
          return 10;
        else
          return 11;
      }
    }
    else
    {
      if (v3 == 66)
        return result;
      if (v3 == 67)
        return 8;
    }
LABEL_24:
    __break(1u);
    return result;
  }
  switch(v3)
  {
    case 'c':
      return result;
    case 'd':
      return 13;
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      goto LABEL_24;
    case 'f':
      return 12;
    case 'i':
      goto LABEL_15;
    case 'l':
      return 10;
    case 'q':
      return 11;
    case 's':
      return 8;
    default:
      if (v3 == 81)
      {
        result = 17;
      }
      else
      {
        if (v3 != 83)
          goto LABEL_24;
LABEL_15:
        result = 9;
      }
      break;
  }
  return result;
}

- (BOOL)isEqualToNumber:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return self == a3 || -[__NSCFBoolean compare:](self, "compare:", v3, v4) == 0;
}

- (int64_t)compare:(id)a3
{
  int v5;
  const char *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;

  if (!a3)
    -[__NSCFBoolean compare:].cold.1((objc_class *)self, a2);
  if (self == a3)
    return 0;
  v5 = *(unsigned __int8 *)objc_msgSend(a3, "objCType");
  v6 = -[__NSCFBoolean objCType](self, "objCType");
  if ((v5 & 0xFFFFFFFD) == 0x64 || (v7 = *(unsigned __int8 *)v6, v7 == 100) || v7 == 102)
  {
    -[__NSCFBoolean doubleValue](self, "doubleValue");
    v13 = v12;
    objc_msgSend(a3, "doubleValue");
    if (v13 >= v14)
      return v14 < v13;
    return -1;
  }
  if (v5 == 81 && v7 == 81)
  {
    v8 = -[__NSCFBoolean unsignedLongLongValue](self, "unsignedLongLongValue");
    v9 = objc_msgSend(a3, "unsignedLongLongValue");
    if (v8 >= v9)
      v10 = 0;
    else
      v10 = -1;
    if (v8 > v9)
      return 1;
    else
      return v10;
  }
  if (v7 == 81 && (-[__NSCFBoolean unsignedLongLongValue](self, "unsignedLongLongValue") & 0x8000000000000000) != 0)
    return 1;
  if (v5 == 81 && objc_msgSend(a3, "unsignedLongLongValue") < 0)
    return -1;
  v15 = -[__NSCFBoolean longLongValue](self, "longLongValue");
  v16 = objc_msgSend(a3, "longLongValue");
  if (v15 >= v16)
    v17 = 0;
  else
    v17 = -1;
  if (v15 > v16)
    return 1;
  else
    return v17;
}

- (const)objCType
{
  return "c";
}

- (int64_t)longLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (((unint64_t)self & 0x8000000000000000) == 0)
    return _CFNonObjCRetain((unint64_t *)self);
  return self;
}

- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  switch(a4)
  {
    case 1:
      *(_BYTE *)a3 = -[__NSCFBoolean charValue](self, "charValue");
      goto LABEL_9;
    case 2:
      *(_WORD *)a3 = -[__NSCFBoolean shortValue](self, "shortValue");
      goto LABEL_9;
    case 3:
      *(_DWORD *)a3 = -[__NSCFBoolean intValue](self, "intValue");
      goto LABEL_9;
    case 4:
      *(_QWORD *)a3 = -[__NSCFBoolean longLongValue](self, "longLongValue");
      goto LABEL_9;
    case 5:
      -[__NSCFBoolean floatValue](self, "floatValue");
      *(_DWORD *)a3 = v5;
      goto LABEL_9;
    case 6:
      -[__NSCFBoolean doubleValue](self, "doubleValue");
      *(_QWORD *)a3 = v6;
      goto LABEL_9;
    case 17:
      v7 = -[__NSCFBoolean longLongValue](self, "longLongValue");
      *(_QWORD *)a3 = v7 >> 63;
      *((_QWORD *)a3 + 1) = v7;
LABEL_9:
      LOBYTE(self) = 1;
      break;
    default:
      __break(1u);
      break;
  }
  return self;
}

- (double)doubleValue
{
  int Value;
  double result;

  Value = CFBooleanGetValue((CFBooleanRef)self);
  result = 0.0;
  if (Value)
    return 1.0;
  return result;
}

- (signed)shortValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (char)charValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (int)intValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (float)floatValue
{
  int Value;
  float result;

  Value = CFBooleanGetValue((CFBooleanRef)self);
  result = 0.0;
  if (Value)
    return 1.0;
  return result;
}

- (unsigned)unsignedIntValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (int64_t)longValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unint64_t)unsignedLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unsigned)unsignedShortValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (int64_t)_reverseCompare:(id)a3
{
  int64_t v3;
  int64_t v4;

  v3 = -[__NSCFBoolean compare:](self, "compare:", a3);
  if (v3 == 1)
    v4 = -1;
  else
    v4 = 0;
  if (v3 == -1)
    return 1;
  else
    return v4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (unsigned)unsignedCharValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (unint64_t)unsignedLongLongValue
{
  return CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (void)getValue:(void *)a3
{
  *(_BYTE *)a3 = CFBooleanGetValue((CFBooleanRef)self) != 0;
}

- (void)compare:(objc_class *)a1 .cold.1(objc_class *a1, const char *a2)
{
  uint64_t v2;

  v2 = __CFExceptionProem(a1, a2);
  OUTLINED_FUNCTION_0_8(v2, CFSTR("%@: nil argument"));
}

@end
