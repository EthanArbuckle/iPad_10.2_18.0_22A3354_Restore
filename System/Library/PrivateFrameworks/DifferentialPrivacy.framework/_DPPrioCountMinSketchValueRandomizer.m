@implementation _DPPrioCountMinSketchValueRandomizer

- (_DPPrioCountMinSketchValueRandomizer)init
{

  return 0;
}

- (_DPPrioCountMinSketchValueRandomizer)initWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  _DPPrioCountMinSketchValueRandomizer *v5;
  _DPPrioCountMinSketchValueRandomizer *v10;
  objc_super v12;

  v5 = 0;
  if (a5 && a4 && a3 >= 0.0 && a3 <= 16.0)
  {
    v12.receiver = self;
    v12.super_class = (Class)_DPPrioCountMinSketchValueRandomizer;
    v10 = -[_DPPrioCountMinSketchValueRandomizer init](&v12, sel_init, 16.0);
    if (v10)
    {
      v10->_epsilon = a3;
      v10->_m = a4;
      v10->_k = a5;
    }
    self = v10;
    v5 = self;
  }

  return v5;
}

+ (id)randomizerWithEpsilon:(double)a3 bitCount:(unint64_t)a4 hashFunctionCount:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:bitCount:hashFunctionCount:", a4, a5, a3);
}

- (id)randomize:(id)a3 metadata:(id)a4
{
  id v5;
  unint64_t v6;
  int v7;
  double v8;
  void *v9;
  int i;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  unint64_t v24;
  int v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[_DPPrioCountMinSketchValueRandomizer m](self, "m");
  v7 = -[_DPPrioCountMinSketchValueRandomizer k](self, "k");
  -[_DPPrioCountMinSketchValueRandomizer epsilon](self, "epsilon");
  +[_DPPrioAlgorithm prioWithEpsilon:dimensionality:](_DPPrioAlgorithm, "prioWithEpsilon:dimensionality:", -[_DPPrioCountMinSketchValueRandomizer m](self, "m"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 0);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      for (i = 0; i != v7; ++i)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __59___DPPrioCountMinSketchValueRandomizer_randomize_metadata___block_invoke;
        v22[3] = &unk_1E95D9AE8;
        v25 = i;
        v23 = v5;
        v24 = v6;
        objc_msgSend(v9, "privatizeDataWithBlock:", v22);
        v11 = v6;
        v12 = v5;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("share1"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("share2"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject appendData:](v21, "appendData:", v14);
        objc_msgSend(v20, "appendData:", v15);

        v5 = v12;
        v6 = v11;

      }
    }
    v26[0] = CFSTR("share1");
    v26[1] = CFSTR("share2");
    v16 = v20;
    v17 = v21;
    v27[0] = v21;
    v27[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_DPPrioCountMinSketchValueRandomizer randomize:metadata:].cold.1(v17);
    v18 = 0;
  }

  return v18;
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

- (id)randomizeStrings:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  _DPPrioRecord *v20;
  id v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v24 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  v22 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(obj);
        -[_DPPrioCountMinSketchValueRandomizer randomize:metadata:](self, "randomize:metadata:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("share1"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("share2"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v24, v18, v19, -[_DPPrioCountMinSketchValueRandomizer m](self, "m"), v9, 0, v12, 0);
          if (v20)
            objc_msgSend(v22, "addObject:", v20);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  return v22;
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

- (void)randomize:(os_log_t)log metadata:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Failed to create PrioAlgorithm.", v1, 2u);
}

@end
