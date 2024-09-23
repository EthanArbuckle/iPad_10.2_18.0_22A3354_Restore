@implementation _DPPrioValueRandomizer

- (_DPPrioValueRandomizer)init
{

  return 0;
}

- (_DPPrioValueRandomizer)initWithEpsilon:(double)a3 parameters:(id)a4
{
  id v7;
  void *v8;
  _DPPrioValueRandomizer *v10;
  NSObject *v11;
  NSObject *v12;
  char v13;
  _DPPrioValueRandomizer *v14;
  _DPPrioValueRandomizer *v15;
  objc_super v17;

  v7 = a4;
  v8 = v7;
  if (a3 < 0.0 || a3 > 16.0)
  {
    v10 = 0;
  }
  else
  {
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("p"), 16.0);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && -[NSObject unsignedIntegerValue](v11, "unsignedIntegerValue"))
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dynamicVectorSize"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = -[NSObject BOOLValue](v12, "BOOLValue");
        v17.receiver = self;
        v17.super_class = (Class)_DPPrioValueRandomizer;
        v14 = -[_DPPrioValueRandomizer init](&v17, sel_init);
        v15 = v14;
        if (v14)
        {
          v14->_defaultLocalEpsilon = a3;
          v14->_p = -[NSObject unsignedIntegerValue](v11, "unsignedIntegerValue");
          v15->_dynamicVectorSize = v13;
          objc_storeStrong((id *)&v15->_plistParameters, a4);
        }
        self = v15;
        v10 = self;
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[_DPPrioValueRandomizer initWithEpsilon:parameters:].cold.2();
        v10 = 0;
      }

    }
    else
    {
      +[_DPLog framework](_DPLog, "framework", 16.0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_DPPrioValueRandomizer initWithEpsilon:parameters:].cold.1();
      v10 = 0;
    }

  }
  return v10;
}

+ (id)randomizerWithEpsilon:(double)a3 parameters:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:parameters:", v6, a3);

  return v7;
}

- (id)randomize:(id)a3 withLocalEpsilon:(double)a4 metadata:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  NSObject *v19;

  v8 = a3;
  v9 = a5;
  v10 = -[_DPPrioValueRandomizer p](self, "p");
  if (-[_DPPrioValueRandomizer dynamicVectorSize](self, "dynamicVectorSize"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("AlgorithmParameters"), CFSTR("Dimensionality"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKeyPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v10 = objc_msgSend(v12, "unsignedIntegerValue");

  }
  if (v10 < 0x186A1)
  {
    +[_DPPrioAlgorithm prioWithEpsilon:dimensionality:](_DPPrioAlgorithm, "prioWithEpsilon:dimensionality:", v10, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __62___DPPrioValueRandomizer_randomize_withLocalEpsilon_metadata___block_invoke;
      v18[3] = &unk_1E95D9CA0;
      v19 = v8;
      -[NSObject privatizeDataWithBlock:](v14, "privatizeDataWithBlock:", v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v19;
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[_DPPrioValueRandomizer randomize:withLocalEpsilon:metadata:].cold.2();
      v15 = 0;
    }

  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DPPrioValueRandomizer randomize:withLocalEpsilon:metadata:].cold.1();
    v15 = 0;
  }

  return v15;
}

- (id)randomizeVector:(id)a3 withLocalEpsilon:(double)a4 metadata:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  NSObject *v14;

  v7 = a3;
  if (-[_DPPrioValueRandomizer dynamicVectorSize](self, "dynamicVectorSize"))
    v8 = objc_msgSend(v7, "length");
  else
    v8 = -[_DPPrioValueRandomizer p](self, "p");
  +[_DPPrioAlgorithm prioWithEpsilon:dimensionality:](_DPPrioAlgorithm, "prioWithEpsilon:dimensionality:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68___DPPrioValueRandomizer_randomizeVector_withLocalEpsilon_metadata___block_invoke;
    v13[3] = &unk_1E95D9CA0;
    v14 = v7;
    objc_msgSend(v9, "privatizeDataWithBlock:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_DPPrioValueRandomizer randomize:withLocalEpsilon:metadata:].cold.2();
    v10 = 0;
  }

  return v10;
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
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _DPPrioRecord *v28;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *obj;
  id v35;
  _DPPrioValueRandomizer *v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v35 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;

  v36 = self;
  -[_DPPrioValueRandomizer plistParameters](self, "plistParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:error:](_DPBudgetAuditor, "budgetAuditorFromMetadata:plistParameters:error:", v9, v13, &v44);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v44;

  if (v14)
  {
    v43 = v15;
    objc_msgSend(v14, "getSymmetricRAPPORLocalEpsilonWithError:", &v43);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v43;

    v37 = v16;
    if (v16)
    {
      v42 = v17;
      objc_msgSend(v14, "auditedMetadataWithError:", &v42);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v42;

      if (v18)
      {
        v33 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        obj = v8;
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
        if (v19)
        {
          v20 = v19;
          v30 = v15;
          v31 = v9;
          v32 = v8;
          v21 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v39 != v21)
                objc_enumerationMutation(obj);
              v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              -[NSObject doubleValue](v37, "doubleValue");
              -[_DPPrioValueRandomizer randomize:withLocalEpsilon:metadata:](v36, "randomize:withLocalEpsilon:metadata:", v23, v18);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "count"))
              {
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("share1"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("share2"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("dimensionality"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v35, v25, v26, objc_msgSend(v27, "longLongValue"), v18, 0, v12, 0);
                if (v28)
                  objc_msgSend(v33, "addObject:", v28);

              }
            }
            v20 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
          }
          while (v20);
          v9 = v31;
          v8 = v32;
          v15 = v30;
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        obj = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
          -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:].cold.2();
        v33 = 0;
      }

    }
    else
    {
      v33 = 0;
      v15 = v17;
    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:].cold.1();
    v33 = 0;
  }

  return v33;
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
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  _DPPrioValueRandomizer *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  _DPPrioRecord *v30;
  id v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  id obj;
  _DPPrioValueRandomizer *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  id v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  -[_DPPrioValueRandomizer plistParameters](self, "plistParameters");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  +[_DPBudgetAuditor budgetAuditorFromMetadata:plistParameters:error:](_DPBudgetAuditor, "budgetAuditorFromMetadata:plistParameters:error:", v9, v14, &v48);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v48;

  if (v15)
  {
    v47 = v16;
    objc_msgSend(v15, "getSymmetricRAPPORLocalEpsilonWithError:", &v47);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v47;

    v36 = v17;
    if (v17)
    {
      v46 = v18;
      objc_msgSend(v15, "auditedMetadataWithError:", &v46);
      v19 = objc_claimAutoreleasedReturnValue();
      v16 = v46;

      if (v19)
      {
        v32 = v16;
        v33 = v15;
        v34 = v9;
        v37 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v35 = v8;
        obj = v8;
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        if (v41)
        {
          v40 = *(_QWORD *)v43;
          v20 = (void *)v17;
          v39 = self;
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v43 != v40)
                objc_enumerationMutation(obj);
              v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              objc_msgSend(v20, "doubleValue");
              -[_DPPrioValueRandomizer randomizeVector:withLocalEpsilon:metadata:](self, "randomizeVector:withLocalEpsilon:metadata:", v22, v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "count"))
              {
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("share1"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("share2"));
                v25 = self;
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("dimensionality"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[_DPPrioValueRandomizer dynamicVectorSize](v25, "dynamicVectorSize"))
                {
                  v28 = -[NSObject mutableCopy](v19, "mutableCopy");
                  objc_msgSend(v28, "setObject:forKey:", v27, CFSTR("dimensionality"));
                  v29 = objc_msgSend(v28, "copy");

                  v20 = v36;
                }
                else
                {
                  v29 = (uint64_t)v19;
                }
                v19 = v29;
                v30 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v10, v24, v26, objc_msgSend(v27, "longLongValue"), v29, 0, v13, 0);
                if (v30)
                  objc_msgSend(v37, "addObject:", v30);

                self = v39;
              }

            }
            v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
          }
          while (v41);
        }

        v9 = v34;
        v8 = v35;
        v16 = v32;
        v15 = v33;
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:].cold.2();
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
      v16 = v18;
    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:].cold.1();
    v37 = 0;
  }

  return v37;
}

- (double)defaultLocalEpsilon
{
  return self->_defaultLocalEpsilon;
}

- (unint64_t)p
{
  return self->_p;
}

- (BOOL)dynamicVectorSize
{
  return self->_dynamicVectorSize;
}

- (NSDictionary)plistParameters
{
  return self->_plistParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistParameters, 0);
}

- (void)initWithEpsilon:parameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Malformed plist parameters, expect non-nil parameters.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
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

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Prio default dimension p must be provided, and cannot be 0.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)randomize:withLocalEpsilon:metadata:.cold.1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v2 = 2048;
  v3 = 100000;
  _os_log_error_impl(&dword_1D3FAA000, v0, OS_LOG_TYPE_ERROR, "Dimensionality=(%lu) should be less than or equal to %zu", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)randomize:withLocalEpsilon:metadata:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Failed to create PrioAlgorithm.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
