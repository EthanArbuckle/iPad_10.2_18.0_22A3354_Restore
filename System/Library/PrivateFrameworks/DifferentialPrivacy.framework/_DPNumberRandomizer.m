@implementation _DPNumberRandomizer

- (_DPNumberRandomizer)init
{

  return 0;
}

- (_DPNumberRandomizer)initWithRange:(unint64_t)a3 epsilon:(double)a4
{
  _DPNumberRandomizer *v7;
  _DPNumberRandomizer *v8;
  _DPNumberRandomizer *v9;
  uint64_t v10;
  _DPLaplaceNoiseGenerator *generator;
  objc_super v13;

  if (isInvalidEpsilon(a4))
  {
    v7 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPNumberRandomizer;
    v8 = -[_DPNumberRandomizer init](&v13, sel_init);
    v9 = v8;
    if (v8)
    {
      v8->_range = a3;
      v8->_epsilon = a4;
      +[_DPLaplaceNoiseGenerator zeroMeanLaplaceNoiseGenerator:](_DPLaplaceNoiseGenerator, "zeroMeanLaplaceNoiseGenerator:", (double)a3 / a4);
      v10 = objc_claimAutoreleasedReturnValue();
      generator = v9->_generator;
      v9->_generator = (_DPLaplaceNoiseGenerator *)v10;

    }
    self = v9;
    v7 = self;
  }

  return v7;
}

+ (id)numberRandomizerWithRange:(unint64_t)a3 epsilon:(double)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRange:epsilon:", a3, a4);
}

- (id)randomize:(id)a3
{
  _DPLaplaceNoiseGenerator *generator;
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  generator = self->_generator;
  v4 = a3;
  -[_DPLaplaceNoiseGenerator sample](generator, "sample");
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "doubleValue");
  v9 = v8;

  return (id)objc_msgSend(v7, "numberWithDouble:", v6 + v9);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { range=%ld ; epsilon=%.16g ; laplaceNoiseGenerator=%@ }"),
    v5,
    self->_range,
    *(_QWORD *)&self->_epsilon,
    self->_generator);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)randomizeNumbers:(id)a3 forKey:(id)a4
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
  _DPNumericDataRecord *v18;
  double v19;
  double v20;
  double v21;
  _DPNumericDataRecord *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v24 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[_DPNumberRandomizer randomize:](self, "randomize:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = [_DPNumericDataRecord alloc];
        objc_msgSend(v16, "doubleValue");
        v20 = v19;
        objc_msgSend(v17, "doubleValue");
        v22 = -[_DPNumericDataRecord initWithKey:clearNumber:privateNumber:creationDate:submitted:objectId:](v18, "initWithKey:clearNumber:privateNumber:creationDate:submitted:objectId:", v7, 0, 0, v20, v21, v10);
        if (v22)
          objc_msgSend(v24, "addObject:", v22);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  return v24;
}

- (unint64_t)range
{
  return self->_range;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (_DPLaplaceNoiseGenerator)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
}

@end
