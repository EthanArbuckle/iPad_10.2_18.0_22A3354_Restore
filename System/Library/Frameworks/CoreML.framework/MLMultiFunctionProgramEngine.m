@implementation MLMultiFunctionProgramEngine

- (MLMultiFunctionProgramEngine)initWithProgramContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  MLMultiFunctionProgramEngine *v12;
  void *v13;
  uint64_t v14;
  NSString *modelFileBasePath;
  MLProgramEngine *v16;
  uint64_t v17;
  NSMutableDictionary *functionNameToEngineMap;
  NSMutableDictionary *v19;
  void *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)MLMultiFunctionProgramEngine;
  v12 = -[MLModelEngine initWithDescription:configuration:](&v22, sel_initWithDescription_configuration_, v11, v10);

  if (!v12)
    goto LABEL_4;
  objc_storeStrong((id *)&v12->_container, a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramContainer setActiveFunction:](v12->_container, "setActiveFunction:", v13);

  objc_msgSend(v9, "modelFilePath");
  v14 = objc_claimAutoreleasedReturnValue();
  modelFileBasePath = v12->_modelFileBasePath;
  v12->_modelFileBasePath = (NSString *)v14;

  v16 = -[MLNeuralNetworkEngine initWithContainer:configuration:error:]([MLProgramEngine alloc], "initWithContainer:configuration:error:", v9, v10, a5);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    functionNameToEngineMap = v12->_functionNameToEngineMap;
    v12->_functionNameToEngineMap = (NSMutableDictionary *)v17;

    v19 = v12->_functionNameToEngineMap;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v16, v20);

LABEL_4:
    v16 = v12;
  }

  return (MLMultiFunctionProgramEngine *)v16;
}

- (unint64_t)signpostID
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v9[8];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (v4)
  {
    v6 = objc_msgSend(v4, "signpostID");
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
    }

    v6 = 0;
  }

  return v6;
}

- (unint64_t)predictionTypeForKTrace
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v9[8];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;

  if (v4)
  {
    v6 = objc_msgSend(v4, "predictionTypeForKTrace");
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
    }

    v6 = 0;
  }

  return v6;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "predictionFromFeatures:options:error:", v8, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "predictionsFromBatch:options:error:", v8, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)executionSchedule
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executionSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)modelPath
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setModelPath:(id)a3 modelName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "setModelPath:modelName:", v9, v6);

}

- (id)classLabels
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "classLabels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "classify:options:error:", v8, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "regress:options:error:", v8, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "evaluate:error:", v6, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)newContextAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  MLProgramContext *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;
  void *v68;
  uint8_t buf[4];
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  -[MLMultiFunctionProgramEngine container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "functionNameToInputLayersNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "init");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "init");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLMultiFunctionProgramEngine evaluateFunction:arguments:error:](self, "evaluateFunction:arguments:error:", v9, 0, a3);
    v10 = objc_claimAutoreleasedReturnValue();

    v59 = (void *)v10;
    if (!v10)
    {
      v59 = 0;
      v27 = 0;
      goto LABEL_23;
    }
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    -[MLMultiFunctionProgramEngine container](self, "container");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "functionNameToOutputLayersNames");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "init");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLMultiFunctionProgramEngine container](self, "container");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "functionNameToInputLayersNames");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v61 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if (objc_msgSend(v15, "containsObject:", v24))
          {
            objc_msgSend(v24, "stringByAppendingString:", CFSTR("_updated"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, v24);

          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v26;
    v65 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = -[MLProgramContext initWithExecutionState:functionNameToStateMap:]([MLProgramContext alloc], "initWithExecutionState:functionNameToStateMap:", v59, v58);
    -[MLMultiFunctionProgramEngine container](self, "container");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "functionNameToInputLayersNames");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLProgramContext setFunctionNameToInputLayersNames:](v27, "setFunctionNameToInputLayersNames:", v29);

    -[MLMultiFunctionProgramEngine container](self, "container");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "functionNameToOutputLayersNames");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLProgramContext setFunctionNameToOutputLayersNames:](v27, "setFunctionNameToOutputLayersNames:", v31);

    -[MLMultiFunctionProgramEngine container](self, "container");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "functionNameToOutputLayersNames");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count") == 0;

    if (!v36)
    {
      -[MLMultiFunctionProgramEngine container](self, "container");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "functionNameToOutputLayersNames");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLProgramContext setTrainFunctionLossName:](v27, "setTrainFunctionLossName:", v41);

    }
    -[MLMultiFunctionProgramEngine container](self, "container");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "functionNameToOutputLayersNames");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "forward");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKeyedSubscript:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count") == 0;

    if (!v46)
    {
      -[MLMultiFunctionProgramEngine container](self, "container");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "functionNameToOutputLayersNames");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "forward");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectAtIndexedSubscript:", 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLProgramContext setForwardFunctionLossName:](v27, "setForwardFunctionLossName:", v51);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "init");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLMultiFunctionProgramEngine removeEngineForFunctionName:](self, "removeEngineForFunctionName:", v52);

  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      -[MLMultiFunctionProgramEngine modelFileBasePath](self, "modelFileBasePath");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v70 = v57;
      _os_log_error_impl(&dword_19C486000, v53, OS_LOG_TYPE_ERROR, "The program (%@) has no init function, which means all the functions are stateless. Do not try to create a context on such a program.", buf, 0xCu);

    }
    if (!a3)
      return 0;
    v54 = (void *)MEMORY[0x1E0CB35C8];
    v67 = *MEMORY[0x1E0CB2D50];
    v55 = (void *)MEMORY[0x1E0CB3940];
    -[MLMultiFunctionProgramEngine modelFileBasePath](self, "modelFileBasePath");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringWithFormat:", CFSTR("The program (%@) has no init function, which means all the functions are stateless. Do not try to create a context on such a program."), v59);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 60, v15);
    v27 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_23:
  return v27;
}

- (void)updateModelFilePath:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v10, "isEqualToString:", v4);

  -[MLMultiFunctionProgramEngine modelFileBasePath](self, "modelFileBasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MLMultiFunctionProgramEngine container](self, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModelFilePath:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(":%@"), v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLMultiFunctionProgramEngine container](self, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModelFilePath:", v8);

  }
}

- (id)programEngineForFunction:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableDictionary *v7;
  MLProgramEngine *v8;
  void *v9;
  MLProgramEngine *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self->_functionNameToEngineMap;
  objc_sync_enter(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_functionNameToEngineMap, "objectForKeyedSubscript:", v6);
  v8 = (MLProgramEngine *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[MLMultiFunctionProgramEngine container](self, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActiveFunction:", v6);

    -[MLMultiFunctionProgramEngine updateModelFilePath:](self, "updateModelFilePath:", v6);
    v10 = [MLProgramEngine alloc];
    -[MLMultiFunctionProgramEngine container](self, "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModelEngine configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v8 = -[MLNeuralNetworkEngine initWithContainer:configuration:error:](v10, "initWithContainer:configuration:error:", v11, v12, &v17);
    v13 = v17;

    if (v8)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_functionNameToEngineMap, "setObject:forKeyedSubscript:", v8, v6);
    }
    else
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "localizedDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v19 = v6;
        v20 = 2112;
        v21 = v16;
        _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "Failed to create MLProgramEngine for function: %@ with error: %@", buf, 0x16u);

      }
      v8 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v13);
    }

  }
  objc_sync_exit(v7);

  return v8;
}

- (void)removeEngineForFunctionName:(id)a3
{
  id v5;
  NSMutableDictionary *obj;

  obj = self->_functionNameToEngineMap;
  v5 = a3;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeObjectForKey:](self->_functionNameToEngineMap, "removeObjectForKey:", v5);

  objc_sync_exit(obj);
}

- (BOOL)verifyArgumentNames:(id)a3 functionName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MLMultiFunctionProgramEngine container](self, "container");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "functionNameToInputLayersNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  if (v13 != objc_msgSend(v8, "count")
    || (v33[0] = MEMORY[0x1E0C809B0],
        v33[1] = 3221225472,
        v33[2] = __71__MLMultiFunctionProgramEngine_verifyArgumentNames_functionName_error___block_invoke,
        v33[3] = &unk_1E3D65880,
        v34 = v8,
        v14 = objc_msgSend(v12, "indexOfObjectPassingTest:", v33),
        v34,
        v14 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minusSet:", v32);
    if (objc_msgSend(v15, "count"))
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "allObjects");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR(", "));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = v28;
        v41 = 2112;
        v42 = v9;
        _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "The provided input(s): [%@] does not exist in the %@ function.", buf, 0x16u);

      }
      if (!a5)
        goto LABEL_17;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("The provided input(s): [%@] does not exist in the %@ function."), v20, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 60, v22);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "minusSet:", v8);
      if (!objc_msgSend(v19, "count"))
      {
        LOBYTE(a5) = 1;
        goto LABEL_16;
      }
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "allObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v40 = v30;
        v41 = 2112;
        v42 = v9;
        _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "The provided input(s) missing argument(s): [%@] for the %@ function.", buf, 0x16u);

      }
      if (!a5)
        goto LABEL_16;
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v19, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("The provided input(s) missing argument(s): [%@] for the %@ function."), v21, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 60, v25);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    LOBYTE(a5) = 0;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  LOBYTE(a5) = 1;
LABEL_18:

  return (char)a5;
}

- (id)evaluateFunction:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  -[MLMultiFunctionProgramEngine programEngineForFunction:error:](self, "programEngineForFunction:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && (objc_msgSend(v9, "featureNames"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = -[MLMultiFunctionProgramEngine verifyArgumentNames:functionName:error:](self, "verifyArgumentNames:functionName:error:", v11, v8, a5), v11, v12))
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v13, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)enableInstrumentsTracing
{
  NSMutableDictionary *functionNameToEngineMap;
  void *v3;
  id v4;

  functionNameToEngineMap = self->_functionNameToEngineMap;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](functionNameToEngineMap, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "enableInstrumentsTracing");
}

- (NSString)serializedMILText
{
  NSMutableDictionary *functionNameToEngineMap;
  void *v3;
  void *v4;
  void *v5;

  functionNameToEngineMap = self->_functionNameToEngineMap;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](functionNameToEngineMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE441670))
  {
    objc_msgSend(v4, "serializedMILText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (MLMultiFunctionProgramContainer)container
{
  return self->_container;
}

- (NSString)modelFileBasePath
{
  return self->_modelFileBasePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelFileBasePath, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_functionNameToEngineMap, 0);
}

uint64_t __71__MLMultiFunctionProgramEngine_verifyArgumentNames_functionName_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  kdebug_trace();
  +[MLMultiFunctionProgramContainer containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:](MLMultiFunctionProgramContainer, "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v12, v13, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProgramContainer:configuration:error:", v15, v14, a7);
  else
    v16 = 0;

  kdebug_trace();
  return v16;
}

@end
