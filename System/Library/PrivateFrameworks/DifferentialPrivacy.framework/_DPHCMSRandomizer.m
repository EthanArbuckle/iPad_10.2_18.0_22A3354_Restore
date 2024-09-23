@implementation _DPHCMSRandomizer

- (_DPHCMSRandomizer)init
{

  return 0;
}

- (_DPHCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8
{
  _DPHCMSRandomizer *v15;
  _BOOL4 v17;
  _BOOL4 v18;
  _DPHCMSRandomizer *v19;
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
            v20.super_class = (Class)_DPHCMSRandomizer;
            v19 = -[_DPHCMSRandomizer init](&v20, sel_init);
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

- (_DPHCMSRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  return -[_DPHCMSRandomizer initWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:](self, "initWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:", a4, a5, a4, a5, a3, a3);
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:bitCount:hashFunctionCount:", a4, a5, a3);
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5 fragmentEpsilon:(double)a6 fragmentBitCount:(unint64_t)a7 fragmentHashFunctionCount:(unint64_t)a8
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:bitCount:hashFunctionCount:fragmentEpsilon:fragmentBitCount:fragmentHashFunctionCount:", a4, a5, a7, a8, a3, a6);
}

- (id)hcmsSampleForString:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  -[_DPHCMSRandomizer epsilon](self, "epsilon");
  +[_DPHCMSSample hcmsSampleWith:privacyParameter:hashFunctionCount:bitCount:](_DPHCMSSample, "hcmsSampleWith:privacyParameter:hashFunctionCount:bitCount:", v4, -[_DPHCMSRandomizer k](self, "k"), -[_DPHCMSRandomizer m](self, "m"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hcmsSampleForFragment:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  -[_DPHCMSRandomizer fragmentEpsilon](self, "fragmentEpsilon");
  +[_DPHCMSSample hcmsSampleWith:privacyParameter:hashFunctionCount:bitCount:](_DPHCMSSample, "hcmsSampleWith:privacyParameter:hashFunctionCount:bitCount:", v4, -[_DPHCMSRandomizer fragmentK](self, "fragmentK"), -[_DPHCMSRandomizer fragmentM](self, "fragmentM"), v5);
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
  uint64_t i;
  uint64_t v15;
  void *v16;
  _DPHCMSSequenceRecord *v17;
  void *v18;
  _DPHCMSSequenceRecord *v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v22 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[_DPHCMSRandomizer hcmsSampleForString:](self, "hcmsSampleForString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [_DPHCMSSequenceRecord alloc];
        objc_msgSend(v16, "bitString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[_DPHCMSSequenceRecord initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:creationDate:submitted:objectId:](v17, "initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:creationDate:submitted:objectId:", v7, v15, v18, (unsigned __int16)objc_msgSend(v16, "hashFunctionIndex"), objc_msgSend(v16, "bitIndex"), 0, v10, 0);

        if (v19)
          objc_msgSend(v22, "addObject:", v19);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  return v22;
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
  unsigned __int16 v18;
  void *v19;
  void *v20;
  __int16 v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _DPHCMSWordRecord *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _DPHCMSWordRecord *v35;
  void *v36;
  id v37;

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
    -[_DPHCMSRandomizer hcmsSampleForString:](self, "hcmsSampleForString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "word");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DPHCMSRandomizer hcmsSampleForFragment:](self, "hcmsSampleForFragment:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = [_DPHCMSWordRecord alloc];
    v36 = v9;
    objc_msgSend(v9, "word");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bitString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v8;
    v18 = objc_msgSend(v15, "hashFunctionIndex");
    v32 = objc_msgSend(v15, "bitIndex");
    objc_msgSend(v10, "word");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bitString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v17, "hashFunctionIndex");
    v22 = objc_msgSend(v17, "bitIndex");
    objc_msgSend(v10, "wordPosition");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedShortValue");
    BYTE2(v31) = 0;
    v25 = v18;
    v8 = v37;
    LOWORD(v31) = v24;
    HIDWORD(v30) = v22;
    LOWORD(v30) = v21;
    v26 = -[_DPHCMSWordRecord initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:plainFragment:fragment:fragmentHashIndex:fragmentBitIndex:fragmentPosition:creationDate:submitted:objectId:](v35, "initWithKey:plainSequence:sequence:sequenceHashIndex:sequenceBitIndex:plainFragment:fragment:fragmentHashIndex:fragmentBitIndex:fragmentPosition:creationDate:submitted:objectId:", v37, v34, v33, v25, v32, v19, v13, v20, v30, v31, 0);

    v27 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v28 = v27;
    if (v26)
      objc_msgSend(v27, "addObject:", v26);

  }
  else
  {
    v28 = 0;
  }

  return v28;
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
