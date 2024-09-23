@implementation MLE5ExecutionStreamOperation

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (e5rt_execution_stream_operation)_createOperationWithRetryCount:(int64_t)a3 error:(id *)a4
{
  __int128 v4;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  e5rt_execution_stream_operation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 < 1)
    return 0;
  v8 = 0;
  *(_QWORD *)&v4 = 138413058;
  v18 = v4;
  while (1)
  {
    -[MLE5ExecutionStreamOperation programLibrary](self, "programLibrary", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5ExecutionStreamOperation functionName](self, "functionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5ExecutionStreamOperation modelDescription](self, "modelDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (e5rt_execution_stream_operation *)objc_msgSend(v9, "createOperationForFunctionName:forceRespecialization:hasRangeShapeInputs:error:", v10, v8 != 0, objc_msgSend(v11, "hasRangeShapeInputs"), a4);

    if (v12)
      break;
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[MLE5ExecutionStreamOperation functionName](self, "functionName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLE5ExecutionStreamOperation programLibrary](self, "programLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "modelDisplayName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ++v8;
      *(_DWORD *)buf = v18;
      v20 = v14;
      v21 = 2112;
      v22 = v16;
      v23 = 2048;
      v24 = v8;
      v25 = 2048;
      v26 = a3;
      _os_log_impl(&dword_19C486000, v13, OS_LOG_TYPE_INFO, "Failed to create E5 execution stream operation for the function (%@) in the model (%@). It can happen when APFS purged a compiled E5 bundle. We will recompile the bundle and try again. (Retry %zd / %zd)", buf, 0x2Au);

    }
    else
    {
      ++v8;
    }

    if (v8 == a3)
      return 0;
  }
  return v12;
}

- (void)setPixelBufferPool:(id)a3
{
  objc_storeStrong((id *)&self->_pixelBufferPool, a3);
}

- (MLE5ProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (BOOL)preloadAndReturnError:(id *)a3
{
  e5rt_execution_stream_operation *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  if (!-[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle"))
  {
    v5 = -[MLE5ExecutionStreamOperation _createOperationAndReturnError:](self, "_createOperationAndReturnError:", a3);
    if (!v5)
      return (char)v5;
    -[MLE5ExecutionStreamOperation setOperationHandle:](self, "setOperationHandle:", v5);
    -[MLE5ExecutionStreamOperation _inputPortNames](self, "_inputPortNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5ExecutionStreamOperation modelDescription](self, "modelDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDescriptionsByName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MLE5ExecutionStreamOperation _newArrayOfInputPorts:featureDescriptionsByName:error:](self, "_newArrayOfInputPorts:featureDescriptionsByName:error:", v6, v8, a3);
    -[MLE5ExecutionStreamOperation setInputPorts:](self, "setInputPorts:", v9);

    -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_7;
    -[MLE5ExecutionStreamOperation _inoutPortNames](self, "_inoutPortNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5ExecutionStreamOperation modelDescription](self, "modelDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stateDescriptionsByName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MLE5ExecutionStreamOperation _newArrayOfInoutPorts:featureDescriptionsByName:error:](self, "_newArrayOfInoutPorts:featureDescriptionsByName:error:", v11, v13, a3);
    -[MLE5ExecutionStreamOperation setStatePorts:](self, "setStatePorts:", v14);

    -[MLE5ExecutionStreamOperation statePorts](self, "statePorts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_7;
    -[MLE5ExecutionStreamOperation _outputPortNames](self, "_outputPortNames");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5ExecutionStreamOperation modelDescription](self, "modelDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "outputDescriptionsByName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MLE5ExecutionStreamOperation _newArrayOfOutputPorts:featureDescriptionsByName:error:](self, "_newArrayOfOutputPorts:featureDescriptionsByName:error:", v16, v18, a3);
    -[MLE5ExecutionStreamOperation setOutputPorts:](self, "setOutputPorts:", v19);

    -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
LABEL_7:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
  }
  LOBYTE(v5) = 1;
  return (char)v5;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)setOutputPorts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setOperationHandle:(e5rt_execution_stream_operation *)a3
{
  self->_operationHandle = a3;
}

- (void)setInputPorts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)outputPorts
{
  return self->_outputPorts;
}

- (NSArray)inputPorts
{
  return self->_inputPorts;
}

- (NSString)functionName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (id)_outputPortNames
{
  uint64_t num_outputs;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  uint64_t output_names;
  NSObject *v8;
  void *v9;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  num_outputs = e5rt_execution_stream_operation_get_num_outputs();
  v4 = (_QWORD *)MEMORY[0x1E0C99750];
  if ((_DWORD)num_outputs)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      last_error_message = e5rt_get_last_error_message();
      v14 = 1024;
      v15 = num_outputs;
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "Failed to get the number of outputs for operation E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("Failed to get the number of outputs for operation E5RT: %s (%d)"), e5rt_get_last_error_message(), num_outputs);
  }
  v6 = (void *)operator new[]();
  bzero(v6, 0);
  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  output_names = e5rt_execution_stream_operation_get_output_names();
  if ((_DWORD)output_names)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      last_error_message = v11;
      v14 = 1024;
      v15 = output_names;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Failed to get output port names for operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("Failed to get output port names for operation. E5RT: %s (%d)"), e5rt_get_last_error_message(), output_names);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  MEMORY[0x1A1AD6248](v6, 0x50C80EE9192B6);
  return v9;
}

- (e5rt_execution_stream_operation)operationHandle
{
  return self->_operationHandle;
}

- (MLPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (id)_inputPortNames
{
  uint64_t num_inputs;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  uint64_t input_names;
  NSObject *v8;
  void *v9;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  num_inputs = e5rt_execution_stream_operation_get_num_inputs();
  v4 = (_QWORD *)MEMORY[0x1E0C99750];
  if ((_DWORD)num_inputs)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      last_error_message = e5rt_get_last_error_message();
      v14 = 1024;
      v15 = num_inputs;
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "Failed to get the number of inputs for operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("Failed to get the number of inputs for operation. E5RT: %s (%d)"), e5rt_get_last_error_message(), num_inputs);
  }
  v6 = (void *)operator new[]();
  bzero(v6, 0);
  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  input_names = e5rt_execution_stream_operation_get_input_names();
  if ((_DWORD)input_names)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      last_error_message = v11;
      v14 = 1024;
      v15 = input_names;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Failed to get input port names for operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("Failed to get input port names for operation. E5RT: %s (%d)"), e5rt_get_last_error_message(), input_names);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  MEMORY[0x1A1AD6248](v6, 0x50C80EE9192B6);
  return v9;
}

- (e5rt_execution_stream_operation)_createOperationAndReturnError:(id *)a3
{
  return -[MLE5ExecutionStreamOperation _createOperationWithRetryCount:error:](self, "_createOperationWithRetryCount:error:", 2, a3);
}

- (MLE5ExecutionStreamOperation)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 debugLabel:(id)a7 modelSignpostId:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  MLE5ExecutionStreamOperation *v19;
  MLE5ExecutionStreamOperation *v20;
  MLE5ExecutionStreamOperation *v21;
  uint64_t v22;
  NSString *functionName;
  NSString *v24;
  __CFString *debugLabel;
  const __CFString *v26;
  uint64_t v27;
  NSString *v28;
  NSArray *inputPorts;
  NSArray *statePorts;
  NSArray *outputPorts;
  NSArray *waitSharedEventsBoundToESOP;
  id v33;
  NSObject *v34;
  dispatch_queue_t v35;
  uint64_t v36;
  IOSurfaceSharedEventListener *waitEventListener;
  id v39;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v39 = a5;
  v17 = a6;
  v18 = a7;
  v40.receiver = self;
  v40.super_class = (Class)MLE5ExecutionStreamOperation;
  v19 = -[MLE5ExecutionStreamOperation init](&v40, sel_init);
  v20 = v19;
  v21 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_programLibrary, a3);
    v22 = objc_msgSend(v16, "copy");
    functionName = v21->_functionName;
    v21->_functionName = (NSString *)v22;

    objc_storeStrong((id *)&v20->_modelDescription, a5);
    objc_storeStrong((id *)&v20->_modelConfiguration, a6);
    if (v18)
    {
      v24 = (NSString *)v18;
      debugLabel = (__CFString *)v21->_debugLabel;
      v21->_debugLabel = v24;
    }
    else
    {
      objc_msgSend(v15, "modelDisplayName");
      debugLabel = (__CFString *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("Unnamed Model");
      if (debugLabel)
        v26 = debugLabel;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreMLInference: %@ (%@)"), v26, v16);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v21->_debugLabel;
      v21->_debugLabel = (NSString *)v27;

    }
    v21->_modelSignpostId = a8;
    v21->_operationHandle = 0;
    inputPorts = v21->_inputPorts;
    v21->_inputPorts = 0;

    statePorts = v21->_statePorts;
    v21->_statePorts = 0;

    outputPorts = v21->_outputPorts;
    v21->_outputPorts = 0;

    waitSharedEventsBoundToESOP = v21->_waitSharedEventsBoundToESOP;
    v21->_waitSharedEventsBoundToESOP = (NSArray *)MEMORY[0x1E0C9AA60];

    v21->_state = 0;
    v33 = objc_alloc(MEMORY[0x1E0CBBEC0]);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_queue_create("com.apple.coreml.MLE5WaitEventListenerQueue", v34);
    v36 = objc_msgSend(v33, "initWithDispatchQueue:", v35);
    waitEventListener = v21->_waitEventListener;
    v21->_waitEventListener = (IOSurfaceSharedEventListener *)v36;

  }
  return v21;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_operationHandle)
    e5rt_execution_stream_operation_release();
  v3.receiver = self;
  v3.super_class = (Class)MLE5ExecutionStreamOperation;
  -[MLE5ExecutionStreamOperation dealloc](&v3, sel_dealloc);
}

- (BOOL)_reusableForWaitSyncPoints:(id)a3 allInputsUseDirectBinding:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  void **v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    v16 = v24 == v25;
    v26 = (void **)&v24;
LABEL_17:
    std::vector<std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>>::__destroy_vector::operator()[abi:ne180100](&v26);
    goto LABEL_18;
  }
  if (!v4)
  {
    if (v25 - v24 == 8)
    {
      e5rt_async_event_get_iosurface_shared_event();
      v17 = 0;
      e5rt_async_event_get_iosurface_shared_event();
      v18 = 0;
      v16 = v17 == v18;

    }
    else
    {
      v16 = 0;
    }
    v26 = (void **)&v24;
    goto LABEL_17;
  }
  -[MLE5ExecutionStreamOperation waitSharedEventsBoundToESOP](self, "waitSharedEventsBoundToESOP");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "sharedEvent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v14);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      }
      while (v11);
    }

    -[MLE5ExecutionStreamOperation waitSharedEventsBoundToESOP](self, "waitSharedEventsBoundToESOP");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "isEqual:", v15);

  }
  else
  {
    v16 = 0;
  }
LABEL_18:

  return v16;
}

- (BOOL)_reusableForCompletionSyncPoint:(id)a3 allOutputBackingsUseDirectBinding:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  if (!v6 || !v4)
  {
    -[MLE5ExecutionStreamOperation completionSharedEventBoundToESOP](self, "completionSharedEventBoundToESOP");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = v8 == 0;
    goto LABEL_6;
  }
  -[MLE5ExecutionStreamOperation completionSharedEventBoundToESOP](self, "completionSharedEventBoundToESOP");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MLE5ExecutionStreamOperation completionSharedEventBoundToESOP](self, "completionSharedEventBoundToESOP");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = v8 == v9;

LABEL_6:
  }

  return (char)v7;
}

- (BOOL)reusableForInputFeatures:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  BOOL v32;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  if (-[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v46;
      LODWORD(v10) = 1;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v11);
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "featureValueForName:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = 0;
        if ((objc_msgSend(v12, "reusableForFeatureValue:willBindDirectly:", v14, &v44) & 1) == 0)
          goto LABEL_32;
        v15 = v44 != 0;

        v10 = v10 & v15;
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
    }
    v10 = 1;
LABEL_12:

    objc_msgSend(v35, "waitSyncPoints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MLE5ExecutionStreamOperation _reusableForWaitSyncPoints:allInputsUseDirectBinding:](self, "_reusableForWaitSyncPoints:allInputsUseDirectBinding:", v16, v10);

    if (v17)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      -[MLE5ExecutionStreamOperation statePorts](self, "statePorts");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v41;
LABEL_15:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v7);
          v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v20);
          objc_msgSend(v21, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "featureValueForName:", v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          -[MLE5ExecutionStreamOperation _multiArrayFeatureFromStateFeature:](self, "_multiArrayFeatureFromStateFeature:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
            break;
          v24 = objc_msgSend(v21, "reusableForFeatureValue:willBindDirectly:", v23, 0);

          if ((v24 & 1) == 0)
            goto LABEL_33;
          if (v18 == ++v20)
          {
            v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
            if (v18)
              goto LABEL_15;
            goto LABEL_22;
          }
        }
      }
      else
      {
LABEL_22:

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
        if (!v25)
        {
          v26 = 1;
LABEL_37:

          objc_msgSend(v35, "completionSyncPoint");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[MLE5ExecutionStreamOperation _reusableForCompletionSyncPoint:allOutputBackingsUseDirectBinding:](self, "_reusableForCompletionSyncPoint:allOutputBackingsUseDirectBinding:", v7, v26);
LABEL_34:

          goto LABEL_35;
        }
        v34 = *(_QWORD *)v37;
        LODWORD(v26) = 1;
LABEL_24:
        v27 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v34)
            objc_enumerationMutation(v7);
          v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v27);
          objc_msgSend(v35, "outputBackings", v34);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v30);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = 0;
          if ((objc_msgSend(v28, "reusableForOutputBacking:willBindDirectly:", v14, &v44) & 1) == 0)
            break;
          v31 = v44 != 0;

          v26 = v26 & v31;
          if (v25 == ++v27)
          {
            v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
            if (v25)
              goto LABEL_24;
            goto LABEL_37;
          }
        }
      }
LABEL_32:

LABEL_33:
      v32 = 0;
      goto LABEL_34;
    }
  }
  v32 = 0;
LABEL_35:

  return v32;
}

- (BOOL)prepareForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!-[MLE5ExecutionStreamOperation preloadAndReturnError:](self, "preloadAndReturnError:", a5)
    || !-[MLE5ExecutionStreamOperation _prepareInputPortsForFeatures:error:](self, "_prepareInputPortsForFeatures:error:", v8, a5)|| !-[MLE5ExecutionStreamOperation _copyInputFeatures:error:](self, "_copyInputFeatures:error:", v8, a5)|| !-[MLE5ExecutionStreamOperation _bindOutputPortsWithOptions:error:](self, "_bindOutputPortsWithOptions:error:", v9, a5))
  {
    goto LABEL_11;
  }
  if (-[MLE5ExecutionStreamOperation state](self, "state") == 1
    || (-[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle"),
        v10 = e5rt_execution_stream_operation_prepare_op_for_encode(),
        !(_DWORD)v10))
  {
    LOBYTE(a5) = 1;
    -[MLE5ExecutionStreamOperation setState:](self, "setState:", 1);
    goto LABEL_12;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    last_error_message = e5rt_get_last_error_message();
    v16 = 1024;
    v17 = v10;
    _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
  }

  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v12, CFSTR("Unable to prepare the model for predictions."));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    LOBYTE(a5) = 0;
  }
LABEL_12:

  return (char)a5;
}

- (BOOL)prepareAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!-[MLE5ExecutionStreamOperation preloadAndReturnError:](self, "preloadAndReturnError:", a5)
    || !-[MLE5ExecutionStreamOperation _bindInputFeaturesAndWaitEvents:options:error:](self, "_bindInputFeaturesAndWaitEvents:options:error:", v8, v9, a5)|| !-[MLE5ExecutionStreamOperation _bindOutputPortsWithOptions:error:](self, "_bindOutputPortsWithOptions:error:", v9, a5))
  {
    goto LABEL_10;
  }
  if (-[MLE5ExecutionStreamOperation state](self, "state") == 2
    || (-[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle"),
        v10 = e5rt_execution_stream_operation_prepare_op_for_encode(),
        !(_DWORD)v10))
  {
    -[MLE5ExecutionStreamOperation setState:](self, "setState:", 2);
    LOBYTE(a5) = 1;
    goto LABEL_11;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    last_error_message = e5rt_get_last_error_message();
    v16 = 1024;
    v17 = v10;
    _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
  }

  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v12, CFSTR("Unable to prepare the model for asynchronous predictions."));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    LOBYTE(a5) = 0;
  }
LABEL_11:

  return (char)a5;
}

- (MLFeatureProvider)outputFeatures
{
  unint64_t v3;
  void (**v4)(_QWORD);
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  MLDictionaryFeatureProvider *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = -[MLE5ExecutionStreamOperation modelSignpostId](self, "modelSignpostId");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__MLE5ExecutionStreamOperation_outputFeatures__block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v3;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (-[MLE5ExecutionStreamOperation state](self, "state") != 1
    && -[MLE5ExecutionStreamOperation state](self, "state") != 2)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "The operation was never prepared or has been reset", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The operation was never prepared or has been reset"));
  }
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "featureValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v10);
  }

  v23 = 0;
  v16 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v8, &v23);
  v17 = v23;
  if (!v8)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v22;
      _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Failed to build output feature provider with error %@.", buf, 0xCu);

    }
    v19 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v17, "localizedDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to build output feature provider with error %@."), v20);

  }
  v4[2](v4);

  return (MLFeatureProvider *)v16;
}

- (id)_directlyBoundFeatureNamesForPorts:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "boundFeatureDirectly", (_QWORD)v14))
        {
          if (!v4)
            v4 = (void *)objc_msgSend(v7, "mutableCopy");
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  if (v4)
    v11 = v4;
  else
    v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = v11;

  return v12;
}

- (NSArray)directlyBoundInputFeatureNames
{
  void *v3;
  void *v4;

  -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5ExecutionStreamOperation _directlyBoundFeatureNamesForPorts:](self, "_directlyBoundFeatureNamesForPorts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)directlyBoundOutputFeatureNames
{
  void *v3;
  void *v4;

  -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5ExecutionStreamOperation _directlyBoundFeatureNamesForPorts:](self, "_directlyBoundFeatureNamesForPorts:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)reset
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[MLE5ExecutionStreamOperation setAsyncSubmissionError:](self, "setAsyncSubmissionError:", 0);
  if (-[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle"))
  {
    -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
    v3 = e5rt_execution_stream_operation_bind_dependent_events();
    v4 = (_QWORD *)MEMORY[0x1E0C99750];
    if ((_DWORD)v3)
    {
      v5 = v3;
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        last_error_message = e5rt_get_last_error_message();
        v39 = 1024;
        v40 = v5;
        _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "Failed to unbind dependent events. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("Failed to unbind dependent events. E5RT: %s (%d)"), e5rt_get_last_error_message(), v5);
    }
    -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
    v7 = e5rt_execution_stream_operation_bind_completion_event();
    if ((_DWORD)v7)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v21 = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        last_error_message = v21;
        v39 = 1024;
        v40 = v7;
        _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Failed to unbind completion event. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("Failed to unbind completion event. E5RT: %s (%d)"), e5rt_get_last_error_message(), v7);
    }
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v31;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v12++), "reset");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v10);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[MLE5ExecutionStreamOperation statePorts](self, "statePorts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v27;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16++), "reset");
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "reset");
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v18);
  }

  -[MLE5ExecutionStreamOperation setWaitSharedEventsBoundToESOP:](self, "setWaitSharedEventsBoundToESOP:", MEMORY[0x1E0C9AA60]);
  -[MLE5ExecutionStreamOperation setCompletionSharedEventBoundToESOP:](self, "setCompletionSharedEventBoundToESOP:", 0);
  -[MLE5ExecutionStreamOperation setState:](self, "setState:", 0);
}

- (id)_newArrayOfInputPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  MLE5InputPort *v18;
  void *v19;
  uint64_t last_error_message;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v22;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    v11 = *MEMORY[0x1E0C99750];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
        v14 = objc_retainAutorelease(v13);
        objc_msgSend(v14, "UTF8String");
        v15 = e5rt_execution_stream_operation_retain_input_port();
        if ((_DWORD)v15)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 138412802;
            v29 = v14;
            v30 = 2080;
            v31 = last_error_message;
            v32 = 1024;
            v33 = v15;
            _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", buf, 0x1Cu);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v11, CFSTR("Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)"), v14, e5rt_get_last_error_message(), v15);
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MLE5InputPort initWithPortHandle:name:featureDescription:]([MLE5InputPort alloc], "initWithPortHandle:name:featureDescription:", 0, v14, v17);
        -[MLE5ExecutionStreamOperation pixelBufferPool](self, "pixelBufferPool");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLE5InputPort setPixelBufferPool:](v18, "setPixelBufferPool:", v19);

        objc_msgSend(v8, "addObject:", v18);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v9);
  }

  return v8;
}

- (id)_newArrayOfInoutPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  MLE5InputPort *v18;
  void *v19;
  uint64_t last_error_message;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v22;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    v11 = *MEMORY[0x1E0C99750];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
        v14 = objc_retainAutorelease(v13);
        objc_msgSend(v14, "UTF8String");
        v15 = e5rt_execution_stream_operation_retain_inout_port();
        if ((_DWORD)v15)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 138412802;
            v29 = v14;
            v30 = 2080;
            v31 = last_error_message;
            v32 = 1024;
            v33 = v15;
            _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", buf, 0x1Cu);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v11, CFSTR("Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)"), v14, e5rt_get_last_error_message(), v15);
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MLE5InputPort initWithPortHandle:name:featureDescription:]([MLE5InputPort alloc], "initWithPortHandle:name:featureDescription:", 0, v14, v17);
        -[MLE5ExecutionStreamOperation pixelBufferPool](self, "pixelBufferPool");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLE5InputPort setPixelBufferPool:](v18, "setPixelBufferPool:", v19);

        objc_msgSend(v8, "addObject:", v18);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v9);
  }

  return v8;
}

- (id)_newArrayOfOutputPorts:(id)a3 featureDescriptionsByName:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  MLE5OutputPort *v18;
  void *v19;
  uint64_t last_error_message;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v22;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    v11 = *MEMORY[0x1E0C99750];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
        v14 = objc_retainAutorelease(v13);
        objc_msgSend(v14, "UTF8String");
        v15 = e5rt_execution_stream_operation_retain_output_port();
        if ((_DWORD)v15)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 138412802;
            v29 = v14;
            v30 = 2080;
            v31 = last_error_message;
            v32 = 1024;
            v33 = v15;
            _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)", buf, 0x1Cu);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v11, CFSTR("Failed to retain E5 execution stream operation input port %@ E5RT: %s (%d)"), v14, e5rt_get_last_error_message(), v15);
        }
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MLE5OutputPort initWithPortHandle:name:featureDescription:]([MLE5OutputPort alloc], "initWithPortHandle:name:featureDescription:", 0, v14, v17);
        -[MLE5ExecutionStreamOperation pixelBufferPool](self, "pixelBufferPool");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLE5OutputPort setPixelBufferPool:](v18, "setPixelBufferPool:", v19);

        objc_msgSend(v8, "addObject:", v18);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v9);
  }

  return v8;
}

- (BOOL)_prepareInputPortsForFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (-[MLE5ExecutionStreamOperation statePorts](self, "statePorts"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Trying to bind features to input ports without first initializing ports.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Trying to bind features to input ports without first initializing ports."));
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "featureValueForName:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v14) = objc_msgSend(v14, "prepareForFeatureValue:error:", v16, a4);
        if (!(_DWORD)v14)
        {
LABEL_37:
          v24 = 0;
          goto LABEL_38;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      if (v11)
        continue;
      break;
    }
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[MLE5ExecutionStreamOperation statePorts](self, "statePorts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v39;
    while (2)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v39 != v18)
          objc_enumerationMutation(v10);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "featureValueForName:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[MLE5ExecutionStreamOperation _multiArrayFeatureFromStateFeature:](self, "_multiArrayFeatureFromStateFeature:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v20, "name");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v36;
            _os_log_error_impl(&dword_19C486000, v25, OS_LOG_TYPE_ERROR, "The input feature for %@ must be an MLState, but it was not.", buf, 0xCu);

          }
          if (a4)
          {
            v26 = (void *)MEMORY[0x1E0CB35C8];
            v48 = *MEMORY[0x1E0CB2D50];
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v20, "name");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("The input feature for %@ must be an MLState, but it was not."), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v29;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = 0;
            goto LABEL_34;
          }
          v23 = 0;
LABEL_36:

          goto LABEL_37;
        }
        if (!objc_msgSend(v20, "prepareForFeatureValue:error:", v23, a4))
          goto LABEL_36;
        if ((objc_msgSend(v20, "boundFeatureDirectly") & 1) == 0)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v20, "name");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v37;
            _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "The inference engine was unable to access the state buffer for feature named '%@'. Make sure the state buffer's MLMultiArray is instantiated with IOSurface-backed CVPixelBuffer.", buf, 0xCu);

          }
          if (a4)
          {
            v33 = (void *)MEMORY[0x1E0CB35C8];
            v46 = *MEMORY[0x1E0CB2D50];
            v34 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v20, "name");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringWithFormat:", CFSTR("The inference engine was unable to access the state buffer for feature named '%@'. Make sure the state buffer's MLMultiArray is instantiated with IOSurface-backed CVPixelBuffer."), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v29;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
            *a4 = v31;

          }
          goto LABEL_36;
        }

      }
      v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
      v24 = 1;
      if (v17)
        continue;
      break;
    }
  }
  else
  {
    v24 = 1;
  }
LABEL_38:

  return v24;
}

- (BOOL)_bindInputFeaturesAndWaitEvents:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  char v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[136];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Trying to bind features to input ports without first initializing ports.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Trying to bind features to input ports without first initializing ports."));
  }
  if (-[MLE5ExecutionStreamOperation _prepareInputPortsForFeatures:error:](self, "_prepareInputPortsForFeatures:error:", v8, a5))
  {
    objc_msgSend(v9, "waitSyncPoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, buf, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v13);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "boundFeatureDirectly", (_QWORD)v20) & 1) == 0)
          {
            v17 = 0;
            goto LABEL_17;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, buf, 16);
        if (v14)
          continue;
        break;
      }
    }
    v17 = 1;
LABEL_17:

    if (objc_msgSend(v12, "count"))
    {
      if ((v17 & 1) != 0)
        -[MLE5ExecutionStreamOperation _bindWaitEventsDirectly:](self, "_bindWaitEventsDirectly:", v12);
      else
        -[MLE5ExecutionStreamOperation _bindEventToWaitForCopyingInputFeatures:afterSyncPoints:](self, "_bindEventToWaitForCopyingInputFeatures:afterSyncPoints:", v8, v12);
    }
    else if ((v17 & 1) == 0
           && !-[MLE5ExecutionStreamOperation _copyInputFeatures:error:](self, "_copyInputFeatures:error:", v8, a5))
    {
      v18 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v18 = 1;
    goto LABEL_25;
  }
  v18 = 0;
LABEL_26:

  return v18;
}

- (void)_bindNewWaitEventsDirectlyWithWaitSyncPoints:(id)a3
{
  unint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t active;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t last_error_message;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id obj;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v3 = objc_msgSend(v35, "count");
  if (v3)
  {
    if (v3 >> 61)
      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
    v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v3);
    v6 = &v4[8 * v5];
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v39 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v35;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v7)
  {
    v38 = *(_QWORD *)v42;
    v8 = *MEMORY[0x1E0C99750];
    v9 = v4;
    do
    {
      v40 = v7;
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v42 != v38)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v11, "sharedEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "addObject:", v12);
        getIOSurfaceSharedEventFromMTLSharedEvent(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = e5rt_async_event_create_from_iosurface_shared_event();
        if ((_DWORD)v14)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 136315394;
            v46 = last_error_message;
            v47 = 1024;
            v48 = v14;
            _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Failed to create AsyncEvent from IOSurfaceSharedEvent E5RT: %s (%d)", buf, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("Failed to create AsyncEvent from IOSurfaceSharedEvent E5RT: %s (%d)"), e5rt_get_last_error_message(), v14);
        }
        objc_msgSend(v11, "value");
        active = e5rt_async_event_set_active_future_value();
        if ((_DWORD)active)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v26 = e5rt_get_last_error_message();
            *(_DWORD *)buf = 136315394;
            v46 = v26;
            v47 = 1024;
            v48 = active;
            _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "Failed to set activeFutureValue for AsyncEvent E5RT: %s (%d)", buf, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("Failed to set activeFutureValue for AsyncEvent E5RT: %s (%d)"), e5rt_get_last_error_message(), active);
        }
        if (v9 >= v6)
        {
          v18 = (v9 - v4) >> 3;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 61)
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          if ((v6 - v4) >> 2 > v19)
            v19 = (v6 - v4) >> 2;
          if ((unint64_t)(v6 - v4) >= 0x7FFFFFFFFFFFFFF8)
            v20 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
            v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v20);
          else
            v21 = 0;
          v22 = (char *)(v20 + 8 * v18);
          *(_QWORD *)v22 = 0;
          v23 = v22 + 8;
          while (v9 != v4)
          {
            v24 = *((_QWORD *)v9 - 1);
            v9 -= 8;
            *((_QWORD *)v22 - 1) = v24;
            v22 -= 8;
          }
          v6 = (char *)(v20 + 8 * v21);
          if (v4)
            operator delete(v4);
          v4 = v22;
          v9 = v23;
        }
        else
        {
          *(_QWORD *)v9 = 0;
          v9 += 8;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v7);
  }
  else
  {
    v9 = v4;
  }

  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  v27 = e5rt_execution_stream_operation_bind_dependent_events();
  if ((_DWORD)v27)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v34 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      v46 = v34;
      v47 = 1024;
      v48 = v27;
      _os_log_error_impl(&dword_19C486000, v28, OS_LOG_TYPE_ERROR, "Failed to bind dependent events to operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to bind dependent events to operation. E5RT: %s (%d)"), e5rt_get_last_error_message(), v27);
  }
  -[MLE5ExecutionStreamOperation setWaitSharedEventsBoundToESOP:](self, "setWaitSharedEventsBoundToESOP:", v39);
  if (v4 != v9)
  {
    v29 = *MEMORY[0x1E0C99750];
    v30 = v4;
    do
    {
      v31 = e5rt_async_event_release();
      if ((_DWORD)v31)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = e5rt_get_last_error_message();
          *(_DWORD *)buf = 136315394;
          v46 = v33;
          v47 = 1024;
          v48 = v31;
          _os_log_error_impl(&dword_19C486000, v32, OS_LOG_TYPE_ERROR, "Unexpected failure to release AsyncEvent E5RT: %s (%d)", buf, 0x12u);
        }

        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v29, CFSTR("Unexpected failure to release AsyncEvent E5RT: %s (%d)"), e5rt_get_last_error_message(), v31);
      }
      v30 += 8;
    }
    while (v30 != v9);
  }

  if (v4)
    operator delete(v4);

}

- (void)_updateWaitEventFutureValuesWithWaitSyncPoints:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t active;
  NSObject *v18;
  uint64_t last_error_message;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  _BYTE buf[12];
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v5 = v28;
  v4 = v29;
  if (objc_msgSend(v23, "count") != (v4 - v5) >> 3)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v21 = v28;
      v20 = v29;
      v22 = objc_msgSend(v23, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = (v20 - v21) >> 3;
      v32 = 2048;
      v33 = v22;
      _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "The number of existing dependent events (%tu) doesn't match the one of new events (%tu) while reusing E5 stream. This is a logic error.", buf, 0x16u);
    }

    v7 = (void *)MEMORY[0x1E0C99DA0];
    v9 = v28;
    v8 = v29;
    v10 = objc_msgSend(v23, "count");
    objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The number of existing dependent events (%tu) doesn't match the one of new events (%tu) while reusing E5 stream. This is a logic error."), (v8 - v9) >> 3, v10);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v23;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v25;
    v15 = *MEMORY[0x1E0C99750];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "value");
        active = e5rt_async_event_set_active_future_value();
        if ((_DWORD)active)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            last_error_message = e5rt_get_last_error_message();
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = last_error_message;
            v32 = 1024;
            LODWORD(v33) = active;
            _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Failed to set activeFutureValue for AsyncEvent E5RT: %s (%d)", buf, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v15, CFSTR("Failed to set activeFutureValue for AsyncEvent E5RT: %s (%d)"), e5rt_get_last_error_message(), active);
        }
        ++v13;
        ++v16;
      }
      while (v12 != v16);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v12);
  }

  *(_QWORD *)buf = &v28;
  std::vector<std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

}

- (void)_bindWaitEventsDirectly:(id)a3
{
  id v4;

  v4 = a3;
  if (-[MLE5ExecutionStreamOperation state](self, "state"))
    -[MLE5ExecutionStreamOperation _updateWaitEventFutureValuesWithWaitSyncPoints:](self, "_updateWaitEventFutureValuesWithWaitSyncPoints:", v4);
  else
    -[MLE5ExecutionStreamOperation _bindNewWaitEventsDirectlyWithWaitSyncPoints:](self, "_bindNewWaitEventsDirectlyWithWaitSyncPoints:", v4);

}

- (void)_bindEventToWaitForCopyingInputFeatures:(id)a3 afterSyncPoints:(id)a4
{
  uint64_t v6;
  uint64_t *p_cachedWaitEvent;
  e5rt_async_event *value;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t active_future_value;
  NSObject *v13;
  uint64_t active;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t last_error_message;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id obj;
  id v32;
  MLE5ExecutionStreamOperation *v33;
  _QWORD v34[5];
  id v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t v45[128];
  _BYTE buf[24];
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v30 = a4;
  v33 = self;
  value = self->_cachedWaitEvent.__ptr_.__value_;
  p_cachedWaitEvent = (uint64_t *)&self->_cachedWaitEvent;
  v6 = (uint64_t)value;
  v9 = (_QWORD *)MEMORY[0x1E0C99750];
  if (!value)
  {
    v44 = 0;
    v10 = e5rt_async_event_create();
    if ((_DWORD)v10)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = e5rt_get_last_error_message();
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Failed to create new AsyncEvent E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v9, CFSTR("Failed to create new AsyncEvent E5RT: %s (%d)"), e5rt_get_last_error_message(), v10);
    }
    *(_QWORD *)buf = 0;
    std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100](p_cachedWaitEvent, v44);
    std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100]((uint64_t *)buf, 0);
    v6 = *p_cachedWaitEvent;
  }
  v43 = 0;
  v44 = v6;
  active_future_value = e5rt_async_event_get_active_future_value();
  if ((_DWORD)active_future_value)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      last_error_message = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = last_error_message;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = active_future_value;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Failed to get current future value of async event. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v9, CFSTR("Failed to get current future value of async event. E5RT: %s (%d)"), e5rt_get_last_error_message(), active_future_value);
  }
  ++v43;
  active = e5rt_async_event_set_active_future_value();
  if ((_DWORD)active)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v28 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v28;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = active;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "Failed to set next future value of async event. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v9, CFSTR("Failed to set next future value of async event. E5RT: %s (%d)"), e5rt_get_last_error_message(), active);
  }
  if (!-[MLE5ExecutionStreamOperation state](v33, "state"))
  {
    -[MLE5ExecutionStreamOperation operationHandle](v33, "operationHandle");
    v16 = e5rt_execution_stream_operation_bind_dependent_events();
    if ((_DWORD)v16)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v29 = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v16;
        _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "Failed to bind cached dependent event to operation. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v9, CFSTR("Failed to bind cached dependent event to operation. E5RT: %s (%d)"), e5rt_get_last_error_message(), v16);
    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v47 = 0;
  v18 = objc_msgSend(v30, "count");
  -[MLE5ExecutionStreamOperation waitEventListener](v33, "waitEventListener");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v30;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v23, "sharedEvent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        getIOSurfaceSharedEventFromMTLSharedEvent(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v23, "value");
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __88__MLE5ExecutionStreamOperation__bindEventToWaitForCopyingInputFeatures_afterSyncPoints___block_invoke;
        v34[3] = &unk_1E3D66C70;
        v36 = buf;
        v37 = v18;
        v34[4] = v33;
        v35 = v32;
        v38 = v43;
        objc_msgSend(v25, "notifyListener:atValue:block:", v19, v26, v34);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v20);
  }

  _Block_object_dispose(buf, 8);
}

- (BOOL)_copyInputFeatures:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  id v18;
  _QWORD aBlock[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[MLE5ExecutionStreamOperation inputPorts](self, "inputPorts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v10, "boundFeatureDirectly") & 1) == 0)
        {
          v11 = -[MLE5ExecutionStreamOperation modelSignpostId](self, "modelSignpostId");
          kdebug_trace();
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __57__MLE5ExecutionStreamOperation__copyInputFeatures_error___block_invoke;
          aBlock[3] = &__block_descriptor_40_e5_v8__0l;
          aBlock[4] = v11;
          v12 = (void (**)(_QWORD))_Block_copy(aBlock);
          objc_msgSend(v10, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "featureValueForName:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = objc_msgSend(v10, "copyFeatureValue:error:", v14, a4);
          v12[2](v12);

          if (!v15)
          {
            v16 = 0;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_12:

  return v16;
}

- (BOOL)_bindOutputPortsWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Trying to bind features to output ports without first initializing ports.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Trying to bind features to output ports without first initializing ports."));
  }
  -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "prepareWithOptions:error:", v6, a4, (_QWORD)v16) & 1) == 0)
        {
          v14 = 0;
          v13 = v9;
          goto LABEL_15;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "completionSyncPoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5ExecutionStreamOperation _bindCompletionSyncPointDirectlyIfPossile:](self, "_bindCompletionSyncPointDirectlyIfPossile:", v13);
  v14 = 1;
LABEL_15:

  return v14;
}

- (void)_bindNewCompletionEventsDirectlyWithCompletionSyncPoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  uint64_t active;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sharedEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getIOSurfaceSharedEventFromMTLSharedEvent(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v7 = e5rt_async_event_create_from_iosurface_shared_event();
  v8 = (_QWORD *)MEMORY[0x1E0C99750];
  if ((_DWORD)v7)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      last_error_message = e5rt_get_last_error_message();
      v21 = 1024;
      v22 = v7;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Failed to create completion event from client shared event E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v8, CFSTR("Failed to create completion event from client shared event E5RT: %s (%d)"), e5rt_get_last_error_message(), v7);
  }
  v17 = v18;
  objc_msgSend(v4, "value");
  active = e5rt_async_event_set_active_future_value();
  if ((_DWORD)active)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      last_error_message = v15;
      v21 = 1024;
      v22 = active;
      _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Failed to set future value of completion event E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v8, CFSTR("Failed to set future value of completion event E5RT: %s (%d)"), e5rt_get_last_error_message(), active);
  }
  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  v12 = e5rt_execution_stream_operation_bind_completion_event();
  if ((_DWORD)v12)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      last_error_message = v16;
      v21 = 1024;
      v22 = v12;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "Failed to bind client completion event directly to E5RT E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v8, CFSTR("Failed to bind client completion event directly to E5RT E5RT: %s (%d)"), e5rt_get_last_error_message(), v12);
  }
  objc_msgSend(v4, "sharedEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5ExecutionStreamOperation setCompletionSharedEventBoundToESOP:](self, "setCompletionSharedEventBoundToESOP:", v14);

  std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100](&v17, 0);
}

- (void)_updateCompletionEventFutureValuesWithCompletionSyncPoint:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  uint64_t active;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  v12 = 0;
  v5 = e5rt_execution_stream_operation_retain_completion_event();
  v6 = (_QWORD *)MEMORY[0x1E0C99750];
  if ((_DWORD)v5)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      last_error_message = e5rt_get_last_error_message();
      v15 = 1024;
      v16 = v5;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Failed to retain a completion event bound to the E5 operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v6, CFSTR("Failed to retain a completion event bound to the E5 operation. E5RT: %s (%d)"), e5rt_get_last_error_message(), v5);
  }
  v11 = v12;
  objc_msgSend(v4, "value");
  active = e5rt_async_event_set_active_future_value();
  if ((_DWORD)active)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      last_error_message = v10;
      v15 = 1024;
      v16 = active;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Failed to set future value of completion event E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v6, CFSTR("Failed to set future value of completion event E5RT: %s (%d)"), e5rt_get_last_error_message(), active);
  }
  std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100](&v11, 0);

}

- (void)_bindCompletionSyncPointDirectlyIfPossile:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[MLE5ExecutionStreamOperation outputPorts](self, "outputPorts", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v10;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "outputBackingWasDirectlyBound") & 1) == 0)
          {

            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          continue;
        break;
      }
    }

    if (-[MLE5ExecutionStreamOperation state](self, "state"))
      -[MLE5ExecutionStreamOperation _updateCompletionEventFutureValuesWithCompletionSyncPoint:](self, "_updateCompletionEventFutureValuesWithCompletionSyncPoint:", v4);
    else
      -[MLE5ExecutionStreamOperation _bindNewCompletionEventsDirectlyWithCompletionSyncPoint:](self, "_bindNewCompletionEventsDirectlyWithCompletionSyncPoint:", v4);
  }
LABEL_13:

}

- (id)_inoutPortNames
{
  uint64_t num_inouts;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  uint64_t inout_names;
  NSObject *v8;
  void *v9;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  num_inouts = e5rt_execution_stream_operation_get_num_inouts();
  v4 = (_QWORD *)MEMORY[0x1E0C99750];
  if ((_DWORD)num_inouts)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      last_error_message = e5rt_get_last_error_message();
      v14 = 1024;
      v15 = num_inouts;
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "Failed to get the number of inout ports for operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("Failed to get the number of inout ports for operation. E5RT: %s (%d)"), e5rt_get_last_error_message(), num_inouts);
  }
  v6 = (void *)operator new[]();
  bzero(v6, 0);
  -[MLE5ExecutionStreamOperation operationHandle](self, "operationHandle");
  inout_names = e5rt_execution_stream_operation_get_inout_names();
  if ((_DWORD)inout_names)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = e5rt_get_last_error_message();
      *(_DWORD *)buf = 136315394;
      last_error_message = v11;
      v14 = 1024;
      v15 = inout_names;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "Failed to get inout port names for operation. E5RT: %s (%d)", buf, 0x12u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v4, CFSTR("Failed to get inout port names for operation. E5RT: %s (%d)"), e5rt_get_last_error_message(), inout_names);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  MEMORY[0x1A1AD6248](v6, 0x50C80EE9192B6);
  return v9;
}

- (id)_multiArrayFeatureFromStateFeature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "internalStateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "backings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") != 1)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
      }

    }
    objc_msgSend(v6, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
      }

    }
    +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)debugLabel
{
  return self->_debugLabel;
}

- (NSError)asyncSubmissionError
{
  return self->_asyncSubmissionError;
}

- (void)setAsyncSubmissionError:(id)a3
{
  objc_storeStrong((id *)&self->_asyncSubmissionError, a3);
}

- (NSString)shapeHash
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setShapeHash:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (NSArray)statePorts
{
  return self->_statePorts;
}

- (void)setStatePorts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (IOSurfaceSharedEventListener)waitEventListener
{
  return self->_waitEventListener;
}

- (unint64_t)modelSignpostId
{
  return self->_modelSignpostId;
}

- (NSArray)waitSharedEventsBoundToESOP
{
  return self->_waitSharedEventsBoundToESOP;
}

- (void)setWaitSharedEventsBoundToESOP:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (MTLSharedEvent)completionSharedEventBoundToESOP
{
  return self->_completionSharedEventBoundToESOP;
}

- (void)setCompletionSharedEventBoundToESOP:(id)a3
{
  objc_storeStrong((id *)&self->_completionSharedEventBoundToESOP, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSharedEventBoundToESOP, 0);
  objc_storeStrong((id *)&self->_waitSharedEventsBoundToESOP, 0);
  objc_storeStrong((id *)&self->_waitEventListener, 0);
  objc_storeStrong((id *)&self->_outputPorts, 0);
  objc_storeStrong((id *)&self->_statePorts, 0);
  objc_storeStrong((id *)&self->_inputPorts, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_programLibrary, 0);
  objc_storeStrong((id *)&self->_shapeHash, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_asyncSubmissionError, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
  std::unique_ptr<e5rt_async_event,MLE5ObjectDeleter<e5rt_async_event>>::reset[abi:ne180100]((uint64_t *)&self->_cachedWaitEvent, 0);
}

uint64_t __57__MLE5ExecutionStreamOperation__copyInputFeatures_error___block_invoke()
{
  return kdebug_trace();
}

uint64_t __88__MLE5ExecutionStreamOperation__bindEventToWaitForCopyingInputFeatures_afterSyncPoints___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t last_error_message;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  v2 = *(_QWORD *)(v1 + 24) + 1;
  *(_QWORD *)(v1 + 24) = v2;
  if (v2 == *(_QWORD *)(result + 56))
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 32), "asyncSubmissionError");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = *(void **)(v3 + 32);
      v6 = *(_QWORD *)(v3 + 40);
      v12 = 0;
      v7 = objc_msgSend(v5, "_copyInputFeatures:error:", v6, &v12);
      v8 = v12;
      if ((v7 & 1) == 0)
        objc_msgSend(*(id *)(v3 + 32), "setAsyncSubmissionError:", v8);

    }
    result = e5rt_async_event_signal();
    v9 = result;
    if ((_DWORD)result)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        v14 = last_error_message;
        v15 = 1024;
        v16 = v9;
        _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Failed to signal next future value of async event. E5RT: %s (%d)", buf, 0x12u);
      }

      return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to signal next future value of async event. E5RT: %s (%d)"), e5rt_get_last_error_message(), v9);
    }
  }
  return result;
}

uint64_t __46__MLE5ExecutionStreamOperation_outputFeatures__block_invoke()
{
  return kdebug_trace();
}

@end
