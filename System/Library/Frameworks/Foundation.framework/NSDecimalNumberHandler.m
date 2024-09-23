@implementation NSDecimalNumberHandler

+ (NSDecimalNumberHandler)defaultDecimalNumberHandler
{
  NSDecimalNumberHandler *result;

  result = (NSDecimalNumberHandler *)defaultDecimalNumberHandler_b;
  if (!defaultDecimalNumberHandler_b)
  {
    result = (NSDecimalNumberHandler *)objc_msgSend(objc_allocWithZone((Class)a1), "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 0x7FFFLL, 0, 1, 1, 1);
    defaultDecimalNumberHandler_b = (uint64_t)result;
  }
  return result;
}

- (NSDecimalNumberHandler)initWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  char v13;
  NSDecimalNumberHandler *result;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  objc_super v20;
  uint64_t v21;

  v8 = divideByZero;
  v9 = underflow;
  v10 = overflow;
  v11 = exact;
  v13 = roundingMode;
  v21 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NSDecimalNumberHandler;
  result = -[NSDecimalNumberHandler init](&v20, sel_init);
  v15 = *((_BYTE *)result + 10) & 0x80;
  *((_WORD *)result + 4) = scale;
  if (v11)
    v16 = 8;
  else
    v16 = 0;
  if (v10)
    v17 = 16;
  else
    v17 = 0;
  if (v9)
    v18 = 32;
  else
    v18 = 0;
  if (v8)
    v19 = 64;
  else
    v19 = 0;
  *((_BYTE *)result + 10) = v16 & 0xF8 | v13 & 7 | v17 | v18 | v19 | v15;
  return result;
}

- (signed)scale
{
  return *((_WORD *)self + 4);
}

- (unint64_t)roundingMode
{
  return *((_BYTE *)self + 10) & 7;
}

+ (NSDecimalNumberHandler)decimalNumberHandlerWithRoundingMode:(NSRoundingMode)roundingMode scale:(__int16)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero
{
  return (NSDecimalNumberHandler *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", roundingMode, scale, exact, overflow, underflow, divideByZero);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  char v6;

  if (!objc_msgSend(a3, "allowsKeyedCoding"))
    return;
  if ((*((_BYTE *)self + 10) & 7) != 0)
    objc_msgSend(a3, "encodeInteger:forKey:");
  v5 = *((__int16 *)self + 4);
  if (v5 != 0x7FFF)
    objc_msgSend(a3, "encodeInteger:forKey:", v5, CFSTR("NS.scale"));
  v6 = *((_BYTE *)self + 10);
  if ((v6 & 8) == 0)
  {
    if ((*((_BYTE *)self + 10) & 0x10) == 0)
      goto LABEL_8;
LABEL_12:
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.raise.overflow"));
    v6 = *((_BYTE *)self + 10);
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 0x40) == 0)
        return;
LABEL_14:
      objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.raise.dividebyzero"));
      return;
    }
    goto LABEL_13;
  }
  objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.raise.exactness"));
  v6 = *((_BYTE *)self + 10);
  if ((v6 & 0x10) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v6 & 0x20) == 0)
    goto LABEL_9;
LABEL_13:
  objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NS.raise.underflow"));
  if ((*((_BYTE *)self + 10) & 0x40) != 0)
    goto LABEL_14;
}

- (NSDecimalNumberHandler)initWithCoder:(id)a3
{
  uint64_t v5;
  __int16 v6;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.roundingmode"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.scale")))
      v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NS.scale"));
    else
      v6 = 0x7FFF;
    return -[NSDecimalNumberHandler initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:](self, "initWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", v5, v6, objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.raise.exactness")), objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.raise.overflow")), objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.raise.underflow")), objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.raise.dividebyzero")));
  }
  else
  {

    return 0;
  }
}

- (id)exceptionDuringOperation:(SEL)a3 error:(unint64_t)a4 leftOperand:(id)a5 rightOperand:(id)a6
{
  void *v6;
  const __CFString *v7;
  const __CFString *v8;

  switch(a4)
  {
    case 1uLL:
      if ((*((_BYTE *)self + 10) & 8) == 0)
        return 0;
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = CFSTR("NSDecimalNumberExactnessException");
      v8 = CFSTR("NSDecimalNumber exactness exception");
      break;
    case 2uLL:
      if ((*((_BYTE *)self + 10) & 0x20) == 0)
        return 0;
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = CFSTR("NSDecimalNumberUnderflowException");
      v8 = CFSTR("NSDecimalNumber underflow exception");
      break;
    case 3uLL:
      if ((*((_BYTE *)self + 10) & 0x10) == 0)
        return 0;
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = CFSTR("NSDecimalNumberOverflowException");
      v8 = CFSTR("NSDecimalNumber overflow exception");
      break;
    case 4uLL:
      if ((*((_BYTE *)self + 10) & 0x40) == 0)
        return 0;
      v6 = (void *)MEMORY[0x1E0C99DA0];
      v7 = CFSTR("NSDecimalNumberDivideByZeroException");
      v8 = CFSTR("NSDecimalNumber divide by zero exception");
      break;
    default:
      return 0;
  }
  objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0, a6));
}

@end
