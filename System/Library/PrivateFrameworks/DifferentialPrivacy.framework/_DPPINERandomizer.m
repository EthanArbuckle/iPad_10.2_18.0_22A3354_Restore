@implementation _DPPINERandomizer

+ (id)new
{
  return 0;
}

- (_DPPINERandomizer)init
{

  return 0;
}

+ (BOOL)isValidCentralEpsilon:(double)a3 plistParameter:(id)a4
{
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  BOOL v26;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (a3 >= 0.0 && a3 <= 16.0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v34[0] = CFSTR("MaxCentralDelta");
    v34[1] = CFSTR("PINEFractionalBitCount");
    v34[2] = CFSTR("MaxDimension");
    v34[3] = CFSTR("VDAFType");
    v34[4] = CFSTR("VDAFNumOfProofs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            +[_DPLog framework](_DPLog, "framework");
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.6();

            goto LABEL_24;
          }

        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v16)
          continue;
        break;
      }
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VDAFType"));
    v14 = objc_claimAutoreleasedReturnValue();
    if (+[_DPPINEShim isValidPINEType:](_DPPINEShim, "isValidPINEType:", -[NSObject unsignedIntValue](v14, "unsignedIntValue")))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VDAFNumOfProofs"));
      v20 = objc_claimAutoreleasedReturnValue();
      if (+[_DPPINEShim isValidNumOfProofs:](_DPPINEShim, "isValidNumOfProofs:", -[NSObject unsignedIntValue](v20, "unsignedIntValue")))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxCentralDelta"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

        if (v23 > 0.0)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MaxDimension"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "unsignedLongLongValue");

          if (+[_DPPrioPlusPlusNoiseGenerator isValidDimension:](_DPPrioPlusPlusNoiseGenerator, "isValidDimension:", v29))
          {
            v26 = 1;
            goto LABEL_32;
          }
          +[_DPLog framework](_DPLog, "framework");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.3(v5, (uint64_t)CFSTR("MaxDimension"), v24);
        }
        else
        {
          +[_DPLog framework](_DPLog, "framework");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.2(v5, (uint64_t)CFSTR("MaxCentralDelta"), v24);
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.4();
      }

    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.5();
    }
    v26 = 0;
LABEL_32:

    goto LABEL_25;
  }
  +[_DPLog framework](_DPLog, "framework", 16.0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:].cold.1(v14, v7, v8, v9, v10, v11, v12, v13);
LABEL_24:
  v26 = 0;
LABEL_25:

  return v26;
}

- (_DPPINERandomizer)initWithMaxCentralEpsilon:(double)a3 parameter:(id)a4
{
  id v6;
  _DPPINERandomizer *v7;
  _DPPINERandomizer *v8;
  uint64_t v9;
  NSDictionary *plistParameter;
  _DPPINERandomizer *v11;
  objc_super v13;

  v6 = a4;
  if (objc_msgSend((id)objc_opt_class(), "isValidCentralEpsilon:plistParameter:", v6, a3))
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPPINERandomizer;
    v7 = -[_DPPINERandomizer init](&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_maxCentralEpsilon = a3;
      v9 = objc_msgSend(v6, "copy");
      plistParameter = v8->_plistParameter;
      v8->_plistParameter = (NSDictionary *)v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)randomizerWithMaxCentralEpsilon:(double)a3 parameters:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMaxCentralEpsilon:parameter:", v6, a3);

  return v7;
}

- (id)addNoiseToData:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  float *v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SigmaAfterNormalizing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CurrentCohortSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v12, "longLongValue"))
    {
      +[_DPLog framework](_DPLog, "framework");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[_DPPINERandomizer addNoiseToData:metadata:].cold.2();
      goto LABEL_13;
    }
    v10 = v10 / sqrt((double)objc_msgSend(v12, "longLongValue"));
  }
  if (!+[_DPPrioPlusPlusNoiseGenerator isValidSigma:](_DPPrioPlusPlusNoiseGenerator, "isValidSigma:", v10))
  {
    +[_DPLog framework](_DPLog, "framework");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_DPPINERandomizer addNoiseToData:metadata:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
LABEL_13:

    v16 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithData:", v5);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (float *)objc_msgSend(v13, "mutableBytes");
  v15 = (unint64_t)objc_msgSend(v13, "length") >> 2;
  _DPClipNorm(v14, v15, 1.0);
  +[_DPPrioPlusPlusNoiseGenerator randomize:dimension:stddev:](_DPPrioPlusPlusNoiseGenerator, "randomize:dimension:stddev:", v13, v15, v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16)
    v16 = v13;

LABEL_14:
  return v16;
}

- (id)pineParameterWithMetaData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _DPPINEParameter *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  double v18;
  _DPPINEParameter *v19;
  NSObject *v20;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PINEL2NormBound"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "floatValue");
    -[_DPPINERandomizer plistParameter](self, "plistParameter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PINEFractionalBitCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPPINERandomizer plistParameter](self, "plistParameter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VDAFNumOfProofs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_DPPINERandomizer plistParameter](self, "plistParameter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("VDAFType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntValue");

    v13 = [_DPPINEParameter alloc];
    v14 = objc_msgSend(v7, "integerValue");
    objc_msgSend(v5, "floatValue");
    v16 = v15;
    v17 = objc_msgSend(v9, "integerValue");
    LODWORD(v18) = v16;
    v19 = -[_DPPINEParameter initWithFractionalBitCount:l2NormBound:numOfProofs:pineType:](v13, "initWithFractionalBitCount:l2NormBound:numOfProofs:pineType:", v14, v17, v12, v18);

  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[_DPPINERandomizer pineParameterWithMetaData:].cold.1();

    v19 = 0;
  }

  return v19;
}

- (id)randomizeFloatVector:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  float v19;
  float v20;
  float v21;
  NSObject *v22;
  NSObject *v23;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (unint64_t)objc_msgSend(v6, "length") >> 2;
  -[_DPPINERandomizer plistParameter](self, "plistParameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MaxDimension"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  if (v8 > v11)
  {
    +[_DPLog framework](_DPLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_DPPINERandomizer randomizeFloatVector:metadata:].cold.1();
    goto LABEL_4;
  }
  -[_DPPINERandomizer plistParameter](self, "plistParameter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MaxCentralDelta"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");

  -[_DPPINERandomizer maxCentralEpsilon](self, "maxCentralEpsilon");
  if (+[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:](_DPRandomizerUtils, "containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:", v7))
  {
    -[_DPPINERandomizer pineParameterWithMetaData:](self, "pineParameterWithMetaData:", v7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[_DPPINERandomizer addNoiseToData:metadata:](self, "addNoiseToData:metadata:", v6, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = objc_retainAutorelease(v16);
        v19 = _DPL2Norm((float *)objc_msgSend(v18, "bytes"), v8);
        -[NSObject l2NormBound](v12, "l2NormBound");
        if (v19 >= v20)
          -[_DPPINERandomizer randomizeFloatVector:metadata:].cold.2();
        -[NSObject l2NormBound](v12, "l2NormBound");
        if (v19 <= v21)
        {
          v25 = 0;
          +[_DPPINEShim shard:parameter:error:](_DPPINEShim, "shard:parameter:error:", v18, v12, &v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v25;
          if (!v13)
          {
            +[_DPLog framework](_DPLog, "framework");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[_DPPINERandomizer randomizeFloatVector:metadata:].cold.4();

          }
        }
        else
        {
          +[_DPLog framework](_DPLog, "framework");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[_DPPINERandomizer randomizeFloatVector:metadata:].cold.3(v12, v22, v19);
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

      goto LABEL_21;
    }
LABEL_4:
    v13 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v13 = 0;
LABEL_22:

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
  void *v19;
  void *v20;
  _DPPrioRecord *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _DPPrioRecord *v27;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99D68];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dateWithTimeIntervalSinceNow:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = (void *)objc_msgSend(v9, "mutableCopy");
  v29[0] = CFSTR("PINEL2NormBound");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "l2NormBound");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v16;
  v29[1] = CFSTR("PINEChunkLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "chunkLength"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v17;
  v29[2] = CFSTR("Nonce");
  objc_msgSend(v10, "nonce");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v18;
  v29[3] = CFSTR("PublicShare");
  objc_msgSend(v10, "publicShare");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("VDAF"));

  v21 = [_DPPrioRecord alloc];
  objc_msgSend(v10, "inputShares");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputShares");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v10, "dimension");

  v27 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:](v21, "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v8, v23, v25, v26, v14, 0, v13, 0);
  return v27;
}

- (id)randomizeFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v23;
    *(_QWORD *)&v14 = 138412290;
    v21 = v14;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v12);
        -[_DPPINERandomizer randomizeFloatVector:metadata:](self, "randomizeFloatVector:metadata:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17), v9, v21, (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[_DPPINERandomizer recordWithShardResult:metadata:key:](self, "recordWithShardResult:metadata:key:", v18, v9, v10);
          v19 = objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v11, "addObject:", v19);
        }
        else
        {
          +[_DPLog framework](_DPLog, "framework");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v21;
            v27 = v10;
            _os_log_error_impl(&dword_1D3FAA000, v19, OS_LOG_TYPE_ERROR, "Fail to private vector with key=%@, continuing...", buf, 0xCu);
          }
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v15);
  }

  return v11;
}

- (double)maxCentralEpsilon
{
  return self->_maxCentralEpsilon;
}

- (NSDictionary)plistParameter
{
  return self->_plistParameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistParameter, 0);
}

+ (void)isValidCentralEpsilon:(NSObject *)a3 plistParameter:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, a3, v5, "Invalid parameter in plist: kDPMaxCentralDelta=%@", v6);

  OUTLINED_FUNCTION_3();
}

+ (void)isValidCentralEpsilon:(NSObject *)a3 plistParameter:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_1D3FAA000, a3, v5, "Invalid parameter in plist: kDPPINEMaxDimension=%@", v6);

  OUTLINED_FUNCTION_3();
}

+ (void)isValidCentralEpsilon:plistParameter:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Invalid parameter in plist: kDPVDAFNumOfProofs=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)isValidCentralEpsilon:plistParameter:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Invalid parameter in plist: kDPVDAFType=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)isValidCentralEpsilon:plistParameter:.cold.6()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v1, (uint64_t)v1, "Invalid parameter in plist: key=%@, value= (%@)", v2);
  OUTLINED_FUNCTION_1();
}

- (void)addNoiseToData:(uint64_t)a3 metadata:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Invalid sigma=%f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)addNoiseToData:metadata:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Invalid value for kDPMetadataAlgoParamCurrentCohortSize=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)pineParameterWithMetaData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Invalid kDPMetadataAlgoParamPINEL2NormBound=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)randomizeFloatVector:metadata:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v1, (uint64_t)v1, "Float vector dimension=%lu exceeds limit=%lu", v2);
  OUTLINED_FUNCTION_1();
}

- (void)randomizeFloatVector:metadata:.cold.2()
{
  __assert_rtn("-[_DPPINERandomizer randomizeFloatVector:metadata:]", "_DPPINERandomizer.m", 184, "noisedNorm < pineParameter.l2NormBound");
}

- (void)randomizeFloatVector:(float)a3 metadata:.cold.3(void *a1, NSObject *a2, float a3)
{
  double v4;
  float v5;
  uint64_t v6;
  int v7;
  double v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "l2NormBound");
  v7 = 134218240;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a2, v6, "L2 norm for noised data = %f > norm bound = %f", (uint8_t *)&v7);
}

- (void)randomizeFloatVector:metadata:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Fail to shard with error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
