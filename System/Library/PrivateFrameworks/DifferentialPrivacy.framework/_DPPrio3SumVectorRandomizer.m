@implementation _DPPrio3SumVectorRandomizer

+ (id)new
{
  return 0;
}

- (_DPPrio3SumVectorRandomizer)init
{

  return 0;
}

- (_DPPrio3SumVectorRandomizer)initWithEpsilon:(double)a3 parameters:(id)a4
{
  id v7;
  void *v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _DPPrio3SumVectorRandomizer *v18;
  NSObject *v19;
  NSObject *v20;
  _DPPrio3SumVectorRandomizer *v21;
  _DPPrio3SumVectorRandomizer *v22;
  _DPPrio3SumVectorParameter *v23;
  _DPPrio3SumVectorParameter *parameters;
  NSObject *v25;
  objc_super v27;

  v7 = a4;
  v8 = v7;
  if (a3 >= 0.0 && a3 <= 16.0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Prio3SumVectorBitWidth"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || -[NSObject integerValue](v10, "integerValue") != 1)
    {
      +[_DPLog framework](_DPLog, "framework");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:].cold.4();
      v18 = 0;
      goto LABEL_27;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VDAFNumOfProofs"));
    v19 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && +[_DPPrio3SumVectorShim isValidNumOfProofs:](_DPPrio3SumVectorShim, "isValidNumOfProofs:", -[NSObject integerValue](v19, "integerValue")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VDAFType"));
      v20 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && +[_DPPrio3SumVectorShim isValidVDAFType:](_DPPrio3SumVectorShim, "isValidVDAFType:", -[NSObject unsignedIntValue](v20, "unsignedIntValue")))
      {
        v27.receiver = self;
        v27.super_class = (Class)_DPPrio3SumVectorRandomizer;
        v21 = -[_DPPrio3SumVectorRandomizer init](&v27, sel_init);
        v22 = v21;
        if (v21)
        {
          v21->_defaultLocalEpsilon = a3;
          objc_storeStrong((id *)&v21->_plistParameters, a4);
          v23 = -[_DPPrio3SumVectorParameter initWithBitWidth:numOfAggregators:numOfProofs:vdafType:]([_DPPrio3SumVectorParameter alloc], "initWithBitWidth:numOfAggregators:numOfProofs:vdafType:", -[NSObject integerValue](v10, "integerValue"), 2, -[NSObject integerValue](v19, "integerValue"), -[NSObject unsignedIntValue](v20, "unsignedIntValue"));
          parameters = v22->_parameters;
          v22->_parameters = v23;

        }
        self = v22;
        v18 = self;
        goto LABEL_26;
      }
      +[_DPLog framework](_DPLog, "framework");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:].cold.2();

    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:].cold.3();
    }
    v18 = 0;
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  +[_DPLog framework](_DPLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  v18 = 0;
LABEL_28:

  return v18;
}

+ (id)randomizerWithEpsilon:(double)a3 parameters:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:parameters:", v6, a3);

  return v7;
}

- (BOOL)addNoiseToData:(id)a3 withLocalEpsilon:(double)a4 withError:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v7 = a3;
  +[_DPBiasedCoin coinWithBias:](_DPBiasedCoin, "coinWithBias:", (double)(1.0 / (exp(a4) + 1.0)));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "mutableBytes");
  if (objc_msgSend(v9, "length"))
  {
    v11 = 0;
    while (*(unsigned __int8 *)(v10 + v11) < 2u)
    {
      if (objc_msgSend(v8, "flip"))
        *(_BYTE *)(v10 + v11) = *(_BYTE *)(v10 + v11) == 0;
      if (++v11 >= (unint64_t)objc_msgSend(v9, "length"))
        goto LABEL_7;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid value (%d) at position %zu"), *(unsigned __int8 *)(v10 + v11), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _DPVDAFError(3, v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }
  else
  {
LABEL_7:
    LOBYTE(a5) = 1;
  }

  return (char)a5;
}

- (id)dimensionFromMetadata:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("AlgorithmParameters"), CFSTR("Dimensionality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_DPPrio3SumVectorRandomizer dimensionFromMetadata:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (id)randomizeBitValue:(id)a3 withLocalEpsilon:(double)a4 metadata:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;

  v10 = a3;
  -[_DPPrio3SumVectorRandomizer dimensionFromMetadata:](self, "dimensionFromMetadata:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, "unsignedLongValue");
    if (v13 > 0x186A0)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dimension=(%lu) should be less than or equal to %zu"), v13, 100000);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 4;
LABEL_13:
        _DPVDAFError(v15, v14);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || v13 <= objc_msgSend(v10, "unsignedLongValue"))
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bitValue=(%@) >= dimension=(%@)"), v10, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 2;
        goto LABEL_13;
      }
LABEL_14:
      v16 = 0;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v13);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "mutableBytes");
    *(_BYTE *)(v18 + objc_msgSend(v10, "unsignedLongValue")) = 1;
    if (-[_DPPrio3SumVectorRandomizer addNoiseToData:withLocalEpsilon:withError:](self, "addNoiseToData:withLocalEpsilon:withError:", v17, a6, a4))
    {
      -[_DPPrio3SumVectorRandomizer parameters](self, "parameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPPrio3SumVectorShim shard:parameter:error:](_DPPrio3SumVectorShim, "shard:parameter:error:", v17, v19, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    if (!a6)
      goto LABEL_14;
    _DPVDAFError(1, CFSTR("Fail to fetch dimension"));
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v16;
}

- (id)randomizeVector:(id)a3 withLocalEpsilon:(double)a4 metadata:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  if (v10)
  {
    if ((unint64_t)objc_msgSend(v10, "length") > 0x186A0)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dimension=(%lu) should be less than or equal to %zu"), objc_msgSend(v10, "length"), 100000);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _DPVDAFError(4, v12);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithData:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_DPPrio3SumVectorRandomizer addNoiseToData:withLocalEpsilon:withError:](self, "addNoiseToData:withLocalEpsilon:withError:", v14, a6, a4))
    {
      -[_DPPrio3SumVectorRandomizer parameters](self, "parameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DPPrio3SumVectorShim shard:parameter:error:](_DPPrio3SumVectorShim, "shard:parameter:error:", v14, v15, a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    if (!a6)
    {
LABEL_7:
      v13 = 0;
      goto LABEL_12;
    }
    _DPVDAFError(4, CFSTR("vector must not be nil"));
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v13;
}

- (id)recordWithShardResult:(id)a3 metadata:(id)a4 key:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _DPPrioRecord *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _DPPrioRecord *v25;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dateWithTimeIntervalSinceNow:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = (void *)objc_msgSend(v9, "mutableCopy");
  v27[0] = CFSTR("Prio3SumVectorChunkLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "chunkLength"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v27[1] = CFSTR("Nonce");
  objc_msgSend(v10, "nonce");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  v27[2] = CFSTR("PublicShare");
  objc_msgSend(v10, "publicShare");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("VDAF"));

  v19 = [_DPPrioRecord alloc];
  objc_msgSend(v10, "inputShares");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputShares");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v10, "dimension");

  v25 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:](v19, "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v8, v21, v23, v24, v14, 0, v13, 0);
  return v25;
}

- (id)randomizeBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  id v29;
  id v30;
  NSObject *obj;
  id v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = a5;
  -[_DPPrio3SumVectorRandomizer plistParameters](self, "plistParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:error:](_DPBudgetAuditor, "budgetAuditorFromMetadata:plistParameters:error:", v9, v10, &v42);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v42;

  if (v11)
  {
    v41 = v12;
    objc_msgSend(v11, "getSymmetricRAPPORLocalEpsilonWithError:", &v41);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v41;

    v34 = v13;
    if (v13)
    {
      v40 = v14;
      objc_msgSend(v11, "auditedMetadataWithError:", &v40);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v40;

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        obj = v8;
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
        if (v16)
        {
          v17 = v16;
          v28 = v9;
          v29 = v8;
          v33 = *(_QWORD *)v37;
          do
          {
            v18 = 0;
            v19 = v12;
            do
            {
              if (*(_QWORD *)v37 != v33)
                objc_enumerationMutation(obj);
              v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v18);
              +[_DPLog framework](_DPLog, "framework");
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v44 = v20;
                _os_log_debug_impl(&dword_1D3FAA000, v21, OS_LOG_TYPE_DEBUG, "Start to privatize bitValue=%@", buf, 0xCu);
              }

              v22 = (void *)MEMORY[0x1D8256B78]();
              -[NSObject doubleValue](v34, "doubleValue");
              v35 = v19;
              -[_DPPrio3SumVectorRandomizer randomizeBitValue:withLocalEpsilon:metadata:error:](self, "randomizeBitValue:withLocalEpsilon:metadata:error:", v20, v15, &v35);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = v35;

              if (v23)
              {
                -[_DPPrio3SumVectorRandomizer recordWithShardResult:metadata:key:](self, "recordWithShardResult:metadata:key:", v23, v15, v32);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                  objc_msgSend(v30, "addObject:", v24);

                objc_autoreleasePoolPop(v22);
                +[_DPLog framework](_DPLog, "framework");
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v44 = v20;
                  _os_log_debug_impl(&dword_1D3FAA000, v25, OS_LOG_TYPE_DEBUG, "Done to privatize bitValue=%@", buf, 0xCu);
                }

              }
              else
              {
                +[_DPLog framework](_DPLog, "framework");
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v44 = v20;
                  v45 = 2112;
                  v46 = v12;
                  _os_log_error_impl(&dword_1D3FAA000, v26, OS_LOG_TYPE_ERROR, "Fail to privatize bitValue=%@ with error=%@", buf, 0x16u);
                }

                objc_autoreleasePoolPop(v22);
              }
              ++v18;
              v19 = v12;
            }
            while (v17 != v18);
            v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
          }
          while (v17);
          v9 = v28;
          v8 = v29;
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        obj = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:].cold.2();
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
      v12 = v14;
    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:].cold.1();
    v30 = 0;
  }

  return v30;
}

- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v26;
  id v27;
  id v28;
  id v29;
  NSObject *obj;
  id v31;
  NSObject *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v31 = a5;
  -[_DPPrio3SumVectorRandomizer plistParameters](self, "plistParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:error:](_DPBudgetAuditor, "budgetAuditorFromMetadata:plistParameters:error:", v9, v10, &v40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v40;

  if (v11)
  {
    v39 = v12;
    objc_msgSend(v11, "getSymmetricRAPPORLocalEpsilonWithError:", &v39);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v39;

    v32 = v13;
    if (v13)
    {
      v38 = v14;
      objc_msgSend(v11, "auditedMetadataWithError:", &v38);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v38;

      if (v15)
      {
        v29 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        obj = v8;
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
        if (v16)
        {
          v17 = v16;
          v26 = v11;
          v27 = v9;
          v28 = v8;
          v18 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              v20 = v12;
              if (*(_QWORD *)v35 != v18)
                objc_enumerationMutation(obj);
              v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
              v22 = (void *)MEMORY[0x1D8256B78]();
              -[NSObject doubleValue](v32, "doubleValue");
              v33 = v12;
              -[_DPPrio3SumVectorRandomizer randomizeVector:withLocalEpsilon:metadata:error:](self, "randomizeVector:withLocalEpsilon:metadata:error:", v21, v15, &v33);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = v33;

              if (v23)
              {
                -[_DPPrio3SumVectorRandomizer recordWithShardResult:metadata:key:](self, "recordWithShardResult:metadata:key:", v23, v15, v31);
                v24 = objc_claimAutoreleasedReturnValue();
                if (v24)
                  objc_msgSend(v29, "addObject:", v24);
              }
              else
              {
                +[_DPLog framework](_DPLog, "framework");
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v42 = v21;
                  v43 = 2112;
                  v44 = v12;
                  _os_log_error_impl(&dword_1D3FAA000, v24, OS_LOG_TYPE_ERROR, "Fail to privatize vector=%@ with error=%@", buf, 0x16u);
                }
              }

              objc_autoreleasePoolPop(v22);
            }
            v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
          }
          while (v17);
          v9 = v27;
          v8 = v28;
          v11 = v26;
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        obj = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:].cold.2();
        v29 = 0;
      }

    }
    else
    {
      v29 = 0;
      v12 = v14;
    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:].cold.1();
    v29 = 0;
  }

  return v29;
}

- (double)defaultLocalEpsilon
{
  return self->_defaultLocalEpsilon;
}

- (NSDictionary)plistParameters
{
  return self->_plistParameters;
}

- (_DPPrio3SumVectorParameter)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_plistParameters, 0);
}

- (void)initWithEpsilon:(uint64_t)a3 parameters:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Invalid epsilon = %f.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithEpsilon:parameters:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Unknown VDAFType = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithEpsilon:parameters:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Invalid numOfProofs = %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithEpsilon:parameters:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Invalid bitWidth = %@: must be one", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dimensionFromMetadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "key(%@) is required in metadata.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)randomizeBitValues:metadata:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Failed to create DP budget auditor, error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)randomizeBitValues:metadata:forKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Donation failed DP auditing check, error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
