@implementation _DPPTValueRandomizer

- (_DPPTValueRandomizer)init
{

  return 0;
}

- (_DPPTValueRandomizer)initWithEpsilon:(double)a3 numberOfGroups:(unsigned int)a4
{
  BOOL v7;
  _DPPTValueRandomizer *v8;
  _DPPTValueRandomizer *v9;
  _DPPTValueRandomizer *v10;
  long double v11;
  unsigned int v12;
  objc_super v14;

  v7 = isInvalidEpsilon(a3);
  v8 = 0;
  if (a4 - 61 >= 0xFFFFFFC4 && !v7)
  {
    v14.receiver = self;
    v14.super_class = (Class)_DPPTValueRandomizer;
    v9 = -[_DPPTValueRandomizer init](&v14, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_epsilon = a3;
      v9->_numGroups = a4;
      v9->_mask = 0x7FFFFFFFFFFFFFFFLL;
      v11 = exp(a3);
      v12 = vcvtpd_u64_f64(v11 + 1.0);
      v10->_bucketCount = v12;
      v10->_chancePMinusQ = v11 / (v11 + (double)v12 + -1.0) + -1.0 / (v11 + (double)v12 + -1.0);
    }
    self = v10;
    v8 = self;
  }

  return v8;
}

+ (id)randomizerWithEpsilon:(double)a3 numberOfGroups:(unsigned int)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:numberOfGroups:", *(_QWORD *)&a4, a3);
}

- (id)randomize:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  size_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_DPPTValueRandomizer numGroups](self, "numGroups");
  MEMORY[0x1E0C80A78]();
  v6 = (_QWORD *)((char *)v20 - v5);
  bzero((char *)v20 - v5, v7);
  v8 = -[_DPPTValueRandomizer numGroups](self, "numGroups");
  if (objc_msgSend(v4, "length") <= (unint64_t)v8)
    v9 = objc_msgSend(v4, "length");
  else
    v9 = -[_DPPTValueRandomizer numGroups](self, "numGroups");
  objc_msgSend(v4, "getCharacters:range:", v6, 0, v9);
  v10 = arc4random_uniform(-[_DPPTValueRandomizer numGroups](self, "numGroups"));
  v11 = arc4random_uniform(0x77359400u);
  v12 = uniformRandomProbability();
  -[_DPPTValueRandomizer chancePMinusQ](self, "chancePMinusQ");
  if (v12 >= v13)
  {
    v15 = arc4random_uniform(-[_DPPTValueRandomizer bucketCount](self, "bucketCount"));
  }
  else
  {
    if (objc_msgSend(v4, "length") <= v10)
      v14 = objc_msgSend(v4, "length");
    else
      v14 = v10 + 1;
    v16 = XXH64(v6, 2 * v14, v11);
    v17 = -[_DPPTValueRandomizer mask](self, "mask") & v16;
    v15 = v17 % -[_DPPTValueRandomizer bucketCount](self, "bucketCount");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu,%lu,%llu"), v10, v11, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _DPPTRecord *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        -[_DPPTValueRandomizer randomize:](self, "randomize:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[_DPPTRecord initWithKey:privateValue:creationDate:submitted:objectId:]([_DPPTRecord alloc], "initWithKey:privateValue:creationDate:submitted:objectId:", v7, v17, 0, 0, v10);
        if (v18)
          objc_msgSend(v11, "addObject:", v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  return v11;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void)setEpsilon:(double)a3
{
  self->_epsilon = a3;
}

- (unsigned)numGroups
{
  return self->_numGroups;
}

- (void)setNumGroups:(unsigned int)a3
{
  self->_numGroups = a3;
}

- (unint64_t)mask
{
  return self->_mask;
}

- (void)setMask:(unint64_t)a3
{
  self->_mask = a3;
}

- (unsigned)bucketCount
{
  return self->_bucketCount;
}

- (void)setBucketCount:(unsigned int)a3
{
  self->_bucketCount = a3;
}

- (double)chancePMinusQ
{
  return self->_chancePMinusQ;
}

- (void)setChancePMinusQ:(double)a3
{
  self->_chancePMinusQ = a3;
}

@end
