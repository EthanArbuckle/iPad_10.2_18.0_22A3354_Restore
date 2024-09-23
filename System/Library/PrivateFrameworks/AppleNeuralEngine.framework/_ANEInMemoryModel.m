@implementation _ANEInMemoryModel

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  +[_ANELog framework](_ANELog, "framework");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gLogger;
  gLogger = v2;

}

+ (id)new
{
  return 0;
}

- (_ANEInMemoryModel)init
{

  return 0;
}

- (_ANEInMemoryModel)initWithDesctiptor:(id)a3
{
  id v6;
  _ANEInMemoryModel *v7;
  _ANEInMemoryModel *v8;
  uint64_t v9;
  NSString *hexStringIdentifier;
  NSDictionary *modelAttributes;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _ANEProgramForEvaluation *program;
  void *v16;
  uint64_t v17;
  NSString *compilerOptionsFileName;
  uint64_t v19;
  _ANEClient *sharedConnection;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_ANEInMemoryModel;
  v7 = -[_ANEInMemoryModel init](&v22, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_descriptor, a3);
    objc_msgSend(v6, "hexStringIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    hexStringIdentifier = v8->_hexStringIdentifier;
    v8->_hexStringIdentifier = (NSString *)v9;

    v8->_isMILModel = objc_msgSend(v6, "isMILModel");
    modelAttributes = v8->_modelAttributes;
    v8->_modelAttributes = (NSDictionary *)MEMORY[0x1E0C9AA70];

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v6, "hash"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "UTF8String");
    v13 = kdebug_trace_string();
    v8->_string_id = v13;
    if (v13 == -1)
    {
      +[_ANELog common](_ANELog, "common");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.4(a2);

    }
    program = v8->_program;
    v8->_programHandle = 0;
    v8->_program = 0;
    v8->_queueDepth = 0;

    v8->_perfStatsMask = 0;
    v8->_state = 0;
    objc_msgSend(v6, "optionsPlist");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      +[_ANEStrings defaultANECIROptionsFileName](_ANEStrings, "defaultANECIROptionsFileName");
      v17 = objc_claimAutoreleasedReturnValue();
      compilerOptionsFileName = v8->_compilerOptionsFileName;
      v8->_compilerOptionsFileName = (NSString *)v17;
    }
    else
    {
      compilerOptionsFileName = v8->_compilerOptionsFileName;
      v8->_compilerOptionsFileName = 0;
    }

    +[_ANEClient sharedConnection](_ANEClient, "sharedConnection");
    v19 = objc_claimAutoreleasedReturnValue();
    sharedConnection = v8->_sharedConnection;
    v8->_sharedConnection = (_ANEClient *)v19;

  }
  return v8;
}

- (void)dealloc
{
  unint64_t v4;
  NSObject *v5;
  objc_super v6;

  self->_state = 5;
  v4 = kdebug_trace_string();
  self->_string_id = v4;
  if (v4 == -1)
  {
    +[_ANELog common](_ANELog, "common");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_ANEModel initWithModelAtURL:sourceURL:UUID:key:identifierSource:cacheURLIdentifier:modelAttributes:standardizeURL:string_id:generateNewStringId:].cold.4(a2);

  }
  v6.receiver = self;
  v6.super_class = (Class)_ANEInMemoryModel;
  -[_ANEInMemoryModel dealloc](&v6, sel_dealloc);
}

- (id)localModelPath
{
  void *v3;
  void *v4;
  void *v5;

  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEInMemoryModel hexStringIdentifier](self, "hexStringIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)saveModelFiles
{
  void *v4;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  -[_ANEInMemoryModel modelURL](self, "modelURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_ANEInMemoryModel modelURL](self, "modelURL");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[_ANEInMemoryModel localModelPath](self, "localModelPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v47);
  v9 = v47;
  if ((v8 & 1) == 0)
  {
    +[_ANELog common](_ANELog, "common");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v50 = v39;
      v51 = 2112;
      v52 = v6;
      v53 = 2112;
      v54 = v9;
      _os_log_error_impl(&dword_1D3352000, v11, OS_LOG_TYPE_ERROR, "%@: createDirectoryAtPath:... failed tmp=%@ : lErr=%@", buf, 0x20u);

    }
    v36 = 0;
    goto LABEL_32;
  }
  +[_ANEStrings defaultANECIRFileName](_ANEStrings, "defaultANECIRFileName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  -[_ANEInMemoryModel descriptor](self, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "networkText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "writeToFile:atomically:", v11, 1);

  if ((v14 & 1) != 0)
  {
    -[_ANEInMemoryModel compilerOptionsFileName](self, "compilerOptionsFileName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
LABEL_8:
      v40 = v11;
      v41 = v9;
      v42 = v7;
      -[_ANEInMemoryModel descriptor](self, "descriptor", a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "weights");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v17 = v23;
      v24 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v44;
        while (2)
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v44 != v26)
              objc_enumerationMutation(v17);
            v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v27);
            -[_ANEInMemoryModel descriptor](self, "descriptor");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "weights");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v28);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "allKeys");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "firstObject");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v31, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "stringByAppendingPathComponent:", v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v34, "writeToFile:atomically:", v35, 1) & 1) == 0)
            {
              +[_ANELog common](_ANELog, "common");
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                -[_ANEInMemoryModel saveModelFiles].cold.1();

              v36 = 0;
              goto LABEL_26;
            }

            ++v27;
          }
          while (v25 != v27);
          v25 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
          if (v25)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        -[_ANEInMemoryModel setModelURL:](self, "setModelURL:", v36);
        -[_ANEInMemoryModel setDescriptor:](self, "setDescriptor:", 0);
      }
LABEL_26:
      v9 = v41;
      v7 = v42;
      v11 = v40;
      goto LABEL_31;
    }
    -[_ANEInMemoryModel compilerOptionsFileName](self, "compilerOptionsFileName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    -[_ANEInMemoryModel descriptor](self, "descriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "optionsPlist");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "writeToFile:atomically:", v17, 1);

    if ((v20 & 1) != 0)
    {

      goto LABEL_8;
    }
    +[_ANELog common](_ANELog, "common");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[_ANEInMemoryModel saveModelFiles].cold.2();

  }
  else
  {
    +[_ANELog common](_ANELog, "common");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_ANEInMemoryModel saveModelFiles].cold.3();
  }
  v36 = 0;
LABEL_31:

LABEL_32:
  return v36;
}

+ (id)inMemoryModelWithDescriptor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDesctiptor:", v4);

  return v5;
}

- (id)compilerOptionsWithOptions:(id)a3 isCompiledModelCached:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  _BOOL4 v7;
  __CFString **v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v7 = -[_ANEInMemoryModel isMILModel](self, "isMILModel");
  v8 = kANEFModelMILValue;
  if (!v7)
    v8 = kANEFModelANECIRValue;
  v9 = *v8;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, kANEFModelTypeKey[0]);
  -[_ANEInMemoryModel hexStringIdentifier](self, "hexStringIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, kANEFInMemoryModelIdentifierKey);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, kANEFInMemoryModelIsCachedKey);

  -[_ANEInMemoryModel compilerOptionsFileName](self, "compilerOptionsFileName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_ANEInMemoryModel compilerOptionsFileName](self, "compilerOptionsFileName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, kANEFCompilerOptionsFilenameKey[0]);

  }
  v14 = (void *)objc_msgSend(v6, "copy");

  return v14;
}

- (BOOL)compileWithQoS:(unsigned int)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v18;

  v6 = *(_QWORD *)&a3;
  v9 = a4;
  -[_ANEInMemoryModel saveModelFiles](self, "saveModelFiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[_ANEModel modelAtURL:key:](_ANEModel, "modelAtURL:key:", v10, &stru_1E9516758);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ANEInMemoryModel setModel:](self, "setModel:", v11);
    -[_ANEInMemoryModel compilerOptionsWithOptions:isCompiledModelCached:](self, "compilerOptionsWithOptions:isCompiledModelCached:", v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ANEInMemoryModel sharedConnection](self, "sharedConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v14 = objc_msgSend(v13, "compileModel:options:qos:error:", v11, v12, v6, &v18);
    v15 = v18;

    if ((v14 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      {
        -[_ANEInMemoryModel compileWithQoS:options:error:].cold.2();
        if (a5)
        {
LABEL_5:
          if (v15)
            *a5 = objc_retainAutorelease(v15);
        }
      }
      else if (a5)
      {
        goto LABEL_5;
      }
    }

    goto LABEL_11;
  }
  v16 = (void *)gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    -[_ANEInMemoryModel compileWithQoS:options:error:].cold.1(v16, a2);
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)loadWithQoS:(unsigned int)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  id v26;

  v6 = *(_QWORD *)&a3;
  v9 = a4;
  -[_ANEInMemoryModel hexStringIdentifier](self, "hexStringIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEInMemoryModel loadWithQoS:options:error:].cold.4();
  v11 = -[_ANEInMemoryModel compiledModelExists](self, "compiledModelExists");
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0C99E98];
    -[_ANEInMemoryModel hexStringIdentifier](self, "hexStringIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
      -[_ANEInMemoryModel loadWithQoS:options:error:].cold.2();
    goto LABEL_7;
  }
  -[_ANEInMemoryModel saveModelFiles](self, "saveModelFiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
LABEL_7:
    v15 = v10;
    +[_ANEModel modelAtURL:key:](_ANEModel, "modelAtURL:key:", v14, &stru_1E9516758);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ANEInMemoryModel setModel:](self, "setModel:", v16);
    v25 = v9;
    -[_ANEInMemoryModel compilerOptionsWithOptions:isCompiledModelCached:](self, "compilerOptionsWithOptions:isCompiledModelCached:", v9, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ANEInMemoryModel sharedConnection](self, "sharedConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v19 = objc_msgSend(v18, "loadModel:options:qos:error:", v16, v17, v6, &v26);
    v20 = v26;

    if (v19)
    {
      -[_ANEInMemoryModel setProgramHandle:](self, "setProgramHandle:", objc_msgSend(v16, "programHandle"));
      -[_ANEInMemoryModel setIntermediateBufferHandle:](self, "setIntermediateBufferHandle:", objc_msgSend(v16, "intermediateBufferHandle"));
      -[_ANEInMemoryModel setQueueDepth:](self, "setQueueDepth:", objc_msgSend(v16, "queueDepth"));
      objc_msgSend(v16, "modelAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEInMemoryModel setModelAttributes:](self, "setModelAttributes:", v21);

      -[_ANEInMemoryModel setPerfStatsMask:](self, "setPerfStatsMask:", objc_msgSend(v16, "perfStatsMask"));
      objc_msgSend(v16, "program");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ANEInMemoryModel setProgram:](self, "setProgram:", v22);

      -[_ANEInMemoryModel setState:](self, "setState:", 3);
      v10 = v15;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
        -[_ANEInMemoryModel loadWithQoS:options:error:].cold.1();
      v10 = v15;
      if (a5 && v20)
        *a5 = objc_retainAutorelease(v20);
    }

    v9 = v25;
    goto LABEL_15;
  }
  v24 = (void *)gLogger;
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    -[_ANEInMemoryModel compileWithQoS:options:error:].cold.1(v24, a2);
  LOBYTE(v19) = 0;
LABEL_15:

  return v19;
}

- (BOOL)unloadWithQoS:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v8;
  _BOOL4 v9;
  __CFString **v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *aSelector;
  id v26;
  char v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v5 = *(_QWORD *)&a3;
  v36[2] = *MEMORY[0x1E0C80C00];
  -[_ANEInMemoryModel hexStringIdentifier](self, "hexStringIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_ANEInMemoryModel isMILModel](self, "isMILModel");
  v10 = kANEFModelMILValue;
  if (!v9)
    v10 = kANEFModelANECIRValue;
  v11 = *v10;
  v35[0] = kANEFModelTypeKey[0];
  v35[1] = kANEFInMemoryModelIdentifierKey;
  v36[0] = v11;
  v36[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEInMemoryModel sharedConnection](self, "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEInMemoryModel model](self, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v15 = objc_msgSend(v13, "unloadModel:options:qos:error:", v14, v12, v5, &v28);
  v16 = v28;

  if ((v15 & 1) == 0 && os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    -[_ANEInMemoryModel unloadWithQoS:error:].cold.1();
  -[_ANEInMemoryModel localModelPath](self, "localModelPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  if (objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v17, &v27))
  {
    aSelector = a2;
    v26 = v16;
    v19 = objc_msgSend(v18, "removeItemAtPath:error:", v17, &v26);
    v20 = v26;

    if ((v19 & 1) == 0)
    {
      v21 = (void *)gLogger;
      if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        NSStringFromSelector(aSelector);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v23;
        v31 = 2112;
        v32 = v17;
        v33 = 2112;
        v34 = v20;
        _os_log_error_impl(&dword_1D3352000, v22, OS_LOG_TYPE_ERROR, "%@: removeItemAtPath: failed! localPath=%@ : lErr=%@", buf, 0x20u);

      }
    }
  }
  else
  {
    v20 = v16;
  }
  if (a4 && v15 != 1 && v20)
    *a4 = objc_retainAutorelease(v20);

  return v15;
}

- (BOOL)evaluateWithQoS:(unsigned int)a3 options:(id)a4 request:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v24;
  unsigned int v25;

  v8 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[_ANEVirtualClient sharedConnection](_ANEVirtualClient, "sharedConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ANEInMemoryModel model](self, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v14, "evaluateWithModel:options:request:qos:error:", v15, v11, v12, v8, a6);

    goto LABEL_13;
  }
  if (+[_ANEDeviceInfo isVirtualMachine](_ANEDeviceInfo, "isVirtualMachine"))
  {
    v16 = (void *)gLogger;
    if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_ERROR))
    {
      -[_ANEInMemoryModel evaluateWithQoS:options:request:error:].cold.1(v16, a2);
      if (!a6)
        goto LABEL_7;
    }
    else if (!a6)
    {
LABEL_7:
      LOBYTE(v8) = 0;
      goto LABEL_13;
    }
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ANEErrors hostTooOld:](_ANEErrors, "hostTooOld:", v17);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v18 = +[_ANEQoSMapper queueIndexForQoS:](_ANEQoSMapper, "queueIndexForQoS:", v8);
  v25 = 0;
  -[_ANEInMemoryModel program](self, "program");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  LODWORD(v8) = objc_msgSend(v19, "processRequest:model:qos:qIndex:modelStringID:options:returnValue:error:", v12, 0, v8, v18, -[_ANEInMemoryModel string_id](self, "string_id"), v11, &v25, &v24);
  v20 = v24;

  if (a6 && !(_DWORD)v8 && v20)
  {
    *a6 = objc_retainAutorelease(v20);
    -[_ANEInMemoryModel sharedConnection](self, "sharedConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ANEInMemoryModel model](self, "model");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reportEvaluateFailure:failureReason:qIdx:", v22, v25, v18);

  }
LABEL_13:

  return v8;
}

- (BOOL)compiledModelExists
{
  void *v3;
  void *v4;
  char v5;

  -[_ANEInMemoryModel hexStringIdentifier](self, "hexStringIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEInMemoryModel loadWithQoS:options:error:].cold.4();
  -[_ANEInMemoryModel sharedConnection](self, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "compiledModelExistsMatchingHash:", v3);

  return v5;
}

- (void)purgeCompiledModel
{
  void *v3;
  void *v4;

  -[_ANEInMemoryModel hexStringIdentifier](self, "hexStringIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)gLogger, OS_LOG_TYPE_DEBUG))
    -[_ANEInMemoryModel loadWithQoS:options:error:].cold.4();
  -[_ANEInMemoryModel sharedConnection](self, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purgeCompiledModelMatchingHash:", v3);

}

- (BOOL)mapIOSurfacesWithRequest:(id)a3 cacheInference:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  -[_ANEInMemoryModel sharedConnection](self, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANEInMemoryModel model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "mapIOSurfacesWithModel:request:cacheInference:error:", v10, v8, v6, a5);

  return (char)a5;
}

- (void)unmapIOSurfacesWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_ANEInMemoryModel sharedConnection](self, "sharedConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_ANEInMemoryModel model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unmapIOSurfacesWithModel:request:", v5, v4);

}

- (NSDictionary)modelAttributes
{
  return self->_modelAttributes;
}

- (void)setModelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_modelAttributes, a3);
}

- (unsigned)perfStatsMask
{
  return self->_perfStatsMask;
}

- (void)setPerfStatsMask:(unsigned int)a3
{
  self->_perfStatsMask = a3;
}

- (NSString)hexStringIdentifier
{
  return self->_hexStringIdentifier;
}

- (unint64_t)intermediateBufferHandle
{
  return self->_intermediateBufferHandle;
}

- (void)setIntermediateBufferHandle:(unint64_t)a3
{
  self->_intermediateBufferHandle = a3;
}

- (char)queueDepth
{
  return self->_queueDepth;
}

- (void)setQueueDepth:(char)a3
{
  self->_queueDepth = a3;
}

- (_ANEClient)sharedConnection
{
  return self->_sharedConnection;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_storeStrong((id *)&self->_modelURL, a3);
}

- (BOOL)isMILModel
{
  return self->_isMILModel;
}

- (NSString)compilerOptionsFileName
{
  return self->_compilerOptionsFileName;
}

- (void)setCompilerOptionsFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_ANEModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (unint64_t)string_id
{
  return self->_string_id;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (void)setProgramHandle:(unint64_t)a3
{
  self->_programHandle = a3;
}

- (_ANEProgramForEvaluation)program
{
  return self->_program;
}

- (void)setProgram:(id)a3
{
  objc_storeStrong((id *)&self->_program, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (_ANEInMemoryModelDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_compilerOptionsFileName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_sharedConnection, 0);
  objc_storeStrong((id *)&self->_hexStringIdentifier, 0);
  objc_storeStrong((id *)&self->_modelAttributes, 0);
}

- (void)saveModelFiles
{
  NSObject *v0;
  SEL v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  v5 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v0, v3, "%@:  Write netPlistPath=%@ failed", v4);

  OUTLINED_FUNCTION_2();
}

- (void)compileWithQoS:(void *)a1 options:(const char *)a2 error:.cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1(&dword_1D3352000, v5, v6, "%@: saveModelFiles failed", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)compileWithQoS:options:error:.cold.2()
{
  NSObject *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(v1);
  v2 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v0, v4, "%@: compileModel:options:qos:error: failed! lErr=%@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)loadWithQoS:options:error:.cold.1()
{
  NSObject *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(v1);
  v2 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v0, v4, "%@: loadModel:options:qos:error: failed! lErr=%@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)loadWithQoS:options:error:.cold.2()
{
  void *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(v1);
  v2 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_4(&dword_1D3352000, v4, v5, "%@: modelURL=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)loadWithQoS:options:error:.cold.4()
{
  void *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(v1);
  v2 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_4(&dword_1D3352000, v4, v5, "%@: modelIdentifier=%@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)unloadWithQoS:error:.cold.1()
{
  NSObject *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(v1);
  v2 = (const char *)OUTLINED_FUNCTION_9_1();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_4(&dword_1D3352000, v0, v4, "%@: unLoadModel:options:qos:error: failed! lErr=%@", v5);

  OUTLINED_FUNCTION_2();
}

- (void)evaluateWithQoS:(void *)a1 options:(const char *)a2 request:error:.cold.1(void *a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_4_1(a1);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_1(&dword_1D3352000, v5, v6, "%@: Virtual Machine environment detected but no virtualClient available.", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
