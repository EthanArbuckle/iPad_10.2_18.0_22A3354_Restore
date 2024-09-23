@implementation _DPCMSRandomizer

- (_DPCMSRandomizer)init
{

  return 0;
}

- (_DPCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8
{
  _DPCMSRandomizer *v15;
  _BOOL4 v17;
  _BOOL4 v18;
  _DPCMSRandomizer *v19;
  objc_super v20;

  if (isInvalidEpsilon(a3))
  {
    v15 = 0;
  }
  else
  {
    v17 = isNonZeroPowerOfTwo(a4);
    v15 = 0;
    if (a5)
    {
      if (v17)
      {
        v18 = isNonZeroPowerOfTwo(a7);
        v15 = 0;
        if (a8)
        {
          if (v18)
          {
            v20.receiver = self;
            v20.super_class = (Class)_DPCMSRandomizer;
            v19 = -[_DPCMSRandomizer init](&v20, sel_init);
            if (v19)
            {
              v19->_epsilon = a3;
              v19->_m = a4;
              v19->_k = a5;
              v19->_fragmentEpsilon = a6;
              v19->_fragmentM = a7;
              v19->_fragmentK = a8;
            }
            self = v19;
            v15 = self;
          }
        }
      }
    }
  }

  return v15;
}

- (_DPCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  return -[_DPCMSRandomizer initWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:](self, "initWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:", a4, a5, a4, a5, a3, a3);
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:", a4, a5, a7, a8, a3, a6);
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:bitCount:hashFunctionCount:", a4, a5, a3);
}

- (id)cmsSampleForString:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  -[_DPCMSRandomizer epsilon](self, "epsilon");
  +[_DPCMSSample cmsSampleWith:privacyParameter:hashFunctionCount:bitCount:](_DPCMSSample, "cmsSampleWith:privacyParameter:hashFunctionCount:bitCount:", v4, -[_DPCMSRandomizer k](self, "k"), -[_DPCMSRandomizer m](self, "m"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cmsSampleForFragment:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  -[_DPCMSRandomizer fragmentEpsilon](self, "fragmentEpsilon");
  +[_DPCMSSample cmsSampleWith:privacyParameter:hashFunctionCount:bitCount:](_DPCMSSample, "cmsSampleWith:privacyParameter:hashFunctionCount:bitCount:", v4, -[_DPCMSRandomizer fragmentK](self, "fragmentK"), -[_DPCMSRandomizer fragmentM](self, "fragmentM"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { epsilon=%.16g ; m=%ld ; k=%ld ; fragmentEpsilon=%.16g ; fragmentM=%ld ; fragmentK=%ld }"),
    v5,
    *(_QWORD *)&self->_epsilon,
    self->_m,
    self->_k,
    *(_QWORD *)&self->_fragmentEpsilon,
    self->_fragmentM,
    self->_fragmentK);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _DPCMSSequenceRecord *v18;
  void *v19;
  _DPCMSSequenceRecord *v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v23 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1D8256B78]();
        -[_DPCMSRandomizer cmsSampleForString:](self, "cmsSampleForString:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = [_DPCMSSequenceRecord alloc];
        objc_msgSend(v17, "bitString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[_DPCMSSequenceRecord initWithKey:plainSequence:sequence:sequenceHashIndex:creationDate:submitted:objectId:](v18, "initWithKey:plainSequence:sequence:sequenceHashIndex:creationDate:submitted:objectId:", v7, v15, v19, (unsigned __int16)objc_msgSend(v17, "hashFunctionIndex"), 0, 0, v10);

        if (v20)
          objc_msgSend(v23, "addObject:", v20);

        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

  return v23;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unsigned __int16 v21;
  void *v22;
  void *v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  _DPCMSWordRecord *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  _DPCMSWordRecord *v32;
  void *v33;
  void *v34;
  void *v35;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;

    objc_msgSend(v9, "word");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPCMSRandomizer cmsSampleForString:](self, "cmsSampleForString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "word");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPCMSRandomizer cmsSampleForFragment:](self, "cmsSampleForFragment:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = [_DPCMSWordRecord alloc];
    v35 = v9;
    objc_msgSend(v9, "word");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bitString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v15;
    v20 = v8;
    v21 = objc_msgSend(v15, "hashFunctionIndex");
    objc_msgSend(v10, "word");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bitString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v15) = objc_msgSend(v17, "hashFunctionIndex");
    v34 = v10;
    objc_msgSend(v10, "wordPosition");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "shortValue");
    BYTE4(v31) = 0;
    v26 = v21;
    v8 = v20;
    WORD1(v31) = v25;
    LOWORD(v31) = (_WORD)v15;
    v27 = -[_DPCMSWordRecord initWithKey:plainSequence:sequence:sequenceHashIndex:plainFragment:fragment:fragmentHashIndex:fragmentPosition:creationDate:submitted:objectId:](v32, "initWithKey:plainSequence:sequence:sequenceHashIndex:plainFragment:fragment:fragmentHashIndex:fragmentPosition:creationDate:submitted:objectId:", v20, v18, v19, v26, v22, v23, v13, v31, 0);

    v28 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v29 = v28;
    if (v27)
      objc_msgSend(v28, "addObject:", v27);

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (unint64_t)m
{
  return self->_m;
}

- (unint64_t)k
{
  return self->_k;
}

- (double)fragmentEpsilon
{
  return self->_fragmentEpsilon;
}

- (unint64_t)fragmentM
{
  return self->_fragmentM;
}

- (unint64_t)fragmentK
{
  return self->_fragmentK;
}

@end
