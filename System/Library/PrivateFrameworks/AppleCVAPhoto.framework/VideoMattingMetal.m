@implementation VideoMattingMetal

- (VideoMattingMetal)initWithStaticParams:(const VideoMattingStaticParams *)a3 renderingDisparityUpdateRate:(float)a4 renderingDisparityBlurRadius:(float)a5 renderingLensFocalLength_mm:(float)a6 useTemporalConfidence:(BOOL)a7 metalContext:(void *)a8 error:(id *)a9
{
  VideoMattingMetal *v16;
  VideoMattingMetal *v17;
  int width2;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  VideoMattingMetal *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  GlobalReductionAverage *v32;
  GlobalReductionAverage *globalReductionAverage;
  const __CFDictionary *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  CVAPhotoMTLRingBuffer *v39;
  CVAPhotoMTLRingBuffer *disparityConfig;
  CVAPhotoMTLRingBuffer *v41;
  void *v42;
  void *v43;
  void *v44;
  CVAFilterDiffusion *v45;
  double v46;
  double v47;
  uint64_t v48;
  CVAFilterDiffusion *diffusion;
  CVAFilterDistanceTransform *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  CVAFilterDistanceTransform *distanceTransform;
  CVAFilterBox *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  CVAFilterBox *boxFilter;
  CVAFilterColorAlphaToFgBg *v64;
  CVAFilterColorAlphaToFgBg *colorAlphaToFgBg;
  CVAFilterHybridResampling *v66;
  CVAFilterHybridResampling *hybridResampler;
  int v68;
  uint64_t v69;
  MPSImageGuidedFilter *guidedFilter;
  MPSImageGuidedFilter *v71;
  void *v72;
  void *v73;
  void *v74;
  CVAFilterGuided *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  float laplacianLimitingDownsampling;
  int infConvolutionDownsampling;
  uint64_t v86;
  CVAFilterGuided *cvaGuidedFilter;
  CVAFilterMaskedVariableBlur *v88;
  CVAFilterMaskedVariableBlur *maskedVariableBlur;
  CVAFilterRenderStagelight *v90;
  CVAFilterRenderStagelight *stagelightFilter;
  CVAFilterRenderComposite *v92;
  CVAFilterRenderComposite *renderComposite;
  void **v94;
  void **v95;
  void ***v96;
  void ***v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  MTLTexture *facemaskRegionTexture;
  MTLTexture *v103;
  void *v104;
  void *v105;
  void *v106;
  int v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  MTLTexture *bg;
  dispatch_semaphore_t v114;
  OS_dispatch_semaphore *semaphore;
  dispatch_semaphore_t v116;
  OS_dispatch_semaphore *renderingCallbackSemaphore;
  dispatch_queue_t v118;
  OS_dispatch_queue *synchronousRenderingCallbackQueue;
  dispatch_semaphore_t v120;
  OS_dispatch_semaphore *mattingCallbackSemaphore;
  dispatch_queue_t v122;
  OS_dispatch_queue *synchronousMattingCallbackQueue;
  id v124;
  double v125;
  uint64_t v126;
  MPSImageGaussianBlur *smoothFilter;
  uint64_t v128;
  MPSImageBox *disparityBlurBoxKernel;
  uint64_t v130;
  MPSImageBox *fgBlurBoxKernel;
  uint64_t v132;
  MPSImageAreaMin *fgMaskErosionKernel;
  int v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  id *p_commandQueue;
  void **p_pipelineLibrary;
  void **p_defaultLibrary;
  id *p_device;
  int *p_width2;
  int *p_height2;
  void *__p;
  void ***v149;
  void **v150;
  void **v151;
  id *v152;
  __int128 v153;
  uint64_t v154;
  _QWORD v155[3];
  _QWORD v156[3];
  _QWORD v157[3];
  char v158;
  id v159;
  objc_super v160;
  uint8_t buf[8];
  uint64_t v162;
  id v163;
  MTLComputePipelineState **p_colorSimKernel;
  __CFString *coeffHistory;
  uint64_t v166;
  MTLComputePipelineState **p_colorSimL1Kernel;
  __CFString *v168;
  MTLTexture **v169;
  uint64_t p_temporalCoefficientsFilterKernel;
  __CFString *v171;
  id v172;
  MTLComputePipelineState **p_guidedFilterWeightKernel;
  uint64_t v174;
  id v175;
  MTLComputePipelineState **p_disparityConfidenceMaskKernel;
  __CFString *p_gfForegroundMask;
  uint64_t v178;
  MTLComputePipelineState **p_disparityMasksKernel;
  __CFString *v180;
  MTLTexture **p_gfWeight;
  uint64_t p_disparityIsValidKernel;
  __CFString *v183;
  id v184;
  MTLComputePipelineState **p_domainTransformXKernel;
  uint64_t v186;
  id v187;
  MTLComputePipelineState **p_domainTransformYKernel;
  __CFString *v189;
  uint64_t v190;
  MTLComputePipelineState **p_edgeAwareFillXKernel;
  __CFString *v192;
  MTLTexture **disparity;
  uint64_t p_edgeAwareFillYKernel;
  __CFString *v195;
  MTLTexture **v196;
  MTLComputePipelineState **p_invalidDisparityMaskKernel;
  uint64_t v198;
  id v199;
  MTLComputePipelineState **p_bgFillXKernel;
  __CFString *p_disparityInScreenAspectRatio;
  uint64_t v202;
  MTLComputePipelineState **p_bgFillYKernel;
  __CFString *v204;
  MTLTexture **p_facemaskDisparity;
  uint64_t p_internalDisparityToCanonicalDisparityKernel;
  __CFString *v207;
  id v208;
  MTLComputePipelineState **p_simpleConfidenceKernel;
  uint64_t v210;
  id v211;
  MTLComputePipelineState **p_roughDisparityKernel;
  __CFString *p_filledDisparityNoInvalidTexture;
  uint64_t v214;
  MTLComputePipelineState **p_diffusionMapKernel;
  __CFString *v216;
  MTLTexture **p_temporallyFilteredDisparity;
  uint64_t p_renderingDisparityDeweightKernel;
  __CFString *v219;
  id v220;
  MTLComputePipelineState **p_renderingDisparityFillAndFilterKernel;
  uint64_t v222;
  id v223;
  MTLComputePipelineState **p_disparityCleanupKernel;
  __CFString *smoothConfidence;
  uint64_t v226;
  MTLComputePipelineState **p_disparityCleanupKernel_firstFrame;
  __CFString *v228;
  MTLTexture **v229;
  uint64_t p_updateConfidenceAndLastValidDisparityKernel;
  __CFString *v231;
  id v232;
  MTLComputePipelineState **p_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence;
  uint64_t v234;
  id v235;
  MTLComputePipelineState **p_temporalDisparityFilterKernel;
  __CFString *smoothDisparity;
  uint64_t v238;
  MTLComputePipelineState **p_temporalDisparityFilterKernel_fallbackToInvalid;
  __CFString *v240;
  MTLTexture **v241;
  uint64_t p_fillBackgroundDisparityKernel;
  __CFString *v243;
  id v244;
  MTLComputePipelineState **p_fillBackgroundDisparityKernel_faceMask;
  uint64_t v246;
  id v247;
  MTLComputePipelineState **p_halfDownSampler;
  __CFString *p_outputCanonicalDisparity;
  uint64_t v250;
  MTLComputePipelineState **p_alphaFillKernel;
  __CFString *v252;
  MTLTexture **p_diffusionMapTexture;
  uint64_t p_rotateAndFitIntoRectKernel;
  __CFString *v255;
  id v256;
  MTLTexture **p_disparityIsValidTexture;
  uint64_t v258;
  int v259;
  int v260;
  uint64_t v261;
  MTLTexture **p_distanceFromKnownDisparityTexture;
  uint64_t v263;
  int v264;
  int v265;
  uint64_t v266;
  MTLTexture **p_domainTransformXTexture;
  uint64_t v268;
  int v269;
  int v270;
  uint64_t v271;
  MTLTexture **p_domainTransformYTexture;
  uint64_t v273;
  int v274;
  int v275;
  uint64_t v276;
  MTLTexture **p_tempFloatR32FloatTexture;
  uint64_t v278;
  int v279;
  int v280;
  uint64_t v281;
  MTLTexture **p_edgeAwareFillTempTexture;
  uint64_t v283;
  int v284;
  int v285;
  uint64_t v286;
  MTLTexture **p_bgFillTempTexture;
  uint64_t v288;
  int v289;
  int v290;
  uint64_t v291;
  MTLTexture **p_invalidDisparityMaskTexture;
  uint64_t v293;
  int v294;
  int v295;
  uint64_t v296;
  MTLTexture **p_initDisparity;
  uint64_t v298;
  int v299;
  int v300;
  uint64_t v301;
  MTLTexture **p_isForegroundTexture;
  uint64_t v303;
  int v304;
  int v305;
  uint64_t v306;
  MTLTexture **p_distanceToForegroundTexture;
  uint64_t v308;
  int v309;
  int v310;
  uint64_t v311;
  MTLTexture **p_correctlyRotatedAndReshapedSegmentation;
  uint64_t v313;
  int v314;
  int v315;
  uint64_t v316;
  MTLTexture **p_blurredBg;
  uint64_t v318;
  int width;
  int height;
  uint64_t v321;
  MTLTexture **p_deweightedDisparity;
  uint64_t v323;
  int v324;
  int v325;
  uint64_t v326;
  MTLTexture **shift;
  uint64_t v328;
  int v329;
  int v330;
  uint64_t v331;
  MTLTexture **v332;
  uint64_t v333;
  int v334;
  int v335;
  uint64_t v336;
  MTLTexture **p_coc;
  uint64_t v338;
  int v339;
  int v340;
  uint64_t v341;
  uint64_t v342;
  _QWORD v343[3];

  v343[1] = *MEMORY[0x1E0C80C00];
  v160.receiver = self;
  v160.super_class = (Class)VideoMattingMetal;
  v16 = -[ImageSaverRegistrator init](&v160, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_sdofRenderingHasForegroundBlur = a3->supportsForegroundBlur;
    v16->_renderStateIsConfigured = 0;
    v16->_width = a3->colorWidth;
    v16->_height = a3->colorHeight;
    v16->_width2 = a3->guidedFilterWidth;
    p_width2 = &v16->_width2;
    p_height2 = &v16->_height2;
    v16->_height2 = a3->guidedFilterHeight;
    width2 = v16->_width2;
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_width2: %d outside bounds [2, %d] for guided filter"), width2, 0xFFFFLL);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 419, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B5658D40(width2 < 2, a9, 0, 4294944393, v21);

    if (width2 >= 2)
    {
      v22 = *p_height2;
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_height2: %d outside bounds [2, %d] for guided filter"), *p_height2, 0xFFFFLL);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 429, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B5658D40(v22 < 2, a9, 0, 4294944393, v25);

      if (v22 >= 2)
      {
        v17->_infConvolutionScale = 1.0;
        v17->_doDisparityDiffusion = 1;
        +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v17->_enableInfConvolution = objc_msgSend(v28, "BOOLForKey:", CFSTR("disableInfConvolution")) ^ 1;

        +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v17->_mattingUsesPostprocessing = objc_msgSend(v29, "BOOLForKey:", CFSTR("disablePostprocessingForMatting")) ^ 1;

        +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v17->_renderingUsesPostprocessing = objc_msgSend(v30, "BOOLForKey:", CFSTR("disablePostprocessingForRendering")) ^ 1;

        +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v17->_doFaceMask = objc_msgSend(v31, "BOOLForKey:", CFSTR("enableFaceMaskPostprocessing"));

        v159 = (id)objc_opt_new();
        objc_msgSend(v159, "setConstantValue:type:withName:", p_width2, 29, CFSTR("kDistanceTransformWidth"));
        objc_msgSend(v159, "setConstantValue:type:withName:", p_height2, 29, CFSTR("kDistanceTransformHeight"));
        v158 = 0;
        objc_msgSend(v159, "setConstantValue:type:withName:", &v158, 53, CFSTR("kDoVignetting"));
        p_device = (id *)&v17->_device;
        objc_storeStrong((id *)&v17->_device, *(id *)a8);
        p_commandQueue = (id *)&v17->_commandQueue;
        objc_storeStrong((id *)&v17->_commandQueue, *((id *)a8 + 1));
        p_defaultLibrary = (void **)&v17->_defaultLibrary;
        objc_storeStrong((id *)&v17->_defaultLibrary, *((id *)a8 + 2));
        p_pipelineLibrary = (void **)&v17->_pipelineLibrary;
        objc_storeStrong((id *)&v17->_pipelineLibrary, *((id *)a8 + 3));
        v17->_metalContext = a8;
        if (v17->_sdofRenderingHasForegroundBlur)
        {
          v32 = -[GlobalReductionAverage initWithDevice:library:pipelineLibrary:textureSize:]([GlobalReductionAverage alloc], "initWithDevice:library:pipelineLibrary:textureSize:", *p_device, *p_defaultLibrary, *p_pipelineLibrary, 256.0, 192.0);
          globalReductionAverage = v17->_globalReductionAverage;
          v17->_globalReductionAverage = v32;

        }
        v17->_lastCommittedCommand = 0;
        v342 = *MEMORY[0x1E0CA8F48];
        v343[0] = &unk_1E694A5D0;
        v34 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v343, &v342, 1);
        if (CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v34, *p_device, 0, &v17->_textureCache))
          v35 = 0;
        else
          v35 = v17->_textureCache != 0;
        v36 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error allocating texture cache"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 474, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5658D40(!v35, a9, 0, 4294944382, v38);

        if (!v35)
          goto LABEL_40;
        v17->_isBgColorLutBlack = 0;
        v17->_renderingDisparityUpdateRate = a4;
        v17->_renderingDisparityBlurRadius = a5;
        v17->_renderingLensFocalLength_mm = a6;
        v17->_useTemporalConfidence = a7;
        v39 = -[CVAPhotoMTLRingBuffer initWithLength:options:device:]([CVAPhotoMTLRingBuffer alloc], "initWithLength:options:device:", 36, 0, *p_device);
        disparityConfig = v17->_disparityConfig;
        v17->_disparityConfig = v39;

        v41 = v17->_disparityConfig;
        v42 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[_Nonnull id<MTLDeviceSPI> newBufferWithLength:%lu] is nil"), 36);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 504, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5658D40(v41 == 0, a9, 0, 4294944382, v44);

        if (!v41)
          goto LABEL_40;
        v45 = [CVAFilterDiffusion alloc];
        LODWORD(v46) = 998310275;
        LODWORD(v47) = 1.0;
        v48 = -[CVAFilterDiffusion initWithDevice:library:pipelineLibrary:bufferWidth:bufferHeight:edgeVariance:stepSize:error:](v45, "initWithDevice:library:pipelineLibrary:bufferWidth:bufferHeight:edgeVariance:stepSize:error:", *p_device, *p_defaultLibrary, *p_pipelineLibrary, *p_width2, *p_height2, a9, v46, v47);
        diffusion = v17->_diffusion;
        v17->_diffusion = (CVAFilterDiffusion *)v48;

        if (!v17->_diffusion)
          goto LABEL_40;
        if (v17->_doFaceMask && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B5656000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "CVAPhoto: Facemask-based disparity post-processing has been deprecated.", buf, 2u);
        }
        v50 = [CVAFilterDistanceTransform alloc];
        v51 = *p_device;
        v52 = *p_defaultLibrary;
        v53 = *p_pipelineLibrary;
        v54 = *p_height2;
        v157[0] = *p_width2;
        v157[1] = v54;
        v157[2] = 1;
        v55 = -[CVAFilterDistanceTransform initWithDevice:library:pipelineLibrary:textureSize:error:](v50, "initWithDevice:library:pipelineLibrary:textureSize:error:", v51, v52, v53, v157, a9);
        distanceTransform = v17->_distanceTransform;
        v17->_distanceTransform = (CVAFilterDistanceTransform *)v55;

        if (!v17->_distanceTransform)
          goto LABEL_40;
        v57 = [CVAFilterBox alloc];
        v58 = *p_device;
        v59 = *p_defaultLibrary;
        v60 = *p_pipelineLibrary;
        v61 = *p_height2;
        v156[0] = *p_width2;
        v156[1] = v61;
        v156[2] = 1;
        v62 = -[CVAFilterBox initWithDevice:library:pipelineLibrary:textureSize:error:](v57, "initWithDevice:library:pipelineLibrary:textureSize:error:", v58, v59, v60, v156, a9);
        boxFilter = v17->_boxFilter;
        v17->_boxFilter = (CVAFilterBox *)v62;

        if (!v17->_boxFilter)
          goto LABEL_40;
        v64 = -[CVAFilterColorAlphaToFgBg initWithDevice:library:pipelineLibrary:error:]([CVAFilterColorAlphaToFgBg alloc], "initWithDevice:library:pipelineLibrary:error:", *p_device, *p_defaultLibrary, *p_pipelineLibrary, a9);
        colorAlphaToFgBg = v17->_colorAlphaToFgBg;
        v17->_colorAlphaToFgBg = v64;

        if (!v17->_colorAlphaToFgBg)
          goto LABEL_40;
        v66 = -[CVAFilterHybridResampling initWithDevice:library:pipelineLibrary:commandQueue:error:]([CVAFilterHybridResampling alloc], "initWithDevice:library:pipelineLibrary:commandQueue:error:", *p_device, *p_defaultLibrary, *p_pipelineLibrary, *p_commandQueue, a9);
        hybridResampler = v17->_hybridResampler;
        v17->_hybridResampler = v66;

        if (!v17->_hybridResampler)
          goto LABEL_40;
        v141 = sub_1B569090C(CFSTR("harvesting.enabled"), CFSTR("com.apple.coremedia"), 0);
        v68 = (int)(float)((float)(floorf((float)((float)((float)a3->kernelSize * 0.5) * (float)*p_width2)/ (float)a3->alphaWidth)* 2.0)+ 1.0);
        if (!v141)
        {
          v69 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E58]), "initWithDevice:kernelDiameter:", *p_device, v68);
          guidedFilter = v17->_guidedFilter;
          v17->_guidedFilter = (MPSImageGuidedFilter *)v69;

          v71 = v17->_guidedFilter;
          v72 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MPSImageGuidedFilter is nil"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 597, v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B5658D40(v71 == 0, a9, 0, 4294944382, v74);

          if (!v71)
            goto LABEL_40;
        }
        -[MPSImageGuidedFilter setRescaleCoefficients:](v17->_guidedFilter, "setRescaleCoefficients:", 0);
        -[MPSImageGuidedFilter setReconstructionCoefficientsSampleBicubic:](v17->_guidedFilter, "setReconstructionCoefficientsSampleBicubic:", 1);
        v75 = [CVAFilterGuided alloc];
        v76 = *p_device;
        v77 = *p_defaultLibrary;
        v78 = *p_pipelineLibrary;
        v79 = *p_commandQueue;
        v80 = *p_width2;
        v81 = *p_height2;
        v82 = *(_QWORD *)&a3->alphaWidth;
        *(_QWORD *)&v83 = v82;
        *((_QWORD *)&v83 + 1) = HIDWORD(v82);
        v153 = v83;
        laplacianLimitingDownsampling = a3->laplacianLimitingDownsampling;
        infConvolutionDownsampling = (int)a3->infConvolutionDownsampling;
        v155[0] = v80;
        v155[1] = v81;
        v155[2] = 1;
        v154 = 1;
        LODWORD(v140) = (int)laplacianLimitingDownsampling;
        HIDWORD(v140) = (int)a3->laplacianLimitingBlurSize;
        v86 = -[CVAFilterGuided initWithDevice:library:pipelineLibrary:commandQueue:textureSize:alphaSize:kernelSize:infConvolutionDownsampling:laplacianLimitingDownsampling:laplacianLimitingBlurSize:error:](v75, "initWithDevice:library:pipelineLibrary:commandQueue:textureSize:alphaSize:kernelSize:infConvolutionDownsampling:laplacianLimitingDownsampling:laplacianLimitingBlurSize:error:", v76, v77, v78, v79, v155, &v153, __PAIR64__(infConvolutionDownsampling, v68), v140, a9);
        cvaGuidedFilter = v17->_cvaGuidedFilter;
        v17->_cvaGuidedFilter = (CVAFilterGuided *)v86;

        if (!v17->_cvaGuidedFilter)
          goto LABEL_40;
        v88 = -[CVAFilterMaskedVariableBlur initWithDevice:library:pipelineLibrary:commandQueue:kernelSize:error:]([CVAFilterMaskedVariableBlur alloc], "initWithDevice:library:pipelineLibrary:commandQueue:kernelSize:error:", *p_device, *p_defaultLibrary, *p_pipelineLibrary, *p_commandQueue, 7, a9);
        maskedVariableBlur = v17->_maskedVariableBlur;
        v17->_maskedVariableBlur = v88;

        if (!v17->_maskedVariableBlur)
          goto LABEL_40;
        v90 = -[CVAFilterRenderStagelight initWithDevice:library:pipelineLibrary:error:]([CVAFilterRenderStagelight alloc], "initWithDevice:library:pipelineLibrary:error:", *p_device, *p_defaultLibrary, *p_pipelineLibrary, a9);
        stagelightFilter = v17->_stagelightFilter;
        v17->_stagelightFilter = v90;

        if (!v17->_stagelightFilter
          || (v92 = -[CVAFilterRenderComposite initWithDevice:library:pipelineLibrary:error:]([CVAFilterRenderComposite alloc], "initWithDevice:library:pipelineLibrary:error:", *p_device, *p_defaultLibrary, *p_pipelineLibrary, a9), renderComposite = v17->_renderComposite, v17->_renderComposite = v92, renderComposite, !v17->_renderComposite))
        {
LABEL_40:
          v26 = 0;
LABEL_41:

          goto LABEL_5;
        }
        v152 = &v159;
        *(_QWORD *)buf = &v17->_disparityDecimateKernel;
        v162 = (uint64_t)CFSTR("disparityDecimate");
        v163 = 0;
        p_colorSimKernel = &v17->_colorSimKernel;
        coeffHistory = CFSTR("colorSim");
        v166 = 0;
        p_colorSimL1Kernel = &v17->_colorSimL1Kernel;
        v168 = CFSTR("colorSimL1");
        v169 = 0;
        p_temporalCoefficientsFilterKernel = (uint64_t)&v17->_temporalCoefficientsFilterKernel;
        v171 = CFSTR("temporalFilterCoefficients");
        v172 = 0;
        p_guidedFilterWeightKernel = &v17->_guidedFilterWeightKernel;
        v174 = (uint64_t)CFSTR("guidedFilterWeight");
        v175 = 0;
        p_disparityConfidenceMaskKernel = &v17->_disparityConfidenceMaskKernel;
        p_gfForegroundMask = CFSTR("disparityConfidenceMask");
        v178 = 0;
        p_disparityMasksKernel = &v17->_disparityMasksKernel;
        v180 = CFSTR("disparityMasks");
        p_gfWeight = 0;
        p_disparityIsValidKernel = (uint64_t)&v17->_disparityIsValidKernel;
        v183 = CFSTR("disparityIsValid");
        v184 = 0;
        p_domainTransformXKernel = &v17->_domainTransformXKernel;
        v186 = (uint64_t)CFSTR("domainTransformX");
        v187 = v159;
        p_domainTransformYKernel = &v17->_domainTransformYKernel;
        v189 = CFSTR("domainTransformY");
        v190 = (uint64_t)v187;
        p_edgeAwareFillXKernel = &v17->_edgeAwareFillXKernel;
        v192 = CFSTR("edgeAwareFillX");
        disparity = (MTLTexture **)(id)v190;
        p_edgeAwareFillYKernel = (uint64_t)&v17->_edgeAwareFillYKernel;
        v195 = CFSTR("edgeAwareFillY");
        v196 = disparity;
        p_invalidDisparityMaskKernel = &v17->_invalidDisparityMaskKernel;
        v198 = (uint64_t)CFSTR("invalidDisparityMask");
        v199 = 0;
        p_bgFillXKernel = &v17->_bgFillXKernel;
        p_disparityInScreenAspectRatio = CFSTR("bgFillX");
        v202 = 0;
        p_bgFillYKernel = &v17->_bgFillYKernel;
        v204 = CFSTR("bgFillY");
        p_facemaskDisparity = 0;
        p_internalDisparityToCanonicalDisparityKernel = (uint64_t)&v17->_internalDisparityToCanonicalDisparityKernel;
        v207 = CFSTR("internalDisparityToCanonicalDisparity");
        v208 = 0;
        p_simpleConfidenceKernel = &v17->_simpleConfidenceKernel;
        v210 = (uint64_t)CFSTR("simpleConfidence");
        v211 = 0;
        p_roughDisparityKernel = &v17->_roughDisparityKernel;
        p_filledDisparityNoInvalidTexture = CFSTR("roughDisparity");
        v214 = 0;
        p_diffusionMapKernel = &v17->_diffusionMapKernel;
        v216 = CFSTR("diffusionMap");
        p_temporallyFilteredDisparity = 0;
        p_renderingDisparityDeweightKernel = (uint64_t)&v17->_renderingDisparityDeweightKernel;
        v219 = CFSTR("disparityDeweightFg");
        v220 = 0;
        p_renderingDisparityFillAndFilterKernel = &v17->_renderingDisparityFillAndFilterKernel;
        v222 = (uint64_t)CFSTR("disparityFillAndFilter");
        v223 = 0;
        p_disparityCleanupKernel = &v17->_disparityCleanupKernel;
        smoothConfidence = CFSTR("disparityCleanup");
        sub_1B569EE68(&v152, CFSTR("kFirstFrame"), 0);
        v226 = objc_claimAutoreleasedReturnValue();
        p_disparityCleanupKernel_firstFrame = &v17->_disparityCleanupKernel_firstFrame;
        v228 = CFSTR("disparityCleanup");
        sub_1B569EE68(&v152, CFSTR("kFirstFrame"), 1);
        v229 = (MTLTexture **)objc_claimAutoreleasedReturnValue();
        p_updateConfidenceAndLastValidDisparityKernel = (uint64_t)&v17->_updateConfidenceAndLastValidDisparityKernel;
        v231 = CFSTR("updateConfidenceAndLastValidDisparity");
        sub_1B569EE68(&v152, CFSTR("kUseTemporalConfidence"), 0);
        v232 = (id)objc_claimAutoreleasedReturnValue();
        p_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence = &v17->_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence;
        v234 = (uint64_t)CFSTR("updateConfidenceAndLastValidDisparity");
        sub_1B569EE68(&v152, CFSTR("kUseTemporalConfidence"), 1);
        v235 = (id)objc_claimAutoreleasedReturnValue();
        p_temporalDisparityFilterKernel = &v17->_temporalDisparityFilterKernel;
        smoothDisparity = CFSTR("temporalDisparityFilter");
        sub_1B569EE68(&v152, CFSTR("kTemporalDisparityFallbackToInvalid"), 0);
        v238 = objc_claimAutoreleasedReturnValue();
        p_temporalDisparityFilterKernel_fallbackToInvalid = &v17->_temporalDisparityFilterKernel_fallbackToInvalid;
        v240 = CFSTR("temporalDisparityFilter");
        sub_1B569EE68(&v152, CFSTR("kTemporalDisparityFallbackToInvalid"), 1);
        v241 = (MTLTexture **)objc_claimAutoreleasedReturnValue();
        p_fillBackgroundDisparityKernel = (uint64_t)&v17->_fillBackgroundDisparityKernel;
        v243 = CFSTR("fillBackgroundDisparity");
        sub_1B569EE68(&v152, CFSTR("kUseFacemaskInFillBackgroundDisparity"), 0);
        v244 = (id)objc_claimAutoreleasedReturnValue();
        p_fillBackgroundDisparityKernel_faceMask = &v17->_fillBackgroundDisparityKernel_faceMask;
        v246 = (uint64_t)CFSTR("fillBackgroundDisparity");
        sub_1B569EE68(&v152, CFSTR("kUseFacemaskInFillBackgroundDisparity"), 1);
        v247 = (id)objc_claimAutoreleasedReturnValue();
        p_halfDownSampler = &v17->_halfDownSampler;
        p_outputCanonicalDisparity = CFSTR("halfDownsample");
        v250 = 0;
        p_alphaFillKernel = &v17->_alphaFillKernel;
        v252 = CFSTR("fillAlpha");
        p_diffusionMapTexture = 0;
        p_rotateAndFitIntoRectKernel = (uint64_t)&v17->_rotateAndFitIntoRectKernel;
        v255 = CFSTR("rotateAndFitIntoRectKernel");
        v256 = 0;
        sub_1B569EEE8(&v150, (uint64_t)buf, 0x20uLL);

        v94 = v150;
        v95 = v151;
        if (v150 != v151)
        {
          while (1)
          {
            sub_1B5674B88((void **)*v94, *p_defaultLibrary, *p_pipelineLibrary, *p_device, v94[1], a9, v94[2]);
            if (!*(_QWORD *)*v94)
              break;
            v94 += 3;
            if (v94 == v95)
              goto LABEL_30;
          }
          v26 = 0;
          goto LABEL_49;
        }
LABEL_30:
        *(_QWORD *)buf = &v17->_coeff;
        v162 = 125;
        LODWORD(v163) = *p_width2;
        HIDWORD(v163) = *p_height2;
        p_colorSimKernel = 0;
        coeffHistory = (__CFString *)v17->_coeffHistory;
        v166 = 115;
        LODWORD(p_colorSimL1Kernel) = *p_width2;
        HIDWORD(p_colorSimL1Kernel) = *p_height2;
        v168 = 0;
        v169 = &v17->_coeffHistory[1];
        p_temporalCoefficientsFilterKernel = 115;
        LODWORD(v171) = *p_width2;
        HIDWORD(v171) = *p_height2;
        v172 = 0;
        p_guidedFilterWeightKernel = &v17->_alphaNoPostprocessing;
        v174 = 10;
        v175 = *(id *)&a3->alphaWidth;
        p_disparityConfidenceMaskKernel = 0;
        p_gfForegroundMask = (__CFString *)&v17->_gfForegroundMask;
        v178 = 10;
        LODWORD(p_disparityMasksKernel) = *p_width2;
        HIDWORD(p_disparityMasksKernel) = *p_height2;
        v180 = 0;
        p_gfWeight = &v17->_gfWeight;
        p_disparityIsValidKernel = 25;
        LODWORD(v183) = *p_width2;
        HIDWORD(v183) = *p_height2;
        v184 = 0;
        p_domainTransformXKernel = v17->_disparityLastValidValue;
        v186 = 25;
        LODWORD(v187) = *p_width2;
        HIDWORD(v187) = *p_height2;
        p_domainTransformYKernel = 0;
        v189 = (__CFString *)&v17->_disparityLastValidValue[1];
        v190 = 25;
        LODWORD(p_edgeAwareFillXKernel) = *p_width2;
        HIDWORD(p_edgeAwareFillXKernel) = *p_height2;
        v192 = 0;
        disparity = v17->_disparity;
        p_edgeAwareFillYKernel = 25;
        LODWORD(v195) = *p_width2;
        HIDWORD(v195) = *p_height2;
        v196 = 0;
        p_invalidDisparityMaskKernel = &v17->_disparity[1];
        v198 = 25;
        LODWORD(v199) = *p_width2;
        HIDWORD(v199) = *p_height2;
        p_bgFillXKernel = 0;
        p_disparityInScreenAspectRatio = (__CFString *)&v17->_disparityInScreenAspectRatio;
        v202 = 25;
        LODWORD(p_bgFillYKernel) = 2 * *p_width2;
        HIDWORD(p_bgFillYKernel) = 2 * *p_height2;
        v204 = 0;
        p_facemaskDisparity = &v17->_facemaskDisparity;
        p_internalDisparityToCanonicalDisparityKernel = 25;
        LODWORD(v207) = *p_width2;
        HIDWORD(v207) = *p_height2;
        v208 = 0;
        p_simpleConfidenceKernel = &v17->_filledDisparityTexture;
        v210 = 25;
        LODWORD(v211) = *p_width2;
        HIDWORD(v211) = *p_height2;
        p_roughDisparityKernel = 0;
        p_filledDisparityNoInvalidTexture = (__CFString *)&v17->_filledDisparityNoInvalidTexture;
        v214 = 25;
        LODWORD(p_diffusionMapKernel) = *p_width2;
        HIDWORD(p_diffusionMapKernel) = *p_height2;
        v216 = 0;
        p_temporallyFilteredDisparity = &v17->_temporallyFilteredDisparity;
        p_renderingDisparityDeweightKernel = 25;
        LODWORD(v219) = *p_width2;
        HIDWORD(v219) = *p_height2;
        v220 = 0;
        p_renderingDisparityFillAndFilterKernel = &v17->_disparityConfidenceMaskTexture;
        v222 = 25;
        LODWORD(v223) = *p_width2;
        HIDWORD(v223) = *p_height2;
        p_disparityCleanupKernel = 0;
        smoothConfidence = (__CFString *)v17->_smoothConfidence;
        v226 = 25;
        LODWORD(p_disparityCleanupKernel_firstFrame) = *p_width2;
        HIDWORD(p_disparityCleanupKernel_firstFrame) = *p_height2;
        v228 = 0;
        v229 = &v17->_smoothConfidence[1];
        p_updateConfidenceAndLastValidDisparityKernel = 25;
        LODWORD(v231) = *p_width2;
        HIDWORD(v231) = *p_height2;
        v232 = 0;
        p_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence = &v17->_colorSim;
        v234 = 10;
        LODWORD(v235) = *p_width2;
        HIDWORD(v235) = *p_height2;
        p_temporalDisparityFilterKernel = 0;
        smoothDisparity = (__CFString *)v17->_smoothDisparity;
        v238 = 55;
        LODWORD(p_temporalDisparityFilterKernel_fallbackToInvalid) = *p_width2;
        HIDWORD(p_temporalDisparityFilterKernel_fallbackToInvalid) = *p_height2;
        v240 = 0;
        v241 = &v17->_smoothDisparity[1];
        p_fillBackgroundDisparityKernel = 55;
        LODWORD(v243) = *p_width2;
        HIDWORD(v243) = *p_height2;
        v244 = 0;
        p_fillBackgroundDisparityKernel_faceMask = &v17->_roughDisparity;
        v246 = 25;
        LODWORD(v247) = *p_width2;
        HIDWORD(v247) = *p_height2;
        p_halfDownSampler = 0;
        p_outputCanonicalDisparity = (__CFString *)&v17->_outputCanonicalDisparity;
        v250 = 25;
        LODWORD(p_alphaFillKernel) = *p_width2;
        HIDWORD(p_alphaFillKernel) = *p_height2;
        v252 = 0;
        p_diffusionMapTexture = &v17->_diffusionMapTexture;
        p_rotateAndFitIntoRectKernel = 25;
        LODWORD(v255) = *p_width2;
        HIDWORD(v255) = *p_height2;
        v256 = 0;
        p_disparityIsValidTexture = &v17->_disparityIsValidTexture;
        v258 = 13;
        v259 = *p_width2;
        v260 = *p_height2;
        v261 = 0;
        p_distanceFromKnownDisparityTexture = &v17->_distanceFromKnownDisparityTexture;
        v263 = 25;
        v264 = *p_width2;
        v265 = *p_height2;
        v266 = 0;
        p_domainTransformXTexture = &v17->_domainTransformXTexture;
        v268 = 25;
        v269 = *p_width2;
        v270 = *p_height2;
        v271 = 0;
        p_domainTransformYTexture = &v17->_domainTransformYTexture;
        v273 = 25;
        v274 = *p_width2;
        v275 = *p_height2;
        v276 = 0;
        p_tempFloatR32FloatTexture = &v17->_tempFloatR32FloatTexture;
        v278 = 55;
        v279 = *p_width2;
        v280 = *p_height2;
        v281 = 0;
        p_edgeAwareFillTempTexture = &v17->_edgeAwareFillTempTexture;
        v283 = 25;
        v284 = *p_width2;
        v285 = *p_height2;
        v286 = 0;
        p_bgFillTempTexture = &v17->_bgFillTempTexture;
        v288 = 25;
        v289 = *p_width2;
        v290 = *p_height2;
        v291 = 0;
        p_invalidDisparityMaskTexture = &v17->_invalidDisparityMaskTexture;
        v293 = 13;
        v294 = *p_width2;
        v295 = *p_height2;
        v296 = 0;
        p_initDisparity = &v17->_initDisparity;
        v298 = 25;
        v299 = *p_width2;
        v300 = *p_height2;
        v301 = 0;
        p_isForegroundTexture = &v17->_isForegroundTexture;
        v303 = 13;
        v304 = *p_width2;
        v305 = *p_height2;
        v306 = 0;
        p_distanceToForegroundTexture = &v17->_distanceToForegroundTexture;
        v308 = 25;
        v309 = *p_width2;
        v310 = *p_height2;
        v311 = 0;
        p_correctlyRotatedAndReshapedSegmentation = &v17->_correctlyRotatedAndReshapedSegmentation;
        v313 = 25;
        v314 = *p_width2;
        v315 = *p_height2;
        v316 = 0;
        p_blurredBg = &v17->_blurredBg;
        v318 = 70;
        width = v17->_width;
        height = v17->_height;
        v321 = 0;
        p_deweightedDisparity = &v17->_deweightedDisparity;
        v323 = 65;
        v324 = *p_width2;
        v325 = *p_height2;
        v326 = 0;
        shift = v17->_shift;
        v328 = 65;
        v329 = *p_width2;
        v330 = *p_height2;
        v331 = 0;
        v332 = &v17->_shift[1];
        v333 = 65;
        v334 = *p_width2;
        v335 = *p_height2;
        v336 = 0;
        p_coc = &v17->_coc;
        v338 = 10;
        v339 = *p_width2;
        v340 = *p_height2;
        v341 = 0;
        sub_1B569EF8C(&__p, buf, 0x29uLL);
        v97 = (void ***)__p;
        v96 = v149;
        if (__p != v149)
        {
          do
          {
            sub_1B56A2A64(*p_device, (uint64_t)v97[1], *((int *)v97 + 4), *((int *)v97 + 5), (uint64_t)v97[3], a9);
            v98 = objc_claimAutoreleasedReturnValue();
            v99 = **v97;
            **v97 = (void *)v98;

            if (!**v97)
              goto LABEL_46;
            v97 += 4;
          }
          while (v97 != v96);
        }
        objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, *p_width2, *p_height2, 0);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "setUsage:", 7);
        v101 = objc_msgSend(*p_device, "newTextureWithDescriptor:", v100);
        facemaskRegionTexture = v17->_facemaskRegionTexture;
        v17->_facemaskRegionTexture = (MTLTexture *)v101;

        v103 = v17->_facemaskRegionTexture;
        v104 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_facemaskRegionTexture is nil"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 802, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1B5658D40(v103 == 0, a9, 0, 4294944382, v106);

        if (v103)
        {
          if (v17->_height >= v17->_width)
            v107 = v17->_width;
          else
            v107 = v17->_height;
          objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "setUsage:", 3);
          objc_msgSend(v108, "setMipmapLevelCount:", vcvtps_u32_f32(log2f((float)((unint64_t)v107 >> 3))));
          v109 = objc_msgSend(*p_device, "newTextureWithDescriptor:", v108);
          v110 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_bg is nil"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 816, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1B5658D40(v109 == 0, a9, 0, 4294944382, v112);

          if (v109)
          {
            bg = v17->_bg;
            v17->_bg = (MTLTexture *)v109;

            if (v141)
            {
LABEL_39:
              v114 = dispatch_semaphore_create(0);
              semaphore = v17->_semaphore;
              v17->_semaphore = (OS_dispatch_semaphore *)v114;

              v116 = dispatch_semaphore_create(5);
              renderingCallbackSemaphore = v17->_renderingCallbackSemaphore;
              v17->_renderingCallbackSemaphore = (OS_dispatch_semaphore *)v116;

              v118 = dispatch_queue_create("_synchronousRenderingCallbackQueue", 0);
              synchronousRenderingCallbackQueue = v17->_synchronousRenderingCallbackQueue;
              v17->_synchronousRenderingCallbackQueue = (OS_dispatch_queue *)v118;

              v120 = dispatch_semaphore_create(5);
              mattingCallbackSemaphore = v17->_mattingCallbackSemaphore;
              v17->_mattingCallbackSemaphore = (OS_dispatch_semaphore *)v120;

              v122 = dispatch_queue_create("_synchronousMattingCallbackQueue", 0);
              synchronousMattingCallbackQueue = v17->_synchronousMattingCallbackQueue;
              v17->_synchronousMattingCallbackQueue = (OS_dispatch_queue *)v122;

              v26 = v17;
              goto LABEL_47;
            }
            v124 = objc_alloc(MEMORY[0x1E0CC6E48]);
            LODWORD(v125) = 1053609165;
            v126 = objc_msgSend(v124, "initWithDevice:sigma:", *p_device, v125);
            smoothFilter = v17->_smoothFilter;
            v17->_smoothFilter = (MPSImageGaussianBlur *)v126;

            v128 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E10]), "initWithDevice:kernelWidth:kernelHeight:", *p_device, (unint64_t)(float)((float)(v17->_renderingDisparityBlurRadius * 2.0) + 1.0), (unint64_t)(float)((float)(v17->_renderingDisparityBlurRadius * 2.0) + 1.0));
            disparityBlurBoxKernel = v17->_disparityBlurBoxKernel;
            v17->_disparityBlurBoxKernel = (MPSImageBox *)v128;

            -[MPSImageBox setEdgeMode:](v17->_disparityBlurBoxKernel, "setEdgeMode:", 0);
            v130 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E10]), "initWithDevice:kernelWidth:kernelHeight:", *p_device, 7, 7);
            fgBlurBoxKernel = v17->_fgBlurBoxKernel;
            v17->_fgBlurBoxKernel = (MPSImageBox *)v130;

            -[MPSImageBox setEdgeMode:](v17->_fgBlurBoxKernel, "setEdgeMode:", 1);
            v132 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E00]), "initWithDevice:kernelWidth:kernelHeight:", *p_device, 3, 3);
            fgMaskErosionKernel = v17->_fgMaskErosionKernel;
            v17->_fgMaskErosionKernel = (MPSImageAreaMin *)v132;

            -[MPSImageAreaMin setEdgeMode:](v17->_fgMaskErosionKernel, "setEdgeMode:", 0);
            v134 = IOSurfaceAcceleratorCreate();
            v135 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create IOAccelerator"));
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "stringWithFormat:", CFSTR("Assertion failure in %s at %s:%d -- %@"), "-[VideoMattingMetal initWithStaticParams:renderingDisparityUpdateRate:renderingDisparityBlurRadius:renderingLensFocalLength_mm:useTemporalConfidence:metalContext:error:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/src/pipeline/VideoMattingMetal.mm", 850, v136);
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1B5658D40(v134 != 0, a9, 0, 4294944396, v137);

            if (!v134)
            {
              objc_msgSend(*p_commandQueue, "commandBuffer");
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v138, "setLabel:", CFSTR("MPS-prewarming"));
              sub_1B56A3104(v17->_disparityBlurBoxKernel, *p_device, v138, -[MTLTexture pixelFormat](v17->_deweightedDisparity, "pixelFormat"));
              LODWORD(v139) = *p_height2;
              -[VideoMattingMetal prewarmGuidedFilter:device:commandBuffer:width:height:width2:height2:](v17, "prewarmGuidedFilter:device:commandBuffer:width:height:width2:height2:", v17->_guidedFilter, *p_device, v138, v17->_width, v17->_height, *p_width2, v139);
              -[VideoMattingMetal encodeCopyTextureToCommandBuffer:inTexture:outTexture:](v17, "encodeCopyTextureToCommandBuffer:inTexture:outTexture:", v138, v17->_disparity[0], v17->_disparity[1]);
              objc_msgSend(v138, "commit");

              goto LABEL_39;
            }
          }
          else
          {

          }
        }
        else
        {

        }
LABEL_46:
        v26 = 0;
LABEL_47:
        if (__p)
        {
          v149 = (void ***)__p;
          operator delete(__p);
        }
LABEL_49:
        sub_1B569EFF8((void **)&v150);
        goto LABEL_41;
      }
    }
  }
  v26 = 0;
LABEL_5:

  return v26;
}

- (void)dealloc
{
  __CVBuffer **scaledSourceCV;
  __CVBuffer *v4;
  __CVBuffer *v5;
  __CVBuffer *yuvSourceDownsampledBuffer;
  __IOSurfaceAccelerator *hwScaler;
  __CVMetalTextureCache *textureCache;
  objc_super v9;

  scaledSourceCV = self->_scaledSourceCV;
  v4 = self->_scaledSourceCV[0];
  if (v4)
    CVPixelBufferRelease(v4);
  v5 = scaledSourceCV[1];
  if (v5)
    CVPixelBufferRelease(v5);
  yuvSourceDownsampledBuffer = self->_yuvSourceDownsampledBuffer;
  if (yuvSourceDownsampledBuffer)
    CVPixelBufferRelease(yuvSourceDownsampledBuffer);
  hwScaler = self->_hwScaler;
  if (hwScaler)
  {
    CFRelease(hwScaler);
    self->_hwScaler = 0;
  }
  textureCache = self->_textureCache;
  if (textureCache)
    CFRelease(textureCache);
  v9.receiver = self;
  v9.super_class = (Class)VideoMattingMetal;
  -[ImageSaverRegistrator dealloc](&v9, sel_dealloc);
}

- (void)prewarmGuidedFilter:(id)a3 device:(id)a4 commandBuffer:(id)a5 width:(int)a6 height:(int)a7 width2:(int)a8 height2:(int)a9
{
  id v15;
  id v16;
  id v17;
  int v18;
  int v19;
  double v20;
  void ***v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void **v25;
  void *v26;
  double v27;
  id v28;
  id v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v28 = 0;
  v29 = 0;
  objc_msgSend(v15, "epsilon");
  v19 = v18;
  LODWORD(v20) = 1008981770;
  objc_msgSend(v15, "setEpsilon:", v20);
  v21 = (void ***)operator new(0x40uLL);
  *v21 = &v29;
  v21[1] = (void **)70;
  *((_DWORD *)v21 + 4) = a8;
  *((_DWORD *)v21 + 5) = a9;
  v21[3] = 0;
  v21[4] = &v28;
  v21[5] = (void **)70;
  *((_DWORD *)v21 + 12) = a6;
  *((_DWORD *)v21 + 13) = a7;
  v21[7] = 0;
  sub_1B56A2BD0(v16, 70, a8, a9, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = **v21;
  **v21 = (void *)v22;

  if (*v21)
  {
    sub_1B56A2BD0(v16, (uint64_t)v21[5], *((int *)v21 + 12), *((int *)v21 + 13), 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v21[4];
    v26 = *v25;
    *v25 = (void *)v24;

    if (v21[4])
    {
      objc_msgSend(v15, "encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:", v17, self->_gfForegroundMask, v29, self->_gfWeight, self->_coeff);
      objc_msgSend(v15, "encodeReconstructionToCommandBuffer:guidanceTexture:coefficientsTexture:destinationTexture:", v17, v28, self->_coeffHistory[0], self->_alphaNoPostprocessing);
      LODWORD(v27) = v19;
      objc_msgSend(v15, "setEpsilon:", v27);
    }
  }
  operator delete(v21);

}

- (void)setAlphaLut:(float)a3 gammaExponent:(float)a4
{
  void *v8;

  if (a3 != 2.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 959, CFSTR("contrastExponent value %f is not supported"), a3);

  }
  self->_gammaExponent = a4;
}

- (void)setBgLut:(id)a3
{
  NSData *v5;
  MTLTexture *v6;
  MTLTexture *bgColorLut;
  NSData *v8;

  v5 = (NSData *)a3;
  if (self->_lastBgLutData != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_lastBgLutData, a3);
    sub_1B56A2BF0(v8, self->_device);
    v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    bgColorLut = self->_bgColorLut;
    self->_bgColorLut = v6;

    v5 = v8;
  }

}

- (void)setFgLut:(id)a3
{
  NSData *v5;
  MTLTexture *v6;
  MTLTexture *fgColorLut;
  NSData *v8;

  v5 = (NSData *)a3;
  if (self->_lastFgLutData != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_lastFgLutData, a3);
    sub_1B56A2BF0(v8, self->_device);
    v6 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    fgColorLut = self->_fgColorLut;
    self->_fgColorLut = v6;

    v5 = v8;
  }

}

- (void)setPortraitForegroundCubeData:(id)a3 backgroundCubeData:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  self->_isBgColorLutBlack = 0;
  -[VideoMattingMetal setFgLut:](self, "setFgLut:", v7);
  -[VideoMattingMetal setBgLut:](self, "setBgLut:", v6);

}

- (void)setStageLightProxyCubeData:(id)a3 cubeData:(id)a4
{
  NSData *v7;
  MTLTexture *v8;
  MTLTexture *stageLightProxyLut;
  MTLTexture *v10;
  MTLTexture *stageLightLut;
  NSData *v12;

  v12 = (NSData *)a3;
  v7 = (NSData *)a4;
  self->_isBgColorLutBlack = 1;
  if (self->_lastStageLightProxyCubeData != v12)
  {
    objc_storeStrong((id *)&self->_lastStageLightProxyCubeData, a3);
    sub_1B56A2BF0(v12, self->_device);
    v8 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    stageLightProxyLut = self->_stageLightProxyLut;
    self->_stageLightProxyLut = v8;

  }
  if (self->_lastStageLightCubeData != v7)
  {
    objc_storeStrong((id *)&self->_lastStageLightCubeData, a4);
    sub_1B56A2BF0(v7, self->_device);
    v10 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    stageLightLut = self->_stageLightLut;
    self->_stageLightLut = v10;

  }
}

- (void)encodeCopyTextureToCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "width");
  v11 = objc_msgSend(v8, "height");
  v12 = objc_msgSend(v8, "depth");
  objc_msgSend(v7, "blitCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v16, 0, sizeof(v16));
  v15[0] = v10;
  v15[1] = v11;
  v15[2] = v12;
  memset(v14, 0, sizeof(v14));
  objc_msgSend(v13, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v8, 0, 0, v16, v15, v9, 0, 0, v14);
  objc_msgSend(v13, "endEncoding");

}

- (void)encodeColorSimToCommandBuffer:(id)a3 prevSource:(id)a4 currSource:(id)a5 destination:(id)a6 similarityScaleFactor:(float)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];
  float v19;
  BOOL v20;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19 = a7;
  v20 = v12 == 0;
  objc_msgSend(a3, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLabel:", CFSTR("_colorSimKernel"));
  objc_msgSend(v15, "setComputePipelineState:", self->_colorSimKernel);
  objc_msgSend(v15, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v15, "setTexture:atIndex:", v14, 2);
  objc_msgSend(v15, "setBytes:length:atIndex:", &v19, 8, 0);
  v18[0] = (unint64_t)(objc_msgSend(v14, "width") + 15) >> 4;
  v18[1] = (unint64_t)(objc_msgSend(v14, "height") + 15) >> 4;
  v18[2] = 1;
  v17 = 1;
  v16 = xmmword_1B56AC968;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v15, "endEncoding");

}

- (void)encodeColorSimL1ToCommandBuffer:(id)a3 prevSource:(id)a4 currSource:(id)a5 destination:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  int v17;
  BOOL v18;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17 = 1084227584;
  v18 = v10 == 0;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", CFSTR("_colorSimL1Kernel"));
  objc_msgSend(v13, "setComputePipelineState:", self->_colorSimL1Kernel);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 2);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v17, 8, 0);
  v16[0] = (unint64_t)(objc_msgSend(v12, "width") + 15) >> 4;
  v16[1] = (unint64_t)(objc_msgSend(v12, "height") + 15) >> 4;
  v16[2] = 1;
  v15 = 1;
  v14 = xmmword_1B56AC968;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v16, &v14);
  objc_msgSend(v13, "endEncoding");

}

- (void)encodeDisparityCleanupToCommandBuffer:(id)a3 prevDisparity:(id)a4 currDisparity:(id)a5 colorSim:(id)a6 cleanDisparity:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int *v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[3];
  uint64_t v22;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v22 = 0x3F0000003D4CCCCDLL;
  objc_msgSend(a3, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (self->_frameIndex)
  {
    objc_msgSend(v16, "setLabel:", CFSTR("_disparityCleanupKernel"));
    v18 = &OBJC_IVAR___VideoMattingMetal__disparityCleanupKernel;
  }
  else
  {
    objc_msgSend(v16, "setLabel:", CFSTR("_disparityCleanupKernel_firstFrame"));
    v18 = &OBJC_IVAR___VideoMattingMetal__disparityCleanupKernel_firstFrame;
  }
  objc_msgSend(v17, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v18));
  objc_msgSend(v17, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v17, "setTexture:atIndex:", v12, 1);
  objc_msgSend(v17, "setTexture:atIndex:", v13, 2);
  objc_msgSend(v17, "setTexture:atIndex:", v14, 3);
  objc_msgSend(v17, "setTexture:atIndex:", v15, 4);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v22, 8, 0);
  v21[0] = (unint64_t)(objc_msgSend(v15, "width") + 15) >> 4;
  v21[1] = (unint64_t)(objc_msgSend(v15, "height") + 15) >> 4;
  v21[2] = 1;
  v20 = 1;
  v19 = xmmword_1B56AC968;
  objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v21, &v19);
  objc_msgSend(v17, "endEncoding");

}

- (void)encodeDomainTransformToCommandBuffer:(id)a3 inputDiffusionMap:(id)a4 inputDistanceFromKnownDisparity:(id)a5 outputDomainTransformX:(id)a6 outputDomainTransformY:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  int64x2_t v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  int v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26 = 1087373312;
  objc_msgSend(v12, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLabel:", CFSTR("_domainTransformXKernel"));
  objc_msgSend(v17, "setComputePipelineState:", self->_domainTransformXKernel);
  objc_msgSend(v17, "setTexture:atIndex:", v13, 0);
  objc_msgSend(v17, "setTexture:atIndex:", v14, 1);
  objc_msgSend(v17, "setTexture:atIndex:", v15, 2);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v26, 4, 0);
  v25[0] = 1;
  v25[1] = (unint64_t)(objc_msgSend(v15, "height") + 31) >> 5;
  v25[2] = 1;
  v24 = 1;
  v23 = xmmword_1B56AC938;
  objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v25, &v23);
  objc_msgSend(v17, "endEncoding");
  objc_msgSend(v12, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setLabel:", CFSTR("_domainTransformYKernel"));
  objc_msgSend(v18, "setComputePipelineState:", self->_domainTransformYKernel);
  objc_msgSend(v18, "setTexture:atIndex:", v13, 0);
  objc_msgSend(v18, "setTexture:atIndex:", v14, 1);
  objc_msgSend(v18, "setTexture:atIndex:", v16, 2);
  objc_msgSend(v18, "setBytes:length:atIndex:", &v26, 4, 0);
  v22 = vdupq_n_s64(1uLL);
  v20 = 1;
  v21 = (unint64_t)(objc_msgSend(v16, "width") + 31) >> 5;
  v19 = xmmword_1B56AC950;
  objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", &v21, &v19);
  objc_msgSend(v18, "endEncoding");

}

- (void)encodeEdgeAwareFillToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputDomainTransformX:(id)a5 inputDomainTransformY:(id)a6 outputDisparity:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[3];
  __int128 v24;
  uint64_t v25;
  _QWORD v26[3];
  __int128 v27;
  uint64_t v28;
  _QWORD v29[3];
  __int128 v30;
  uint64_t v31;
  _QWORD v32[3];
  _QWORD v33[2];

  v12 = a3;
  v19 = a4;
  v13 = a5;
  v14 = a6;
  v20 = a7;
  v33[0] = 0x141700000;
  objc_msgSend(v12, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLabel:", CFSTR("_edgeAwareFillXKernel"));
  objc_msgSend(v15, "setComputePipelineState:", self->_edgeAwareFillXKernel);
  objc_msgSend(v15, "setTexture:atIndex:", v19, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v15, "setTexture:atIndex:", self->_edgeAwareFillTempTexture, 2);
  objc_msgSend(v15, "setBytes:length:atIndex:", v33, 8, 0);
  v32[0] = (((unint64_t)objc_msgSend(v13, "width") >> 1) + 15) >> 4;
  v32[1] = (unint64_t)(objc_msgSend(v13, "height") + 15) >> 4;
  v32[2] = 1;
  v31 = 1;
  v30 = xmmword_1B56AC968;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v32, &v30);
  objc_msgSend(v15, "endEncoding");
  objc_msgSend(v12, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setLabel:", CFSTR("_edgeAwareFillYKernel"));
  objc_msgSend(v16, "setComputePipelineState:", self->_edgeAwareFillYKernel);
  objc_msgSend(v16, "setTexture:atIndex:", self->_edgeAwareFillTempTexture, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v14, 1);
  objc_msgSend(v16, "setTexture:atIndex:", v20, 2);
  objc_msgSend(v16, "setBytes:length:atIndex:", v33, 8, 0);
  v29[0] = (unint64_t)(objc_msgSend(v14, "width") + 15) >> 4;
  v29[1] = (((unint64_t)objc_msgSend(v14, "height") >> 1) + 15) >> 4;
  v29[2] = 1;
  v28 = 1;
  v27 = xmmword_1B56AC968;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v29, &v27);
  objc_msgSend(v16, "endEncoding");
  objc_msgSend(v12, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setLabel:", CFSTR("_edgeAwareFillXKernel"));
  objc_msgSend(v17, "setComputePipelineState:", self->_edgeAwareFillXKernel);
  objc_msgSend(v17, "setTexture:atIndex:", v20, 0);
  objc_msgSend(v17, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v17, "setTexture:atIndex:", self->_edgeAwareFillTempTexture, 2);
  objc_msgSend(v17, "setBytes:length:atIndex:", v33, 8, 0);
  v26[0] = (((unint64_t)objc_msgSend(v13, "width") >> 1) + 15) >> 4;
  v26[1] = (unint64_t)(objc_msgSend(v13, "height") + 15) >> 4;
  v26[2] = 1;
  v25 = 1;
  v24 = xmmword_1B56AC968;
  objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v26, &v24);
  objc_msgSend(v17, "endEncoding");
  objc_msgSend(v12, "computeCommandEncoder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setLabel:", CFSTR("_edgeAwareFillYKernel"));
  objc_msgSend(v18, "setComputePipelineState:", self->_edgeAwareFillYKernel);
  objc_msgSend(v18, "setTexture:atIndex:", self->_edgeAwareFillTempTexture, 0);
  objc_msgSend(v18, "setTexture:atIndex:", v14, 1);
  objc_msgSend(v18, "setTexture:atIndex:", v20, 2);
  objc_msgSend(v18, "setBytes:length:atIndex:", v33, 8, 0);
  v23[0] = (unint64_t)(objc_msgSend(v14, "width") + 15) >> 4;
  v23[1] = (((unint64_t)objc_msgSend(v14, "height") >> 1) + 15) >> 4;
  v23[2] = 1;
  v22 = 1;
  v21 = xmmword_1B56AC968;
  objc_msgSend(v18, "dispatchThreadgroups:threadsPerThreadgroup:", v23, &v21);
  objc_msgSend(v18, "endEncoding");

}

- (void)encodeInvalidDisparityMaskToCommandBuffer:(id)a3 inputDisparity:(id)a4 outputMask:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabel:", CFSTR("_invalidDisparityMaskKernel"));
  objc_msgSend(v10, "setComputePipelineState:", self->_invalidDisparityMaskKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  v13[0] = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v13[1] = (unint64_t)(objc_msgSend(v8, "height") + 15) >> 4;
  v13[2] = 1;
  v12 = 1;
  v11 = xmmword_1B56AC968;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, &v11);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeBackgroundFillToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputMask:(id)a5 outputDisparity:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  int64x2_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLabel:", CFSTR("_bgFillYKernel"));
  objc_msgSend(v14, "setComputePipelineState:", self->_bgFillYKernel);
  objc_msgSend(v14, "setTexture:atIndex:", v11, 0);
  objc_msgSend(v14, "setTexture:atIndex:", v12, 1);
  objc_msgSend(v14, "setTexture:atIndex:", self->_bgFillTempTexture, 2);
  v22 = vdupq_n_s64(1uLL);
  v20 = 1;
  v21 = (unint64_t)(objc_msgSend(v11, "width") + 31) >> 5;
  v19 = xmmword_1B56AC950;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v21, &v19);
  objc_msgSend(v14, "endEncoding");
  objc_msgSend(v10, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setLabel:", CFSTR("_bgFillXKernel"));
  objc_msgSend(v15, "setComputePipelineState:", self->_bgFillXKernel);
  objc_msgSend(v15, "setTexture:atIndex:", self->_bgFillTempTexture, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v12, 1);
  objc_msgSend(v15, "setTexture:atIndex:", v13, 2);
  v18[0] = 1;
  v18[1] = (unint64_t)(objc_msgSend(v11, "height") + 31) >> 5;
  v18[2] = 1;
  v17 = 1;
  v16 = xmmword_1B56AC938;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v15, "endEncoding");

}

- (void)encodeSimpleConfidenceToCommandBuffer:(id)a3 disparity:(id)a4 outConfidence:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabel:", CFSTR("_simpleConfidenceKernel"));
  objc_msgSend(v10, "setComputePipelineState:", self->_simpleConfidenceKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  v13[0] = (unint64_t)(objc_msgSend(v8, "width") + 15) >> 4;
  v13[1] = (unint64_t)(objc_msgSend(v8, "height") + 15) >> 4;
  v13[2] = 1;
  v12 = 1;
  v11 = xmmword_1B56AC968;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, &v11);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeUpdateConfidenceAndLastValidDisparityToCommandBuffer:(id)a3 disparity:(id)a4 prevSmoothConfidence:(id)a5 lastValidDisparityIn:(id)a6 lastValidDisparityOut:(id)a7 currConfidenceOut:(id)a8 useTemporalConfidence:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int *v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[3];
  BOOL v26;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26 = self->_frameIndex == 0;
  objc_msgSend(a3, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a9)
  {
    objc_msgSend(v20, "setLabel:", CFSTR("_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence"));
    v22 = &OBJC_IVAR___VideoMattingMetal__updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence;
  }
  else
  {
    objc_msgSend(v20, "setLabel:", CFSTR("_updateConfidenceAndLastValidDisparityKernel"));
    v22 = &OBJC_IVAR___VideoMattingMetal__updateConfidenceAndLastValidDisparityKernel;
  }
  objc_msgSend(v21, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v22));
  objc_msgSend(v21, "setTexture:atIndex:", v15, 0);
  objc_msgSend(v21, "setTexture:atIndex:", v16, 1);
  objc_msgSend(v21, "setTexture:atIndex:", v17, 2);
  objc_msgSend(v21, "setTexture:atIndex:", v18, 3);
  objc_msgSend(v21, "setTexture:atIndex:", v19, 4);
  objc_msgSend(v21, "setBytes:length:atIndex:", &v26, 1, 0);
  v25[0] = (unint64_t)(objc_msgSend(v15, "width") + 15) >> 4;
  v25[1] = (unint64_t)(objc_msgSend(v15, "height") + 15) >> 4;
  v25[2] = 1;
  v24 = 1;
  v23 = xmmword_1B56AC968;
  objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", v25, &v23);
  objc_msgSend(v21, "endEncoding");

}

- (void)encodeDisparityTemporalFilterToCommandBuffer:(id)a3 currentDisparity:(id)a4 previousDisparity:(id)a5 currConfidence:(id)a6 prevSmoothConfidence:(id)a7 colorSim:(id)a8 outPrevSmoothConfidence:(id)a9 outTemporallyFilteredDisparity:(id)a10 disparityFallbackToInvalid:(BOOL)a11 disparityFilterUpdateRate:(float)a12 minimumConfidenceToKeepDisparity:(float)a13 maximumSimilarityToKeepDisparity:(float)a14
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  int *v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[3];
  _DWORD v36[3];

  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a9;
  v29 = a10;
  *(float *)v36 = a12;
  *(float *)&v36[1] = a13;
  *(float *)&v36[2] = a14;
  objc_msgSend(a3, "computeCommandEncoder");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (a11)
  {
    objc_msgSend(v30, "setLabel:", CFSTR("_temporalDisparityFilterKernel_fallbackToInvalid"));
    v32 = &OBJC_IVAR___VideoMattingMetal__temporalDisparityFilterKernel_fallbackToInvalid;
  }
  else
  {
    objc_msgSend(v30, "setLabel:", CFSTR("_temporalDisparityFilterKernel"));
    v32 = &OBJC_IVAR___VideoMattingMetal__temporalDisparityFilterKernel;
  }
  objc_msgSend(v31, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v32));
  objc_msgSend(v31, "setTexture:atIndex:", v23, 0);
  objc_msgSend(v31, "setTexture:atIndex:", v24, 1);
  objc_msgSend(v31, "setTexture:atIndex:", v25, 2);
  objc_msgSend(v31, "setTexture:atIndex:", v27, 3);
  objc_msgSend(v31, "setTexture:atIndex:", v26, 4);
  objc_msgSend(v31, "setTexture:atIndex:", v29, 5);
  objc_msgSend(v31, "setTexture:atIndex:", v28, 6);
  objc_msgSend(v31, "setBytes:length:atIndex:", v36, 12, 0);
  v35[0] = (unint64_t)(objc_msgSend(v29, "width") + 15) >> 4;
  v35[1] = (unint64_t)(objc_msgSend(v29, "height") + 15) >> 4;
  v35[2] = 1;
  v34 = 1;
  v33 = xmmword_1B56AC968;
  objc_msgSend(v31, "dispatchThreadgroups:threadsPerThreadgroup:", v35, &v33);
  objc_msgSend(v31, "endEncoding");

}

- (void)encodeDiffusionMapToCommandBuffer:(id)a3 color:(id)a4 diffusionMap:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];
  unint64_t v14;

  v8 = a4;
  v9 = a5;
  v14 = 0xC1A000003A83126FLL;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLabel:", CFSTR("_diffusionMapKernel"));
  objc_msgSend(v10, "setComputePipelineState:", self->_diffusionMapKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v8, 0);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 1);
  objc_msgSend(v10, "setBytes:length:atIndex:", &v14, 8, 0);
  v13[0] = (unint64_t)(objc_msgSend(v9, "width") + 15) >> 4;
  v13[1] = (unint64_t)(objc_msgSend(v9, "height") + 15) >> 4;
  v13[2] = 1;
  v12 = 1;
  v11 = xmmword_1B56AC968;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v13, &v11);
  objc_msgSend(v10, "endEncoding");

}

- (void)encodeDisparityMasksToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 outputForegroundMask:(id)a7 outputIsForeground:(id)a8 disparityMin:(float)a9 focusDisparity:(float)a10 hardness:(float)a11 minDistToDeweight:(float)a12 unconfidentWeight:(float)a13
{
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[3];
  _DWORD v32[5];
  BOOL v33;

  v24 = a4;
  v25 = a5;
  v26 = a7;
  v27 = a8;
  *(float *)v32 = a9;
  *(float *)&v32[1] = 1.0 / fmaxf((float)(a10 - a9) * (float)(1.0 - a11), 0.001);
  *(float *)&v32[2] = a10;
  *(float *)&v32[3] = a12;
  *(float *)&v32[4] = a13;
  v33 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLabel:", CFSTR("_disparityMasksKernel"));
  objc_msgSend(v28, "setComputePipelineState:", self->_disparityMasksKernel);
  objc_msgSend(v28, "setTexture:atIndex:", v24, 0);
  objc_msgSend(v28, "setTexture:atIndex:", v25, 1);
  objc_msgSend(v28, "setTexture:atIndex:", v26, 2);
  objc_msgSend(v28, "setTexture:atIndex:", v27, 3);
  objc_msgSend(v28, "setBytes:length:atIndex:", v32, 24, 0);
  v31[0] = (unint64_t)(objc_msgSend(v24, "width") + 15) >> 4;
  v31[1] = (unint64_t)(objc_msgSend(v24, "height") + 15) >> 4;
  v31[2] = 1;
  v30 = 1;
  v29 = xmmword_1B56AC968;
  objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", v31, &v29);
  objc_msgSend(v28, "endEncoding");

}

- (void)encodeFillBackgroundDisparityToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputFacemask:(id)a5 outputDistanceFromKnownDisparity:(id)a6 outputDisparity:(id)a7 backgroundDisparityValue:(float)a8 minimumDistanceFromValidDisparity:(float)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int *v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[3];
  __int128 v27;
  uint64_t v28;
  _QWORD v29[3];
  _DWORD v30[2];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  *(float *)v30 = a9;
  *(float *)&v30[1] = a8;
  objc_msgSend(v16, "computeCommandEncoder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLabel:", CFSTR("_disparityIsValidKernel"));
  objc_msgSend(v21, "setComputePipelineState:", self->_disparityIsValidKernel);
  objc_msgSend(v21, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v21, "setTexture:atIndex:", self->_disparityIsValidTexture, 1);
  v29[0] = (unint64_t)(objc_msgSend(v17, "width") + 15) >> 4;
  v29[1] = (unint64_t)(objc_msgSend(v17, "height") + 15) >> 4;
  v29[2] = 1;
  v28 = 1;
  v27 = xmmword_1B56AC968;
  objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", v29, &v27);
  objc_msgSend(v21, "endEncoding");
  -[CVAFilterDistanceTransform encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_distanceTransform, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v16, self->_disparityIsValidTexture, v19);
  objc_msgSend(v16, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v22, "setLabel:", CFSTR("_fillBackgroundDisparityKernel_faceMask"));
    v23 = &OBJC_IVAR___VideoMattingMetal__fillBackgroundDisparityKernel_faceMask;
  }
  else
  {
    objc_msgSend(v22, "setLabel:", CFSTR("_fillBackgroundDisparityKernel"));
    v23 = &OBJC_IVAR___VideoMattingMetal__fillBackgroundDisparityKernel;
  }
  objc_msgSend(v22, "setComputePipelineState:", *(Class *)((char *)&self->super.super.isa + *v23));
  objc_msgSend(v22, "setTexture:atIndex:", v17, 0);
  objc_msgSend(v22, "setTexture:atIndex:", v18, 1);
  objc_msgSend(v22, "setTexture:atIndex:", v19, 2);
  objc_msgSend(v22, "setTexture:atIndex:", v20, 3);
  objc_msgSend(v22, "setBytes:length:atIndex:", v30, 8, 0);
  v26[0] = (unint64_t)(objc_msgSend(v20, "width") + 15) >> 4;
  v26[1] = (unint64_t)(objc_msgSend(v20, "height") + 15) >> 4;
  v26[2] = 1;
  v25 = 1;
  v24 = xmmword_1B56AC968;
  objc_msgSend(v22, "dispatchThreadgroups:threadsPerThreadgroup:", v26, &v24);
  objc_msgSend(v22, "endEncoding");

}

- (void)encodeConfidenceMaskToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputDisparityNoInvalid:(id)a5 outputConfidenceMask:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  uint64_t v17;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v17 = 0x3F800000C59F6000;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", CFSTR("_disparityConfidenceMaskKernel"));
  objc_msgSend(v13, "setComputePipelineState:", self->_disparityConfidenceMaskKernel);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setTexture:atIndex:", v12, 2);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v17, 8, 0);
  v16[0] = (unint64_t)(objc_msgSend(v12, "width") + 15) >> 4;
  v16[1] = (unint64_t)(objc_msgSend(v12, "height") + 15) >> 4;
  v16[2] = 1;
  v15 = 1;
  v14 = xmmword_1B56AC968;
  objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v16, &v14);
  objc_msgSend(v13, "endEncoding");

}

- (void)encodeOutputDisparityToCommandBuffer:(id)a3 inputDisparity:(id)a4 outputDisparity:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v11, "pixelFormat") != 25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 1511, CFSTR("Output disparity texture should be MTLPixelFormatR16Float (%lu), but is %lu"), 25, objc_msgSend(v11, "pixelFormat"));

  }
  objc_msgSend(v9, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLabel:", CFSTR("_internalDisparityToCanonicalDisparityKernel"));
  objc_msgSend(v12, "setComputePipelineState:", self->_internalDisparityToCanonicalDisparityKernel);
  objc_msgSend(v12, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v12, "setTexture:atIndex:", self->_outputCanonicalDisparity, 1);
  v13 = -[MTLTexture width](self->_outputCanonicalDisparity, "width");
  v14 = -[MTLTexture height](self->_outputCanonicalDisparity, "height");
  v18[0] = (unint64_t)(v13 + 15) >> 4;
  v18[1] = (unint64_t)(v14 + 15) >> 4;
  v18[2] = 1;
  v17 = 1;
  v16 = xmmword_1B56AC968;
  objc_msgSend(v12, "dispatchThreadgroups:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v12, "endEncoding");
  -[CVAFilterHybridResampling encodeBilinearScalingToCommandBuffer:source:destination:mode:](self->_hybridResampler, "encodeBilinearScalingToCommandBuffer:source:destination:mode:", v9, self->_outputCanonicalDisparity, v11, 2);

}

- (void)segmentationAverage:(__CVBuffer *)a3 callbackQueue:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  MTLBuffer *v10;
  MTLBuffer *foregroundRatioBuffer;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a4;
  v9 = a5;
  if (!self->_foregroundRatioBuffer)
  {
    v10 = (MTLBuffer *)-[MTLDeviceSPI newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0);
    foregroundRatioBuffer = self->_foregroundRatioBuffer;
    self->_foregroundRatioBuffer = v10;

  }
  sub_1B56A2634(a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a3, v12, 0, self->_textureCache);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLabel:", CFSTR("segmentationAverage"));
  -[GlobalReductionAverage parallelReductionAverage:inTexture:outGlobalAverage:](self->_globalReductionAverage, "parallelReductionAverage:inTexture:outGlobalAverage:", v14, v13, self->_foregroundRatioBuffer);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B569ED20;
  v17[3] = &unk_1E6937088;
  v17[4] = self;
  v15 = v8;
  v18 = v15;
  v16 = v9;
  v19 = v16;
  objc_msgSend(v14, "addCompletedHandler:", v17);
  objc_msgSend(v14, "commit");

}

- (id)disparityPostprocessingWithCanonicalDisparity:(const __CVBuffer *)a3 color:(const __CVBuffer *)a4 postProcessedDisparity:(__CVBuffer *)a5 staticParams:(const VideoMattingStaticParams *)a6 dynamicParams:(const void *)a7 postProcessingParams:(const VideoPostprocessingParams *)a8 facesArray:(id)a9 faceModel:(id)a10 isFinalStage:(BOOL)a11 callbackQueue:(id)a12 callback:(id)a13
{
  MTLTexture **disparity;
  char *BaseAddress;
  size_t v20;
  size_t v21;
  size_t BytesPerRow;
  char *v23;
  size_t v24;
  int v25;
  int v26;
  float v27;
  float v28;
  float v30;
  double v31;
  double v32;
  double v33;
  float v34;
  float v35;
  double v36;
  uint64_t v44;
  uint64_t v45;
  BOOL v48;
  _BOOL4 v50;
  int v51;
  unint64_t frameIndex;
  MTLTexture *v53;
  MTLTexture **smoothConfidence;
  _BOOL8 v55;
  MTLTexture *v56;
  MTLTexture **v57;
  MTLTexture **v58;
  double v59;
  double v60;
  double v61;
  unint64_t v62;
  MTLTexture *v63;
  _BOOL8 v64;
  MTLTexture *disparityConfidenceMaskTexture;
  MTLTexture *v66;
  uint64_t v67;
  uint64_t v68;
  long double v73;
  long double v75;
  uint64_t v76;
  uint64_t v77;
  float v78;
  MTLTexture *facemaskDisparity;
  MTLTexture *temporallyFilteredDisparity;
  MTLTexture *v86;
  MTLTexture *v87;
  double v88;
  double v89;
  MTLTexture *facemaskRegionTexture;
  MTLTexture **p_filledDisparityTexture;
  size_t Width;
  size_t Height;
  void *v94;
  void *v95;
  id v96;
  id v97;
  MTLTexture *v98;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  id v104;
  void *v107;
  float v108;
  float v109;
  double v110;
  float v112;
  _QWORD v113[5];
  id v114;
  id v115;
  const __CVBuffer *v116;
  __CVBuffer *v117;

  v104 = a12;
  v103 = a13;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setLabel:", CFSTR("disparityPostprocessingWithCanonicalDisparity"));
  -[VideoMattingMetal encodeScaleSourceToCommandBuffer:source:targetWidth:targetHeight:](self, "encodeScaleSourceToCommandBuffer:source:targetWidth:targetHeight:", v107, a4, self->_width2, self->_height2);
  disparity = self->_disparity;
  -[VideoMattingMetal encodeDisparityDecimateToCommandBuffer:canonicalDisparity:disparityOut:](self, "encodeDisparityDecimateToCommandBuffer:canonicalDisparity:disparityOut:", v107, a3, self->_disparity[self->_frameIndex & 1]);
  if (!self->_sdofRenderingHasForegroundBlur)
  {
    if (self->_doDisparityDiffusion
      && ((v50 = -[VideoMattingMetal bypassShiftCleanup](self, "bypassShiftCleanup"), !*((_BYTE *)a7 + 80))
        ? (v51 = 1)
        : (v51 = v50),
          v51 != 1))
    {
      if (self->_doDisparityDiffusion)
      {
        -[VideoMattingMetal encodeDiffusionMapToCommandBuffer:color:diffusionMap:](self, "encodeDiffusionMapToCommandBuffer:color:diffusionMap:", v107, self->_scaledSource[self->_frameIndex & 1], self->_diffusionMapTexture);
        frameIndex = self->_frameIndex;
        v53 = disparity[frameIndex & 1];
        if (a8->useTemporalRejection)
        {
          smoothConfidence = self->_smoothConfidence;
          v55 = !(frameIndex & 1);
          v56 = self->_smoothConfidence[v55];
          v57 = &self->_disparityLastValidValue[v55];
          if (frameIndex)
            v58 = v57;
          else
            v58 = self->_disparity;
          LOBYTE(v101) = self->_useTemporalConfidence;
          -[VideoMattingMetal encodeUpdateConfidenceAndLastValidDisparityToCommandBuffer:disparity:prevSmoothConfidence:lastValidDisparityIn:lastValidDisparityOut:currConfidenceOut:useTemporalConfidence:](self, "encodeUpdateConfidenceAndLastValidDisparityToCommandBuffer:disparity:prevSmoothConfidence:lastValidDisparityIn:lastValidDisparityOut:currConfidenceOut:useTemporalConfidence:", v107, v53, v56, *v58, self->_disparityLastValidValue[self->_frameIndex & 1], self->_disparityConfidenceMaskTexture, v101);
          v62 = self->_frameIndex;
          v63 = disparity[v62 & 1];
          if (v62)
          {
            v64 = !(v62 & 1);
            disparity = &self->_smoothDisparity[v64];
            disparityConfidenceMaskTexture = self->_disparityConfidenceMaskTexture;
            v66 = smoothConfidence[v64];
          }
          else
          {
            disparityConfidenceMaskTexture = self->_disparityConfidenceMaskTexture;
            v66 = disparityConfidenceMaskTexture;
          }
          *(float *)&v59 = a6->shiftFilterUpdateRate;
          *(float *)&v60 = a6->minimumConfidenceToKeepDisparity;
          *(float *)&v61 = a6->maximumSimilarityToKeepDisparity;
          LOBYTE(v102) = self->_isBgColorLutBlack;
          -[VideoMattingMetal encodeDisparityTemporalFilterToCommandBuffer:currentDisparity:previousDisparity:currConfidence:prevSmoothConfidence:colorSim:outPrevSmoothConfidence:outTemporallyFilteredDisparity:disparityFallbackToInvalid:disparityFilterUpdateRate:minimumConfidenceToKeepDisparity:maximumSimilarityToKeepDisparity:](self, "encodeDisparityTemporalFilterToCommandBuffer:currentDisparity:previousDisparity:currConfidence:prevSmoothConfidence:colorSim:outPrevSmoothConfidence:outTemporallyFilteredDisparity:disparityFallbackToInvalid:disparityFilterUpdateRate:minimumConfidenceToKeepDisparity:maximumSimilarityToKeepDisparity:", v107, v63, *disparity, disparityConfidenceMaskTexture, v66, self->_colorSim, v59, v60, v61, smoothConfidence[v62 & 1], self->_temporallyFilteredDisparity, v102);
        }
        else
        {
          -[VideoMattingMetal encodeCopyTextureToCommandBuffer:inTexture:outTexture:](self, "encodeCopyTextureToCommandBuffer:inTexture:outTexture:", v107, v53, self->_temporallyFilteredDisparity);
          -[VideoMattingMetal encodeSimpleConfidenceToCommandBuffer:disparity:outConfidence:](self, "encodeSimpleConfidenceToCommandBuffer:disparity:outConfidence:", v107, disparity[self->_frameIndex & 1], self->_disparityConfidenceMaskTexture);
        }
        facemaskDisparity = self->_facemaskDisparity;
        self->_facemaskDisparity = 0;
        temporallyFilteredDisparity = self->_temporallyFilteredDisparity;
        self->_temporallyFilteredDisparity = 0;
        v86 = self->_facemaskDisparity;
        self->_facemaskDisparity = temporallyFilteredDisparity;

        v87 = self->_temporallyFilteredDisparity;
        self->_temporallyFilteredDisparity = facemaskDisparity;

        facemaskRegionTexture = 0;
        if (a10 && self->_doFaceMask)
          facemaskRegionTexture = self->_facemaskRegionTexture;
        p_filledDisparityTexture = &self->_filledDisparityTexture;
        LODWORD(v88) = *((_DWORD *)a7 + 5);
        *(float *)&v89 = a8->backgroundFillMarginFromValidDisparity_px;
        -[VideoMattingMetal encodeFillBackgroundDisparityToCommandBuffer:inputDisparity:inputFacemask:outputDistanceFromKnownDisparity:outputDisparity:backgroundDisparityValue:minimumDistanceFromValidDisparity:](self, "encodeFillBackgroundDisparityToCommandBuffer:inputDisparity:inputFacemask:outputDistanceFromKnownDisparity:outputDisparity:backgroundDisparityValue:minimumDistanceFromValidDisparity:", v107, self->_facemaskDisparity, facemaskRegionTexture, self->_distanceFromKnownDisparityTexture, self->_filledDisparityTexture, v88, v89);
        -[VideoMattingMetal encodeDomainTransformToCommandBuffer:inputDiffusionMap:inputDistanceFromKnownDisparity:outputDomainTransformX:outputDomainTransformY:](self, "encodeDomainTransformToCommandBuffer:inputDiffusionMap:inputDistanceFromKnownDisparity:outputDomainTransformX:outputDomainTransformY:", v107, self->_diffusionMapTexture, self->_distanceFromKnownDisparityTexture, self->_domainTransformXTexture, self->_domainTransformYTexture);
        if (!a8->fillLargeHolesWithBackground && !self->_isBgColorLutBlack)
          p_filledDisparityTexture = &self->_facemaskDisparity;
        -[VideoMattingMetal encodeEdgeAwareFillToCommandBuffer:inputDisparity:inputDomainTransformX:inputDomainTransformY:outputDisparity:](self, "encodeEdgeAwareFillToCommandBuffer:inputDisparity:inputDomainTransformX:inputDomainTransformY:outputDisparity:", v107, *p_filledDisparityTexture, self->_domainTransformXTexture, self->_domainTransformYTexture, self->_initDisparity);
        -[VideoMattingMetal encodeInvalidDisparityMaskToCommandBuffer:inputDisparity:outputMask:](self, "encodeInvalidDisparityMaskToCommandBuffer:inputDisparity:outputMask:", v107, self->_initDisparity, self->_invalidDisparityMaskTexture);
        -[VideoMattingMetal encodeBackgroundFillToCommandBuffer:inputDisparity:inputMask:outputDisparity:](self, "encodeBackgroundFillToCommandBuffer:inputDisparity:inputMask:outputDisparity:", v107, self->_initDisparity, self->_invalidDisparityMaskTexture, self->_initDisparity);
        LODWORD(v101) = 15;
        -[CVAFilterDiffusion encodeToCommandBuffer:priorTexture:sourceTexture:destinationTexture:diffusionMapTexture:confidenceTexture:iterations:](self->_diffusion, "encodeToCommandBuffer:priorTexture:sourceTexture:destinationTexture:diffusionMapTexture:confidenceTexture:iterations:", v107, self->_initDisparity, self->_initDisparity, self->_smoothDisparity[self->_frameIndex & 1], self->_diffusionMapTexture, self->_disparityConfidenceMaskTexture, v101);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_smoothDisparity[self->_frameIndex & 1], disparity[self->_frameIndex & 1]);
    }
    objc_storeStrong((id *)&self->_filteredBeforeSmoothDisparity, self->_smoothDisparity[self->_frameIndex & 1]);
    if (a5 && *((_BYTE *)a7 + 80))
    {
      Width = CVPixelBufferGetWidth(a5);
      Height = CVPixelBufferGetHeight(a5);
      if (CVPixelBufferGetPixelFormatType(a5) != 1751411059)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 1725, CFSTR("Postprocessed disparity buffer is not kCVPixelFormatType_DisparityFloat16"));

      }
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, Width, Height, 0);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "setUsage:", 2);
      +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a5, v94, 0, self->_textureCache);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[VideoMattingMetal encodeOutputDisparityToCommandBuffer:inputDisparity:outputDisparity:](self, "encodeOutputDisparityToCommandBuffer:inputDisparity:outputDisparity:", v107, self->_smoothDisparity[self->_frameIndex & 1], v95);

    }
    goto LABEL_84;
  }
  if (sub_1B569090C(CFSTR("CVAPhotoDeadzoneInCinematic"), CFSTR("com.apple.coremedia"), 0))
    goto LABEL_84;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a5, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  v20 = CVPixelBufferGetHeight(a3);
  v21 = CVPixelBufferGetWidth(a3);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  v23 = (char *)CVPixelBufferGetBaseAddress(a5);
  CVPixelBufferGetHeight(a5);
  CVPixelBufferGetWidth(a5);
  v24 = CVPixelBufferGetBytesPerRow(a5);
  v25 = sub_1B569090C(CFSTR("CVAPhotoBackgroundDeadzoneInCentimeters"), CFSTR("com.apple.coremedia"), 10);
  v26 = sub_1B569090C(CFSTR("CVAPhotoForegroundDeadzoneInCentimeters"), CFSTR("com.apple.coremedia"), 10);
  v27 = (double)v25 / 100.0;
  v28 = (double)v26 / 100.0;
  _S8 = *((float *)a7 + 4);
  v30 = 1.0 / (float)((float)(1.0 / _S8) + v27);
  v31 = 1.0 / _S8 - v28;
  v32 = 1.0 / v31;
  v48 = v31 <= 0.05;
  v33 = 20.0;
  if (!v48)
    v33 = v32;
  v34 = v33;
  v35 = _S8 - v30;
  v36 = fabsf(_S8 - v30);
  v112 = v34;
  v109 = -(float)(v34 - (float)(_S8 * 2.0));
  v108 = _S8 - v109;
  __asm { FCVT            H10, S8 }
  if (fabsf(_S8 - v109) >= 0.01)
  {
    v67 = 0;
    v110 = v36;
    while (1)
    {
      v68 = 0;
      do
      {
        _H0 = *(_WORD *)&BaseAddress[2 * v68];
        __asm { FCVT            S1, H0 }
        if (_S8 <= _S1 || v30 > _S1)
        {
          if (_S8 < _S1 && _S1 <= v112)
          {
            v73 = atan((float)((float)((float)-(float)(_S1 - (float)(_S8 * 2.0)) - v109) / v108) * 3.14159265);
            v36 = v110;
            *(float *)&v73 = v73 / 1.26262726;
            _S0 = -(float)((float)(v109 + (float)(*(float *)&v73 * v108)) - (float)(_S8 * 2.0));
LABEL_38:
            __asm { FCVT            H0, S0 }
          }
        }
        else
        {
          _H0 = _H10;
          if (v36 >= 0.01)
          {
            v75 = atan((float)((float)(_S1 - v30) / v35) * 3.14159265);
            v36 = v110;
            *(float *)&v75 = v75 / 1.26262726;
            _S0 = v30 + (float)(*(float *)&v75 * v35);
            goto LABEL_38;
          }
        }
        *(_WORD *)&v23[2 * v68++] = _H0;
      }
      while (v21 >= v68);
      ++v67;
      v23 += v24;
      BaseAddress += BytesPerRow;
      if (v20 < v67)
        goto LABEL_67;
    }
  }
  _S0 = -(float)(_S8 - (float)(_S8 * 2.0));
  __asm { FCVT            H13, S0 }
  if (v36 >= 0.01)
  {
    v76 = 0;
    while (1)
    {
      v77 = 0;
      do
      {
        _H0 = *(_WORD *)&BaseAddress[2 * v77];
        __asm { FCVT            S1, H0 }
        if (_S8 > _S1 && v30 <= _S1)
        {
          v78 = atan((float)((float)(_S1 - v30) / v35) * 3.14159265) / 1.26262726;
          _S0 = v30 + (float)(v78 * v35);
          __asm { FCVT            H0, S0 }
LABEL_55:
          *(_WORD *)&v23[2 * v77] = _H0;
          goto LABEL_56;
        }
        if (_S8 >= _S1 || _S1 > v112)
          goto LABEL_55;
        *(_WORD *)&v23[2 * v77] = _H13;
LABEL_56:
        ++v77;
      }
      while (v21 >= v77);
      ++v76;
      v23 += v24;
      BaseAddress += BytesPerRow;
      if (v20 < v76)
        goto LABEL_67;
    }
  }
  v44 = 0;
  do
  {
    v45 = 0;
    do
    {
      _H0 = *(_WORD *)&BaseAddress[2 * v45];
      __asm { FCVT            S1, H0 }
      v48 = _S8 <= _S1 || v30 > _S1;
      if (v48)
      {
        if (_S8 >= _S1 || _S1 > v112)
          *(_WORD *)&v23[2 * v45] = _H0;
        else
          *(_WORD *)&v23[2 * v45] = _H13;
      }
      else
      {
        *(_WORD *)&v23[2 * v45] = _H10;
      }
      ++v45;
    }
    while (v21 >= v45);
    ++v44;
    v23 += v24;
    BaseAddress += BytesPerRow;
  }
  while (v20 >= v44);
LABEL_67:
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  CVPixelBufferUnlockBaseAddress(a5, 0);
LABEL_84:
  sub_1B567C898(*((_QWORD *)self->_metalContext + 5), self->_device, self->_commandQueue);
  CVPixelBufferRetain(a4);
  CVPixelBufferRetain(a5);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mattingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v113[0] = MEMORY[0x1E0C809B0];
  v113[1] = 3221225472;
  v113[2] = sub_1B569EB9C;
  v113[3] = &unk_1E69370D8;
  v116 = a4;
  v113[4] = self;
  v96 = v104;
  v114 = v96;
  v97 = v103;
  v115 = v97;
  v117 = a5;
  objc_msgSend(v107, "addCompletedHandler:", v113);
  objc_msgSend(v107, "commit");

  if (a11)
    ++self->_frameIndex;
  v98 = self->_yuvSourceDownsampledTexture;

  return v98;
}

- (void)alphaMattingWithPostprocessedDisparity:(const __CVBuffer *)a3 source:(const __CVBuffer *)a4 inSegmentation:(__CVBuffer *)a5 alpha:(__CVBuffer *)a6 staticParams:(const VideoMattingStaticParams *)a7 dynamicParams:(const void *)a8 usePostprocessedDisparity:(BOOL)a9 isFinalStage:(BOOL)a10 dilateForegroundMask:(BOOL)a11 properties:(id)a12 callbackQueue:(id)a13 callback:(id)a14
{
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  double v27;
  double v28;
  float v29;
  float v30;
  float v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int *v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  void *v43;
  float v44;
  unint64_t v45;
  MTLTexture *v46;
  MTLTexture *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  id v55;
  id v56;
  double v57;
  uint64_t v58;
  char v59;
  void *v60;
  __CVBuffer *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v67;
  id v68;
  _QWORD v69[5];
  id v70;
  id v71;
  const __CVBuffer *v72;
  __CVBuffer *v73;
  __CVBuffer *v74;
  void *v75[4];

  v68 = a12;
  v64 = a13;
  v63 = a14;
  sub_1B56A2634(a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a4, v19, 0, self->_textureCache);
  v20 = objc_claimAutoreleasedReturnValue();

  v65 = (void *)v20;
  if (a5)
  {
    sub_1B56A2634(a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a5, v21, 0, self->_textureCache);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v67 = 0;
  }
  sub_1B56A2634(a6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a6, v22, 0, self->_textureCache);
  v23 = objc_claimAutoreleasedReturnValue();

  v24 = *((float *)a8 + 4);
  v25 = *((float *)a8 + 10);
  v62 = (void *)v23;
  if (sub_1B568AFE8())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("focusCanonicalDisparity = %5.3f"), *((float *)a8 + 4));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alphaMatte.cutoffCanonicalDisparity = %5.3f"), (float)(*((float *)a8 + 4) - *((float *)a8 + 10)));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alphaMatteDeltaCanonicalDisparity = %5.3f"), *((float *)a8 + 10));

    v26 = *((float *)a8 + 4);
    v27 = 1.0 / (float)(v26 - *((float *)a8 + 10));
    v28 = 1.0 / v26;
    v29 = v27 - v28;
    *(float *)&v27 = v27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alphaMatte.focus = %5.3fm delta = %5.3fm cutoff = %5.3fm"), *(_QWORD *)&v28, v29, *(float *)&v27);

  }
  v30 = *((float *)a8 + 2);
  v31 = atan2f(*((float *)a8 + 8), *((float *)a8 + 7));
  v61 = a6;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setLabel:", CFSTR("alphaMattingWithPostprocessedDisparity"));
  *(float *)&v33 = 1.0
                 / (float)((float)((float)((float)(v30 / 255.0) * (float)(v30 / 255.0))
                                 + (float)((float)(v30 / 255.0) * (float)(v30 / 255.0)))
                         * 3.0);
  -[VideoMattingMetal encodeColorSimToCommandBuffer:prevSource:currSource:destination:similarityScaleFactor:](self, "encodeColorSimToCommandBuffer:prevSource:currSource:destination:similarityScaleFactor:", v32, self->_scaledSource[!(self->_frameIndex & 1)], self->_scaledSource[self->_frameIndex & 1], self->_colorSim, v33);
  if (self->_mattingUsesPostprocessing && a9)
    v40 = &OBJC_IVAR___VideoMattingMetal__smoothDisparity;
  else
    v40 = &OBJC_IVAR___VideoMattingMetal__disparity;
  LODWORD(v35) = *((_DWORD *)a8 + 4);
  LODWORD(v36) = *((_DWORD *)a8 + 6);
  *(float *)&v38 = a7->guidedFilterUnconfidentWeight;
  *(float *)&v37 = a7->guidedFilterMinDistToDeweight;
  *(float *)&v39 = a7->foregroundMaskDilationRadius;
  LOBYTE(v58) = a11;
  *(float *)&v34 = v24 - v25;
  -[VideoMattingMetal encodeForegroundMaskToBuffer:disparity:inSegmentation:useSegmentationOnly:weight:foregroundMask:erodedForegroundMask:disparityMin:focusDisparity:hardness:minDistToDeweight:unconfidentWeight:dilateForegroundMask:foregroundMaskDilationRadius:properties:](self, "encodeForegroundMaskToBuffer:disparity:inSegmentation:useSegmentationOnly:weight:foregroundMask:erodedForegroundMask:disparityMin:focusDisparity:hardness:minDistToDeweight:unconfidentWeight:dilateForegroundMask:foregroundMaskDilationRadius:properties:", v32, *(Class *)((char *)&self->super.super.isa + 8 * (self->_frameIndex & 1) + *v40), v34, v35, v36, v37, v38, v39, 0, v58, v68);
  v41 = atomic_load((unsigned __int8 *)&qword_1EF12D2E0);
  if ((v41 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D2E0))
  {
    LODWORD(v57) = 1008981770;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
    qword_1EF12D2F0 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_1EF12D2E0);
  }
  if ((byte_1EF12D2E8 & 1) == 0)
  {
    HIBYTE(v75[2]) = 20;
    strcpy((char *)v75, "alphaGuidedFilterEps");
    sub_1B5667F7C((uint64_t)&qword_1EF12D2F0, (uint64_t)v75);
    if (SHIBYTE(v75[2]) < 0)
      operator delete(v75[0]);
    byte_1EF12D2E8 = 1;
  }
  v42 = atomic_load((unsigned __int8 *)&qword_1EF12D2D8);
  if ((v42 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D2D8))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v60, "BOOLForKey:", CFSTR("CVAPhotoDebugStyle"));

    byte_1EF12D989 = v59;
    __cxa_guard_release(&qword_1EF12D2D8);
  }
  if (byte_1EF12D989)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)qword_1EF12D2F0, "floatValue");
    objc_msgSend(v43, "stringWithFormat:", CFSTR("alphaGuidedFilterEps = %f"), v44);

  }
  objc_msgSend((id)qword_1EF12D2F0, "floatValue");
  -[MPSImageGuidedFilter setEpsilon:](self->_guidedFilter, "setEpsilon:");
  -[MPSImageGuidedFilter encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:](self->_guidedFilter, "encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:", v32, self->_gfForegroundMask, self->_scaledSource[self->_frameIndex & 1], self->_gfWeight, self->_coeff);
  v45 = self->_frameIndex & 1;
  v46 = self->_coeffHistory[v45];
  v47 = self->_coeffHistory[v45 ^ 1];
  LODWORD(v48) = *(_DWORD *)a8;
  -[VideoMattingMetal encodeFilterCoefficientToBuffer:inputCoeff:prevCoeff:outCoeff:inColorSim:updateRate:](self, "encodeFilterCoefficientToBuffer:inputCoeff:prevCoeff:outCoeff:inColorSim:updateRate:", v32, self->_coeff, v47, v46, self->_colorSim, v48);
  -[MPSImageGuidedFilter encodeReconstructionToCommandBuffer:guidanceTexture:coefficientsTexture:destinationTexture:](self->_guidedFilter, "encodeReconstructionToCommandBuffer:guidanceTexture:coefficientsTexture:destinationTexture:", v32, v65, v46, self->_alphaNoPostprocessing);
  *(float *)&v54 = fabsf(*((float *)a8 + 9));
  *(float *)&v54 = *(float *)&v54 * (float)(*(float *)&v54 * (float)(*(float *)&v54 * *(float *)&v54));
  *(float *)&v52 = *(float *)&v54 * 0.5;
  v53 = *(float *)&v54 <= 0.1;
  LODWORD(v54) = 1028443341;
  if (!v53)
    *(float *)&v54 = *(float *)&v52;
  *(float *)&v50 = self->_infConvolutionScale;
  *(float *)&v52 = *(float *)&v50 * (float)(1.0 - *(float *)&v54);
  *(float *)&v50 = *(float *)&v50 * *(float *)&v54;
  *(float *)&v51 = self->_gammaExponent;
  *(float *)&v54 = v31;
  *(float *)&v49 = a7->alphaMaxLaplacian;
  -[CVAFilterGuided encodePostProcessAlphaToCommandBuffer:source:destination:alphaMaxLaplacian:infConvOrientation:infConvMajorRadius:infConvMinorRadius:gammaExponent:enableInfConvolution:](self->_cvaGuidedFilter, "encodePostProcessAlphaToCommandBuffer:source:destination:alphaMaxLaplacian:infConvOrientation:infConvMajorRadius:infConvMinorRadius:gammaExponent:enableInfConvolution:", v32, self->_alphaNoPostprocessing, v23, self->_enableInfConvolution, v49, v54, v52, v50, v51);
  CVPixelBufferRetain(a4);
  CVPixelBufferRetain(v61);
  CVPixelBufferRetain(a5);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_mattingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = sub_1B569EA10;
  v69[3] = &unk_1E6937100;
  v72 = a4;
  v73 = a5;
  v69[4] = self;
  v55 = v64;
  v70 = v55;
  v56 = v63;
  v71 = v56;
  v74 = v61;
  objc_msgSend(v32, "addCompletedHandler:", v69);
  objc_msgSend(v32, "commit");

  self->_lastCommittedCommand = 1;
  if (a10)
    ++self->_frameIndex;

}

- (void)initSourceTexture:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "containsObject:", v7);

  if (v8)
    v9 = 500;
  else
    v9 = 70;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v9, Width, Height, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStorageMode:", 0);

}

- (void)encodeFilterCoefficientToBuffer:(id)a3 inputCoeff:(id)a4 prevCoeff:(id)a5 outCoeff:(id)a6 inColorSim:(id)a7 updateRate:(float)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int64x2_t v22;
  uint64_t v23;
  _QWORD v24[3];
  BOOL v25[8];
  float v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = objc_msgSend(v15, "width");
  v20 = objc_msgSend(v15, "height");
  v25[0] = self->_frameIndex != 0;
  v26 = 1.0 - a8;
  objc_msgSend(v14, "computeCommandEncoder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLabel:", CFSTR("_temporalCoefficientsFilterKernel"));
  objc_msgSend(v21, "setComputePipelineState:", self->_temporalCoefficientsFilterKernel);
  objc_msgSend(v21, "setTexture:atIndex:", v15, 0);
  objc_msgSend(v21, "setTexture:atIndex:", v16, 1);
  objc_msgSend(v21, "setTexture:atIndex:", v17, 2);
  objc_msgSend(v21, "setTexture:atIndex:", v18, 3);
  objc_msgSend(v21, "setBytes:length:atIndex:", v25, 12, 0);
  v24[0] = (unint64_t)(v19 + 15) >> 4;
  v24[1] = (unint64_t)(v20 + 15) >> 4;
  v24[2] = 1;
  v22 = vdupq_n_s64(0x10uLL);
  v23 = 1;
  objc_msgSend(v21, "dispatchThreadgroups:threadsPerThreadgroup:", v24, &v22);
  objc_msgSend(v21, "endEncoding");

}

- (__CVBuffer)createCVBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5
{
  const __CFDictionary *v8;
  __CVBuffer *v9;
  CVPixelBufferRef v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = *MEMORY[0x1E0CA8FF0];
  v13[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, a4, a5, v8, &v11);
  v9 = v11;

  return v9;
}

- (void)encodeScaleSourceToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 targetWidth:(unint64_t)a5 targetHeight:(unint64_t)a6
{
  uint64_t PixelFormatType;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  MTLTexture **scaledSource;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  MTLTexture *v20;
  void *v21;
  void *v22;
  int v23;
  size_t Width;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (v13)
    v14 = 500;
  else
    v14 = 70;
  v15 = self->_frameIndex & 1;
  scaledSource = self->_scaledSource;
  if (!self->_scaledSource[v15])
  {
    if (v13)
      v17 = PixelFormatType;
    else
      v17 = 1111970369;
    self->_scaledSourceCV[v15] = -[VideoMattingMetal createCVBufferWithWidth:height:format:](self, "createCVBufferWithWidth:height:format:", a5, a6, v17);
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v14, a5, a6, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUsage:", 3);
    +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", self->_scaledSourceCV[v15], v18, 0, self->_textureCache);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = scaledSource[v15];
    scaledSource[v15] = (MTLTexture *)v19;

  }
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "containsObject:", v22);

  if (v23)
  {
    -[VideoMattingMetal encode420HybridDownsamplingToCommandBuffer:source:destination:](self, "encode420HybridDownsamplingToCommandBuffer:source:destination:", v27, a4, self->_scaledSourceCV[v15]);
  }
  else
  {
    Width = CVPixelBufferGetWidth(a4);
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v14, Width, CVPixelBufferGetHeight(a4), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a4, v25, 0, self->_textureCache);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVAFilterHybridResampling encodeHybridDownsamplingToCommandBuffer:source:destination:](self->_hybridResampler, "encodeHybridDownsamplingToCommandBuffer:source:destination:", v27, v26, scaledSource[v15]);

  }
}

- (void)encodeGuidedFilterWeightToCommandBuffer:(id)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 inputForegroundDistance:(id)a7 outputForegroundMask:(id)a8 outputWeight:(id)a9 minDistToDeweight:(float)a10 unconfidentWeight:(float)a11 dilateForegroundMask:(BOOL)a12 foregroundMaskDilationRadius:(float)a13
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  uint64_t v44;
  _QWORD v45[3];
  _DWORD v46[2];
  BOOL v47;
  __int16 v48;
  BOOL v49;

  _S8 = a13;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a7;
  v27 = a8;
  v28 = a9;
  v29 = objc_msgSend(v26, "width");
  if (v29 != objc_msgSend(v24, "width"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 2210, CFSTR("Precondition: inputForegroundDistance.width == disparity.width"));

  }
  v30 = objc_msgSend(v26, "height");
  if (v30 != objc_msgSend(v24, "height"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 2212, CFSTR("Precondition: inputForegroundDistance.height == disparity.height"));

  }
  v31 = objc_msgSend(v28, "width");
  if (v31 != objc_msgSend(v24, "width"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 2213, CFSTR("Precondition: outputWeight.width == disparity.width"));

  }
  v32 = objc_msgSend(v28, "height");
  if (v32 != objc_msgSend(v24, "height"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 2214, CFSTR("Precondition: outputWeight.height == disparity.height"));

  }
  *(float *)v46 = a10;
  *(float *)&v46[1] = a11;
  v47 = a6;
  v49 = a12;
  __asm { FCVT            H0, S8 }
  v48 = _H0;
  objc_msgSend(v23, "computeCommandEncoder");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setLabel:", CFSTR("_guidedFilterWeightKernel"));
  objc_msgSend(v38, "setComputePipelineState:", self->_guidedFilterWeightKernel);
  objc_msgSend(v38, "setTexture:atIndex:", v24, 0);
  objc_msgSend(v38, "setTexture:atIndex:", v26, 1);
  objc_msgSend(v38, "setTexture:atIndex:", v25, 2);
  objc_msgSend(v38, "setTexture:atIndex:", v28, 3);
  objc_msgSend(v38, "setTexture:atIndex:", v27, 4);
  objc_msgSend(v38, "setBytes:length:atIndex:", v46, 16, 0);
  v45[0] = (unint64_t)(objc_msgSend(v24, "width") + 15) >> 4;
  v45[1] = (unint64_t)(objc_msgSend(v24, "height") + 15) >> 4;
  v45[2] = 1;
  v44 = 1;
  v43 = xmmword_1B56AC968;
  objc_msgSend(v38, "dispatchThreadgroups:threadsPerThreadgroup:", v45, &v43);
  objc_msgSend(v38, "endEncoding");

}

- (void)encodeRotateAndFitIntoRectWithCommandBuffer:(id)a3 inTexture:(id)a4 outTexture:(id)a5 rotateClockwise:(BOOL)a6
{
  id v10;
  id v11;
  float32x4_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD v16[3];
  _QWORD v17[3];
  float32x4_t v18;
  BOOL v19;

  v10 = a4;
  v11 = a5;
  v19 = a6;
  *(float32x2_t *)v12.f32 = vcvt_f32_s32(*(int32x2_t *)&self->_width);
  v12.i64[1] = v12.i64[0];
  v18 = vdivq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)self->_primaryCaptureRect.origin), (float64x2_t)self->_primaryCaptureRect.size), v12);
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", CFSTR("_rotateAndFitIntoRectKernel"));
  objc_msgSend(v13, "setComputePipelineState:", self->_rotateAndFitIntoRectKernel);
  objc_msgSend(v13, "setTexture:atIndex:", v10, 0);
  objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v18, 16, 0);
  objc_msgSend(v13, "setBytes:length:atIndex:", &v19, 1, 1);
  v14 = -[MTLComputePipelineState threadExecutionWidth](self->_rotateAndFitIntoRectKernel, "threadExecutionWidth");
  v15 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_rotateAndFitIntoRectKernel, "maxTotalThreadsPerThreadgroup");
  v17[0] = objc_msgSend(v11, "width");
  v17[1] = objc_msgSend(v11, "height");
  v17[2] = 1;
  v16[0] = v14;
  v16[1] = v15 / v14;
  v16[2] = 1;
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v17, v16);
  objc_msgSend(v13, "endEncoding");

}

- (void)encodeForegroundMaskToBuffer:(id)a3 disparity:(id)a4 inSegmentation:(id)a5 useSegmentationOnly:(BOOL)a6 weight:(id)a7 foregroundMask:(id)a8 erodedForegroundMask:(id)a9 disparityMin:(float)a10 focusDisparity:(float)a11 hardness:(float)a12 minDistToDeweight:(float)a13 unconfidentWeight:(float)a14 dilateForegroundMask:(BOOL)a15 foregroundMaskDilationRadius:(float)a16 properties:(id)a17
{
  _BOOL8 v19;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  MTLTexture **p_correctlyRotatedAndReshapedSegmentation;
  __int16 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  id v45;
  id v46;

  v19 = a6;
  v46 = a3;
  v29 = a4;
  v45 = a5;
  v30 = a7;
  v31 = a8;
  v32 = a9;
  v33 = a17;
  sub_1B5669B50(objc_msgSend(v33, "videoPipelineDevice"));
  p_correctlyRotatedAndReshapedSegmentation = &self->_correctlyRotatedAndReshapedSegmentation;
  if ((v35 & 0x100) != 0)
    -[VideoMattingMetal encodeRotateAndFitIntoRectWithCommandBuffer:inTexture:outTexture:rotateClockwise:](self, "encodeRotateAndFitIntoRectWithCommandBuffer:inTexture:outTexture:rotateClockwise:", v46, v45, *p_correctlyRotatedAndReshapedSegmentation, 1);
  else
    objc_storeStrong((id *)&self->_correctlyRotatedAndReshapedSegmentation, a5);
  *(float *)&v36 = a10;
  *(float *)&v37 = a11;
  *(float *)&v38 = a12;
  *(float *)&v39 = a13;
  *(float *)&v40 = a14;
  -[VideoMattingMetal encodeDisparityMasksToCommandBuffer:inputDisparity:inputSegmentation:useSegmentationOnly:outputForegroundMask:outputIsForeground:disparityMin:focusDisparity:hardness:minDistToDeweight:unconfidentWeight:](self, "encodeDisparityMasksToCommandBuffer:inputDisparity:inputSegmentation:useSegmentationOnly:outputForegroundMask:outputIsForeground:disparityMin:focusDisparity:hardness:minDistToDeweight:unconfidentWeight:", v46, v29, *p_correctlyRotatedAndReshapedSegmentation, v19, v31, self->_isForegroundTexture, v36, v37, v38, v39, v40);
  -[CVAFilterDistanceTransform encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_distanceTransform, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v46, self->_isForegroundTexture, self->_distanceToForegroundTexture);
  LOBYTE(v44) = a15;
  *(float *)&v41 = a13;
  *(float *)&v42 = a14;
  *(float *)&v43 = a16;
  -[VideoMattingMetal encodeGuidedFilterWeightToCommandBuffer:inputDisparity:inputSegmentation:useSegmentationOnly:inputForegroundDistance:outputForegroundMask:outputWeight:minDistToDeweight:unconfidentWeight:dilateForegroundMask:foregroundMaskDilationRadius:](self, "encodeGuidedFilterWeightToCommandBuffer:inputDisparity:inputSegmentation:useSegmentationOnly:inputForegroundDistance:outputForegroundMask:outputWeight:minDistToDeweight:unconfidentWeight:dilateForegroundMask:foregroundMaskDilationRadius:", v46, v29, *p_correctlyRotatedAndReshapedSegmentation, v19, self->_distanceToForegroundTexture, v31, v41, v42, v43, v30, v44);
  if (v32)
    -[MPSImageAreaMin encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_fgMaskErosionKernel, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v46, v31, v32);

}

- (void)encodeDisparityDecimateToCommandBuffer:(id)a3 canonicalDisparity:(__CVBuffer *)a4 disparityOut:(id)a5
{
  id v8;
  id v9;
  size_t Width;
  size_t Height;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[3];

  v8 = a3;
  v9 = a5;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v12 = objc_msgSend(v9, "width");
  v13 = objc_msgSend(v9, "height");
  if (CVPixelBufferGetPixelFormatType(a4) == 1751411059)
    v14 = 25;
  else
    v14 = 55;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v14, Width, Height, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a4, v15, 0, self->_textureCache);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_sdofRenderingHasForegroundBlur)
  {
    -[VideoMattingMetal encodeRotateAndFitIntoRectWithCommandBuffer:inTexture:outTexture:rotateClockwise:](self, "encodeRotateAndFitIntoRectWithCommandBuffer:inTexture:outTexture:rotateClockwise:", v8, v16, v9, 0);
  }
  else
  {
    objc_msgSend(v8, "computeCommandEncoder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLabel:", CFSTR("_disparityDecimateKernel"));
    objc_msgSend(v17, "setComputePipelineState:", self->_disparityDecimateKernel);
    objc_msgSend(v17, "setTexture:atIndex:", v16, 0);
    objc_msgSend(v17, "setTexture:atIndex:", v9, 1);
    v20[0] = (unint64_t)(v12 + 15) >> 4;
    v20[1] = (unint64_t)(v13 + 15) >> 4;
    v20[2] = 1;
    v19 = 1;
    v18 = xmmword_1B56AC968;
    objc_msgSend(v17, "dispatchThreadgroups:threadsPerThreadgroup:", v20, &v18);
    objc_msgSend(v17, "endEncoding");

  }
}

- (pair<float,)blurRadiusAndStdAtInfinityForFocalLength:(float)a3 focusCanonicalDisparity:(float)a4 fNumber:(float)a5 xResolution:(float)a6 useNewCoCFormula:(BOOL)a7
{
  _BOOL4 v7;
  unsigned __int8 v12;
  unsigned __int8 v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  void *v25;
  float v26;
  float v27;
  float v28;
  void *v29;
  char v30;
  double v31;
  void *__p[2];
  char v33;
  pair<float, float> result;

  v7 = a7;
  v12 = atomic_load((unsigned __int8 *)&qword_1EF12D3C8);
  if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D3C8))
  {
    +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLForKey:", CFSTR("CVAPhotoDebugCoC"));

    byte_1EF12D990 = v30;
    __cxa_guard_release(&qword_1EF12D3C8);
  }
  if (byte_1EF12D990)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("f_mm = %f"), a3);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("disparity = %f"), a4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fDist_mm = %f"), (float)(1000.0 / a4));

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fN = %f"), a5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("useNewCoCFormula = %d"), v7);

  }
  if (a4 >= 2048.0)
  {
    v19 = 0.0;
    if (byte_1EF12D990)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cocRadiusInPixels = %d"), 0);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maxBlurRadius = %d"), 0);
    }
    v17 = 0.0;
  }
  else if (v7)
  {
    v13 = atomic_load((unsigned __int8 *)&qword_1EF12D4F0);
    if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D4F0))
    {
      LODWORD(v31) = 1057896676;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
      qword_1EF12D5E8 = objc_claimAutoreleasedReturnValue();
      __cxa_guard_release(&qword_1EF12D4F0);
    }
    if ((byte_1EF12D5E0 & 1) == 0)
    {
      v33 = 9;
      strcpy((char *)__p, "blurScale");
      sub_1B5667F7C((uint64_t)&qword_1EF12D5E8, (uint64_t)__p);
      if (v33 < 0)
        operator delete(__p[0]);
      byte_1EF12D5E0 = 1;
    }
    v14 = (float)((float)(a6 / 36.0) * (float)((float)((float)(a3 * a3) * fmaxf(a4, 0.0)) / (float)(a5 * 1000.0))) * 0.5;
    objc_msgSend((id)qword_1EF12D5E8, "floatValue");
    v17 = v14 * v16;
    if ((float)(v14 * v16) >= 2.0)
      v18 = log2f(v17);
    else
      v18 = v17 * 0.5;
    v24 = (pow(6.0, (float)(v18 - floorf(v18))) + -1.0) / 5.0 + v15;
    v19 = exp2f(v24 * 1.585) + 0.5;
    if (byte_1EF12D990)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cocRadiusInPixels = %f"), v14);

      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)qword_1EF12D5E8, "floatValue");
      objc_msgSend(v25, "stringWithFormat:", CFSTR("blurScale = %f"), v26);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maxBlurRadiusStd = %f"), v17);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mipLevel = %f"), v24);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("effectiveRadiusInPixels = %f"), v19);
      goto LABEL_25;
    }
  }
  else
  {
    v20 = (float)((float)(a6 / 36.0) * (float)((float)((float)(a3 * a3) * fmaxf(a4, 0.0)) / (float)(a5 * 1000.0))) * 0.5;
    v17 = v20 * 0.46111;
    if ((float)(v20 * 0.46111) >= 2.0)
      v21 = log2f(v20 * 0.46111);
    else
      v21 = v17 * 0.5;
    v19 = 0.0;
    if (byte_1EF12D990)
    {
      v22 = floorf(v21);
      v23 = (pow(6.0, (float)(v21 - v22)) + -1.0) / 5.0 + v22;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cocRadiusInPixels = %f"), v20);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("blurScale = %f"), 0x3FDD82D840000000);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maxBlurRadiusStd = %f"), v17);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mipLevel = %f"), v23);
LABEL_25:

    }
  }
  v27 = v19;
  v28 = v17;
  result.var1 = v28;
  result.var0 = v27;
  return result;
}

- (void)encodeDisparitySmoothingToCommandBuffer:(id)a3 disparity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  uint64_t v16;
  _QWORD v17[3];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "computeCommandEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLabel:", CFSTR("_renderingDisparityDeweightKernel"));
  objc_msgSend(v8, "setComputePipelineState:", self->_renderingDisparityDeweightKernel);
  objc_msgSend(v8, "setTexture:atIndex:", v7, 0);
  objc_msgSend(v8, "setTexture:atIndex:", self->_deweightedDisparity, 1);
  -[CVAPhotoMTLRingBuffer currentBuffer](self->_disparityConfig, "currentBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBuffer:offset:atIndex:", v9, 0, 0);

  v17[0] = (unint64_t)(objc_msgSend(v7, "width") + 15) >> 4;
  v17[1] = (unint64_t)(objc_msgSend(v7, "height") + 15) >> 4;
  v17[2] = 1;
  v16 = 1;
  v15 = xmmword_1B56AC968;
  objc_msgSend(v8, "dispatchThreadgroups:threadsPerThreadgroup:", v17, &v15);
  objc_msgSend(v8, "endEncoding");
  -[MPSImageBox encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_disparityBlurBoxKernel, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v6, self->_deweightedDisparity, self->_shift[self->_frameIndex & 1]);
  -[CVAFilterBox encodeToCommandBuffer:inTexture:outTexture:radius:normalize:](self->_boxFilter, "encodeToCommandBuffer:inTexture:outTexture:radius:normalize:", v6, self->_colorSim, self->_colorSim, 5, 2);
  objc_msgSend(v6, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setLabel:", CFSTR("_renderingDisparityFillAndFilterKernel"));
  objc_msgSend(v10, "setComputePipelineState:", self->_renderingDisparityFillAndFilterKernel);
  objc_msgSend(v10, "setTexture:atIndex:", self->_shift[(self->_frameIndex & 1) == 0], 0);
  objc_msgSend(v10, "setTexture:atIndex:", self->_shift[self->_frameIndex & 1], 1);
  objc_msgSend(v10, "setTexture:atIndex:", self->_colorSim, 2);
  objc_msgSend(v10, "setTexture:atIndex:", self->_shift[self->_frameIndex & 1], 3);
  objc_msgSend(v10, "setTexture:atIndex:", self->_coc, 4);
  -[CVAPhotoMTLRingBuffer currentBuffer](self->_disparityConfig, "currentBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBuffer:offset:atIndex:", v11, 0, 0);

  v14[0] = (unint64_t)(objc_msgSend(v7, "width") + 15) >> 4;
  v14[1] = (unint64_t)(objc_msgSend(v7, "height") + 15) >> 4;
  v14[2] = 1;
  v13 = 1;
  v12 = xmmword_1B56AC968;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v14, &v12);
  objc_msgSend(v10, "endEncoding");

}

- (id)getPTTextureFromLuma:(id)a3 chroma:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v7 = (void *)qword_1EF12D678;
  v15 = qword_1EF12D678;
  if (!qword_1EF12D678)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B568F05C;
    v11[3] = &unk_1E6936E58;
    v11[4] = &v12;
    sub_1B568F05C((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  v8 = v7;
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v8, "createYUV420:chroma:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColorPrimaries:", *MEMORY[0x1E0CA2120]);
  objc_msgSend(v9, "setTransferFunction:", *MEMORY[0x1E0CA8EB0]);
  objc_msgSend(v9, "setYCbCrMatrix:", *MEMORY[0x1E0CA8F10]);
  objc_msgSend(v9, "setYCbCrColorDepth:", 8);
  objc_msgSend(v9, "setYCbCrFullRange:", 1);

  return v9;
}

- (void)updateRenderRequestwithPerFrameMetadata:(id)a3 properties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  int8x8_t v16;
  char v17;
  int8x8_t v18;
  double v25;
  int width;
  double height;
  double v28;
  int v29;
  float v30;
  float v31;
  float v32;
  float v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a3;
  v6 = a4;
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("FinalCropRectFromSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("FinalCropRectFromSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Width"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("FinalCropRectFromSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Height"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    sub_1B5669B50(objc_msgSend(v6, "videoPipelineDevice"));
    *(float *)v16.i32 = 1.0 / v11;
    *(float *)&v16.i32[1] = 1.0 / v15;
    v18 = (int8x8_t)vceqd_s64(v17 & 1, 0);
    __asm { FMOV            V2.2S, #1.0 }
    _D8 = (float32x2_t)vbsl_s8(v18, v16, _D2);
    v25 = COERCE_DOUBLE(vbsl_s8(v18, _D2, v16));
  }
  else
  {
    __asm { FMOV            V8.2S, #1.0 }
    v25 = *(double *)&_D8;
  }
  width = self->_width;
  v28 = self->_primaryCaptureRect.size.width;
  height = self->_primaryCaptureRect.size.height;
  v29 = self->_height;
  -[PTRenderRequest setVisCropFactor:](self->_ptRenderRequest, "setVisCropFactor:", v25);
  v30 = v28;
  v31 = v30 / (float)width;
  v32 = height;
  v33 = v32 / (float)v29;
  if (v31 >= v33)
    v31 = v33;
  -[PTRenderRequest setVisCropFactorPreview:](self->_ptRenderRequest, "setVisCropFactorPreview:", COERCE_DOUBLE(vmul_n_f32(_D8, v31)));
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("FocalLenIn35mmFilm"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "floatValue");
  -[PTRenderRequest setFocalLenIn35mmFilm:](self->_ptRenderRequest, "setFocalLenIn35mmFilm:");

  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("SensorID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTRenderRequest setSensorID:](self->_ptRenderRequest, "setSensorID:", objc_msgSend(v35, "intValue"));

  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("ConversionGain"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTRenderRequest setConversionGain:](self->_ptRenderRequest, "setConversionGain:", objc_msgSend(v36, "intValue"));

  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("ReadNoise_1x"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTRenderRequest setReadNoise_1x:](self->_ptRenderRequest, "setReadNoise_1x:", objc_msgSend(v37, "intValue"));

  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("ReadNoise_8x"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTRenderRequest setReadNoise_8x:](self->_ptRenderRequest, "setReadNoise_8x:", objc_msgSend(v38, "intValue"));

  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("AGC"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTRenderRequest setAGC:](self->_ptRenderRequest, "setAGC:", objc_msgSend(v39, "intValue"));

}

- (void)renderContinuousWithSource:(const __CVBuffer *)a3 segmentationPixelBuffer:(const __CVBuffer *)a4 alpha:(const __CVBuffer *)a5 canonicalDisparity:(const __CVBuffer *)a6 disparityInFocus:(float)a7 focusCanonicalDisparity:(float)a8 fNumber:(float)a9 infConvolutionScale:(float)a10 noiseBits:(float)a11 disparityUpdateRate:(float)a12 focusThresholdHardness:(float)a13 cubeIntensity:(float)a14 usePostprocessedDisparity:(BOOL)a15 dstColor:(__CVBuffer *)a16 isFinalStage:(BOOL)a17 properties:(id)a18 callbackQueue:(id)a19 withCallback:(id)a20
{
  void *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  void *v41;
  PTRenderPipeline *v42;
  PTRenderPipeline *ptRenderPipeline;
  PTRenderState *v44;
  PTRenderState *ptRenderState;
  id v46;
  id v47;
  PTRenderRequest *v48;
  PTRenderRequest *ptRenderRequest;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CVBuffer *v58;
  __CVBuffer *v59;
  void *v60;
  double v61;
  double v62;
  PTRenderRequest *v63;
  unsigned __int8 v64;
  int lastCommittedCommand;
  void *v66;
  size_t Width;
  size_t Height;
  id v69;
  uint64_t v70;
  double v71;
  int v72;
  float v73;
  float v74;
  unsigned __int8 v75;
  double v76;
  double v77;
  double v78;
  double v79;
  unint64_t v80;
  unint64_t v81;
  unsigned int v82;
  unsigned int v83;
  int v84;
  int v85;
  unsigned int frameIndex;
  unsigned int v87;
  float v88;
  float v89;
  float v90;
  int *v91;
  double v92;
  MTLTexture *v93;
  double v94;
  double v95;
  unint64_t v96;
  id v97;
  id v98;
  void *v99;
  char v100;
  uint64_t v101;
  CGPoint origin;
  void *v103;
  BOOL v104;
  CGSize size;
  id v106;
  id v107;
  const __CVBuffer *v108;
  id v109;
  const __CVBuffer *pixelBuffer;
  _QWORD v112[5];
  id v113;
  id v114;
  const __CVBuffer *v115;
  const __CVBuffer *v116;
  const __CVBuffer *v117;
  __CVBuffer *v118;
  _OWORD v119[2];
  id v120;
  id v121;
  _BYTE __p[24];
  void *v123;
  id *v124;
  id v125;
  id *v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD v129[5];
  _QWORD v130[8];

  v130[5] = *MEMORY[0x1E0C80C00];
  v109 = a18;
  v106 = a19;
  v107 = a20;
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = a15;
  objc_msgSend(v34, "setLabel:", CFSTR("renderContinuousWithSource"));
  v120 = 0;
  v121 = 0;
  +[VideoMattingMetal decomposeYuvPixelBuffer:yTexture:uvTexture:textureCache:](VideoMattingMetal, "decomposeYuvPixelBuffer:yTexture:uvTexture:textureCache:", a16, &v121, &v120, self->_textureCache);
  objc_msgSend(v121, "setLabel:", CFSTR("dstColorTextureY"));
  objc_msgSend(v120, "setLabel:", CFSTR("dstColorTextureUV"));
  CVPixelBufferRetain(a3);
  CVPixelBufferRetain(a5);
  CVPixelBufferRetain(a6);
  CVPixelBufferRetain(a16);
  v108 = a6;
  pixelBuffer = a3;
  if (self->_sdofRenderingHasForegroundBlur)
  {
    if (!self->_renderStateIsConfigured)
    {
      v125 = 0;
      v126 = &v125;
      v127 = 0x2050000000;
      v35 = (id)qword_1EF12D668;
      v128 = qword_1EF12D668;
      if (!qword_1EF12D668)
      {
        *(_QWORD *)__p = MEMORY[0x1E0C809B0];
        *(_QWORD *)&__p[8] = 3221225472;
        *(_QWORD *)&__p[16] = sub_1B568F360;
        v123 = &unk_1E6936E58;
        v124 = &v125;
        sub_1B568F360((uint64_t)__p);
        v35 = v126[3];
      }
      v36 = v35;
      _Block_object_dispose(&v125, 8);
      v37 = (void *)objc_msgSend(objc_alloc((Class)v36), "initWithDevice:version:colorSize:disparitySize:", self->_device, objc_msgSend(sub_1B568F120(), "latestVersion"), (double)self->_width, (double)self->_height, (double)(unint64_t)-[MTLTexture width](self->_disparityInScreenAspectRatio, "width"), (double)(unint64_t)-[MTLTexture height](self->_disparityInScreenAspectRatio, "height"));
      objc_msgSend(v37, "setVerbose:", 0);
      v38 = MEMORY[0x1E0C9AAA0];
      v129[0] = &unk_1E6949EC8;
      v129[1] = &unk_1E6949EE0;
      v129[2] = &unk_1E6949EF8;
      v129[3] = &unk_1E6949F10;
      v130[0] = MEMORY[0x1E0C9AAA0];
      v130[1] = &unk_1E694A5E0;
      v130[2] = &unk_1E694A5E0;
      v130[3] = &unk_1E694A5D0;
      v129[4] = &unk_1E6949F28;
      v39 = sub_1B569090C(CFSTR("CVAPhotoDeadzoneInCinematic"), CFSTR("com.apple.coremedia"), 0);
      v40 = MEMORY[0x1E0C9AAB0];
      if (!v39)
        v40 = v38;
      v130[4] = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setOptions:", v41);

      v42 = (PTRenderPipeline *)objc_msgSend(objc_alloc((Class)sub_1B568F120()), "initWithDescriptor:", v37);
      ptRenderPipeline = self->_ptRenderPipeline;
      self->_ptRenderPipeline = v42;

      -[PTRenderPipeline createRenderStateWithQuality:](self->_ptRenderPipeline, "createRenderStateWithQuality:", 0);
      v44 = (PTRenderState *)objc_claimAutoreleasedReturnValue();
      ptRenderState = self->_ptRenderState;
      self->_ptRenderState = v44;

      v125 = 0;
      v126 = &v125;
      v127 = 0x2050000000;
      v46 = (id)qword_1EF12D670;
      v128 = qword_1EF12D670;
      if (!qword_1EF12D670)
      {
        *(_QWORD *)__p = MEMORY[0x1E0C809B0];
        *(_QWORD *)&__p[8] = 3221225472;
        *(_QWORD *)&__p[16] = sub_1B568F29C;
        v123 = &unk_1E6936E58;
        v124 = &v125;
        sub_1B568F29C((uint64_t)__p);
        v46 = v126[3];
      }
      v47 = v46;
      _Block_object_dispose(&v125, 8);
      v48 = (PTRenderRequest *)objc_msgSend(objc_alloc((Class)v47), "init");
      ptRenderRequest = self->_ptRenderRequest;
      self->_ptRenderRequest = v48;

      -[PTRenderState setSourceColorBitDepth:](self->_ptRenderState, "setSourceColorBitDepth:", 8);
      v125 = 0;
      v126 = &v125;
      v127 = 0x2050000000;
      v50 = (id)qword_1EF12D680;
      v128 = qword_1EF12D680;
      if (!qword_1EF12D680)
      {
        *(_QWORD *)__p = MEMORY[0x1E0C809B0];
        *(_QWORD *)&__p[8] = 3221225472;
        *(_QWORD *)&__p[16] = sub_1B568F424;
        v123 = &unk_1E6936E58;
        v124 = &v125;
        sub_1B568F424((uint64_t)__p);
        v50 = v126[3];
      }
      v51 = v50;
      _Block_object_dispose(&v125, 8);
      v52 = v51;
      if (qword_1EF12D638 != -1)
        dispatch_once(&qword_1EF12D638, &unk_1E6937140);
      v53 = (void *)qword_1EF12D630;
      -[PTRenderState setHwModelID:](self->_ptRenderState, "setHwModelID:", objc_msgSend(v52, "hwModelIDFromFigModelSpecificName:", qword_1EF12D630));

      self->_renderStateIsConfigured = 1;
    }
    -[VideoMattingMetal getPTTextureFromLuma:chroma:](self, "getPTTextureFromLuma:chroma:", v121, v120);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)__p = 0;
    v125 = 0;
    +[VideoMattingMetal decomposeYuvPixelBuffer:yTexture:uvTexture:textureCache:](VideoMattingMetal, "decomposeYuvPixelBuffer:yTexture:uvTexture:textureCache:", a3, __p, &v125, self->_textureCache);
    objc_msgSend(v34, "blitCommandEncoder");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "copyFromTexture:toTexture:", *(_QWORD *)__p, v121);
    objc_msgSend(v55, "copyFromTexture:toTexture:", v125, v120);
    objc_msgSend(v55, "endEncoding");
    -[VideoMattingMetal getPTTextureFromLuma:chroma:](self, "getPTTextureFromLuma:chroma:", *(_QWORD *)__p, v125);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B56A2634(a6);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = a6;
    v59 = a16;
    +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", v58, v57, 0, self->_textureCache);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideoMattingMetal encodeRotateAndFitIntoRectWithCommandBuffer:inTexture:outTexture:rotateClockwise:](self, "encodeRotateAndFitIntoRectWithCommandBuffer:inTexture:outTexture:rotateClockwise:", v34, v60, self->_disparityInScreenAspectRatio, 0);
    origin = self->_primaryCaptureRect.origin;
    size = self->_primaryCaptureRect.size;
    -[VideoMattingMetal updateRenderRequestwithPerFrameMetadata:properties:](self, "updateRenderRequestwithPerFrameMetadata:properties:", self->_sbufMetadata, v109);
    -[PTRenderRequest setRenderState:](self->_ptRenderRequest, "setRenderState:", self->_ptRenderState);
    -[PTRenderRequest setSourceColor:](self->_ptRenderRequest, "setSourceColor:", v56);
    -[PTRenderRequest setSourceDisparity:](self->_ptRenderRequest, "setSourceDisparity:", self->_disparityInScreenAspectRatio);
    -[PTRenderRequest setDestinationColor:](self->_ptRenderRequest, "setDestinationColor:", v54);
    v61 = a9 / 1.149;
    *(float *)&v61 = v61;
    -[PTRenderRequest setFNumber:](self->_ptRenderRequest, "setFNumber:", v61);
    *(float *)&v62 = a8;
    -[PTRenderRequest setFocusDisparity:](self->_ptRenderRequest, "setFocusDisparity:", v62);
    v63 = self->_ptRenderRequest;
    v119[0] = vcvtq_u64_f64((float64x2_t)origin);
    v119[1] = vcvtq_u64_f64((float64x2_t)size);
    -[PTRenderRequest setScissorRect:](v63, "setScissorRect:", v119);
    -[PTRenderRequest setColorCube:](self->_ptRenderRequest, "setColorCube:", self->_fgColorLut);
    -[PTRenderPipeline encodeRenderTo:withRenderRequest:](self->_ptRenderPipeline, "encodeRenderTo:withRenderRequest:", v34, self->_ptRenderRequest);

  }
  else
  {
    v64 = atomic_load((unsigned __int8 *)&qword_1EF12D9A0);
    if ((v64 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D9A0))
    {
      +[CVAPreferenceManager defaults](CVAPreferenceManager, "defaults");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "BOOLForKey:", CFSTR("CVAPhotoDebugStyle"));

      byte_1EF12D998 = v100;
      __cxa_guard_release(&qword_1EF12D9A0);
    }
    if (byte_1EF12D998)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fNumber = %f"), a9);

    }
    self->_infConvolutionScale = a10;
    lastCommittedCommand = self->_lastCommittedCommand;
    if ((lastCommittedCommand - 1) >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 2791, CFSTR("renderContinuousWithSource called in the wrong state: %d not in {%d, %d}"), self->_lastCommittedCommand, 1, 2);

      lastCommittedCommand = self->_lastCommittedCommand;
    }
    if (lastCommittedCommand == 2)
      NSLog(&CFSTR("renderContinuousWithSource called without sending a shift frame to matting. This is likely wrong. Did we dr"
                   "op a shift buffer?").isa);
    sub_1B56A28A0((uint64_t *)__p, a3, a5, self->_device);
    v54 = *(void **)__p;
    v103 = *(void **)&__p[8];
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    -[CVAPhotoMTLRingBuffer advancedBuffer](self->_disparityConfig, "advancedBuffer");
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v70 = objc_msgSend(v69, "contents");

    *(float *)&v71 = a12;
    -[VideoMattingMetal setRenderingDisparityUpdateRate:](self, "setRenderingDisparityUpdateRate:", v71);
    *(float *)v70 = a8;
    *(float *)(v70 + 4) = a8 * 0.5;
    -[VideoMattingMetal renderingDisparityUpdateRate](self, "renderingDisparityUpdateRate");
    *(_DWORD *)(v70 + 8) = v72;
    v73 = 1.0 / a8;
    if (a8 <= 0.001)
      v73 = 1000.0;
    *(float *)(v70 + 20) = a7;
    *(float *)(v70 + 24) = v73;
    *(float *)(v70 + 28) = v73 + v73;
    *(_BYTE *)(v70 + 32) = self->_frameIndex == 0;
    v74 = 1.0 / fmaxf((float)(a8 - a7) * a13, 0.001);
    *(float *)(v70 + 12) = v74;
    *(float *)(v70 + 16) = a8 - (float)(1.0 / v74);
    v75 = atomic_load((unsigned __int8 *)&qword_1EF12D9B0);
    if ((v75 & 1) == 0 && __cxa_guard_acquire(&qword_1EF12D9B0))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      qword_1EF12D9A8 = objc_claimAutoreleasedReturnValue();
      __cxa_guard_release(&qword_1EF12D9B0);
    }
    if ((byte_1EF12D9B8 & 1) == 0)
    {
      __p[23] = 21;
      strcpy(__p, "newCoCFormulaDisabled");
      sub_1B5667F7C((uint64_t)&qword_1EF12D9A8, (uint64_t)__p);
      if ((__p[23] & 0x80000000) != 0)
        operator delete(*(void **)__p);
      byte_1EF12D9B8 = 1;
    }
    if ((objc_msgSend((id)qword_1EF12D9A8, "BOOLValue") & 1) != 0)
      v80 = 0;
    else
      v80 = ((unint64_t)sub_1B5669B50(objc_msgSend(v109, "videoPipelineDevice")) >> 48) & 1;
    if (Width <= Height)
      v81 = Height;
    else
      v81 = Width;
    *(float *)&v79 = (float)v81;
    *(float *)&v77 = a8;
    *(float *)&v78 = a9;
    *(float *)&v76 = self->_renderingLensFocalLength_mm;
    -[VideoMattingMetal blurRadiusAndStdAtInfinityForFocalLength:focusCanonicalDisparity:fNumber:xResolution:useNewCoCFormula:](self, "blurRadiusAndStdAtInfinityForFocalLength:focusCanonicalDisparity:fNumber:xResolution:useNewCoCFormula:", v80, v76, v77, v78, v79);
    v83 = v82;
    v85 = v84;
    frameIndex = self->_frameIndex;
    v87 = (Height >> 1) - 1;
    if ((Height >> 1) <= 1)
    {
      NSLog(CFSTR("ERROR: largestCoprimeFactor bad argument"));
      v87 = 0;
    }
    v88 = ceilf(a11);
    if (a11 < 0.0)
      v89 = 4.0;
    else
      v89 = v88;
    v90 = 1.0;
    if (a11 >= 0.0)
      v90 = exp2f(a11 - v88);
    -[CVAFilterColorAlphaToFgBg encodeToCommandBuffer:srcColorTex:srcAlphaTex:dstForegroundTex:dstBackgroundTex:](self->_colorAlphaToFgBg, "encodeToCommandBuffer:srcColorTex:srcAlphaTex:dstForegroundTex:dstBackgroundTex:", v34, v54, v103, 0, self->_bg);
    if (self->_renderingUsesPostprocessing && v104)
      v91 = &OBJC_IVAR___VideoMattingMetal__smoothDisparity;
    else
      v91 = &OBJC_IVAR___VideoMattingMetal__disparity;
    -[VideoMattingMetal encodeDisparitySmoothingToCommandBuffer:disparity:](self, "encodeDisparitySmoothingToCommandBuffer:disparity:", v34, *(Class *)((char *)&self->super.super.isa + 8 * (self->_frameIndex & 1) + *v91));
    if (self->_isBgColorLutBlack)
    {
      v93 = self->_bg;
    }
    else
    {
      LODWORD(v92) = v85;
      -[CVAFilterMaskedVariableBlur encodeToCommandBuffer:source:destination:mask:maxBlurRadius:](self->_maskedVariableBlur, "encodeToCommandBuffer:source:destination:mask:maxBlurRadius:", v34, self->_bg, self->_blurredBg, self->_coc, v92);
      v93 = self->_blurredBg;
    }
    v96 = (unint64_t)v83 << 32;
    if (!(_DWORD)v80)
      v96 = 0;
    LODWORD(v101) = (int)v89;
    *(float *)&v94 = v90;
    *(float *)&v95 = a14;
    -[CVAFilterRenderComposite encodeToCommandBuffer:srcForegroundTex:srcBackgroundTex:srcCocTex:dstYTex:dstUVTex:fgColorLut:bgColorLut:frameNumber:seedGeneratorFactor:noiseBits:noiseBitsFactor:cubeIntensity:maxBlurRadius:](self->_renderComposite, "encodeToCommandBuffer:srcForegroundTex:srcBackgroundTex:srcCocTex:dstYTex:dstUVTex:fgColorLut:bgColorLut:frameNumber:seedGeneratorFactor:noiseBits:noiseBitsFactor:cubeIntensity:maxBlurRadius:", v34, v54, v93, self->_coc, v121, v120, v94, v95, self->_fgColorLut, self->_bgColorLut, __PAIR64__(v87, frameIndex), v101, v96 | v80);

    v59 = a16;
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_renderingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = sub_1B569E73C;
  v112[3] = &unk_1E6937168;
  v116 = a5;
  v117 = v108;
  v115 = pixelBuffer;
  v112[4] = self;
  v97 = v106;
  v113 = v97;
  v98 = v107;
  v114 = v98;
  v118 = v59;
  objc_msgSend(v34, "addCompletedHandler:", v112);
  objc_msgSend(v34, "commit");

  self->_lastCommittedCommand = 3;
  if (a17)
    ++self->_frameIndex;

}

- (void)renderStageLightWithSource:(const __CVBuffer *)a3 alpha:(const __CVBuffer *)a4 canonicalDisparity:(const __CVBuffer *)a5 dstColor:(__CVBuffer *)a6 blackBackgroundIntensity:(float)a7 vignetteIntensity:(float)a8 isFinalStage:(BOOL)a9 callbackQueue:(id)a10 withCallback:(id)a11
{
  _BOOL4 v11;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  VideoMattingMetal *v35;
  id v36;
  const __CVBuffer *v37;
  const __CVBuffer *v38;
  const __CVBuffer *v39;
  __CVBuffer *v40;
  id v41;
  id v42[2];

  v11 = a9;
  v32 = a10;
  v31 = a11;
  if (a7 < 0.0 || a7 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 2946, CFSTR("blackBackgroundIntensity not in [0,1]"));

  }
  v42[0] = 0;
  v41 = 0;
  sub_1B56A2634(a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a3, v21, 0, self->_textureCache);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  sub_1B56A2634(a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a4, v23, 0, self->_textureCache);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  CVPixelBufferRetain(a3);
  CVPixelBufferRetain(a4);
  CVPixelBufferRetain(a5);
  CVPixelBufferRetain(a6);
  +[VideoMattingMetal decomposeYuvPixelBuffer:yTexture:uvTexture:textureCache:](VideoMattingMetal, "decomposeYuvPixelBuffer:yTexture:uvTexture:textureCache:", a6, v42, &v41, self->_textureCache);
  objc_msgSend(v42[0], "setLabel:", CFSTR("dstColorTex_Y"));
  objc_msgSend(v41, "setLabel:", CFSTR("dstColorTex_uv"));
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setLabel:", CFSTR("renderContinuousWithSource"));
  *(float *)&v26 = a7;
  *(float *)&v27 = a8;
  -[CVAFilterRenderStagelight encodeToCommandBuffer:srcColorTex:srcAlphaTex:dstYTex:dstUVTex:stageLightProxyLut:stageLightLut:blackBackgroundIntensity:vignetteIntensity:](self->_stagelightFilter, "encodeToCommandBuffer:srcColorTex:srcAlphaTex:dstYTex:dstUVTex:stageLightProxyLut:stageLightLut:blackBackgroundIntensity:vignetteIntensity:", v25, v22, v24, v42[0], v41, self->_stageLightProxyLut, v26, v27, self->_stageLightLut);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_renderingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1B569E64C;
  v33[3] = &unk_1E6937168;
  v37 = a3;
  v38 = a4;
  v39 = a5;
  v28 = v32;
  v34 = v28;
  v35 = self;
  v29 = v31;
  v36 = v29;
  v40 = a6;
  objc_msgSend(v25, "addCompletedHandler:", v33);
  objc_msgSend(v25, "commit");

  self->_lastCommittedCommand = 3;
  if (v11)
    ++self->_frameIndex;

}

- (void)encode420HybridDownsamplingToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5
{
  id v9;
  __CVBuffer *yuvSourceDownsampledBuffer;
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  size_t v14;
  size_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  MTLTexture *v20;
  MTLTexture *yuvSourceDownsampledTexture;
  void *v22;
  id v23;

  v9 = a3;
  yuvSourceDownsampledBuffer = self->_yuvSourceDownsampledBuffer;
  v23 = v9;
  if (!yuvSourceDownsampledBuffer)
  {
    Width = CVPixelBufferGetWidth(a4);
    Height = CVPixelBufferGetHeight(a4);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    v14 = Width >> 1;
    v15 = Height >> 1;
    self->_yuvSourceDownsampledBuffer = -[VideoMattingMetal createCVBufferWithWidth:height:format:](self, "createCVBufferWithWidth:height:format:", v14, v15, PixelFormatType);
    +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "containsObject:", v17);

    if ((v18 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 3083, CFSTR("Unexpected source format in encode420HybridDownsamplingToCommandBuffer()!"));

    }
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 500, v14, v15, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setUsage:", 1);
    +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", self->_yuvSourceDownsampledBuffer, v19, 0, self->_textureCache);
    v20 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    yuvSourceDownsampledTexture = self->_yuvSourceDownsampledTexture;
    self->_yuvSourceDownsampledTexture = v20;

    yuvSourceDownsampledBuffer = self->_yuvSourceDownsampledBuffer;
    v9 = v23;
  }
  -[VideoMattingMetal encode420Bilinear2xDownsamplingToCommandBuffer:source:destination:](self, "encode420Bilinear2xDownsamplingToCommandBuffer:source:destination:", v9, a4, yuvSourceDownsampledBuffer);
  -[VideoMattingMetal encode420ScalingByMPSToCommandBuffer:source:destination:](self, "encode420ScalingByMPSToCommandBuffer:source:destination:", v23, self->_yuvSourceDownsampledBuffer, a5);

}

- (void)downsampleWithHWScalerSource:(__CVBuffer *)a3 destination:(__CVBuffer *)a4
{
  void *v8;
  size_t v9;
  size_t v10;
  uint64_t PixelFormatType;
  void *v12;
  MTLTexture *v13;
  MTLTexture *yuvSourceDownsampledTexture;
  __CFDictionary *Mutable;
  const void *v16;
  void *v17;

  if (!self->_yuvSourceDownsampledBuffer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 3125, CFSTR("Relighting code should be rewritten to support different scale!"));

    v9 = CVPixelBufferGetWidth(a3) >> 2;
    v10 = CVPixelBufferGetHeight(a3) >> 2;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    self->_yuvSourceDownsampledBuffer = -[VideoMattingMetal createCVBufferWithWidth:height:format:](self, "createCVBufferWithWidth:height:format:", v9, v10, PixelFormatType);
    if ((_DWORD)PixelFormatType != 875704422)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 3133, CFSTR("Unexpected source format in downsampleWithHWScalerSource()!"));

    }
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 500, v9, v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUsage:", 3);
    +[VideoMattingMetal textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:](VideoMattingMetal, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", self->_yuvSourceDownsampledBuffer, v12, 0, self->_textureCache);
    v13 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    yuvSourceDownsampledTexture = self->_yuvSourceDownsampledTexture;
    self->_yuvSourceDownsampledTexture = v13;

  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v16 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D3A328], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0D3A280], v16);
  CVPixelBufferGetIOSurface(a3);
  CVPixelBufferGetIOSurface(self->_yuvSourceDownsampledBuffer);
  IOSurfaceAcceleratorTransformSurface();
  CVPixelBufferGetIOSurface(self->_yuvSourceDownsampledBuffer);
  CVPixelBufferGetIOSurface(a4);
  IOSurfaceAcceleratorTransformSurface();
  CFRelease(Mutable);
}

- (void)cropFrame:(const __CVBuffer *)a3 destination:(__CVBuffer *)a4 rect:(CGRect)a5
{
  CVPixelBufferGetWidth(a4);
  CVPixelBufferGetHeight(a4);
  CVPixelBufferGetIOSurface(a3);
  CVPixelBufferGetIOSurface(a4);
  IOSurfaceAcceleratorTransformSurface();
}

- (void)encode420Bilinear2xDownsamplingToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5
{
  size_t Width;
  size_t Height;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int64x2_t v27;
  uint64_t v28;
  _QWORD v29[3];
  int64x2_t v30;
  uint64_t v31;
  _QWORD v32[3];

  v26 = a3;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  IOSurface = CVPixelBufferGetIOSurface(a4);
  v11 = CVPixelBufferGetIOSurface(a5);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0);
  v12 = Width >> 1;
  v13 = Height >> 1;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, Width >> 1, Height >> 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v21, IOSurface, 0);
  v22 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v24, IOSurface, 1);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width >> 1, Height >> 1, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = Width >> 2;
  v15 = Height >> 2;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, v14, Height >> 2, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUsage:", 3);
  objc_msgSend(v16, "setUsage:", 3);
  v17 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v25, v11, 0);
  v18 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v16, v11, 1);
  objc_msgSend(v26, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLabel:", CFSTR("_halfDownSampler"));
  objc_msgSend(v19, "setComputePipelineState:", self->_halfDownSampler);
  objc_msgSend(v19, "setTexture:atIndex:", v23, 0);
  objc_msgSend(v19, "setTexture:atIndex:", v17, 1);
  v32[0] = (v12 + 15) >> 4;
  v32[1] = (v13 + 15) >> 4;
  v32[2] = 1;
  v30 = vdupq_n_s64(0x10uLL);
  v31 = 1;
  objc_msgSend(v19, "dispatchThreadgroups:threadsPerThreadgroup:", v32, &v30);
  objc_msgSend(v19, "endEncoding");
  objc_msgSend(v26, "computeCommandEncoder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setLabel:", CFSTR("_halfDownSampler"));
  objc_msgSend(v20, "setComputePipelineState:", self->_halfDownSampler);
  objc_msgSend(v20, "setTexture:atIndex:", v22, 0);
  objc_msgSend(v20, "setTexture:atIndex:", v18, 1);
  v29[0] = (v14 + 15) >> 4;
  v29[1] = (v15 + 15) >> 4;
  v29[2] = 1;
  v27 = vdupq_n_s64(0x10uLL);
  v28 = 1;
  objc_msgSend(v20, "dispatchThreadgroups:threadsPerThreadgroup:", v29, &v27);
  objc_msgSend(v20, "endEncoding");

}

- (void)encode420ScalingByMPSToCommandBuffer:(id)a3 source:(__CVBuffer *)a4 destination:(__CVBuffer *)a5
{
  size_t Width;
  size_t Height;
  size_t v11;
  size_t v12;
  unint64_t v13;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  Width = CVPixelBufferGetWidth(a4);
  Height = CVPixelBufferGetHeight(a4);
  v11 = CVPixelBufferGetWidth(a5);
  v12 = CVPixelBufferGetHeight(a5);
  v13 = v12;
  if (v11 <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 3303, CFSTR("targetWidth not in [2, inf)"));

    if (v13 > 1)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VideoMattingMetal.mm"), 3304, CFSTR("targetHeight not in [2, inf)"));

    goto LABEL_3;
  }
  if (v12 <= 1)
    goto LABEL_5;
LABEL_3:
  IOSurface = CVPixelBufferGetIOSurface(a4);
  v15 = CVPixelBufferGetIOSurface(a5);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, Width >> 1, Height >> 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v27, IOSurface, 0);
  v18 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v16, IOSurface, 1);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v11, v13, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, v11 >> 1, v13 >> 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUsage:", 3);
  objc_msgSend(v20, "setUsage:", 3);
  v21 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v19, v15, 0);
  v22 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v20, v15, 1);
  -[CVAFilterHybridResampling scaler](self->_hybridResampler, "scaler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v28, v17, v21);

  -[CVAFilterHybridResampling scaler](self->_hybridResampler, "scaler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v28, v18, v22);

}

- (void)encodeFillAlphaToCommandBuffer:(id)a3 alpha:(id)a4
{
  id v6;
  void *v7;
  int64x2_t v8;
  uint64_t v9;
  _QWORD v10[3];

  v6 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabel:", CFSTR("_alphaFillKernel"));
  objc_msgSend(v7, "setComputePipelineState:", self->_alphaFillKernel);
  objc_msgSend(v7, "setTexture:atIndex:", v6, 0);
  v10[0] = (unint64_t)(objc_msgSend(v6, "width") + 15) >> 4;
  v10[1] = (unint64_t)(objc_msgSend(v6, "height") + 15) >> 4;
  v10[2] = 1;
  v8 = vdupq_n_s64(0x10uLL);
  v9 = 1;
  objc_msgSend(v7, "dispatchThreadgroups:threadsPerThreadgroup:", v10, &v8);
  objc_msgSend(v7, "endEncoding");

}

- (float)renderingDisparityUpdateRate
{
  return self->_renderingDisparityUpdateRate;
}

- (void)setRenderingDisparityUpdateRate:(float)a3
{
  self->_renderingDisparityUpdateRate = a3;
}

- (BOOL)bypassShiftCleanup
{
  return self->_bypassShiftCleanup;
}

- (void)setBypassShiftCleanup:(BOOL)a3
{
  self->_bypassShiftCleanup = a3;
}

- (MTLTexture)colorSim
{
  return (MTLTexture *)objc_getProperty(self, a2, 1160, 1);
}

- (MTLTexture)filteredBeforeSmoothDisparity
{
  return (MTLTexture *)objc_getProperty(self, a2, 1168, 1);
}

- (NSDictionary)sbufMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setSbufMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1112);
}

- (CGRect)primaryCaptureRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_primaryCaptureRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPrimaryCaptureRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_primaryCaptureRect, &v3, 32, 1, 0);
}

- (BOOL)isBgColorLutBlack
{
  return self->_isBgColorLutBlack;
}

- (void)setIsBgColorLutBlack:(BOOL)a3
{
  self->_isBgColorLutBlack = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredBeforeSmoothDisparity, 0);
  objc_storeStrong((id *)&self->_colorSim, 0);
  objc_storeStrong((id *)&self->_sbufMetadata, 0);
  objc_storeStrong((id *)&self->_foregroundRatioBuffer, 0);
  objc_storeStrong((id *)&self->_globalReductionAverage, 0);
  objc_storeStrong((id *)&self->_ptRenderRequest, 0);
  objc_storeStrong((id *)&self->_ptRenderState, 0);
  objc_storeStrong((id *)&self->_ptRenderPipeline, 0);
  objc_storeStrong((id *)&self->_mattingCallbackSemaphore, 0);
  objc_storeStrong((id *)&self->_synchronousMattingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_renderingCallbackSemaphore, 0);
  objc_storeStrong((id *)&self->_synchronousRenderingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_lastStageLightCubeData, 0);
  objc_storeStrong((id *)&self->_lastStageLightProxyCubeData, 0);
  objc_storeStrong((id *)&self->_lastFgLutData, 0);
  objc_storeStrong((id *)&self->_lastBgLutData, 0);
  objc_storeStrong((id *)&self->_yuvSourceDownsampledTexture, 0);
  objc_storeStrong((id *)&self->_smoothFilter, 0);
  objc_storeStrong((id *)&self->_facemaskRegionTexture, 0);
  objc_storeStrong((id *)&self->_tempFloatR32FloatTexture, 0);
  objc_storeStrong((id *)&self->_scaledSource[1], 0);
  objc_storeStrong((id *)self->_scaledSource, 0);
  objc_storeStrong((id *)&self->_correctlyRotatedAndReshapedSegmentation, 0);
  objc_storeStrong((id *)&self->_alphaNoPostprocessing, 0);
  objc_storeStrong((id *)&self->_distanceToForegroundTexture, 0);
  objc_storeStrong((id *)&self->_isForegroundTexture, 0);
  objc_storeStrong((id *)&self->_coeffHistory[1], 0);
  objc_storeStrong((id *)self->_coeffHistory, 0);
  objc_storeStrong((id *)&self->_coeff, 0);
  objc_storeStrong((id *)&self->_outputCanonicalDisparity, 0);
  objc_storeStrong((id *)&self->_initDisparity, 0);
  objc_storeStrong((id *)&self->_invalidDisparityMaskTexture, 0);
  objc_storeStrong((id *)&self->_bgFillTempTexture, 0);
  objc_storeStrong((id *)&self->_edgeAwareFillTempTexture, 0);
  objc_storeStrong((id *)&self->_domainTransformYTexture, 0);
  objc_storeStrong((id *)&self->_domainTransformXTexture, 0);
  objc_storeStrong((id *)&self->_distanceFromKnownDisparityTexture, 0);
  objc_storeStrong((id *)&self->_disparityIsValidTexture, 0);
  objc_storeStrong((id *)&self->_diffusionMapTexture, 0);
  objc_storeStrong((id *)&self->_roughDisparity, 0);
  objc_storeStrong((id *)&self->_smoothDisparity[1], 0);
  objc_storeStrong((id *)self->_smoothDisparity, 0);
  objc_storeStrong((id *)&self->_smoothConfidence[1], 0);
  objc_storeStrong((id *)self->_smoothConfidence, 0);
  objc_storeStrong((id *)&self->_disparityConfidenceMaskTexture, 0);
  objc_storeStrong((id *)&self->_temporallyFilteredDisparity, 0);
  objc_storeStrong((id *)&self->_filledDisparityNoInvalidTexture, 0);
  objc_storeStrong((id *)&self->_filledDisparityTexture, 0);
  objc_storeStrong((id *)&self->_facemaskDisparity, 0);
  objc_storeStrong((id *)&self->_disparity[1], 0);
  objc_storeStrong((id *)self->_disparity, 0);
  objc_storeStrong((id *)&self->_disparityLastValidValue[1], 0);
  objc_storeStrong((id *)self->_disparityLastValidValue, 0);
  objc_storeStrong((id *)&self->_gfWeight, 0);
  objc_storeStrong((id *)&self->_gfForegroundMask, 0);
  objc_storeStrong((id *)&self->_fgMaskErosionKernel, 0);
  objc_storeStrong((id *)&self->_fgBlurBoxKernel, 0);
  objc_storeStrong((id *)&self->_disparityBlurBoxKernel, 0);
  objc_storeStrong((id *)&self->_stageLightLut, 0);
  objc_storeStrong((id *)&self->_stageLightProxyLut, 0);
  objc_storeStrong((id *)&self->_fgColorLut, 0);
  objc_storeStrong((id *)&self->_bgColorLut, 0);
  objc_storeStrong((id *)&self->_disparityInScreenAspectRatio, 0);
  objc_storeStrong((id *)&self->_coc, 0);
  objc_storeStrong((id *)&self->_shift[1], 0);
  objc_storeStrong((id *)self->_shift, 0);
  objc_storeStrong((id *)&self->_deweightedDisparity, 0);
  objc_storeStrong((id *)&self->_blurredBg, 0);
  objc_storeStrong((id *)&self->_bg, 0);
  objc_storeStrong((id *)&self->_bTexture, 0);
  objc_storeStrong((id *)&self->_gTexture, 0);
  objc_storeStrong((id *)&self->_rTexture, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_guidedFilterWeightKernel, 0);
  objc_storeStrong((id *)&self->_temporalCoefficientsFilterKernel, 0);
  objc_storeStrong((id *)&self->_colorSimL1Kernel, 0);
  objc_storeStrong((id *)&self->_colorSimKernel, 0);
  objc_storeStrong((id *)&self->_halfDownSampler, 0);
  objc_storeStrong((id *)&self->_maskedVariableBlur, 0);
  objc_storeStrong((id *)&self->_rotateAndFitIntoRectKernel, 0);
  objc_storeStrong((id *)&self->_renderingDisparityFillAndFilterKernel, 0);
  objc_storeStrong((id *)&self->_disparityConfig, 0);
  objc_storeStrong((id *)&self->_renderingDisparityDeweightKernel, 0);
  objc_storeStrong((id *)&self->_temporalDisparityFilterKernel_fallbackToInvalid, 0);
  objc_storeStrong((id *)&self->_temporalDisparityFilterKernel, 0);
  objc_storeStrong((id *)&self->_roughDisparityKernel, 0);
  objc_storeStrong((id *)&self->_updateConfidenceAndLastValidDisparityKernel_useTemporalConfidence, 0);
  objc_storeStrong((id *)&self->_updateConfidenceAndLastValidDisparityKernel, 0);
  objc_storeStrong((id *)&self->_simpleConfidenceKernel, 0);
  objc_storeStrong((id *)&self->_disparityCleanupKernel_firstFrame, 0);
  objc_storeStrong((id *)&self->_disparityCleanupKernel, 0);
  objc_storeStrong((id *)&self->_alphaFillKernel, 0);
  objc_storeStrong((id *)&self->_disparityDecimateKernel, 0);
  objc_storeStrong((id *)&self->_internalDisparityToCanonicalDisparityKernel, 0);
  objc_storeStrong((id *)&self->_bgFillYKernel, 0);
  objc_storeStrong((id *)&self->_bgFillXKernel, 0);
  objc_storeStrong((id *)&self->_invalidDisparityMaskKernel, 0);
  objc_storeStrong((id *)&self->_edgeAwareFillYKernel, 0);
  objc_storeStrong((id *)&self->_edgeAwareFillXKernel, 0);
  objc_storeStrong((id *)&self->_domainTransformYKernel, 0);
  objc_storeStrong((id *)&self->_domainTransformXKernel, 0);
  objc_storeStrong((id *)&self->_disparityIsValidKernel, 0);
  objc_storeStrong((id *)&self->_disparityMasksKernel, 0);
  objc_storeStrong((id *)&self->_disparityConfidenceMaskKernel, 0);
  objc_storeStrong((id *)&self->_fillBackgroundDisparityKernel_faceMask, 0);
  objc_storeStrong((id *)&self->_fillBackgroundDisparityKernel, 0);
  objc_storeStrong((id *)&self->_diffusionMapKernel, 0);
  objc_storeStrong((id *)&self->_infConvolution, 0);
  objc_storeStrong((id *)&self->_diffusion, 0);
  objc_storeStrong((id *)&self->_distanceTransform, 0);
  objc_storeStrong((id *)&self->_renderComposite, 0);
  objc_storeStrong((id *)&self->_colorAlphaToFgBg, 0);
  objc_storeStrong((id *)&self->_stagelightFilter, 0);
  objc_storeStrong((id *)&self->_cvaGuidedFilter, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_hybridResampler, 0);
  objc_storeStrong((id *)&self->_boxFilter, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_defaultLibrary, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)saveTexture:(id)a3 toFilename:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  FILE *v17;
  void *v18;
  _QWORD v19[6];

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "pixelFormat") != 252 && objc_msgSend(v7, "pixelFormat") != 55)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VideoMattingMetal.mm"), 3376, CFSTR("unsupported pixel format!"));

  }
  v9 = objc_msgSend(v7, "width");
  v10 = objc_msgSend(v7, "height");
  v11 = (double)v10;
  v12 = malloc_type_malloc(vcvtd_n_u64_f64((double)v9 * (double)v10, 2uLL), 0x4E58DF16uLL);
  v13 = vcvtd_n_u64_f64((double)v9, 2uLL);
  memset(v19, 0, 24);
  v19[3] = (unint64_t)(double)v9;
  v19[4] = (unint64_t)(double)v10;
  v19[5] = 1;
  objc_msgSend(v7, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v12, v13, v19, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_32f_%dx%d.raw"), v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_retainAutorelease(v15);
  v17 = fopen((const char *)objc_msgSend(v16, "cStringUsingEncoding:", 4), "wb");
  fwrite(v12, 4uLL, (unint64_t)((double)(v13 >> 2) * v11), v17);
  fclose(v17);
  free(v12);

}

+ (id)textureFromCacheUsingPixelBuffer:(__CVBuffer *)a3 textureDescriptor:(id)a4 plane:(unint64_t)a5 textureCache:(__CVMetalTextureCache *)a6
{
  id v10;
  void *v11;
  void *v12;
  const __CFDictionary *v13;
  MTLPixelFormat v14;
  size_t v15;
  size_t v16;
  uint64_t v17;
  __CVBuffer *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  CVMetalTextureRef image;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  image = 0;
  v26[0] = *MEMORY[0x1E0CA8F58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "usage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v26[1] = *MEMORY[0x1E0CA8F50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "storageMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  v13 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v14 = objc_msgSend(v10, "pixelFormat");
  v15 = objc_msgSend(v10, "width");
  v16 = objc_msgSend(v10, "height");
  v17 = CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a6, a3, v13, v14, v15, v16, a5, &image);

  if ((_DWORD)v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VideoMattingMetal.mm"), 3414, CFSTR("Cannot get textureRef from cache. Error code %ul"), v17);

  }
  v18 = image;
  if (!image)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VideoMattingMetal.mm"), 3415, CFSTR("Cannot get textureRef from cache"));

    v18 = image;
  }
  CVMetalTextureGetTexture(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(image);
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VideoMattingMetal.mm"), 3420, CFSTR("Cannot get texture from textureRef"));

  }
  return v19;
}

+ (void)decomposeYuvPixelBuffer:(__CVBuffer *)a3 yTexture:(id *)a4 uvTexture:(id *)a5 textureCache:(__CVMetalTextureCache *)a6
{
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  size_t WidthOfPlane;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v27;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", PixelFormatType);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "containsObject:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats](CVAVideoPipelineProperties_Impl, "allSupportedYCbCrPixelFormats");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VideoMattingMetal.mm"), 3437, CFSTR("yuvBuffer is not one of %@"), v23);

  }
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUsage:", 3);
  v15 = (void *)MEMORY[0x1E0CC6BB0];
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  objc_msgSend(v15, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, WidthOfPlane, CVPixelBufferGetHeightOfPlane(a3, 1uLL), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUsage:", 3);
  objc_msgSend(a1, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *a4;
  *a4 = v18;

  objc_msgSend(a1, "textureFromCacheUsingPixelBuffer:textureDescriptor:plane:textureCache:", a3, v17, 1, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *a5;
  *a5 = v20;

}

@end
