@implementation BWDeferredProcessingContainer

uint64_t __59__BWDeferredProcessingContainer_hasBufferForType_portType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  result = objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(a2, "bufferType") == *(_QWORD *)(a1 + 40);
  return result;
}

- (id)copyDictionaryForTag:(id)a3 err:(int *)a4
{
  return -[BWDeferredProcessingContainer copyDictionaryForTag:customClasses:err:](self, "copyDictionaryForTag:customClasses:err:", a3, 0, a4);
}

- (id)copyDictionaryForTag:(id)a3 customClasses:(id)a4 err:(int *)a5
{
  _DWORD *v9;
  void *v10;
  int v11;
  int v13;

  v13 = 0;
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v10 = (void *)-[BWDeferredProcessingContainer _copyObjectForTag:customClasses:err:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4, &v13);
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (*v9 == 1)
      kdebug_trace();
  }
  else
  {
    v13 = -16132;
  }
  v11 = v13;
  if (a5)
    *a5 = v13;
  if (v11)
  {

    return 0;
  }
  return v10;
}

- (uint64_t)_copyObjectForTag:(uint64_t)a3 customClasses:(int *)a4 err:
{
  _DWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v13;

  if (!a1)
    return 0;
  v13 = 0;
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 16));
  v9 = -[BWDeferredContainer _intermediateForTag:](a1, a2);
  if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = objc_msgSend(v10, "fetchWithCustomClassesAndRetain:err:", a3, &v13);
  }
  else
  {
    v11 = 0;
    v13 = -16136;
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 16));
  if (a4)
    *a4 = v13;
  if (*v8 == 1)
    kdebug_trace();
  return v11;
}

- (BWPhotoManifest)photoManifest
{
  return self->_photoManifest;
}

- (BWDeferredProcessingContainer)initWithApplicationID:(id)a3 resolvedSettings:(id)a4 unresolvedSettings:(id)a5 pipelineParameters:(id)a6 intermediates:(id)a7 photoDescriptors:(id)a8
{
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWDeferredProcessingContainer;
  return -[BWDeferredContainer initWithApplicationID:resolvedSettings:unresolvedSettings:pipelineParameters:intermediates:photoDescriptors:](&v9, sel_initWithApplicationID_resolvedSettings_unresolvedSettings_pipelineParameters_intermediates_photoDescriptors_, a3, a4, a5, a6, a7, a8);
}

- (BOOL)hasBufferForType:(unint64_t)a3 portType:(id)a4
{
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  _QWORD v13[6];

  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__BWDeferredProcessingContainer_hasBufferForType_portType___block_invoke;
  v13[3] = &unk_1E4923AA8;
  v13[4] = a4;
  v13[5] = a3;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](intermediates, "indexOfObjectPassingTest:", v13);
  v11 = v9 != 0x7FFFFFFFFFFFFFFFLL
     && (v10 = v9, v9 < -[NSMutableArray count](self->super._intermediates, "count"))
     && -[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v10) != 0;
  pthread_rwlock_unlock(p_lock);
  return v11;
}

+ (unsigned)maxProcessingCount
{
  return 10;
}

- (BWDeferredProcessingContainer)initWithApplicationID:(id)a3 captureRequestIdentifier:(id)a4 baseFolderURL:(id)a5 openForPeeking:(BOOL)a6 err:(int *)a7
{
  BWDeferredProcessingContainer *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  uint64_t v28;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  BWStillImageCaptureSettings *v34;
  uint64_t v35;
  BWDeferredPipelineParameters *v36;
  uint64_t v37;
  FigCaptureStillImageSettings *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  OS_dispatch_queue **p_bufferPrefetchQueue;
  OS_dispatch_queue *v62;
  void *v63;
  NSMutableArray *intermediates;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  int *v77;
  NSMutableArray *obj;
  uint64_t v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[5];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  os_log_type_t type;
  int v95;
  uint64_t v96;
  objc_super v97;
  id v98;
  int v99;
  _BYTE v100[128];
  _QWORD v101[2];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v99 = 0;
  v98 = 0;
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a4, 0);
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a4, 1);
    kdebug_trace();
  }
  v97.receiver = self;
  v97.super_class = (Class)BWDeferredProcessingContainer;
  v13 = -[BWDeferredContainer initWithApplicationID:captureRequestIdentifier:baseFolderURL:queuePriority:err:](&v97, sel_initWithApplicationID_captureRequestIdentifier_baseFolderURL_queuePriority_err_, a3, a4, a5, 39, &v99);
  if (!v13)
  {
    v27 = 0;
    goto LABEL_93;
  }
  -[BWDeferredTransactionBroker openTransaction:name:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance"), "openTransaction:name:", 4, a4);
  v13->_metadataPrefetchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  v13->_bufferPrefetchQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  v99 = -[BWDeferredProcessingContainer _buildFolderStatistics]((uint64_t)v13);
  if (v99)
  {
    FigDebugAssert3();
    goto LABEL_104;
  }
  v14 = -[BWDeferredContainer _containerManifestURL]((uint64_t)v13);
  v99 = +[BWDeferredContainer validateManifestURLSize:](BWDeferredProcessingContainer, "validateManifestURLSize:", v14);
  if (v99)
  {
LABEL_104:
    v27 = 0;
    goto LABEL_95;
  }
  v77 = a7;
  v96 = 0;
  v15 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v14, 0, &v96);
  if (!v15)
  {
    v27 = 0;
    v71 = -16132;
LABEL_116:
    v99 = v71;
    goto LABEL_117;
  }
  v79 = v15;
  v16 = +[BWDeferredProcessingContainer maxProcessingCount](BWDeferredProcessingContainer, "maxProcessingCount");
  v17 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", -[BWDeferredContainer _containerSessionDataURL]((uint64_t)v13));
  if (!v17)
  {
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = &unk_1E49FA6F8;
    goto LABEL_16;
  }
  v18 = v17;
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = +[BWDeferredContainer unarchiveObject:classes:error:](BWDeferredContainer, "unarchiveObject:classes:error:", v18, objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0), &v98);
  if (!v22)
  {
    v27 = 0;
    v99 = objc_msgSend(v98, "code");
    goto LABEL_117;
  }
  v23 = v22;
  v24 = objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ProcessingCount"));
  if (!v24 || (v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_115:
    v27 = 0;
    v71 = -16140;
    goto LABEL_116;
  }
  if (v16 && objc_msgSend(v25, "unsignedIntValue") >= v16)
  {
    FigDebugAssert3();
    goto LABEL_115;
  }
  v26 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v23);
LABEL_16:
  v13->_sessionDictionary = v26;
  v13->_processingCount = objc_msgSend(v25, "longValue");
  v28 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v13->_sessionDictionary, "objectForKeyedSubscript:", CFSTR("PreviousError")), "intValue");
  v13->_previousAttemptErrorCode = v28;
  if (!a6)
  {
    if (objc_msgSend(&unk_1E4A01088, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28)))
    {
      -[NSMutableDictionary removeObjectForKey:](v13->_sessionDictionary, "removeObjectForKey:", CFSTR("PreviousError"));
      if (dword_1ECFE99F0)
      {
        v95 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else if ((objc_msgSend(a3, "isEqualToString:", 0x1E493D478) & 1) == 0)
    {
      ++v13->_processingCount;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13->_sessionDictionary, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13->_processingCount, v72, v73), CFSTR("ProcessingCount"));
    if (v13->_previousAttemptErrorCode && dword_1ECFE99F0)
    {
      v95 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _containerSessionDataURL]((uint64_t)v13), v13->_sessionDictionary, &v98))
    {
      LODWORD(v72) = 0;
      FigDebugAssert3();
      objc_msgSend(v98, "code", v72, v76);
      v27 = 0;
      v99 = FigSignalErrorAt();
      goto LABEL_117;
    }
  }
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v79, &v98);
  if (!v27)
  {
    LODWORD(v72) = 0;
    FigDebugAssert3();
    objc_msgSend(v98, "code", v72, v76);
    FigSignalErrorAt();
LABEL_117:
    a7 = v77;
    goto LABEL_95;
  }
  v31 = (void *)objc_msgSend(v27, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("Version"), &v98);
  a7 = v77;
  if (!v31)
    goto LABEL_113;
  v32 = objc_msgSend(v31, "longValue");
  v13->super._manifestVersion = v32;
  if (v32 <= 6)
  {
    v99 = -16130;
    goto LABEL_95;
  }
  v33 = -[BWDeferredContainer _stillImageCaptureSettingsURL]((uint64_t)v13);
  v34 = (BWStillImageCaptureSettings *)+[BWDeferredContainer unarchiveObjectWithURL:classes:error:](BWDeferredContainer, "unarchiveObjectWithURL:classes:error:", v33, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()), &v98);
  v13->super._stillImageCaptureSettings = v34;
  if (!v34)
  {
    v74 = v76;
    LODWORD(v72) = 0;
LABEL_111:
    FigDebugAssert3();
    objc_msgSend(v98, "code", v72, v74);
    v99 = FigSignalErrorAt();
    goto LABEL_95;
  }
  v35 = -[BWDeferredContainer _pipelineParametersURL]((uint64_t)v13);
  v36 = (BWDeferredPipelineParameters *)+[BWDeferredContainer unarchiveObjectWithURL:classes:error:](BWDeferredContainer, "unarchiveObjectWithURL:classes:error:", v35, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()), &v98);
  v13->super._pipelineParameters = v36;
  if (!v36)
    v13->super._pipelineParameters = (BWDeferredPipelineParameters *)-[BWDeferredPipelineParameters _initWithLegacyCaptureSettings:]([BWDeferredPipelineParameters alloc], v13->super._stillImageCaptureSettings);
  -[BWStillImageCaptureSettings setDeliverDeferredPhotoProxyImage:](v13->super._stillImageCaptureSettings, "setDeliverDeferredPhotoProxyImage:", 0, v72, v73);
  if ((-[BWStillImageCaptureSettings captureFlags](v13->super._stillImageCaptureSettings, "captureFlags") & 0x8000000000) != 0)
    -[BWStillImageCaptureSettings disableAWBReflow](v13->super._stillImageCaptureSettings, "disableAWBReflow");
  if ((-[BWStillImageCaptureSettings captureFlags](v13->super._stillImageCaptureSettings, "captureFlags") & 0x200000000) != 0
    && !-[BWDeferredPipelineParameters canProcessEnhancedResolution](v13->super._pipelineParameters, "canProcessEnhancedResolution"))
  {
    -[BWStillImageCaptureSettings cannotProcessDeepFusionEnhancedResolution](v13->super._stillImageCaptureSettings, "cannotProcessDeepFusionEnhancedResolution");
  }
  v37 = -[BWDeferredContainer _stillImageSettingsURL]((uint64_t)v13);
  v38 = (FigCaptureStillImageSettings *)+[BWDeferredContainer unarchiveObjectWithURL:classes:error:](BWDeferredContainer, "unarchiveObjectWithURL:classes:error:", v37, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()), &v98);
  v13->super._stillImageSettings = v38;
  if (-[FigCaptureStillImageSettings deferredPhotoFinalWidth](v38, "deferredPhotoFinalWidth")
    && -[FigCaptureStillImageSettings deferredPhotoFinalHeight](v13->super._stillImageSettings, "deferredPhotoFinalHeight"))
  {
    -[FigCaptureStillImageSettings setOutputWidth:](v13->super._stillImageSettings, "setOutputWidth:", -[FigCaptureStillImageSettings deferredPhotoFinalWidth](v13->super._stillImageSettings, "deferredPhotoFinalWidth"));
    -[FigCaptureStillImageSettings setOutputHeight:](v13->super._stillImageSettings, "setOutputHeight:", -[FigCaptureStillImageSettings deferredPhotoFinalHeight](v13->super._stillImageSettings, "deferredPhotoFinalHeight"));
  }
  if (!v13->super._stillImageSettings)
  {
    v74 = v76;
    LODWORD(v72) = 0;
    goto LABEL_111;
  }
  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  v41 = (void *)objc_msgSend(v27, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0), CFSTR("Intermediates"), &v98);
  if (!v41)
    goto LABEL_113;
  v42 = v41;
  v13->super._intermediates = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v41, "count"));
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v91 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v47, "setSettingsID:", -[FigCaptureStillImageSettings settingsID](v13->super._stillImageSettings, "settingsID"));
        -[NSMutableArray addObject:](v13->super._intermediates, "addObject:", v47);
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
    }
    while (v44);
  }
  if (v13->super._manifestVersion == 7)
  {
    v99 = -[BWDeferredProcessingContainer _convertIntermediatesToCurrentCompatibleVersion]((uint64_t)v13);
    if (v99)
      goto LABEL_95;
  }
  v48 = (void *)MEMORY[0x1E0C99E60];
  v49 = objc_opt_class();
  v50 = objc_msgSend((id)objc_msgSend(v27, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0), CFSTR("PhotoDescriptors"), &v98), "mutableCopy");
  v13->super._photoDescriptors = (NSMutableArray *)v50;
  if (!v50)
  {
LABEL_113:
    v99 = objc_msgSend(v98, "code", v72, v73);
    goto LABEL_95;
  }
  v13->_photoManifest = -[BWPhotoManifest initWithDescriptors:captureRequestIdentifier:]([BWPhotoManifest alloc], "initWithDescriptors:captureRequestIdentifier:", v13->super._photoDescriptors, v13->super._captureRequestIdentifier);
  v80 = (void *)-[BWDeferredContainer _intermediateFolderURL]((uint64_t)v13);
  v51 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtPath:error:", objc_msgSend(v80, "path"), &v98);
  if (!v51)
  {
    v73 = v76;
    LODWORD(v72) = 0;
    FigDebugAssert3();
    goto LABEL_113;
  }
  v75 = v27;
  v52 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v51);
  objc_msgSend(v52, "sortUsingSelector:", sel_caseInsensitiveCompare_);
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v13->super._intermediates;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
  if (!v53)
    goto LABEL_77;
  v54 = v53;
  v55 = *(_QWORD *)v87;
  while (2)
  {
    for (j = 0; j != v54; ++j)
    {
      if (*(_QWORD *)v87 != v55)
        objc_enumerationMutation(obj);
      v57 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * j);
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __113__BWDeferredProcessingContainer_initWithApplicationID_captureRequestIdentifier_baseFolderURL_openForPeeking_err___block_invoke;
      v85[3] = &unk_1E4923A80;
      v85[4] = v57;
      v58 = objc_msgSend(v52, "indexOfObjectPassingTest:", v85);
      if (v58 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_100:
        v99 = -16132;
LABEL_102:
        a7 = v77;
        v27 = v75;
        goto LABEL_95;
      }
      v59 = (void *)objc_msgSend(v52, "objectAtIndexedSubscript:", v58);
      if (objc_msgSend(v59, "hasSuffix:", CFSTR("heif"))
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v60 = -[BWStillImageCaptureSettings captureFlags](v13->super._stillImageCaptureSettings, "captureFlags");
        p_bufferPrefetchQueue = &v13->_bufferPrefetchQueue;
        if ((v60 & 0x100000000) != 0)
        {
          v62 = 0;
          goto LABEL_74;
        }
      }
      else
      {
        if (!objc_msgSend(v59, "hasSuffix:", CFSTR("plist"))
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          if (!objc_msgSend(v59, "hasSuffix:", CFSTR("plist"))
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            if (!objc_msgSend(v59, "hasSuffix:", CFSTR("plist"))
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (!objc_msgSend(v59, "hasSuffix:", CFSTR("jpeg")))
                goto LABEL_100;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_100;
            }
          }
        }
        -[BWStillImageCaptureSettings captureFlags](v13->super._stillImageCaptureSettings, "captureFlags");
        p_bufferPrefetchQueue = &v13->_metadataPrefetchQueue;
      }
      v62 = *p_bufferPrefetchQueue;
LABEL_74:
      v63 = (void *)MEMORY[0x1E0C99E98];
      v101[0] = objc_msgSend(v80, "path");
      v101[1] = v59;
      v99 = objc_msgSend(v57, "setURL:prefetchQueue:", objc_msgSend(v63, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2)), v62);
      if (v99)
      {
        FigDebugAssert3();
        goto LABEL_102;
      }
    }
    v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v102, 16);
    if (v54)
      continue;
    break;
  }
LABEL_77:
  if ((-[BWStillImageCaptureSettings captureFlags](v13->super._stillImageCaptureSettings, "captureFlags") & 0x800) != 0
    && !-[BWDeferredProcessingContainer hasBufferForType:portType:](v13, "hasBufferForType:portType:", 2001, -[BWStillImageCaptureSettings masterPortType](v13->super._stillImageCaptureSettings, "masterPortType")))
  {
    -[FigCaptureStillImageSettings cannotProcessDepthPhotos](v13->super._stillImageSettings, "cannotProcessDepthPhotos");
    -[BWStillImageCaptureSettings cannotProcessDepthPhotos](v13->super._stillImageCaptureSettings, "cannotProcessDepthPhotos");
    -[BWPhotoManifest cannotProcessDepthPhotos](v13->_photoManifest, "cannotProcessDepthPhotos");
    -[NSMutableArray removeAllObjects](v13->super._photoDescriptors, "removeAllObjects");
    -[NSMutableArray addObjectsFromArray:](v13->super._photoDescriptors, "addObjectsFromArray:", -[BWPhotoManifest photoDescriptors](v13->_photoManifest, "photoDescriptors"));
  }
  if ((-[BWStillImageCaptureSettings captureFlags](v13->super._stillImageCaptureSettings, "captureFlags") & 0x4000000000) != 0)
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    intermediates = v13->super._intermediates;
    v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v82;
      do
      {
        for (k = 0; k != v66; ++k)
        {
          if (*(_QWORD *)v82 != v67)
            objc_enumerationMutation(intermediates);
          v69 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend((id)objc_msgSend(v69, "portType"), "isEqualToString:", -[BWStillImageCaptureSettings masterPortType](v13->super._stillImageCaptureSettings, "masterPortType")) & 1) == 0&& objc_msgSend(v69, "bufferType") == 1)
          {
            -[BWStillImageCaptureSettings setLearnedNRStereoPhotoFrameFlag:](v13->super._stillImageCaptureSettings, "setLearnedNRStereoPhotoFrameFlag:", objc_msgSend(v69, "captureFrameFlags") & 0x14);
          }
        }
        v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v81, v100, 16);
      }
      while (v66);
    }
  }
  a7 = v77;
  v27 = v75;
LABEL_93:
  v99 = -[BWDeferredContainer _validate]((uint64_t)v13);
  if (v99)
    FigDebugAssert3();
LABEL_95:

  if (a7)
    *a7 = v99;
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  return v13;
}

- (uint64_t)_buildFolderStatistics
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  if (!result)
    return result;
  v2 = result;
  v17 = 0;
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(*(id *)(result + 216), "path"), &v17);
  if (!v3)
  {
    v16 = v1;
    LODWORD(v15) = 0;
LABEL_14:
    FigDebugAssert3();
    objc_msgSend(v17, "code", v15, v16);
    FigSignalErrorAt();
    return 0;
  }
  v4 = (void *)v3;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
  v6 = v5;
  objc_msgSend((id)objc_msgSend(v4, "fileCreationDate"), "timeIntervalSince1970");
  *(_DWORD *)(v2 + 336) = (v6 - v7);
  v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "subpathsOfDirectoryAtPath:error:", objc_msgSend(*(id *)(v2 + 216), "path"), &v17);
  if (!v8)
  {
    v16 = v1;
    LODWORD(v15) = 0;
    goto LABEL_14;
  }
  v9 = (void *)objc_msgSend(v8, "objectEnumerator");
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "nextObject");
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      while (1)
      {
        v14 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + 216), "path"), "stringByAppendingPathComponent:", v12), &v17);
        if (!v14)
          break;
        v13 += objc_msgSend(v14, "fileSize");
        v12 = objc_msgSend(v10, "nextObject");
        if (!v12)
          goto LABEL_11;
      }
      v16 = v1;
      LODWORD(v15) = 0;
      goto LABEL_14;
    }
    v13 = 0;
LABEL_11:
    result = 0;
    *(_QWORD *)(v2 + 328) = v13;
  }
  else
  {
    FigDebugAssert3();
    return 4294951164;
  }
  return result;
}

- (uint64_t)_convertIntermediatesToCurrentCompatibleVersion
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **p_vtable;
  uint64_t i;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  BWDeferredInferenceArrayIntermediate *v23;
  id v24;
  id v25;
  BWDeferredInferenceBufferIntermediate *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  BWDeferredInferenceArrayIntermediate *v35;
  uint64_t v36;
  void *context;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v48 = 0;
    v39 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(result + 272));
    context = (void *)MEMORY[0x1A858DD40]();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v2 = *(void **)(v1 + 272);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v3)
    {
      v4 = v3;
      v41 = 0;
      v5 = *(_QWORD *)v45;
      v38 = 1;
      p_vtable = BWVisionInferenceStorage.vtable;
      v43 = v2;
      v40 = v1;
      v42 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v45 != v5)
            objc_enumerationMutation(v2);
          if (*(uint64_t *)(v1 + 240) <= 7)
          {
            v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v9 = objc_msgSend(v8, "bufferType") - 1001;
              v10 = CFSTR("PersonSemanticsSkin");
              switch(v9)
              {
                case 0:
                  goto LABEL_20;
                case 1:
                case 2:
                  goto LABEL_21;
                case 3:
                  v10 = CFSTR("PersonSegmentationMask");
LABEL_20:
                  if (v10)
                    goto LABEL_21;
                  continue;
                case 4:
                  v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), 0x1E4951318, v38);
                  v38 = (v38 + 1);
                  if (!v33)
                    continue;
LABEL_21:
                  v24 = (id)objc_msgSend(v8, "fetchAndRetain:", &v48);
                  if (v48)
                    goto LABEL_36;
                  v25 = v24;
                  v26 = [BWDeferredInferenceBufferIntermediate alloc];
                  v27 = objc_msgSend(v8, "tag");
                  v28 = objc_msgSend(v8, "metadataTag");
                  v29 = objc_msgSend(v8, "portType");
                  v30 = objc_msgSend(v8, "compressionProfile");
                  v31 = objc_msgSend(v8, "URL");
                  v32 = v28;
                  v1 = v40;
                  v23 = -[BWDeferredInferenceBufferIntermediate initWithBuffer:tag:metadataTag:inferenceAttachedMediaKey:portType:compressionProfile:URL:](v26, "initWithBuffer:tag:metadataTag:inferenceAttachedMediaKey:portType:compressionProfile:URL:", v25, v27, v32, CFSTR("PersonSemanticsSkin"), v29, v30, v31);
                  break;
                default:
                  if ((unint64_t)CFSTR("PersonSemanticsSkin") >= 2
                    || objc_msgSend(v8, "pixelFormat") != 1651519798)
                  {
                    continue;
                  }
                  v13 = (id)objc_msgSend(v8, "fetchAndRetain:", &v48);
                  if (v48)
                    goto LABEL_36;
                  v14 = v13;
                  v15 = objc_alloc((Class)(p_vtable + 162));
                  v16 = objc_msgSend(v8, "tag");
                  v17 = objc_msgSend(v8, "captureFrameFlags");
                  v18 = objc_msgSend(v8, "metadataTag");
                  v19 = objc_msgSend(v8, "portType");
                  v20 = objc_msgSend(v8, "compressionProfile");
                  v21 = objc_msgSend(v8, "URL");
                  LODWORD(v36) = v20;
                  v22 = v17;
                  v1 = v40;
                  v23 = (BWDeferredInferenceArrayIntermediate *)objc_msgSend(v15, "initWithBuffer:tag:bufferType:captureFrameFlags:metadataTag:portType:compressionProfile:URL:", v14, v16, 37, v22, v18, v19, v36, v21);
                  break;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              if (objc_msgSend((id)objc_msgSend(v8, "tag"), "hasPrefix:", CFSTR("LowResPersonInstanceConfidences-")))
              {
                v11 = (void *)MEMORY[0x1E0C99E60];
                v12 = CFSTR("LowResPersonInstanceConfidences");
              }
              else if (objc_msgSend((id)objc_msgSend(v8, "tag"), "hasPrefix:", CFSTR("LowResPersonInstanceBoundingBoxes-")))
              {
                v11 = (void *)MEMORY[0x1E0C99E60];
                v12 = CFSTR("LowResPersonInstanceBoundingBoxes");
              }
              else if (objc_msgSend((id)objc_msgSend(v8, "tag"), "hasPrefix:", CFSTR("SkinToneClassifications-")))
              {
                v11 = (void *)MEMORY[0x1E0C99E60];
                getVNFaceObservationClass();
                v12 = CFSTR("VisionFaceClassificationObservation");
              }
              else
              {
                if (!objc_msgSend((id)objc_msgSend(v8, "tag"), "hasPrefix:", CFSTR("FaceObservations-")))
                  continue;
                v11 = (void *)MEMORY[0x1E0C99E60];
                getVNFaceObservationClass();
                v12 = CFSTR("VisionExtendedFaceObservations");
              }
              v34 = (id)objc_msgSend(v8, "fetchWithCustomClassesAndRetain:err:", objc_msgSend(v11, "setWithObject:", objc_opt_class()), &v48);
              if (v48)
                goto LABEL_36;
              v23 = -[BWDeferredInferenceArrayIntermediate initWithArray:tag:inferenceAttachmentKey:portType:URL:]([BWDeferredInferenceArrayIntermediate alloc], "initWithArray:tag:inferenceAttachmentKey:portType:URL:", v34, objc_msgSend(v8, "tag"), v12, 0, objc_msgSend(v8, "URL"));
            }
            v35 = v23;
            if (v23)
            {
              -[BWDeferredIntermediate setSettingsID:](v23, "setSettingsID:", objc_msgSend(*(id *)(v1 + 256), "settingsID"));
              objc_msgSend(v39, "setObject:atIndexedSubscript:", v35, v41 + i);

            }
            v5 = v42;
            v2 = v43;
            p_vtable = (void **)(BWVisionInferenceStorage + 24);
          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        v41 += i;
      }
      while (v4);
    }
LABEL_36:
    objc_autoreleasePoolPop(context);
    result = v48;
    if (!v48)
    {

      *(_QWORD *)(v1 + 272) = objc_msgSend(v39, "copy");
      return v48;
    }
  }
  return result;
}

uint64_t __113__BWDeferredProcessingContainer_initWithApplicationID_captureRequestIdentifier_baseFolderURL_openForPeeking_err___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "tag"), "isEqualToString:", objc_msgSend(a2, "stringByDeletingPathExtension"));
}

- (BWDeferredProcessingContainer)initWithXPCEncoding:(id)a3 applicationID:(id)a4 captureRequestIdentifier:(id)a5 baseFolderURL:(id)a6 err:(int *)a7
{
  _DWORD *v13;
  BWDeferredProcessingContainer *v14;
  void *value;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *applicationID;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  BWStillImageCaptureSettings *v25;
  FigCaptureStillImageSettings *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *intermediates;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFAllocator *v38;
  uint64_t i;
  void *v40;
  xpc_object_t v41;
  xpc_object_t v42;
  void *v43;
  void *v44;
  size_t AllocSize;
  __IOSurface *v46;
  __IOSurface *v47;
  int v48;
  double v49;
  double v50;
  double v51;
  void *v53;
  void *v54;
  uint64_t v55;
  xpc_object_t xdict;
  CVPixelBufferRef pixelBufferOut;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  int v63;
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v64 = 0;
  v63 = 0;
  v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a5, 0);
    -[BWDeferredContainer _getUUIDBytes:high:]((uint64_t)self, (uint64_t)a5, 1);
    kdebug_trace();
  }
  if (a3)
  {
    v62.receiver = self;
    v62.super_class = (Class)BWDeferredProcessingContainer;
    v14 = -[BWDeferredContainer initWithApplicationID:captureRequestIdentifier:baseFolderURL:queuePriority:err:](&v62, sel_initWithApplicationID_captureRequestIdentifier_baseFolderURL_queuePriority_err_, a4, a5, a6, 39, &v63);
    if (!v14)
    {
      value = 0;
      v16 = 0;
LABEL_52:

      if (v63)
      {

        v14 = 0;
      }
      if (*v13 == 1)
        kdebug_trace();
      return v14;
    }
    -[BWDeferredTransactionBroker openTransaction:name:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance"), "openTransaction:name:", 4, a5);
    v14->_isRemote = 1;
    value = xpc_dictionary_get_value(a3, "Container");
    if (value)
    {
      xdict = xpc_dictionary_get_value(a3, "IntermediateObjects");
      if (!xdict)
      {
        FigDebugAssert3();
        value = 0;
LABEL_61:
        v16 = 0;
        goto LABEL_63;
      }
      value = (void *)_CFXPCCreateCFObjectFromXPCObject();
      if (value)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", value, &v64);
        if (!v64)
        {
          v17 = (void *)objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("Version"), &v64);
          if (v17)
          {
            v19 = objc_msgSend(v17, "longValue");
            v14->super._manifestVersion = v19;
            if (v19 != 8)
            {
              v48 = -16130;
LABEL_44:
              v63 = v48;
              goto LABEL_52;
            }
            v18 = objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("ApplicationID"), &v64);
            applicationID = v14->super._applicationID;
            if (applicationID)
            {
              if (!-[NSString isEqualToString:](applicationID, "isEqualToString:", v18))
                goto LABEL_62;
              v21 = objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("CommitTime"), &v64);
              if (!v21)
                goto LABEL_57;
              v22 = (void *)v21;
              v23 = objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("BaseFolder"), &v64);
              if (!v23)
                goto LABEL_57;
              if ((-[NSURL isEqual:](v14->super._baseFolderURL, "isEqual:", v23) & 1) == 0)
                goto LABEL_62;
              v24 = objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("CaptureRequestIdentifier"), &v64);
              if (!v24)
                goto LABEL_57;
              if (!-[NSString isEqualToString:](v14->super._captureRequestIdentifier, "isEqualToString:", v24))
              {
LABEL_62:
                FigDebugAssert3();
                goto LABEL_63;
              }
              v25 = (BWStillImageCaptureSettings *)(id)objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("StillImageCaptureSettings"), &v64);
              v14->super._stillImageCaptureSettings = v25;
              if (v25)
              {
                v26 = (FigCaptureStillImageSettings *)(id)objc_msgSend(v16, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), CFSTR("StillImageSettings"), &v64);
                v14->super._stillImageSettings = v26;
                if (v26)
                {
                  v27 = (void *)MEMORY[0x1E0C99E60];
                  v28 = objc_opt_class();
                  v29 = objc_msgSend((id)objc_msgSend(v16, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0), CFSTR("Intermediates"), &v64), "mutableCopy");
                  v14->super._intermediates = (NSMutableArray *)v29;
                  if (v29)
                  {
                    v30 = (void *)MEMORY[0x1E0C99E60];
                    v31 = objc_opt_class();
                    v32 = objc_msgSend((id)objc_msgSend(v16, "decodeTopLevelObjectOfClasses:forKey:error:", objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0), CFSTR("PhotoDescriptors"), &v64), "mutableCopy");
                    v14->super._photoDescriptors = (NSMutableArray *)v32;
                    if (v32)
                    {
                      v53 = v16;
                      v54 = value;
                      v60 = 0u;
                      v61 = 0u;
                      v58 = 0u;
                      v59 = 0u;
                      v55 = (uint64_t)v14;
                      intermediates = v14->super._intermediates;
                      v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
                      if (v34)
                      {
                        v35 = v34;
                        v36 = 0;
                        v37 = *(_QWORD *)v59;
                        v38 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
                        while (2)
                        {
                          for (i = 0; i != v35; ++i)
                          {
                            if (*(_QWORD *)v59 != v37)
                              objc_enumerationMutation(intermediates);
                            v40 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
                            v41 = xpc_dictionary_get_value(xdict, (const char *)objc_msgSend((id)objc_msgSend(v40, "tag"), "UTF8String"));
                            if (!v41 || (v42 = xpc_dictionary_get_value(v41, "Object")) == 0)
                            {
LABEL_49:
                              FigDebugAssert3();
LABEL_50:
                              v63 = -16132;
                              v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                              v14 = (BWDeferredProcessingContainer *)v55;
                              goto LABEL_51;
                            }
                            v43 = v42;
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v44 = (void *)_CFXPCCreateCFObjectFromXPCObject();
                              objc_msgSend(v40, "setArchive:", v44);
                              AllocSize = objc_msgSend(v44, "length");

                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                goto LABEL_50;
                              pixelBufferOut = 0;
                              v46 = IOSurfaceLookupFromXPCObject(v43);
                              if (!v46)
                                goto LABEL_49;
                              v47 = v46;
                              CVPixelBufferCreateWithIOSurface(v38, v46, 0, &pixelBufferOut);
                              objc_msgSend(v40, "setBuffer:", pixelBufferOut);
                              AllocSize = IOSurfaceGetAllocSize(v47);
                              CFRelease(v47);
                              CFRelease(pixelBufferOut);
                            }
                            v36 += AllocSize;
                          }
                          v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](intermediates, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
                          if (v35)
                            continue;
                          break;
                        }
                      }
                      else
                      {
                        v36 = 0;
                      }
                      v14 = (BWDeferredProcessingContainer *)v55;
                      v63 = -[BWDeferredContainer _validate](v55);
                      if (v63)
                      {
                        FigDebugAssert3();
                      }
                      else
                      {
                        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
                        v50 = v49;
                        objc_msgSend(v22, "timeIntervalSince1970");
                        *(_DWORD *)(v55 + 336) = (v50 - v51);
                        *(_QWORD *)(v55 + 328) = v36;
                        v63 = 0;
                      }
                      v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_51:
                      v16 = v53;
                      value = v54;
                      goto LABEL_52;
                    }
                  }
                  goto LABEL_62;
                }
              }
            }
          }
LABEL_57:
          v63 = objc_msgSend(v64, "code", v18);
          goto LABEL_52;
        }
LABEL_63:
        v48 = -16132;
        goto LABEL_44;
      }
    }
    FigDebugAssert3();
    goto LABEL_61;
  }

  if (a7)
    *a7 = -16134;
  if (*v13 == 1)
    kdebug_trace();
  return 0;
}

- (void)dealloc
{
  NSObject *metadataPrefetchQueue;
  NSObject *bufferPrefetchQueue;
  objc_super v5;

  metadataPrefetchQueue = self->_metadataPrefetchQueue;
  if (metadataPrefetchQueue)
    dispatch_release(metadataPrefetchQueue);
  bufferPrefetchQueue = self->_bufferPrefetchQueue;
  if (bufferPrefetchQueue)
    dispatch_release(bufferPrefetchQueue);
  v5.receiver = self;
  v5.super_class = (Class)BWDeferredProcessingContainer;
  -[BWDeferredContainer dealloc](&v5, sel_dealloc);
}

- (__CVBuffer)copyBufferForTag:(id)a3 err:(int *)a4
{
  _DWORD *v7;
  int v9;
  int v10;

  v10 = 0;
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!a3)
  {
    FigDebugAssert3();
    v9 = -16134;
LABEL_16:
    v10 = v9;
    goto LABEL_8;
  }
  pthread_rwlock_rdlock(&self->super._lock);
  a3 = (id)-[BWDeferredContainer _intermediateForTag:]((uint64_t)self, (uint64_t)a3);
  if (!a3)
  {
LABEL_15:
    v9 = -16136;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    a3 = 0;
    goto LABEL_15;
  }
  a3 = (id)objc_msgSend(a3, "fetchAndRetain:", &v10);
  if (v10)
    FigDebugAssert3();
LABEL_8:
  pthread_rwlock_unlock(&self->super._lock);
  if (a4)
    *a4 = v10;
  if (*v7 == 1)
    kdebug_trace();
  return (__CVBuffer *)a3;
}

- (__CVBuffer)copyBufferForType:(unint64_t)a3 portType:(id)a4 metadata:(id *)a5 err:(int *)a6
{
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  __CVBuffer *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[6];
  int v21;

  v21 = 0;
  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__BWDeferredProcessingContainer_copyBufferForType_portType_metadata_err___block_invoke;
  v20[3] = &unk_1E4923AA8;
  v20[4] = a4;
  v20[5] = a3;
  v13 = -[NSMutableArray indexOfObjectPassingTest:](intermediates, "indexOfObjectPassingTest:", v20);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || (v14 = v13, v13 >= -[NSMutableArray count](self->super._intermediates, "count"))
    || !-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v14))
  {
    v16 = 0;
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  v15 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v14);
  v16 = (__CVBuffer *)objc_msgSend(v15, "tag");
  v17 = objc_msgSend(v15, "metadataTag");
  if (v16)
  {
    v16 = -[BWDeferredProcessingContainer copyBufferForTag:err:](self, "copyBufferForTag:err:", v16, &v21);
    if (v21)
    {
      FigDebugAssert3();
      goto LABEL_10;
    }
  }
  v18 = 0;
  if (a5 && v17)
    v18 = -[BWDeferredProcessingContainer copyMetadataForTag:err:](self, "copyMetadataForTag:err:", v17, &v21);
LABEL_11:
  pthread_rwlock_unlock(p_lock);
  if (a6)
    *a6 = v21;
  if (a5)
    *a5 = v18;
  return v16;
}

uint64_t __73__BWDeferredProcessingContainer_copyBufferForType_portType_metadata_err___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  result = objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(a2, "bufferType") == *(_QWORD *)(a1 + 40);
  return result;
}

- (id)copyBuffersForType:(unint64_t)a3 portType:(id)a4 metadataArray:(id *)a5 err:(int *)a6
{
  uint64_t v6;
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __CVBuffer *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  _opaque_pthread_rwlock_t *v29;
  int *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[6];
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __79__BWDeferredProcessingContainer_copyBuffersForType_portType_metadataArray_err___block_invoke;
  v35[3] = &unk_1E4923AA8;
  v35[4] = a4;
  v35[5] = a3;
  v14 = (void *)-[NSMutableArray objectsAtIndexes:](self->super._intermediates, "objectsAtIndexes:", -[NSMutableArray indexesOfObjectsPassingTest:](intermediates, "indexesOfObjectsPassingTest:", v35));
  if (objc_msgSend(v14, "count"))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (a5)
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    else
      v16 = 0;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v17)
    {
      v18 = v17;
      v29 = p_lock;
      v30 = a6;
      v19 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v32 != v19)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "tag");
          v23 = objc_msgSend(v21, "metadataTag");
          if (v22)
          {
            v24 = -[BWDeferredProcessingContainer copyBufferForTag:err:](self, "copyBufferForTag:err:", v22, &v36);
            if (v24)
              objc_msgSend(v15, "addObject:", v24);
            CVPixelBufferRelease(v24);
            if (v36)
            {
              v28 = v6;
              LODWORD(v27) = v36;
LABEL_24:
              FigDebugAssert3();
              goto LABEL_25;
            }
          }
          if (a5 && v23)
          {
            v25 = -[BWDeferredProcessingContainer copyMetadataForTag:err:](self, "copyMetadataForTag:err:", v23, &v36);
            if (v25)
              objc_msgSend(v16, "addObject:", v25);

            if (v36)
            {
              v28 = v6;
              LODWORD(v27) = v36;
              goto LABEL_24;
            }
          }
        }
        v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v18)
          continue;
        break;
      }
LABEL_25:
      p_lock = v29;
      a6 = v30;
    }
  }
  else
  {
    v16 = 0;
    v15 = 0;
  }
  pthread_rwlock_unlock(p_lock);
  if (a6)
    *a6 = v36;
  if (a5)
    *a5 = (id)objc_msgSend(v16, "copy");
  return (id)objc_msgSend(v15, "copy", v27, v28);
}

uint64_t __79__BWDeferredProcessingContainer_copyBuffersForType_portType_metadataArray_err___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  result = objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(a2, "bufferType") == *(_QWORD *)(a1 + 40);
  return result;
}

- (id)copyAttributesForBufferType:(unint64_t)a3 portType:(id)a4 err:(int *)a5
{
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  id v16;
  _QWORD v17[6];

  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__BWDeferredProcessingContainer_copyAttributesForBufferType_portType_err___block_invoke;
  v17[3] = &unk_1E4923AA8;
  v17[4] = a4;
  v17[5] = a3;
  v11 = -[NSMutableArray indexOfObjectPassingTest:](intermediates, "indexOfObjectPassingTest:", v17);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL
    && (v13 = v11,
        -[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v11))
    && (v14 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v13), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = (id)objc_msgSend(v14, "attributes");
    v12 = 0;
  }
  else
  {
    v16 = 0;
    v12 = -16136;
  }
  pthread_rwlock_unlock(p_lock);
  if (a5)
    *a5 = v12;
  return v16;
}

uint64_t __74__BWDeferredProcessingContainer_copyAttributesForBufferType_portType_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a2, "bufferType") == *(_QWORD *)(a1 + 40))
    return objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(_QWORD *)(a1 + 32));
  else
    return 0;
}

- (id)copyMetadataForBufferTag:(id)a3 err:(int *)a4
{
  _DWORD *v7;
  NSMutableArray *intermediates;
  uint64_t v9;
  int v10;
  _QWORD v12[5];

  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (a3)
  {
    pthread_rwlock_rdlock(&self->super._lock);
    intermediates = self->super._intermediates;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__BWDeferredProcessingContainer_copyMetadataForBufferTag_err___block_invoke;
    v12[3] = &unk_1E4923A30;
    v12[4] = a3;
    v9 = -[NSMutableArray indexOfObjectPassingTest:](intermediates, "indexOfObjectPassingTest:", v12);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      a3 = 0;
    else
      a3 = (id)-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v9);
    v10 = 0;
  }
  else
  {
    FigDebugAssert3();
    v10 = -16134;
  }
  pthread_rwlock_unlock(&self->super._lock);
  if (a4)
    *a4 = v10;
  if (*v7 == 1)
    kdebug_trace();
  return a3;
}

uint64_t __62__BWDeferredProcessingContainer_copyMetadataForBufferTag_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(a2, "bufferTag"));
  else
    return 0;
}

- (id)copyMetadataForTag:(id)a3 err:(int *)a4
{
  _DWORD *v7;
  void *v8;
  int v9;
  int v11;

  v11 = 0;
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v8 = (void *)-[BWDeferredProcessingContainer _copyObjectForTag:customClasses:err:]((uint64_t)self, (uint64_t)a3, 0, &v11);
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (*v7 == 1)
      kdebug_trace();
  }
  else
  {
    v11 = -16132;
  }
  v9 = v11;
  if (a4)
    *a4 = v11;
  if (v9)
  {

    return 0;
  }
  return v8;
}

- (BOOL)hasInferenceBuffer:(id)a3 portType:(id)a4
{
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  _QWORD v13[6];

  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__BWDeferredProcessingContainer_hasInferenceBuffer_portType___block_invoke;
  v13[3] = &unk_1E4923AD0;
  v13[4] = a4;
  v13[5] = a3;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](intermediates, "indexOfObjectPassingTest:", v13);
  v11 = v9 != 0x7FFFFFFFFFFFFFFFLL
     && (v10 = v9, v9 < -[NSMutableArray count](self->super._intermediates, "count"))
     && -[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v10) != 0;
  pthread_rwlock_unlock(p_lock);
  return v11;
}

uint64_t __61__BWDeferredProcessingContainer_hasInferenceBuffer_portType___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    return objc_msgSend((id)objc_msgSend(a2, "inferenceAttachedMediaKey"), "isEqual:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    return 0;
  }
}

- (__CVBuffer)copyInferenceBufferForKey:(id)a3 portType:(id)a4 err:(int *)a5
{
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  unint64_t v11;
  unint64_t v12;
  __CVBuffer *v13;
  _QWORD v15[6];
  int v16;

  v16 = 0;
  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__BWDeferredProcessingContainer_copyInferenceBufferForKey_portType_err___block_invoke;
  v15[3] = &unk_1E4923AD0;
  v15[4] = a4;
  v15[5] = a3;
  v11 = -[NSMutableArray indexOfObjectPassingTest:](intermediates, "indexOfObjectPassingTest:", v15);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL
    || (v12 = v11, v11 >= -[NSMutableArray count](self->super._intermediates, "count"))
    || !-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v12))
  {
    v13 = 0;
  }
  else
  {
    v13 = (__CVBuffer *)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v12), "fetchAndRetain:", &v16);
    if (v16)
      FigDebugAssert3();
  }
  pthread_rwlock_unlock(p_lock);
  if (a5)
    *a5 = v16;
  return v13;
}

uint64_t __72__BWDeferredProcessingContainer_copyInferenceBufferForKey_portType_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    return objc_msgSend((id)objc_msgSend(a2, "inferenceAttachedMediaKey"), "isEqual:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    return 0;
  }
}

- (BOOL)hasInference:(id)a3 portType:(id)a4
{
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  _QWORD v13[6];

  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__BWDeferredProcessingContainer_hasInference_portType___block_invoke;
  v13[3] = &unk_1E4923AD0;
  v13[4] = a4;
  v13[5] = a3;
  v9 = -[NSMutableArray indexOfObjectPassingTest:](intermediates, "indexOfObjectPassingTest:", v13);
  v11 = v9 != 0x7FFFFFFFFFFFFFFFLL
     && (v10 = v9, v9 < -[NSMutableArray count](self->super._intermediates, "count"))
     && -[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v10) != 0;
  pthread_rwlock_unlock(p_lock);
  return v11;
}

uint64_t __55__BWDeferredProcessingContainer_hasInference_portType___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    return objc_msgSend((id)objc_msgSend(a2, "inferenceAttachmentKey"), "isEqual:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    return 0;
  }
}

- (id)copyInferenceForKey:(id)a3 customClasses:(id)a4 portType:(id)a5 err:(int *)a6
{
  _opaque_pthread_rwlock_t *p_lock;
  NSMutableArray *intermediates;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  _QWORD v17[6];
  int v18;

  v18 = 0;
  p_lock = &self->super._lock;
  pthread_rwlock_rdlock(&self->super._lock);
  intermediates = self->super._intermediates;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__BWDeferredProcessingContainer_copyInferenceForKey_customClasses_portType_err___block_invoke;
  v17[3] = &unk_1E4923AD0;
  v17[4] = a5;
  v17[5] = a3;
  v13 = -[NSMutableArray indexOfObjectPassingTest:](intermediates, "indexOfObjectPassingTest:", v17);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || (v14 = v13, v13 >= -[NSMutableArray count](self->super._intermediates, "count"))
    || !-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v14))
  {
    v15 = 0;
  }
  else
  {
    v15 = (void *)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->super._intermediates, "objectAtIndexedSubscript:", v14), "fetchWithCustomClassesAndRetain:err:", a4, &v18);
    if (v18)
      FigDebugAssert3();
  }
  pthread_rwlock_unlock(p_lock);
  if (a6)
    *a6 = v18;
  return v15;
}

uint64_t __80__BWDeferredProcessingContainer_copyInferenceForKey_customClasses_portType_err___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a2, "portType"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    return objc_msgSend((id)objc_msgSend(a2, "inferenceAttachmentKey"), "isEqual:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    return 0;
  }
}

- (id)copyArrayForTag:(id)a3 customClasses:(id)a4 err:(int *)a5
{
  _DWORD *v9;
  void *v10;
  int v11;
  int v13;

  v13 = 0;
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v10 = (void *)-[BWDeferredProcessingContainer _copyObjectForTag:customClasses:err:]((uint64_t)self, (uint64_t)a3, (uint64_t)a4, &v13);
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (*v9 == 1)
      kdebug_trace();
  }
  else
  {
    v13 = -16132;
  }
  v11 = v13;
  if (a5)
    *a5 = v13;
  if (v11)
  {

    return 0;
  }
  return v10;
}

- (void)releaseIntermediates
{
  _opaque_pthread_rwlock_t *p_lock;

  p_lock = &self->super._lock;
  pthread_rwlock_wrlock(&self->super._lock);

  self->super._intermediates = 0;
  pthread_rwlock_unlock(p_lock);
}

- (void)abortingProcessingDueToError:(int)a3
{
  uint64_t v4;

  if (!self->_sessionDictionary
    || (-[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionDictionary, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3), CFSTR("PreviousError")), v4 = 0, !+[BWDeferredContainer archiveObjectWithURL:object:error:](BWDeferredContainer, "archiveObjectWithURL:object:error:", -[BWDeferredContainer _containerSessionDataURL]((uint64_t)self), self->_sessionDictionary, &v4)))
  {
    FigDebugAssert3();
  }
}

- (unsigned)processingCount
{
  return self->_processingCount;
}

- (unint64_t)sizeBytes
{
  return self->_sizeBytes;
}

- (unsigned)ageSeconds
{
  return self->_ageSeconds;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (int)previousAttemptErrorCode
{
  return self->_previousAttemptErrorCode;
}

@end
