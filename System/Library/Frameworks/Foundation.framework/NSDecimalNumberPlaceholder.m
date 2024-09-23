@implementation NSDecimalNumberPlaceholder

- (NSDecimalNumberPlaceholder)initWithString:(id)a3
{
  return -[NSDecimalNumberPlaceholder initWithString:locale:](self, "initWithString:locale:", a3, 0);
}

- (NSDecimalNumberPlaceholder)initWithString:(id)a3 locale:(id)a4
{
  void *v6;
  void *v7;
  NSDecimalNumberPlaceholder *v8;
  NSDecimalNumberPlaceholder *v9;
  __int128 v11;
  int v12;
  __int128 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_allocWithZone((Class)NSScanner), "initWithString:", a3);
  v7 = v6;
  v13 = 0uLL;
  v14 = 0;
  if (a4)
    objc_msgSend(v6, "setLocale:", a4);
  if (objc_msgSend(v7, "scanDecimal:", &v13))
  {
    v11 = v13;
    v12 = v14;
    v8 = -[NSDecimalNumberPlaceholder initWithDecimal:](self, "initWithDecimal:", &v11);
  }
  else
  {
    v8 = -[NSDecimalNumberPlaceholder init](self, "init");
  }
  v9 = v8;

  return v9;
}

- (NSDecimalNumberPlaceholder)initWithDecimal:(id *)a3
{
  objc_class *v4;
  char *v5;

  NSDecimalCompact((NSDecimal *)a3);
  v4 = (objc_class *)objc_opt_self();
  v5 = (char *)NSAllocateObject(v4, ((unint64_t)*(_DWORD *)a3 >> 7) & 0x1E, 0);
  NSDecimalCopy((NSDecimal *)(v5 + 8), (const NSDecimal *)a3);
  return (NSDecimalNumberPlaceholder *)v5;
}

- (NSDecimalNumberPlaceholder)initWithMantissa:(unint64_t)a3 exponent:(signed __int16)a4 isNegative:(BOOL)a5
{
  int v5;
  unint64_t v6;
  int v7;
  __int128 v9;
  int v10;
  _BYTE v11[20];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&v11[4] = 0uLL;
  v5 = 0;
  if (a3)
  {
    v6 = 0;
    do
    {
      *(_WORD *)&v11[2 * v6 + 4] = a3;
      v5 += 256;
      if (v6 > 6)
        break;
      a3 >>= 16;
      ++v6;
    }
    while (a3);
  }
  if (a5)
    v7 = 4096;
  else
    v7 = 0;
  *(_DWORD *)v11 = v7 & 0xFFFFFF00 | a4 | v5;
  v9 = *(_OWORD *)v11;
  v10 = *(_DWORD *)&v11[16];
  return -[NSDecimalNumberPlaceholder initWithDecimal:](self, "initWithDecimal:", &v9);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return &_cachedPlaceholder;
}

- (unint64_t)retainCount
{
  return -1;
}

- (NSDecimalNumberPlaceholder)init
{

  return (NSDecimalNumberPlaceholder *)-[NSDecimalNumber copyWithZone:](+[NSDecimalNumber notANumber](NSDecimalNumber, "notANumber"), "copyWithZone:", 0);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDecimalNumberPlaceholder)initWithCoder:(id)a3
{
  unsigned __int8 v5;
  char v6;
  char v7;
  int v8;
  int v9;
  __int32 v10;
  int8x16_t *v11;
  int32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  __int128 *v15;
  unsigned int v16;
  NSString *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  unsigned int v22;
  int v23;
  int v24;
  __int128 v25;
  int v26;
  _BYTE v27[20];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    *(_OWORD *)&v27[4] = 0uLL;
    v23 = 0;
    v24 = 0;
    v22 = 0;
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v24, 4);
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "S", (char *)&v23 + 2, 2);
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "C", (char *)&v23 + 1, 1);
    objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "C", &v23, 1);
    v16 = (BYTE2(v23) & 0xF) << 8;
    if (v16 < 0x801)
    {
      *(_DWORD *)v27 = v24 | v16 | ((BYTE1(v23) != 0) << 12) | (((_BYTE)v23 != 0) << 13);
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "I", &v22, 4);
      if (v22 < 9)
      {
        objc_msgSend(a3, "decodeArrayOfObjCType:count:at:", "S");
        v25 = *(_OWORD *)v27;
        v26 = *(_DWORD *)&v27[16];
        v15 = &v25;
        return -[NSDecimalNumberPlaceholder initWithDecimal:](self, "initWithDecimal:", v15);
      }
    }
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: critical NSDecimalNumber archived data is wrong size"), self);

    v20 = (void *)MEMORY[0x1E0C99DA0];
    v21 = v19;
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v20, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v21, 0));
  }
  *(_QWORD *)&v25 = 0;
  v5 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.exponent"));
  v6 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.length"));
  if ((v6 & 0xFu) >= 9
    || ((v7 = v6, !objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.negative"))) ? (v8 = 0) : (v8 = 4096),
        !objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NS.compact")) ? (v9 = 0) : (v9 = 0x2000),
        v10 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NS.mantissa.bo")),
        v11 = (int8x16_t *)objc_msgSend(a3, "decodeBytesForKey:returnedLength:", CFSTR("NS.mantissa"), &v25),
        (_QWORD)v25 != 16))
  {
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: critical NSDecimalNumber archived data is wrong size"), self);
LABEL_19:
    v21 = v18;
    v20 = (void *)MEMORY[0x1E0C99DA0];
    goto LABEL_20;
  }
  if (!v11)
  {
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: critical NSDecimalNumber archived data is missing"), self);
    goto LABEL_19;
  }
  v12.i32[0] = 1;
  v13.i32[0] = v10;
  v14 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v13, v12), 0), *v11, vrev16q_s8(*v11));
  *(_DWORD *)v27 = v5 | ((v7 & 0xF) << 8) | v8 | v9;
  *(int8x16_t *)&v27[4] = v14;
  v15 = (__int128 *)v27;
  return -[NSDecimalNumberPlaceholder initWithDecimal:](self, "initWithDecimal:", v15);
}

- (NSDecimalNumberPlaceholder)initWithLongLong:(int64_t)a3
{
  int64_t v3;

  if (a3 >= 0)
    v3 = a3;
  else
    v3 = -a3;
  return -[NSDecimalNumberPlaceholder initWithMantissa:exponent:isNegative:](self, "initWithMantissa:exponent:isNegative:", v3, 0, (unint64_t)a3 >> 63);
}

- (NSDecimalNumberPlaceholder)initWithBool:(BOOL)a3
{
  return -[NSDecimalNumberPlaceholder initWithLongLong:](self, "initWithLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithChar:(char)a3
{
  return -[NSDecimalNumberPlaceholder initWithLongLong:](self, "initWithLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithShort:(signed __int16)a3
{
  return -[NSDecimalNumberPlaceholder initWithLongLong:](self, "initWithLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithInt:(int)a3
{
  return -[NSDecimalNumberPlaceholder initWithLongLong:](self, "initWithLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithUnsignedLongLong:(unint64_t)a3
{
  return -[NSDecimalNumberPlaceholder initWithMantissa:exponent:isNegative:](self, "initWithMantissa:exponent:isNegative:", a3, 0, 0);
}

- (NSDecimalNumberPlaceholder)initWithUnsignedChar:(unsigned __int8)a3
{
  return -[NSDecimalNumberPlaceholder initWithUnsignedLongLong:](self, "initWithUnsignedLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithUnsignedShort:(unsigned __int16)a3
{
  return -[NSDecimalNumberPlaceholder initWithUnsignedLongLong:](self, "initWithUnsignedLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithUnsignedInt:(unsigned int)a3
{
  return -[NSDecimalNumberPlaceholder initWithUnsignedLongLong:](self, "initWithUnsignedLongLong:", a3);
}

- (NSDecimalNumberPlaceholder)initWithDouble:(double)a3
{
  double v3;
  unint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  __int16 i;

  v3 = -a3;
  if (a3 >= 0.0)
    v3 = a3;
  if (v3 >= 1.0e-110)
  {
    if (v3 <= 1.8e146)
    {
      for (i = 0; v3 < 1.84467441e19; --i)
        v3 = v3 * 10.0;
      for (; v3 > 1.84467441e19; ++i)
        v3 = v3 / 10.0;
      v4 = (unint64_t)v3;
      v6 = a3 < 0.0;
      v5 = i;
    }
    else
    {
      v6 = a3 < 0.0;
      v4 = -1;
      v5 = 127;
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  return -[NSDecimalNumberPlaceholder initWithMantissa:exponent:isNegative:](self, "initWithMantissa:exponent:isNegative:", v4, v5, v6);
}

- (NSDecimalNumberPlaceholder)initWithFloat:(float)a3
{
  return -[NSDecimalNumberPlaceholder initWithDouble:](self, "initWithDouble:", a3);
}

@end
