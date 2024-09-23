@implementation CMIInferenceNetworkEspressoV2

- (int)bindIOPortsWithInputNames:(id)a3 withOutputNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  int v17;
  NSArray *outputs;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  int v25;
  NSArray *v26;
  int v27;
  NSArray *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = (NSArray *)v6;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v16 = (void *)objc_opt_new();
        v17 = objc_msgSend(v16, "_getInfoFromEsop:portName:isInput:", self->_mainEsop, v15, 1);
        if (v17)
        {
          v27 = v17;

          outputs = v10;
          goto LABEL_21;
        }
        objc_msgSend(v8, "addObject:", v16);

      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v12)
        continue;
      break;
    }
  }
  v29 = v10;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  outputs = v30;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(outputs);
        v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        v24 = (void *)objc_opt_new();
        v25 = objc_msgSend(v24, "_getInfoFromEsop:portName:isInput:", self->_mainEsop, v23, 0);
        if (v25)
        {
          v27 = v25;

          goto LABEL_20;
        }
        objc_msgSend(v9, "addObject:", v24);

      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](outputs, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v20)
        continue;
      break;
    }
  }

  objc_storeStrong((id *)&self->_inputs, v8);
  v26 = v9;
  v27 = 0;
  outputs = self->_outputs;
  self->_outputs = v26;
LABEL_20:
  v10 = v29;
LABEL_21:

  return v27;
}

- (int)loadNetworkWithPath:(id)a3
{
  id v5;
  int v6;

  v5 = a3;
  v6 = +[CMIInferenceNetworkEspressoV2 _loadEsopWithPath:esopOut:](CMIInferenceNetworkEspressoV2, "_loadEsopWithPath:esopOut:", v5, &self->_mainEsop);
  if (!v6)
    objc_storeStrong((id *)&self->_networkPath, a3);

  return v6;
}

+ (int)_loadEsopWithPath:(id)a3 esopOut:(e5rt_execution_stream_operation *)a4
{
  id v4;
  int v5;
  NSObject *v7;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation())
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v7 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v5 = -1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CMIInferenceNetworkEspressoV2)init
{
  CMIInferenceNetworkEspressoV2 *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMIInferenceNetworkEspressoV2;
  result = -[CMIInferenceNetworkEspressoV2 init](&v3, sel_init);
  if (result)
    result->_mainEsop = 0;
  return result;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  os_log_type_t type;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_mainEsop && e5rt_execution_stream_operation_release())
  {
    v6 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  v4.receiver = self;
  v4.super_class = (Class)CMIInferenceNetworkEspressoV2;
  -[CMIInferenceNetworkEspressoV2 dealloc](&v4, sel_dealloc);
}

- (int)_duplicateMainEsop:(e5rt_execution_stream_operation *)a3
{
  return +[CMIInferenceNetworkEspressoV2 _loadEsopWithPath:esopOut:](CMIInferenceNetworkEspressoV2, "_loadEsopWithPath:esopOut:", self->_networkPath, a3);
}

- (id)getInputs
{
  return self->_inputs;
}

- (id)getOutputs
{
  return self->_outputs;
}

- (int)allocateInstancesWithDevice:(id)a3 instanceCount:(unint64_t)a4 useTextureArrays:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *instances;
  int v11;
  void *v12;
  void *v13;
  int v14;
  NSArray *v15;
  int v16;
  uint64_t v18;

  v5 = a5;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    while (1)
    {
      instances = (void *)objc_opt_new();
      objc_msgSend(instances, "setParentNetwork:", self);
      v18 = 0;
      v11 = -[CMIInferenceNetworkEspressoV2 _duplicateMainEsop:](self, "_duplicateMainEsop:", &v18);
      if (v11)
        break;
      objc_msgSend(instances, "setEsop:", v18);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_inputs, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_outputs, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(instances, "_allocateTexturesWithDevice:ports:useTextureArrays:outputTextureArray:", v8, self->_inputs, v5, v12);
      if (v14
        || (v14 = objc_msgSend(instances, "_allocateTexturesWithDevice:ports:useTextureArrays:outputTextureArray:", v8, self->_outputs, v5, v13)) != 0|| (objc_msgSend(instances, "setInputTextures:", v12), objc_msgSend(instances, "setOutputTextures:", v13), (v14 = objc_msgSend(instances, "_createEventsWithDevice:", v8)) != 0))
      {
        v16 = v14;

        goto LABEL_8;
      }
      objc_msgSend(v9, "addObject:", instances);

      if (!--a4)
        goto LABEL_7;
    }
    v16 = v11;
  }
  else
  {
LABEL_7:
    v15 = v9;
    v16 = 0;
    instances = self->_instances;
    self->_instances = v15;
  }
LABEL_8:

  return v16;
}

- (id)getInstanceWithIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_instances, "objectAtIndexedSubscript:", a3);
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_instances, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
}

@end
