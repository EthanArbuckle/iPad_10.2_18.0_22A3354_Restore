@implementation BWEspressoInferenceProvider

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  return -[BWEspressoInferenceProvider _prepareWithWorkQueue:]((uint64_t)self, (uint64_t)a3);
}

- (id)newStorage
{
  NSMutableArray *inputVideoRequirements;
  void *v4;
  void *v5;

  inputVideoRequirements = self->_inputVideoRequirements;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v4, "addObjectsFromArray:", self->_outputVideoRequirements);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v5, "addObjectsFromArray:", self->_outputVideoRequirements);
  objc_msgSend(v5, "addObjectsFromArray:", self->_inputMetadataRequirements);
  objc_msgSend(v5, "addObjectsFromArray:", self->_outputMetadataRequirements);
  return -[BWEspressoInferenceStorage initWithBindingNameByRequirement:requirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:requirementsNeedingTensors:]([BWEspressoInferenceStorage alloc], "initWithBindingNameByRequirement:requirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:requirementsNeedingTensors:", self->_bindingNamesByRequirement, inputVideoRequirements, v4, v5);
}

- (BWInferenceSubmittable)submittable
{
  if ((*((_DWORD *)self + 3) | 2) != 3)
    return 0;
  return self;
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
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p; executionTarget = %lu; networkURL = %@; network version = %@>"),
                       objc_opt_class(),
                       self,
                       self->_executionTarget,
                       self->_networkURL,
                       self->_espressoNetworkVersion);
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
  return -[BWEspressoInferenceProvider bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:count:](self, "bindEspressoInput:fromAttachedMediaUsingKey:withVideoFormat:count:", a3, a4, a5, 1);
}

- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5
{
  return -[BWEspressoInferenceProvider bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:count:](self, "bindEspressoOutput:asAttachedMediaUsingKey:withVideoFormat:count:", a3, a4, a5, 1);
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  BWInferenceCloneVideoRequirement *v5;

  v5 = -[BWInferenceCloneVideoRequirement initWithAttachedMediaKey:sourceVideoRequirement:]([BWInferenceCloneVideoRequirement alloc], "initWithAttachedMediaKey:sourceVideoRequirement:", a4, a3);
  -[NSMutableArray addObject:](self->_cloneVideoRequirements, "addObject:", v5);
  return v5;
}

- (id)bindEspressoOutput:(id)a3 asAttachedMediaUsingKey:(id)a4 withVideoFormat:(id)a5 count:(unint64_t)a6
{
  BWInferenceVideoRequirement *v8;

  v8 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:count:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:count:", a4, a5, a6);
  -[NSMutableArray addObject:](self->_outputVideoRequirements, "addObject:", v8);
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

- (uint64_t)_prepareWithWorkQueue:(uint64_t)a1
{
  _DWORD *v3;
  uint64_t v5;
  uint64_t plan;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;

  if (!a1)
    return 0;
  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*(_QWORD *)(a1 + 72))
    goto LABEL_28;
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    objc_msgSend((id)a1, "type");
    kdebug_trace();
  }
  BWInferenceTypeDescription(*(unsigned int *)(a1 + 8));
  mach_absolute_time();
  v5 = objc_msgSend(*(id *)(a1 + 64), "prepareForInference");
  if ((_DWORD)v5)
    goto LABEL_38;
  plan = objc_msgSend(*(id *)(a1 + 64), "espressoContext");
  if (!plan)
    goto LABEL_29;
  plan = espresso_create_plan();
  *(_QWORD *)(a1 + 72) = plan;
  if (!plan)
    goto LABEL_29;
  objc_msgSend(*(id *)(a1 + 40), "fileSystemRepresentation");
  objc_msgSend((id)a1, "executionTarget");
  LODWORD(plan) = espresso_plan_add_network();
  if ((_DWORD)plan)
    goto LABEL_37;
  if (-[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"))
  {
    espresso_network_set_memory_pool_id();
  }
  if (objc_msgSend((id)a1, "submittable")
    && *(_DWORD *)(a1 + 12) == 3
    && (a2 && (LODWORD(plan) = espresso_plan_set_execution_queue(), (_DWORD)plan)
     || *(_QWORD *)(a1 + 32) >= 2uLL && (LODWORD(plan) = espresso_plan_submit_set_multiple_buffering(), (_DWORD)plan))
    || *(_DWORD *)(a1 + 96) && (LODWORD(plan) = espresso_plan_set_priority(), (_DWORD)plan))
  {
LABEL_37:
    v11 = 4294935586;
    goto LABEL_30;
  }
  v7 = objc_msgSend(*(id *)(a1 + 64), "configureIntermediateBufferSharingForPlanPrebuild:", *(_QWORD *)(a1 + 72));
  if ((_DWORD)v7)
  {
    v11 = v7;
LABEL_41:
    FigDebugAssert3();
    goto LABEL_42;
  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    objc_msgSend(v8, "UTF8String");
    v5 = espresso_network_select_configuration();
    if ((_DWORD)v5)
    {
LABEL_38:
      v11 = v5;
LABEL_42:
      LODWORD(plan) = 0;
      goto LABEL_30;
    }
  }
  LODWORD(plan) = espresso_plan_build();
  if ((_DWORD)plan)
    goto LABEL_37;
  v9 = objc_msgSend(*(id *)(a1 + 64), "configureIntermediateBufferSharingForPlanPostbuild:", *(_QWORD *)(a1 + 72));
  if ((_DWORD)v9)
  {
    v11 = v9;
    goto LABEL_41;
  }
  if (!*(_QWORD *)(a1 + 152))
    *(_QWORD *)(a1 + 152) = -[BWInferenceSampleBufferPropagator initWithVideoRequirements:cloneRequirements:metadataRequirements:]([BWInferenceSampleBufferPropagator alloc], "initWithVideoRequirements:cloneRequirements:metadataRequirements:", *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 144));

  *(_QWORD *)(a1 + 168) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (dword_1ECFE9990)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_28:
  LODWORD(plan) = 0;
LABEL_29:
  v11 = 0;
LABEL_30:
  if (v11 | plan)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      *(_QWORD *)(a1 + 80) = 0;
      *(_QWORD *)(a1 + 88) = 0;
      espresso_plan_destroy();
      *(_QWORD *)(a1 + 72) = 0;
    }

    *(_QWORD *)(a1 + 168) = 0;
  }
  if (*v3 == 1)
  {
    objc_msgSend((id)a1, "type");
    kdebug_trace();
  }
  return v11;
}

- (int)type
{
  return self->_type;
}

- (int)executionTarget
{
  return self->_executionTarget;
}

- (id)bindEspressoOutput:(id)a3 asMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:", a4);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v6);
  return v6;
}

- (BWEspressoInferenceProvider)initWithType:(int)a3 networkURL:(id)a4 networkConfiguration:(id)a5 context:(id)a6 executionTarget:(int)a7 schedulerPriority:(unsigned int)a8 preventionReasons:(id)a9 resourceProvider:(id)a10 allowedCompressionDirection:(unsigned int)a11 concurrentSubmissionLimit:(unint64_t)a12
{
  BWEspressoInferenceProvider *v17;
  BWEspressoInferenceProvider *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)BWEspressoInferenceProvider;
  v17 = -[BWEspressoInferenceProvider init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_type = a3;
    v17->_networkURL = (NSURL *)objc_msgSend(a4, "copy");
    v18->_networkConfiguration = (NSString *)objc_msgSend(a5, "copy");
    v18->_executionTarget = a7;
    v18->_preventionReasons = (NSSet *)objc_msgSend(a9, "copy");
    v18->_allowedCompressionDirection = a11;
    v18->_concurrentSubmissionLimit = a12;
    v18->_espressoPriority = -[BWEspressoInferenceProvider _mapSchedulerToEspressoPriority:]((uint64_t)v18);
    v18->_context = (BWEspressoInferenceContext *)a6;
    v18->_bindingNamesByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18->_inputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18->_outputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18->_inputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18->_outputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v18;
}

- (uint64_t)_mapSchedulerToEspressoPriority:(uint64_t)result
{
  int MachThreadPriorityValue;

  if (result)
  {
    if (*(_DWORD *)(result + 12) == 3)
    {
      MachThreadPriorityValue = FigThreadGetMachThreadPriorityValue();
      if (MachThreadPriorityValue >= (int)FigThreadGetMachThreadPriorityValue())
        return 1;
      else
        return 0x2000;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_espressoPlan)
    espresso_plan_destroy();

  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceProvider;
  -[BWEspressoInferenceProvider dealloc](&v3, sel_dealloc);
}

- (uint64_t)_ensureEspressoBindingsUsingStorage:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFAllocator *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  __IOSurface *v42;
  int v43;
  __CVBuffer *v44;
  CVPixelBufferRef pixelBufferOut;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v4 = (void *)objc_msgSend((id)result, "inputVideoRequirements");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v59;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v59 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          if (!objc_msgSend(a2, "pixelBufferForRequirement:", v9))
            return 4294935584;
          v10 = (void *)objc_msgSend(a2, "bindingNameForRequirement:", v9);
          if (!v10)
            return 4294935584;
          v11 = v10;
          objc_msgSend(v10, "UTF8String");
          if (espresso_network_bind_direct_cvpixelbuffer())
          {
            objc_msgSend(v11, "UTF8String");
            if (espresso_network_bind_cvpixelbuffer())
              return 4294935586;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
        if (v6)
          continue;
        break;
      }
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = *(void **)(v3 + 120);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v55;
LABEL_15:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v16);
        v18 = objc_msgSend(a2, "bindingNameForRequirement:", v17);
        if (!v18)
          return 4294935579;
        v19 = (void *)v18;
        if (!objc_msgSend(a2, "pixelBufferForRequirement:", v17))
        {
          v20 = (const void *)objc_msgSend((id)objc_msgSend(a2, "pixelBufferPoolForRequirement:", v17), "newPixelBuffer");
          objc_msgSend(a2, "setPixelBuffer:forRequirement:", v20, v17);
          if (!v20)
            return 4294935579;
          CFRelease(v20);
        }
        if ((objc_msgSend((id)objc_msgSend(v17, "videoFormat"), "deviceOriented") & 1) != 0
          || (objc_msgSend(v19, "UTF8String"), espresso_network_bind_direct_cvpixelbuffer()))
        {
          if (!objc_msgSend(a2, "tensorForRequirement:", v17))
            return 4294935579;
          objc_msgSend(v19, "UTF8String");
          if (espresso_network_bind_buffer())
            return 4294935586;
          objc_msgSend(a2, "addTensorInUseRequirement:", v17);
        }
        else
        {
          objc_msgSend(a2, "addPixelBufferInUseRequirement:", v17);
        }
        if (v14 == ++v16)
        {
          v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
          v14 = v21;
          if (v21)
            goto LABEL_15;
          break;
        }
      }
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v22 = *(void **)(v3 + 136);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v51;
LABEL_33:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v51 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v26);
        v28 = (void *)objc_msgSend(a2, "bindingNameForRequirement:", v27);
        v29 = !objc_msgSend(a2, "tensorForRequirement:", v27) || v28 == 0;
        if (v29 || !objc_msgSend(v28, "length"))
          return 4294935579;
        objc_msgSend(v28, "UTF8String");
        if (espresso_network_bind_buffer())
          return 4294935586;
        if (v24 == ++v26)
        {
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
          if (v24)
            goto LABEL_33;
          break;
        }
      }
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v30 = *(void **)(v3 + 144);
    result = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    if (result)
    {
      v31 = result;
      v32 = *(_QWORD *)v47;
      v33 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
LABEL_46:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v34);
        v36 = (void *)objc_msgSend(a2, "bindingNameForRequirement:", v35);
        v37 = objc_msgSend(a2, "tensorForRequirement:", v35);
        if (!v37 || v36 == 0)
          return 4294935579;
        v39 = (_QWORD *)v37;
        if (!objc_msgSend(v36, "length"))
          return 4294935579;
        v40 = bweis_storageLengthInBytes((uint64_t)v39);
        if (*(_QWORD *)(v3 + 160) && v40)
          goto LABEL_72;
        objc_msgSend(v36, "UTF8String");
        if (espresso_network_bind_buffer())
          return 4294935586;
        if (*(_QWORD *)(v3 + 160))
        {
LABEL_72:
          v41 = -[BWEspressoInferenceProvider _surfacePropertiesForTensor:bindingName:](v3, v39);
          if (!v41)
            return 4294935576;
          v42 = (__IOSurface *)objc_msgSend(*(id *)(v3 + 160), "backingMemoryForMetadataRequirement:bindingName:surfaceProperties:", v35, v36, v41);
          if (v42)
          {
            pixelBufferOut = 0;
            CVPixelBufferCreateWithIOSurface(v33, v42, 0, &pixelBufferOut);
            if (!pixelBufferOut)
              return 4294935576;
            objc_msgSend(v36, "UTF8String");
            v43 = espresso_network_bind_direct_cvpixelbuffer();
            v44 = pixelBufferOut;
            if (v43)
              return 4294935586;
          }
        }
        if (v31 == ++v34)
        {
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
          result = 0;
          if (v31)
            goto LABEL_46;
          return result;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_surfacePropertiesForTensor:(uint64_t)result bindingName:(_QWORD *)a2
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = 1278226488;
    v5 = bweis_storageTypeLengthInBytes(65552);
    switch(v5)
    {
      case 1:
        v6 = 1;
        goto LABEL_8;
      case 4:
        v4 = 1111970369;
        v6 = 4;
        goto LABEL_8;
      case 2:
        v4 = 1278226536;
        v6 = 1;
LABEL_8:
        v7 = a2[13];
        v8 = (a2[12] - 1) / v6;
        v9 = a2[11];
        v10 = a2[10] * v6;
        v11 = ((v10 * v5 - 1) & 0xFFFFFFFFFFFFFFC0) + 64;
        v12 = (v9 + v9 * v8) * v7;
        v13[0] = *MEMORY[0x1E0CBBF00];
        v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:");
        v13[1] = *MEMORY[0x1E0CBBF08];
        v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v11);
        v13[2] = *MEMORY[0x1E0CBC008];
        v14[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v12);
        v13[3] = *MEMORY[0x1E0CBC070];
        v14[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
        v13[4] = *MEMORY[0x1E0CBC1E0];
        v14[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v10);
        v13[5] = *MEMORY[0x1E0CBC048];
        v14[5] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BWInference %d"), *(unsigned int *)(v3 + 8));
        return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
    }
    return 0;
  }
  return result;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  _DWORD *v4;
  int v5;
  int v6;

  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v5 = -[BWEspressoInferenceProvider prepareForExecution](self, "prepareForExecution");
  if (v5)
  {
    v6 = v5;
  }
  else if (espresso_plan_execute_sync())
  {
    v6 = -31710;
  }
  else
  {
    v6 = 0;
  }
  if (*v4 == 1)
    kdebug_trace();
  return v6;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (BWEspressoInferenceTensorMemoryProvider)tensorMemoryProvider
{
  return self->_tensorMemoryProvider;
}

- (void)setTensorMemoryProvider:(id)a3
{
  BWEspressoInferenceTensorMemoryProvider *tensorMemoryProvider;

  tensorMemoryProvider = self->_tensorMemoryProvider;
  if (tensorMemoryProvider != a3)
  {

    self->_tensorMemoryProvider = (BWEspressoInferenceTensorMemoryProvider *)a3;
  }
}

- (int)prepareForExecution
{
  return -[BWEspressoInferenceProvider _prepareWithWorkQueue:]((uint64_t)self, 0);
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  void *espressoPlan;
  _DWORD *v9;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *pixelBuffersLockedDuringExecution;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  espressoPlan = self->_espressoPlan;
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!espressoPlan || espressoPlan != self->_espressoNetwork.plan)
    goto LABEL_7;
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWEspressoInferenceProvider type](self, "type", a3, a4, a5);
    kdebug_trace();
  }
  v11 = -[BWEspressoInferenceProvider _ensureEspressoBindingsUsingStorage:]((uint64_t)self, a4);
  if ((_DWORD)v11)
  {
    v12 = v11;
  }
  else
  {
    if (espresso_plan_execute_sync())
    {
LABEL_7:
      v12 = 4294935586;
      goto LABEL_9;
    }
    v12 = 0;
  }
LABEL_9:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  pixelBuffersLockedDuringExecution = self->_pixelBuffersLockedDuringExecution;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pixelBuffersLockedDuringExecution, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(pixelBuffersLockedDuringExecution);
        CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*((_QWORD *)&v19 + 1) + 8 * i), 1uLL);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pixelBuffersLockedDuringExecution, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }
  -[NSMutableArray removeAllObjects](self->_pixelBuffersLockedDuringExecution, "removeAllObjects");
  if (*v9 == 1)
  {
    -[BWEspressoInferenceProvider type](self, "type");
    kdebug_trace();
  }
  if (a6)
    (*((void (**)(id, uint64_t, BWEspressoInferenceProvider *))a6 + 2))(a6, v12, self);
  return v12;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  int v11;
  void *espressoPlan;
  int v13;
  uint64_t v14;
  unsigned int executionTarget;
  int v16;

  v11 = -[BWInferencePropagatable allowsAsyncPropagation](self->_propagator, "allowsAsyncPropagation", a3, a4, a5);
  espressoPlan = self->_espressoPlan;
  if (!espressoPlan
    || espressoPlan != self->_espressoNetwork.plan
    || (v13 = v11, !-[BWEspressoInferenceProvider submittable](self, "submittable")))
  {
    v14 = 4294935586;
LABEL_21:
    v16 = 1;
    goto LABEL_10;
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWEspressoInferenceProvider type](self, "type");
    kdebug_trace();
  }
  v14 = -[BWEspressoInferenceProvider _ensureEspressoBindingsUsingStorage:]((uint64_t)self, a4);
  if ((_DWORD)v14)
    goto LABEL_21;
  executionTarget = self->_executionTarget;
  v16 = 1;
  if (executionTarget > 5)
    goto LABEL_10;
  if (((1 << executionTarget) & 0x31) != 0)
    goto LABEL_9;
  if (((1 << executionTarget) & 0xA) != 0)
  {
    if (!a6)
    {
LABEL_9:
      v14 = 4294935586;
      goto LABEL_10;
    }
    if (espresso_plan_submit())
    {
      v14 = 4294935586;
      if (!a7)
        return v14;
      goto LABEL_16;
    }
    v14 = 0;
    v16 = v13;
  }
LABEL_10:
  v13 = v16;
  if (!a7)
    return v14;
LABEL_16:
  if (v13)
    (*((void (**)(id, uint64_t, BWEspressoInferenceProvider *))a7 + 2))(a7, v14, self);
  return v14;
}

uint64_t __113__BWEspressoInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2 && *(_DWORD *)(a2 + 4))
    v3 = 4294935586;
  else
    v3 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*((_QWORD *)&v10 + 1) + 8 * i), 1uLL);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeAllObjects");
  result = *(_QWORD *)(a1 + 40);
  if (result && *(_BYTE *)(a1 + 52))
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, *(_QWORD *)(a1 + 32));
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "type");
    return kdebug_trace();
  }
  return result;
}

- (id)bindEspressoInput:(id)a3 fromMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:", a4);
  -[NSMutableArray addObject:](self->_inputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v6);
  return v6;
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

- (id)bindEspressoOutput:(id)a3 asConsolidatedMetadataUsingKeys:(id)a4
{
  BWInferenceMetadataRequirement *v6;

  v6 = -[BWInferenceMetadataRequirement initWithMetadataKeys:mappingOption:]([BWInferenceMetadataRequirement alloc], "initWithMetadataKeys:mappingOption:", a4, 2);
  -[NSMutableArray addObject:](self->_outputMetadataRequirements, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bindingNamesByRequirement, "setObject:forKeyedSubscript:", a3, v6);
  return v6;
}

- (NSSet)preventionReasons
{
  return self->_preventionReasons;
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
