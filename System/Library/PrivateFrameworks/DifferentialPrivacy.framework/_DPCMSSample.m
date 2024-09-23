@implementation _DPCMSSample

- (_DPCMSSample)init
{

  return 0;
}

- (_DPCMSSample)initWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6
{
  uint32_t v7;
  id v10;
  _DPCMSSample *v11;
  uint64_t v12;
  NSData *bitString;
  _DPCMSSample *v14;
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
    v16.super_class = (Class)_DPCMSSample;
    v11 = -[_DPCMSSample init](&v16, sel_init);
    if (v11)
    {
      v11->_hashFunctionIndex = arc4random_uniform(v7);
      objc_msgSend((id)objc_opt_class(), "dataFor:hashAtIndex:privacyParameter:bitCount:", v10, v11->_hashFunctionIndex, a6, a4);
      v12 = objc_claimAutoreleasedReturnValue();
      bitString = v11->_bitString;
      v11->_bitString = (NSData *)v12;

    }
    self = v11;
    v14 = self;
  }

  return v14;
}

+ (id)cmsSampleWith:(id)a3 privacyParameter:(double)a4 hashFunctionCount:(unint64_t)a5 bitCount:(unint64_t)a6
{
  id v10;
  void *v11;

  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWith:privacyParameter:hashFunctionCount:bitCount:", v10, a5, a6, a4);

  return v11;
}

+ (id)dataFor:(id)a3 hashAtIndex:(unint64_t)a4 privacyParameter:(double)a5 bitCount:(unint64_t)a6
{
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  _BYTE *v13;
  void *v14;

  v8 = uint32_from_string(a4, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), a6);
  +[_DPBiasedCoin coinWithBias:](_DPBiasedCoin, "coinWithBias:", (double)(1.0 / (exp(a5 * 0.5) + 1.0)));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a6 >> 3;
  v11 = malloc_type_malloc(a6 >> 3, 0xD596EE27uLL);
  bzero(v11, a6 >> 3);
  if (a6 >= 8)
  {
    if (v10 <= 1)
      v12 = 1;
    else
      v12 = a6 >> 3;
    v13 = v11;
    do
    {
      *v13++ = objc_msgSend(v9, "generateByte");
      --v12;
    }
    while (v12);
  }
  set_bit(v8, (uint64_t)v11);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)convertToHexString:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  uint64_t v5;
  void *v6;
  void *i;
  unsigned int v8;

  v3 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = (void *)MEMORY[0x1D8256B78]();
  for (i = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy"); v5; --v5)
  {
    v8 = *v4++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02X"), v8);
  }
  objc_autoreleasePoolPop(v6);

  return i;
}

+ (id)jsonStringFrom:(id)a3 hashIndex:(unint64_t)a4
{
  unsigned __int16 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8256B78]();
  v7 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  objc_msgSend(v7, "appendFormat:", CFSTR("\"%hu,"), v4);
  objc_msgSend((id)objc_opt_class(), "convertToHexString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v8);

  objc_msgSend(v7, "appendString:", CFSTR("\"));
  objc_autoreleasePoolPop(v6);

  return v7;
}

+ (id)jsonStringFromSequence:(id)a3 sequenceHashIndex:(unsigned __int16)a4 fragment:(id)a5 fragmentHashIndex:(unsigned __int16)a6 fragmentPosition:(unsigned __int16)a7
{
  unsigned int v7;
  unsigned int v8;
  unsigned int v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v11 = a3;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D8256B78]();
  v14 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  objc_msgSend(v14, "appendFormat:", CFSTR("\"%hu,"), v10);
  objc_msgSend((id)objc_opt_class(), "convertToHexString:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", v15);

  objc_msgSend(v14, "appendFormat:", CFSTR(",%ld,%hu,"), v7, v8);
  objc_msgSend((id)objc_opt_class(), "convertToHexString:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:", v16);

  objc_msgSend(v14, "appendString:", CFSTR("\"));
  objc_autoreleasePoolPop(v13);

  return v14;
}

- (unint64_t)hashFunctionIndex
{
  return self->_hashFunctionIndex;
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
