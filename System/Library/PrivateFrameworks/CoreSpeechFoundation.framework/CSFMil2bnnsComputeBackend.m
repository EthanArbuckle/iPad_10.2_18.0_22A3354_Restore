@implementation CSFMil2bnnsComputeBackend

- (CSFMil2bnnsComputeBackend)initWithModelFile:(id)a3 errOut:(id *)a4
{
  return -[CSFMil2bnnsComputeBackend initWithModelFile:bnnsIrPath:errOut:](self, "initWithModelFile:bnnsIrPath:errOut:", a3, 0, a4);
}

- (CSFMil2bnnsComputeBackend)initWithModelFile:(id)a3 bnnsIrPath:(id)a4 errOut:(id *)a5
{
  id v9;
  id v10;
  CSFMil2bnnsComputeBackend *v11;
  void *v12;
  CSFMil2bnnsCompilationConfig *v13;
  id v14;
  CSFMil2bnnsCompilationConfig *modelCompilationConfig;
  CSFMil2bnnsCompilationConfig *v16;
  uint64_t v17;
  NSString *funcName;
  id v19;
  void *v20;
  NSObject *v21;
  CSFMil2bnnsComputeBackend *v22;
  id v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CSFMil2bnnsComputeBackend;
  v11 = -[CSFMil2bnnsComputeBackend init](&v26, sel_init);
  if (!v11)
    goto LABEL_14;
  objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("config.json"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v11->_milPath, a3);
  objc_storeStrong((id *)&v11->_bnnsIrPath, a4);
  v25 = 0;
  v13 = -[CSFMil2bnnsCompilationConfig initWithConfigPath:errOut:]([CSFMil2bnnsCompilationConfig alloc], "initWithConfigPath:errOut:", v12, &v25);
  v14 = v25;
  modelCompilationConfig = v11->_modelCompilationConfig;
  v11->_modelCompilationConfig = v13;

  v16 = v11->_modelCompilationConfig;
  if (!v16)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v14);

    goto LABEL_12;
  }
  -[CSFMil2bnnsCompilationConfig funcName](v16, "funcName");
  v17 = objc_claimAutoreleasedReturnValue();
  funcName = v11->_funcName;
  v11->_funcName = (NSString *)v17;

  v24 = 0;
  -[CSFMil2bnnsComputeBackend _graphInitWithError:](v11, "_graphInitWithError:", &v24);
  v19 = v24;
  if (!v19)
  {

LABEL_14:
    v22 = v11;
    goto LABEL_15;
  }
  v20 = v19;
  if (a5)
    *a5 = objc_retainAutorelease(v19);
  v21 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[CSFMil2bnnsComputeBackend initWithModelFile:bnnsIrPath:errOut:]";
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v20;
    _os_log_impl(&dword_1B502E000, v21, OS_LOG_TYPE_DEFAULT, "%s model init with bnnsIrFile: %@ failed with error: %@", buf, 0x20u);
  }

LABEL_12:
  v22 = 0;
LABEL_15:

  return v22;
}

- (CSFMil2bnnsComputeBackend)initWithBnnsIrFile:(id)a3 weightPath:(id)a4 errOut:(id *)a5
{
  id v9;
  id v10;
  CSFMil2bnnsComputeBackend *v11;
  CSFMil2bnnsComputeBackend *v12;
  NSString *milPath;
  NSString *funcName;
  bnnsIrMappedWeight *v15;
  id v16;
  bnnsIrMappedWeight *weight;
  id v18;
  void *v19;
  NSObject *v20;
  CSFMil2bnnsComputeBackend *v21;
  NSObject *v22;
  id v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CSFMil2bnnsComputeBackend;
  v11 = -[CSFMil2bnnsComputeBackend init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    milPath = v11->_milPath;
    v11->_milPath = 0;

    objc_storeStrong((id *)&v12->_bnnsIrPath, a3);
    funcName = v12->_funcName;
    v12->_funcName = (NSString *)CFSTR("main");

    if (v10)
    {
      v25 = 0;
      v15 = -[bnnsIrMappedWeight initWithWeightFile:errOut:]([bnnsIrMappedWeight alloc], "initWithWeightFile:errOut:", v10, &v25);
      v16 = v25;
      weight = v12->_weight;
      v12->_weight = v15;

      if (!v12->_weight || v16)
      {
        v22 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v28 = "-[CSFMil2bnnsComputeBackend initWithBnnsIrFile:weightPath:errOut:]";
          v29 = 2112;
          v30 = v10;
          v31 = 2112;
          v32 = v16;
          _os_log_impl(&dword_1B502E000, v22, OS_LOG_TYPE_DEFAULT, "%s weight init with: %@ failed with error: %@", buf, 0x20u);
        }
        if (a5)
          *a5 = objc_retainAutorelease(v16);

        goto LABEL_17;
      }
    }
    v24 = 0;
    -[CSFMil2bnnsComputeBackend _graphInitWithError:](v12, "_graphInitWithError:", &v24);
    v18 = v24;
    if (v18)
    {
      v19 = v18;
      if (a5)
        *a5 = objc_retainAutorelease(v18);
      v20 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v28 = "-[CSFMil2bnnsComputeBackend initWithBnnsIrFile:weightPath:errOut:]";
        v29 = 2112;
        v30 = v9;
        v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_1B502E000, v20, OS_LOG_TYPE_DEFAULT, "%s model init with bnnsIrFile: %@ failed with error: %@", buf, 0x20u);
      }

LABEL_17:
      v21 = 0;
      goto LABEL_18;
    }
  }
  v21 = v12;
LABEL_18:

  return v21;
}

- (id)predictOutputWithInputs:(id)a3 errOut:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSString *bnnsIrPath;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v7 == -[NSDictionary count](self->_bnnsIrInputTensorsProperty, "count"))
  {
    v20 = 0;
    -[CSFMil2bnnsComputeBackend _runWithMil2bnnsDataInputBuff:error:](self, "_runWithMil2bnnsDataInputBuff:error:", v6, &v20);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v20;
    if (v9)
    {
      v10 = v9;
      if (a4)
      {
        v10 = objc_retainAutorelease(v9);
        *a4 = v10;
        v11 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          bnnsIrPath = self->_bnnsIrPath;
          *(_DWORD *)buf = 136315650;
          v24 = "-[CSFMil2bnnsComputeBackend predictOutputWithInputs:errOut:]";
          v25 = 2112;
          v26 = bnnsIrPath;
          v27 = 2112;
          v28 = v10;
          _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s bnnsIr %@ model execution with error: %@", buf, 0x20u);
        }
      }
LABEL_14:
      v14 = 0;
      goto LABEL_15;
    }
    v15 = objc_msgSend(v8, "count");
    if (v15 != -[NSDictionary count](self->_bnnsIrOutputTensorsProperty, "count"))
    {
      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("config output count does not match with given inputs count"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2411, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v10 = 0;
      goto LABEL_14;
    }
    v8 = v8;
    v10 = 0;
    v14 = v8;
LABEL_15:

    goto LABEL_16;
  }
  if (a4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("config input count does not match with given inputs count"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v30[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2410, v8);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v14 = 0;
LABEL_16:

  return v14;
}

- (id)getExpectedInputTensors
{
  return self->_bnnsIrInputTensorsProperty;
}

- (id)getExpectedOutputTensors
{
  return self->_bnnsIrOutputTensorsProperty;
}

- (void)_graphInitWithError:(id *)a3
{
  id v5;
  NSObject *v6;
  NSString *bnnsIrPath;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  self->_graphIsMapped = 0;
  self->_graphContext = 0u;
  self->_graph = 0u;
  v13 = 0;
  -[CSFMil2bnnsComputeBackend _loadGraph:](self, "_loadGraph:", &v13);
  v5 = v13;
  if (v5)
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      bnnsIrPath = self->_bnnsIrPath;
      *(_DWORD *)buf = 136315650;
      v17 = "-[CSFMil2bnnsComputeBackend _graphInitWithError:]";
      v18 = 2112;
      v19 = bnnsIrPath;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Error loading mil2bnns graph for bnnsir file: %@ with error: %@", buf, 0x20u);
    }
    if (a3)
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    v8 = -[CSFMil2bnnsComputeBackend _populateModelInterfaceParameters](self, "_populateModelInterfaceParameters");
    if (a3)
      v9 = v8;
    else
      v9 = 1;
    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read tensor descriptors"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2457, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

}

- (void)_pointBnnsIrToWeights:(id)a3 errOut:(id *)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "getWeightData");
  objc_msgSend(v5, "weightSize");
  v6 = BNNSGraphContextSetWeights();
  if (a4 && v6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot set weight for graph context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2454, v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (id)_getShapeFromTensorDesc:(id *)a3
{
  uint64_t Rank;
  id v5;
  unint64_t *var2;
  uint64_t v7;
  void *v8;

  Rank = BNNSDataLayoutGetRank();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (Rank)
  {
    var2 = a3->var2;
    do
    {
      v7 = *var2++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v8);

      --Rank;
    }
    while (Rank);
  }
  return v5;
}

- (unint64_t)_getDataTypeFromTensorDesc:(id *)a3
{
  unsigned int var5;

  var5 = a3->var5;
  if (var5 == 65568)
    return 1;
  else
    return 2 * (var5 != 131104);
}

- (id)_fetchTensorPropertiesForName:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  _OWORD v16[11];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[11];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "UTF8String");
  -[NSString UTF8String](self->_funcName, "UTF8String");
  if (BNNSGraphContextGetTensorDescriptor_v2())
  {
    v6 = (id)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v35 = "-[CSFMil2bnnsComputeBackend _fetchTensorPropertiesForName:]";
      v36 = 2112;
      v37 = v7;
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s Failed to get desc for tensor %@", buf, 0x16u);

    }
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  if (*((_QWORD *)&v26 + 1) != 1)
  {
    v6 = (id)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v35 = "-[CSFMil2bnnsComputeBackend _fetchTensorPropertiesForName:]";
      v36 = 2112;
      v37 = v12;
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s Stride not supported for tensor %@", buf, 0x16u);

    }
    goto LABEL_19;
  }
  v21[8] = v30;
  v21[9] = v31;
  v21[10] = v32;
  v21[4] = v26;
  v21[5] = v27;
  v21[6] = v28;
  v21[7] = v29;
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  v21[3] = v25;
  -[CSFMil2bnnsComputeBackend _getShapeFromTensorDesc:](self, "_getShapeFromTensorDesc:", v21);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "unsignedLongLongValue"))
        {
          v13 = (id)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v35 = "-[CSFMil2bnnsComputeBackend _fetchTensorPropertiesForName:]";
            v36 = 2112;
            v37 = v15;
            _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, "%s Shape not set for tensor %@", buf, 0x16u);

          }
          goto LABEL_19;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
      if (v8)
        continue;
      break;
    }
  }

  v16[8] = v30;
  v16[9] = v31;
  v16[10] = v32;
  v16[4] = v26;
  v16[5] = v27;
  v16[6] = v28;
  v16[7] = v29;
  v16[0] = v22;
  v16[1] = v23;
  v16[2] = v24;
  v16[3] = v25;
  +[CSFTensorProperties propertyWithShape:dataType:](CSFTensorProperties, "propertyWithShape:dataType:", v6, -[CSFMil2bnnsComputeBackend _getDataTypeFromTensorDesc:](self, "_getDataTypeFromTensorDesc:", v16));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v11;
}

- (BOOL)_populateModelInterfaceParameters
{
  unint64_t InputCount;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t OutputCount;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *__p;
  _QWORD *v19;
  void *v20;
  _QWORD *v21;

  if (!self->_graph.data)
    return 0;
  InputCount = BNNSGraphGetInputCount();
  std::vector<char const*>::vector(&v20, InputCount);
  BNNSGraphGetInputNames_v2();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  v6 = v21;
  if (v20 == v21)
  {
    v9 = 0;
LABEL_9:
    OutputCount = BNNSGraphGetOutputCount();
    std::vector<char const*>::vector(&__p, OutputCount);
    BNNSGraphGetOutputNames_v2();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = __p;
    v14 = v19;
    if (__p == v19)
    {
      v16 = (uint64_t)v9;
LABEL_15:
      objc_storeStrong((id *)&self->_bnnsIrInputTensorsProperty, v4);
      objc_storeStrong((id *)&self->_bnnsIrOutputTensorsProperty, v12);
      v10 = 1;
      v15 = (void *)v16;
    }
    else
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          break;
        -[CSFMil2bnnsComputeBackend _fetchTensorPropertiesForName:](self, "_fetchTensorPropertiesForName:", v15);
        v16 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "setObject:forKey:", v16, v15);
        ++v13;
        v9 = (void *)v16;
        if (v13 == v14)
          goto LABEL_15;
      }
      v10 = 0;
    }

    if (__p)
    {
      v19 = __p;
      operator delete(__p);
    }
  }
  else
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSFMil2bnnsComputeBackend _fetchTensorPropertiesForName:](self, "_fetchTensorPropertiesForName:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        break;
      objc_msgSend(v4, "setObject:forKey:", v9, v8);

      ++v5;
      v7 = v9;
      if (v5 == v6)
        goto LABEL_9;
    }

    v10 = 0;
  }

  if (v20)
  {
    v21 = v20;
    operator delete(v20);
  }
  return v10;
}

- (id)_convertOutputBuffer:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v9, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "convertDataToArray");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v11, v9);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- ($3265B292A9BE2BE95187D95CCBA22C14)_mapBnnsIrPath:(id)a3 errOut:(id *)a4
{
  id v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  int *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int *v15;
  void *v16;
  void *v17;
  void *v18;
  size_t st_size;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  int *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int *v29;
  void *v30;
  void *v31;
  stat v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];
  $3265B292A9BE2BE95187D95CCBA22C14 result;

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  v6 = open((const char *)objc_msgSend(v5, "UTF8String"), 0);
  v7 = v6;
  if (v6 == -1)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = __error();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Could not read open() BNNSIR: %s"), strerror(*v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2261, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (fstat(v6, &v32))
  {
    if (a4)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = __error();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Could not fstat() BNNSIR: %s"), strerror(*v10));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2261, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    close(v7);
  }
  else
  {
    st_size = v32.st_size;
    v18 = mmap(0, v32.st_size, 1, 1, v7, 0);
    close(v7);
    if (v18 == (void *)-1)
    {
      if (a4)
      {
        v27 = (void *)MEMORY[0x1E0CB35C8];
        v35 = *MEMORY[0x1E0CB2D50];
        v28 = (void *)MEMORY[0x1E0CB3940];
        v29 = __error();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("Could not mmap() BNNSIR: %s"), strerror(*v29));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2261, v31);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (BNNSGraphGetWorkspaceSize_v2() != -1)
        goto LABEL_9;
      if (a4)
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB2D50];
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = __error();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("Could not BNNSGraphGetWorkspaceSize() BNNSIR: %s"), strerror(*v24));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2261, v26);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      munmap(v18, st_size);
    }
  }
  v18 = 0;
  st_size = 0;
LABEL_9:

  v20 = v18;
  v21 = st_size;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (void)_loadGraph:(id *)a3
{
  NSString *bnnsIrPath;
  NSObject *v6;
  void *data;
  unint64_t v8;
  NSString *v9;
  NSObject *v10;
  NSString *milPath;
  NSObject *v12;
  _BOOL4 v13;
  NSString *v14;
  CSFMil2bnnsCompilationConfig *modelCompilationConfig;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  bnnsIrMappedWeight *weight;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  NSString *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  NSString *v37;
  __int16 v38;
  NSString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  bnnsIrPath = self->_bnnsIrPath;
  if (!bnnsIrPath)
  {
    if (self->_graph.data)
      goto LABEL_20;
LABEL_11:
    milPath = self->_milPath;
    if (milPath)
    {
      v12 = CSLogContextFacilityCoreSpeech;
      v13 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      v14 = self->_bnnsIrPath;
      if (v13)
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
        v36 = 2112;
        v37 = v14;
        _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s No graph is loaded, compiling to bnnsIr: %@", buf, 0x16u);
        milPath = self->_milPath;
        v14 = self->_bnnsIrPath;
      }
      modelCompilationConfig = self->_modelCompilationConfig;
      v31 = 0;
      v16 = (void *)+[CSFMil2bnnsComputeBackend _compileWithMilFile:bnnsIrPath:separateWeight:compilationConfig:isBnnsIrMapped:errOut:](CSFMil2bnnsComputeBackend, "_compileWithMilFile:bnnsIrPath:separateWeight:compilationConfig:isBnnsIrMapped:errOut:", milPath, v14, 0, modelCompilationConfig, &self->_graphIsMapped, &v31);
      v18 = v17;
      milPath = (NSString *)v31;
      self->_graph.data = v16;
      self->_graph.size = v18;
      if (v16)
      {
        v19 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
          _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s recompilation is successful", buf, 0xCu);
        }
        if (a3)
          *a3 = 0;

        goto LABEL_20;
      }
      v27 = self->_milPath;
      if (v27)
      {
        v28 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
          v36 = 2112;
          v37 = v27;
          v38 = 2112;
          v39 = milPath;
          _os_log_impl(&dword_1B502E000, v28, OS_LOG_TYPE_DEFAULT, "%s recompiling milFile: %@ failed with error: %@", buf, 0x20u);
        }
        if (a3)
        {
          milPath = objc_retainAutorelease(milPath);
          *a3 = milPath;
        }
      }
    }
    v29 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
      _os_log_impl(&dword_1B502E000, v29, OS_LOG_TYPE_DEFAULT, "%s bnnsIr loading failed", buf, 0xCu);
    }
    goto LABEL_35;
  }
  v6 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
    v36 = 2112;
    v37 = bnnsIrPath;
    _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s loading model from bnnsIrPath: %@", buf, 0x16u);
    bnnsIrPath = self->_bnnsIrPath;
  }
  data = (void *)-[CSFMil2bnnsComputeBackend _mapBnnsIrPath:errOut:](self, "_mapBnnsIrPath:errOut:", bnnsIrPath, a3);
  self->_graph.data = data;
  self->_graph.size = v8;
  if (a3)
  {
    v9 = (NSString *)*a3;
    if (*a3)
    {
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[CSFMil2bnnsComputeBackend _loadGraph:]";
        v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s error loading bnns ir :%@", buf, 0x16u);
        data = self->_graph.data;
      }
    }
  }
  if (!data)
    goto LABEL_11;
  self->_graphIsMapped = 1;
LABEL_20:
  v20 = (void *)BNNSGraphContextMake();
  self->_graphContext.data = v20;
  self->_graphContext.size = v21;
  weight = self->_weight;
  if (weight)
  {
    v30 = 0;
    -[CSFMil2bnnsComputeBackend _pointBnnsIrToWeights:errOut:](self, "_pointBnnsIrToWeights:errOut:", weight, &v30);
    v23 = (NSString *)v30;
    if (v23)
    {
      milPath = v23;
      if (a3)
      {
        milPath = objc_retainAutorelease(v23);
        *a3 = milPath;
      }
      goto LABEL_35;
    }
    v20 = self->_graphContext.data;
  }
  milPath = 0;
  if (a3 && !v20)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BNNSGraphContextMake fail for %@"), self->_milPath);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2262, v26);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    milPath = 0;
  }
LABEL_35:

}

- (id)_runWithMil2bnnsDataInputBuff:(id)a3 error:(id *)a4
{
  unint64_t InputCount;
  unint64_t OutputCount;
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  CSFComputeDataBuffer *v12;
  void *v13;
  CSFComputeDataBuffer *v14;
  id v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  unint64_t v46;
  uint64_t *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id *v54;
  _QWORD *v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  unint64_t v59;
  void *v60;
  void *v61;
  id v62;
  void *__p[3];
  void *v64[3];
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  _QWORD v72[3];

  v72[1] = *MEMORY[0x1E0C80C00];
  v58 = a3;
  if (v58 && objc_msgSend(v58, "count"))
  {
    InputCount = BNNSGraphGetInputCount();
    std::vector<char const*>::vector(v64, InputCount);
    BNNSGraphGetInputNames_v2();
    OutputCount = BNNSGraphGetOutputCount();
    std::vector<char const*>::vector(__p, OutputCount);
    BNNSGraphGetOutputNames_v2();
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54 = a4;
    v56 = InputCount;
    v60 = v8;
    if (OutputCount)
    {
      v57 = OutputCount;
      v9 = 0;
      v10 = 0;
      v59 = 0;
      v11 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)__p[0] + v11), v54);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [CSFComputeDataBuffer alloc];
        -[NSDictionary objectForKeyedSubscript:](self->_bnnsIrOutputTensorsProperty, "objectForKeyedSubscript:", v61);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        v14 = -[CSFComputeDataBuffer initWithProperties:name:errOut:](v12, "initWithProperties:name:errOut:", v13, v61, &v62);
        v15 = v62;

        if (!v14 || v15 != 0)
          break;
        objc_msgSend(v60, "setObject:forKey:", v14, v61);
        objc_msgSend(v60, "objectForKeyedSubscript:", v61);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "getWritableDataPtr");
        objc_msgSend(v60, "objectForKeyedSubscript:", v61);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 4 * objc_msgSend(v19, "elementSize");
        if ((unint64_t)v10 >= v59)
        {
          v21 = ((char *)v10 - (char *)v9) >> 4;
          v22 = v21 + 1;
          if ((unint64_t)(v21 + 1) >> 60)
            std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v59 - (_QWORD)v9) >> 3 > v22)
            v22 = (uint64_t)(v59 - (_QWORD)v9) >> 3;
          if (v59 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
            v23 = 0xFFFFFFFFFFFFFFFLL;
          else
            v23 = v22;
          if (v23)
            v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v23);
          else
            v24 = 0;
          v25 = (uint64_t *)(v23 + 16 * v21);
          *v25 = v18;
          v25[1] = v20;
          if (v10 == v9)
          {
            v27 = (uint64_t *)(v23 + 16 * v21);
          }
          else
          {
            v26 = v23 + 16 * v21;
            do
            {
              v27 = (uint64_t *)(v26 - 16);
              *(_OWORD *)(v26 - 16) = *((_OWORD *)v10 - 1);
              v10 -= 2;
              v26 -= 16;
            }
            while (v10 != v9);
          }
          v59 = v23 + 16 * v24;
          v10 = v25 + 2;
          if (v9)
            operator delete(v9);
          v9 = v27;
        }
        else
        {
          *v10 = v18;
          v10[1] = v20;
          v10 += 2;
        }

        ++v11;
        v8 = v60;
        if (v11 == v57)
          goto LABEL_35;
      }
      if (v54)
        *v54 = objc_retainAutorelease(v15);

      goto LABEL_68;
    }
    v9 = 0;
    v10 = 0;
    v59 = 0;
LABEL_35:
    if (v56 == objc_msgSend(v58, "count", v54))
    {
      if (v56)
      {
        v32 = 0;
        while (1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)v64[0] + v32));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](self->_bnnsIrInputTensorsProperty, "objectForKeyedSubscript:", v61);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectForKeyedSubscript:", v61);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "tensorProperties");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v33, "isEqual:", v35);

          if ((v36 & 1) == 0)
            break;
          objc_msgSend(v58, "objectForKeyedSubscript:", v61);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "getWritableDataPtr");
          objc_msgSend(v58, "objectForKeyedSubscript:", v61);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 4 * objc_msgSend(v39, "elementSize");
          if ((unint64_t)v10 >= v59)
          {
            v41 = ((char *)v10 - (char *)v9) >> 4;
            v42 = v41 + 1;
            if ((unint64_t)(v41 + 1) >> 60)
              std::vector<CSAudioZeroFilterImpl<unsigned short>::ZeroRun,std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>::__throw_length_error[abi:ne180100]();
            if ((uint64_t)(v59 - (_QWORD)v9) >> 3 > v42)
              v42 = (uint64_t)(v59 - (_QWORD)v9) >> 3;
            if (v59 - (unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
              v43 = 0xFFFFFFFFFFFFFFFLL;
            else
              v43 = v42;
            if (v43)
              v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CSAudioZeroFilterImpl<unsigned short>::ZeroRun>>(v43);
            else
              v44 = 0;
            v45 = (uint64_t *)(v43 + 16 * v41);
            *v45 = v38;
            v45[1] = v40;
            if (v10 == v9)
            {
              v47 = (uint64_t *)(v43 + 16 * v41);
            }
            else
            {
              v46 = v43 + 16 * v41;
              do
              {
                v47 = (uint64_t *)(v46 - 16);
                *(_OWORD *)(v46 - 16) = *((_OWORD *)v10 - 1);
                v10 -= 2;
                v46 -= 16;
              }
              while (v10 != v9);
            }
            v59 = v43 + 16 * v44;
            v10 = v45 + 2;
            if (v9)
              operator delete(v9);
            v9 = v47;
          }
          else
          {
            *v10 = v38;
            v10[1] = v40;
            v10 += 2;
          }

          if (++v32 == v56)
            goto LABEL_59;
        }
        if (!v55)
          goto LABEL_69;
        v51 = (void *)MEMORY[0x1E0CB35C8];
        v67 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mismatched input tensor"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v68 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2415, v52);
        *v55 = (id)objc_claimAutoreleasedReturnValue();

LABEL_68:
LABEL_69:

        v31 = 0;
        v8 = v60;
LABEL_74:

        if (v9)
          operator delete(v9);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v64[0])
        {
          v64[1] = v64[0];
          operator delete(v64[0]);
        }
        goto LABEL_80;
      }
LABEL_59:
      v8 = v60;
      if (!BNNSGraphContextExecute_v2())
      {
        v31 = (void *)objc_msgSend(v60, "copy");
        goto LABEL_74;
      }
      if (v55)
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v65 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BNNSGraphContextExecute failed"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v61;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2408, v15);
        v49 = (id)objc_claimAutoreleasedReturnValue();
LABEL_64:
        *v55 = v49;
        goto LABEL_68;
      }
    }
    else if (v55)
    {
      v50 = (void *)MEMORY[0x1E0CB35C8];
      v69 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("given input length does not match"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v61;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2409, v15);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_64;
    }
    v31 = 0;
    goto LABEL_74;
  }
  if (a4)
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v71 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputs to model is empty"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2401, v30);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v31 = 0;
LABEL_80:

  return v31;
}

- (void)dealloc
{
  void *data;
  objc_super v4;

  BNNSGraphContextDestroy_v2();
  data = self->_graph.data;
  if (self->_graphIsMapped)
  {
    if (data != (void *)-1)
    {
      munmap(data, self->_graph.size);
      self->_graph.data = (void *)-1;
      self->_graph.size = 0;
    }
    self->_graphIsMapped = 0;
  }
  else if (data)
  {
    free(data);
    self->_graph.data = 0;
    self->_graph.size = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSFMil2bnnsComputeBackend;
  -[CSFMil2bnnsComputeBackend dealloc](&v4, sel_dealloc);
}

- (BOOL)graphIsMapped
{
  return self->_graphIsMapped;
}

- (void)setGraphIsMapped:(BOOL)a3
{
  self->_graphIsMapped = a3;
}

- (NSDictionary)bnnsIrOutputTensorsProperty
{
  return self->_bnnsIrOutputTensorsProperty;
}

- (void)setBnnsIrOutputTensorsProperty:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsIrOutputTensorsProperty, a3);
}

- (NSDictionary)bnnsIrInputTensorsProperty
{
  return self->_bnnsIrInputTensorsProperty;
}

- (void)setBnnsIrInputTensorsProperty:(id)a3
{
  objc_storeStrong((id *)&self->_bnnsIrInputTensorsProperty, a3);
}

- (NSString)milPath
{
  return self->_milPath;
}

- (NSString)bnnsIrPath
{
  return self->_bnnsIrPath;
}

- (NSString)funcName
{
  return self->_funcName;
}

- (bnnsIrMappedWeight)weight
{
  return self->_weight;
}

- (void)setWeight:(id)a3
{
  objc_storeStrong((id *)&self->_weight, a3);
}

- (CSFMil2bnnsCompilationConfig)modelCompilationConfig
{
  return self->_modelCompilationConfig;
}

- (void)setModelCompilationConfig:(id)a3
{
  objc_storeStrong((id *)&self->_modelCompilationConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelCompilationConfig, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_funcName, 0);
  objc_storeStrong((id *)&self->_bnnsIrPath, 0);
  objc_storeStrong((id *)&self->_milPath, 0);
  objc_storeStrong((id *)&self->_bnnsIrInputTensorsProperty, 0);
  objc_storeStrong((id *)&self->_bnnsIrOutputTensorsProperty, 0);
}

+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  CSFMil2bnnsCompilationConfig *v11;
  id v12;
  id v13;
  void *v14;
  size_t v15;
  size_t v16;
  id v17;
  void *v18;
  id v20;
  char v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("config.json"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v11 = -[CSFMil2bnnsCompilationConfig initWithConfigPath:errOut:]([CSFMil2bnnsCompilationConfig alloc], "initWithConfigPath:errOut:", v10, &v22);
  v12 = v22;
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    v21 = 0;
    v20 = 0;
    v14 = (void *)+[CSFMil2bnnsComputeBackend _compileWithMilFile:bnnsIrPath:separateWeight:compilationConfig:isBnnsIrMapped:errOut:](CSFMil2bnnsComputeBackend, "_compileWithMilFile:bnnsIrPath:separateWeight:compilationConfig:isBnnsIrMapped:errOut:", v7, v8, v9, v11, &v21, &v20);
    v16 = v15;
    v17 = v20;
    if (v21)
    {
      if (v14 != (void *)-1)
        munmap(v14, v16);
    }
    else if (v14)
    {
      free(v14);
    }
    v13 = v17;
  }
  v18 = v13;

  return v18;
}

+ (void)markPurgeableWithBnnsIrFile:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int *v10;
  char *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

    if ((v5 & 1) != 0)
    {
      v12 = 67589;
      v6 = objc_retainAutorelease(v3);
      v7 = fsctl((const char *)objc_msgSend(v6, "UTF8String"), 0xC0084A44uLL, &v12, 0);
      v8 = CSLogContextFacilityCoreSpeech;
      if (v7)
      {
        v9 = (id)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = __error();
          v11 = strerror(*v10);
          *(_DWORD *)buf = 136315650;
          v14 = "+[CSFMil2bnnsComputeBackend markPurgeableWithBnnsIrFile:]";
          v15 = 2112;
          v16 = v6;
          v17 = 2080;
          v18 = v11;
          _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s Fail to mark bnnsIrFile: %@ as purgeable: error: %s", buf, 0x20u);
        }

      }
      else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "+[CSFMil2bnnsComputeBackend markPurgeableWithBnnsIrFile:]";
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Mark bnnsIrFile: %@ as purgeable is successful!", buf, 0x16u);
      }
    }
  }

}

+ ($3265B292A9BE2BE95187D95CCBA22C14)_compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5 compilationConfig:(id)a6 isBnnsIrMapped:(BOOL *)a7 errOut:(id *)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];
  $3265B292A9BE2BE95187D95CCBA22C14 result;

  v40[1] = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v12 = a4;
  v34 = a5;
  v13 = a6;
  if (a7)
    *a7 = 0;
  v33 = v12;
  BNNSGraphCompileOptionsMakeDefault();
  objc_msgSend(v13, "singleThread");
  BNNSGraphCompileOptionsSetTargetSingleThread();
  objc_msgSend(v13, "debugInfo");
  BNNSGraphCompileOptionsSetGenerateDebugInfo();
  objc_msgSend(v13, "predefinedOptimizations");
  BNNSGraphCompileOptionsSetPredefinedOptimizations();
  if (objc_msgSend(v13, "optimizeForSize"))
    BNNSGraphCompileOptionsSetOptimizationPreference();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "fileExistsAtPath:", v15) & 1) == 0)
    {
      v36 = 0;
      objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v36);
      v16 = v36;
      if (v16)
      {
        v17 = v16;
        if (a8)
        {
          v17 = objc_retainAutorelease(v16);
          v18 = 0;
          v19 = 0;
          *a8 = v17;
LABEL_28:

          goto LABEL_29;
        }
LABEL_27:
        v18 = 0;
        v19 = 0;
        goto LABEL_28;
      }
    }
    BNNSGraphCompileOptionsSetFileWriteFSyncBarrier();
    v20 = objc_retainAutorelease(v12);
    objc_msgSend(v20, "UTF8String");
    BNNSGraphCompileOptionsSetOutputPathWithPermissionsAndProtectionClass();
    if (v34)
    {
      objc_msgSend(v34, "stringByDeletingLastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "fileExistsAtPath:", v21) & 1) == 0)
      {
        v35 = 0;
        objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v35);
        v22 = v35;
        if (v22)
        {
          v17 = v22;
          if (a8)
            *a8 = objc_retainAutorelease(v22);

          goto LABEL_27;
        }
      }
      objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
      BNNSGraphCompileOptionsSetWeightsPathWithPermissions();

    }
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    objc_msgSend(v13, "funcName");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v24, "UTF8String");
    v18 = BNNSGraphCompileFromFile_v2();
    v19 = v25;

    BNNSGraphCompileOptionsDestroy();
    if (v18)
    {
      if (a7)
        *a7 = 1;
      +[CSFMil2bnnsComputeBackend markPurgeableWithBnnsIrFile:](CSFMil2bnnsComputeBackend, "markPurgeableWithBnnsIrFile:", v20);
      v17 = 0;
      goto LABEL_28;
    }
    if (a8)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("graph data nil"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2260, v28);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
    goto LABEL_27;
  }
  if (a8)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bnnsIrPath nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2258, v15);
    v18 = 0;
    v19 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    goto LABEL_30;
  }
  v18 = 0;
  v19 = 0;
LABEL_30:

  v29 = (void *)v18;
  v30 = v19;
  result.var1 = v30;
  result.var0 = v29;
  return result;
}

@end
