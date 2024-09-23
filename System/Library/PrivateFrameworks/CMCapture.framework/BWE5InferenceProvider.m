@implementation BWE5InferenceProvider

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  -[BWE5InferenceProvider _prepare](self);
  return 0;
}

- (int)type
{
  return self->_type;
}

- (BWInferencePropagatable)propagatable
{
  return self->_propagator;
}

- (NSArray)outputVideoRequirements
{
  return &self->_outputVideoRequirements->super;
}

- (NSArray)inputVideoRequirements
{
  return &self->_inputVideoRequirements->super;
}

- (NSArray)cloneVideoRequirements
{
  return &self->_cloneVideoRequirements->super;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return self->_allowedCompressionDirection;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p; executionTarget = %lu; networkURL = %@>"),
                       objc_opt_class(),
                       self,
                       self->_executionTarget,
                       self->_networkURL);
}

- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5 count:(unint64_t)a6
{
  BWInferenceVideoRequirement *v8;

  v8 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", a4, a5, a6);
  -[NSMutableArray addObject:](self->_outputVideoRequirements, "addObject:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v8);
  return v8;
}

- (uint64_t)_prepare
{
  if (a1 && !a1[5])
    a1[5] = -[BWInferenceSampleBufferPropagator initWithVideoRequirements:cloneRequirements:metadataRequirements:]([BWInferenceSampleBufferPropagator alloc], "initWithVideoRequirements:cloneRequirements:metadataRequirements:", a1[9], a1[10], a1[12]);
  return 0;
}

- (id)newStorage
{
  void *v3;
  _DWORD *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v3, "addObjectsFromArray:", self->_inputMetadataRequirements);
  objc_msgSend(v3, "addObjectsFromArray:", self->_outputMetadataRequirements);
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWE5InferenceProvider type](self, "type");
    kdebug_trace();
  }
  -[NSURL fileSystemRepresentation](self->_networkURL, "fileSystemRepresentation");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BWInference type %d"), self->_type), "UTF8String");
  if (e5rt_execution_stream_operation_create_precompiled_compute_operation()
    || e5rt_execution_stream_create())
  {
    if (*v4 == 1)
    {
      -[BWE5InferenceProvider type](self, "type");
      kdebug_trace();
    }
    e5rt_get_last_error_message();
    e5rt_execution_stream_operation_release();
    e5rt_execution_stream_release();
    return 0;
  }
  else
  {
    if (*v4 == 1)
    {
      -[BWE5InferenceProvider type](self, "type");
      kdebug_trace();
    }
    return -[BWE5InferenceStorage initWithOperation:stream:bindingNameByRequirement:requirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:requirementsNeedingTensors:]([BWE5InferenceStorage alloc], "initWithOperation:stream:bindingNameByRequirement:requirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:requirementsNeedingTensors:", 0, 0, self->_bindingNamesByRequirement, self->_inputVideoRequirements, self->_outputVideoRequirements, v3);
  }
}

- (id)bindEspressoOutput:(id)a3 asMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:", a4);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v6);
  return v6;
}

- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5
{
  return -[BWE5InferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:count:](self, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:count:", a3, a4, a5, 1);
}

- (BWE5InferenceProvider)initWithType:(int)a3 networkURL:(id)a4 networkConfiguration:(id)a5 context:(id)a6 executionTarget:(int)a7 schedulerPriority:(unsigned int)a8 preventionReasons:(id)a9 resourceProvider:(id)a10 allowedCompressionDirection:(unsigned int)a11
{
  BWE5InferenceProvider *v14;
  BWE5InferenceProvider *v15;
  int MachThreadPriorityValue;
  int v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)BWE5InferenceProvider;
  v14 = -[BWE5InferenceProvider init](&v19, sel_init, *(_QWORD *)&a3, a4, a5, a6);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v14->_executionTarget = a7;
    v14->_networkURL = (NSURL *)objc_msgSend(a4, "copy");
    MachThreadPriorityValue = FigThreadGetMachThreadPriorityValue();
    if (MachThreadPriorityValue >= (int)FigThreadGetMachThreadPriorityValue())
      v17 = 2;
    else
      v17 = 3;
    v15->_anePriority = v17;
    v15->_preventionReasons = (NSSet *)objc_msgSend(a9, "copy");
    v15->_allowedCompressionDirection = 0;
    v15->_bindingNamesByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15->_inputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15->_outputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15->_inputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15->_outputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v15;
}

- (id)bindEspressoInput:(id)a3 fromAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5 count:(unint64_t)a6
{
  BWInferenceVideoRequirement *v8;

  v8 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", a4, a5, a6);
  -[NSMutableArray addObject:](self->_inputVideoRequirements, "addObject:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v8);
  return v8;
}

- (id)bindEspressoInput:(id)a3 fromAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5
{
  return -[BWE5InferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:count:](self, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:count:", a3, a4, a5, 1);
}

- (id)bindEspressoOutput:(id)a3 asMetadataUsingKey:(id)a4
{
  BWInferenceMetadataRequirement *v7;
  BWInferenceMetadataRequirement *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v7 = [BWInferenceMetadataRequirement alloc];
  v10[0] = a4;
  v8 = -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:](v7, "initWithMetadataKeys:mappingOption:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1), 1);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v8);
  return v8;
}

- (void)setPropagatable:(id)a3
{
  BWInferencePropagatable *propagator;

  propagator = self->_propagator;
  if (propagator != a3)
  {

    self->_propagator = (BWInferencePropagatable *)a3;
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWE5InferenceProvider;
  -[BWE5InferenceProvider dealloc](&v3, sel_dealloc);
}

- (uint64_t)_ensureBindingsUsingStorage:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __CVBuffer *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v4 = *(void **)(result + 64);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v40 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v10 = objc_msgSend(a2, "pixelBufferForRequirement:", v9);
          if (!v10)
            return 4294935584;
          v11 = (__CVBuffer *)v10;
          v12 = objc_msgSend(a2, "bindingNameForRequirement:", v9);
          if (!v12)
            return 4294935584;
          v13 = (void *)v12;
          v38 = 0;
          objc_msgSend(a2, "operation");
          objc_msgSend(v13, "UTF8String");
          if (!e5rt_execution_stream_operation_retain_input_port())
          {
            v37 = 0;
            CVPixelBufferGetIOSurface(v11);
            if (!e5rt_surface_object_create_from_iosurface()
              && !e5rt_io_port_bind_surface_object()
              && !e5rt_surface_object_release()
              && !e5rt_io_port_release())
            {
              continue;
            }
          }
LABEL_52:
          e5rt_get_last_error_message();
          if (v9)
            objc_msgSend(a2, "bindingNameForRequirement:", v9);
          return 4294935586;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v6)
          continue;
        break;
      }
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = *(void **)(v3 + 72);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v34;
      while (2)
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          v19 = objc_msgSend(a2, "bindingNameForRequirement:", v9);
          if (!v19)
            return 4294935579;
          v20 = (void *)v19;
          v21 = (void *)objc_msgSend(a2, "pixelBufferForRequirement:", v9);
          if (!v21)
          {
            v21 = (void *)objc_msgSend((id)objc_msgSend(a2, "pixelBufferPoolForRequirement:", v9), "newPixelBuffer");
            objc_msgSend(a2, "setPixelBuffer:forRequirement:", v21, v9);
            if (!v21)
              return 4294935579;
            CFRelease(v21);
          }
          v38 = 0;
          objc_msgSend(a2, "operation");
          objc_msgSend(v20, "UTF8String");
          if (e5rt_execution_stream_operation_retain_output_port())
            goto LABEL_52;
          v37 = 0;
          CVPixelBufferGetIOSurface((CVPixelBufferRef)v21);
          if (e5rt_surface_object_create_from_iosurface()
            || e5rt_io_port_bind_surface_object()
            || e5rt_surface_object_release()
            || e5rt_io_port_release())
          {
            goto LABEL_52;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        if (v16)
          continue;
        break;
      }
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = *(void **)(v3 + 96);
    result = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (result)
    {
      v23 = result;
      v24 = *(_QWORD *)v30;
      while (2)
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v22);
          v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25);
          if (!objc_msgSend(a2, "tensorPortForRequirement:", v9))
          {
            v26 = objc_msgSend(a2, "bindingNameForRequirement:", v9);
            if (!v26)
              return 4294935577;
            v27 = (void *)v26;
            v28 = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
            objc_msgSend(a2, "operation");
            objc_msgSend(v27, "UTF8String");
            if (e5rt_execution_stream_operation_retain_output_port())
            {
              free(v28);
              goto LABEL_52;
            }
            objc_msgSend(a2, "setTensorPort:forRequirement:", v28, v9);
            v38 = 0;
            if (e5rt_io_port_retain_tensor_desc())
              goto LABEL_52;
            v37 = 0;
            if (e5rt_tensor_desc_alloc_buffer_object()
              || e5rt_io_port_bind_buffer_object()
              || e5rt_buffer_object_release()
              || e5rt_tensor_desc_release())
            {
              goto LABEL_52;
            }
          }
          ++v25;
        }
        while (v23 != v25);
        result = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
        v23 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_unbindUsingStorage:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v23 = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = *(void **)(result + 64);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_msgSend(a2, "bindingNameForRequirement:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          objc_msgSend(a2, "operation");
          objc_msgSend(v9, "UTF8String");
          e5rt_execution_stream_operation_retain_input_port();
          e5rt_io_port_bind_surface_object();
          e5rt_io_port_release();
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v6);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = *(void **)(v3 + 72);
    result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
    if (result)
    {
      v11 = result;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v10);
          v14 = (void *)objc_msgSend(a2, "bindingNameForRequirement:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13));
          objc_msgSend(a2, "operation");
          objc_msgSend(v14, "UTF8String");
          e5rt_execution_stream_operation_retain_output_port();
          e5rt_io_port_bind_surface_object();
          e5rt_io_port_release();
          ++v13;
        }
        while (v11 != v13);
        result = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
        v11 = result;
      }
      while (result);
    }
  }
  return result;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  -[BWE5InferenceProvider _prepare](self);
  if (*v4 == 1)
    kdebug_trace();
  return 0;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWE5InferenceProvider type](self, "type", a3, a4, a5);
    kdebug_trace();
  }
  v10 = -[BWE5InferenceProvider _ensureBindingsUsingStorage:]((uint64_t)self, a4);
  if ((_DWORD)v10)
  {
    v11 = v10;
  }
  else if (self->_executionTarget == 3
         && (objc_msgSend(a4, "stream"), e5rt_execution_stream_set_ane_execution_priority())
         || (objc_msgSend(a4, "stream"),
             objc_msgSend(a4, "operation"),
             e5rt_execution_stream_encode_operation())
         || (objc_msgSend(a4, "stream"), e5rt_execution_stream_execute_sync())
         || (objc_msgSend(a4, "stream"), e5rt_execution_stream_reset()))
  {
    e5rt_get_last_error_message();
    v11 = 4294935586;
  }
  else
  {
    v11 = 0;
  }
  if (*v9 == 1)
  {
    -[BWE5InferenceProvider type](self, "type");
    kdebug_trace();
  }
  (*((void (**)(id, uint64_t, BWE5InferenceProvider *))a6 + 2))(a6, v11, self);
  -[BWE5InferenceProvider _unbindUsingStorage:]((uint64_t)self, a4);
  return v11;
}

- (int)prepareForExecution
{
  -[BWE5InferenceProvider _prepare](self);
  return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v10;
  uint64_t v11;

  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWE5InferenceProvider type](self, "type", a3, a4, a5, a6);
    kdebug_trace();
  }
  v10 = -[BWE5InferenceProvider _ensureBindingsUsingStorage:]((uint64_t)self, a4);
  if ((_DWORD)v10)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(a4, "stream");
    objc_msgSend(a4, "operation");
    if (!e5rt_execution_stream_encode_operation())
    {
      objc_msgSend(a4, "stream");
      if (!e5rt_execution_stream_submit_async())
      {
        LODWORD(v11) = 0;
        return v11;
      }
    }
    e5rt_get_last_error_message();
    v11 = 4294935586;
  }
  (*((void (**)(id, uint64_t, BWE5InferenceProvider *))a7 + 2))(a7, v11, self);
  return v11;
}

uint64_t __107__BWE5InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stream");
  e5rt_execution_stream_reset();
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "type");
    kdebug_trace();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return -[BWE5InferenceProvider _unbindUsingStorage:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)bindEspressoInput:(id)a3 fromMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:", a4);
  -[NSMutableArray addObject:](self->_inputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v6);
  return v6;
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  BWInferenceCloneVideoRequirement *v5;

  v5 = -[BWInferenceCloneVideoRequirement initWithAttachedMediaKey:sourceVideoRequirement:]([BWInferenceCloneVideoRequirement alloc], "initWithAttachedMediaKey:sourceVideoRequirement:", a4, a3);
  -[NSMutableArray addObject:](self->_cloneVideoRequirements, "addObject:", v5);
  return v5;
}

- (id)bindEspressoOutput:(id)a3 asConsolidatedMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:mappingOption:", a4, 2);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v6);
  return v6;
}

- (int)executionTarget
{
  return self->_executionTarget;
}

- (NSSet)preventionReasons
{
  return self->_preventionReasons;
}

- (BWEspressoInferenceTensorMemoryProvider)tensorMemoryProvider
{
  return self->_tensorMemoryProvider;
}

- (void)setTensorMemoryProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSArray)inputMetadataRequirements
{
  return &self->_inputMetadataRequirements->super;
}

- (NSArray)outputMetadataRequirements
{
  return &self->_outputMetadataRequirements->super;
}

@end
