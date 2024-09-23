@implementation FigCaptureStillImageSinkPipeline

+ (void)initialize
{
  objc_opt_class();
}

- (FigCaptureStillImageSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 captureStatusDelegate:(id)a6 inferenceScheduler:(id)a7 graph:(id)a8 name:(id)a9
{
  FigCaptureStillImageSinkPipeline *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FigCaptureStillImageSinkPipeline;
  v15 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v17, sel_initWithGraph_name_sinkID_, a8, a9, objc_msgSend((id)objc_msgSend(a3, "sinkConfiguration"), "sinkID"));
  if (v15)
  {
    v15->_captureDevice = (BWFigVideoCaptureDevice *)a4;
    if (-[FigCaptureStillImageSinkPipeline _buildStillImageSinkPipelineWithConfiguration:sourceOutputsByPortType:captureStatusDelegate:inferenceScheduler:graph:]((uint64_t)v15, a3, a5, (uint64_t)a6, (uint64_t)a7, a8))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v15;
}

- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(void *)a3 sourceOutputsByPortType:(uint64_t)a4 captureStatusDelegate:(uint64_t)a5 inferenceScheduler:(void *)a6 graph:
{
  id *v8;
  BWPipelineStage *v9;
  uint64_t v10;
  FigCaptureCameraParameters *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  int v29;
  unsigned int v30;
  BWPipelineStage *v31;
  BWPipelineStage *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  BOOL v44;
  uint64_t v45;
  BWHDRNode *v46;
  uint64_t v47;
  BWHDRNode *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  BWGNRNode *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BWGNRNode *v58;
  id *v59;
  const __CFString *v60;
  __objc2_class **v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BWSISNode *v65;
  BWSISNode *v66;
  const __CFString *v67;
  objc_class *v68;
  _BOOL8 v69;
  BWPipelineStage *v70;
  BWGNRNode *v71;
  objc_class *v72;
  void *v73;
  BWAttachedMediaSplitNode *v74;
  BWAttachedMediaSplitNode *v75;
  BWStillImageTimeMachineFrameCoordinatorNode *v76;
  BWStillImageCoordinatorNode *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t k;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  BWStillImageBufferRouterNode *v96;
  uint64_t v97;
  BWStillImageBufferRouterNode *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  BWSISNode *v106;
  int v107;
  int v108;
  BOOL v109;
  int v110;
  int v111;
  int v112;
  BWFunnelNode *v113;
  uint64_t v114;
  __objc2_class **v115;
  BWCrossoverNode *v116;
  BWPixelTransferNode *v117;
  objc_class *v118;
  uint64_t v119;
  BWPixelTransferNode *v120;
  objc_class *v121;
  void *v122;
  id v123;
  objc_class *v124;
  _QWORD *v125;
  unsigned int v126;
  BWNoiseReducerNode *v127;
  objc_class *v128;
  BWFunnelNode *v129;
  objc_class *v130;
  int v131;
  unsigned int v132;
  BWPortraitHDRStagingNode *v133;
  objc_class *v134;
  BWPortraitHDRStagingNode *v135;
  BWInferenceNode *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  BWStillImageDisparitySplitterNode *v140;
  objc_class *v141;
  int *v142;
  void *v143;
  BWStillImageMultiCameraDoserNode *v144;
  objc_class *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  BWStillImageDualPhotoFacePropagatorNode *v157;
  unsigned int v158;
  BWStereoFusionNode *v159;
  objc_class *v160;
  uint64_t v161;
  BWFunnelNode *v162;
  objc_class *v163;
  BWGNRNode *v164;
  objc_class *v165;
  BWFunnelNode *v166;
  objc_class *v167;
  uint64_t v168;
  BWPipelineStage *v169;
  BWInferenceNode *v170;
  id v171;
  char v172;
  BWFunnelNode *v173;
  objc_class *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  BWSensorConfiguration *v178;
  BWSensorConfiguration *v179;
  uint64_t v180;
  BWStillImageBravoDisparityNode *v181;
  BWInferenceNode *v182;
  BWInferenceSynchronizerNode *v183;
  BWDepthConverterNode *v184;
  objc_class *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  id *v192;
  BWSensorConfiguration *v193;
  double v194;
  uint64_t v195;
  BWStillImagePortraitMetadataNode *v196;
  uint64_t v197;
  double v198;
  BWStillImagePortraitMetadataNode *v199;
  objc_class *v200;
  BWInferenceNode *v201;
  id v202;
  id v203;
  BWStillImageConditionalRouterNode *v204;
  objc_class *v205;
  id *v206;
  BWInferenceNode *v207;
  uint64_t v208;
  uint64_t v209;
  BWMattingInferenceConfiguration *v210;
  double v211;
  double v212;
  uint64_t v213;
  objc_class *v214;
  BWFunnelNode *v215;
  objc_class *v216;
  BWStillImageFilterNode *v217;
  double v218;
  double v219;
  uint64_t v220;
  BWStillImageFilterNode *v221;
  objc_class *v222;
  BWStillImageTurnstileNode *v223;
  objc_class *v224;
  BWStillImageScalerNode *v225;
  void *v226;
  float v227;
  void *v228;
  objc_class *v229;
  uint64_t v230;
  BWMeteorHeadroomNode *v231;
  objc_class *v232;
  BWPhotoEncoderNode *v233;
  BWPhotoEncoderNodeAttachedMediaConfiguration *v234;
  double v235;
  BWPhotoEncoderNodeAttachedMediaConfiguration *v236;
  objc_class *v237;
  uint64_t v238;
  unsigned int v239;
  unsigned int v240;
  float v241;
  uint64_t v242;
  BWStillImageSampleBufferSinkNode *v243;
  void *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t m;
  void *v249;
  void *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t n;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  BWPipelineStage *v258;
  BWPipelineStage *v259;
  uint64_t v260;
  FigCaptureCameraParameters *v261;
  unsigned int v262;
  BWHDRNode *v263;
  unsigned int v265;
  uint64_t v266;
  BWStillImageNodeConfiguration *v267;
  uint64_t v268;
  unsigned int v269;
  unsigned int v270;
  BWNoiseReducerNode *v272;
  unsigned int v273;
  _BOOL4 v274;
  BWGNRNode *v275;
  unsigned int v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  unsigned int v280;
  BWSISNode *v281;
  unsigned int v282;
  unsigned int v283;
  BWPipelineStage *v284;
  unsigned int v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  int v290;
  unsigned int v291;
  void *v292;
  void *v293;
  int v294;
  int v295;
  BWStillImageDisparitySplitterNode *v296;
  _BOOL4 v297;
  unsigned int v298;
  _BYTE *v299;
  int v300;
  BWPipelineStage *v301;
  id *v302;
  uint64_t v303;
  BWStillImageCoordinatorNode *v304;
  unsigned int v305;
  void *v306;
  BWNodeOutput *obja;
  BWSensorConfiguration *objb;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  objc_super v318;
  objc_super v319;
  objc_super v320;
  objc_super v321;
  objc_super v322;
  objc_super v323;
  objc_super v324;
  objc_super v325;
  objc_super v326;
  objc_super v327;
  objc_super v328;
  objc_super v329;
  objc_super v330;
  objc_super v331;
  objc_super v332;
  objc_super v333;
  objc_super v334;
  objc_super v335;
  objc_super v336;
  objc_super v337;
  objc_super v338;
  objc_super v339;
  objc_super v340;
  objc_super v341;
  objc_super v342;
  objc_super v343;
  objc_super v344;
  objc_super v345;
  objc_super v346;
  objc_super v347;
  objc_super v348;
  objc_super v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  objc_super v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  objc_super v363;
  objc_super v364;
  objc_super v365;
  objc_super v366;
  objc_super v367;
  objc_super v368;
  objc_super v369;
  id v370;
  unsigned int v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  _BYTE v376[128];
  _BYTE v377[128];
  __CFString *v378;
  BWPhotoEncoderNodeAttachedMediaConfiguration *v379;
  uint64_t v380;
  BWSensorConfiguration *v381;
  uint64_t v382;
  BWSensorConfiguration *v383;
  _QWORD v384[2];
  _QWORD v385[2];
  _QWORD v386[2];
  _BYTE v387[128];
  _BYTE v388[128];
  _BYTE v389[128];
  const __CFString *v390;
  _BYTE v391[128];
  uint64_t v392;

  v392 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v8 = (id *)result;
  v371 = 0;
  v370 = 0;
  objc_msgSend(a2, "sinkConfiguration");
  objc_opt_class();
  v293 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v293 = (void *)objc_msgSend(a2, "sinkConfiguration");
  v267 = objc_alloc_init(BWStillImageNodeConfiguration);
  -[BWStillImageNodeConfiguration setFigThreadPriority:](v267, "setFigThreadPriority:", 14);
  v9 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage"), 14);
  v10 = objc_msgSend((id)objc_msgSend(v8[6], "captureStream"), "portType");
  v11 = +[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance");
  v266 = -[FigCaptureCameraParameters cameraTuningParameters](v11, "cameraTuningParameters");
  v288 = objc_msgSend((id)objc_msgSend(v8[6], "bravoTelephotoCaptureStream"), "portType");
  v12 = objc_msgSend((id)objc_msgSend(v8[6], "pearlInfraredCaptureStream"), "portType");
  v278 = v12;
  if (v12)
    v303 = objc_msgSend(a3, "objectForKeyedSubscript:", v12);
  else
    v303 = 0;
  v13 = objc_msgSend(v8[6], "isBravoVariant");
  v14 = objc_msgSend(v8[6], "pearlInfraredCaptureStream");
  v287 = objc_msgSend((id)objc_msgSend(v8[6], "captureStream"), "sensorIDDictionary");
  v286 = objc_msgSend((id)objc_msgSend(v8[6], "bravoTelephotoCaptureStream"), "sensorIDDictionary");
  v268 = objc_msgSend((id)objc_msgSend(v8[6], "pearlInfraredCaptureStream"), "sensorIDDictionary");
  v15 = objc_msgSend(v8[6], "captureStream");
  v290 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v8[6], "bravoTelephotoCaptureStream");
  }
  else if (v14)
  {
    v15 = objc_msgSend(v8[6], "pearlInfraredCaptureStream");
  }
  v16 = (void *)v15;
  v306 = a6;
  objc_msgSend(v8[6], "setStillImageCaptureEnabled:", 1);
  objc_msgSend(v8[6], "setIrisFrameHarvestingEnabled:", objc_msgSend(v293, "irisFrameHarvestingEnabled"));
  objc_msgSend(v8[6], "setStillImageFusionScheme:", objc_msgSend(a2, "noiseReductionAndFusionScheme"));
  v298 = objc_msgSend(v293, "depthDataDeliveryEnabled");
  v277 = v14;
  if (a2)
    v17 = a2[104] != 0;
  else
    v17 = 0;
  v18 = objc_msgSend(v293, "portraitEffectsMatteDeliveryEnabled");
  objc_msgSend(a2, "portraitEffectsMatteMainImageDownscalingFactor");
  v20 = v19;
  if (a2 && a2[107])
  {
    v297 = a2[108] != 0;
    v285 = 1;
  }
  else
  {
    v285 = 0;
    v297 = 0;
  }
  v270 = objc_msgSend(a2, "allowsMultipleInflightCaptures");
  v282 = objc_msgSend(v293, "bravoConstituentPhotoDeliveryEnabled");
  v21 = v298 | v282;
  v289 = v10;
  v294 = v298 | v282;
  if (a2 && (v21 & 1) == 0 && a2[105])
  {
    v22 = 1;
    v269 = 1;
  }
  else
  {
    v269 = 0;
    v22 = v282 | v21 & v290;
  }
  v295 = v22;
  v23 = objc_msgSend(v293, "filterRenderingEnabled");
  objc_msgSend(v8[6], "requestedZoomFactorRelativeToPortType:", objc_msgSend(v16, "portType"));
  v25 = v24;
  v26 = objc_msgSend(v16, "portType");
  v27 = objc_msgSend(v16, "sensorIDString");
  LODWORD(v28) = v25;
  v29 = -[FigCaptureCameraParameters disparityRefinementTypeForPortType:sensorIDString:zoomFactor:](v11, "disparityRefinementTypeForPortType:sensorIDString:zoomFactor:", v26, v27, v28);
  v283 = v23;
  if ((v298 & v18) == 1)
  {
    if (v29)
      v30 = v23;
    else
      v30 = 0;
    v262 = v30;
  }
  else
  {
    v262 = 0;
  }
  objc_msgSend(v8[6], "setStillImageISPChromaNoiseReductionEnabled:", v17);
  objc_msgSend(v8[6], "setStillImageGNRHDREnabled:", v297);
  v292 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v289);
  v284 = v9;
  v31 = v9;
  v32 = v9;
  if (v295)
  {
    v32 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.gnr.default"), 14);
    v31 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.gnr.telephoto"), 14);
    v284 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.stereofusion"), 14);
  }
  v301 = v9;
  v280 = v18;
  v258 = v31;
  v259 = v32;
  v274 = objc_msgSend(a2, "stillImageStabilizationSupported")
      && (objc_msgSend(a2, "allowedToModifyInputBuffers") & 1) != 0;
  v265 = objc_msgSend(v293, "irisFrameHarvestingEnabled");
  v33 = v8[6];
  v299 = a2;
  v34 = objc_msgSend(a2, "stillImageStabilizationSupported");
  v372 = 0u;
  v373 = 0u;
  v374 = 0u;
  v375 = 0u;
  v35 = (void *)objc_msgSend(v33, "captureStreams");
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v372, v391, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v373;
    while (2)
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v373 != v38)
          objc_enumerationMutation(v35);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v372 + 1) + 8 * i), "hasSphere") & 1) != 0)
        {
          v40 = 1;
          goto LABEL_44;
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v372, v391, 16);
      if (v37)
        continue;
      break;
    }
  }
  v40 = 0;
LABEL_44:
  v41 = objc_msgSend(v299, "noiseReductionAndFusionScheme");
  if ((int)v41 >= 3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Only FigCaptureStillImageNoiseReductionAndFusionSchemeGeneralNoiseReductionAndFusion and bellow supported"), 0));
  v42 = v41;
  v261 = v11;
  v302 = v8;
  if ((_DWORD)v41 == 2)
    v43 = 0;
  else
    v43 = v34;
  v291 = v41;
  v300 = v43;
  if (v285)
  {
    v44 = (_DWORD)v41 == 2 && v297;
    v45 = v297 & (v295 ^ 1u);
    if (v44)
    {
      v263 = 0;
      v273 = v269;
    }
    else
    {
      v46 = [BWHDRNode alloc];
      if (v299)
        v47 = *((unsigned int *)v299 + 22);
      else
        v47 = 0;
      v48 = -[BWHDRNode initWithClientPID:sensorIDDictionary:](v46, "initWithClientPID:sensorIDDictionary:", v47, v287);
      v369.receiver = v8;
      v369.super_class = (Class)FigCaptureStillImageSinkPipeline;
      if ((objc_msgSendSuper2(&v369, sel_addNode_error_, v48, &v370) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_281;
      }
      -[BWHDRNode setAttachesInputBracketToOutputSampleBuffer:](v48, "setAttachesInputBracketToOutputSampleBuffer:", 0);
      -[BWHDRNode setAlwaysRequestsPreBracketedEV0:](v48, "setAlwaysRequestsPreBracketedEV0:", v265);
      v263 = v48;
      -[BWHDRNode setSupportsStereoFusionCaptures:](v48, "setSupportsStereoFusionCaptures:", v269);
      v273 = v269;
      v42 = v291;
    }
  }
  else
  {
    v45 = 0;
    v273 = 0;
    v263 = 0;
  }
  v49 = v34 & v40;
  v50 = objc_msgSend((id)objc_msgSend(v8[6], "captureStream"), "sensorIDString");
  v51 = objc_msgSend((id)objc_msgSend(v8[6], "bravoTelephotoCaptureStream"), "sensorIDString");
  v257 = objc_msgSend((id)objc_msgSend(v8[6], "pearlInfraredCaptureStream"), "sensorIDString");
  v260 = v50;
  v279 = v51;
  v276 = v34;
  if ((_DWORD)v42 == 2)
  {
    v52 = v295 ^ 1;
    v53 = [BWGNRNode alloc];
    if ((v290 & (v295 ^ 1)) != 0)
      v54 = v288;
    else
      v54 = 0;
    if ((v290 & v52) != 0)
      v55 = v51;
    else
      v55 = 0;
    v56 = v286;
    if ((v290 & v52) == 0)
      v56 = 0;
    v57 = v49;
    v58 = -[BWGNRNode initWithSISEnabled:OISEnabled:LTMHDREnabled:processingLTMHDRFusion:portType:sensorID:sensorIDDictionary:telephotoPortType:telephotoSensorID:telephotoSensorIDDictionary:](v53, "initWithSISEnabled:OISEnabled:LTMHDREnabled:processingLTMHDRFusion:portType:sensorID:sensorIDDictionary:telephotoPortType:telephotoSensorID:telephotoSensorIDDictionary:", v34, v49, v297 & v294 | v45, v45, v289, v50, v287, v54, v55, v56);
    v368.receiver = v8;
    v368.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if (!objc_msgSendSuper2(&v368, sel_addNode_error_, v58, &v370))
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    v59 = v8;
    -[BWGNRNode setAttachesInputBracketToOutputSampleBuffer:](v58, "setAttachesInputBracketToOutputSampleBuffer:", 0);
    -[BWGNRNode setUsesHDRPreBracketFrameForErrorRecoveryDownstream:](v58, "setUsesHDRPreBracketFrameForErrorRecoveryDownstream:", v297);
    -[BWGNRNode setAllowedToModifyInputBuffers:](v58, "setAllowedToModifyInputBuffers:", v274);
    objc_msgSend(v8[6], "registerForAEMatrixMetadata");
    if (v295)
      v60 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GNR-%@"), v289);
    else
      v60 = CFSTR("GNR");
    v61 = &classRef_BWStillImageCameraCalibrationDataNode;
    v62 = v288;
    v42 = v291;
    v63 = v303;
    v272 = (BWNoiseReducerNode *)v58;
    -[BWNode setName:](v58, "setName:", v60);
    v49 = v57;
  }
  else
  {
    v272 = 0;
    v59 = v8;
    v61 = &classRef_BWStillImageCameraCalibrationDataNode;
    v62 = v288;
    v63 = v303;
  }
  if (v300)
  {
    v64 = v49;
    v65 = -[BWSISNode initWithCameraTuningDictionary:sensorIDDictionary:fusionScheme:]([BWSISNode alloc], "initWithCameraTuningDictionary:sensorIDDictionary:fusionScheme:", v266, v287, v42);
    v66 = v65;
    if ((_DWORD)v42 == 1)
      v67 = CFSTR("TMBNR");
    else
      v67 = 0;
    -[BWNode setName:](v65, "setName:", v67);
    v68 = (objc_class *)v61[93];
    v367.receiver = v59;
    v367.super_class = v68;
    if ((objc_msgSendSuper2(&v367, sel_addNode_error_, v66, &v370) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    -[BWSISNode setAttachesInputBracketToOutputSampleBuffer:](v66, "setAttachesInputBracketToOutputSampleBuffer:", 0);
    v281 = v66;
    -[BWSISNode setAlwaysRequestsPreBracketedEV0:](v66, "setAlwaysRequestsPreBracketedEV0:", v265);
    if (v299)
      v69 = v299[106] != 0;
    else
      v69 = 0;
    v70 = v301;
    v49 = v64;
    -[BWSISNode setLivePhotoSupported:](v281, "setLivePhotoSupported:", v69);
    -[BWSISNode setOISSupported:](v281, "setOISSupported:", v64);
    objc_msgSend(v59[6], "registerForAEMatrixMetadata");
    v59[12] = v281;
  }
  else
  {
    v281 = 0;
    v70 = v301;
  }
  if (v295)
  {
    if ((_DWORD)v49)
      v49 = objc_msgSend((id)objc_msgSend(v59[6], "bravoTelephotoCaptureStream"), "hasSphere");
    v71 = -[BWGNRNode initWithSISEnabled:OISEnabled:LTMHDREnabled:processingLTMHDRFusion:portType:sensorID:sensorIDDictionary:telephotoPortType:telephotoSensorID:telephotoSensorIDDictionary:]([BWGNRNode alloc], "initWithSISEnabled:OISEnabled:LTMHDREnabled:processingLTMHDRFusion:portType:sensorID:sensorIDDictionary:telephotoPortType:telephotoSensorID:telephotoSensorIDDictionary:", v276, v49, v297 & v294, v297 & v294, v62, v279, v286, 0, 0, 0);
    v72 = (objc_class *)v61[93];
    v366.receiver = v59;
    v366.super_class = v72;
    v73 = v306;
    if (!objc_msgSendSuper2(&v366, sel_addNode_error_, v71, &v370))
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    -[BWGNRNode setAttachesInputBracketToOutputSampleBuffer:](v71, "setAttachesInputBracketToOutputSampleBuffer:", 0);
    -[BWGNRNode setUsesHDRPreBracketFrameForErrorRecoveryDownstream:](v71, "setUsesHDRPreBracketFrameForErrorRecoveryDownstream:", v297);
    -[BWGNRNode setAllowedToModifyInputBuffers:](v71, "setAllowedToModifyInputBuffers:", v274);
    -[BWNode setName:](v71, "setName:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GNR-%@"), v62));
  }
  else
  {
    v71 = 0;
    v73 = v306;
  }
  v275 = v71;
  if (v63)
  {
    v74 = [BWAttachedMediaSplitNode alloc];
    v390 = CFSTR("Depth");
    v75 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v74, "initWithAttachedMediaKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v390, 1));
    v365.receiver = v59;
    v365.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if ((objc_msgSendSuper2(&v365, sel_addNode_error_, v75, &v370) & 1) == 0
      || (objc_msgSend(v73, "connectOutput:toInput:pipelineStage:", v63, -[BWNode input](v75, "input"), v70) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    -[BWNode setName:](v75, "setName:", CFSTR("Still Image IR-Depth Splitter"));
    -[BWAttachedMediaSplitNode setEmitsNodeErrorsForMissingAttachedMedia:](v75, "setEmitsNodeErrorsForMissingAttachedMedia:", 1);
    v63 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v75, "outputs"), "objectAtIndexedSubscript:", 0);
  }
  if (v62 && objc_msgSend(a3, "objectForKeyedSubscript:", v62))
    objc_msgSend(v292, "addObject:", v62);
  if (v278 && objc_msgSend(a3, "objectForKeyedSubscript:", v278))
    objc_msgSend(v292, "addObject:", v278);
  if ((objc_msgSend(v59[6], "zeroShutterLagEnabled") & 1) != 0)
  {
    v76 = -[BWStillImageTimeMachineFrameCoordinatorNode initWithPortTypes:]([BWStillImageTimeMachineFrameCoordinatorNode alloc], "initWithPortTypes:", v292);
    v364.receiver = v59;
    v364.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if ((objc_msgSendSuper2(&v364, sel_addNode_error_, v76, &v370) & 1) == 0)
    {
      fig_log_get_emitter();
LABEL_281:
      FigDebugAssert3();
      goto LABEL_387;
    }
  }
  else
  {
    v76 = 0;
  }
  v77 = -[BWStillImageCoordinatorNode initWithCaptureDevice:inputPortTypes:sensorRawInputPortTypes:highResStillImageDimensions:]([BWStillImageCoordinatorNode alloc], "initWithCaptureDevice:inputPortTypes:sensorRawInputPortTypes:highResStillImageDimensions:", v302[6], v292, 0, 0);
  -[BWStillImageCoordinatorNode setStillImageCaptureStatusDelegate:](v77, "setStillImageCaptureStatusDelegate:", a4);
  -[BWStillImageCoordinatorNode setStillImageCapturePipeliningMode:](v77, "setStillImageCapturePipeliningMode:", v270);
  v363.receiver = v302;
  v363.super_class = (Class)FigCaptureStillImageSinkPipeline;
  if ((objc_msgSendSuper2(&v363, sel_addNode_error_, v77, &v370) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_281;
  }
  v304 = v77;
  v302[7] = v77;
  if (v76)
  {
    v362 = 0uLL;
    v361 = 0uLL;
    v360 = 0uLL;
    v359 = 0uLL;
    v78 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v359, v389, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v360;
      v81 = *MEMORY[0x1E0D05A40];
      while (2)
      {
        for (j = 0; j != v79; ++j)
        {
          if (*(_QWORD *)v360 != v80)
            objc_enumerationMutation(a3);
          v83 = *(void **)(*((_QWORD *)&v359 + 1) + 8 * j);
          v84 = objc_msgSend(a3, "objectForKeyedSubscript:", v83);
          v85 = -[BWStillImageTimeMachineFrameCoordinatorNode inputForPortType:](v76, "inputForPortType:", v83);
          if (objc_msgSend(v83, "isEqualToString:", v81))
            v86 = v63;
          else
            v86 = v84;
          if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v86, v85, v301) & 1) == 0
            || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStillImageTimeMachineFrameCoordinatorNode outputForPortType:](v76, "outputForPortType:", v83), objc_msgSend(v302[7], "inputForPortType:", v83), v301) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
        }
        v70 = v301;
        v79 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v359, v389, 16);
        if (v79)
          continue;
        break;
      }
    }
  }
  else
  {
    v358 = 0uLL;
    v357 = 0uLL;
    v356 = 0uLL;
    v355 = 0uLL;
    v87 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v355, v388, 16);
    if (v87)
    {
      v88 = v87;
      v89 = *(_QWORD *)v356;
      v90 = *MEMORY[0x1E0D05A40];
      while (2)
      {
        for (k = 0; k != v88; ++k)
        {
          if (*(_QWORD *)v356 != v89)
            objc_enumerationMutation(a3);
          v92 = *(void **)(*((_QWORD *)&v355 + 1) + 8 * k);
          v93 = objc_msgSend(a3, "objectForKeyedSubscript:", v92);
          v94 = objc_msgSend(v302[7], "inputForPortType:", v92);
          if (objc_msgSend(v92, "isEqualToString:", v90))
            v95 = v63;
          else
            v95 = v93;
          if (!objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v95, v94, v70))
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
        }
        v88 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v355, v388, 16);
        if (v88)
          continue;
        break;
      }
    }
  }
  v96 = [BWStillImageBufferRouterNode alloc];
  if (v291 == 2)
    v97 = v276;
  else
    v97 = 0;
  v98 = -[BWStillImageBufferRouterNode initWithInputPortTypes:HDRSupported:SISSupported:GNRSISSupported:LTMHDRSupported:depthDataDeliveryEnabled:](v96, "initWithInputPortTypes:HDRSupported:SISSupported:GNRSISSupported:LTMHDRSupported:depthDataDeliveryEnabled:", v292, v285, v276, v97, v297, v298);
  v354.receiver = v302;
  v354.super_class = (Class)FigCaptureStillImageSinkPipeline;
  if ((objc_msgSendSuper2(&v354, sel_addNode_error_, v98, &v370) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_281;
  }
  v353 = 0u;
  v352 = 0u;
  v351 = 0u;
  v350 = 0u;
  v99 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v350, v387, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v351;
LABEL_135:
    v102 = 0;
    while (1)
    {
      if (*(_QWORD *)v351 != v101)
        objc_enumerationMutation(v292);
      if (!objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStillImageCoordinatorNode outputForPortType:](v304, "outputForPortType:", *(_QWORD *)(*((_QWORD *)&v350 + 1) + 8 * v102)), -[BWStillImageBufferRouterNode inputForPortType:](v98, "inputForPortType:", *(_QWORD *)(*((_QWORD *)&v350 + 1) + 8 * v102)), v70))goto LABEL_454;
      if (v100 == ++v102)
      {
        v100 = objc_msgSend(v292, "countByEnumeratingWithState:objects:count:", &v350, v387, 16);
        if (v100)
          goto LABEL_135;
        break;
      }
    }
  }
  v103 = -[BWStillImageBufferRouterNode defaultOutput](v98, "defaultOutput");
  v104 = -[BWStillImageBufferRouterNode bravoTelephotoOutput](v98, "bravoTelephotoOutput");
  v105 = -[BWStillImageBufferRouterNode pearlInfraredOutput](v98, "pearlInfraredOutput");
  if (!v263)
  {
    v106 = v281;
    goto LABEL_148;
  }
  v106 = v281;
  if (((v294 | v273) & 1) == 0)
  {
    if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode HDROutput](v98, "HDROutput"), -[BWNode input](v263, "input"), v70) & 1) != 0)goto LABEL_148;
    goto LABEL_454;
  }
  if ((v294 & v290) == 1)
  {
    if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode bravoTelephotoOutput](v98, "bravoTelephotoOutput"), -[BWNode input](v263, "input"), v70) & 1) != 0)
    {
      v104 = -[BWNode output](v263, "output");
      goto LABEL_148;
    }
LABEL_454:
    fig_log_get_emitter();
    goto LABEL_281;
  }
LABEL_148:
  if (v106
    && (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode SISOutput](v98, "SISOutput"), -[BWNode input](v106, "input"), v70) & 1) == 0)
  {
    goto LABEL_454;
  }
  if (v263)
    v107 = v273;
  else
    v107 = 1;
  v108 = v294 | v107;
  if (v291)
    v109 = 1;
  else
    v109 = v106 == 0;
  v110 = !v109;
  if (v108 != 1 || v110)
  {
    if (v108)
      v111 = 1;
    else
      v111 = 2;
    v112 = v108 ^ 1;
    if (v110)
      v112 = v111;
    v113 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", (v112 + 1), 1986618469);
    v349.receiver = v302;
    v349.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if ((objc_msgSendSuper2(&v349, sel_addNode_error_, v113, &v370) & 1) == 0
      || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode defaultOutput](v98, "defaultOutput"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v113, "inputs"), "objectAtIndexedSubscript:", 0), v70) & 1) == 0)
    {
      goto LABEL_441;
    }
    if ((v107 & 1) != 0)
    {
      v114 = 1;
      if (!v110)
        goto LABEL_175;
    }
    else
    {
      if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWNode output](v263, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v113, "inputs"), "objectAtIndexedSubscript:", 1), v70) & 1) == 0)goto LABEL_441;
      v114 = 2;
      if (!v110)
      {
LABEL_175:
        v103 = -[BWNode output](v113, "output");
        goto LABEL_176;
      }
    }
    if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWNode output](v281, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v113, "inputs"), "objectAtIndexedSubscript:", v114), v70) & 1) != 0)goto LABEL_175;
LABEL_441:
    fig_log_get_emitter();
    goto LABEL_281;
  }
LABEL_176:
  if (((v290 ^ 1 | v295) & 1) != 0)
  {
    v115 = &classRef_BWStillImageCameraCalibrationDataNode;
  }
  else
  {
    v116 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", 1986618469, 2);
    v115 = &classRef_BWStillImageCameraCalibrationDataNode;
    v348.receiver = v302;
    v348.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if ((objc_msgSendSuper2(&v348, sel_addNode_error_, v116, &v370) & 1) == 0
      || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v103, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v116, "inputs"), "objectAtIndexedSubscript:", 0), v70) & 1) == 0|| (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v104, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v116, "inputs"), "objectAtIndexedSubscript:", 1), v70) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    v103 = -[BWNode output](v116, "output");
  }
  v117 = objc_alloc_init(BWPixelTransferNode);
  -[BWNode setName:](v117, "setName:", CFSTR("Still Image Format Converter"));
  -[BWPixelTransferNode setOutputPixelFormat:](v117, "setOutputPixelFormat:", objc_msgSend(v299, "outputPixelFormat"));
  -[BWPixelTransferNode setOutputColorSpaceProperties:](v117, "setOutputColorSpaceProperties:", objc_msgSend(v299, "outputColorSpaceProperties"));
  -[BWPixelTransferNode setCropMode:](v117, "setCropMode:", 3);
  v118 = (objc_class *)v115[93];
  v347.receiver = v302;
  v347.super_class = v118;
  if ((objc_msgSendSuper2(&v347, sel_addNode_error_, v117, &v370) & 1) == 0
    || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v103, -[BWNode input](v117, "input"), v70) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_281;
  }
  obja = (BWNodeOutput *)v104;
  v119 = -[BWNode output](v117, "output");
  if (v275)
  {
    v120 = objc_alloc_init(BWPixelTransferNode);
    -[BWNode setName:](v120, "setName:", CFSTR("Telephoto Still Image Format Converter"));
    -[BWPixelTransferNode setOutputPixelFormat:](v120, "setOutputPixelFormat:", objc_msgSend(v299, "outputPixelFormat"));
    -[BWPixelTransferNode setOutputColorSpaceProperties:](v120, "setOutputColorSpaceProperties:", objc_msgSend(v299, "outputColorSpaceProperties"));
    -[BWPixelTransferNode setCropMode:](v120, "setCropMode:", 3);
    v121 = (objc_class *)v115[93];
    v346.receiver = v302;
    v346.super_class = v121;
    v122 = v306;
    if ((objc_msgSendSuper2(&v346, sel_addNode_error_, v120, &v370) & 1) == 0
      || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v120, "input"), v70) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    obja = -[BWNode output](v120, "output");
  }
  else
  {
    v122 = v306;
  }
  if (v105)
  {
    v123 = -[BWDepthSynchronizerNode initForStreaming:separateDepthComponentsEnabled:]([BWDepthSynchronizerNode alloc], "initForStreaming:separateDepthComponentsEnabled:", 0, 0);
    v124 = (objc_class *)v115[93];
    v345.receiver = v302;
    v345.super_class = v124;
    if ((objc_msgSendSuper2(&v345, sel_addNode_error_, v123, &v370) & 1) == 0)
      goto LABEL_410;
    objc_msgSend(v123, "setName:", CFSTR("Still Image Depth Synchronizer"));
    if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, objc_msgSend(v123, "imageInput"), v70) & 1) == 0
      || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v105, objc_msgSend(v123, "depthInput"), v70) & 1) == 0)
    {
      goto LABEL_410;
    }
    v119 = objc_msgSend(v123, "output");
  }
  v125 = v299;
  if (v272)
  {
    if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v272, "input"), v259) & 1) == 0)
      goto LABEL_410;
    v119 = -[BWNode output](v272, "output");
  }
  if (v275)
  {
    if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v275, "input"), v258) & 1) != 0)
    {
      obja = -[BWNode output](v275, "output");
      goto LABEL_200;
    }
LABEL_410:
    fig_log_get_emitter();
    goto LABEL_281;
  }
  if (v291 == 2)
    goto LABEL_201;
LABEL_200:
  v127 = -[BWNoiseReducerNode initWithCameraTuningDictionary:sensorIDDictionary:]([BWNoiseReducerNode alloc], "initWithCameraTuningDictionary:sensorIDDictionary:", v266, v287);
  -[BWNoiseReducerNode setQuadraHighResStillImageCaptureEnabled:](v127, "setQuadraHighResStillImageCaptureEnabled:", objc_msgSend(v302[6], "quadraHighResStillImageCaptureEnabled"));
  v128 = (objc_class *)v115[93];
  v344.receiver = v302;
  v344.super_class = v128;
  if ((objc_msgSendSuper2(&v344, sel_addNode_error_, v127, &v370) & 1) == 0
    || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v127, "input"), v70) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_281;
  }
  v272 = v127;
  v119 = -[BWNode output](v127, "output");
  if (v291 == 1 && v281)
  {
    v129 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", 2, 1986618469);
    v130 = (objc_class *)v115[93];
    v343.receiver = v302;
    v343.super_class = v130;
    if ((objc_msgSendSuper2(&v343, sel_addNode_error_, v129, &v370) & 1) == 0
      || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v129, "inputs"), "objectAtIndexedSubscript:", 0), v70) & 1) == 0|| (v126 = v283, (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", -[BWNode output](v281, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v129, "inputs"), "objectAtIndexedSubscript:", 1), v70) & 1) == 0))
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    v119 = -[BWNode output](v129, "output");
  }
  else
  {
LABEL_201:
    v126 = v283;
  }
  v131 = v298 | v282;
  if (v277)
    v132 = v298;
  else
    v132 = 0;
  if ((v294 & v126) == 1)
  {
    v133 = objc_alloc_init(BWPortraitHDRStagingNode);
    v134 = (objc_class *)v115[93];
    v342.receiver = v302;
    v342.super_class = v134;
    if ((objc_msgSendSuper2(&v342, sel_addNode_error_, v133, &v370) & 1) != 0)
    {
      v135 = v133;
      v302[11] = v135;
      if (v290)
      {
        if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v135, "input"), v284) & 1) != 0)
        {
          obja = (BWNodeOutput *)objc_msgSend(v302[11], "output");
LABEL_221:
          v131 = v298 | v282;
          goto LABEL_222;
        }
      }
      else
      {
        if (!v277)
          goto LABEL_221;
        if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v135, "input"), v284) & 1) != 0)
        {
          v119 = objc_msgSend(v302[11], "output");
          v131 = v298 | v282;
LABEL_222:
          v125 = v299;
          goto LABEL_223;
        }
      }
    }
    fig_log_get_emitter();
    goto LABEL_281;
  }
LABEL_223:
  if (!v132)
  {
    v305 = 0;
    v139 = v279;
    if (!v295)
    {
      v142 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
      goto LABEL_301;
    }
    goto LABEL_229;
  }
  v136 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", v302[6], a5, 14);
  -[BWNode setName:](v136, "setName:", CFSTR("RGB Segmentation and Landmarks"));
  -[BWInferenceNode addInferenceOfType:version:](v136, "addInferenceOfType:version:", 103, +[BWRGBPersonSegmentationInferenceConfiguration portraitVersion](BWRGBPersonSegmentationInferenceConfiguration, "portraitVersion") & 0xFFFFFFFFFFFFLL);
  v137 = +[BWLandmarksInferenceConfiguration configuration](BWLandmarksInferenceConfiguration, "configuration");
  objc_msgSend(v137, "setMaximumNumberOfFaces:", +[BWLandmarksInferenceConfiguration portraitMaximumNumberOfFaces](BWLandmarksInferenceConfiguration, "portraitMaximumNumberOfFaces"));
  -[BWInferenceNode addInferenceOfType:version:configuration:](v136, "addInferenceOfType:version:configuration:", 801, objc_msgSend(v137, "landmarksInferenceVersion") & 0xFFFFFFFFFFFFLL, v137);
  v341.receiver = v302;
  v341.super_class = (Class)FigCaptureStillImageSinkPipeline;
  if ((objc_msgSendSuper2(&v341, sel_addNode_error_, v136, &v370) & 1) == 0)
  {
LABEL_447:
    fig_log_get_emitter();
    goto LABEL_281;
  }
  v138 = -[BWNode input](v136, "input");
  if (!v295)
  {
    v115 = &classRef_BWStillImageCameraCalibrationDataNode;
    if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, v138, v70) & 1) != 0)
    {
      v119 = -[BWNode output](v136, "output");
      v142 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
      v139 = v279;
LABEL_298:
      LOBYTE(v255) = 0;
      v184 = -[BWDepthConverterNode initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:]([BWDepthConverterNode alloc], "initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:", 0, objc_msgSend(*(id *)((char *)v302 + v142[683]), "cameraInfoByPortType"), v268, 1, objc_msgSend(v125, "clientIsCameraOrDerivative"), 0, v255);
      v185 = (objc_class *)v115[93];
      v329.receiver = v302;
      v329.super_class = v185;
      if ((objc_msgSendSuper2(&v329, sel_addNode_error_, v184, &v370) & 1) == 0
        || (-[BWNode setName:](v184, "setName:", CFSTR("Still Image Depth Converter")),
            -[BWDepthConverterNode setHorizontalSensorBinningFactor:](v184, "setHorizontalSensorBinningFactor:", objc_msgSend(v125, "horizontalSensorBinningFactor")), -[BWDepthConverterNode setVerticalSensorBinningFactor:](v184, "setVerticalSensorBinningFactor:", objc_msgSend(v125, "verticalSensorBinningFactor")), -[BWDepthConverterNode setStillGDRFilteringSupportEnabled:](v184, "setStillGDRFilteringSupportEnabled:", 1), -[BWDepthConverterNode setOutputFormat:](v184, "setOutputFormat:", 1751411059), -[BWDepthConverterNode setOutputDimensions:](v184, "setOutputDimensions:", objc_msgSend(v125, "depthDataDimensions")), -[BWDepthConverterNode setBaseRotationDegrees:](v184, "setBaseRotationDegrees:", 90), (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v184, "input"), v70) & 1) == 0))
      {
        fig_log_get_emitter();
        goto LABEL_281;
      }
      v302[10] = v184;
      v119 = -[BWNode output](v184, "output");
LABEL_301:
      if (v298)
      {
        v186 = v289;
        if (v277)
          v186 = v278;
        v187 = v260;
        if (v277)
          v187 = v257;
        v188 = v287;
        if (v277)
          v188 = v268;
        if (v290)
          v189 = v288;
        else
          v189 = v186;
        if (v290)
          v190 = v139;
        else
          v190 = v187;
        if (v290)
          v191 = v286;
        else
          v191 = v188;
        v192 = v302;
        v193 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v189, v190, v191, objc_msgSend((id)objc_msgSend(*(id *)((char *)v302 + v142[683]), "cameraInfoByPortType"), "objectForKeyedSubscript:", v189));
        LODWORD(v194) = v25;
        v195 = -[FigCaptureCameraParameters sdofRenderingVersionForPortType:sensorIDString:zoomFactor:](v261, "sdofRenderingVersionForPortType:sensorIDString:zoomFactor:", v189, v190, v194);
        v196 = [BWStillImagePortraitMetadataNode alloc];
        v382 = v189;
        objb = v193;
        v383 = v193;
        v197 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v383, &v382, 1);
        LODWORD(v198) = v25;
        v199 = -[BWStillImagePortraitMetadataNode initWithNodeConfiguration:sdofRenderingVersion:sensorConfigurationsByPortType:defaultPortType:defaultZoomFactor:](v196, "initWithNodeConfiguration:sdofRenderingVersion:sensorConfigurationsByPortType:defaultPortType:defaultZoomFactor:", 0, v195, v197, v189, v198);
        v200 = (objc_class *)v115[93];
        v328.receiver = v302;
        v328.super_class = v200;
        if ((objc_msgSendSuper2(&v328, sel_addNode_error_, v199, &v370) & 1) == 0
          || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v199, "input"), v70) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v119 = -[BWNode output](v199, "output");
        v125 = v299;
      }
      else
      {
        v189 = 0;
        objb = 0;
        v192 = v302;
      }
      if (v280)
      {
        if ((v283 & 1) == 0)
        {
          v201 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", *(id *)((char *)v192 + v142[683]), a5, 14);
          -[BWNode setName:](v201, "setName:", CFSTR("Landmarks Inference Node"));
          v202 = +[BWLandmarksInferenceConfiguration configuration](BWLandmarksInferenceConfiguration, "configuration");
          v115 = &classRef_BWStillImageCameraCalibrationDataNode;
          objc_msgSend(v202, "setMaximumNumberOfFaces:", +[BWLandmarksInferenceConfiguration portraitMaximumNumberOfFaces](BWLandmarksInferenceConfiguration, "portraitMaximumNumberOfFaces"));
          -[BWInferenceNode addInferenceOfType:version:configuration:](v201, "addInferenceOfType:version:configuration:", 801, objc_msgSend(v202, "landmarksInferenceVersion") & 0xFFFFFFFFFFFFLL, v202);
          v327.receiver = v192;
          v327.super_class = (Class)FigCaptureStillImageSinkPipeline;
          if ((objc_msgSendSuper2(&v327, sel_addNode_error_, v201, &v370) & 1) == 0
            || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v201, "input"), v70) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
          v119 = -[BWNode output](v201, "output");
        }
        v203 = +[BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration personSegmentationAndMattingConfiguration](BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration, "personSegmentationAndMattingConfiguration");
        v204 = -[BWStillImageConditionalRouterNode initWithRoutingConfiguration:]([BWStillImageConditionalRouterNode alloc], "initWithRoutingConfiguration:", v203);
        -[BWNode setName:](v204, "setName:", CFSTR("Person Segmentation and Matting Conditional Router"));
        v205 = (objc_class *)v115[93];
        v326.receiver = v192;
        v326.super_class = v205;
        if ((objc_msgSendSuper2(&v326, sel_addNode_error_, v204, &v370) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v206 = v192;
        v207 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", v192[6], a5, 14);
        v208 = v287;
        if (v277)
          v208 = v268;
        if (v290)
          v209 = v286;
        else
          v209 = v208;
        v210 = -[BWInferenceConfiguration initWithInferenceType:]([BWMattingInferenceConfiguration alloc], "initWithInferenceType:", 201);
        -[BWInferenceConfiguration setPriority:](v210, "setPriority:", 14);
        -[BWInferenceConfiguration setTuningParameters:](v210, "setTuningParameters:", v209);
        LODWORD(v211) = v25;
        -[BWMattingInferenceConfiguration setSdofRenderingTuningParameters:](v210, "setSdofRenderingTuningParameters:", +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:zoomFactor:](FigCaptureCameraParameters, "sdofTuningParametersForSensorIDDictionary:zoomFactor:", v209, v211));
        LODWORD(v212) = v20;
        -[BWMattingInferenceConfiguration setMainImageDownscalingFactor:](v210, "setMainImageDownscalingFactor:", v212);
        -[BWMattingInferenceConfiguration setRefinedDepthDeliveryEnabled:](v210, "setRefinedDepthDeliveryEnabled:", v262);
        -[BWMattingInferenceConfiguration setMetalCommandQueue:](v210, "setMetalCommandQueue:", 0);
        v213 = +[BWPersonSegmentationConfiguration portraitVersion](BWPersonSegmentationConfiguration, "portraitVersion") & 0xFFFFFFFFFFFFLL;
        -[BWInferenceNode addInferenceOfType:version:](v207, "addInferenceOfType:version:", 102, v213);
        -[BWInferenceNode addInferenceOfType:version:configuration:](v207, "addInferenceOfType:version:configuration:", 201, v213, v210);
        -[BWNode setName:](v207, "setName:", CFSTR("Person Segmentation and Matting Node"));
        v214 = (objc_class *)v115[93];
        v325.receiver = v206;
        v325.super_class = v214;
        if ((objc_msgSendSuper2(&v325, sel_addNode_error_, v207, &v370) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v215 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", 2, 1986618469);
        -[BWNode setName:](v215, "setName:", CFSTR("Person Segmentation and Matting Funnel"));
        v216 = (objc_class *)v115[93];
        v324.receiver = v206;
        v324.super_class = v216;
        if ((objc_msgSendSuper2(&v324, sel_addNode_error_, v215, &v370) & 1) == 0
          || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v204, "input"), v301) & 1) == 0
          || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v204, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v203, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v215, "inputs"), "objectAtIndexedSubscript:", 0), v301) & 1) == 0|| (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v204, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v203, "personSegmentationAndMattingOuputIndex")), -[BWNode input](v207, "input"), v301) & 1) == 0|| (v70 = v301, (objc_msgSend(
                 v306,
                 "connectOutput:toInput:pipelineStage:",
                 -[BWNode output](v207, "output"),
                 -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v215, "inputs"), "objectAtIndexedSubscript:", 1), v301) & 1) == 0))
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v119 = -[BWNode output](v215, "output");
        v192 = v302;
        v122 = v306;
        v142 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
        v125 = v299;
        v115 = &classRef_BWStillImageCameraCalibrationDataNode;
      }
      if (v283)
      {
        v217 = [BWStillImageFilterNode alloc];
        if (objb)
        {
          v380 = -[BWSensorConfiguration portType](objb, "portType");
          v381 = objb;
          v220 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v381, &v380, 1);
        }
        else
        {
          v220 = 0;
        }
        LOBYTE(v256) = 0;
        LODWORD(v218) = 0;
        LODWORD(v255) = 0;
        LODWORD(v219) = v25;
        v221 = -[BWStillImageFilterNode initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:](v217, "initWithNodeConfiguration:sensorConfigurationsByPortType:statusDelegate:depthDataDeliveryEnabled:personSegmentationEnabled:refinedDepthEnabled:portraitRenderQuality:targetAspectRatio:defaultPortType:defaultZoomFactor:backPressureDrivenPipelining:", v267, v220, 0, v298, v280, v262, v218, v219, v255, v189, v256);
        v222 = (objc_class *)v115[93];
        v323.receiver = v192;
        v323.super_class = v222;
        if ((objc_msgSendSuper2(&v323, sel_addNode_error_, v221, &v370) & 1) == 0
          || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v221, "input"), v284) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v119 = -[BWNode output](v221, "output");
        v125 = v299;
      }
      if (objc_msgSend(v125, "allowsMultipleInflightCaptures"))
      {
        v223 = -[BWStillImageTurnstileNode initWithStillImageCoordinator:]([BWStillImageTurnstileNode alloc], "initWithStillImageCoordinator:", v192[7]);
        v224 = (objc_class *)v115[93];
        v322.receiver = v192;
        v322.super_class = v224;
        if ((objc_msgSendSuper2(&v322, sel_addNode_error_, v223, &v370) & 1) == 0
          || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v223, "input"), v70) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v119 = -[BWNode output](v223, "output");
      }
      v225 = -[BWStillImageScalerNode initWithBasePoolCapacity:nodeConfiguration:]([BWStillImageScalerNode alloc], "initWithBasePoolCapacity:nodeConfiguration:", 1, 0);
      -[BWStillImageScalerNode setBlackFillingRequired:](v225, "setBlackFillingRequired:", v282);
      v226 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v125, "portraitEffectsMatteMainImageDownscalingFactor");
      if (v227 != 0.0)
      {
        v228 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v125, "portraitEffectsMatteMainImageDownscalingFactor");
        objc_msgSend(v226, "setObject:forKeyedSubscript:", objc_msgSend(v228, "numberWithFloat:"), 0x1E495AF38);
      }
      -[BWStillImageScalerNode setMainImageDownscalingFactorByAttachedMediaKey:](v225, "setMainImageDownscalingFactorByAttachedMediaKey:", v226);
      v229 = (objc_class *)v115[93];
      v321.receiver = v192;
      v321.super_class = v229;
      if ((objc_msgSendSuper2(&v321, sel_addNode_error_, v225, &v370) & 1) == 0
        || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v225, "input"), v301) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_281;
      }
      v230 = -[BWNode output](v225, "output");
      if (v297)
      {
        v231 = -[BWMeteorHeadroomNode initWithNodeConfiguration:sensorConfigurationsByPortType:]([BWMeteorHeadroomNode alloc], "initWithNodeConfiguration:sensorConfigurationsByPortType:", 0, 0);
        -[BWMeteorHeadroomNode setHeadroomProcessingType:](v231, "setHeadroomProcessingType:", -[FigCaptureCameraParameters meteorHeadroomProcessingType](v261, "meteorHeadroomProcessingType"));
        v232 = (objc_class *)v115[93];
        v320.receiver = v192;
        v320.super_class = v232;
        if ((objc_msgSendSuper2(&v320, sel_addNode_error_, v231, &v370) & 1) == 0
          || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v230, -[BWNode input](v231, "input"), v301) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v230 = -[BWNode output](v231, "output");
        v125 = v299;
      }
      LOBYTE(v255) = 0;
      v233 = -[BWPhotoEncoderNode initWithNodeConfiguration:sensorConfigurationsByPortType:semanticDevelopmentVersion:inferenceScheduler:alwaysAwaitInference:portraitRenderQuality:deferredPhotoProcessorEnabled:]([BWPhotoEncoderNode alloc], "initWithNodeConfiguration:sensorConfigurationsByPortType:semanticDevelopmentVersion:inferenceScheduler:alwaysAwaitInference:portraitRenderQuality:deferredPhotoProcessorEnabled:", v267, 0, 0, 0, 0, 0, v255);
      if (v125
        && v125[12]
        && objc_msgSend(v125, "outputPixelFormat") == 875704438
        && !-[BWNodeOutput passthroughMode](-[BWNode output](v272, "output"), "passthroughMode"))
      {
        -[BWPhotoEncoderNode setInputColorInfo:](v233, "setInputColorInfo:", v125[12]);
      }
      -[BWPhotoEncoderNode setCameraSupportsFlash:](v233, "setCameraSupportsFlash:", objc_msgSend(*(id *)((char *)v192 + v142[683]), "hasFlash"));
      if (v280)
      {
        v234 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
        LODWORD(v235) = v20;
        v236 = -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v234, "initWithMainImageDownscalingFactor:propagationMode:", 0, v235);
        v378 = CFSTR("PersonSegmentationMask");
        v379 = v236;
        -[BWPhotoEncoderNode setAttachedMediaConfigurationByAttachedMediaKey:](v233, "setAttachedMediaConfigurationByAttachedMediaKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v379, &v378, 1));
      }
      -[BWPhotoEncoderNode setUsesHighEncodingPriority:](v233, "setUsesHighEncodingPriority:", objc_msgSend(v125, "usesHighEncodingPriority"));
      -[BWPhotoEncoderNode setZeroShutterLagEnabled:](v233, "setZeroShutterLagEnabled:", objc_msgSend(*(id *)((char *)v192 + v142[683]), "zeroShutterLagEnabled"));
      v237 = (objc_class *)v115[93];
      v319.receiver = v192;
      v319.super_class = v237;
      if ((objc_msgSendSuper2(&v319, sel_addNode_error_, v233, &v370) & 1) != 0
        && (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v230, -[BWNode input](v233, "input"), v301) & 1) != 0)
      {
        v238 = -[BWNode output](v233, "output");
        if (!objc_msgSend(v293, "optimizesImagesForOfflineVideoStabilization"))
          goto LABEL_370;
        v239 = objc_msgSend(v125, "horizontalSensorBinningFactor");
        v240 = objc_msgSend(v125, "verticalSensorBinningFactor");
        objc_msgSend(v125, "maxSupportedFrameRate");
        v242 = FigCaptureBuildMotionAttachmentsNode(v192, v238, v239, v240, v301, objc_msgSend(v125, "motionAttachmentsSource"), objc_msgSend(*(id *)((char *)v192 + v142[683]), "sensorIDDictionaryByPortType"), objc_msgSend(*(id *)((char *)v192 + v142[683]), "cameraInfoByPortType"), v241, objc_msgSend(*(id *)((char *)v192 + v142[683]), "activePortTypes"), 0, 1, 1, 0, &v371);
        if (!v371)
        {
          v238 = v242;
LABEL_370:
          v243 = -[BWStillImageSampleBufferSinkNode initWithSinkID:]([BWStillImageSampleBufferSinkNode alloc], "initWithSinkID:", objc_msgSend(v192, "sinkID"));
          -[BWNode setName:](v243, "setName:", CFSTR("Still Image Sink"));
          -[BWStillImageSampleBufferSinkNode setCameraSupportsFlash:](v243, "setCameraSupportsFlash:", objc_msgSend(*(id *)((char *)v192 + v142[683]), "hasFlash"));
          v318.receiver = v192;
          v318.super_class = (Class)FigCaptureStillImageSinkPipeline;
          if ((objc_msgSendSuper2(&v318, sel_addNode_error_, v243, &v370) & 1) != 0)
          {
            v192[8] = v243;
            if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v238, -[BWNode input](v243, "input"), v301) & 1) != 0)
            {
              v316 = 0u;
              v317 = 0u;
              v314 = 0u;
              v315 = 0u;
              v244 = (void *)objc_msgSend(v192, "nodes");
              v245 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v314, v377, 16);
              if (v245)
              {
                v246 = v245;
                v247 = *(_QWORD *)v315;
                do
                {
                  for (m = 0; m != v246; ++m)
                  {
                    if (*(_QWORD *)v315 != v247)
                      objc_enumerationMutation(v244);
                    v249 = *(void **)(*((_QWORD *)&v314 + 1) + 8 * m);
                    objc_msgSend(v249, "setDeferredPreparePriority:", 1);
                    v312 = 0u;
                    v313 = 0u;
                    v310 = 0u;
                    v311 = 0u;
                    v250 = (void *)objc_msgSend(v249, "inputs");
                    v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v310, v376, 16);
                    if (v251)
                    {
                      v252 = v251;
                      v253 = *(_QWORD *)v311;
                      do
                      {
                        for (n = 0; n != v252; ++n)
                        {
                          if (*(_QWORD *)v311 != v253)
                            objc_enumerationMutation(v250);
                          objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v310 + 1) + 8 * n), "connection"), "setWantsMessageCachingWhileSuspended:", 1);
                        }
                        v252 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v310, v376, 16);
                      }
                      while (v252);
                    }
                  }
                  v246 = objc_msgSend(v244, "countByEnumeratingWithState:objects:count:", &v314, v377, 16);
                }
                while (v246);
              }
              objc_msgSend(v192[7], "setDeferredPreparePriority:", 4);
              goto LABEL_387;
            }
          }
          fig_log_get_emitter();
          goto LABEL_281;
        }
      }
      fig_log_get_emitter();
      goto LABEL_281;
    }
    goto LABEL_447;
  }
  v305 = v132;
  v115 = &classRef_BWStillImageCameraCalibrationDataNode;
  if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, v138, v70) & 1) == 0)
    goto LABEL_447;
  obja = -[BWNode output](v136, "output");
  v139 = v279;
  v131 = v298 | v282;
LABEL_229:
  if (v131)
  {
    v140 = objc_alloc_init(BWStillImageDisparitySplitterNode);
    -[BWNode setName:](v140, "setName:", CFSTR("Disparity/HDR Splitter"));
    v141 = (objc_class *)v115[93];
    v340.receiver = v302;
    v340.super_class = v141;
    if ((objc_msgSendSuper2(&v340, sel_addNode_error_, v140, &v370) & 1) == 0
      || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v140, "input"), v284) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    obja = -[BWStillImageDisparitySplitterNode disparityOutput](v140, "disparityOutput");
  }
  else
  {
    if (!v269)
      goto LABEL_273;
    v140 = 0;
  }
  v386[0] = v289;
  v386[1] = v288;
  v143 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v386, 2);
  v144 = -[BWStillImageMultiCameraDoserNode initWithPortTypes:]([BWStillImageMultiCameraDoserNode alloc], "initWithPortTypes:", v143);
  v145 = (objc_class *)v115[93];
  v339.receiver = v302;
  v339.super_class = v145;
  if ((objc_msgSendSuper2(&v339, sel_addNode_error_, v144, &v370) & 1) == 0)
    goto LABEL_439;
  v146 = objc_msgSend(v143, "indexOfObject:", v289);
  if (v146 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_392;
  v147 = v146;
  v148 = objc_msgSend(v143, "indexOfObject:", v288);
  if (v148 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_392;
  v149 = v148;
  if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v144, "inputs"), "objectAtIndexedSubscript:", v147), v284) & 1) == 0|| (v70 = v301, (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", obja, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v144, "inputs"), "objectAtIndexedSubscript:", v149), v284) & 1) == 0))
  {
LABEL_439:
    fig_log_get_emitter();
    goto LABEL_281;
  }
  v150 = -[BWStillImageMultiCameraDoserNode outputIndexForPortType:](v144, "outputIndexForPortType:", v289);
  if (v150 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v151 = v150;
    v152 = -[BWStillImageMultiCameraDoserNode outputIndexForPortType:](v144, "outputIndexForPortType:", v288);
    if (v152 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v153 = v152;
      v119 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v144, "outputs"), "objectAtIndexedSubscript:", v151);
      obja = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v144, "outputs"), "objectAtIndexedSubscript:", v153);
      v296 = v140;
      if (v282)
      {
        v154 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v122 = v306;
        if (objc_msgSend(v302[6], "bravoTelephotoCaptureStream"))
        {
          v155 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)objc_msgSend(v302[6], "bravoTelephotoCaptureStream"), "baseZoomFactor");
          objc_msgSend(v154, "addObject:", objc_msgSend(v155, "numberWithFloat:"));
          v156 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)objc_msgSend(v302[6], "masterCaptureStream"), "baseZoomFactor");
          objc_msgSend(v154, "addObject:", objc_msgSend(v156, "numberWithFloat:"));
        }
        v157 = -[BWStillImageDualPhotoFacePropagatorNode initWithBaseZoomFactors:]([BWStillImageDualPhotoFacePropagatorNode alloc], "initWithBaseZoomFactors:", v154);
        v338.receiver = v302;
        v338.super_class = (Class)FigCaptureStillImageSinkPipeline;
        if ((objc_msgSendSuper2(&v338, sel_addNode_error_, v157, &v370) & 1) == 0
          || (v158 = v283,
              (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v157, "inputs"), "objectAtIndexedSubscript:", 0), v284) & 1) == 0)|| (v115 = &classRef_BWStillImageCameraCalibrationDataNode, (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", obja, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v157, "inputs"), "objectAtIndexedSubscript:", 1), v284) & 1) == 0))
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v119 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v157, "outputs"), "objectAtIndexedSubscript:", 0);
        obja = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v157, "outputs"), "objectAtIndexedSubscript:", 1);
        v139 = v279;
      }
      else
      {
        v122 = v306;
        v158 = v283;
      }
      v125 = v299;
      if (v269)
      {
        v159 = -[BWStereoFusionNode initWithTelephotoSensorIDDictionary:cameraInfoByPortType:]([BWStereoFusionNode alloc], "initWithTelephotoSensorIDDictionary:cameraInfoByPortType:", v286, objc_msgSend(v302[6], "cameraInfoByPortType"));
        v160 = (objc_class *)v115[93];
        v337.receiver = v302;
        v337.super_class = v160;
        if ((objc_msgSendSuper2(&v337, sel_addNode_error_, v159, &v370) & 1) == 0
          || (-[BWStereoFusionNode setAttachesInputBracketToOutputSampleBuffer:](v159, "setAttachesInputBracketToOutputSampleBuffer:", 0), (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWStereoFusionNode wideInput](v159, "wideInput"), v284) & 1) == 0)|| (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[BWStereoFusionNode telephotoInput](v159, "telephotoInput"), v284) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v161 = -[BWStereoFusionNode defaultOutput](v159, "defaultOutput");
        if (v273)
        {
          v162 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", 2, 1986618469);
          v163 = (objc_class *)v115[93];
          v336.receiver = v302;
          v336.super_class = v163;
          if ((objc_msgSendSuper2(&v336, sel_addNode_error_, v162, &v370) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
          v164 = -[BWGNRNode initWithSISEnabled:OISEnabled:LTMHDREnabled:processingLTMHDRFusion:portType:sensorID:sensorIDDictionary:telephotoPortType:telephotoSensorID:telephotoSensorIDDictionary:]([BWGNRNode alloc], "initWithSISEnabled:OISEnabled:LTMHDREnabled:processingLTMHDRFusion:portType:sensorID:sensorIDDictionary:telephotoPortType:telephotoSensorID:telephotoSensorIDDictionary:", 0, 0, v297, v297, v289, v260, v287, v288, v279, v286);
          v165 = (objc_class *)v115[93];
          v335.receiver = v302;
          v335.super_class = v165;
          if ((objc_msgSendSuper2(&v335, sel_addNode_error_, v164, &v370) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
          -[BWGNRNode setAttachesInputBracketToOutputSampleBuffer:](v164, "setAttachesInputBracketToOutputSampleBuffer:", 0);
          -[BWNode setName:](v164, "setName:", CFSTR("GNR"));
          v166 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", 2, 1986618469);
          v167 = (objc_class *)v115[93];
          v334.receiver = v302;
          v334.super_class = v167;
          if ((objc_msgSendSuper2(&v334, sel_addNode_error_, v166, &v370) & 1) == 0)
            goto LABEL_267;
          if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode HDROutput](v98, "HDROutput"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v162, "inputs"), "objectAtIndexedSubscript:", 0), v301) & 1) == 0)goto LABEL_267;
          v142 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
          if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStereoFusionNode stereoHDROutput](v159, "stereoHDROutput"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v162, "inputs"), "objectAtIndexedSubscript:", 1), v301) & 1) == 0|| (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStereoFusionNode defaultOutput](v159, "defaultOutput"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v166, "inputs"), "objectAtIndexedSubscript:", 0), v301) & 1) == 0|| (objc_msgSend(v306,
                  "connectOutput:toInput:pipelineStage:",
                  -[BWNode output](v164, "output"),
                  -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v166, "inputs"), "objectAtIndexedSubscript:", 1), v301) & 1) == 0)
          {
            goto LABEL_267;
          }
          v168 = -[BWNode output](v162, "output");
          v115 = &classRef_BWStillImageCameraCalibrationDataNode;
          if (v297)
          {
            v122 = v306;
            v139 = v279;
            if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v168, -[BWNode input](v164, "input"), v301) & 1) == 0)
            {
LABEL_267:
              fig_log_get_emitter();
              goto LABEL_281;
            }
          }
          else
          {
            v122 = v306;
            v139 = v279;
            if ((objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v168, -[BWNode input](v263, "input"), v301) & 1) == 0
              || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWNode output](v263, "output"), -[BWNode input](v164, "input"), v301) & 1) == 0)
            {
              goto LABEL_267;
            }
          }
          v119 = -[BWNode output](v166, "output");
          v70 = v301;
        }
        else
        {
          v119 = v161;
          v142 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
        }
LABEL_297:
        if (!v305)
          goto LABEL_301;
        goto LABEL_298;
      }
      if (v294)
      {
        v142 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
        if (v158)
        {
          v169 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", CFSTR("com.apple.coremedia.capture.stillimage.inference.bravo"), 14);
          v170 = -[BWInferenceNode initWithConvEngineSupportWithCaptureDevice:scheduler:priority:]([BWInferenceNode alloc], "initWithConvEngineSupportWithCaptureDevice:scheduler:priority:", v302[6], a5, 14);
          -[BWNode setName:](v170, "setName:", CFSTR("Disparity/Landmarks Inference Node"));
          v171 = +[BWLandmarksInferenceConfiguration configuration](BWLandmarksInferenceConfiguration, "configuration");
          objc_msgSend(v171, "setMaximumNumberOfFaces:", +[BWLandmarksInferenceConfiguration portraitMaximumNumberOfFaces](BWLandmarksInferenceConfiguration, "portraitMaximumNumberOfFaces"));
          -[BWInferenceNode addInferenceOfType:version:configuration:](v170, "addInferenceOfType:version:configuration:", 801, objc_msgSend(v171, "landmarksInferenceVersion") & 0xFFFFFFFFFFFFLL, v171);
          v333.receiver = v302;
          v333.super_class = (Class)FigCaptureStillImageSinkPipeline;
          if ((objc_msgSendSuper2(&v333, sel_addNode_error_, v170, &v370) & 1) == 0
            || (v172 = objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWStillImageDisparitySplitterNode processedOutput](v296, "processedOutput"), -[BWNode input](v170, "input"), v169), v125 = v299, (v172 & 1) == 0))
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
        }
        else
        {
          v170 = 0;
        }
        v176 = objc_msgSend(v125, "depthDataDimensions");
        v177 = (void *)objc_msgSend(v302[6], "cameraInfoByPortType");
        v178 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v288, v279, v286, objc_msgSend(v177, "objectForKeyedSubscript:", v288));
        v179 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v289, v260, v287, objc_msgSend(v177, "objectForKeyedSubscript:", v289));
        v384[0] = v289;
        v384[1] = v288;
        v385[0] = v178;
        v385[1] = v179;
        v180 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v385, v384, 2);

        v181 = -[BWStillImageBravoDisparityNode initWithNodeConfiguration:sensorConfigurationsByPortType:disparityMapWidth:disparityMapHeight:outputDisparityBufferCount:]([BWStillImageBravoDisparityNode alloc], "initWithNodeConfiguration:sensorConfigurationsByPortType:disparityMapWidth:disparityMapHeight:outputDisparityBufferCount:", 0, v180, (int)v176, v176 >> 32, 0);
        v115 = &classRef_BWStillImageCameraCalibrationDataNode;
        v332.receiver = v302;
        v332.super_class = (Class)FigCaptureStillImageSinkPipeline;
        if ((objc_msgSendSuper2(&v332, sel_addNode_error_, v181, &v370) & 1) == 0
          || (v182 = v170,
              v302[9] = v181,
              -[BWStillImageBravoDisparityNode setShouldComputeDisparityWhenCalibrationFails:](v181, "setShouldComputeDisparityWhenCalibrationFails:", objc_msgSend(v302[6], "shallowDepthOfFieldEffectEnabled") ^ 1), -[BWStillImageBravoDisparityNode setAttachesInputBracketToOutputSampleBuffer:](v181, "setAttachesInputBracketToOutputSampleBuffer:", 0), (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v119, -[BWStillImageBravoDisparityNode wideInput](v181, "wideInput"), v284) & 1) == 0)|| (v70 = v301, v125 = v299, v139 = v279, (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:",
                 obja,
                 -[BWStillImageBravoDisparityNode telephotoInput](v181, "telephotoInput"),
                 v284) & 1) == 0))
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v119 = -[BWNode output](v181, "output");
        if (!v283)
        {
          v122 = v306;
          goto LABEL_297;
        }
        v183 = -[BWInferenceSynchronizerNode initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:]([BWInferenceSynchronizerNode alloc], "initWithIndexOfInputProvidingOutputSampleBuffer:indexOfInputProvidingPreferredInferences:errorHandlingModel:", 1, 1, 0);
        -[BWNode setName:](v183, "setName:", CFSTR("Disparity/Landmarks Sync"));
        -[BWInferenceSynchronizerNode setSynchronizesTopLevelAttachments:](v183, "setSynchronizesTopLevelAttachments:", 1);
        v331.receiver = v302;
        v331.super_class = (Class)FigCaptureStillImageSinkPipeline;
        if ((objc_msgSendSuper2(&v331, sel_addNode_error_, v183, &v370) & 1) == 0
          || (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v183, "inputs"), "objectAtIndexedSubscript:", 0), v284) & 1) == 0|| (objc_msgSend(v306, "connectOutput:toInput:pipelineStage:", -[BWNode output](v182, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v183, "inputs"), "objectAtIndexedSubscript:", 1), v284) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v122 = v306;
        v175 = -[BWNode output](v183, "output");
LABEL_292:
        v119 = v175;
        goto LABEL_297;
      }
LABEL_273:
      v142 = &OBJC_IVAR___FigCaptureSourceBackings__hasMicSource;
      if (!v282)
        goto LABEL_297;
      v173 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", 2, 1986618469);
      v174 = (objc_class *)v115[93];
      v330.receiver = v302;
      v330.super_class = v174;
      if ((objc_msgSendSuper2(&v330, sel_addNode_error_, v173, &v370) & 1) == 0
        || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v173, "inputs"), "objectAtIndexedSubscript:", 0), v284) & 1) == 0|| (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v173, "inputs"), "objectAtIndexedSubscript:", 1), v284) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_281;
      }
      v175 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v173, "outputs"), "objectAtIndexedSubscript:", 0);
      goto LABEL_292;
    }
  }
LABEL_392:
  v371 = -12780;
LABEL_387:
  result = v371;
  if (!v371)
  {
    if (v370)
      return objc_msgSend(v370, "code");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageSinkPipeline;
  -[FigCaptureSinkPipeline dealloc](&v3, sel_dealloc);
}

+ (NSString)pipelineBaseName
{
  return (NSString *)CFSTR("Still Image Sink Pipeline");
}

- (BWStillImageCoordinatorNode)stillImageCoordinatorNode
{
  return self->_stillImageCoordinatorNode;
}

- (BWCompressedShotBufferNode)compressedShotBufferNode
{
  return 0;
}

- (BWStillImageSampleBufferSinkNode)stillImageSinkNode
{
  return self->_stillImageSinkNode;
}

- (BWPortraitHDRStagingNode)portraitHDRStagingNode
{
  return self->_portraitHDRStagingNode;
}

- (void)enablePrepareTimeAllocationsForDeferredPrepare
{
  -[BWSISNode setAllowAllocationsAtPrepareTime:](self->_legacySISNode, "setAllowAllocationsAtPrepareTime:", 1);
}

@end
