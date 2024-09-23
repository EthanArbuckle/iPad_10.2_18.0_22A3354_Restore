@implementation CMITiledInferenceProcessor

- (int)loadWithConfig:(id)a3
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CMITiledInferenceProcessor *v18;
  CMIInferenceDevice *inferenceDevice;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  unsigned int v27;
  unsigned int v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  unsigned int v35;
  unsigned int v36;
  NSObject *v38;
  NSObject *v39;
  unsigned int v40;
  unsigned int v41;
  id v42;
  id v43;
  void *v44;
  id obj;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  os_log_type_t type;
  unsigned int v52;
  int v53;
  const char *v54;
  __int16 v55;
  uint64_t v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D824D210]();
  if (!self->_inferenceDevice
    && (v7 = -[CMITiledInferenceProcessor _createInferenceDeviceWithConfig:](self, "_createInferenceDeviceWithConfig:", v5)) != 0)
  {
    v24 = v7;
    v52 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v38 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  else
  {
    v42 = a3;
    v43 = v5;
    v44 = v6;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v5, "pipeline");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v46 = *(_QWORD *)v48;
LABEL_5:
      v11 = 0;
      v12 = v10;
      while (1)
      {
        if (*(_QWORD *)v48 != v46)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v11);
        objc_msgSend(v13, "setHasConnectingPostToPreMetalStage:", 0);
        if (v12)
        {
          objc_msgSend(v12, "postInferenceStage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "preInferenceStage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 == v15)
            objc_msgSend(v12, "setHasConnectingPostToPreMetalStage:", 1);
        }
        objc_msgSend(v13, "networkConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          break;
        v17 = v16;
        v18 = self;
        inferenceDevice = self->_inferenceDevice;
        objc_msgSend(v16, "networkPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CMIInferenceDevice loadNetworkWithPath:](inferenceDevice, "loadNetworkWithPath:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v52 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v52;
          if (os_log_type_enabled(v29, type))
            v31 = v30;
          else
            v31 = v30 & 0xFFFFFFFE;
          v5 = v43;
          v6 = v44;
          if (v31)
          {
            objc_msgSend(v17, "networkPath");
            v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v33 = objc_msgSend(v32, "UTF8String");
            v53 = 136315394;
            v54 = "-[CMITiledInferenceProcessor loadWithConfig:]";
            v55 = 2080;
            v56 = v33;
            _os_log_send_and_compose_impl();

          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          v24 = -1;
LABEL_40:

LABEL_41:
          goto LABEL_42;
        }
        objc_msgSend(v17, "setNetwork:", v21);
        objc_msgSend(v17, "networkInputNames");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "networkOutputNames");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v21, "bindIOPortsWithInputNames:withOutputNames:", v22, v23);

        if (v24)
        {
          v52 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = v52;
          if (os_log_type_enabled(v34, type))
            v36 = v35;
          else
            v36 = v35 & 0xFFFFFFFE;
          if (v36)
          {
            v53 = 136315394;
            v54 = "-[CMITiledInferenceProcessor loadWithConfig:]";
            v55 = 1024;
            LODWORD(v56) = v24;
            _os_log_send_and_compose_impl();
          }
          v5 = v43;
          v6 = v44;
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          goto LABEL_40;
        }
        v10 = v13;

        ++v11;
        v12 = v10;
        self = v18;
        if (v9 == v11)
        {
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v9)
            goto LABEL_5;
          goto LABEL_18;
        }
      }
      v52 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v52;
      if (os_log_type_enabled(v26, type))
        v28 = v27;
      else
        v28 = v27 & 0xFFFFFFFE;
      if (v28)
      {
        v53 = 136315138;
        v54 = "-[CMITiledInferenceProcessor loadWithConfig:]";
        _os_log_send_and_compose_impl();
      }
      v5 = v43;
      v6 = v44;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v24 = -1;
      goto LABEL_41;
    }
    v10 = 0;
LABEL_18:

    if (-[CMITiledInferenceProcessorConfig allocateIOBuffersAtLoad](self->_config, "allocateIOBuffersAtLoad")
      && (v25 = -[CMITiledInferenceProcessor allocateIOBuffers](self, "allocateIOBuffers")) != 0)
    {
      v24 = v25;
      v52 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = v52;
      if (os_log_type_enabled(v39, type))
        v41 = v40;
      else
        v41 = v40 & 0xFFFFFFFE;
      if (v41)
      {
        v53 = 136315394;
        v54 = "-[CMITiledInferenceProcessor loadWithConfig:]";
        v55 = 1024;
        LODWORD(v56) = v24;
        _os_log_send_and_compose_impl();
      }
      v5 = v43;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v12 = v10;
    }
    else
    {
      objc_storeStrong((id *)&self->_config, v42);
      v24 = 0;
      v12 = v10;
      v5 = v43;
    }
    v6 = v44;
LABEL_42:

  }
  objc_autoreleasePoolPop(v6);

  return v24;
}

- (CMITiledInferenceProcessor)initWithMetalContext:(id)a3
{
  id v4;
  CMITiledInferenceProcessor *v5;
  uint64_t v6;
  MTLDevice *device;
  uint64_t v8;
  MTLCommandQueue *commandQueue;
  CMITiledInferenceProcessor *v10;
  NSObject *v11;
  CMITiledInferenceProcessor *v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMITiledInferenceProcessor;
  v5 = -[CMITiledInferenceProcessor init](&v14, sel_init);
  if (!v5)
    goto LABEL_5;
  if (!v4)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "device");
  v6 = objc_claimAutoreleasedReturnValue();
  device = v5->_device;
  v5->_device = (MTLDevice *)v6;

  objc_msgSend(v4, "commandQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  commandQueue = v5->_commandQueue;
  v5->_commandQueue = (MTLCommandQueue *)v8;

  v10 = v5;
LABEL_6:
  v12 = v10;

  return v12;
}

- (CMITiledInferenceProcessor)initWithCommandQueue:(id)a3
{
  id v5;
  CMITiledInferenceProcessor *v6;
  uint64_t v7;
  MTLDevice *device;
  CMITiledInferenceProcessor *v9;
  NSObject *v10;
  CMITiledInferenceProcessor *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CMITiledInferenceProcessor;
  v6 = -[CMITiledInferenceProcessor init](&v13, sel_init);
  if (!v6)
    goto LABEL_5;
  if (!v5)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v10 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v5, "device");
  v7 = objc_claimAutoreleasedReturnValue();
  device = v6->_device;
  v6->_device = (MTLDevice *)v7;

  objc_storeStrong((id *)&v6->_commandQueue, a3);
  v9 = v6;
LABEL_6:
  v11 = v9;

  return v11;
}

- (int)_createInferenceDeviceWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  CMIInferenceDevice *v18;
  CMIInferenceDevice *inferenceDevice;
  unsigned int v20;
  unsigned int v21;
  CMIInferenceDevice *v22;
  CMIInferenceDevice *v23;
  int v24;
  NSObject *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  unsigned int v35;
  unsigned int v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  os_log_type_t type;
  unsigned int v44;
  int v45;
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_inferenceDevice)
  {
    v44 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v10 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    goto LABEL_34;
  }
  objc_msgSend(v4, "pipeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "networkConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEspressoV2Path");

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v5, "pipeline");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v15, "networkConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEspressoV2Path");

        if (v9 != v17)
        {
          v44 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v44;
          if (os_log_type_enabled(v25, type))
            v27 = v26;
          else
            v27 = v26 & 0xFFFFFFFE;
          if (v27)
          {
            objc_msgSend(v15, "networkConfig");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "networkPath");
            v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v28 = objc_msgSend(v37, "UTF8String");
            objc_msgSend(v5, "pipeline");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "firstObject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "networkConfig");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "networkPath");
            v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v33 = objc_msgSend(v32, "UTF8String");
            v45 = 136315650;
            v46 = "-[CMITiledInferenceProcessor _createInferenceDeviceWithConfig:]";
            v47 = 2080;
            v48 = v28;
            v49 = 2080;
            v50 = v33;
            _os_log_send_and_compose_impl();

          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          goto LABEL_25;
        }
      }
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (v9)
  {
    createCMIInferenceDeviceEspressoV2();
    v18 = (CMIInferenceDevice *)objc_claimAutoreleasedReturnValue();
    inferenceDevice = self->_inferenceDevice;
    self->_inferenceDevice = v18;

    if (!self->_inferenceDevice)
    {
      v44 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v10 = objc_claimAutoreleasedReturnValue();
      v20 = v44;
      if (os_log_type_enabled(v10, type))
        v21 = v20;
      else
        v21 = v20 & 0xFFFFFFFE;
      if (v21)
      {
        v45 = 136315138;
        v46 = "-[CMITiledInferenceProcessor _createInferenceDeviceWithConfig:]";
LABEL_33:
        _os_log_send_and_compose_impl();
        goto LABEL_34;
      }
      goto LABEL_34;
    }
LABEL_18:
    v24 = 0;
    goto LABEL_26;
  }
  createCMIInferenceDeviceEspressoV1();
  v22 = (CMIInferenceDevice *)objc_claimAutoreleasedReturnValue();
  v23 = self->_inferenceDevice;
  self->_inferenceDevice = v22;

  if (self->_inferenceDevice)
    goto LABEL_18;
  v44 = 0;
  type = OS_LOG_TYPE_DEFAULT;
  fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  v10 = objc_claimAutoreleasedReturnValue();
  v35 = v44;
  if (os_log_type_enabled(v10, type))
    v36 = v35;
  else
    v36 = v35 & 0xFFFFFFFE;
  if (v36)
  {
    v45 = 136315138;
    v46 = "-[CMITiledInferenceProcessor _createInferenceDeviceWithConfig:]";
    goto LABEL_33;
  }
LABEL_34:
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_25:

  v24 = -1;
LABEL_26:

  return v24;
}

- (int)allocateIOBuffers
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[CMITiledInferenceProcessorConfig isAllocated](self->_config, "isAllocated"))
    return 0;
  v4 = (void *)MEMORY[0x1D824D210]();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CMITiledInferenceProcessorConfig pipeline](self->_config, "pipeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "networkConfig");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "network");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "allocateInstancesWithDevice:instanceCount:useTextureArrays:", self->_device, -[CMITiledInferenceProcessorConfig bufferCount](self->_config, "bufferCount"), -[CMITiledInferenceProcessorConfig useTextureArrays](self->_config, "useTextureArrays"));
        if (v12)
        {
          v3 = v12;
          fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v13 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();

          goto LABEL_13;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[CMITiledInferenceProcessorConfig setIsAllocated:](self->_config, "setIsAllocated:", 1);
  v3 = 0;
LABEL_13:
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (int)runWithTileCount:(id)a3 withCompletionHandler:
{
  double v3;
  id v5;
  int v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CMITiledInferenceProcessorInstanceExecutor *v15;
  CMITiledInferenceProcessorInstanceExecutor *v16;
  unint64_t v17;
  __int128 v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  unsigned int v33;
  NSObject *v34;
  unsigned int v35;
  unsigned int v36;
  NSObject *v37;
  unsigned int v38;
  unsigned int v39;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  void *v48;
  void *v49;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  CMITiledInferenceProcessorCompletion *v56;
  MTLCommandQueue *v57;
  double v58;
  double v59;
  _QWORD v60[4];
  CMITiledInferenceProcessorCompletion *v61;
  id v62;
  _QWORD v63[4];
  CMITiledInferenceProcessorCompletion *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  os_log_type_t type;
  unsigned int v70;
  _BYTE v71[128];
  int v72;
  const char *v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v58 = v3;
  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
    v56 = -[CMITiledInferenceProcessorCompletion initWithHandler:]([CMITiledInferenceProcessorCompletion alloc], "initWithHandler:", v5);
  else
    v56 = 0;
  if (!-[CMITiledInferenceProcessorConfig isAllocated](self->_config, "isAllocated"))
  {
    v6 = -[CMITiledInferenceProcessor allocateIOBuffers](self, "allocateIOBuffers");
    if (v6)
    {
      v28 = v6;
      v70 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v42 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_68;
    }
  }
  v7 = (void *)MEMORY[0x1D824D210]();
  v8 = -[CMITiledInferenceProcessorConfig bufferCount](self->_config, "bufferCount");
  v57 = self->_commandQueue;
  -[MTLCommandQueue commandBuffer](v57, "commandBuffer");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
    goto LABEL_67;
  }
  v10 = (void *)v9;
  v11 = LODWORD(v58);
  v12 = (LODWORD(v58) * HIDWORD(v58));
  -[CMITiledInferenceProcessorCompletion setExpectedTiles:](v56, "setExpectedTiles:", v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v8;
  if (v8)
  {
    v14 = 0;
    while (1)
    {
      v15 = -[CMITiledInferenceProcessorInstanceExecutor initWithIndex:inferenceDevice:commandQueue:config:tileCount:]([CMITiledInferenceProcessorInstanceExecutor alloc], "initWithIndex:inferenceDevice:commandQueue:config:tileCount:", v14, self->_inferenceDevice, v57, self->_config, v58);
      if (!v15)
        break;
      v16 = v15;
      objc_msgSend(v13, "addObject:", v15);

      if (v55 == ++v14)
        goto LABEL_11;
    }
    v70 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v41 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    goto LABEL_83;
  }
LABEL_11:
  v50 = v5;
  if ((_DWORD)v12)
  {
    LODWORD(v17) = 0;
    v18 = 0uLL;
    v48 = v13;
    v49 = v7;
    do
    {
      v68 = v18;
      v66 = v18;
      v67 = v18;
      v65 = v18;
      obj = v13;
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      v19 = 0;
      if (v53)
      {
        v52 = *(_QWORD *)v66;
        do
        {
          v20 = 0;
          while (2)
          {
            if (*(_QWORD *)v66 != v52)
              objc_enumerationMutation(obj);
            v54 = v20;
            v21 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v20);
            do
            {
              v22 = (void *)MEMORY[0x1D824D210]();
              if ((objc_msgSend(v21, "isActive") & 1) == 0 && v12)
              {
                LODWORD(v23) = v17 % v11;
                HIDWORD(v23) = v17 / v11;
                v59 = v23;
                v63[0] = MEMORY[0x1E0C809B0];
                v63[1] = 3221225472;
                v63[2] = __69__CMITiledInferenceProcessor_runWithTileCount_withCompletionHandler___block_invoke;
                v63[3] = &unk_1E94EB5B0;
                v64 = v56;
                v24 = objc_msgSend(v21, "startTileWithIndex:completionHandler:", v63, v59);
                if (v24)
                {
                  v28 = v24;
                  v70 = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v31 = objc_claimAutoreleasedReturnValue();
                  v32 = v70;
                  if (os_log_type_enabled(v31, type))
                    v33 = v32;
                  else
                    v33 = v32 & 0xFFFFFFFE;
                  if (v33)
                  {
                    v72 = 136315394;
                    v73 = "-[CMITiledInferenceProcessor runWithTileCount:withCompletionHandler:]";
                    v74 = 1024;
                    v75 = v28;
                    _os_log_send_and_compose_impl();
                  }
                  v5 = v50;
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_62:
                  goto LABEL_65;
                }
                v17 = (v17 + 1);
                if (-[CMITiledInferenceProcessorConfig shouldAutoCommit](self->_config, "shouldAutoCommit"))
                {
                  if (!(v17 % v55))
                  {
                    objc_msgSend(v10, "commit");
                    -[MTLCommandQueue commandBuffer](v57, "commandBuffer");
                    v25 = objc_claimAutoreleasedReturnValue();

                    v10 = (void *)v25;
                    if (!v25)
                    {
                      fig_log_get_emitter();
                      FigDebugAssert3();
                      v28 = FigSignalErrorAt();
                      v5 = v50;
                      goto LABEL_62;
                    }
                  }
                }
                --v12;

              }
              if (objc_msgSend(v21, "isActive"))
              {
                v26 = objc_msgSend(v21, "scheduleWaitsWithCommandBuffer:", v10);
                if (v26)
                {
                  v28 = v26;
                  v70 = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v34 = objc_claimAutoreleasedReturnValue();
                  v35 = v70;
                  if (os_log_type_enabled(v34, type))
                    v36 = v35;
                  else
                    v36 = v35 & 0xFFFFFFFE;
                  if (v36)
                  {
                    v72 = 136315394;
                    v73 = "-[CMITiledInferenceProcessor runWithTileCount:withCompletionHandler:]";
                    v74 = 1024;
                    v75 = v28;
                    _os_log_send_and_compose_impl();
                  }
                  v5 = v50;
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  goto LABEL_65;
                }
                if (objc_msgSend(v10, "status"))
                {
                  -[MTLCommandQueue commandBuffer](v57, "commandBuffer");
                  v27 = objc_claimAutoreleasedReturnValue();

                  v10 = (void *)v27;
                  if (!v27)
                  {
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    v28 = FigSignalErrorAt();
                    goto LABEL_60;
                  }
                }
                v62 = v10;
                v28 = objc_msgSend(v21, "scheduleWorkWithCommandBuffer:", &v62);
                v29 = v62;

                if (v28)
                {
                  v70 = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  v37 = objc_claimAutoreleasedReturnValue();
                  v38 = v70;
                  if (os_log_type_enabled(v37, type))
                    v39 = v38;
                  else
                    v39 = v38 & 0xFFFFFFFE;
                  if (v39)
                  {
                    v72 = 136315394;
                    v73 = "-[CMITiledInferenceProcessor runWithTileCount:withCompletionHandler:]";
                    v74 = 1024;
                    v75 = v28;
                    _os_log_send_and_compose_impl();
                  }
                  v5 = v50;
                  fig_log_call_emit_and_clean_up_after_send_and_compose();

                  v10 = v29;
                  goto LABEL_65;
                }
                if (objc_msgSend(v29, "status"))
                {
                  -[MTLCommandQueue commandBuffer](v57, "commandBuffer");
                  v30 = objc_claimAutoreleasedReturnValue();

                  v29 = (id)v30;
                  if (!v30)
                  {
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    v28 = FigSignalErrorAt();
                    v10 = 0;
LABEL_60:
                    v5 = v50;
LABEL_65:
                    objc_autoreleasePoolPop(v22);

                    v13 = v48;
                    v7 = v49;
                    goto LABEL_66;
                  }
                }
                v19 = (objc_msgSend(v21, "isActive") | v19) & 1;
                v10 = v29;
              }
              objc_autoreleasePoolPop(v22);
            }
            while ((objc_msgSend(v21, "isActive") & 1) == 0 && v12);
            v20 = v54 + 1;
            if (v54 + 1 != v53)
              continue;
            break;
          }
          v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
        }
        while (v53);
      }

      v13 = v48;
      v7 = v49;
      v18 = 0uLL;
    }
    while (v12 || (v19 & 1) != 0);
  }
  if (!v10)
  {
    v70 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v70;
    if (os_log_type_enabled(v43, type))
      v45 = v44;
    else
      v45 = v44 & 0xFFFFFFFE;
    v5 = v50;
    if (v45)
    {
      v72 = 136315138;
      v73 = "-[CMITiledInferenceProcessor runWithTileCount:withCompletionHandler:]";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
    goto LABEL_84;
  }
  v5 = v50;
  if (objc_msgSend(v10, "status"))
  {
    v70 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v41 = objc_claimAutoreleasedReturnValue();
    v46 = v70;
    if (os_log_type_enabled(v41, type))
      v47 = v46;
    else
      v47 = v46 & 0xFFFFFFFE;
    if (v47)
    {
      v72 = 136315138;
      v73 = "-[CMITiledInferenceProcessor runWithTileCount:withCompletionHandler:]";
      _os_log_send_and_compose_impl();
    }
LABEL_83:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_84:
    v28 = -1;
    goto LABEL_66;
  }
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __69__CMITiledInferenceProcessor_runWithTileCount_withCompletionHandler___block_invoke_281;
  v60[3] = &unk_1E94EB5D8;
  v61 = v56;
  objc_msgSend(v10, "addCompletedHandler:", v60);
  objc_msgSend(v10, "commit");

  v10 = 0;
  v28 = 0;
LABEL_66:

LABEL_67:
  objc_autoreleasePoolPop(v7);
LABEL_68:

  return v28;
}

uint64_t __69__CMITiledInferenceProcessor_runWithTileCount_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "networkTileCompletion:", a2);
}

uint64_t __69__CMITiledInferenceProcessor_runWithTileCount_withCompletionHandler___block_invoke_281(uint64_t a1, void *a2)
{
  uint64_t v3;

  if (objc_msgSend(a2, "status") == 4)
    v3 = 0;
  else
    v3 = 0xFFFFFFFFLL;
  return objc_msgSend(*(id *)(a1 + 32), "metalCompletion:", v3);
}

- (int)runWithTileCount:(CMITiledInferenceProcessor *)self
{
  return -[CMITiledInferenceProcessor runWithTileCount:withCompletionHandler:](self, "runWithTileCount:withCompletionHandler:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_inferenceDevice, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
