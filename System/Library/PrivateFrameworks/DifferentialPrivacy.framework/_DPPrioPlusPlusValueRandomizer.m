@implementation _DPPrioPlusPlusValueRandomizer

- (_DPPrioPlusPlusValueRandomizer)init
{

  return 0;
}

- (_DPPrioPlusPlusValueRandomizer)initWithEpsilon:(double)a3 delta:(double)a4 maxLength:(unint64_t)a5
{
  BOOL v6;
  BOOL v9;
  _DPPrioPlusPlusValueRandomizer *v10;
  _DPPrioPlusPlusValueRandomizer *v11;
  objc_super v13;

  v6 = a3 < 0.0 || a3 > 16.0;
  if (v6 || (a4 > 0.0 ? (v9 = a5 == 0) : (v9 = 1), v9))
  {
    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPPrioPlusPlusValueRandomizer;
    v11 = -[_DPPrioPlusPlusValueRandomizer init](&v13, sel_init, 16.0);
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
  id v6;
  id v7;
  unint64_t v8;
  uint64_t *p_n;
  NSObject *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v6 = a3;
  v7 = a4;
  v8 = (unint64_t)objc_msgSend(v6, "length") >> 2;
  p_n = (uint64_t *)&self->_n;
  if (v8 > self->_n)
  {
    +[_DPLog framework](_DPLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_DPPrioPlusPlusValueRandomizer randomizeFloatVector:metadata:].cold.1(p_n, v8, v10);
LABEL_14:
    v23 = 0;
    goto LABEL_15;
  }
  -[_DPPrioPlusPlusValueRandomizer epsilon](self, "epsilon");
  v12 = v11;
  -[_DPPrioPlusPlusValueRandomizer delta](self, "delta");
  if (!+[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:](_DPRandomizerUtils, "containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:", v7, v12, v13))
  {
    +[_DPLog framework](_DPLog, "framework");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_DPPrioPlusPlusValueRandomizer randomizeFloatVector:metadata:].cold.3(v10, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_14;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SigmaAfterNormalizing"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CurrentCohortSize"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("CurrentCohortSize"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v17 / sqrt((double)objc_msgSend(v21, "longLongValue"));

  }
  +[_DPPrioPlusPlusAlgorithm initializeWithSigma:secretSharingSigma:dimensionality:](_DPPrioPlusPlusAlgorithm, "initializeWithSigma:secretSharingSigma:dimensionality:", v8, v17, 1000.0);
  v22 = objc_claimAutoreleasedReturnValue();
  v10 = v22;
  if (!v22)
  {
    +[_DPLog framework](_DPLog, "framework");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[_DPPrioPlusPlusValueRandomizer randomizeFloatVector:metadata:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);

    goto LABEL_14;
  }
  -[NSObject randomize:](v22, "randomize:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v23;
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
  return -[_DPPrioPlusPlusValueRandomizer randomizeFloatVectors:metadata:forKey:](self, "randomizeFloatVectors:metadata:forKey:", a3, MEMORY[0x1E0C9AA70], a4);
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
        -[_DPPrioPlusPlusValueRandomizer randomizeFloatVector:metadata:](self, "randomizeFloatVector:metadata:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), v8);
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
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Float vector dimension %lu exceeds limit %lu for PrioPlusPlusAlgorithm.", (uint8_t *)&v4, 0x16u);
}

- (void)randomizeFloatVector:(uint64_t)a3 metadata:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Failed to create PrioPlusPlusAlgorithm.", a5, a6, a7, a8, 0);
}

- (void)randomizeFloatVector:(uint64_t)a3 metadata:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, a1, a3, "Privacy parameters check failed for PrioPlusPlusAlgorithm.", a5, a6, a7, a8, 0);
}

@end
