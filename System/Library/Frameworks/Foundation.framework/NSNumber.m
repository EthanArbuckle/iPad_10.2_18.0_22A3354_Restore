@implementation NSNumber

+ (NSNumber)numberWithBool:(BOOL)value
{
  NSNumber **v3;

  v3 = (NSNumber **)MEMORY[0x1E0C9AE50];
  if (!value)
    v3 = (NSNumber **)MEMORY[0x1E0C9AE40];
  return *v3;
}

- (BOOL)_allowsDirectEncoding
{
  return 1;
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
    v5 = _NSIsNSNumber();
    if (v5)
      LOBYTE(v5) = -[NSNumber isEqualToNumber:](self, "isEqualToNumber:", a3);
  }
  return v5;
}

- (BOOL)isEqualToNumber:(NSNumber *)number
{
  uint64_t v3;
  uint64_t v4;

  return self == number || -[NSNumber compare:](self, "compare:", v3, v4) == NSOrderedSame;
}

- (BOOL)isNSNumber__
{
  return 1;
}

- (unsigned)_getValue:(void *)a3 forType:(int64_t)a4
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  switch(a4)
  {
    case 1:
      *(_BYTE *)a3 = -[NSNumber charValue](self, "charValue");
      break;
    case 2:
      *(_WORD *)a3 = -[NSNumber shortValue](self, "shortValue");
      break;
    case 3:
      *(_DWORD *)a3 = -[NSNumber intValue](self, "intValue");
      break;
    case 4:
      *(_QWORD *)a3 = -[NSNumber longLongValue](self, "longLongValue");
      break;
    case 5:
      -[NSNumber floatValue](self, "floatValue");
      *(_DWORD *)a3 = v5;
      break;
    case 6:
      -[NSNumber doubleValue](self, "doubleValue");
      *(_QWORD *)a3 = v6;
      break;
    case 17:
      v7 = -[NSNumber longLongValue](self, "longLongValue");
      *(_QWORD *)a3 = v7 >> 63;
      *((_QWORD *)a3 + 1) = v7;
      break;
    default:
      __break(1u);
      JUMPOUT(0x1817E74D4);
  }
  return 1;
}

- (unint64_t)hash
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  unint64_t v10;
  long double v11;
  double v12;
  double v13;
  long double v14;

  v3 = *-[NSValue objCType](self, "objCType");
  if (v3 <= 75)
  {
    if (v3 != 66)
    {
      if (v3 != 67 && v3 != 73)
        goto LABEL_23;
      goto LABEL_20;
    }
  }
  else
  {
    v4 = (v3 - 83);
    if (v4 > 0x20)
    {
LABEL_17:
      if (v3 != 76)
      {
        if (v3 == 81)
        {
          v6 = (double)-[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
LABEL_25:
          v14 = floor(v6 + 0.5);
          v12 = (v6 - v14) * 1.84467441e19;
          result = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
LABEL_26:
          if (v12 >= 0.0)
          {
            if (v12 > 0.0)
              result += (unint64_t)v12;
          }
          else
          {
            result -= (unint64_t)fabs(v12);
          }
          return result;
        }
LABEL_23:
        -[NSNumber doubleValue](self, "doubleValue");
        v6 = -v13;
        if (v13 >= 0.0)
          v6 = v13;
        goto LABEL_25;
      }
LABEL_20:
      v10 = -[NSNumber unsignedIntegerValue](self, "unsignedIntegerValue");
      if ((v10 & 0x8000000000000000) == 0)
        return 2654435761u * v10;
      v11 = floor((double)v10 + 0.5);
      v12 = ((double)v10 - v11) * 1.84467441e19;
      result = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
      goto LABEL_26;
    }
    if (((1 << (v3 - 83)) & 0x102410000) == 0)
    {
      if (v3 == 83)
        goto LABEL_20;
      if (v4 == 30)
      {
        v5 = -[NSNumber longLongValue](self, "longLongValue");
        v6 = -(double)v5;
        if (v5 >= 0)
          v6 = (double)v5;
        goto LABEL_25;
      }
      goto LABEL_17;
    }
  }
  v7 = -[NSNumber integerValue](self, "integerValue");
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = -v7;
  return 2654435761 * v8;
}

- (NSComparisonResult)compare:(NSNumber *)otherNumber
{
  int v5;
  const char *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  NSComparisonResult v10;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  NSComparisonResult v17;
  void *v18;

  if (!otherNumber)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: nil argument"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v18);
  }
  if (self == otherNumber)
    return 0;
  v5 = *(unsigned __int8 *)-[NSValue objCType](otherNumber, "objCType");
  v6 = -[NSValue objCType](self, "objCType");
  if ((v5 & 0xFFFFFFFD) == 0x64 || (v7 = *(unsigned __int8 *)v6, v7 == 100) || v7 == 102)
  {
    -[NSNumber doubleValue](self, "doubleValue");
    v13 = v12;
    -[NSNumber doubleValue](otherNumber, "doubleValue");
    if (v13 >= v14)
      return (unint64_t)(v14 < v13);
    return -1;
  }
  if (v5 == 81 && v7 == 81)
  {
    v8 = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
    v9 = -[NSNumber unsignedLongLongValue](otherNumber, "unsignedLongLongValue");
    if (v8 >= v9)
      v10 = NSOrderedSame;
    else
      v10 = NSOrderedAscending;
    if (v8 > v9)
      return 1;
    else
      return v10;
  }
  if (v7 == 81 && (-[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue") & 0x8000000000000000) != 0)
    return 1;
  if (v5 == 81 && (-[NSNumber unsignedLongLongValue](otherNumber, "unsignedLongLongValue") & 0x8000000000000000) != 0)
    return -1;
  v15 = -[NSNumber longLongValue](self, "longLongValue");
  v16 = -[NSNumber longLongValue](otherNumber, "longLongValue");
  if (v15 >= v16)
    v17 = NSOrderedSame;
  else
    v17 = NSOrderedAscending;
  if (v15 > v16)
    return 1;
  else
    return v17;
}

- (int64_t)_cfNumberType
{
  int v3;
  int64_t result;

  v3 = *-[NSValue objCType](self, "objCType");
  result = 7;
  if (v3 <= 80)
  {
    if (v3 > 72)
    {
      if (v3 == 73)
      {
        if ((-[NSNumber unsignedIntValue](self, "unsignedIntValue") & 0x80000000) != 0)
          return 11;
        else
          return 9;
      }
      if (v3 == 76)
      {
        if ((-[NSNumber unsignedLongValue](self, "unsignedLongValue") & 0x8000000000000000) == 0)
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

- (Class)classForCoder
{
  return (Class)NSNumber;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSNumber)numberWithUnsignedInt:(unsigned int)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithUnsignedInt:", *(_QWORD *)&value);
  result = (NSNumber *)(((unint64_t)value << 7) | 0x800000000000001BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

- (NSString)descriptionWithLocale:(id)locale
{
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  const __CFString *v11;
  id v12;
  float v13;
  void *v15;
  unint64_t v16;

  v6 = *-[NSValue objCType](self, "objCType");
  if (v6 > 80)
  {
    switch(v6)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        v7 = objc_allocWithZone((Class)NSString);
        -[NSNumber doubleValue](self, "doubleValue");
        v9 = (void *)objc_msgSend(v7, "initWithFormat:locale:", CFSTR("%0.16g"), locale, v8);
        return (NSString *)v9;
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
        goto LABEL_26;
      case 'f':
        v12 = objc_allocWithZone((Class)NSString);
        -[NSNumber floatValue](self, "floatValue");
        v9 = (void *)objc_msgSend(v12, "initWithFormat:locale:", CFSTR("%0.7g"), locale, v13);
        return (NSString *)v9;
      case 'i':
        v10 = objc_allocWithZone((Class)NSString);
        v16 = -[NSNumber intValue](self, "intValue");
        goto LABEL_19;
      case 'l':
        v9 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", CFSTR("%ld"), locale, -[NSNumber longValue](self, "longValue"));
        return (NSString *)v9;
      case 'q':
        v9 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", CFSTR("%lld"), locale, -[NSNumber longLongValue](self, "longLongValue"));
        return (NSString *)v9;
      case 's':
        v9 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", CFSTR("%hi"), locale, -[NSNumber shortValue](self, "shortValue"));
        return (NSString *)v9;
      default:
        if (v6 != 81)
        {
          if (v6 == 83)
          {
            v9 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", CFSTR("%hu"), locale, -[NSNumber unsignedShortValue](self, "unsignedShortValue"));
            return (NSString *)v9;
          }
LABEL_26:
          v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
          objc_exception_throw(v15);
        }
        v10 = objc_allocWithZone((Class)NSString);
        v16 = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        v11 = CFSTR("%llu");
        break;
    }
LABEL_24:
    v9 = (void *)objc_msgSend(v10, "initWithFormat:locale:", v11, locale, v16);
    return (NSString *)v9;
  }
  if (v6 <= 72)
  {
    if (v6 == 66)
    {
LABEL_11:
      v10 = objc_allocWithZone((Class)NSString);
      v16 = -[NSNumber charValue](self, "charValue");
LABEL_19:
      v11 = CFSTR("%d");
      goto LABEL_24;
    }
    if (v6 != 67)
      goto LABEL_26;
    v10 = objc_allocWithZone((Class)NSString);
    v16 = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
    goto LABEL_16;
  }
  if (v6 == 73)
  {
    v10 = objc_allocWithZone((Class)NSString);
    v16 = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
LABEL_16:
    v11 = CFSTR("%u");
    goto LABEL_24;
  }
  if (v6 != 76)
    goto LABEL_26;
  v9 = (void *)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithFormat:locale:", CFSTR("%lu"), locale, -[NSNumber unsignedLongValue](self, "unsignedLongValue"));
  return (NSString *)v9;
}

- (NSString)stringValue
{
  return -[NSNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

+ (NSNumber)numberWithLongLong:(uint64_t)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1
    || (unint64_t)(value - 0x80000000000000) < 0xFF00000000000001
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithLongLong:", value);
  }
  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (NSNumber)numberWithDouble:(double)value
{
  NSNumber *result;
  uint64_t v4;
  unint64_t v5;

  if (NSNumber != a1)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithDouble:", value);
  if ((_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithDouble:", value);
  v4 = (uint64_t)value;
  if ((double)(uint64_t)value != value)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithDouble:", value);
  if (!v4)
  {
    if ((*(_QWORD *)&value & 0x8000000000000000) == 0)
      goto LABEL_9;
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithDouble:", value);
  }
  if ((unint64_t)(v4 - 0x80000000000000) < 0xFF00000000000001)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithDouble:", value);
LABEL_9:
  result = (NSNumber *)((v4 << 7) | 0x800000000000002BLL);
  v5 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v5 & 0xC000000000000007) != 0)
    return (NSNumber *)(v5 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v5 & 7)));
  return result;
}

+ (NSNumber)allocWithZone:(_NSZone *)a3
{
  if (NSNumber == a1)
    return (NSNumber *)&__placeholderNumber;
  else
    return (NSNumber *)NSAllocateObject((Class)a1, 0, a3);
}

+ (NSNumber)numberWithFloat:(float)value
{
  id v4;
  double v5;
  NSNumber *result;
  uint64_t v7;
  unint64_t v8;

  if (NSNumber != a1)
    goto LABEL_2;
  if ((_NSNumberTaggedPointersDisabled & 1) != 0)
    goto LABEL_2;
  v7 = (uint64_t)value;
  if ((float)(uint64_t)value != value)
    goto LABEL_2;
  if (!v7)
  {
    if ((LODWORD(value) & 0x80000000) == 0)
      goto LABEL_9;
LABEL_2:
    v4 = objc_allocWithZone((Class)a1);
    *(float *)&v5 = value;
    return (NSNumber *)(id)objc_msgSend(v4, "initWithFloat:", v5);
  }
  if ((unint64_t)(v7 - 0x80000000000000) < 0xFF00000000000001)
    goto LABEL_2;
LABEL_9:
  result = (NSNumber *)((v7 << 7) | 0x8000000000000023);
  v8 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v8 & 0xC000000000000007) != 0)
    return (NSNumber *)(v8 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v8 & 7)));
  return result;
}

+ (NSNumber)numberWithUnsignedInteger:(NSUInteger)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || value >> 55 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithUnsignedInteger:", value);
  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (NSNumber)numberWithUnsignedChar:(unsigned __int8)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithUnsignedChar:", value);
  result = (NSNumber *)(((unint64_t)value << 7) | 0x800000000000000BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5
{
  int v9;
  int v10;
  size_t v11;
  void *v13;

  v9 = *-[NSValue objCType](self, "objCType");
  if (v9 <= 80)
  {
    if (v9 > 72)
    {
      if (v9 == 73)
      {
        -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        goto LABEL_16;
      }
      if (v9 == 76)
      {
        -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        v10 = snprintf(a3, a4, "%lu");
        return v10 < a4;
      }
    }
    else
    {
      if (v9 == 66)
      {
LABEL_11:
        -[NSNumber charValue](self, "charValue");
        v11 = a4;
LABEL_19:
        v10 = snprintf(a3, v11, "%d");
        return v10 < a4;
      }
      if (v9 == 67)
      {
        -[NSNumber unsignedCharValue](self, "unsignedCharValue");
LABEL_16:
        v10 = snprintf(a3, a4, "%u");
        return v10 < a4;
      }
    }
LABEL_25:
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
    objc_exception_throw(v13);
  }
  switch(v9)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      -[NSNumber doubleValue](self, "doubleValue");
      v10 = snprintf(a3, a4, "%0.16g");
      return v10 < a4;
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
      goto LABEL_25;
    case 'f':
      -[NSNumber floatValue](self, "floatValue");
      v10 = snprintf(a3, a4, "%0.7g");
      return v10 < a4;
    case 'i':
      -[NSNumber intValue](self, "intValue");
      v11 = a4;
      goto LABEL_19;
    case 'l':
      -[NSNumber longValue](self, "longValue");
      v10 = snprintf(a3, a4, "%ld");
      return v10 < a4;
    case 'q':
      -[NSNumber longLongValue](self, "longLongValue");
      v10 = snprintf(a3, a4, "%lld");
      return v10 < a4;
    case 's':
      -[NSNumber shortValue](self, "shortValue");
      v10 = snprintf(a3, a4, "%hi");
      return v10 < a4;
    default:
      if (v9 == 81)
      {
        -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        v10 = snprintf(a3, a4, "%llu");
        return v10 < a4;
      }
      if (v9 != 83)
        goto LABEL_25;
      -[NSNumber unsignedShortValue](self, "unsignedShortValue");
      v10 = snprintf(a3, a4, "%hu");
      break;
  }
  return v10 < a4;
}

+ (NSNumber)numberWithLong:(uint64_t)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1
    || (unint64_t)(value - 0x80000000000000) < 0xFF00000000000001
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithLong:", value);
  }
  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (NSNumber)numberWithShort:(__int16)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithShort:", value);
  result = (NSNumber *)(((uint64_t)value << 7) | 0x800000000000000BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (NSNumber)numberWithInteger:(NSInteger)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1
    || (unint64_t)(value - 0x80000000000000) < 0xFF00000000000001
    || (_NSNumberTaggedPointersDisabled & 1) != 0)
  {
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithInteger:", value);
  }
  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (NSNumber)numberWithInt:(int)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithInt:", *(_QWORD *)&value);
  result = (NSNumber *)(((uint64_t)value << 7) | 0x8000000000000013);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (NSNumber)numberWithUnsignedLong:(unint64_t)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || value >> 55 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithUnsignedLong:", value);
  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (NSNumber)numberWithUnsignedLongLong:(unint64_t)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || value >> 55 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithUnsignedLongLong:", value);
  result = (NSNumber *)((value << 7) | 0x800000000000001BLL);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

- (id)description
{
  return -[NSNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

- (NSDecimal)decimalValue
{
  NSScanner *v5;
  NSDecimalNumber *v6;
  __int128 v8;
  int v9;

  _CFAutoreleasePoolPush();
  v5 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", -[NSNumber stringValue](self, "stringValue"));
  *(_QWORD *)retstr = 0;
  *(_QWORD *)&retstr->_mantissa[2] = 0;
  *(_DWORD *)&retstr->_mantissa[6] = 0;
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
    *(_DWORD *)&retstr->_mantissa[6] = v9;
  }
  return (NSDecimal *)_CFAutoreleasePoolPop();
}

+ (NSNumber)numberWithChar:(char)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithChar:", value);
  result = (NSNumber *)(((uint64_t)value << 7) | 0x8000000000000003);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

- (id)redactedDescription
{
  return -[NSNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

+ (NSNumber)numberWithUnsignedShort:(unsigned __int16)value
{
  NSNumber *result;
  unint64_t v4;

  if (NSNumber != a1 || (_NSNumberTaggedPointersDisabled & 1) != 0)
    return (NSNumber *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithUnsignedShort:", value);
  result = (NSNumber *)(((unint64_t)value << 7) | 0x8000000000000013);
  v4 = *MEMORY[0x1E0DE7C58] ^ (unint64_t)result;
  if ((~v4 & 0xC000000000000007) != 0)
    return (NSNumber *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v4 & 7)));
  return result;
}

+ (void)initialize
{
  if (NSNumber == a1 && (!*MEMORY[0x1E0DE7C50] || !_CFExecutableLinkedOnOrAfter()))
    _NSNumberTaggedPointersDisabled = 1;
}

- (int64_t)_reverseCompare:(id)a3
{
  NSComparisonResult v3;
  int64_t v4;

  v3 = -[NSNumber compare:](self, "compare:", a3);
  if (v3 == NSOrderedDescending)
    v4 = -1;
  else
    v4 = 0;
  if (v3 == NSOrderedAscending)
    return 1;
  else
    return v4;
}

- (BOOL)BOOLValue
{
  unsigned int v4;
  uint64_t v5;
  BOOL v6;
  double v8;
  void *v9;

  v4 = *-[NSValue objCType](self, "objCType") - 66;
  if (v4 > 0x31)
    goto LABEL_12;
  if (((1 << v4) & 0x2048200020483) != 0)
  {
    v5 = -[NSNumber longValue](self, "longValue");
LABEL_4:
    v6 = v5 == 0;
    return !v6;
  }
  if (((1 << v4) & 0x1400000000) == 0)
  {
    if (((1 << v4) & 0x800000008000) != 0)
    {
      v5 = -[NSNumber longLongValue](self, "longLongValue");
      goto LABEL_4;
    }
LABEL_12:
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
    objc_exception_throw(v9);
  }
  -[NSNumber doubleValue](self, "doubleValue");
  v6 = v8 == 0.0;
  return !v6;
}

- (char)charValue
{
  int v4;
  double v5;
  int v6;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOBYTE(v6) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return v6;
      }
      if (v4 == 76)
      {
        LOBYTE(v6) = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        return v6;
      }
    }
    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOBYTE(v6) = -[NSNumber charValue](self, "charValue");
        return v6;
      }
      if (v4 == 67)
      {
        LOBYTE(v6) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return v6;
      }
    }
LABEL_23:
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
    objc_exception_throw(v8);
  }
  switch(v4)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      -[NSNumber doubleValue](self, "doubleValue");
      return (int)v5;
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
      goto LABEL_23;
    case 'f':
      -[NSNumber floatValue](self, "floatValue");
      return (int)v7;
    case 'i':
      LOBYTE(v6) = -[NSNumber intValue](self, "intValue");
      return v6;
    case 'l':
      LOBYTE(v6) = -[NSNumber longValue](self, "longValue");
      return v6;
    case 'q':
      LOBYTE(v6) = -[NSNumber longLongValue](self, "longLongValue");
      return v6;
    case 's':
      LOBYTE(v6) = -[NSNumber shortValue](self, "shortValue");
      return v6;
    default:
      if (v4 == 81)
      {
        LOBYTE(v6) = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        return v6;
      }
      if (v4 != 83)
        goto LABEL_23;
      LOBYTE(v6) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
      break;
  }
  return v6;
}

- (unsigned)unsignedCharValue
{
  int v4;
  double v5;
  int v6;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOBYTE(v6) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return v6;
      }
      if (v4 == 76)
      {
        LOBYTE(v6) = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        return v6;
      }
    }
    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOBYTE(v6) = -[NSNumber charValue](self, "charValue");
        return v6;
      }
      if (v4 == 67)
      {
        LOBYTE(v6) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return v6;
      }
    }
LABEL_23:
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
    objc_exception_throw(v8);
  }
  switch(v4)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      -[NSNumber doubleValue](self, "doubleValue");
      return (int)v5;
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
      goto LABEL_23;
    case 'f':
      -[NSNumber floatValue](self, "floatValue");
      return (int)v7;
    case 'i':
      LOBYTE(v6) = -[NSNumber intValue](self, "intValue");
      return v6;
    case 'l':
      LOBYTE(v6) = -[NSNumber longValue](self, "longValue");
      return v6;
    case 'q':
      LOBYTE(v6) = -[NSNumber longLongValue](self, "longLongValue");
      return v6;
    case 's':
      LOBYTE(v6) = -[NSNumber shortValue](self, "shortValue");
      return v6;
    default:
      if (v4 == 81)
      {
        LOBYTE(v6) = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        return v6;
      }
      if (v4 != 83)
        goto LABEL_23;
      LOBYTE(v6) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
      break;
  }
  return v6;
}

- (__int16)shortValue
{
  int v4;
  double v5;
  int v6;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOWORD(v6) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return v6;
      }
      if (v4 == 76)
      {
        LOWORD(v6) = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        return v6;
      }
    }
    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOWORD(v6) = -[NSNumber charValue](self, "charValue");
        return v6;
      }
      if (v4 == 67)
      {
        LOWORD(v6) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return v6;
      }
    }
LABEL_23:
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
    objc_exception_throw(v8);
  }
  switch(v4)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      -[NSNumber doubleValue](self, "doubleValue");
      return (int)v5;
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
      goto LABEL_23;
    case 'f':
      -[NSNumber floatValue](self, "floatValue");
      return (int)v7;
    case 'i':
      LOWORD(v6) = -[NSNumber intValue](self, "intValue");
      return v6;
    case 'l':
      LOWORD(v6) = -[NSNumber longValue](self, "longValue");
      return v6;
    case 'q':
      LOWORD(v6) = -[NSNumber longLongValue](self, "longLongValue");
      return v6;
    case 's':
      LOWORD(v6) = -[NSNumber shortValue](self, "shortValue");
      return v6;
    default:
      if (v4 == 81)
      {
        LOWORD(v6) = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        return v6;
      }
      if (v4 != 83)
        goto LABEL_23;
      LOWORD(v6) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
      break;
  }
  return v6;
}

- (unsigned)unsignedShortValue
{
  int v4;
  double v5;
  int v6;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LOWORD(v6) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return v6;
      }
      if (v4 == 76)
      {
        LOWORD(v6) = -[NSNumber unsignedLongValue](self, "unsignedLongValue");
        return v6;
      }
    }
    else
    {
      if (v4 == 66)
      {
LABEL_11:
        LOWORD(v6) = -[NSNumber charValue](self, "charValue");
        return v6;
      }
      if (v4 == 67)
      {
        LOWORD(v6) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return v6;
      }
    }
LABEL_23:
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
    objc_exception_throw(v8);
  }
  switch(v4)
  {
    case 'c':
      goto LABEL_11;
    case 'd':
      -[NSNumber doubleValue](self, "doubleValue");
      return (int)v5;
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
      goto LABEL_23;
    case 'f':
      -[NSNumber floatValue](self, "floatValue");
      return (int)v7;
    case 'i':
      LOWORD(v6) = -[NSNumber intValue](self, "intValue");
      return v6;
    case 'l':
      LOWORD(v6) = -[NSNumber longValue](self, "longValue");
      return v6;
    case 'q':
      LOWORD(v6) = -[NSNumber longLongValue](self, "longLongValue");
      return v6;
    case 's':
      LOWORD(v6) = -[NSNumber shortValue](self, "shortValue");
      return v6;
    default:
      if (v4 == 81)
      {
        LOWORD(v6) = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        return v6;
      }
      if (v4 != 83)
        goto LABEL_23;
      LOWORD(v6) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
      break;
  }
  return v6;
}

- (int)intValue
{
  int v4;
  double v5;
  int result;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 <= 72)
    {
      if (v4 == 66)
        return -[NSNumber charValue](self, "charValue");
      if (v4 == 67)
        return -[NSNumber unsignedCharValue](self, "unsignedCharValue");
      goto LABEL_23;
    }
    if (v4 != 73)
    {
      if (v4 == 76)
        return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
      goto LABEL_23;
    }
    return -[NSNumber unsignedIntValue](self, "unsignedIntValue");
  }
  else
  {
    switch(v4)
    {
      case 'c':
        return -[NSNumber charValue](self, "charValue");
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (int)v5;
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
        goto LABEL_23;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (int)v7;
      case 'i':
        return -[NSNumber intValue](self, "intValue");
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        return -[NSNumber shortValue](self, "shortValue");
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
            return -[NSNumber unsignedShortValue](self, "unsignedShortValue");
LABEL_23:
          v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
          objc_exception_throw(v8);
        }
        result = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        break;
    }
  }
  return result;
}

- (unsigned)unsignedIntValue
{
  int v4;
  double v5;
  unsigned int result;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 <= 72)
    {
      if (v4 == 66)
        return -[NSNumber charValue](self, "charValue");
      if (v4 == 67)
        return -[NSNumber unsignedCharValue](self, "unsignedCharValue");
      goto LABEL_23;
    }
    if (v4 != 73)
    {
      if (v4 == 76)
        return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
      goto LABEL_23;
    }
    return -[NSNumber unsignedIntValue](self, "unsignedIntValue");
  }
  else
  {
    switch(v4)
    {
      case 'c':
        return -[NSNumber charValue](self, "charValue");
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return v5;
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
        goto LABEL_23;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return v7;
      case 'i':
        return -[NSNumber intValue](self, "intValue");
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        return -[NSNumber shortValue](self, "shortValue");
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
            return -[NSNumber unsignedShortValue](self, "unsignedShortValue");
LABEL_23:
          v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
          objc_exception_throw(v8);
        }
        result = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        break;
    }
  }
  return result;
}

- (uint64_t)longValue
{
  int v4;
  double v5;
  uint64_t result;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LODWORD(result) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return result;
      }
      if (v4 == 76)
        return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
      goto LABEL_25;
    }
    if (v4 != 66)
    {
      if (v4 == 67)
      {
        LODWORD(result) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return result;
      }
LABEL_25:
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
      objc_exception_throw(v8);
    }
LABEL_11:
    LODWORD(result) = -[NSNumber charValue](self, "charValue");
    return (int)result;
  }
  else
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (uint64_t)v5;
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
        goto LABEL_25;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (uint64_t)v7;
      case 'i':
        LODWORD(result) = -[NSNumber intValue](self, "intValue");
        return (int)result;
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        LODWORD(result) = -[NSNumber shortValue](self, "shortValue");
        return (int)result;
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
          {
            LODWORD(result) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
            return result;
          }
          goto LABEL_25;
        }
        result = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        break;
    }
  }
  return result;
}

- (unint64_t)unsignedLongValue
{
  int v4;
  double v5;
  unint64_t result;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LODWORD(result) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return result;
      }
      if (v4 == 76)
        return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
      goto LABEL_25;
    }
    if (v4 != 66)
    {
      if (v4 == 67)
      {
        LODWORD(result) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return result;
      }
LABEL_25:
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
      objc_exception_throw(v8);
    }
LABEL_11:
    LODWORD(result) = -[NSNumber charValue](self, "charValue");
    return (int)result;
  }
  else
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (unint64_t)v5;
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
        goto LABEL_25;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (unint64_t)v7;
      case 'i':
        LODWORD(result) = -[NSNumber intValue](self, "intValue");
        return (int)result;
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        LODWORD(result) = -[NSNumber shortValue](self, "shortValue");
        return (int)result;
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
          {
            LODWORD(result) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
            return result;
          }
          goto LABEL_25;
        }
        result = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        break;
    }
  }
  return result;
}

- (double)doubleValue
{
  int v4;
  double result;
  unint64_t v7;
  float v9;
  void *v11;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        return (double)-[NSNumber charValue](self, "charValue");
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return result;
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
        goto LABEL_27;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return v9;
      case 'i':
        return (double)-[NSNumber intValue](self, "intValue");
      case 'l':
        return (double)-[NSNumber longValue](self, "longValue");
      case 'q':
        return (double)-[NSNumber longLongValue](self, "longLongValue");
      case 's':
        return (double)-[NSNumber shortValue](self, "shortValue");
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
            return (double)-[NSNumber unsignedShortValue](self, "unsignedShortValue");
          goto LABEL_27;
        }
        v7 = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        break;
    }
    return (double)v7;
  }
  if (v4 > 72)
  {
    if (v4 == 73)
      return (double)-[NSNumber unsignedIntValue](self, "unsignedIntValue");
    if (v4 != 76)
      goto LABEL_27;
    return (double)-[NSNumber unsignedLongValue](self, "unsignedLongValue");
  }
  if (v4 != 66)
  {
    if (v4 == 67)
      return (double)-[NSNumber unsignedCharValue](self, "unsignedCharValue");
LABEL_27:
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
    objc_exception_throw(v11);
  }
  return (double)-[NSNumber charValue](self, "charValue");
}

- (float)floatValue
{
  int v4;
  double v5;
  float result;
  unint64_t v8;
  void *v11;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 > 80)
  {
    switch(v4)
    {
      case 'c':
        return (float)-[NSNumber charValue](self, "charValue");
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return v5;
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
        goto LABEL_27;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return result;
      case 'i':
        return (float)-[NSNumber intValue](self, "intValue");
      case 'l':
        return (float)-[NSNumber longValue](self, "longValue");
      case 'q':
        return (float)-[NSNumber longLongValue](self, "longLongValue");
      case 's':
        return (float)-[NSNumber shortValue](self, "shortValue");
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
            return (float)-[NSNumber unsignedShortValue](self, "unsignedShortValue");
          goto LABEL_27;
        }
        v8 = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        break;
    }
    return (float)v8;
  }
  if (v4 > 72)
  {
    if (v4 == 73)
      return (float)-[NSNumber unsignedIntValue](self, "unsignedIntValue");
    if (v4 != 76)
      goto LABEL_27;
    return (float)-[NSNumber unsignedLongValue](self, "unsignedLongValue");
  }
  if (v4 != 66)
  {
    if (v4 == 67)
      return (float)-[NSNumber unsignedCharValue](self, "unsignedCharValue");
LABEL_27:
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
    objc_exception_throw(v11);
  }
  return (float)-[NSNumber charValue](self, "charValue");
}

- (uint64_t)longLongValue
{
  int v4;
  double v5;
  uint64_t result;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LODWORD(result) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return result;
      }
      if (v4 == 76)
        return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
      goto LABEL_25;
    }
    if (v4 != 66)
    {
      if (v4 == 67)
      {
        LODWORD(result) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return result;
      }
LABEL_25:
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
      objc_exception_throw(v8);
    }
LABEL_11:
    LODWORD(result) = -[NSNumber charValue](self, "charValue");
    return (int)result;
  }
  else
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (uint64_t)v5;
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
        goto LABEL_25;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (uint64_t)v7;
      case 'i':
        LODWORD(result) = -[NSNumber intValue](self, "intValue");
        return (int)result;
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        LODWORD(result) = -[NSNumber shortValue](self, "shortValue");
        return (int)result;
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
          {
            LODWORD(result) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
            return result;
          }
          goto LABEL_25;
        }
        result = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        break;
    }
  }
  return result;
}

- (unint64_t)unsignedLongLongValue
{
  int v4;
  double v5;
  unint64_t result;
  float v7;
  void *v8;

  v4 = *-[NSValue objCType](self, "objCType");
  if (v4 <= 80)
  {
    if (v4 > 72)
    {
      if (v4 == 73)
      {
        LODWORD(result) = -[NSNumber unsignedIntValue](self, "unsignedIntValue");
        return result;
      }
      if (v4 == 76)
        return -[NSNumber unsignedLongValue](self, "unsignedLongValue");
      goto LABEL_25;
    }
    if (v4 != 66)
    {
      if (v4 == 67)
      {
        LODWORD(result) = -[NSNumber unsignedCharValue](self, "unsignedCharValue");
        return result;
      }
LABEL_25:
      v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), -[NSValue objCType](self, "objCType")), 0);
      objc_exception_throw(v8);
    }
LABEL_11:
    LODWORD(result) = -[NSNumber charValue](self, "charValue");
    return (int)result;
  }
  else
  {
    switch(v4)
    {
      case 'c':
        goto LABEL_11;
      case 'd':
        -[NSNumber doubleValue](self, "doubleValue");
        return (unint64_t)v5;
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
        goto LABEL_25;
      case 'f':
        -[NSNumber floatValue](self, "floatValue");
        return (unint64_t)v7;
      case 'i':
        LODWORD(result) = -[NSNumber intValue](self, "intValue");
        return (int)result;
      case 'l':
        return -[NSNumber longValue](self, "longValue");
      case 'q':
        return -[NSNumber longLongValue](self, "longLongValue");
      case 's':
        LODWORD(result) = -[NSNumber shortValue](self, "shortValue");
        return (int)result;
      default:
        if (v4 != 81)
        {
          if (v4 == 83)
          {
            LODWORD(result) = -[NSNumber unsignedShortValue](self, "unsignedShortValue");
            return result;
          }
          goto LABEL_25;
        }
        result = -[NSNumber unsignedLongLongValue](self, "unsignedLongLongValue");
        break;
    }
  }
  return result;
}

- (NSNumber)initWithCoder:(NSCoder *)coder
{
  BOOL v5;
  uint64_t v6;
  id v8;

  -[NSNumber zone](self, "zone");
  v5 = -[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding");

  if (!v5)
    return (NSNumber *)newDecodedNumber(coder);
  v6 = objc_opt_class();
  if (v6 == objc_opt_self() || -[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NS.number")))
  {
    v8 = (id)-[NSCoder _decodePropertyListForKey:](coder, "_decodePropertyListForKey:", CFSTR("NS.number"));
    if ((_NSIsNSNumber() & 1) != 0)
    {
      return (NSNumber *)v8;
    }
    else
    {
      -[NSCoder failWithError:](coder, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Decoded object is not a number")));

      return 0;
    }
  }
  else if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NS.BOOLval")))
  {
    return (NSNumber *)-[NSPlaceholderNumber initWithBool:](&__placeholderNumber, "initWithBool:", -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("NS.BOOLval")));
  }
  else if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NS.intval")))
  {
    return (NSNumber *)-[NSPlaceholderNumber initWithLongLong:](&__placeholderNumber, "initWithLongLong:", -[NSCoder decodeInt64ForKey:](coder, "decodeInt64ForKey:", CFSTR("NS.intval")));
  }
  else
  {
    if (!-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NS.dblval")))
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("*** -[NSNumber initWithCoder:]: unknown number type"), 0));
    -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NS.dblval"));
    return (NSNumber *)-[NSPlaceholderNumber initWithDouble:](&__placeholderNumber, "initWithDouble:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  CFTypeID TypeID;
  _BOOL8 v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  unsigned int v11;
  NSUInteger v12;
  void *v13;
  NSString *v14;
  const char *v15;
  NSUInteger sizep[129];

  sizep[128] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v7 = -[NSValue objCType](self, "objCType");
    v8 = v7;
    v15 = v7;
    v9 = *(unsigned __int8 *)v7;
    if (*v7 && !v7[1])
    {
      if (v9 == 76)
      {
        v8 = "Q";
        goto LABEL_16;
      }
      if (v9 == 108)
      {
        v8 = "q";
LABEL_16:
        v15 = v8;
      }
    }
    sizep[0] = 0;
    NSGetSizeAndAlignment(v8, sizep, 0);
    v12 = sizep[0];
    if (sizep[0] < 0x401)
      v13 = sizep;
    else
      v13 = malloc_type_malloc(sizep[0], 0xE5CB23FuLL);
    if (*v8 == 94 && v8[1] == 118)
    {
      v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot encode (void *) value: %@"), self);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
    }
    -[NSValue getValue:](self, "getValue:", v13);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "*", &v15);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", v15, v13);
    if (v12 > 0x400)
      free(v13);
    return;
  }
  if (object_getClass(a3) == (Class)NSKeyedArchiver)
  {
    objc_msgSend(a3, "_encodePropertyList:forKey:", self, CFSTR("NS.number"));
  }
  else
  {
    TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(self))
    {
      v6 = CFBooleanGetValue((CFBooleanRef)self) != 0;
LABEL_5:
      objc_msgSend(a3, "encodeBool:forKey:", v6, CFSTR("NS.BOOLval"));
      return;
    }
    v10 = -[NSValue objCType](self, "objCType");
    v11 = *v10 - 66;
    if (v11 <= 0x31)
    {
      if (((1 << v11) & 0x2848200028482) != 0)
      {
        objc_msgSend(a3, "encodeInt64:forKey:", -[NSNumber longLongValue](self, "longLongValue"), CFSTR("NS.intval"));
      }
      else if (((1 << v11) & 0x1400000000) != 0)
      {
        -[NSNumber doubleValue](self, "doubleValue");
        objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NS.dblval"));
      }
      else if (*v10 == 66)
      {
        v6 = -[NSNumber BOOLValue](self, "BOOLValue");
        goto LABEL_5;
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  NSUInteger v6;
  unsigned __int8 *v7;
  double v8;
  NSPlaceholderNumber *v9;
  void *v11;
  NSUInteger sizep[129];

  sizep[128] = *MEMORY[0x1E0C80C00];
  v5 = -[NSValue objCType](self, "objCType", a3);
  sizep[0] = 0;
  NSGetSizeAndAlignment(v5, sizep, 0);
  v6 = sizep[0];
  if (sizep[0] < 0x401)
    v7 = (unsigned __int8 *)sizep;
  else
    v7 = (unsigned __int8 *)malloc_type_malloc(sizep[0], 0x42743BDFuLL);
  -[NSValue getValue:](self, "getValue:", v7);
  v9 = newNumber(*v5, v7, v8);
  if (!v9)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: bad objCType: \"%s\"), _NSMethodExceptionProem((objc_class *)self, a2), v5), 0);
    objc_exception_throw(v11);
  }
  if (v6 >= 0x401)
    free(v7);
  return v9;
}

- (NSNumber)initWithChar:(char)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithUnsignedChar:(unsigned __int8)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithShort:(__int16)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithUnsignedShort:(unsigned __int16)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithInt:(int)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithUnsignedInt:(unsigned int)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithInteger:(NSInteger)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithUnsignedInteger:(NSUInteger)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithLong:(uint64_t)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithUnsignedLong:(unint64_t)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithLongLong:(uint64_t)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithUnsignedLongLong:(unint64_t)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithFloat:(float)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithDouble:(double)value
{
  _NSRequestConcreteObject((int)self, a2);
}

- (NSNumber)initWithBool:(BOOL)value
{
  _NSRequestConcreteObject((int)self, a2);
}

@end
