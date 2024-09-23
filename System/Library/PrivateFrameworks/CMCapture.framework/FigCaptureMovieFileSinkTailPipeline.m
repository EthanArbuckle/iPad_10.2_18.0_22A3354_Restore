@implementation FigCaptureMovieFileSinkTailPipeline

- (BWQuickTimeMovieFileSinkNode)movieFileSinkNode
{
  return self->_movieFileSinkNode;
}

- (BWVideoCompressorNode)videoCompressorNode
{
  return self->_videoCompressorNode;
}

- (BWVideoCompressorNode)sdofCompressorNode
{
  return self->_sdofCompressorNode;
}

- (id)_metalCommandQueueWithName:(uint64_t)a1 priority:
{
  id v1;
  void *v2;

  if (!a1)
    return 0;
  v1 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice"), "newCommandQueue");
  v2 = (void *)FigDispatchQueueCreateWithPriority();
  objc_msgSend(v1, "setCompletionQueue:", v2);
  objc_msgSend(v1, "setSubmissionQueue:", v2);

  return v1;
}

- (uint64_t)setUpBackPressureSemaphoresWithIrisIntermediateJPEGPhotoDecompressorNode:(void *)a3 videoDefringingNode:
{
  uint64_t v3;
  uint64_t v6;
  int v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (result)
  {
    v6 = result;
    if (*(_QWORD *)(result + 96))
    {
      objc_msgSend(*(id *)(result + 96), "setInitialSemaphoreValue:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 144), "output"), "primaryMediaProperties"), "resolvedRetainedBufferCount")- *(_DWORD *)(result + 160)+ 1);
      objc_msgSend(*(id *)(v6 + 144), "setEmitSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 96), "semaphore"));
      result = objc_msgSend(*(id *)(v6 + 96), "setBackPressureSourceNode:", *(_QWORD *)(v6 + 144));
      if (*(_QWORD *)(v6 + 112))
      {
        objc_msgSend(*(id *)(v6 + 112), "setInitialSemaphoreValue:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[FigCaptureVISPipeline sdofVISNode](*(_QWORD *)(v6 + 40)), "output"), "primaryMediaProperties"), "resolvedRetainedBufferCount")- *(_DWORD *)(v6 + 160)+ 1);
        result = objc_msgSend((id)-[FigCaptureVISPipeline sdofVISNode](*(_QWORD *)(v6 + 40)), "setEmitSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 112), "semaphore"));
      }
    }
    if (*(_QWORD *)(v6 + 88))
    {
      if (!*(_QWORD *)(v6 + 152))
      {
        v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "output"), "primaryMediaProperties"), "resolvedRetainedBufferCount");
        if ((int)(v7 - objc_msgSend((id)objc_msgSend(a3, "input"), "delayedBufferCount") + 1) <= 0)
        {
          v13 = v3;
          LODWORD(v12) = 0;
          FigDebugAssert3();
        }
        objc_msgSend(*(id *)(v6 + 88), "setInitialSemaphoreValue:", v12, v13);
        objc_msgSend(a2, "addEmitSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 88), "semaphore"));
        v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 88), "input"), "connection"), "output"), "node"), "input"), "connection"), "pipelineStage"), "queue");
        result = objc_msgSend(v8, "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "input"), "connection"), "pipelineStage"), "queue"));
        if ((result & 1) == 0)
          result = objc_msgSend(*(id *)(v6 + 88), "setSemaphoreSignalQueue:", v8);
      }
      if (*(_QWORD *)(v6 + 152) == 1)
      {
        v9 = CFSTR("SynchronizedSlaveFrame");
        v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "output"), "mediaPropertiesForAttachedMediaKey:", CFSTR("SynchronizedSlaveFrame")), "resolvedRetainedBufferCount");
        if (!*(_QWORD *)(v6 + 152))
          v9 = CFSTR("PrimaryFormat");
        v11 = v10
            - objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "input"), "mediaConfigurationForAttachedMediaKey:", v9), "delayedBufferCount")+ 1;
        if ((int)v11 <= 0)
        {
          v13 = v3;
          LODWORD(v12) = 0;
          FigDebugAssert3();
        }
        objc_msgSend(*(id *)(v6 + 88), "setInitialSemaphoreValue:", v11, v12, v13);
        result = objc_msgSend(a2, "addEmitSynchronizedSlaveSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 88), "semaphore"));
      }
    }
    if (*(_QWORD *)(v6 + 104))
    {
      objc_msgSend(*(id *)(v6 + 104), "setInitialSemaphoreValue:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 32), "output"), "primaryMediaProperties"), "resolvedRetainedBufferCount")+ 1);
      return objc_msgSend(*(id *)(v6 + 32), "setEmitSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 104), "semaphore"));
    }
  }
  return result;
}

- (uint64_t)_appendBackPressureNodeToPreviousVideoOutput:(void *)a3 graph:(void *)a4 parentPipeline:(uint64_t)a5 pipelineStage:(uint64_t)a6 nodeName:(_QWORD *)a7 backPressureNodeOut:
{
  BWBackPressureNode *v14;
  uint64_t v15;
  uint64_t v17;

  if (!a1)
    return 0;
  v17 = 0;
  v14 = -[BWBackPressureNode initWithNumberOfInputsAndOutputs:initialSemaphoreValue:]([BWBackPressureNode alloc], "initWithNumberOfInputsAndOutputs:initialSemaphoreValue:", 1, 0);
  -[BWNode setName:](v14, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend(a1, "name"), a6));
  if ((objc_msgSend(a4, "addNode:error:", v14, &v17) & 1) == 0
    || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v14, "input"), a5) & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  v15 = -[BWNode output](v14, "output");
  if (a7)
    *a7 = v14;
  return v15;
}

- (FigCaptureMovieFileSinkTailPipeline)initWithConfiguration:(id)a3 tailIndex:(unint64_t)a4 numTailPipelines:(unint64_t)a5 graph:(id)a6 parentPipeline:(id)a7 captureDevice:(id)a8 inferenceScheduler:(id)a9 recordingStatusDelegate:(id)a10 workgroup:(id)a11
{
  FigCaptureMovieFileSinkTailPipeline *v17;
  FigCaptureMovieFileSinkTailPipeline *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FigCaptureMovieFileSinkTailPipeline;
  v17 = -[FigCapturePipeline initWithGraph:name:](&v20, sel_initWithGraph_name_, a6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tail Pipeline %d"), a4));
  v18 = v17;
  if (v17
    && -[FigCaptureMovieFileSinkTailPipeline _buildMovieFileSinkTailPipeline:tailIndex:numTailPipelines:graph:parentPipeline:captureDevice:inferenceScheduler:recordingStatusDelegate:workgroup:]((uint64_t)v17, a3, a4, a5, a6, (id *)a7, a8, (uint64_t)a9, (uint64_t)a10, (uint64_t)a11))
  {
    FigDebugAssert3();

    return 0;
  }
  return v18;
}

- (uint64_t)_buildMovieFileSinkTailPipeline:(uint64_t)a3 tailIndex:(uint64_t)a4 numTailPipelines:(void *)a5 graph:(id *)a6 parentPipeline:(void *)a7 captureDevice:(uint64_t)a8 inferenceScheduler:(uint64_t)a9 recordingStatusDelegate:(uint64_t)a10 workgroup:
{
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  int CFPreferenceNumberWithDefault;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  int v43;
  char v44;
  void *v45;
  unint64_t v46;
  unint64_t v47;
  BOOL v48;
  int v49;
  _BOOL4 v50;
  void *v51;
  id *v52;
  BWPipelineStage *v53;
  uint64_t v54;
  int v55;
  BOOL v56;
  _BOOL4 v57;
  int v58;
  int v59;
  void *v60;
  _BOOL4 v61;
  uint64_t v62;
  char v63;
  BWSmartStyleApplyNode *v64;
  uint64_t v65;
  uint64_t v66;
  BWSmartStyleApplyNode *v67;
  BWSmartStyleApplyNode *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id *v72;
  void *v73;
  int v74;
  unsigned int v75;
  unsigned int v76;
  float v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  int v83;
  BWInferenceNode *v84;
  BWStreamingPersonSegmentationConfiguration *v85;
  double v86;
  BWOpticalFlowInferenceConfiguration *v87;
  uint64_t v88;
  BWPersonSegmentationFilteringNode *v89;
  unsigned __int8 v90;
  BWStereoVideoMetadataNode *v91;
  BWStereoVideoMetadataNode *v92;
  BWStereoVideoMetadataNode *v93;
  uint64_t v94;
  int v95;
  int v96;
  int v97;
  FigCaptureVISPipeline *v98;
  uint64_t v99;
  unsigned int v100;
  unsigned int v101;
  float v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  unsigned int v107;
  unsigned __int8 v108;
  unsigned __int8 v109;
  char v110;
  unsigned __int8 v111;
  unsigned __int8 v112;
  unsigned __int8 v113;
  char *v114;
  uint64_t v115;
  BWAttachedMediaSwapNode *v116;
  BWAttachedMediaSwapNode *v117;
  BWAttachedMediaSwapNode *v118;
  uint64_t v119;
  FigCaptureVISPipeline *v120;
  uint64_t v121;
  unsigned int v122;
  unsigned int v123;
  float v124;
  unsigned int v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  unsigned int v129;
  unsigned __int8 v130;
  unsigned __int8 v131;
  unsigned __int8 v132;
  unsigned __int8 v133;
  unsigned __int8 v134;
  char *v135;
  uint64_t v136;
  BWAttachedMediaSwapNode *v137;
  BWAttachedMediaSwapNode *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  int v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  unsigned int v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  int v151;
  int v152;
  uint64_t v153;
  void *v154;
  BWFanOutNode *v155;
  id *v156;
  BWFanOutNode *v157;
  id *v158;
  BWFanOutNode *v159;
  uint64_t v160;
  id v161;
  unsigned int v162;
  uint64_t v163;
  BWVideoPlaybackSupportMetadataNode *v164;
  uint64_t v165;
  BWSmartStyleInfoMetadataNode *v166;
  uint64_t v167;
  id v168;
  void *v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t j;
  unint64_t v178;
  void *v179;
  uint64_t v180;
  BWPipelineStage *v181;
  BWInferenceBufferingNode *v182;
  uint64_t v183;
  BWInferenceConfiguration *v184;
  double v185;
  uint64_t v186;
  unsigned int v187;
  BWRefinedCinematographyNode *v188;
  uint64_t v189;
  BWCinematicVideoMetadataNode *v190;
  uint64_t v191;
  BWAttachedMediaSplitNode *v192;
  id v193;
  void *v194;
  void *v195;
  BWAttachedMediaSplitNode *v196;
  void *v197;
  id v198;
  void *v199;
  unint64_t v200;
  id v201;
  void *v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  int v208;
  int v209;
  unsigned int v210;
  unsigned int v211;
  BWVideoCompressorNode *v212;
  double v213;
  uint64_t v214;
  BWVideoCompressorNode *v215;
  int v216;
  double v217;
  void *v218;
  BWVideoCompressorNode *v219;
  double v220;
  uint64_t v221;
  BWVideoCompressorNode *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  BWVideoCompressorNode *v228;
  double v229;
  uint64_t v230;
  BWVideoCompressorNode *v231;
  uint64_t v232;
  char v233;
  __CFString *v234;
  char v235;
  char v236;
  char v237;
  id v238;
  uint64_t v239;
  _BOOL4 v240;
  _BOOL4 v241;
  int v242;
  uint64_t v243;
  unint64_t v244;
  unint64_t v245;
  _UNKNOWN **v246;
  uint64_t v247;
  uint64_t v248;
  int v249;
  int v250;
  BWBackPressureNode *v251;
  BWPipelineStage *v252;
  uint64_t v253;
  void *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  BWBackPressureNode *v264;
  uint64_t v265;
  BWVideoCompressorNode *v266;
  double v267;
  uint64_t v268;
  BWVideoCompressorNode *v269;
  BWVideoCompressorNode *v270;
  uint64_t v271;
  BWQuickTimeMovieFileSinkNode *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  float v276;
  double v277;
  float v278;
  uint64_t v279;
  void *v280;
  uint64_t v281;
  void *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  uint64_t v287;
  int v288;
  void *v289;
  uint64_t v290;
  int v291;
  uint64_t v292;
  void *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t k;
  uint64_t v300;
  int v301;
  int v302;
  void *v303;
  uint64_t v304;
  int v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  void *v310;
  uint64_t v311;
  void *v312;
  void *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t m;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t n;
  void *v324;
  uint64_t v325;
  char v326;
  const __CFString *v327;
  char v328;
  char v329;
  char v330;
  uint64_t v331;
  uint64_t v332;
  int v333;
  uint64_t v334;
  uint64_t v335;
  unsigned int v336;
  uint64_t v337;
  uint64_t v338;
  unsigned int v339;
  int v340;
  int v341;
  BWPipelineStage *v342;
  BWPipelineStage *v343;
  unint64_t v344;
  BWNodeOutput *v345;
  uint64_t v346;
  uint64_t v347;
  BWPipelineStage *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  int v353;
  BWPipelineStage *v354;
  uint64_t v355;
  void *v356;
  uint64_t v357;
  char v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  _BOOL8 v362;
  uint64_t v363;
  uint64_t v364;
  _BOOL4 v365;
  _BOOL4 v366;
  uint64_t v367;
  void *v368;
  BWPipelineStage *v369;
  unint64_t v370;
  BWPipelineStage *v371;
  id v372;
  void *v373;
  uint64_t v374;
  char v375;
  unsigned int v376;
  _BOOL4 IsHDR;
  unsigned int v379;
  _BOOL4 v380;
  uint64_t v381;
  uint64_t v383;
  id v384;
  unsigned int v385;
  void *v386;
  __CFString *v387;
  _BOOL4 v388;
  int v389;
  BWPipelineStage *obj;
  id obja;
  _BOOL4 objb;
  unsigned int objc;
  id v394;
  _BOOL4 v395;
  unsigned int v396;
  unsigned int v397;
  BOOL v398;
  unsigned int v399;
  __CFString *v400;
  unsigned int v401;
  unsigned int v402;
  BWPipelineStage *v403;
  BWFanOutNode *v404;
  void *v405;
  unsigned int v406;
  unsigned int v407;
  void *v408;
  void *v410;
  uint64_t v411;
  void *v412;
  id v413;
  id v414;
  id v415;
  uint64_t v416;
  int v417;
  void *v418;
  id v419;
  void *v420;
  void *v421;
  uint64_t v422;
  unsigned int v423;
  void *v424;
  id v425;
  id v426;
  unsigned int v427;
  uint64_t v428;
  void *v429;
  BWBackPressureNode *v430;
  uint64_t v431;
  void *v432;
  void *v434;
  id v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  CMTime v452;
  CMTime v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  CMTime time;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  id v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  id v472;
  unsigned int v473;
  _BYTE v474[128];
  _BYTE v475[128];
  _BYTE v476[128];
  _BYTE v477[128];
  _BYTE v478[128];
  _BYTE v479[128];
  _QWORD v480[2];
  _BYTE v481[128];
  uint64_t v482;
  _BYTE v483[128];
  uint64_t v484;

  v484 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v11 = a3;
  v13 = result;
  v473 = 0;
  v472 = 0;
  *(_QWORD *)(result + 152) = a3;
  v14 = objc_msgSend(a2, "movieFileSinkPipelineConfiguration");
  if (v14)
    v15 = *(__CFString **)(v14 + 16);
  else
    v15 = 0;
  v16 = v14;
  v373 = (void *)-[__CFString irisSinkConfiguration](v15, "irisSinkConfiguration");
  v17 = -[__CFString irisVISEnabled](v15, "irisVISEnabled");
  v18 = -[__CFString irisSDOFEnabled](v15, "irisSDOFEnabled");
  v422 = v16;
  if (v16)
    v19 = *(void **)(v16 + 48);
  else
    v19 = 0;
  v379 = objc_msgSend(v19, "enabled");
  v20 = objc_msgSend(a2, "movieFileSinkPipelineConfiguration");
  if (v20)
    v380 = *(_BYTE *)(v20 + 188) != 0;
  else
    v380 = 0;
  if (objc_msgSend(a2, "videoSourceOutput"))
  {
    if (v373)
      v385 = 1;
    else
      v385 = -[__CFString livePhotoMetadataWritingEnabled](v15, "livePhotoMetadataWritingEnabled");
  }
  else
  {
    v385 = 0;
  }
  v340 = v17;
  if (objc_msgSend(a2, "videoSourceOutput"))
  {
    v21 = v16;
    if (v16)
      v21 = *(_QWORD *)(v16 + 32);
    v395 = v21 != 0;
  }
  else
  {
    v395 = 0;
  }
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = v22;
  if (v380)
  {
    objc_msgSend(v22, "addObject:", 0x1E495B3F8);
    objc_msgSend(v23, "addObject:", 0x1E495B418);
    objc_msgSend(v23, "addObject:", CFSTR("HumanFullBodiesMask"));
    objc_msgSend(v23, "addObject:", CFSTR("HumanSkinsMask"));
    objc_msgSend(v23, "addObject:", 0x1E495B218);
  }
  v24 = objc_msgSend(a2, "videoSourceOutput");
  v25 = v24 != 0;
  v26 = 1;
  if (v24)
    v26 = 2;
  if (v18)
    v25 = v26;
  v362 = v25;
  v360 = objc_msgSend(v23, "count");
  v27 = objc_msgSend(a2, "audioSourceOutput");
  v28 = objc_msgSend(a2, "cinematicAudioSourceOutput");
  if (v27)
    v29 = (v28 != 0) + 1;
  else
    v29 = v28 != 0;
  v361 = v29;
  v400 = v15;
  v374 = a4;
  if (v24)
  {
    if (v422)
      v30 = *(void **)(v422 + 8);
    else
      v30 = 0;
    IsHDR = BWColorSpaceIsHDR(objc_msgSend(v30, "colorSpace"));
  }
  else
  {
    IsHDR = 0;
  }
  v31 = (void *)objc_msgSend(a2, "metadataSourceOutputs");
  v413 = (id)objc_msgSend(a2, "indexesOfDetectedObjectsInMetadataOutputs");
  v383 = objc_msgSend(v31, "count");
  v416 = objc_msgSend(a2, "videoSourceOutput");
  v351 = objc_msgSend(a2, "audioSourceOutput");
  v352 = objc_msgSend(a2, "cinematicAudioSourceOutput");
  v403 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.tail.%d"), v11), 14, a10);
  v407 = -[__CFString stereoVideoCaptureEnabled](v15, "stereoVideoCaptureEnabled");
  if (v407)
    v371 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.stereo.companion.vis.tail.%d"), v11), 14, a10);
  else
    v371 = 0;
  obj = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.compressor.tail.%d"), v11), 14, a10);
  if (v18)
  {
    v369 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.sdof-vis.tail.%d"), v11), 14, a10);
    v348 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.sdof-compressor.tail.%d"), v11), 14, a10);
  }
  else
  {
    v369 = 0;
    v348 = 0;
  }
  if (v379)
    v343 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.depth-compressor.tail.%d"), v11), 14, a10);
  else
    v343 = 0;
  v428 = v13;
  v368 = v31;
  v411 = v11;
  if (objc_msgSend(v23, "count"))
  {
    v429 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v468 = 0u;
    v469 = 0u;
    v470 = 0u;
    v471 = 0u;
    v32 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v468, v483, 16);
    if (v32)
    {
      v33 = v32;
      v34 = v11;
      v35 = *(_QWORD *)v469;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v469 != v35)
            objc_enumerationMutation(v23);
          objc_msgSend(v429, "setObject:forKeyedSubscript:", +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.%@-compressor.tail.%d"), -[__CFString lowercaseString]((id)mfsp_pipelineNameFromSmartStyleAttachedMediaKey(*(void **)(*((_QWORD *)&v468 + 1) + 8 * i)), "lowercaseString"), v34), 14, a10), *(_QWORD *)(*((_QWORD *)&v468 + 1) + 8 * i));
        }
        v33 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v468, v483, 16);
      }
      while (v33);
      v13 = v428;
      v11 = v411;
    }
  }
  else
  {
    v429 = 0;
  }
  CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  v394 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v435 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (id)v416;
  if (v422)
  {
    v39 = *(_QWORD *)(v422 + 88);
    v363 = *(_QWORD *)(v422 + 80);
  }
  else
  {
    v39 = 0;
    v363 = 0;
  }
  v40 = (void *)objc_msgSend(a2, "irisIntermediateJPEGPhotoDecompressorNode");
  v366 = v40 != 0;
  if (v40)
    v342 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.iris.decompression.backpressure.%d"), v11), 14);
  else
    v342 = 0;
  if (v422)
  {
    *(_DWORD *)(v13 + 164) = *(_DWORD *)(v422 + 104);
    v388 = *(unsigned __int8 *)(v422 + 138) != 0;
  }
  else
  {
    v388 = 0;
    *(_DWORD *)(v13 + 164) = 0;
  }
  if (a6)
    v41 = objc_msgSend(a6[7], "irisStagingNode");
  else
    v41 = 0;
  v424 = a2;
  v42 = v422;
  if (v422)
    v42 = *(_BYTE *)(v422 + 122) != 0;
  v365 = 0;
  v43 = !v388;
  if (!v42 && (v43 & 1) == 0)
    v365 = (v11 | v41) == 0;
  v387 = mfsp_avVideoCodec(v400);
  v44 = -[__CFString isEqualToString:](v387, "isEqualToString:", CFSTR("hvc1"));
  if (v422)
    v45 = *(void **)(v422 + 8);
  else
    v45 = 0;
  v46 = objc_msgSend((id)objc_msgSend(v45, "depthDataFormat"), "dimensions");
  if (v422)
  {
    v47 = *(_QWORD *)(v422 + 56);
    if (HIDWORD(v47))
      v48 = (_DWORD)v47 == 0;
    else
      v48 = 1;
    if (!v48)
      v46 = *(_QWORD *)(v422 + 56);
    v381 = v46;
    v344 = HIDWORD(v46);
    if (!v400)
    {
      v367 = 0;
      v51 = v424;
      v52 = a6;
      v53 = obj;
      v54 = v385;
LABEL_179:
      v143 = objc_msgSend(v51, "vitalityScoringEnabled");
      v144 = v422;
LABEL_189:
      if (*(_BYTE *)(v144 + 108))
      {
        v150 = (_QWORD *)objc_msgSend(v51, "movieFileSinkPipelineConfiguration");
        if (v150)
          v150 = (_QWORD *)v150[5];
        v151 = objc_msgSend(v150, "count");
LABEL_194:
        v376 = v54 | v395;
        if (v54 | v395)
          v152 = 2;
        else
          v152 = 1;
        v341 = v152 + v380 + IsHDR + v143;
        v417 = v151;
        v153 = (v341 + v151);
        if (v153 < 2)
        {
          v159 = 0;
        }
        else
        {
          v154 = v51;
          v155 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", v153, 1986618469);
          v156 = v52;
          v157 = v155;
          v158 = v156;
          if ((objc_msgSend(v156, "addNode:error:", v155, &v472) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v38, -[BWNode input](v157, "input"), v53) & 1) == 0)
          {
            goto LABEL_558;
          }
          v38 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v157, "outputs"), "objectAtIndexedSubscript:", (v153 - 1));
          v159 = v157;
          v52 = v158;
          v51 = v154;
        }
        v404 = v159;
        if (v376)
        {
          v160 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v159, "outputs"), "objectAtIndexedSubscript:", 0);
          v161 = -[BWCameraInfoMetadataNode initForLivePhotosMetadata:generateDebugMetadata:]([BWCameraInfoMetadataNode alloc], "initForLivePhotosMetadata:generateDebugMetadata:", v54, v395);
          if ((objc_msgSend(v52, "addNode:error:", v161, &v472) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v160, objc_msgSend(v161, "input"), v53) & 1) == 0)
          {
            goto LABEL_558;
          }
          v357 = objc_msgSend(v161, "boxedMetadataOutput");
          v162 = 1;
          v159 = v404;
        }
        else
        {
          v357 = 0;
          v162 = 0;
        }
        if (IsHDR)
        {
          v163 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v159, "outputs"), "objectAtIndexedSubscript:", v162);
          v164 = objc_alloc_init(BWVideoPlaybackSupportMetadataNode);
          if ((objc_msgSend(v52, "addNode:error:", v164, &v472) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v163, -[BWNode input](v164, "input"), v53) & 1) == 0)
          {
            goto LABEL_558;
          }
          ++v162;
          v364 = -[BWVideoPlaybackSupportMetadataNode boxedMetadataOutput](v164, "boxedMetadataOutput");
          v159 = v404;
        }
        else
        {
          v364 = 0;
        }
        if (v380)
        {
          v165 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v159, "outputs"), "objectAtIndexedSubscript:", v162);
          v166 = objc_alloc_init(BWSmartStyleInfoMetadataNode);
          if ((objc_msgSend(v52, "addNode:error:", v166, &v472) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v165, -[BWNode input](v166, "input"), v53) & 1) == 0)
          {
            goto LABEL_558;
          }
          ++v162;
          v355 = -[BWSmartStyleInfoMetadataNode boxedMetadataOutput](v166, "boxedMetadataOutput");
          v159 = v404;
        }
        else
        {
          v355 = 0;
        }
        v370 = v379 + (unint64_t)v380 + v376 + IsHDR + v383;
        v167 = objc_msgSend(v51, "movieFileSinkPipelineConfiguration");
        v353 = v143;
        if (v167 && v417 && *(_QWORD *)(v167 + 40))
        {
          v467 = 0;
          v473 = -[FigCaptureMovieFileSinkTailPipeline _buildFaceDetectionNode:parentPipeline:objectDetectionSourceOutput:faceDetectionNodeOut:](v13, (_QWORD *)objc_msgSend(v51, "movieFileSinkPipelineConfiguration"), v52, (uint64_t)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v159, "outputs"), "objectAtIndexedSubscript:", v162), &v467);
          if (v473)
            goto LABEL_558;
          v418 = v38;
          v168 = (id)MEMORY[0x1E0C9AA60];
          v396 = v162 + 1;
          if (v368)
            v169 = v368;
          else
            v169 = (void *)MEMORY[0x1E0C9AA60];
          if (v413)
            v168 = v413;
          v414 = v168;
          v170 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v171 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v386 = v169;
          v172 = objc_msgSend(v169, "count");
          v463 = 0u;
          v464 = 0u;
          v465 = 0u;
          v466 = 0u;
          v384 = v467;
          v173 = (void *)objc_msgSend(v467, "boxedMetadataOutputs");
          v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v463, v481, 16);
          if (v174)
          {
            v175 = v174;
            v176 = *(_QWORD *)v464;
            do
            {
              for (j = 0; j != v175; ++j)
              {
                if (*(_QWORD *)v464 != v176)
                  objc_enumerationMutation(v173);
                objc_msgSend(v170, "addObject:", *(_QWORD *)(*((_QWORD *)&v463 + 1) + 8 * j));
                objc_msgSend(v171, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v172 + j));
              }
              v175 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v463, v481, 16);
              v172 += j;
            }
            while (v175);
          }
          v368 = (void *)objc_msgSend(v386, "arrayByAddingObjectsFromArray:", v170);
          v413 = (id)objc_msgSend(v414, "arrayByAddingObjectsFromArray:", v171);
          v370 += objc_msgSend((id)objc_msgSend(v384, "boxedMetadataOutputs"), "count");
          v13 = v428;
          v51 = v424;
          v52 = a6;
          v178 = 0x1E0CB3000;
          v53 = obj;
          v38 = v418;
          v159 = v404;
          if (!v143)
            goto LABEL_234;
        }
        else
        {
          v396 = v162;
          v178 = 0x1E0CB3000uLL;
          if (!v143)
          {
LABEL_234:
            v347 = 0;
            v359 = 0;
            goto LABEL_242;
          }
        }
        v179 = v38;
        v180 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v159, "outputs"), "objectAtIndexedSubscript:", v396);
        v181 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", objc_msgSend(*(id *)(v178 + 2368), "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.metadata.tail.%d"), v411), 14);
        v182 = -[BWInferenceBufferingNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceBufferingNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", a7, a8, 13);
        -[BWNode setName:](v182, "setName:", objc_msgSend(*(id *)(v178 + 2368), "stringWithFormat:", CFSTR("Tail Pipeline %lu Motion Analysis Inference Node"), v411));
        if (v373)
          objc_msgSend(v373, "irisMovieDuration");
        else
          memset(&time, 0, sizeof(time));
        v183 = (int)(CMTimeGetSeconds(&time) * 15.0 + 2.0);
        v184 = -[BWInferenceConfiguration initWithInferenceType:]([BWInferenceConfiguration alloc], "initWithInferenceType:", 2001);
        LODWORD(v185) = 15.0;
        -[BWInferenceConfiguration setMaximumFramesPerSecond:](v184, "setMaximumFramesPerSecond:", v185);
        -[BWInferenceBufferingNode addInferenceOfType:version:configuration:ringBufferCapacity:](v182, "addInferenceOfType:version:configuration:ringBufferCapacity:", 2001, BWInferenceVersionMake(1u, 0, 0) & 0xFFFFFFFFFFFFLL, v184, v183);
        v186 = -[BWInferenceBufferingNode ringBuffers](v182, "ringBuffers");
        if ((objc_msgSend(v52, "addNode:error:", v182, &v472) & 1) == 0
          || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v180, -[BWNode input](v182, "input"), v181) & 1) == 0)
        {
          goto LABEL_558;
        }
        v359 = v186;
        v347 = -[BWNode output](v182, "output");
        v178 = 0x1E0CB3000uLL;
        v53 = obj;
        v38 = v179;
LABEL_242:
        if (v38)
          v187 = v379;
        else
          v187 = 0;
        if (v187 == 1)
        {
          v188 = -[BWRefinedCinematographyNode initWithAudioEnabled:]([BWRefinedCinematographyNode alloc], "initWithAudioEnabled:", 0);
          -[BWNode setName:](v188, "setName:", objc_msgSend(*(id *)(v178 + 2368), "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend((id)v13, "name"), CFSTR("Refined Cinematography")));
          if ((objc_msgSend((id)v13, "addNode:error:", v188, &v472) & 1) == 0)
            goto LABEL_558;
          if ((objc_msgSend(v52, "addNode:error:", v188, &v472) & 1) == 0)
            goto LABEL_558;
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v38, -[BWRefinedCinematographyNode videoInput](v188, "videoInput"), v53) & 1) == 0)goto LABEL_558;
          v189 = -[BWRefinedCinematographyNode videoOutput](v188, "videoOutput");
          v190 = objc_alloc_init(BWCinematicVideoMetadataNode);
          -[BWNode setName:](v190, "setName:", objc_msgSend(*(id *)(v178 + 2368), "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend((id)v13, "name"), CFSTR("Cinematic Video Metadata")));
          if ((objc_msgSend((id)v13, "addNode:error:", v190, &v472) & 1) == 0)
            goto LABEL_558;
          if ((objc_msgSend(v52, "addNode:error:", v190, &v472) & 1) == 0)
            goto LABEL_558;
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v189, -[BWNode input](v190, "input"), v53) & 1) == 0)
            goto LABEL_558;
          v191 = -[BWCinematicVideoMetadataNode passthruOutput](v190, "passthruOutput");
          v350 = -[BWCinematicVideoMetadataNode metadataOutput](v190, "metadataOutput");
          v480[0] = CFSTR("PrimaryFormat");
          v480[1] = CFSTR("Depth");
          v192 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:]([BWAttachedMediaSplitNode alloc], "initWithAttachedMediaKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v480, 2));
          -[BWNode setName:](v192, "setName:", objc_msgSend(*(id *)(v178 + 2368), "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend((id)v13, "name"), CFSTR("Depth/YUV Splitter")));
          if ((objc_msgSend((id)v13, "addNode:error:", v192, &v472) & 1) == 0
            || (objc_msgSend(v52, "addNode:error:", v192, &v472) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v191, -[BWNode input](v192, "input"), v53) & 1) == 0)
          {
            goto LABEL_558;
          }
          v38 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v192, "outputs"), "objectAtIndexedSubscript:", 0);
          objc_msgSend(v38, "setName:", CFSTR("Primary"));
          v193 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v192, "outputs"), "objectAtIndexedSubscript:", 1);
          objc_msgSend(v193, "setName:", CFSTR("Depth"));
          if (!v38)
            goto LABEL_256;
        }
        else
        {
          v350 = 0;
          v193 = 0;
          if (!v38)
          {
LABEL_256:
            v194 = 0;
            v372 = 0;
LABEL_413:
            v248 = v411;
LABEL_414:
            v272 = -[BWQuickTimeMovieFileSinkNode initWithNumberOfVideoInputs:numberOfAuxiliaryPictureInputs:numberOfAudioInputs:numberOfMetadataInputs:cameraInfoByPortType:pipelineIndex:sinkID:]([BWQuickTimeMovieFileSinkNode alloc], "initWithNumberOfVideoInputs:numberOfAuxiliaryPictureInputs:numberOfAudioInputs:numberOfMetadataInputs:cameraInfoByPortType:pipelineIndex:sinkID:", v362, v360 + v379, v361, v370, objc_msgSend(a7, "cameraInfoByPortType"), v248, objc_msgSend(v52, "sinkID"));
            -[BWQuickTimeMovieFileSinkNode setIrisMotionAnalysisRingBuffer:](v272, "setIrisMotionAnalysisRingBuffer:", v359);
            if (v422)
              v273 = *(_QWORD *)(v422 + 168);
            else
              v273 = 0;
            -[BWQuickTimeMovieFileSinkNode setClientApplicationID:](v272, "setClientApplicationID:", v273);
            if (v248 == 1)
              v274 = 82;
            else
              v274 = 81;
            -[BWQuickTimeMovieFileSinkNode setPipelineTraceID:](v272, "setPipelineTraceID:", v274);
            if (v422)
              v275 = *(_QWORD *)(v422 + 176);
            else
              v275 = 0;
            -[BWQuickTimeMovieFileSinkNode setMaximumAllowedInFlightCompressedBytes:](v272, "setMaximumAllowedInFlightCompressedBytes:", v275);
            if (v373)
              objc_msgSend(v373, "irisMovieDuration");
            else
              memset(&v453, 0, sizeof(v453));
            v276 = CMTimeGetSeconds(&v453) + 2.0;
            v277 = v276;
            if (v373)
              objc_msgSend(v373, "irisMovieVideoFrameDuration");
            else
              memset(&v452, 0, sizeof(v452));
            v278 = ceil(v277 / CMTimeGetSeconds(&v452));
            v279 = (int)v278;
            if (v248 == 1)
              -[BWQuickTimeMovieFileSinkNode setupOverCaptureQualityMetricsForLivePhotoHistory:](v272, "setupOverCaptureQualityMetricsForLivePhotoHistory:", v279);
            if (objc_msgSend(v373, "irisMovieCaptureEnabled"))
              -[BWQuickTimeMovieFileSinkNode setupRingBufferForStabilizedTrajectoryHomographies:](v272, "setupRingBufferForStabilizedTrajectoryHomographies:", v279);
            if ((objc_msgSend(v52, "addNode:error:", v272, &v472) & 1) == 0)
              goto LABEL_558;
            *(_QWORD *)(v13 + 120) = v272;
            -[BWQuickTimeMovieFileSinkNode setIrisSampleReferenceMoviesEnabled:](v272, "setIrisSampleReferenceMoviesEnabled:", 0);
            -[BWFileSinkNode setRecordingStatusDelegate:](v272, "setRecordingStatusDelegate:", a9);
            if (v52)
              v280 = (void *)objc_msgSend(v52[7], "videoOrientationMetadataNode");
            else
              v280 = 0;
            -[BWQuickTimeMovieFileSinkNode setVideoOrientationTimeMachine:](v272, "setVideoOrientationTimeMachine:", objc_msgSend(v280, "videoOrientationTimeMachine"));
            -[BWNode setName:](v272, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tail Pipeline %lu Movie File Sink Node"), v248));
            if (v372)
            {
              if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v372, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", 0), objc_msgSend(v51, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
              v281 = 1;
              if (v367)
                goto LABEL_437;
            }
            else
            {
              v281 = 0;
              if (v367)
              {
LABEL_437:
                if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v367, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", v281), objc_msgSend(v51, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
                v423 = v281;
                v281 = (v281 + 1);
LABEL_441:
                -[BWQuickTimeMovieFileSinkNode setStereoVideoCaptureEnabled:](v272, "setStereoVideoCaptureEnabled:", v407);
                -[BWQuickTimeMovieFileSinkNode setCinematicVideoEnabled:](v272, "setCinematicVideoEnabled:", objc_msgSend(a7, "cinematicVideoEnabled"));
                if (v193)
                {
                  v282 = v394;
                  if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v193, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", v281), objc_msgSend(v51, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
                  v406 = v281;
                  v283 = (v281 + 1);
                }
                else
                {
                  v406 = -1;
                  v282 = v394;
                  v283 = v281;
                }
                v450 = 0u;
                v451 = 0u;
                v448 = 0u;
                v449 = 0u;
                v426 = (id)objc_msgSend(v194, "allKeys");
                v284 = objc_msgSend(v426, "countByEnumeratingWithState:objects:count:", &v448, v477, 16);
                if (v284)
                {
                  v285 = v284;
                  v286 = 0;
                  v431 = *(_QWORD *)v449;
LABEL_447:
                  v287 = 0;
                  v288 = v283;
                  while (1)
                  {
                    v289 = v286;
                    if (*(_QWORD *)v449 != v431)
                      objc_enumerationMutation(v426);
                    v290 = *(_QWORD *)(*((_QWORD *)&v448 + 1) + 8 * v287);
                    if (!objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v194, "objectForKeyedSubscript:", v290), objc_msgSend((id)objc_msgSend(*(id *)(v428 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v283 + v287), objc_msgSend(v424, "movieFilePipelineStage")))goto LABEL_558;
                    objc_msgSend(v435, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v283 + v287), v290);
                    v286 = v289;
                    if (!v289)
                      v286 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    objc_msgSend(v286, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v283 + v287++));
                    if (v285 == v287)
                    {
                      LODWORD(v283) = v283 + v287;
                      v285 = objc_msgSend(v426, "countByEnumeratingWithState:objects:count:", &v448, v477, 16);
                      if (v285)
                        goto LABEL_447;
                      v283 = (v288 + v287);
                      v13 = v428;
                      v51 = v424;
                      v282 = v394;
                      goto LABEL_457;
                    }
                  }
                }
                v286 = 0;
LABEL_457:
                if (v351)
                {
                  if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v351, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v283), objc_msgSend(v51, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
                  v402 = v283;
                  v283 = (v283 + 1);
                  if (v352)
                    goto LABEL_460;
                }
                else
                {
                  v402 = -1;
                  if (v352)
                  {
LABEL_460:
                    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v352, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v283), objc_msgSend(v51, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
                    v399 = v283;
                    v283 = (v283 + 1);
LABEL_464:
                    if (v350)
                    {
                      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v350, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v283), objc_msgSend(v51, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
                      v291 = v283;
                      v283 = (v283 + 1);
                    }
                    else
                    {
                      v291 = -1;
                    }
                    objc = v291;
                    v432 = v286;
                    if (objc_msgSend(v368, "count"))
                    {
                      v292 = 0;
                      while ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v368, "objectAtIndexedSubscript:", v292), objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v283 + v292), objc_msgSend(v51, "movieFilePipelineStage")) & 1) != 0)
                      {
                        if (++v292 >= (unint64_t)objc_msgSend(v368, "count"))
                        {
                          v293 = v194;
                          v283 = (v283 + v292);
                          goto LABEL_474;
                        }
                      }
                      goto LABEL_558;
                    }
                    v293 = v194;
LABEL_474:
                    v294 = objc_msgSend(v368, "count");
                    v444 = 0u;
                    v445 = 0u;
                    v446 = 0u;
                    v447 = 0u;
                    v295 = objc_msgSend(v413, "countByEnumeratingWithState:objects:count:", &v444, v476, 16);
                    if (v295)
                    {
                      v296 = v295;
                      v297 = *(_QWORD *)v445;
                      v298 = (int)v283 - v294;
                      do
                      {
                        for (k = 0; k != v296; ++k)
                        {
                          if (*(_QWORD *)v445 != v297)
                            objc_enumerationMutation(v413);
                          v300 = objc_msgSend(*(id *)(*((_QWORD *)&v444 + 1) + 8 * k), "integerValue");
                          objc_msgSend(v282, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v298 + v300));
                        }
                        v296 = objc_msgSend(v413, "countByEnumeratingWithState:objects:count:", &v444, v476, 16);
                      }
                      while (v296);
                    }
                    if ((objc_msgSend(v424, "indexOfVideoOrientationInMetadataOutputs") & 0x80000000) != 0)
                    {
                      v302 = -1;
                    }
                    else
                    {
                      v301 = v283 - objc_msgSend(v368, "count");
                      v302 = v301 + objc_msgSend(v424, "indexOfVideoOrientationInMetadataOutputs");
                    }
                    v427 = v302;
                    if (v357)
                    {
                      v303 = v424;
                      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v357, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v283), objc_msgSend(v424, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
                      v304 = v283;
                      v283 = (v283 + 1);
                    }
                    else
                    {
                      v304 = 0xFFFFFFFFLL;
                      v303 = v424;
                    }
                    if (v364)
                    {
                      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v364, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v283), objc_msgSend(v303, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
                      v305 = v283;
                      v283 = (v283 + 1);
                    }
                    else
                    {
                      v305 = -1;
                    }
                    v389 = v305;
                    if (v355)
                    {
                      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v355, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v283), objc_msgSend(v303, "movieFilePipelineStage")) & 1) == 0)goto LABEL_558;
                    }
                    else
                    {
                      v283 = 0xFFFFFFFFLL;
                    }
                    objc_msgSend(*(id *)(v13 + 120), "setNonCriticalAudioVideoTrackInputIndices:", v432);
                    v306 = objc_msgSend(v293, "count");
                    v307 = objc_msgSend(v293, "count");
                    v415 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 12);
                    v421 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
                    v412 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
                    v434 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * v306 + 2);
                    v410 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
                    v408 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
                    v308 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * v307 + 6);
                    v309 = (void *)v308;
                    if (v372)
                    {
                      v310 = (void *)v308;
                      if (v423 != -1 || v406 != -1 || objc != -1)
                      {
                        v311 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
                        v313 = v415;
                        if (v423 != -1)
                        {
                          objc_msgSend(v415, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v423));
                          objc_msgSend(v415, "addObject:", v311);
                        }
                        v312 = v421;
                        if (v406 != -1)
                        {
                          v314 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v406);
                          objc_msgSend(v434, "addObject:", v311);
                          objc_msgSend(v434, "addObject:", v314);
                          objc_msgSend(v309, "addObject:", v314);
                          objc_msgSend(v309, "addObject:", CFSTR("com.apple.quicktime.video-map"));
                          objc_msgSend(v309, "addObject:", v314);
                          objc_msgSend(v309, "addObject:", CFSTR("com.apple.quicktime.video-map.depth"));
                          if (objc != -1)
                          {
                            objc_msgSend(v415, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc));
                            objc_msgSend(v415, "addObject:", v311);
                            objc_msgSend(v421, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc));
                            objc_msgSend(v421, "addObject:", v311);
                            objc_msgSend(v309, "addObject:", v314);
                            objc_msgSend(v309, "addObject:", CFSTR("com.apple.quicktime.cinematic-video-map.depth"));
                          }
                        }
                        goto LABEL_512;
                      }
                      if (objc_msgSend(v435, "count")
                        || (_DWORD)v283 != -1
                        || objc_msgSend(v394, "count")
                        || v427 != -1
                        || (_DWORD)v304 != -1
                        || v389 != -1)
                      {
                        v311 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
                        v313 = v415;
                        v312 = v421;
LABEL_512:
                        v442 = 0u;
                        v443 = 0u;
                        v440 = 0u;
                        v441 = 0u;
                        v315 = objc_msgSend(v394, "countByEnumeratingWithState:objects:count:", &v440, v475, 16);
                        if (v315)
                        {
                          v316 = v315;
                          v317 = *(_QWORD *)v441;
                          do
                          {
                            for (m = 0; m != v316; ++m)
                            {
                              if (*(_QWORD *)v441 != v317)
                                objc_enumerationMutation(v394);
                              v319 = *(_QWORD *)(*((_QWORD *)&v440 + 1) + 8 * m);
                              objc_msgSend(v313, "addObject:", v319);
                              objc_msgSend(v313, "addObject:", v311);
                              objc_msgSend(v312, "addObject:", v319);
                              objc_msgSend(v312, "addObject:", v311);
                            }
                            v316 = objc_msgSend(v394, "countByEnumeratingWithState:objects:count:", &v440, v475, 16);
                          }
                          while (v316);
                        }
                        if (v427 != -1)
                        {
                          objc_msgSend(v313, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v427));
                          objc_msgSend(v313, "addObject:", v311);
                          objc_msgSend(v312, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v427));
                          objc_msgSend(v312, "addObject:", v311);
                        }
                        if ((_DWORD)v304 != -1)
                        {
                          objc_msgSend(v313, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v304));
                          objc_msgSend(v313, "addObject:", v311);
                          objc_msgSend(v312, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v304));
                          objc_msgSend(v312, "addObject:", v311);
                        }
                        v309 = v310;
                        if (v389 != -1)
                        {
                          objc_msgSend(v412, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
                          objc_msgSend(v412, "addObject:", v311);
                        }
                        v438 = 0u;
                        v439 = 0u;
                        v436 = 0u;
                        v437 = 0u;
                        v320 = objc_msgSend(v435, "countByEnumeratingWithState:objects:count:", &v436, v474, 16);
                        if (v320)
                        {
                          v321 = v320;
                          v322 = *(_QWORD *)v437;
                          do
                          {
                            for (n = 0; n != v321; ++n)
                            {
                              if (*(_QWORD *)v437 != v322)
                                objc_enumerationMutation(v435);
                              v324 = *(void **)(*((_QWORD *)&v436 + 1) + 8 * n);
                              v325 = objc_msgSend(v435, "objectForKeyedSubscript:", v324);
                              objc_msgSend(v434, "addObject:", v325);
                              objc_msgSend(v434, "addObject:", v311);
                              objc_msgSend(v310, "addObject:", v325);
                              v326 = objc_msgSend(v324, "isEqualToString:", CFSTR("HumanFullBodiesMask"));
                              v327 = CFSTR("com.apple.quicktime.video-map.person");
                              if ((v326 & 1) == 0)
                              {
                                v328 = objc_msgSend(v324, "isEqualToString:", CFSTR("HumanSkinsMask"));
                                v327 = CFSTR("com.apple.quicktime.video-map.skin");
                                if ((v328 & 1) == 0)
                                {
                                  v329 = objc_msgSend(v324, "isEqualToString:", 0x1E495B218);
                                  v327 = CFSTR("com.apple.quicktime.video-map.sky");
                                  if ((v329 & 1) == 0)
                                  {
                                    v330 = objc_msgSend(v324, "isEqualToString:", 0x1E495B3F8);
                                    v327 = CFSTR("com.apple.quicktime.video-map.smart-style-linear-thumbnail");
                                    if ((v330 & 1) == 0)
                                    {
                                      if (objc_msgSend(v324, "isEqualToString:", 0x1E495B418))
                                        v327 = CFSTR("com.apple.quicktime.video-map.smart-style-delta-map");
                                      else
                                        v327 = CFSTR("Unknown");
                                    }
                                  }
                                }
                              }
                              v309 = v310;
                              objc_msgSend(v310, "addObject:", v327);
                            }
                            v321 = objc_msgSend(v435, "countByEnumeratingWithState:objects:count:", &v436, v474, 16);
                          }
                          while (v321);
                        }
                        if ((_DWORD)v283 != -1)
                        {
                          objc_msgSend(v415, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v283));
                          objc_msgSend(v415, "addObject:", v311);
                          objc_msgSend(v421, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v283));
                          objc_msgSend(v421, "addObject:", v311);
                        }
                        v13 = v428;
                        if (v402 != -1 && v399 != -1)
                        {
                          v331 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v399);
                          v332 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v402);
                          objc_msgSend(v410, "addObject:", v331);
                          objc_msgSend(v410, "addObject:", v332);
                        }
                      }
                    }
                    if (objc_msgSend(v415, "count"))
                      objc_msgSend(*(id *)(v13 + 120), "setTrackReferenceListForMetadataInputs:", v415);
                    if (objc_msgSend(v412, "count"))
                      objc_msgSend(*(id *)(v13 + 120), "setTrackReferenceListForRenderMetadataInputs:", v412);
                    if (objc_msgSend(v421, "count"))
                      objc_msgSend(*(id *)(v13 + 120), "setStructuralDependentTrackReferenceListForMetadataInputs:", v421);
                    if (objc_msgSend(v434, "count"))
                      objc_msgSend(*(id *)(v13 + 120), "setTrackReferenceListForVideoInputs:", v434);
                    if (objc_msgSend(v410, "count"))
                      objc_msgSend(*(id *)(v13 + 120), "setTrackReferenceListForAudioInputs:", v410);
                    if (objc_msgSend(v408, "count"))
                      objc_msgSend(*(id *)(v13 + 120), "setTrackReferenceListForAudioRemixInputs:", v408);
                    if (objc_msgSend(v309, "count"))
                      objc_msgSend(*(id *)(v13 + 120), "setTaggedMediaCharacteristicsForInputs:", v309);
                    goto LABEL_559;
                  }
                }
                v399 = -1;
                goto LABEL_464;
              }
            }
            v423 = -1;
            goto LABEL_441;
          }
        }
        if (objc_msgSend(v23, "count"))
        {
          v195 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", CFSTR("PrimaryFormat"));
          objc_msgSend(v195, "addObjectsFromArray:", v23);
          v196 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:]([BWAttachedMediaSplitNode alloc], "initWithAttachedMediaKeys:", v195);
          -[BWNode setName:](v196, "setName:", objc_msgSend(*(id *)(v178 + 2368), "stringWithFormat:", CFSTR("%@ %@"), objc_msgSend((id)v13, "name"), CFSTR("Smart Style Media Splitter")));
          -[BWAttachedMediaSplitNode setEmitsDroppedSampleForMissingAttachedMedia:](v196, "setEmitsDroppedSampleForMissingAttachedMedia:", 1);
          if ((objc_msgSend((id)v13, "addNode:error:", v196, &v472) & 1) == 0
            || (objc_msgSend(v52, "addNode:error:", v196, &v472) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v38, -[BWNode input](v196, "input"), v53) & 1) == 0)
          {
            goto LABEL_558;
          }
          v197 = v193;
          v198 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v196, "outputs"), "objectAtIndexedSubscript:", 0);
          objc_msgSend(v198, "setName:", CFSTR("Primary"));
          v199 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          if ((unint64_t)objc_msgSend(v195, "count") >= 2)
          {
            v200 = 1;
            do
            {
              v201 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v196, "outputs"), "objectAtIndexedSubscript:", v200);
              v202 = (void *)objc_msgSend(v195, "objectAtIndexedSubscript:", v200);
              objc_msgSend(v201, "setName:", mfsp_pipelineNameFromSmartStyleAttachedMediaKey(v202));
              objc_msgSend(v199, "setObject:forKeyedSubscript:", v201, v202);
              ++v200;
            }
            while (objc_msgSend(v195, "count") > v200);
          }
          if (!v198)
          {
            v372 = 0;
            v194 = v199;
            v193 = v197;
            v52 = a6;
            goto LABEL_413;
          }
          v38 = v198;
          v178 = 0x1E0CB3000;
          v203 = v199;
          v193 = v197;
          v52 = a6;
        }
        else
        {
          v203 = 0;
        }
        v419 = v38;
        v405 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
        objc_msgSend(v405, "setObject:forKeyedSubscript:", v387, CFSTR("AVVideoCodecKey"));
        if (!-[__CFString outputFormat](v400, "outputFormat"))
        {
          objc_msgSend(v405, "setObject:forKeyedSubscript:", &unk_1E4A02FD0, CFSTR("AVVideoCompressionPropertiesKey"));
          -[__CFString isEqualToString:](v387, "isEqualToString:", CFSTR("hvc1"));
        }
        v204 = v411;
        if (*(_BYTE *)(v13 + 168))
        {
          objc_msgSend(v405, "setObject:forKeyedSubscript:", 0, CFSTR("AVVideoWidthKey"));
          v205 = v405;
          v206 = 0;
        }
        else if ((int)-[__CFString outputWidth](v400, "outputWidth") < 1
               || (int)-[__CFString outputHeight](v400, "outputHeight") < 1)
        {
          v244 = objc_msgSend((id)objc_msgSend((id)-[__CFString sourceConfiguration](v400, "sourceConfiguration"), "requiredFormat"), "dimensions");
          if ((int)v244 < 1 || (v245 = HIDWORD(v244), SHIDWORD(v244) < 1))
          {
            objc_msgSend(v405, "setObject:forKeyedSubscript:", &unk_1E49F8760, CFSTR("AVVideoWidthKey"));
            v206 = &unk_1E49F8778;
            v205 = v405;
          }
          else
          {
            objc_msgSend(v405, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), CFSTR("AVVideoWidthKey"));
            v206 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v245);
            v205 = v405;
          }
        }
        else
        {
          objc_msgSend(v405, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[__CFString outputWidth](v400, "outputWidth")), CFSTR("AVVideoWidthKey"));
          v206 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[__CFString outputHeight](v400, "outputHeight"));
          v205 = v405;
          v204 = v411;
        }
        objc_msgSend(v205, "setObject:forKeyedSubscript:", v206, CFSTR("AVVideoHeightKey"));
        if (v422)
          v207 = *(void **)(v422 + 8);
        else
          v207 = 0;
        objc_msgSend((id)objc_msgSend(v207, "requiredFormat"), "maxSupportedFrameRate");
        v209 = v208;
        *(_DWORD *)(v13 + 160) = 2;
        if (v407)
          ++*(_DWORD *)(v13 + 160);
        objc_msgSend(v405, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v13 + 160)), CFSTR("CVPixelBufferRecyclingSlop"));
        if (-[__CFString isEqualToString:](v387, "isEqualToString:", CFSTR("hvc1")))
          objc_msgSend(v405, "setObject:forKeyedSubscript:", &unk_1E49F8790, CFSTR("AVVideoHEVCExtraRetainedBufferCount"));
        v210 = objc_msgSend(v51, "delayedCompressorCleanupEnabled");
        if (v204 == 1)
          v211 = 0;
        else
          v211 = v210;
        v401 = v211;
        v212 = [BWVideoCompressorNode alloc];
        if (v422)
          v214 = *(unsigned int *)(v422 + 144);
        else
          v214 = 0;
        LODWORD(v213) = v209;
        v215 = -[BWVideoCompressorNode initWithCompressionSettings:overCaptureEnabled:stereoVideoCompressionEnabled:maxVideoFrameRate:delayedCompressorCleanupEnabled:maxLossyCompressionLevel:](v212, "initWithCompressionSettings:overCaptureEnabled:stereoVideoCompressionEnabled:maxVideoFrameRate:delayedCompressorCleanupEnabled:maxLossyCompressionLevel:", v405, v204 == 1, v407, v401, v214, v213);
        if ((objc_msgSend(v52, "addNode:error:", v215, &v472) & 1) == 0)
          goto LABEL_558;
        *(_QWORD *)(v13 + 56) = v215;
        objc_msgSend(*(id *)(v13 + 56), "setName:", objc_msgSend(*(id *)(v178 + 2368), "stringWithFormat:", CFSTR("%@ Video Compressor"), objc_msgSend((id)v13, "name")));
        if (v204 == 1)
          v216 = 82;
        else
          v216 = 81;
        v397 = v216;
        objc_msgSend(*(id *)(v13 + 56), "setPipelineTraceID:");
        if (v422)
        {
          objc_msgSend(*(id *)(v13 + 56), "setMaximumAllowedInFlightCompressedBytes:", *(_QWORD *)(v422 + 176));
          if (*(int *)(v422 + 160) < 3 || *(_BYTE *)(v13 + 168))
          {
            if (!v407)
              goto LABEL_293;
          }
          else
          {
            objc_msgSend(*(id *)(v13 + 56), "setCompressionDimensionsFromInputEnabled:", 1);
            if (!v407)
              goto LABEL_293;
          }
        }
        else
        {
          objc_msgSend(*(id *)(v13 + 56), "setMaximumAllowedInFlightCompressedBytes:", 0);
          if (!v407)
            goto LABEL_293;
        }
        LODWORD(v467) = 0;
        v473 = BWStereoUtilitiesComputeStereoBaseline(*MEMORY[0x1E0D05A18], *MEMORY[0x1E0D05A28], (void *)objc_msgSend(a7, "cameraInfoByPortType"), (float *)&v467);
        if (v473)
          goto LABEL_558;
        LODWORD(v217) = (_DWORD)v467;
        objc_msgSend(*(id *)(v13 + 56), "setStereoVideoBaseline:", v217);
LABEL_293:
        if (v388)
          objc_msgSend(*(id *)(v13 + 56), "setPrioritizeEncodingSpeedOverQuality:", 1);
        if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v419, objc_msgSend(*(id *)(v13 + 56), "input"), obj) & 1) == 0)goto LABEL_558;
        v372 = (id)objc_msgSend(*(id *)(v13 + 56), "output");
        if (v193)
        {
          v218 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v405);
          objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v381), CFSTR("AVVideoWidthKey"));
          objc_msgSend(v218, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v344), CFSTR("AVVideoHeightKey"));
          v219 = [BWVideoCompressorNode alloc];
          if (v422)
            v221 = *(unsigned int *)(v422 + 144);
          else
            v221 = 0;
          LODWORD(v220) = v209;
          v222 = -[BWVideoCompressorNode initWithCompressionSettings:overCaptureEnabled:stereoVideoCompressionEnabled:maxVideoFrameRate:delayedCompressorCleanupEnabled:maxLossyCompressionLevel:](v219, "initWithCompressionSettings:overCaptureEnabled:stereoVideoCompressionEnabled:maxVideoFrameRate:delayedCompressorCleanupEnabled:maxLossyCompressionLevel:", v218, v411 == 1, 0, v401, v221, v220);
          -[BWNode setName:](v222, "setName:", objc_msgSend(*(id *)(v178 + 2368), "stringWithFormat:", CFSTR("%@ Depth Compressor"), objc_msgSend((id)v13, "name")));
          -[BWVideoCompressorNode setAlternateCompressionSettingsKey:](v222, "setAlternateCompressionSettingsKey:", 0x1E4959D18);
          if ((objc_msgSend(v52, "addNode:error:", v222, &v472) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v193, -[BWNode input](v222, "input"), v343) & 1) == 0)
          {
            goto LABEL_558;
          }
          v345 = -[BWNode output](v222, "output");
          *(_QWORD *)(v13 + 72) = v222;
        }
        else
        {
          v345 = 0;
        }
        v460 = 0u;
        v461 = 0u;
        v458 = 0u;
        v459 = 0u;
        v420 = v203;
        obja = (id)objc_msgSend(v203, "allKeys");
        v223 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v458, v479, 16);
        if (v223)
        {
          v224 = v223;
          v225 = *(_QWORD *)v459;
LABEL_308:
          v226 = 0;
          while (1)
          {
            if (*(_QWORD *)v459 != v225)
              objc_enumerationMutation(obja);
            v227 = *(void **)(*((_QWORD *)&v458 + 1) + 8 * v226);
            v228 = [BWVideoCompressorNode alloc];
            v230 = v422 ? *(unsigned int *)(v422 + 144) : 0;
            LODWORD(v229) = v209;
            v231 = -[BWVideoCompressorNode initWithCompressionSettings:overCaptureEnabled:stereoVideoCompressionEnabled:maxVideoFrameRate:delayedCompressorCleanupEnabled:maxLossyCompressionLevel:](v228, "initWithCompressionSettings:overCaptureEnabled:stereoVideoCompressionEnabled:maxVideoFrameRate:delayedCompressorCleanupEnabled:maxLossyCompressionLevel:", v405, v411 == 1, v407, v401, v230, v229);
            if ((objc_msgSend(a6, "addNode:error:", v231, &v472) & 1) == 0)
              goto LABEL_558;
            -[BWNode setName:](v231, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ Compressor"), objc_msgSend((id)v13, "name"), mfsp_pipelineNameFromSmartStyleAttachedMediaKey(v227)));
            -[BWVideoCompressorNode setPipelineTraceID:](v231, "setPipelineTraceID:", v397);
            if (v422)
              v232 = *(_QWORD *)(v422 + 176);
            else
              v232 = 0;
            -[BWVideoCompressorNode setMaximumAllowedInFlightCompressedBytes:](v231, "setMaximumAllowedInFlightCompressedBytes:", v232);
            -[BWVideoCompressorNode setCompressionDimensionsFromInputEnabled:](v231, "setCompressionDimensionsFromInputEnabled:", 1);
            v233 = objc_msgSend(v227, "isEqualToString:", CFSTR("HumanFullBodiesMask"));
            v234 = CFSTR("SmartStyleMasksSettings");
            if ((v233 & 1) == 0)
            {
              v235 = objc_msgSend(v227, "isEqualToString:", CFSTR("HumanSkinsMask"));
              v234 = CFSTR("SmartStyleMasksSettings");
              if ((v235 & 1) == 0)
              {
                v236 = objc_msgSend(v227, "isEqualToString:", 0x1E495B218);
                v234 = CFSTR("SmartStyleMasksSettings");
                if ((v236 & 1) == 0)
                {
                  v237 = objc_msgSend(v227, "isEqualToString:", 0x1E495B3F8);
                  v234 = CFSTR("SmartStyleLinearThumbnailSettings");
                  if ((v237 & 1) == 0)
                  {
                    if (objc_msgSend(v227, "isEqualToString:", 0x1E495B418))
                      v234 = CFSTR("SmartStyleDeltaMapSettings");
                    else
                      v234 = 0;
                  }
                }
              }
            }
            -[BWVideoCompressorNode setAlternateCompressionSettingsKey:](v231, "setAlternateCompressionSettingsKey:", v234);
            if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v203, "objectForKeyedSubscript:", v227), -[BWNode input](v231, "input"), objc_msgSend(v429, "objectForKeyedSubscript:", v227)) & 1) == 0)goto LABEL_558;
            objc_msgSend(v203, "setObject:forKeyedSubscript:", -[BWNode output](v231, "output"), v227);
            v13 = v428;
            v238 = *(id *)(v428 + 80);
            if (!v238)
            {
              v238 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              *(_QWORD *)(v428 + 80) = v238;
            }
            objc_msgSend(v238, "setObject:forKeyedSubscript:", v231, v227);
            if (v224 == ++v226)
            {
              v239 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v458, v479, 16);
              v224 = v239;
              if (v239)
                goto LABEL_308;
              break;
            }
          }
        }
        if (-[FigCaptureVISPipeline visNode](*(_QWORD *)(v13 + 40)))
          v240 = *(_BYTE *)(v13 + 168) == 0;
        else
          v240 = 0;
        v51 = v424;
        v52 = a6;
        v193 = v345;
        v241 = 0;
        v398 = v240;
        v242 = v240 || v365;
        if (!v240 && !v365 && !v347)
        {
          if (*(_QWORD *)(v13 + 32))
          {
            if (a6)
              v243 = objc_msgSend(a6[7], "irisStagingNode");
            else
              v243 = 0;
            v241 = v243 != 0;
          }
          else
          {
            v241 = 0;
          }
        }
        v246 = &off_1E4914000;
        if (((v366 | v242) & 1) == 0 && !v347 && !v241)
        {
          v247 = v367;
          v248 = v411;
          if (!v367)
          {
LABEL_353:
            v367 = 0;
            v194 = v420;
            goto LABEL_414;
          }
LABEL_406:
          v266 = [BWVideoCompressorNode alloc];
          if (v422)
            v268 = *(unsigned int *)(v422 + 144);
          else
            v268 = 0;
          LODWORD(v267) = v209;
          v269 = -[BWVideoCompressorNode initWithCompressionSettings:overCaptureEnabled:stereoVideoCompressionEnabled:maxVideoFrameRate:delayedCompressorCleanupEnabled:maxLossyCompressionLevel:](v266, "initWithCompressionSettings:overCaptureEnabled:stereoVideoCompressionEnabled:maxVideoFrameRate:delayedCompressorCleanupEnabled:maxLossyCompressionLevel:", v405, v248 == 1, 0, v401, v268, v267);
          if ((objc_msgSend(v52, "addNode:error:", v269, &v472) & 1) == 0)
            goto LABEL_558;
          v270 = v269;
          *(_QWORD *)(v13 + 64) = v270;
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v247, -[BWNode input](v270, "input"), v348) & 1) == 0)
            goto LABEL_558;
          v271 = objc_msgSend(*(id *)(v13 + 64), "output");
          *(_QWORD *)(v13 + 112) = (id)objc_msgSend(objc_alloc((Class)v246[298]), "initWithNumberOfInputsAndOutputs:initialSemaphoreValue:", 1, 0);
          objc_msgSend(*(id *)(v13 + 112), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Iris SDOF Back Pressure"), objc_msgSend((id)v13, "name")));
          if ((objc_msgSend(v52, "addNode:error:", *(_QWORD *)(v13 + 112), &v472) & 1) == 0
            || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v271, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 112), "inputs"), "objectAtIndexedSubscript:", 0), v348) & 1) == 0)
          {
            goto LABEL_558;
          }
          v367 = objc_msgSend((id)objc_msgSend(*(id *)(v13 + 112), "outputs"), "objectAtIndexedSubscript:", 0);
          objc_msgSend((id)-[FigCaptureVISPipeline sdofVISNode](*(_QWORD *)(v13 + 40)), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Iris SDOF VIS"), objc_msgSend((id)v13, "name")));
          objc_msgSend(*(id *)(v13 + 64), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Iris SDOF Compressor"), objc_msgSend((id)v13, "name")));
          objc_msgSend((id)-[FigCaptureVISPipeline visNode](*(_QWORD *)(v13 + 40)), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Iris VIS"), objc_msgSend((id)v13, "name")));
          objc_msgSend(*(id *)(v13 + 56), "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Iris Compressor"), objc_msgSend((id)v13, "name")));
          v194 = v420;
          goto LABEL_413;
        }
        objb = v241;
        v249 = objc_msgSend(v203, "count");
        v250 = v341;
        if (v345)
          v250 = v341 + 1;
        v251 = -[BWBackPressureNode initWithNumberOfInputsAndOutputs:initialSemaphoreValue:]([BWBackPressureNode alloc], "initWithNumberOfInputsAndOutputs:initialSemaphoreValue:", (v250 + v249), 0);
        if ((objc_msgSend(a6, "addNode:error:", v251, &v472) & 1) == 0)
          goto LABEL_558;
        v252 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.post-compressor-backpressure.tail.%d"), v411), 14, a10);
        if (v376)
        {
          v253 = v364;
          v254 = v203;
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v357, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v251, "inputs"), "objectAtIndexedSubscript:", 0), v252) & 1) == 0)goto LABEL_558;
          v357 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v251, "outputs"), "objectAtIndexedSubscript:", 0);
          v255 = 1;
        }
        else
        {
          v255 = 0;
          v253 = v364;
          v254 = v203;
        }
        if (IsHDR)
        {
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v253, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v251, "inputs"), "objectAtIndexedSubscript:", v255), v252) & 1) == 0)goto LABEL_558;
          v253 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v251, "outputs"), "objectAtIndexedSubscript:", v255++);
        }
        if (v380)
        {
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v355, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v251, "inputs"), "objectAtIndexedSubscript:", v255), v252) & 1) == 0)goto LABEL_558;
          v355 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v251, "outputs"), "objectAtIndexedSubscript:", v255++);
        }
        if (v353)
        {
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v347, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v251, "inputs"), "objectAtIndexedSubscript:", v255), v252) & 1) == 0)goto LABEL_558;
          ++v255;
        }
        if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v372, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v251, "inputs"), "objectAtIndexedSubscript:", v255), v252) & 1) == 0)
        {
LABEL_558:
          FigDebugAssert3();
          goto LABEL_559;
        }
        v256 = objc_msgSend((id)objc_msgSend(v372, "connection"), "pipelineStage");
        if (v256 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v428 + 56), "output"), "connection"), "pipelineStage"))
        {
          v337 = v349;
          LODWORD(v334) = 0;
          FigDebugAssert3();
        }
        v257 = v255 + 1;
        v430 = v251;
        v364 = v253;
        v372 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v251, "outputs", v334, v337), "objectAtIndexedSubscript:", v255);
        if (v345)
        {
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v345, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v251, "inputs"), "objectAtIndexedSubscript:", v255 + 1), v252) & 1) == 0)goto LABEL_558;
          v258 = -[BWNodeConnection pipelineStage](-[BWNodeOutput connection](v345, "connection"), "pipelineStage");
          if (v258 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v428 + 72), "output"), "connection"), "pipelineStage"))
          {
            v338 = v349;
            LODWORD(v335) = 0;
            FigDebugAssert3();
          }
          v346 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v251, "outputs", v335, v338), "objectAtIndexedSubscript:", v255 + 1);
          v257 = v255 + 2;
        }
        else
        {
          v346 = 0;
        }
        v456 = 0u;
        v457 = 0u;
        v454 = 0u;
        v455 = 0u;
        v425 = (id)objc_msgSend(v254, "allKeys");
        v259 = objc_msgSend(v425, "countByEnumeratingWithState:objects:count:", &v454, v478, 16);
        if (v259)
        {
          v260 = v259;
          v261 = *(_QWORD *)v455;
LABEL_381:
          v262 = 0;
          while (1)
          {
            if (*(_QWORD *)v455 != v261)
              objc_enumerationMutation(v425);
            v263 = *(_QWORD *)(*((_QWORD *)&v454 + 1) + 8 * v262);
            if (!objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v420, "objectForKeyedSubscript:", v263), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v430, "inputs"), "objectAtIndexedSubscript:", v257 + v262), v252))goto LABEL_558;
            objc_msgSend(v420, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v430, "outputs"), "objectAtIndexedSubscript:", v257 + v262++), v263);
            if (v260 == v262)
            {
              v260 = objc_msgSend(v425, "countByEnumeratingWithState:objects:count:", &v454, v478, 16);
              v257 += v262;
              if (v260)
                goto LABEL_381;
              break;
            }
          }
        }
        if (v398)
        {
          v13 = v428;
          -[BWNode setName:](v430, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ VIS Back Pressure"), objc_msgSend((id)v428, "name")));
          *(_QWORD *)(v428 + 96) = v430;
          v51 = v424;
          v52 = a6;
          v248 = v411;
          v193 = (id)v346;
          v246 = &off_1E4914000;
          if (objc_msgSend(v373, "irisMovieCaptureEnabled"))
          {
            v247 = v367;
            if (v340)
              *(_QWORD *)(v428 + 144) = -[FigCaptureVISPipeline visNode](*(_QWORD *)(v428 + 40));
            else
              *(_QWORD *)(v428 + 144) = *(_QWORD *)(v428 + 32);
            if (!v366)
              goto LABEL_405;
          }
          else
          {
            *(_QWORD *)(v428 + 144) = -[FigCaptureVISPipeline visNode](*(_QWORD *)(v428 + 40));
            v247 = v367;
            if (!v366)
              goto LABEL_405;
          }
LABEL_404:
          v372 = (id)-[FigCaptureMovieFileSinkTailPipeline _appendBackPressureNodeToPreviousVideoOutput:graph:parentPipeline:pipelineStage:nodeName:backPressureNodeOut:]((void *)v13, (uint64_t)v372, a5, v52, (uint64_t)v342, (uint64_t)CFSTR("Iris Intermediate JPEG Decompression Back Pressure"), (_QWORD *)(v13 + 88));
          if (!v372)
            goto LABEL_558;
LABEL_405:
          if (!v247)
            goto LABEL_353;
          goto LABEL_406;
        }
        v51 = v424;
        v52 = a6;
        v248 = v411;
        v193 = (id)v346;
        v246 = &off_1E4914000;
        if (v365)
        {
          v13 = v428;
          -[BWNode setName:](v430, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Middle Pipeline VIS Back Pressure"), objc_msgSend((id)v428, "name")));
          *(_QWORD *)(v428 + 96) = v430;
          *(_QWORD *)(v428 + 144) = -[FigCaptureVISPipeline visNode](objc_msgSend((id)objc_msgSend(a6, "middlePipeline"), "visPipeline"));
          v247 = v367;
          if (!v366)
            goto LABEL_405;
          goto LABEL_404;
        }
        if (v366)
        {
          v13 = v428;
          -[BWNode setName:](v430, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Iris Intermediate JPEG Decompression Back Pressure"), objc_msgSend((id)v428, "name")));
          v264 = v430;
          v265 = 88;
LABEL_401:
          *(_QWORD *)(v13 + v265) = v264;
          goto LABEL_569;
        }
        if (v347)
        {
          v13 = v428;
          -[BWNode setName:](v430, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Motion Analysius Back Pressure"), objc_msgSend((id)v428, "name")));
        }
        else
        {
          if (objb)
          {
            v13 = v428;
            -[BWNode setName:](v430, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Scaler Back Pressure Node"), objc_msgSend((id)v428, "name")));
            v264 = v430;
            v265 = 104;
            goto LABEL_401;
          }
          v13 = v428;
        }
LABEL_569:
        v247 = v367;
        if (!v367)
          goto LABEL_353;
        goto LABEL_406;
      }
LABEL_193:
      v151 = 0;
      goto LABEL_194;
    }
    *(_BYTE *)(v13 + 168) = *(_BYTE *)(v422 + 122);
    v49 = *(_DWORD *)(v422 + 104);
  }
  else
  {
    v381 = v46;
    v344 = HIDWORD(v46);
    if (!v400)
    {
      v51 = v424;
      v143 = objc_msgSend(v424, "vitalityScoringEnabled");
      v367 = 0;
      v151 = 0;
      v13 = v428;
      v52 = a6;
      v53 = obj;
      v38 = (id)v416;
      goto LABEL_668;
    }
    v49 = 0;
    v13 = v428;
    *(_BYTE *)(v428 + 168) = 0;
  }
  v358 = v44;
  v50 = +[FigCaptureVISPipeline visPipelineIsRequiredForFigCaptureVideoStabilizationType:]((uint64_t)FigCaptureVISPipeline, v49)|| *(_BYTE *)(v13 + 168) != 0;
  v55 = v388 & FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata();
  if (v411)
    v56 = 1;
  else
    v56 = *(_BYTE *)(v13 + 168) == 0;
  v57 = !v56 && v388;
  if (!v57 || v55)
  {
    v59 = !v365;
    v58 = v50 && !v365;
  }
  else
  {
    v58 = 0;
    v59 = 0;
  }
  if (v422)
  {
    if (objc_msgSend(*(id *)(v422 + 16), "irisVISMethod") == 3)
    {
LABEL_93:
      v61 = v374 == 1;
      goto LABEL_95;
    }
    v60 = *(void **)(v422 + 16);
  }
  else
  {
    v333 = objc_msgSend(0, "irisVISMethod");
    v60 = 0;
    if (v333 == 3)
      goto LABEL_93;
  }
  if (objc_msgSend(v60, "irisVISMethod") == 5)
    goto LABEL_93;
  v61 = 0;
LABEL_95:
  if (*(_BYTE *)(v428 + 168))
  {
    v58 &= !v61;
    v59 &= !v61;
  }
  if (v422)
    v375 = *(_BYTE *)(v422 + 141) != 0;
  else
    v375 = 0;
  v62 = objc_msgSend(v424, "movieFileSinkPipelineConfiguration");
  if (v62)
  {
    v63 = *(_BYTE *)(v62 + 187) ? v58 : 1;
    if ((v63 & 1) == 0)
    {
      v64 = [BWSmartStyleApplyNode alloc];
      v65 = objc_msgSend(v424, "movieFileSinkPipelineConfiguration");
      if (v65)
        v66 = *(unsigned int *)(v65 + 192);
      else
        v66 = 0;
      v67 = -[BWSmartStyleApplyNode initWithMetalCommandQueue:renderingMethod:](v64, "initWithMetalCommandQueue:renderingMethod:", 0, v66);
      if (!v67)
      {
        FigDebugAssert3();
        v473 = -12786;
        goto LABEL_559;
      }
      v68 = v67;
      -[BWNode setName:](v67, "setName:", CFSTR("SmartStyle Movie File Apply"));
      v69 = objc_msgSend(v424, "movieFileSinkPipelineConfiguration");
      if (v69)
        v70 = *(unsigned int *)(v69 + 144);
      else
        v70 = 0;
      -[BWSmartStyleApplyNode setMaxLossyCompressionLevel:](v68, "setMaxLossyCompressionLevel:", v70);
      if ((objc_msgSend(a6, "addNode:error:", v68, &v472) & 1) == 0
        || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v416, -[BWNode input](v68, "input"), v403) & 1) == 0)
      {
        goto LABEL_558;
      }
      v416 = -[BWNode output](v68, "output");
    }
  }
  v71 = v422;
  if (!v58)
  {
    if (v59)
    {
      v13 = v428;
      v51 = v424;
      if (CFPreferenceNumberWithDefault)
      {
        v73 = (void *)objc_msgSend((id)-[__CFString sourceConfiguration](v400, "sourceConfiguration"), "requiredFormat");
        v74 = objc_msgSend((id)-[__CFString sourceConfiguration](v400, "sourceConfiguration"), "imageControlMode");
        v75 = objc_msgSend(v73, "horizontalSensorBinningFactor");
        v76 = objc_msgSend(v73, "verticalSensorBinningFactor");
        objc_msgSend(v73, "maxSupportedFrameRate");
        if (v422)
          v78 = *(_DWORD *)(v422 + 112);
        else
          v78 = 0;
        v79 = FigCaptureBuildMotionAttachmentsNode(a6, v416, v75, v76, v403, v78, objc_msgSend(a7, "sensorIDDictionaryByPortType"), objc_msgSend(a7, "cameraInfoByPortType"), v77, objc_msgSend(a7, "activePortTypes"), v74 == 4, objc_msgSend(v373, "optimizesImagesForOfflineVideoStabilization"), 1, 0, &v473);
        if (v473)
          goto LABEL_558;
        v80 = v79;
        v13 = v428;
        v71 = v422;
        v51 = v424;
      }
      else
      {
        v80 = v416;
      }
      if (v71)
      {
        v145 = *(void **)(v71 + 16);
        v146 = v71;
        objc_msgSend((id)v13, "name");
        v147 = *(_DWORD *)(v146 + 144);
      }
      else
      {
        objc_msgSend((id)v13, "name");
        v145 = 0;
        v147 = 0;
      }
      v148 = v39;
      v52 = a6;
      v38 = (id)mfsp_buildMovieFileScalerNode(v145, v80, v363, v148, a5, a6, (uint64_t)v403, (_QWORD *)(v13 + 32), v375, v147);
      objc_msgSend(v40, "setDownstreamIsSharingOutputPool:", objc_msgSend(*(id *)(v13 + 32), "passesBuffersThroughWhenPossible") | objc_msgSend(v40, "downstreamIsSharingOutputPool"));
      if ((objc_msgSend(*(id *)(v13 + 32), "passesBuffersThroughWhenPossible") & 1) == 0)
      {
        v54 = v385;
        if (v40)
        {
          v149 = -[FigCaptureMovieFileSinkTailPipeline _appendBackPressureNodeToPreviousVideoOutput:graph:parentPipeline:pipelineStage:nodeName:backPressureNodeOut:]((void *)v13, (uint64_t)v38, a5, a6, (uint64_t)v342, (uint64_t)CFSTR("Iris Intermediate JPEG Decompression Back Pressure"), (_QWORD *)(v13 + 88));
          if (!v149)
            goto LABEL_558;
          v38 = (id)v149;
          v366 = 0;
        }
        v53 = obj;
LABEL_188:
        v143 = objc_msgSend(v51, "vitalityScoringEnabled");
        v367 = 0;
        v144 = v422;
        if (!v422)
          goto LABEL_193;
        goto LABEL_189;
      }
      v53 = obj;
    }
    else
    {
      v13 = v428;
      v51 = v424;
      v52 = a6;
      v53 = obj;
      v38 = (id)v416;
    }
    v54 = v385;
    goto LABEL_188;
  }
  if (v422)
  {
    v72 = a6;
    if ((*(_DWORD *)(v422 + 104) - 3) > 1)
      v354 = 0;
    else
      v354 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.coremedia.capture.moviefile.post-isp-digital-zoom.tail.%d"), v411), 14);
    v81 = v416;
    v82 = *(void **)(v422 + 16);
  }
  else
  {
    v354 = 0;
    v82 = 0;
    v72 = a6;
    v81 = v416;
  }
  v83 = objc_msgSend((id)objc_msgSend(v82, "irisSinkConfiguration"), "semanticStyleRenderingEnabled");
  v356 = v40;
  if (v83)
  {
    v84 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", a7, a8, 13);
    -[BWNode setName:](v84, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tail Pipeline %d Person Segmentation Inference Node"), v411));
    if ((objc_msgSend(v72, "addNode:error:", v84, &v472) & 1) == 0)
      goto LABEL_558;
    v85 = -[BWInferenceConfiguration initWithInferenceType:]([BWStreamingPersonSegmentationConfiguration alloc], "initWithInferenceType:", 105);
    -[BWStreamingPersonSegmentationConfiguration setInputRotationAngle:](v85, "setInputRotationAngle:", 0);
    -[BWStreamingPersonSegmentationConfiguration setPropagateColorInput:](v85, "setPropagateColorInput:", 0);
    LODWORD(v86) = 10.0;
    -[BWInferenceConfiguration setMaximumFramesPerSecond:](v85, "setMaximumFramesPerSecond:", v86);
    -[BWInferenceConfiguration setPropagatesFrameRatePrevention:](v85, "setPropagatesFrameRatePrevention:", 1);
    -[BWStreamingPersonSegmentationConfiguration setUseLowFrameRateOptimizedNetwork:](v85, "setUseLowFrameRateOptimizedNetwork:", 1);
    -[BWInferenceNode addInferenceOfType:version:configuration:](v84, "addInferenceOfType:version:configuration:", 105, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v85);

    v87 = -[BWInferenceConfiguration initWithInferenceType:]([BWOpticalFlowInferenceConfiguration alloc], "initWithInferenceType:", 117);
    -[BWOpticalFlowInferenceConfiguration setInputDimensions:](v87, "setInputDimensions:", 0xC000000100);
    -[BWOpticalFlowInferenceConfiguration setOutputDimensions:](v87, "setOutputDimensions:", 0xC000000100);
    -[BWOpticalFlowInferenceConfiguration setConcurrencyWidth:](v87, "setConcurrencyWidth:", 2);
    -[BWOpticalFlowInferenceConfiguration setAttachedMediaKeyForPropagatedColorInput:](v87, "setAttachedMediaKeyForPropagatedColorInput:", 0x1E49513F8);
    -[BWInferenceNode addInferenceOfType:version:configuration:](v84, "addInferenceOfType:version:configuration:", 117, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v87);

    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v81, -[BWNode input](v84, "input"), v403) & 1) == 0)
      goto LABEL_558;
    v88 = -[BWNode output](v84, "output");
    v89 = -[BWPersonSegmentationFilteringNode initWithGPUPriority:frameRateUpsamplingEnabled:metalCommandQueue:]([BWPersonSegmentationFilteringNode alloc], "initWithGPUPriority:frameRateUpsamplingEnabled:metalCommandQueue:", 1, 1, -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v428));
    -[BWNode setName:](v89, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tail Pipeline %d Person Segmentation Filtering Node"), v411));
    if ((objc_msgSend(v72, "addNode:error:", v89, &v472) & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v88, -[BWNode input](v89, "input"), v403) & 1) == 0)
    {
      goto LABEL_558;
    }
    v81 = -[BWNode output](v89, "output");
  }
  v90 = v83;
  if (v407)
  {
    v91 = [BWStereoVideoMetadataNode alloc];
    v92 = -[BWStereoVideoMetadataNode initWithPorts:secondaryPort:cameraInfoByPortType:errStatus:](v91, "initWithPorts:secondaryPort:cameraInfoByPortType:errStatus:", *MEMORY[0x1E0D05A18], *MEMORY[0x1E0D05A28], objc_msgSend(a7, "cameraInfoByPortType"), &v473);
    if (!v92)
      goto LABEL_558;
    v93 = v92;
    -[BWNode setName:](v92, "setName:", CFSTR("Stereo Video Metadata Node"));
    if ((objc_msgSend(v72, "addNode:error:", v93, &v472) & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v81, -[BWNode input](v93, "input"), v403) & 1) == 0)
    {
      goto LABEL_558;
    }
    v94 = -[BWNode output](v93, "output");
  }
  else
  {
    v94 = v81;
  }
  if (v61)
    v95 = 3;
  else
    v95 = 0;
  if (v43 | v55)
    v96 = v95;
  else
    v96 = 3;
  if (*(_BYTE *)(v428 + 168))
    v97 = 4;
  else
    v97 = v96;
  v98 = [FigCaptureVISPipeline alloc];
  v99 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tail %d VIS Pipeline"), v411);
  if (v422)
  {
    v100 = *(_DWORD *)(v422 + 104);
    v101 = *(_DWORD *)(v422 + 112);
    v102 = *(float *)(v422 + 156);
    v103 = *(_DWORD *)(v422 + 160);
  }
  else
  {
    v100 = 0;
    v101 = 0;
    v103 = 0;
    v102 = 0.0;
  }
  v51 = v424;
  v104 = objc_msgSend(v424, "movieFileSinkPipelineConfiguration");
  if (v104)
    v105 = *(_QWORD *)(v104 + 96);
  else
    v105 = 0;
  v106 = (void *)v422;
  if (v422)
  {
    v107 = *(_DWORD *)(v422 + 144);
    v108 = *(_BYTE *)(v422 + 148) != 0;
    v109 = *(_BYTE *)(v422 + 149) != 0;
    v110 = *(_BYTE *)(v422 + 184) != 0;
    v111 = *(_BYTE *)(v422 + 187) != 0;
    v112 = *(_BYTE *)(v422 + 188) != 0;
    v113 = *(_BYTE *)(v422 + 186) != 0;
    v106 = *(void **)(v422 + 128);
  }
  else
  {
    v113 = 0;
    v111 = 0;
    v109 = 0;
    v107 = 0;
    v108 = 0;
    v110 = 0;
    v112 = 0;
  }
  v336 = v101;
  v52 = a6;
  v114 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:](v98, v94, a5, v102, v99, a6, v400, v403, v369, v100, v336, v358, v388, v407, v103, 0, v97, 0x51u, a7,
           v105,
           v375,
           v379,
           v381,
           v107,
           v108,
           v109,
           v110,
           v90,
           v111,
           v112,
           v113,
           v106);
  v13 = v428;
  *(_QWORD *)(v428 + 40) = v114;
  if (v114)
  {
    v115 = objc_msgSend((id)-[FigCaptureVISPipeline visNode]((uint64_t)v114), "output");
    v367 = objc_msgSend((id)-[FigCaptureVISPipeline sdofVISNode](*(_QWORD *)(v428 + 40)), "output");
    if (v407)
    {
      v116 = [BWAttachedMediaSwapNode alloc];
      v482 = *MEMORY[0x1E0D08888];
      v117 = -[BWAttachedMediaSwapNode initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:](v116, "initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:", 0x1E492C078, CFSTR("SynchronizedSlaveFrame"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v482, 1), 0);
      if (!v117)
        goto LABEL_558;
      v118 = v117;
      -[BWNode setName:](v117, "setName:", CFSTR("Swap Primary and Synchronized Slave"));
      if ((objc_msgSend(a6, "addNode:error:", v118, &v472) & 1) == 0
        || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v115, -[BWNode input](v118, "input"), v371) & 1) == 0)
      {
        goto LABEL_558;
      }
      v119 = -[BWNode output](v118, "output");
      v120 = [FigCaptureVISPipeline alloc];
      v121 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tail %d stereo video companion VIS Pipeline"), v411);
      if (v422)
      {
        v122 = *(_DWORD *)(v422 + 104);
        v123 = *(_DWORD *)(v422 + 112);
        v124 = *(float *)(v422 + 156);
        v125 = *(_DWORD *)(v422 + 160);
      }
      else
      {
        v122 = 0;
        v123 = 0;
        v125 = 0;
        v124 = 0.0;
      }
      v126 = objc_msgSend(v424, "movieFileSinkPipelineConfiguration");
      v127 = v126 ? *(_QWORD *)(v126 + 96) : 0;
      v128 = (void *)v422;
      if (v422)
      {
        v129 = *(_DWORD *)(v422 + 144);
        v130 = *(_BYTE *)(v422 + 148) != 0;
        v131 = *(_BYTE *)(v422 + 149) != 0;
        v132 = *(_BYTE *)(v422 + 187) != 0;
        v133 = *(_BYTE *)(v422 + 188) != 0;
        v134 = *(_BYTE *)(v422 + 186) != 0;
        v128 = *(void **)(v422 + 128);
      }
      else
      {
        v134 = 0;
        v132 = 0;
        v130 = 0;
        v129 = 0;
        v131 = 0;
        v133 = 0;
      }
      v339 = v125;
      v52 = a6;
      v135 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:](v120, v119, a5, v124, v121, a6, v400, v371, 0, v122, v123, v358, 0, 2u, v339, 0, 0, 0x51u, a7,
               v127,
               0,
               0,
               0,
               v129,
               v130,
               v131,
               0,
               0,
               v132,
               v133,
               v134,
               v128);
      v13 = v428;
      *(_QWORD *)(v428 + 48) = v135;
      v136 = objc_msgSend((id)-[FigCaptureVISPipeline visNode]((uint64_t)v135), "output");
      v137 = -[BWAttachedMediaSwapNode initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:]([BWAttachedMediaSwapNode alloc], "initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:", CFSTR("SynchronizedSlaveFrame"), 0x1E492C078, 0, 0);
      if (!v137)
        goto LABEL_558;
      v138 = v137;
      -[BWNode setName:](v137, "setName:", CFSTR("Unswap Primary and Synchronized Slave"));
      v51 = v424;
      if ((objc_msgSend(a6, "addNode:error:", v138, &v472) & 1) == 0
        || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v136, -[BWNode input](v138, "input"), v371) & 1) == 0)
      {
        goto LABEL_558;
      }
      v115 = -[BWNode output](v138, "output");
      if (!v356)
        goto LABEL_173;
    }
    else if (!v356)
    {
      goto LABEL_173;
    }
    if (!*(_BYTE *)(v13 + 168))
    {
      v139 = -[FigCaptureMovieFileSinkTailPipeline _appendBackPressureNodeToPreviousVideoOutput:graph:parentPipeline:pipelineStage:nodeName:backPressureNodeOut:]((void *)v13, v115, a5, v52, (uint64_t)v342, (uint64_t)CFSTR("Iris Intermediate JPEG Decompression Back Pressure"), (_QWORD *)(v13 + 88));
      v53 = obj;
      if (!v139)
        goto LABEL_558;
      v115 = v139;
      v366 = 0;
      v140 = v422;
      goto LABEL_174;
    }
LABEL_173:
    v140 = v422;
    v53 = obj;
LABEL_174:
    if (v140)
    {
      if ((*(_DWORD *)(v140 + 104) - 3) > 1)
      {
        v38 = (id)v115;
      }
      else
      {
        v141 = objc_msgSend((id)-[FigCaptureVISPipeline visNode](*(_QWORD *)(v13 + 40)), "outputDimensions");
        v142 = *(void **)(v140 + 16);
        objc_msgSend((id)v13, "name");
        v38 = (id)mfsp_buildMovieFileScalerNode(v142, v115, v363, v141, a5, v52, (uint64_t)v354, (_QWORD *)(v13 + 32), v375, *(_DWORD *)(v140 + 144));
      }
      v54 = v385;
      v366 = v366;
      goto LABEL_179;
    }
    v366 = v366;
    v143 = objc_msgSend(v51, "vitalityScoringEnabled");
    v151 = 0;
    v38 = (id)v115;
LABEL_668:
    v54 = v385;
    goto LABEL_194;
  }
  FigDebugAssert3();
  v473 = FigSignalErrorAt();
LABEL_559:
  result = v473;
  if (!v473)
  {
    if (v472)
      return objc_msgSend(v472, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkTailPipeline;
  -[FigCapturePipeline dealloc](&v3, sel_dealloc);
}

- (CGRect)irisVISCleanOutputRectForCLAP
{
  FigCaptureVISPipeline *visPipeline;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  visPipeline = self->_visPipeline;
  if (visPipeline)
  {
    v3 = -[FigCaptureVISPipeline irisVISCleanOutputRect]((uint64_t)visPipeline);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)offlineVISDimensions
{
  BWVideoFormat *v2;
  unsigned int v3;

  if (self->_offlineVISEnabled)
  {
    v2 = -[BWNodeInput videoFormat](-[BWNode input](self->_videoCompressorNode, "input"), "videoFormat");
    v3 = -[BWVideoFormat width](v2, "width");
    return ($2825F4736939C4A6D3AD43837233062D)(v3 | ((unint64_t)-[BWVideoFormat height](v2, "height") << 32));
  }
  else
  {
    return ($2825F4736939C4A6D3AD43837233062D)0;
  }
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

- (BOOL)recording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BWMRCSceneObserver)mrcSceneObserver
{
  return self->_mrcSceneObserver;
}

- (void)setMRCSceneObserver:(id)a3
{
  self->_mrcSceneObserver = (BWMRCSceneObserver *)a3;
}

- (FigCaptureVISPipeline)visPipeline
{
  return self->_visPipeline;
}

- (BOOL)sceneClassifierSuspended
{
  return self->_sceneClassifierSuspended;
}

- (void)setSceneClassifierSuspended:(BOOL)a3
{
  self->_sceneClassifierSuspended = a3;
}

@end
