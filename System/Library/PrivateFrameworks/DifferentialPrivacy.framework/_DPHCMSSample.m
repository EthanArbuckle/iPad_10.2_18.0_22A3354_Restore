@implementation _DPHCMSSample

- (_DPHCMSSample)init
{

  return 0;
}

- (_DPHCMSSample)initWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6
{
  uint32_t v7;
  id v10;
  _DPHCMSSample *v11;
  uint64_t v12;
  NSData *bitString;
  _DPHCMSSample *v14;
  objc_super v16;

  v7 = a5;
  v10 = a3;
  if (isInvalidEpsilon(a4) || !isNonZeroPowerOfTwo(a6))
  {
    v14 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)_DPHCMSSample;
    v11 = -[_DPHCMSSample init](&v16, sel_init);
    if (v11)
    {
      v11->_hashFunctionIndex = arc4random_uniform(v7);
      v11->_bitIndex = arc4random_uniform(a6);
      objc_msgSend((id)objc_opt_class(), "dataFor:hashAtIndex:epsilon:bitCount:bitIndex:", v10, v11->_hashFunctionIndex, a6, v11->_bitIndex, a4);
      v12 = objc_claimAutoreleasedReturnValue();
      bitString = v11->_bitString;
      v11->_bitString = (NSData *)v12;

    }
    self = v11;
    v14 = self;
  }

  return v14;
}

+ (id)hcmsSampleWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6
{
  id v10;
  void *v11;

  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWith:privacyParameter:hashFunctionCount:bitCount:", v10, a5, a6, a4);

  return v11;
}

+ (id)dataFor:(id)a3 hashAtIndex:(unint64_t)a4 epsilon:(double)a5 bitCount:(unint64_t)a6 bitIndex:(unint64_t)a7
{
  int v7;
  int v9;
  void *v10;
  void *v11;
  int8x8_t v12;
  char v13;
  char v14;
  char v15;
  void *v16;
  char v18;

  v7 = a7;
  v9 = uint32_from_string(a4, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), a6);
  +[_DPBiasedCoin coinWithBias:](_DPBiasedCoin, "coinWithBias:", (double)(1.0 / (exp(a5) + 1.0)));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12.i32[0] = v9 & v7;
  v13 = vaddlv_u8((uint8x8_t)vcnt_s8(v12));
  if ((v13 & 1) != 0)
    v14 = -1;
  else
    v14 = 1;
  v18 = v14;
  if (objc_msgSend(v10, "flip"))
  {
    if ((v13 & 1) != 0)
      v15 = 1;
    else
      v15 = -1;
    v18 = v15;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)convertDataToString:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  id result;
  int v7;
  const __CFString *v8;

  v3 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  result = &stru_1E95DA470;
  if (v5)
  {
    v7 = *v4;
    v8 = CFSTR("-1");
    if (v7 != 255)
      v8 = &stru_1E95DA470;
    if (v7 == 1)
      return CFSTR("+1");
    else
      return (id)v8;
  }
  return result;
}

+ (id)jsonStringFrom:(id)a3 hashIndex:(unint64_t)a4 bitIndex:(unint64_t)a5
{
  unsigned __int16 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)MEMORY[0x1D8256B78]();
  v9 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  objc_msgSend(v9, "appendFormat:", CFSTR("\"%hu,"), v6);
  objc_msgSend(v9, "appendFormat:", CFSTR("%ld,"), a5);
  objc_msgSend((id)objc_opt_class(), "convertDataToString:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v10);

  objc_msgSend(v9, "appendString:", CFSTR("\"));
  objc_autoreleasePoolPop(v8);

  return v9;
}

+ (id)jsonStringFromSequence:(id)a3 sequenceHashIndex:(unsigned __int16)a4 sequencebitIndex:(unint64_t)a5 fragment:(id)a6 fragmentHashIndex:(unsigned __int16)a7 fragmentbitIndex:(unint64_t)a8 fragmentPosition:(unsigned __int16)a9
{
  unsigned int v10;
  unsigned int v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = a7;
  v13 = a4;
  v14 = a3;
  v15 = a6;
  v16 = (void *)MEMORY[0x1D8256B78]();
  v17 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  objc_msgSend(v17, "appendFormat:", CFSTR("\"%hu,"), v13);
  objc_msgSend(v17, "appendFormat:", CFSTR("%ld,"), a5);
  objc_msgSend((id)objc_opt_class(), "convertDataToString:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendString:", v18);

  objc_msgSend(v17, "appendFormat:", CFSTR(",%ld,%hu,%ld,"), a9, v10, a8);
  objc_msgSend((id)objc_opt_class(), "convertDataToString:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendString:", v19);

  objc_msgSend(v17, "appendString:", CFSTR("\"));
  objc_autoreleasePoolPop(v16);

  return v17;
}

- (unint64_t)hashFunctionIndex
{
  return self->_hashFunctionIndex;
}

- (unint64_t)bitIndex
{
  return self->_bitIndex;
}

- (NSData)bitString
{
  return self->_bitString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitString, 0);
}

@end
