@implementation _DPPrioPlusPlusMetadataValueRandomizer

- (_DPPrioPlusPlusMetadataValueRandomizer)init
{

  return 0;
}

- (_DPPrioPlusPlusMetadataValueRandomizer)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5
{
  BOOL v6;
  _DPPrioPlusPlusMetadataValueRandomizer *v7;
  _DPPrioPlusPlusMetadataValueRandomizer *v10;
  objc_super v12;

  if (!a4 || (a3 >= 0.0 ? (v6 = a3 > 16.0) : (v6 = 1), v6))
  {
    v7 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_DPPrioPlusPlusMetadataValueRandomizer;
    v10 = -[_DPPrioPlusPlusMetadataValueRandomizer init](&v12, sel_init, 16.0);
    if (v10)
    {
      v10->_epsilon = a3;
      v10->_p = a4;
      v10->_dynamicVectorSize = a5;
    }
    self = v10;
    v7 = self;
  }

  return v7;
}

+ (id)randomizerWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEpsilon:dimensionality:dynamicVectorSize:", a4, a5, a3);
}

- (id)randomizeBitVector:(id)a3 metadata:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v5 = a3;
  if (-[_DPPrioPlusPlusMetadataValueRandomizer dynamicVectorSize](self, "dynamicVectorSize"))
    v6 = objc_msgSend(v5, "length");
  else
    v6 = -[_DPPrioPlusPlusMetadataValueRandomizer p](self, "p");
  v7 = v6;
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "bytes");
  if (objc_msgSend(v8, "length"))
  {
    v10 = 0;
    while (*(unsigned __int8 *)(v9 + v10) <= 1u)
    {
      if (++v10 >= (unint64_t)objc_msgSend(v8, "length"))
        goto LABEL_8;
    }
    v13 = 0;
  }
  else
  {
LABEL_8:
    +[_DPPrioPlusPlusMetadataAlgorithm initializeWithDimensionality:](_DPPrioPlusPlusMetadataAlgorithm, "initializeWithDimensionality:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "randomize:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_DPPrioPlusPlusMetadataValueRandomizer randomizeBitVector:metadata:].cold.1(v14);

      v13 = 0;
    }

  }
  return v13;
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

- (id)randomizeBitVectors:(id)a3 forKey:(id)a4
{
  return -[_DPPrioPlusPlusMetadataValueRandomizer randomizeBitVectors:metadata:forKey:](self, "randomizeBitVectors:metadata:forKey:", a3, MEMORY[0x1E0C9AA70], a4);
}

- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  _DPPrioPlusPlusMetadataValueRandomizer *v24;
  id v25;
  uint64_t v26;
  _DPPrioRecord *v27;
  uint64_t v29;
  id v30;
  id obj;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  v30 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      v17 = 0;
      v29 = v15;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(obj);
        -[_DPPrioPlusPlusMetadataValueRandomizer randomizeBitVector:metadata:](self, "randomizeBitVector:metadata:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17), v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "count"))
        {
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("share1"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("share2"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("dimensionality"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v9;
          if (-[_DPPrioPlusPlusMetadataValueRandomizer dynamicVectorSize](self, "dynamicVectorSize"))
          {
            v21 = (void *)objc_msgSend(v20, "mutableCopy");
            objc_msgSend(v21, "setObject:forKey:", v19, CFSTR("dimensionality"));
            v22 = v16;
            v23 = v9;
            v24 = self;
            v25 = v10;
            v26 = objc_msgSend(v21, "copy");

            v20 = (id)v26;
            v10 = v25;
            self = v24;
            v9 = v23;
            v16 = v22;
            v15 = v29;
          }
          v27 = -[_DPPrioRecord initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:]([_DPPrioRecord alloc], "initWithKey:share1:share2:dimension:metadata:creationDate:submitted:objectId:", v10, v33, v32, objc_msgSend(v19, "longLongValue"), v20, 0, v13, 0);
          if (v27)
            objc_msgSend(v30, "addObject:", v27);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v15);
  }

  return v30;
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

- (void)randomizeBitVector:(os_log_t)log metadata:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Failed to create _DPPrioPlusPlusMetadataAlgorithm.", v1, 2u);
}

@end
