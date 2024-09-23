@implementation BWRectificationInferenceProvider

+ (void)initialize
{
  objc_opt_class();
}

- (BWRectificationInferenceProvider)initWithRefInputRequirement:(id)a3 auxInputRequirement:(id)a4 refKeypointsInputRequirement:(id)a5 auxKeypointsInputRequirement:(id)a6 refOutputRequirement:(id)a7 auxOutputRequirement:(id)a8 opticalFlowOutputRequirement:(id)a9 originalRefRequirement:(id)a10 originalAuxRequirement:(id)a11 resourceProvider:(id)a12 configuration:(id)a13
{
  char *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)BWRectificationInferenceProvider;
  v19 = -[BWRectificationInferenceProvider init](&v21, sel_init);
  if (v19)
  {
    *((_QWORD *)v19 + 1) = a3;
    *((_QWORD *)v19 + 2) = a4;
    *((_QWORD *)v19 + 3) = a5;
    *((_QWORD *)v19 + 4) = a6;
    *((_QWORD *)v19 + 5) = a7;
    *((_QWORD *)v19 + 6) = a8;
    *((_QWORD *)v19 + 7) = a9;
    *((_QWORD *)v19 + 8) = a10;
    *((_QWORD *)v19 + 9) = a11;
    *((_QWORD *)v19 + 89) = (id)objc_msgSend(a13, "cameraInfoByPortType");
    *((_QWORD *)v19 + 91) = (id)objc_msgSend((id)objc_msgSend(a12, "defaultDeviceMetalContext"), "commandQueue");
    v19[784] = 1;
    *((_DWORD *)v19 + 202) = 2;
    *((_QWORD *)v19 + 102) = 1;
    v19[832] = 1;
    *(_QWORD *)(v19 + 836) = 0;
    *(_QWORD *)(v19 + 844) = 0x3A83126F00000000;
    *(_OWORD *)(v19 + 792) = 0u;
  }
  return (BWRectificationInferenceProvider *)v19;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  __CVBuffer *zoomedAux;
  double *adaptiveCorrectionKeypointsReferenceDistorted;
  double *adaptiveCorrectionKeypointsAuxiliaryDistorted;
  objc_super v7;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  zoomedAux = self->_zoomedAux;
  if (zoomedAux)
    CFRelease(zoomedAux);

  adaptiveCorrectionKeypointsReferenceDistorted = self->_adaptiveCorrectionKeypointsReferenceDistorted;
  if (adaptiveCorrectionKeypointsReferenceDistorted)
  {
    self->_adaptiveCorrectionKeypointsReferenceDistorted = 0;
    free(adaptiveCorrectionKeypointsReferenceDistorted);
  }
  adaptiveCorrectionKeypointsAuxiliaryDistorted = self->_adaptiveCorrectionKeypointsAuxiliaryDistorted;
  if (adaptiveCorrectionKeypointsAuxiliaryDistorted)
  {
    self->_adaptiveCorrectionKeypointsAuxiliaryDistorted = 0;
    free(adaptiveCorrectionKeypointsAuxiliaryDistorted);
  }
  v7.receiver = self;
  v7.super_class = (Class)BWRectificationInferenceProvider;
  -[BWRectificationInferenceProvider dealloc](&v7, sel_dealloc);
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  uint64_t v4;
  void *v5;
  Calibration *v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  objc_class *v12;
  NSDictionary *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  DisparityTuningParameters *v17;
  uint64_t v18;
  NSDictionary *cameraInfoByPortType;
  BWInferenceVideoFormat *v20;
  BWInferenceVideoFormat *v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  Demosaic *v29;
  uint64_t v30;
  uint64_t v31;
  GDCTransform *v32;
  size_t v33;
  double *v34;
  double *v35;
  BWInferenceVideoRequirement *opticalFlowOutputRequirement;
  PTDisparityPostProcessing *disparityPostProcessor;
  NSUInteger v38;
  NSUInteger v39;
  unint64_t v40;
  unint64_t v41;
  NSUInteger v42;
  NSUInteger v43;
  id v44;
  uint64_t v45;
  PTDisparityPostProcessing *v46;
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/VideoProcessors/DisparityV5.bundle"));
  if (!v4)
    goto LABEL_26;
  v5 = (void *)v4;
  self->_metalContext = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", v4, self->_commandQueue);
  if (!objc_msgSend(v5, "classNamed:", CFSTR("Calibration")))
    goto LABEL_26;
  v6 = (Calibration *)objc_opt_new();
  self->_calibration = v6;
  if (!v6)
  {
    fig_log_get_emitter();
LABEL_32:
    FigDebugAssert3();
LABEL_20:
    LODWORD(opticalFlowOutputRequirement) = 0;
    return (int)opticalFlowOutputRequirement;
  }
  v7 = objc_msgSend(v5, "classNamed:", CFSTR("DisparityTuningParameters"));
  if (!v7)
    goto LABEL_26;
  v8 = (objc_class *)v7;
  v9 = objc_msgSend(v5, "classNamed:", CFSTR("LKTKeypointDetector"));
  if (!v9)
    goto LABEL_26;
  v10 = (objc_class *)v9;
  v11 = objc_msgSend(v5, "classNamed:", CFSTR("Demosaic"));
  if (!v11
    || (v12 = (objc_class *)v11,
        (v13 = -[FigCaptureCameraParameters cameraParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "cameraParameters")) == 0)|| (v14 = *MEMORY[0x1E0D06188], v15 = (void *)objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06188]), "objectForKeyedSubscript:", CFSTR("Common")), "objectForKeyedSubscript:", CFSTR("StereoDisparity")), v16 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("V5"))),
        v17 = (DisparityTuningParameters *)objc_msgSend([v8 alloc], "initWithTuningDictionary:cameraInfoByPortType:", objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BaseConfiguration")), self->_cameraInfoByPortType), (self->_disparityTuningParameters = v17) == 0)|| -[DisparityTuningParameters updateTuningParametersWith:](v17, "updateTuningParametersWith:", objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CinematicVideo"))))
  {
LABEL_26:
    fig_log_get_emitter();
LABEL_34:
    FigDebugAssert3();
    LODWORD(opticalFlowOutputRequirement) = -31710;
    return (int)opticalFlowOutputRequirement;
  }
  v18 = *MEMORY[0x1E0D06140];
  v51[0] = v14;
  v51[1] = v18;
  cameraInfoByPortType = self->_cameraInfoByPortType;
  v52[0] = v16;
  v52[1] = cameraInfoByPortType;
  self->_calibrationOptions = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v20 = -[BWInferenceVideoRequirement videoFormat](self->_refInputRequirement, "videoFormat");
  v21 = -[BWInferenceVideoRequirement videoFormat](self->_auxInputRequirement, "videoFormat");
  self->_rectificationWidth = -[BWInferenceVideoFormat width](v20, "width");
  self->_rectificationHeight = -[BWInferenceVideoFormat height](v20, "height");
  v22 = -[DisparityTuningParameters lastScale](self->_disparityTuningParameters, "lastScale");
  v23 = self->_rectificationWidth >> v22;
  self->_keypointGridWidth = v23
                           / -[DisparityTuningParameters blockSize](self->_disparityTuningParameters, "blockSize");
  v24 = self->_rectificationHeight >> v22;
  v25 = v24 / -[DisparityTuningParameters blockSize](self->_disparityTuningParameters, "blockSize");
  self->_keypointGridHeight = v25;
  v26 = v25 * LODWORD(self->_keypointGridWidth);
  -[Calibration allocateResourcesForMaxNumPoints:](self->_calibration, "allocateResourcesForMaxNumPoints:", v26);
  v27 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_originalRefInputRequirement, "videoFormat"), "width");
  v28 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_originalRefInputRequirement, "videoFormat"), "height");
  self->_calibrationWidth = (int)v27;
  self->_calibrationHeight = (int)v28;
  -[Calibration setReferenceBufferDimensions:auxillaryBufferDimensions:normalizedReferenceFinalCropRect:](self->_calibration, "setReferenceBufferDimensions:auxillaryBufferDimensions:normalizedReferenceFinalCropRect:", v27 | ((unint64_t)v28 << 32), v27 | ((unint64_t)v28 << 32), *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  -[Calibration setTemporalCorrectionEnabled:](self->_calibration, "setTemporalCorrectionEnabled:", 1);
  -[Calibration setPixelBufferScalingEnabled:](self->_calibration, "setPixelBufferScalingEnabled:", 1);
  self->_adcFramesConverged = 0;
  v29 = (Demosaic *)objc_msgSend([v12 alloc], "initWithMetalContext:", self->_metalContext);
  self->_auxiliaryDemosaic = v29;
  if (!v29)
  {
    fig_log_get_emitter();
    goto LABEL_32;
  }
  self->_lktKeypointDetector = (LKTKeypointDetector *)objc_msgSend([v10 alloc], "initWithMetalContext:width:height:nscales:lastScale:", self->_metalContext, self->_rectificationWidth, self->_rectificationHeight, 0xFFFFFFFFLL, v22);
  -[LKTKeypointDetector setNwarpings:](self->_lktKeypointDetector, "setNwarpings:", -[DisparityTuningParameters nwarps](self->_disparityTuningParameters, "nwarps"));
  v30 = -[BWInferenceVideoFormat width](v20, "width");
  if (v30 != -[BWInferenceVideoFormat width](v21, "width"))
    goto LABEL_33;
  v31 = -[BWInferenceVideoFormat height](v20, "height");
  if (v31 != -[BWInferenceVideoFormat height](v21, "height"))
    goto LABEL_33;
  self->_refInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, self->_rectificationWidth, self->_rectificationHeight, 0);
  self->_auxInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, self->_rectificationWidth, self->_rectificationHeight, 0);
  self->_refKeypointsInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, self->_rectificationWidth, self->_rectificationHeight, 0);
  self->_auxKeypointsInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, self->_rectificationWidth, self->_rectificationHeight, 0);
  self->_refOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_refOutputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_refOutputRequirement, "videoFormat"), "height"), 0);
  self->_auxOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_auxOutputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_auxOutputRequirement, "videoFormat"), "height"), 0);
  v32 = (GDCTransform *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B38]), "initWithOptionalCommandQueue:", -[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
  self->_gdcTransform = v32;
  if (!v32
    || (self->_zoomedAux = (__CVBuffer *)CreatePixelBuffer(),
        v33 = 16 * v26,
        v34 = (double *)malloc_type_malloc(v33, 0x677E66ECuLL),
        (self->_adaptiveCorrectionKeypointsReferenceDistorted = v34) == 0)
    || (v35 = (double *)malloc_type_malloc(v33, 0x201EC6E7uLL),
        (self->_adaptiveCorrectionKeypointsAuxiliaryDistorted = v35) == 0))
  {
LABEL_33:
    fig_log_get_emitter();
    goto LABEL_34;
  }
  opticalFlowOutputRequirement = self->_opticalFlowOutputRequirement;
  if (opticalFlowOutputRequirement)
  {
    self->_opticalFlowDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](opticalFlowOutputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_opticalFlowOutputRequirement, "videoFormat"), "height"), 0);
    disparityPostProcessor = self->_disparityPostProcessor;
    if (disparityPostProcessor)

    v38 = -[MTLTextureDescriptor width](self->_refOutputDescriptor, "width");
    v39 = -[MTLTextureDescriptor height](self->_refOutputDescriptor, "height");
    v40 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_opticalFlowOutputRequirement, "videoFormat"), "width");
    v41 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_opticalFlowOutputRequirement, "videoFormat"), "height");
    v42 = -[MTLTextureDescriptor width](self->_refOutputDescriptor, "width");
    v43 = -[MTLTextureDescriptor height](self->_refOutputDescriptor, "height");
    v44 = objc_alloc((Class)getPTDisparityPostProcessingClass());
    v45 = -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
    v50[0] = v38;
    v50[1] = v39;
    v50[2] = 1;
    v49[0] = v42;
    v49[1] = v43;
    v49[2] = 1;
    v48[0] = v40;
    v48[1] = v41;
    v48[2] = 1;
    v46 = (PTDisparityPostProcessing *)objc_msgSend(v44, "initWithCommandQueue:disparitySize:filteredDisparitySize:disparityPixelFormat:colorSize:colorPixelFormat:sensorPort:", v45, v50, v49, 25, v48, 71, &stru_1E4928818);
    self->_disparityPostProcessor = v46;
    if (v46)
      goto LABEL_20;
    fig_log_get_emitter();
    FigDebugAssert3();
    LODWORD(opticalFlowOutputRequirement) = -31702;
  }
  return (int)opticalFlowOutputRequirement;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64x2_t *p_calibrationWidth;
  const void *AttachedMedia;
  const __CFString *v13;
  uint64_t v14;
  id v15;
  int v16;
  int v17;
  float v18;
  unint64_t calibrationHeight;
  float v20;
  uint64_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float64x2_t v25;
  float v26;
  unsigned int v27;
  unint64_t v28;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v29;
  char *v30;
  float32x4_t v31;
  uint64_t v32;
  char *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float64_t v40;
  float32x4_t v41;
  float32x4_t v42;
  char *v43;
  uint64_t v44;
  __CVBuffer *v45;
  uint64_t v46;
  __CVBuffer *v47;
  __CVBuffer *v48;
  __CVBuffer *v49;
  uint64_t v50;
  __CVBuffer *v51;
  __CVBuffer *v52;
  void *v53;
  NSDictionary *calibrationOptions;
  DisparityTuningParameters *disparityTuningParameters;
  Calibration *calibration;
  float v57;
  float v58;
  int v59;
  BOOL v60;
  int numFramesSinceAdcSkipOnConflictWithSmartStyleLearning;
  float v62;
  float v63;
  uint64_t v64;
  int v65;
  unint64_t adcFramesConverged;
  Calibration *v67;
  Calibration *v68;
  Calibration *v69;
  Calibration *v70;
  double v71;
  uint64_t v72;
  float *homography;
  float64x2_t v74;
  float32x4_t v75;
  float32x4_t v76;
  uint64_t i;
  uint64_t v78;
  float *inverseHomography;
  float64x2_t v80;
  float32x4_t v81;
  float32x4_t v82;
  uint64_t j;
  float v84;
  unint64_t v85;
  float v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  unint64_t v95;
  float32x4_t v96;
  float32x4_t v97;
  float32x4_t v98;
  id v99;
  uint64_t v100;
  float64x2_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float *v104;
  uint64_t k;
  void *v106;
  uint64_t v107;
  void *v108;
  CGFloat v109;
  double v110;
  BOOL applyRollingShutterCorrection;
  int v112;
  CGFloat v113;
  double v114;
  BOOL v115;
  Calibration *v116;
  uint64_t v117;
  double v118;
  void *v119;
  char v120;
  id v122;
  float32x4_t v123;
  float v124;
  float32x4_t v125;
  __CVBuffer *v126;
  uint64_t v127;
  float32x4_t v128;
  __CVBuffer *v129;
  int64x2_t *v130;
  int v131;
  opaqueCMSampleBuffer *target;
  int v133;
  float v134;
  void *v135;
  __CVBuffer *cf;
  __int128 v137;
  void *v138;
  __int128 v139;
  void *v140;
  float32x4_t v141;
  void *v142;
  CVPixelBufferRef pixelBuffer[2];
  __CVBuffer *pixelBuffera;
  _QWORD v145[6];
  int v146;
  uint64_t v147;
  _OWORD v148[11];
  uint64_t v149;
  float64x2_t v150;
  float32x4_t v151;
  float32x4_t v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  float64x2_t v160;
  float32x4_t v161;
  float32x4_t v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  float64x2_t v170;
  float32x4_t v171;
  float32x4_t v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  unsigned int v180;
  _OWORD v181[32];
  uint64_t v182;
  char *v183;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v184;
  void *v185;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  simd_float3x3 v190;

  p_calibrationWidth = (uint64x2_t *)&self->_calibrationWidth;
  v185 = 0;
  v186 = 0;
  v183 = 0;
  v184 = 0;
  v182 = 0;
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
  v13 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v14 = (uint64_t)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v130 = (int64x2_t *)p_calibrationWidth;
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
    v48 = 0;
    v52 = 0;
    v135 = 0;
    v138 = 0;
    v140 = 0;
    v142 = 0;
    v49 = 0;
    pixelBuffera = 0;
    cf = 0;
    v120 = 0;
    goto LABEL_97;
  }
  v15 = (id)CMGetAttachment(a3, v13, 0);
  if (!v15)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v119 = 0;
    v129 = 0;
    v48 = 0;
    v52 = 0;
    v135 = 0;
    v138 = 0;
    v140 = 0;
    v142 = 0;
    v49 = 0;
    pixelBuffera = 0;
    cf = 0;
LABEL_143:
    v120 = 0;
    v14 = 0;
    goto LABEL_97;
  }
  target = a3;
  v122 = a4;
  v127 = v14;
  if (self->_applyRollingShutterCorrection)
  {
    v133 = -[BWRectificationInferenceProvider _rscForBuffer:withHomograhies:andInverseHomographies:withHomographyStep:]((uint64_t)self, a3, (void **)&v186, &v185, (float *)&v182 + 1);
    if (v133 <= 0)
    {
      fig_log_get_emitter();
      goto LABEL_135;
    }
    v131 = -[BWRectificationInferenceProvider _rscForBuffer:withHomograhies:andInverseHomographies:withHomographyStep:]((uint64_t)self, AttachedMedia, (void **)&v184, (void **)&v183, (float *)&v182);
    if (v131 <= 0)
    {
      fig_log_get_emitter();
      goto LABEL_135;
    }
    v16 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_originalAuxInputRequirement, "videoFormat"), "width");
    v17 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_originalAuxInputRequirement, "videoFormat"), "height");
    v18 = (float)self->_calibrationWidth / (float)v16;
    calibrationHeight = self->_calibrationHeight;
    v20 = (float)calibrationHeight / (float)v17;
    if (v18 != 1.0 || v20 != 1.0)
    {
      v22 = 0;
      v23 = (float32x4_t)LODWORD(v18);
      v24.i32[0] = 0;
      v24.i64[1] = 0;
      v24.f32[1] = (float)calibrationHeight / (float)v17;
      v25 = 0uLL;
      v124 = v24.f32[1];
      v26 = 1.0 / v20;
      *(float *)&v27 = 1.0 / v18;
      LODWORD(v28) = 0;
      *((float *)&v28 + 1) = v26;
      v137 = v28;
      v139 = v27;
      v30 = v183;
      v29 = v184;
      v31 = (float32x4_t)xmmword_1A3161F30;
      v141 = (float32x4_t)v24.u64[0];
      *(_OWORD *)pixelBuffer = v23.u32[0];
      do
      {
        v32 = 0;
        v33 = (char *)v29 + 48 * v22;
        v34 = *((_OWORD *)v33 + 1);
        v35 = *((_OWORD *)v33 + 2);
        v187 = *(_OWORD *)v33;
        v188 = v34;
        v189 = v35;
        v150 = v25;
        v151 = (float32x4_t)v25;
        v152 = (float32x4_t)v25;
        do
        {
          *(float32x4_t *)((char *)&v150 + v32) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(__int128 *)((char *)&v187 + v32))), v24, *(float32x2_t *)((char *)&v187 + v32), 1), v31, *(float32x4_t *)((char *)&v187 + v32), 2);
          v32 += 16;
        }
        while (v32 != 48);
        v36 = 0;
        v37 = (float32x4_t)v150;
        v38 = v151;
        v39 = v152;
        v187 = v139;
        v188 = v137;
        v189 = xmmword_1A3161F30;
        v150 = v25;
        v151 = (float32x4_t)v25;
        v152 = (float32x4_t)v25;
        do
        {
          *(float32x4_t *)((char *)&v150 + v36) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, COERCE_FLOAT(*(__int128 *)((char *)&v187 + v36))), v38, *(float32x2_t *)((char *)&v187 + v36), 1), v39, *(float32x4_t *)((char *)&v187 + v36), 2);
          v36 += 16;
        }
        while (v36 != 48);
        v40 = v150.f64[0];
        v41 = v151;
        v42 = v152;
        *((_DWORD *)v33 + 2) = LODWORD(v150.f64[1]);
        *(float64_t *)v33 = v40;
        *((_DWORD *)v33 + 6) = v41.i32[2];
        *((_DWORD *)v33 + 10) = v42.i32[2];
        *((_QWORD *)v33 + 2) = v41.i64[0];
        *((_QWORD *)v33 + 4) = v42.i64[0];
        v43 = &v30[48 * v22];
        v190 = __invert_f3(*(simd_float3x3 *)v33);
        *((_DWORD *)v43 + 2) = v190.columns[0].i32[2];
        *(_QWORD *)v43 = v190.columns[0].i64[0];
        *((_DWORD *)v43 + 6) = v190.columns[1].i32[2];
        *((_QWORD *)v43 + 2) = v190.columns[1].i64[0];
        *((_DWORD *)v43 + 10) = v190.columns[2].i32[2];
        ++v22;
        *((_QWORD *)v43 + 4) = v190.columns[2].i64[0];
        v24 = v141;
        v23 = *(float32x4_t *)pixelBuffer;
        v25 = 0uLL;
        v31 = (float32x4_t)xmmword_1A3161F30;
      }
      while (v22 != v131);
      *(float *)&v182 = v124 * *(float *)&v182;
      p_calibrationWidth = (uint64x2_t *)v130;
      a4 = v122;
    }
  }
  else
  {
    v131 = 0;
    v133 = 0;
  }
  v44 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_refInputRequirement);
  if (!v44
    || (v45 = (__CVBuffer *)v44,
        (v46 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_refKeypointsInputRequirement)) == 0))
  {
    fig_log_get_emitter();
LABEL_135:
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
    v48 = 0;
    goto LABEL_136;
  }
  v47 = (__CVBuffer *)v46;
  v48 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:", self->_auxInputRequirement);
  if (!v48)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
LABEL_136:
    v52 = 0;
    v135 = 0;
    v138 = 0;
    v140 = 0;
    v142 = 0;
    v49 = 0;
    goto LABEL_137;
  }
  v49 = (__CVBuffer *)objc_msgSend(a4, "pixelBufferForRequirement:", self->_auxKeypointsInputRequirement);
  if (!v49)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
    v48 = 0;
    v52 = 0;
    v135 = 0;
    v138 = 0;
    v140 = 0;
    v142 = 0;
LABEL_137:
    pixelBuffera = 0;
    cf = 0;
    goto LABEL_138;
  }
  v126 = v45;
  v50 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_refOutputRequirement), "newPixelBuffer");
  if (!v50)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
    v48 = 0;
    v52 = 0;
    v135 = 0;
    v138 = 0;
    v140 = 0;
    v142 = 0;
    v49 = 0;
    pixelBuffera = 0;
    cf = 0;
LABEL_140:
    v120 = 0;
    v14 = 4294935578;
    goto LABEL_97;
  }
  v51 = (__CVBuffer *)v50;
  v52 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_auxOutputRequirement), "newPixelBuffer");
  cf = v51;
  if (!v52)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
    v48 = 0;
    v135 = 0;
    v138 = 0;
    v140 = 0;
    v142 = 0;
    v49 = 0;
    pixelBuffera = 0;
    goto LABEL_140;
  }
  objc_msgSend(a4, "setPixelBuffer:forRequirement:", v51, self->_refOutputRequirement);
  pixelBuffera = v52;
  objc_msgSend(a4, "setPixelBuffer:forRequirement:", v52, self->_auxOutputRequirement);
  v53 = (void *)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
  v142 = (void *)objc_msgSend((id)objc_msgSend(v53, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_refKeypointsInputDescriptor, CVPixelBufferGetIOSurface(v47), 0);
  v140 = (void *)objc_msgSend((id)objc_msgSend(v53, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_auxKeypointsInputDescriptor, CVPixelBufferGetIOSurface(v49), 0);
  v138 = (void *)objc_msgSend((id)objc_msgSend(v53, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_auxKeypointsInputDescriptor, CVPixelBufferGetIOSurface(self->_zoomedAux), 0);
  calibrationOptions = self->_calibrationOptions;
  calibration = self->_calibration;
  disparityTuningParameters = self->_disparityTuningParameters;
  if (disparityTuningParameters)
    -[DisparityTuningParameters adaptiveCorrectionConfig](disparityTuningParameters, "adaptiveCorrectionConfig");
  else
    memset(v181, 0, sizeof(v181));
  if (-[Calibration extractParametersFromReferenceMetadata:auxiliaryMetadata:options:adaptiveCorrectionConfig:useReferenceFrame:](calibration, "extractParametersFromReferenceMetadata:auxiliaryMetadata:options:adaptiveCorrectionConfig:useReferenceFrame:", v15, v127, calibrationOptions, v181, 1)|| -[Calibration computeInitialCalibration](self->_calibration, "computeInitialCalibration"))
  {
    goto LABEL_144;
  }
  objc_msgSend((id)CMGetAttachment(target, CFSTR("TotalZoomFactor"), 0), "floatValue");
  v58 = v57;
  v59 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20]), "intValue");
  v60 = vabds_f32(v58, self->_oldZoomFactor) > self->_zoomDeltaThreshold || v59 != self->_oldQuadraBinningFactor;
  self->_oldZoomFactor = v58;
  self->_oldQuadraBinningFactor = v59;
  if (!(self->_adcFrameCounter % self->_adcFrequency)
    && self->_adcSkipOnConflictWithSmartStyleLearning
    && objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D060D0]))
  {
    self->_adcSkipOnConflictWithSmartStyleLearning = 0;
    ++self->_adcFrameCounter;
  }
  numFramesSinceAdcSkipOnConflictWithSmartStyleLearning = self->_numFramesSinceAdcSkipOnConflictWithSmartStyleLearning;
  self->_numFramesSinceAdcSkipOnConflictWithSmartStyleLearning = numFramesSinceAdcSkipOnConflictWithSmartStyleLearning
                                                               + 1;
  if (numFramesSinceAdcSkipOnConflictWithSmartStyleLearning >= 59)
  {
    self->_numFramesSinceAdcSkipOnConflictWithSmartStyleLearning = 0;
    self->_adcSkipOnConflictWithSmartStyleLearning = 1;
  }
  v180 = 0;
  if (!v60
    && self->_adcFrameCounter % self->_adcFrequency
    && self->_adcFramesConverged >= self->_adcMinFramesToConverge)
  {
    -[Calibration applyCurrentTemporalState](self->_calibration, "applyCurrentTemporalState");
    goto LABEL_46;
  }
  -[Calibration referenceMagnification](self->_calibration, "referenceMagnification");
  if (v62 <= 0.0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
    v48 = 0;
    v52 = 0;
    v135 = 0;
    v49 = 0;
    goto LABEL_143;
  }
  v63 = v62;
  v150.f64[0] = 0.0;
  if (-[Calibration computeAuxiliaryImageShiftForKeypoints:](self->_calibration, "computeAuxiliaryImageShiftForKeypoints:", &v150))goto LABEL_144;
  -[Demosaic resampleLuma:toLuma:magnification:preShift:](self->_auxiliaryDemosaic, "resampleLuma:toLuma:magnification:preShift:", v140, v138, COERCE_DOUBLE(__PAIR64__(HIDWORD(v150.f64[0]), LODWORD(v63))), COERCE_DOUBLE(vmul_f32(*(float32x2_t *)&v150.f64[0], vdiv_f32(vcvt_f32_u32(*(uint32x2_t *)&self->_rectificationWidth), vcvt_f32_f64(vcvtq_f64_u64(*p_calibrationWidth))))));
  if (-[BWRectificationInferenceProvider _detectKeypointsLKTFlowWithMagnification:preShift:refTex:auxTex:keypointsCountOut:]((uint64_t)self, (uint64_t)v142, (uint64_t)v138, &v180, v63, *(float32x2_t *)&v150.f64[0]))goto LABEL_144;
  v64 = v180;
  if (self->_applyRollingShutterCorrection)
  {
    if (-[BWRectificationInferenceProvider _applyRollingShutterCorrectionToKeypointsRef:andAux:withCount:inverseRefHomographies:refHomographyCount:refHomographyStep:inverseAuxHomographies:auxHomographyCount:auxHomographyStep:]((uint64_t)self, (uint64_t)self->_adaptiveCorrectionKeypointsReferenceDistorted, (uint64_t)self->_adaptiveCorrectionKeypointsAuxiliaryDistorted, v180, (uint64_t)v185, v133, (uint64_t)v183, v131, *((float *)&v182 + 1), *(float *)&v182))goto LABEL_144;
  }
  -[Calibration setKeypointsForReference:auxiliary:keypointCount:](self->_calibration, "setKeypointsForReference:auxiliary:keypointCount:", self->_adaptiveCorrectionKeypointsReferenceDistorted, self->_adaptiveCorrectionKeypointsAuxiliaryDistorted, v64);
  v65 = -[Calibration computeCalibration](self->_calibration, "computeCalibration");
  adcFramesConverged = self->_adcFramesConverged;
  if (!v65)
    ++adcFramesConverged;
  self->_adcFramesConverged = adcFramesConverged;
LABEL_46:
  *(_OWORD *)self->_gdcParametersReference.distortPolynomCoefficients = 0u;
  self->_gdcParametersReference.originalCropRect.size.height = 0.0;
  *(_OWORD *)&self->_gdcParametersReference.applyRollingShutterCorrection = 0u;
  *(_OWORD *)&self->_gdcParametersReference.originalCropRect.origin.y = 0u;
  *(_OWORD *)&self->_gdcParametersReference.canvasResolution.height = 0u;
  *(_OWORD *)&self->_gdcParametersReference.rollingShutterCorrectionHomographies = 0u;
  *(_OWORD *)&self->_gdcParametersReference.inverseHomography[4] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.inverseHomography[8] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.homography[5] = 0u;
  *(_OWORD *)self->_gdcParametersReference.inverseHomography = 0u;
  *(_OWORD *)&self->_gdcParametersReference.originalImageWidth = 0u;
  *(_OWORD *)&self->_gdcParametersReference.homography[1] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.undistortPolynomCoefficients[4] = 0u;
  *(_OWORD *)&self->_gdcParametersReference.centerX = 0u;
  *(_OWORD *)&self->_gdcParametersReference.distortPolynomCoefficients[4] = 0u;
  *(_OWORD *)self->_gdcParametersReference.undistortPolynomCoefficients = 0u;
  *(_OWORD *)self->_gdcParametersAuxiliary.distortPolynomCoefficients = 0u;
  self->_gdcParametersAuxiliary.originalCropRect.size.height = 0.0;
  *(_OWORD *)&self->_gdcParametersAuxiliary.distortPolynomCoefficients[4] = 0u;
  *(_OWORD *)self->_gdcParametersAuxiliary.undistortPolynomCoefficients = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.undistortPolynomCoefficients[4] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.centerX = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.originalImageWidth = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.homography[1] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.homography[5] = 0u;
  *(_OWORD *)self->_gdcParametersAuxiliary.inverseHomography = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.inverseHomography[4] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.inverseHomography[8] = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.canvasResolution.height = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.rollingShutterCorrectionHomographies = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.applyRollingShutterCorrection = 0u;
  *(_OWORD *)&self->_gdcParametersAuxiliary.originalCropRect.origin.y = 0u;
  v178 = 0u;
  v179 = 0u;
  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  v67 = self->_calibration;
  if (v67)
  {
    -[Calibration distModelFor:](v67, "distModelFor:", 0);
    v68 = self->_calibration;
    v176 = v156;
    v177 = v157;
    v178 = v158;
    v179 = v159;
    v172 = v152;
    v173 = v153;
    v174 = v154;
    v175 = v155;
    v170 = v150;
    v171 = v151;
    if (v68)
    {
      -[Calibration undistModelFor:](v68, "undistModelFor:", 0);
      goto LABEL_54;
    }
  }
  else
  {
    v178 = 0uLL;
    v179 = 0uLL;
    v176 = 0uLL;
    v177 = 0uLL;
    v174 = 0uLL;
    v175 = 0uLL;
    v172 = 0uLL;
    v173 = 0uLL;
    v170 = 0uLL;
    v171 = 0uLL;
  }
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
LABEL_54:
  v166 = v156;
  v167 = v157;
  v168 = v158;
  v169 = v159;
  v162 = v152;
  v163 = v153;
  v164 = v154;
  v165 = v155;
  v160 = v150;
  v161 = v151;
  if (fillGDCParametersFromDistortionModels(&v170, v160.f64, (uint64_t)&self->_gdcParametersReference, (float)self->_calibrationWidth, (float)self->_calibrationHeight))
  {
LABEL_144:
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
    v48 = 0;
    v52 = 0;
    v135 = 0;
    goto LABEL_145;
  }
  v69 = self->_calibration;
  if (!v69)
  {
    v178 = 0u;
    v179 = 0u;
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    goto LABEL_59;
  }
  -[Calibration distModelFor:](v69, "distModelFor:", 1);
  v70 = self->_calibration;
  v176 = v156;
  v177 = v157;
  v178 = v158;
  v179 = v159;
  v172 = v152;
  v173 = v153;
  v174 = v154;
  v175 = v155;
  v170 = v150;
  v171 = v151;
  if (!v70)
  {
LABEL_59:
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v150 = 0u;
    v151 = 0u;
    goto LABEL_60;
  }
  -[Calibration undistModelFor:](v70, "undistModelFor:", 1);
LABEL_60:
  v166 = v156;
  v167 = v157;
  v168 = v158;
  v169 = v159;
  v162 = v152;
  v163 = v153;
  v164 = v154;
  v165 = v155;
  v160 = v150;
  v161 = v151;
  if (fillGDCParametersFromDistortionModels(&v170, v160.f64, (uint64_t)&self->_gdcParametersAuxiliary, (float)self->_calibrationWidth, (float)self->_calibrationHeight))goto LABEL_144;
  LODWORD(v71) = 15.0;
  if (-[Calibration computeStereoRectificationHomographies:alignedToAngle:](self->_calibration, "computeStereoRectificationHomographies:alignedToAngle:", 7.67384672e21, v71))goto LABEL_144;
  -[Calibration rectReferenceToReference](self->_calibration, "rectReferenceToReference");
  v72 = 0;
  homography = self->_gdcParametersReference.homography;
  v150 = v74;
  v151 = v75;
  v152 = v76;
  do
  {
    for (i = 0; i != 3; ++i)
      homography[i] = *(float *)((unint64_t)(&v150 + i) & 0xFFFFFFFFFFFFFFF3 | (4 * (v72 & 3)));
    ++v72;
    homography += 3;
  }
  while (v72 != 3);
  -[Calibration referenceToRectReference](self->_calibration, "referenceToRectReference");
  v78 = 0;
  inverseHomography = self->_gdcParametersReference.inverseHomography;
  v150 = v80;
  v151 = v81;
  v152 = v82;
  do
  {
    for (j = 0; j != 3; ++j)
      inverseHomography[j] = *(float *)((unint64_t)(&v150 + j) & 0xFFFFFFFFFFFFFFF3 | (4 * (v78 & 3)));
    ++v78;
    inverseHomography += 3;
  }
  while (v78 != 3);
  v84 = (float)-[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_auxOutputRequirement, "videoFormat"), "width");
  v134 = v84
       / (float)-[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_refOutputRequirement, "videoFormat"), "width");
  v85 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_auxOutputRequirement, "videoFormat"), "height");
  v86 = (float)-[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_refOutputRequirement, "videoFormat"), "height");
  -[Calibration rectReferenceToAuxiliary](self->_calibration, "rectReferenceToAuxiliary");
  v128 = v87;
  v123 = v89;
  v125 = v88;
  -[Calibration auxiliaryPaddingHInv](self->_calibration, "auxiliaryPaddingHInv");
  v90 = 0;
  v187 = v91;
  v188 = v92;
  v189 = v93;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v150 + v90) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v128, COERCE_FLOAT(*(__int128 *)((char *)&v187 + v90))), v125, *(float32x2_t *)((char *)&v187 + v90), 1), v123, *(float32x4_t *)((char *)&v187 + v90), 2);
    v90 += 16;
  }
  while (v90 != 48);
  v94 = 0;
  LODWORD(v95) = 0;
  *((float *)&v95 + 1) = (float)v85 / v86;
  v96 = (float32x4_t)v150;
  v97 = v151;
  v98 = v152;
  v187 = LODWORD(v134);
  v188 = v95;
  v189 = xmmword_1A3161F30;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v150 + v94) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v96, COERCE_FLOAT(*(__int128 *)((char *)&v187 + v94))), v97, *(float32x2_t *)((char *)&v187 + v94), 1), v98, *(float32x4_t *)((char *)&v187 + v94), 2);
    v94 += 16;
  }
  while (v94 != 48);
  v99 = a7;
  v100 = 0;
  v101 = v150;
  v102 = v151;
  v103 = v152;
  HIDWORD(v101.f64[1]) = 0;
  v102.i32[3] = 0;
  v103.i32[3] = 0;
  v104 = self->_gdcParametersAuxiliary.homography;
  v150 = v101;
  v151 = v102;
  v152 = v103;
  do
  {
    for (k = 0; k != 3; ++k)
      v104[k] = *(float *)((unint64_t)(&v150 + k) & 0xFFFFFFFFFFFFFFF3 | (4 * (v100 & 3)));
    ++v100;
    v104 += 3;
  }
  while (v100 != 3);
  v106 = (void *)objc_msgSend(v53, "commandBuffer");
  v48 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v53, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_auxInputDescriptor, CVPixelBufferGetIOSurface(v48), 0);
  if (!v48)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v129 = 0;
LABEL_124:
    v52 = 0;
    v135 = 0;
    v49 = 0;
    v120 = 0;
    v14 = 4294935584;
    goto LABEL_97;
  }
  v107 = objc_msgSend((id)objc_msgSend(v53, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_auxOutputDescriptor, CVPixelBufferGetIOSurface(v52), 0);
  v129 = v48;
  if (!v107)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v48 = 0;
    goto LABEL_124;
  }
  v108 = (void *)v107;
  v109 = (double)-[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_auxOutputRequirement, "videoFormat"), "width");
  v110 = (double)-[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_auxOutputRequirement, "videoFormat"), "height");
  self->_gdcParametersAuxiliary.canvasResolution.width = v109;
  self->_gdcParametersAuxiliary.canvasResolution.height = v110;
  self->_gdcParametersAuxiliary.applyZTransform = 0;
  self->_gdcParametersAuxiliary.samplerType = 2;
  applyRollingShutterCorrection = self->_applyRollingShutterCorrection;
  if (applyRollingShutterCorrection)
  {
    self->_gdcParametersAuxiliary.rollingShutterCorrectionHomographies = v184;
    self->_gdcParametersAuxiliary.numRollingShutterCorrectionHomographies = v131;
    LODWORD(self->_gdcParametersAuxiliary.rollingShutterCorrectionHomographyStep) = v182;
    self->_gdcParametersAuxiliary.applyRollingShutterCorrection = applyRollingShutterCorrection;
  }
  LODWORD(v110) = 1.0;
  v135 = v108;
  v112 = -[GDCTransform transformFrom:to:withParameters:withScale:withMode:andCommandBuffer:](self->_gdcTransform, "transformFrom:to:withParameters:withScale:withMode:andCommandBuffer:", v48, v108, &self->_gdcParametersAuxiliary, 1, v106, v110);
  a7 = v99;
  if (v112)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v48 = 0;
    v52 = 0;
LABEL_145:
    v49 = 0;
    v120 = 0;
    v14 = 4294935586;
    goto LABEL_97;
  }
  v48 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v53, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_refInputDescriptor, CVPixelBufferGetIOSurface(v126), 0);
  if (!v48)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    v52 = 0;
LABEL_128:
    v49 = 0;
LABEL_138:
    v120 = 0;
    v14 = 4294935584;
    goto LABEL_97;
  }
  v52 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v53, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_refOutputDescriptor, CVPixelBufferGetIOSurface(v51), 0);
  if (!v52)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    goto LABEL_128;
  }
  v113 = (double)-[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_refOutputRequirement, "videoFormat"), "width");
  v114 = (double)-[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_refOutputRequirement, "videoFormat"), "height");
  self->_gdcParametersReference.canvasResolution.width = v113;
  self->_gdcParametersReference.canvasResolution.height = v114;
  self->_gdcParametersReference.applyZTransform = 0;
  self->_gdcParametersReference.samplerType = 2;
  v115 = self->_applyRollingShutterCorrection;
  if (v115)
  {
    self->_gdcParametersReference.rollingShutterCorrectionHomographies = v186;
    self->_gdcParametersReference.numRollingShutterCorrectionHomographies = v133;
    self->_gdcParametersReference.rollingShutterCorrectionHomographyStep = *((float *)&v182 + 1);
    self->_gdcParametersReference.applyRollingShutterCorrection = v115;
  }
  LODWORD(v114) = 1.0;
  if (-[GDCTransform transformFrom:to:withParameters:withScale:withMode:andCommandBuffer:](self->_gdcTransform, "transformFrom:to:withParameters:withScale:withMode:andCommandBuffer:", v48, v52, &self->_gdcParametersReference, 1, v106, v114))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v119 = 0;
    goto LABEL_145;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &self->_gdcParametersReference, "{?=[8f][8f]fffffff[9f][9f]{CGSize=dd}Bi^{?}ifBf{CGRect={CGPoint=dd}{CGSize=dd}}}"), CFSTR("gdcParametersReference"));
  v149 = 0;
  memset(v148, 0, sizeof(v148));
  v116 = self->_calibration;
  if (v116)
    -[Calibration correctedCalibration](v116, "correctedCalibration");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", v148, "{CalModel=[2d][2d][2d][12d]d[2d][2d]}"), CFSTR("calModel"));
  -[Calibration orientationVector](self->_calibration, "orientationVector");
  v147 = v117;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v147, 8), CFSTR("orientationVector"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v185, 48 * v133), CFSTR("refRollingShutterCorrectionHomographiesInv"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v133), CFSTR("refRollingShutterRowCount"));
  LODWORD(v118) = HIDWORD(v182);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v118), CFSTR("refRollingShutterHomographyStep"));
  CMSetAttachment(target, CFSTR("unrectifyData"), v15, 1u);
  if (!self->_opticalFlowOutputRequirement)
  {
    v119 = 0;
    v49 = 0;
    if (!v99)
      goto LABEL_96;
    goto LABEL_95;
  }
  v49 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v122, "pixelBufferPoolForRequirement:"), "newPixelBuffer");
  if (!v49)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v119 = 0;
    goto LABEL_140;
  }
  objc_msgSend(v122, "setPixelBuffer:forRequirement:", v49, self->_opticalFlowOutputRequirement);
  v119 = (void *)objc_msgSend((id)objc_msgSend(v53, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_opticalFlowDescriptor, CVPixelBufferGetIOSurface(v49), 0);
  if (!v119)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_138;
  }
  if (-[PTDisparityPostProcessing computeOpticalFlow:inRGBA:outDisplacement:](self->_disparityPostProcessor, "computeOpticalFlow:inRGBA:outDisplacement:", v106, v48, v119))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_143;
  }
  if (v99)
  {
LABEL_95:
    v145[0] = MEMORY[0x1E0C809B0];
    v145[1] = 3221225472;
    v145[2] = __118__BWRectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
    v145[3] = &unk_1E491EA20;
    v146 = 0;
    v145[4] = self;
    v145[5] = v99;
    objc_msgSend(v106, "addScheduledHandler:", v145);
  }
LABEL_96:
  objc_msgSend(v106, "commit");
  v14 = 0;
  v120 = 1;
LABEL_97:
  v130[3] = vaddq_s64(v130[3], vdupq_n_s64(1uLL));
  if (a7 && (v120 & 1) == 0)
    (*((void (**)(id, uint64_t, BWRectificationInferenceProvider *))a7 + 2))(a7, v14, self);
  if (cf)
    CFRelease(cf);
  if (pixelBuffera)
    CFRelease(pixelBuffera);
  if (v49)
    CFRelease(v49);

  free(v186);
  free(v185);
  free(v184);
  free(v183);
  return v14;
}

- (unint64_t)_rscForBuffer:(void *)a3 withHomograhies:(void *)a4 andInverseHomographies:(float *)a5 withHomographyStep:
{
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _DWORD *v12;
  int v13;
  _DWORD *v14;
  uint64_t v15;
  _DWORD *v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  __int32 *v20;
  uint64_t v21;
  __int32 v22;
  int32x2_t *v23;
  char *v24;
  simd_float3x3 v26;

  if (!a1)
    return 0;
  v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D08868], 0);
  v9 = (unint64_t)v8;
  if (!v8)
  {
LABEL_14:
    fig_log_get_emitter();
    FigDebugAssert3();
    return v9;
  }
  v10 = objc_msgSend(v8, "length");
  if (v10 <= 0x24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v11 = v10;
  v12 = (_DWORD *)objc_msgSend((id)v9, "bytes");
  v13 = v12[6];
  v9 = v12[7];
  *a5 = (float)v13;
  if ((v9 - 50) <= 0xFFFFFFCE)
    goto LABEL_14;
  v14 = v12;
  if (v12[8] != 1 || v13 <= 0 || v11 != 36 * v9 + 36)
    goto LABEL_14;
  *a3 = malloc_type_malloc(48 * v9, 0x1000040EED21634uLL);
  v15 = 0;
  *a4 = malloc_type_malloc(48 * v9, 0x1000040EED21634uLL);
  v16 = v14 + 17;
  do
  {
    v17 = *(int32x2_t *)(v16 - 8);
    v18.i32[0] = *(v16 - 6);
    v19 = *(int32x2_t *)(v16 - 5);
    v20 = v16 - 3;
    v21 = *((_QWORD *)v16 - 1);
    v22 = *v16;
    v16 += 9;
    v23 = (int32x2_t *)((char *)*a3 + v15);
    v18.i32[1] = *v20;
    v23[1].i32[0] = v21;
    *v23 = vzip1_s32(v17, v19);
    v23[3].i32[0] = HIDWORD(v21);
    v23[2] = vzip2_s32(v17, v19);
    v23[5].i32[0] = v22;
    v23[4] = v18;
    v24 = (char *)*a4 + v15;
    v26 = __invert_f3(*(simd_float3x3 *)((char *)*a3 + v15));
    *((_DWORD *)v24 + 2) = v26.columns[0].i32[2];
    *(_QWORD *)v24 = v26.columns[0].i64[0];
    *((_DWORD *)v24 + 6) = v26.columns[1].i32[2];
    *((_QWORD *)v24 + 2) = v26.columns[1].i64[0];
    *((_DWORD *)v24 + 10) = v26.columns[2].i32[2];
    v15 += 48;
    *((_QWORD *)v24 + 4) = v26.columns[2].i64[0];
  }
  while (48 * v9 != v15);
  return v9;
}

- (uint64_t)_detectKeypointsLKTFlowWithMagnification:(uint64_t)a3 preShift:(_DWORD *)a4 refTex:(float)a5 auxTex:(float32x2_t)a6 keypointsCountOut:
{
  float16x4_t v6;
  uint64_t v12;
  char v13;
  uint32x2_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  float64x2_t v32;
  unint64_t v33;
  int v34;
  float v35;
  float32x2_t v36;
  float32x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  __int16 *v40;
  __int32 *v41;
  float32x2_t v42;
  uint64_t v49;
  uint64x2_t v50;
  float32x2_t v51;
  unsigned __int16 v52;

  if (result)
  {
    v12 = result;
    v52 = 0;
    v13 = objc_msgSend(*(id *)(result + 80), "lastScale");
    v50 = *(uint64x2_t *)(v12 + 744);
    v14 = *(uint32x2_t *)(v12 + 760);
    objc_msgSend(*(id *)(v12 + 80), "estimateFlowFromReference:target:", a2, a3);
    v15 = *(void **)(v12 + 80);
    v16 = objc_msgSend(v15, "uv_fwd");
    v17 = objc_msgSend(*(id *)(v12 + 80), "uv_bwd");
    v18 = objc_msgSend(*(id *)(v12 + 80), "conf_fwd");
    v19 = objc_msgSend(*(id *)(v12 + 80), "conf_bwd");
    objc_msgSend(*(id *)(v12 + 96), "bidirectionalError");
    v21 = v20;
    objc_msgSend(*(id *)(v12 + 96), "confidenceRadialWeight");
    v23 = v22;
    objc_msgSend(*(id *)(v12 + 96), "confidenceMinimum");
    v25 = v24;
    v26 = objc_msgSend(*(id *)(v12 + 96), "blockSize");
    LODWORD(v27) = v21;
    LODWORD(v28) = v23;
    LODWORD(v29) = v25;
    objc_msgSend(v15, "computeKeypointsFromForwardFlow:backwardFlow:forwardConfidence:backwardConfidence:bidirectionalError:confidenceRadialWeight:confidenceMinimum:blockSize:outNumKeypoints:", v16, v17, v18, v19, v26, &v52, v27, v28, v29);
    objc_msgSend(*(id *)(v12 + 80), "waitUntilCompleted");
    if (*(_QWORD *)(v12 + 776) * *(_QWORD *)(v12 + 768) < (unint64_t)v52)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v34 = 0;
      result = 4294954516;
    }
    else
    {
      v30 = objc_msgSend((id)objc_msgSend(*(id *)(v12 + 80), "keypoints"), "contents");
      v31 = objc_msgSend((id)objc_msgSend(*(id *)(v12 + 80), "keypoints_confidence"), "contents");
      if (v52)
      {
        v33 = 0;
        v34 = 0;
        v35 = 1.0 / a5;
        v36 = vcvt_f32_f64(vcvtq_f64_u64(v50));
        v37 = vdiv_f32(vmul_n_f32(v36, (float)(1 << v13)), vcvt_f32_u32(v14));
        v38 = vmul_n_f32(v37, v35);
        v39 = vmla_n_f32(a6, v36, (float)(1.0 - v35) * 0.5);
        v40 = (__int16 *)(v31 + 6);
        v41 = (__int32 *)(v30 + 4);
        do
        {
          LODWORD(v32.f64[0]) = *(v41 - 1);
          *(float32x2_t *)&v32.f64[0] = vadd_f32((float32x2_t)*(_OWORD *)&vcvtq_f32_f16(*(float16x4_t *)&v32.f64[0]), (float32x2_t)0x3F0000003F000000);
          v42 = vmul_f32(v37, *(float32x2_t *)&v32.f64[0]);
          if (fabsf(v42.f32[0]) != INFINITY)
          {
            v51 = v42;
            v6.i32[0] = *v41;
            _H0 = *v40;
            __asm { FCVT            S13, H0 }
            objc_msgSend(*(id *)(v12 + 96), "confidenceMinimum");
            if (*(float *)v32.f64 <= _S13)
            {
              v49 = 16 * v34;
              *(float64x2_t *)(*(_QWORD *)(v12 + 616) + v49) = vcvtq_f64_f32(v51);
              v32 = vcvtq_f64_f32(vmla_f32(v39, v38, vadd_f32((float32x2_t)*(_OWORD *)&vcvtq_f32_f16(v6), (float32x2_t)0x3F0000003F000000)));
              *(float64x2_t *)(*(_QWORD *)(v12 + 624) + v49) = v32;
              ++v34;
            }
          }
          ++v33;
          v40 += 4;
          v41 += 2;
        }
        while (v33 < v52);
      }
      else
      {
        v34 = 0;
      }
      result = 0;
    }
    *a4 = v34;
  }
  return result;
}

- (uint64_t)_applyRollingShutterCorrectionToKeypointsRef:(uint64_t)a3 andAux:(unsigned int)a4 withCount:(uint64_t)a5 inverseRefHomographies:(int)a6 refHomographyCount:(uint64_t)a7 refHomographyStep:(int)a8 inverseAuxHomographies:(float)a9 auxHomographyCount:(float)a10 auxHomographyStep:
{
  uint64_t v10;
  uint64_t v11;
  float64x2_t *v12;
  float v13;
  uint64_t v14;
  float v15;
  int v16;
  float32x4_t *v17;
  int32x4_t v18;
  double *v19;
  float v20;
  int v21;
  float v22;
  float32x4_t *v23;
  int32x4_t v24;

  if (result)
  {
    if (!a5 || !a7)
    {
LABEL_15:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 1;
    }
    if (a4)
    {
      v10 = 0;
      while (1)
      {
        v11 = 8 * v10;
        v12 = (float64x2_t *)(a2 + v11);
        v14 = (v10 + 1);
        v15 = *(double *)(a2 + 8 * v14);
        v16 = (int)(float)(v15 / a9);
        if (v16 >= a6)
          v16 = a6 - 1;
        v17 = (float32x4_t *)(a5 + 48 * (v16 & ~(v16 >> 31)));
        v13 = *(double *)(a2 + 8 * v10);
        v18 = (int32x4_t)vaddq_f32(v17[2], vmlaq_n_f32(vmulq_n_f32(*v17, v13), v17[1], v15));
        if (*(float *)&v18.i32[2] == 0.0)
          break;
        v19 = (double *)(a3 + v11);
        v20 = *(double *)(a3 + 8 * v14);
        v21 = (int)(float)(v20 / a10);
        if (v21 >= a8)
          v21 = a8 - 1;
        v22 = *v19;
        v23 = (float32x4_t *)(a7 + 48 * (v21 & ~(v21 >> 31)));
        v24 = (int32x4_t)vaddq_f32(v23[2], vmlaq_n_f32(vmulq_n_f32(*v23, v22), v23[1], v20));
        if (*(float *)&v24.i32[2] == 0.0)
          break;
        *v12 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_laneq_s32(v18, 2)));
        *(float64x2_t *)v19 = vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v24.i8, (float32x2_t)vdup_laneq_s32(v24, 2)));
        v10 += 2;
        if (2 * a4 == v10)
          return 0;
      }
      goto LABEL_15;
    }
    return 0;
  }
  return result;
}

uint64_t __118__BWRectificationInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (BWInferencePropagatable)propagatable
{
  return 0;
}

- (id)newStorage
{
  BWInferenceProviderStorage *v3;
  __int128 v4;
  uint64_t v5;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = [BWInferenceProviderStorage alloc];
  v4 = *(_OWORD *)&self->_refKeypointsInputRequirement;
  v7[0] = *(_OWORD *)&self->_refInputRequirement;
  v7[1] = v4;
  v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v3, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v5, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_refOutputRequirement, self->_auxOutputRequirement, self->_opticalFlowOutputRequirement, 0));
}

- (int)type
{
  return 113;
}

- (NSArray)inputVideoRequirements
{
  __int128 v2;
  _OWORD v4[3];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_OWORD *)&self->_refKeypointsInputRequirement;
  v4[0] = *(_OWORD *)&self->_refInputRequirement;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&self->_originalRefInputRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 6);
}

- (NSArray)outputVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", self->_refOutputRequirement, self->_auxOutputRequirement, self->_opticalFlowOutputRequirement, 0);
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

@end
