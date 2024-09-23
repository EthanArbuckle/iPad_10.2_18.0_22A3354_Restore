@implementation FigCaptureMovieFileSinkHeadPipeline

- (NSString)videoSourceID
{
  return self->_videoSourceID;
}

- (int)videoSourceDeviceType
{
  return self->_videoSourceDeviceType;
}

- (BWIrisStagingNode)irisStagingNode
{
  return self->_irisStagingNode;
}

- (NSArray)inferenceConnections
{
  return &self->_inferenceConnections->super;
}

- (NSArray)metadataOutputs
{
  return &self->_metadataOutputs->super;
}

- (BWPhotoDecompressorNode)irisIntermediateJPEGPhotoDecompressorNode
{
  return self->_irisIntermediateJPEGPhotoDecompressorNode;
}

- (BWNodeOutput)audioOutput
{
  return self->_audioOutput;
}

- (BWNodeOutput)videoOutput
{
  return self->_videoOutput;
}

- (NSArray)indexesOfDetectedObjectsInMetadataOutputs
{
  return self->_indexesOfDetectedObjectsInMetadataOutputs;
}

- (int)indexOfVideoOrientationInMetadataOutputs
{
  return self->_indexOfVideoOrientationInMetadataOutputs;
}

- (BWFileCoordinatorNode)fileCoordinatorNode
{
  return self->_fileCoordinatorNode;
}

- (BWVideoDefringingNode)videoDefringingNode
{
  return self->_videoDefringingNode;
}

- (void)setSemanticStyleSceneObserver:(id)a3
{
  -[BWSceneClassifierSinkNode setSemanticStyleSceneObserver:](self->_sceneClassifierSinkNode, "setSemanticStyleSceneObserver:", a3);
}

- (void)setMRCSceneObserver:(id)a3
{
  -[BWSceneClassifierSinkNode setMRCSceneObserver:](self->_sceneClassifierSinkNode, "setMRCSceneObserver:", a3);
}

- (BWVideoOrientationMetadataNode)videoOrientationMetadataNode
{
  return self->_videoOrientationMetadataNode;
}

- (FigCaptureMovieFileSinkHeadPipeline)initWithConfiguration:(id)a3 videoSourceCaptureOutput:(id)a4 audioSourceCaptureOutput:(id)a5 audioSourceCinematicAudioCaptureOutput:(id)a6 detectedObjectBoxedMetadataOutputs:(id)a7 objectDetectionSourceOutput:(id)a8 metadataSourcePipelineOutputs:(id)a9 graph:(id)a10 parentPipeline:(id)a11 inferenceScheduler:(id)a12 captureDevice:(id)a13 audioSourceDelegate:(id)a14 fileCoordinatorStatusDelegate:(id)a15 irisRequestDelegate:(id)a16 masterClock:(OpaqueCMClock *)a17 workgroup:(id)a18 videoGreenGhostMitigationEnabled:(BOOL)a19
{
  FigCaptureMovieFileSinkHeadPipeline *v25;
  FigCaptureMovieFileSinkHeadPipeline *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)FigCaptureMovieFileSinkHeadPipeline;
  v25 = -[FigCapturePipeline initWithGraph:name:](&v28, sel_initWithGraph_name_, a10, CFSTR("Head Pipeline"));
  v26 = v25;
  if (v25)
  {
    v25->_indexOfVideoOrientationInMetadataOutputs = -1;
    v25->_inferenceConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[FigCaptureMovieFileSinkHeadPipeline _buildMovieFileSinkHeadPipeline:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:]((uint64_t)v26, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t)a8, a9, a10, a11, (uint64_t)a12, a13, (uint64_t)a14, (uint64_t)a15, (uint64_t)a16, (uint64_t)a17, (uint64_t)a18))
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v26;
}

- (uint64_t)_buildMovieFileSinkHeadPipeline:(uint64_t)a1 videoSourceCaptureOutput:(void *)a2 audioSourceCaptureOutput:(uint64_t)a3 audioSourceCinematicAudioCaptureOutput:(uint64_t)a4 detectedObjectBoxedMetadataOutputs:(uint64_t)a5 objectDetectionSourceOutput:(void *)a6 metadataSourcePipelineOutputs:(uint64_t)a7 graph:(void *)a8 parentPipeline:(void *)a9 inferenceScheduler:(void *)a10 captureDevice:(uint64_t)a11 audioSourceDelegate:(void *)a12 fileCoordinatorStatusDelegate:(uint64_t)a13 irisRequestDelegate:(uint64_t)a14 masterClock:(uint64_t)a15 workgroup:(uint64_t)a16 videoGreenGhostMitigationEnabled:(uint64_t)a17
{
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  int v33;
  float v34;
  float v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  _BOOL4 v41;
  BWAttachedMediaSplitNode *v42;
  BWAttachedMediaSplitNode *v43;
  char v44;
  void *v45;
  uint64_t v46;
  BWFrameRateGovernorNode *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  _BOOL8 v54;
  BWFanOutNode *v55;
  uint64_t v56;
  _BOOL8 v57;
  BWInferenceNode *v58;
  BWFrameRateGovernorNode *v59;
  BWVideoDefringingNode *v60;
  int v61;
  int v62;
  BWVideoDefringingNode *v63;
  int v64;
  BOOL v65;
  uint64_t v66;
  BWIrisStagingNode *v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  _BOOL8 v72;
  BOOL v73;
  _BYTE *v74;
  uint64_t v75;
  BOOL v76;
  BOOL v77;
  int v78;
  BOOL v79;
  BWIrisStagingNode *v80;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueCMClock *HostTimeClock;
  NSArray *v83;
  NSArray *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  uint64_t v92;
  BWVideoDefringingNode *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t j;
  BWFileCoordinatorNode *v98;
  BOOL v99;
  BWFileCoordinatorNode *v100;
  BWFileCoordinatorNode *v101;
  NSArray *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unsigned int v112;
  signed int v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  uint64_t v118;
  BWVideoDefringingNode *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  signed int v124;
  uint64_t v125;
  BWPipelineStage *v126;
  uint64_t v127;
  BWPipelineStage *v128;
  BWPhotoDecompressorNode *v129;
  _BOOL8 v130;
  BWPhotoDecompressorNode *v131;
  void *v132;
  float v133;
  float v134;
  FigCaptureCameraParameters *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  _BOOL8 v149;
  BWVideoDefringingNode *v150;
  uint64_t v151;
  BWAudioConverterNode *v152;
  BWAudioConverterNode *v153;
  BWAudioRemixAnalysisMetadataNode *v154;
  BWAudioRemixAnalysisMetadataNode *v155;
  BWAudioRemixAnalysisMetadataNode *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  BWAudioConverterNode *v161;
  BWAudioConverterNode *v162;
  BWVideoOrientationMetadataNode *v163;
  void *v164;
  BWVideoOrientationMetadataNode *v165;
  id v166;
  uint64_t v167;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  BWPipelineStage *v174;
  unint64_t v175;
  uint64_t v176;
  _BOOL4 v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  int v181;
  _BOOL8 v182;
  void *v183;
  _BOOL8 v184;
  _BOOL8 v185;
  uint64_t v187;
  _BYTE *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  uint64_t v194;
  uint64_t v195;
  id v197;
  BWNodeOutput *v198;
  void *v199;
  id obja;
  id objb;
  void *v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  CMTime v228;
  CMTime v229;
  os_log_type_t type;
  int v231;
  __int128 v232;
  uint64_t v233;
  __int128 v234;
  uint64_t v235;
  CMTime v236;
  CMTime time;
  CMTime v238;
  uint64_t v239;
  id v240;
  _QWORD v241[3];
  _QWORD v242[3];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  _BYTE v246[128];
  _BYTE v247[128];
  _BYTE v248[128];
  BWSceneClassifierSinkNode *v249;
  _OWORD v250[8];
  const __CFString *v251;
  uint64_t v252;
  _QWORD v253[4];

  v253[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v240 = 0;
  v21 = objc_msgSend(a2, "movieFileSinkPipelineConfiguration");
  v22 = v21;
  v189 = a4;
  if (v21)
    v23 = *(void **)(v21 + 16);
  else
    v23 = 0;
  v191 = (void *)objc_msgSend(v23, "irisSinkConfiguration");
  v24 = objc_msgSend(a2, "movieFilePipelineStage");
  v25 = objc_msgSend(a2, "movieFileSinkPipelineConfiguration");
  v185 = a3 != 0;
  v26 = v189 != 0;
  v27 = 1;
  if (v189)
    v27 = 2;
  if (a5)
    v26 = v27;
  v184 = v26;
  v28 = objc_msgSend(a8, "count");
  v188 = (_BYTE *)v25;
  if (!v25 || !*(_BYTE *)(v25 + 108))
  {
    v29 = (_QWORD *)objc_msgSend(a2, "movieFileSinkPipelineConfiguration");
    if (v29)
      v29 = (_QWORD *)v29[5];
    v28 += objc_msgSend(v29, "count");
  }
  v179 = a2;
  v182 = v23 != 0;
  v199 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v22)
    v32 = *(_BYTE *)(v22 + 138) != 0;
  else
    v32 = 0;
  if ((int)objc_msgSend(v23, "outputWidth") < 1441)
    v33 = 3;
  else
    v33 = 4;
  v34 = (float)v33;
  objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "livePhotoJPEGIntermediateCompressionRatioDefaultOverride");
  if (v35 > 0.0)
    v34 = v35;
  if (v34 == 0.0)
    v36 = 0.8;
  else
    v36 = 0.0;
  v192 = a1;
  v183 = v23;
  v203 = (void *)v31;
  v187 = v22;
  v178 = v24;
  v180 = a5;
  v181 = objc_msgSend(v191, "irisMovieCaptureEnabled");
  if (v181)
  {
    if (v22)
      v177 = *(_BYTE *)(v22 + 136) != 0;
    else
      v177 = 0;
    v37 = a3;
    v239 = 0;
    v38 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", NSTemporaryDirectory(), 1), "URLByAppendingPathComponent:isDirectory:", 0x1E493F418, 1), "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), 1);
    v39 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v252 = *MEMORY[0x1E0CB2AD8];
    v253[0] = *MEMORY[0x1E0CB2AC0];
    v176 = v38;
    objc_msgSend(v39, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v38, 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v253, &v252, 1), 0);
    if (a3)
    {
      if (v22)
      {
        if (!*(_BYTE *)(v22 + 185))
          v32 = 1;
        if (!v32)
        {
          v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (objc_msgSend(a12, "overCaptureEnabled"))
            objc_msgSend(v40, "addObject:", CFSTR("SynchronizedSlaveFrame"));
          if (*(_BYTE *)(v22 + 187))
          {
            if (v188)
              v41 = v188[188] != 0;
            else
              v41 = 0;
            objc_msgSend(v40, "addObjectsFromArray:", BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, v41));
          }
          v42 = [BWAttachedMediaSplitNode alloc];
          v251 = CFSTR("PrimaryFormat");
          v43 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:](v42, "initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v251, 1), v40);
          -[BWNode setName:](v43, "setName:", CFSTR("Movie File Depth Remover"));
          if ((objc_msgSend(a10, "addNode:error:", v43, &v240) & 1) == 0
            || (objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v43, "input"), 0) & 1) == 0)
          {
            goto LABEL_271;
          }
          v37 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v43, "outputs"), "objectAtIndexedSubscript:", 0);
          if (!v37)
          {
            v44 = 1;
            goto LABEL_59;
          }
        }
        v44 = !v32;
        v45 = *(void **)(v22 + 64);
      }
      else
      {
        v44 = 0;
        v45 = 0;
      }
      if (objc_msgSend((id)objc_msgSend(v45, "irisSinkConfiguration"), "irisFrameHarvestingEnabled"))
      {
        v46 = v37;
        v47 = objc_alloc_init(BWFrameRateGovernorNode);
        -[BWNode setName:](v47, "setName:", CFSTR("Movie File Frame Rate Governor"));
        -[BWFrameRateGovernorNode setDropsStillBracketFramesToMaintainConsistentFrameRate:](v47, "setDropsStillBracketFramesToMaintainConsistentFrameRate:", 1);
        -[BWFrameRateGovernorNode setDropsStartupFramesWithUnstableAE:](v47, "setDropsStartupFramesWithUnstableAE:", 1);
        -[BWFrameRateGovernorNode setPreservesMotionDataFromDroppedFrames:](v47, "setPreservesMotionDataFromDroppedFrames:", 1);
        if ((objc_msgSend(a10, "addNode:error:", v47, &v240) & 1) == 0
          || (objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v46, -[BWNode input](v47, "input"), 0) & 1) == 0)
        {
          goto LABEL_271;
        }
        v37 = -[BWNode output](v47, "output");
      }
    }
    else
    {
      v44 = 0;
    }
    if (!v22)
    {
      v175 = 0;
LABEL_60:
      v54 = v177;
      if (v177)
      {
        v55 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
        -[BWNode setName:](v55, "setName:", CFSTR("Inferences (SmartCam and VitalityScoring) Splitter"));
        if ((objc_msgSend(a10, "addNode:error:", v55, &v240) & 1) == 0
          || (objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v37, -[BWNode input](v55, "input"), 0) & 1) == 0)
        {
          goto LABEL_271;
        }
        v56 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v55, "outputs"), "objectAtIndexedSubscript:", 0);
        v174 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:discardsLateSampleData:", CFSTR("com.apple.coremedia.capture.moviefile.smartmedia"), 0, a17, 1);
        if (v22 && *(_QWORD *)(v22 + 72))
        {
          *(_QWORD *)&v250[0] = 0;
          if (v188)
          {
            if (v188[140])
              v57 = 1;
            else
              v57 = v188[187] != 0;
          }
          else
          {
            v57 = 0;
          }
          v249 = 0;
          v60 = (BWVideoDefringingNode *)FigCaptureBuildSceneClassifierPipeline(a10, -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v55, "outputs"), "objectAtIndexedSubscript:", 1), v175 & 0xFFFFFFFFFFFFLL, 13, (uint64_t)v174, 1, v57, (uint64_t)a12, a11, v250, &v239, &v249);
          if ((_DWORD)v60)
          {
            v63 = v60;
            goto LABEL_302;
          }
          *(_QWORD *)(v192 + 64) = v249;
          *(_QWORD *)(v192 + 104) = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v55, "outputs"), "objectAtIndexedSubscript:", 1);
          objc_msgSend(*(id *)(v192 + 112), "addObjectsFromArray:", *(_QWORD *)&v250[0]);
        }
        else
        {
          v58 = FigCaptureCreateAndConfigureSmartCameraInferenceNode(13, v175 & 0xFFFFFFFFFFFFLL, (uint64_t)a12, a11);
          if ((objc_msgSend(a10, "addNode:error:", v58, &v240) & 1) == 0
            || (objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v55, "outputs"), "objectAtIndexedSubscript:", 1), -[BWNode input](v58, "input"), v174) & 1) == 0)
          {
            goto LABEL_271;
          }
          v239 = -[BWNode output](v58, "output");
          objc_msgSend(*(id *)(v192 + 112), "addObject:", -[BWNodeInput connection](-[BWNode input](v58, "input"), "connection"));
        }
        -[BWFanOutNode setDiscardsAttachedMedia:forOutputIndex:](v55, "setDiscardsAttachedMedia:forOutputIndex:", 1, 1);
        v37 = v56;
        v54 = v177;
      }
      else
      {
        v174 = 0;
      }
      v194 = v37;
      if (v22)
      {
        v61 = *(_DWORD *)(v22 + 104);
        if (objc_msgSend(v23, "irisVISMethod") == 3)
        {
          if (!v61)
          {
            v62 = 0;
            goto LABEL_106;
          }
          goto LABEL_105;
        }
      }
      else
      {
        v61 = 0;
        v62 = 0;
        if (objc_msgSend(v23, "irisVISMethod") == 3)
          goto LABEL_106;
      }
      v64 = objc_msgSend(v23, "irisVISMethod");
      v62 = 0;
      if (!v61 || v64 != 5)
      {
LABEL_106:
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "sourceConfiguration"), "requiredFormat"), "semanticRenderingSupported"))v65 = (int)objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "semanticRenderingVersion") > 2;
        else
          v65 = 0;
        v49 = v191;
        v66 = objc_msgSend(a12, "cameraInfoByPortType");
        v67 = [BWIrisStagingNode alloc];
        v68 = objc_msgSend(v191, "irisMovieAutoTrimMethod");
        if (v22)
        {
          v72 = *(_BYTE *)(v22 + 137) != 0;
          v73 = *(_BYTE *)(v22 + 138) != 0;
          v74 = v188;
          v75 = v176;
          v76 = (v44 & 1) == 0 && *(_BYTE *)(v22 + 185) != 0;
          LODWORD(v69) = *(_DWORD *)(v22 + 156);
          v77 = *(_BYTE *)(v22 + 139) != 0;
        }
        else
        {
          v73 = 0;
          v72 = 0;
          v76 = 0;
          v77 = 0;
          LODWORD(v69) = 0;
          v74 = v188;
          v75 = v176;
        }
        if (v74)
        {
          v78 = *((_DWORD *)v74 + 36);
          v79 = v74[187] != 0;
          LOBYTE(v74) = v74[188] != 0;
        }
        else
        {
          v79 = 0;
          v78 = 0;
        }
        BYTE1(v173) = (_BYTE)v74;
        LOBYTE(v173) = v79;
        HIDWORD(v171) = v78;
        BYTE1(v171) = v65;
        LOBYTE(v171) = v77;
        HIDWORD(v169) = v62;
        BYTE2(v169) = 1;
        BYTE1(v169) = v76;
        LOBYTE(v169) = v73;
        *(float *)&v70 = v36;
        *(float *)&v71 = v34;
        v80 = objc_autorelease(-[BWIrisStagingNode initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:autoTrimMethod:vitalityScoringEnabled:captureDeviceHasOverCaptureEnabled:overCaptureEnabled:depthEnabled:videoStabilizationOverscanOverride:sequenceAdjusterEnabled:visMotionMetadataPreloadingMode:frameReconstructionEnabled:subjectRelightingEnabled:intermediateJPEGCompressionQuality:intermediateJPEGCompressionRate:maxLossyCompressionLevel:temporaryMovieDirectoryURL:cameraInfoByPortType:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:irisRequestDelegate:](v67, "initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:autoTrimMethod:vitalityScoringEnabled:captureDeviceHasOverCaptureEnabled:overCaptureEnabled:depthEnabled:videoStabilizationOverscanOverride:sequenceAdjusterEnabled:visMotionMetadataPreloadingMode:frameReconstructionEnabled:subjectRelightingEnabled:intermediateJPEGCompressionQuality:intermediateJPEGCompressionRate:maxLossyCompressionLevel:temporaryMovieDirectoryURL:cameraInfoByPortType:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:irisRequestDelegate:", v185, v184, v28, v68, v54, v72, v69, v70, v71, v169, v171,
                  v75,
                  v66,
                  v173,
                  a15));
        if ((objc_msgSend(a10, "addNode:error:", v80, &v240) & 1) == 0)
          goto LABEL_271;
        *(_QWORD *)(v192 + 32) = v80;
        -[BWNode setName:](v80, "setName:", CFSTR("Movie File Staging Node"));
        if (v34 >= 0.0)
          -[BWIrisStagingNode setIntermediateJPEGDownstreamRetainedBufferCount:](v80, "setIntermediateJPEGDownstreamRetainedBufferCount:", 5);
        if (v191)
          objc_msgSend(v191, "irisMovieDuration");
        else
          memset(&time, 0, sizeof(time));
        CMTimeMultiplyByRatio(&v238, &time, 1, 2);
        v236 = v238;
        -[BWIrisStagingNode setBufferingTime:](v80, "setBufferingTime:", &v236);
        if (v191)
        {
          objc_msgSend(v191, "irisMovieVideoFrameDuration");
        }
        else
        {
          v234 = 0uLL;
          v235 = 0;
        }
        v232 = v234;
        v233 = v235;
        -[BWIrisStagingNode setTargetFrameDuration:](v80, "setTargetFrameDuration:", &v232);
        if (v54)
          -[BWIrisStagingNode setVitalityScoringSmartCameraPipelineVersion:](v80, "setVitalityScoringSmartCameraPipelineVersion:", v175 & 0xFFFFFFFFFFFFLL);
        -[BWIrisStagingNode setMasterClock:](v80, "setMasterClock:", a16);
        -[BWIrisStagingNode setApplyPreviewShift:](v80, "setApplyPreviewShift:", objc_msgSend(v191, "irisApplyPreviewShift"));
        if (dword_1ECFE9810)
        {
          v231 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (objc_msgSend(v191, "irisMovieCaptureSuspended", v170, v172))
        {
          HostTimeClock = CMClockGetHostTimeClock();
          CMClockGetTime(&v229, HostTimeClock);
          v228 = v229;
          -[BWIrisStagingNode setEndIrisMovieCaptureTime:](v80, "setEndIrisMovieCaptureTime:", &v228);
        }
        v83 = -[BWNode inputs](v80, "inputs");
        v84 = -[BWNode outputs](v80, "outputs");
        if (v194)
        {
          v85 = v189;
          if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v194, -[NSArray objectAtIndexedSubscript:](v83, "objectAtIndexedSubscript:", 0), 0) & 1) == 0)goto LABEL_271;
          v86 = -[NSArray objectAtIndexedSubscript:](v84, "objectAtIndexedSubscript:", 0);
          v87 = 1;
        }
        else
        {
          v87 = 0;
          v86 = 0;
          v85 = v189;
        }
        a3 = v86;
        if (v85)
        {
          if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v85, -[NSArray objectAtIndexedSubscript:](v83, "objectAtIndexedSubscript:", v87), 0) & 1) == 0)goto LABEL_271;
          v189 = -[NSArray objectAtIndexedSubscript:](v84, "objectAtIndexedSubscript:", v87++);
        }
        else
        {
          v189 = 0;
        }
        v226 = 0u;
        v227 = 0u;
        v224 = 0u;
        v225 = 0u;
        v88 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v224, v248, 16);
        if (v88)
        {
          v89 = v88;
          v90 = *(_QWORD *)v225;
          do
          {
            for (i = 0; i != v89; ++i)
            {
              if (*(_QWORD *)v225 != v90)
                objc_enumerationMutation(a8);
              if (!objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", *(_QWORD *)(*((_QWORD *)&v224 + 1) + 8 * i), -[NSArray objectAtIndexedSubscript:](v83, "objectAtIndexedSubscript:", v87 + i), 0))goto LABEL_271;
              objc_msgSend(v30, "addObject:", -[NSArray objectAtIndexedSubscript:](v84, "objectAtIndexedSubscript:", v87 + i));
            }
            v89 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v224, v248, 16);
            v87 += i;
          }
          while (v89);
          v22 = v187;
          v49 = v191;
        }
        v92 = objc_msgSend(a6, "count");
        v53 = v192;
        if (!a7 && !v92)
        {
          obja = a6;
LABEL_165:
          if (v239)
          {
            if (v87 != -[NSArray count](v83, "count") - 1)
              -[FigCaptureMovieFileSinkHeadPipeline _buildMovieFileSinkHeadPipeline:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:].cold.1();
            if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v239, -[NSArray objectAtIndexedSubscript:](v83, "objectAtIndexedSubscript:", v87), v174) & 1) == 0)goto LABEL_271;
          }
          a7 = 0;
          goto LABEL_169;
        }
        if (!a7)
        {
LABEL_154:
          obja = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v220 = 0u;
          v221 = 0u;
          v222 = 0u;
          v223 = 0u;
          v94 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v220, v247, 16);
          if (v94)
          {
            v95 = v94;
            v96 = *(_QWORD *)v221;
            do
            {
              for (j = 0; j != v95; ++j)
              {
                if (*(_QWORD *)v221 != v96)
                  objc_enumerationMutation(a6);
                if (!objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * j), -[NSArray objectAtIndexedSubscript:](v83, "objectAtIndexedSubscript:", v87 + j), 0))goto LABEL_271;
                objc_msgSend(obja, "addObject:", -[NSArray objectAtIndexedSubscript:](v84, "objectAtIndexedSubscript:", v87 + j));
              }
              v95 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v220, v247, 16);
              v87 += j;
            }
            while (v95);
            v53 = v192;
            v22 = v187;
            v49 = v191;
          }
          else
          {
            v22 = v187;
          }
          goto LABEL_165;
        }
        *(_QWORD *)&v250[0] = 0;
        v93 = (BWVideoDefringingNode *)-[FigCaptureMovieFileSinkHeadPipeline _buildFaceDetectionNode:parentPipeline:objectDetectionSourceOutput:faceDetectionNodeOut:](v192, (_QWORD *)objc_msgSend(v179, "movieFileSinkPipelineConfiguration"), a10, a7, v250);
        if (!(_DWORD)v93)
        {
          a6 = (void *)objc_msgSend(*(id *)&v250[0], "boxedMetadataOutputs");
          v53 = v192;
          goto LABEL_154;
        }
        v63 = v93;
LABEL_302:
        FigDebugAssert3();
        if (!(_DWORD)v63)
          goto LABEL_273;
        return (uint64_t)v63;
      }
LABEL_105:
      v62 = 1;
      goto LABEL_106;
    }
LABEL_59:
    v175 = *(unsigned int *)(v22 + 116) | ((unint64_t)*(unsigned __int16 *)(v22 + 120) << 32);
    goto LABEL_60;
  }
  v218 = 0u;
  v219 = 0u;
  v216 = 0u;
  v217 = 0u;
  v48 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v216, v246, 16);
  v49 = v191;
  if (v48)
  {
    v50 = v48;
    v51 = *(_QWORD *)v217;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v217 != v51)
          objc_enumerationMutation(a8);
        objc_msgSend(v30, "addObject:", *(_QWORD *)(*((_QWORD *)&v216 + 1) + 8 * k));
      }
      v50 = objc_msgSend(a8, "countByEnumeratingWithState:objects:count:", &v216, v246, 16);
    }
    while (v50);
  }
  if (a3)
  {
    v53 = v192;
    if (!v188 || !v188[151] || v188[150])
    {
      obja = a6;
      goto LABEL_169;
    }
    v59 = objc_alloc_init(BWFrameRateGovernorNode);
    -[BWNode setName:](v59, "setName:", CFSTR("Movie File Frame Rate Governor"));
    -[BWFrameRateGovernorNode setDropsStartupFramesWithUnstableAE:](v59, "setDropsStartupFramesWithUnstableAE:", 1);
    -[BWFrameRateGovernorNode setAeStabilityTuning:](v59, "setAeStabilityTuning:", 2);
    if ((objc_msgSend(a10, "addNode:error:", v59, &v240) & 1) == 0
      || (objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v59, "input"), 0) & 1) == 0)
    {
      goto LABEL_271;
    }
    a3 = -[BWNode output](v59, "output");
  }
  else
  {
    a3 = 0;
  }
  obja = a6;
  v53 = v192;
LABEL_169:
  v98 = [BWFileCoordinatorNode alloc];
  if (v22)
    v22 = *(_BYTE *)(v22 + 138) != 0;
  if (v188)
    v99 = v188[151] != 0;
  else
    v99 = 0;
  LOBYTE(v169) = v99;
  v100 = -[BWFileCoordinatorNode initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:numberOfActionOnlyOutputs:overCaptureEnabled:allowLowLatencyWhenPossible:useTrueVideoFileRecordingStaging:motionDataTimeMachine:](v98, "initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:numberOfActionOnlyOutputs:overCaptureEnabled:allowLowLatencyWhenPossible:useTrueVideoFileRecordingStaging:motionDataTimeMachine:", v185, v184, v28, v182, v22, v181 ^ 1u, v169, objc_msgSend(*(id *)(v53 + 32), "motionDataTimeMachine"));
  -[BWFileCoordinatorNode setFlagsLastFrameForVideoCompressor:](v100, "setFlagsLastFrameForVideoCompressor:", objc_msgSend(v49, "irisMovieCaptureEnabled") ^ 1);
  -[BWFileCoordinatorNode setAudioSourceDelegate:](v100, "setAudioSourceDelegate:", a13);
  -[BWFileCoordinatorNode setFileCoordiatorStatusDelegate:](v100, "setFileCoordiatorStatusDelegate:", a14);
  if ((objc_msgSend(a10, "addNode:error:", v100, &v240) & 1) == 0)
    goto LABEL_271;
  v101 = v100;
  *(_QWORD *)(v53 + 40) = v101;
  v102 = -[BWNode inputs](v101, "inputs");
  v103 = (void *)objc_msgSend(*(id *)(v53 + 40), "outputs");
  if (a3)
  {
    v104 = v180;
    v105 = v189;
    if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", a3, -[NSArray objectAtIndexedSubscript:](v102, "objectAtIndexedSubscript:", 0), 0) & 1) == 0)goto LABEL_271;
    v106 = objc_msgSend(v103, "objectAtIndexedSubscript:", 0);
    v107 = 1;
    if (v189)
      goto LABEL_177;
  }
  else
  {
    v107 = 0;
    v106 = 0;
    v104 = v180;
    v105 = v189;
    if (v189)
    {
LABEL_177:
      if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v105, -[NSArray objectAtIndexedSubscript:](v102, "objectAtIndexedSubscript:", v107), 0) & 1) == 0)goto LABEL_271;
      v190 = objc_msgSend(v103, "objectAtIndexedSubscript:", v107++);
      goto LABEL_181;
    }
  }
  v190 = 0;
LABEL_181:
  v197 = (id)v106;
  if (v104)
  {
    if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v104, -[NSArray objectAtIndexedSubscript:](v102, "objectAtIndexedSubscript:", v107), 0) & 1) == 0)goto LABEL_271;
    v195 = objc_msgSend(v103, "objectAtIndexedSubscript:", v107++);
  }
  else
  {
    v195 = 0;
  }
  v214 = 0u;
  v215 = 0u;
  v212 = 0u;
  v213 = 0u;
  v108 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v212, v245, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v213;
    do
    {
      v111 = 0;
      v112 = v107;
      do
      {
        if (*(_QWORD *)v213 != v110)
          objc_enumerationMutation(v30);
        if (!objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * v111), -[NSArray objectAtIndexedSubscript:](v102, "objectAtIndexedSubscript:", (int)v107 + v111), 0))goto LABEL_271;
        objc_msgSend(v203, "addObject:", objc_msgSend(v103, "objectAtIndexedSubscript:", (int)v107 + v111++));
      }
      while (v109 != v111);
      v107 += v111;
      v109 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v212, v245, 16);
    }
    while (v109);
    v113 = v112 + v111;
  }
  else
  {
    v113 = v107;
  }
  v114 = objc_msgSend(obja, "count");
  v115 = v192;
  v116 = v183;
  v117 = v203;
  if (a7 || v114)
  {
    v118 = objc_msgSend(v179, "movieFileSinkPipelineConfiguration");
    if (!v118 || !*(_BYTE *)(v118 + 108))
    {
      if (a7)
      {
        *(_QWORD *)&v250[0] = 0;
        v119 = (BWVideoDefringingNode *)-[FigCaptureMovieFileSinkHeadPipeline _buildFaceDetectionNode:parentPipeline:objectDetectionSourceOutput:faceDetectionNodeOut:](v192, (_QWORD *)objc_msgSend(v179, "movieFileSinkPipelineConfiguration"), a10, a7, v250);
        if ((_DWORD)v119)
        {
          v63 = v119;
          FigDebugAssert3();
          return (uint64_t)v63;
        }
        obja = (id)objc_msgSend(*(id *)&v250[0], "boxedMetadataOutputs");
        v115 = v192;
      }
      v210 = 0u;
      v211 = 0u;
      v208 = 0u;
      v209 = 0u;
      v120 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v208, v244, 16);
      if (v120)
      {
        v121 = v120;
        v122 = *(_QWORD *)v209;
        do
        {
          v123 = 0;
          v124 = v113;
          do
          {
            if (*(_QWORD *)v209 != v122)
              objc_enumerationMutation(obja);
            if (!objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * v123), objc_msgSend((id)objc_msgSend(*(id *)(v115 + 40), "inputs"), "objectAtIndexedSubscript:", v113 + v123), 0))goto LABEL_271;
            v117 = v203;
            objc_msgSend(v203, "addObject:", objc_msgSend(v103, "objectAtIndexedSubscript:", v113 + v123));
            objc_msgSend(v199, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v203, "count") - 1));
            ++v123;
          }
          while (v121 != v123);
          v113 += v123;
          v121 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v208, v244, 16);
        }
        while (v121);
        v113 = v124 + v123;
      }
      v116 = v183;
    }
  }
  if (v116)
  {
    objb = (id)objc_msgSend(v103, "objectAtIndexedSubscript:", v113);
    objc_msgSend(v117, "addObject:");
    *(_DWORD *)(v115 + 184) = objc_msgSend(v117, "count") - 1;
  }
  else
  {
    objb = 0;
  }
  v125 = v187;
  v126 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", CFSTR("com.apple.coremedia.capture.moviefile.head"), 14, a17);
  v127 = (uint64_t)v197;
  if (v197)
  {
    v128 = v126;
    if (objc_msgSend(v191, "irisMovieCaptureEnabled"))
    {
      if (v34 >= 0.0)
      {
        v129 = [BWPhotoDecompressorNode alloc];
        if (v187)
          v130 = *(_BYTE *)(v187 + 138) != 0;
        else
          v130 = 0;
        v131 = -[BWPhotoDecompressorNode initWithSynchronizedSlaveAttachedMediaDecompressionEnabled:](v129, "initWithSynchronizedSlaveAttachedMediaDecompressionEnabled:", v130);
        if ((objc_msgSend(a10, "addNode:error:", v131, &v240) & 1) == 0
          || (objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v197, -[BWNode input](v131, "input"), v128) & 1) == 0)
        {
          goto LABEL_271;
        }
        v127 = -[BWNode output](v131, "output");
        *(_QWORD *)(v192 + 48) = v131;
      }
    }
  }
  v198 = (BWNodeOutput *)v127;
  if (v187)
    v132 = *(void **)(v187 + 8);
  else
    v132 = 0;
  objc_msgSend(v132, "requiredMaxFrameRate");
  v134 = v133;
  v135 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v204 = 0u;
  v205 = 0u;
  v206 = 0u;
  v207 = 0u;
  v136 = (void *)objc_msgSend(a12, "captureStreams");
  v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v204, v243, 16);
  v138 = v195;
  if (v137)
  {
    v139 = v137;
    v140 = *(_QWORD *)v205;
LABEL_227:
    v141 = 0;
    while (1)
    {
      if (*(_QWORD *)v205 != v140)
        objc_enumerationMutation(v136);
      v142 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * v141);
      v143 = objc_msgSend(v142, "portType");
      v144 = objc_msgSend(v142, "sensorIDString");
      if (v134 <= 60.0)
      {
        if (-[FigCaptureCameraParameters chromaticDefringingEnabledForVideoForPortType:sensorIDString:](v135, "chromaticDefringingEnabledForVideoForPortType:sensorIDString:", v143, v144))
        {
LABEL_237:
          v147 = objc_msgSend(v142, "sensorIDString");
          v148 = objc_msgSend(v142, "portType");
          v125 = v187;
          if (v187)
            v149 = *(_BYTE *)(v187 + 138) != 0;
          else
            v149 = 0;
          v146 = v203;
          v63 = -[BWVideoDefringingNode initWithSensorIDString:portType:propagateSynchronizedSlaveFrame:isSlomo:]([BWVideoDefringingNode alloc], "initWithSensorIDString:portType:propagateSynchronizedSlaveFrame:isSlomo:", v147, v148, v149, v134 > 60.0);
          if (!v63)
            goto LABEL_302;
          if ((objc_msgSend(a10, "addNode:error:", v63, &v240) & 1) != 0
            && (objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v198, -[BWNode input](v63, "input"), +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.moviefile.defringing"), 14)) & 1) != 0)
          {
            v198 = -[BWNode output](v63, "output");
            objc_msgSend(*(id *)(v192 + 48), "setDownstreamIsSharingOutputPool:", 1);
            v150 = v63;
            v145 = v192;
            *(_QWORD *)(v192 + 56) = v150;
            v116 = v183;
            goto LABEL_244;
          }
LABEL_271:
          FigDebugAssert3();
LABEL_272:
          v63 = 0;
          goto LABEL_273;
        }
      }
      else if (-[FigCaptureCameraParameters chromaticDefringingEnabledForSlomoForPortType:sensorIDString:](v135, "chromaticDefringingEnabledForSlomoForPortType:sensorIDString:", v143, v144))
      {
        goto LABEL_237;
      }
      if (v139 == ++v141)
      {
        v139 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v204, v243, 16);
        if (v139)
          goto LABEL_227;
        v145 = v192;
        v116 = v183;
        v146 = v203;
        v125 = v187;
        goto LABEL_244;
      }
    }
  }
  v145 = v192;
  v146 = v203;
LABEL_244:
  v151 = v190;
  if (v190 && (objc_msgSend(v191, "irisMovieCaptureEnabled") & 1) == 0)
  {
    v152 = objc_alloc_init(BWAudioConverterNode);
    -[BWNode setName:](v152, "setName:", CFSTR("AudioConverterNode"));
    -[BWAudioConverterNode setCinematicAudioCapture:](v152, "setCinematicAudioCapture:", 0);
    if ((objc_msgSend(a10, "addNode:error:", v152, &v240) & 1) == 0)
      goto LABEL_271;
    v153 = v152;
    v145 = v192;
    *(_QWORD *)(v192 + 72) = v153;
    if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v190, -[BWNode input](v153, "input"), v178) & 1) == 0)
      goto LABEL_271;
    v151 = objc_msgSend(*(id *)(v192 + 72), "output");
  }
  if (v188 && v188[152] && v195)
  {
    v154 = objc_alloc_init(BWAudioRemixAnalysisMetadataNode);
    if (!v154)
      goto LABEL_271;
    v155 = v154;
    if (!objc_msgSend(a10, "addNode:error:", v154, &v240))
      goto LABEL_271;
    if (v240)
      goto LABEL_271;
    v156 = v155;
    *(_QWORD *)(v145 + 88) = v156;
    if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v195, -[BWNode input](v156, "input"), v178) & 1) == 0)
      goto LABEL_271;
    v157 = v151;
    v158 = objc_msgSend(*(id *)(v145 + 88), "output");
    v159 = v145;
    v160 = v158;
    objc_msgSend(v146, "addObject:", objc_msgSend(*(id *)(v159 + 88), "metadataOutput"));
    v161 = objc_alloc_init(BWAudioConverterNode);
    -[BWNode setName:](v161, "setName:", CFSTR("Cinematic Audio Converter"));
    if ((FigCapturePixelFormatIs422(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v116, "sourceConfiguration"), "requiredFormat"), "format")) & 1) == 0)
    {
      v250[0] = xmmword_1A32A29C8;
      v250[1] = unk_1A32A29D8;
      v241[0] = 0x1E4930B38;
      v241[1] = 0x1E4930B78;
      v242[0] = &unk_1E49F8730;
      v242[1] = &unk_1E49F8748;
      v241[2] = 0x1E4930CB8;
      v242[2] = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v250, 32);
      -[BWAudioConverterNode setSettings:](v161, "setSettings:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v242, v241, 3));
    }
    -[BWAudioConverterNode setCinematicAudioCapture:](v161, "setCinematicAudioCapture:", 1);
    if ((objc_msgSend(a10, "addNode:error:", v161, &v240) & 1) == 0)
      goto LABEL_271;
    v162 = v161;
    *(_QWORD *)(v192 + 80) = v162;
    if ((objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", v160, -[BWNode input](v162, "input"), v178) & 1) == 0)
      goto LABEL_271;
    v145 = v192;
    v151 = v157;
    v138 = objc_msgSend(*(id *)(v192 + 80), "output");
  }
  if (objb)
  {
    v163 = objc_alloc_init(BWVideoOrientationMetadataNode);
    if (v125)
    {
      -[BWVideoOrientationMetadataNode setSourcePosition:](v163, "setSourcePosition:", objc_msgSend(*(id *)(v125 + 8), "sourcePosition"));
      v164 = *(void **)(v125 + 8);
    }
    else
    {
      -[BWVideoOrientationMetadataNode setSourcePosition:](v163, "setSourcePosition:", objc_msgSend(0, "sourcePosition"));
      v164 = 0;
    }
    -[BWVideoOrientationMetadataNode setSourceDeviceType:](v163, "setSourceDeviceType:", objc_msgSend(v164, "sourceDeviceType"));
    -[BWVideoOrientationMetadataNode setMasterClock:](v163, "setMasterClock:", a16);
    -[BWVideoOrientationMetadataNode setPhysicalMirroringForMovieRecordingEnabled:](v163, "setPhysicalMirroringForMovieRecordingEnabled:", objc_msgSend(v116, "physicalMirroringForMovieRecordingEnabled"));
    if ((objc_msgSend(a10, "addNode:error:", v163, &v240) & 1) == 0
      || (objc_msgSend(a9, "connectOutput:toInput:pipelineStage:", objb, -[BWNode input](v163, "input"), v178) & 1) == 0)
    {
      goto LABEL_271;
    }
    objc_msgSend(v146, "setObject:atIndexedSubscript:", -[BWNode output](v163, "output"), *(int *)(v192 + 184));
    *(_QWORD *)(v192 + 120) = (id)objc_msgSend(v116, "connectionID");
    *(_QWORD *)(v192 + 128) = (id)objc_msgSend((id)objc_msgSend(v116, "sourceConfiguration"), "sourceID");
    *(_DWORD *)(v192 + 188) = objc_msgSend(v116, "underlyingDeviceType");
    v165 = v163;
    v145 = v192;
    *(_QWORD *)(v192 + 96) = v165;
  }
  *(_QWORD *)(v145 + 144) = v198;
  *(_QWORD *)(v145 + 152) = v151;
  *(_QWORD *)(v145 + 160) = v138;
  if (objc_msgSend(v146, "count"))
    *(_QWORD *)(v145 + 168) = v146;
  if (!objc_msgSend(v199, "count"))
    goto LABEL_272;
  v166 = v199;
  v167 = v145;
  v63 = 0;
  *(_QWORD *)(v167 + 176) = v166;
LABEL_273:
  if (v240)
    return objc_msgSend(v240, "code");
  return (uint64_t)v63;
}

- (void)dealloc
{
  objc_super v3;

  if (-[BWIrisStagingNode temporaryMovieDirectoryURL](self->_irisStagingNode, "temporaryMovieDirectoryURL"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", -[BWIrisStagingNode temporaryMovieDirectoryURL](self->_irisStagingNode, "temporaryMovieDirectoryURL"), 0);

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkHeadPipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

- (BWMRCSceneObserver)mrcSceneObserver
{
  return -[BWSceneClassifierSinkNode mrcSceneObserver](self->_sceneClassifierSinkNode, "mrcSceneObserver");
}

- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver
{
  return -[BWSceneClassifierSinkNode semanticStyleSceneObserver](self->_sceneClassifierSinkNode, "semanticStyleSceneObserver");
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
      v10 = v3;
      LODWORD(v9) = 0;
      FigDebugAssert3();
    }
    -[BWNodeOutput setDiscardsSampleData:](v7, "setDiscardsSampleData:", v6, v9, v10);
    sceneClassifierPipelineUpstreamOutput = self->_sceneClassifierPipelineUpstreamOutput;
    if (!sceneClassifierPipelineUpstreamOutput)
    {
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

- (id)_buildFaceDetectionNode:(void *)a3 parentPipeline:(uint64_t)a4 objectDetectionSourceOutput:(_QWORD *)a5 faceDetectionNodeOut:
{
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  BWFaceDetectionNode *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = a2;
  v21 = 0;
  if (a2)
    v9 = (void *)a2[5];
  else
    v9 = 0;
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    if (v8)
      v8 = (_QWORD *)v8[5];
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v8);
          objc_msgSend(v10, "addObject:", CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1)+ 8 * i), "formatDescription")));
        }
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = FigCaptureBuildObjectDetectionPipeline(a3, 0, v10, a4, &v21, 0.0, 0.0, 1.0, 1.0);
  if ((_DWORD)v15)
    FigDebugAssert3();
  else
    *a5 = v21;
  return v15;
}

- (NSString)videoConnectionID
{
  return self->_videoConnectionID;
}

- (BWNodeOutput)cinematicAudioOutput
{
  return self->_cinematicAudioOutput;
}

- (void)_buildMovieFileSinkHeadPipeline:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:.cold.1()
{
  __assert_rtn("-[FigCaptureMovieFileSinkHeadPipeline _buildMovieFileSinkHeadPipeline:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:]", "FigCaptureMovieFileSinkPipeline.m", 1153, "curStagingIndex == irisStagingNodeInputs.count - 1");
}

@end
