@implementation _DPPrioPlusPlusMetricsValueRandomizer

- (_DPPrioPlusPlusMetricsValueRandomizer)init
{

  return 0;
}

- (_DPPrioPlusPlusMetricsValueRandomizer)initWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5
{
  BOOL v6;
  BOOL v9;
  _DPPrioPlusPlusMetricsValueRandomizer *v10;
  _DPPrioPlusPlusMetricsValueRandomizer *v11;
  objc_super v13;

  v6 = a3 < 0.0 || a3 > 16.0;
  if (v6 || (a4 > 0.0 ? (v9 = a5 == 0) : (v9 = 1), v9))
  {
    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPPrioPlusPlusMetricsValueRandomizer;
    v11 = -[_DPPrioPlusPlusMetricsValueRandomizer init](&v13, sel_init, 16.0);
    if (v11)
    {
      v11->_epsilon = a3;
      v11->_delta = a4;
      v11->_n = a5;
    }
    self = v11;
    v10 = self;
  }

  return v10;
}

+ (id)randomizerWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:delta:maxLength:", a5, a3, a4);
}

- (id)randomizeFloatVector:(id)a3 metadata:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t *p_n;
  unint64_t n;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;

  v5 = a3;
  v6 = (unint64_t)objc_msgSend(v5, "length") >> 2;
  n = self->_n;
  p_n = (uint64_t *)&self->_n;
  if (v6 > n)
  {
    +[_DPLog framework](_DPLog, "framework");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_DPPrioPlusPlusMetricsValueRandomizer randomizeFloatVector:metadata:].cold.1(p_n, v6, v9);
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  +[_DPPrioPlusPlusMetricsAlgorithm initializeWithSecretSharingSigma:dimensionality:](_DPPrioPlusPlusMetricsAlgorithm, "initializeWithSecretSharingSigma:dimensionality:", v6, 1000.0);
  v10 = objc_claimAutoreleasedReturnValue();
  v9 = v10;
  if (!v10)
  {
    +[_DPLog framework](_DPLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_DPPrioPlusPlusMetricsValueRandomizer randomizeFloatVector:metadata:].cold.2(v12);

    goto LABEL_9;
  }
  -[NSObject randomize:](v10, "randomize:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
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

- (id)randomizeFloatVectors:(id)a3 forKey:(id)a4
{
  return -[_DPPrioPlusPlusMetricsValueRandomizer randomizeFloatVectors:metadata:forKey:](self, "randomizeFloatVectors:metadata:forKey:", a3, MEMORY[0x1E0C9AA70], a4);
}

- (id)randomizeFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _DPPrioRecord *v21;
  id v23;
  id obj;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v25 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  v23 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        -[_DPPrioPlusPlusMetricsValueRandomizer randomizeFloatVector:metadata:](self, "randomizeFloatVector:metadata:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("share1"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("share2"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("dimensionality"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v8;
          v21 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v25, v17, v18, objc_msgSend(v19, "longLongValue"), v20, 0, v11, 0);
          if (v21)
            objc_msgSend(v23, "addObject:", v21);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }

  return v23;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (double)delta
{
  return self->_delta;
}

- (unint64_t)n
{
  return self->_n;
}

- (void)randomizeFloatVector:(os_log_t)log metadata:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = v3;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Float vector dimension %lu exceeds limit %lu for PrioPlusPlusMetricsAlgorithm.", (uint8_t *)&v4, 0x16u);
}

- (void)randomizeFloatVector:(os_log_t)log metadata:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Failed to create _DPPrioPlusPlusMetricsAlgorithm.", v1, 2u);
}

@end
