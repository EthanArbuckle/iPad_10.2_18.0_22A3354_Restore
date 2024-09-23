@implementation VCPCNNModelEspressoV2

- (VCPCNNModelEspressoV2)initWithParameters:(id)a3 outputNames:(id)a4 inputNames:(id)a5 functionName:(id)a6
{
  id v11;
  id v12;
  VCPCNNModelEspressoV2 *v13;
  VCPCNNModelEspressoV2 *v14;
  VCPCNNModelEspressoV2 *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *inputIOArray;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  VCPEspressoV2IOPort *v27;
  uint64_t v28;
  NSMutableArray *outputIOArray;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *outputsSize;
  VCPCNNModelEspressoV2 *v36;
  uint64_t last_error_message;
  id v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  objc_super v52;
  uint8_t *v53;
  uint8_t buf[16];
  id *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v42 = a4;
  v11 = a5;
  v12 = a6;
  v52.receiver = self;
  v52.super_class = (Class)VCPCNNModelEspressoV2;
  v13 = -[VCPCNNModelEspressoV2 init](&v52, sel_init);
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    v39 = v12;
    objc_storeStrong((id *)&v13->_netFileUrl, a3);
    objc_storeStrong((id *)&v14->_inputNames, a5);
    objc_storeStrong((id *)&v14->_outputNames, a4);
    objc_storeStrong((id *)&v14->_functionName, a6);
    v51 = 0;
    v16 = (void *)MEMORY[0x1E0C99E98];
    -[NSURL path](v14->_netFileUrl, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("bundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLWithString:", v18);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = -[VCPCNNModelEspressoV2 createPrecompiledOp:isPrecompiled:functionName:](v14, "createPrecompiledOp:isPrecompiled:functionName:", v40, 1, v14->_functionName);
    v51 = v19;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    inputIOArray = v14->_inputIOArray;
    v14->_inputIOArray = (NSMutableArray *)v20;

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v22 = v11;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v48;
LABEL_4:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v24)
          objc_enumerationMutation(v22);
        v26 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v25);
        v27 = objc_alloc_init(VCPEspressoV2IOPort);
        if (-[VCPEspressoV2IOPort retainAndBindToPort:name:isInput:](v27, "retainAndBindToPort:name:isInput:", v19, v26, 1))
        {
          goto LABEL_22;
        }
        -[NSMutableArray addObject:](v14->_inputIOArray, "addObject:", v27);

        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v23)
            goto LABEL_4;
          break;
        }
      }
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    outputIOArray = v14->_outputIOArray;
    v14->_outputIOArray = (NSMutableArray *)v28;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v22 = v42;
    v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v44;
LABEL_12:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(v22);
        v33 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v32);
        v27 = objc_alloc_init(VCPEspressoV2IOPort);
        if (-[VCPEspressoV2IOPort retainAndBindToPort:name:isInput:](v27, "retainAndBindToPort:name:isInput:", v19, v33, 0))
        {
          break;
        }
        -[NSMutableArray addObject:](v14->_outputIOArray, "addObject:", v27);

        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
          if (v30)
            goto LABEL_12;
          goto LABEL_18;
        }
      }
LABEL_22:

LABEL_23:
      v15 = 0;
LABEL_24:
      v12 = v39;
      goto LABEL_25;
    }
LABEL_18:

    std::vector<VCPEspressoV2Data * {__strong}>::vector(buf, objc_msgSend(v22, "count"));
    std::vector<VCPEspressoV2Data * {__strong}>::__vdeallocate((void **)&v14->_outputs.__begin_);
    *(_OWORD *)&v14->_outputs.__begin_ = *(_OWORD *)buf;
    v14->_outputs.var1.__value_ = v55;
    v55 = 0;
    v53 = buf;
    memset(buf, 0, sizeof(buf));
    std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v53);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
    v34 = objc_claimAutoreleasedReturnValue();
    outputsSize = v14->_outputsSize;
    v14->_outputsSize = (NSMutableArray *)v34;

    if (e5rt_execution_stream_create())
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_34;
    }
    else if (e5rt_execution_stream_encode_operation())
    {
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_34;
    }
    else
    {
      if (!e5rt_execution_stream_operation_release())
      {

        v15 = v14;
        goto LABEL_24;
      }
      if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_34;
    }
    last_error_message = e5rt_get_last_error_message();
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = last_error_message;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "E5RT op failed: %s", buf, 0xCu);
LABEL_34:

    goto LABEL_23;
  }
LABEL_25:
  v36 = v15;

  return v36;
}

- (e5rt_execution_stream_operation)createPrecompiledOp:(id)a3 isPrecompiled:(BOOL)a4 functionName:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  const char *v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  uint64_t last_error_message;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (v6)
  {
    objc_msgSend(v7, "path");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");
    v10 = e5rt_program_library_create() == 0;

    if (v10)
    {
      if (e5rt_program_library_release())
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_69;
      }
      else
      {
        objc_msgSend(v7, "path");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v11, "UTF8String");
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        v12 = e5rt_execution_stream_operation_create_precompiled_compute_operation() == 0;

        if (!v12 && (int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_69;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_69:
      *(_DWORD *)buf = 136315138;
      last_error_message = e5rt_get_last_error_message();
      v14 = MEMORY[0x1E0C81028];
      v15 = "E5RT op failed: %s";
      goto LABEL_70;
    }
  }
  else if (e5rt_e5_compiler_create())
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_69;
  }
  else if (e5rt_e5_compiler_options_create())
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_69;
  }
  else if (e5rt_e5_compiler_options_get_compute_device_types_mask())
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_69;
  }
  else
  {
    v13 = objc_retainAutorelease(v8);
    objc_msgSend(v13, "UTF8String");
    if (e5rt_e5_compiler_options_set_mil_entry_points())
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        last_error_message = e5rt_get_last_error_message();
        v14 = MEMORY[0x1E0C81028];
        v15 = "E5RT op failed %s";
LABEL_70:
        _os_log_impl(&dword_1B6C4A000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
      }
    }
    else if (e5rt_e5_compiler_options_retain_mil_entry_points())
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_69;
    }
    else
    {
      objc_msgSend(v7, "path");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v16, "UTF8String");
      v17 = e5rt_e5_compiler_compile() == 0;

      if (v17)
      {
        objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
        if (e5rt_program_library_retain_program_function())
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_69;
        }
        else if (e5rt_precompiled_compute_op_create_options_create_with_program_function())
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_69;
        }
        else if (e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options())
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_69;
        }
        else if (e5rt_e5_compiler_release())
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_69;
        }
        else if (e5rt_e5_compiler_options_release())
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_69;
        }
        else if (e5rt_program_function_release())
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_69;
        }
        else if (e5rt_precompiled_compute_op_create_options_release())
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_69;
        }
        else if (e5rt_program_library_release()
               && (int)MediaAnalysisLogLevel() >= 3
               && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          goto LABEL_69;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        goto LABEL_69;
      }
    }
  }
  free(0);

  return 0;
}

- (int)espressoForward:(void *)a3
{
  void *v5;
  int v6;
  int v8;
  uint64_t last_error_message;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_inputIOArray, "count") != 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Use espressoForwardInputs for multiple inputs!", (uint8_t *)&v8, 2u);
    }
    return -50;
  }
  -[NSMutableArray objectAtIndexedSubscript:](self->_inputIOArray, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prepareInput:", a3);

  if (v6)
    return v6;
  if (e5rt_execution_stream_execute_sync())
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      last_error_message = e5rt_get_last_error_message();
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "E5RT op failed: %s", (uint8_t *)&v8, 0xCu);
    }
    return -18;
  }
  return -[VCPCNNModelEspressoV2 getOutputs](self, "getOutputs");
}

- (int)espressoForwardInputs:(vector<void *)
{
  uint64_t v5;
  void *v6;
  int v7;
  int v9;
  uint64_t last_error_message;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_inputIOArray, "count"))
  {
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_inputIOArray, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "prepareInput:", a3->var0[v5]);

      if (v7)
        return v7;
    }
    while (-[NSMutableArray count](self->_inputIOArray, "count") > (unint64_t)++v5);
  }
  if (e5rt_execution_stream_execute_sync())
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      last_error_message = e5rt_get_last_error_message();
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "E5RT op failed: %s", (uint8_t *)&v9, 0xCu);
    }
    return -18;
  }
  return -[VCPCNNModelEspressoV2 getOutputs](self, "getOutputs");
}

- (int)getOutputs
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  VCPEspressoV2Data *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __end_ **begin;
  __end_ *v12;
  void *v13;
  uint64_t v15;

  v3 = -[NSMutableArray count](self->_outputIOArray, "count");
  if (v3)
  {
    v4 = 0;
    while (1)
    {
      v15 = 0;
      -[NSMutableArray objectAtIndexedSubscript:](self->_outputIOArray, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "getOutput:", &v15);

      if (!v6)
        break;
      v7 = [VCPEspressoV2Data alloc];
      -[NSMutableArray objectAtIndexedSubscript:](self->_outputIOArray, "objectAtIndexedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "tensorType");
      v10 = -[VCPEspressoV2Data initWithTensorType:size:dataPtr:](v7, "initWithTensorType:size:dataPtr:", v9, v6, v15);
      begin = self->_outputs.__begin_;
      v12 = begin[v4];
      begin[v4] = (__end_ *)v10;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray setObject:atIndexedSubscript:](self->_outputsSize, "setObject:atIndexedSubscript:", v13, v4);

      if (-[NSMutableArray count](self->_outputIOArray, "count") <= (unint64_t)++v4)
      {
        LODWORD(v3) = 0;
        return v3;
      }
    }
    LODWORD(v3) = -18;
  }
  return v3;
}

- (id)outputsSize
{
  return self->_outputsSize;
}

- (id)inputsSize
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_inputIOArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "getTensorShape", (_QWORD)v10));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)outputsType
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_outputIOArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "tensorType", (_QWORD)v10));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)inputsType
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_inputIOArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "tensorType", (_QWORD)v10));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  e5rt_execution_stream_release();
  v3.receiver = self;
  v3.super_class = (Class)VCPCNNModelEspressoV2;
  -[VCPCNNModelEspressoV2 dealloc](&v3, sel_dealloc);
}

- (vector<VCPEspressoV2Data)outputs
{
  retstr->__begin_ = 0;
  retstr->var0 = 0;
  retstr->var1.__value_ = 0;
  return (vector<VCPEspressoV2Data *, std::allocator<VCPEspressoV2Data *>> *)std::vector<VCPEspressoV2Data * {__strong}>::__init_with_size[abi:ne180100]<VCPEspressoV2Data * {__strong}*,VCPEspressoV2Data * {__strong}*>((char *)retstr, (void **)self->_outputs.__begin_, (void **)self->_outputs.var0, self->_outputs.var0- self->_outputs.__begin_);
}

- (void).cxx_destruct
{
  vector<VCPEspressoV2Data *, std::allocator<VCPEspressoV2Data *>> *p_outputs;

  p_outputs = &self->_outputs;
  std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_outputs);
  objc_storeStrong((id *)&self->_outputIOArray, 0);
  objc_storeStrong((id *)&self->_inputIOArray, 0);
  objc_storeStrong((id *)&self->_outputsSize, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_netFileUrl, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

@end
