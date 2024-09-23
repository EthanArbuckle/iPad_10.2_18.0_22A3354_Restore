@implementation BWInferenceScheduler

- (int)prepareForInferenceRequirements:(id)a3 dependencyProviderSource:(id)a4 formatProvider:(id)a5 pixelBufferPoolProvider:(id)a6 connection:(unint64_t)a7 backPressureDrivenPipelining:(BOOL)a8
{
  _BOOL4 v8;
  BWInferenceSchedulerFramebufferBuilder *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t k;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  _BOOL4 v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id *v62;
  id v63;
  uint64_t v64;
  id obj;
  id obja;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v8 = a8;
  v98 = *MEMORY[0x1E0C80C00];
  v12 = -[BWInferenceSchedulerFramebufferBuilder initWithInferenceRequirements:dependencyProvider:formatProvider:]([BWInferenceSchedulerFramebufferBuilder alloc], "initWithInferenceRequirements:dependencyProvider:formatProvider:", a3, a4, a5);
  v13 = -[BWInferenceSchedulerFramebufferBuilder newFramebuffer](v12, "newFramebuffer");

  if (!v13)
  {
    LODWORD(v30) = -31760;

    goto LABEL_65;
  }
  v54 = v8;
  os_unfair_lock_lock(&self->_connectionsLock);
  v14 = -[NSMapTable objectForKey:](self->_connectionsByIdentifier, "objectForKey:", a7);
  v55 = v13;
  objc_msgSend(v14, "setFramebuffer:", v13);
  v57 = v14;
  v15 = v14;
  os_unfair_lock_unlock(&self->_connectionsLock);
  v16 = (void *)objc_msgSend(a4, "providedVideoRequirementsByAttachedMediaKey");
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  obj = v16;
  v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v89 != v20)
          objc_enumerationMutation(obj);
        v22 = objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v17, "addObject:", v22);
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v19);
  }
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v67 = (void *)objc_msgSend(v57, "coordinator");
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v56 = (id)objc_msgSend(v55, "jobs");
  v59 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (v59)
  {
    v58 = *(_QWORD *)v85;
LABEL_13:
    v24 = 0;
LABEL_14:
    if (*(_QWORD *)v85 != v58)
      objc_enumerationMutation(v56);
    v25 = *(id **)(*((_QWORD *)&v84 + 1) + 8 * v24);
    v26 = *v25;
    v27 = (void *)objc_msgSend(*v25, "submittable");
    v28 = (void *)objc_msgSend(v26, "executable");
    if (v27)
    {
      v29 = objc_msgSend(v27, "prepareForSubmissionWithWorkQueue:", objc_msgSend(v57, "completionQueue"));
    }
    else
    {
      if (!v28)
      {
LABEL_21:
        v31 = objc_msgSend(v26, "newStorage");
        v25[1] = (id)v31;
        if (v31)
        {
          v60 = v24;
          v82 = 0u;
          v83 = 0u;
          v80 = 0u;
          v81 = 0u;
          v62 = v25;
          v63 = (id)objc_msgSend(v25[1], "requirementsNeedingPixelBufferPools");
          v32 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
          if (!v32)
            goto LABEL_43;
          v33 = v32;
          v64 = *(_QWORD *)v81;
          while (1)
          {
            for (j = 0; j != v33; ++j)
            {
              if (*(_QWORD *)v81 != v64)
                objc_enumerationMutation(v63);
              v35 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
              v36 = (void *)objc_msgSend(obj, "objectForKeyedSubscript:", objc_msgSend(v35, "attachedMediaKey"));
              v37 = v36;
              if ((objc_msgSend(v36, "isEqual:", v35) & 1) != 0)
              {
LABEL_38:
                v43 = objc_msgSend(v37, "attachedMediaKey");
                if (v43)
                {
                  objc_msgSend(v62[1], "setPixelBufferPool:forRequirement:", objc_msgSend(a6, "preparedOutputPixelBufferPoolForAttachedMediaKey:format:", v43, objc_msgSend((id)objc_msgSend(v36, "videoFormat"), "underlyingVideoFormat")), v35);
                  continue;
                }
              }
              else
              {
                v78 = 0u;
                v79 = 0u;
                v76 = 0u;
                v77 = 0u;
                v38 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
                if (v38)
                {
                  v39 = v38;
                  v40 = *(_QWORD *)v77;
                  while (2)
                  {
                    v41 = v23;
                    for (k = 0; k != v39; ++k)
                    {
                      if (*(_QWORD *)v77 != v40)
                        objc_enumerationMutation(v17);
                      v37 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
                      if ((objc_msgSend((id)objc_msgSend(v37, "sourceVideoRequirement"), "isEqual:", v35) & 1) != 0)
                      {
                        v23 = v41;
                        goto LABEL_38;
                      }
                    }
                    v39 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
                    v23 = v41;
                    if (v39)
                      continue;
                    break;
                  }
                }
              }
              objc_msgSend(v67, "requestPixelBufferPoolForRequirement:size:", v35, objc_msgSend(v35, "count"));
              objc_msgSend(v23, "addObject:", objc_msgSend(v35, "attachedMediaKey"));
            }
            v33 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
            if (!v33)
            {
LABEL_43:
              v24 = v60 + 1;
              if (v60 + 1 == v59)
              {
                v59 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
                if (!v59)
                  goto LABEL_45;
                goto LABEL_13;
              }
              goto LABEL_14;
            }
          }
        }
        LODWORD(v30) = -31702;
        goto LABEL_63;
      }
      v29 = objc_msgSend(v28, "prepareForExecution");
    }
    LODWORD(v30) = v29;
    if (v29)
      goto LABEL_63;
    goto LABEL_21;
  }
LABEL_45:
  objc_msgSend(v67, "preparePixelBufferPoolsWithBackPressureDrivenPipelining:", v54);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v13 = v55;
  obja = (id)objc_msgSend(v55, "jobs");
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
  if (v30)
  {
    v44 = *(_QWORD *)v73;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v73 != v44)
          objc_enumerationMutation(obja);
        v46 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * m);
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v47 = (void *)objc_msgSend(*(id *)(v46 + 8), "requirementsNeedingPixelBufferPools");
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v69;
          do
          {
            for (n = 0; n != v49; ++n)
            {
              if (*(_QWORD *)v69 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * n);
              if (objc_msgSend(v23, "containsObject:", objc_msgSend(v52, "attachedMediaKey")))
                objc_msgSend(*(id *)(v46 + 8), "setPixelBufferPool:forRequirement:", objc_msgSend(v67, "pixelBufferPoolForFormat:", objc_msgSend(v52, "videoFormat")), v52);
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v92, 16);
          }
          while (v49);
        }
      }
      v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v72, v93, 16);
    }
    while (v30);
LABEL_63:
    v13 = v55;
  }

LABEL_65:
  return v30;
}

- (uint64_t)_processJobsFromFramebuffer:(uint64_t)a3 usingInputSampleBuffer:(uint64_t)a4 inferencePropagationHandler:(__int128 *)a5 atExecutionTime:(void *)a6 forConnection:
{
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *group;
  uint64_t v19;
  _QWORD block[12];
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v19 = result;
  if (result)
  {
    if (!atomic_load(a2 + 3))
    {
      group = objc_msgSend(a6, "coordinationGroup");
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v8 = (void *)objc_msgSend(a2, "jobs");
      result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (result)
      {
        v9 = result;
        v10 = 0;
        v11 = *(_QWORD *)v28;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v28 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
            v14 = atomic_load((unsigned __int8 *)(v13 + 22));
            if (v14 == 1)
            {
              v15 = *(unsigned __int8 *)(v13 + 20);
              if (v15 != v10)
              {
                v16 = -[BWInferenceScheduler _queueForJob:fromConnection:](v19, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12), a6);
                v17 = objc_msgSend(a6, "completionQueue");
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __133__BWInferenceScheduler__processJobsFromFramebuffer_usingInputSampleBuffer_inferencePropagationHandler_atExecutionTime_forConnection___block_invoke;
                block[3] = &unk_1E4925470;
                block[4] = a2;
                block[5] = group;
                block[10] = v13;
                block[11] = a3;
                v25 = *a5;
                v26 = *((_QWORD *)a5 + 2);
                block[6] = v17;
                block[7] = v19;
                block[8] = a6;
                block[9] = a4;
                dispatch_group_async(group, v16, block);
                v10 = v15;
              }
            }
            ++v12;
          }
          while (v9 != v12);
          result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          v9 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

uint64_t __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_3(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  int v7;

  v3 = (void *)*a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *a2);
  v5 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE6C9DE8);
  v6 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3);
  if (v4)
    v7 = v5;
  else
    v7 = 0;
  return v7 | v6;
}

- (int)performInferencesForConnection:(unint64_t)a3 usingInputSampleBuffer:(opaqueCMSampleBuffer *)a4 attachingResultsToSampleBuffer:(opaqueCMSampleBuffer *)a5 skippingInferencesWithTypes:(id)a6
{
  os_unfair_lock_s *p_connectionsLock;
  id v12;
  unsigned int *v13;
  const __CFDictionary *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  unsigned __int8 *v29;
  int v30;
  int v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  NSObject *v36;
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  const __CFString *v46;
  opaqueCMSampleBuffer *v47;
  BWInferenceScheduler *v48;
  void *v49;
  NSObject *group;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  CMTime v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[2];
  void (*v62)(uint64_t, uint64_t);
  void *v63;
  unsigned int *v64;
  id v65;
  id v66;
  id v67;
  opaqueCMSampleBuffer *v68;
  opaqueCMSampleBuffer *v69;
  CMTime v70;
  _QWORD v71[6];
  _QWORD v72[10];
  CMTime v73;
  CMTime v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  p_connectionsLock = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);
  v48 = self;
  v12 = -[NSMapTable objectForKey:](self->_connectionsByIdentifier, "objectForKey:", a3);
  v13 = (unsigned int *)(id)objc_msgSend(v12, "framebuffer");
  group = (id)objc_msgSend(v12, "coordinationGroup");
  os_unfair_lock_unlock(p_connectionsLock);
  v14 = (const __CFDictionary *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
  memset(&v74, 0, sizeof(v74));
  if (v14)
    CMTimeMakeFromDictionary(&v74, v14);
  else
    CMSampleBufferGetPresentationTimeStamp(&v74, a4);
  v51 = v12;
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend((id)objc_msgSend(v13, "jobs"), "count"));
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = (void *)objc_msgSend(v13, "graph");
  v19 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke;
  v72[3] = &unk_1E49253D0;
  v72[4] = v15;
  v72[5] = a6;
  v73 = v74;
  v72[6] = v17;
  v72[7] = v16;
  v72[8] = v13;
  v72[9] = a4;
  objc_msgSend(v18, "visitProvidersWithBlock:", v72);
  v20 = (id)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v20, "minusSet:", v17);
  v71[0] = v19;
  v71[1] = 3221225472;
  v71[2] = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_3;
  v71[3] = &unk_1E49253F8;
  v71[4] = v15;
  v71[5] = v20;
  objc_msgSend(v13, "resetJobStatesWithPreventionBlock:", v71);
  v21 = (id)objc_msgSend((id)CMGetAttachment(a5, CFSTR("Inferences"), 0), "mutableCopy");
  if (!v21)
    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v61[0] = v19;
  v61[1] = 3221225472;
  v62 = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_4;
  v63 = &unk_1E4925420;
  v64 = v13;
  v65 = v15;
  v68 = a4;
  v69 = a5;
  v47 = a5;
  v70 = v74;
  v66 = v20;
  v67 = v21;
  v49 = v21;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v22 = (void *)objc_msgSend(v13, "jobs", CFSTR("Inferences"));
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v58 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        v28 = *(void **)(v27 + 8);
        v29 = (unsigned __int8 *)(v27 + 22);
        v30 = atomic_load((unsigned __int8 *)(v27 + 22));
        if (v30 == 1)
        {
          v32 = (void *)objc_msgSend(*(id *)v27, "extractable");
          if (!v32)
            continue;
          while (1)
          {
            v33 = __ldaxr(v29);
            if (v33 != 1)
              break;
            if (!__stlxr(2u, v29))
            {
              v34 = objc_msgSend(v32, "extractFromSampleBuffer:usingVideoRequirements:metadataRequirements:toStorage:", a4, 0, 0, v28);
              if (!v34)
              {
LABEL_20:
                v62((uint64_t)v61, v27);
                objc_msgSend(v28, "clear");
                goto LABEL_22;
              }
              v37 = v34;
              v36 = group;
              v35 = v51;
              goto LABEL_37;
            }
          }
        }
        else
        {
          if (v30 != 4)
            continue;
          while (1)
          {
            v31 = __ldaxr(v29);
            if (v31 != 4)
              break;
            if (!__stlxr(2u, v29))
              goto LABEL_20;
          }
        }
        __clrex();
LABEL_22:
        ;
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
    }
    while (v24);
  }
  v56 = v74;
  v35 = v51;
  -[BWInferenceScheduler _processJobsFromFramebuffer:usingInputSampleBuffer:inferencePropagationHandler:atExecutionTime:forConnection:]((uint64_t)v48, v13, (uint64_t)a4, (uint64_t)v61, (__int128 *)&v56.value, v51);
  v36 = group;
  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  v37 = atomic_load(v13 + 3);
  if (v37)
  {
LABEL_37:
    v43 = v49;
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v38 = (void *)objc_msgSend(v13, "jobs");
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v75, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v53;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v53 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j) + 8), "clear");
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v75, 16);
      }
      while (v40);
    }
    v43 = v49;
    if (objc_msgSend(v49, "count"))
    {
      v44 = (void *)objc_msgSend(v49, "copy");
      CMSetAttachment(v47, v46, v44, 1u);

    }
    v37 = 0;
  }

  return v37;
}

uint64_t __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  __CFString *v6;
  uint64_t result;
  uint64_t v8;
  id *v9;
  void *v10;
  _QWORD v11[6];
  __int128 v12;
  uint64_t v13;

  v6 = (__CFString *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  result = objc_msgSend(a2, "conformsToProtocol:", &unk_1EE6C9DE8);
  if (!(_DWORD)result)
    goto LABEL_14;
  if (!v6)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count")
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "inferenceType"))))
    {
      v6 = CFSTR("ClientRequest");
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 72);
      v12 = *(_OWORD *)(a1 + 80);
      v13 = *(_QWORD *)(a1 + 96);
      v6 = (__CFString *)objc_msgSend(a2, "preventionReasonWithSampleBuffer:executionTime:", v8, &v12);
      if (!v6)
        goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, a2);
  }
LABEL_9:
  if (objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2) || !objc_msgSend(a2, "mustExecuteWhenAllowed"))
    v9 = (id *)(a1 + 56);
  else
    v9 = (id *)(a1 + 48);
  result = objc_msgSend(*v9, "unionSet:", a3);
LABEL_14:
  if (v6)
  {
    v10 = (void *)objc_msgSend(*(id *)(a1 + 64), "graph");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_2;
    v11[3] = &unk_1E49253A8;
    v11[4] = *(_QWORD *)(a1 + 32);
    v11[5] = v6;
    return objc_msgSend(v10, "enumerateVideoDestinationsFromJob:withBlock:", a2, v11);
  }
  return result;
}

uint64_t __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), a3);
}

- (unint64_t)registerInferenceConnection
{
  BWInferenceSchedulerConnection *v3;
  unint64_t v4;

  v3 = -[BWInferenceSchedulerConnection initWithInferenceTargetQueue:scalingTargetQueue:submissionTargetQueue:completionTargetQueue:]([BWInferenceSchedulerConnection alloc], "initWithInferenceTargetQueue:scalingTargetQueue:submissionTargetQueue:completionTargetQueue:", self->_inferenceWorkloop, self->_scalingWorkloop, self->_submissionWorkloop, self->_completionWorkloop);
  v4 = -[BWInferenceSchedulerConnection identifier](v3, "identifier");
  os_unfair_lock_lock(&self->_connectionsLock);
  -[NSMapTable setObject:forKey:](self->_connectionsByIdentifier, "setObject:forKey:", v3, v4);
  os_unfair_lock_unlock(&self->_connectionsLock);

  return v4;
}

- (OS_dispatch_queue)metalSubmissionQueue
{
  return self->_metalSubmissionQueue;
}

- (OS_dispatch_queue)metalCompletionQueue
{
  return self->_metalCompletionQueue;
}

- (BWInferenceScheduler)init
{
  BWInferenceScheduler *v2;
  BWInferenceScheduler *v3;
  NSObject *inactive;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWInferenceScheduler;
  v2 = -[BWInferenceScheduler init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_connectionsLock._os_unfair_lock_opaque = 0;
    v2->_connectionsByIdentifier = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 0);
    FigThreadGetMachThreadPriorityValue();
    inactive = dispatch_workloop_create_inactive("com.apple.coremedia.inference");
    v3->_inferenceWorkloop = (OS_dispatch_workloop *)inactive;
    dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v3->_inferenceWorkloop);
    FigThreadGetMachThreadPriorityValue();
    v5 = dispatch_workloop_create_inactive("com.apple.coremedia.inference-scaling");
    v3->_scalingWorkloop = (OS_dispatch_workloop *)v5;
    dispatch_workloop_set_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v3->_scalingWorkloop);
    FigThreadGetMachThreadPriorityValue();
    v6 = dispatch_workloop_create_inactive("com.apple.coremedia.inference-submission");
    v3->_submissionWorkloop = (OS_dispatch_workloop *)v6;
    dispatch_workloop_set_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v3->_submissionWorkloop);
    FigThreadGetMachThreadPriorityValue();
    v7 = dispatch_workloop_create_inactive("com.apple.coremedia.inference-completion");
    v3->_completionWorkloop = (OS_dispatch_workloop *)v7;
    dispatch_workloop_set_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate((dispatch_object_t)v3->_completionWorkloop);
    v3->_metalSubmissionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority();
    v3->_metalCompletionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateTargetingPThreadRootQueueWithPriority();
  }
  return v3;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  os_unfair_lock_s *p_connectionsLock;
  objc_super v4;

  p_connectionsLock = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);

  os_unfair_lock_unlock(p_connectionsLock);
  dispatch_release((dispatch_object_t)self->_inferenceWorkloop);
  dispatch_release((dispatch_object_t)self->_scalingWorkloop);
  dispatch_release((dispatch_object_t)self->_submissionWorkloop);
  dispatch_release((dispatch_object_t)self->_completionWorkloop);
  dispatch_release((dispatch_object_t)self->_metalSubmissionQueue);
  dispatch_release((dispatch_object_t)self->_metalCompletionQueue);
  v4.receiver = self;
  v4.super_class = (Class)BWInferenceScheduler;
  -[BWInferenceScheduler dealloc](&v4, sel_dealloc);
}

- (void)unregisterInferenceConnection:(unint64_t)a3
{
  os_unfair_lock_s *p_connectionsLock;

  p_connectionsLock = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);
  -[NSMapTable removeObjectForKey:](self->_connectionsByIdentifier, "removeObjectForKey:", a3);
  os_unfair_lock_unlock(p_connectionsLock);
}

void __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_4(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BWInferenceResult *v14;
  BWInferenceResult *v15;
  id v16;
  BWInferenceResult *v17;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[6];

  v4 = (unsigned __int8 *)(a2 + 22);
  do
  {
    v5 = __ldaxr(v4);
    if (v5 != 2)
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(3u, v4));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v6 = *(id *)a2;
  v7 = *(void **)(a2 + 8);
  v8 = (void *)objc_msgSend(*(id *)a2, "propagatable");
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "graph");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_5;
  v20[3] = &unk_1E49253A8;
  v20[4] = *(_QWORD *)(a1 + 32);
  v20[5] = v7;
  objc_msgSend(v9, "enumerateVideoDestinationsFromJob:withBlock:", v6, v20);
  if (v8)
  {
    v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Scheduling")) & 1) == 0)
    {
      v11 = objc_msgSend(v6, "type");
      v12 = objc_msgSend(v7, "inferenceStorage");
      if (v10 || (v13 = v12, (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v6) & 1) != 0))
      {
        v14 = [BWInferenceResult alloc];
        v18 = *(_OWORD *)(a1 + 80);
        v19 = *(_QWORD *)(a1 + 96);
        v15 = -[BWInferenceResult initWithInferenceType:preventionReason:atTimestamp:](v14, "initWithInferenceType:preventionReason:atTimestamp:", v11, v10, &v18);
      }
      else
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v8, "propagateInferenceResultsToInferenceDictionary:usingStorage:inputSampleBuffer:propagationSampleBuffer:", v16, v13, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
        v17 = [BWInferenceResult alloc];
        v18 = *(_OWORD *)(a1 + 80);
        v19 = *(_QWORD *)(a1 + 96);
        v15 = -[BWInferenceResult initWithInferenceType:inferences:atTimestamp:](v17, "initWithInferenceType:inferences:atTimestamp:", v11, v16, &v18);

      }
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11));

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __137__BWInferenceScheduler_performInferencesForConnection_usingInputSampleBuffer_attachingResultsToSampleBuffer_skippingInferencesWithTypes___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned int a4, void *a5)
{
  uint64_t result;
  unsigned __int8 *v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unsigned __int8 *v16;
  int v17;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "jobs"), "jobAtIndex:", a4);
  v9 = (unsigned __int8 *)(result + 22);
  if (!atomic_load((unsigned __int8 *)(result + 22)))
  {
    v11 = result;
    v12 = *(void **)(result + 8);
    v13 = objc_msgSend(*(id *)(a1 + 40), "pixelBufferForRequirement:", a2);
    if (v13
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (v13 = objc_msgSend(*(id *)(a1 + 40), "pixelBufferForRequirement:", objc_msgSend(a2, "uncompressedRequirement"))) != 0|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& (v13 = objc_msgSend(*(id *)(a1 + 40), "pixelBufferForRequirement:", objc_msgSend(a2, "sourceVideoRequirement"))) != 0)
    {
      objc_msgSend(v12, "setPixelBuffer:forRequirement:", v13, a5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v12, "setPixelBuffer:forRequirement:", v13, objc_msgSend(a5, "uncompressedRequirement"));
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v15 = -31717;
      v14 = 1;
    }
    result = objc_msgSend(v12, "setInputSampleBufferAttachments:", objc_msgSend(*(id *)(a1 + 40), "inputSampleBufferAttachments"));
    if ((v14 & 1) != 0)
    {
      atomic_store(v15, (unsigned int *)(*(_QWORD *)(a1 + 32) + 12));
    }
    else
    {
      v16 = (unsigned __int8 *)(v11 + 23);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (v17 == 1)
      {
        while (!__ldaxr(v9))
        {
          if (!__stlxr(1u, v9))
            return result;
        }
        __clrex();
      }
    }
  }
  return result;
}

- (uint64_t)_queueForJob:(void *)a3 fromConnection:
{
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  if (a1)
  {
    switch(*(_BYTE *)(a2 + 20))
    {
      case 0:
        v5 = (void *)MEMORY[0x1E0C99DA0];
        v6 = *MEMORY[0x1E0C99750];
        v7 = CFSTR("Attemped to get a target queue for a job with BWInferenceSchedulerJobTypeInvalid");
        goto LABEL_10;
      case 1:
        v5 = (void *)MEMORY[0x1E0C99DA0];
        v6 = *MEMORY[0x1E0C99750];
        v7 = CFSTR("Attempted to get a target queue for a job with BWInferenceSchedulerJobTypeExtractor. Extractors are expected to run synchronously on the calling thread");
LABEL_10:
        objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0));
      case 2:
        if (objc_msgSend(*(id *)a2, "submittable"))
          return objc_msgSend(a3, "submissionQueue");
        else
          return objc_msgSend(a3, "inferenceQueue");
      case 3:
        return objc_msgSend(a3, "scalingQueue");
      default:
        return 0;
    }
  }
  return 0;
}

uint64_t __133__BWInferenceScheduler__processJobsFromFramebuffer_usingInputSampleBuffer_inferencePropagationHandler_atExecutionTime_forConnection___block_invoke(uint64_t result)
{
  uint64_t v2;
  unsigned __int8 *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[11];
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  _QWORD *v25;
  uint64_t v26;

  if (!atomic_load((unsigned int *)(*(_QWORD *)(result + 32) + 12)))
  {
    v2 = result;
    v3 = (unsigned __int8 *)(*(_QWORD *)(result + 80) + 22);
    do
    {
      v4 = __ldaxr(v3);
      if (v4 != 1)
      {
        __clrex();
        return result;
      }
    }
    while (__stlxr(2u, v3));
    dispatch_group_enter(*(dispatch_group_t *)(result + 40));
    v6 = *(_QWORD *)(v2 + 80);
    v5 = *(_QWORD *)(v2 + 88);
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __133__BWInferenceScheduler__processJobsFromFramebuffer_usingInputSampleBuffer_inferencePropagationHandler_atExecutionTime_forConnection___block_invoke_2;
    v16[3] = &unk_1E4925448;
    v8 = *(_QWORD *)(v2 + 48);
    v9 = *(_QWORD *)(v2 + 32);
    v10 = *(_QWORD *)(v2 + 40);
    v16[4] = *(_QWORD *)(v2 + 56);
    v16[5] = v9;
    v18 = *(_QWORD *)(v2 + 112);
    v11 = *(_QWORD *)(v2 + 64);
    v16[8] = *(_QWORD *)(v2 + 72);
    v16[9] = v5;
    v17 = *(_OWORD *)(v2 + 96);
    v16[10] = v6;
    v16[6] = v11;
    v16[7] = v10;
    v14 = *(_OWORD *)(v2 + 96);
    v15 = *(_QWORD *)(v2 + 112);
    v12 = *(_QWORD *)(v6 + 8);
    v13 = (void *)objc_msgSend(*(id *)v6, "submittable");
    result = objc_msgSend(*(id *)v6, "executable");
    if (v13)
    {
      v21 = v7;
      v22 = 3221225472;
      v23 = __scheduler_job_invoke_block_invoke;
      v24 = &unk_1E4925498;
      v25 = v16;
      v26 = v6;
      v19 = v14;
      v20 = v15;
      return objc_msgSend(v13, "submitForSampleBuffer:usingStorage:withSubmissionTime:workQueue:completionHandler:", v5, v12, &v19, v8, &v21);
    }
    else if (result)
    {
      v21 = v7;
      v22 = 3221225472;
      v23 = __scheduler_job_invoke_block_invoke_2;
      v24 = &unk_1E4925498;
      v25 = v16;
      v26 = v6;
      v19 = v14;
      v20 = v15;
      return objc_msgSend((id)result, "executeOnSampleBuffer:usingStorage:withExecutionTime:completionHandler:", v5, v12, &v19, &v21);
    }
  }
  return result;
}

void __133__BWInferenceScheduler__processJobsFromFramebuffer_usingInputSampleBuffer_inferencePropagationHandler_atExecutionTime_forConnection___block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  if (a2)
  {
    atomic_store(a2, (unsigned int *)(*(_QWORD *)(a1 + 40) + 12));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(_OWORD *)(a1 + 88);
    v9 = *(_QWORD *)(a1 + 104);
    -[BWInferenceScheduler _processJobsFromFramebuffer:usingInputSampleBuffer:inferencePropagationHandler:atExecutionTime:forConnection:](v3, v4, v5, v6, &v8, v7);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 80) + 8), "clear");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

@end
