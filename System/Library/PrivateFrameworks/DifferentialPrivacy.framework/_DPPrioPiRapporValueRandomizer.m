@implementation _DPPrioPiRapporValueRandomizer

- (_DPPrioPiRapporValueRandomizer)init
{

  return 0;
}

- (_DPPrioPiRapporValueRandomizer)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5 piRapporPrime:(unsigned int)a6 piRapporAlpha0:(double)a7 piRapporAlpha1:(double)a8
{
  _DPPrioPiRapporValueRandomizer *v8;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  unsigned int v14;
  unsigned int v17;
  _DPPrioPiRapporValueRandomizer *v18;
  _DPPrioPiRapporValueRandomizer *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v29;

  v8 = self;
  if (!a4 || ((v10 = 16.0, a3 >= 0.0) ? (v11 = a3 > 16.0) : (v11 = 1), v11))
  {
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  v12 = a8;
  v13 = a7;
  v14 = a6;
  if (a6 || a7 != 0.0 || a8 != 0.0)
    goto LABEL_11;
  v17 = (int)a3 - 2;
  if (v17 >= 9)
  {
    +[_DPLog framework](_DPLog, "framework", 16.0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[_DPPrioPiRapporValueRandomizer initWithEpsilon:dimensionality:dynamicVectorSize:piRapporPrime:piRapporAlpha0:piRapporAlpha1:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    goto LABEL_17;
  }
  v14 = kPrecomputedPrime[v17];
  v13 = kPrecomputedAlpha0[v17];
  v10 = 1.0;
  v12 = 1.0 - v13;
LABEL_11:
  v29.receiver = self;
  v29.super_class = (Class)_DPPrioPiRapporValueRandomizer;
  v18 = -[_DPPrioPiRapporValueRandomizer init](&v29, sel_init, v10);
  if (v18)
  {
    v18->_piRapporAlpha1 = v12;
    v18->_epsilon = a3;
    v18->_p = a4;
    v18->_dynamicVectorSize = a5;
    v18->_piRapporPrime = v14;
    v18->_piRapporAlpha0 = v13;
  }
  v8 = v18;
  v19 = v8;
LABEL_18:

  return v19;
}

+ (id)randomizerWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5 piRapporPrime:(unsigned int)a6 piRapporAlpha0:(double)a7 piRapporAlpha1:(double)a8
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:dimensionality:dynamicVectorSize:piRapporPrime:piRapporAlpha0:piRapporAlpha1:", a4, a5, *(_QWORD *)&a6, a3, a7, a8);
}

- (id)randomize:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[_DPPrioPiRapporValueRandomizer p](self, "p");
  if (-[_DPPrioPiRapporValueRandomizer dynamicVectorSize](self, "dynamicVectorSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("AlgorithmParameters"), CFSTR("Dimensionality"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v8 = objc_msgSend(v10, "unsignedIntegerValue");

  }
  if (objc_msgSend(v6, "unsignedIntegerValue") >= v8)
  {
    +[_DPLog framework](_DPLog, "framework");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_DPPrioPiRapporValueRandomizer randomize:metadata:].cold.1();
    v13 = 0;
  }
  else
  {
    v15[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:](self, "encodeClassIndices:withDimensionality:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)randomizeVector:(id)a3 metadata:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v5 = a3;
  if (-[_DPPrioPiRapporValueRandomizer dynamicVectorSize](self, "dynamicVectorSize"))
    v6 = objc_msgSend(v5, "length");
  else
    v6 = -[_DPPrioPiRapporValueRandomizer p](self, "p");
  v7 = v6;
  if (objc_msgSend(v5, "length") != v6)
  {
    +[_DPLog framework](_DPLog, "framework");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_DPPrioPiRapporValueRandomizer randomizeVector:metadata:].cold.3(v5, v7, v8);
    goto LABEL_20;
  }
  v8 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v9 = objc_retainAutorelease(v5);
  v10 = objc_msgSend(v9, "bytes");
  if (objc_msgSend(v9, "length"))
  {
    v11 = 0;
    while (*(unsigned __int8 *)(v10 + v11) < 2u)
    {
      if (*(_BYTE *)(v10 + v11))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v8, "addObject:", v12);

      }
      if (++v11 >= (unint64_t)objc_msgSend(v9, "length"))
        goto LABEL_11;
    }
    +[_DPLog framework](_DPLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DPPrioPiRapporValueRandomizer randomizeVector:metadata:].cold.2();
    goto LABEL_19;
  }
LABEL_11:
  if (!-[NSObject count](v8, "count"))
  {
    +[_DPLog framework](_DPLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DPPrioPiRapporValueRandomizer randomizeVector:metadata:].cold.1();
LABEL_19:

LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:](self, "encodeClassIndices:withDimensionality:", v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v13;
}

- (id)encodeClassIndices:(id)a3 withDimensionality:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, unint64_t);
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;

  v6 = a3;
  v7 = -[_DPPrioPiRapporValueRandomizer piRapporPrime](self, "piRapporPrime");
  -[_DPPrioPiRapporValueRandomizer piRapporAlpha0](self, "piRapporAlpha0");
  v9 = v8;
  -[_DPPrioPiRapporValueRandomizer piRapporAlpha1](self, "piRapporAlpha1");
  +[_DPPiRapporAlgorithm piRapporWithNumberOfClasses:prime:alpha0:alpha1:](_DPPiRapporAlgorithm, "piRapporWithNumberOfClasses:prime:alpha0:alpha1:", a4, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[_DPLog framework](_DPLog, "framework");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:].cold.1();
    goto LABEL_7;
  }
  v12 = objc_msgSend(v6, "count");
  if (-[_DPPrioPiRapporValueRandomizer getAllocationSizeWithPiRapporAlgorithm:numberOfEncodedIndices:](self, "getAllocationSizeWithPiRapporAlgorithm:numberOfEncodedIndices:", v11, v12) < 0x100000)
  {
    -[_DPPrioPiRapporValueRandomizer epsilon](self, "epsilon");
    +[_DPPrioAlgorithm prioWithEpsilon:dimensionality:](_DPPrioAlgorithm, "prioWithEpsilon:dimensionality:", v12 * objc_msgSend(v11, "prime"), v15);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v16 = (void *)MEMORY[0x1D8256B78]();
      objc_msgSend(v11, "encodeClassIndices:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = v17;
        objc_msgSend(v17, "phi0");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = objc_msgSend(v19, "bytes");

        v31 = MEMORY[0x1E0C809B0];
        v32 = 3221225472;
        v33 = __72___DPPrioPiRapporValueRandomizer_encodeClassIndices_withDimensionality___block_invoke;
        v34 = &unk_1E95D9CF0;
        v37 = v12;
        v38 = v20;
        v21 = v11;
        v35 = v21;
        v36 = v6;
        -[NSObject privatizeDataWithLocalDP:withBlock:](v13, "privatizeDataWithLocalDP:withBlock:", 0, &v31);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count", v31, v32, v33, v34);
        if (v23)
        {
          v24 = objc_msgSend(v22, "mutableCopy");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v25, CFSTR("numberOfEncodedIndices"));

          objc_msgSend(v18, "otherPhi");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v26, CFSTR("otherPhi"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "numberOfClasses"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v27, CFSTR("dimensionality"));

          v28 = -[NSObject copy](v24, "copy");
        }
        else
        {
          +[_DPLog framework](_DPLog, "framework");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:].cold.5();
          v28 = 0;
        }

        objc_autoreleasePoolPop(v16);
        if (v23)
        {
          v28 = v28;
          v14 = v28;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:].cold.4();

        objc_autoreleasePoolPop(v16);
        v28 = 0;
      }
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:].cold.3();
    }
    v14 = 0;
    goto LABEL_23;
  }
  +[_DPLog framework](_DPLog, "framework");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:].cold.2();
LABEL_7:
  v14 = 0;
LABEL_24:

  return v14;
}

- (unint64_t)getAllocationSizeWithPiRapporAlgorithm:(id)a3 numberOfEncodedIndices:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v5 = a3;
  v6 = prio_share_length(objc_msgSend(v5, "prime") * a4);
  v7 = +[_DPPrioSeedablePRNG seedLength](_DPPrioSeedablePRNG, "seedLength");
  v8 = objc_msgSend(v5, "numberOfOtherPhi");

  return v7 + 4 * v6 + 8 * a4 * v8 + 56;
}

- (id)createDPPrioRecordFromPrivatizedShares:(id)a3 forKey:(id)a4 withMetadata:(id)a5 withCreationDate:(double)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _DPDediscoPrioPiRapporShare *v16;
  void *v17;
  id v18;
  id v19;
  _DPDediscoPrioPiRapporShare *v20;
  _DPPrioRecord *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v10 = a3;
  v38 = a4;
  v37 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("share1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("share2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("numberOfEncodedIndices"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntegerValue");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("otherPhi"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_DPDediscoPrioPiRapporShare initWithPrioShare:numberOfEncodedIndices:piRapporOtherPhi:]([_DPDediscoPrioPiRapporShare alloc], "initWithPrioShare:numberOfEncodedIndices:piRapporOtherPhi:", v11, v14, v15);
  v40 = 0;
  -[_DPDediscoPrioPiRapporShare serializeAndReturnError:](v16, "serializeAndReturnError:", &v40);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v40;
  if (v18)
  {
    v19 = v18;
    +[_DPLog framework](_DPLog, "framework");
    v20 = (_DPDediscoPrioPiRapporShare *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_ERROR))
      -[_DPPrioPiRapporValueRandomizer createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:].cold.1();
    v21 = 0;
  }
  else
  {
    v36 = v17;
    v20 = -[_DPDediscoPrioPiRapporShare initWithPrioShare:numberOfEncodedIndices:piRapporOtherPhi:]([_DPDediscoPrioPiRapporShare alloc], "initWithPrioShare:numberOfEncodedIndices:piRapporOtherPhi:", v12, v14, v15);
    v39 = 0;
    -[_DPDediscoPrioPiRapporShare serializeAndReturnError:](v20, "serializeAndReturnError:", &v39);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v39;
    if (v19)
    {
      +[_DPLog framework](_DPLog, "framework");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[_DPPrioPiRapporValueRandomizer createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:].cold.1();
      v21 = 0;
    }
    else
    {
      v34 = v12;
      v35 = v22;
      objc_msgSend(v10, "objectForKeyedSubscript:");
      v32 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[_DPPrioPiRapporValueRandomizer piRapporPrime](self, "piRapporPrime"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("PiRapporPrime"));

      v26 = (void *)MEMORY[0x1E0CB37E8];
      -[_DPPrioPiRapporValueRandomizer piRapporAlpha0](self, "piRapporAlpha0");
      objc_msgSend(v26, "numberWithDouble:");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("PiRapporAlpha0"));

      v28 = (void *)MEMORY[0x1E0CB37E8];
      -[_DPPrioPiRapporValueRandomizer piRapporAlpha1](self, "piRapporAlpha1");
      objc_msgSend(v28, "numberWithDouble:");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("PiRapporAlpha1"));

      v23 = v32;
      v30 = (void *)objc_msgSend(v37, "mutableCopy");
      v33 = v24;
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, CFSTR("AlgorithmParameters"));
      if (-[_DPPrioPiRapporValueRandomizer dynamicVectorSize](self, "dynamicVectorSize"))
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("dimensionality"));
      v22 = v35;
      v21 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v38, v36, v35, -[NSObject longLongValue](v32, "longLongValue"), v30, 0, a6, 0);

      v12 = v34;
    }

    v17 = v36;
  }

  return v21;
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

- (id)randomizeBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        -[_DPPrioPiRapporValueRandomizer randomize:metadata:](self, "randomize:metadata:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19), v9, (_QWORD)v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          -[_DPPrioPiRapporValueRandomizer createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:](self, "createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:", v20, v10, v9, v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v14, "addObject:", v21);

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  return v14;
}

- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        -[_DPPrioPiRapporValueRandomizer randomizeVector:metadata:](self, "randomizeVector:metadata:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19), v9, (_QWORD)v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          -[_DPPrioPiRapporValueRandomizer createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:](self, "createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:", v20, v10, v9, v13);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v14, "addObject:", v21);

        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  return v14;
}

- (unsigned)piRapporPrime
{
  return self->_piRapporPrime;
}

- (double)piRapporAlpha0
{
  return self->_piRapporAlpha0;
}

- (double)piRapporAlpha1
{
  return self->_piRapporAlpha1;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (unint64_t)p
{
  return self->_p;
}

- (BOOL)dynamicVectorSize
{
  return self->_dynamicVectorSize;
}

- (void)initWithEpsilon:(uint64_t)a3 dimensionality:(uint64_t)a4 dynamicVectorSize:(uint64_t)a5 piRapporPrime:(uint64_t)a6 piRapporAlpha0:(uint64_t)a7 piRapporAlpha1:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Failed to initialize parameters for Prio + Pi-Rappor. Expected epsilon between 2 and 10, but was %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)randomize:metadata:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v1, (uint64_t)v1, "Input bit position should be less than dimensionality (%lu), instead got %lu.", v2);
  OUTLINED_FUNCTION_1();
}

- (void)randomizeVector:metadata:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Pi-Rappor cannot encode 0-hot vector.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)randomizeVector:metadata:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Encountered a value at vector index %lu that is neither 0 nor 1.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)randomizeVector:(NSObject *)a3 metadata:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = a2;
  v7 = 2048;
  v8 = objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v4, "Prio + Pi-Rappor expects dimensionality to be %lu, instead got %lu", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3();
}

- (void)encodeClassIndices:withDimensionality:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Failed to initialize Pi-Rappor algorithm.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)encodeClassIndices:withDimensionality:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "The allocation size with Prio + Pi-Rappor exceeds the 1MB limit.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)encodeClassIndices:withDimensionality:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Failed to initialize Prio algorithm.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)encodeClassIndices:withDimensionality:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Pi-Rappor algorithm failed to encode all hot bits.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)encodeClassIndices:withDimensionality:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Prio algorithm failed to encode outputs from Pi-Rappor algorithm.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Failed to serialize shares for Prio + Pi-Rappor, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
