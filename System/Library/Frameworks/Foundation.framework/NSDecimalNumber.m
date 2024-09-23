@implementation NSDecimalNumber

- (BOOL)_getCString:(char *)a3 length:(int)a4 multiplier:(double)a5
{
  NSDecimalNumber *v8;

  if (a5 != 1.0)
  {
    v8 = -[NSNumber initWithDouble:]([NSDecimalNumber alloc], "initWithDouble:", a5);
    self = -[NSDecimalNumber decimalNumberByMultiplyingBy:](self, "decimalNumberByMultiplyingBy:", v8);

  }
  return objc_msgSend(-[NSDecimalNumber description](self, "description"), "getCString:maxLength:encoding:", a3, a4, 1);
}

- (NSString)descriptionWithLocale:(id)locale
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = 0;
  LODWORD(v7) = 0;
  if (self)
    -[NSDecimalNumber decimalValue](self, "decimalValue", v5, v6, v7, v8);
  return NSDecimalString((const NSDecimal *)&v5, locale);
}

- (id)description
{
  return -[NSDecimalNumber descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

+ (NSDecimalNumber)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
    return (NSDecimalNumber *)&_cachedPlaceholder;
  else
    return (NSDecimalNumber *)NSAllocateObject((Class)a1, 0, a3);
}

- (float)floatValue
{
  double v2;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  return v2;
}

- (double)doubleValue
{
  double v2;
  uint64_t v3;
  double result;
  uint64_t v5;
  uint64_t v6;

  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    v3 = 2 * (*((_BYTE *)self + 9) & 0xF);
    result = 0.0;
    do
    {
      LOWORD(v2) = *(_WORD *)((char *)self + v3 + 10);
      v2 = (double)*(unint64_t *)&v2;
      result = v2 + result * 65536.0;
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    result = 0.0;
    if ((*((_BYTE *)self + 9) & 0x10) != 0)
      return NAN;
  }
  v5 = *((char *)self + 8);
  if ((v5 & 0x80000000) != 0)
  {
    v6 = -(int)v5;
    do
    {
      result = result / 10.0;
      --v6;
    }
    while (v6);
  }
  else if (*((_BYTE *)self + 8))
  {
    do
    {
      result = result * 10.0;
      --v5;
    }
    while (v5);
  }
  if ((*((_BYTE *)self + 9) & 0x10) != 0)
    return -result;
  return result;
}

- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber
{
  return -[NSDecimalNumber decimalNumberByDividingBy:withBehavior:](self, "decimalNumberByDividingBy:withBehavior:", decimalNumber, objc_msgSend((id)objc_opt_self(), "defaultBehavior"));
}

+ (id)defaultBehavior
{
  id result;

  result = (id)-[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("NSDecimalNumberBehaviors"));
  if (!result)
    return +[NSDecimalNumberHandler defaultDecimalNumberHandler](NSDecimalNumberHandler, "defaultDecimalNumberHandler");
  return result;
}

- (NSDecimal)decimalValue
{
  NSDecimal *result;

  *(_QWORD *)retstr = 0;
  *(_QWORD *)&retstr->_mantissa[2] = 0;
  *(_DWORD *)&retstr->_mantissa[6] = 0;
  NSDecimalCopy(retstr, (const NSDecimal *)((char *)self + 8));
  return result;
}

+ (NSDecimalNumber)decimalNumberWithDecimal:(NSDecimal *)dcm
{
  NSDecimal v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4 = *dcm;
  return (NSDecimalNumber *)-[NSDecimalNumberPlaceholder initWithDecimal:](&_cachedPlaceholder, "initWithDecimal:", &v4);
}

+ (NSDecimalNumber)zero
{
  return (NSDecimalNumber *)&zero__zero;
}

+ (void)initialize
{
  if (NSDecimalNumber == a1)
    objc_opt_class();
}

- (const)objCType
{
  return "d";
}

+ (NSDecimalNumber)notANumber
{
  NSDecimalNumber *result;
  objc_class *v3;

  result = (NSDecimalNumber *)notANumber_n;
  if (!notANumber_n)
  {
    v3 = (objc_class *)objc_opt_self();
    result = (NSDecimalNumber *)NSAllocateObject(v3, 0, 0);
    notANumber_n = (uint64_t)result;
    *((_BYTE *)result + 9) &= 0xF0u;
    *((_BYTE *)result + 9) |= 0x10u;
  }
  return result;
}

+ (NSDecimalNumber)one
{
  return (NSDecimalNumber *)&one__one;
}

- (unint64_t)unsignedLongValue
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    v2 = 0;
    v3 = 2 * (*((_BYTE *)self + 9) & 0xF);
    do
    {
      v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (v2 << 16);
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    v2 = 9;
    if ((*((_BYTE *)self + 9) & 0x10) != 0)
      return v2;
    v2 = 0;
  }
  v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = -(int)v4;
    do
    {
      v2 /= 0xAuLL;
      --v5;
    }
    while (v5);
  }
  else if (*((_BYTE *)self + 8))
  {
    do
    {
      v2 *= 10;
      --v4;
    }
    while (v4);
  }
  if ((*((_BYTE *)self + 9) & 0x10) != 0)
    return -(uint64_t)v2;
  return v2;
}

- (NSDecimalNumber)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  int v8;
  NSRoundingMode v9;
  NSCalculationError v10;
  NSDecimal v12;
  NSDecimal rightOperand;
  NSDecimal leftOperand;
  NSDecimal result;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&result, 0, sizeof(result));
  v8 = objc_msgSend(behavior, "scale");
  v9 = objc_msgSend(behavior, "roundingMode");
  memset(&leftOperand, 0, sizeof(leftOperand));
  if (self)
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  memset(&rightOperand, 0, sizeof(rightOperand));
  if (decimalNumber)
    -[NSDecimalNumber decimalValue](decimalNumber, "decimalValue");
  v10 = NSDecimalDivide(&result, &leftOperand, &rightOperand, v9);
  v12 = result;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, (uint64_t)decimalNumber, v8, v9, &v12, behavior);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD v5[2];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (NSShouldRetainWithZone(self, a3))
    return self;
  if (self)
  {
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  }
  else
  {
    v5[0] = 0;
    v5[1] = 0;
    v6 = 0;
  }
  return -[NSDecimalNumberPlaceholder initWithDecimal:](&_cachedPlaceholder, "initWithDecimal:", v5);
}

+ (NSDecimalNumber)decimalNumberWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag
{
  return (NSDecimalNumber *)-[NSDecimalNumberPlaceholder initWithMantissa:exponent:isNegative:](&_cachedPlaceholder, "initWithMantissa:exponent:isNegative:", mantissa, exponent, flag);
}

+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue
{
  return (NSDecimalNumber *)-[NSDecimalNumberPlaceholder initWithString:](&_cachedPlaceholder, "initWithString:", numberValue);
}

+ (NSDecimalNumber)decimalNumberWithString:(NSString *)numberValue locale:(id)locale
{
  return (NSDecimalNumber *)-[NSDecimalNumberPlaceholder initWithString:locale:](&_cachedPlaceholder, "initWithString:locale:", numberValue, locale);
}

- (NSDecimalNumber)initWithMantissa:(unint64_t)mantissa exponent:(__int16)exponent isNegative:(BOOL)flag
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Did you forget to nest alloc and initWithMantissa:exponent:isNegative ?"), 0));
}

- (NSDecimalNumber)initWithDecimal:(NSDecimal *)dcm
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Did you forget to nest alloc and initWithDecimal: ?"), 0));
}

- (NSDecimalNumber)initWithString:(NSString *)numberValue
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Did you forget to nest alloc and initWithString: ?"), 0));
}

- (NSDecimalNumber)initWithString:(NSString *)numberValue locale:(id)locale
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Did you forget to nest alloc and initWithString:locale: ?"), 0));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumber)initWithCoder:(id)a3
{

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Did you forget to nest alloc and initWithCoder: ?"), 0));
}

+ (NSDecimalNumber)minimumDecimalNumber
{
  return (NSDecimalNumber *)&minimumDecimalNumber__minimumDecimalNumber;
}

+ (NSDecimalNumber)maximumDecimalNumber
{
  return (NSDecimalNumber *)&maximumDecimalNumber__maximumDecimalNumber;
}

- (NSComparisonResult)compare:(NSNumber *)decimalNumber
{
  NSComparisonResult v6;
  NSDecimal rightOperand;
  NSDecimal leftOperand;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self == (NSDecimalNumber *)decimalNumber)
    return 0;
  if (!decimalNumber)
    return 1;
  objc_opt_self();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    memset(&leftOperand, 0, sizeof(leftOperand));
    if (self)
      -[NSDecimalNumber decimalValue](self, "decimalValue");
    memset(&rightOperand, 0, sizeof(rightOperand));
    -[NSNumber decimalValue](decimalNumber, "decimalValue");
    return NSDecimalCompare(&leftOperand, &rightOperand);
  }
  else
  {
    v6 = -[NSNumber compare:](decimalNumber, "compare:", self);
    if (v6 == NSOrderedDescending)
      return -1;
    else
      return (unint64_t)(v6 == NSOrderedAscending);
  }
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = _NSIsNSNumber();
    if (v5)
      LOBYTE(v5) = -[NSDecimalNumber compare:](self, "compare:", a3) == NSOrderedSame;
  }
  return v5;
}

- (void)getValue:(void *)a3
{
  uint64_t v4;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  *(_QWORD *)a3 = v4;
}

- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber
{
  return -[NSDecimalNumber decimalNumberByAdding:withBehavior:](self, "decimalNumberByAdding:withBehavior:", decimalNumber, objc_msgSend((id)objc_opt_self(), "defaultBehavior"));
}

- (NSDecimalNumber)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  int v8;
  NSRoundingMode v9;
  NSCalculationError v10;
  NSDecimal v12;
  NSDecimal rightOperand;
  NSDecimal leftOperand;
  NSDecimal result;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&result, 0, sizeof(result));
  v8 = objc_msgSend(behavior, "scale");
  v9 = objc_msgSend(behavior, "roundingMode");
  memset(&leftOperand, 0, sizeof(leftOperand));
  if (self)
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  memset(&rightOperand, 0, sizeof(rightOperand));
  if (decimalNumber)
    -[NSDecimalNumber decimalValue](decimalNumber, "decimalValue");
  v10 = NSDecimalAdd(&result, &leftOperand, &rightOperand, v9);
  v12 = result;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, (uint64_t)decimalNumber, v8, v9, &v12, behavior);
}

- (id)decimalNumberBySubstracting:(id)a3
{
  return -[NSDecimalNumber decimalNumberBySubtracting:withBehavior:](self, "decimalNumberBySubtracting:withBehavior:", a3, +[NSDecimalNumber defaultBehavior](NSDecimalNumber, "defaultBehavior"));
}

- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber
{
  return -[NSDecimalNumber decimalNumberBySubtracting:withBehavior:](self, "decimalNumberBySubtracting:withBehavior:", decimalNumber, objc_msgSend((id)objc_opt_self(), "defaultBehavior"));
}

- (NSDecimalNumber)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  int v8;
  NSRoundingMode v9;
  NSCalculationError v10;
  NSDecimal v12;
  NSDecimal rightOperand;
  NSDecimal leftOperand;
  NSDecimal result;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&result, 0, sizeof(result));
  v8 = objc_msgSend(behavior, "scale");
  v9 = objc_msgSend(behavior, "roundingMode");
  memset(&leftOperand, 0, sizeof(leftOperand));
  if (self)
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  memset(&rightOperand, 0, sizeof(rightOperand));
  if (decimalNumber)
    -[NSDecimalNumber decimalValue](decimalNumber, "decimalValue");
  v10 = NSDecimalSubtract(&result, &leftOperand, &rightOperand, v9);
  v12 = result;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, (uint64_t)decimalNumber, v8, v9, &v12, behavior);
}

- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber
{
  return -[NSDecimalNumber decimalNumberByMultiplyingBy:withBehavior:](self, "decimalNumberByMultiplyingBy:withBehavior:", decimalNumber, objc_msgSend((id)objc_opt_self(), "defaultBehavior"));
}

- (NSDecimalNumber)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber withBehavior:(id)behavior
{
  int v8;
  NSRoundingMode v9;
  NSCalculationError v10;
  NSDecimal v12;
  NSDecimal rightOperand;
  NSDecimal leftOperand;
  NSDecimal result;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&result, 0, sizeof(result));
  v8 = objc_msgSend(behavior, "scale");
  v9 = objc_msgSend(behavior, "roundingMode");
  memset(&leftOperand, 0, sizeof(leftOperand));
  if (self)
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  memset(&rightOperand, 0, sizeof(rightOperand));
  if (decimalNumber)
    -[NSDecimalNumber decimalValue](decimalNumber, "decimalValue");
  v10 = NSDecimalMultiply(&result, &leftOperand, &rightOperand, v9);
  v12 = result;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, (uint64_t)decimalNumber, v8, v9, &v12, behavior);
}

- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power
{
  return -[NSDecimalNumber decimalNumberByRaisingToPower:withBehavior:](self, "decimalNumberByRaisingToPower:withBehavior:", power, objc_msgSend((id)objc_opt_self(), "defaultBehavior"));
}

- (NSDecimalNumber)decimalNumberByRaisingToPower:(NSUInteger)power withBehavior:(id)behavior
{
  int v8;
  NSRoundingMode v9;
  NSCalculationError v10;
  NSDecimal v12;
  NSDecimal number;
  NSDecimal result;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(&result, 0, sizeof(result));
  v8 = objc_msgSend(behavior, "scale");
  v9 = objc_msgSend(behavior, "roundingMode");
  memset(&number, 0, sizeof(number));
  if (self)
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  v10 = NSDecimalPower(&result, &number, power, v9);
  v12 = result;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, 0, v8, v9, &v12, behavior);
}

- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power
{
  return -[NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:withBehavior:](self, "decimalNumberByMultiplyingByPowerOf10:withBehavior:", power, objc_msgSend((id)objc_opt_self(), "defaultBehavior"));
}

- (NSDecimalNumber)decimalNumberByMultiplyingByPowerOf10:(__int16)power withBehavior:(id)behavior
{
  int v8;
  NSRoundingMode v9;
  NSCalculationError v10;
  NSDecimal v12;
  NSDecimal number;
  NSDecimal result;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  memset(&result, 0, sizeof(result));
  v8 = objc_msgSend(behavior, "scale");
  v9 = objc_msgSend(behavior, "roundingMode");
  memset(&number, 0, sizeof(number));
  if (self)
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  v10 = NSDecimalMultiplyByPowerOf10(&result, &number, power, v9);
  v12 = result;
  return (NSDecimalNumber *)_checkErrorAndRound(v10, (uint64_t)a2, (uint64_t)self, 0, v8, v9, &v12, behavior);
}

- (NSDecimalNumber)decimalNumberByRoundingAccordingToBehavior:(id)behavior
{
  int v5;
  int v7;
  void *v8;
  NSDecimal v9;
  NSDecimal number;
  NSDecimal result;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(behavior, "scale");
  if (v5 == 0x7FFF)
    return self;
  v7 = v5;
  memset(&result, 0, sizeof(result));
  memset(&number, 0, sizeof(number));
  if (self)
    -[NSDecimalNumber decimalValue](self, "decimalValue");
  NSDecimalRound(&result, &number, v7, (NSRoundingMode)objc_msgSend(behavior, "roundingMode"));
  v8 = (void *)objc_opt_self();
  v9 = result;
  return (NSDecimalNumber *)objc_msgSend(v8, "decimalNumberWithDecimal:", &v9);
}

+ (void)setDefaultBehavior:(id)defaultBehavior
{
  -[NSMutableDictionary setObject:forKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "setObject:forKey:", defaultBehavior, CFSTR("NSDecimalNumberBehaviors"));
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  __int16 v8;
  uint64_t v9;
  _QWORD v10[2];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v10[1] = 0;
  v11 = 0;
  if (!self)
  {
    v4 = 0;
    goto LABEL_5;
  }
  -[NSDecimalNumber decimalValue](self, "decimalValue");
  v4 = (LODWORD(v10[0]) >> 8) & 0xF;
  if (v4 <= 7)
LABEL_5:
    bzero((char *)v10 + 2 * v4 + 4, 16 - 2 * v4);
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(a3, "encodeInt32:forKey:", SLOBYTE(v10[0]), CFSTR("NS.exponent"));
    objc_msgSend(a3, "encodeInt32:forKey:", (LODWORD(v10[0]) >> 8) & 0xF, CFSTR("NS.length"));
    objc_msgSend(a3, "encodeBool:forKey:", (LODWORD(v10[0]) >> 12) & 1, CFSTR("NS.negative"));
    objc_msgSend(a3, "encodeBool:forKey:", (LODWORD(v10[0]) >> 13) & 1, CFSTR("NS.compact"));
    objc_msgSend(a3, "encodeInt32:forKey:", 1, CFSTR("NS.mantissa.bo"));
    objc_msgSend(a3, "encodeBytes:length:forKey:", (char *)v10 + 4, 16, CFSTR("NS.mantissa"));
  }
  else
  {
    v9 = SLOBYTE(v10[0]);
    v8 = (LODWORD(v10[0]) >> 8) & 0xF;
    v7 = (v10[0] & 0x1000) != 0;
    v6 = (v10[0] & 0x2000) != 0;
    v5 = 8;
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v9);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "S", &v8);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "C", &v7);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "C", &v6);
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "I", &v5);
    objc_msgSend(a3, "encodeArrayOfObjCType:count:at:", "S", v5, (char *)v10 + 4);
  }
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (char)charValue
{
  double v2;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  return (int)v2;
}

- (unsigned)unsignedCharValue
{
  double v2;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  return (int)v2;
}

- (signed)shortValue
{
  double v2;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  return (int)v2;
}

- (unsigned)unsignedShortValue
{
  double v2;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  return (int)v2;
}

- (int)intValue
{
  double v2;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  return (int)v2;
}

- (unsigned)unsignedIntValue
{
  double v2;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  return v2;
}

- (int64_t)longValue
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    v2 = 0;
    v3 = 2 * (*((_BYTE *)self + 9) & 0xF);
    do
    {
      v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (unint64_t)(v2 << 16);
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    v2 = 9;
    if ((*((_BYTE *)self + 9) & 0x10) != 0)
      return v2;
    v2 = 0;
  }
  v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = -(int)v4;
    do
    {
      v2 /= 10;
      --v5;
    }
    while (v5);
  }
  else if (*((_BYTE *)self + 8))
  {
    do
    {
      v2 *= 10;
      --v4;
    }
    while (v4);
  }
  if ((*((_BYTE *)self + 9) & 0x10) != 0)
    return -v2;
  return v2;
}

- (int64_t)longLongValue
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    v2 = 0;
    v3 = 2 * (*((_BYTE *)self + 9) & 0xF);
    do
    {
      v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (unint64_t)(v2 << 16);
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    v2 = 9;
    if ((*((_BYTE *)self + 9) & 0x10) != 0)
      return v2;
    v2 = 0;
  }
  v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = -(int)v4;
    do
    {
      v2 /= 10;
      --v5;
    }
    while (v5);
  }
  else if (*((_BYTE *)self + 8))
  {
    do
    {
      v2 *= 10;
      --v4;
    }
    while (v4);
  }
  if ((*((_BYTE *)self + 9) & 0x10) != 0)
    return -v2;
  return v2;
}

- (unint64_t)unsignedLongLongValue
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*((_BYTE *)self + 9) & 0xF) != 0)
  {
    v2 = 0;
    v3 = 2 * (*((_BYTE *)self + 9) & 0xF);
    do
    {
      v2 = *(unsigned __int16 *)((char *)self + v3 + 10) | (v2 << 16);
      v3 -= 2;
    }
    while (v3);
  }
  else
  {
    v2 = 9;
    if ((*((_BYTE *)self + 9) & 0x10) != 0)
      return v2;
    v2 = 0;
  }
  v4 = *((char *)self + 8);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = -(int)v4;
    do
    {
      v2 /= 0xAuLL;
      --v5;
    }
    while (v5);
  }
  else if (*((_BYTE *)self + 8))
  {
    do
    {
      v2 *= 10;
      --v4;
    }
    while (v4);
  }
  if ((*((_BYTE *)self + 9) & 0x10) != 0)
    return -(uint64_t)v2;
  return v2;
}

- (BOOL)BOOLValue
{
  double v2;

  -[NSDecimalNumber doubleValue](self, "doubleValue");
  return v2 != 0.0;
}

+ (NSDecimalNumber)numberWithChar:(char)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithChar:", a3);
}

+ (NSDecimalNumber)numberWithUnsignedChar:(unsigned __int8)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithUnsignedChar:", a3);
}

+ (NSDecimalNumber)numberWithShort:(signed __int16)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithShort:", a3);
}

+ (NSDecimalNumber)numberWithUnsignedShort:(unsigned __int16)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithUnsignedShort:", a3);
}

+ (NSDecimalNumber)numberWithInt:(int)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithInt:", *(_QWORD *)&a3);
}

+ (NSDecimalNumber)numberWithInteger:(int64_t)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithInteger:", a3);
}

+ (NSDecimalNumber)numberWithUnsignedInt:(unsigned int)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithUnsignedInt:", *(_QWORD *)&a3);
}

+ (NSDecimalNumber)numberWithUnsignedInteger:(unint64_t)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithUnsignedInteger:", a3);
}

+ (NSDecimalNumber)numberWithLong:(int64_t)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithLong:", a3);
}

+ (NSDecimalNumber)numberWithUnsignedLong:(unint64_t)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithUnsignedLong:", a3);
}

+ (NSDecimalNumber)numberWithLongLong:(int64_t)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithLongLong:", a3);
}

+ (NSDecimalNumber)numberWithUnsignedLongLong:(unint64_t)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithUnsignedLongLong:", a3);
}

+ (NSDecimalNumber)numberWithFloat:(float)a3
{
  id v4;
  double v5;

  v4 = objc_allocWithZone((Class)NSDecimalNumber);
  *(float *)&v5 = a3;
  return (NSDecimalNumber *)(id)objc_msgSend(v4, "initWithFloat:", v5);
}

+ (NSDecimalNumber)numberWithDouble:(double)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithDouble:", a3);
}

+ (NSDecimalNumber)numberWithBool:(BOOL)a3
{
  return (NSDecimalNumber *)(id)objc_msgSend(objc_allocWithZone((Class)NSDecimalNumber), "initWithBool:", a3);
}

@end
