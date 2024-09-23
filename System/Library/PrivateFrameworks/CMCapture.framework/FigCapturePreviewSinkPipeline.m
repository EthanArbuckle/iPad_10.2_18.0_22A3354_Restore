@implementation FigCapturePreviewSinkPipeline

- (BWImageQueueSinkNode)imageQueueSinkNode
{
  return self->_imageQueueSinkNode;
}

- (BOOL)depthFilterRenderingEnabled
{
  return self->_depthFilterRenderingEnabled;
}

- (void)prepareForRenderingWithPreparedPixelBufferPool
{
  -[BWStreamingFilterNode prepareForRenderingWithPreparedPixelBufferPool](self->_filterNode, "prepareForRenderingWithPreparedPixelBufferPool");
}

- (void)setPreviewTapRegistered:(BOOL)a3
{
  BWPreviewStitcherNode *previewStitcher;

  previewStitcher = self->_previewStitcher;
  if (previewStitcher)
    -[BWPreviewStitcherNode setPreviewTapRegistered:](previewStitcher, "setPreviewTapRegistered:", a3);
}

- (void)setDiscardsImageQueueSampleData:(BOOL)a3
{
  -[BWNodeOutput setDiscardsSampleData:](-[BWNodeConnection output](-[BWNodeInput connection](-[BWNode input](self->_imageQueueSinkNode, "input"), "connection"), "output"), "setDiscardsSampleData:", a3);
}

- (uint64_t)_buildVideoPreviewSinkPipeline:(uint64_t)a3 sourcePreviewOutput:(void *)a4 graph:(uint64_t)a5 inferenceScheduler:(void *)a6 captureDevice:(uint64_t)a7 previewTapDelegate:(uint64_t)a8 zoomPIPOverlayDelegate:
{
  uint64_t v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  float v16;
  unsigned int v17;
  uint64_t v18;
  _BOOL4 v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  __objc2_class **v29;
  BWFrameRateGovernorNode *v30;
  BWFanOutNode *v31;
  char **v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  float v37;
  BWSmartStyleApplyNode *v38;
  BWSmartStyleApplyNode *v39;
  uint64_t v40;
  uint64_t v41;
  BWPipelineStage *v42;
  BWFaceTrackingNode *v43;
  BWFaceTrackingNode *v44;
  BWFaceTrackingNode *v45;
  double v46;
  double v47;
  BWFanOutNode *v48;
  void *v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned int v52;
  unsigned __int8 v53;
  id v54;
  BWPocketDetectionNode *v55;
  uint64_t v56;
  BWPocketDetectionNode *v57;
  BWPocketDetectionNode *v58;
  _BOOL4 v59;
  BWPreviewStabilizationNode *v60;
  BWPreviewStabilizationNode *v61;
  int *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  _BOOL8 v68;
  uint64_t v69;
  void *v70;
  double v71;
  _BOOL4 v72;
  double v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  id v77;
  BWPreviewStitcherNode *v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  _BOOL8 v82;
  BWPreviewStitcherNode *v83;
  BWPreviewStitcherNode *v84;
  int v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  BOOL v89;
  BWPreviewStitcherNode *v90;
  char v91;
  char v92;
  double v93;
  BWPreviewStitcherNode *v94;
  float v95;
  float v96;
  int v97;
  void *v98;
  void *v99;
  float v100;
  float v101;
  uint64_t v102;
  float v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  _BOOL8 v109;
  unint64_t v110;
  char v111;
  unint64_t v112;
  int v113;
  _BOOL8 v114;
  _BOOL8 v115;
  double v116;
  objc_class *v117;
  char v118;
  BWOverCaptureSmartStyleApplyNode *v119;
  BWOverCaptureSmartStyleApplyNode *v120;
  objc_class *v121;
  uint64_t v122;
  BWPixelTransferNode *v123;
  void *v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  objc_class *v134;
  const char *v135;
  void *v136;
  BWFanOutNode *v137;
  objc_class *v138;
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  BWSceneClassifierSinkNode *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  BWSceneClassifierSinkNode *v150;
  uint64_t v151;
  unsigned int v152;
  BWPipelineStage *v153;
  uint64_t v154;
  BWPipelineStage *v155;
  BWPipelineStage *v156;
  void *v157;
  unsigned __int8 v158;
  unsigned __int8 v159;
  unsigned int v160;
  unsigned __int8 v161;
  char v162;
  char v163;
  _BOOL4 v164;
  BWSceneClassifierSinkNode *v165;
  void *v166;
  _BOOL8 v167;
  _BOOL8 v168;
  float v169;
  char v170;
  unsigned __int8 v171;
  unsigned __int8 v172;
  unsigned int v173;
  __int128 v174;
  unsigned __int8 v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  id v185;
  BWPipelineStage *v186;
  _BOOL8 v187;
  unint64_t v188;
  char v189;
  uint64_t v190;
  __int128 *v191;
  int v192;
  unint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  unsigned int v198;
  unsigned int v199;
  void *v200;
  _BOOL4 v201;
  int v202;
  unsigned int v203;
  uint64_t v204;
  void *v205;
  unint64_t v206;
  _BOOL4 v207;
  unint64_t v208;
  unsigned __int8 v209;
  int v210;
  int v211;
  void *v212;
  int v213;
  unsigned int v216;
  _BOOL4 v218;
  id obj;
  id v220;
  void *v221;
  NSArray *v222;
  BWPipelineStage *v223;
  void *v225;
  uint64_t v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  BWSceneClassifierSinkNode *v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  objc_super v238;
  objc_super v239;
  objc_super v240;
  objc_super v241;
  objc_super v242;
  objc_super v243;
  objc_super v244;
  objc_super v245;
  objc_super v246;
  objc_super v247;
  objc_super v248;
  BWNodeOutput *v249;
  id v250;
  unsigned int v251;
  _BYTE v252[128];
  _BYTE v253[128];
  uint64_t v254;
  BWSceneClassifierSinkNode *v255[3];

  v255[1] = *(BWSceneClassifierSinkNode **)MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v11 = result;
  v251 = 0;
  v250 = 0;
  v249 = (BWNodeOutput *)a3;
  if (a2)
  {
    v12 = objc_msgSend(*(id *)(a2 + 8), "previewFilterRenderingEnabled");
    LODWORD(v208) = *(_BYTE *)(a2 + 169) != 0;
    v13 = *(_BYTE *)(a2 + 170) != 0;
    v14 = *(void **)(a2 + 8);
  }
  else
  {
    v12 = objc_msgSend(0, "previewFilterRenderingEnabled");
    v13 = 0;
    LODWORD(v208) = 0;
    v14 = 0;
  }
  *(_BYTE *)(v11 + 280) = objc_msgSend(v14, "previewDepthFilterRenderingEnabled");
  if (a2)
  {
    *(_BYTE *)(v11 + 228) = *(_BYTE *)(a2 + 148);
    v15 = *(void **)(a2 + 8);
    if (v15)
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "sourceConfiguration"), "requiredFormat"), "maxContinuousZoomFactorForDepthDataDelivery");
      if (v16 == 0.0)
        v17 = 0;
      else
        v17 = objc_msgSend(*(id *)(a2 + 8), "previewDepthDataDeliveryEnabled");
      v210 = objc_msgSend(*(id *)(a2 + 8), "portraitAutoSuggestEnabled");
      v18 = v210 & v17;
      v15 = *(void **)(a2 + 8);
    }
    else
    {
      LOBYTE(v210) = 0;
      v18 = 0;
      v17 = 0;
    }
    if (*(_BYTE *)(v11 + 280))
      v19 = v18;
    else
      v19 = 1;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    LOBYTE(v210) = 0;
    v15 = 0;
    *(_BYTE *)(v11 + 228) = 0;
    v19 = *(_BYTE *)(v11 + 280) == 0;
  }
  v207 = v19;
  v216 = objc_msgSend((id)objc_msgSend(v15, "videoPreviewSinkConfiguration"), "zoomPIPOverlayEnabled");
  if ((v12 & 1) != 0 || *(_BYTE *)(v11 + 280))
  {
    v20 = 1;
    if (!a2)
    {
LABEL_24:
      v218 = 0;
      goto LABEL_25;
    }
  }
  else
  {
    if (!a2)
    {
      v20 = 0;
      goto LABEL_24;
    }
    v20 = *(_BYTE *)(a2 + 171) != 0;
  }
  if (!*(_QWORD *)(a2 + 40))
    goto LABEL_24;
  v218 = *(_BYTE *)(a2 + 112) != 0;
LABEL_25:
  v21 = (void *)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
  if (!v21
    || (v220 = (id)objc_msgSend(v21, "newCommandQueue")) == 0
    || (v202 = v12, (v22 = -[FigCapturePreviewSinkPipeline _metalSubmissionAndCompletionQueue](v11)) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_302;
  }
  v23 = v22;
  v199 = v17;
  objc_msgSend(v220, "setCompletionQueue:", v22);
  objc_msgSend(v220, "setSubmissionQueue:", v23);
  objc_msgSend((id)v11, "setUpstreamOutput:", a3);
  v221 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (a2)
  {
    if (*(_QWORD *)(a2 + 8))
      objc_msgSend(v221, "addObject:");
    if (*(_QWORD *)(a2 + 40))
    {
      if (v20 && !v218)
        v24 = obj;
      else
        v24 = v221;
      objc_msgSend(v24, "addObject:");
    }
    if (*(_QWORD *)(a2 + 16))
      v25 = v207;
    else
      v25 = 0;
    if (v25)
      objc_msgSend(v221, "addObject:");
    if (*(_QWORD *)(a2 + 24))
      objc_msgSend(v221, "addObject:");
    if (*(_QWORD *)(a2 + 32))
      objc_msgSend(v221, "addObject:");
    if (*(_QWORD *)(a2 + 192))
    {
      if (v20)
        v26 = obj;
      else
        v26 = v221;
      objc_msgSend(v26, "addObject:");
    }
    if (*(_QWORD *)(a2 + 48))
      objc_msgSend(v221, "addObject:");
  }
  v27 = v221;
  if (!objc_msgSend(v221, "count"))
    v27 = obj;
  if (!objc_msgSend(v27, "count"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v251 = FigSignalErrorAt();
    goto LABEL_296;
  }
  *(_QWORD *)(v11 + 216) = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v27, "firstObject"), "sourceConfiguration"), "sourceID");
  *(_DWORD *)(v11 + 224) = objc_msgSend((id)objc_msgSend(v27, "firstObject"), "underlyingDeviceType");
  v223 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.preview"), (void *)objc_msgSend((id)objc_msgSend(v27, "firstObject"), "sourceConfiguration")), 6);
  v212 = v27;
  if (a2)
    v28 = *(void **)(a2 + 56);
  else
    v28 = 0;
  v29 = &classRef_BWStillImageCameraCalibrationDataNode;
  if ((objc_msgSend((id)objc_msgSend(v28, "irisSinkConfiguration"), "irisFrameHarvestingEnabled") & 1) != 0
    || a2 && *(_BYTE *)(a2 + 174) && !*(_BYTE *)(a2 + 173))
  {
    v30 = objc_alloc_init(BWFrameRateGovernorNode);
    -[BWNode setName:](v30, "setName:", CFSTR("Preview Governor"));
    if (a2)
    {
      -[BWFrameRateGovernorNode setDropsStillBracketFramesToMaintainConsistentFrameRate:](v30, "setDropsStillBracketFramesToMaintainConsistentFrameRate:", objc_msgSend((id)objc_msgSend(*(id *)(a2 + 56), "irisSinkConfiguration"), "irisFrameHarvestingEnabled"));
      if (*(_BYTE *)(a2 + 174) && !*(_BYTE *)(a2 + 173))
      {
        -[BWFrameRateGovernorNode setDropsStartupFramesWithUnstableAE:](v30, "setDropsStartupFramesWithUnstableAE:", 1);
        -[BWFrameRateGovernorNode setAeStabilityTuning:](v30, "setAeStabilityTuning:", 1);
      }
    }
    else
    {
      -[BWFrameRateGovernorNode setDropsStillBracketFramesToMaintainConsistentFrameRate:](v30, "setDropsStillBracketFramesToMaintainConsistentFrameRate:", objc_msgSend((id)objc_msgSend(0, "irisSinkConfiguration"), "irisFrameHarvestingEnabled"));
    }
    v248.receiver = (id)v11;
    v248.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v248, sel_addNode_error_, v30, &v250) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v30, "input"), 0) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_302;
    }
    v249 = -[BWNode output](v30, "output");
  }
  if (objc_msgSend(obj, "count"))
  {
    v31 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", objc_msgSend(obj, "count") + 1, 1986618469);
    -[BWNode setName:](v31, "setName:", CFSTR("Preview Pre-Filter Splitter"));
    v247.receiver = (id)v11;
    v247.super_class = (Class)FigCapturePreviewSinkPipeline;
    v32 = &selRef__prepareToTerminateImmediatelyDueToError_;
    if ((objc_msgSendSuper2(&v247, sel_addNode_error_, v31, &v250) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v31, "input"), v223) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_302;
    }
    v249 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v31, "outputs"), "objectAtIndexedSubscript:", 0);
    v222 = -[BWNode outputs](v31, "outputs");
    if (a2)
      goto LABEL_72;
  }
  else
  {
    v222 = 0;
    v32 = &selRef__prepareToTerminateImmediatelyDueToError_;
    if (a2)
    {
LABEL_72:
      v33 = *(void **)(a2 + 8);
      goto LABEL_73;
    }
  }
  v33 = 0;
LABEL_73:
  v200 = (void *)objc_msgSend(v33, "sourceConfiguration");
  v34 = objc_msgSend(v200, "requiredFormat");
  v225 = a6;
  v226 = v11;
  v205 = (void *)v34;
  if (a2)
  {
    v35 = (void *)v34;
    if (*(_BYTE *)(a2 + 115))
      goto LABEL_75;
    if (!*(_BYTE *)(a2 + 116))
    {
      v213 = 0;
      goto LABEL_92;
    }
    if (*(_BYTE *)(a2 + 78)
      && (objc_msgSend((id)objc_msgSend(*(id *)(a2 + 56), "irisSinkConfiguration"), "irisMovieCaptureEnabled") & 1) != 0)
    {
LABEL_75:
      v36 = 1;
    }
    else
    {
      v36 = *(_BYTE *)(a2 + 128) != 0;
    }
    v213 = 1;
    v211 = !v36;
    if (!v36 || !*(_BYTE *)(a2 + 128))
    {
LABEL_93:
      v203 = v211 ^ 1;
      if (((v211 ^ 1) & 1) == 0 && *(_BYTE *)(a2 + 171))
      {
        if (!*(_BYTE *)(v11 + 228))
        {
          v38 = -[BWSmartStyleApplyNode initWithMetalCommandQueue:renderingMethod:]([BWSmartStyleApplyNode alloc], "initWithMetalCommandQueue:renderingMethod:", v220, *(unsigned int *)(a2 + 188));
          if (!v38)
          {
            fig_log_get_emitter();
            goto LABEL_341;
          }
          v39 = v38;
          -[BWNode setName:](v38, "setName:", CFSTR("SmartStyle Preview Apply"));
          -[BWSmartStyleApplyNode setMaxLossyCompressionLevel:](v39, "setMaxLossyCompressionLevel:", *(unsigned int *)(a2 + 152));
          v246.receiver = (id)v11;
          v246.super_class = (Class)FigCapturePreviewSinkPipeline;
          if ((objc_msgSendSuper2(&v246, v32[200], v39, &v250) & 1) == 0
            || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v39, "input"), v223) & 1) == 0)
          {
            goto LABEL_313;
          }
          v249 = -[BWNode output](v39, "output");
        }
        LOBYTE(v211) = 1;
        *(_BYTE *)(v11 + 249) = 1;
      }
LABEL_101:
      if (!*(_BYTE *)(a2 + 184))
      {
LABEL_107:
        if (v207)
          goto LABEL_114;
        if (*(_QWORD *)(a2 + 16))
        {
          v48 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
          v244.receiver = (id)v11;
          v244.super_class = (Class)FigCapturePreviewSinkPipeline;
          if ((objc_msgSendSuper2(&v244, v32[200], v48, &v250) & 1) == 0
            || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v48, "input"), 0) & 1) == 0)
          {
            goto LABEL_320;
          }
          v249 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v48, "outputs"), "objectAtIndexedSubscript:", 0);
          *(_QWORD *)(v11 + 160) = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v48, "outputs"), "objectAtIndexedSubscript:", 1);
        }
        v49 = *(void **)(a2 + 8);
        v50 = *(_BYTE *)(a2 + 144) != 0;
        v51 = *(_BYTE *)(a2 + 145) != 0;
        v52 = *(_DWORD *)(a2 + 152);
        v53 = *(_BYTE *)(a2 + 113) != 0;
LABEL_113:
        v251 = -[FigCapturePreviewSinkPipeline _appendFilteredPreviewPipeline:desiredPipelineStage:desiredStreamingFilterPipelineStage:previewSinkPipelineConfiguration:videoPreviewSinkConnectionConfiguration:graph:inferenceScheduler:captureDevice:focusBlurMapForDepthFiltersEnabled:depthFromMonocularNetworkEnabled:maxLossyCompressionLevel:deferredPrepareEnabled:metalCommandQueue:zoomBeforeDepthFilterRenderingEnabled:portraitAutoSuggestEnabled:](v11, (uint64_t *)&v249, 0, 0, a2, v49, a4, a5, a6, v50, v51, v52, v53, (uint64_t)v220, v18, v210);
        if (!v251)
        {
LABEL_114:
          if (!v13)
            goto LABEL_121;
          goto LABEL_115;
        }
LABEL_320:
        fig_log_get_emitter();
        goto LABEL_302;
      }
      v40 = FigVideoCaptureSourcePearlModuleType(objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "source"), &v251);
      if (!v251)
      {
        v41 = v40;
        v42 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.previewfacetracking"), (void *)objc_msgSend((id)objc_msgSend(v212, "firstObject"), "sourceConfiguration")), -[BWPipelineStage priority](v223, "priority"));
        v43 = -[BWFaceTrackingNode initWithFigThreadPriority:pearlModuleType:useUnfilteredDepth:queueDepth:passthroughInputs:allowPixelTransfer:]([BWFaceTrackingNode alloc], "initWithFigThreadPriority:pearlModuleType:useUnfilteredDepth:queueDepth:passthroughInputs:allowPixelTransfer:", -[BWPipelineStage priority](v42, "priority"), v41, 0, 0, 1, 1);
        if (!v43)
        {
          fig_log_get_emitter();
LABEL_341:
          FigDebugAssert3();
          v192 = -12786;
          goto LABEL_342;
        }
        v44 = v43;
        -[BWNode setName:](v43, "setName:", CFSTR("Face Tracking"));
        v245.receiver = (id)v11;
        v245.super_class = (Class)FigCapturePreviewSinkPipeline;
        if ((objc_msgSendSuper2(&v245, v32[200], v44, &v250) & 1) == 0
          || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v44, "input"), v42) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_302;
        }
        v45 = v44;
        *(_QWORD *)(v11 + 136) = v45;
        v249 = -[BWNode output](v45, "output");
        objc_msgSend(*(id *)(v11 + 136), "setFrontCamera:", 0);
        objc_msgSend(*(id *)(v11 + 136), "setMirrored:", 0);
        objc_msgSend(*(id *)(v11 + 136), "setOrientation:", 0);
        objc_msgSend(*(id *)(v11 + 136), "setMaxFaces:", 1);
        objc_msgSend(*(id *)(v11 + 136), "setUsesFaceRecognition:", 0);
        objc_msgSend(*(id *)(v11 + 136), "setFaceTrackingPlusEnabled:", 0);
        LODWORD(v46) = 0;
        objc_msgSend(*(id *)(v11 + 136), "setNetworkFailureThresholdMultiplier:", v46);
        LODWORD(v47) = -1.0;
        objc_msgSend(*(id *)(v11 + 136), "setTrackingFailureFieldOfViewModifier:", v47);
        goto LABEL_107;
      }
LABEL_313:
      fig_log_get_emitter();
      goto LABEL_302;
    }
    if (objc_msgSend(a6, "position") != 2
      || objc_msgSend(v35, "dimensions") != 3840
      || (unint64_t)objc_msgSend(v35, "dimensions") >> 32 != 2160)
    {
      LOBYTE(v211) = 0;
      v203 = 1;
      goto LABEL_84;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "requiredMaxFrameRate");
    v203 = 1;
    if (v37 < 60.0)
    {
      LOBYTE(v211) = 0;
LABEL_84:
      v213 = 1;
      goto LABEL_101;
    }
    v213 = 1;
LABEL_92:
    v211 = 1;
    goto LABEL_93;
  }
  LOBYTE(v211) = 1;
  if (!v207)
  {
    v52 = 0;
    v50 = 0;
    v203 = 0;
    v213 = 0;
    v49 = 0;
    v51 = 0;
    v53 = 0;
    goto LABEL_113;
  }
  v213 = 0;
  v203 = 0;
  if (!v13)
    goto LABEL_121;
LABEL_115:
  -[BWPipelineStage priority](v223, "priority");
  v54 = -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v11);
  v55 = [BWPocketDetectionNode alloc];
  if (a2)
    v56 = *(_QWORD *)(a2 + 176);
  else
    v56 = 0;
  v57 = -[BWPocketDetectionNode initWithMetalCommandQueue:clientApplicationID:](v55, "initWithMetalCommandQueue:clientApplicationID:", v54, v56);
  if (!v57)
  {
    fig_log_get_emitter();
    goto LABEL_341;
  }
  v58 = v57;
  -[BWNode setName:](v57, "setName:", CFSTR("Pocket Detection"));
  v243.receiver = (id)v11;
  v243.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v243, v32[200], v58, &v250) & 1) == 0
    || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v58, "input"), v223) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_302;
  }
  *(_QWORD *)(v11 + 128) = v58;
  v249 = -[BWNode output](v58, "output");
LABEL_121:
  if (!(_DWORD)v208)
    goto LABEL_130;
  if (a2)
  {
    if (*(_BYTE *)(a2 + 115))
      v59 = 1;
    else
      v59 = *(_BYTE *)(a2 + 116) != 0;
  }
  else
  {
    v59 = 0;
  }
  v60 = -[BWPreviewStabilizationNode initWithCameraInfoByPortType:forStillImagePreview:updateFinalCropRectWithStabilizationShift:]([BWPreviewStabilizationNode alloc], "initWithCameraInfoByPortType:forStillImagePreview:updateFinalCropRectWithStabilizationShift:", objc_msgSend(a6, "cameraInfoByPortType"), objc_msgSend(a6, "autoImageControlMode") == 0, !v59);
  if (!v60)
  {
    fig_log_get_emitter();
    goto LABEL_341;
  }
  v61 = v60;
  -[BWNode setName:](v60, "setName:", CFSTR("Preview Stabilization"));
  v242.receiver = (id)v11;
  v242.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v242, v32[200], v61, &v250) & 1) == 0
    || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v61, "input"), v223) & 1) == 0)
  {
    goto LABEL_335;
  }
  *(_QWORD *)(v11 + 120) = v61;
  v249 = -[BWNode output](v61, "output");
LABEL_130:
  v62 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  v209 = v18;
  if (!v213)
    goto LABEL_185;
  v63 = a6;
  v64 = v18;
  if (a2)
  {
    v65 = objc_msgSend(*(id *)(a2 + 8), "videoPreviewSinkConfiguration");
    v66 = *(_DWORD *)(a2 + 160);
    v67 = *(unsigned __int8 *)(a2 + 157);
    v68 = *(_BYTE *)(a2 + 157) != 0;
    if (*(_BYTE *)(a2 + 115))
    {
      v69 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "source");
      v196 = *MEMORY[0x1E0D05A18];
      v70 = (void *)FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(v69, v205, *MEMORY[0x1E0D05A18], &v251);
      if (!v251)
      {
        if (!v70)
        {
          fig_log_get_emitter();
          goto LABEL_337;
        }
        v197 = (void *)v65;
        objc_msgSend(v70, "stabilizationOverscanFromSensorForFESCropDimensions:preferSIFRFormat:geometricDistortionCorrection:useFESCompanionIndex:", objc_msgSend(v70, "fesInputCropDimensions"), objc_msgSend(v70, "shouldPreferSIFRFormatWithHighlightRecoveryEnabled:", objc_msgSend(v200, "highlightRecoveryEnabled")), objc_msgSend(v200, "geometricDistortionCorrectionEnabled"), 1);
        v72 = v71 > 0.0;
        if (v73 != 0.0)
          v72 = 0;
        v201 = v72;
        v198 = objc_msgSend(v205, "horizontalSensorBinningFactor");
        v74 = objc_msgSend(v205, "verticalSensorBinningFactor");
        v75 = (void *)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings");
        v76 = objc_msgSend(v75, "previewRegistrationType");
        if ((_DWORD)v76 == 1)
        {
          -[BWPipelineStage priority](v223, "priority");
          v77 = -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v11);
        }
        else
        {
          v77 = 0;
        }
        v87 = objc_msgSend(v75, "previewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled");
        if (*(_BYTE *)(a2 + 115))
        {
          a6 = v225;
          v88 = objc_msgSend(v225, "cameraInfoByPortType");
        }
        else
        {
          v88 = 0;
          a6 = v225;
        }
        v89 = v67 != 0;
        v90 = [BWPreviewStitcherNode alloc];
        if (*(_BYTE *)(a2 + 171))
          v91 = v203;
        else
          v91 = 0;
        v92 = objc_msgSend(a6, "parallaxMitigationBasedOnZoomFactorEnabled");
        BYTE5(v195) = *(_BYTE *)(a2 + 168);
        BYTE4(v195) = v89;
        BYTE3(v195) = v216;
        BYTE2(v195) = v92;
        BYTE1(v195) = v91;
        LOBYTE(v195) = v209;
        LODWORD(v93) = v66;
        v94 = -[BWPreviewStitcherNode initWithCameraInfoByPortType:sensorBinningFactor:inputBuffersHaveHorizontalOverscanOnly:registrationType:registrationMetalCommandQueue:excludeStaticComponentFromAlignmentShifts:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:zoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:preallocateOutputBufferPool:](v90, "initWithCameraInfoByPortType:sensorBinningFactor:inputBuffersHaveHorizontalOverscanOnly:registrationType:registrationMetalCommandQueue:excludeStaticComponentFromAlignmentShifts:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:zoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:preallocateOutputBufferPool:", v88, v198 | (unint64_t)(v74 << 32), v201, v76, v77, v87, v93, v195);
        if (v94)
        {
          v84 = v94;
          -[BWPreviewStitcherNode setDelegate:](v94, "setDelegate:", a7);
          objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "videoZoomFactor");
          v96 = v95;
          v97 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "sourceDeviceType");
          v98 = (void *)objc_msgSend(a6, "clientBaseZoomFactorsByPortType");
          v99 = v98;
          if (v97 == 8)
          {
            objc_msgSend((id)objc_msgSend(v98, "objectForKeyedSubscript:", v196), "floatValue");
            v11 = v226;
            v85 = v202;
            v29 = &classRef_BWStillImageCameraCalibrationDataNode;
            v86 = v197;
            if (v96 < v103)
              goto LABEL_158;
          }
          else
          {
            v11 = v226;
            v29 = &classRef_BWStillImageCameraCalibrationDataNode;
            if (v97 != 9)
            {
              v102 = 0;
              v85 = v202;
              v86 = v197;
              goto LABEL_164;
            }
            objc_msgSend((id)objc_msgSend(v98, "objectForKeyedSubscript:", v196), "floatValue");
            v85 = v202;
            v86 = v197;
            if (v96 < v100
              || (objc_msgSend((id)objc_msgSend(v99, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A30]), "floatValue"),
                  v96 >= v101))
            {
LABEL_158:
              v102 = 0;
LABEL_164:
              -[BWPreviewStitcherNode setPreviewsWideBeforeSlaveStreamStarts:](v84, "setPreviewsWideBeforeSlaveStreamStarts:", v102);
              -[BWPreviewStitcherNode setSuperWideFallbackForMacroSceneEnabled:](v84, "setSuperWideFallbackForMacroSceneEnabled:", objc_msgSend((id)objc_msgSend(a6, "bravoSuperWideCaptureStream"), "hasFocus"));
              goto LABEL_165;
            }
          }
          if (objc_msgSend(a6, "preferredMasterPortType"))
            v102 = objc_msgSend((id)objc_msgSend(a6, "preferredMasterPortType"), "isEqualToString:", v196);
          else
            v102 = 1;
          goto LABEL_164;
        }
LABEL_338:
        fig_log_get_emitter();
        goto LABEL_341;
      }
LABEL_335:
      fig_log_get_emitter();
      goto LABEL_302;
    }
    v78 = [BWPreviewStitcherNode alloc];
    if (*(_BYTE *)(a2 + 171))
      v79 = v203;
    else
      v79 = 0;
    v80 = objc_msgSend(v63, "parallaxMitigationBasedOnZoomFactorEnabled");
    v82 = *(_BYTE *)(a2 + 168) != 0;
  }
  else
  {
    v65 = objc_msgSend(0, "videoPreviewSinkConfiguration");
    v78 = [BWPreviewStitcherNode alloc];
    v80 = objc_msgSend(v63, "parallaxMitigationBasedOnZoomFactorEnabled");
    v79 = 0;
    v68 = 0;
    v82 = 0;
    v66 = 0;
  }
  LODWORD(v81) = v66;
  v83 = -[BWPreviewStitcherNode initWithStitchingDisabledAndZoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:preallocateOutputBufferPool:](v78, "initWithStitchingDisabledAndZoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:preallocateOutputBufferPool:", v216, v68, v64, v79, v80, v82, v81);
  if (!v83)
    goto LABEL_338;
  v84 = v83;
  -[BWPreviewStitcherNode setDelegate:](v83, "setDelegate:", a7);
  v85 = v202;
  v86 = (void *)v65;
  if (!a2)
  {
    v104 = 0;
    a6 = v63;
    v29 = &classRef_BWStillImageCameraCalibrationDataNode;
    goto LABEL_166;
  }
  a6 = v63;
  v29 = &classRef_BWStillImageCameraCalibrationDataNode;
LABEL_165:
  v104 = *(void **)(a2 + 8);
LABEL_166:
  objc_msgSend(v104, "transform");
  -[BWPreviewStitcherNode setOutputDimensions:](v84, "setOutputDimensions:", v105);
  objc_msgSend(v86, "primaryCaptureRectAspectRatio");
  -[BWPreviewStitcherNode setPrimaryCameraAspectRatio:](v84, "setPrimaryCameraAspectRatio:");
  objc_msgSend(v86, "primaryCaptureRectCenter");
  -[BWPreviewStitcherNode setPrimaryCaptureRectCenterX:](v84, "setPrimaryCaptureRectCenterX:");
  if (a2)
    v106 = *(unsigned int *)(a2 + 152);
  else
    v106 = 0;
  -[BWPreviewStitcherNode setMaxLossyCompressionLevel:](v84, "setMaxLossyCompressionLevel:", v106);
  if (v85)
  {
    if (*(_BYTE *)(v11 + 280))
      v107 = v199;
    else
      v107 = 1;
  }
  else
  {
    v107 = 0;
  }
  -[BWPreviewStitcherNode setForceBlackFillBorderEnabled:](v84, "setForceBlackFillBorderEnabled:", v107);
  v32 = &selRef__prepareToTerminateImmediatelyDueToError_;
  if (a2)
  {
    -[BWPreviewStitcherNode setOverCaptureNotSupportedByDownstreamNodes:](v84, "setOverCaptureNotSupportedByDownstreamNodes:", BWCIFilterArrayContainsFiltersRequiringSegmentation((void *)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "videoPreviewSinkConfiguration"), "filters")));
    v108 = *(void **)(a2 + 8);
    v109 = *(_BYTE *)(a2 + 147) != 0;
  }
  else
  {
    -[BWPreviewStitcherNode setOverCaptureNotSupportedByDownstreamNodes:](v84, "setOverCaptureNotSupportedByDownstreamNodes:", BWCIFilterArrayContainsFiltersRequiringSegmentation((void *)objc_msgSend((id)objc_msgSend(0, "videoPreviewSinkConfiguration"), "filters")));
    v108 = 0;
    v109 = 0;
  }
  v110 = objc_msgSend(v108, "transform");
  v111 = v110;
  v112 = HIDWORD(v110);
  -[BWPreviewStitcherNode setRotationDegrees:](v84, "setRotationDegrees:", HIDWORD(v110));
  v113 = FigCaptureTransformFlipAppliedBeforeRotationToAfter(v111 & 1, v112);
  -[BWPreviewStitcherNode setFlipHorizontal:](v84, "setFlipHorizontal:", v113 == 1);
  -[BWPreviewStitcherNode setFlipVertical:](v84, "setFlipVertical:", v113 == 2);
  -[BWPreviewStitcherNode setGeneratesHistogram:](v84, "setGeneratesHistogram:", v109);
  if (a2)
  {
    -[BWPreviewStitcherNode setRebuildingGraphForTrueVideoTransition:](v84, "setRebuildingGraphForTrueVideoTransition:", *(unsigned __int8 *)(a2 + 174));
    v114 = *(_BYTE *)(a2 + 128) != 0;
  }
  else
  {
    -[BWPreviewStitcherNode setRebuildingGraphForTrueVideoTransition:](v84, "setRebuildingGraphForTrueVideoTransition:", 0);
    v114 = 0;
  }
  v62 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  -[BWPreviewStitcherNode setTrueVideoCaptureEnabled:](v84, "setTrueVideoCaptureEnabled:", v114);
  v115 = objc_msgSend(v205, "dimensions") == 3840
      && (unint64_t)objc_msgSend(v205, "dimensions") >> 32 == 2160;
  -[BWPreviewStitcherNode setTrueVideoCaptureFormatIs4K:](v84, "setTrueVideoCaptureFormatIs4K:", v115);
  if (a2)
    v116 = *(double *)(a2 + 136);
  else
    v116 = 0.0;
  -[BWPreviewStitcherNode setTrueVideoCaptureAdditionalZoomFactor:](v84, "setTrueVideoCaptureAdditionalZoomFactor:", v116);
  v117 = (objc_class *)v29[265];
  v241.receiver = (id)v11;
  v241.super_class = v117;
  if ((objc_msgSendSuper2(&v241, sel_addNode_error_, v84, &v250) & 1) == 0
    || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v84, "input"), v223) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_302;
  }
  *(_QWORD *)(v11 + 144) = v84;
  v249 = -[BWNode output](v84, "output");
LABEL_185:
  if (!a2)
    goto LABEL_194;
  v118 = *(_BYTE *)(a2 + 171) ? v211 : 1;
  if ((v118 & 1) != 0)
    goto LABEL_194;
  v119 = -[BWOverCaptureSmartStyleApplyNode initWithMetalCommandQueue:]([BWOverCaptureSmartStyleApplyNode alloc], "initWithMetalCommandQueue:", v220);
  if (!v119)
  {
    fig_log_get_emitter();
    goto LABEL_341;
  }
  v120 = v119;
  -[BWNode setName:](v119, "setName:", CFSTR("SmartStyle Post Stitcher Preview Apply"));
  -[BWOverCaptureSmartStyleApplyNode setMaxLossyCompressionLevel:](v120, "setMaxLossyCompressionLevel:", *(unsigned int *)(a2 + 152));
  v121 = (objc_class *)v29[265];
  v240.receiver = (id)v11;
  v240.super_class = v121;
  if ((objc_msgSendSuper2(&v240, v32[200], v120, &v250) & 1) == 0
    || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v120, "input"), v223) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_302;
  }
  v249 = -[BWNode output](v120, "output");
  *(_BYTE *)(v11 + 249) = 1;
LABEL_194:
  FigCapturePixelFormatIsTenBit(objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v212, "firstObject"), "sourceConfiguration"), "requiredFormat"), "format"));
  if (*(_QWORD *)(v11 + v62[727]))
    v122 = 0;
  else
    v122 = v208 | objc_msgSend(a6, "parallaxMitigationBasedOnZoomFactorEnabled");
  v123 = -[BWPixelTransferNode initWithfractionalSourceRectEnabled:]([BWPixelTransferNode alloc], "initWithfractionalSourceRectEnabled:", v122);
  -[BWNode setName:](v123, "setName:", CFSTR("Preview Scaler"));
  v124 = (void *)objc_msgSend(v212, "firstObject");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_337:
    FigDebugAssert3();
    v192 = -12780;
LABEL_342:
    v251 = v192;
    goto LABEL_296;
  }
  if (!a2)
  {
    v193 = objc_msgSend(v124, "transform");
    v204 = v194;
    v206 = v193;
    v127 = 0;
    v125 = 0;
    v130 = HIDWORD(v193);
LABEL_206:
    if (objc_msgSend((id)objc_msgSend(v124, "sinkConfiguration"), "sinkType") == 6)
    {
      v255[0] = (BWSceneClassifierSinkNode *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v124, "outputFormat"));
      v131 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v255, 1);
      v132 = 0;
    }
    else
    {
      v132 = 0;
      v131 = 0;
    }
    goto LABEL_209;
  }
  if (*(_BYTE *)(a2 + 147))
    v125 = v213 ^ 1u;
  else
    v125 = 0;
  v126 = *(_DWORD *)(a2 + 72);
  v127 = *(unsigned int *)(a2 + 152);
  v128 = objc_msgSend(v124, "transform");
  v204 = v129;
  v206 = v128;
  v130 = HIDWORD(v128);
  if (v126 != 5)
  {
    v32 = &selRef__prepareToTerminateImmediatelyDueToError_;
    goto LABEL_206;
  }
  v32 = &selRef__prepareToTerminateImmediatelyDueToError_;
  if (objc_msgSend((id)objc_msgSend(v124, "sinkConfiguration"), "sinkType") != 1)
    goto LABEL_206;
  v131 = 0;
  v132 = 5;
LABEL_209:
  -[BWPixelTransferNode setPreferredOutputPixelFormats:](v123, "setPreferredOutputPixelFormats:", v131);
  -[BWPixelTransferNode setOutputColorSpaceProperties:](v123, "setOutputColorSpaceProperties:", v132);
  -[BWPixelTransferNode setMaxLossyCompressionLevel:](v123, "setMaxLossyCompressionLevel:", v127);
  if ((v213 & 1) == 0)
  {
    -[BWPixelTransferNode setOutputWidth:](v123, "setOutputWidth:", (int)v204);
    -[BWPixelTransferNode setOutputHeight:](v123, "setOutputHeight:", v204 >> 32);
    -[BWPixelTransferNode setRotationDegrees:](v123, "setRotationDegrees:", v130);
    v133 = FigCaptureTransformFlipAppliedBeforeRotationToAfter(v206 & 1, v130);
    -[BWPixelTransferNode setFlipHorizontal:](v123, "setFlipHorizontal:", v133 == 1);
    -[BWPixelTransferNode setFlipVertical:](v123, "setFlipVertical:", v133 == 2);
  }
  -[BWPixelTransferNode setCropMode:](v123, "setCropMode:", 1);
  if (!-[BWPixelTransferNode flipHorizontal](v123, "flipHorizontal")
    && !-[BWPixelTransferNode flipVertical](v123, "flipVertical")
    && !-[BWPixelTransferNode rotationDegrees](v123, "rotationDegrees"))
  {
    -[BWPixelTransferNode setPassesBuffersThroughWhenPossible:](v123, "setPassesBuffersThroughWhenPossible:", 1);
  }
  -[BWPixelTransferNode setGeneratesHistogram:](v123, "setGeneratesHistogram:", v125);
  -[BWPixelTransferNode setAllows422To420Conversion:](v123, "setAllows422To420Conversion:", 1);
  v134 = (objc_class *)v29[265];
  v239.receiver = (id)v11;
  v239.super_class = v134;
  v135 = v32[200];
  if ((objc_msgSendSuper2(&v239, v135, v123, &v250) & 1) == 0
    || (*(_QWORD *)(v11 + 48) = v123,
        (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v123, "input"), v223) & 1) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_302;
  }
  v249 = -[BWNode output](v123, "output");
  v136 = v221;
  if ((unint64_t)objc_msgSend(v221, "count") < 2)
  {
    v254 = (uint64_t)v249;
    v139 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v254, 1);
  }
  else
  {
    v137 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", objc_msgSend(v221, "count"), 1986618469);
    -[BWNode setName:](v137, "setName:", CFSTR("Preview Splitter"));
    FigCaptureNameSplitterNodeOutputsCorrespondingToConnections(-[BWNode outputs](v137, "outputs"), v221);
    v138 = (objc_class *)v29[265];
    v238.receiver = (id)v11;
    v238.super_class = v138;
    if ((objc_msgSendSuper2(&v238, v135, v137, &v250) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v249, -[BWNode input](v137, "input"), v223) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_302;
    }
    v139 = -[BWNode outputs](v137, "outputs");
  }
  v140 = (void *)v139;
  v236 = 0u;
  v237 = 0u;
  v234 = 0u;
  v235 = 0u;
  v141 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v234, v253, 16);
  if (v141)
  {
    v142 = v141;
    v143 = 0;
    v130 = *(_QWORD *)v235;
    do
    {
      v144 = 0;
      do
      {
        if (*(_QWORD *)v235 != v130)
          objc_enumerationMutation(v136);
        v145 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * v144);
        v255[0] = 0;
        v146 = (BWSceneClassifierSinkNode *)objc_msgSend(v140, "objectAtIndexedSubscript:", v143 + v144);
        v255[0] = v146;
        if (!a2)
        {
          if (v145)
            goto LABEL_265;
LABEL_246:
          v155 = v223;
          if ((v202 & v207) != 0)
          {
            if ((objc_msgSend((id)objc_msgSend(v145, "videoPreviewSinkConfiguration"), "semanticStyleRenderingEnabled") & 1) != 0
              || (v155 = v223, v156 = v223, *(_BYTE *)(v226 + 249)))
            {
              v156 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.preview.filtering"), (void *)objc_msgSend((id)objc_msgSend(v221, "firstObject"), "sourceConfiguration")), 6);
              v155 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.separate-streaming-filter"), (void *)objc_msgSend(v145, "sourceConfiguration")), 13);
            }
            if (a2)
            {
              v157 = *(void **)(a2 + 8);
              v158 = *(_BYTE *)(a2 + 144) != 0;
              v159 = *(_BYTE *)(a2 + 145) != 0;
              v160 = *(_DWORD *)(a2 + 152);
              v161 = *(_BYTE *)(a2 + 113) != 0;
            }
            else
            {
              v160 = 0;
              v158 = 0;
              v157 = 0;
              v159 = 0;
              v161 = 0;
            }
            v251 = -[FigCapturePreviewSinkPipeline _appendFilteredPreviewPipeline:desiredPipelineStage:desiredStreamingFilterPipelineStage:previewSinkPipelineConfiguration:videoPreviewSinkConnectionConfiguration:graph:inferenceScheduler:captureDevice:focusBlurMapForDepthFiltersEnabled:depthFromMonocularNetworkEnabled:maxLossyCompressionLevel:deferredPrepareEnabled:metalCommandQueue:zoomBeforeDepthFilterRenderingEnabled:portraitAutoSuggestEnabled:](v226, (uint64_t *)v255, v156, v155, a2, v157, a4, a5, v225, v158, v159, v160, v161, (uint64_t)v220, v209, v210);
            if (v251)
            {
LABEL_237:
              fig_log_get_emitter();
LABEL_302:
              FigDebugAssert3();
              goto LABEL_296;
            }
          }
          v162 = objc_msgSend((id)objc_msgSend(v145, "videoPreviewSinkConfiguration"), "semanticStyleRenderingEnabled");
          if (v155)
            v163 = v162;
          else
            v163 = 0;
          if (!a2 || (v163 & 1) != 0)
          {
            v136 = v221;
            v164 = (unint64_t)objc_msgSend(v221, "count") > 1;
            v165 = v255[0];
            if (a2)
              goto LABEL_262;
            v172 = 0;
            v170 = 0;
            v166 = 0;
            v167 = 0;
            v171 = 0;
            v173 = 0;
            v175 = 0;
            v232 = 0u;
            v233 = 0u;
            v169 = 0.0;
            v168 = 1;
          }
          else
          {
            v136 = v221;
            if (*(_BYTE *)(a2 + 172))
              v155 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.preview.image-queue"), (void *)objc_msgSend((id)objc_msgSend(v221, "firstObject"), "sourceConfiguration")), 6);
            v164 = (unint64_t)objc_msgSend(v221, "count") > 1;
            v165 = v255[0];
LABEL_262:
            v166 = *(void **)(a2 + 8);
            v167 = *(_BYTE *)(a2 + 171) != 0;
            v168 = *(_BYTE *)(a2 + 157) == 0;
            v169 = *(float *)(a2 + 164);
            v170 = *(_BYTE *)(a2 + 113) != 0;
            v171 = *(_BYTE *)(a2 + 172) != 0;
            v172 = *(_BYTE *)(a2 + 114) != 0;
            v173 = *(_DWORD *)(a2 + 152);
            v174 = *(_OWORD *)(a2 + 96);
            v232 = *(_OWORD *)(a2 + 80);
            v233 = v174;
            v175 = *(_BYTE *)(a2 + 156) != 0;
          }
          v152 = -[FigCapturePreviewSinkPipeline _buildImageQueuePreviewSinkPipeline:previewPipelineStage:videoPreviewSinkConnectionConfiguration:previewScalerOutputBuffersAreShared:zoomPIPOverlayEnabled:zoomPIPSmartStyleRenderingEnabled:zoomPIPSlaveStreamingEnabled:zoomPIPSlaveStreamingFrameRate:debugOverlayEnabled:deferredPrepareEnabled:parallelGraphRebuildEnabled:transform:remoteVideoPreview:maxLossyCompressionLevel:clientAuditToken:graph:captureDevice:previewTapDelegate:videoHDRImageStatisticsEnabled:zoomPIPOverlayDelegate:metalCommandQueue:]((id *)v226, (uint64_t)v165, v155, v166, v164, v216, v167, v168, v169, 0, v170, v171, 0, 0, v172, v173, &v232, a4, v225,
                                 a7,
                                 v175,
                                 a8,
                                 (uint64_t)v220);
LABEL_264:
          v251 = v152;
          goto LABEL_265;
        }
        if (v145 == *(void **)(a2 + 8))
          goto LABEL_246;
        if (v145 == *(void **)(a2 + 32))
        {
          v251 = -[FigCapturePreviewSinkPipeline _buildPreviewTimeMachineSinkPipeline:upstreamPipelineStageForPreviewTimeMachine:upstreamTransform:previewTimeMachineConnectionConfiguration:videoPreviewEnabled:deferredPrepareEnabled:smartCameraMotionDetectionEnabled:graph:captureDevice:]((_QWORD *)v226, (uint64_t)v146, (uint64_t)v223, v147, v148, v149, 0, *(unsigned __int8 *)(a2 + 113), *(_BYTE *)(a2 + 146), a4, v225);
          if (v251)
            goto LABEL_237;
        }
        else
        {
          if (v145 == *(void **)(a2 + 192))
          {
            v152 = -[FigCapturePreviewSinkPipeline _buildPreviewSmartStyleCoefficientsTimeMachineSinkPipeline:upstreamPipelineStageForPreviewTimeMachine:previewTimeMachineConnectionConfiguration:deferredPrepareEnabled:graph:captureDevice:]((id)v226, (uint64_t)v146, (uint64_t)v223, v147, *(unsigned __int8 *)(a2 + 113), a4, v225);
            goto LABEL_264;
          }
          if (v145 == *(void **)(a2 + 40))
          {
            if (!v218)
            {
              v153 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.sceneclassifier"), (void *)objc_msgSend(v145, "sourceConfiguration")), 0, 1);
              v154 = *(unsigned __int8 *)(a2 + 171);
              v231 = 0;
              v208 = v208 & 0xFFFF000000000000 | *(unsigned int *)(a2 + 64) | ((unint64_t)*(unsigned __int16 *)(a2 + 68) << 32);
              v251 = FigCaptureBuildSceneClassifierPipeline((void *)v226, v255[0], v208, 6, (uint64_t)v153, 0, v154, (uint64_t)v225, a5, 0, 0, &v231);
              if (v251)
                goto LABEL_237;
              *(_QWORD *)(v226 + 64) = v231;
              *(_QWORD *)(v226 + 96) = v255[0];
              v136 = v221;
            }
          }
          else
          {
            if (v145 == *(void **)(a2 + 48))
            {
              v150 = v146;
              v151 = 152;
            }
            else if (v145 == *(void **)(a2 + 24))
            {
              v150 = v146;
              v151 = 168;
            }
            else
            {
              if (v145 != *(void **)(a2 + 16))
                goto LABEL_265;
              v150 = v146;
              v151 = 160;
            }
            *(_QWORD *)(v226 + v151) = v150;
          }
        }
LABEL_265:
        ++v144;
      }
      while (v142 != v144);
      v176 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v234, v253, 16);
      v142 = v176;
      v143 += v144;
    }
    while (v176);
  }
  v229 = 0u;
  v230 = 0u;
  v227 = 0u;
  v228 = 0u;
  v177 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v252, 16);
  v178 = v225;
  if (!v177)
    goto LABEL_293;
  v179 = v177;
  v180 = *(_QWORD *)v228;
  v181 = 1;
  do
  {
    v182 = 0;
    do
    {
      if (*(_QWORD *)v228 != v180)
        objc_enumerationMutation(obj);
      v183 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * v182);
      v185 = -[NSArray objectAtIndexedSubscript:](v222, "objectAtIndexedSubscript:", v181 + v182);
      if (a2)
      {
        if (v183 != *(void **)(a2 + 40))
        {
          if (v183 == *(void **)(a2 + 192))
            v251 = -[FigCapturePreviewSinkPipeline _buildPreviewSmartStyleCoefficientsTimeMachineSinkPipeline:upstreamPipelineStageForPreviewTimeMachine:previewTimeMachineConnectionConfiguration:deferredPrepareEnabled:graph:captureDevice:]((id)v226, (uint64_t)v185, (uint64_t)v223, v184, *(unsigned __int8 *)(a2 + 113), a4, v178);
          goto LABEL_284;
        }
        if (v218)
          goto LABEL_284;
      }
      else
      {
        if (v183)
          v189 = 1;
        else
          v189 = v218;
        if ((v189 & 1) != 0)
          goto LABEL_284;
      }
      v186 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.sceneclassifier"), (void *)objc_msgSend(v183, "sourceConfiguration")), 0, 1);
      if (a2)
      {
        v187 = *(_BYTE *)(a2 + 171) != 0;
        v188 = *(unsigned int *)(a2 + 64) | ((unint64_t)*(unsigned __int16 *)(a2 + 68) << 32);
      }
      else
      {
        v187 = 0;
        v188 = 0;
      }
      v255[0] = 0;
      v130 = v130 & 0xFFFF000000000000 | v188;
      v251 = FigCaptureBuildSceneClassifierPipeline((void *)v226, v185, v130, 6, (uint64_t)v186, 0, v187, (uint64_t)v225, a5, 0, 0, v255);
      if (v251)
      {
        fig_log_get_emitter();
        goto LABEL_302;
      }
      *(_QWORD *)(v226 + 64) = v255[0];
      *(_QWORD *)(v226 + 96) = v185;
      v178 = v225;
LABEL_284:
      ++v182;
    }
    while (v179 != v182);
    v190 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v252, 16);
    v179 = v190;
    v181 += v182;
  }
  while (v190);
LABEL_293:
  v191 = (__int128 *)(v226 + 184);
  *(_QWORD *)(v226 + 184) = v206;
  *(_QWORD *)(v226 + 192) = v204;
  if (!v207)
    v191 = &kFigCaptureVideoTransform_Identity;
  *(_OWORD *)(v226 + 200) = *v191;
LABEL_296:
  result = v251;
  if (!v251)
  {
    if (v250)
      return objc_msgSend(v250, "code");
  }
  return result;
}

- (uint64_t)_metalSubmissionAndCompletionQueue
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = *(_QWORD *)(result + 272);
    if (!result)
    {
      result = FigDispatchQueueCreateWithPriority();
      *(_QWORD *)(v1 + 272) = result;
    }
  }
  return result;
}

- (id)_stashPreviewImageQueueUpdatedNotificationPayload:(unint64_t)a3 previewDimensions:(int)a4 remoteVideoPreview:
{
  id *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(result[7], "imageQueueSlot");
    if ((_DWORD)v8)
    {
      v9 = v8;
      if (a4)
      {
        v18[0] = CFSTR("SectionID");
        v19[0] = objc_msgSend(v7, "sinkID");
        v18[1] = CFSTR("ImageQueueSlot");
        v19[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
        v18[2] = CFSTR("RotationDegrees");
        v19[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
        v18[3] = CFSTR("ImageQueueWidth");
        v19[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
        v18[4] = CFSTR("ImageQueueHeight");
        v19[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(a3));
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v19;
        v12 = v18;
        v13 = 5;
      }
      else
      {
        v15 = objc_msgSend(v7[7], "imageQueue");
        v16[0] = CFSTR("SectionID");
        v17[0] = objc_msgSend(v7, "sinkID");
        v16[1] = CFSTR("ImageQueueSlot");
        v17[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
        v17[2] = v15;
        v16[2] = CFSTR("ImageQueue");
        v16[3] = CFSTR("RotationDegrees");
        v17[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
        v16[4] = CFSTR("ImageQueueWidth");
        v17[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
        v16[5] = CFSTR("ImageQueueHeight");
        v17[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(a3));
        v10 = (void *)MEMORY[0x1E0C99D80];
        v11 = v17;
        v12 = v16;
        v13 = 6;
      }
      v14 = (void *)objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v13);
    }
    else
    {
      v14 = 0;
    }
    result = v14;
    v7[22] = result;
  }
  return result;
}

- (uint64_t)toggleDepthDensificationAccordingToFilters:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = result;
    if (BWCIFilterArrayContainsPortraitFilters(a2))
      v4 = objc_msgSend(MEMORY[0x1E0C99E60], "set");
    else
      v4 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E49FAEA8);
    objc_msgSend(*(id *)(v3 + 256), "setInferencesToSkip:", v4);
    if (BWCIFilterArrayContainsPortraitFilters(a2))
      v5 = objc_msgSend(MEMORY[0x1E0C99E60], "set");
    else
      v5 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E49FAEC0);
    return objc_msgSend(*(id *)(v3 + 264), "setInferencesToSkip:", v5);
  }
  return result;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (BWNodeOutput)videoThumbnailSinkOutput
{
  return self->_videoThumbnailSinkOutput;
}

- (FigCaptureVideoTransform)videoThumbnailSinkOutputTransform
{
  FigCaptureVideoTransform *p_videoThumbnailSinkOutputTransform;
  uint64_t v3;
  $470D365275581EF16070F5A11344F73E dimensions;
  FigCaptureVideoTransform result;

  p_videoThumbnailSinkOutputTransform = &self->_videoThumbnailSinkOutputTransform;
  v3 = *(_QWORD *)&self->_videoThumbnailSinkOutputTransform.mirrored;
  dimensions = p_videoThumbnailSinkOutputTransform->dimensions;
  result.dimensions = dimensions;
  result.mirrored = v3;
  result.rotationDegrees = HIDWORD(v3);
  return result;
}

- (BWPreviewTimeMachineSinkNode)timeMachineSinkNode
{
  return self->_timeMachineSinkNode;
}

- (void)setMRCSceneObserver:(id)a3
{
  -[BWSceneClassifierSinkNode setMRCSceneObserver:](self->_sceneClassifierSinkNode, "setMRCSceneObserver:", a3);
}

- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver
{
  return (BWSemanticStyleSceneObserver *)self->_filterNode;
}

- (FigCaptureVideoTransform)outputTransform
{
  FigCaptureVideoTransform *p_outputTransform;
  uint64_t v3;
  $470D365275581EF16070F5A11344F73E dimensions;
  FigCaptureVideoTransform result;

  p_outputTransform = &self->_outputTransform;
  v3 = *(_QWORD *)&self->_outputTransform.mirrored;
  dimensions = p_outputTransform->dimensions;
  result.dimensions = dimensions;
  result.mirrored = v3;
  result.rotationDegrees = HIDWORD(v3);
  return result;
}

- (BWNodeOutput)metadataSinkOutput
{
  return self->_metadataSinkOutput;
}

- (FigCapturePreviewSinkPipeline)initWithConfiguration:(id)a3 sourcePreviewOutput:(id)a4 imageQueueSinkNode:(id)a5 graph:(id)a6 name:(id)a7 inferenceScheduler:(id)a8 captureDevice:(id)a9 previewTapDelegate:(id)a10 zoomPIPOverlayDelegate:(id)a11
{
  void *v17;
  FigCapturePreviewSinkPipeline *v18;
  void *v19;
  void *v20;
  objc_super v22;

  if (a3)
    v17 = (void *)*((_QWORD *)a3 + 1);
  else
    v17 = 0;
  v22.receiver = self;
  v22.super_class = (Class)FigCapturePreviewSinkPipeline;
  v18 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v22, sel_initWithGraph_name_sinkID_, a6, a7, objc_msgSend((id)objc_msgSend(v17, "sinkConfiguration"), "sinkID"));
  if (v18)
  {
    v18->_imageQueueSinkNode = (BWImageQueueSinkNode *)a5;
    if (a3)
    {
      v18->_overCaptureEnabled = *((_BYTE *)a3 + 115);
      v18->_videoStabilizationOverscan = *((double *)a3 + 15);
      v19 = (void *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v19 = 0;
      v18->_overCaptureEnabled = 0;
      v18->_videoStabilizationOverscan = 0.0;
    }
    v18->_primaryCaptureRectUniqueID = objc_msgSend((id)objc_msgSend(v19, "videoPreviewSinkConfiguration"), "primaryCaptureRectUniqueID");
    if (a3)
      v20 = (void *)*((_QWORD *)a3 + 7);
    else
      v20 = 0;
    v18->_applyPreviewShiftToMomentCapture = objc_msgSend((id)objc_msgSend(v20, "irisSinkConfiguration"), "irisApplyPreviewShift");
    if (-[FigCapturePreviewSinkPipeline _buildVideoPreviewSinkPipeline:sourcePreviewOutput:graph:inferenceScheduler:captureDevice:previewTapDelegate:zoomPIPOverlayDelegate:]((uint64_t)v18, (uint64_t)a3, (uint64_t)a4, a6, (uint64_t)a8, a9, (uint64_t)a10, (uint64_t)a11))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v18;
}

- (BWStreamingFilterNode)filterNode
{
  return self->_filterNode;
}

- (NSDictionary)imageQueueUpdatedPayloadToBeSentAfterCommitConfiguration
{
  return self->_imageQueueUpdatedPayloadToBeSentAfterCommitConfiguration;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  -[BWImageQueueSinkNode setCaptureDevice:](self->_imageQueueSinkNode, "setCaptureDevice:", 0);

  v3.receiver = self;
  v3.super_class = (Class)FigCapturePreviewSinkPipeline;
  -[FigCaptureSinkPipeline dealloc](&v3, sel_dealloc);
}

- (BWMRCSceneObserver)mrcSceneObserver
{
  return -[BWSceneClassifierSinkNode mrcSceneObserver](self->_sceneClassifierSinkNode, "mrcSceneObserver");
}

- (void)setSemanticStyleSceneObserver:(id)a3
{
  -[BWSceneClassifierSinkNode setSemanticStyleSceneObserver:](self->_sceneClassifierSinkNode, "setSemanticStyleSceneObserver:", a3);
}

- (BOOL)discardsImageQueueSampleData
{
  return -[BWNodeOutput discardsSampleData](-[BWNodeConnection output](-[BWNodeInput connection](-[BWNode input](self->_imageQueueSinkNode, "input"), "connection"), "output"), "discardsSampleData");
}

- (void)setSceneClassifierSuspended:(BOOL)a3
{
  uint64_t v3;
  BWSceneClassifierSinkNode *sceneClassifierSinkNode;
  _BOOL8 v6;
  BWNodeOutput *v7;
  BWNodeOutput *sceneClassifierPipelineUpstreamOutput;
  uint64_t v9;
  uint64_t v10;

  sceneClassifierSinkNode = self->_sceneClassifierSinkNode;
  if (sceneClassifierSinkNode)
  {
    v6 = a3;
    v7 = -[BWNodeConnection output](-[BWNodeInput connection](-[BWNode input](sceneClassifierSinkNode, "input"), "connection"), "output");
    if (!v7)
    {
      fig_log_get_emitter();
      v10 = v3;
      LODWORD(v9) = 0;
      FigDebugAssert3();
    }
    -[BWNodeOutput setDiscardsSampleData:](v7, "setDiscardsSampleData:", v6, v9, v10);
    sceneClassifierPipelineUpstreamOutput = self->_sceneClassifierPipelineUpstreamOutput;
    if (!sceneClassifierPipelineUpstreamOutput)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      sceneClassifierPipelineUpstreamOutput = self->_sceneClassifierPipelineUpstreamOutput;
    }
    -[BWNodeOutput setDiscardsSampleData:](sceneClassifierPipelineUpstreamOutput, "setDiscardsSampleData:", v6);
  }
}

- (BOOL)sceneClassifierSuspended
{
  return -[BWNodeOutput discardsSampleData](self->_sceneClassifierPipelineUpstreamOutput, "discardsSampleData");
}

- (void)setFilters:(id)a3
{
  -[FigCapturePreviewSinkPipeline toggleDepthDensificationAccordingToFilters:]((uint64_t)self, a3);
  -[FigCapturePreviewSinkPipeline _setPortraitRenderingInferencesNeededForFilters:]((uint64_t)self, a3);
  -[BWPreviewStitcherNode setOverCaptureNotSupportedByDownstreamNodes:](self->_previewStitcher, "setOverCaptureNotSupportedByDownstreamNodes:", BWCIFilterArrayContainsFiltersRequiringSegmentation(a3));
  -[BWStreamingFilterNode changeToFilters:animated:](self->_filterNode, "changeToFilters:animated:", a3, 1);
}

- (uint64_t)_setPortraitRenderingInferencesNeededForFilters:(uint64_t)result
{
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;

  if (result)
  {
    v2 = result;
    v3 = BWCIFilterArrayContainsFiltersRequiringSegmentation(a2);
    v4 = *(void **)(v2 + 112);
    if ((v3 & 1) != 0)
      v5 = 0;
    else
      v5 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E49FAED8);
    objc_msgSend(v4, "setInferencesToSkip:", v5);
    return objc_msgSend(*(id *)(v2 + 136), "setSkipProcessing:", v3 ^ 1u);
  }
  return result;
}

- (NSArray)filters
{
  return -[BWStreamingFilterNode filters](self->_filterNode, "filters");
}

- (void)setSimulatedAperture:(float)a3
{
  -[BWStreamingFilterNode setSimulatedAperture:](self->_filterNode, "setSimulatedAperture:");
}

- (float)simulatedAperture
{
  float result;

  -[BWStreamingFilterNode simulatedAperture](self->_filterNode, "simulatedAperture");
  return result;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  -[BWStreamingFilterNode setPortraitLightingEffectStrength:](self->_filterNode, "setPortraitLightingEffectStrength:");
}

- (float)portraitLightingEffectStrength
{
  BWStreamingFilterNode *filterNode;
  float result;

  filterNode = self->_filterNode;
  if (!filterNode)
    return NAN;
  -[BWStreamingFilterNode portraitLightingEffectStrength](filterNode, "portraitLightingEffectStrength");
  return result;
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;

  if (!self->_smartStyleRenderingEnabled)
  {
    v4 = a4;
    if (objc_msgSend(a3, "isIdentity"))
      v7 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E49FAED8, &unk_1E49FAEC0, 0);
    else
      v7 = 0;
    -[BWInferenceNode setInferencesToSkip:](self->_semanticStylePersonSegmentationNode, "setInferencesToSkip:", v7);
    -[BWStreamingFilterNode changeToSemanticStyle:animated:](self->_filterNode, "changeToSemanticStyle:animated:", a3, v4);
  }
}

- (void)setSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4
{
  _DWORD *v7;

  if (!self->_smartStyleRenderingEnabled)
  {
    v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      objc_msgSend(a3, "leftmostRegionStartXOffset");
      objc_msgSend(a4, "port");
      kdebug_trace();
    }
    -[BWImageQueueSinkNode fencePortGenerationIDWillChange](self->_imageQueueSinkNode, "fencePortGenerationIDWillChange");
    if (objc_msgSend((id)objc_msgSend(a3, "semanticStyles"), "count"))
      -[BWInferenceNode setInferencesToSkip:](self->_semanticStylePersonSegmentationNode, "setInferencesToSkip:", 0);
    -[BWStreamingFilterNode setSemanticStyleSet:fencePortSendRight:](self->_filterNode, "setSemanticStyleSet:fencePortSendRight:", a3, a4);
    if (*v7 == 1)
      kdebug_trace();
  }
}

- (void)setSemanticStyle:(id)a3
{
  if (!self->_smartStyleRenderingEnabled)
    -[FigCapturePreviewSinkPipeline setSemanticStyle:animated:](self, "setSemanticStyle:animated:", a3, 0);
}

- (FigCaptureSemanticStyle)semanticStyle
{
  return -[BWStreamingFilterNode semanticStyle](self->_filterNode, "semanticStyle");
}

- (void)setSemanticStyleRenderingSuspended:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  if (!self->_smartStyleRenderingEnabled)
  {
    v4 = a4;
    v5 = a3;
    if (-[BWStreamingFilterNode isSemanticStyleRenderingEnabled](self->_filterNode, "isSemanticStyleRenderingEnabled"))
      -[BWStreamingFilterNode setSemanticStyleRenderingSuspended:animated:](self->_filterNode, "setSemanticStyleRenderingSuspended:animated:", v5, v4);
  }
}

- (void)setPrimaryCaptureRectAspectRatio:(double)a3 center:(CGPoint)a4 trueVideoTransitionPercentComplete:(double)a5 fencePortSendRight:(id)a6 uniqueID:(int64_t)a7
{
  double y;
  double x;
  _DWORD *v13;

  if (self->_primaryCaptureRectUniqueID <= a7)
  {
    y = a4.y;
    x = a4.x;
    self->_primaryCaptureRectUniqueID = a7;
    v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      objc_msgSend(a6, "port");
      kdebug_trace();
    }
    -[BWImageQueueSinkNode fencePortGenerationIDWillChange](self->_imageQueueSinkNode, "fencePortGenerationIDWillChange");
    -[BWPreviewStitcherNode setPrimaryCaptureRectAspectRatio:center:trueVideoTransitionPercentComplete:trueVideoTransitionReferenceSampleBuffer:fencePortSendRight:](self->_previewStitcher, "setPrimaryCaptureRectAspectRatio:center:trueVideoTransitionPercentComplete:trueVideoTransitionReferenceSampleBuffer:fencePortSendRight:", 0, a6, a3, x, y, a5);
    if (*v13 == 1)
      kdebug_trace();
  }
}

- (double)primaryCaptureRectAspectRatio
{
  double result;

  -[BWPreviewStitcherNode primaryCameraAspectRatio](self->_previewStitcher, "primaryCameraAspectRatio");
  return result;
}

- (CGPoint)primaryCaptureRectCenter
{
  BWPreviewStitcherNode *previewStitcher;
  double v3;
  double v4;
  CGPoint result;

  previewStitcher = self->_previewStitcher;
  if (previewStitcher)
    -[BWPreviewStitcherNode primaryCaptureRectCenterX](previewStitcher, "primaryCaptureRectCenterX");
  else
    v3 = 0.5;
  v4 = 0.5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (int64_t)primaryCaptureRectUniqueID
{
  return self->_primaryCaptureRectUniqueID;
}

- (void)setDisplaysWidestCameraOnly:(BOOL)a3
{
  -[BWPreviewStitcherNode setDisplaysWidestCameraOnly:](self->_previewStitcher, "setDisplaysWidestCameraOnly:", a3);
}

- (BOOL)displaysWidestCameraOnly
{
  return -[BWPreviewStitcherNode displaysWidestCameraOnly](self->_previewStitcher, "displaysWidestCameraOnly");
}

- (void)setVideoStabilizationOverscanCropEnabled:(BOOL)a3 momentMovieRecordingEnabled:(BOOL)a4
{
  double v4;
  _BOOL8 v5;

  v4 = 1.0;
  if (a3)
    v4 = self->_videoStabilizationOverscan + 1.0;
  v5 = a4 && !self->_applyPreviewShiftToMomentCapture;
  -[BWPreviewStitcherNode rampToAdditionalZoomFactor:momentMovieRecordingRecenteringEnabled:](self->_previewStitcher, "rampToAdditionalZoomFactor:momentMovieRecordingRecenteringEnabled:", v5, v4);
}

- (void)setStoppingForModeSwitch:(BOOL)a3 delayedEndOfDataEnabled:(BOOL)a4 ispFastSwitchEnabled:(BOOL)a5 smartStyleRenderingEnabledInTrueVideoGraph:(BOOL)a6
{
  -[BWPreviewStitcherNode setStoppingForModeSwitch:delayedEndOfDataEnabled:ispFastSwitchEnabled:smartStyleRenderingEnabledInTrueVideoGraph:](self->_previewStitcher, "setStoppingForModeSwitch:delayedEndOfDataEnabled:ispFastSwitchEnabled:smartStyleRenderingEnabledInTrueVideoGraph:", a3, a4, a5, a6);
}

- (void)setStoppingForClientBackgrounded:(BOOL)a3
{
  -[BWImageQueueSinkNode setCleanupImageQueueAtEndOfData:](self->_imageQueueSinkNode, "setCleanupImageQueueAtEndOfData:", a3);
}

- (uint64_t)_appendFilteredPreviewPipeline:(BWPipelineStage *)a3 desiredPipelineStage:(BWPipelineStage *)a4 desiredStreamingFilterPipelineStage:(uint64_t)a5 previewSinkPipelineConfiguration:(void *)a6 videoPreviewSinkConnectionConfiguration:(void *)a7 graph:(uint64_t)a8 inferenceScheduler:(void *)a9 captureDevice:(unsigned __int8)a10 focusBlurMapForDepthFiltersEnabled:(unsigned __int8)a11 depthFromMonocularNetworkEnabled:(unsigned int)a12 maxLossyCompressionLevel:(unsigned __int8)a13 deferredPrepareEnabled:(uint64_t)a14 metalCommandQueue:(unsigned __int8)a15 zoomBeforeDepthFilterRenderingEnabled:(unsigned __int8)a16 portraitAutoSuggestEnabled:
{
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  const __CFString *v24;
  BWPipelineStage *v25;
  unsigned int v26;
  int v27;
  void *v28;
  int v29;
  BWInferenceNode *v30;
  int v31;
  void *v32;
  BWStreamingPersonSegmentationConfiguration *v33;
  BWPipelineStage *v34;
  uint64_t v35;
  double v36;
  BWOpticalFlowInferenceConfiguration *v37;
  BWMonocularDepthConfiguration *v38;
  uint64_t Major;
  BWMonocularDepthConfiguration *v40;
  BWPersonSegmentationFilteringNode *v41;
  int v42;
  BWVideoDepthInferenceConfiguration *v43;
  void *v44;
  uint64_t v45;
  uint64_t *v46;
  BWVideoDepthInferenceConfiguration *v47;
  int v48;
  BWOpticalFlowInferenceConfiguration *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BWVideoDepthNode *v53;
  BWInferenceNode *v54;
  BWStreamingPersonSegmentationConfiguration *v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t *v59;
  char v60;
  unint64_t v61;
  BWStreamingFilterNode *v62;
  uint64_t v63;
  uint64_t v64;
  BWStreamingFilterNode *v65;
  _BOOL4 v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  unsigned int v72;
  unsigned int v74;
  unsigned int v75;
  void *v76;
  void *v77;
  unsigned int v78;
  void *v80;
  BWPipelineStage *v82;
  uint64_t v83;
  objc_super v84;
  objc_super v85;
  objc_super v86;
  objc_super v87;
  objc_super v88;
  objc_super v89;
  uint64_t v90;
  _DWORD v91[3];

  if (!result)
    return result;
  v20 = result;
  v91[0] = 0;
  v90 = 0;
  if (a2)
    v21 = *a2;
  else
    v21 = 0;
  v22 = objc_msgSend(a6, "previewDepthDataDeliveryEnabled");
  v23 = v22;
  if (!a3)
  {
    if (v22)
      v24 = CFSTR("com.apple.coremedia.capture.streaming-disparity+filter");
    else
      v24 = CFSTR("com.apple.coremedia.capture.streaming-filter");
    a3 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)v24, (void *)objc_msgSend(a6, "sourceConfiguration")), 13);
  }
  v83 = v21;
  if (a4)
    v25 = a4;
  else
    v25 = a3;
  v82 = v25;
  v71 = (void *)objc_msgSend((id)objc_msgSend(a6, "sourceConfiguration"), "requiredFormat");
  objc_msgSend(v71, "defaultPortraitLightingEffectStrength");
  if (*(_BYTE *)(v20 + 280))
    v78 = objc_msgSend(a9, "portraitPreviewForegroundBlurEnabled");
  else
    v78 = 0;
  v26 = objc_msgSend((id)objc_msgSend(a6, "videoPreviewSinkConfiguration"), "semanticStyleRenderingEnabled");
  v77 = (void *)objc_msgSend((id)objc_msgSend(a6, "videoPreviewSinkConfiguration"), "semanticStyle");
  v74 = v23;
  v75 = v26;
  v27 = v26 & (v23 ^ a16 ^ 1);
  v28 = (void *)objc_msgSend((id)objc_msgSend(a6, "videoPreviewSinkConfiguration"), "filters");
  v29 = a13 & (BWCIFilterArrayContainsPortraitEffectFilters(v28) ^ 1);
  v80 = a7;
  v76 = v28;
  v30 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", a9, a8, 6);
  -[BWNode setName:](v30, "setName:", CFSTR("Segmentation Node"));
  v31 = v29;
  if (v29)
    objc_msgSend(a7, "enableBypassUntilPreparedForNode:deferredPreparePriority:", v30, 2);
  v89.receiver = (id)v20;
  v89.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v89, sel_addNode_error_, v30, &v90) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v46 = a2;
    goto LABEL_91;
  }
  v32 = v28;
  v33 = -[BWInferenceConfiguration initWithInferenceType:]([BWStreamingPersonSegmentationConfiguration alloc], "initWithInferenceType:", 105);
  if (v27)
  {
    *(_QWORD *)(v20 + 104) = v30;
    v34 = a3;
    if (objc_msgSend(v77, "isIdentity"))
      v70 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E49FAED8, &unk_1E49FAEC0, 0);
    else
      v70 = 0;
    v35 = v83;
    -[BWStreamingPersonSegmentationConfiguration setInputRotationAngle:](v33, "setInputRotationAngle:", -((unint64_t)objc_msgSend(a6, "transform") >> 32));
    -[BWStreamingPersonSegmentationConfiguration setPropagateColorInput:](v33, "setPropagateColorInput:", 0);
    -[BWStreamingPersonSegmentationConfiguration setCropColorInputToPrimaryCaptureRect:](v33, "setCropColorInputToPrimaryCaptureRect:", 0);
    v72 = 1;
    -[BWInferenceConfiguration setPropagatesFrameRatePrevention:](v33, "setPropagatesFrameRatePrevention:", 1);
    LODWORD(v36) = 10.0;
    -[BWInferenceConfiguration setMaximumFramesPerSecond:](v33, "setMaximumFramesPerSecond:", v36);
    -[BWStreamingPersonSegmentationConfiguration setUseLowFrameRateOptimizedNetwork:](v33, "setUseLowFrameRateOptimizedNetwork:", 1);
    -[BWInferenceNode addInferenceOfType:version:configuration:](v30, "addInferenceOfType:version:configuration:", 105, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v33);
    v37 = -[BWInferenceConfiguration initWithInferenceType:]([BWOpticalFlowInferenceConfiguration alloc], "initWithInferenceType:", 117);
    -[BWOpticalFlowInferenceConfiguration setInputDimensions:](v37, "setInputDimensions:", 0xC000000100);
    -[BWOpticalFlowInferenceConfiguration setOutputDimensions:](v37, "setOutputDimensions:", 0xC000000100);
    -[BWOpticalFlowInferenceConfiguration setConcurrencyWidth:](v37, "setConcurrencyWidth:", 2);
    -[BWOpticalFlowInferenceConfiguration setInputRotationAngle:](v37, "setInputRotationAngle:", -((unint64_t)objc_msgSend(a6, "transform") >> 32));
    -[BWOpticalFlowInferenceConfiguration setCropColorInputToPrimaryCaptureRect:](v37, "setCropColorInputToPrimaryCaptureRect:", 0);
    -[BWOpticalFlowInferenceConfiguration setAttachedMediaKeyForPropagatedColorInput:](v37, "setAttachedMediaKeyForPropagatedColorInput:", 0x1E49513F8);
    -[BWInferenceNode addInferenceOfType:version:configuration:](v30, "addInferenceOfType:version:configuration:", 117, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v37);

    objc_msgSend(*(id *)(v20 + 104), "setInferencesToSkip:", v70);
    a7 = v80;
  }
  else
  {
    v34 = a3;
    if ((a16 & 1) != 0)
    {
      v72 = 0;
    }
    else
    {
      v72 = 1;
      -[BWInferenceNode addInferenceOfType:version:configuration:](v30, "addInferenceOfType:version:configuration:", 105, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v33);
    }
    v35 = v83;
  }
  if (a11)
  {
    v38 = -[BWMonocularDepthConfiguration initWithInferenceType:monocularDepthType:]([BWMonocularDepthConfiguration alloc], "initWithInferenceType:monocularDepthType:", 106, 1);
    Major = BWInferenceVersionMakeMajor(1);
    v40 = v38;
    a7 = v80;
    -[BWInferenceNode addInferenceOfType:version:configuration:](v30, "addInferenceOfType:version:configuration:", 106, Major & 0xFFFFFFFFFFFFLL, v40);
  }
  if ((objc_msgSend(a7, "connectOutput:toInput:pipelineStage:", v35, -[BWNode input](v30, "input"), v34) & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_101:
    FigDebugAssert3();
    v46 = a2;
    goto LABEL_84;
  }
  v35 = -[BWNode output](v30, "output");
  if (!v27)
    goto LABEL_35;
  v41 = -[BWPersonSegmentationFilteringNode initWithGPUPriority:frameRateUpsamplingEnabled:metalCommandQueue:]([BWPersonSegmentationFilteringNode alloc], "initWithGPUPriority:frameRateUpsamplingEnabled:metalCommandQueue:", 0, 1, -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v20));
  v88.receiver = (id)v20;
  v88.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v88, sel_addNode_error_, v41, &v90) & 1) == 0
    || (-[BWPersonSegmentationFilteringNode setInputOrientationRelativeToSensor:](v41, "setInputOrientationRelativeToSensor:", (unint64_t)objc_msgSend(a6, "transform") >> 32), -[BWPersonSegmentationFilteringNode setAlignsMaskWithPrimaryCaptureRect:](v41, "setAlignsMaskWithPrimaryCaptureRect:", -[BWStreamingPersonSegmentationConfiguration cropColorInputToPrimaryCaptureRect](v33, "cropColorInputToPrimaryCaptureRect")), (objc_msgSend(a7, "connectOutput:toInput:pipelineStage:", v35, -[BWNode input](v41, "input"), v34) & 1) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_101;
  }
  v35 = -[BWNode output](v41, "output");
LABEL_35:
  v42 = a16;
  if (!v78)
    goto LABEL_56;
  v43 = [BWVideoDepthInferenceConfiguration alloc];
  HIDWORD(v69) = v31;
  if (a15)
  {
    v44 = a9;
    v45 = objc_msgSend(a9, "isBravoVariant") ^ 1;
    v46 = a2;
  }
  else
  {
    v45 = 0;
    v46 = a2;
    v44 = a9;
  }
  v47 = -[BWVideoDepthInferenceConfiguration initWithConcurrencyWidth:videoDepthLayout:captureDevice:requiresCroppingOfDepthBuffer:requiresVerticalFlipOfDepthBuffer:backpressureEvent:](v43, "initWithConcurrencyWidth:videoDepthLayout:captureDevice:requiresCroppingOfDepthBuffer:requiresVerticalFlipOfDepthBuffer:backpressureEvent:", 2, 1, v44, a15, v45, 0);
  -[BWVideoDepthInferenceConfiguration setRequiresAppleDepthPostProcessing:](v47, "setRequiresAppleDepthPostProcessing:", 1);
  v48 = FigVideoCaptureSourcePearlModuleType(objc_msgSend((id)objc_msgSend(a6, "sourceConfiguration"), "source"), v91);
  if (v91[0])
  {
    fig_log_get_emitter();
    goto LABEL_103;
  }
  -[BWVideoDepthInferenceConfiguration setSourceIsNuri:](v47, "setSourceIsNuri:", v48 == 3);
  *(_QWORD *)(v20 + 264) = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", v44, a8, 6);
  v49 = -[BWInferenceConfiguration initWithInferenceType:]([BWOpticalFlowInferenceConfiguration alloc], "initWithInferenceType:", 117);
  -[BWOpticalFlowInferenceConfiguration setInputDimensions:](v49, "setInputDimensions:", -[BWVideoDepthInferenceConfiguration outputDimensions](v47, "outputDimensions"));
  -[BWOpticalFlowInferenceConfiguration setOutputDimensions:](v49, "setOutputDimensions:", -[BWVideoDepthInferenceConfiguration outputDimensions](v47, "outputDimensions"));
  -[BWOpticalFlowInferenceConfiguration setConcurrencyWidth:](v49, "setConcurrencyWidth:", 2);
  if (a15)
    v50 = (unint64_t)objc_msgSend(a6, "transform") >> 32;
  else
    v50 = 0;
  -[BWOpticalFlowInferenceConfiguration setInputRotationAngle:](v49, "setInputRotationAngle:", v50);
  -[BWOpticalFlowInferenceConfiguration setCropColorInputToPrimaryCaptureRect:](v49, "setCropColorInputToPrimaryCaptureRect:", a15);
  -[BWOpticalFlowInferenceConfiguration setAttachedMediaKeyForPropagatedColorInput:](v49, "setAttachedMediaKeyForPropagatedColorInput:", 0x1E49515B8);
  objc_msgSend(*(id *)(v20 + 264), "addInferenceOfType:version:configuration:", 117, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v49);

  objc_msgSend(*(id *)(v20 + 264), "setName:", CFSTR("Optical Flow Node"));
  a7 = v80;
  if (v31)
    objc_msgSend(v80, "enableBypassUntilPreparedForNode:deferredPreparePriority:", *(_QWORD *)(v20 + 264), 2);
  v51 = *(_QWORD *)(v20 + 264);
  v87.receiver = (id)v20;
  v87.super_class = (Class)FigCapturePreviewSinkPipeline;
  v46 = a2;
  if ((objc_msgSendSuper2(&v87, sel_addNode_error_, v51, &v90) & 1) == 0
    || (objc_msgSend(v80, "connectOutput:toInput:pipelineStage:", v35, objc_msgSend(*(id *)(v20 + 264), "input"), v34) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_103;
  }
  v35 = objc_msgSend(*(id *)(v20 + 264), "output");
  if (a16)
    v52 = 4;
  else
    v52 = 0;
  v53 = -[BWVideoDepthNode initWithInferenceScheduler:captureDevice:videoDepthConfiguration:extraDepthOutputRetainedBufferCount:error:]([BWVideoDepthNode alloc], "initWithInferenceScheduler:captureDevice:videoDepthConfiguration:extraDepthOutputRetainedBufferCount:error:", a8, a9, v47, v52, v91);
  *(_QWORD *)(v20 + 256) = v53;
  if (v91[0])
  {
    fig_log_get_emitter();
    goto LABEL_101;
  }
  v86.receiver = (id)v20;
  v86.super_class = (Class)FigCapturePreviewSinkPipeline;
  v46 = a2;
  if ((objc_msgSendSuper2(&v86, sel_addNode_error_, v53, &v90) & 1) == 0
    || (objc_msgSend(v80, "connectOutput:toInput:pipelineStage:", v35, objc_msgSend(*(id *)(v20 + 256), "input"), v34) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_103;
  }
  v35 = objc_msgSend(*(id *)(v20 + 256), "output");
  if (v31)
  {
    objc_msgSend(a9, "setPreviewVideoDepthNodeUnprepared:", 1);
    objc_msgSend(v80, "enableBypassUntilPreparedForNode:deferredPreparePriority:", *(_QWORD *)(v20 + 256), 2);
  }
  -[FigCapturePreviewSinkPipeline toggleDepthDensificationAccordingToFilters:](v20, (void *)objc_msgSend((id)objc_msgSend(a6, "videoPreviewSinkConfiguration"), "filters"));
  v42 = a16;
  v32 = v76;
LABEL_56:
  if (v42)
  {
    v54 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", a9, a8, 6);
    -[BWNode setName:](v54, "setName:", CFSTR("Segmentation Node (secondary)"));
    if (v31)
      objc_msgSend(a7, "enableBypassUntilPreparedForNode:deferredPreparePriority:", v54, 2);
    v85.receiver = (id)v20;
    v85.super_class = (Class)FigCapturePreviewSinkPipeline;
    v46 = a2;
    if ((objc_msgSendSuper2(&v85, sel_addNode_error_, v54, &v90) & 1) == 0
      || (*(_QWORD *)(v20 + 112) = v54,
          (objc_msgSend(a7, "connectOutput:toInput:pipelineStage:", v35, -[BWNode input](v54, "input"), v34) & 1) == 0))
    {
      fig_log_get_emitter();
      goto LABEL_103;
    }
    v83 = -[BWNode output](v54, "output");
    v55 = -[BWInferenceConfiguration initWithInferenceType:]([BWStreamingPersonSegmentationConfiguration alloc], "initWithInferenceType:", 105);
    v56 = (unint64_t)objc_msgSend(a6, "transform") >> 32;
    v57 = a6;
    if ((objc_msgSend(a6, "transform") & 1) != 0)
      v58 = -(int)v56;
    else
      v58 = v56;
    -[BWStreamingPersonSegmentationConfiguration setInputRotationAngle:](v55, "setInputRotationAngle:", v58);
    -[BWStreamingPersonSegmentationConfiguration setCropColorInputToPrimaryCaptureRect:](v55, "setCropColorInputToPrimaryCaptureRect:", 1);
    -[BWStreamingPersonSegmentationConfiguration setAlternativeStreamingPersonSegmentationMaskKey:](v55, "setAlternativeStreamingPersonSegmentationMaskKey:", 0x1E495AF98);
    -[BWStreamingPersonSegmentationConfiguration setAlternativeStreamingSkinSegmentationMaskKey:](v55, "setAlternativeStreamingSkinSegmentationMaskKey:", 0x1E495AFD8);
    -[BWInferenceNode addInferenceOfType:version:configuration:](v54, "addInferenceOfType:version:configuration:", 105, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v55);
    -[FigCapturePreviewSinkPipeline _setPortraitRenderingInferencesNeededForFilters:](v20, v32);
  }
  else
  {
    v57 = a6;
    v83 = v35;
    v46 = a2;
  }
  v59 = v46;
  if (a15)
  {
    v60 = objc_msgSend(v57, "transform") & 1;
    v61 = (unint64_t)objc_msgSend(v57, "transform") >> 32;
  }
  else
  {
    v60 = 0;
    LODWORD(v61) = 0;
  }
  v62 = [BWStreamingFilterNode alloc];
  v63 = *(unsigned __int8 *)(v20 + 228);
  v64 = *(unsigned __int8 *)(v20 + 249);
  LODWORD(v69) = v61;
  BYTE4(v68) = v60;
  LODWORD(v68) = -[BWPipelineStage priority](v82, "priority");
  v65 = -[BWStreamingFilterNode initWithCaptureDevice:maxLossyCompressionLevel:semanticStyleRenderingEnabled:cinematicVideoEnabled:smartStyleRenderingEnabled:portraitPreviewForegroundBlurEnabled:metalCommandQueue:priority:mirroredForMetadataAdjustment:rotationDegreesForMetadataAdjustment:](v62, "initWithCaptureDevice:maxLossyCompressionLevel:semanticStyleRenderingEnabled:cinematicVideoEnabled:smartStyleRenderingEnabled:portraitPreviewForegroundBlurEnabled:metalCommandQueue:priority:mirroredForMetadataAdjustment:rotationDegreesForMetadataAdjustment:", a9, a12, v75, v63, v64, v78, a14, v68, v69);
  v84.receiver = (id)v20;
  v84.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v84, sel_addNode_error_, v65, &v90) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v46 = v59;
LABEL_91:
    v35 = v83;
    goto LABEL_84;
  }
  *(_QWORD *)(v20 + 72) = v65;
  v46 = v59;
  if (*(_BYTE *)(v20 + 280))
  {
    -[BWStreamingFilterNode setMetadataProcessingEnabled:](v65, "setMetadataProcessingEnabled:", 1);
    -[BWStreamingFilterNode setStudioAndContourRenderingEnabled:](v65, "setStudioAndContourRenderingEnabled:", objc_msgSend(v71, "isStudioAndContourPreviewRenderingSupported"));
    -[BWStreamingFilterNode setStageRenderingEnabled:](v65, "setStageRenderingEnabled:", objc_msgSend(v71, "isStagePreviewRenderingSupported"));
    -[BWStreamingFilterNode setFocusBlurMapDeliveryEnabled:](v65, "setFocusBlurMapDeliveryEnabled:", a10);
    -[BWStreamingFilterNode setDepthFromMonocularNetworkEnabled:](v65, "setDepthFromMonocularNetworkEnabled:", a11);
    -[BWStreamingFilterNode setPortraitAutoSuggestEnabled:](v65, "setPortraitAutoSuggestEnabled:", a16);
  }
  -[BWStreamingFilterNode setPrimaryStreamingPersonSegmentationEnabled:](v65, "setPrimaryStreamingPersonSegmentationEnabled:", v72);
  -[BWStreamingFilterNode setSecondaryStreamingPersonSegmentationEnabled:](v65, "setSecondaryStreamingPersonSegmentationEnabled:", a16);
  -[BWStreamingFilterNode setStreamingSegmentationFromInferenceEngine:](v65, "setStreamingSegmentationFromInferenceEngine:", 1);
  v35 = v83;
  v66 = a5;
  if (a5)
    v66 = *(unsigned __int8 *)(a5 + 171) != 0;
  if (v66 | v75 ^ 1)
    v67 = 0;
  else
    v67 = v77;
  if (objc_msgSend(v76, "count") || v67)
    -[BWStreamingFilterNode changeToFilters:semanticStyle:animated:](v65, "changeToFilters:semanticStyle:animated:", v76, v67, 0);
  if (objc_msgSend(v76, "count"))
  {
    objc_msgSend((id)objc_msgSend(v57, "videoPreviewSinkConfiguration"), "simulatedAperture");
    -[BWStreamingFilterNode setSimulatedAperture:](v65, "setSimulatedAperture:");
    objc_msgSend((id)objc_msgSend(v57, "videoPreviewSinkConfiguration"), "portraitLightingEffectStrength");
    -[BWStreamingFilterNode setPortraitLightingEffectStrength:](v65, "setPortraitLightingEffectStrength:");
  }
  -[BWStreamingFilterNode setDepthDataDeliveryEnabled:](v65, "setDepthDataDeliveryEnabled:", v74);
  -[BWStreamingFilterNode setAttachesInputPixelBufferAfterRendering:](v65, "setAttachesInputPixelBufferAfterRendering:", 0);
  if ((objc_msgSend(v80, "connectOutput:toInput:pipelineStage:", v83, -[BWNode input](v65, "input"), v82) & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_103:
    FigDebugAssert3();
    goto LABEL_84;
  }
  v35 = -[BWNode output](v65, "output");
LABEL_84:
  if (v46)
    *v46 = v35;
  return v91[0];
}

- (id)_buildImageQueuePreviewSinkPipeline:(BWPipelineStage *)a3 previewPipelineStage:(void *)a4 videoPreviewSinkConnectionConfiguration:(int)a5 previewScalerOutputBuffersAreShared:(int)a6 zoomPIPOverlayEnabled:(uint64_t)a7 zoomPIPSmartStyleRenderingEnabled:(uint64_t)a8 zoomPIPSlaveStreamingEnabled:(float)a9 zoomPIPSlaveStreamingFrameRate:(unsigned __int8)a10 debugOverlayEnabled:(char)a11 deferredPrepareEnabled:(unsigned __int8)a12 parallelGraphRebuildEnabled:(uint64_t)a13 transform:(uint64_t)a14 remoteVideoPreview:(unsigned __int8)a15 maxLossyCompressionLevel:(unsigned int)a16 clientAuditToken:(_OWORD *)a17 graph:(void *)a18 captureDevice:(void *)a19 previewTapDelegate:(uint64_t)a20 videoHDRImageStatisticsEnabled:(unsigned __int8)a21 zoomPIPOverlayDelegate:(uint64_t)a22 metalCommandQueue:(uint64_t)a23
{
  id *v29;
  BWPipelineStage *v30;
  char **v31;
  BWPixelTransferNode *v32;
  BWPixelTransferNode *v33;
  const __CFString *v34;
  BWVideoPIPOverlayNode *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  BWVideoPIPOverlayNode *v39;
  BWVideoPIPOverlayNode *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  unsigned int v44;
  id v45;
  BWImageQueueSinkNode *v46;
  BWImageQueueSinkNode *v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  id v51;
  void *v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  int v59;
  int v60;
  BOOL v61;
  uint64_t v62;
  char v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  int v70;
  unint64_t v71;
  unsigned int v72;
  BWPipelineStage *v73;
  objc_super v76;
  _OWORD v77[2];
  objc_super v78;
  objc_super v79;
  id v80[2];

  if (result)
  {
    v29 = result;
    v30 = a3;
    v80[0] = 0;
    if (a6)
      v30 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.preview.zoomPIP"), 6);
    v31 = &selRef__prepareToTerminateImmediatelyDueToError_;
    if ((a6 | a10) == 1 && a5)
    {
      v32 = objc_alloc_init(BWPixelTransferNode);
      v33 = v32;
      if (a6)
        v34 = CFSTR("Zoom PIP Overlay Buffer Copier");
      else
        v34 = CFSTR("Debug Overlay Buffer Copier");
      -[BWNode setName:](v32, "setName:", v34);
      if (a6)
      {
        -[BWPixelTransferNode setMaxInputLossyCompressionLevel:](v33, "setMaxInputLossyCompressionLevel:", a16);
        v31 = &selRef__prepareToTerminateImmediatelyDueToError_;
        -[BWPixelTransferNode setMaxOutputLossyCompressionLevel:](v33, "setMaxOutputLossyCompressionLevel:", a16);
      }
      v79.receiver = v29;
      v79.super_class = (Class)FigCapturePreviewSinkPipeline;
      if ((objc_msgSendSuper2(&v79, v31[200], v33, v80) & 1) == 0
        || (objc_msgSend(a18, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v33, "input"), v30) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_73;
      }
      a2 = -[BWNode output](v33, "output");
    }
    v73 = a3;
    if (a6)
    {
      v35 = [BWVideoPIPOverlayNode alloc];
      v36 = objc_msgSend(a19, "isBravoVariant");
      v37 = objc_msgSend(a19, "baseZoomFactorsByPortType");
      *(float *)&v38 = a9;
      v39 = -[BWVideoPIPOverlayNode initWithDelegate:metalCommandQueue:secondaryCameraStreamingEnabled:secondaryCameraFrameRate:maxLossyCompressionLevel:isDeviceBravoVariant:baseZoomFactorsByPortType:](v35, "initWithDelegate:metalCommandQueue:secondaryCameraStreamingEnabled:secondaryCameraFrameRate:maxLossyCompressionLevel:isDeviceBravoVariant:baseZoomFactorsByPortType:", a22, a23, a8, a16, v36, v37, v38);
      -[BWNode setName:](v39, "setName:", CFSTR("PIP Overlay"));
      v78.receiver = v29;
      v78.super_class = (Class)FigCapturePreviewSinkPipeline;
      if ((objc_msgSendSuper2(&v78, sel_addNode_error_, v39, v80) & 1) == 0
        || (v40 = v39,
            v29[11] = v40,
            -[BWVideoPIPOverlayNode setSmartStyleRenderingEnabled:](v40, "setSmartStyleRenderingEnabled:", a7),
            (objc_msgSend(a18, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v39, "input"), v30) & 1) == 0))
      {
        fig_log_get_emitter();
        goto LABEL_73;
      }
      a2 = -[BWNode output](v39, "output");
    }
    v41 = a4;
    v42 = (void *)objc_msgSend(a4, "sourceConfiguration");
    if ((int)FigCapturePlatformIdentifier() <= 4)
    {
      v44 = objc_msgSend(v42, "sourceDeviceType");
      if (v44 > 9)
      {
        v72 = 0;
        goto LABEL_24;
      }
      v43 = (0x310u >> v44) & 1;
    }
    else
    {
      v43 = 1;
    }
    v72 = v43;
LABEL_24:
    v45 = v29[7];
    if (v45)
    {
      objc_msgSend(v29[7], "setPreviewTapDelegate:", a20);
      v46 = (BWImageQueueSinkNode *)v29[7];
    }
    else
    {
      v47 = [BWImageQueueSinkNode alloc];
      v48 = objc_msgSend(v29, "sinkID");
      v49 = a17[1];
      v41 = a4;
      v77[0] = *a17;
      v77[1] = v49;
      v46 = -[BWImageQueueSinkNode initWithHFRSupport:ispJitterCompensationEnabled:clientAuditToken:sinkID:](v47, "initWithHFRSupport:ispJitterCompensationEnabled:clientAuditToken:sinkID:", 1, v72, v77, v48);
      -[BWImageQueueSinkNode setPreviewTapDelegate:](v46, "setPreviewTapDelegate:", a20);
      v29[7] = v46;
    }
    -[BWImageQueueSinkNode setCaptureDevice:](v46, "setCaptureDevice:", a19);
    objc_msgSend(v29[7], "setTransform:", a13, a14);
    objc_msgSend(v29[7], "setVideoHDRImageStatisticsEnabled:", a21);
    if (*((_BYTE *)v29 + 229))
      v50 = 1;
    else
      v50 = objc_msgSend((id)objc_msgSend(v41, "videoPreviewSinkConfiguration"), "primaryCaptureRectModificationEnabled");
    v51 = v29[7];
    v52 = (void *)objc_msgSend(v41, "sourceConfiguration");
    objc_msgSend((id)objc_msgSend(v52, "requiredFormat"), "maxSupportedFrameRate");
    v54 = v53;
    objc_msgSend(v52, "requiredMinFrameRate");
    v56 = v55;
    objc_msgSend(v52, "requiredMaxFrameRate");
    v58 = v57;
    v59 = BWGetMaximumDisplayFrequency();
    v60 = v59;
    v61 = v58 == v56 && fmod(v58, (double)v59) == 0.0;
    objc_msgSend(v51, "setFenceSupportEnabled:", v50);
    objc_msgSend(v51, "setMaxLossyCompressionLevel:", a16);
    if (objc_msgSend((id)objc_msgSend(v52, "requiredFormat"), "previewImageQueueSyncStrategy"))
    {
      v62 = objc_msgSend((id)objc_msgSend(v52, "requiredFormat"), "previewImageQueueSyncStrategy");
    }
    else if (v72 && (v54 <= (float)v60 ? (v63 = 1) : (v63 = v61), (v63 & 1) != 0))
    {
      v62 = 3;
    }
    else if (v54 <= 30.0)
    {
      v62 = 1;
    }
    else
    {
      v62 = 2;
    }
    objc_msgSend(v51, "setSyncStrategy:", v62);
    v64 = v29[7];
    v76.receiver = v29;
    v76.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v76, sel_addNode_error_, v64, v80) & 1) != 0)
    {
      v65 = v45 ? a12 : 0;
      if ((objc_msgSend(a18, "connectOutput:toInput:pipelineStage:deferredAttach:", a2, objc_msgSend(v29[7], "input"), v73, v65) & 1) != 0)
      {
        if (a11)
          objc_msgSend(a18, "enableDeferredPrepareForNodesNotInPathOfSinkNode:", v29[7]);
        if (!v45 || !v29[22])
        {
          v66 = objc_msgSend(v29[18], "rotationDegrees");
          if (!(_DWORD)v66)
            v66 = objc_msgSend(v29[6], "rotationDegrees");
          v67 = objc_msgSend(a19, "position");
          v68 = FigCaptureCameraRequires180DegreesRotation(v67 == 2, objc_msgSend(a19, "isExternalVariant"));
          objc_msgSend(a19, "isExternalVariant");
          objc_msgSend(a19, "clientExpectsCameraMountedInLandscapeOrientation");
          if (FigCapturePlatformMountsCamerasInLandscapeOrientation())
          {
            if (objc_msgSend(v41, "mirroringEnabled")
              && ((objc_msgSend(a19, "isExternalVariant") | v68) & 1) != 0
              || (objc_msgSend(v41, "mirroringEnabled") & 1) == 0
              && ((v69 = objc_msgSend(a19, "isExternalVariant"), v67 != 2) ? (v70 = 1) : (v70 = v69),
                  ((v70 | v68) & 1) == 0))
            {
              v66 = FigCaptureNormalizeAngle((int)v66 + 180);
            }
          }
          objc_msgSend(v41, "transform");
          -[FigCapturePreviewSinkPipeline _stashPreviewImageQueueUpdatedNotificationPayload:previewDimensions:remoteVideoPreview:](v29, v66, v71, a15);
        }
        goto LABEL_65;
      }
    }
    fig_log_get_emitter();
LABEL_73:
    FigDebugAssert3();
LABEL_65:
    result = (id *)v80[0];
    if (v80[0])
      return (id *)objc_msgSend(v80[0], "code");
  }
  return result;
}

- (_QWORD)_buildPreviewTimeMachineSinkPipeline:(uint64_t)a3 upstreamPipelineStageForPreviewTimeMachine:(uint64_t)a4 upstreamTransform:(uint64_t)a5 previewTimeMachineConnectionConfiguration:(uint64_t)a6 videoPreviewEnabled:(uint64_t)a7 deferredPrepareEnabled:(int)a8 smartCameraMotionDetectionEnabled:(unsigned __int8)a9 graph:(void *)a10 captureDevice:(void *)a11
{
  _QWORD *v14;
  uint64_t v15;
  BWPreviewTimeMachineSinkNode *v16;
  objc_super v17;
  _QWORD *v18;

  if (result)
  {
    v14 = result;
    v18 = 0;
    if (objc_msgSend(a11, "zeroShutterLagEnabled"))
      v15 = 7;
    else
      v15 = 4;
    v16 = -[BWPreviewTimeMachineSinkNode initWithCaptureDevice:processingQueuePriority:timeMachineCapacity:smartCameraMotionDetectionEnabled:sinkID:]([BWPreviewTimeMachineSinkNode alloc], "initWithCaptureDevice:processingQueuePriority:timeMachineCapacity:smartCameraMotionDetectionEnabled:sinkID:", a11, 13, v15, a9, objc_msgSend(v14, "sinkID"));
    v17.receiver = v14;
    v17.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v17, sel_addNode_error_, v16, &v18) & 1) != 0
      && (v14[10] = v16,
          (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v16, "input"), a3) & 1) != 0))
    {
      -[BWNode output](v16, "output");
      if (a8)
        objc_msgSend(a10, "enableDeferredPrepareForNodesNotInPathOfSinkNode:", v16);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = v18;
    if (v18)
      return (_QWORD *)objc_msgSend(v18, "code");
  }
  return result;
}

- (id)_buildPreviewSmartStyleCoefficientsTimeMachineSinkPipeline:(uint64_t)a3 upstreamPipelineStageForPreviewTimeMachine:(uint64_t)a4 previewTimeMachineConnectionConfiguration:(int)a5 deferredPrepareEnabled:(void *)a6 graph:(void *)a7 captureDevice:
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BWAttachedMediaTimeMachineSinkNode *v15;
  BWAttachedMediaTimeMachineSinkNode *v16;
  objc_super v17;
  id v18;
  _QWORD v19[3];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v12 = result;
    v18 = 0;
    v20[0] = 0x1E495B3F8;
    v20[1] = 0x1E495B358;
    v20[2] = CFSTR("HumanFullBodiesMask");
    v20[3] = CFSTR("HumanSkinsMask");
    v20[4] = 0x1E495B218;
    v13 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
    v14 = *MEMORY[0x1E0D06100];
    v19[0] = *MEMORY[0x1E0D060F8];
    v19[1] = v14;
    v19[2] = *MEMORY[0x1E0D060D8];
    v15 = -[BWAttachedMediaTimeMachineSinkNode initWithTimeMachineCapacity:attachedMediaKeys:metadataKeys:sinkID:]([BWAttachedMediaTimeMachineSinkNode alloc], "initWithTimeMachineCapacity:attachedMediaKeys:metadataKeys:sinkID:", 4, v13, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3), CFSTR("SmartStyle attachments Time Machine"));
    if (v15)
    {
      v16 = v15;
      -[BWNode setName:](v15, "setName:", CFSTR("SmartStyle attachments Time Machine"));
      objc_msgSend(a7, "setSmartStyleAttachedMediaTimeMachineDelegate:", v16);
      v17.receiver = v12;
      v17.super_class = (Class)FigCapturePreviewSinkPipeline;
      if ((objc_msgSendSuper2(&v17, sel_addNode_error_, v16, &v18) & 1) != 0
        && (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v16, "input"), a3) & 1) != 0)
      {
        -[BWNode output](v16, "output");
        if (a5)
          objc_msgSend(a6, "enableDeferredPrepareForNodesNotInPathOfSinkNode:", v16);
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    result = v18;
    if (v18)
      return (id)objc_msgSend(v18, "code");
  }
  return result;
}

- (void)updateClientAuditToken:(id *)a3
{
  BWImageQueueSinkNode *imageQueueSinkNode;
  __int128 v4;
  _OWORD v5[2];

  self->_primaryCaptureRectUniqueID = 0;
  imageQueueSinkNode = self->_imageQueueSinkNode;
  v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  -[BWImageQueueSinkNode updateClientAuditToken:](imageQueueSinkNode, "updateClientAuditToken:", v5);
}

- (BWPreviewStitcherNode)previewStitcherNode
{
  return self->_previewStitcher;
}

- (BWPixelTransferNode)scalerNode
{
  return self->_scalerNode;
}

- (BWNodeOutput)depthDataSinkOutput
{
  return self->_depthDataSinkOutput;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

@end
