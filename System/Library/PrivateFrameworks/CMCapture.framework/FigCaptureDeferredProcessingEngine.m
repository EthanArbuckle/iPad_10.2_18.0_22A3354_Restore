@implementation FigCaptureDeferredProcessingEngine

FigCaptureDeferredProcessingEngine *__60__FigCaptureDeferredProcessingEngine_sharedProcessingEngine__block_invoke()
{
  FigCaptureDeferredProcessingEngine *result;

  result = objc_alloc_init(FigCaptureDeferredProcessingEngine);
  sharedProcessingEngine_sEngine = (uint64_t)result;
  return result;
}

- (FigCaptureDeferredProcessingEngine)init
{
  FigCaptureDeferredProcessingEngine *v2;
  void *v3;
  NSDictionary *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)FigCaptureDeferredProcessingEngine;
  v2 = -[FigCaptureDeferredProcessingEngine init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_workQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v3 = (void *)MEMORY[0x1A858DD40]();
    v4 = -[FigCaptureCameraParameters cameraTuningParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraTuningParameters");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = -[NSDictionary allKeys](v4, "allKeys", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "hasPrefix:", CFSTR("PortType")))
            objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11), "allKeys"));
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }
    v2->_allSensorIDStrings = (NSSet *)objc_msgSend(v5, "copy");
    v12 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("DefaultSensorIDs")), "copy");
    v2->_memoryPool = 0;
    v2->_flushAssertion = 0;
    v2->_defaultSensorIDsByPortType = (NSDictionary *)v12;
    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (void)_ensureGraphForProcessingContainer:(unsigned int)a3 sensorRawPixelFormat:(unint64_t)a4 sensorRawDimensions:(unint64_t)a5 ultraHighResSensorRawDimensions:(uint64_t)a6 depthDataDimensions:(uint64_t)a7 photoIdentifier:(void *)a8 applicationID:
{
  uint64_t v13;
  FigCaptureCameraParameters *v14;
  int v15;
  int v16;
  int v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  unsigned int v31;
  unsigned int v32;
  NSObject *v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  int v40;
  unint64_t v41;
  uint64_t v42;
  float v43;
  int v44;
  int v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  BWGraph *v50;
  void *v51;
  BWDeferredProcessingSourceNode *v52;
  unint64_t v53;
  int v54;
  int v55;
  FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *v56;
  double v57;
  double v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  uint64_t v68;
  double v69;
  FigCaptureStillImageUnifiedBracketingSinkPipeline *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t k;
  uint64_t v75;
  void *v76;
  _BOOL8 v77;
  uint64_t v78;
  double v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  FigCaptureStillImageUnifiedBracketingSinkPipeline *v83;
  BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *v84;
  double v85;
  NSObject *v86;
  unsigned int v87;
  unsigned int v88;
  int v89;
  uint64_t v90;
  NSObject *v91;
  unsigned int v92;
  unsigned int v93;
  NSObject *v94;
  unsigned int v95;
  unsigned int v96;
  uint64_t v97;
  NSObject *v98;
  unsigned int v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  int *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  unsigned int v110;
  unsigned int v111;
  int v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  unint64_t v116;
  void *v117;
  uint64_t UpTimeNanoseconds;
  void *v119;
  BWInferenceScheduler *v120;
  unint64_t v121;
  void *v122;
  void *v123;
  FigCaptureIrisSinkConfiguration *v124;
  void *v126;
  FigCapturePhotonicEngineSinkPipelineConfiguration *v127;
  uint64_t v128;
  void *v129;
  id v130;
  id v131;
  uint64_t v132;
  _QWORD v133[5];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  os_log_type_t type;
  unsigned int v147;
  _QWORD v148[6];
  unsigned int v149;
  id v150;
  FigCaptureSourceFormatDimensions *v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;
  uint64_t v155;
  int v156;
  const char *v157;
  __int16 v158;
  _BYTE v159[18];
  _BYTE v160[128];
  _QWORD v161[20];

  v161[17] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!_FigIsCurrentDispatchQueue())
  {
    v104 = v115;
    LODWORD(v102) = 0;
    FigDebugAssert3();
  }
  v150 = 0;
  v149 = 0;
  v148[0] = 0;
  v148[1] = v148;
  v148[2] = 0x3052000000;
  v148[3] = __Block_byref_object_copy__14;
  v148[4] = __Block_byref_object_dispose__14;
  v148[5] = a1;
  v122 = (void *)objc_msgSend((id)a1, "currentJob", v102, v104);
  v117 = (void *)objc_msgSend(a2, "settings");
  v128 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType");
  v13 = objc_msgSend((id)objc_msgSend(a2, "photoManifest"), "descriptorForIdentifier:", a7);
  if (!*(_BYTE *)(a1 + 56))
    -[BWDeferredTransactionBroker openTransaction:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance"), "openTransaction:", 0);
  v131 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v130 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v123 = a8;
  v116 = a4;
  v132 = a1;
  v129 = (void *)objc_msgSend(a2, "pipelineParameters");
  v14 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v15 = objc_msgSend(v129, "nrfVersion");
  if (v15 != -[FigCaptureCameraParameters nrfVersion](v14, "nrfVersion")
    || objc_msgSend(v129, "deepZoomVersion")
    && (v16 = objc_msgSend(v129, "deepZoomVersion"),
        v16 != -[FigCaptureCameraParameters deepZoomVersion](v14, "deepZoomVersion"))
    || objc_msgSend(v129, "distortionCorrectionVersion")
    && (v17 = objc_msgSend(v129, "distortionCorrectionVersion"),
        v17 != -[FigCaptureCameraParameters distortionCorrectionVersion](v14, "distortionCorrectionVersion")))
  {
    v29 = 0;
    UpTimeNanoseconds = 0;
    v120 = 0;
    v124 = 0;
    v38 = 0;
    v45 = -16827;
    goto LABEL_159;
  }
  v121 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    objc_msgSend(a2, "captureRequestIdentifierBytesLow");
    objc_msgSend(a2, "captureRequestIdentifierBytesHigh");
    kdebug_trace();
  }
  -[BWMemoryPool ensureMemoryAsyncWithSize:withMaximizeSystemMemory:](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "ensureMemoryAsyncWithSize:withMaximizeSystemMemory:", 1, 0);
  *(_QWORD *)(a1 + 104) = +[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool");
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  if (dword_1ECFE93B0)
  {
    v147 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v114 = objc_msgSend((id)objc_msgSend(a2, "captureSettings", v103, v105), "captureFlags");
  v161[0] = v128;
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 1);
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v19);
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v19);
  if (objc_msgSend(v129, "pearlModuleType")
    || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    v22 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes");
    objc_msgSend(v20, "addObjectsFromArray:", v22);
    objc_msgSend(v21, "addObjectsFromArray:", v22);
    if (objc_msgSend(v129, "pearlModuleType"))
      objc_msgSend(v21, "removeObject:", *MEMORY[0x1E0D05A40]);
  }
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v142, v160, 16);
  v119 = v21;
  v126 = (void *)v13;
  if (v23)
  {
    v24 = *(_QWORD *)v143;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v143 != v24)
          objc_enumerationMutation(v20);
        v26 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
        v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", v26), "sensorIDString");
        if (!v27)
        {
          v27 = objc_msgSend(*(id *)(v132 + 96), "objectForKeyedSubscript:", v26);
          if (!v27)
          {
            v105 = v115;
            LODWORD(v103) = 0;
            FigDebugAssert3();
            v29 = 0;
            goto LABEL_61;
          }
        }
        if ((objc_msgSend(*(id *)(v132 + 88), "containsObject:", v27) & 1) == 0)
        {
          v149 = -16134;
          v147 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v34 = v147;
          if (os_log_type_enabled(v33, type))
            v35 = v34;
          else
            v35 = v34 & 0xFFFFFFFE;
          if (v35)
          {
            v36 = *(_QWORD *)(v132 + 88);
            v156 = 136315650;
            v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRa"
                   "wDimensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
            v158 = 2114;
            *(_QWORD *)v159 = v27;
            *(_WORD *)&v159[8] = 2114;
            *(_QWORD *)&v159[10] = v36;
            LODWORD(v105) = 32;
            v103 = &v156;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_124:
          v29 = 0;
          v124 = 0;
          v38 = 0;
          v120 = 0;
          goto LABEL_160;
        }
        objc_msgSend(v131, "setObject:forKeyedSubscript:", v27, v26);
        v28 = (void *)objc_msgSend(a2, "copyDictionaryForTag:err:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagCameraInfoByPortTypePrefix, v26), &v149);
        if (!v28)
          goto LABEL_124;
        objc_msgSend(v130, "setObject:forKeyedSubscript:", v28, v26);

      }
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v142, v160, 16);
      if (v23)
        continue;
      break;
    }
  }
  if (objc_msgSend(a2, "hasTag:", BWDeferredIntermediateTagModuleCalibrationByPortType))
  {
    v29 = (void *)objc_msgSend(a2, "copyDictionaryForTag:customClasses:err:", BWDeferredIntermediateTagModuleCalibrationByPortType, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()), &v149);
    if (v149)
    {
      v147 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v31 = v147;
      if (os_log_type_enabled(v30, type))
        v32 = v31;
      else
        v32 = v31 & 0xFFFFFFFE;
      if (v32)
      {
        v156 = 136315394;
        v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDim"
               "ensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
        v158 = 1024;
        *(_DWORD *)v159 = v149;
        LODWORD(v105) = 18;
        v103 = &v156;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v29 = 0;
  }
  if (objc_msgSend(a2, "hasTag:", BWDeferredIntermediateTagSourceNodePixelBufferAttributes, v103, v105))
  {
    v37 = objc_msgSend(a2, "copyDictionaryForTag:err:", BWDeferredIntermediateTagSourceNodePixelBufferAttributes, &v149);
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") != 12 || (v121 & 4) != 0)
    {
LABEL_60:
      v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
LABEL_61:
      v124 = 0;
      v38 = 0;
      v120 = 0;
      v45 = -16131;
      goto LABEL_159;
    }
    v37 = objc_msgSend(a2, "copyAttributesForBufferType:portType:err:", 8, v128, &v149);
  }
  v38 = (void *)v37;
  if (!v37)
    goto LABEL_60;
  v39 = -[FigCaptureDeferredProcessingEngine expectsGainMapForSettings:captureSettings:](v132, v117, (void *)objc_msgSend(a2, "captureSettings"));
  v40 = objc_msgSend(a2, "hasBufferForType:portType:", 19, v128);
  v41 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "downgradedDeepFusionEnhancedResolutionCapture"))LODWORD(v42) = objc_msgSend(v129, "generateInferencesForSemanticProcessingIfNeeded");
  else
    v42 = HIDWORD(v41) & 1;
  if (v39 | v40 | v42)
    v43 = 2.0;
  else
    v43 = 0.0;
  if ((v121 & 4) == 0)
    goto LABEL_63;
  v44 = objc_msgSend(v117, "resolutionFlavor");
  if ((v44 - 1) < 2)
  {
    v116 = a5;
    goto LABEL_64;
  }
  if (v44)
LABEL_63:
    v116 = 0;
LABEL_64:
  v46 = (void *)objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
  if (v46)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v111 = objc_msgSend((id)objc_msgSend(v46, "firstObject"), "unsignedIntValue");
    else
      v111 = objc_msgSend(v46, "unsignedIntValue");
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12)
      v47 = 1885745712;
    else
      v47 = 875704422;
    v111 = v47;
  }
  if (objc_msgSend(v129, "intelligentDistortionCorrectionEnabled"))
  {
    v155 = v128;
    v107 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
  }
  else
  {
    v107 = 0;
  }
  if (objc_msgSend(v129, "geometricDistortionCorrectionEnabled"))
  {
    v154 = v128;
    v48 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v154, 1);
  }
  else
  {
    v48 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    v49 = (uint64_t)v119;
  else
    v49 = v48;
  v113 = v49;
  v112 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
  v110 = FigCaptureClientApplicationIDIsCameraOrDerivative(v123);
  v124 = objc_alloc_init(FigCaptureIrisSinkConfiguration);
  -[FigCaptureSinkConfiguration setSinkID:](v124, "setSinkID:", objc_msgSend((id)v132, "description"));
  -[FigCaptureIrisSinkConfiguration setDemosaicedRawEnabled:](v124, "setDemosaicedRawEnabled:", (objc_msgSend(v126, "processingFlags") >> 16) & 1);
  -[FigCaptureIrisSinkConfiguration setStereoPhotoCaptureEnabled:](v124, "setStereoPhotoCaptureEnabled:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag") != 0);
  v50 = -[BWGraph initWithConfigurationQueuePriority:]([BWGraph alloc], "initWithConfigurationQueuePriority:", 39);
  *(_QWORD *)(v132 + 48) = v50;
  -[BWGraph beginConfiguration](v50, "beginConfiguration");
  objc_msgSend(*(id *)(v132 + 48), "setStatusDelegate:");
  v51 = *(void **)(v132 + 104);
  if (v51)
  {
    *(_QWORD *)(v132 + 112) = objc_msgSend(v51, "newFlushAssertion:", CFSTR("DeferredProcessingGraph"));
    objc_msgSend(*(id *)(v132 + 48), "setMemoryPool:", *(_QWORD *)(v132 + 104));
  }
  v52 = -[BWDeferredProcessingSourceNode initWithPortTypes:attributes:colorSpaceProperties:]([BWDeferredProcessingSourceNode alloc], "initWithPortTypes:attributes:colorSpaceProperties:", v119, v38, 3);
  *(_QWORD *)(v132 + 64) = v52;
  if ((objc_msgSend(*(id *)(v132 + 48), "addNode:error:", v52, &v150) & 1) == 0)
  {
    v105 = v115;
    LODWORD(v103) = 0;
    FigDebugAssert3();
    v120 = 0;
    v45 = -12780;
    goto LABEL_159;
  }
  v120 = objc_alloc_init(BWInferenceScheduler);
  if ((v121 & 4) != 0)
    LODWORD(v53) = 1;
  else
    v53 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 7) & 1;
  v54 = objc_msgSend(v129, "noiseReductionAndFusionScheme");
  if ((_DWORD)v53)
    v55 = 5;
  else
    v55 = 4;
  if (v54)
    v55 = v54;
  if (v55 != 5)
  {
    if (v55 != 4)
    {
LABEL_158:
      v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
      v45 = -12786;
LABEL_159:
      v149 = v45;
      goto LABEL_160;
    }
    v56 = objc_alloc_init(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setPipelineStagePriority:](v56, "setPipelineStagePriority:", 39);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setInferencePriority:](v56, "setInferencePriority:", 39);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDeviceType:](v56, "setDeviceType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "deviceType"));
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setSensorIDStringsByPortType:](v56, "setSensorIDStringsByPortType:", v131);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setCameraInfoByPortType:](v56, "setCameraInfoByPortType:", v130);
    LODWORD(v57) = 2.0;
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setUbInferenceMainImageDownscalingFactor:](v56, "setUbInferenceMainImageDownscalingFactor:", v57);
    *(float *)&v58 = v43;
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setGainMapMainImageDownscalingFactor:](v56, "setGainMapMainImageDownscalingFactor:", v58);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setMaxLossyCompressionLevel:](v56, "setMaxLossyCompressionLevel:", +[FigCaptureCameraParameters stillImageMaxLossyCompressionLevel](FigCaptureCameraParameters, "stillImageMaxLossyCompressionLevel"));
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setInputIs10Bit:](v56, "setInputIs10Bit:", FigCapturePixelFormatIsTenBit(v111));
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setRedEyeReductionVersion:](v56, "setRedEyeReductionVersion:", 0);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setSemanticRenderingVersion:](v56, "setSemanticRenderingVersion:", 0);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setSemanticDevelopmentVersion:](v56, "setSemanticDevelopmentVersion:", 0);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setPortTypesWithIntelligentDistortionCorrectionEnabled:](v56, "setPortTypesWithIntelligentDistortionCorrectionEnabled:", v107);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setPortTypesWithGeometricDistortionCorrectionEnabled:](v56, "setPortTypesWithGeometricDistortionCorrectionEnabled:", v113);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setGdcInDCProcessorSupported:](v56, "setGdcInDCProcessorSupported:", v113 != 0);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDcProcessorVersion:](v56, "setDcProcessorVersion:", objc_msgSend(v129, "distortionCorrectionVersion"));
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDemosaicedRawPixelFormat:](v56, "setDemosaicedRawPixelFormat:", objc_msgSend((id)objc_msgSend(a2, "settings"), "rawOutputFormat"));
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setStillImageSinkPipelineProcessingMode:](v56, "setStillImageSinkPipelineProcessingMode:", 1);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDeepFusionSupported:](v56, "setDeepFusionSupported:", v112 == 12);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setLearnedNRSupported:](v56, "setLearnedNRSupported:", ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 7) & 1);
    v59 = v112 == 12
       || -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration learnedNRSupported](v56, "learnedNRSupported");
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setStillImageStabilizationSupported:](v56, "setStillImageStabilizationSupported:", v59);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDeepZoomVersion:](v56, "setDeepZoomVersion:", objc_msgSend(v129, "deepZoomVersion"));
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setClientIsCameraOrDerivative:](v56, "setClientIsCameraOrDerivative:", v110);
    -[FigCaptureIrisSinkConfiguration setPortraitEffectsMatteDeliveryEnabled:](v124, "setPortraitEffectsMatteDeliveryEnabled:", objc_msgSend((id)objc_msgSend(a2, "settings"), "portraitEffectsMatteDeliveryEnabled"));
    LODWORD(v69) = 2.0;
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setPortraitEffectsMatteMainImageDownscalingFactor:](v56, "setPortraitEffectsMatteMainImageDownscalingFactor:", v69);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setSupportedSemanticSegmentationMatteURNs:](v56, "setSupportedSemanticSegmentationMatteURNs:", objc_msgSend((id)objc_msgSend(a2, "settings"), "enabledSemanticSegmentationMatteURNs"));
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setEnabledSemanticSegmentationMatteURNs:](v56, "setEnabledSemanticSegmentationMatteURNs:", objc_msgSend((id)objc_msgSend(a2, "settings"), "enabledSemanticSegmentationMatteURNs"));
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setSinkConfiguration:](v56, "setSinkConfiguration:", v124);
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setNoiseReductionAndFusionScheme:](v56, "setNoiseReductionAndFusionScheme:", 4);
    v70 = objc_autorelease(-[FigCaptureStillImageUnifiedBracketingSinkPipeline initWithConfiguration:captureDevice:sourceOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:name:]([FigCaptureStillImageUnifiedBracketingSinkPipeline alloc], "initWithConfiguration:captureDevice:sourceOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:name:", v56, 0, objc_msgSend(*(id *)(v132 + 64), "outputsByPortType"), 0, 0, 0, 0, v120, 0, *(_QWORD *)(v132 + 48), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Deferred Processing %@"),
                +[FigCaptureStillImageUnifiedBracketingSinkPipeline pipelineBaseName](FigCaptureStillImageUnifiedBracketingSinkPipeline, "pipelineBaseName"))));
LABEL_154:
    v83 = v70;
    if (v70)
    {
      -[BWStillImageSampleBufferSinkNode setDeferredPhotoProcessorEnabled:](-[FigCaptureStillImageUnifiedBracketingSinkPipeline stillImageSinkNode](v70, "stillImageSinkNode"), "setDeferredPhotoProcessorEnabled:", 1);
      -[BWStillImageSampleBufferSinkNode setClientIsCameraOrDerivative:](-[FigCaptureStillImageUnifiedBracketingSinkPipeline stillImageSinkNode](v83, "stillImageSinkNode"), "setClientIsCameraOrDerivative:", v110);
      v133[0] = MEMORY[0x1E0C809B0];
      v133[1] = 3221225472;
      v133[2] = __196__FigCaptureDeferredProcessingEngine__ensureGraphForProcessingContainer_sensorRawPixelFormat_sensorRawDimensions_ultraHighResSensorRawDimensions_depthDataDimensions_photoIdentifier_applicationID___block_invoke;
      v133[3] = &unk_1E49205B8;
      v133[4] = v148;
      -[BWStillImageSampleBufferSinkNode setSampleBufferAvailableHandler:](-[FigCaptureStillImageUnifiedBracketingSinkPipeline stillImageSinkNode](v83, "stillImageSinkNode"), "setSampleBufferAvailableHandler:", v133);
      v84 = objc_alloc_init(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setFormatDimensionWidth:](v84, "setFormatDimensionWidth:", objc_msgSend((id)objc_msgSend(a2, "settings"), "outputWidth"));
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setFormatDimensionHeight:](v84, "setFormatDimensionHeight:", objc_msgSend((id)objc_msgSend(a2, "settings"), "outputHeight"));
      LODWORD(v85) = 30.0;
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setFormatMaxFrameRate:](v84, "setFormatMaxFrameRate:", v85);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setIsHighQualityPhotoWithVideoFormatSupported:](v84, "setIsHighQualityPhotoWithVideoFormatSupported:", 0);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setIsPhotoFormat:](v84, "setIsPhotoFormat:", 1);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setIsTimeLapse:](v84, "setIsTimeLapse:", 0);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setPixelFormat:](v84, "setPixelFormat:", v111);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setBinned:](v84, "setBinned:", 0);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setIsSemanticStyleRenderingSupported:](v84, "setIsSemanticStyleRenderingSupported:", objc_msgSend((id)objc_msgSend(a2, "settings"), "semanticStyle") != 0);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setFastCapturePrioritizationEnabled:](v84, "setFastCapturePrioritizationEnabled:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "fastCapturePrioritizationEnabled"));
      -[BWStillImageSampleBufferSinkNode setAnalyticsConfiguration:](-[FigCaptureStillImageUnifiedBracketingSinkPipeline stillImageSinkNode](v83, "stillImageSinkNode"), "setAnalyticsConfiguration:", v84);
      if ((objc_msgSend(*(id *)(v132 + 48), "commitConfigurationWithID:error:", 1, &v150) & 1) != 0
        && objc_msgSend(*(id *)(v132 + 48), "start:", &v150))
      {
        *(_BYTE *)(v132 + 56) = 1;
      }
      else
      {
        v105 = v115;
        LODWORD(v103) = 0;
        FigDebugAssert3();
      }
      goto LABEL_160;
    }
    goto LABEL_158;
  }
  v127 = objc_alloc_init(FigCapturePhotonicEngineSinkPipelineConfiguration);
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setPipelineStagePriority:](v127, "setPipelineStagePriority:", 39);
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setInferencePriority:](v127, "setInferencePriority:", 39);
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeviceType:](v127, "setDeviceType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "deviceType"));
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    v60 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
    if (objc_msgSend(v60, "count") != 2)
    {
      v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
      v149 = -12780;
      v147 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v86 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v87 = v147;
      if (os_log_type_enabled(v86, type))
        v88 = v87;
      else
        v88 = v87 & 0xFFFFFFFE;
      if (v88)
      {
        v89 = objc_msgSend(v60, "count", v103, v115);
        v90 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
        v156 = 136315650;
        v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDim"
               "ensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
        v158 = 1024;
        *(_DWORD *)v159 = v89;
        *(_WORD *)&v159[4] = 2048;
        *(_QWORD *)&v159[6] = v90;
        LODWORD(v105) = 28;
        v103 = &v156;
        _os_log_send_and_compose_impl();
      }
      goto LABEL_195;
    }
    if ((objc_msgSend(v60, "containsObject:", *MEMORY[0x1E0D05A18]) & 1) != 0)
    {
      if ((objc_msgSend(v60, "containsObject:", *MEMORY[0x1E0D05A28]) & 1) != 0)
      {
        -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeviceType:](v127, "setDeviceType:", 8);
        goto LABEL_101;
      }
      v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
      v149 = -12780;
      v147 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v94 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v95 = v147;
      if (os_log_type_enabled(v94, type))
        v96 = v95;
      else
        v96 = v95 & 0xFFFFFFFE;
      if (!v96)
      {
LABEL_195:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        goto LABEL_160;
      }
    }
    else
    {
      v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
      v149 = -12780;
      v147 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v91 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v92 = v147;
      if (os_log_type_enabled(v91, type))
        v93 = v92;
      else
        v93 = v92 & 0xFFFFFFFE;
      if (!v93)
        goto LABEL_195;
    }
    v97 = objc_msgSend((id)objc_msgSend(a2, "settings", v103, v105), "settingsID");
    v156 = 136315394;
    v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDimensi"
           "ons:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
    v158 = 2048;
    *(_QWORD *)v159 = v97;
    LODWORD(v105) = 22;
    v103 = &v156;
    _os_log_send_and_compose_impl();
    goto LABEL_195;
  }
LABEL_101:
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setDevicePosition:](v127, "setDevicePosition:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "devicePosition"));
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setSensorIDStringsByPortType:](v127, "setSensorIDStringsByPortType:", v131);
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setCameraInfoByPortType:](v127, "setCameraInfoByPortType:", v130);
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setModuleCalibrationByPortType:](v127, "setModuleCalibrationByPortType:", v29);
  LODWORD(v61) = 2.0;
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setUbInferenceMainImageDownscalingFactor:](v127, "setUbInferenceMainImageDownscalingFactor:", v61);
  *(float *)&v62 = v43;
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setGainMapMainImageDownscalingFactor:](v127, "setGainMapMainImageDownscalingFactor:", v62);
  v106 = v38;
  if ((v121 & 4) == 0)
  {
LABEL_142:
    v38 = v106;
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setMaxLossyCompressionLevel:](v127, "setMaxLossyCompressionLevel:", +[FigCaptureCameraParameters stillImageMaxLossyCompressionLevel](FigCaptureCameraParameters, "stillImageMaxLossyCompressionLevel"));
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setInputIs10Bit:](v127, "setInputIs10Bit:", FigCapturePixelFormatIsTenBit(v111));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setRedEyeReductionVersion:](v127, "setRedEyeReductionVersion:", 0);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSemanticRenderingVersion:](v127, "setSemanticRenderingVersion:", objc_msgSend(v129, "semanticRenderingVersion"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSemanticDevelopmentVersion:](v127, "setSemanticDevelopmentVersion:", 0);
    v77 = -[FigCapturePhotonicEngineSinkPipelineConfiguration semanticRenderingVersion](v127, "semanticRenderingVersion") >= 1&& objc_msgSend((id)objc_msgSend(a2, "settings"), "semanticStyle") != 0;
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSemanticStyleRenderingEnabled:](v127, "setSemanticStyleRenderingEnabled:", v77);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setGenerateInferencesForSemanticProcessingIfNeeded:](v127, "setGenerateInferencesForSemanticProcessingIfNeeded:", objc_msgSend(v129, "generateInferencesForSemanticProcessingIfNeeded"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSmartStyleRenderingVersion:](v127, "setSmartStyleRenderingVersion:", objc_msgSend(v129, "smartStyleRenderingVersion"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSmartStyleReversibilityEnabled:](v127, "setSmartStyleReversibilityEnabled:", objc_msgSend(v129, "smartStyleReversibilityEnabled"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSmartStyleLinearThumbnailDimensions:](v127, "setSmartStyleLinearThumbnailDimensions:", objc_msgSend(v129, "smartStyleLinearThumbnailDimensions"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSmartStyleStyledThumbnailDimensions:](v127, "setSmartStyleStyledThumbnailDimensions:", objc_msgSend(v129, "smartStyleStyledThumbnailDimensions"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setPortTypesWithIntelligentDistortionCorrectionEnabled:](v127, "setPortTypesWithIntelligentDistortionCorrectionEnabled:", v107);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setPortTypesWithGeometricDistortionCorrectionEnabled:](v127, "setPortTypesWithGeometricDistortionCorrectionEnabled:", v113);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setStillImageGDCSourceMode:](v127, "setStillImageGDCSourceMode:", objc_msgSend(v129, "stillImageGDCSourceMode"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setGdcInDCProcessorSupported:](v127, "setGdcInDCProcessorSupported:", v113 != 0);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDcProcessingWithDepthSupported:](v127, "setDcProcessingWithDepthSupported:", objc_msgSend(v129, "dcProcessingWithDepthSupported"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDcProcessorVersion:](v127, "setDcProcessorVersion:", objc_msgSend(v129, "distortionCorrectionVersion"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDemosaicedRawPixelFormat:](v127, "setDemosaicedRawPixelFormat:", objc_msgSend(v117, "rawOutputFormat"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setStillImageSinkPipelineProcessingMode:](v127, "setStillImageSinkPipelineProcessingMode:", 1);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeepFusionSupported:](v127, "setDeepFusionSupported:", v112 == 12);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setLearnedNRSupported:](v127, "setLearnedNRSupported:", ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 7) & 1);
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    {
      -[FigCapturePhotonicEngineSinkPipelineConfiguration setLearnedNRSupported:](v127, "setLearnedNRSupported:", 1);
      -[FigCapturePhotonicEngineSinkPipelineConfiguration setStereoPhotoOutputDimensions:](v127, "setStereoPhotoOutputDimensions:", 0x7E000000A80);
    }
    v78 = v112 == 12
       || -[FigCapturePhotonicEngineSinkPipelineConfiguration learnedNRSupported](v127, "learnedNRSupported");
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setStillImageStabilizationSupported:](v127, "setStillImageStabilizationSupported:", v78);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeepZoomVersion:](v127, "setDeepZoomVersion:", objc_msgSend(v129, "deepZoomVersion"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeepZoomMode:](v127, "setDeepZoomMode:", objc_msgSend(v129, "deepZoomMode"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSoftISPSupported:](v127, "setSoftISPSupported:", (v121 >> 2) & 1);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSfhrMode:](v127, "setSfhrMode:", objc_msgSend(v129, "sfhrMode"));
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setClientIsCameraOrDerivative:](v127, "setClientIsCameraOrDerivative:", v110);
    if ((v114 & 0x800) != 0)
    {
      -[FigCaptureIrisSinkConfiguration setDepthDataDeliveryEnabled:](v124, "setDepthDataDeliveryEnabled:", 1);
      -[FigCaptureBaseStillImageSinkPipelineConfiguration setDepthDataDimensions:](v127, "setDepthDataDimensions:", a6);
      -[FigCaptureIrisSinkConfiguration setPreviewQualityAdjustedPhotoFilterRenderingEnabled:](v124, "setPreviewQualityAdjustedPhotoFilterRenderingEnabled:", 0);
      -[FigCaptureIrisSinkConfiguration setFilterRenderingEnabled:](v124, "setFilterRenderingEnabled:", BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(a2, "settings"), "processedImageFilters")));
      -[FigCapturePhotonicEngineSinkPipelineConfiguration setContinuousZoomWithDepthSupported:](v127, "setContinuousZoomWithDepthSupported:", objc_msgSend(v129, "continuousZoomWithDepthSupported"));
      -[FigCapturePhotonicEngineSinkPipelineConfiguration setPearlModuleType:](v127, "setPearlModuleType:", objc_msgSend(v129, "pearlModuleType"));
      if (-[FigCapturePhotonicEngineSinkPipelineConfiguration pearlModuleType](v127, "pearlModuleType"))
        -[FigCapturePhotonicEngineSinkPipelineConfiguration setDepthDataType:](v127, "setDepthDataType:", 3);
    }
    -[FigCaptureIrisSinkConfiguration setPortraitEffectsMatteDeliveryEnabled:](v124, "setPortraitEffectsMatteDeliveryEnabled:", objc_msgSend((id)objc_msgSend(a2, "settings"), "portraitEffectsMatteDeliveryEnabled"));
    LODWORD(v79) = 2.0;
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setPortraitEffectsMatteMainImageDownscalingFactor:](v127, "setPortraitEffectsMatteMainImageDownscalingFactor:", v79);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSupportedSemanticSegmentationMatteURNs:](v127, "setSupportedSemanticSegmentationMatteURNs:", objc_msgSend((id)objc_msgSend(a2, "settings"), "enabledSemanticSegmentationMatteURNs"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setEnabledSemanticSegmentationMatteURNs:](v127, "setEnabledSemanticSegmentationMatteURNs:", objc_msgSend((id)objc_msgSend(a2, "settings"), "enabledSemanticSegmentationMatteURNs"));
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setSinkConfiguration:](v127, "setSinkConfiguration:", v124);
    -[FigCaptureBaseStillImageSinkPipelineConfiguration setNoiseReductionAndFusionScheme:](v127, "setNoiseReductionAndFusionScheme:", 5);
    v80 = objc_msgSend((id)objc_msgSend(a2, "settings"), "outputWidth");
    v81 = objc_msgSend((id)objc_msgSend(a2, "settings"), "outputHeight");
    v151 = -[FigCaptureSourceFormatDimensions initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:]([FigCaptureSourceFormatDimensions alloc], "initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:", v80 | (unint64_t)(v81 << 32), v80 | (unint64_t)(v81 << 32), 0, 0, v80 | (unint64_t)(v81 << 32));
    v82 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
    v70 = objc_autorelease(-[FigCapturePhotonicEngineSinkPipeline initWithConfiguration:captureDevice:sourceOutputsByPortType:sourceSensorRawOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:name:]([FigCapturePhotonicEngineSinkPipeline alloc], "initWithConfiguration:captureDevice:sourceOutputsByPortType:sourceSensorRawOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:name:", v127, 0, objc_msgSend(*(id *)(v132 + 64), "outputsByPortType"), 0, v82, 0, 0, 0, v120, 0, *(_QWORD *)(v132 + 48), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:",
                CFSTR("Deferred Processing %@"),
                +[FigCapturePhotonicEngineSinkPipeline pipelineBaseName](FigCapturePhotonicEngineSinkPipeline, "pipelineBaseName"))));
    goto LABEL_154;
  }
  v63 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x300000000) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "downgradedDeepFusionEnhancedResolutionCapture"))-[FigCapturePhotonicEngineSinkPipelineConfiguration setDowngradedDeepFusionEnhancedResolutionDimensions:](v127, "setDowngradedDeepFusionEnhancedResolutionDimensions:", objc_msgSend((id)objc_msgSend(a2, "settings"), "deferredPhotoFinalWidth") | (unint64_t)(objc_msgSend((id)objc_msgSend(a2, "settings"), "deferredPhotoFinalHeight") << 32));
    goto LABEL_127;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200000000) != 0)
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeepFusionEnhancedResolutionDimensions:](v127, "setDeepFusionEnhancedResolutionDimensions:", objc_msgSend((id)objc_msgSend(a2, "settings"), "deferredPhotoFinalWidth") | (unint64_t)(objc_msgSend((id)objc_msgSend(a2, "settings"), "deferredPhotoFinalHeight") << 32));
  if (FigCaptureVideoDimensionsAreValid(a5))
  {
    if (!objc_msgSend(v63, "objectForKeyedSubscript:", v128))
      objc_msgSend(v63, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v128);
    objc_msgSend((id)objc_msgSend(v63, "objectForKeyedSubscript:", v128), "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(a5), &unk_1E49F90A8);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setUltraHighResolutionProcessingEnabled:](v127, "setUltraHighResolutionProcessingEnabled:", objc_msgSend((id)objc_msgSend(a2, "settings"), "resolutionFlavor") == 2);
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    {
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v64 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes");
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v138, v153, 16);
      if (v65)
      {
        v66 = *(_QWORD *)v139;
        do
        {
          for (j = 0; j != v65; ++j)
          {
            if (*(_QWORD *)v139 != v66)
              objc_enumerationMutation(v64);
            v68 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j);
            if ((int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", v68), "expectedUltraHighResFrameCaptureCount") >= 1)
            {
              if (!objc_msgSend(v63, "objectForKeyedSubscript:", v68))
                objc_msgSend(v63, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v68);
              objc_msgSend((id)objc_msgSend(v63, "objectForKeyedSubscript:", v68), "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(a5), &unk_1E49F90A8);
              -[FigCapturePhotonicEngineSinkPipelineConfiguration setUltraHighResolutionProcessingEnabled:](v127, "setUltraHighResolutionProcessingEnabled:", 1);
            }
          }
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v138, v153, 16);
        }
        while (v65);
      }
    }
LABEL_127:
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    v71 = (void *)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v134, v152, 16);
    if (v72)
    {
      v73 = *(_QWORD *)v135;
      do
      {
        for (k = 0; k != v72; ++k)
        {
          if (*(_QWORD *)v135 != v73)
            objc_enumerationMutation(v71);
          v75 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * k);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", v75), "qsubResolutionFlavor") == 1)
          {
            if (!objc_msgSend(v63, "objectForKeyedSubscript:", v75))
              objc_msgSend(v63, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v75);
            objc_msgSend((id)objc_msgSend(v63, "objectForKeyedSubscript:", v75), "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v129, "dimensionsByQSubResolutionFlavorByPortType"), "objectForKeyedSubscript:", v128), "objectForKeyedSubscript:", &unk_1E49F90C0), &unk_1E49F90C0);
          }
        }
        v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v134, v152, 16);
      }
      while (v72);
    }
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSensorRawPixelFormat:](v127, "setSensorRawPixelFormat:", a3);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setQuadraProcessingSupportEnabled:](v127, "setQuadraProcessingSupportEnabled:", objc_msgSend(v129, "quadraProcessingSupportEnabled"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setRawSensorDimensions:](v127, "setRawSensorDimensions:", v116);
    if (objc_msgSend(v63, "count"))
      v76 = v63;
    else
      v76 = 0;
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDimensionsByQSubResolutionFlavorByPortType:](v127, "setDimensionsByQSubResolutionFlavorByPortType:", v76);
    objc_msgSend(v129, "sensorCenterOffset");
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSensorCenterOffset:](v127, "setSensorCenterOffset:");
    goto LABEL_142;
  }
  v149 = -12780;
  if (dword_1ECFE93B0)
  {
    v147 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v98 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v99 = v147;
    if (os_log_type_enabled(v98, type))
      v100 = v99;
    else
      v100 = v99 & 0xFFFFFFFE;
    if (v100)
    {
      v101 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
      v156 = 136315394;
      v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDimen"
             "sions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
      v158 = 2048;
      *(_QWORD *)v159 = v101;
      LODWORD(v105) = 22;
      v103 = &v156;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_160:
  objc_msgSend(v122, "setPrepareGraphNS:", FigGetUpTimeNanoseconds() - UpTimeNanoseconds);
  if (v150)
  {
    v149 = objc_msgSend(v150, "code");
    if (!v149)
      goto LABEL_165;
    goto LABEL_164;
  }
  if (v149)
  {
LABEL_164:
    objc_msgSend(v122, "failedWithError:", v103, v105);
    -[FigCaptureDeferredProcessingEngine _reportCoreAnalyticsDataWithError:job:](v132, v149, (void *)objc_msgSend((id)v132, "currentJob"));
    -[FigCaptureDeferredProcessingEngine _cleanupFromJob](v132);
  }
LABEL_165:
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();

  if (v150)
    -[BWDeferredTransactionBroker closeTransaction:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance"), "closeTransaction:", 0);
  _Block_object_dispose(v148, 8);
}

void __94__FigCaptureDeferredProcessingEngine_ensureGraphForSettings_processingSettings_applicationID___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  unsigned int v50;
  unsigned int v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v56;
  unsigned int v57;
  unsigned int v58;
  NSObject *v59;
  unsigned int v60;
  unsigned int v61;
  uint64_t v62;
  _QWORD v63[4];
  unsigned int v64;
  int v65;
  os_log_type_t type[8];
  uint64_t v67;
  BOOL (*v68)(uint64_t, void *);
  void *v69;
  int v70;
  _BYTE v71[24];
  void *v72;
  _QWORD v73[2];
  _QWORD v74[18];

  v74[16] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "currentJob"))
  {
    if (!dword_1ECFE93B0)
    {
LABEL_59:
      v34 = 0;
      goto LABEL_42;
    }
    LODWORD(v63[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_58:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_59;
  }
  v2 = *(void **)(a1 + 48);
  v3 = objc_msgSend(v2, "deferredSourceDeviceType");
  v4 = objc_msgSend(v2, "deferredVideoFormatUniqueID");
  v5 = (void *)objc_msgSend(v2, "deferredDepthDataFormatUniqueID");
  v6 = (void *)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "sourceInfoDictionaries");
  v7 = MEMORY[0x1E0C809B0];
  *(_QWORD *)type = MEMORY[0x1E0C809B0];
  v67 = 3221225472;
  v68 = __fcdpe_resolveFormatsAndUpdateSettings_block_invoke;
  v69 = &__block_descriptor_36_e29_B32__0__NSDictionary_8Q16_B24l;
  v70 = v3;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", type);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_52;
  v9 = (void *)objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
  v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E493B8F8);
  v11 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Formats"));
  v74[0] = v7;
  v74[1] = 3221225472;
  v74[2] = __fcdpe_resolveFormatsAndUpdateSettings_block_invoke_2;
  v74[3] = &unk_1E4920628;
  v74[4] = v4;
  v12 = objc_msgSend(v11, "indexOfObjectPassingTest:", v74);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_52;
  v13 = (void *)objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v14 = v13;
  if (v5)
  {
    v15 = (void *)objc_msgSend(v13, "supportedDepthDataFormats");
    *(_QWORD *)v71 = v7;
    *(_QWORD *)&v71[8] = 3221225472;
    *(_QWORD *)&v71[16] = __fcdpe_resolveFormatsAndUpdateSettings_block_invoke_3;
    v72 = &unk_1E4920650;
    v73[0] = v5;
    v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", v71);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_52;
    v5 = (void *)objc_msgSend(v15, "objectAtIndexedSubscript:", v16);
    if (!v5)
      goto LABEL_52;
  }
  if (!objc_msgSend(v2, "deferredPhotoProxyWidth")
    && !objc_msgSend(v2, "deferredPhotoProxyHeight"))
  {
    v17 = objc_msgSend(v2, "outputWidth");
    v18 = objc_msgSend(v2, "outputHeight");
    if (v17 | v18)
    {
      v20 = v18;
    }
    else
    {
      v19 = objc_msgSend(v14, "dimensions");
      v17 = v19;
      v20 = HIDWORD(v19);
    }
    v21 = (void *)objc_msgSend(v14, "highResStillImageDimensions");
    v63[0] = v7;
    v63[1] = 3221225472;
    v63[2] = __fcdpe_resolveFormatsAndUpdateSettings_block_invoke_4;
    v63[3] = &__block_descriptor_40_e49_B32__0__FigCaptureSourceFormatDimensions_8Q16_B24l;
    v64 = v17;
    v65 = v20;
    v22 = objc_msgSend(v21, "indexOfObjectPassingTest:", v63);
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = v22;
      objc_msgSend(v2, "setResolutionFlavor:", +[FigCaptureSourceFormatDimensions identifyResolutionFlavorFromDimensions:availableHighResStillImageDimensions:](FigCaptureSourceFormatDimensions, "identifyResolutionFlavorFromDimensions:availableHighResStillImageDimensions:", v17 | (v20 << 32), v21));
      v24 = (void *)objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
      v25 = objc_msgSend(v24, "deferredPhotoProxyDimensions");
      v26 = HIDWORD(v25);
      objc_msgSend(v2, "setDeferredPhotoProxyWidth:", v25);
      objc_msgSend(v2, "setDeferredPhotoProxyHeight:", v26);
      v27 = objc_msgSend(v24, "dimensions");
      objc_msgSend(v2, "setDeferredPhotoFinalWidth:", v27);
      objc_msgSend(v2, "setDeferredPhotoFinalHeight:", HIDWORD(v27));
      objc_msgSend(v2, "setOutputWidth:", v27);
      objc_msgSend(v2, "setOutputHeight:", HIDWORD(v27));
      goto LABEL_14;
    }
LABEL_52:
    FigDebugAssert3();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = -12780;
LABEL_53:
    FigDebugAssert3();
    LODWORD(v63[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v59 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v60 = v63[0];
    if (os_log_type_enabled(v59, type[0]))
      v61 = v60;
    else
      v61 = v60 & 0xFFFFFFFE;
    if (!v61)
      goto LABEL_58;
LABEL_57:
    v62 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)v71 = 136315394;
    *(_QWORD *)&v71[4] = "-[FigCaptureDeferredProcessingEngine ensureGraphForSettings:processingSettings:applicationID:]_block_invoke";
    *(_WORD *)&v71[12] = 2114;
    *(_QWORD *)&v71[14] = v62;
    _os_log_send_and_compose_impl();
    goto LABEL_58;
  }
LABEL_14:
  v28 = v10;
  v29 = v14;
  v30 = v5;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  if (!v29)
    goto LABEL_53;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    FigDebugAssert3();
    LODWORD(v63[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v57 = v63[0];
    if (os_log_type_enabled(v56, type[0]))
      v58 = v57;
    else
      v58 = v57 & 0xFFFFFFFE;
    if (!v58)
      goto LABEL_58;
    goto LABEL_57;
  }
  v31 = v30;
  v32 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  v34 = (void *)-[FigCaptureDeferredProcessingEngine _transientContainerForSettings:processingSettings:sourceAttributes:videoFormat:depthDataFormat:photoIdentifier:applicationIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56), v28, v29, v33, v32, *(void **)(a1 + 40));
  v35 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v35 + 48))
    goto LABEL_31;
  if (!-[FigCaptureDeferredProcessingEngine _shouldReuseGraphForContainer:](v35, v34))
  {
    v42 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v42 + 48))
    {
      if (dword_1ECFE93B0)
      {
        LODWORD(v63[0]) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v44 = v63[0];
        if (os_log_type_enabled(v43, type[0]))
          v45 = v44;
        else
          v45 = v44 & 0xFFFFFFFE;
        if (v45)
        {
          v46 = *(_QWORD *)(a1 + 40);
          v47 = *(void **)(a1 + 48);
          v48 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)v71 = 136315906;
          *(_QWORD *)&v71[4] = "-[FigCaptureDeferredProcessingEngine ensureGraphForSettings:processingSettings:applicatio"
                               "nID:]_block_invoke";
          *(_WORD *)&v71[12] = 2112;
          *(_QWORD *)&v71[14] = v46;
          *(_WORD *)&v71[22] = 2112;
          v72 = v47;
          LOWORD(v73[0]) = 2112;
          *(_QWORD *)((char *)v73 + 2) = v48;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v42 = *(_QWORD *)(a1 + 32);
      }
      -[FigCaptureDeferredProcessingEngine _releaseGraph](v42);
LABEL_41:

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = v34;
      -[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDimensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:](*(_QWORD *)(a1 + 32), v34, objc_msgSend(*(id *)(a1 + 56), "sensorRawPixelFormat"), objc_msgSend(*(id *)(a1 + 56), "sensorRawDimensions"), objc_msgSend(*(id *)(a1 + 56), "ultraHighResSensorRawDimensions"), objc_msgSend(v31, "soleHighResStillImageDimensions"), v32, *(void **)(a1 + 40));
      goto LABEL_42;
    }
LABEL_31:
    if (dword_1ECFE93B0)
    {
      LODWORD(v63[0]) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v50 = v63[0];
      if (os_log_type_enabled(v49, type[0]))
        v51 = v50;
      else
        v51 = v50 & 0xFFFFFFFE;
      if (v51)
      {
        v52 = *(_QWORD *)(a1 + 40);
        v53 = *(void **)(a1 + 48);
        v54 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)v71 = 136315906;
        *(_QWORD *)&v71[4] = "-[FigCaptureDeferredProcessingEngine ensureGraphForSettings:processingSettings:applicationI"
                             "D:]_block_invoke";
        *(_WORD *)&v71[12] = 2112;
        *(_QWORD *)&v71[14] = v52;
        *(_WORD *)&v71[22] = 2112;
        v72 = v53;
        LOWORD(v73[0]) = 2112;
        *(_QWORD *)((char *)v73 + 2) = v54;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_41;
  }
  if (dword_1ECFE93B0)
  {
    LODWORD(v63[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v37 = v63[0];
    if (os_log_type_enabled(v36, type[0]))
      v38 = v37;
    else
      v38 = v37 & 0xFFFFFFFE;
    if (v38)
    {
      v39 = *(_QWORD *)(a1 + 40);
      v40 = *(void **)(a1 + 48);
      v41 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)v71 = 136315906;
      *(_QWORD *)&v71[4] = "-[FigCaptureDeferredProcessingEngine ensureGraphForSettings:processingSettings:applicationID:]_block_invoke";
      *(_WORD *)&v71[12] = 2112;
      *(_QWORD *)&v71[14] = v39;
      *(_WORD *)&v71[22] = 2112;
      v72 = v40;
      LOWORD(v73[0]) = 2112;
      *(_QWORD *)((char *)v73 + 2) = v41;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_42:

}

- (FigCaptureDeferredProcessingJob)currentJob
{
  return self->_job;
}

- (uint64_t)_transientContainerForSettings:(void *)a3 processingSettings:(void *)a4 sourceAttributes:(void *)a5 videoFormat:(uint64_t)a6 depthDataFormat:(uint64_t)a7 photoIdentifier:(void *)a8 applicationIdentifier:
{
  int v12;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  float v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  void *v28;
  BWStillImageCaptureStreamSettings *v29;
  BWStillImageCaptureStreamSettings *v30;
  BWStillImageCaptureMetadata *v31;
  uint64_t v32;
  BWStillImageCaptureSettings *v33;
  uint64_t v34;
  BWStillImageCaptureSettings *v35;
  BWDeferredPipelineParameters *v36;
  id v37;
  int v38;
  uint64_t v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BWDeferredDictionaryIntermediate *v55;
  BWDeferredDictionaryIntermediate *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  BWDeferredDictionaryIntermediate *v61;
  uint64_t v62;
  uint64_t v63;
  BWDeferredDictionaryIntermediate *v64;
  BWDeferredDictionaryIntermediate *v65;
  BWDeferredProcessingContainerManager *v66;
  uint64_t v67;
  uint64_t v69;
  unsigned int v70;
  uint64_t v72;
  uint64_t v73;
  id v74;
  unsigned int v75;
  BWPhotoDescriptor *v76;
  BWDeferredPipelineParameters *v77;
  void *v78;
  FigCaptureCameraParameters *v80;
  void *v81;
  uint64_t v82;
  id obj;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  BWPhotoDescriptor *v88;
  _BYTE v89[128];
  uint64_t v90;
  uint64_t v91;
  _QWORD v92[8];
  _QWORD v93[8];
  _QWORD v94[3];

  v94[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v80 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v82 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", NSTemporaryDirectory());
  v12 = objc_msgSend(a2, "deferredSourceDeviceType");
  if ((v12 & 0xFFFFFFFD) == 4 || (v12 & 0xFFFFFFFE) == 8)
    v14 = 2;
  else
    v14 = v12;
  v15 = BWCaptureDevicePositionAndDeviceTypeToPortType(objc_msgSend(a2, "deferredSourcePosition"), v14);
  obj = (id)objc_msgSend(a3, "cameraInfoByPortType");
  v16 = (void *)objc_msgSend(obj, "objectForKeyedSubscript:", v15);
  v17 = +[FigCaptureCameraParameters sensorIDStringFromModuleInfo:](FigCaptureCameraParameters, "sensorIDStringFromModuleInfo:", objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D05948]));
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (objc_msgSend(a2, "rawOutputFormat"))
  {
    v19 = 1;
    v70 = 0x10000;
    v20 = 384;
  }
  else
  {
    if (objc_msgSend(a2, "depthDataDeliveryEnabled"))
      v20 = 5253120;
    else
      v20 = 5251072;
    v19 = 12;
    v70 = 4096;
  }
  v21 = objc_msgSend(a2, "resolutionFlavor");
  if (v21 == 2)
  {
    v24 = 0x100000010;
    if ((v20 & 0x80) == 0)
      v24 = 0x100000000;
    v20 |= v24;
    if (!objc_msgSend(v18, "objectForKeyedSubscript:", v15))
      objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), v15);
    objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v15), "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(objc_msgSend(a3, "ultraHighResSensorRawDimensions")), &unk_1E49F90A8);
    v72 = 0;
    v73 = 0x100000000;
  }
  else if (v21 == 1)
  {
    v20 |= 0x200000000uLL;
    HIDWORD(v72) = -[FigCaptureCameraParameters deepZoomVersion](v80, "deepZoomVersion");
    objc_msgSend(a3, "uiZoomFactor");
    if (v22 >= 1.4118
      && -[FigCaptureCameraParameters deepZoomTransferWithZoomedImageEnabledForPortType:sensorIDString:](v80, "deepZoomTransferWithZoomedImageEnabledForPortType:sensorIDString:", v15, v17))
    {
      v23 = 4;
    }
    else
    {
      v23 = 3;
    }
    LODWORD(v72) = v23;
    v73 = 0x100000001;
  }
  else
  {
    v72 = 0;
    v73 = 0;
  }
  if (objc_msgSend(v18, "count"))
    v74 = (id)objc_msgSend(v18, "copy");
  else
    v74 = 0;
  v78 = a3;
  if (objc_msgSend(a3, "sensorRawPixelFormat"))
  {
    v20 |= 4uLL;
    v25 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", 0x1E4952918), "BOOLValue");
    v26 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", 0x1E4952938), "BOOLValue");
    v27 = v25 | 2;
    if (!v26)
      v27 = v25;
    v75 = v27;
  }
  else
  {
    v75 = 0;
  }
  v28 = a4;
  v29 = [BWStillImageCaptureStreamSettings alloc];
  v30 = -[BWStillImageCaptureStreamSettings initWithPortType:captureType:captureFlags:referenceFrameIndex:timeMachineBracketedCaptureParams:preBracketFrameCaptureParams:unifiedBracketedCaptureParams:frameInfos:](v29, "initWithPortType:captureType:captureFlags:referenceFrameIndex:timeMachineBracketedCaptureParams:preBracketFrameCaptureParams:unifiedBracketedCaptureParams:frameInfos:", v15, v19, v20, 1, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  -[BWStillImageCaptureStreamSettings setSensorIDString:](v30, "setSensorIDString:", v17);
  v31 = objc_alloc_init(BWStillImageCaptureMetadata);
  -[BWStillImageCaptureMetadata setDeviceType:](v31, "setDeviceType:", objc_msgSend(a2, "deferredSourceDeviceType"));
  -[BWStillImageCaptureMetadata setDevicePosition:](v31, "setDevicePosition:", objc_msgSend(a2, "deferredSourcePosition"));
  v32 = v19;
  v33 = [BWStillImageCaptureSettings alloc];
  v34 = objc_msgSend(a2, "settingsID");
  v94[0] = v30;
  LOBYTE(v69) = 0;
  v35 = -[BWStillImageCaptureSettings initWithSettingsID:captureType:captureFlags:sceneFlags:frameStatisticsByPortType:deliverOriginalImage:deliverSushiRaw:captureStreamSettings:](v33, "initWithSettingsID:captureType:captureFlags:sceneFlags:frameStatisticsByPortType:deliverOriginalImage:deliverSushiRaw:captureStreamSettings:", v34, v32, v20, 0, 0, 0, v69, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 1));
  -[BWStillImageCaptureSettings setMasterPortType:](v35, "setMasterPortType:", v15);
  -[BWStillImageCaptureSettings setMetadata:](v35, "setMetadata:", v31);

  v36 = objc_alloc_init(BWDeferredPipelineParameters);
  v37 = +[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings");
  -[BWDeferredPipelineParameters setRawSensorDimensions:](v36, "setRawSensorDimensions:", objc_msgSend(a5, "sensorDimensions"));
  -[BWDeferredPipelineParameters setNrfVersion:](v36, "setNrfVersion:", -[FigCaptureCameraParameters nrfVersion](v80, "nrfVersion"));
  -[BWDeferredPipelineParameters setNoiseReductionAndFusionScheme:](v36, "setNoiseReductionAndFusionScheme:", objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", 0x1E4952998), "intValue"));
  -[BWDeferredPipelineParameters setIntelligentDistortionCorrectionEnabled:](v36, "setIntelligentDistortionCorrectionEnabled:", 0);
  -[BWDeferredPipelineParameters setDimensionsByQSubResolutionFlavorByPortType:](v36, "setDimensionsByQSubResolutionFlavorByPortType:", v74);
  -[BWDeferredPipelineParameters setGeometricDistortionCorrectionEnabled:](v36, "setGeometricDistortionCorrectionEnabled:", 0);
  -[BWDeferredPipelineParameters setDistortionCorrectionVersion:](v36, "setDistortionCorrectionVersion:", 0);
  -[BWDeferredPipelineParameters setDeepZoomVersion:](v36, "setDeepZoomVersion:", HIDWORD(v72));
  -[BWDeferredPipelineParameters setDeepZoomMode:](v36, "setDeepZoomMode:", v72);
  v38 = objc_msgSend(a5, "semanticRenderingSupported");
  v39 = 0;
  if (v38)
    v39 = objc_msgSend((id)objc_msgSend(v37, "commonSettings", 0), "semanticRenderingVersion");
  -[BWDeferredPipelineParameters setSemanticRenderingVersion:](v36, "setSemanticRenderingVersion:", v39);
  -[BWDeferredPipelineParameters setGenerateInferencesForSemanticProcessingIfNeeded:](v36, "setGenerateInferencesForSemanticProcessingIfNeeded:", v73);
  -[BWDeferredPipelineParameters setQuadraProcessingSupportEnabled:](v36, "setQuadraProcessingSupportEnabled:", HIDWORD(v73));
  -[BWDeferredPipelineParameters setCanProcessEnhancedResolution:](v36, "setCanProcessEnhancedResolution:", v73);
  -[BWDeferredPipelineParameters setSfhrMode:](v36, "setSfhrMode:", v75);
  objc_msgSend(a5, "sensorCenterOffset");
  -[BWDeferredPipelineParameters setSensorCenterOffset:](v36, "setSensorCenterOffset:");
  if (objc_msgSend(a2, "depthDataDeliveryEnabled"))
  {
    if (-[BWDeferredPipelineParameters intelligentDistortionCorrectionEnabled](v36, "intelligentDistortionCorrectionEnabled")|| -[BWDeferredPipelineParameters geometricDistortionCorrectionEnabled](v36, "geometricDistortionCorrectionEnabled"))
    {
      -[BWDeferredPipelineParameters setDcProcessingWithDepthSupported:](v36, "setDcProcessingWithDepthSupported:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DepthDataDeliveryConfigurations")), "objectForKeyedSubscript:", CFSTR("DCProcessingSupported")), "BOOLValue"));
    }
    objc_msgSend(a5, "maxContinuousZoomFactorForDepthDataDelivery");
    -[BWDeferredPipelineParameters setContinuousZoomWithDepthSupported:](v36, "setContinuousZoomWithDepthSupported:", v40 != 0.0);
    -[BWDeferredPipelineParameters setPearlModuleType:](v36, "setPearlModuleType:", objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PearlModuleType")), "intValue"));
  }
  v77 = v36;
  if ((objc_msgSend(a5, "isSmartStyleRenderingSupported") & 1) != 0)
  {
    v41 = objc_msgSend((id)objc_msgSend(v37, "commonSettings"), "smartStyleRenderingVersion");
    -[BWDeferredPipelineParameters setSmartStyleRenderingVersion:](v36, "setSmartStyleRenderingVersion:", v41);
    if ((_DWORD)v41)
    {
      if (objc_msgSend(a5, "isPhotoFormat"))
        v42 = FigCaptureClientApplicationIDIsCameraOrDerivative(a8);
      else
        v42 = 0;
      v43 = a7;
      v44 = v70;
      -[BWDeferredPipelineParameters setSmartStyleReversibilityEnabled:](v36, "setSmartStyleReversibilityEnabled:", v42);
      -[BWDeferredPipelineParameters setSmartStyleLinearThumbnailDimensions:](v36, "setSmartStyleLinearThumbnailDimensions:", 0x30000000400);
      -[BWDeferredPipelineParameters setSmartStyleStyledThumbnailDimensions:](v36, "setSmartStyleStyledThumbnailDimensions:", 0xC000000100);
      goto LABEL_50;
    }
  }
  else
  {
    -[BWDeferredPipelineParameters setSmartStyleRenderingVersion:](v36, "setSmartStyleRenderingVersion:", 0);
  }
  -[BWDeferredPipelineParameters setSmartStyleReversibilityEnabled:](v36, "setSmartStyleReversibilityEnabled:", 0);
  v43 = a7;
  v44 = v70;
LABEL_50:
  v81 = a2;
  v76 = -[BWPhotoDescriptor initWithPhotoIdentifier:processingFlags:]([BWPhotoDescriptor alloc], "initWithPhotoIdentifier:processingFlags:", v43, v44);
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v92[0] = *MEMORY[0x1E0CA90E0];
  v93[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a5, "sensorDimensions"));
  v92[1] = *MEMORY[0x1E0CA8FD8];
  v46 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unint64_t)objc_msgSend(a5, "sensorDimensions") >> 32);
  v47 = *MEMORY[0x1E0CA9040];
  v93[1] = v46;
  v93[2] = &unk_1E49F90D8;
  v48 = *MEMORY[0x1E0CA8F68];
  v92[2] = v47;
  v92[3] = v48;
  v49 = *MEMORY[0x1E0CA9048];
  v93[3] = &unk_1E49F90F0;
  v93[4] = &unk_1E49F9108;
  v50 = *MEMORY[0x1E0CA8FF0];
  v92[4] = v49;
  v92[5] = v50;
  v90 = *MEMORY[0x1E0CBC188];
  v91 = MEMORY[0x1E0C9AAA0];
  v51 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
  v52 = *MEMORY[0x1E0CA8F80];
  v93[5] = v51;
  v93[6] = &unk_1E4A00728;
  v53 = *MEMORY[0x1E0CA9000];
  v92[6] = v52;
  v92[7] = v53;
  v93[7] = MEMORY[0x1E0C9AAB0];
  v54 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 8);
  v55 = [BWDeferredDictionaryIntermediate alloc];
  v56 = -[BWDeferredDictionaryIntermediate initWithDictionary:tag:URL:](v55, "initWithDictionary:tag:URL:", v54, BWDeferredIntermediateTagSourceNodePixelBufferAttributes, v82);
  objc_msgSend(v45, "addObject:", v56);

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v85 != v59)
          objc_enumerationMutation(obj);
        v61 = -[BWDeferredDictionaryIntermediate initWithDictionary:tag:URL:]([BWDeferredDictionaryIntermediate alloc], "initWithDictionary:tag:URL:", objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i)), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), BWDeferredIntermediateTagCameraInfoByPortTypePrefix, *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i)), v82);
        objc_msgSend(v45, "addObject:", v61);

      }
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v89, 16);
    }
    while (v58);
  }
  v62 = objc_msgSend(v78, "moduleCalibrationByPortType");
  if (v62)
  {
    v63 = v62;
    v64 = [BWDeferredDictionaryIntermediate alloc];
    v65 = -[BWDeferredDictionaryIntermediate initWithDictionary:tag:URL:](v64, "initWithDictionary:tag:URL:", v63, BWDeferredIntermediateTagModuleCalibrationByPortType, v82);
    objc_msgSend(v45, "addObject:", v65);

  }
  v66 = +[BWDeferredProcessingContainerManager sharedInstance](BWDeferredProcessingContainerManager, "sharedInstance");
  v88 = v76;
  v67 = -[BWDeferredProcessingContainerManager createTransientContainerWithApplicationID:resolvedSettings:unresolvedSettings:pipelineParameters:intermediates:photoDescriptors:](v66, "createTransientContainerWithApplicationID:resolvedSettings:unresolvedSettings:pipelineParameters:intermediates:photoDescriptors:", a8, v35, v81, v77, v45, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1));

  return v67;
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

- (void)ensureGraphForSettings:(id)a3 processingSettings:(id)a4 applicationID:(id)a5
{
  NSObject *workQueue;
  _QWORD block[9];
  _QWORD v7[3];
  int v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__FigCaptureDeferredProcessingEngine_ensureGraphForSettings_processingSettings_applicationID___block_invoke;
  block[3] = &unk_1E4920590;
  block[4] = self;
  block[5] = a5;
  block[6] = a3;
  block[7] = a4;
  block[8] = v7;
  dispatch_sync(workQueue, block);
  _Block_object_dispose(v7, 8);
}

+ (id)sharedProcessingEngine
{
  if (sharedProcessingEngine_sOnceEngineToken != -1)
    dispatch_once(&sharedProcessingEngine_sOnceEngineToken, &__block_literal_global_37);
  return (id)sharedProcessingEngine_sEngine;
}

- (void)_shouldReuseGraphForContainer:(uint64_t)a1
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  _BOOL4 v17;
  unsigned int v18;
  _BOOL4 v20;
  int v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  uint8x8_t v25;
  uint8x8_t v26;
  int v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  __int16 v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL4 v45;
  void *v46;
  __int32 v47;
  __int32 v48;
  int v49;
  int v50;
  int v51;
  int v52;
  _BOOL4 v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a2;
  v4 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType");
  v5 = objc_msgSend(v2, "pipelineParameters");
  if (v2)
  {
    v6 = (void *)v5;
    v58 = 0;
    v7 = (void *)objc_msgSend(v2, "copyDictionaryForTag:err:", BWDeferredIntermediateTagSourceNodePixelBufferAttributes, &v58);
    v8 = v7;
    if (v58
      || (v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "unsignedLongValue"),
          v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "unsignedLongValue"), (v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "outputForPortType:", v4), "primaryMediaProperties"), "resolvedVideoFormat")) == 0))
    {
      v2 = 0;
    }
    else
    {
      v12 = v11;
      v13 = objc_msgSend(v11, "width");
      v14 = objc_msgSend(v12, "height");
      v15 = *(void **)(a1 + 16);
      if (v15 == (void *)v4)
        v57 = 1;
      else
        v57 = objc_msgSend(v15, "isEqualToString:", v4);
      v56 = objc_msgSend(*(id *)(a1 + 24), "isEqual:", v6);
      v55 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings"), "captureType");
      v54 = objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureType");
      v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "deferredPhotoFinalWidth");
      if (v16 >= objc_msgSend((id)objc_msgSend(v2, "settings"), "deferredPhotoFinalWidth"))
      {
        v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "deferredPhotoFinalHeight");
        v17 = v18 >= objc_msgSend((id)objc_msgSend(v2, "settings"), "deferredPhotoFinalHeight");
      }
      else
      {
        v17 = 0;
      }
      v45 = v17;
      v20 = v13 == v9 && v14 == v10;
      v52 = *(unsigned __int8 *)(a1 + 32);
      v53 = v20;
      v21 = fcdpe_demosaicedRawEnabled(v2);
      v50 = *(unsigned __int8 *)(a1 + 32);
      v51 = v21;
      v46 = v8;
      if ((objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureFlags") & 0x200000000) != 0)
      {
        v23 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "semanticStyle") == 0;
        v22 = v23 ^ (objc_msgSend((id)objc_msgSend(v2, "settings"), "semanticStyle") != 0);
      }
      else
      {
        v22 = 1;
      }
      v49 = v22;
      v24 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings"), "captureFlags");
      v25 = (uint8x8_t)vcnt_s8((int8x8_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings"), "learnedNRStereoPhotoFrameFlag"));
      v25.i16[0] = vaddlv_u8(v25);
      v48 = v25.i32[0];
      v26 = (uint8x8_t)vcnt_s8((int8x8_t)objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"));
      v26.i16[0] = vaddlv_u8(v26);
      v47 = v26.i32[0];
      v27 = *(unsigned __int8 *)(a1 + 33);
      v28 = *(_BYTE *)(a1 + 33) != 0;
      v29 = (void *)objc_msgSend(v2, "settings");
      v30 = (void *)objc_msgSend(v2, "captureSettings");
      v31 = (void *)objc_msgSend(v2, "applicationID");
      v32 = objc_msgSend(v30, "captureFlags");
      v33 = FigCaptureClientApplicationIDIsCameraOrDerivative(v31);
      v34 = objc_msgSend(v30, "captureFlags");
      v35 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(v29, "processedImageFilters"));
      v36 = v32 & 0x800;
      v37 = v28 ^ (v36 == 0);
      if (v27 && !v36 && v33)
      {
        v38 = v35;
        if (objc_msgSend(v6, "continuousZoomWithDepthSupported"))
        {
          if ((v34 & 0x100000000) != 0)
            v37 = 0;
          else
            v37 = v38 ^ 1;
        }
        else
        {
          v37 = 0;
        }
      }
      if ((BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "processedImageFilters")) & 1) != 0)v39 = 1;
      else
        v39 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(v2, "settings"), "processedImageFilters")) ^ 1;
      v40 = v57 & v56;
      if (v55 != v54)
        v40 = 0;
      v41 = v40 & v45 & v53;
      if (v52 != v51)
        v41 = 0;
      if (v50)
        v41 = 0;
      if ((v24 & 0x100000000) != 0)
        v41 = 0;
      v42 = v41 & v49;
      if (v48 != v47)
        v42 = 0;
      v2 = (void *)(v42 & v37 & v39);
      if (dword_1ECFE93B0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        v8 = v46;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        v8 = v46;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v2;
}

- (uint64_t)expectsGainMapForSettings:(void *)a3 captureSettings:
{
  int v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!result)
    return result;
  v5 = objc_msgSend(a3, "captureType");
  v6 = objc_msgSend(a3, "captureFlags");
  v7 = -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion") >> 16;
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      if (objc_msgSend(a2, "depthDataDeliveryEnabled"))
      {
        v8 = (v6 >> 7) & 1;
        if (v5 != 1)
          LODWORD(v8) = 1;
        return v8 & (v6 >> 11);
      }
      if (v5 != 1)
        return (v6 & 0x100000) != 0 || (v5 - 11) < 2;
      if ((v6 & 0x80) != 0)
        return -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion") > 2;
    }
    return 0;
  }
  v9 = (v6 >> 7) & 1;
  if (v5 != 1)
    LODWORD(v9) = 1;
  v10 = (v6 >> 20) & 1;
  if ((v5 - 11) < 2)
    LODWORD(v10) = 1;
  if (v5 == 2)
    LODWORD(v10) = 1;
  if ((v6 & 0x880) != 0)
    return v9;
  else
    return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDeferredProcessingEngine;
  -[FigCaptureDeferredProcessingEngine dealloc](&v3, sel_dealloc);
}

- (BWDeferredProcessingContainer)currentContainer
{
  BWDeferredProcessingContainer *prewarmedContainer;
  BWDeferredProcessingContainer *v3;
  BWDeferredProcessingContainer *v4;

  prewarmedContainer = self->_prewarmedContainer;
  v3 = -[FigCaptureDeferredProcessingJob container](self->_job, "container");
  if (prewarmedContainer)
    v4 = 0;
  else
    v4 = v3;
  if (v3)
    return v4;
  else
    return prewarmedContainer;
}

- (void)graph:(id)a3 didFinishStartingWithError:(int)a4
{
  NSObject *workQueue;
  _QWORD v5[5];
  int v6;

  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__FigCaptureDeferredProcessingEngine_graph_didFinishStartingWithError___block_invoke;
  v5[3] = &unk_1E4920568;
  v6 = a4;
  v5[4] = self;
  dispatch_async(workQueue, v5);
}

void __71__FigCaptureDeferredProcessingEngine_graph_didFinishStartingWithError___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v3, "currentJob"), "failedWithError:", *(unsigned int *)(a1 + 40));
    -[FigCaptureDeferredProcessingEngine _handleJobCompletion:](*(void **)(a1 + 32), *(unsigned int *)(a1 + 40));
  }
  else
  {
    v4 = (void *)objc_msgSend(v3, "currentContainer");
    v5 = (void *)objc_msgSend(v4, "pipelineParameters");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "masterPortType"), "copy");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = objc_msgSend(v5, "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = fcdpe_demosaicedRawEnabled(v4);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = (objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "captureFlags") & 0x800) != 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = -[FigCaptureDeferredProcessingEngine _stillImageSettingsForContainer:](*(BWStillImageSettings **)(a1 + 32), v4);
    if (objc_msgSend(*(id *)(a1 + 32), "currentJob"))
      -[FigCaptureDeferredProcessingEngine _runJob](*(BWStillImageSettings **)(a1 + 32));
  }
}

- (BWStillImageSettings)_stillImageSettingsForContainer:(BWStillImageSettings *)result
{
  if (result)
    return -[BWStillImageSettings initWithRequestedSettings:captureSettings:processingSettings:]([BWStillImageSettings alloc], "initWithRequestedSettings:captureSettings:processingSettings:", objc_msgSend(a2, "settings"), objc_msgSend(a2, "captureSettings"), -[BWStillImageProcessingSettings initWithPhotoManifest:processIntelligentDistortionCorrection:]([BWStillImageProcessingSettings alloc], "initWithPhotoManifest:processIntelligentDistortionCorrection:", objc_msgSend(a2, "photoManifest"), objc_msgSend((id)objc_msgSend(a2, "pipelineParameters"), "intelligentDistortionCorrectionEnabled")));
  return result;
}

- (void)_runJob
{
  uint64_t v1;
  void *v3;
  void *v4;
  _DWORD *v5;
  BWStillImageSettings *v6;
  __int128 v7;
  __int128 v8;
  id v9;
  OSStatus v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  CMSampleTimingInfo *sampleTimingArray;
  CMSampleTimingInfo *sampleTimingArraya;
  uint64_t v18;
  CMTime v19;
  CMSampleTimingInfo v20;
  CMSampleBufferRef v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (void *)-[BWStillImageSettings currentJob](a1, "currentJob");
    v4 = (void *)objc_msgSend(v3, "container");
    if (!_FigIsCurrentDispatchQueue())
    {
      v18 = v1;
      LODWORD(sampleTimingArray) = 0;
      FigDebugAssert3();
    }
    v5 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      objc_msgSend(v4, "captureRequestIdentifierBytesLow");
      objc_msgSend(v4, "captureRequestIdentifierBytesHigh");
      kdebug_trace();
    }
    objc_msgSend(v3, "start", sampleTimingArray, v18);
    v6 = -[FigCaptureDeferredProcessingEngine _stillImageSettingsForContainer:](a1, v4);
    if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](v6, "captureSettings"), "captureFlags") & 0x100000000) == 0)objc_msgSend((id)-[objc_class outputForPortType:](a1[2].super.isa, "outputForPortType:", -[BWStillImageCaptureSettings masterPortType](-[BWStillImageSettings captureSettings](v6, "captureSettings"), "masterPortType")), "emitStillImagePrewarmMessageWithSettings:", v6);
    v21 = 0;
    v7 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&v20.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&v20.decodeTimeStamp.value = v7;
    v20.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v8 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&v20.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&v20.duration.epoch = v8;
    v9 = -[NSArray firstObject](-[BWPhotoManifest photoDescriptors](-[BWStillImageProcessingSettings photoManifest](-[BWStillImageSettings processingSettings](v6, "processingSettings"), "photoManifest"), "photoDescriptors"), "firstObject");
    if (v9)
      objc_msgSend(v9, "presentationTimeStamp");
    else
      memset(&v19, 0, sizeof(v19));
    v20.presentationTimeStamp = v19;
    v10 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &v20, 0, 0, &v21);
    v11 = v10;
    if (v10)
    {
      LODWORD(sampleTimingArraya) = v10;
      FigDebugAssert3();
      objc_msgSend(v3, "failedWithError:", v11, sampleTimingArraya, v1);
      -[FigCaptureDeferredProcessingEngine _reportCoreAnalyticsDataWithError:job:]((uint64_t)a1, v11, (void *)-[BWStillImageSettings currentJob](a1, "currentJob"));
      -[FigCaptureDeferredProcessingEngine _cleanupFromJob]((uint64_t)a1);
    }
    else
    {
      v12 = *MEMORY[0x1E0D06EB8];
      v23[0] = MEMORY[0x1E0C9AAB0];
      v13 = *MEMORY[0x1E0D06D00];
      v22[0] = v12;
      v22[1] = v13;
      v23[1] = -[BWStillImageCaptureSettings masterPortType](-[BWStillImageSettings captureSettings](v6, "captureSettings"), "masterPortType");
      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v15 = (const void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v14);
      CMSetAttachment(v21, (CFStringRef)*MEMORY[0x1E0D05CB0], v15, 1u);
      CMSetAttachment(v21, CFSTR("StillSettings"), v6, 1u);
      CMSetAttachment(v21, CFSTR("PhotoManifest"), -[BWStillImageProcessingSettings photoManifest](-[BWStillImageSettings processingSettings](v6, "processingSettings"), "photoManifest"), 1u);
      CMSetAttachment(v21, CFSTR("BWStillImageCaptureSettings"), (CFTypeRef)objc_msgSend(v4, "captureSettings"), 1u);
      CMSetAttachment(v21, CFSTR("StillImageCaptureType"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "captureType")), 1u);
      CMSetAttachment(v21, CFSTR("StillImageSettings"), (CFTypeRef)objc_msgSend(v4, "settings"), 1u);
      CMSetAttachment(v21, CFSTR("DeferredProcessingContainer"), v4, 1u);
      -[objc_class processBuffer:](a1[2].super.isa, "processBuffer:", v21);
      if (v21)
        CFRelease(v21);
    }
    if (*v5 == 1)
      kdebug_trace();
  }
}

- (void)_handleJobCompletion:(void *)a1
{
  if (a1)
  {
    -[FigCaptureDeferredProcessingEngine _reportCoreAnalyticsDataWithError:job:]((uint64_t)a1, a2, (void *)objc_msgSend(a1, "currentJob"));
    -[FigCaptureDeferredProcessingEngine _cleanupFromJob]((uint64_t)a1);
  }
}

- (void)executeJob:(id)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__FigCaptureDeferredProcessingEngine_executeJob___block_invoke;
  v4[3] = &unk_1E491E748;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(workQueue, v4);
}

void __49__FigCaptureDeferredProcessingEngine_executeJob___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE93B0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "setInteractiveQoS:", qos_class_self() > 0x18, v10, v12);
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 72))
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A client requested deferred processing for a container while a job was in-progress for another client")), 0));
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v4 + 48))
  {
    v5 = -[FigCaptureDeferredProcessingEngine _shouldReuseGraphForContainer:](v4, (void *)objc_msgSend(*(id *)(a1 + 32), "container"));
    v6 = *(_QWORD *)(a1 + 40);
    if ((v5 & 1) != 0)
    {
      *(_BYTE *)(v6 + 120) = 1;
      if (dword_1ECFE93B0)
      {
        v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[FigCaptureDeferredProcessingEngine _runJob](*(BWStillImageSettings **)(a1 + 40));
      return;
    }
    -[FigCaptureDeferredProcessingEngine _releaseGraph](v6);
    v4 = *(_QWORD *)(a1 + 40);
  }
  *(_BYTE *)(v4 + 120) = 0;
  if (dword_1ECFE93B0)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[FigCaptureDeferredProcessingEngine _ensureGraphForJob:applicationID:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "processorRequest", v11, v13), "applicationID"));
}

- (void)_releaseGraph
{
  int v2;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 56);
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 48), "stop:", 0);
    *(_BYTE *)(a1 + 56) = 0;

    *(_QWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 64) = 0;

    *(_QWORD *)(a1 + 112) = 0;
    objc_msgSend(*(id *)(a1 + 104), "disable");

    *(_QWORD *)(a1 + 104) = 0;
    *(_QWORD *)(a1 + 16) = 0;

    *(_QWORD *)(a1 + 24) = 0;
    *(_WORD *)(a1 + 32) = 0;
    if (v2)
      -[BWDeferredTransactionBroker closeTransaction:](+[BWDeferredTransactionBroker sharedInstance](BWDeferredTransactionBroker, "sharedInstance"), "closeTransaction:", 0);
  }
}

- (void)_ensureGraphForJob:(void *)a3 applicationID:
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = (void *)objc_msgSend(a2, "container");
    v27 = (void *)objc_msgSend(a2, "processorRequest");
    v29 = a1;
    v30 = a3;
    v28 = v6;
    v26 = a2;
    if ((objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "captureFlags") & 4) != 0
      && (v35 = 0u,
          v36 = 0u,
          v33 = 0u,
          v34 = 0u,
          v7 = (void *)objc_msgSend(v6, "intermediates"),
          (v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16)) != 0))
    {
      v9 = v8;
      *((_QWORD *)&v31 + 1) = 0;
      v32 = 0uLL;
      DWORD1(v31) = 0;
      v10 = *(_QWORD *)v34;
      v11 = *MEMORY[0x1E0CA90E0];
      v12 = *MEMORY[0x1E0CA8FD8];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v14, "isMemberOfClass:", objc_opt_class()))
          {
            if (objc_msgSend(v14, "bufferType") == 1)
            {
              v15 = (void *)objc_msgSend(v14, "attributes");
              v16 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v11), "unsignedIntValue");
              v17 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v12), "unsignedIntValue");
              if ((int)v17 * v16 > DWORD1(v32) * DWORD2(v32))
              {
                v18 = v17;
                LODWORD(v32) = objc_msgSend(v14, "pixelFormat");
                DWORD1(v32) = v16;
                *((_QWORD *)&v32 + 1) = v18;
              }
            }
            else if (objc_msgSend(v14, "bufferType") == 2001)
            {
              v19 = (void *)objc_msgSend(v14, "attributes");
              v20 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v11), "unsignedIntValue");
              v21 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v12), "unsignedIntValue");
              if (v20 >= v21)
                v22 = v21;
              else
                v22 = v20;
              *((_QWORD *)&v31 + 1) = v22;
              if (v20 <= v21)
                v23 = v21;
              else
                v23 = v20;
              DWORD1(v31) = v23;
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v9);
    }
    else
    {
      *((_QWORD *)&v31 + 1) = 0;
      v32 = 0uLL;
      DWORD1(v31) = 0;
    }
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "container"), "pipelineParameters"), "rawSensorDimensions")))
    {
      v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "container"), "pipelineParameters"), "rawSensorDimensions");
      v25 = v32 >> 32;
    }
    else
    {
      v25 = v32 >> 32;
      v24 = v25;
    }
    -[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDimensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:](v29, v28, v32, v24, v25, v31 >> 32, objc_msgSend(v27, "photoIdentifier"), v30);
  }
}

- (void)releaseResourcesForClientPID:(int)a3
{
  dispatch_block_t v4;
  _QWORD v5[5];
  int v6;
  int v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__FigCaptureDeferredProcessingEngine_releaseResourcesForClientPID___block_invoke;
  v5[3] = &unk_1E491F158;
  v5[4] = self;
  v6 = a3;
  v7 = 25;
  v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v5);
  dispatch_async((dispatch_queue_t)self->_workQueue, v4);
  dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

void __67__FigCaptureDeferredProcessingEngine_releaseResourcesForClientPID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "processorRequest"), "clientPID") == *(_DWORD *)(a1 + 40)|| !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    if (dword_1ECFE93B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[FigCaptureDeferredProcessingEngine _releaseGraph](*(_QWORD *)(a1 + 32));

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
  else
  {
    v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)releasePrewarmingResources
{

  self->_prewarmedContainer = 0;
}

- (void)immediateTermination
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__FigCaptureDeferredProcessingEngine_immediateTermination__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __58__FigCaptureDeferredProcessingEngine_immediateTermination__block_invoke(uint64_t a1)
{
  -[FigCaptureDeferredProcessingEngine _cleanupFromJob](*(_QWORD *)(a1 + 32));
}

- (void)_cleanupFromJob
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();

    *(_QWORD *)(a1 + 72) = 0;
  }
}

void __196__FigCaptureDeferredProcessingEngine__ensureGraphForProcessingContainer_sensorRawPixelFormat_sensorRawDimensions_ultraHighResSensorRawDimensions_depthDataDimensions_photoIdentifier_applicationID___block_invoke(uint64_t a1, const void *a2, int a3, void *a4)
{
  -[FigCaptureDeferredProcessingEngine _handleProcessedStillImage:error:settings:](*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2, a3, a4);
}

- (void)_handleProcessedStillImage:(int)a3 error:(void *)a4 settings:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL4 IsDemosaicedRaw;
  NSObject *v13;
  _QWORD block[10];
  int v15;

  if (!a1)
    return;
  v8 = (void *)objc_msgSend(a1, "currentJob");
  v9 = objc_msgSend(a4, "captureRequestIdentifier");
  v10 = objc_msgSend((id)objc_msgSend(v8, "processorRequest"), "photoIdentifier");
  if (a3)
    goto LABEL_10;
  v11 = objc_msgSend(a4, "outputFormat");
  IsDemosaicedRaw = FigCapturePixelFormatIsDemosaicedRaw(objc_msgSend(a4, "rawOutputFormat"));
  if (v11 && IsDemosaicedRaw)
  {
    a3 = -12780;
LABEL_10:
    if (!a1[9])
      return;
  }
  if (a2)
    CFRetain(a2);
  v13 = a1[1];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__FigCaptureDeferredProcessingEngine__handleProcessedStillImage_error_settings___block_invoke;
  block[3] = &unk_1E49205E0;
  block[4] = v9;
  block[5] = v8;
  v15 = a3;
  block[6] = a1;
  block[7] = v10;
  block[8] = a4;
  block[9] = a2;
  dispatch_async(v13, block);
}

void __80__FigCaptureDeferredProcessingEngine__handleProcessedStillImage_error_settings___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  const void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "processorRequest"), "captureRequestIdentifier")) & 1) == 0)objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished processing of photo with capture request identifier %@ but for processing job with identifier %@"), *(_QWORD *)(a1 + 32), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "processorRequest"), "captureRequestIdentifier")), 0));
  objc_msgSend(*(id *)(a1 + 40), "setNumberOfPhotosDelivered:", objc_msgSend(*(id *)(a1 + 40), "numberOfPhotosDelivered") + 1);
  v2 = *(unsigned int *)(a1 + 80);
  if ((_DWORD)v2)
  {
    if (dword_1ECFE93B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v2 = *(unsigned int *)(a1 + 80);
    }
    objc_msgSend(*(id *)(a1 + 40), "failedWithError:", v2, v7, v8);
  }
  else
  {
    objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 72), CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
    BWPixelBufferDimensionsFromSampleBuffer(*(opaqueCMSampleBuffer **)(a1 + 72));
    if (dword_1ECFE93B0)
    {
      v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(a1 + 40), "completedWithSampleBuffer:", *(_QWORD *)(a1 + 72), v7, v8);
  }
  v5 = *(const void **)(a1 + 72);
  if (v5)
    CFRelease(v5);
  v6 = objc_msgSend(*(id *)(a1 + 40), "numberOfPhotosDelivered");
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "container"), "photoManifest"), "photoDescriptors"), "count") == v6)-[FigCaptureDeferredProcessingEngine _handleJobCompletion:](*(void **)(a1 + 48), *(unsigned int *)(a1 + 80));
}

- (uint64_t)_reportCoreAnalyticsDataWithError:(void *)a3 job:
{
  void *v5;
  __CFString *v6;
  BWDeferredProcessingAnalyticsPayload *v7;
  uint64_t v8;

  if (result)
  {
    result = objc_msgSend(a3, "container");
    v5 = (void *)result;
    if ((_DWORD)a2 == -16140)
    {
      v6 = CFSTR("OutOfProcessingAttempts");
    }
    else if ((_DWORD)a2)
    {
      result = +[FigCaptureDeferredProcessingJob isPotentiallyRecoverableError:](FigCaptureDeferredProcessingJob, "isPotentiallyRecoverableError:", a2);
      v6 = (__CFString *)((_DWORD)result ? 0x1E492CC98 : 0x1E494BE78);
    }
    else
    {
      v6 = CFSTR("Success");
    }
    if (v6 != CFSTR("Unknown"))
    {
      v7 = objc_alloc_init(BWDeferredProcessingAnalyticsPayload);
      -[BWDeferredProcessingAnalyticsPayload setError:](v7, "setError:", a2);
      -[BWDeferredProcessingAnalyticsPayload setProcessingResult:](v7, "setProcessingResult:", v6);
      if (v5)
      {
        -[BWDeferredProcessingAnalyticsPayload setContainerAgeInSeconds:](v7, "setContainerAgeInSeconds:", objc_msgSend(v5, "ageSeconds"));
        -[BWDeferredProcessingAnalyticsPayload setContainerSizeInBytes:](v7, "setContainerSizeInBytes:", objc_msgSend(v5, "sizeBytes"));
        -[BWDeferredProcessingAnalyticsPayload setProcessingType:](v7, "setProcessingType:", objc_msgSend(v5, "processingType"));
        -[BWDeferredProcessingAnalyticsPayload setFileBacked:](v7, "setFileBacked:", objc_msgSend(v5, "isRemote") ^ 1);
        if ((_DWORD)a2 == -16140)
          v8 = 0xFFFFFFFFLL;
        else
          v8 = objc_msgSend(v5, "processingCount");
        -[BWDeferredProcessingAnalyticsPayload setContainerProcessingCount:](v7, "setContainerProcessingCount:", v8);
      }
      -[BWDeferredProcessingAnalyticsPayload setInteractiveQoS:](v7, "setInteractiveQoS:", objc_msgSend(a3, "isInteractiveQoS"));
      -[BWDeferredProcessingAnalyticsPayload setGraphPrepareDurationInMilliseconds:](v7, "setGraphPrepareDurationInMilliseconds:", objc_msgSend(a3, "prepareGraphNS") / 0xF4240uLL);
      -[BWDeferredProcessingAnalyticsPayload setJobDurationInMilliseconds:](v7, "setJobDurationInMilliseconds:", objc_msgSend(a3, "durationNS") / 0xF4240uLL);
      return -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v7);
    }
  }
  return result;
}

- (BOOL)lastJobReusedGraph
{
  return self->_lastJobReusedGraph;
}

@end
