@implementation CMITiledInferenceProcessorInstanceExecutor

- (CMITiledInferenceProcessorInstanceExecutor)initWithIndex:(unint64_t)a3 inferenceDevice:(id)a4 commandQueue:(id)a5 config:(id)a6 tileCount:
{
  double v6;
  double v7;
  id v13;
  id v14;
  id v15;
  CMITiledInferenceProcessorInstanceExecutor *v16;
  CMITiledInferenceProcessorInstanceExecutor *v17;
  CMITiledInferenceProcessorInstanceExecutor *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *inferenceStream;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  NSObject *v40;
  void *v41;
  int v42;
  NSObject *v43;
  int v44;
  NSObject *v45;
  unsigned int v46;
  unsigned int v47;
  CMITiledInferenceProcessorInstanceExecutor *v48;
  id v50;
  id v51;
  void *v52;
  id v53;
  id obj;
  CMITiledInferenceProcessorInstanceExecutor *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  os_log_type_t type;
  unsigned int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  int v68;
  const char *v69;
  __int16 v70;
  int v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v7 = v6;
  v74 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v67.receiver = self;
  v67.super_class = (Class)CMITiledInferenceProcessorInstanceExecutor;
  v16 = -[CMITiledInferenceProcessorInstanceExecutor init](&v67, sel_init);
  v17 = v16;
  v18 = v16;
  if (v16)
  {
    v50 = v13;
    v51 = v15;
    v53 = v14;
    v16->_instanceIndex = a3;
    objc_storeStrong((id *)&v16->_inferenceDevice, a4);
    objc_storeStrong((id *)&v17->_commandQueue, a5);
    objc_storeStrong((id *)&v17->_config, a6);
    v17->_active = 0;
    v52 = (void *)objc_opt_new();
    v19 = (void *)MEMORY[0x1E0C99DE8];
    -[CMITiledInferenceProcessorConfig pipeline](v17->_config, "pipeline");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v55 = v17;
    -[CMITiledInferenceProcessorConfig pipeline](v17->_config, "pipeline");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v64;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v64 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          inferenceStream = (void *)objc_opt_new();
          objc_msgSend(v26, "networkConfig");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "network");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
          {
            v62 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v40 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
            v17 = v55;
            v13 = v50;
            v15 = v51;
            v34 = obj;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_28:

            v18 = 0;
            goto LABEL_29;
          }
          objc_msgSend(v29, "getInstanceWithIndex:", a3);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (!v30)
          {
            v62 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v43 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
            v13 = v50;
            v15 = v51;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            v18 = 0;
            v34 = obj;
            v17 = v55;
            goto LABEL_29;
          }
          objc_msgSend(v30, "inputTextures");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(inferenceStream, "setInputs:", v32);

          objc_msgSend(v31, "outputTextures");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(inferenceStream, "setOutputs:", v33);

          objc_msgSend(inferenceStream, "setNetworkIndex:", v23 + i);
          objc_msgSend(v56, "addObject:", inferenceStream);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
        v23 += i;
        if (v22)
          continue;
        break;
      }
    }

    objc_msgSend(v52, "setNetworks:", v56);
    objc_msgSend(v52, "setCommandQueue:", v53);
    v17 = v55;
    objc_msgSend(v52, "setBufferCount:", -[CMITiledInferenceProcessorConfig bufferCount](v55->_config, "bufferCount"));
    objc_msgSend(v52, "setBufferIndex:", v55->_instanceIndex);
    objc_msgSend(v52, "setTileCount:", v7);
    objc_storeStrong((id *)&v55->_tileInfo, v52);
    -[CMIInferenceDevice createExecutionStream](v55->_inferenceDevice, "createExecutionStream");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[CMITiledInferenceProcessorConfig pipeline](v55->_config, "pipeline");
    inferenceStream = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(inferenceStream, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    v15 = v51;
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v58;
      while (2)
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v58 != v37)
            objc_enumerationMutation(inferenceStream);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "networkConfig");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "network");
          v40 = objc_claimAutoreleasedReturnValue();

          -[NSObject getInstanceWithIndex:](v40, "getInstanceWithIndex:", v17->_instanceIndex);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v34, "enqueueNetworkInstance:", v41);
          if (v42)
          {
            v44 = v42;
            v62 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = v62;
            if (os_log_type_enabled(v45, type))
              v47 = v46;
            else
              v47 = v46 & 0xFFFFFFFE;
            if (v47)
            {
              v68 = 136315394;
              v69 = "-[CMITiledInferenceProcessorInstanceExecutor initWithIndex:inferenceDevice:commandQueue:config:tileCount:]";
              v70 = 1024;
              v71 = v44;
              _os_log_send_and_compose_impl();
            }
            v13 = v50;
            v17 = v55;
            fig_log_call_emit_and_clean_up_after_send_and_compose();

            goto LABEL_28;
          }

          v17 = v55;
        }
        v36 = objc_msgSend(inferenceStream, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
        if (v36)
          continue;
        break;
      }
    }

    v34 = v34;
    inferenceStream = v17->_inferenceStream;
    v17->_inferenceStream = (CMIInferenceExecutionStream *)v34;
    v18 = v17;
    v13 = v50;
LABEL_29:

    v14 = v53;
  }
  v48 = v18;

  return v48;
}

- (BOOL)isActive
{
  return self->_active;
}

- (int)startTileWithIndex:(id)a3 completionHandler:
{
  double v3;
  double v4;
  id v6;
  CMIInferenceNetworkInstance *networkInstanceToWaitOn;
  void *v8;
  id completionHandler;
  int v10;
  NSObject *v12;

  v4 = v3;
  v6 = a3;
  if (self->_active)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v12 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = -1;
  }
  else
  {
    self->_active = 1;
    -[CMITiledInferenceProcessorTileInfoImpl setTileIndex:](self->_tileInfo, "setTileIndex:", v4);
    self->_stageIndex = 0;
    self->_preStep = 1;
    networkInstanceToWaitOn = self->_networkInstanceToWaitOn;
    self->_networkInstanceToWaitOn = 0;

    v8 = (void *)MEMORY[0x1D824D3C0](v6);
    completionHandler = self->_completionHandler;
    self->_completionHandler = v8;

    v10 = 0;
  }

  return v10;
}

- (int)scheduleWorkWithCommandBuffer:(id *)a3
{
  CMITiledInferenceProcessorTileInfoImpl *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t stageIndex;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  CMIInferenceExecutionStream *inferenceStream;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;

  v5 = self->_tileInfo;
  if (!a3)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v33 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v22 = -1;
    goto LABEL_28;
  }
  v6 = *a3;
  if (!self->_preStep)
  {
    -[CMITiledInferenceProcessorConfig pipeline](self->_config, "pipeline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", self->_stageIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasConnectingPostToPreMetalStage");

    if (v9)
    {
      if (self->_networkInstanceToWaitOn)
      {
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v37 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        v14 = 0;
        v12 = 0;
        goto LABEL_44;
      }
      ++self->_stageIndex;
      self->_preStep = 1;
    }
  }
  stageIndex = self->_stageIndex;
  -[CMITiledInferenceProcessorConfig pipeline](self->_config, "pipeline");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", stageIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "networkConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "network");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_preStep)
  {
    if (v6)
    {
      if (!objc_msgSend(v6, "status"))
      {
        -[CMITiledInferenceProcessorTileInfoImpl networks](v5, "networks");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", stageIndex);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMITiledInferenceProcessorTileInfoImpl setNextNetwork:](v5, "setNextNetwork:", v16);

        if (stageIndex)
        {
          -[CMITiledInferenceProcessorTileInfoImpl networks](v5, "networks");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", stageIndex - 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMITiledInferenceProcessorTileInfoImpl setPreviousNetwork:](v5, "setPreviousNetwork:", v18);

        }
        else
        {
          -[CMITiledInferenceProcessorTileInfoImpl setPreviousNetwork:](v5, "setPreviousNetwork:", 0);
        }
        -[CMITiledInferenceProcessorTileInfoImpl setCommandBuffer:](v5, "setCommandBuffer:", v6);
        -[CMITiledInferenceProcessorTileInfoImpl setLastCommandBuffer:](v5, "setLastCommandBuffer:", 0);
        objc_msgSend(v12, "preInferenceStage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v26, "processTilePipelineStage:", v5);

        if (!v22)
        {
          -[CMITiledInferenceProcessorTileInfoImpl lastCommandBuffer](v5, "lastCommandBuffer");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            -[CMITiledInferenceProcessorTileInfoImpl lastCommandBuffer](v5, "lastCommandBuffer");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            -[CMITiledInferenceProcessorTileInfoImpl setLastCommandBuffer:](v5, "setLastCommandBuffer:", 0);
            if (objc_msgSend(v28, "status"))
            {
              -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
              v6 = (id)objc_claimAutoreleasedReturnValue();

              if (!v6)
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                v22 = FigSignalErrorAt();
                goto LABEL_27;
              }
            }
            else
            {
              v6 = v28;
            }
            objc_msgSend(v14, "getInstanceWithIndex:", self->_instanceIndex);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v29, "synchronizeNetworkWaitOnMetalSignal:", v6);
            if (v22)
            {
              fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v35 = objc_claimAutoreleasedReturnValue();
              os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();

            }
            else
            {
              objc_storeStrong((id *)&self->_networkInstanceToWaitOn, v29);
              self->_preStep = 0;
            }

            goto LABEL_27;
          }
          goto LABEL_43;
        }
LABEL_45:
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v39 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_27;
      }
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v34 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_44:
      v22 = -1;
      goto LABEL_27;
    }
LABEL_38:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v36 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v6 = 0;
    goto LABEL_44;
  }
  -[CMITiledInferenceProcessorTileInfoImpl setNextNetwork:](v5, "setNextNetwork:", 0);
  -[CMITiledInferenceProcessorTileInfoImpl networks](v5, "networks");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", stageIndex);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMITiledInferenceProcessorTileInfoImpl setPreviousNetwork:](v5, "setPreviousNetwork:", v20);

  if (!v6)
    goto LABEL_38;
  if (objc_msgSend(v6, "status"))
    goto LABEL_43;
  -[CMITiledInferenceProcessorTileInfoImpl setCommandBuffer:](v5, "setCommandBuffer:", v6);
  -[CMITiledInferenceProcessorTileInfoImpl setLastCommandBuffer:](v5, "setLastCommandBuffer:", 0);
  objc_msgSend(v12, "postInferenceStage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "processTilePipelineStage:", v5);

  if (v22)
    goto LABEL_45;
  -[CMITiledInferenceProcessorTileInfoImpl lastCommandBuffer](v5, "lastCommandBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_43:
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v38 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_44;
  }
  -[CMITiledInferenceProcessorTileInfoImpl setLastCommandBuffer:](v5, "setLastCommandBuffer:", 0);
  -[CMITiledInferenceProcessorConfig pipeline](self->_config, "pipeline");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 == v25)
  {
    inferenceStream = self->_inferenceStream;
    if (inferenceStream)
    {
      v22 = -[CMIInferenceExecutionStream submitAsyncWithCompletionHandler:](inferenceStream, "submitAsyncWithCompletionHandler:", self->_completionHandler);
      if (!v22)
      {
        -[CMITiledInferenceProcessorTileInfoImpl resetTileSpecificInfo](v5, "resetTileSpecificInfo");
        self->_active = 0;
        goto LABEL_27;
      }
      goto LABEL_45;
    }
    goto LABEL_43;
  }
  v22 = 0;
LABEL_27:
  v30 = objc_retainAutorelease(v6);
  *a3 = v30;

LABEL_28:
  return v22;
}

- (int)scheduleWaitsWithCommandBuffer:(id)a3
{
  id v4;
  CMIInferenceNetworkInstance *networkInstanceToWaitOn;
  int v6;
  CMIInferenceNetworkInstance *v7;
  NSObject *v9;
  NSObject *v10;

  v4 = a3;
  if (self->_active)
  {
    networkInstanceToWaitOn = self->_networkInstanceToWaitOn;
    if (networkInstanceToWaitOn)
    {
      v6 = -[CMIInferenceNetworkInstance synchronizeMetalWaitOnNetworkSignal:](networkInstanceToWaitOn, "synchronizeMetalWaitOnNetworkSignal:", v4);
      if (v6)
      {
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v10 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

      }
      else
      {
        v7 = self->_networkInstanceToWaitOn;
        self->_networkInstanceToWaitOn = 0;

      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v6 = -1;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkInstanceToWaitOn, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_inferenceStream, 0);
  objc_storeStrong((id *)&self->_tileInfo, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_inferenceDevice, 0);
}

@end
