@implementation FigCapturePhotonicEngineSinkPipeline

- (uint64_t)_addMattingInferenceToNode:(uint64_t)a3 mattingVersion:(uint64_t)a4 learnedMattingVersion:(uint64_t)a5 mainImageDownscalingFactor:(unsigned int)a6 targetAspectRatio:(uint64_t)a7 appliesFinalCropRect:(uint64_t)a8 enabledSemantics:(float)a9 metalCommandQueue:(float)a10 mattingSensorConfigurationsByPortType:(char)a11 clientIsCameraOrDerivative:(unsigned int)a12 requiredAdditionalInferenceOutputBuffers:
{
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  char v18;
  uint64_t v23;
  BWMattingV2InferenceConfiguration *v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  BWLearnedMattingInferenceConfiguration *v33;
  double v34;
  double v35;

  if (!a1)
    return 0;
  if (a3 < 2)
  {
    v14 = 4294935514;
LABEL_4:
    v15 = (void *)objc_msgSend(a2, "name");
    v16 = objc_msgSend(v15, "length");
    v17 = CFSTR("Matting");
    if (v16)
      v17 = (const __CFString *)objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(" + %@"), CFSTR("Matting"));
    objc_msgSend(a2, "setName:", v17);
    if ((a11 & 1) == 0)
      objc_msgSend(a2, "setAwaitAsynchronousOutputs:", 1);
    if (a12)
      objc_msgSend(a2, "setAdditionalOutputPoolRetainedBufferCount:", a12);
    return v14;
  }
  v18 = a6;
  v23 = a6 & 0x78 | (4 * ((a6 >> 1) & 1)) | (2 * a6) & (2 * ((_DWORD)a4 == 0));
  if (!(_DWORD)v23)
    goto LABEL_21;
  v27 = -[BWInferenceConfiguration initWithInferenceType:]([BWMattingV2InferenceConfiguration alloc], "initWithInferenceType:", 201);
  -[BWMattingV2InferenceConfiguration setSensorConfigurationsByPortType:](v27, "setSensorConfigurationsByPortType:", a8);
  -[BWMattingV2InferenceConfiguration setEnabledMattes:](v27, "setEnabledMattes:", v23);
  -[BWMattingV2InferenceConfiguration setTuningConfiguration:](v27, "setTuningConfiguration:", 2);
  -[BWInferenceConfiguration setPriority:](v27, "setPriority:", *(unsigned int *)(a1 + 52));
  *(float *)&v28 = a9;
  -[BWMattingV2InferenceConfiguration setMainImageDownscalingFactor:](v27, "setMainImageDownscalingFactor:", v28);
  *(float *)&v29 = a10;
  -[BWMattingV2InferenceConfiguration setTargetAspectRatio:](v27, "setTargetAspectRatio:", v29);
  -[BWMattingV2InferenceConfiguration setAppliesFinalCropRect:](v27, "setAppliesFinalCropRect:", a5);
  -[BWMattingV2InferenceConfiguration setMetalCommandQueue:](v27, "setMetalCommandQueue:", a7);
  v14 = objc_msgSend(a2, "addInferenceOfType:version:configuration:", 201, BWInferenceVersionMakeMajor(a3) & 0xFFFFFFFFFFFFLL, v27);
  if (!(_DWORD)v14)
  {
LABEL_21:
    v14 = 0;
    if (!(_DWORD)a4 || (v18 & 1) == 0)
      goto LABEL_4;
    v30 = (void *)objc_msgSend(a2, "name");
    v31 = objc_msgSend(v30, "length");
    v32 = CFSTR("Learned Matting");
    if (v31)
      v32 = (const __CFString *)objc_msgSend(v30, "stringByAppendingFormat:", CFSTR(" + %@"), CFSTR("Learned Matting"));
    objc_msgSend(a2, "setName:", v32);
    v33 = -[BWInferenceConfiguration initWithInferenceType:]([BWLearnedMattingInferenceConfiguration alloc], "initWithInferenceType:", 107);
    -[BWTiledEspressoInferenceConfiguration setMetalCommandQueue:](v33, "setMetalCommandQueue:", 0);
    *(float *)&v34 = a9;
    -[BWLearnedMattingInferenceConfiguration setMainImageDownscalingFactor:](v33, "setMainImageDownscalingFactor:", v34);
    *(float *)&v35 = a10;
    -[BWLearnedMattingInferenceConfiguration setTargetAspectRatio:](v33, "setTargetAspectRatio:", v35);
    -[BWLearnedMattingInferenceConfiguration setAppliesFinalCropRect:](v33, "setAppliesFinalCropRect:", a5);
    v14 = objc_msgSend(a2, "addInferenceOfType:version:configuration:", 107, BWInferenceVersionMakeMajor(a4) & 0xFFFFFFFFFFFFLL, v33);
    if (!(_DWORD)v14)
      goto LABEL_4;
  }
  return v14;
}

- (BWStillImageCoordinatorNode)stillImageCoordinatorNode
{
  return self->_stillImageCoordinatorNode;
}

- (BWCompressedShotBufferNode)compressedShotBufferNode
{
  return self->_compressedShotBufferNode;
}

+ (NSString)pipelineBaseName
{
  return (NSString *)CFSTR("Photonic Engine Sink Pipeline");
}

- (BWStillImageSampleBufferSinkNode)stillImageSinkNode
{
  return self->_stillImageSinkNode;
}

- (FigCapturePhotonicEngineSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 sourceSensorRawOutputsByPortType:(id)a6 highResStillImageDimensions:(id)a7 supplementalPointCloudCaptureDevice:(id)a8 supplementalPointCloudSourceOutput:(id)a9 captureStatusDelegate:(id)a10 inferenceScheduler:(id)a11 cinematicFramingStatesProvider:(id)a12 graph:(id)a13 name:(id)a14
{
  FigCapturePhotonicEngineSinkPipeline *v20;
  FigCapturePhotonicEngineSinkPipeline *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  v20 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v23, sel_initWithGraph_name_sinkID_, a13, a14, objc_msgSend((id)objc_msgSend(a3, "sinkConfiguration"), "sinkID"));
  v21 = v20;
  if (v20
    && -[FigCapturePhotonicEngineSinkPipeline _buildStillImageSinkPipelineWithConfiguration:captureDevice:sourceOutputsByPortType:sourceSensorRawOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:]((uint64_t)v20, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, (uint64_t)a11, a12, a13))
  {
    FigDebugAssert3();

    return 0;
  }
  return v21;
}

- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(uint64_t)a3 captureDevice:(uint64_t)a4 sourceOutputsByPortType:(uint64_t)a5 sourceSensorRawOutputsByPortType:(uint64_t)a6 highResStillImageDimensions:(uint64_t)a7 supplementalPointCloudCaptureDevice:(uint64_t)a8 supplementalPointCloudSourceOutput:(uint64_t)a9 captureStatusDelegate:(uint64_t)a10 inferenceScheduler:(void *)a11 cinematicFramingStatesProvider:(void *)a12 graph:
{
  uint64_t result;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  int v27;
  unsigned int v28;
  int v29;
  _BOOL4 v30;
  int v31;
  _BOOL8 v32;
  unsigned int v33;
  uint64_t v34;
  BWPhotonicEngineNodeConfiguration *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  char v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  BOOL v69;
  unsigned int v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t j;
  uint64_t v79;
  int v80;
  int v81;
  _BOOL4 v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  float v86;
  float v87;
  int v88;
  unsigned int v89;
  uint64_t v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  _BOOL4 v96;
  uint64_t v97;
  int v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  int v104;
  int v105;
  int v106;
  int v107;
  BOOL v108;
  int v109;
  void *v110;
  float v111;
  float v112;
  unsigned int v113;
  uint64_t v114;
  BWPersonSemanticsConfiguration *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  int v126;
  int v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  unsigned int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  void *v142;
  float v143;
  void *v144;
  void *k;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t m;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t n;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t ii;
  uint64_t v163;
  float v164;
  double v165;
  float v166;
  float v167;
  void *v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t jj;
  void *v176;
  char v177;
  __CFString **v178;
  char v179;
  char v180;
  int v181;
  __CFString *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  int *v187;
  int v188;
  void *v189;
  uint64_t v190;
  int v191;
  unsigned int v192;
  int v193;
  int v194;
  unsigned int v195;
  uint64_t v196;
  uint64_t v197;
  BWPipelineStage *v198;
  BWPipelineStage *v199;
  BWPipelineStage *v200;
  void *v201;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v203;
  char **v204;
  BWAttachedMediaSplitNode *v205;
  BWAttachedMediaSplitNode *v206;
  BWPhotonicEngineNodeConfiguration *v207;
  id v208;
  BWPipelineStage *v209;
  BWStillImageCoordinatorNode *v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  BWStillImageFrameCoordinatorNode *v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t kk;
  void *v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t mm;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  FigCaptureIrisPreparedSettings *v231;
  int v232;
  unsigned int v233;
  uint64_t v234;
  int v235;
  char v236;
  BWCrossoverNode *v237;
  objc_class *v238;
  uint64_t v239;
  uint64_t v240;
  int v241;
  uint64_t v242;
  uint64_t v243;
  BWCrossoverNode *v244;
  uint64_t v245;
  uint64_t v246;
  int v247;
  uint64_t v248;
  uint64_t v249;
  BWPixelTransferNode *v250;
  uint64_t v251;
  _UNKNOWN **v252;
  id v253;
  BWStillImageConditionalRouterNode *v254;
  uint64_t v255;
  uint64_t v256;
  id v257;
  id v258;
  objc_class *v259;
  uint64_t v260;
  void *v261;
  void *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t nn;
  BWPhotonicEngineNodeConfiguration *v267;
  BWPixelTransferNode *v268;
  BWFunnelNode *v269;
  uint64_t v270;
  uint64_t v271;
  int v272;
  uint64_t v273;
  uint64_t v274;
  BWFunnelNode *v275;
  uint64_t v276;
  uint64_t v277;
  int v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  unint64_t v284;
  unint64_t v285;
  BWCompressedShotBufferNode *v286;
  BWPipelineStage *v287;
  int v288;
  int v289;
  int v290;
  int v291;
  int v292;
  int v293;
  double v294;
  double v295;
  int v296;
  char v297;
  int v298;
  char v299;
  char v300;
  char v301;
  int v302;
  float v303;
  char **v304;
  int v305;
  char *v306;
  float v307;
  BWPhotonicEngineNode *v308;
  objc_class *v309;
  BWPipelineStage *v310;
  BWPhotonicEngineNode *v311;
  void *v312;
  uint64_t v313;
  BWNodeOutput *v314;
  BWPixelTransferNode *v315;
  void *v316;
  float v317;
  void *v318;
  void *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t i1;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t i2;
  uint64_t v328;
  void *v329;
  BWStillImageScalerNode *v330;
  BWStillImageSmartStyleUnstyledBufferEmitterNode *v331;
  int v332;
  int v333;
  BWInferenceNode *v334;
  BWInferenceNode *v335;
  uint64_t v336;
  BWMonocularDepthConfiguration *v337;
  uint64_t v338;
  objc_class *v339;
  BWPipelineStage *v340;
  BWFanOutNode *v341;
  objc_class *v342;
  uint64_t v343;
  int v344;
  BWAttachedMediaSplitNode *v345;
  BWAttachedMediaSplitNode *v346;
  BWInferenceNode *v347;
  float v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  BWStillImageFocusPixelDisparityNode *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  char v356;
  uint64_t v357;
  char v358;
  unsigned __int8 v359;
  BWPipelineStage *v360;
  void *v361;
  BWStillImageSmartStyleUnstyledBufferEmitterNode *v362;
  id v363;
  BWStillImageConditionalRouterNode *v364;
  objc_class *v365;
  BWNodeOutput *v366;
  id v367;
  BWStillImageConditionalRouterNode *v368;
  objc_class *v369;
  BWPipelineStage *v370;
  BWInferenceNode *v371;
  NSString *v372;
  uint64_t v373;
  const __CFString *v374;
  float v375;
  objc_class *v376;
  BWInferenceSynchronizerNode *v377;
  objc_class *v378;
  BWStillImageConditionalRouterNode *v379;
  objc_class *v380;
  BWStillImageMultiCameraDoserNode *v381;
  objc_class *v382;
  BWFunnelNode *v383;
  objc_class *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  uint64_t v389;
  const char *v390;
  uint64_t v391;
  int v392;
  void *v393;
  BWDepthConverterNode *v394;
  BWPipelineStage *v395;
  char **v396;
  BWInferenceSynchronizerNode *v397;
  objc_class *v398;
  BWStillImagePortraitMetadataNode *v399;
  double v400;
  BWStillImagePortraitMetadataNode *v401;
  objc_class *v402;
  id v403;
  BWStillImageConditionalRouterNode *v404;
  uint64_t v405;
  BWInferenceNode *v406;
  void *v407;
  void *v408;
  objc_class *v409;
  int v410;
  void *v411;
  BWMatteMediaSuppressionNode *v412;
  id v413;
  BWStillImageConditionalRouterNode *v414;
  BWInferenceNode *v415;
  BWInferenceNode *v416;
  float v417;
  void *v418;
  uint64_t v419;
  int v420;
  BWStillImageSmartStyleAttachmentTransferNode *v421;
  char **v422;
  BWStillImageSmartStyleAttachmentTransferNode *v423;
  objc_class *v424;
  int v425;
  BWStillImageFilterNode *v426;
  double v427;
  double v428;
  BWStillImageSmartStyleAttachmentTransferNode *v429;
  objc_class *v430;
  void *v431;
  BWInferenceSynchronizerNode *v432;
  objc_class *v433;
  objc_class *v434;
  BWStillImageTurnstileNode *v435;
  objc_class *v436;
  uint64_t v437;
  unsigned int v438;
  char v439;
  char v440;
  char v441;
  char **v442;
  BWFunnelNode *v443;
  objc_class *v444;
  uint64_t v445;
  void *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t i3;
  unsigned int v451;
  unsigned int v452;
  float v453;
  uint64_t v454;
  BWStillImageSampleBufferSinkNode *v455;
  objc_class *v456;
  void *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t i4;
  void *v462;
  void *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t i5;
  int v468;
  uint64_t v469;
  uint64_t v470;
  char v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  int v476;
  uint64_t v477;
  uint64_t v478;
  void *v479;
  unsigned int v480;
  unsigned int v481;
  unsigned int v482;
  uint64_t Major;
  int v484;
  char v485;
  unsigned int v486;
  BWPersonSemanticsConfiguration *v487;
  int v488;
  int v489;
  int v490;
  char v491;
  int v492;
  int v493;
  int v494;
  _QWORD *v495;
  uint64_t v496;
  int v497;
  int v498;
  void *v499;
  BWPipelineStage *v500;
  int v501;
  uint64_t v502;
  void *v503;
  unsigned int v504;
  _BOOL4 v505;
  int v506;
  unsigned int v507;
  unsigned int v508;
  uint64_t v509;
  uint64_t v510;
  unsigned int v511;
  int v512;
  int v513;
  void *v514;
  int v515;
  unsigned int v516;
  int v517;
  unsigned int v518;
  int v519;
  int v520;
  int v521;
  int v522;
  unsigned int v523;
  int v524;
  int v525;
  uint64_t v526;
  void *v527;
  unsigned int v528;
  void *v529;
  int v530;
  int v531;
  void *v532;
  _BOOL4 v533;
  uint64_t v534;
  unsigned int v535;
  _BOOL4 v536;
  void *v537;
  unsigned int v538;
  BWPhotonicEngineNodeConfiguration *v539;
  uint64_t v540;
  uint64_t v541;
  int v542;
  unsigned int v543;
  void *v544;
  unsigned int v545;
  uint64_t v546;
  id v547;
  _BOOL4 v548;
  void *v549;
  id v550;
  unsigned int v551;
  BWPipelineStage *v552;
  int v553;
  BOOL v554;
  void *v555;
  unsigned int v556;
  uint64_t v557;
  int v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  int v564;
  char *v565;
  unsigned int v566;
  SEL v567;
  uint64_t v568;
  unsigned int v569;
  BWPipelineStage *v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  id v574;
  BWPixelTransferNode *v575;
  int v576;
  unint64_t v577;
  id v578;
  id v579;
  BWPhotonicEngineNode *v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  BWPipelineStage *v584;
  id obj;
  id obja;
  _BOOL4 v587;
  uint64_t v588;
  int v589;
  id v590;
  BWStillImageConditionalRouterUBConfiguration *v591;
  id v592;
  id v593;
  int v594;
  id v595;
  id v596;
  id v597;
  void *v598;
  FigCaptureCameraParameters *v599;
  id newValue;
  id newValuea;
  BWNodeOutput *newValueb;
  BWNodeOutput *newValuec;
  BWFunnelNode *newValued;
  BWNodeOutput *newValuee;
  id v606;
  __int128 v607;
  __int128 v608;
  __int128 v609;
  __int128 v610;
  __int128 v611;
  __int128 v612;
  __int128 v613;
  __int128 v614;
  objc_super v615;
  __int128 v616;
  __int128 v617;
  __int128 v618;
  __int128 v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  objc_super v623;
  objc_super v624;
  objc_super v625;
  objc_super v626;
  _QWORD v627[5];
  objc_super v628;
  objc_super v629;
  objc_super v630;
  objc_super v631;
  objc_super v632;
  objc_super v633;
  objc_super v634;
  objc_super v635;
  objc_super v636;
  objc_super v637;
  _QWORD v638[6];
  objc_super v639;
  objc_super v640;
  __int128 v641;
  __int128 v642;
  __int128 v643;
  __int128 v644;
  objc_super v645;
  objc_super v646;
  objc_super v647;
  objc_super v648;
  objc_super v649;
  objc_super v650;
  objc_super v651;
  objc_super v652;
  objc_super v653;
  objc_super v654;
  objc_super v655;
  objc_super v656;
  objc_super v657;
  __int128 v658;
  __int128 v659;
  __int128 v660;
  __int128 v661;
  __int128 v662;
  __int128 v663;
  __int128 v664;
  __int128 v665;
  objc_super v666;
  objc_super v667;
  objc_super v668;
  __int128 v669;
  __int128 v670;
  __int128 v671;
  __int128 v672;
  objc_super v673;
  __int128 v674;
  __int128 v675;
  __int128 v676;
  __int128 v677;
  objc_super v678;
  __int128 v679;
  __int128 v680;
  __int128 v681;
  __int128 v682;
  objc_super v683;
  objc_super v684;
  objc_super v685;
  __int128 v686;
  __int128 v687;
  __int128 v688;
  __int128 v689;
  objc_super v690;
  __int128 v691;
  __int128 v692;
  __int128 v693;
  __int128 v694;
  objc_super v695;
  __int128 v696;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  objc_super v704;
  objc_super v705;
  objc_super v706;
  os_log_type_t type;
  int v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  __int128 v712;
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;
  __int128 v727;
  __int128 v728;
  __int128 v729;
  __int128 v730;
  __int128 v731;
  __int128 v732;
  _QWORD v733[5];
  _QWORD v734[4];
  char v735;
  _QWORD v736[4];
  BOOL v737;
  __int128 v738;
  __int128 v739;
  __int128 v740;
  __int128 v741;
  __int128 v742;
  __int128 v743;
  __int128 v744;
  __int128 v745;
  id v746;
  unsigned int v747;
  _BYTE v748[128];
  _BYTE v749[128];
  _BYTE v750[128];
  _BYTE v751[128];
  _QWORD v752[2];
  _BYTE v753[128];
  _BYTE v754[128];
  _BYTE v755[128];
  _BYTE v756[128];
  _BYTE v757[128];
  _BYTE v758[128];
  _BYTE v759[128];
  _BYTE v760[128];
  _BYTE v761[128];
  const __CFString *v762;
  _QWORD v763[2];
  int v764;
  BWNodeOutput *v765;
  _BYTE v766[128];
  _BYTE v767[128];
  _BYTE v768[128];
  _BYTE v769[128];
  _BYTE v770[128];
  _BYTE v771[128];
  _BYTE v772[128];
  _BYTE v773[128];
  uint64_t v774;
  uint64_t v775;
  uint64_t v776;
  _QWORD v777[2];
  uint64_t v778;
  uint64_t v779;
  uint64_t v780;
  uint64_t v781;
  uint64_t v782;
  _QWORD v783[4];

  result = MEMORY[0x1E0C80A78](a1, a2, a3, a4);
  v496 = v16;
  v529 = v17;
  v514 = v18;
  v550 = v19;
  v783[1] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  v23 = result;
  v747 = 0;
  v746 = 0;
  objc_msgSend(v13, "sinkConfiguration");
  objc_opt_class();
  v24 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = (void *)objc_msgSend(v22, "sinkConfiguration");
  obj = v20;
  v537 = v21;
  *(_DWORD *)(v23 + 48) = objc_msgSend(v22, "pipelineStagePriority");
  *(_DWORD *)(v23 + 52) = objc_msgSend(v22, "inferencePriority");
  v528 = objc_msgSend(v22, "deferredProcessingSupported");
  v25 = objc_msgSend(v22, "stillImageSinkPipelineProcessingMode");
  v26 = objc_msgSend(v24, "filterRenderingEnabled");
  v27 = objc_msgSend(v24, "depthDataDeliveryEnabled");
  v28 = v27;
  v542 = v25;
  v554 = v25 == 1;
  v505 = v25 != 1;
  if (v25 == 1)
    v29 = v27;
  else
    v29 = 0;
  v513 = v29;
  v30 = v29 == 1 && objc_msgSend(v22, "depthDataType") == 3;
  v31 = objc_msgSend(v22, "deepFusionEnhancedResolutionDimensions");
  v32 = v25 == 1;
  v543 = v28;
  if (v542 == 1)
    v33 = v28;
  else
    v33 = 0;
  if (v31 > 0)
    v34 = v33;
  else
    v34 = 0;
  v35 = objc_alloc_init(BWPhotonicEngineNodeConfiguration);
  -[BWStillImageNodeConfiguration setDeferredCaptureSupportEnabled:](v35, "setDeferredCaptureSupportEnabled:", v528);
  -[BWStillImageNodeConfiguration setDeferredPhotoProcessorEnabled:](v35, "setDeferredPhotoProcessorEnabled:", v32);
  v517 = v26;
  -[BWStillImageNodeConfiguration setFilterRenderingEnabled:](v35, "setFilterRenderingEnabled:", v26);
  -[BWStillImageNodeConfiguration setStillImageProcessingMode:](v35, "setStillImageProcessingMode:", objc_msgSend(v22, "stillImageSinkPipelineProcessingMode"));
  -[BWStillImageNodeConfiguration setMetalCommandQueue:](v35, "setMetalCommandQueue:", (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice"), "newCommandQueueWithMaxCommandBufferCount:", 512));
  objc_msgSend(v22, "pipelineStagePriority");
  v36 = FigDispatchQueueCreateWithPriority();
  -[MTLCommandQueue setCompletionQueue:](-[BWStillImageNodeConfiguration metalCommandQueue](v35, "metalCommandQueue"), "setCompletionQueue:", v36);
  dispatch_release(v36);
  -[BWStillImageNodeConfiguration setFigThreadPriority:](v35, "setFigThreadPriority:", *(unsigned int *)(v23 + 48));
  -[BWStillImageNodeConfiguration setDepthDataType:](v35, "setDepthDataType:", objc_msgSend(v22, "depthDataType"));
  -[BWStillImageNodeConfiguration setDeepFusionEnhancedResolutionDimensions:](v35, "setDeepFusionEnhancedResolutionDimensions:", objc_msgSend(v22, "deepFusionEnhancedResolutionDimensions"));
  -[BWStillImageNodeConfiguration setDowngradedDeepFusionEnhancedResolutionDimensions:](v35, "setDowngradedDeepFusionEnhancedResolutionDimensions:", objc_msgSend(v22, "downgradedDeepFusionEnhancedResolutionDimensions"));
  v512 = v34;
  -[BWStillImageNodeConfiguration setOptimizedEnhancedResolutionDepthPipelineEnabled:](v35, "setOptimizedEnhancedResolutionDepthPipelineEnabled:", v34);
  -[BWStillImageNodeConfiguration setConstantColorConfidenceMapDimensions:](v35, "setConstantColorConfidenceMapDimensions:", objc_msgSend(v22, "constantColorConfidenceMapDimensions"));
  -[BWStillImageNodeConfiguration setStereoPhotoOutputDimensions:](v35, "setStereoPhotoOutputDimensions:", objc_msgSend(v22, "stereoPhotoOutputDimensions"));
  -[BWStillImageNodeConfiguration setPearlModuleType:](v35, "setPearlModuleType:", objc_msgSend(v22, "pearlModuleType"));
  -[BWStillImageNodeConfiguration setInferenceScheduler:](v35, "setInferenceScheduler:", a10);
  v539 = v35;
  -[BWStillImageNodeConfiguration setMaxLossyCompressionLevel:](v35, "setMaxLossyCompressionLevel:", objc_msgSend(v22, "maxLossyCompressionLevel"));
  v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", obj);
  v38 = 0;
  v519 = objc_msgSend(v22, "depthDataType");
  if (v519 == 7)
  {
    v39 = *MEMORY[0x1E0D05A20];
    v40 = objc_msgSend(obj, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A20]);
    v782 = v39;
    v783[0] = v40;
    v38 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v783, &v782, 1);
    objc_msgSend(v37, "setObject:forKeyedSubscript:", 0, v39);
  }
  v574 = v37;
  v41 = (void *)objc_msgSend(v37, "allKeys");
  v42 = objc_msgSend(obj, "allKeys");
  v541 = objc_msgSend(v550, "count");
  v547 = v41;
  v479 = (void *)v38;
  if ((unint64_t)objc_msgSend(obj, "count") >= 2)
  {
    switch(objc_msgSend(v22, "deviceType"))
    {
      case 4u:
        v43 = *MEMORY[0x1E0D05A18];
        v781 = *MEMORY[0x1E0D05A30];
        v44 = (void *)MEMORY[0x1E0C99D20];
        v45 = &v781;
        goto LABEL_27;
      case 6u:
        v43 = *MEMORY[0x1E0D05A38];
        v565 = (char *)*MEMORY[0x1E0D05A40];
        v780 = *MEMORY[0x1E0D05A40];
        v48 = (void *)MEMORY[0x1E0C99D20];
        v49 = &v780;
        goto LABEL_32;
      case 8u:
        v43 = *MEMORY[0x1E0D05A28];
        v778 = *MEMORY[0x1E0D05A18];
        v44 = (void *)MEMORY[0x1E0C99D20];
        v45 = &v778;
LABEL_27:
        v50 = 1;
        goto LABEL_29;
      case 9u:
        v43 = *MEMORY[0x1E0D05A28];
        v51 = *MEMORY[0x1E0D05A30];
        v777[0] = *MEMORY[0x1E0D05A18];
        v777[1] = v51;
        v44 = (void *)MEMORY[0x1E0C99D20];
        v45 = v777;
        v50 = 2;
LABEL_29:
        v565 = 0;
        v590 = (id)objc_msgSend(v44, "arrayWithObjects:count:", v45, v50);
        v544 = v590;
        goto LABEL_33;
      case 0xCu:
        v43 = *MEMORY[0x1E0D05A50];
        v565 = (char *)*MEMORY[0x1E0D05A40];
        v779 = *MEMORY[0x1E0D05A40];
        v48 = (void *)MEMORY[0x1E0C99D20];
        v49 = &v779;
        goto LABEL_32;
      case 0xDu:
        v43 = *MEMORY[0x1E0D05A18];
        v565 = (char *)*MEMORY[0x1E0D05A20];
        v776 = *MEMORY[0x1E0D05A20];
        v48 = (void *)MEMORY[0x1E0C99D20];
        v49 = &v776;
LABEL_32:
        v590 = (id)objc_msgSend(v48, "arrayWithObjects:count:", v49, 1);
        v544 = 0;
LABEL_33:
        v52 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v42);
        v53 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v54 = v53;
        if (v43)
          objc_msgSend(v53, "addObject:", v43);
        v534 = v43;
        if (v544)
          objc_msgSend(v54, "addObjectsFromArray:");
        if (v565)
          objc_msgSend(v54, "addObject:");
        if ((objc_msgSend(v52, "isEqualToSet:", v54) & 1) != 0)
          goto LABEL_40;
        goto LABEL_781;
      default:
        goto LABEL_781;
    }
  }
  v46 = objc_msgSend(v41, "firstObject");
  v534 = v46;
  if (v30)
  {
    v775 = *MEMORY[0x1E0D05A40];
    v590 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v775, 1);
  }
  else
  {
    v47 = v46;
    v774 = v46;
    v590 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v774, 1);
    if (!v47)
      goto LABEL_781;
  }
  v565 = 0;
  v544 = 0;
LABEL_40:
  v557 = objc_msgSend(v550, "allKeys");
  if (v541)
  {
    v55 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v557);
    v56 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v57 = v56;
    if (v534)
      objc_msgSend(v56, "addObject:");
    if (v544)
      objc_msgSend(v57, "addObjectsFromArray:");
    v58 = objc_msgSend(v565, "isEqualToString:", *MEMORY[0x1E0D05A40]);
    v59 = objc_msgSend(v565, "isEqualToString:", *MEMORY[0x1E0D05A20]);
    if (v565 && (v58 & 1) == 0 && (v59 & 1) == 0)
      objc_msgSend(v57, "addObject:", v565);
    if ((objc_msgSend(v55, "isEqualToSet:", v57) & 1) == 0)
      goto LABEL_781;
  }
  v478 = v42;
  v589 = v30;
  v532 = v24;
  v546 = v23;
  v599 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  newValue = (id)objc_msgSend(v22, "sensorIDStringsByPortType");
  v598 = (void *)objc_msgSend(v22, "cameraInfoByPortType");
  v60 = (void *)objc_msgSend(v22, "moduleCalibrationByPortType");
  v606 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v587 = FigCaptureVideoDimensionsAreValid(objc_msgSend(v22, "outputStillImageDimensions"));
  v548 = FigCaptureVideoDimensionsAreValid(objc_msgSend(v22, "gdcInDCProcessorOutputCropDimensions"));
  v742 = 0u;
  v743 = 0u;
  v744 = 0u;
  v745 = 0u;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v742, v773, 16);
  if (v61)
  {
    v62 = v61;
    v577 = 0;
    v560 = 0;
    v593 = *(id *)v743;
    v581 = *MEMORY[0x1E0D05A38];
    v63 = *MEMORY[0x1E0D05A40];
    v568 = *MEMORY[0x1E0D05A20];
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(id *)v743 != v593)
          objc_enumerationMutation(obj);
        v65 = *(void **)(*((_QWORD *)&v742 + 1) + 8 * i);
        v66 = objc_msgSend(newValue, "objectForKeyedSubscript:", v65);
        objc_msgSend(v606, "setObject:forKeyedSubscript:", -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:", v65, v66, -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](v599, "sensorIDDictionaryForPortType:sensorIDString:", v65, v66), objc_msgSend(v598, "objectForKeyedSubscript:", v65), objc_msgSend(v60, "objectForKeyedSubscript:", v65)), v65);
        if (v589 && objc_msgSend(v65, "isEqualToString:", v581))
        {
          v67 = objc_msgSend(newValue, "objectForKeyedSubscript:", v63);
          objc_msgSend(v606, "setObject:forKeyedSubscript:", -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:", v63, v67, -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](v599, "sensorIDDictionaryForPortType:sensorIDString:", v63, v67), objc_msgSend(v598, "objectForKeyedSubscript:", v63), objc_msgSend(v60, "objectForKeyedSubscript:", v63)), v63);
        }
        if (v587
          && (objc_msgSend(v65, "isEqualToString:", v63) & 1) == 0
          && (objc_msgSend(v65, "isEqualToString:", v568) & 1) == 0)
        {
          v68 = (void *)objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v65), "formatRequirements");
          v69 = FigCaptureVideoDimensionsAreValid(v560 | (v577 << 32));
          v70 = objc_msgSend(v68, "width");
          v71 = v70;
          if (v69)
          {
            if (v560 != v70 || v577 != objc_msgSend(v68, "height"))
              goto LABEL_787;
          }
          else
          {
            v72 = v70;
            v73 = objc_msgSend(v68, "height");
            if (!FigCaptureVideoDimensionsAreValid(v72 | ((unint64_t)v73 << 32)))
              goto LABEL_787;
            v577 = v73;
            v560 = v71;
          }
        }
      }
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v742, v773, 16);
    }
    while (v62);
  }
  else
  {
    LODWORD(v577) = 0;
    LODWORD(v560) = 0;
  }
  v74 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v738 = 0u;
  v739 = 0u;
  v740 = 0u;
  v741 = 0u;
  v75 = objc_msgSend(v606, "countByEnumeratingWithState:objects:count:", &v738, v772, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v739;
    do
    {
      for (j = 0; j != v76; ++j)
      {
        if (*(_QWORD *)v739 != v77)
          objc_enumerationMutation(v606);
        v79 = *(_QWORD *)(*((_QWORD *)&v738 + 1) + 8 * j);
        if (objc_msgSend(v590, "containsObject:", v79))
          objc_msgSend(v74, "setObject:forKeyedSubscript:", objc_msgSend(v606, "objectForKeyedSubscript:", v79), v79);
      }
      v76 = objc_msgSend(v606, "countByEnumeratingWithState:objects:count:", &v738, v772, 16);
    }
    while (v76);
  }
  v527 = v74;
  v535 = objc_msgSend(v22, "clientIsCameraOrDerivative");
  v502 = objc_msgSend(v574, "objectForKeyedSubscript:", v565);
  v80 = objc_msgSend(v565, "isEqualToString:", *MEMORY[0x1E0D05A40]);
  v81 = objc_msgSend(v22, "pearlModuleType");
  v594 = objc_msgSend(v22, "pearlModuleType");
  v538 = objc_msgSend(v532, "bravoConstituentPhotoDeliveryEnabled");
  if (((v538 ^ 1) & 1) == 0 && !v544)
    goto LABEL_781;
  v520 = objc_msgSend(v22, "depthDataType");
  v476 = v80;
  if (!v543)
  {
    v83 = 0;
    v525 = 0;
    v533 = 0;
    if (v544)
      goto LABEL_94;
LABEL_101:
    v510 = objc_msgSend(v590, "firstObject");
    goto LABEL_102;
  }
  if (v544)
    v82 = v505;
  else
    v82 = 0;
  v533 = v82;
  if (v82
    && (objc_msgSend(v22, "depthDataType") != 8
     || -[FigCaptureCameraParameters disparityVersion](v599, "disparityVersion") <= 4))
  {
    goto LABEL_781;
  }
  if ((v80 & v505) != 1)
  {
    v525 = 0;
    v83 = v517;
    if (v544)
      goto LABEL_94;
    goto LABEL_101;
  }
  if (objc_msgSend(v22, "depthDataType") != 3)
    goto LABEL_781;
  v525 = 1;
  v83 = v517;
  if (!v544)
    goto LABEL_101;
LABEL_94:
  v510 = *MEMORY[0x1E0D05A28];
  if ((objc_msgSend(v590, "containsObject:") & 1) == 0)
  {
    v510 = *MEMORY[0x1E0D05A18];
    if ((objc_msgSend(v590, "containsObject:") & 1) == 0)
    {
      v84 = *MEMORY[0x1E0D05A30];
      if (objc_msgSend(v590, "containsObject:", *MEMORY[0x1E0D05A30]))
        v85 = v84;
      else
        v85 = 0;
      v510 = v85;
    }
  }
LABEL_102:
  v86 = 0.0;
  if (v543)
  {
    if (v537)
    {
      objc_msgSend(v537, "requestedZoomFactorRelativeToPortType:", v510);
      v86 = v87;
    }
    else
    {
      v86 = 1.0;
    }
  }
  if (objc_msgSend(v22, "highQualityPhotoCaptureForVideoFormatEnabled"))
  {
    if (v543 | v538)
      v88 = 0;
    else
      v88 = 2;
  }
  else
  {
    v88 = objc_msgSend(v22, "stillImageStabilizationSupported");
  }
  if (objc_msgSend(v22, "learnedNRSupported"))
  {
    if (v88 == 2)
    {
      v90 = 1;
    }
    else if (v88 == 1)
    {
      v89 = (v86 == 2.0) & ~objc_msgSend(v537, "zeroShutterLagEnabled");
      if (v520 == 8)
        v90 = v89;
      else
        v90 = 0;
    }
    else
    {
      v90 = 0;
    }
    if (objc_msgSend(v22, "ultraHighResolutionProcessingEnabled"))
    {
      v508 = objc_msgSend(v537, "learnedNRUltraHighResolutionDowngradeSupported");
      if (v508)
        v90 = 5;
      else
        v90 = v90 | 4;
    }
    else
    {
      v508 = 0;
    }
    if (v528)
    {
      if (BWQSubResolutionFlavorSupported((void *)objc_msgSend(v22, "dimensionsByQSubResolutionFlavorByPortType"), 2))
      {
        v91 = objc_msgSend(v537, "learnedNRUltraHighResolutionDowngradeSupported");
        v508 |= v91;
        if (v91)
          v92 = 10;
        else
          v92 = 8;
        v90 = v92 | v90;
      }
    }
    else if (v542 == 1)
    {
      if (FigCaptureVideoDimensionsAreValid(objc_msgSend(v22, "stereoPhotoOutputDimensions")))
        v90 = v90 | 0x10;
      else
        v90 = v90 | 1;
    }
  }
  else
  {
    v508 = 0;
    v90 = 0;
  }
  v93 = objc_msgSend(v22, "deepFusionSupported");
  v526 = v90;
  if ((_DWORD)v90)
    v94 = 1;
  else
    v94 = v93;
  if (v542 != 1)
    v94 = 0;
  if (v88 == 1 || v88 == 2 && !(_DWORD)v90)
  {
    v95 = v94 ^ 1;
    v506 = v94 ^ 1;
  }
  else
  {
    v506 = 0;
    v95 = v94 ^ 1;
  }
  v530 = objc_msgSend(v532, "digitalFlashCaptureEnabled");
  v569 = objc_msgSend(v532, "stereoPhotoCaptureEnabled");
  v518 = objc_msgSend(v532, "portraitEffectsMatteDeliveryEnabled");
  v96 = (v518 & 1) != 0 || objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "count") != 0;
  v536 = v96;
  v97 = -[FigCaptureCameraParameters personSemanticsVersion](v599, "personSemanticsVersion");
  v98 = v97;
  if ((_DWORD)v97 && (int)v97 <= 4)
    goto LABEL_781;
  v516 = v88;
  Major = BWInferenceVersionMakeMajor(v97);
  v99 = (void *)objc_msgSend((id)objc_msgSend(v527, "allValues"), "firstObject");
  if (v543)
  {
    v100 = v99;
    v101 = objc_msgSend(v99, "portType");
    v102 = objc_msgSend(v100, "sensorIDString");
    *(float *)&v103 = v86;
    v104 = -[FigCaptureCameraParameters sdofRenderingVersionForPortType:sensorIDString:zoomFactor:](v599, "sdofRenderingVersionForPortType:sensorIDString:zoomFactor:", v101, v102, v103);
    if (v104 && v104 <= 4)
      goto LABEL_781;
  }
  else
  {
    v104 = 0;
  }
  v486 = v104;
  if (v536)
  {
    v105 = -[FigCaptureCameraParameters mattingVersion](v599, "mattingVersion");
    if (v105 && v105 <= 1)
      goto LABEL_781;
  }
  else
  {
    v105 = 0;
  }
  v482 = v105;
  v481 = -[FigCaptureCameraParameters learnedMattingVersion](v599, "learnedMattingVersion");
  if (v519 == 7)
    v106 = v83;
  else
    v106 = 1;
  v489 = v106;
  v107 = v525 | v589;
  v108 = v81 == 2 || v594 == 3;
  v109 = v108;
  v490 = v109;
  if (!v108)
    v107 = 0;
  v515 = v107;
  v484 = v83;
  v522 = v95;
  if (v533)
  {
    if (!objc_msgSend(v22, "continuousZoomWithDepthSupported") && ((v513 ^ 1 | v589) & 1) != 0)
      goto LABEL_174;
  }
  else if ((v513 ^ 1 | v589) == 1)
  {
LABEL_174:
    v110 = (void *)objc_msgSend(v514, "firstObject");
    v556 = 0;
    v111 = 0.0;
    goto LABEL_180;
  }
  v110 = (void *)objc_msgSend(v514, "firstObject");
  v111 = 0.0;
  if (objc_msgSend(v110, "dimensions") && (unint64_t)objc_msgSend(v110, "dimensions") >> 32)
  {
    v112 = (float)(int)objc_msgSend(v110, "dimensions");
    v111 = v112 / (float)(int)((unint64_t)objc_msgSend(v110, "dimensions") >> 32);
  }
  v556 = 1;
LABEL_180:
  v488 = objc_msgSend(v22, "continuousZoomWithDepthSupported");
  v113 = BWEmitUnstyledBufferForInferencesOrAdjustedImageWithConfigurations(v22, v532);
  v114 = MEMORY[0x1E0C809B0];
  v504 = v113;
  if (v113)
  {
    v736[0] = MEMORY[0x1E0C809B0];
    v736[1] = 3221225472;
    v736[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke;
    v736[3] = &__block_descriptor_33_e31_B16__0__opaqueCMSampleBuffer__8l;
    v737 = v554;
    v495 = v736;
  }
  else
  {
    v495 = 0;
  }
  if (v536)
  {
    v115 = -[BWInferenceConfiguration initWithInferenceType:]([BWPersonSemanticsConfiguration alloc], "initWithInferenceType:", 104);
    -[BWInferenceConfiguration setPriority:](v115, "setPriority:", *(unsigned int *)(v546 + 52));
    -[BWPersonSemanticsConfiguration setAppliesFinalCropRect:](v115, "setAppliesFinalCropRect:", v556);
    if (v518)
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v115, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v115, "enabledSemantics") | 1);
    v116 = (void *)objc_msgSend(v22, "supportedSemanticSegmentationMatteURNs");
    v117 = *MEMORY[0x1E0D09288];
    if (objc_msgSend(v116, "containsObject:", *MEMORY[0x1E0D09288])
      && objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v117))
    {
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v115, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v115, "enabledSemantics") | 2);
    }
    v118 = (void *)objc_msgSend(v22, "supportedSemanticSegmentationMatteURNs");
    v119 = *MEMORY[0x1E0D09290];
    if (objc_msgSend(v118, "containsObject:", *MEMORY[0x1E0D09290])
      && objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v119))
    {
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v115, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v115, "enabledSemantics") | 8);
    }
    v120 = (void *)objc_msgSend(v22, "supportedSemanticSegmentationMatteURNs");
    v121 = *MEMORY[0x1E0D092A0];
    if (objc_msgSend(v120, "containsObject:", *MEMORY[0x1E0D092A0])
      && objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v121))
    {
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v115, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v115, "enabledSemantics") | 0x10);
    }
    v122 = (void *)objc_msgSend(v22, "supportedSemanticSegmentationMatteURNs");
    v123 = *MEMORY[0x1E0D09280];
    if (objc_msgSend(v122, "containsObject:", *MEMORY[0x1E0D09280])
      && objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v123))
    {
      -[BWPersonSemanticsConfiguration setEnabledSemantics:](v115, "setEnabledSemantics:", -[BWPersonSemanticsConfiguration enabledSemantics](v115, "enabledSemantics") | 0x20);
    }
  }
  else
  {
    v115 = 0;
  }
  v734[0] = v114;
  v734[1] = 3221225472;
  v734[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_2;
  v734[3] = &__block_descriptor_33_e38___NSSet_16__0__opaqueCMSampleBuffer__8l;
  v735 = v535;
  v733[0] = v114;
  v733[1] = 3221225472;
  v733[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_578;
  v733[3] = &unk_1E491FCB8;
  v733[4] = v734;
  if (objc_msgSend(v22, "allowsMultipleInflightCaptures"))
  {
    v124 = 1;
    if (objc_msgSend(v22, "responsiveShutterSupported"))
    {
      if (objc_msgSend(v22, "responsiveShutterEnabled"))
        v124 = 2;
      else
        v124 = 1;
    }
  }
  else
  {
    v124 = 0;
  }
  v125 = objc_msgSend(v22, "redEyeReductionVersion");
  if (v125 && v125 <= 1)
    goto LABEL_781;
  v524 = v125;
  v126 = objc_msgSend(v22, "semanticRenderingVersion");
  newValuea = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v498 = v126;
  v499 = v110;
  v493 = v98;
  if (v126)
    v511 = objc_msgSend(v22, "semanticDevelopmentVersion");
  else
    v511 = 0;
  v127 = objc_msgSend(v532, "demosaicedRawEnabled");
  if (v127)
    objc_msgSend(newValuea, "setObject:forKeyedSubscript:", BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw(), &unk_1E49F8B98);
  if (v515)
  {
    v128 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v128, "addObject:", 0x1E49511B8);
    objc_msgSend(v128, "addObjectsFromArray:", BWInferenceLowResPersonInstanceMaskKeys());
    objc_msgSend(newValuea, "setObject:forKeyedSubscript:", v128, &unk_1E49F8BB0);
  }
  if (objc_msgSend(v22, "smartStyleReversibilityEnabled"))
    objc_msgSend(newValuea, "setObject:forKeyedSubscript:", BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw(), &unk_1E49F8BC8);
  if (objc_msgSend((id)objc_msgSend(v22, "portTypesWithGeometricDistortionCorrectionEnabled"), "count"))
  {
    v732 = 0u;
    v731 = 0u;
    v730 = 0u;
    v729 = 0u;
    v129 = objc_msgSend(v590, "countByEnumeratingWithState:objects:count:", &v729, v771, 16);
    if (v129)
    {
      v130 = v129;
      v131 = *(_QWORD *)v730;
LABEL_219:
      v132 = 0;
      while (1)
      {
        if (*(_QWORD *)v730 != v131)
          objc_enumerationMutation(v590);
        if ((objc_msgSend((id)objc_msgSend(v22, "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", *(_QWORD *)(*((_QWORD *)&v729 + 1) + 8 * v132)) & 1) != 0)break;
        if (v130 == ++v132)
        {
          v130 = objc_msgSend(v590, "countByEnumeratingWithState:objects:count:", &v729, v771, 16);
          if (v130)
            goto LABEL_219;
          goto LABEL_225;
        }
      }
    }
    else
    {
LABEL_225:
      if ((v538 & 1) == 0)
      {
        v134 = v543;
        if (objc_msgSend(v22, "deviceType") == 12)
          v133 = objc_msgSend((id)objc_msgSend(v22, "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", v534);
        else
          v133 = 0;
LABEL_227:
        if (v134)
          v135 = objc_msgSend(v22, "continuousZoomWithDepthSupported") | v133;
        else
          v135 = 1;
        v136 = objc_msgSend(v22, "gdcInDCProcessorSupported") & v135;
        goto LABEL_232;
      }
    }
    v133 = 1;
    v134 = v543;
    goto LABEL_227;
  }
  v136 = 0;
LABEL_232:
  if (objc_msgSend((id)objc_msgSend(v22, "portTypesWithIntelligentDistortionCorrectionEnabled"), "count"))
    v137 = 1;
  else
    v137 = v136;
  v492 = v137;
  if (v587)
  {
    if (v594 == 3)
      v138 = 0;
    else
      v138 = v136;
    v521 = v138;
  }
  else
  {
    v521 = 0;
  }
  v494 = v136;
  if ((int)v560 < (int)objc_msgSend(v22, "rawSensorDimensions"))
    goto LABEL_247;
  v139 = objc_msgSend(v22, "rawSensorDimensions");
  v140 = v521;
  if ((int)v577 < SHIDWORD(v139))
    v140 = 0;
  if (v140 == 1)
  {
    if (v548)
      v141 = objc_msgSend(v22, "gdcInDCProcessorOutputCropDimensions");
    else
      v141 = objc_msgSend(v22, "outputStillImageDimensions");
    v477 = v141;
  }
  else
  {
LABEL_247:
    v477 = 0;
  }
  v487 = v115;
  v142 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v22, "gainMapMainImageDownscalingFactor");
  if (v143 != 0.0)
  {
    v144 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v22, "gainMapMainImageDownscalingFactor");
    objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v144, "numberWithFloat:"), 0x1E4936818);
  }
  v540 = v124;
  v501 = v127;
  if (v127)
  {
    objc_msgSend(v142, "setObject:forKeyedSubscript:", &unk_1E4A02E10, 0x1E495B0F8);
    v728 = 0u;
    v727 = 0u;
    v726 = 0u;
    v725 = 0u;
    v595 = (id)objc_msgSend(newValuea, "countByEnumeratingWithState:objects:count:", &v725, v770, 16);
    if (v595)
    {
      v582 = *(_QWORD *)v726;
      do
      {
        for (k = 0; k != v595; k = (char *)k + 1)
        {
          if (*(_QWORD *)v726 != v582)
            objc_enumerationMutation(newValuea);
          v146 = *(_QWORD *)(*((_QWORD *)&v725 + 1) + 8 * (_QWORD)k);
          v721 = 0u;
          v722 = 0u;
          v723 = 0u;
          v724 = 0u;
          v147 = (void *)objc_msgSend(newValuea, "objectForKeyedSubscript:", v146);
          v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v721, v769, 16);
          if (v148)
          {
            v149 = v148;
            v150 = *(_QWORD *)v722;
            do
            {
              for (m = 0; m != v149; ++m)
              {
                if (*(_QWORD *)v722 != v150)
                  objc_enumerationMutation(v147);
                v152 = *(_QWORD *)(*((_QWORD *)&v721 + 1) + 8 * m);
                v153 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v22, "ubInferenceMainImageDownscalingFactor");
                objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(v153, "numberWithFloat:"), v152);
              }
              v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v721, v769, 16);
            }
            while (v149);
          }
        }
        v595 = (id)objc_msgSend(newValuea, "countByEnumeratingWithState:objects:count:", &v725, v770, 16);
      }
      while (v595);
    }
  }
  if (objc_msgSend(v22, "smartStyleReversibilityEnabled"))
  {
    objc_msgSend(v142, "setObject:forKeyedSubscript:", &unk_1E4A02E10, 0x1E495B278);
    v720 = 0u;
    v719 = 0u;
    v718 = 0u;
    v717 = 0u;
    v154 = objc_msgSend(newValuea, "countByEnumeratingWithState:objects:count:", &v717, v768, 16);
    if (v154)
    {
      v155 = v154;
      v596 = *(id *)v718;
      do
      {
        for (n = 0; n != v155; ++n)
        {
          if (*(id *)v718 != v596)
            objc_enumerationMutation(newValuea);
          v157 = *(_QWORD *)(*((_QWORD *)&v717 + 1) + 8 * n);
          v713 = 0u;
          v714 = 0u;
          v715 = 0u;
          v716 = 0u;
          v158 = (void *)objc_msgSend(newValuea, "objectForKeyedSubscript:", v157);
          v159 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v713, v767, 16);
          if (v159)
          {
            v160 = v159;
            v161 = *(_QWORD *)v714;
            do
            {
              for (ii = 0; ii != v160; ++ii)
              {
                if (*(_QWORD *)v714 != v161)
                  objc_enumerationMutation(v158);
                v163 = *(_QWORD *)(*((_QWORD *)&v713 + 1) + 8 * ii);
                objc_msgSend(v22, "gainMapMainImageDownscalingFactor");
                if (v164 <= 0.0)
                {
                  objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
                  v166 = *(float *)&v165;
                  LODWORD(v165) = 2.0;
                  if (v166 > 0.0)
                    objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor", v165);
                }
                else
                {
                  objc_msgSend(v22, "gainMapMainImageDownscalingFactor");
                }
                objc_msgSend(v142, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v165), v163);
              }
              v160 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v713, v767, 16);
            }
            while (v160);
          }
        }
        v155 = objc_msgSend(newValuea, "countByEnumeratingWithState:objects:count:", &v717, v768, 16);
      }
      while (v155);
    }
  }
  v555 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v549 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v142);
  objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
  if (v167 != 0.0)
  {
    if (v518)
    {
      v168 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
      objc_msgSend(v555, "setObject:forKeyedSubscript:", objc_msgSend(v168, "numberWithFloat:"), 0x1E495AF38);
      if ((v556 & 1) == 0)
      {
        v169 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
        objc_msgSend(v549, "setObject:forKeyedSubscript:", objc_msgSend(v169, "numberWithFloat:"), 0x1E495AF38);
      }
    }
    v712 = 0u;
    v711 = 0u;
    v710 = 0u;
    v709 = 0u;
    v597 = (id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs");
    v170 = objc_msgSend(v597, "countByEnumeratingWithState:objects:count:", &v709, v766, 16);
    if (v170)
    {
      v171 = v170;
      v172 = *(_QWORD *)v710;
      v173 = *MEMORY[0x1E0D09288];
      v174 = *MEMORY[0x1E0D09290];
      v583 = *MEMORY[0x1E0D092A0];
      v578 = (id)*MEMORY[0x1E0D09280];
      do
      {
        for (jj = 0; jj != v171; ++jj)
        {
          if (*(_QWORD *)v710 != v172)
            objc_enumerationMutation(v597);
          v176 = *(void **)(*((_QWORD *)&v709 + 1) + 8 * jj);
          v177 = objc_msgSend(v176, "isEqualToString:", v173);
          v178 = BWAttachedMediaKey_PersonSemanticsHair;
          if ((v177 & 1) == 0)
          {
            v179 = objc_msgSend(v176, "isEqualToString:", v174);
            v178 = BWAttachedMediaKey_PersonSemanticsSkin;
            if ((v179 & 1) == 0)
            {
              v180 = objc_msgSend(v176, "isEqualToString:", v583);
              v178 = BWAttachedMediaKey_PersonSemanticsTeeth;
              if ((v180 & 1) == 0)
              {
                v181 = objc_msgSend(v176, "isEqualToString:", v578);
                v178 = BWAttachedMediaKey_PersonSemanticsGlasses;
                if (!v181)
                  continue;
              }
            }
          }
          v182 = *v178;
          if (*v178)
          {
            v183 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
            objc_msgSend(v555, "setObject:forKeyedSubscript:", objc_msgSend(v183, "numberWithFloat:"), v182);
            if ((v556 & 1) == 0)
            {
              v184 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
              objc_msgSend(v549, "setObject:forKeyedSubscript:", objc_msgSend(v184, "numberWithFloat:"), v182);
            }
          }
        }
        v171 = objc_msgSend(v597, "countByEnumeratingWithState:objects:count:", &v709, v766, 16);
      }
      while (v171);
    }
  }
  v491 = objc_msgSend(v22, "allowedToModifyInputBuffers");
  if (v535)
  {
    v185 = v546;
    v186 = v532;
    v187 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
    v188 = v540;
    v189 = v537;
    v190 = v526;
    if (+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
    {
      v485 = objc_msgSend(v22, "captureTimePhotosCurationSupported");
LABEL_311:
      v480 = 0;
      goto LABEL_314;
    }
LABEL_310:
    v485 = 0;
    goto LABEL_311;
  }
  v185 = v546;
  v186 = v532;
  v187 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__stereoVideoCaptureDuration;
  v188 = v540;
  v189 = v537;
  v190 = v526;
  if (!v536)
    goto LABEL_310;
  if (v538)
    v191 = 8 * objc_msgSend(v574, "count");
  else
    v191 = 8;
  v485 = 0;
  v480 = v191 - 1;
LABEL_314:
  v523 = v530 & v522;
  v531 = v538 | v533 | v569;
  if (v188 == 2)
  {
    v192 = objc_msgSend(v22, "responsiveShutterSupported");
    v193 = 0;
    if (v541)
      v194 = v538 ^ 1;
    else
      v194 = 0;
    v507 = v192;
    if (v192 && v194)
    {
      v193 = objc_msgSend(v22, "fastCapturePrioritizationEnabled");
      v507 = 1;
    }
  }
  else
  {
    v507 = 0;
    v193 = 0;
  }
  v497 = v193;
  objc_msgSend(v189, "setStillImageCaptureEnabled:", 1);
  objc_msgSend(v189, "setStereoPhotoCaptureEnabled:", v569);
  objc_msgSend(v189, "setIrisFrameHarvestingEnabled:", objc_msgSend(v186, "irisFrameHarvestingEnabled"));
  objc_msgSend(v189, "setStillImageFusionScheme:", objc_msgSend(v22, "noiseReductionAndFusionScheme"));
  objc_msgSend(v189, "setUnifiedBracketingMode:", v516);
  objc_msgSend(v189, "setSifrStillImageCaptureEnabledIfAvailable:", objc_msgSend(v22, "sifrStillImageCaptureEnabledIfAvailable"));
  objc_msgSend(v189, "setSoftISPEnabled:", objc_msgSend(v22, "softISPSupported"));
  objc_msgSend(v189, "setSensorRawStillImageOutputsEnabled:", v541 != 0);
  objc_msgSend(v189, "setDeepFusionEnabled:", objc_msgSend(v22, "deepFusionSupported"));
  if (objc_msgSend(v22, "depthWithDeepFusionSupported"))
  {
    v195 = v543;
    v196 = v543 & (objc_msgSend(v22, "deepFusionSupported") & (v519 != 7));
  }
  else
  {
    v196 = 0;
    v195 = v543;
  }
  objc_msgSend(v189, "setDepthWithDeepFusionEnabled:", v196);
  objc_msgSend(v189, "setLearnedNRMode:", v190);
  objc_msgSend(v189, "setLearnedNRUltraHighResolutionDowngradeEnabled:", v508);
  objc_msgSend(v189, "setSwfrEnabled:", objc_msgSend(v22, "swfrVersion") != 0);
  objc_msgSend(v189, "setConstantColorEnabled:", objc_msgSend(v22, "constantColorVersion") != 0);
  objc_msgSend(v189, "setDigitalFlashEnabled:", v523);
  objc_msgSend(v189, "setRedSaturationMitigationEnabled:", objc_msgSend(v186, "optimizesImagesForOfflineVideoStabilization") ^ 1);
  objc_msgSend(v189, "registerForAEMatrixMetadata");
  objc_msgSend(v189, "setRedEyeReductionEnabled:", v524 != 0);
  if (v544)
    v197 = v195 & (v538 ^ 1);
  else
    v197 = 0;
  objc_msgSend(v189, "setDisparityGenerationFromReferenceFramesSupported:", v197);
  objc_msgSend(v189, "setSupplementalPointCloudCaptureDevice:", v529);
  objc_msgSend(v189, "setExifFocalLengthsByZoomFactor:", objc_msgSend(v186, "exifFocalLengthsByZoomFactor"));
  v198 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage"), *(unsigned int *)(v185 + v187[426]));
  v552 = v198;
  v199 = v198;
  if (v531)
  {
    v552 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.ub.default"), *(unsigned int *)(v185 + v187[426]));
    v199 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.multi"), *(unsigned int *)(v185 + v187[426]));
  }
  v570 = v198;
  v200 = v198;
  if (v188 == 2)
  {
    v200 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.scale-and-encode"), *(unsigned int *)(v185 + v187[426]));
    if (v507)
      v570 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.buffer-servicing"), *(unsigned int *)(v185 + v187[426]));
    else
      v570 = v198;
  }
  v500 = v199;
  v584 = v198;
  v509 = (uint64_t)v200;
  v201 = a12;
  if (dword_1ECFE9B10)
  {
    v708 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1ECFE9B10)
    {
      v708 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v203 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v204 = &selRef_humanFaceEyeDetectionEnabled;
  if (v502)
  {
    v205 = [BWAttachedMediaSplitNode alloc];
    v762 = CFSTR("Depth");
    v206 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v205, "initWithAttachedMediaKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v762, 1));
    v706.receiver = (id)v185;
    v706.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    v207 = v539;
    v208 = v547;
    if ((objc_msgSendSuper2(&v706, sel_addNode_error_, v206, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v502, -[BWNode input](v206, "input"), v570);
    if (v747)
      goto LABEL_786;
    -[BWNode setName:](v206, "setName:", CFSTR("Still Image IR-Depth Splitter"));
    -[BWAttachedMediaSplitNode setEmitsNodeErrorsForMissingAttachedMedia:](v206, "setEmitsNodeErrorsForMissingAttachedMedia:", 1);
    v561 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v206, "outputs"), "objectAtIndexedSubscript:", 0);
  }
  else
  {
    v561 = 0;
    v207 = v539;
    v208 = v547;
  }
  obja = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v574, "count", v469, v473));
  v579 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v550, "count"));
  v503 = (void *)objc_msgSend(v529, "cameraInfoByPortType");
  if (objc_msgSend(v22, "stillImageSinkPipelineProcessingMode")
    && objc_msgSend(v22, "stillImageSinkPipelineProcessingMode") != 2)
  {
    obja = (id)objc_msgSend(v574, "mutableCopy");
    v579 = (id)objc_msgSend(v550, "mutableCopy");
    v209 = v584;
    v211 = v544;
    if (v565)
    {
      v212 = objc_msgSend(v574, "objectForKeyedSubscript:");
      v558 = 0;
    }
    else
    {
      v558 = 0;
      v212 = 0;
    }
  }
  else
  {
    v209 = v584;
    if (objc_msgSend(v22, "stillImageSinkPipelineProcessingMode"))
    {
      v210 = 0;
    }
    else
    {
      v210 = -[BWStillImageCoordinatorNode initWithCaptureDevice:inputPortTypes:sensorRawInputPortTypes:highResStillImageDimensions:]([BWStillImageCoordinatorNode alloc], "initWithCaptureDevice:inputPortTypes:sensorRawInputPortTypes:highResStillImageDimensions:", v537, v208, v557, v514);
      v705.receiver = (id)v185;
      v705.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v705, sel_addNode_error_, v210, &v746) & 1) == 0)
        goto LABEL_786;
      -[BWNode setName:](v210, "setName:", CFSTR("Still Image Coordinator"));
      -[BWStillImageCoordinatorNode setStillImageCaptureStatusDelegate:](v210, "setStillImageCaptureStatusDelegate:", a9);
      -[BWStillImageCoordinatorNode setResponsiveShutterEnabled:](v210, "setResponsiveShutterEnabled:", v507);
      if (objc_msgSend(v22, "responsiveShutterSupported"))
        v213 = objc_msgSend(v22, "responsiveShutterEnabled");
      else
        v213 = 0;
      -[BWStillImageCoordinatorNode setResponsiveShutterEnabledViaAPI:](v210, "setResponsiveShutterEnabledViaAPI:", v213);
      -[BWStillImageCoordinatorNode setFastCapturePrioritizationEnabled:](v210, "setFastCapturePrioritizationEnabled:", objc_msgSend(v22, "fastCapturePrioritizationEnabled"));
      -[BWStillImageCoordinatorNode setStillImageCapturePipeliningMode:](v210, "setStillImageCapturePipeliningMode:", v540);
      -[BWStillImageCoordinatorNode setCinematicFramingWarpingRequired:](v210, "setCinematicFramingWarpingRequired:", objc_msgSend(v22, "cinematicFramingWarpingRequired"));
      if ((_DWORD)v540 == 1)
        -[BWStillImageCoordinatorNode setMaxNumberOfBurstCapturesAllowedInFlight:](v210, "setMaxNumberOfBurstCapturesAllowedInFlight:", 2);
      *(_QWORD *)(v185 + 56) = v210;
    }
    v214 = -[BWStillImageFrameCoordinatorNode initWithNodeConfiguration:inputPortTypes:sensorRawInputPortTypes:]([BWStillImageFrameCoordinatorNode alloc], "initWithNodeConfiguration:inputPortTypes:sensorRawInputPortTypes:", v207, v208, v557);
    v704.receiver = (id)v185;
    v704.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v704, sel_addNode_error_, v214, &v746) & 1) == 0)
      goto LABEL_786;
    -[BWNode setName:](v214, "setName:", CFSTR("Still Image Frame Coordinator"));
    v703 = 0u;
    v702 = 0u;
    v701 = 0u;
    v700 = 0u;
    v215 = v574;
    v216 = objc_msgSend(v574, "countByEnumeratingWithState:objects:count:", &v700, v761, 16);
    if (v216)
    {
      v217 = v216;
      v559 = *(_QWORD *)v701;
      do
      {
        for (kk = 0; kk != v217; ++kk)
        {
          if (*(_QWORD *)v701 != v559)
            objc_enumerationMutation(v215);
          v219 = *(void **)(*((_QWORD *)&v700 + 1) + 8 * kk);
          v220 = objc_msgSend(v215, "objectForKeyedSubscript:", v219);
          if (objc_msgSend(v219, "isEqualToString:", v565))
            v221 = v561;
          else
            v221 = v220;
          if (v210)
          {
            v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v221, -[BWStillImageCoordinatorNode inputForPortType:](v210, "inputForPortType:", v219), v570);
            if (v747)
              goto LABEL_786;
            v209 = v584;
            v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWStillImageCoordinatorNode outputForPortType:](v210, "outputForPortType:", v219), -[BWStillImageFrameCoordinatorNode inputForPortType:](v214, "inputForPortType:", v219), v584);
            if (v747)
              goto LABEL_786;
          }
          else
          {
            v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v221, -[BWStillImageFrameCoordinatorNode inputForPortType:](v214, "inputForPortType:", v219), v209);
            if (v747)
              goto LABEL_786;
          }
          objc_msgSend(obja, "setObject:forKeyedSubscript:", -[BWStillImageFrameCoordinatorNode outputForPortType:](v214, "outputForPortType:", v219), v219);
          v215 = v574;
        }
        v217 = objc_msgSend(v574, "countByEnumeratingWithState:objects:count:", &v700, v761, 16);
      }
      while (v217);
    }
    v699 = 0u;
    v698 = 0u;
    v697 = 0u;
    v696 = 0u;
    v222 = v550;
    v223 = objc_msgSend(v550, "countByEnumeratingWithState:objects:count:", &v696, v760, 16);
    if (v223)
    {
      v224 = v223;
      v562 = *(_QWORD *)v697;
      do
      {
        for (mm = 0; mm != v224; ++mm)
        {
          if (*(_QWORD *)v697 != v562)
            objc_enumerationMutation(v222);
          v226 = *(_QWORD *)(*((_QWORD *)&v696 + 1) + 8 * mm);
          v227 = objc_msgSend(v222, "objectForKeyedSubscript:", v226);
          if (v210)
          {
            v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v227, -[BWStillImageCoordinatorNode sensorRawInputForPortType:](v210, "sensorRawInputForPortType:", v226), v570);
            if (v747)
              goto LABEL_786;
            v228 = -[BWStillImageCoordinatorNode sensorRawOutputForPortType:](v210, "sensorRawOutputForPortType:", v226);
            v229 = -[BWStillImageFrameCoordinatorNode sensorRawInputForPortType:](v214, "sensorRawInputForPortType:", v226);
            v230 = v228;
            v222 = v550;
            v209 = v584;
            v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v230, v229, v584);
            if (v747)
              goto LABEL_786;
          }
          else
          {
            v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v227, -[BWStillImageFrameCoordinatorNode sensorRawInputForPortType:](v214, "sensorRawInputForPortType:", v226), v209);
            if (v747)
              goto LABEL_786;
          }
          objc_msgSend(v579, "setObject:forKeyedSubscript:", -[BWStillImageFrameCoordinatorNode sensorRawOutputForPortType:](v214, "sensorRawOutputForPortType:", v226), v226);
        }
        v224 = objc_msgSend(v222, "countByEnumeratingWithState:objects:count:", &v696, v760, 16);
      }
      while (v224);
    }
    v212 = -[BWStillImageFrameCoordinatorNode outputForPortType:](v214, "outputForPortType:", v565);
    v231 = objc_alloc_init(FigCaptureIrisPreparedSettings);
    v232 = objc_msgSend(v22, "deepFusionSupported");
    if (v506)
      v233 = 2;
    else
      v233 = 1;
    if (v232)
      v234 = 3;
    else
      v234 = v233;
    -[FigCaptureIrisPreparedSettings setQualityPrioritization:](v231, "setQualityPrioritization:", v234);
    -[FigCaptureIrisPreparedSettings setDigitalFlashMode:](v231, "setDigitalFlashMode:", v523);
    v763[1] = 0;
    v763[0] = 0;
    v764 = 0;
    +[BWStillImageCoordinatorNode worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:stillImageCaptureSettings:captureDevice:](BWStillImageCoordinatorNode, "worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:stillImageCaptureSettings:captureDevice:", v231, 0, v537);
    v235 = v763[0];
    if (SLODWORD(v763[0]) <= SHIDWORD(v763[0]))
      v235 = HIDWORD(v763[0]);
    v558 = v235;
    v185 = v546;
    v201 = a12;
    v211 = v544;
    v204 = &selRef_humanFaceEyeDetectionEnabled;
  }
  if (v211)
    v236 = v531;
  else
    v236 = 1;
  if ((v236 & 1) == 0)
  {
    v237 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", 1986618469, objc_msgSend(v574, "count"));
    v238 = (objc_class *)v204[397];
    v695.receiver = (id)v185;
    v695.super_class = v238;
    if ((objc_msgSendSuper2(&v695, sel_addNode_error_, v237, &v746) & 1) == 0)
      goto LABEL_786;
    v571 = v212;
    v694 = 0u;
    v693 = 0u;
    v692 = 0u;
    v691 = 0u;
    v239 = objc_msgSend(v574, "countByEnumeratingWithState:objects:count:", &v691, v759, 16);
    if (v239)
    {
      v240 = v239;
      v241 = 0;
      v242 = *(_QWORD *)v692;
LABEL_402:
      v243 = 0;
      while (1)
      {
        if (*(_QWORD *)v692 != v242)
          objc_enumerationMutation(v574);
        v201 = a12;
        v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v691 + 1) + 8 * v243)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v237, "inputs"), "objectAtIndexedSubscript:", (v241 + v243)), v584);
        if (v747)
          goto LABEL_786;
        if (v240 == ++v243)
        {
          v240 = objc_msgSend(v574, "countByEnumeratingWithState:objects:count:", &v691, v759, 16);
          v241 += v243;
          if (v240)
            goto LABEL_402;
          break;
        }
      }
    }
    objc_msgSend(obja, "setObject:forKeyedSubscript:", -[BWNode output](v237, "output"), v534);
    v185 = v546;
    v209 = v584;
    v204 = &selRef_humanFaceEyeDetectionEnabled;
    v212 = v571;
    if (v541)
    {
      v244 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", 1986618469, objc_msgSend(v550, "count"));
      v690.receiver = (id)v546;
      v690.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v690, sel_addNode_error_, v244, &v746) & 1) == 0)
        goto LABEL_786;
      v689 = 0u;
      v688 = 0u;
      v687 = 0u;
      v686 = 0u;
      v245 = objc_msgSend(v550, "countByEnumeratingWithState:objects:count:", &v686, v758, 16);
      if (v245)
      {
        v246 = v245;
        v247 = 0;
        v248 = *(_QWORD *)v687;
LABEL_412:
        v249 = 0;
        while (1)
        {
          if (*(_QWORD *)v687 != v248)
            objc_enumerationMutation(v550);
          v747 = objc_msgSend(v201, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(v579, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v686 + 1) + 8 * v249)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v244, "inputs"), "objectAtIndexedSubscript:", (v247 + v249)), v584);
          if (v747)
            goto LABEL_786;
          if (v246 == ++v249)
          {
            v246 = objc_msgSend(v550, "countByEnumeratingWithState:objects:count:", &v686, v758, 16);
            v247 += v249;
            if (v246)
              goto LABEL_412;
            break;
          }
        }
      }
      objc_msgSend(v579, "setObject:forKeyedSubscript:", -[BWNode output](v244, "output"), v534);
      v185 = v546;
      v209 = v584;
      v204 = &selRef_humanFaceEyeDetectionEnabled;
      v212 = v571;
    }
  }
  v250 = objc_alloc_init(BWPixelTransferNode);
  -[BWNode setName:](v250, "setName:", CFSTR("Still Image Format Converter"));
  -[BWPixelTransferNode setOutputColorSpaceProperties:](v250, "setOutputColorSpaceProperties:", objc_msgSend(v22, "outputColorSpaceProperties"));
  -[BWPixelTransferNode setCropMode:](v250, "setCropMode:", 3);
  -[BWPixelTransferNode setMaxInputLossyCompressionLevel:](v250, "setMaxInputLossyCompressionLevel:", 3);
  -[BWPixelTransferNode setMaxOutputLossyCompressionLevel:](v250, "setMaxOutputLossyCompressionLevel:", objc_msgSend(v22, "maxLossyCompressionLevel"));
  v575 = v250;
  -[BWPixelTransferNode setConversionMethodForStillImagesDuringHDRVideos:](v250, "setConversionMethodForStillImagesDuringHDRVideos:", 1);
  v251 = v534;
  if (v212)
  {
    v252 = &off_1E4914000;
    if (v541)
    {
      v253 = +[BWStillImageConditionalRouterDepthConfiguration depthConfiguration](BWStillImageConditionalRouterDepthConfiguration, "depthConfiguration");
      v254 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v253);
      -[BWNode setName:](v254, "setName:", CFSTR("Depth Conditional Router"));
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v254, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v253, "yuvOutputIndex")), "setName:", CFSTR("YUV"));
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v254, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v253, "rawOutputIndex")), "setName:", CFSTR("Raw"));
      v685.receiver = (id)v185;
      v685.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v685, sel_addNode_error_, v254, &v746) & 1) == 0)
        goto LABEL_786;
      v747 = objc_msgSend(v201, "safelyConnectOutput:toInput:pipelineStage:", v212, -[BWNode input](v254, "input"), v209);
      if (v747)
        goto LABEL_786;
      v255 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v254, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v253, "yuvOutputIndex"));
      v256 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v254, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v253, "rawOutputIndex"));
      v257 = -[BWDepthSynchronizerNode initForStreaming:maxQueueDepth:separateDepthComponentsEnabled:]([BWDepthSynchronizerNode alloc], "initForStreaming:maxQueueDepth:separateDepthComponentsEnabled:", 0, objc_msgSend(v537, "zeroShutterLagTimeMachineBufferCapacity")+ objc_msgSend(v22, "sifrStillImageCaptureEnabledIfAvailable"), 0);
      v684.receiver = (id)v185;
      v684.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v684, sel_addNode_error_, v257, &v746) & 1) == 0)
        goto LABEL_786;
      objc_msgSend(v257, "setName:", CFSTR("Still Image Raw Depth Synchronizer"));
      v747 = objc_msgSend(v201, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(v579, "objectForKeyedSubscript:", v534), objc_msgSend(v257, "imageInput"), v209);
      if (v747)
        goto LABEL_786;
      v747 = objc_msgSend(v201, "safelyConnectOutput:toInput:pipelineStage:", v256, objc_msgSend(v257, "depthInput"), v209);
      if (v747)
        goto LABEL_786;
      v212 = v255;
      objc_msgSend(v579, "setObject:forKeyedSubscript:", objc_msgSend(v257, "output"), v534);
      v204 = &selRef_humanFaceEyeDetectionEnabled;
      v252 = &off_1E4914000;
    }
    v258 = (id)objc_msgSend(objc_alloc((Class)v252[323]), "initForStreaming:separateDepthComponentsEnabled:", 0, 0);
    v259 = (objc_class *)v204[397];
    v683.receiver = (id)v185;
    v683.super_class = v259;
    if ((objc_msgSendSuper2(&v683, sel_addNode_error_, v258, &v746) & 1) == 0)
      goto LABEL_786;
    objc_msgSend(v258, "setName:", CFSTR("Still Image YUV Depth Synchronizer"));
    v747 = objc_msgSend(v201, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", v534), objc_msgSend(v258, "imageInput"), v209);
    if (v747)
      goto LABEL_786;
    v747 = objc_msgSend(v201, "safelyConnectOutput:toInput:pipelineStage:", v212, objc_msgSend(v258, "depthInput"), v209);
    if (v747)
      goto LABEL_786;
    v260 = objc_msgSend(v258, "output");
    v251 = v534;
    objc_msgSend(obja, "setObject:forKeyedSubscript:", v260, v534);
  }
  v563 = objc_msgSend(obja, "objectForKeyedSubscript:", v251);
  v572 = objc_msgSend(v579, "objectForKeyedSubscript:", v251);
  v261 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v261, "setObject:forKeyedSubscript:", objc_msgSend(v606, "objectForKeyedSubscript:", v251), v251);
  v682 = 0u;
  v681 = 0u;
  v680 = 0u;
  v679 = 0u;
  v262 = v544;
  v263 = objc_msgSend(v544, "countByEnumeratingWithState:objects:count:", &v679, v757, 16);
  if (v263)
  {
    v264 = v263;
    v265 = *(_QWORD *)v680;
    do
    {
      for (nn = 0; nn != v264; ++nn)
      {
        if (*(_QWORD *)v680 != v265)
          objc_enumerationMutation(v544);
        objc_msgSend(v261, "setObject:forKeyedSubscript:", objc_msgSend(v606, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v679 + 1) + 8 * nn)), *(_QWORD *)(*((_QWORD *)&v679 + 1) + 8 * nn));
      }
      v264 = objc_msgSend(v544, "countByEnumeratingWithState:objects:count:", &v679, v757, 16);
    }
    while (v264);
  }
  if (v565)
    objc_msgSend(v261, "setObject:forKeyedSubscript:", objc_msgSend(v606, "objectForKeyedSubscript:", v565), v565);
  v267 = v539;
  v268 = v575;
  if (v531)
  {
    v269 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", objc_msgSend(v261, "count"), 1986618469);
    v678.receiver = (id)v185;
    v678.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v678, sel_addNode_error_, v269, &v746) & 1) == 0)
      goto LABEL_786;
    -[BWNode setName:](v269, "setName:", CFSTR("UB Funnel"));
    v677 = 0u;
    v676 = 0u;
    v675 = 0u;
    v674 = 0u;
    v270 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v674, v756, 16);
    if (v270)
    {
      v271 = v270;
      v272 = 0;
      v273 = *(_QWORD *)v675;
LABEL_444:
      v274 = 0;
      while (1)
      {
        if (*(_QWORD *)v675 != v273)
          objc_enumerationMutation(obja);
        v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v674 + 1) + 8 * v274)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v269, "inputs"), "objectAtIndexedSubscript:", (v272 + v274)), v552);
        if (v747)
          goto LABEL_786;
        if (v271 == ++v274)
        {
          v271 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v674, v756, 16);
          v272 += v274;
          if (v271)
            goto LABEL_444;
          break;
        }
      }
    }
    v563 = -[BWNode output](v269, "output");
    if (v541)
    {
      v275 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", objc_msgSend(v261, "count"), 1986618469);
      v673.receiver = (id)v546;
      v673.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v673, sel_addNode_error_, v275, &v746) & 1) == 0)
        goto LABEL_786;
      -[BWNode setName:](v275, "setName:", CFSTR("UB Sensor Raw Funnel"));
      v672 = 0u;
      v671 = 0u;
      v670 = 0u;
      v669 = 0u;
      v276 = objc_msgSend(v579, "countByEnumeratingWithState:objects:count:", &v669, v755, 16);
      if (v276)
      {
        v277 = v276;
        v278 = 0;
        v279 = *(_QWORD *)v670;
LABEL_454:
        v280 = 0;
        while (1)
        {
          if (*(_QWORD *)v670 != v279)
            objc_enumerationMutation(v579);
          v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(v579, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v669 + 1) + 8 * v280)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v275, "inputs"), "objectAtIndexedSubscript:", (v278 + v280)), v552);
          if (v747)
            goto LABEL_786;
          if (v277 == ++v280)
          {
            v277 = objc_msgSend(v579, "countByEnumeratingWithState:objects:count:", &v669, v755, 16);
            v278 += v280;
            if (v277)
              goto LABEL_454;
            break;
          }
        }
      }
      v572 = -[BWNode output](v275, "output");
    }
    v185 = v546;
    v267 = v539;
    v209 = v584;
    v262 = v544;
    v268 = v575;
  }
  v668.receiver = (id)v185;
  v668.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  if ((objc_msgSendSuper2(&v668, sel_addNode_error_, v268, &v746) & 1) == 0)
    goto LABEL_786;
  v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v563, -[BWNode input](v268, "input"), v209);
  if (v747)
    goto LABEL_786;
  v281 = -[BWNode output](v268, "output");
  if (v497)
  {
    v282 = objc_msgSend(v22, "rawSensorDimensions");
    v283 = v262;
    v284 = v282;
    if (!v283)
    {
      v285 = FigCaptureDimensionsFromDictionaryRepresentation((void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "dimensionsByQSubResolutionFlavorByPortType"), "objectForKeyedSubscript:", v534), "objectForKeyedSubscript:", &unk_1E49F8B98));
      if (FigCaptureVideoDimensionsAreValid(v285))
        v284 = v285;
    }
    v286 = -[BWCompressedShotBufferNode initWithNodeConfiguration:compressionInputDimensions:]([BWCompressedShotBufferNode alloc], "initWithNodeConfiguration:compressionInputDimensions:", v267, v284);
    v667.receiver = (id)v185;
    v667.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v667, sel_addNode_error_, v286, &v746) & 1) == 0)
      goto LABEL_786;
    v287 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.compressed-shot-buffer"), *(unsigned int *)(v185 + 48));
    v552 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.ub.default"), *(unsigned int *)(v185 + 48));
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v281, -[BWNode input](v286, "input"), v287);
    if (v747)
      goto LABEL_786;
    v281 = -[BWNode output](v286, "output");
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v572, -[BWCompressedShotBufferNode sensorRawInput](v286, "sensorRawInput"), v287);
    if (v747)
      goto LABEL_786;
    v572 = -[BWCompressedShotBufferNode sensorRawOutput](v286, "sensorRawOutput");
    objc_msgSend(*(id *)(v185 + 56), "setCompressedShotBuffer:", v286);
    *(_QWORD *)(v185 + 64) = v286;
  }
  if (v535)
  {
    if (v542 == 1)
      v288 = 1;
    else
      v288 = 2;
  }
  else
  {
    if (v538)
      v289 = objc_msgSend(v261, "count");
    else
      v289 = 1;
    v288 = 8 * v289;
  }
  v290 = objc_msgSend(v22, "constantColorVersion");
  if ((_DWORD)v540 == 1)
    v291 = 4;
  else
    v291 = 2;
  if (v288 > v291)
    v291 = v288;
  if (v290 > 0)
    v288 = v291;
  if (v288 <= 2)
    v292 = 2;
  else
    v292 = v288;
  if ((_DWORD)v540 == 1)
    v293 = v292;
  else
    v293 = v288;
  -[BWPhotonicEngineNodeConfiguration setSensorConfigurationsByPortType:](v267, (char *)v261);
  -[BWPhotonicEngineNodeConfiguration setInputIs10Bit:]((uint64_t)v267, objc_msgSend(v22, "inputIs10Bit"));
  -[BWPhotonicEngineNodeConfiguration setRetainedBufferCount:]((uint64_t)v267, v558);
  v566 = v293;
  -[BWPhotonicEngineNodeConfiguration setOutputBufferCount:]((uint64_t)v267, v293);
  -[BWPhotonicEngineNodeConfiguration setMinimumOutputBufferCount:]((uint64_t)v267, v288);
  -[BWPhotonicEngineNodeConfiguration setMaxNumberOfBurstCapturesAllowedInFlight:]((uint64_t)v267, 2);
  -[BWPhotonicEngineNodeConfiguration setOutputPoolBackPressureEnabled:]((uint64_t)v267, (_DWORD)v540 == 2);
  -[BWPhotonicEngineNodeConfiguration setStillImageFusionScheme:]((uint64_t)v267, objc_msgSend(v22, "noiseReductionAndFusionScheme"));
  -[BWStillImageNodeConfiguration setFigThreadPriority:](v267, "setFigThreadPriority:", *(unsigned int *)(v185 + 48));
  -[BWPhotonicEngineNodeConfiguration setReferenceFrameSelectionDelegate:]((uint64_t)v267, *(_QWORD *)(v185 + 56));
  -[BWPhotonicEngineNodeConfiguration setStandardFormatDimensions:]((uint64_t)v267, objc_msgSend(v499, "dimensions"));
  if (v521)
    -[BWPhotonicEngineNodeConfiguration setOutputDimensions:]((uint64_t)v267, objc_msgSend(v22, "outputStillImageDimensions"));
  -[BWPhotonicEngineNodeConfiguration setSoftISPSupportEnabled:]((uint64_t)v267, objc_msgSend(v22, "softISPSupported"));
  -[BWPhotonicEngineNodeConfiguration setQuadraProcessingSupportEnabled:]((uint64_t)v267, objc_msgSend(v22, "quadraProcessingSupportEnabled"));
  -[BWPhotonicEngineNodeConfiguration setSensorRawPixelFormat:]((uint64_t)v267, objc_msgSend(v22, "sensorRawPixelFormat"));
  -[BWPhotonicEngineNodeConfiguration setRawSensorDimensions:]((uint64_t)v267, objc_msgSend(v22, "rawSensorDimensions"));
  objc_msgSend(v22, "sensorCenterOffset");
  -[BWPhotonicEngineNodeConfiguration setSensorCenterOffset:]((uint64_t)v267, v294, v295);
  -[BWPhotonicEngineNodeConfiguration setDimensionsByQSubResolutionFlavorByPortType:](v267, (char *)objc_msgSend(v22, "dimensionsByQSubResolutionFlavorByPortType"));
  -[BWPhotonicEngineNodeConfiguration setUltraHighResolutionProcessingEnabled:]((uint64_t)v267, objc_msgSend(v22, "ultraHighResolutionProcessingEnabled"));
  -[BWPhotonicEngineNodeConfiguration setStillImageGDCSourceMode:]((uint64_t)v267, objc_msgSend(v22, "stillImageGDCSourceMode"));
  -[BWPhotonicEngineNodeConfiguration setSfhrMode:]((uint64_t)v267, objc_msgSend(v22, "sfhrMode"));
  -[BWPhotonicEngineNodeConfiguration setFusionSupportEnabled:]((uint64_t)v267, v506);
  -[BWPhotonicEngineNodeConfiguration setDigitalFlashSupportEnabled:]((uint64_t)v267, v523);
  -[BWPhotonicEngineNodeConfiguration setPortTypesWithRawNightModeEnabled:](v267, (char *)objc_msgSend(v22, "portTypesWithRawNightModeEnabled"));
  v296 = objc_msgSend(v22, "deepFusionSupported");
  v297 = 0;
  if (v296 && v542 != 1)
    v297 = !-[BWPhotonicEngineNodeConfiguration softISPSupportEnabled]((_BOOL8)v267);
  -[BWPhotonicEngineNodeConfiguration setDeepFusionSyntheticsInNRSupportEnabled:]((uint64_t)v267, v297);
  v298 = objc_msgSend(v22, "deepFusionSupported");
  if ((_DWORD)v540 == 2)
    v299 = 0;
  else
    v299 = v528;
  if (v298)
    v300 = v299;
  else
    v300 = 0;
  -[BWPhotonicEngineNodeConfiguration setDeepFusionWaitForPreprocessingToFinish:]((uint64_t)v267, v300);
  -[BWPhotonicEngineNodeConfiguration setDeepFusionSupportEnabled:]((uint64_t)v267, objc_msgSend(v22, "deepFusionSupported"));
  if (v542 == 1)
    v301 = 1;
  else
    v301 = v528;
  if ((v301 & 1) != 0 || ((v516 == 2) & v526) != 0)
    v302 = objc_msgSend(v22, "deepZoomVersion");
  else
    v302 = 0;
  -[BWPhotonicEngineNodeConfiguration setDeepZoomVersion:]((uint64_t)v267, v302);
  -[BWPhotonicEngineNodeConfiguration setDeepZoomMode:]((uint64_t)v267, objc_msgSend(v22, "deepZoomMode"));
  -[BWPhotonicEngineNodeConfiguration setMaxDeepFusionOutputCount:]((uint64_t)v267, 1);
  -[BWPhotonicEngineNodeConfiguration setLearnedNRMode:]((uint64_t)v267, v526);
  -[BWPhotonicEngineNodeConfiguration setDepthDataDeliveryEnabled:]((uint64_t)v267, v543);
  if (v529)
    -[BWPhotonicEngineNodeConfiguration setJasperSensorConfiguration:](v267, (char *)-[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", objc_msgSend((id)objc_msgSend(v529, "captureStream"), "portType"), objc_msgSend((id)objc_msgSend(v529, "captureStream"), "sensorIDString"), objc_msgSend((id)objc_msgSend(v529, "captureStream"), "sensorIDDictionary"), objc_msgSend(v503, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v529, "captureStream"), "portType"))));
  -[BWPhotonicEngineNodeConfiguration setCmiResourceEnabled:]((uint64_t)v267, 0);
  -[BWPhotonicEngineNodeConfiguration setAlwaysAllowModifyingInputBuffers:]((uint64_t)v267, v491);
  objc_msgSend(v22, "ubInferenceMainImageDownscalingFactor");
  -[BWPhotonicEngineNodeConfiguration setInferenceMainImageDownscalingFactor:]((uint64_t)v267, v303);
  -[BWPhotonicEngineNodeConfiguration setProvidedInferenceAttachedMediaByMode:](v267, (char *)newValuea);
  -[BWPhotonicEngineNodeConfiguration setSemanticRenderingVersion:]((uint64_t)v267, v498);
  -[BWPhotonicEngineNodeConfiguration setSemanticDevelopmentVersion:]((uint64_t)v267, v511);
  -[BWPhotonicEngineNodeConfiguration setSmartStyleRenderingVersion:]((uint64_t)v267, objc_msgSend(v22, "smartStyleRenderingVersion"));
  -[BWPhotonicEngineNodeConfiguration setSmartStyleReversibilityEnabled:]((uint64_t)v267, objc_msgSend(v22, "smartStyleReversibilityEnabled"));
  -[BWPhotonicEngineNodeConfiguration setSmartStyleLinearThumbnailDimensions:]((uint64_t)v267, objc_msgSend(v22, "smartStyleLinearThumbnailDimensions"));
  -[BWPhotonicEngineNodeConfiguration setSmartStyleStyledThumbnailDimensions:]((uint64_t)v267, objc_msgSend(v22, "smartStyleStyledThumbnailDimensions"));
  -[BWPhotonicEngineNodeConfiguration setGenerateInferencesForSemanticProcessingIfNeeded:]((uint64_t)v267, objc_msgSend(v22, "generateInferencesForSemanticProcessingIfNeeded"));
  -[BWPhotonicEngineNodeConfiguration setPersonSemanticsVersion:]((uint64_t)v267, v493);
  -[BWPhotonicEngineNodeConfiguration setSemanticStyleRenderingEnabled:]((uint64_t)v267, objc_msgSend(v22, "semanticStyleRenderingEnabled"));
  if (v533)
  {
    -[BWPhotonicEngineNodeConfiguration setPortTypesWithDepthSegmentationPortraitParameters:](v267, (char *)v590);
    -[BWStillImageNodeConfiguration setDepthDataType:](v267, "setDepthDataType:", objc_msgSend(v22, "depthDataType"));
    -[BWPhotonicEngineNodeConfiguration setZoomingDisparityAllowed:]((uint64_t)v267, 1);
    -[BWPhotonicEngineNodeConfiguration setShouldComputeDisparityWhenCalibrationFails:]((uint64_t)v267, v484 ^ 1);
    -[BWPhotonicEngineNodeConfiguration setGenerateLiDARDepth:]((uint64_t)v267, v519 == 7);
    v304 = &selRef_humanFaceEyeDetectionEnabled;
LABEL_519:
    -[BWPhotonicEngineNodeConfiguration setDepthDataOutputDimensions:]((uint64_t)v267, objc_msgSend(v22, "depthDataDimensions"));
    -[BWPhotonicEngineNodeConfiguration setContinuousZoomWithDepthSupported:]((uint64_t)v267, objc_msgSend(v22, "continuousZoomWithDepthSupported"));
    goto LABEL_520;
  }
  if (v519 == 7)
    v305 = 1;
  else
    v305 = v513;
  -[BWPhotonicEngineNodeConfiguration setGenerateLiDARDepth:]((uint64_t)v267, v519 == 7);
  v304 = &selRef_humanFaceEyeDetectionEnabled;
  if (v305 == 1)
    goto LABEL_519;
LABEL_520:
  -[BWPhotonicEngineNodeConfiguration setDemosaicedRawEnabled:]((uint64_t)v267, v501);
  if (v501)
    -[BWPhotonicEngineNodeConfiguration setDemosaicedRawPixelFormat:]((uint64_t)v267, objc_msgSend(v22, "demosaicedRawPixelFormat"));
  -[BWPhotonicEngineNodeConfiguration setRawColorCalibrationsByPortType:](v267, (char *)objc_msgSend(v22, "rawColorCalibrationsByPortType"));
  -[BWPhotonicEngineNodeConfiguration setRawLensShadingCorrectionCoefficientsByPortType:](v267, (char *)objc_msgSend(v22, "rawLensShadingCorrectionCoefficientsByPortType"));
  if (v492)
  {
    -[BWPhotonicEngineNodeConfiguration setIntelligentDistortionCorrectionVersion:]((uint64_t)v267, objc_msgSend(v22, "dcProcessorVersion"));
    if (v494)
      v306 = (char *)objc_msgSend(v22, "portTypesWithGeometricDistortionCorrectionEnabled");
    else
      v306 = 0;
    -[BWPhotonicEngineNodeConfiguration setPortTypesWithGeometricDistortionCorrectionEnabled:](v267, v306);
    -[BWPhotonicEngineNodeConfiguration setGeometricDistortionCorrectionExpandedImageDimensions:]((uint64_t)v267, v477);
    -[BWPhotonicEngineNodeConfiguration setPortTypesWithIntelligentDistortionCorrectionEnabled:](v267, (char *)objc_msgSend(v22, "portTypesWithIntelligentDistortionCorrectionEnabled"));
    -[BWPhotonicEngineNodeConfiguration setIntelligentDistortionCorrectionAppliesFinalDimensions:]((uint64_t)v267, !v587 | v521);
    -[BWPhotonicEngineNodeConfiguration setDcProcessingWithDepthSupported:]((uint64_t)v267, objc_msgSend(v22, "dcProcessingWithDepthSupported"));
  }
  -[BWPhotonicEngineNodeConfiguration setGreenGhostMitigationVersion:]((uint64_t)v267, objc_msgSend(v22, "greenGhostMitigationVersion"));
  -[BWPhotonicEngineNodeConfiguration setSwfrVersion:]((uint64_t)v267, objc_msgSend(v22, "swfrVersion"));
  -[BWPhotonicEngineNodeConfiguration setConstantColorVersion:]((uint64_t)v267, objc_msgSend(v22, "constantColorVersion"));
  -[BWPhotonicEngineNodeConfiguration setConstantColorClippingRecoveryEnabled:]((uint64_t)v267, objc_msgSend(v22, "constantColorClippingRecoveryEnabled"));
  -[BWPhotonicEngineNodeConfiguration setConstantColorSaturationBoostEnabled:]((uint64_t)v267, objc_msgSend(v22, "constantColorSaturationBoostEnabled"));
  -[BWStillImageNodeConfiguration setStereoPhotoOutputDimensions:](v267, "setStereoPhotoOutputDimensions:", -[BWStillImageNodeConfiguration stereoPhotoOutputDimensions](v267, "stereoPhotoOutputDimensions"));
  -[BWPhotonicEngineNodeConfiguration setRedEyeReductionEnabled:]((uint64_t)v267, v524 > 1);
  objc_msgSend(v22, "gainMapMainImageDownscalingFactor");
  -[BWPhotonicEngineNodeConfiguration setGainMapMainImageDownscalingFactor:]((uint64_t)v267, v307);
  -[BWPhotonicEngineNodeConfiguration setHorizontalSensorBinningFactor:]((uint64_t)v267, objc_msgSend(v22, "horizontalSensorBinningFactor"));
  -[BWPhotonicEngineNodeConfiguration setVerticalSensorBinningFactor:]((uint64_t)v267, objc_msgSend(v22, "verticalSensorBinningFactor"));
  v308 = -[BWPhotonicEngineNode initWithNodeConfiguration:captureDevice:]([BWPhotonicEngineNode alloc], "initWithNodeConfiguration:captureDevice:", v267, v537);
  v309 = (objc_class *)v304[397];
  v666.receiver = (id)v185;
  v666.super_class = v309;
  if ((objc_msgSendSuper2(&v666, sel_addNode_error_, v308, &v746) & 1) == 0)
    goto LABEL_786;
  -[BWNode setName:](v308, "setName:", CFSTR("PhotonicEngine"));
  objc_msgSend(*(id *)(v185 + 56), "setStillImageProcessingSupportProvider:", v308);
  v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v281, -[BWNode input](v308, "input"), v552);
  if (v747)
    goto LABEL_786;
  if (-[BWPhotonicEngineNodeConfiguration softISPSupportEnabled]((_BOOL8)v267))
  {
    if (v541)
    {
      v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v572, -[BWPhotonicEngineNode sensorRawInput](v308, "sensorRawInput"), v552);
      if (v747)
        goto LABEL_786;
    }
  }
  v580 = v308;
  v310 = v584;
  if (v496)
  {
    v311 = v308;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v496, -[BWPhotonicEngineNode pointCloudInput](v308, "pointCloudInput"), v552);
    v312 = v544;
    if (v747)
      goto LABEL_786;
  }
  else
  {
    v313 = *MEMORY[0x1E0D05A20];
    v312 = v544;
    v311 = v580;
    if (objc_msgSend(v479, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A20]))
    {
      v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(v479, "objectForKeyedSubscript:", v313), -[BWPhotonicEngineNode pointCloudInput](v580, "pointCloudInput"), v552);
      if (v747)
        goto LABEL_786;
    }
  }
  v314 = -[BWNode output](v311, "output");
  if (((!v587 | v521) & 1) != 0)
  {
    v315 = v575;
  }
  else
  {
    v316 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v22, "gainMapMainImageDownscalingFactor");
    if (v317 != 0.0)
    {
      v318 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v22, "gainMapMainImageDownscalingFactor");
      objc_msgSend(v316, "setObject:forKeyedSubscript:", objc_msgSend(v318, "numberWithFloat:"), 0x1E4936818);
    }
    v319 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v662 = 0u;
    v663 = 0u;
    v664 = 0u;
    v665 = 0u;
    v320 = objc_msgSend(newValuea, "countByEnumeratingWithState:objects:count:", &v662, v754, 16);
    if (v320)
    {
      v321 = v320;
      v322 = *(_QWORD *)v663;
      do
      {
        for (i1 = 0; i1 != v321; ++i1)
        {
          if (*(_QWORD *)v663 != v322)
            objc_enumerationMutation(newValuea);
          objc_msgSend(v319, "addObjectsFromArray:", objc_msgSend(newValuea, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v662 + 1) + 8 * i1)));
        }
        v321 = objc_msgSend(newValuea, "countByEnumeratingWithState:objects:count:", &v662, v754, 16);
      }
      while (v321);
    }
    newValueb = v314;
    if (v501)
    {
      objc_msgSend(v316, "setObject:forKeyedSubscript:", &unk_1E4A02E10, 0x1E495B0F8);
      v661 = 0u;
      v660 = 0u;
      v659 = 0u;
      v658 = 0u;
      v324 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v658, v753, 16);
      if (v324)
      {
        v325 = v324;
        v326 = *(_QWORD *)v659;
        do
        {
          for (i2 = 0; i2 != v325; ++i2)
          {
            if (*(_QWORD *)v659 != v326)
              objc_enumerationMutation(v319);
            v328 = *(_QWORD *)(*((_QWORD *)&v658 + 1) + 8 * i2);
            v329 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v22, "ubInferenceMainImageDownscalingFactor");
            objc_msgSend(v316, "setObject:forKeyedSubscript:", objc_msgSend(v329, "numberWithFloat:"), v328);
          }
          v325 = objc_msgSend(v319, "countByEnumeratingWithState:objects:count:", &v658, v753, 16);
        }
        while (v325);
      }
    }
    v267 = v539;
    v330 = -[BWStillImageScalerNode initWithBasePoolCapacity:nodeConfiguration:]([BWStillImageScalerNode alloc], "initWithBasePoolCapacity:nodeConfiguration:", v566, v539);
    -[BWNode setName:](v330, "setName:", CFSTR("Resizing"));
    -[BWStillImageScalerNode setResizedOutputDimensions:](v330, "setResizedOutputDimensions:", objc_msgSend(v22, "outputStillImageDimensions"));
    -[BWStillImageScalerNode setBlackFillingRequired:](v330, "setBlackFillingRequired:", 0);
    -[BWStillImageScalerNode setMainImageDownscalingFactorByAttachedMediaKey:](v330, "setMainImageDownscalingFactorByAttachedMediaKey:", v316);
    v185 = v546;
    v657.receiver = (id)v546;
    v657.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v657, sel_addNode_error_, v330, &v746) & 1) == 0)
    {
      FigDebugAssert3();
      v468 = -12786;
      goto LABEL_782;
    }
    v310 = v584;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", newValueb, -[BWNode input](v330, "input"), v584);
    v312 = v544;
    v315 = v575;
    if (v747)
      goto LABEL_786;
    v314 = -[BWNode output](v330, "output");
    v304 = &selRef_humanFaceEyeDetectionEnabled;
  }
  -[BWPixelTransferNode setPreferredOutputPixelFormats:](v315, "setPreferredOutputPixelFormats:", -[BWFormatRequirements supportedPixelFormats](-[BWNodeInput formatRequirements](-[BWNode input](v580, "input"), "formatRequirements"), "supportedPixelFormats"));
  -[BWPixelTransferNode setConverting10BitVideoRangeTo8BitFullRangeEncouraged:](v315, "setConverting10BitVideoRangeTo8BitFullRangeEncouraged:", 1);
  if (((v556 | v504 ^ 1) & 1) == 0)
  {
    v331 = objc_alloc_init(BWStillImageSmartStyleUnstyledBufferEmitterNode);
    objc_msgSend((id)v185, "addNode:error:", v331, 0);
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v331, "input"), v310);
    if (v747)
      goto LABEL_786;
    v314 = -[BWNode output](v331, "output");
  }
  v545 = v525 & v488 | v589;
  v576 = v543 & v536 & v489 & v505;
  if ((v520 & 0xFFFFFFFE) == 4)
    v332 = 1;
  else
    v332 = (v525 | v589) & (v490 ^ 1);
  v551 = v332;
  v333 = v332 | v515;
  if (v520 == 6)
    v333 = 1;
  v564 = v333;
  if (v333 != 1)
  {
    v573 = 0;
    v553 = 0;
LABEL_599:
    v350 = v546;
    goto LABEL_600;
  }
  if ((v543 & 1) == 0 || v312)
    goto LABEL_781;
  v334 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a10, *(unsigned int *)(v546 + 52));
  v335 = v334;
  if (v520 == 6)
  {
    -[BWNode setName:](v334, "setName:", CFSTR("MonocularDepth"));
    v336 = BWInferenceVersionMakeMajor(1);
    v337 = -[BWMonocularDepthConfiguration initWithInferenceType:monocularDepthType:]([BWMonocularDepthConfiguration alloc], "initWithInferenceType:monocularDepthType:", 106, 2);
    v338 = v336 & 0xFFFFFFFFFFFFLL;
    v304 = &selRef_humanFaceEyeDetectionEnabled;
    -[BWInferenceNode addInferenceOfType:version:configuration:](v335, "addInferenceOfType:version:configuration:", 106, v338, v337);
  }
  else if (v551)
  {
    -[BWNode setName:](v334, "setName:", CFSTR("RGB Segmentation"));
    -[BWInferenceNode addInferenceOfType:version:](v335, "addInferenceOfType:version:", 103, +[BWRGBPersonSegmentationInferenceConfiguration portraitVersion](BWRGBPersonSegmentationInferenceConfiguration, "portraitVersion") & 0xFFFFFFFFFFFFLL);
  }
  if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v546, v335))
    goto LABEL_781;
  v339 = (objc_class *)v304[397];
  v656.receiver = (id)v546;
  v656.super_class = v339;
  if ((objc_msgSendSuper2(&v656, sel_addNode_error_, v335, &v746) & 1) == 0)
    goto LABEL_786;
  v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v335, "input"), v310);
  if (v747)
    goto LABEL_786;
  v314 = -[BWNode output](v335, "output");
  if (v576)
  {
    v340 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.person-semantics"), *(unsigned int *)(v546 + 48));
    v341 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", 2, 1986618469);
    -[BWNode setName:](v341, "setName:", CFSTR("Concurrent PersonSemantics / DepthProcessing Fan Out"));
    v342 = (objc_class *)v304[397];
    v655.receiver = (id)v546;
    v655.super_class = v342;
    if ((objc_msgSendSuper2(&v655, sel_addNode_error_, v341, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v341, "input"), v500);
    if (v747)
      goto LABEL_786;
    v343 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v341, "outputs"), "objectAtIndexedSubscript:", 0);
    v344 = v476;
    if (v520 == 6)
      v344 = 1;
    if (v344 == 1)
    {
      v345 = [BWAttachedMediaSplitNode alloc];
      v752[0] = CFSTR("PrimaryFormat");
      v752[1] = CFSTR("Depth");
      v346 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v345, "initWithAttachedMediaKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v752, 2));
      -[BWNode setName:](v346, "setName:", CFSTR("Unprocessed DepthData Discarder"));
      v654.receiver = (id)v546;
      v654.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v654, sel_addNode_error_, v346, &v746) & 1) == 0)
        goto LABEL_786;
      v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v343, -[BWNode input](v346, "input"), v340);
      if (v747)
        goto LABEL_786;
      v343 = -[BWNode output](v346, "output");
    }
    v347 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a10, *(unsigned int *)(v546 + 52));
    -[BWInferenceNode addInferenceOfType:version:configuration:](v347, "addInferenceOfType:version:configuration:", 104, Major & 0xFFFFFFFFFFFFLL, v487);
    -[BWNode setName:](v347, "setName:", CFSTR("Person Semantics"));
    objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
    if (-[FigCapturePhotonicEngineSinkPipeline _addMattingInferenceToNode:mattingVersion:learnedMattingVersion:mainImageDownscalingFactor:targetAspectRatio:appliesFinalCropRect:enabledSemantics:metalCommandQueue:mattingSensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:](v546, v347, v482, v481, v556, -[BWPersonSemanticsConfiguration enabledSemantics](v487, "enabledSemantics"), (uint64_t)-[BWStillImageNodeConfiguration metalCommandQueue](v539, "metalCommandQueue"), (uint64_t)v527, v348, v111, v535, v480))goto LABEL_781;
    -[BWInferenceNode setIgnoreInvalidContentInformationForPrimaryMedia:](v347, "setIgnoreInvalidContentInformationForPrimaryMedia:", v545);
    -[BWInferenceNode setInferenceTypesToSkipResolver:](v347, "setInferenceTypesToSkipResolver:", v734);
    -[BWInferenceNode setBackPressureDrivenPipelining:](v347, "setBackPressureDrivenPipelining:", (_DWORD)v540 == 2);
    v304 = &selRef_humanFaceEyeDetectionEnabled;
    v653.receiver = (id)v546;
    v653.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v653, sel_addNode_error_, v347, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v343, -[BWNode input](v347, "input"), v340);
    if (v747)
      goto LABEL_786;
    v573 = -[BWNode output](v347, "output");
    v314 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v341, "outputs"), "objectAtIndexedSubscript:", 1);
    v267 = v539;
    v310 = v584;
  }
  else
  {
    v573 = 0;
  }
  if ((v520 & 0xFFFFFFFE) != 4)
  {
    v553 = v543 & v536 & v489 & v505;
    goto LABEL_599;
  }
  v349 = objc_msgSend(v22, "depthDataDimensions");
  v350 = v546;
  if (objc_msgSend(v527, "count") != 1)
    goto LABEL_781;
  v351 = objc_msgSend((id)objc_msgSend(v527, "allValues"), "firstObject");
  if (!v351)
    goto LABEL_781;
  v352 = -[BWStillImageFocusPixelDisparityNode initWithNodeConfiguration:sensorConfiguration:disparityMapWidth:disparityMapHeight:depthIsAlwaysHighQuality:]([BWStillImageFocusPixelDisparityNode alloc], "initWithNodeConfiguration:sensorConfiguration:disparityMapWidth:disparityMapHeight:depthIsAlwaysHighQuality:", v267, v351, (int)v349, v349 >> 32, v535);
  v652.receiver = (id)v546;
  v652.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  if ((objc_msgSendSuper2(&v652, sel_addNode_error_, v352, &v746) & 1) == 0)
    goto LABEL_786;
  v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v352, "input"), v310);
  if (v747)
    goto LABEL_786;
  v314 = -[BWNode output](v352, "output");
  v553 = v543 & v536 & v489 & v505;
  v304 = &selRef_humanFaceEyeDetectionEnabled;
LABEL_600:
  if (v556)
  {
    newValuec = v314;
    v763[0] = 0;
    v765 = 0;
    v353 = objc_msgSend(v22, "depthDataDimensions");
    v354 = objc_msgSend(v22, "smartStyleLinearThumbnailDimensions");
    v355 = objc_msgSend(v22, "smartStyleStyledThumbnailDimensions");
    v356 = objc_msgSend(v22, "smartStyleReversibilityEnabled");
    v357 = objc_msgSend(v22, "constantColorConfidenceMapDimensions");
    v358 = objc_msgSend(v532, "filterRenderingEnabled");
    v359 = FigCaptureVideoDimensionsAreValid(objc_msgSend(v22, "depthDataDimensions"));
    v474 = v357;
    v350 = v546;
    v471 = v356;
    v267 = v539;
    v747 = -[FigCapturePhotonicEngineSinkPipeline _addScalerNodeWithName:nodeConfiguration:bravoConstituentPhotoDeliveryEnabled:mainImageDownscalingFactorByAttachedMediaKey:depthDataDimensions:smartStyleLinearThumbnailDimensions:smartStyleStyledThumbnailDimensions:smartStyleReversibilityEnabled:constantColorConfidenceMapDimensions:filterRenderingEnabled:enforcesZoomingForPortraitCaptures:backPressureDrivenPipelining:scalerNodeInputOut:scalerNodeOutputOut:](v546, (uint64_t)CFSTR("Intermediate Scaler"), v539, v538, (uint64_t)v549, v353, v354, v355, v471, v474, v358, v359, (_DWORD)v540 == 2, v763, (uint64_t *)&v765);
    if (v747)
      goto LABEL_786;
    v360 = v584;
    if ((_DWORD)v540 == 2)
      v360 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.intermediateScaler"), *(unsigned int *)(v546 + 48), v584);
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", newValuec, v763[0], v360);
    v361 = v547;
    v304 = &selRef_humanFaceEyeDetectionEnabled;
    if (v747)
      goto LABEL_786;
    v314 = v765;
    v310 = v584;
    if (v504)
    {
      v362 = objc_alloc_init(BWStillImageSmartStyleUnstyledBufferEmitterNode);
      objc_msgSend((id)v546, "addNode:error:", v362, 0);
      v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v362, "input"), v584);
      if (v747)
        goto LABEL_786;
      v314 = -[BWNode output](v362, "output");
      v304 = &selRef_humanFaceEyeDetectionEnabled;
    }
  }
  else
  {
    v361 = v547;
  }
  if (FigCaptureVideoDimensionsAreValid(objc_msgSend(v22, "stereoPhotoOutputDimensions")))
  {
    -[BWNodeOutput node](v314, "node");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[BWNodeOutput node](v314, "node");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_781;
    }
    v363 = +[BWStillImageConditionalRouterStereoPhotoConfiguration stereoPhotoConfiguration](BWStillImageConditionalRouterStereoPhotoConfiguration, "stereoPhotoConfiguration");
    v364 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v363);
    -[BWNode setName:](v364, "setName:", CFSTR("Stereo Photo Conditional Router"));
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v364, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v363, "mainImageOutputIndex")), "setName:", CFSTR("Main"));
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v364, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v363, "stereoPhotoOutoutIndex")), "setName:", CFSTR("StereoPhoto"));
    v365 = (objc_class *)v304[397];
    v651.receiver = (id)v350;
    v651.super_class = v365;
    if ((objc_msgSendSuper2(&v651, sel_addNode_error_, v364, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v364, "input"), v310);
    if (v747)
      goto LABEL_786;
    v314 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v364, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v363, "mainImageOutputIndex"));
    v567 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v364, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v363, "stereoPhotoOutoutIndex"));
    v267 = v539;
  }
  else
  {
    v567 = 0;
  }
  if (v533)
  {
    v366 = v314;
    v367 = +[BWStillImageConditionalRouterInferenceConfiguration inferenceConfiguration](BWStillImageConditionalRouterInferenceConfiguration, "inferenceConfiguration");
    v368 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v367);
    -[BWNode setName:](v368, "setName:", CFSTR("Inference Conditional Router"));
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v368, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v367, "defaultOutputIndex")), "setName:", CFSTR("Default"));
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v368, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v367, "inferenceOuputIndex")), "setName:", CFSTR("Inference"));
    v369 = (objc_class *)v304[397];
    v650.receiver = (id)v350;
    v650.super_class = v369;
    if ((objc_msgSendSuper2(&v650, sel_addNode_error_, v368, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v366, -[BWNode input](v368, "input"), v310);
    if (v747)
      goto LABEL_786;
    v370 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.inference.bravo"), *(unsigned int *)(v350 + 48));
    v371 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a10, *(unsigned int *)(v350 + 52));
    if (((v518 | v564) & 1) == 0)
    {
      if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v350, v371))
        goto LABEL_781;
      LOBYTE(v564) = 1;
    }
    if (v576)
    {
      v372 = -[BWNode name](v371, "name");
      v373 = -[NSString length](v372, "length");
      v374 = CFSTR("Person Semantics");
      if (v373)
        v374 = -[NSString stringByAppendingFormat:](v372, "stringByAppendingFormat:", CFSTR(" + %@"), CFSTR("Person Semantics"));
      -[BWNode setName:](v371, "setName:", v374);
      -[BWInferenceNode addInferenceOfType:version:configuration:](v371, "addInferenceOfType:version:configuration:", 104, Major & 0xFFFFFFFFFFFFLL, v487);
      objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
      if (-[FigCapturePhotonicEngineSinkPipeline _addMattingInferenceToNode:mattingVersion:learnedMattingVersion:mainImageDownscalingFactor:targetAspectRatio:appliesFinalCropRect:enabledSemantics:metalCommandQueue:mattingSensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:](v350, v371, v482, v481, v556, -[BWPersonSemanticsConfiguration enabledSemantics](v487, "enabledSemantics"), (uint64_t)-[BWStillImageNodeConfiguration metalCommandQueue](v539, "metalCommandQueue"), (uint64_t)v527, v375, v111, v535, v480))goto LABEL_781;
      v553 = 1;
    }
    -[BWInferenceNode setInferenceTypesToSkipResolver:](v371, "setInferenceTypesToSkipResolver:", v734);
    -[BWInferenceNode setBackPressureDrivenPipelining:](v371, "setBackPressureDrivenPipelining:", (_DWORD)v540 == 2);
    v376 = (objc_class *)v304[397];
    v649.receiver = (id)v350;
    v649.super_class = v376;
    if ((objc_msgSendSuper2(&v649, sel_addNode_error_, v371, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v368, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v367, "inferenceOuputIndex")), -[BWNode input](v371, "input"), v370);
    if (v747)
      goto LABEL_786;
    v377 = -[BWInferenceSynchronizerNode initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:]([BWInferenceSynchronizerNode alloc], "initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:", 1, 1, 0);
    -[BWNode setName:](v377, "setName:", CFSTR("Disparity/Inference Sync"));
    -[BWInferenceSynchronizerNode setSynchronizesTopLevelAttachments:](v377, "setSynchronizesTopLevelAttachments:", 1);
    -[BWInferenceSynchronizerNode setSynchronizeInferencesResolver:](v377, "setSynchronizeInferencesResolver:", v495);
    v378 = (objc_class *)v304[397];
    v648.receiver = (id)v546;
    v648.super_class = v378;
    v310 = v584;
    if ((objc_msgSendSuper2(&v648, sel_addNode_error_, v377, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v368, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v367, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v377, "inputs"), "objectAtIndexedSubscript:", 0), v500);
    if (v747)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWNode output](v371, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v377, "inputs"), "objectAtIndexedSubscript:", 1), v500);
    v267 = v539;
    v304 = &selRef_humanFaceEyeDetectionEnabled;
    if (v747)
      goto LABEL_786;
  }
  else
  {
    if (!v538)
      goto LABEL_651;
    v591 = +[BWStillImageConditionalRouterUBConfiguration configurationWithPortTypes:](BWStillImageConditionalRouterUBConfiguration, "configurationWithPortTypes:", v361);
    v379 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v591);
    -[BWNode setName:](v379, "setName:", CFSTR("UB Router for ConstituentPhoto without Depth"));
    v380 = (objc_class *)v304[397];
    v647.receiver = (id)v350;
    v647.super_class = v380;
    if ((objc_msgSendSuper2(&v647, sel_addNode_error_, v379, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v379, "input"), v310);
    if (v747)
      goto LABEL_786;
    v381 = -[BWStillImageMultiCameraDoserNode initWithPortTypes:]([BWStillImageMultiCameraDoserNode alloc], "initWithPortTypes:", objc_msgSend(v606, "allKeys"));
    v382 = (objc_class *)v304[397];
    v646.receiver = (id)v350;
    v646.super_class = v382;
    if ((objc_msgSendSuper2(&v646, sel_addNode_error_, v381, &v746) & 1) == 0)
      goto LABEL_786;
    v383 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", objc_msgSend(v361, "count"), 1986618469);
    v384 = (objc_class *)v304[397];
    v645.receiver = (id)v350;
    v645.super_class = v384;
    if ((objc_msgSendSuper2(&v645, sel_addNode_error_, v383, &v746) & 1) == 0)
      goto LABEL_786;
    newValued = v383;
    -[BWNode setName:](v383, "setName:", CFSTR("Camera Calibration Data"));
    v644 = 0u;
    v643 = 0u;
    v642 = 0u;
    v641 = 0u;
    v385 = objc_msgSend(v361, "countByEnumeratingWithState:objects:count:", &v641, v751, 16);
    if (v385)
    {
      v386 = v385;
      v588 = *(_QWORD *)v642;
LABEL_640:
      v387 = 0;
      while (1)
      {
        if (*(_QWORD *)v642 != v588)
          objc_enumerationMutation(v547);
        v388 = *(void **)(*((_QWORD *)&v641 + 1) + 8 * v387);
        v389 = -[BWStillImageConditionalRouterUBConfiguration outputIndexForPortType:](v591, "outputIndexForPortType:", v388);
        if (v389 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_781;
        v391 = v389;
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v379, "outputs"), "objectAtIndexedSubscript:", v389), "setName:", BWPortTypeToDisplayString(v388, v390));
        v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v379, "outputs"), "objectAtIndexedSubscript:", v391), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v381, "inputs"), "objectAtIndexedSubscript:", v391), v310);
        if (v747)
          goto LABEL_786;
        v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v381, "outputs"), "objectAtIndexedSubscript:", v391), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](newValued, "inputs"), "objectAtIndexedSubscript:", v391), v310);
        if (v747)
          goto LABEL_786;
        if (v386 == ++v387)
        {
          v386 = objc_msgSend(v547, "countByEnumeratingWithState:objects:count:", &v641, v751, 16);
          if (v386)
            goto LABEL_640;
          break;
        }
      }
    }
    v377 = -[BWStillImageCameraCalibrationDataNode initWithSensorConfigurationsByPortType:]([BWStillImageCameraCalibrationDataNode alloc], "initWithSensorConfigurationsByPortType:", v606);
    -[BWInferenceSynchronizerNode setPropagatesDetectedObjects:](v377, "setPropagatesDetectedObjects:", 1);
    -[BWInferenceSynchronizerNode setBaseZoomFactorsByPortType:](v377, "setBaseZoomFactorsByPortType:", objc_msgSend(v22, "baseZoomFactorsByPortType"));
    -[BWNode setName:](v377, "setName:", CFSTR("Still Image Camera Calibration Data"));
    v304 = &selRef_humanFaceEyeDetectionEnabled;
    v640.receiver = (id)v546;
    v640.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v640, sel_addNode_error_, v377, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWNode output](newValued, "output"), -[BWNode input](v377, "input"), v310);
    v267 = v539;
    if (v747)
      goto LABEL_786;
  }
  v314 = -[BWNode output](v377, "output");
  v350 = v546;
LABEL_651:
  v392 = v525;
  if (v520 == 6)
    v392 = 1;
  if ((v392 | v589) == 1)
  {
    if (objc_msgSend(v527, "count") != 1)
      goto LABEL_781;
    v393 = (void *)objc_msgSend((id)objc_msgSend(v527, "allValues"), "firstObject");
    if (!v393)
      goto LABEL_781;
    LOBYTE(v470) = (_DWORD)v540 == 2;
    v394 = -[BWDepthConverterNode initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:]([BWDepthConverterNode alloc], "initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:", v267, v598, objc_msgSend(v393, "sensorIDDictionary"), v551, v535, v520 == 6, v470);
    v639.receiver = (id)v350;
    v639.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v639, sel_addNode_error_, v394, &v746) & 1) == 0)
      goto LABEL_786;
    -[BWNode setName:](v394, "setName:", CFSTR("Still Image Depth Converter"));
    -[BWDepthConverterNode setHorizontalSensorBinningFactor:](v394, "setHorizontalSensorBinningFactor:", objc_msgSend(v22, "horizontalSensorBinningFactor"));
    -[BWDepthConverterNode setVerticalSensorBinningFactor:](v394, "setVerticalSensorBinningFactor:", objc_msgSend(v22, "verticalSensorBinningFactor"));
    -[BWDepthConverterNode setSkipSmartStyleBuffer:](v394, "setSkipSmartStyleBuffer:", v504);
    -[BWDepthConverterNode setStillGDRFilteringSupportEnabled:](v394, "setStillGDRFilteringSupportEnabled:", 1);
    -[BWDepthConverterNode setOutputFormat:](v394, "setOutputFormat:", 1751411059);
    -[BWDepthConverterNode setOutputDimensions:](v394, "setOutputDimensions:", objc_msgSend(v22, "depthDataDimensions"));
    -[BWDepthConverterNode setBaseRotationDegrees:](v394, "setBaseRotationDegrees:", 90);
    v395 = v584;
    if ((_DWORD)v540 == 2)
      v395 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.depthConverter"), *(unsigned int *)(v350 + 48));
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v394, "input"), v395);
    if (v747)
      goto LABEL_786;
    *(_QWORD *)(v350 + 88) = v394;
    v314 = -[BWNode output](v394, "output");
    v310 = v584;
    v304 = &selRef_humanFaceEyeDetectionEnabled;
  }
  if (v573)
  {
    v396 = v304;
    v397 = -[BWInferenceSynchronizerNode initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:]([BWInferenceSynchronizerNode alloc], "initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:", 0, 1, 0);
    -[BWNode setName:](v397, "setName:", CFSTR("DepthData Processing / PersonSemantics"));
    v638[0] = MEMORY[0x1E0C809B0];
    v638[1] = 3221225472;
    v638[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_769;
    v638[3] = &unk_1E491FCE0;
    v638[4] = v733;
    v638[5] = v495;
    -[BWInferenceSynchronizerNode setSynchronizeInferencesResolver:](v397, "setSynchronizeInferencesResolver:", v638);
    v398 = (objc_class *)v396[397];
    v637.receiver = (id)v350;
    v637.super_class = v398;
    if ((objc_msgSendSuper2(&v637, sel_addNode_error_, v397, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v397, "inputs"), "objectAtIndexedSubscript:", 0), v500);
    if (v747)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v573, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v397, "inputs"), "objectAtIndexedSubscript:", 1), v500);
    if (v747)
      goto LABEL_786;
    v314 = -[BWNode output](v397, "output");
    v304 = &selRef_humanFaceEyeDetectionEnabled;
  }
  if (v486)
  {
    v399 = [BWStillImagePortraitMetadataNode alloc];
    *(float *)&v400 = v86;
    v401 = -[BWStillImagePortraitMetadataNode initWithNodeConfiguration:sdofRenderingVersion:sensorConfigurationsByPortType:defaultPortType:defaultZoomFactor:](v399, "initWithNodeConfiguration:sdofRenderingVersion:sensorConfigurationsByPortType:defaultPortType:defaultZoomFactor:", v267, v486, v527, v510, v400);
    v402 = (objc_class *)v304[397];
    v636.receiver = (id)v350;
    v636.super_class = v402;
    if ((objc_msgSendSuper2(&v636, sel_addNode_error_, v401, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v401, "input"), v310);
    if (v747)
      goto LABEL_786;
    v314 = -[BWNode output](v401, "output");
  }
  if (v512)
  {
    v403 = +[BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration optimizedEnhancedPortraitConfiguration](BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration, "optimizedEnhancedPortraitConfiguration");
    v404 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v403);
    -[BWNode setName:](v404, "setName:", CFSTR("Optimized Enhanced Portrait Router"));
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v404, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v403, "mainImageOutputIndex")), "setName:", CFSTR("Main"));
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v404, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v403, "deepFusionImageOutputIndex")), "setName:", CFSTR("StandardRes"));
    v635.receiver = (id)v350;
    v635.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v635, sel_addNode_error_, v404, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v404, "input"), v310);
    if (v747)
      goto LABEL_786;
    v314 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v404, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v403, "deepFusionImageOutputIndex"));
    v405 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v404, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v403, "mainImageOutputIndex"));
    v304 = &selRef_humanFaceEyeDetectionEnabled;
  }
  else
  {
    v405 = 0;
  }
  if (!v536)
  {
LABEL_709:
    if (((v504 ^ 1 | v512) & 1) == 0)
    {
      v421 = -[BWStillImageSmartStyleAttachmentTransferNode initWithNodeConfiguration:]([BWStillImageSmartStyleAttachmentTransferNode alloc], "initWithNodeConfiguration:", v267);
      v422 = v304;
      v423 = v421;
      v424 = (objc_class *)v422[397];
      v629.receiver = (id)v350;
      v629.super_class = v424;
      if ((objc_msgSendSuper2(&v629, sel_addNode_error_, v421, &v746) & 1) == 0)
        goto LABEL_786;
      v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v423, "input"), v310);
      if (v747)
        goto LABEL_786;
      v314 = -[BWNode output](v423, "output");
      v304 = &selRef_humanFaceEyeDetectionEnabled;
    }
    if (v517)
    {
      if (objc_msgSend(v532, "previewQualityAdjustedPhotoFilterRenderingEnabled"))
        v425 = 2;
      else
        v425 = 0;
      v426 = [BWStillImageFilterNode alloc];
      LOBYTE(v475) = (_DWORD)v540 == 2;
      LODWORD(v470) = v425;
      *(float *)&v427 = v111;
      *(float *)&v428 = v86;
      v429 = -[BWStillImageFilterNode initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:](v426, "initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:", v267, v527, v580, v543, v518, 0, v427, v428, v470, v510, v475);
      -[BWStillImageSmartStyleAttachmentTransferNode setSmartStyleRenderingVersion:](v429, "setSmartStyleRenderingVersion:", objc_msgSend(v22, "smartStyleRenderingVersion"));
      v430 = (objc_class *)v304[397];
      v628.receiver = (id)v350;
      v628.super_class = v430;
      if ((objc_msgSendSuper2(&v628, sel_addNode_error_, v429, &v746) & 1) == 0)
        goto LABEL_786;
      v431 = a12;
      v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v429, "input"), v500);
      if (v747)
        goto LABEL_786;
LABEL_719:
      v314 = -[BWNode output](v429, "output");
      goto LABEL_729;
    }
    if (v512)
    {
      v432 = -[BWInferenceSynchronizerNode initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:]([BWInferenceSynchronizerNode alloc], "initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:", 0, 1, 0);
      -[BWNode setName:](v432, "setName:", CFSTR("24MP/12MP Inference Synchronizer"));
      -[BWInferenceSynchronizerNode setAttachedMediaKeysToSkip:](v432, "setAttachedMediaKeysToSkip:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", 0x1E4936818));
      -[BWInferenceSynchronizerNode setAllowOutOfOrderInputs:](v432, "setAllowOutOfOrderInputs:", 1);
      v627[0] = MEMORY[0x1E0C809B0];
      v627[1] = 3221225472;
      v627[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_2_806;
      v627[3] = &unk_1E491FCB8;
      v627[4] = v495;
      -[BWInferenceSynchronizerNode setSynchronizeInferencesResolver:](v432, "setSynchronizeInferencesResolver:", v627);
      v433 = (objc_class *)v304[397];
      v626.receiver = (id)v350;
      v626.super_class = v433;
      v431 = a12;
      if ((objc_msgSendSuper2(&v626, sel_addNode_error_, v432, &v746) & 1) == 0)
        goto LABEL_786;
      v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v405, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v432, "inputs"), "objectAtIndexedSubscript:", 0), v500);
      if (v747)
        goto LABEL_786;
      v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v432, "inputs"), "objectAtIndexedSubscript:", 1), v500);
      if (v747)
        goto LABEL_786;
      v314 = -[BWNode output](v432, "output");
      if (v504)
      {
        v429 = -[BWStillImageSmartStyleAttachmentTransferNode initWithNodeConfiguration:]([BWStillImageSmartStyleAttachmentTransferNode alloc], "initWithNodeConfiguration:", v267);
        v434 = (objc_class *)v304[397];
        v625.receiver = (id)v546;
        v625.super_class = v434;
        if ((objc_msgSendSuper2(&v625, sel_addNode_error_, v429, &v746) & 1) == 0)
          goto LABEL_786;
        v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v429, "input"), v310);
        if (v747)
          goto LABEL_786;
        goto LABEL_719;
      }
    }
    else
    {
      v431 = a12;
    }
LABEL_729:
    if ((_DWORD)v540 == 1)
    {
      v435 = -[BWStillImageTurnstileNode initWithStillImageCoordinator:]([BWStillImageTurnstileNode alloc], "initWithStillImageCoordinator:", *(_QWORD *)(v546 + 56));
      v436 = (objc_class *)v304[397];
      v624.receiver = (id)v546;
      v624.super_class = v436;
      if ((objc_msgSendSuper2(&v624, sel_addNode_error_, v435, &v746) & 1) == 0)
        goto LABEL_786;
      v747 = objc_msgSend(v431, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v435, "input"), v310);
      if (v747)
        goto LABEL_786;
      v314 = -[BWNode output](v435, "output");
    }
    LODWORD(v437) = objc_msgSend(v22, "deviceHasFlash");
    v438 = -[FigCaptureCameraParameters gainMapVersion](v599, "gainMapVersion");
    if (v542 == 1)
      v437 = 1;
    else
      v437 = v437;
    v439 = v506;
    if (v542 == 1)
      v439 = 1;
    if (v438 < 0x20000)
      v440 = v439;
    else
      v440 = 0;
    if ((v438 & 0xFFFE0000) != 0)
      v441 = v439;
    else
      v441 = 0;
    if (v567)
    {
      v442 = v304;
      v443 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", 2, 1986618469);
      -[BWNode setName:](v443, "setName:", CFSTR("Stereo Photo Funnel"));
      v444 = (objc_class *)v442[397];
      v623.receiver = (id)v546;
      v623.super_class = v444;
      if ((objc_msgSendSuper2(&v623, sel_addNode_error_, v443, &v746) & 1) == 0)
        goto LABEL_786;
      v747 = objc_msgSend(v431, "safelyConnectOutput:toInput:pipelineStage:", v314, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v443, "inputs"), "objectAtIndexedSubscript:", 0), v509);
      if (v747)
        goto LABEL_786;
      v747 = objc_msgSend(v431, "safelyConnectOutput:toInput:pipelineStage:", v567, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v443, "inputs"), "objectAtIndexedSubscript:", 1), v509);
      if (v747)
        goto LABEL_786;
      v314 = -[BWNode output](v443, "output");
      v304 = &selRef_humanFaceEyeDetectionEnabled;
    }
    v622 = 0;
    v621 = 0;
    v620 = 0;
    v747 = -[FigCapturePhotonicEngineSinkPipeline _buildScaleAndEncodeSubPipelineWithPipelineStage:graph:nodeConfiguration:stillImageSinkPipelineWithConfiguration:sensorConfigurationsByPortType:supportsScaling:deferredPearlDepthProcessingEnabled:provideMeteorHeadroom:provideFlexGTC:providePostEncodeInferences:semanticDevelopmentVersion:constituentPhotoDeliveryEnabled:demosaicedRawEnabled:nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:propagatedMainImageDownscalingFactorByAttachedMediaKey:scalingMainImageDownscalingFactorByAttachedMediaKey:inferenceScheduler:subPipelineInputOut:subPipelineOutputOut:cameraSupportsFlash:cinematicFramingStatesProvider:photoEncoderControllerOut:]((void *)v546, v509, v431, v267, v22, (uint64_t)v606, v556 ^ 1, v589, v440, v441, v485, v511, v538, v142, v555, (uint64_t)v549, a10, &v622, &v621,
             v437,
             a11,
             &v620);
    if (v747)
      goto LABEL_786;
    if (v580 && v620)
      -[BWPhotonicEngineNode setPhotoEncoderController:](v580, "setPhotoEncoderController:");
    v747 = objc_msgSend(v431, "safelyConnectOutput:toInput:pipelineStage:", v314, v622, v509);
    if (v747)
      goto LABEL_786;
    v445 = v621;
    if (objc_msgSend(v532, "optimizesImagesForOfflineVideoStabilization"))
    {
      v446 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v616 = 0u;
      v617 = 0u;
      v618 = 0u;
      v619 = 0u;
      v447 = objc_msgSend(v606, "countByEnumeratingWithState:objects:count:", &v616, v750, 16);
      if (v447)
      {
        v448 = v447;
        v449 = *(_QWORD *)v617;
        do
        {
          for (i3 = 0; i3 != v448; ++i3)
          {
            if (*(_QWORD *)v617 != v449)
              objc_enumerationMutation(v606);
            objc_msgSend(v446, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v606, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v616 + 1) + 8 * i3)), "sensorIDDictionary"), *(_QWORD *)(*((_QWORD *)&v616 + 1) + 8 * i3));
          }
          v448 = objc_msgSend(v606, "countByEnumeratingWithState:objects:count:", &v616, v750, 16);
        }
        while (v448);
      }
      v451 = objc_msgSend(v22, "horizontalSensorBinningFactor");
      v452 = objc_msgSend(v22, "verticalSensorBinningFactor");
      objc_msgSend(v22, "maxSupportedFrameRate");
      v454 = FigCaptureBuildMotionAttachmentsNode((void *)v546, v445, v451, v452, v584, objc_msgSend(v22, "motionAttachmentsSource"), (uint64_t)v446, objc_msgSend(v22, "cameraInfoByPortType"), v453, v478, 0, 1, 1, 0, &v747);
      if (v747)
        goto LABEL_786;
      v445 = v454;
      v304 = &selRef_humanFaceEyeDetectionEnabled;
    }
    v455 = -[BWStillImageSampleBufferSinkNode initWithSinkID:]([BWStillImageSampleBufferSinkNode alloc], "initWithSinkID:", objc_msgSend((id)v546, "sinkID"));
    -[BWNode setName:](v455, "setName:", CFSTR("Still Image Sink"));
    -[BWStillImageSampleBufferSinkNode setPropagatedAttachedMediaKeys:](v455, "setPropagatedAttachedMediaKeys:", objc_msgSend(v555, "allKeys"));
    -[BWStillImageSampleBufferSinkNode setCameraSupportsFlash:](v455, "setCameraSupportsFlash:", v437);
    v456 = (objc_class *)v304[397];
    v615.receiver = (id)v546;
    v615.super_class = v456;
    if ((objc_msgSendSuper2(&v615, sel_addNode_error_, v455, &v746) & 1) != 0)
    {
      *(_QWORD *)(v546 + 72) = v455;
      v747 = objc_msgSend(v431, "safelyConnectOutput:toInput:pipelineStage:", v445, -[BWNode input](v455, "input"), v509);
      if (!v747)
      {
        v613 = 0u;
        v614 = 0u;
        v611 = 0u;
        v612 = 0u;
        v457 = (void *)objc_msgSend((id)v546, "nodes");
        v458 = objc_msgSend(v457, "countByEnumeratingWithState:objects:count:", &v611, v749, 16);
        if (v458)
        {
          v459 = v458;
          v460 = *(_QWORD *)v612;
          do
          {
            for (i4 = 0; i4 != v459; ++i4)
            {
              if (*(_QWORD *)v612 != v460)
                objc_enumerationMutation(v457);
              v462 = *(void **)(*((_QWORD *)&v611 + 1) + 8 * i4);
              objc_msgSend(v462, "setDeferredPreparePriority:", 1);
              v609 = 0u;
              v610 = 0u;
              v607 = 0u;
              v608 = 0u;
              v463 = (void *)objc_msgSend(v462, "inputs");
              v464 = objc_msgSend(v463, "countByEnumeratingWithState:objects:count:", &v607, v748, 16);
              if (v464)
              {
                v465 = v464;
                v466 = *(_QWORD *)v608;
                do
                {
                  for (i5 = 0; i5 != v465; ++i5)
                  {
                    if (*(_QWORD *)v608 != v466)
                      objc_enumerationMutation(v463);
                    objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v607 + 1) + 8 * i5), "connection"), "setWantsMessageCachingWhileSuspended:", 1);
                  }
                  v465 = objc_msgSend(v463, "countByEnumeratingWithState:objects:count:", &v607, v748, 16);
                }
                while (v465);
              }
            }
            v459 = objc_msgSend(v457, "countByEnumeratingWithState:objects:count:", &v611, v749, 16);
          }
          while (v459);
        }
        objc_msgSend(*(id *)(v546 + 56), "setDeferredPreparePriority:", 4);
        goto LABEL_787;
      }
    }
    goto LABEL_786;
  }
  if ((v564 & 1) != 0)
    goto LABEL_683;
  v406 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a10, *(unsigned int *)(v350 + 52));
  if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v350, v406))
  {
LABEL_781:
    v468 = -12780;
LABEL_782:
    v747 = v468;
    goto LABEL_787;
  }
  -[BWNode setName:](v406, "setName:", CFSTR("Landmarks"));
  if (((v553 | v513 ^ 1) & 1) == 0)
  {
    -[BWInferenceNode addInferenceOfType:version:configuration:](v406, "addInferenceOfType:version:configuration:", 104, Major & 0xFFFFFFFFFFFFLL, v487);
    v407 = (void *)MEMORY[0x1E0CB3940];
    v472 = -[BWNode name](v406, "name");
    v408 = v407;
    v304 = &selRef_humanFaceEyeDetectionEnabled;
    -[BWNode setName:](v406, "setName:", objc_msgSend(v408, "stringWithFormat:", CFSTR("%@ + PersonSemantics"), v472));
    LOBYTE(v553) = 1;
  }
  -[BWInferenceNode setInferenceTypesToSkipResolver:](v406, "setInferenceTypesToSkipResolver:", v734);
  v409 = (objc_class *)v304[397];
  v634.receiver = (id)v350;
  v634.super_class = v409;
  if ((objc_msgSendSuper2(&v634, sel_addNode_error_, v406, &v746) & 1) == 0)
    goto LABEL_786;
  v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v406, "input"), v310);
  if (v747)
    goto LABEL_786;
  v314 = -[BWNode output](v406, "output");
LABEL_683:
  if (v576)
  {
    if (-[FigCaptureCameraParameters complementMatteSuppressionDecisionWithISPDetectedFaces](v599, "complementMatteSuppressionDecisionWithISPDetectedFaces"))
    {
      v410 = 4;
    }
    else
    {
      v410 = 2;
    }
    v411 = (void *)v350;
    v412 = -[BWMatteMediaSuppressionNode initWithBehavior:]([BWMatteMediaSuppressionNode alloc], "initWithBehavior:", v410 | v484);
    -[BWNode setName:](v412, "setName:", CFSTR("Matting Media Suppression Node"));
    -[BWMatteMediaSuppressionNode setSmartStyleReversibilityEnabled:](v412, "setSmartStyleReversibilityEnabled:", objc_msgSend(v22, "smartStyleReversibilityEnabled"));
    v304 = &selRef_humanFaceEyeDetectionEnabled;
    v633.receiver = v411;
    v633.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v633, sel_addNode_error_, v412, &v746) & 1) == 0)
      goto LABEL_786;
    v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v314, -[BWNode input](v412, "input"), v310);
    if (v747)
      goto LABEL_786;
    goto LABEL_708;
  }
  newValuee = v314;
  v413 = +[BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration personSegmentationAndMattingConfiguration](BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration, "personSegmentationAndMattingConfiguration");
  v414 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v413);
  -[BWNode setName:](v414, "setName:", CFSTR("Matting Conditional Router"));
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v414, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v413, "defaultOutputIndex")), "setName:", CFSTR("Default"));
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v414, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v413, "personSegmentationAndMattingOuputIndex")), "setName:", CFSTR("Segmentation&Matting"));
  v632.receiver = (id)v350;
  v632.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  if ((objc_msgSendSuper2(&v632, sel_addNode_error_, v414, &v746) & 1) != 0)
  {
    v415 = -[BWInferenceNode initWithScheduler:priority:]([BWInferenceNode alloc], "initWithScheduler:priority:", a10, *(unsigned int *)(v350 + 52));
    v416 = v415;
    if ((v553 & 1) == 0)
    {
      -[BWInferenceNode addInferenceOfType:version:configuration:](v415, "addInferenceOfType:version:configuration:", 104, Major & 0xFFFFFFFFFFFFLL, v487);
      -[BWNode setName:](v416, "setName:", CFSTR("PersonSemantics"));
    }
    v592 = v413;
    objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor");
    if (-[FigCapturePhotonicEngineSinkPipeline _addMattingInferenceToNode:mattingVersion:learnedMattingVersion:mainImageDownscalingFactor:targetAspectRatio:appliesFinalCropRect:enabledSemantics:metalCommandQueue:mattingSensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:](v350, v416, v482, v481, v556, -[BWPersonSemanticsConfiguration enabledSemantics](v487, "enabledSemantics"), (uint64_t)-[BWStillImageNodeConfiguration metalCommandQueue](v539, "metalCommandQueue"), (uint64_t)v527, v417, v111, v535, v480))goto LABEL_781;
    -[BWInferenceNode setIgnoreInvalidContentInformationForPrimaryMedia:](v416, "setIgnoreInvalidContentInformationForPrimaryMedia:", v545);
    -[BWInferenceNode setInferenceTypesToSkipResolver:](v416, "setInferenceTypesToSkipResolver:", v734);
    v631.receiver = (id)v350;
    v631.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v631, sel_addNode_error_, v416, &v746) & 1) != 0)
    {
      v418 = (void *)v350;
      v419 = (v512 & v517) != 0 ? 3 : 2;
      v412 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", v419, 1986618469);
      -[BWNode setName:](v412, "setName:", CFSTR("Matting Funnel"));
      v630.receiver = v418;
      v630.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v630, sel_addNode_error_, v412, &v746) & 1) != 0)
      {
        v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", newValuee, -[BWNode input](v414, "input"), v310);
        if (!v747)
        {
          v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v414, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v592, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v412, "inputs"), "objectAtIndexedSubscript:", 0), v310);
          if (!v747)
          {
            v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v414, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v592, "personSegmentationAndMattingOuputIndex")), -[BWNode input](v416, "input"), v310);
            if (!v747)
            {
              v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWNode output](v416, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v412, "inputs"), "objectAtIndexedSubscript:", 1), v310);
              v267 = v539;
              if (!v747)
              {
                v420 = v405 ? v512 & v517 : 0;
                v304 = &selRef_humanFaceEyeDetectionEnabled;
                if (v420 != 1
                  || (v747 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v405, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v412, "inputs"), "objectAtIndexedSubscript:", 2), v310)) == 0)
                {
LABEL_708:
                  v314 = -[BWNode output](v412, "output");
                  v350 = v546;
                  goto LABEL_709;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_786:
  FigDebugAssert3();
LABEL_787:
  result = v747;
  if (!v747)
  {
    if (v746)
      return objc_msgSend(v746, "code");
  }
  return result;
}

- (uint64_t)_addLandmarksInferenceToNode:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  id v6;

  if (result)
  {
    v3 = (void *)objc_msgSend(a2, "name");
    v4 = objc_msgSend(v3, "length");
    v5 = CFSTR("Landmarks");
    if (v4)
      v5 = (const __CFString *)objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" + %@"), CFSTR("Landmarks"));
    objc_msgSend(a2, "setName:", v5);
    v6 = +[BWLandmarksInferenceConfiguration configuration](BWLandmarksInferenceConfiguration, "configuration");
    objc_msgSend(v6, "setMaximumNumberOfFaces:", +[BWLandmarksInferenceConfiguration portraitMaximumNumberOfFaces](BWLandmarksInferenceConfiguration, "portraitMaximumNumberOfFaces"));
    return objc_msgSend(a2, "addInferenceOfType:version:configuration:", 801, objc_msgSend(v6, "landmarksInferenceVersion") & 0xFFFFFFFFFFFFLL, v6);
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

  v3.receiver = self;
  v3.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  -[FigCaptureSinkPipeline dealloc](&v3, sel_dealloc);
}

- (BWPortraitHDRStagingNode)portraitHDRStagingNode
{
  return self->_portraitHDRStagingNode;
}

BOOL __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke(uint64_t a1, const void *a2)
{
  return (BWStillImageProcessingFlagsForSampleBuffer(a2) & 0x200000) == 0;
}

uint64_t __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_2(uint64_t a1, CMAttachmentBearerRef target)
{
  void *v4;
  int v5;
  int v6;
  _BOOL4 v7;
  int v8;
  void *v11;

  v4 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
  v5 = BWStillImageProcessingFlagsForSampleBuffer(target);
  v6 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend((id)objc_msgSend(v4, "requestedSettings"), "processedImageFilters"));
  v7 = (objc_msgSend((id)objc_msgSend(v4, "requestedSettings"), "portraitEffectsMatteDeliveryEnabled") & 1) != 0
    || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "requestedSettings"), "enabledSemanticSegmentationMatteURNs"), "count") != 0;
  if ((v5 & 0x1000) != 0)
    v8 = v6;
  else
    v8 = 1;
  if (v7 && v8 && (v5 & 0x200000) == 0)
    return 0;
  if (*(_BYTE *)(a1 + 32))
    v11 = &unk_1E4A003F8;
  else
    v11 = &unk_1E4A00410;
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
}

BOOL __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_578(uint64_t a1)
{
  return objc_msgSend((id)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))(), "count") == 0;
}

- (uint64_t)_addScalerNodeWithName:(void *)a3 nodeConfiguration:(uint64_t)a4 bravoConstituentPhotoDeliveryEnabled:(uint64_t)a5 mainImageDownscalingFactorByAttachedMediaKey:(uint64_t)a6 depthDataDimensions:(uint64_t)a7 smartStyleLinearThumbnailDimensions:(uint64_t)a8 smartStyleStyledThumbnailDimensions:(char)a9 smartStyleReversibilityEnabled:(uint64_t)a10 constantColorConfidenceMapDimensions:(char)a11 filterRenderingEnabled:(unsigned __int8)a12 enforcesZoomingForPortraitCaptures:(unsigned __int8)a13 backPressureDrivenPipelining:(_QWORD *)a14 scalerNodeInputOut:(uint64_t *)a15 scalerNodeOutputOut:
{
  void *v21;
  int v22;
  _BOOL4 v23;
  int v24;
  BWStillImageScalerNode *v25;
  void *v26;
  const __CFDictionary *v27;
  uint64_t v28;
  objc_super v30;
  uint64_t v31;
  CGSize v32;
  CGSize v33;
  CGSize v34;
  CGSize v35;
  CGSize v36;
  CGSize v37;

  if (result)
  {
    v21 = (void *)result;
    v31 = 0;
    v22 = 1;
    if (objc_msgSend(a3, "deferredPhotoProcessorEnabled"))
    {
      v23 = FigCaptureVideoDimensionsAreValid(a6);
      v22 = v23 ? 2 : 1;
      if (v23 && (a11 & 1) == 0)
      {
        if (objc_msgSend(a3, "optimizedEnhancedResolutionDepthPipelineEnabled"))
          v22 = 2;
        else
          v22 = 1;
      }
    }
    v24 = 1;
    if (objc_msgSend(a3, "deferredPhotoProcessorEnabled"))
    {
      if (objc_msgSend(a3, "pearlModuleType"))
        v24 = 2;
      else
        v24 = 1;
    }
    v25 = -[BWStillImageScalerNode initWithBasePoolCapacity:nodeConfiguration:]([BWStillImageScalerNode alloc], "initWithBasePoolCapacity:nodeConfiguration:", (v24 * v22), a3);
    -[BWNode setName:](v25, "setName:", a2);
    -[BWStillImageScalerNode setBlackFillingRequired:](v25, "setBlackFillingRequired:", a4);
    -[BWStillImageScalerNode setMainImageDownscalingFactorByAttachedMediaKey:](v25, "setMainImageDownscalingFactorByAttachedMediaKey:", a5);
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (FigCaptureVideoDimensionsAreValid(a6))
    {
      v32.width = (double)(int)a6;
      v32.height = (double)SHIDWORD(a6);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", CGSizeCreateDictionaryRepresentation(v32), CFSTR("Depth"));
    }
    if (a9)
    {
      if (FigCaptureVideoDimensionsAreValid(a7))
      {
        v33.width = (double)(int)a7;
        v33.height = (double)SHIDWORD(a7);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", CGSizeCreateDictionaryRepresentation(v33), 0x1E495B258);
      }
      if (FigCaptureVideoDimensionsAreValid(a8))
      {
        v34.width = (double)(int)a8;
        v34.height = (double)SHIDWORD(a8);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", CGSizeCreateDictionaryRepresentation(v34), 0x1E495B298);
      }
      v35.width = 160.0;
      v35.height = 162.0;
      objc_msgSend(v26, "setObject:forKeyedSubscript:", CGSizeCreateDictionaryRepresentation(v35), 0x1E495B2D8);
      v36.width = 32.0;
      v36.height = 32.0;
      v27 = CGSizeCreateDictionaryRepresentation(v36);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, 0x1E495B2F8);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, 0x1E495B318);
    }
    if (FigCaptureVideoDimensionsAreValid(a10))
    {
      v37.width = (double)(int)a10;
      v37.height = (double)SHIDWORD(a10);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", CGSizeCreateDictionaryRepresentation(v37), 0x1E495B438);
    }
    if (objc_msgSend(v26, "count"))
      -[BWStillImageScalerNode setOutputSizeByAttachedMediaKey:](v25, "setOutputSizeByAttachedMediaKey:", v26);
    -[BWStillImageScalerNode setEnforcesZoomingForPortraitCaptures:](v25, "setEnforcesZoomingForPortraitCaptures:", a12);
    -[BWStillImageScalerNode setBackPressureDrivenPipelining:](v25, "setBackPressureDrivenPipelining:", a13);
    v30.receiver = v21;
    v30.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v30, sel_addNode_error_, v25, &v31) & 1) != 0)
    {
      if (a14)
        *a14 = -[BWNode input](v25, "input");
      if (a15)
      {
        v28 = -[BWNode output](v25, "output");
        result = 0;
        *a15 = v28;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      FigDebugAssert3();
      return 4294954510;
    }
  }
  return result;
}

uint64_t __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_769(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    else
      return 1;
  }
  return result;
}

unint64_t __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_2_806(uint64_t a1, CMAttachmentBearerRef target)
{
  unint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, CFSTR("StillSettings"), 0), "captureSettings"), "captureFlags");
  v5 = *(_QWORD *)(a1 + 32);
  if (!v5)
    return (v4 >> 11) & 1;
  if ((v4 & 0x800) != 0)
    return (*(uint64_t (**)(uint64_t, CMAttachmentBearerRef))(v5 + 16))(v5, target);
  return 0;
}

- (uint64_t)_buildScaleAndEncodeSubPipelineWithPipelineStage:(void *)a1 graph:(uint64_t)a2 nodeConfiguration:(void *)a3 stillImageSinkPipelineWithConfiguration:(void *)a4 sensorConfigurationsByPortType:(void *)a5 supportsScaling:(uint64_t)a6 deferredPearlDepthProcessingEnabled:(int)a7 provideMeteorHeadroom:(int)a8 provideFlexGTC:(char)a9 providePostEncodeInferences:(char)a10 semanticDevelopmentVersion:(char)a11 constituentPhotoDeliveryEnabled:(unsigned int)a12 demosaicedRawEnabled:(unsigned __int8)a13 nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a14 propagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a15 scalingMainImageDownscalingFactorByAttachedMediaKey:(uint64_t)a16 inferenceScheduler:(uint64_t)a17 subPipelineInputOut:(uint64_t *)a18 subPipelineOutputOut:(uint64_t *)a19 cameraSupportsFlash:(unsigned __int8)a20 cinematicFramingStatesProvider:(void *)a21 photoEncoderControllerOut:(_QWORD *)a22
{
  void *v25;
  uint64_t v27;
  char **v28;
  BWCinematicFramingWarpingNode *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  BWCinematicFramingWarpingNode *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BWMeteorHeadroomNode *v41;
  objc_class *v42;
  uint64_t v43;
  id v44;
  void *v45;
  BWFlexGTCNode *v46;
  objc_class *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  BWPhotoEncoderNode *v51;
  BWPhotoEncoderNode *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  BWPhotoEncoderNodeAttachedMediaConfiguration *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  uint64_t v65;
  void *v66;
  void *v67;
  float v68;
  float v69;
  float v70;
  BWPhotoEncoderNodeAttachedMediaConfiguration *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v90;
  objc_super v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  objc_super v105;
  objc_super v106;
  uint64_t v107;
  uint64_t v108;
  objc_super v109;
  uint64_t v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v110 = 0;
  if (!a18 || !a19)
    return FigSignalErrorAt();
  v25 = a5;
  objc_msgSend(a5, "sinkConfiguration");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = objc_msgSend(v25, "sinkConfiguration");
  else
    v27 = 0;
  v28 = &selRef_humanFaceEyeDetectionEnabled;
  v90 = v25;
  v87 = (void *)v27;
  if (!objc_msgSend(v25, "cinematicFramingWarpingRequired"))
  {
    v36 = 0;
    v35 = 0;
    if (!a7)
      goto LABEL_22;
    goto LABEL_12;
  }
  v29 = [BWCinematicFramingWarpingNode alloc];
  v30 = objc_msgSend(v25, "cinematicFramingWarpingOutputDimensions");
  v31 = v25;
  v32 = v30;
  objc_msgSend(v31, "maxLossyCompressionLevel");
  v33 = v29;
  v28 = &selRef_humanFaceEyeDetectionEnabled;
  v34 = -[BWCinematicFramingWarpingNode initWithFramingStatesProvider:outputDimensions:maxLossyCompressionLevel:](v33, a21, v32);
  objc_msgSend(v34, "setName:", CFSTR("CinematicFramingWarper"));
  v109.receiver = a1;
  v109.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  if (!objc_msgSendSuper2(&v109, sel_addNode_error_, v34, &v110))
    goto LABEL_94;
  v35 = objc_msgSend(v34, "input");
  v36 = objc_msgSend(v34, "output");
  v25 = v90;
  if (a7)
  {
LABEL_12:
    v86 = a6;
    v37 = v35;
    v107 = 0;
    v108 = 0;
    if ((objc_msgSend(v25, "continuousZoomWithDepthSupported") & 1) != 0 || (v38 = 0, a8))
      v38 = objc_msgSend(v25, "depthDataDimensions");
    v39 = -[FigCapturePhotonicEngineSinkPipeline _addScalerNodeWithName:nodeConfiguration:bravoConstituentPhotoDeliveryEnabled:mainImageDownscalingFactorByAttachedMediaKey:depthDataDimensions:smartStyleLinearThumbnailDimensions:smartStyleStyledThumbnailDimensions:smartStyleReversibilityEnabled:constantColorConfidenceMapDimensions:filterRenderingEnabled:enforcesZoomingForPortraitCaptures:backPressureDrivenPipelining:scalerNodeInputOut:scalerNodeOutputOut:]((uint64_t)a1, (uint64_t)CFSTR("Scaler"), a4, a13, a16, v38, objc_msgSend(v25, "smartStyleLinearThumbnailDimensions"), objc_msgSend(v25, "smartStyleStyledThumbnailDimensions"), objc_msgSend(v25, "smartStyleReversibilityEnabled"), objc_msgSend(v25, "constantColorConfidenceMapDimensions"), 0, 0, 0, &v108, &v107);
    if ((_DWORD)v39)
    {
      v80 = v39;
      goto LABEL_98;
    }
    if (v36)
    {
      v40 = objc_msgSend(a3, "safelyConnectOutput:toInput:pipelineStage:", v36, v108, a2);
      if ((_DWORD)v40)
      {
        v80 = v40;
        goto LABEL_98;
      }
    }
    v36 = v107;
    if (v37)
      v35 = v37;
    else
      v35 = v108;
    v28 = &selRef_humanFaceEyeDetectionEnabled;
    a6 = v86;
  }
LABEL_22:
  if (a9)
  {
    v41 = -[BWMeteorHeadroomNode initWithNodeConfiguration:sensorConfigurationsByPortType:]([BWMeteorHeadroomNode alloc], "initWithNodeConfiguration:sensorConfigurationsByPortType:", a4, a6);
    -[BWNode setName:](v41, "setName:", CFSTR("Meteor Headroom"));
    -[BWMeteorHeadroomNode setHeadroomProcessingType:](v41, "setHeadroomProcessingType:", -[FigCaptureCameraParameters meteorHeadroomProcessingType](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "meteorHeadroomProcessingType"));
    objc_msgSend(v25, "gainMapMainImageDownscalingFactor");
    -[BWMeteorHeadroomNode setGainMapMainImageDownscalingFactor:](v41, "setGainMapMainImageDownscalingFactor:");
    v42 = (objc_class *)v28[397];
    v106.receiver = a1;
    v106.super_class = v42;
    if ((objc_msgSendSuper2(&v106, sel_addNode_error_, v41, &v110) & 1) == 0)
      goto LABEL_94;
    if (v36)
    {
      v43 = objc_msgSend(a3, "safelyConnectOutput:toInput:pipelineStage:", v36, -[BWNode input](v41, "input"), a2);
      if ((_DWORD)v43)
      {
        v80 = v43;
        goto LABEL_98;
      }
    }
    if (!v35)
      v35 = -[BWNode input](v41, "input");
    v36 = -[BWNode output](v41, "output");
  }
  v85 = a1;
  if (!a10)
  {
    v49 = a6;
    v83 = v36;
    v84 = v35;
    goto LABEL_37;
  }
  v44 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice"), "newCommandQueue");
  objc_msgSend(v25, "pipelineStagePriority");
  v45 = (void *)FigDispatchQueueCreateWithPriority();
  objc_msgSend(v44, "setCompletionQueue:", v45);
  objc_msgSend(v44, "setSubmissionQueue:", v45);

  v46 = -[BWFlexGTCNode initWithNodeConfiguration:sensorConfigurationsByPortType:metalCommandQueue:]([BWFlexGTCNode alloc], "initWithNodeConfiguration:sensorConfigurationsByPortType:metalCommandQueue:", a4, a6, v44);
  -[BWNode setName:](v46, "setName:", CFSTR("FlexGTC"));
  v47 = (objc_class *)v28[397];
  v105.receiver = a1;
  v105.super_class = v47;
  if ((objc_msgSendSuper2(&v105, sel_addNode_error_, v46, &v110) & 1) == 0)
  {
LABEL_94:
    FigDebugAssert3();
    return 4294954510;
  }
  if (v36)
  {
    v48 = objc_msgSend(a3, "safelyConnectOutput:toInput:pipelineStage:", v36, -[BWNode input](v46, "input"), a2);
    if ((_DWORD)v48)
    {
      v80 = v48;
      goto LABEL_98;
    }
  }
  if (!v35)
    v35 = -[BWNode input](v46, "input");
  v49 = a6;
  v84 = v35;
  v83 = -[BWNode output](v46, "output");
LABEL_37:
  if (objc_msgSend(v87, "previewQualityAdjustedPhotoFilterRenderingEnabled"))
    v50 = 2;
  else
    v50 = 0;
  v51 = [BWPhotoEncoderNode alloc];
  if (!a11)
    a17 = 0;
  LOBYTE(v82) = objc_msgSend(v90, "stillImageSinkPipelineProcessingMode") == 1;
  v53 = -[BWPhotoEncoderNode initWithNodeConfiguration:sensorConfigurationsByPortType:semanticDevelopmentVersion:inferenceScheduler:alwaysAwaitInference:portraitRenderQuality:deferredPhotoProcessorEnabled:](v51, "initWithNodeConfiguration:sensorConfigurationsByPortType:semanticDevelopmentVersion:inferenceScheduler:alwaysAwaitInference:portraitRenderQuality:deferredPhotoProcessorEnabled:", a4, v49, a12, a17, (int)a12 > 0, v50, v82);
  -[BWNode setName:](v53, "setName:", CFSTR("Encoder"));
  -[BWPhotoEncoderNode setCameraSupportsFlash:](v53, "setCameraSupportsFlash:", a20);
  -[BWPhotoEncoderNode setUsesHighEncodingPriority:](v53, "setUsesHighEncodingPriority:", objc_msgSend(v90, "usesHighEncodingPriority"));
  v54 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v55 = objc_msgSend(a14, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v102 != v57)
          objc_enumerationMutation(a14);
        v59 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
        v60 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
        objc_msgSend((id)objc_msgSend(a14, "objectForKeyedSubscript:", v59), "floatValue");
        objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v60, "initWithMainImageDownscalingFactor:propagationMode:", 1), v59);
      }
      v56 = objc_msgSend(a14, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
    }
    while (v56);
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v61 = objc_msgSend(a15, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v98;
    while (2)
    {
      for (j = 0; j != v62; ++j)
      {
        if (*(_QWORD *)v98 != v63)
          objc_enumerationMutation(a15);
        v65 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j);
        v66 = (void *)objc_msgSend(v54, "objectForKeyedSubscript:", v65);
        if (v66)
        {
          v67 = v66;
          objc_msgSend(v66, "mainImageDownscalingFactor");
          v69 = v68;
          objc_msgSend((id)objc_msgSend(a15, "objectForKeyedSubscript:", v65), "floatValue");
          if (v69 != v70)
            return 4294954516;
          objc_msgSend(v67, "setPropagationMode:", 2);
        }
        else
        {
          v71 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
          objc_msgSend((id)objc_msgSend(a15, "objectForKeyedSubscript:", v65), "floatValue");
          objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v71, "initWithMainImageDownscalingFactor:propagationMode:", 0), v65);
        }
      }
      v62 = objc_msgSend(a15, "countByEnumeratingWithState:objects:count:", &v97, v112, 16);
      if (v62)
        continue;
      break;
    }
  }
  -[BWPhotoEncoderNode setSmartStyleRenderingVersion:](v53, "setSmartStyleRenderingVersion:", objc_msgSend(v90, "smartStyleRenderingVersion"));
  -[BWPhotoEncoderNode setSmartStyleReversibilityEnabled:](v53, "setSmartStyleReversibilityEnabled:", objc_msgSend(v90, "smartStyleReversibilityEnabled"));
  if (objc_msgSend(v90, "smartStyleReversibilityEnabled"))
  {
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend(v90, "smartStyleLinearThumbnailDimensions")))
      objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithDimensions:propagationMode:]([BWPhotoEncoderNodeAttachedMediaConfiguration alloc], "initWithDimensions:propagationMode:", objc_msgSend(v90, "smartStyleLinearThumbnailDimensions"), 1), 0x1E495B258);
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend(v90, "smartStyleStyledThumbnailDimensions")))
      objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithDimensions:propagationMode:]([BWPhotoEncoderNodeAttachedMediaConfiguration alloc], "initWithDimensions:propagationMode:", objc_msgSend(v90, "smartStyleStyledThumbnailDimensions"), 1), 0x1E495B298);
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v72 = (void *)BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw();
    v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
    if (v73)
    {
      v74 = v73;
      v75 = *(_QWORD *)v94;
      do
      {
        for (k = 0; k != v74; ++k)
        {
          if (*(_QWORD *)v94 != v75)
            objc_enumerationMutation(v72);
          objc_msgSend((id)objc_msgSend(v54, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * k)), "setPropagationMode:", 2);
        }
        v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
      }
      while (v74);
    }
  }
  if ((int)objc_msgSend(v90, "constantColorVersion") >= 1)
    objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithDimensions:propagationMode:]([BWPhotoEncoderNodeAttachedMediaConfiguration alloc], "initWithDimensions:propagationMode:", objc_msgSend(v90, "constantColorConfidenceMapDimensions"), 2), 0x1E495B438);
  v77 = v84;
  if (objc_msgSend(v54, "count"))
    -[BWPhotoEncoderNode setAttachedMediaConfigurationByAttachedMediaKey:](v53, "setAttachedMediaConfigurationByAttachedMediaKey:", v54);
  v92.receiver = v85;
  v92.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  if ((objc_msgSendSuper2(&v92, sel_addNode_error_, v53, &v110) & 1) == 0)
    goto LABEL_94;
  if (v83)
  {
    v78 = objc_msgSend(a3, "safelyConnectOutput:toInput:pipelineStage:", v83, -[BWNode input](v53, "input"), a2);
    if ((_DWORD)v78)
    {
      v80 = v78;
LABEL_98:
      FigDebugAssert3();
      return v80;
    }
  }
  if (!v84)
    v77 = -[BWNode input](v53, "input");
  v79 = -[BWNode output](v53, "output");
  if (a22)
    *a22 = -[BWPhotoEncoderNode photoEncoderController](v53, "photoEncoderController");
  v80 = 4294954516;
  if (v77 && v79)
  {
    v80 = 0;
    *a18 = v77;
    *a19 = v79;
  }
  return v80;
}

@end
