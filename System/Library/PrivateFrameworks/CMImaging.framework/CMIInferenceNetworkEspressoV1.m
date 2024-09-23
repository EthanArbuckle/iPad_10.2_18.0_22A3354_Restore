@implementation CMIInferenceNetworkEspressoV1

- (CMIInferenceNetworkEspressoV1)initWithDispatchQueue:(id)a3
{
  id v5;
  CMIInferenceNetworkEspressoV1 *v6;
  CMIInferenceNetworkEspressoV1 *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMIInferenceNetworkEspressoV1;
  v6 = -[CMIInferenceNetworkEspressoV1 init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v7->_planSubmitCount = 0;
  }

  return v7;
}

- (void)dealloc
{
  NSArray *instances;
  NSObject *v4;
  objc_super v5;
  os_log_type_t type;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  instances = self->_instances;
  self->_instances = 0;

  if (self->_plan)
  {
    if (espresso_plan_destroy())
    {
      v7 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v4 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

    }
    else
    {
      self->_plan = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CMIInferenceNetworkEspressoV1;
  -[CMIInferenceNetworkEspressoV1 dealloc](&v5, sel_dealloc);
}

- (int)loadNetworkWithPath:(id)a3 context:(void *)a4
{
  id v5;
  id v6;
  int result;
  NSObject *v8;

  v5 = a3;
  self->_plan = (void *)espresso_create_plan();
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "UTF8String");

  if (espresso_plan_add_network() || (result = espresso_plan_build()) != 0)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v8 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  return result;
}

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
        v17 = objc_msgSend(v16, "_getInfoFromNetwork:portName:isInput:", self->_network.plan, *(_QWORD *)&self->_network.network_index, v15, 1);
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
        v25 = objc_msgSend(v24, "_getInfoFromNetwork:portName:isInput:", self->_network.plan, *(_QWORD *)&self->_network.network_index, v23, 0);
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
  uint64_t v10;
  void *instances;
  void *v12;
  void *v13;
  int v14;
  NSArray *v15;
  int v16;
  unint64_t v18;

  v5 = a5;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = a4;
  if (a4)
  {
    a4 = 0;
    v10 = 0;
    while (1)
    {
      instances = (void *)objc_opt_new();
      objc_msgSend(instances, "setParentNetwork:", self);
      objc_msgSend(instances, "setInstanceId:", v10);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_inputs, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_outputs, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(instances, "_allocateTexturesWithDevice:firstInstance:ports:useTextureArrays:outputTextureArray:", v8, a4, self->_inputs, v5, v12);
      if (v14)
        break;
      v14 = objc_msgSend(instances, "_allocateTexturesWithDevice:firstInstance:ports:useTextureArrays:outputTextureArray:", v8, a4, self->_outputs, v5, v13);
      if (v14)
        break;
      objc_msgSend(instances, "setInputTextures:", v12);
      objc_msgSend(instances, "setOutputTextures:", v13);
      objc_msgSend(v9, "addObject:", instances);
      if (!a4)
        a4 = instances;

      if (v18 == ++v10)
        goto LABEL_8;
    }
    v16 = v14;

  }
  else
  {
LABEL_8:
    v15 = v9;
    v16 = 0;
    instances = self->_instances;
    self->_instances = v15;
  }

  return v16;
}

- (id)getInstanceWithIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_instances, "objectAtIndexedSubscript:", a3);
}

- (int)_planSubmitComplete:(id *)a3 planSubmitId:(int)a4
{
  NSObject *v5;

  if (!a3 || !a3->var1)
    return 0;
  fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  v5 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  return -1;
}

- (int)_planSubmit
{
  int result;
  NSObject *v3;

  ++self->_planSubmitCount;
  result = espresso_plan_submit();
  if (result)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v3 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return -1;
  }
  return result;
}

uint64_t __44__CMIInferenceNetworkEspressoV1__planSubmit__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_planSubmitComplete:planSubmitId:", a2, *(unsigned int *)(a1 + 40));
}

- (NSArray)inputs
{
  return self->_inputs;
}

- (NSArray)outputs
{
  return self->_outputs;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  uint64_t v2;
  void *plan;
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  v2 = *(_QWORD *)&self->_network.network_index;
  plan = self->_network.plan;
  result.var1 = v2;
  result.var0 = plan;
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)plan
{
  return self->_plan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_instances, 0);
}

@end
