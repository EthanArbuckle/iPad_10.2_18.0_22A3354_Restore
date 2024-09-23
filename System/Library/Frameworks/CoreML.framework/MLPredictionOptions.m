@implementation MLPredictionOptions

- (unint64_t)parentSignpostID
{
  return self->_parentSignpostID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSyncPoint, 0);
  objc_storeStrong((id *)&self->_waitSyncPoints, 0);
  objc_storeStrong((id *)&self->_outputDirectBindingExpectations, 0);
  objc_storeStrong((id *)&self->_inputDirectBindingExpectations, 0);
  objc_storeStrong((id *)&self->_e5rtStreamReuseExpectation, 0);
  objc_storeStrong((id *)&self->_automaticOutputBackingMode, 0);
  objc_storeStrong((id *)&self->_outputBackings, 0);
}

+ (id)defaultOptions
{
  return objc_alloc_init(MLPredictionOptions);
}

- (MLPredictionOptions)init
{
  return -[MLPredictionOptions initWithUsesCPUOnly:](self, "initWithUsesCPUOnly:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUsesCPUOnly:", -[MLPredictionOptions predictionUsesCPU](self, "predictionUsesCPU"));
  objc_msgSend(v4, "setClassifyTopK:", -[MLPredictionOptions classifyTopK](self, "classifyTopK"));
  objc_msgSend(v4, "setMaxComputationBatchSize:", -[MLPredictionOptions maxComputationBatchSize](self, "maxComputationBatchSize"));
  -[MLPredictionOptions outputBackings](self, "outputBackings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutputBackings:", v5);

  -[MLPredictionOptions automaticOutputBackingMode](self, "automaticOutputBackingMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutomaticOutputBackingMode:", v6);

  -[MLPredictionOptions inputDirectBindingExpectations](self, "inputDirectBindingExpectations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInputDirectBindingExpectations:", v7);

  -[MLPredictionOptions outputDirectBindingExpectations](self, "outputDirectBindingExpectations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutputDirectBindingExpectations:", v8);

  objc_msgSend(v4, "setParentSignpostID:", -[MLPredictionOptions parentSignpostID](self, "parentSignpostID"));
  -[MLPredictionOptions e5rtStreamReuseExpectation](self, "e5rtStreamReuseExpectation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setE5rtStreamReuseExpectation:", v9);

  objc_msgSend(v4, "setAneQoS:", -[MLPredictionOptions aneQoS](self, "aneQoS"));
  -[MLPredictionOptions aneExecutionPriority](self, "aneExecutionPriority");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAneExecutionPriority:", v10);

  return v4;
}

- (MLPredictionOptions)initWithUsesCPUOnly:(BOOL)a3
{
  MLPredictionOptions *v4;
  MLPredictionOptions *v5;
  NSDictionary *outputBackings;
  NSDictionary *v7;
  NSDictionary *automaticOutputBackingMode;
  NSDictionary *inputDirectBindingExpectations;
  NSDictionary *outputDirectBindingExpectations;
  NSString *e5rtStreamReuseExpectation;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MLPredictionOptions;
  v4 = -[MLPredictionOptions init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_usesCPUOnly = a3;
    v4->_classifyTopK = -1;
    v4->_maxComputationBatchSize = -1;
    outputBackings = v4->_outputBackings;
    v7 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v4->_outputBackings = (NSDictionary *)MEMORY[0x1E0C9AA70];

    automaticOutputBackingMode = v5->_automaticOutputBackingMode;
    v5->_automaticOutputBackingMode = v7;

    inputDirectBindingExpectations = v5->_inputDirectBindingExpectations;
    v5->_inputDirectBindingExpectations = v7;

    outputDirectBindingExpectations = v5->_outputDirectBindingExpectations;
    v5->_outputDirectBindingExpectations = v7;

    v5->_parentSignpostID = 0;
    e5rtStreamReuseExpectation = v5->_e5rtStreamReuseExpectation;
    v5->_e5rtStreamReuseExpectation = (NSString *)CFSTR("MLE5EngineStreamReuseExpectationDefault");

    v5->_aneQoS = 0;
    v5->_aneExecutionPriority = (NSString *)CFSTR("MLANEExecutionPriority_Unspecified");
  }
  return v5;
}

- (BOOL)predictionUsesCPU
{
  return self->_usesCPUOnly;
}

- (NSDictionary)automaticOutputBackingMode
{
  return self->_automaticOutputBackingMode;
}

- (NSDictionary)outputBackings
{
  return self->_outputBackings;
}

- (void)setParentSignpostID:(unint64_t)a3
{
  self->_parentSignpostID = a3;
}

- (void)setOutputBackings:(NSDictionary *)outputBackings
{
  objc_setProperty_nonatomic_copy(self, a2, outputBackings, 16);
}

- (void)setMaxComputationBatchSize:(unint64_t)a3
{
  self->_maxComputationBatchSize = a3;
}

- (void)setClassifyTopK:(unint64_t)a3
{
  self->_classifyTopK = a3;
}

- (void)setAutomaticOutputBackingMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)maxComputationBatchSize
{
  return self->_maxComputationBatchSize;
}

- (unint64_t)classifyTopK
{
  return self->_classifyTopK;
}

- (id)reconcileExecutionPriorityWithCurrentQoS:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v5;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  -[MLPredictionOptions aneExecutionPriority](self, "aneExecutionPriority");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5 != CFSTR("MLANEExecutionPriority_Unspecified"))
  {
    -[MLPredictionOptions aneExecutionPriority](self, "aneExecutionPriority");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[MLPredictionOptions aneQoS](self, "aneQoS"))
    v3 = -[MLPredictionOptions aneQoS](self, "aneQoS");
  if ((int)v3 > 20)
  {
    switch((_DWORD)v3)
    {
      case 0x15:
        goto LABEL_20;
      case 0x19:
        v7 = CFSTR("MLANEExecutionPriority_4");
        break;
      case 0x21:
        v7 = CFSTR("MLANEExecutionPriority_3");
        break;
      default:
LABEL_17:
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v11 = v3;
          _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Unable to find the correspondent MLANEExecutionPriority for qos %u", buf, 8u);
        }

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to find the correspondent MLANEExecutionPriority for qos %u"), v3);
        goto LABEL_20;
    }
  }
  else if ((_DWORD)v3)
  {
    if ((_DWORD)v3 != 9)
    {
      if ((_DWORD)v3 != 17)
        goto LABEL_17;
LABEL_20:
      v7 = CFSTR("MLANEExecutionPriority_5");
      goto LABEL_21;
    }
    v7 = CFSTR("MLANEExecutionPriority_7");
  }
  else
  {
    v7 = CFSTR("MLANEExecutionPriority_Unspecified");
  }
LABEL_21:
  v9 = v7;
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MLPredictionOptions predictionUsesCPU](self, "predictionUsesCPU"), CFSTR("usesCPUOnly"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLPredictionOptions classifyTopK](self, "classifyTopK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("classifyTopK"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLPredictionOptions maxComputationBatchSize](self, "maxComputationBatchSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maxComputationBatchSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MLPredictionOptions parentSignpostID](self, "parentSignpostID"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("parentSignpostID"));

}

- (MLPredictionOptions)initWithCoder:(id)a3
{
  id v4;
  MLPredictionOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *outputBackings;
  NSDictionary *v10;
  NSDictionary *automaticOutputBackingMode;
  NSDictionary *inputDirectBindingExpectations;
  NSDictionary *outputDirectBindingExpectations;
  NSString *e5rtStreamReuseExpectation;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MLPredictionOptions;
  v5 = -[MLPredictionOptions init](&v16, sel_init);
  if (v5)
  {
    v5->_usesCPUOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesCPUOnly"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classifyTopK"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_classifyTopK = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxComputationBatchSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxComputationBatchSize = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentSignpostID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_parentSignpostID = objc_msgSend(v8, "unsignedLongLongValue");

    outputBackings = v5->_outputBackings;
    v10 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v5->_outputBackings = (NSDictionary *)MEMORY[0x1E0C9AA70];

    automaticOutputBackingMode = v5->_automaticOutputBackingMode;
    v5->_automaticOutputBackingMode = v10;

    inputDirectBindingExpectations = v5->_inputDirectBindingExpectations;
    v5->_inputDirectBindingExpectations = v10;

    outputDirectBindingExpectations = v5->_outputDirectBindingExpectations;
    v5->_outputDirectBindingExpectations = v10;

    e5rtStreamReuseExpectation = v5->_e5rtStreamReuseExpectation;
    v5->_e5rtStreamReuseExpectation = (NSString *)CFSTR("MLE5EngineStreamReuseExpectationDefault");

    v5->_aneQoS = 0;
    v5->_aneExecutionPriority = (NSString *)CFSTR("MLANEExecutionPriority_Unspecified");
  }

  return v5;
}

- (BOOL)hasDirectBindingExpectations
{
  void *v3;
  BOOL v4;
  void *v5;

  -[MLPredictionOptions inputDirectBindingExpectations](self, "inputDirectBindingExpectations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[MLPredictionOptions outputDirectBindingExpectations](self, "outputDirectBindingExpectations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (BOOL)_validateDirectBindingExpectations:(id)a3 directlyBoundFeatureNames:(id)a4 unexpectedDirectBindings:(id *)a5 unexpectedCopyBindings:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t i;
  uint64_t v19;
  __CFString *v20;
  int v21;
  int v22;
  BOOL v23;
  void *v24;
  id *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0C9AA60];
  v27 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v26 = a5;
    v16 = *(_QWORD *)v29;
    v17 = 1;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", v19);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v10, "containsObject:", v19);
        v22 = v21;
        v23 = v20 == CFSTR("MLDirectBindingExpectationAlways") && v21 == 0;
        v24 = v12;
        if (v23)
          goto LABEL_13;
        if (v20 != CFSTR("MLDirectBindingExpectationNever"))
          v22 = 0;
        v24 = v27;
        if (v22 == 1)
        {
LABEL_13:
          objc_msgSend(v24, "addObject:", v19);
          v17 = 0;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);

    if (!((a6 == 0) | v17 & 1))
    {
      *v26 = objc_retainAutorelease(v27);
      v17 = 0;
      *a6 = objc_retainAutorelease(v12);
    }
  }
  else
  {

    v17 = 1;
  }

  return v17 & 1;
}

- (BOOL)validateExpectationsWithDirectlyBoundInputs:(id)a3 outputs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  id v36;
  void *v37;
  id *v38;
  __CFString *v39;
  __CFString *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  __CFString *v49;
  __int16 v50;
  __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[MLPredictionOptions hasDirectBindingExpectations](self, "hasDirectBindingExpectations"))
  {
    v10 = (void *)MEMORY[0x1A1AD6ED8]();
    -[MLPredictionOptions inputDirectBindingExpectations](self, "inputDirectBindingExpectations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v45 = 0;
    v12 = -[MLPredictionOptions _validateDirectBindingExpectations:directlyBoundFeatureNames:unexpectedDirectBindings:unexpectedCopyBindings:](self, "_validateDirectBindingExpectations:directlyBoundFeatureNames:unexpectedDirectBindings:unexpectedCopyBindings:", v11, v8, &v45, &v44);
    v13 = v45;
    v41 = v44;

    -[MLPredictionOptions outputDirectBindingExpectations](self, "outputDirectBindingExpectations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = 0;
    v15 = -[MLPredictionOptions _validateDirectBindingExpectations:directlyBoundFeatureNames:unexpectedDirectBindings:unexpectedCopyBindings:](self, "_validateDirectBindingExpectations:directlyBoundFeatureNames:unexpectedDirectBindings:unexpectedCopyBindings:", v14, v9, &v43, &v42);
    v16 = v43;
    v17 = v42;

    v18 = 0;
    v19 = v12 && v15;
    if ((v19 & 1) == 0)
    {
      v38 = a5;
      if (objc_msgSend(v13, "count"))
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("\n  Input features that unexpectedly use direct binding: %@"), v21);
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v40 = &stru_1E3D68DC8;
      }
      if (objc_msgSend(v41, "count"))
      {
        v22 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR(","));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringWithFormat:", CFSTR("\n  Input features that unexpectedly use copy binding: %@"), v23);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v39 = &stru_1E3D68DC8;
      }
      if (objc_msgSend(v16, "count"))
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("\n  Output features that unexpectedly use direct binding: %@"), v25);
        v26 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = &stru_1E3D68DC8;
      }
      if (objc_msgSend(v17, "count"))
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("\n  Output features that unexpectedly use copy binding: %@"), v28);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = &stru_1E3D68DC8;
      }
      v36 = v17;
      v37 = v10;
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v49 = v40;
        v50 = 2112;
        v51 = v39;
        v52 = 2112;
        v53 = v26;
        v54 = 2112;
        v55 = v29;
        _os_log_error_impl(&dword_19C486000, v30, OS_LOG_TYPE_ERROR, "The direct binding expectation was NOT fulfilled.%@%@%@%@", buf, 0x2Au);
      }

      v31 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The direct binding expectation was NOT fulfilled.%@%@%@%@"), v40, v39, v26, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v33 = (__CFString *)v26;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v34);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v37;
      a5 = v38;
      v17 = v36;
    }

    objc_autoreleasePoolPop(v10);
    if (a5)
    {
      v18 = objc_retainAutorelease(v18);
      *a5 = v18;
    }
  }
  else
  {
    v18 = 0;
    v19 = 1;
  }

  return v19;
}

- (BOOL)usesCPUOnly
{
  return self->_usesCPUOnly;
}

- (void)setUsesCPUOnly:(BOOL)usesCPUOnly
{
  self->_usesCPUOnly = usesCPUOnly;
}

- (NSString)e5rtStreamReuseExpectation
{
  return self->_e5rtStreamReuseExpectation;
}

- (void)setE5rtStreamReuseExpectation:(id)a3
{
  objc_storeStrong((id *)&self->_e5rtStreamReuseExpectation, a3);
}

- (BOOL)enablePixelBufferDirectBinding
{
  return self->_enablePixelBufferDirectBinding;
}

- (void)setEnablePixelBufferDirectBinding:(BOOL)a3
{
  self->_enablePixelBufferDirectBinding = a3;
}

- (NSDictionary)inputDirectBindingExpectations
{
  return self->_inputDirectBindingExpectations;
}

- (void)setInputDirectBindingExpectations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)outputDirectBindingExpectations
{
  return self->_outputDirectBindingExpectations;
}

- (void)setOutputDirectBindingExpectations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)waitSyncPoints
{
  return self->_waitSyncPoints;
}

- (void)setWaitSyncPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (MLPredictionSyncPoint)completionSyncPoint
{
  return self->_completionSyncPoint;
}

- (void)setCompletionSyncPoint:(id)a3
{
  objc_storeStrong((id *)&self->_completionSyncPoint, a3);
}

- (unsigned)aneQoS
{
  return self->_aneQoS;
}

- (void)setAneQoS:(unsigned int)a3
{
  self->_aneQoS = a3;
}

- (NSString)aneExecutionPriority
{
  return self->_aneExecutionPriority;
}

- (void)setAneExecutionPriority:(id)a3
{
  self->_aneExecutionPriority = (NSString *)a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
