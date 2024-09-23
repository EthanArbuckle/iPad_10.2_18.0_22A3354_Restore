@implementation FigCaptureStillImageUnifiedBracketingSinkPipeline

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (FigCaptureStillImageUnifiedBracketingSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 highResStillImageDimensions:(id)a6 supplementalPointCloudCaptureDevice:(id)a7 supplementalPointCloudSourceOutput:(id)a8 captureStatusDelegate:(id)a9 inferenceScheduler:(id)a10 cinematicFramingStatesProvider:(id)a11 graph:(id)a12 name:(id)a13
{
  FigCaptureStillImageUnifiedBracketingSinkPipeline *v19;
  FigCaptureStillImageUnifiedBracketingSinkPipeline *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  v19 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v22, sel_initWithGraph_name_sinkID_, a12, a13, objc_msgSend((id)objc_msgSend(a3, "sinkConfiguration"), "sinkID"));
  v20 = v19;
  if (v19
    && -[FigCaptureStillImageUnifiedBracketingSinkPipeline _buildStillImageSinkPipelineWithConfiguration:captureDevice:sourceOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:]((uint64_t)v19, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, a11, a12))
  {
    FigDebugAssert3();

    return 0;
  }
  return v20;
}

- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(uint64_t)a3 captureDevice:(uint64_t)a4 sourceOutputsByPortType:(uint64_t)a5 highResStillImageDimensions:(uint64_t)a6 supplementalPointCloudCaptureDevice:(uint64_t)a7 supplementalPointCloudSourceOutput:(uint64_t)a8 captureStatusDelegate:(uint64_t)a9 inferenceScheduler:(void *)a10 cinematicFramingStatesProvider:(void *)a11 graph:
{
  uint64_t v11;
  uint64_t result;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BWStillImageNodeConfiguration *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  FigCaptureCameraParameters *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  uint64_t v54;
  BWSensorConfiguration *v55;
  void *v56;
  BOOL v57;
  unsigned int v58;
  uint64_t v59;
  unsigned int v60;
  unsigned int v61;
  BOOL v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  uint64_t v68;
  int v69;
  unsigned int v70;
  int v71;
  unsigned int v72;
  int v73;
  float v74;
  float v75;
  int v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  _BOOL4 v83;
  uint64_t v84;
  BWPersonSemanticsConfiguration *v85;
  void *v86;
  void *v87;
  void *v88;
  BWPersonSemanticsConfiguration *v89;
  void *v90;
  uint64_t v91;
  unint64_t v92;
  BWPersonSemanticsConfiguration *v93;
  uint64_t v94;
  uint64_t v95;
  FigCaptureCameraParameters *v96;
  double v97;
  int v98;
  int v100;
  void *v101;
  int v102;
  int v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  int v114;
  unsigned int v115;
  _BOOL4 v116;
  char v117;
  int v118;
  void *v119;
  int v120;
  int v121;
  int v122;
  int v123;
  uint64_t v124;
  int v125;
  int v126;
  BWPipelineStage *v127;
  BWPipelineStage *v128;
  void *v129;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __objc2_class **v131;
  BWAttachedMediaSplitNode *v132;
  BWAttachedMediaSplitNode *v133;
  char *v134;
  void *v135;
  uint64_t v136;
  BWStillImageCoordinatorNode *v137;
  void *v138;
  id v139;
  uint64_t v140;
  BWStillImageFrameCoordinatorNode *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t k;
  void *v146;
  uint64_t v147;
  FigCaptureIrisPreparedSettings *v148;
  int v149;
  unsigned int v150;
  uint64_t v151;
  int v152;
  void *v153;
  char v154;
  void *v155;
  BWCrossoverNode *v156;
  objc_class *v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  BWPixelTransferNode *v164;
  objc_class *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  BWPixelTransferNode *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  objc_class *v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t m;
  BWFunnelNode *v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  uint64_t v193;
  int v194;
  int v195;
  char *v196;
  int v197;
  unsigned int v198;
  _BOOL8 v199;
  int v200;
  int v201;
  BWUBNodeConfiguration *v202;
  uint64_t v203;
  char v204;
  char v205;
  int v206;
  char v207;
  char v208;
  unsigned int v209;
  char v210;
  BWPipelineStage *v211;
  void *v212;
  int v213;
  BWSensorConfiguration *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  BWSensorConfiguration *v219;
  uint64_t v220;
  uint64_t v221;
  float v222;
  char *v223;
  float v224;
  BWUBNode *v225;
  uint64_t v226;
  void *v227;
  float v228;
  void *v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t n;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t ii;
  uint64_t v239;
  void *v240;
  BWStillImageScalerNode *v241;
  uint64_t v242;
  id v243;
  BWStillImageConditionalRouterUBConfiguration *v244;
  BWStillImageConditionalRouterNode *v245;
  uint64_t v246;
  uint64_t v247;
  BWFormatRequirements *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t jj;
  void *v253;
  int v254;
  unsigned int v255;
  BWPortraitHDRStagingNode *v256;
  uint64_t v257;
  BWPortraitHDRStagingNode *v258;
  BWPipelineStage *v259;
  int v260;
  int v261;
  void *v262;
  BWInferenceNode *v263;
  BWInferenceNode *v264;
  __objc2_class **v265;
  uint64_t v266;
  objc_class *v267;
  uint64_t v268;
  uint64_t v269;
  BWPipelineStage *v270;
  BWFanOutNode *v271;
  uint64_t v272;
  int v273;
  BWAttachedMediaSplitNode *v274;
  BWAttachedMediaSplitNode *v275;
  BWInferenceNode *v276;
  float v277;
  float v278;
  unsigned int v279;
  uint64_t v280;
  char v281;
  uint64_t v282;
  uint64_t v283;
  BWFanOutNode *v284;
  unsigned int v285;
  uint64_t v286;
  BWStillImageFocusPixelDisparityNode *v287;
  void *v288;
  uint64_t v289;
  uint64_t v290;
  id v291;
  BWStillImageConditionalRouterNode *v292;
  __objc2_class **v293;
  char v294;
  void *v295;
  BWPipelineStage *v296;
  BWInferenceNode *v297;
  char v298;
  BWStillImageDisparitySplitterNode *v299;
  uint64_t v300;
  int v301;
  BWStillImageConditionalRouterNode *v302;
  BWStillImageMultiCameraDoserNode *v303;
  BWFunnelNode *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  BWStillImageMultiCameraDoserNode *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  BWStillImageDualPhotoFacePropagatorNode *v323;
  BWPipelineStage *v324;
  BWInferenceNode *v325;
  NSString *v326;
  NSString *v327;
  uint64_t v328;
  const __CFString *v329;
  float v330;
  float v331;
  unsigned int v332;
  uint64_t v333;
  char v334;
  unsigned int v335;
  objc_class *v336;
  uint64_t v337;
  char v338;
  int v339;
  BWDepthConverterNode *v340;
  BWInferenceSynchronizerNode *v341;
  BWStillImagePortraitMetadataNode *v342;
  double v343;
  BWStillImagePortraitMetadataNode *v344;
  int v345;
  BWInferenceNode *v346;
  char v347;
  int v348;
  BWMatteMediaSuppressionNode *v349;
  uint64_t v350;
  id v351;
  BWStillImageConditionalRouterNode *v352;
  BWInferenceNode *v353;
  BWInferenceNode *v354;
  float v355;
  int v356;
  BWStillImageFilterNode *v357;
  double v358;
  double v359;
  BWStillImageFilterNode *v360;
  BWStillImageTurnstileNode *v361;
  void *v362;
  float v363;
  void *v364;
  uint64_t kk;
  uint64_t v366;
  void *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t mm;
  uint64_t v372;
  void *v373;
  void *v374;
  float v375;
  void *v376;
  void *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t nn;
  const __CFString *v382;
  const __CFString *v383;
  void *v384;
  unsigned int v385;
  uint64_t v386;
  int v387;
  BWPipelineStage *v388;
  uint64_t v389;
  void *v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t i1;
  unsigned int v395;
  unsigned int v396;
  float v397;
  uint64_t v398;
  BWStillImageSampleBufferSinkNode *v399;
  void *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t i2;
  void *v405;
  void *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t i3;
  int v411;
  uint64_t v412;
  uint64_t v413;
  BWStillImageBravoDisparityNode *v414;
  char v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  int v421;
  void *v422;
  unsigned int v423;
  unsigned int v424;
  uint64_t v425;
  int v426;
  uint64_t v427;
  uint64_t v428;
  void *v429;
  uint64_t v430;
  unint64_t v431;
  BWPersonSemanticsConfiguration *v432;
  unsigned int v433;
  char v434;
  unsigned int v435;
  int v436;
  _BOOL4 v437;
  int v438;
  char v439;
  char v440;
  int v441;
  unsigned int v442;
  unsigned int v443;
  BWPipelineStage *v444;
  unint64_t Major;
  uint64_t v446;
  int v447;
  unsigned int v448;
  uint64_t v449;
  int v450;
  uint64_t v451;
  int v452;
  int v453;
  void *v454;
  BWPipelineStage *v455;
  int v456;
  int v457;
  unsigned int v458;
  int v459;
  int v460;
  unsigned int v461;
  unsigned int v462;
  uint64_t v463;
  _BOOL4 v464;
  BWPipelineStage *v465;
  int v466;
  int v467;
  void *v468;
  int v469;
  int v470;
  int v471;
  int v472;
  BWPipelineStage *v473;
  unsigned int v474;
  unsigned int v475;
  int v476;
  void *v477;
  unsigned int v478;
  void *v479;
  int v480;
  uint64_t v481;
  int v482;
  void *v483;
  BWStillImageNodeConfiguration *v484;
  _BOOL4 v485;
  int v486;
  _BOOL4 v487;
  uint64_t v488;
  id v489;
  unsigned int v490;
  id v491;
  unsigned int v492;
  uint64_t v493;
  void *v494;
  BWPipelineStage *v495;
  int v496;
  unsigned int v497;
  uint64_t v498;
  char *v499;
  SEL v500;
  SEL v501;
  uint64_t v502;
  _BOOL4 v503;
  void *v504;
  void *v505;
  void *v506;
  char v507;
  uint64_t v508;
  BWPipelineStage *v509;
  id obj;
  id obja;
  BWNodeOutput *objb;
  id objc;
  BWStillImageConditionalRouterUBConfiguration *objd;
  id obje;
  void *v516;
  _BOOL4 v517;
  BWFunnelNode *v518;
  uint64_t v519;
  FigCaptureCameraParameters *v520;
  uint64_t v521;
  uint64_t v522;
  int v523;
  id v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  objc_super v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  uint64_t v538;
  uint64_t v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  objc_super v552;
  objc_super v553;
  objc_super v554;
  objc_super v555;
  objc_super v556;
  objc_super v557;
  objc_super v558;
  objc_super v559;
  objc_super v560;
  objc_super v561;
  objc_super v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  objc_super v567;
  objc_super v568;
  objc_super v569;
  objc_super v570;
  objc_super v571;
  objc_super v572;
  objc_super v573;
  objc_super v574;
  objc_super v575;
  objc_super v576;
  objc_super v577;
  objc_super v578;
  objc_super v579;
  objc_super v580;
  objc_super v581;
  objc_super v582;
  objc_super v583;
  objc_super v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  objc_super v589;
  objc_super v590;
  __int128 v591;
  __int128 v592;
  __int128 v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  __int128 v598;
  objc_super v599;
  objc_super v600;
  __int128 v601;
  __int128 v602;
  __int128 v603;
  __int128 v604;
  objc_super v605;
  __int128 v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  objc_super v610;
  os_log_type_t type[8];
  uint64_t v612;
  objc_super v613;
  __int128 v614;
  __int128 v615;
  __int128 v616;
  __int128 v617;
  objc_super v618;
  __int128 v619;
  __int128 v620;
  __int128 v621;
  __int128 v622;
  objc_super v623;
  __int128 v624;
  __int128 v625;
  __int128 v626;
  __int128 v627;
  objc_super v628;
  objc_super v629;
  objc_super v630;
  __int128 v631;
  __int128 v632;
  __int128 v633;
  __int128 v634;
  __int128 v635;
  __int128 v636;
  __int128 v637;
  __int128 v638;
  id v639;
  unsigned int v640;
  _BYTE v641[128];
  _BYTE v642[128];
  _BYTE v643[128];
  _BYTE v644[128];
  _BYTE v645[128];
  _BYTE v646[128];
  _BYTE v647[128];
  _QWORD v648[2];
  _QWORD v649[2];
  _BYTE v650[128];
  _BYTE v651[128];
  _BYTE v652[128];
  _BYTE v653[128];
  _BYTE v654[128];
  _BYTE v655[128];
  _BYTE v656[128];
  _BYTE v657[128];
  const __CFString *v658;
  uint64_t v659[2];
  int v660;
  uint64_t v661[16];
  _BYTE v662[128];
  _BYTE v663[128];
  uint64_t v664;
  uint64_t v665;
  _QWORD v666[2];
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  uint64_t v670;
  uint64_t v671;
  _QWORD v672[4];

  result = MEMORY[0x1E0C80A78](a1, a2, a3, a4);
  v446 = v17;
  v479 = v18;
  v483 = v19;
  v672[1] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = result;
  v640 = 0;
  v639 = 0;
  objc_msgSend(v13, "sinkConfiguration");
  objc_opt_class();
  v25 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = (void *)objc_msgSend(v23, "sinkConfiguration");
  if (objc_msgSend(v25, "depthDataDeliveryEnabled") && objc_msgSend(v23, "deviceType") == 9)
    goto LABEL_669;
  obj = v22;
  *(_DWORD *)(v24 + 48) = objc_msgSend(v23, "pipelineStagePriority");
  *(_DWORD *)(v24 + 52) = objc_msgSend(v23, "inferencePriority");
  v26 = objc_alloc_init(BWStillImageNodeConfiguration);
  -[BWStillImageNodeConfiguration setStillImageProcessingMode:](v26, "setStillImageProcessingMode:", objc_msgSend(v23, "stillImageSinkPipelineProcessingMode"));
  -[BWStillImageNodeConfiguration setMetalCommandQueue:](v26, "setMetalCommandQueue:", (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice"), "newCommandQueueWithMaxCommandBufferCount:", 512));
  objc_msgSend(v23, "pipelineStagePriority");
  v27 = FigDispatchQueueCreateWithPriority();
  -[MTLCommandQueue setCompletionQueue:](-[BWStillImageNodeConfiguration metalCommandQueue](v26, "metalCommandQueue"), "setCompletionQueue:", v27);
  dispatch_release(v27);
  -[BWStillImageNodeConfiguration setFigThreadPriority:](v26, "setFigThreadPriority:", *(unsigned int *)(v24 + 48));
  -[BWStillImageNodeConfiguration setDepthDataType:](v26, "setDepthDataType:", objc_msgSend(v23, "depthDataType"));
  -[BWStillImageNodeConfiguration setPearlModuleType:](v26, "setPearlModuleType:", objc_msgSend(v23, "pearlModuleType"));
  -[BWStillImageNodeConfiguration setInferenceScheduler:](v26, "setInferenceScheduler:", a9);
  v484 = v26;
  -[BWStillImageNodeConfiguration setMaxLossyCompressionLevel:](v26, "setMaxLossyCompressionLevel:", objc_msgSend(v23, "maxLossyCompressionLevel"));
  v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", obj);
  v29 = 0;
  v467 = objc_msgSend(v23, "depthDataType");
  if (v467 == 7)
  {
    v30 = *MEMORY[0x1E0D05A20];
    v31 = objc_msgSend(obj, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A20]);
    v671 = v30;
    v672[0] = v31;
    v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v672, &v671, 1);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", 0, v30);
  }
  v499 = (char *)v28;
  v32 = (void *)objc_msgSend(v28, "allKeys");
  v33 = objc_msgSend(obj, "allKeys");
  v489 = v32;
  v430 = v21;
  if ((unint64_t)objc_msgSend(obj, "count") >= 2)
  {
    switch(objc_msgSend(v23, "deviceType"))
    {
      case 4u:
        v34 = *MEMORY[0x1E0D05A18];
        v670 = *MEMORY[0x1E0D05A30];
        v35 = (void *)MEMORY[0x1E0C99D20];
        v36 = &v670;
        goto LABEL_15;
      case 6u:
        v34 = *MEMORY[0x1E0D05A38];
        v505 = (void *)*MEMORY[0x1E0D05A40];
        v669 = *MEMORY[0x1E0D05A40];
        v38 = (void *)MEMORY[0x1E0C99D20];
        v39 = &v669;
        goto LABEL_20;
      case 8u:
        v34 = *MEMORY[0x1E0D05A28];
        v667 = *MEMORY[0x1E0D05A18];
        v35 = (void *)MEMORY[0x1E0C99D20];
        v36 = &v667;
LABEL_15:
        v40 = 1;
        goto LABEL_17;
      case 9u:
        v34 = *MEMORY[0x1E0D05A18];
        v41 = *MEMORY[0x1E0D05A30];
        v666[0] = *MEMORY[0x1E0D05A28];
        v666[1] = v41;
        v35 = (void *)MEMORY[0x1E0C99D20];
        v36 = v666;
        v40 = 2;
LABEL_17:
        v37 = objc_msgSend(v35, "arrayWithObjects:count:", v36, v40);
        v505 = 0;
        v494 = (void *)v37;
        goto LABEL_21;
      case 0xCu:
        v34 = *MEMORY[0x1E0D05A50];
        v505 = (void *)*MEMORY[0x1E0D05A40];
        v668 = *MEMORY[0x1E0D05A40];
        v38 = (void *)MEMORY[0x1E0C99D20];
        v39 = &v668;
        goto LABEL_20;
      case 0xDu:
        v34 = *MEMORY[0x1E0D05A18];
        v505 = (void *)*MEMORY[0x1E0D05A20];
        v665 = *MEMORY[0x1E0D05A20];
        v38 = (void *)MEMORY[0x1E0C99D20];
        v39 = &v665;
LABEL_20:
        v494 = (void *)objc_msgSend(v38, "arrayWithObjects:count:", v39, 1);
        v37 = 0;
LABEL_21:
        v42 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
        v43 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v44 = v43;
        if (v34)
          objc_msgSend(v43, "addObject:", v34);
        if (v37)
          objc_msgSend(v44, "addObjectsFromArray:", v37);
        if (v505)
          objc_msgSend(v44, "addObject:");
        if ((objc_msgSend(v42, "isEqualToSet:", v44) & 1) != 0)
          goto LABEL_28;
        goto LABEL_669;
      default:
        goto LABEL_669;
    }
  }
  v34 = objc_msgSend(v32, "firstObject");
  v664 = v34;
  v494 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v664, 1);
  if (!v34)
    goto LABEL_669;
  v505 = 0;
  v37 = 0;
LABEL_28:
  v427 = v20;
  v428 = v33;
  v422 = (void *)v29;
  v491 = (id)v37;
  v481 = v34;
  v468 = v25;
  v493 = v24;
  v45 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v46 = (void *)objc_msgSend(v23, "sensorIDStringsByPortType");
  v516 = (void *)objc_msgSend(v23, "cameraInfoByPortType");
  v47 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v517 = FigCaptureVideoDimensionsAreValid(objc_msgSend(v23, "outputStillImageDimensions"));
  v485 = FigCaptureVideoDimensionsAreValid(objc_msgSend(v23, "gdcInDCProcessorOutputCropDimensions"));
  v635 = 0u;
  v636 = 0u;
  v637 = 0u;
  v638 = 0u;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v635, v663, 16);
  v524 = v47;
  v520 = v45;
  if (v48)
  {
    v49 = v48;
    v508 = 0;
    v50 = 0;
    v51 = *(_QWORD *)v636;
    v522 = *MEMORY[0x1E0D05A40];
    v502 = *MEMORY[0x1E0D05A20];
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v636 != v51)
          objc_enumerationMutation(obj);
        v53 = *(void **)(*((_QWORD *)&v635 + 1) + 8 * i);
        v54 = objc_msgSend(v46, "objectForKeyedSubscript:", v53);
        v55 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v53, v54, -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](v45, "sensorIDDictionaryForPortType:sensorIDString:", v53, v54), objc_msgSend(v516, "objectForKeyedSubscript:", v53));
        v47 = v524;
        objc_msgSend(v524, "setObject:forKeyedSubscript:", v55, v53);
        if (v517
          && (objc_msgSend(v53, "isEqualToString:", v522) & 1) == 0
          && (objc_msgSend(v53, "isEqualToString:", v502) & 1) == 0)
        {
          v56 = (void *)objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v53), "formatRequirements");
          v57 = FigCaptureVideoDimensionsAreValid(v50 | (v508 << 32));
          v58 = objc_msgSend(v56, "width");
          v59 = v58;
          if (v57)
          {
            v47 = v524;
            if (v50 != v58 || v508 != objc_msgSend(v56, "height"))
              goto LABEL_685;
          }
          else
          {
            v60 = v58;
            v61 = objc_msgSend(v56, "height");
            v62 = FigCaptureVideoDimensionsAreValid(v60 | ((unint64_t)v61 << 32));
            v47 = v524;
            if (!v62)
              goto LABEL_685;
            v508 = v61;
            v50 = v59;
          }
        }
        v45 = v520;
      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v635, v663, 16);
    }
    while (v49);
  }
  else
  {
    LODWORD(v508) = 0;
    LODWORD(v50) = 0;
  }
  v523 = v50;
  v63 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v631 = 0u;
  v632 = 0u;
  v633 = 0u;
  v634 = 0u;
  v64 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v631, v662, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v632;
    do
    {
      for (j = 0; j != v65; ++j)
      {
        if (*(_QWORD *)v632 != v66)
          objc_enumerationMutation(v47);
        v68 = *(_QWORD *)(*((_QWORD *)&v631 + 1) + 8 * j);
        if (objc_msgSend(v494, "containsObject:", v68))
          objc_msgSend(v63, "setObject:forKeyedSubscript:", objc_msgSend(v47, "objectForKeyedSubscript:", v68), v68);
      }
      v65 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v631, v662, 16);
    }
    while (v65);
  }
  v451 = objc_msgSend(v494, "firstObject");
  v477 = (void *)objc_msgSend(v63, "objectForKeyedSubscript:");
  v463 = objc_msgSend(v499, "objectForKeyedSubscript:", v505);
  v476 = objc_msgSend(v505, "isEqualToString:", *MEMORY[0x1E0D05A40]);
  v454 = v63;
  v503 = objc_msgSend(v23, "depthDataType") == 3 && objc_msgSend(v23, "pearlModuleType") == 2;
  v69 = objc_msgSend(v468, "bravoConstituentPhotoDeliveryEnabled");
  v70 = objc_msgSend(v23, "deferredProcessingSupported");
  v71 = objc_msgSend(v23, "stillImageSinkPipelineProcessingMode");
  v72 = objc_msgSend(v468, "depthDataDeliveryEnabled");
  v73 = objc_msgSend(v23, "depthDataType");
  v469 = objc_msgSend(v468, "filterRenderingEnabled");
  v74 = 0.0;
  v490 = v72;
  if (v72)
  {
    objc_msgSend(v483, "requestedZoomFactorRelativeToPortType:", objc_msgSend(v477, "portType"));
    v74 = v75;
  }
  if (objc_msgSend(v23, "highQualityPhotoCaptureForVideoFormatEnabled"))
  {
    if (v72 | v69)
      v76 = 0;
    else
      v76 = 2;
  }
  else
  {
    v76 = objc_msgSend(v23, "stillImageStabilizationSupported");
  }
  v77 = objc_msgSend(v23, "learnedNRSupported");
  v442 = v77;
  if (v76 == 2)
    v78 = v77;
  else
    v78 = 0;
  v79 = objc_msgSend(v23, "deepFusionSupported");
  v461 = v76;
  if (v76 == 1)
    v80 = 1;
  else
    v80 = (v76 == 2) ^ v78;
  v462 = v78;
  v81 = (v79 | v78) ^ 1;
  if (v71 != 1)
    v81 = 1;
  v470 = v81;
  v82 = objc_msgSend(v468, "digitalFlashCaptureEnabled");
  v480 = objc_msgSend(v23, "depthDataType");
  v478 = objc_msgSend(v468, "portraitEffectsMatteDeliveryEnabled");
  v443 = v70;
  v83 = (v478 & 1) != 0 || objc_msgSend((id)objc_msgSend(v23, "enabledSemanticSegmentationMatteURNs"), "count") != 0;
  v487 = v83;
  if (-[FigCaptureCameraParameters personSemanticsVersion](v520, "personSemanticsVersion"))
    v84 = -[FigCaptureCameraParameters personSemanticsVersion](v520, "personSemanticsVersion");
  else
    v84 = 3;
  Major = BWInferenceVersionMakeMajor(v84);
  v431 = Major >> 16;
  if (v487)
  {
    v85 = -[BWInferenceConfiguration initWithInferenceType:]([BWPersonSemanticsConfiguration alloc], "initWithInferenceType:", 104);
    -[BWInferenceConfiguration setPriority:](v85, "setPriority:", *(unsigned int *)(v493 + 52));
    if (v478)
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v85, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v85, "enabledSemantics") | 1);
    v86 = (void *)objc_msgSend(v23, "enabledSemanticSegmentationMatteURNs");
    if (objc_msgSend(v86, "containsObject:", *MEMORY[0x1E0D09288]))
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v85, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v85, "enabledSemantics") | 2);
    v87 = (void *)objc_msgSend(v23, "enabledSemanticSegmentationMatteURNs");
    if (objc_msgSend(v87, "containsObject:", *MEMORY[0x1E0D09290]))
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v85, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v85, "enabledSemantics") | 8);
    v88 = (void *)objc_msgSend(v23, "enabledSemanticSegmentationMatteURNs");
    if (objc_msgSend(v88, "containsObject:", *MEMORY[0x1E0D092A0]))
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v85, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v85, "enabledSemantics") | 0x10);
    v89 = v85;
    v90 = (void *)objc_msgSend(v23, "supportedSemanticSegmentationMatteURNs");
    v91 = *MEMORY[0x1E0D09280];
    if (!objc_msgSend(v90, "containsObject:", *MEMORY[0x1E0D09280]))
      goto LABEL_94;
    if ((Major & 0xFFFC) == 0)
    {
      v92 = BWInferenceVersionMakeMajor(4);
      v431 = v92 >> 16;
      LOWORD(Major) = v92;
    }
    if (objc_msgSend((id)objc_msgSend(v23, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v91))
    {
      v93 = v89;
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v89, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v89, "enabledSemantics") | 0x20);
    }
    else
    {
LABEL_94:
      v93 = v89;
    }
  }
  else
  {
    v93 = 0;
  }
  v459 = v73;
  v432 = v93;
  if (v490)
  {
    v94 = objc_msgSend(v477, "portType");
    v95 = objc_msgSend(v477, "sensorIDString");
    v96 = v520;
    *(float *)&v97 = v74;
    v435 = -[FigCaptureCameraParameters sdofRenderingVersionForPortType:sensorIDString:zoomFactor:](v520, "sdofRenderingVersionForPortType:sensorIDString:zoomFactor:", v94, v95, v97);
  }
  else
  {
    v435 = 0;
    v96 = v520;
  }
  v98 = -[FigCaptureCameraParameters learnedMattingVersion](v96, "learnedMattingVersion");
  v457 = v490 & v469;
  v436 = v98;
  if ((v487 & v490) == 1)
  {
    if (v98 <= 0 || v467 == 7)
      v100 = v490 & v469;
    else
      v100 = 1;
    v450 = v100;
  }
  else
  {
    v450 = 0;
  }
  v101 = v491;
  v472 = v71;
  if (objc_msgSend(v23, "clientIsCameraOrDerivative"))
  {
    v102 = objc_msgSend(v23, "stillImageStabilizationSupported");
    if (v480 == 2)
      v103 = 0;
    else
      v103 = v102;
    v447 = v103;
  }
  else
  {
    v447 = 0;
  }
  if (v491)
    v104 = v490;
  else
    v104 = 0;
  if (objc_msgSend(v23, "allowsMultipleInflightCaptures"))
  {
    v488 = 1;
    if (objc_msgSend(v23, "responsiveShutterSupported"))
    {
      if (objc_msgSend(v23, "responsiveShutterEnabled"))
        v105 = 2;
      else
        v105 = 1;
      v488 = v105;
    }
    if (objc_msgSend(v23, "clientIsCameraOrDerivative"))
    {
      if (objc_msgSend(v23, "responsiveShutterSupported"))
        v106 = v488;
      else
        v106 = 2;
      v488 = v106;
    }
  }
  else
  {
    v488 = 0;
  }
  v482 = objc_msgSend(v23, "redEyeReductionVersion");
  if (v482 > 0)
    v107 = v69;
  else
    v107 = 0;
  if (v487)
  {
    v108 = -[FigCaptureCameraParameters mattingVersionForPortType:sensorIDString:](v520, "mattingVersionForPortType:sensorIDString:", objc_msgSend(v477, "portType"), objc_msgSend(v477, "sensorIDString"));
    if (v108)
      v109 = 0;
    else
      v109 = v478;
    if (v109 == 1)
      goto LABEL_138;
    v110 = v108;
    if (objc_msgSend((id)objc_msgSend(v23, "enabledSemanticSegmentationMatteURNs"), "count"))
    {
      v101 = v491;
      if (v110 <= 1)
      {
LABEL_138:
        v640 = FigSignalErrorAt();
        goto LABEL_685;
      }
    }
    else
    {
      v101 = v491;
    }
  }
  else
  {
    v110 = 0;
  }
  v424 = v110;
  if (v490)
  {
    v111 = objc_msgSend(v477, "portType");
    v101 = v491;
    v112 = objc_msgSend(v477, "sensorIDString");
    *(float *)&v113 = v74;
    v114 = -[FigCaptureCameraParameters disparityRefinementTypeForPortType:sensorIDString:zoomFactor:](v520, "disparityRefinementTypeForPortType:sensorIDString:zoomFactor:", v111, v112, v113);
  }
  else
  {
    v114 = 0;
  }
  v426 = v107;
  v115 = v478;
  if (v114 != 1)
    v115 = 0;
  v433 = v115;
  if (v476)
    v116 = -[FigCaptureCameraParameters personSemanticsVersion](v520, "personSemanticsVersion") > 4 && v503;
  else
    v116 = 0;
  v117 = v104 ^ 1;
  if (v480 == 2)
    v117 = 1;
  v440 = v117;
  v439 = objc_msgSend(v23, "allowedToModifyInputBuffers");
  v118 = objc_msgSend(v23, "semanticRenderingVersion");
  v504 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v452 = v118;
  if (v118)
    v458 = objc_msgSend(v23, "semanticDevelopmentVersion");
  else
    v458 = 0;
  v466 = objc_msgSend(v468, "demosaicedRawEnabled");
  if (v466)
    objc_msgSend(v504, "setObject:forKeyedSubscript:", BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw(), &unk_1E49F9B70);
  if (v116)
  {
    v119 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v119, "addObject:", 0x1E49511B8);
    objc_msgSend(v119, "addObjectsFromArray:", BWInferenceLowResPersonInstanceMaskKeys());
    objc_msgSend(v504, "setObject:forKeyedSubscript:", v119, &unk_1E49F9B88);
  }
  v453 = v80;
  if (objc_msgSend((id)objc_msgSend(v23, "portTypesWithGeometricDistortionCorrectionEnabled"), "count"))
  {
    if (((v490 ^ 1 | v69) & 1) != 0)
      v120 = 1;
    else
      v120 = objc_msgSend((id)objc_msgSend(v23, "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", v451);
    v121 = objc_msgSend(v23, "gdcInDCProcessorSupported") & v120;
  }
  else
  {
    v121 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(v23, "portTypesWithIntelligentDistortionCorrectionEnabled"), "count"))
    v122 = 1;
  else
    v122 = v121;
  v441 = v122;
  v438 = v517 & v121;
  if (v523 >= (int)objc_msgSend(v23, "rawSensorDimensions")
    && ((int)v508 >= (int)((unint64_t)objc_msgSend(v23, "rawSensorDimensions") >> 32)
      ? (v123 = v517 & v121)
      : (v123 = 0),
        v123 == 1))
  {
    if (v485)
      v124 = objc_msgSend(v23, "gdcInDCProcessorOutputCropDimensions");
    else
      v124 = objc_msgSend(v23, "outputStillImageDimensions");
    v425 = v124;
  }
  else
  {
    v425 = 0;
  }
  if (objc_msgSend(v23, "clientIsCameraOrDerivative")
    && +[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
  {
    v434 = objc_msgSend(v23, "captureTimePhotosCurationSupported");
  }
  else
  {
    v434 = 0;
  }
  v474 = v82 & v470;
  if (v487 && (objc_msgSend(v23, "clientIsCameraOrDerivative") & 1) == 0)
  {
    if (v69)
      v125 = 8 * objc_msgSend(v499, "count");
    else
      v125 = 8;
    v423 = v125 - 1;
  }
  else
  {
    v423 = 0;
  }
  v460 = v121;
  v486 = v69 | v104;
  v437 = v116;
  if ((_DWORD)v488 == 2)
    v448 = objc_msgSend(v23, "responsiveShutterSupported");
  else
    v448 = 0;
  objc_msgSend(v483, "setStillImageCaptureEnabled:", 1);
  objc_msgSend(v483, "setIrisFrameHarvestingEnabled:", objc_msgSend(v468, "irisFrameHarvestingEnabled"));
  objc_msgSend(v483, "setStillImageFusionScheme:", objc_msgSend(v23, "noiseReductionAndFusionScheme"));
  objc_msgSend(v483, "setUnifiedBracketingMode:", v461);
  objc_msgSend(v483, "setSifrStillImageCaptureEnabledIfAvailable:", objc_msgSend(v23, "sifrStillImageCaptureEnabledIfAvailable"));
  objc_msgSend(v483, "setDeepFusionEnabled:", objc_msgSend(v23, "deepFusionSupported"));
  objc_msgSend(v483, "setLearnedNRMode:", v462);
  objc_msgSend(v483, "setDigitalFlashEnabled:", v474);
  objc_msgSend(v483, "setRedSaturationMitigationEnabled:", objc_msgSend(v468, "optimizesImagesForOfflineVideoStabilization") ^ 1);
  objc_msgSend(v483, "registerForAEMatrixMetadata");
  objc_msgSend(v483, "setRedEyeReductionEnabled:", v482 > 0);
  if (v101)
    v126 = v490 & (v69 ^ 1);
  else
    v126 = 0;
  v421 = v126;
  objc_msgSend(v483, "setDisparityGenerationFromReferenceFramesSupported:");
  objc_msgSend(v483, "setSupplementalPointCloudCaptureDevice:", v479);
  v127 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage"), *(unsigned int *)(v493 + 48));
  v128 = v127;
  if (v486)
  {
    v473 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.ub.default"), *(unsigned int *)(v493 + 48));
    v444 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.ub.telephoto"), *(unsigned int *)(v493 + 48));
    v465 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.multi"), *(unsigned int *)(v493 + 48));
    v495 = v128;
    v455 = v128;
  }
  else
  {
    v495 = v127;
    v473 = v127;
    v444 = v127;
    v465 = v127;
    v455 = v127;
    if ((_DWORD)v488 == 2)
    {
      v455 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.scale-and-encode"), *(unsigned int *)(v493 + 48));
      if (v448)
        v495 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.buffer-servicing"), *(unsigned int *)(v493 + 48));
      else
        v495 = v128;
      v473 = v128;
      v444 = v128;
      v465 = v128;
    }
  }
  v129 = a11;
  v456 = v69;
  v509 = v128;
  if (dword_1ECFE9A90)
  {
    LODWORD(v612) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v129 = a11;
  }
  v131 = &classRef_BWStillImageCameraCalibrationDataNode;
  if (v463)
  {
    v132 = [BWAttachedMediaSplitNode alloc];
    v658 = CFSTR("Depth");
    v133 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v132, "initWithAttachedMediaKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v658, 1));
    v630.receiver = (id)v493;
    v630.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    v134 = v499;
    if ((objc_msgSendSuper2(&v630, sel_addNode_error_, v133, &v639) & 1) == 0
      || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v463, -[BWNode input](v133, "input"), v495) & 1) == 0)
    {
      goto LABEL_684;
    }
    v135 = (void *)v493;
    -[BWNode setName:](v133, "setName:", CFSTR("Still Image IR-Depth Splitter"));
    -[BWAttachedMediaSplitNode setEmitsNodeErrorsForMissingAttachedMedia:](v133, "setEmitsNodeErrorsForMissingAttachedMedia:", 1);
    v136 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v133, "outputs"), "objectAtIndexedSubscript:", 0);
    v129 = a11;
  }
  else
  {
    v135 = (void *)v493;
    v136 = 0;
    v134 = v499;
  }
  v471 = v453 & v470;
  obja = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v134, "count", v416, v418));
  v429 = (void *)objc_msgSend(v479, "cameraInfoByPortType");
  if (objc_msgSend(v23, "stillImageSinkPipelineProcessingMode")
    && objc_msgSend(v23, "stillImageSinkPipelineProcessingMode") != 2)
  {
    obja = (id)objc_msgSend(v134, "mutableCopy");
    if (v505)
    {
      v500 = (SEL)objc_msgSend(v134, "objectForKeyedSubscript:");
      v496 = 0;
    }
    else
    {
      v496 = 0;
      v500 = 0;
    }
    v153 = v135;
  }
  else
  {
    if (objc_msgSend(v23, "stillImageSinkPipelineProcessingMode"))
    {
      v137 = 0;
      v138 = (void *)v493;
      v139 = v489;
    }
    else
    {
      v139 = v489;
      v137 = -[BWStillImageCoordinatorNode initWithCaptureDevice:inputPortTypes:sensorRawInputPortTypes:highResStillImageDimensions:]([BWStillImageCoordinatorNode alloc], "initWithCaptureDevice:inputPortTypes:sensorRawInputPortTypes:highResStillImageDimensions:", v483, v489, 0, v430);
      v629.receiver = (id)v493;
      v629.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v629, sel_addNode_error_, v137, &v639) & 1) == 0)
        goto LABEL_684;
      -[BWNode setName:](v137, "setName:", CFSTR("Still Image Coordinator"));
      -[BWStillImageCoordinatorNode setStillImageCaptureStatusDelegate:](v137, "setStillImageCaptureStatusDelegate:", v427);
      -[BWStillImageCoordinatorNode setResponsiveShutterEnabled:](v137, "setResponsiveShutterEnabled:", v448);
      if (objc_msgSend(v23, "responsiveShutterSupported"))
        v140 = objc_msgSend(v23, "responsiveShutterEnabled");
      else
        v140 = 0;
      -[BWStillImageCoordinatorNode setResponsiveShutterEnabledViaAPI:](v137, "setResponsiveShutterEnabledViaAPI:", v140);
      -[BWStillImageCoordinatorNode setFastCapturePrioritizationEnabled:](v137, "setFastCapturePrioritizationEnabled:", objc_msgSend(v23, "fastCapturePrioritizationEnabled"));
      -[BWStillImageCoordinatorNode setStillImageCapturePipeliningMode:](v137, "setStillImageCapturePipeliningMode:", v488);
      -[BWStillImageCoordinatorNode setCinematicFramingWarpingRequired:](v137, "setCinematicFramingWarpingRequired:", objc_msgSend(v23, "cinematicFramingWarpingRequired"));
      if ((_DWORD)v488 == 1)
        -[BWStillImageCoordinatorNode setMaxNumberOfBurstCapturesAllowedInFlight:](v137, "setMaxNumberOfBurstCapturesAllowedInFlight:", 2);
      v138 = (void *)v493;
      *(_QWORD *)(v493 + 56) = v137;
    }
    v141 = -[BWStillImageFrameCoordinatorNode initWithNodeConfiguration:inputPortTypes:sensorRawInputPortTypes:]([BWStillImageFrameCoordinatorNode alloc], "initWithNodeConfiguration:inputPortTypes:sensorRawInputPortTypes:", v484, v139, 0);
    v628.receiver = v138;
    v628.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v628, sel_addNode_error_, v141, &v639) & 1) == 0)
      goto LABEL_684;
    -[BWNode setName:](v141, "setName:", CFSTR("Still Image Frame Coordinator"));
    v627 = 0u;
    v626 = 0u;
    v625 = 0u;
    v624 = 0u;
    v142 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v624, v657, 16);
    if (v142)
    {
      v143 = v142;
      v144 = *(_QWORD *)v625;
      do
      {
        for (k = 0; k != v143; ++k)
        {
          if (*(_QWORD *)v625 != v144)
            objc_enumerationMutation(v134);
          v146 = *(void **)(*((_QWORD *)&v624 + 1) + 8 * k);
          v147 = objc_msgSend(v134, "objectForKeyedSubscript:", v146);
          if (objc_msgSend(v146, "isEqualToString:", v505))
            v147 = v136;
          if (v137)
          {
            if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v147, -[BWStillImageCoordinatorNode inputForPortType:](v137, "inputForPortType:", v146), v495) & 1) == 0)goto LABEL_684;
            v134 = v499;
            if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[BWStillImageCoordinatorNode outputForPortType:](v137, "outputForPortType:", v146), -[BWStillImageFrameCoordinatorNode inputForPortType:](v141, "inputForPortType:", v146), v509) & 1) == 0)goto LABEL_684;
          }
          else if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v147, -[BWStillImageFrameCoordinatorNode inputForPortType:](v141, "inputForPortType:", v146), v509) & 1) == 0)
          {
            goto LABEL_684;
          }
          objc_msgSend(obja, "setObject:forKeyedSubscript:", -[BWStillImageFrameCoordinatorNode outputForPortType:](v141, "outputForPortType:", v146), v146);
        }
        v143 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v624, v657, 16);
      }
      while (v143);
    }
    v500 = -[BWStillImageFrameCoordinatorNode outputForPortType:](v141, "outputForPortType:", v505);
    v148 = objc_alloc_init(FigCaptureIrisPreparedSettings);
    v149 = objc_msgSend(v23, "deepFusionSupported");
    if (v471)
      v150 = 2;
    else
      v150 = 1;
    if (v149)
      v151 = 3;
    else
      v151 = v150;
    -[FigCaptureIrisPreparedSettings setQualityPrioritization:](v148, "setQualityPrioritization:", v151);
    -[FigCaptureIrisPreparedSettings setDigitalFlashMode:](v148, "setDigitalFlashMode:", v474);
    v659[1] = 0;
    v659[0] = 0;
    v660 = 0;
    +[BWStillImageCoordinatorNode worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:stillImageCaptureSettings:captureDevice:](BWStillImageCoordinatorNode, "worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:stillImageCaptureSettings:captureDevice:", v148, 0, v483);
    v152 = v659[0];
    if (SLODWORD(v659[0]) <= SHIDWORD(v659[0]))
      v152 = HIDWORD(v659[0]);
    v496 = v152;
    v153 = (void *)v493;
    v47 = v524;
    v128 = v509;
    v129 = a11;
    v131 = &classRef_BWStillImageCameraCalibrationDataNode;
    v101 = v491;
  }
  v464 = v101 == 0;
  if (v101)
    v154 = v486;
  else
    v154 = 1;
  v155 = obja;
  if ((v154 & 1) == 0)
  {
    v156 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", 1986618469, objc_msgSend(v134, "count"));
    v157 = (objc_class *)v131[50];
    v623.receiver = v153;
    v623.super_class = v157;
    if ((objc_msgSendSuper2(&v623, sel_addNode_error_, v156, &v639) & 1) == 0)
      goto LABEL_684;
    v622 = 0u;
    v621 = 0u;
    v620 = 0u;
    v619 = 0u;
    v158 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v619, v656, 16);
    if (v158)
    {
      v159 = v158;
      v160 = 0;
      v161 = *(_QWORD *)v620;
LABEL_256:
      v162 = 0;
      while (1)
      {
        if (*(_QWORD *)v620 != v161)
          objc_enumerationMutation(v134);
        if (!objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v619 + 1) + 8 * v162)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v156, "inputs"), "objectAtIndexedSubscript:", (v160 + v162)), v509))goto LABEL_684;
        if (v159 == ++v162)
        {
          v159 = objc_msgSend(v134, "countByEnumeratingWithState:objects:count:", &v619, v656, 16);
          v160 += v162;
          if (v159)
            goto LABEL_256;
          break;
        }
      }
    }
    objc_msgSend(obja, "setObject:forKeyedSubscript:", -[BWNode output](v156, "output"), v481);
    v47 = v524;
    v128 = v509;
    v129 = a11;
    v131 = &classRef_BWStillImageCameraCalibrationDataNode;
    v101 = v491;
    v153 = (void *)v493;
  }
  v163 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v164 = objc_alloc_init(BWPixelTransferNode);
  -[BWNode setName:](v164, "setName:", CFSTR("Still Image Format Converter"));
  -[BWPixelTransferNode setOutputColorSpaceProperties:](v164, "setOutputColorSpaceProperties:", objc_msgSend(v23, "outputColorSpaceProperties"));
  -[BWPixelTransferNode setCropMode:](v164, "setCropMode:", 3);
  -[BWPixelTransferNode setMaxInputLossyCompressionLevel:](v164, "setMaxInputLossyCompressionLevel:", 3);
  -[BWPixelTransferNode setMaxOutputLossyCompressionLevel:](v164, "setMaxOutputLossyCompressionLevel:", objc_msgSend(v23, "maxLossyCompressionLevel"));
  -[BWPixelTransferNode setConversionMethodForStillImagesDuringHDRVideos:](v164, "setConversionMethodForStillImagesDuringHDRVideos:", 1);
  v506 = v163;
  objc_msgSend(v163, "addObject:", v164);
  if (v482 == 1)
  {
    v165 = (objc_class *)v131[50];
    v618.receiver = v153;
    v618.super_class = v165;
    if ((objc_msgSendSuper2(&v618, sel_addNode_error_, v164, &v639) & 1) == 0
      || (objc_msgSend(v129, "connectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", v481), -[BWNode input](v164, "input"), v128) & 1) == 0)
    {
      goto LABEL_684;
    }
    objc_msgSend(obja, "setObject:forKeyedSubscript:", -[BWNode output](v164, "output"), v481);
    if (v486)
    {
      v617 = 0u;
      v616 = 0u;
      v615 = 0u;
      v614 = 0u;
      v166 = objc_msgSend(v491, "countByEnumeratingWithState:objects:count:", &v614, v655, 16);
      if (v166)
      {
        v167 = v166;
        v168 = *(_QWORD *)v615;
LABEL_269:
        v169 = 0;
        while (1)
        {
          if (*(_QWORD *)v615 != v168)
            objc_enumerationMutation(v491);
          v170 = *(void **)(*((_QWORD *)&v614 + 1) + 8 * v169);
          v171 = objc_alloc_init(BWPixelTransferNode);
          -[BWNode setName:](v171, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Format Converter"), BWPortTypeToDisplayString(v170, v172)));
          -[BWPixelTransferNode setOutputColorSpaceProperties:](v171, "setOutputColorSpaceProperties:", objc_msgSend(v23, "outputColorSpaceProperties"));
          -[BWPixelTransferNode setCropMode:](v171, "setCropMode:", 3);
          -[BWPixelTransferNode setMaxLossyCompressionLevel:](v171, "setMaxLossyCompressionLevel:", objc_msgSend(v23, "maxLossyCompressionLevel"));
          v613.receiver = (id)v493;
          v613.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v613, sel_addNode_error_, v171, &v639) & 1) == 0
            || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", v170), -[BWNode input](v171, "input"), v509) & 1) == 0)
          {
            goto LABEL_684;
          }
          objc_msgSend(obja, "setObject:forKeyedSubscript:", -[BWNode output](v171, "output"), v170);
          objc_msgSend(v506, "addObject:", v171);
          if (v167 == ++v169)
          {
            v167 = objc_msgSend(v491, "countByEnumeratingWithState:objects:count:", &v614, v655, 16);
            if (v167)
              goto LABEL_269;
            break;
          }
        }
      }
    }
    v101 = v491;
    if ((unint64_t)objc_msgSend(v491, "count") >= 2)
    {
      v419 = v11;
      LODWORD(v417) = 0;
      FigDebugAssert3();
    }
    v173 = objc_msgSend(v491, "firstObject", v417, v419);
    v659[0] = 0;
    v661[0] = 0;
    v153 = (void *)v493;
    v128 = v509;
    v129 = a11;
    v47 = v524;
    v640 = -[FigCaptureStillImageUnifiedBracketingSinkPipeline _buildRedEyeReductionSubPipelineWithName:pipelineStage:graph:sensorConfigurationsByPortType:inferenceScheduler:subPipelineInputOut:subPipelineOutputOut:](v493, (uint64_t)CFSTR("Default"), (uint64_t)v509, a11, (uint64_t)v524, a9, v659, v661);
    if (v640)
      goto LABEL_684;
    if (v426)
    {
      v612 = 0;
      *(_QWORD *)type = 0;
      v640 = -[FigCaptureStillImageUnifiedBracketingSinkPipeline _buildRedEyeReductionSubPipelineWithName:pipelineStage:graph:sensorConfigurationsByPortType:inferenceScheduler:subPipelineInputOut:subPipelineOutputOut:](v493, (uint64_t)CFSTR("Secondary"), (uint64_t)v444, a11, (uint64_t)v524, a9, &v612, (uint64_t *)type);
      if (v640)
        goto LABEL_684;
      v155 = obja;
      v174 = objc_msgSend(obja, "objectForKeyedSubscript:", v481);
      if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v174, v659[0], v509) & 1) == 0)
        goto LABEL_684;
      objc_msgSend(obja, "setObject:forKeyedSubscript:", v661[0], v481);
      v175 = objc_msgSend(obja, "objectForKeyedSubscript:", v173);
      if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v175, v612, v444) & 1) == 0)
        goto LABEL_684;
      v176 = *(_QWORD *)type;
    }
    else
    {
      if ((v486 & 1) == 0)
      {
        v155 = obja;
        v180 = objc_msgSend(obja, "objectForKeyedSubscript:", v481);
        if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v180, v659[0], v509) & 1) == 0)
          goto LABEL_684;
        v176 = v661[0];
        v178 = obja;
        v179 = v481;
        goto LABEL_291;
      }
      v155 = obja;
      v177 = objc_msgSend(obja, "objectForKeyedSubscript:", v173);
      if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v177, v659[0], v444) & 1) == 0)
        goto LABEL_684;
      v176 = v661[0];
    }
    v178 = v155;
    v179 = v173;
LABEL_291:
    objc_msgSend(v178, "setObject:forKeyedSubscript:", v176, v179);
    v131 = &classRef_BWStillImageCameraCalibrationDataNode;
  }
  if (v500)
  {
    v181 = -[BWDepthSynchronizerNode initForStreaming:separateDepthComponentsEnabled:]([BWDepthSynchronizerNode alloc], "initForStreaming:separateDepthComponentsEnabled:", 0, 0);
    v182 = (objc_class *)v131[50];
    v610.receiver = v153;
    v610.super_class = v182;
    if ((objc_msgSendSuper2(&v610, sel_addNode_error_, v181, &v639) & 1) == 0)
      goto LABEL_684;
    objc_msgSend(v181, "setName:", CFSTR("Still Image YUV Depth Synchronizer"));
    if ((objc_msgSend(v129, "connectOutput:toInput:pipelineStage:", objc_msgSend(v155, "objectForKeyedSubscript:", v481), objc_msgSend(v181, "imageInput"), v128) & 1) == 0|| (objc_msgSend(v129, "connectOutput:toInput:pipelineStage:", v500, objc_msgSend(v181, "depthInput"), v128) & 1) == 0)
    {
      goto LABEL_684;
    }
    objc_msgSend(v155, "setObject:forKeyedSubscript:", objc_msgSend(v181, "output"), v481);
  }
  v501 = (SEL)objc_msgSend(v155, "objectForKeyedSubscript:", v481);
  v449 = objc_msgSend(v101, "firstObject");
  v183 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v183, "setObject:forKeyedSubscript:", objc_msgSend(v47, "objectForKeyedSubscript:", v481), v481);
  v609 = 0u;
  v608 = 0u;
  v607 = 0u;
  v606 = 0u;
  v184 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v606, v654, 16);
  if (v184)
  {
    v185 = v184;
    v186 = *(_QWORD *)v607;
    do
    {
      for (m = 0; m != v185; ++m)
      {
        if (*(_QWORD *)v607 != v186)
          objc_enumerationMutation(v101);
        objc_msgSend(v183, "setObject:forKeyedSubscript:", objc_msgSend(v47, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v606 + 1) + 8 * m)), *(_QWORD *)(*((_QWORD *)&v606 + 1) + 8 * m));
      }
      v185 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v606, v654, 16);
    }
    while (v185);
  }
  if (v467 == 7)
    objc_msgSend(v183, "setObject:forKeyedSubscript:", objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A20]), *MEMORY[0x1E0D05A20]);
  if (v486)
  {
    v188 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", objc_msgSend(v183, "count"), 1986618469);
    v605.receiver = (id)v493;
    v605.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v605, sel_addNode_error_, v188, &v639) & 1) == 0)
      goto LABEL_684;
    -[BWNode setName:](v188, "setName:", CFSTR("UB Funnel"));
    v604 = 0u;
    v603 = 0u;
    v602 = 0u;
    v601 = 0u;
    v189 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v601, v653, 16);
    if (v189)
    {
      v190 = v189;
      v191 = 0;
      v192 = *(_QWORD *)v602;
LABEL_310:
      v193 = 0;
      while (1)
      {
        if (*(_QWORD *)v602 != v192)
          objc_enumerationMutation(obja);
        if (!objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v601 + 1) + 8 * v193)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v188, "inputs"), "objectAtIndexedSubscript:", (v191 + v193)), v473))goto LABEL_684;
        if (v190 == ++v193)
        {
          v190 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v601, v653, 16);
          v191 += v193;
          if (v190)
            goto LABEL_310;
          break;
        }
      }
    }
    v501 = -[BWNode output](v188, "output");
    v101 = v491;
  }
  v194 = v472;
  if (v482 == 1)
  {
    v195 = v456;
    v196 = (char *)v504;
  }
  else
  {
    v600.receiver = (id)v493;
    v600.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    v195 = v456;
    v196 = (char *)v504;
    if ((objc_msgSendSuper2(&v600, sel_addNode_error_, v164, &v639) & 1) == 0
      || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v501, -[BWNode input](v164, "input"), v509) & 1) == 0)
    {
      goto LABEL_684;
    }
    v501 = -[BWNode output](v164, "output");
  }
  if (objc_msgSend(v23, "clientIsCameraOrDerivative"))
  {
    if (v447)
      v197 = 2;
    else
      v197 = 1;
    if (v472 == 1)
      v198 = 1;
    else
      v198 = v197;
  }
  else
  {
    if (v195)
      v198 = 8 * objc_msgSend(v183, "count");
    else
      v198 = 8;
    v194 = v472;
  }
  v199 = v194 == 1;
  if (v198 <= 2)
    v200 = 2;
  else
    v200 = v198;
  if ((_DWORD)v488 == 1)
    v201 = v200;
  else
    v201 = v198;
  v202 = objc_alloc_init(BWUBNodeConfiguration);
  -[BWStillImageNodeConfiguration setMetalCommandQueue:](v202, "setMetalCommandQueue:", -[BWStillImageNodeConfiguration metalCommandQueue](v484, "metalCommandQueue"));
  -[BWStillImageNodeConfiguration setFigThreadPriority:](v202, "setFigThreadPriority:", -[BWStillImageNodeConfiguration figThreadPriority](v484, "figThreadPriority"));
  -[BWStillImageNodeConfiguration setDepthDataType:](v202, "setDepthDataType:", -[BWStillImageNodeConfiguration depthDataType](v484, "depthDataType"));
  -[BWStillImageNodeConfiguration setPearlModuleType:](v202, "setPearlModuleType:", -[BWStillImageNodeConfiguration pearlModuleType](v484, "pearlModuleType"));
  -[BWStillImageNodeConfiguration setInferenceScheduler:](v202, "setInferenceScheduler:", -[BWStillImageNodeConfiguration inferenceScheduler](v484, "inferenceScheduler"));
  -[BWStillImageNodeConfiguration setMaxLossyCompressionLevel:](v202, "setMaxLossyCompressionLevel:", -[BWStillImageNodeConfiguration maxLossyCompressionLevel](v484, "maxLossyCompressionLevel"));
  -[BWUBNodeConfiguration setSensorConfigurationsByPortType:](v202, (char *)v183);
  -[BWUBNodeConfiguration setInputIs10Bit:]((uint64_t)v202, objc_msgSend(v23, "inputIs10Bit"));
  -[BWUBNodeConfiguration setRetainedBufferCount:]((uint64_t)v202, v496);
  v497 = v201;
  -[BWUBNodeConfiguration setOutputBufferCount:]((uint64_t)v202, v201);
  -[BWUBNodeConfiguration setMinimumOutputBufferCount:]((uint64_t)v202, v198);
  -[BWUBNodeConfiguration setMaxNumberOfBurstCapturesAllowedInFlight:]((uint64_t)v202, 2);
  -[BWUBNodeConfiguration setOutputPoolBackPressureEnabled:]((uint64_t)v202, (_DWORD)v488 == 2);
  -[BWStillImageNodeConfiguration setDeferredCaptureSupportEnabled:](v202, "setDeferredCaptureSupportEnabled:", v443);
  -[BWStillImageNodeConfiguration setDeferredPhotoProcessorEnabled:](v202, "setDeferredPhotoProcessorEnabled:", v199);
  -[BWUBNodeConfiguration setStillImageFusionScheme:]((uint64_t)v202, objc_msgSend(v23, "noiseReductionAndFusionScheme"));
  v203 = v493;
  -[BWStillImageNodeConfiguration setFigThreadPriority:](v202, "setFigThreadPriority:", *(unsigned int *)(v493 + 48));
  -[BWUBNodeConfiguration setReferenceFrameSelectionDelegate:]((uint64_t)v202, *(_QWORD *)(v493 + 56));
  if (v438)
    -[BWUBNodeConfiguration setOutputDimensions:]((uint64_t)v202, objc_msgSend(v23, "outputStillImageDimensions"));
  -[BWUBNodeConfiguration setFusionSupportEnabled:]((uint64_t)v202, v471);
  -[BWUBNodeConfiguration setDigitalFlashSupportEnabled:]((uint64_t)v202, v474);
  v204 = objc_msgSend(v23, "deepFusionSupported");
  if (v472 == 1)
    v205 = 0;
  else
    v205 = v204;
  -[BWUBNodeConfiguration setDeepFusionSyntheticsInNRSupportEnabled:]((uint64_t)v202, v205);
  v206 = objc_msgSend(v23, "deepFusionSupported");
  if ((_DWORD)v488 == 2)
    v207 = 0;
  else
    v207 = v443;
  if (v206)
    v208 = v207;
  else
    v208 = 0;
  -[BWUBNodeConfiguration setDeepFusionWaitForPreprocessingToFinish:]((uint64_t)v202, v208);
  -[BWUBNodeConfiguration setDeepFusionSupportEnabled:]((uint64_t)v202, objc_msgSend(v23, "deepFusionSupported"));
  -[BWStillImageNodeConfiguration setDeepFusionEnhancedResolutionDimensions:](v202, "setDeepFusionEnhancedResolutionDimensions:", objc_msgSend(v23, "deepFusionEnhancedResolutionDimensions"));
  if (v461 == 2)
    v209 = v442;
  else
    v209 = 0;
  if (v472 == 1)
    v210 = 1;
  else
    v210 = v443;
  v211 = v509;
  v212 = a11;
  if ((v210 & 1) != 0 || v209)
    v213 = objc_msgSend(v23, "deepZoomVersion");
  else
    v213 = 0;
  v475 = v457 ^ 1;
  -[BWUBNodeConfiguration setDeepZoomVersion:]((uint64_t)v202, v213);
  -[BWUBNodeConfiguration setMaxDeepFusionOutputCount:]((uint64_t)v202, 1);
  -[BWUBNodeConfiguration setLearnedNRMode:]((uint64_t)v202, v462);
  -[BWUBNodeConfiguration setDepthDataDeliveryEnabled:]((uint64_t)v202, v490);
  if (v479)
  {
    v214 = [BWSensorConfiguration alloc];
    v215 = objc_msgSend((id)objc_msgSend(v479, "captureStream"), "portType");
    v216 = objc_msgSend((id)objc_msgSend(v479, "captureStream"), "sensorIDString");
    v217 = objc_msgSend((id)objc_msgSend(v479, "captureStream"), "sensorIDDictionary");
    v218 = objc_msgSend(v429, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v479, "captureStream"), "portType"));
    v219 = v214;
    v212 = a11;
    v220 = v215;
    v211 = v509;
    v221 = v217;
    v101 = v491;
    -[BWUBNodeConfiguration setJasperSensorConfiguration:](v202, (char *)-[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:](v219, "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v220, v216, v221, v218));
  }
  -[BWUBNodeConfiguration setAlwaysAllowModifyingInputBuffers:]((uint64_t)v202, v439 & v440);
  objc_msgSend(v23, "ubInferenceMainImageDownscalingFactor");
  -[BWUBNodeConfiguration setInferenceMainImageDownscalingFactor:]((uint64_t)v202, v222);
  -[BWUBNodeConfiguration setProvidedInferenceAttachedMediaByMode:](v202, v196);
  -[BWUBNodeConfiguration setSemanticRenderingVersion:]((uint64_t)v202, v452);
  -[BWUBNodeConfiguration setSemanticDevelopmentVersion:]((uint64_t)v202, v458);
  -[BWUBNodeConfiguration setPersonSemanticsVersion:]((uint64_t)v202, -[FigCaptureCameraParameters personSemanticsVersion](v520, "personSemanticsVersion"));
  -[BWUBNodeConfiguration setSemanticStyleRenderingEnabled:]((uint64_t)v202, objc_msgSend(v23, "semanticStyleRenderingEnabled"));
  if (v480 == 2)
  {
    if (-[FigCaptureCameraParameters disparityVersion](v520, "disparityVersion") >= 5)
    {
      -[BWUBNodeConfiguration setPortTypesWithDepthSegmentationPortraitParameters:](v202, (char *)objc_msgSend(v454, "allKeys"));
      -[BWStillImageNodeConfiguration setDepthDataType:](v202, "setDepthDataType:", objc_msgSend(v23, "depthDataType"));
      -[BWUBNodeConfiguration setShouldComputeDisparityWhenCalibrationFails:]((uint64_t)v202, v475);
    }
    -[BWUBNodeConfiguration setGenerateLiDARDepth:]((uint64_t)v202, v467 == 7);
    goto LABEL_367;
  }
  -[BWUBNodeConfiguration setGenerateLiDARDepth:]((uint64_t)v202, v467 == 7);
  if (v467 == 7)
LABEL_367:
    -[BWUBNodeConfiguration setDisparityOutputDimensions:]((uint64_t)v202, objc_msgSend(v23, "depthDataDimensions"));
  -[BWUBNodeConfiguration setDemosaicedRawEnabled:]((uint64_t)v202, v466);
  if (v466)
    -[BWUBNodeConfiguration setDemosaicedRawPixelFormat:]((uint64_t)v202, objc_msgSend(v23, "demosaicedRawPixelFormat"));
  -[BWUBNodeConfiguration setRawColorCalibrationsByPortType:](v202, (char *)objc_msgSend(v23, "rawColorCalibrationsByPortType"));
  -[BWUBNodeConfiguration setRawLensShadingCorrectionCoefficientsByPortType:](v202, (char *)objc_msgSend(v23, "rawLensShadingCorrectionCoefficientsByPortType"));
  if (v441)
  {
    -[BWUBNodeConfiguration setIntelligentDistortionCorrectionVersion:]((uint64_t)v202, objc_msgSend(v23, "dcProcessorVersion"));
    if (v460)
      v223 = (char *)objc_msgSend(v23, "portTypesWithGeometricDistortionCorrectionEnabled");
    else
      v223 = 0;
    -[BWUBNodeConfiguration setPortTypesWithGeometricDistortionCorrectionEnabled:](v202, v223);
    -[BWUBNodeConfiguration setGeometricDistortionCorrectionExpandedImageDimensions:]((uint64_t)v202, v425);
    -[BWUBNodeConfiguration setPortTypesWithIntelligentDistortionCorrectionEnabled:](v202, (char *)objc_msgSend(v23, "portTypesWithIntelligentDistortionCorrectionEnabled"));
    -[BWUBNodeConfiguration setIntelligentDistortionCorrectionAppliesFinalDimensions:]((uint64_t)v202, !v517 | v460);
  }
  -[BWUBNodeConfiguration setGreenGhostMitigationVersion:]((uint64_t)v202, objc_msgSend(v23, "greenGhostMitigationVersion"));
  -[BWUBNodeConfiguration setRedEyeReductionEnabled:]((uint64_t)v202, v482 > 1);
  objc_msgSend(v23, "gainMapMainImageDownscalingFactor");
  -[BWUBNodeConfiguration setGainMapMainImageDownscalingFactor:]((uint64_t)v202, v224);
  -[BWUBNodeConfiguration setHorizontalSensorBinningFactor:]((uint64_t)v202, objc_msgSend(v23, "horizontalSensorBinningFactor"));
  -[BWUBNodeConfiguration setVerticalSensorBinningFactor:]((uint64_t)v202, objc_msgSend(v23, "verticalSensorBinningFactor"));
  v225 = -[BWUBNode initWithNodeConfiguration:captureDevice:]([BWUBNode alloc], "initWithNodeConfiguration:captureDevice:", v202, v483);
  v599.receiver = (id)v493;
  v599.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  if ((objc_msgSendSuper2(&v599, sel_addNode_error_, v225, &v639) & 1) == 0)
    goto LABEL_684;
  -[BWNode setName:](v225, "setName:", CFSTR("UB"));
  objc_msgSend(*(id *)(v493 + 56), "setStillImageProcessingSupportProvider:", v225);
  if ((objc_msgSend(v212, "connectOutput:toInput:pipelineStage:", v501, -[BWNode input](v225, "input"), v473) & 1) == 0)
    goto LABEL_684;
  if (v446)
  {
    if ((objc_msgSend(v212, "connectOutput:toInput:pipelineStage:", v446, -[BWUBNode pointCloudInput](v225, "pointCloudInput"), v473) & 1) == 0)goto LABEL_684;
  }
  else
  {
    v226 = *MEMORY[0x1E0D05A20];
    if (objc_msgSend(v422, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A20])
      && (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc_msgSend(v422, "objectForKeyedSubscript:", v226), -[BWUBNode pointCloudInput](v225, "pointCloudInput"), v473) & 1) == 0)
    {
      goto LABEL_684;
    }
  }
  objb = -[BWNode output](v225, "output");
  if (((!v517 | v460) & 1) == 0)
  {
    v227 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v23, "gainMapMainImageDownscalingFactor");
    if (v228 != 0.0)
    {
      v229 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v23, "gainMapMainImageDownscalingFactor");
      objc_msgSend(v227, "setObject:forKeyedSubscript:", objc_msgSend(v229, "numberWithFloat:"), 0x1E4936818);
    }
    v230 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v595 = 0u;
    v596 = 0u;
    v597 = 0u;
    v598 = 0u;
    v231 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v595, v652, 16);
    if (v231)
    {
      v232 = v231;
      v233 = *(_QWORD *)v596;
      do
      {
        for (n = 0; n != v232; ++n)
        {
          if (*(_QWORD *)v596 != v233)
            objc_enumerationMutation(v196);
          objc_msgSend(v230, "addObjectsFromArray:", objc_msgSend(v196, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v595 + 1) + 8 * n)));
        }
        v232 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v595, v652, 16);
      }
      while (v232);
    }
    if (v466)
    {
      objc_msgSend(v227, "setObject:forKeyedSubscript:", &unk_1E4A02E80, 0x1E495B0F8);
      v594 = 0u;
      v593 = 0u;
      v592 = 0u;
      v591 = 0u;
      v235 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v591, v651, 16);
      if (v235)
      {
        v236 = v235;
        v237 = *(_QWORD *)v592;
        do
        {
          for (ii = 0; ii != v236; ++ii)
          {
            if (*(_QWORD *)v592 != v237)
              objc_enumerationMutation(v230);
            v239 = *(_QWORD *)(*((_QWORD *)&v591 + 1) + 8 * ii);
            v240 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "ubInferenceMainImageDownscalingFactor");
            objc_msgSend(v227, "setObject:forKeyedSubscript:", objc_msgSend(v240, "numberWithFloat:"), v239);
          }
          v236 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v591, v651, 16);
        }
        while (v236);
      }
    }
    v241 = -[BWStillImageScalerNode initWithBasePoolCapacity:nodeConfiguration:]([BWStillImageScalerNode alloc], "initWithBasePoolCapacity:nodeConfiguration:", v497, v484);
    -[BWNode setName:](v241, "setName:", CFSTR("Resizing"));
    -[BWStillImageScalerNode setResizedOutputDimensions:](v241, "setResizedOutputDimensions:", objc_msgSend(v23, "outputStillImageDimensions"));
    -[BWStillImageScalerNode setBlackFillingRequired:](v241, "setBlackFillingRequired:", 0);
    -[BWStillImageScalerNode setMainImageDownscalingFactorByAttachedMediaKey:](v241, "setMainImageDownscalingFactorByAttachedMediaKey:", v227);
    v203 = v493;
    v590.receiver = (id)v493;
    v590.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v590, sel_addNode_error_, v241, &v639) & 1) == 0)
    {
      FigDebugAssert3();
      v411 = -12786;
      goto LABEL_670;
    }
    v211 = v509;
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objb, -[BWNode input](v241, "input"), v509) & 1) == 0)
      goto LABEL_684;
    objb = -[BWNode output](v241, "output");
    v101 = v491;
  }
  v242 = 0;
  v243 = v489;
  if (((v464 | v490 ^ 1) & 1) == 0 && v480 != 2)
  {
    v244 = +[BWStillImageConditionalRouterUBConfiguration configurationWithPortTypes:](BWStillImageConditionalRouterUBConfiguration, "configurationWithPortTypes:", v489);
    v245 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v244);
    v589.receiver = (id)v203;
    v589.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v589, sel_addNode_error_, v245, &v639) & 1) == 0)
      goto LABEL_684;
    -[BWNode setName:](v245, "setName:", CFSTR("UB Router"));
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objb, -[BWNode input](v245, "input"), v211) & 1) == 0)
      goto LABEL_684;
    if ((unint64_t)objc_msgSend(v101, "count") >= 2)
    {
      v419 = v11;
      LODWORD(v417) = 0;
      FigDebugAssert3();
    }
    v246 = -[BWStillImageConditionalRouterUBConfiguration outputIndexForPortType:](v244, "outputIndexForPortType:", v449, v417, v419);
    v247 = -[BWStillImageConditionalRouterUBConfiguration outputIndexForPortType:](v244, "outputIndexForPortType:", v481);
    if (v246 == 0x7FFFFFFFFFFFFFFFLL || v247 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_669;
    objb = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v245, "outputs"), "objectAtIndexedSubscript:", v247);
    v242 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v245, "outputs"), "objectAtIndexedSubscript:", v246);
  }
  v248 = -[BWNodeInput formatRequirements](-[BWNode input](v225, "input", v243), "formatRequirements");
  v585 = 0u;
  v586 = 0u;
  v587 = 0u;
  v588 = 0u;
  v249 = objc_msgSend(v506, "countByEnumeratingWithState:objects:count:", &v585, v650, 16);
  if (v249)
  {
    v250 = v249;
    v251 = *(_QWORD *)v586;
    do
    {
      for (jj = 0; jj != v250; ++jj)
      {
        if (*(_QWORD *)v586 != v251)
          objc_enumerationMutation(v506);
        v253 = *(void **)(*((_QWORD *)&v585 + 1) + 8 * jj);
        objc_msgSend(v253, "setPreferredOutputPixelFormats:", -[BWFormatRequirements supportedPixelFormats](v248, "supportedPixelFormats"));
        objc_msgSend(v253, "setConverting10BitVideoRangeTo8BitFullRangeEncouraged:", 1);
      }
      v250 = objc_msgSend(v506, "countByEnumeratingWithState:objects:count:", &v585, v650, 16);
    }
    while (v250);
  }
  v254 = v459;
  v255 = v459 & 0xFFFFFFFE;
  if ((v447 & v457) == 1)
  {
    v256 = objc_alloc_init(BWPortraitHDRStagingNode);
    v584.receiver = (id)v203;
    v584.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    v257 = (uint64_t)objb;
    if ((objc_msgSendSuper2(&v584, sel_addNode_error_, v256, &v639) & 1) == 0)
      goto LABEL_684;
    v258 = v256;
    *(_QWORD *)(v203 + 96) = v258;
    if (v101)
    {
      v259 = v509;
      if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v242, -[BWNode input](v258, "input"), v465) & 1) == 0)
        goto LABEL_684;
      v242 = objc_msgSend(*(id *)(v203 + 96), "output");
    }
    else
    {
      if (v255 == 4)
        v301 = 1;
      else
        v301 = v476;
      v259 = v509;
      if (v301 == 1)
      {
        if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objb, -[BWNode input](v258, "input"), v465) & 1) == 0)
          goto LABEL_684;
        v257 = objc_msgSend(*(id *)(v203 + 96), "output");
      }
    }
  }
  else
  {
    v259 = v509;
    v257 = (uint64_t)objb;
  }
  v260 = v476;
  if (v255 == 4)
    v260 = 1;
  v261 = v490 & !v437 & v260;
  v492 = v261;
  if (v459 == 6)
    v261 = 1;
  v507 = v261 | v437;
  v262 = a11;
  if ((v261 | v437) == 1)
  {
    objc = (id)v257;
    v263 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a9, *(unsigned int *)(v203 + 52));
    v264 = v263;
    if (v459 == 6)
    {
      -[BWNode setName:](v263, "setName:", CFSTR("MonocularDepth"));
      -[BWInferenceNode addInferenceOfType:version:configuration:](v264, "addInferenceOfType:version:configuration:", 106, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, -[BWMonocularDepthConfiguration initWithInferenceType:monocularDepthType:]([BWMonocularDepthConfiguration alloc], "initWithInferenceType:monocularDepthType:", 106, 2));
      v265 = &classRef_BWStillImageCameraCalibrationDataNode;
    }
    else
    {
      v265 = &classRef_BWStillImageCameraCalibrationDataNode;
      if (v492)
      {
        -[BWNode setName:](v263, "setName:", CFSTR("RGB Segmentation"));
        -[BWInferenceNode addInferenceOfType:version:](v264, "addInferenceOfType:version:", 103, +[BWRGBPersonSegmentationInferenceConfiguration portraitVersion](BWRGBPersonSegmentationInferenceConfiguration, "portraitVersion") & 0xFFFFFFFFFFFFLL);
      }
    }
    if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v203, v264))
      goto LABEL_669;
    v267 = (objc_class *)v265[50];
    v583.receiver = (id)v203;
    v583.super_class = v267;
    if ((objc_msgSendSuper2(&v583, sel_addNode_error_, v264, &v639) & 1) == 0)
      goto LABEL_684;
    v268 = -[BWNode input](v264, "input");
    if (v486)
    {
      if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v242, v268, v259) & 1) == 0)
        goto LABEL_684;
    }
    else if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc, v268, v259) & 1) == 0)
    {
      goto LABEL_684;
    }
    v269 = -[BWNode output](v264, "output");
    if (v450)
    {
      v270 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.person-semantics"), *(unsigned int *)(v203 + 48));
      v271 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
      -[BWNode setName:](v271, "setName:", CFSTR("Concurrent PersonSemantics / DepthProcessing Fan Out"));
      v582.receiver = (id)v203;
      v582.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v582, sel_addNode_error_, v271, &v639) & 1) == 0
        || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v269, -[BWNode input](v271, "input"), v465) & 1) == 0)
      {
        goto LABEL_684;
      }
      v272 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v271, "outputs"), "objectAtIndexedSubscript:", 0);
      v273 = v476;
      if (v459 == 6)
        v273 = 1;
      if (v273 == 1)
      {
        v274 = [BWAttachedMediaSplitNode alloc];
        v649[0] = CFSTR("PrimaryFormat");
        v649[1] = CFSTR("Depth");
        v275 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v274, "initWithAttachedMediaKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v649, 2));
        -[BWNode setName:](v275, "setName:", CFSTR("Unprocessed DepthData Discarder"));
        v581.receiver = (id)v203;
        v581.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v581, sel_addNode_error_, v275, &v639) & 1) == 0
          || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v272, -[BWNode input](v275, "input"), v270) & 1) == 0)
        {
          goto LABEL_684;
        }
        v272 = -[BWNode output](v275, "output");
      }
      v276 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a9, *(unsigned int *)(v203 + 52));
      -[BWInferenceNode addInferenceOfType:version:configuration:](v276, "addInferenceOfType:version:configuration:", 104, (unsigned __int16)Major | ((unint64_t)v431 << 16), v432);
      -[BWNode setName:](v276, "setName:", CFSTR("Person Semantics"));
      if (v436 >= 1)
      {
        objc_msgSend(v23, "portraitEffectsMatteMainImageDownscalingFactor");
        v278 = v277;
        v279 = -[BWPersonSemanticsConfiguration enabledSemantics](v432, "enabledSemantics");
        v280 = -[BWStillImageNodeConfiguration metalCommandQueue](v484, "metalCommandQueue");
        v281 = objc_msgSend(v23, "clientIsCameraOrDerivative");
        v282 = v280;
        v203 = v493;
        if (-[FigCaptureStillImageUnifiedBracketingSinkPipeline _addMattingInferenceToNode:mattingVersion:refinedDepthEnabled:mainImageDownscalingFactor:enabledSemantics:metalCommandQueue:mattingsensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:zoomFactorForPortrait:](v493, v276, v424, v433, v279, v282, v454, v281, v278, v74, v423))goto LABEL_669;
      }
      v580.receiver = (id)v203;
      v580.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v580, sel_addNode_error_, v276, &v639) & 1) == 0
        || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v272, -[BWNode input](v276, "input"), v270) & 1) == 0)
      {
        goto LABEL_684;
      }
      v283 = -[BWNode output](v276, "output");
      v284 = v271;
      v266 = v283;
      v269 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v284, "outputs"), "objectAtIndexedSubscript:", 1);
      v262 = a11;
    }
    else
    {
      v266 = 0;
    }
    v257 = (uint64_t)objc;
    if (v486)
      v242 = v269;
    else
      v257 = v269;
    v254 = v459;
  }
  else
  {
    v266 = 0;
  }
  if (v255 == 4)
    v285 = v490;
  else
    v285 = 0;
  v498 = v266;
  if (v285 == 1)
  {
    v286 = objc_msgSend(v23, "depthDataDimensions");
    v287 = -[BWStillImageFocusPixelDisparityNode initWithNodeConfiguration:sensorConfiguration:disparityMapWidth:disparityMapHeight:depthIsAlwaysHighQuality:]([BWStillImageFocusPixelDisparityNode alloc], "initWithNodeConfiguration:sensorConfiguration:disparityMapWidth:disparityMapHeight:depthIsAlwaysHighQuality:", v484, v477, (int)v286, v286 >> 32, objc_msgSend(v23, "clientIsCameraOrDerivative"));
    v579.receiver = (id)v203;
    v579.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    v288 = v524;
    if ((objc_msgSendSuper2(&v579, sel_addNode_error_, v287, &v639) & 1) == 0)
      goto LABEL_684;
    v289 = -[BWNode input](v287, "input");
    v254 = v459;
    if (!v486)
    {
      v295 = v504;
      if ((objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, v289, v259) & 1) == 0)
        goto LABEL_684;
LABEL_549:
      v257 = -[BWNode output](v287, "output");
      v266 = v498;
      goto LABEL_550;
    }
    if ((objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v242, v289, v259) & 1) == 0)
      goto LABEL_684;
    v242 = -[BWNode output](v287, "output");
    v266 = v498;
  }
  else
  {
    v288 = v524;
    if (!v486)
    {
      v295 = v504;
LABEL_550:
      v339 = v476;
      if (v254 == 6)
        v339 = 1;
      if ((v490 & v339) == 1)
      {
        LOBYTE(v417) = 0;
        v340 = -[BWDepthConverterNode initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:]([BWDepthConverterNode alloc], "initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:", v484, v516, objc_msgSend(v477, "sensorIDDictionary"), v492, objc_msgSend(v23, "clientIsCameraOrDerivative"), v254 == 6, v417);
        v561.receiver = (id)v203;
        v561.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v561, sel_addNode_error_, v340, &v639) & 1) == 0)
          goto LABEL_684;
        -[BWNode setName:](v340, "setName:", CFSTR("Still Image Depth Converter"));
        -[BWDepthConverterNode setHorizontalSensorBinningFactor:](v340, "setHorizontalSensorBinningFactor:", objc_msgSend(v23, "horizontalSensorBinningFactor"));
        -[BWDepthConverterNode setVerticalSensorBinningFactor:](v340, "setVerticalSensorBinningFactor:", objc_msgSend(v23, "verticalSensorBinningFactor"));
        -[BWDepthConverterNode setStillGDRFilteringSupportEnabled:](v340, "setStillGDRFilteringSupportEnabled:", 1);
        -[BWDepthConverterNode setOutputFormat:](v340, "setOutputFormat:", 1751411059);
        -[BWDepthConverterNode setOutputDimensions:](v340, "setOutputDimensions:", objc_msgSend(v23, "depthDataDimensions"));
        -[BWDepthConverterNode setBaseRotationDegrees:](v340, "setBaseRotationDegrees:", 90);
        if ((objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, -[BWNode input](v340, "input"), v259) & 1) == 0)
          goto LABEL_684;
        *(_QWORD *)(v203 + 88) = v340;
        v257 = -[BWNode output](v340, "output");
        if (!v266)
          goto LABEL_562;
LABEL_558:
        v341 = -[BWInferenceSynchronizerNode initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:]([BWInferenceSynchronizerNode alloc], "initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:", 0, 1, 0);
        -[BWNode setName:](v341, "setName:", CFSTR("DepthData Processing / PersonSemantics"));
        v560.receiver = (id)v203;
        v560.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v560, sel_addNode_error_, v341, &v639) & 1) == 0
          || (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v341, "inputs"), "objectAtIndexedSubscript:", 0), v465) & 1) == 0|| (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v266, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v341, "inputs"), "objectAtIndexedSubscript:", 1), v465) & 1) == 0)
        {
          goto LABEL_684;
        }
        v257 = -[BWNode output](v341, "output");
        goto LABEL_562;
      }
      if (v266)
        goto LABEL_558;
LABEL_562:
      if (v435)
      {
        v342 = [BWStillImagePortraitMetadataNode alloc];
        *(float *)&v343 = v74;
        v344 = -[BWStillImagePortraitMetadataNode initWithNodeConfiguration:sdofRenderingVersion:sensorConfigurationsByPortType:defaultPortType:defaultZoomFactor:](v342, "initWithNodeConfiguration:sdofRenderingVersion:sensorConfigurationsByPortType:defaultPortType:defaultZoomFactor:", v484, v435, v454, v451, v343);
        v559.receiver = (id)v203;
        v559.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v559, sel_addNode_error_, v344, &v639) & 1) == 0
          || (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, -[BWNode input](v344, "input"), v259) & 1) == 0)
        {
          goto LABEL_684;
        }
        v257 = -[BWNode output](v344, "output");
      }
      if (!v487)
      {
LABEL_594:
        if (v469)
        {
          if (objc_msgSend(v468, "previewQualityAdjustedPhotoFilterRenderingEnabled"))
            v356 = 2;
          else
            v356 = 0;
          v357 = [BWStillImageFilterNode alloc];
          LOBYTE(v420) = 0;
          LODWORD(v358) = 0;
          LODWORD(v417) = v356;
          *(float *)&v359 = v74;
          v360 = -[BWStillImageFilterNode initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:](v357, "initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:", v484, v454, 0, v490, v478, v433, v358, v359, v417, v451, v420);
          v553.receiver = (id)v203;
          v553.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v553, sel_addNode_error_, v360, &v639) & 1) == 0
            || (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, -[BWNode input](v360, "input"), v465) & 1) == 0)
          {
            goto LABEL_684;
          }
          v257 = -[BWNode output](v360, "output");
        }
        if ((_DWORD)v488 == 1)
        {
          v361 = -[BWStillImageTurnstileNode initWithStillImageCoordinator:]([BWStillImageTurnstileNode alloc], "initWithStillImageCoordinator:", *(_QWORD *)(v203 + 56));
          v552.receiver = (id)v203;
          v552.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v552, sel_addNode_error_, v361, &v639) & 1) == 0
            || (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, -[BWNode input](v361, "input"), v259) & 1) == 0)
          {
            goto LABEL_684;
          }
          v257 = -[BWNode output](v361, "output");
        }
        obje = (id)v257;
        v362 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v23, "gainMapMainImageDownscalingFactor");
        if (v363 != 0.0)
        {
          v364 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "gainMapMainImageDownscalingFactor");
          objc_msgSend(v362, "setObject:forKeyedSubscript:", objc_msgSend(v364, "numberWithFloat:"), 0x1E4936818);
        }
        if (v466)
        {
          objc_msgSend(v362, "setObject:forKeyedSubscript:", &unk_1E4A02E80, 0x1E495B0F8);
          v551 = 0u;
          v550 = 0u;
          v549 = 0u;
          v548 = 0u;
          v521 = objc_msgSend(v295, "countByEnumeratingWithState:objects:count:", &v548, v646, 16);
          if (v521)
          {
            v519 = *(_QWORD *)v549;
            do
            {
              for (kk = 0; kk != v521; ++kk)
              {
                if (*(_QWORD *)v549 != v519)
                  objc_enumerationMutation(v295);
                v366 = *(_QWORD *)(*((_QWORD *)&v548 + 1) + 8 * kk);
                v544 = 0u;
                v545 = 0u;
                v546 = 0u;
                v547 = 0u;
                v367 = (void *)objc_msgSend(v295, "objectForKeyedSubscript:", v366);
                v368 = objc_msgSend(v367, "countByEnumeratingWithState:objects:count:", &v544, v645, 16);
                if (v368)
                {
                  v369 = v368;
                  v370 = *(_QWORD *)v545;
                  do
                  {
                    for (mm = 0; mm != v369; ++mm)
                    {
                      if (*(_QWORD *)v545 != v370)
                        objc_enumerationMutation(v367);
                      v372 = *(_QWORD *)(*((_QWORD *)&v544 + 1) + 8 * mm);
                      v373 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v23, "ubInferenceMainImageDownscalingFactor");
                      objc_msgSend(v362, "setObject:forKeyedSubscript:", objc_msgSend(v373, "numberWithFloat:"), v372);
                    }
                    v369 = objc_msgSend(v367, "countByEnumeratingWithState:objects:count:", &v544, v645, 16);
                  }
                  while (v369);
                }
                v295 = v504;
              }
              v521 = objc_msgSend(v504, "countByEnumeratingWithState:objects:count:", &v548, v646, 16);
            }
            while (v521);
          }
        }
        v374 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v23, "portraitEffectsMatteMainImageDownscalingFactor");
        if (v375 != 0.0)
        {
          if (v478)
          {
            v376 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "portraitEffectsMatteMainImageDownscalingFactor");
            objc_msgSend(v374, "setObject:forKeyedSubscript:", objc_msgSend(v376, "numberWithFloat:"), 0x1E495AF38);
          }
          v543 = 0u;
          v541 = 0u;
          v542 = 0u;
          v540 = 0u;
          v377 = (void *)objc_msgSend(v23, "enabledSemanticSegmentationMatteURNs");
          v378 = objc_msgSend(v377, "countByEnumeratingWithState:objects:count:", &v540, v644, 16);
          if (v378)
          {
            v379 = v378;
            v380 = *(_QWORD *)v541;
            do
            {
              for (nn = 0; nn != v379; ++nn)
              {
                if (*(_QWORD *)v541 != v380)
                  objc_enumerationMutation(v377);
                v382 = BWPhotoEncoderAttachedMediaKeyForSemanticSegmentationMatteURN(*(void **)(*((_QWORD *)&v540 + 1)
                                                                                              + 8 * nn));
                if (v382)
                {
                  v383 = v382;
                  v384 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v23, "portraitEffectsMatteMainImageDownscalingFactor");
                  objc_msgSend(v374, "setObject:forKeyedSubscript:", objc_msgSend(v384, "numberWithFloat:"), v383);
                }
              }
              v379 = objc_msgSend(v377, "countByEnumeratingWithState:objects:count:", &v540, v644, 16);
            }
            while (v379);
          }
        }
        v385 = objc_msgSend(v23, "deviceHasFlash");
        if (v472 == 1)
          v386 = 1;
        else
          v386 = v385;
        v539 = 0;
        v538 = 0;
        if (v472 == 1)
          v387 = 1;
        else
          v387 = v471;
        v388 = v455;
        v640 = -[FigCaptureStillImageUnifiedBracketingSinkPipeline _buildScaleAndEncodeSubPipelineWithPipelineStage:graph:nodeConfiguration:stillImageSinkPipelineWithConfiguration:sensorConfigurationsByPortType:supportsScaling:provideMeteorHeadroom:providePostEncodeInferences:semanticDevelopmentVersion:constituentPhotoDeliveryEnabled:demosaicedRawEnabled:nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:propagatedMainImageDownscalingFactorByAttachedMediaKey:inferenceScheduler:subPipelineInputOut:subPipelineOutputOut:cameraSupportsFlash:cinematicFramingStatesProvider:](v493, (uint64_t)v455, a11, (uint64_t)v484, v23, (uint64_t)v524, 1, v387, v434, v458, v456, v362, v374, a9, &v539, &v538, v386, a10);
        if (v640 || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", obje, v539, v455) & 1) == 0)
          goto LABEL_684;
        v389 = v538;
        if (objc_msgSend(v468, "optimizesImagesForOfflineVideoStabilization"))
        {
          v390 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v534 = 0u;
          v535 = 0u;
          v536 = 0u;
          v537 = 0u;
          v391 = objc_msgSend(v524, "countByEnumeratingWithState:objects:count:", &v534, v643, 16);
          if (v391)
          {
            v392 = v391;
            v393 = *(_QWORD *)v535;
            do
            {
              for (i1 = 0; i1 != v392; ++i1)
              {
                if (*(_QWORD *)v535 != v393)
                  objc_enumerationMutation(v524);
                objc_msgSend(v390, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v524, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v534 + 1) + 8 * i1)), "sensorIDDictionary"), *(_QWORD *)(*((_QWORD *)&v534 + 1) + 8 * i1));
              }
              v392 = objc_msgSend(v524, "countByEnumeratingWithState:objects:count:", &v534, v643, 16);
            }
            while (v392);
          }
          v395 = objc_msgSend(v23, "horizontalSensorBinningFactor");
          v396 = objc_msgSend(v23, "verticalSensorBinningFactor");
          objc_msgSend(v23, "maxSupportedFrameRate");
          v398 = FigCaptureBuildMotionAttachmentsNode((void *)v493, v389, v395, v396, v509, objc_msgSend(v23, "motionAttachmentsSource"), (uint64_t)v390, objc_msgSend(v23, "cameraInfoByPortType"), v397, v428, 0, 1, 1, 0, &v640);
          if (v640)
            goto LABEL_684;
          v389 = v398;
          v388 = v455;
        }
        v399 = -[BWStillImageSampleBufferSinkNode initWithSinkID:]([BWStillImageSampleBufferSinkNode alloc], "initWithSinkID:", objc_msgSend((id)v493, "sinkID"));
        -[BWNode setName:](v399, "setName:", CFSTR("Still Image Sink"));
        -[BWStillImageSampleBufferSinkNode setPropagatedAttachedMediaKeys:](v399, "setPropagatedAttachedMediaKeys:", objc_msgSend(v374, "allKeys"));
        -[BWStillImageSampleBufferSinkNode setCameraSupportsFlash:](v399, "setCameraSupportsFlash:", v386);
        v533.receiver = (id)v493;
        v533.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v533, sel_addNode_error_, v399, &v639) & 1) != 0)
        {
          *(_QWORD *)(v493 + 72) = v399;
          if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v389, -[BWNode input](v399, "input"), v388) & 1) != 0)
          {
            v531 = 0u;
            v532 = 0u;
            v529 = 0u;
            v530 = 0u;
            v400 = (void *)objc_msgSend((id)v493, "nodes");
            v401 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v529, v642, 16);
            if (v401)
            {
              v402 = v401;
              v403 = *(_QWORD *)v530;
              do
              {
                for (i2 = 0; i2 != v402; ++i2)
                {
                  if (*(_QWORD *)v530 != v403)
                    objc_enumerationMutation(v400);
                  v405 = *(void **)(*((_QWORD *)&v529 + 1) + 8 * i2);
                  objc_msgSend(v405, "setDeferredPreparePriority:", 1);
                  v527 = 0u;
                  v528 = 0u;
                  v525 = 0u;
                  v526 = 0u;
                  v406 = (void *)objc_msgSend(v405, "inputs");
                  v407 = objc_msgSend(v406, "countByEnumeratingWithState:objects:count:", &v525, v641, 16);
                  if (v407)
                  {
                    v408 = v407;
                    v409 = *(_QWORD *)v526;
                    do
                    {
                      for (i3 = 0; i3 != v408; ++i3)
                      {
                        if (*(_QWORD *)v526 != v409)
                          objc_enumerationMutation(v406);
                        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v525 + 1) + 8 * i3), "connection"), "setWantsMessageCachingWhileSuspended:", 1);
                      }
                      v408 = objc_msgSend(v406, "countByEnumeratingWithState:objects:count:", &v525, v641, 16);
                    }
                    while (v408);
                  }
                }
                v402 = objc_msgSend(v400, "countByEnumeratingWithState:objects:count:", &v529, v642, 16);
              }
              while (v402);
            }
            objc_msgSend(*(id *)(v493 + 56), "setDeferredPreparePriority:", 4);
            goto LABEL_685;
          }
        }
        goto LABEL_684;
      }
      if ((v507 & 1) != 0)
      {
        v345 = v436;
LABEL_573:
        if (v345 > 0)
          v347 = v450;
        else
          v347 = 0;
        if ((v347 & 1) != 0)
        {
          if (-[FigCaptureCameraParameters complementMatteSuppressionDecisionWithISPDetectedFaces](v520, "complementMatteSuppressionDecisionWithISPDetectedFaces"))
          {
            v348 = 4;
          }
          else
          {
            v348 = 2;
          }
          v349 = -[BWMatteMediaSuppressionNode initWithBehavior:]([BWMatteMediaSuppressionNode alloc], "initWithBehavior:", v348 | v457);
          -[BWNode setName:](v349, "setName:", CFSTR("Matting Media Suppression Node"));
          v554.receiver = (id)v203;
          v554.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v554, sel_addNode_error_, v349, &v639) & 1) == 0
            || (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, -[BWNode input](v349, "input"), v259) & 1) == 0)
          {
            goto LABEL_684;
          }
LABEL_593:
          v257 = -[BWNode output](v349, "output");
          v295 = v504;
          goto LABEL_594;
        }
        v350 = v257;
        v351 = +[BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration personSegmentationAndMattingConfiguration](BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration, "personSegmentationAndMattingConfiguration");
        v352 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v351);
        -[BWNode setName:](v352, "setName:", CFSTR("Matting Conditional Router"));
        v557.receiver = (id)v203;
        v557.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v557, sel_addNode_error_, v352, &v639) & 1) == 0)
          goto LABEL_684;
        v353 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a9, *(unsigned int *)(v203 + 52));
        v354 = v353;
        if ((v450 & 1) == 0)
        {
          -[BWInferenceNode addInferenceOfType:version:configuration:](v353, "addInferenceOfType:version:configuration:", 104, (unsigned __int16)Major | ((unint64_t)v431 << 16), v432);
          -[BWNode setName:](v354, "setName:", CFSTR("PersonSemantics"));
        }
        objc_msgSend(v23, "portraitEffectsMatteMainImageDownscalingFactor");
        if (!-[FigCaptureStillImageUnifiedBracketingSinkPipeline _addMattingInferenceToNode:mattingVersion:refinedDepthEnabled:mainImageDownscalingFactor:enabledSemantics:metalCommandQueue:mattingsensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:zoomFactorForPortrait:](v203, v354, v424, v433, -[BWPersonSemanticsConfiguration enabledSemantics](v432, "enabledSemantics"), (uint64_t)-[BWStillImageNodeConfiguration metalCommandQueue](v484, "metalCommandQueue"), v454, objc_msgSend(v23, "clientIsCameraOrDerivative"), v355, v74, v423))
        {
          v556.receiver = (id)v203;
          v556.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v556, sel_addNode_error_, v354, &v639) & 1) == 0)
            goto LABEL_684;
          v349 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", 2, 1986618469);
          -[BWNode setName:](v349, "setName:", CFSTR("Matting Funnel"));
          v555.receiver = (id)v203;
          v555.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v555, sel_addNode_error_, v349, &v639) & 1) == 0)
            goto LABEL_684;
          if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v350, -[BWNode input](v352, "input"), v259) & 1) == 0)
            goto LABEL_684;
          if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v352, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v351, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v349, "inputs"), "objectAtIndexedSubscript:", 0), v259) & 1) == 0)goto LABEL_684;
          if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v352, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v351, "personSegmentationAndMattingOuputIndex")), -[BWNode input](v354, "input"), v259) & 1) == 0)goto LABEL_684;
          v262 = a11;
          if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[BWNode output](v354, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v349, "inputs"), "objectAtIndexedSubscript:", 1), v259) & 1) == 0)goto LABEL_684;
          goto LABEL_593;
        }
        goto LABEL_669;
      }
      v346 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a9, *(unsigned int *)(v203 + 52));
      v345 = v436;
      if (!-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v203, v346))
      {
        v558.receiver = (id)v203;
        v558.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v558, sel_addNode_error_, v346, &v639) & 1) == 0
          || (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, -[BWNode input](v346, "input"), v259) & 1) == 0)
        {
          goto LABEL_684;
        }
        v257 = -[BWNode output](v346, "output");
        goto LABEL_573;
      }
LABEL_669:
      v411 = -12780;
LABEL_670:
      v640 = v411;
      goto LABEL_685;
    }
  }
  if (v480 == 2)
  {
    v290 = v257;
    v291 = +[BWStillImageConditionalRouterInferenceConfiguration inferenceConfiguration](BWStillImageConditionalRouterInferenceConfiguration, "inferenceConfiguration");
    v292 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v291);
    v293 = &classRef_BWStillImageCameraCalibrationDataNode;
    v578.receiver = (id)v203;
    v578.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v578, sel_addNode_error_, v292, &v639) & 1) == 0)
      goto LABEL_684;
    -[BWNode setName:](v292, "setName:", CFSTR("Inference Conditional Router"));
    v294 = objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v290, -[BWNode input](v292, "input"), v259);
    v295 = v504;
    if ((v294 & 1) == 0)
      goto LABEL_684;
    v296 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.inference.bravo"), *(unsigned int *)(v203 + 48));
    v297 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a9, *(unsigned int *)(v203 + 52));
    if ((v507 & 1) == 0)
    {
      v298 = v478;
      if (v436 <= 0)
        v298 = 0;
      if ((v298 & 1) != 0)
      {
        v507 = 0;
        goto LABEL_539;
      }
      if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v203, v297))
        goto LABEL_669;
    }
    v507 = 1;
LABEL_539:
    if ((v487 & v450) == 1)
    {
      v327 = -[BWNode name](v297, "name");
      v328 = -[NSString length](v327, "length");
      v329 = CFSTR("Person Semantics");
      if (v328)
        v329 = -[NSString stringByAppendingFormat:](v327, "stringByAppendingFormat:", CFSTR(" + %@"), CFSTR("Person Semantics"));
      -[BWNode setName:](v297, "setName:", v329);
      -[BWInferenceNode addInferenceOfType:version:configuration:](v297, "addInferenceOfType:version:configuration:", 104, (unsigned __int16)Major | ((unint64_t)v431 << 16), v432);
      v293 = &classRef_BWStillImageCameraCalibrationDataNode;
      if (v436 >= 1)
      {
        objc_msgSend(v23, "portraitEffectsMatteMainImageDownscalingFactor");
        v331 = v330;
        v332 = -[BWPersonSemanticsConfiguration enabledSemantics](v432, "enabledSemantics");
        v333 = -[BWStillImageNodeConfiguration metalCommandQueue](v484, "metalCommandQueue");
        v334 = objc_msgSend(v23, "clientIsCameraOrDerivative");
        v335 = v332;
        v293 = &classRef_BWStillImageCameraCalibrationDataNode;
        if (-[FigCaptureStillImageUnifiedBracketingSinkPipeline _addMattingInferenceToNode:mattingVersion:refinedDepthEnabled:mainImageDownscalingFactor:enabledSemantics:metalCommandQueue:mattingsensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:zoomFactorForPortrait:](v203, v297, v424, 0, v335, v333, v454, v334, v331, v74, v423))goto LABEL_669;
      }
    }
    v336 = (objc_class *)v293[50];
    v577.receiver = (id)v203;
    v577.super_class = v336;
    if ((objc_msgSendSuper2(&v577, sel_addNode_error_, v297, &v639) & 1) == 0)
      goto LABEL_684;
    if ((objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v292, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v291, "inferenceOuputIndex")), -[BWNode input](v297, "input"), v296) & 1) == 0)goto LABEL_684;
    v337 = -[BWNode output](v297, "output");
    v287 = -[BWInferenceSynchronizerNode initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:]([BWInferenceSynchronizerNode alloc], "initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:", 1, 1, 0);
    -[BWNode setName:](v287, "setName:", CFSTR("Disparity/Inference Sync"));
    -[BWStillImageFocusPixelDisparityNode setSynchronizesTopLevelAttachments:](v287, "setSynchronizesTopLevelAttachments:", 1);
    v576.receiver = (id)v203;
    v576.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    v259 = v509;
    if ((objc_msgSendSuper2(&v576, sel_addNode_error_, v287, &v639) & 1) == 0)
      goto LABEL_684;
    if ((objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v292, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v291, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v287, "inputs"), "objectAtIndexedSubscript:", 0), v465) & 1) == 0)goto LABEL_684;
    v338 = objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v337, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v287, "inputs"), "objectAtIndexedSubscript:", 1), v465);
    v254 = v459;
    if ((v338 & 1) == 0)
      goto LABEL_684;
    goto LABEL_549;
  }
  if (!v490)
  {
    if (!v456)
    {
      v295 = v504;
      if (v266)
        goto LABEL_558;
      goto LABEL_562;
    }
    objd = +[BWStillImageConditionalRouterUBConfiguration configurationWithPortTypes:](BWStillImageConditionalRouterUBConfiguration, "configurationWithPortTypes:", v489);
    v302 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", objd);
    v569.receiver = (id)v203;
    v569.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v569, sel_addNode_error_, v302, &v639) & 1) == 0)
      goto LABEL_684;
    -[BWNode setName:](v302, "setName:", CFSTR("UB Router for ConstituentPhoto without Depth"));
    if ((objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v257, -[BWNode input](v302, "input"), v259) & 1) == 0)
      goto LABEL_684;
    v303 = -[BWStillImageMultiCameraDoserNode initWithPortTypes:]([BWStillImageMultiCameraDoserNode alloc], "initWithPortTypes:", objc_msgSend(v288, "allKeys"));
    v568.receiver = (id)v203;
    v568.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v568, sel_addNode_error_, v303, &v639) & 1) == 0)
      goto LABEL_684;
    v304 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", objc_msgSend(v489, "count"), 1986618469);
    v567.receiver = (id)v203;
    v567.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v567, sel_addNode_error_, v304, &v639) & 1) == 0)
      goto LABEL_684;
    v518 = v304;
    -[BWNode setName:](v304, "setName:", CFSTR("Camera Calibration Data"));
    v566 = 0u;
    v565 = 0u;
    v564 = 0u;
    v563 = 0u;
    v305 = objc_msgSend(v489, "countByEnumeratingWithState:objects:count:", &v563, v647, 16);
    if (v305)
    {
      v306 = v305;
      v307 = *(_QWORD *)v564;
LABEL_499:
      v308 = 0;
      while (1)
      {
        if (*(_QWORD *)v564 != v307)
          objc_enumerationMutation(v489);
        v309 = -[BWStillImageConditionalRouterUBConfiguration outputIndexForPortType:](objd, "outputIndexForPortType:", *(_QWORD *)(*((_QWORD *)&v563 + 1) + 8 * v308));
        if (v309 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_669;
        v310 = v309;
        if ((objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v302, "outputs"), "objectAtIndexedSubscript:", v309), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v303, "inputs"), "objectAtIndexedSubscript:", v309), v509) & 1) == 0|| (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v303, "outputs"), "objectAtIndexedSubscript:", v310), -[NSArray objectAtIndexedSubscript:](
                  -[BWNode inputs](v518, "inputs"),
                  "objectAtIndexedSubscript:",
                  v310),
                v509) & 1) == 0)
        {
          goto LABEL_684;
        }
        ++v308;
        v262 = a11;
        if (v306 == v308)
        {
          v306 = objc_msgSend(v489, "countByEnumeratingWithState:objects:count:", &v563, v647, 16);
          if (v306)
            goto LABEL_499;
          break;
        }
      }
    }
    v287 = -[BWStillImageCameraCalibrationDataNode initWithSensorConfigurationsByPortType:]([BWStillImageCameraCalibrationDataNode alloc], "initWithSensorConfigurationsByPortType:", v524);
    -[BWStillImageFocusPixelDisparityNode setPropagatesDetectedObjects:](v287, "setPropagatesDetectedObjects:", 1);
    -[BWStillImageFocusPixelDisparityNode setBaseZoomFactorsByPortType:](v287, "setBaseZoomFactorsByPortType:", objc_msgSend(v23, "baseZoomFactorsByPortType"));
    -[BWNode setName:](v287, "setName:", CFSTR("Still Image Camera Calibration Data"));
    v203 = v493;
    v562.receiver = (id)v493;
    v562.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v562, sel_addNode_error_, v287, &v639) & 1) == 0)
      goto LABEL_684;
    v259 = v509;
    v295 = v504;
    v254 = v459;
    if ((objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", -[BWNode output](v518, "output"), -[BWNode input](v287, "input"), v509) & 1) == 0)goto LABEL_684;
    goto LABEL_549;
  }
  if (v421)
  {
    v299 = objc_alloc_init(BWStillImageDisparitySplitterNode);
    -[BWNode setName:](v299, "setName:", CFSTR("Disparity/UB Splitter"));
    v575.receiver = (id)v203;
    v575.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v575, sel_addNode_error_, v299, &v639) & 1) == 0
      || (objc_msgSend(v262, "connectOutput:toInput:pipelineStage:", v242, -[BWNode input](v299, "input"), v465) & 1) == 0)
    {
      goto LABEL_684;
    }
    v300 = v257;
    v242 = -[BWStillImageDisparitySplitterNode disparityOutput](v299, "disparityOutput");
  }
  else
  {
    v300 = v257;
    v299 = 0;
  }
  v648[0] = v481;
  v648[1] = v449;
  v311 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v648, 2);
  v312 = -[BWStillImageMultiCameraDoserNode initWithPortTypes:]([BWStillImageMultiCameraDoserNode alloc], "initWithPortTypes:", v311);
  v574.receiver = (id)v203;
  v574.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  if ((objc_msgSendSuper2(&v574, sel_addNode_error_, v312, &v639) & 1) != 0)
  {
    v313 = objc_msgSend(v311, "indexOfObject:", v481);
    if (v313 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_669;
    v314 = v313;
    v315 = objc_msgSend(v311, "indexOfObject:", v449);
    if (v315 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_669;
    v316 = v315;
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v300, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v312, "inputs"), "objectAtIndexedSubscript:", v314), v465) & 1) == 0|| (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v242, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v312, "inputs"), "objectAtIndexedSubscript:", v316), v465) & 1) == 0)
    {
      goto LABEL_684;
    }
    v317 = -[BWStillImageMultiCameraDoserNode outputIndexForPortType:](v312, "outputIndexForPortType:", v481);
    if (v317 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_669;
    v318 = v317;
    v319 = -[BWStillImageMultiCameraDoserNode outputIndexForPortType:](v312, "outputIndexForPortType:", v449);
    if (v319 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_669;
    v320 = v319;
    v321 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v312, "outputs"), "objectAtIndexedSubscript:", v318);
    v322 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v312, "outputs"), "objectAtIndexedSubscript:", v320);
    if (v456)
    {
      v323 = -[BWStillImageDualPhotoFacePropagatorNode initWithBaseZoomFactors:]([BWStillImageDualPhotoFacePropagatorNode alloc], "initWithBaseZoomFactors:", objc_msgSend((id)objc_msgSend(v23, "baseZoomFactorsByPortType"), "allValues"));
      v573.receiver = (id)v493;
      v573.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v573, sel_addNode_error_, v323, &v639) & 1) == 0
        || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v321, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v323, "inputs"), "objectAtIndexedSubscript:", 0), v465) & 1) == 0|| (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v322, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v323, "inputs"), "objectAtIndexedSubscript:", 1), v465) & 1) == 0)
      {
        goto LABEL_684;
      }
      v321 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v323, "outputs"), "objectAtIndexedSubscript:", 0);
      v322 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v323, "outputs"), "objectAtIndexedSubscript:", 1);
    }
    if (v421)
    {
      v324 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.inference.bravo"), *(unsigned int *)(v493 + 48));
      v325 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a9, *(unsigned int *)(v493 + 52));
      -[BWNode setName:](v325, "setName:", CFSTR("Disparity"));
      if ((v507 & 1) == 0
        && -[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v493, v325))
      {
        goto LABEL_669;
      }
      if (v450)
      {
        v326 = -[BWNode name](v325, "name");
        if (-[NSString length](v326, "length"))
          -[NSString stringByAppendingFormat:](v326, "stringByAppendingFormat:", CFSTR(" + %@"), CFSTR("Person Semantics"));
        -[BWInferenceNode addInferenceOfType:version:configuration:](v325, "addInferenceOfType:version:configuration:", 104, (unsigned __int16)Major | ((unint64_t)v431 << 16), v432);
      }
      v572.receiver = (id)v493;
      v572.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v572, sel_addNode_error_, v325, &v639) & 1) == 0
        || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[BWStillImageDisparitySplitterNode processedOutput](v299, "processedOutput"), -[BWNode input](v325, "input"), v324) & 1) == 0)
      {
        goto LABEL_684;
      }
      v507 = 1;
    }
    else
    {
      v325 = 0;
    }
    v266 = v498;
    v412 = objc_msgSend(v23, "depthDataDimensions");
    if (objc_msgSend(v23, "clientIsCameraOrDerivative"))
      v413 = 0;
    else
      v413 = 8;
    v414 = -[BWStillImageBravoDisparityNode initWithNodeConfiguration:sensorConfigurationsByPortType:disparityMapWidth:disparityMapHeight:outputDisparityBufferCount:]([BWStillImageBravoDisparityNode alloc], "initWithNodeConfiguration:sensorConfigurationsByPortType:disparityMapWidth:disparityMapHeight:outputDisparityBufferCount:", v484, v288, (int)v412, v412 >> 32, v413);
    v571.receiver = (id)v493;
    v571.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v571, sel_addNode_error_, v414, &v639) & 1) == 0)
      goto LABEL_684;
    *(_QWORD *)(v493 + 80) = v414;
    -[BWStillImageBravoDisparityNode setShouldComputeDisparityWhenCalibrationFails:](v414, "setShouldComputeDisparityWhenCalibrationFails:", v475);
    v262 = a11;
    v295 = v504;
    v259 = v509;
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v321, -[BWStillImageBravoDisparityNode wideInput](v414, "wideInput"), v465) & 1) == 0|| (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v322, -[BWStillImageBravoDisparityNode telephotoInput](v414, "telephotoInput"), v465) & 1) == 0)
    {
      goto LABEL_684;
    }
    v257 = -[BWNode output](v414, "output");
    if (!v421)
    {
      v203 = v493;
      v254 = v459;
      goto LABEL_550;
    }
    v287 = -[BWInferenceSynchronizerNode initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:]([BWInferenceSynchronizerNode alloc], "initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:", 1, 1, 0);
    -[BWNode setName:](v287, "setName:", CFSTR("Disparity/Landmarks Sync"));
    -[BWStillImageFocusPixelDisparityNode setSynchronizesTopLevelAttachments:](v287, "setSynchronizesTopLevelAttachments:", 1);
    v570.receiver = (id)v493;
    v570.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    v254 = v459;
    if ((objc_msgSendSuper2(&v570, sel_addNode_error_, v287, &v639) & 1) == 0)
      goto LABEL_684;
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v257, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v287, "inputs"), "objectAtIndexedSubscript:", 0), v465) & 1) == 0)goto LABEL_684;
    v415 = objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[BWNode output](v325, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v287, "inputs"), "objectAtIndexedSubscript:", 1), v465);
    v203 = v493;
    if ((v415 & 1) == 0)
      goto LABEL_684;
    goto LABEL_549;
  }
LABEL_684:
  FigDebugAssert3();
LABEL_685:
  result = v640;
  if (!v640)
  {
    if (v639)
      return objc_msgSend(v639, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  -[FigCaptureSinkPipeline dealloc](&v3, sel_dealloc);
}

+ (NSString)pipelineBaseName
{
  return (NSString *)CFSTR("UB Still Image Sink Pipeline");
}

- (BWStillImageCoordinatorNode)stillImageCoordinatorNode
{
  return self->_stillImageCoordinatorNode;
}

- (BWCompressedShotBufferNode)compressedShotBufferNode
{
  return self->_compressedShotBufferNode;
}

- (BWStillImageSampleBufferSinkNode)stillImageSinkNode
{
  return self->_stillImageSinkNode;
}

- (BWPortraitHDRStagingNode)portraitHDRStagingNode
{
  return self->_portraitHDRStagingNode;
}

- (uint64_t)_buildRedEyeReductionSubPipelineWithName:(uint64_t)a3 pipelineStage:(void *)a4 graph:(uint64_t)a5 sensorConfigurationsByPortType:(uint64_t)a6 inferenceScheduler:(uint64_t *)a7 subPipelineInputOut:(uint64_t *)a8 subPipelineOutputOut:
{
  unsigned int *v11;
  id v12;
  id v13;
  BWStillImageConditionalRouterNode *v14;
  BWInferenceNode *v15;
  BWFunnelNode *v16;
  uint64_t v17;
  uint64_t v18;
  BWRedEyeReducerNode *v19;
  uint64_t v20;
  uint64_t v23;
  objc_super v26;
  objc_super v27;
  objc_super v28;
  objc_super v29;
  uint64_t v30;

  if (result)
  {
    v11 = (unsigned int *)result;
    v30 = 0;
    v12 = +[BWLandmarksInferenceConfiguration configuration](BWLandmarksInferenceConfiguration, "configuration");
    objc_msgSend(v12, "setDetectLandmarksInFullSizeInput:", 1);
    v13 = +[BWStillImageConditionalRouterLandmarksConfiguration landmarksConfiguration](BWStillImageConditionalRouterLandmarksConfiguration, "landmarksConfiguration");
    v14 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v13);
    -[BWNode setName:](v14, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Landmarks Input Routing Node"), a2));
    v29.receiver = v11;
    v29.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v29, sel_addNode_error_, v14, &v30) & 1) == 0)
      goto LABEL_14;
    v15 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a6, v11[13]);
    v23 = a2;
    -[BWNode setName:](v15, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Landmarks Node"), a2));
    -[BWInferenceNode addInferenceOfType:version:configuration:](v15, "addInferenceOfType:version:configuration:", 801, objc_msgSend(v12, "landmarksInferenceVersion") & 0xFFFFFFFFFFFFLL, v12);
    v28.receiver = v11;
    v28.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v28, sel_addNode_error_, v15, &v30) & 1) == 0)
      goto LABEL_14;
    v16 = -[BWFunnelNode initWithNumberOfInputs:mediaType:holdMessages:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:holdMessages:", 2, 1986618469, 1);
    v27.receiver = v11;
    v27.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v27, sel_addNode_error_, v16, &v30) & 1) == 0)
      goto LABEL_14;
    v17 = -[BWNode input](v14, "input");
    if ((objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v14, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v13, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v16, "inputs"), "objectAtIndexedSubscript:", 0), a3) & 1) == 0)goto LABEL_14;
    if ((objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v14, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v13, "landmarksOutputIndex")), -[BWNode input](v15, "input"), a3) & 1) != 0&& (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", -[BWNode output](v15, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v16, "inputs"), "objectAtIndexedSubscript:", 1), a3) & 1) != 0&& (v18 = -[BWNode output](v16, "output"), v19 = objc_autorelease(-[BWRedEyeReducerNode initWithVersion:sensorConfigurationsByPortType:]([BWRedEyeReducerNode alloc], "initWithVersion:sensorConfigurationsByPortType:",
                    1,
                    a5)),
          -[BWNode setName:](v19, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Red Eye Reducer"), v23)), -[BWRedEyeReducerNode setInferenceType:](v19, "setInferenceType:", 801), -[BWRedEyeReducerNode setInferenceAttachmentKey:](v19, "setInferenceAttachmentKey:", 0x1E4951058), v26.receiver = v11, v26.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline, (objc_msgSendSuper2(&v26, sel_addNode_error_, v19, &v30) & 1) != 0)&& (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v18, -[BWNode input](v19, "input"), a3) & 1) != 0)
    {
      v20 = -[BWNode output](v19, "output");
      result = 4294954516;
      if (v17)
      {
        if (v20)
        {
          result = 0;
          *a7 = v17;
          *a8 = v20;
        }
      }
    }
    else
    {
LABEL_14:
      FigDebugAssert3();
      return 4294954516;
    }
  }
  return result;
}

- (uint64_t)_addMattingInferenceToNode:(unsigned int)a3 mattingVersion:(uint64_t)a4 refinedDepthEnabled:(unsigned int)a5 mainImageDownscalingFactor:(uint64_t)a6 enabledSemantics:(void *)a7 metalCommandQueue:(char)a8 mattingsensorConfigurationsByPortType:(float)a9 clientIsCameraOrDerivative:(float)a10 requiredAdditionalInferenceOutputBuffers:(unsigned int)a11 zoomFactorForPortrait:
{
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  FigCaptureCameraParameters *v25;
  uint64_t v26;
  double v27;
  double v28;
  id v29;
  BWMattingInferenceConfiguration *v30;
  double v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  BWMattingV2InferenceConfiguration *v36;
  double v37;
  char v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  BWLearnedMattingInferenceConfiguration *v42;
  double v43;
  char v45;
  uint64_t v46;

  if (!a1)
    return 0;
  v20 = (void *)objc_msgSend(a2, "name");
  v21 = objc_msgSend(v20, "length");
  v22 = CFSTR("Matting");
  v46 = a6;
  if (v21)
    v22 = (const __CFString *)objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" + %@"), CFSTR("Matting"));
  objc_msgSend(a2, "setName:", v22);
  v23 = objc_msgSend((id)objc_msgSend(a7, "allKeys"), "firstObject");
  v24 = objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", v23), "sensorIDDictionary");
  v25 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v26 = objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", v23), "sensorIDString");
  *(float *)&v27 = a10;
  if (-[FigCaptureCameraParameters sdofRenderingVersionForPortType:sensorIDString:zoomFactor:](v25, "sdofRenderingVersionForPortType:sensorIDString:zoomFactor:", v23, v26, v27))
  {
    *(float *)&v28 = a10;
    v29 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v24, v28);
  }
  else
  {
    v29 = 0;
  }
  if (a3 == 1)
  {
    v30 = -[BWInferenceConfiguration initWithInferenceType:]([BWMattingInferenceConfiguration alloc], "initWithInferenceType:", 201);
    -[BWInferenceConfiguration setPriority:](v30, "setPriority:", *(unsigned int *)(a1 + 52));
    -[BWInferenceConfiguration setTuningParameters:](v30, "setTuningParameters:", v24);
    -[BWMattingInferenceConfiguration setSdofRenderingTuningParameters:](v30, "setSdofRenderingTuningParameters:", v29);
    *(float *)&v31 = a9;
    -[BWMattingInferenceConfiguration setMainImageDownscalingFactor:](v30, "setMainImageDownscalingFactor:", v31);
    -[BWMattingInferenceConfiguration setRefinedDepthDeliveryEnabled:](v30, "setRefinedDepthDeliveryEnabled:", a4);
    -[BWMattingInferenceConfiguration setMetalCommandQueue:](v30, "setMetalCommandQueue:", a6);
    v32 = objc_msgSend(a2, "addInferenceOfType:version:configuration:", 201, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v30);
LABEL_27:
    if ((a8 & 1) == 0)
      objc_msgSend(a2, "setAwaitAsynchronousOutputs:", 1);
    if (a11)
      objc_msgSend(a2, "setAdditionalOutputPoolRetainedBufferCount:", a11);
    return v32;
  }
  v45 = a8;
  if (-[FigCaptureCameraParameters learnedMattingVersion](v25, "learnedMattingVersion") < 1)
    v33 = 1;
  else
    v33 = a4;
  v34 = a4 | 2;
  if (!v33)
    v34 = a4;
  if ((a5 & 1) == 0)
    v34 = a4;
  v35 = a5 & 0x78 | (4 * ((a5 >> 1) & 1)) | v34;
  if (!(_DWORD)v35)
    goto LABEL_18;
  v36 = -[BWInferenceConfiguration initWithInferenceType:]([BWMattingV2InferenceConfiguration alloc], "initWithInferenceType:", 201);
  -[BWMattingV2InferenceConfiguration setSensorConfigurationsByPortType:](v36, "setSensorConfigurationsByPortType:", a7);
  -[BWMattingV2InferenceConfiguration setEnabledMattes:](v36, "setEnabledMattes:", v35);
  -[BWMattingV2InferenceConfiguration setTuningConfiguration:](v36, "setTuningConfiguration:", 2);
  -[BWInferenceConfiguration setPriority:](v36, "setPriority:", *(unsigned int *)(a1 + 52));
  -[BWMattingV2InferenceConfiguration setSdofRenderingTuningParameters:](v36, "setSdofRenderingTuningParameters:", v29);
  *(float *)&v37 = a9;
  -[BWMattingV2InferenceConfiguration setMainImageDownscalingFactor:](v36, "setMainImageDownscalingFactor:", v37);
  -[BWMattingV2InferenceConfiguration setDepthDataDeliveryEnabled:](v36, "setDepthDataDeliveryEnabled:", a4);
  -[BWMattingV2InferenceConfiguration setMetalCommandQueue:](v36, "setMetalCommandQueue:", v46);
  v32 = objc_msgSend(a2, "addInferenceOfType:version:configuration:", 201, BWInferenceVersionMakeMajor(a3) & 0xFFFFFFFFFFFFLL, v36);
  if (!(_DWORD)v32)
  {
LABEL_18:
    if ((a5 & 1) != 0)
      v38 = v33;
    else
      v38 = 1;
    if ((v38 & 1) != 0)
    {
      v32 = 0;
LABEL_26:
      a8 = v45;
      goto LABEL_27;
    }
    v39 = (void *)objc_msgSend(a2, "name");
    v40 = objc_msgSend(v39, "length");
    v41 = CFSTR("Learned Matting");
    if (v40)
      v41 = (const __CFString *)objc_msgSend(v39, "stringByAppendingFormat:", CFSTR(" + %@"), CFSTR("Learned Matting"));
    objc_msgSend(a2, "setName:", v41);
    v42 = -[BWInferenceConfiguration initWithInferenceType:]([BWLearnedMattingInferenceConfiguration alloc], "initWithInferenceType:", 107);
    -[BWTiledEspressoInferenceConfiguration setMetalCommandQueue:](v42, "setMetalCommandQueue:", 0);
    *(float *)&v43 = a9;
    -[BWLearnedMattingInferenceConfiguration setMainImageDownscalingFactor:](v42, "setMainImageDownscalingFactor:", v43);
    v32 = objc_msgSend(a2, "addInferenceOfType:version:configuration:", 107, BWInferenceVersionMakeMajor(-[FigCaptureCameraParameters learnedMattingVersion](v25, "learnedMattingVersion")) & 0xFFFFFFFFFFFFLL, v42);
    if (!(_DWORD)v32)
      goto LABEL_26;
  }
  return v32;
}

- (uint64_t)_buildScaleAndEncodeSubPipelineWithPipelineStage:(uint64_t)result graph:(uint64_t)a2 nodeConfiguration:(void *)a3 stillImageSinkPipelineWithConfiguration:(uint64_t)a4 sensorConfigurationsByPortType:(void *)a5 supportsScaling:(uint64_t)a6 provideMeteorHeadroom:(int)a7 providePostEncodeInferences:(int)a8 semanticDevelopmentVersion:(char)a9 constituentPhotoDeliveryEnabled:(unsigned int)a10 demosaicedRawEnabled:(unsigned __int8)a11 nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a12 propagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a13 inferenceScheduler:(uint64_t)a14 subPipelineInputOut:(uint64_t *)a15 subPipelineOutputOut:(uint64_t *)a16 cameraSupportsFlash:(unsigned __int8)a17 cinematicFramingStatesProvider:(void *)a18
{
  void *v22;
  BWCinematicFramingWarpingNode *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  BWStillImageScalerNode *v28;
  void *v29;
  BWMeteorHeadroomNode *v30;
  uint64_t v32;
  BWPhotoEncoderNode *v33;
  BWPhotoEncoderNode *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  uint64_t v40;
  BWPhotoEncoderNodeAttachedMediaConfiguration *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  BWPhotoEncoderNodeAttachedMediaConfiguration *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v54;
  void *v56;
  uint64_t v57;
  objc_super v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  objc_super v68;
  objc_super v69;
  uint64_t v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v56 = (void *)result;
  if (!result)
    return result;
  v70 = 0;
  if (!a15 || !a16)
    return FigSignalErrorAt();
  objc_msgSend(a5, "sinkConfiguration");
  objc_opt_class();
  v54 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = (void *)objc_msgSend(a5, "sinkConfiguration");
  else
    v22 = 0;
  if (objc_msgSend(a5, "cinematicFramingWarpingRequired"))
  {
    v23 = [BWCinematicFramingWarpingNode alloc];
    v24 = objc_msgSend(a5, "cinematicFramingWarpingOutputDimensions");
    objc_msgSend(a5, "maxLossyCompressionLevel");
    v25 = -[BWCinematicFramingWarpingNode initWithFramingStatesProvider:outputDimensions:maxLossyCompressionLevel:](v23, a18, v24);
    objc_msgSend(v25, "setName:", CFSTR("CinematicFramingWarper"));
    v69.receiver = v56;
    v69.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if (!objc_msgSendSuper2(&v69, (SEL)&selRef_allocateResourcesForMaxNumPoints_ + 7, v25, &v70))
      goto LABEL_59;
    v26 = objc_msgSend(v25, "input");
    v57 = objc_msgSend(v25, "output");
  }
  else
  {
    v57 = 0;
    v26 = 0;
  }
  if (a7)
  {
    v27 = v26;
    v28 = -[BWStillImageScalerNode initWithBasePoolCapacity:nodeConfiguration:]([BWStillImageScalerNode alloc], "initWithBasePoolCapacity:nodeConfiguration:", 1, a4);
    -[BWNode setName:](v28, "setName:", CFSTR("Scaler"));
    -[BWStillImageScalerNode setBlackFillingRequired:](v28, "setBlackFillingRequired:", a11);
    v29 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v29, "addEntriesFromDictionary:", a12);
    objc_msgSend(v29, "addEntriesFromDictionary:", a13);
    -[BWStillImageScalerNode setMainImageDownscalingFactorByAttachedMediaKey:](v28, "setMainImageDownscalingFactorByAttachedMediaKey:", v29);
    v68.receiver = v56;
    v68.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v68, sel_addNode_error_, v28, &v70) & 1) == 0)
      goto LABEL_59;
    if (v57
      && (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v57, -[BWNode input](v28, "input"), v54) & 1) == 0)
    {
      goto LABEL_60;
    }
    v26 = v27;
    if (!v27)
      v26 = -[BWNode input](v28, "input");
    v57 = -[BWNode output](v28, "output");
  }
  if (!a8)
  {
    v51 = v26;
    goto LABEL_26;
  }
  v30 = -[BWMeteorHeadroomNode initWithNodeConfiguration:sensorConfigurationsByPortType:]([BWMeteorHeadroomNode alloc], "initWithNodeConfiguration:sensorConfigurationsByPortType:", a4, a6);
  -[BWNode setName:](v30, "setName:", CFSTR("Meteor Headroom"));
  -[BWMeteorHeadroomNode setHeadroomProcessingType:](v30, "setHeadroomProcessingType:", -[FigCaptureCameraParameters meteorHeadroomProcessingType](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "meteorHeadroomProcessingType"));
  objc_msgSend(a5, "gainMapMainImageDownscalingFactor");
  -[BWMeteorHeadroomNode setGainMapMainImageDownscalingFactor:](v30, "setGainMapMainImageDownscalingFactor:");
  v67.receiver = v56;
  v67.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  if ((objc_msgSendSuper2(&v67, sel_addNode_error_, v30, &v70) & 1) == 0)
  {
LABEL_59:
    FigDebugAssert3();
    return 4294954510;
  }
  if (v57
    && (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v57, -[BWNode input](v30, "input"), v54) & 1) == 0)
  {
    goto LABEL_60;
  }
  if (!v26)
    v26 = -[BWNode input](v30, "input");
  v51 = v26;
  v57 = -[BWNode output](v30, "output");
LABEL_26:
  if (objc_msgSend(v22, "previewQualityAdjustedPhotoFilterRenderingEnabled"))
    v32 = 2;
  else
    v32 = 0;
  v33 = [BWPhotoEncoderNode alloc];
  if (!a9)
    a14 = 0;
  LOBYTE(v50) = objc_msgSend(a5, "stillImageSinkPipelineProcessingMode") == 1;
  v34 = -[BWPhotoEncoderNode initWithNodeConfiguration:sensorConfigurationsByPortType:semanticDevelopmentVersion:inferenceScheduler:alwaysAwaitInference:portraitRenderQuality:deferredPhotoProcessorEnabled:](v33, "initWithNodeConfiguration:sensorConfigurationsByPortType:semanticDevelopmentVersion:inferenceScheduler:alwaysAwaitInference:portraitRenderQuality:deferredPhotoProcessorEnabled:", a4, a6, a10, a14, (int)a10 > 0, v32, v50);
  -[BWNode setName:](v34, "setName:", CFSTR("Encoder"));
  -[BWPhotoEncoderNode setCameraSupportsFlash:](v34, "setCameraSupportsFlash:", a17);
  -[BWPhotoEncoderNode setUsesHighEncodingPriority:](v34, "setUsesHighEncodingPriority:", objc_msgSend(a5, "usesHighEncodingPriority"));
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v36 = objc_msgSend(a12, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v64 != v38)
          objc_enumerationMutation(a12);
        v40 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        v41 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
        objc_msgSend((id)objc_msgSend(a12, "objectForKeyedSubscript:", v40), "floatValue");
        objc_msgSend(v35, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v41, "initWithMainImageDownscalingFactor:propagationMode:", 1), v40);
      }
      v37 = objc_msgSend(a12, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    }
    while (v37);
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v42 = objc_msgSend(a13, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v60 != v44)
          objc_enumerationMutation(a13);
        v46 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
        v47 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
        objc_msgSend((id)objc_msgSend(a13, "objectForKeyedSubscript:", v46), "floatValue");
        objc_msgSend(v35, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v47, "initWithMainImageDownscalingFactor:propagationMode:", 0), v46);
      }
      v43 = objc_msgSend(a13, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v43);
  }
  if (objc_msgSend(v35, "count"))
    -[BWPhotoEncoderNode setAttachedMediaConfigurationByAttachedMediaKey:](v34, "setAttachedMediaConfigurationByAttachedMediaKey:", v35);
  v58.receiver = v56;
  v58.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  v48 = v51;
  if ((objc_msgSendSuper2(&v58, sel_addNode_error_, v34, &v70) & 1) == 0)
    goto LABEL_59;
  if (v57
    && (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v57, -[BWNode input](v34, "input"), v54) & 1) == 0)
  {
LABEL_60:
    FigDebugAssert3();
    return 4294954516;
  }
  if (!v51)
    v48 = -[BWNode input](v34, "input");
  v49 = -[BWNode output](v34, "output");
  result = 4294954516;
  if (v48)
  {
    if (v49)
    {
      result = 0;
      *a15 = v48;
      *a16 = v49;
    }
  }
  return result;
}

@end
