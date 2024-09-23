@implementation _DPBitValueRandomizer

- (_DPBitValueRandomizer)init
{

  return 0;
}

- (_DPBitValueRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  _DPBitValueRandomizer *v7;
  _DPBiasedCoin *v8;
  _DPBiasedCoin *epsilonCoin;
  _DPBitValueRandomizer *v10;
  objc_super v12;

  if (isInvalidEpsilon(a4))
    goto LABEL_5;
  v12.receiver = self;
  v12.super_class = (Class)_DPBitValueRandomizer;
  v7 = -[_DPBitValueRandomizer init](&v12, sel_init);
  self = v7;
  if (!v7)
    goto LABEL_4;
  v7->_p = a3;
  v7->_epsilon = a4;
  +[_DPBiasedCoin coinWithBias:](_DPBiasedCoin, "coinWithBias:", (double)(1.0 / (exp(a4 * 0.5) + 1.0)));
  v8 = (_DPBiasedCoin *)objc_claimAutoreleasedReturnValue();
  epsilonCoin = self->_epsilonCoin;
  self->_epsilonCoin = v8;

  if (!self->_epsilonCoin)
  {
LABEL_5:
    v10 = 0;
  }
  else
  {
LABEL_4:
    self = self;
    v10 = self;
  }

  return v10;
}

+ (id)bitValueRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDimensionality:epsilon:", a3, a4);
}

- (id)randomize:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  int v8;
  int v9;

  v4 = objc_msgSend(a3, "unsignedLongValue");
  if (v4 >= self->_p)
  {
    v6 = 0;
  }
  else
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
    if (self->_p)
    {
      v7 = 0;
      do
      {
        v8 = -[_DPBiasedCoin generateByte](self->_epsilonCoin, "generateByte");
        if ((v7 ^ v5) >= 8)
          v9 = 0;
        else
          v9 = 1 << (v5 & 7);
        objc_msgSend(v6, "appendFormat:", CFSTR("%02X"), v8 ^ v9);
        v7 += 8;
      }
      while (v7 < self->_p);
    }
  }
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { p=%ld ; epsilon=%lf ; cEpsilon=%lf ; epsilonCoin=%@ }"),
    v5,
    self->_p,
    *(_QWORD *)&self->_epsilon,
    1.0 / (exp(self->_epsilon * 0.5) + 1.0),
    self->_epsilonCoin);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _DPBitValueRecord *v18;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[_DPBitValueMap bitValueMapForKey:](_DPBitValueMap, "bitValueMapForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v20 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v7, "bitValueForString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToNumber:", &unk_1E96872E8) & 1) == 0)
        {
          -[_DPBitValueRandomizer randomize:](self, "randomize:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[_DPBitValueRecord initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:]([_DPBitValueRecord alloc], "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", v6, objc_msgSend(v16, "shortValue"), v17, 0, 0, v10);
          if (v18)
            objc_msgSend(v20, "addObject:", v18);

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  return v20;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  _DPBitValueRecord *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v20 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v16, "isEqualToNumber:", &unk_1E96872E8) & 1) == 0)
        {
          -[_DPBitValueRandomizer randomize:](self, "randomize:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[_DPBitValueRecord initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:]([_DPBitValueRecord alloc], "initWithKey:clearBitValue:privateBitValueStr:creationDate:submitted:objectId:", v7, objc_msgSend(v16, "shortValue"), v17, 0, 0, v10);
          if (v18)
            objc_msgSend(v20, "addObject:", v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  return v20;
}

- (unint64_t)p
{
  return self->_p;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (_DPBiasedCoin)epsilonCoin
{
  return self->_epsilonCoin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_epsilonCoin, 0);
}

@end
