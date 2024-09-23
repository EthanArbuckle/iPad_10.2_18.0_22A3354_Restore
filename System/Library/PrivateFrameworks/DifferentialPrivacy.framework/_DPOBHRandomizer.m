@implementation _DPOBHRandomizer

- (_DPOBHRandomizer)init
{

  return 0;
}

- (_DPOBHRandomizer)initWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  _DPOBHRandomizer *v7;
  _DPOBHRandomizer *v8;
  _DPRandomBitPositionGenerator *v9;
  _DPRandomBitPositionGenerator *bitPositionGenerator;
  long double v11;
  _DPBiasedCoin *v12;
  _DPBiasedCoin *epsilonCoin;
  objc_super v15;

  if (isInvalidEpsilon(a4))
    goto LABEL_2;
  v15.receiver = self;
  v15.super_class = (Class)_DPOBHRandomizer;
  v8 = -[_DPOBHRandomizer init](&v15, sel_init);
  self = v8;
  if (!v8)
    goto LABEL_6;
  v8->_m = a3;
  +[_DPRandomBitPositionGenerator generatorWithDimensionality:](_DPRandomBitPositionGenerator, "generatorWithDimensionality:", a3);
  v9 = (_DPRandomBitPositionGenerator *)objc_claimAutoreleasedReturnValue();
  bitPositionGenerator = self->_bitPositionGenerator;
  self->_bitPositionGenerator = v9;

  self->_epsilon = a4;
  v11 = exp(a4);
  self->_cEpsilon = v11 / (v11 + 1.0);
  +[_DPBiasedCoin coinWithBias:](_DPBiasedCoin, "coinWithBias:");
  v12 = (_DPBiasedCoin *)objc_claimAutoreleasedReturnValue();
  epsilonCoin = self->_epsilonCoin;
  self->_epsilonCoin = v12;

  if (!self->_bitPositionGenerator || !self->_epsilonCoin)
  {
LABEL_2:
    v7 = 0;
  }
  else
  {
LABEL_6:
    self = self;
    v7 = self;
  }

  return v7;
}

+ (id)obhRandomizerWithDimensionality:(unint64_t)a3 epsilon:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithDimensionality:epsilon:", a3, a4);
}

- (BOOL)getBitValueAtIndex:(unint64_t)a3 forString:(id)a4
{
  const char *v5;
  CC_LONG v6;
  CCCryptorStatus v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  _QWORD dataIn[2];
  unsigned __int8 md[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  v6 = strlen(v5);
  CC_SHA256(v5, v6, md);
  dataIn[0] = 0;
  dataIn[1] = bswap64(a3 >> 7);
  v7 = CCCrypt(0, 0, 2u, md, 0x20uLL, 0, dataIn, 0x10uLL, dataIn, 0x10uLL, 0);
  if (v7)
  {
    v8 = v7;
    +[_DPLog framework](_DPLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_DPOBHRandomizer getBitValueAtIndex:forString:].cold.1(v8, v9);

    LOBYTE(v10) = 0;
  }
  else
  {
    return (*((unsigned __int8 *)dataIn + ((a3 >> 3) & 0xF)) >> (a3 & 7)) & 1;
  }
  return v10;
}

- (id)randomizedBitForString:(id)a3
{
  _DPRandomBitPositionGenerator *bitPositionGenerator;
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;

  bitPositionGenerator = self->_bitPositionGenerator;
  v5 = a3;
  v6 = -[_DPRandomBitPositionGenerator sample](bitPositionGenerator, "sample");
  v7 = -[_DPOBHRandomizer getBitValueAtIndex:forString:](self, "getBitValueAtIndex:forString:", v6, v5);

  if (v7)
    v8 = 1;
  else
    v8 = -1;
  if (-[_DPBiasedCoin flip](self->_epsilonCoin, "flip"))
    v9 = v8;
  else
    v9 = -v8;
  return +[_DPRandomizedBit randomizedBit:atIndex:](_DPRandomizedBit, "randomizedBit:atIndex:", v9, v6);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { dimensionality=%ld ; bitPositionGenerator=%@ ; epsilon=%.16g ; cEpsilon=%.16g ; epsilonCoin=%@ }"),
    v5,
    self->_m,
    self->_bitPositionGenerator,
    *(_QWORD *)&self->_epsilon,
    *(_QWORD *)&self->_cEpsilon,
    self->_epsilonCoin);
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
  void *v17;
  id obj;
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
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[_DPOBHRandomizer randomizedBitForString:](self, "randomizedBitForString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DPOBHSequenceRecord recordWithKey:sequence:bitPosition:bitValue:creationDate:submitted:objectId:](_DPOBHSequenceRecord, "recordWithKey:sequence:bitPosition:bitValue:creationDate:submitted:objectId:", v7, v15, objc_msgSend(v16, "index"), objc_msgSend(v16, "value") == 1, 0, 0, v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v20, "addObject:", v17);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  return v20;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (unint64_t)m
{
  return self->_m;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (_DPBiasedCoin)epsilonCoin
{
  return self->_epsilonCoin;
}

- (_DPRandomBitPositionGenerator)bitPositionGenerator
{
  return self->_bitPositionGenerator;
}

- (double)cEpsilon
{
  return self->_cEpsilon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitPositionGenerator, 0);
  objc_storeStrong((id *)&self->_epsilonCoin, 0);
}

- (void)getBitValueAtIndex:(int)a1 forString:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D3FAA000, a2, OS_LOG_TYPE_ERROR, "CCCryptorStatus failed: %d", (uint8_t *)v2, 8u);
}

@end
