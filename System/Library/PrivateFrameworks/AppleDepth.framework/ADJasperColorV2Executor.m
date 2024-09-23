@implementation ADJasperColorV2Executor

- (ADJasperColorV2Executor)initWithInputPrioritization:(int64_t)a3
{
  uint64_t v5;

  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
    v5 = 4;
  else
    v5 = 0;
  return -[ADJasperColorV2Executor initWithInputPrioritization:engineType:](self, "initWithInputPrioritization:engineType:", a3, v5);
}

- (ADJasperColorV2Executor)initWithInputPrioritization:(int64_t)a3 engineType:(unint64_t)a4
{
  void *v7;
  ADJasperColorV2Executor *v8;

  v7 = (void *)objc_opt_new();
  v8 = -[ADJasperColorV2Executor initWithParameters:prioritization:engineType:](self, "initWithParameters:prioritization:engineType:", v7, a3, a4);

  return v8;
}

- (ADJasperColorV2Executor)initWithParameters:(id)a3 prioritization:(int64_t)a4 engineType:(unint64_t)a5
{
  id v8;
  ADJasperColorV2Executor *v9;
  ADJasperColorV2Executor *v10;
  id *p_executorParameters;
  ADJasperColorV2Pipeline *v12;
  void *v13;
  uint64_t v14;
  ADJasperColorV2Pipeline *pipeline;
  ADMutableJasperPointCloud *itmPovChangedPointCloud;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ADJasperColorV2Executor *v21;
  objc_super v23;
  int v24;
  __int128 v25;
  __int128 v26;

  v8 = a3;
  v24 = 335685812;
  v25 = 0u;
  v26 = 0u;
  kdebug_trace();
  v23.receiver = self;
  v23.super_class = (Class)ADJasperColorV2Executor;
  v9 = -[ADExecutor init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    if (!v8)
      v8 = (id)objc_opt_new();
    p_executorParameters = (id *)&v9->_executorParameters;
    objc_storeStrong(p_executorParameters, v8);
    v12 = [ADJasperColorV2Pipeline alloc];
    objc_msgSend(*p_executorParameters, "pipelineParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ADJasperColorV2Pipeline initWithInputPrioritization:espressoEngine:andParameters:](v12, "initWithInputPrioritization:espressoEngine:andParameters:", a4, a5, v13);
    pipeline = v10->_pipeline;
    v10->_pipeline = (ADJasperColorV2Pipeline *)v14;

    if (!v10->_pipeline)
    {
      v21 = 0;
      goto LABEL_8;
    }
    v10->super._engineType = a5;
    v10->_itmPreProcessedColor = 0;
    v10->_colorProcessingSession = 0;
    v10->_itmPreProcessedJasper = 0;
    v10->_itmPrevDepth = 0;
    v10->_itmPrevColor = 0;
    v10->_itmPrevUncertainty = 0;
    v10->_itmUnprocessedDepth = 0;
    v10->_itmUnprocessedUncertainty = 0;
    itmPovChangedPointCloud = v10->_itmPovChangedPointCloud;
    v10->_itmPovChangedPointCloud = 0;

    v10->_itmDepthFeatures = 0;
    v10->_itmColorFeatures = 0;
    v10->_isPrepared = 0;
    -[ADJasperColorV2Pipeline inferenceDescriptor](v10->_pipeline, "inferenceDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "prevDepthInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_temporalConsistencySupported = v18 != 0;

    -[ADJasperColorV2Pipeline inferenceDescriptor](v10->_pipeline, "inferenceDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "depthFeaturesOutput");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_temporalConsistencyWithFeatures = v20 != 0;

    v10->_isPaddingRequired = 0;
    v10->_paddingLinesBottom = 0;
    v10->_paddingLinesTop = 0;
    v10->_preScaledPaddingLines = 0.0;
    v10->_colorScaleFactor = 1.0;
  }
  v21 = v10;
LABEL_8:
  kdebug_trace();

  return v21;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  self->_itmPreProcessedJasper = 0;
  CVPixelBufferRelease(self->_itmPrevDepth);
  self->_itmPrevDepth = 0;
  CVPixelBufferRelease(self->_itmPrevColor);
  self->_itmPrevColor = 0;
  CVPixelBufferRelease(self->_itmPrevUncertainty);
  self->_itmPrevUncertainty = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
  CVPixelBufferRelease(self->_itmUnprocessedUncertainty);
  self->_itmUnprocessedUncertainty = 0;
  CVPixelBufferRelease(self->_itmDepthFeatures);
  self->_itmDepthFeatures = 0;
  CVPixelBufferRelease(self->_itmColorFeatures);
  self->_itmColorFeatures = 0;
}

- (int64_t)allocateIntermediateBuffers
{
  ADEspressoRunner *espressoRunner;
  void *v4;
  void *v5;
  ADEspressoRunner *v6;
  void *v7;
  void *v8;
  ADEspressoRunner *v9;
  void *v10;
  void *v11;
  ADEspressoRunner *v12;
  void *v13;
  void *v14;
  ADEspressoRunner *v15;
  void *v16;
  void *v17;
  void *v18;
  ADEspressoRunner *v19;
  void *v20;
  objc_class *v21;
  int *v22;
  ADMutableJasperPointCloud *v23;
  ADMutableJasperPointCloud *itmPovChangedPointCloud;
  ADEspressoRunner *v25;
  void *v26;
  void *v27;
  ADEspressoRunner *v28;
  void *v29;
  void *v30;

  -[ADJasperColorV2Executor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  espressoRunner = self->super._espressoRunner;
  -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](espressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  v6 = self->super._espressoRunner;
  -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jasperInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedJasper = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v6, "createAndRegisterPixelBufferForDescriptor:", v8);

  if (self->_temporalConsistencySupported)
  {
    v9 = self->super._espressoRunner;
    -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "prevDepthInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmPrevDepth = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v9, "createAndRegisterPixelBufferForDescriptor:", v11);

    v12 = self->super._espressoRunner;
    -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "prevColorInput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmPrevColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v12, "createAndRegisterPixelBufferForDescriptor:", v14);

    LODWORD(v14) = self->_temporalConsistencyWithFeatures;
    v15 = self->super._espressoRunner;
    -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((_DWORD)v14)
    {
      objc_msgSend(v16, "depthFeaturesOutput");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      self->_itmDepthFeatures = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v15, "createAndRegisterPixelBufferForDescriptor:", v18);

      v19 = self->super._espressoRunner;
      -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "colorFeaturesOutput");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v19, "createAndRegisterPixelBufferForDescriptor:", v20);
      v22 = &OBJC_IVAR___ADJasperColorV2Executor__itmColorFeatures;
    }
    else
    {
      objc_msgSend(v16, "prevUncertaintyInput");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v15, "createAndRegisterPixelBufferForDescriptor:", v20);
      v22 = &OBJC_IVAR___ADJasperColorV2Executor__itmPrevUncertainty;
    }
    *(Class *)((char *)&self->super.super.isa + *v22) = v21;

  }
  v23 = (ADMutableJasperPointCloud *)objc_msgSend(objc_alloc(MEMORY[0x24BE06000]), "initWithCapacity:", 336);
  itmPovChangedPointCloud = self->_itmPovChangedPointCloud;
  self->_itmPovChangedPointCloud = v23;

  v25 = self->super._espressoRunner;
  -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "depthOutput");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmUnprocessedDepth = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v25, "createAndRegisterPixelBufferForDescriptor:", v27);

  v28 = self->super._espressoRunner;
  -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "uncertaintyOutput");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmUnprocessedUncertainty = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v28, "createAndRegisterPixelBufferForDescriptor:", v30);

  if (!self->_itmPreProcessedColor
    || !self->_itmPreProcessedJasper
    || !self->_itmUnprocessedDepth
    || !self->_itmUnprocessedUncertainty
    || !self->_itmPovChangedPointCloud)
  {
    goto LABEL_21;
  }
  if (!self->_temporalConsistencySupported)
  {
    if (!self->_temporalConsistencyWithFeatures)
      return 0;
    goto LABEL_18;
  }
  if (!self->_itmPrevDepth || !self->_itmPrevColor)
    goto LABEL_21;
  if (self->_temporalConsistencyWithFeatures)
  {
LABEL_18:
    if (!self->_itmDepthFeatures || !self->_itmColorFeatures)
      goto LABEL_21;
    return 0;
  }
  if (self->_itmPrevUncertainty)
    return 0;
LABEL_21:
  -[ADJasperColorV2Executor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  return -22971;
}

- (int64_t)prepareForColorROI:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ADJasperColorV2Executor *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t engineType;
  void *v21;
  void *v22;
  int64_t v23;
  __CVBuffer *v24;
  __CVBuffer *v25;
  __CVBuffer *v26;
  PixelBufferUtilsSession *colorProcessingSession;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  kdebug_trace();
  v8 = self;
  objc_sync_enter(v8);
  -[ADJasperColorV2Pipeline inferenceDescriptor](v8->_pipeline, "inferenceDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x24BE05FF0], "layoutForSize:", width, height);
  objc_msgSend(v9, "colorInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeForLayout:", v10);
  v14 = v13;
  v16 = v15;

  v8->_colorScaleFactor = v14 / width;
  v17 = (double)(unint64_t)(height * (v14 / width));
  v8->_isPaddingRequired = v16 > v17;
  v18 = v16 - v17;
  v8->_paddingLinesTop = (unint64_t)(v18 * 0.5);
  v19 = (unint64_t)(v18 - (double)(unint64_t)(v18 * 0.5));
  v8->_paddingLinesBottom = v19;
  v8->_preScaledPaddingLines = (double)(v8->_paddingLinesTop + v19) / (v14 / width);
  engineType = v8->super._engineType;
  objc_msgSend(v9, "colorInput");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v8, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", engineType, v22, 1, 2, v9, x, y, width, height);

  if (!v23)
  {
    v23 = -[ADJasperColorV2Executor allocateIntermediateBuffers](v8, "allocateIntermediateBuffers");
    if (!v23)
    {
      PixelBufferUtils::blacken(v8->_itmPrevDepth, v24);
      PixelBufferUtils::blacken(v8->_itmPrevColor, v25);
      if (!v8->_temporalConsistencyWithFeatures)
        PixelBufferUtils::blacken(v8->_itmPrevUncertainty, v26);
      colorProcessingSession = v8->_colorProcessingSession;
      if (colorProcessingSession)
      {
        PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
        MEMORY[0x20BD36498]();
      }
      v23 = 0;
      v8->_colorProcessingSession = 0;
      v8->_isPrepared = 1;
    }
  }

  objc_sync_exit(v8);
  kdebug_trace();
  return v23;
}

- (CGSize)expectedOutputSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[ADJasperColorV2Pipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "depthOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeForLayout:", self->super._layout);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 jasperToColorTransform:(double)a5 colorCamera:(uint64_t)a6 outputDepthMap:(__CVBuffer *)a7 outputConfidenceMap:(void *)a8
{
  id v16;
  char *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  const char *v23;
  size_t v24;
  uint64_t v25;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  __CVBuffer *v33;
  int v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  int v38;
  double v39;
  double v40;
  PixelBufferUtilsSession *v41;
  size_t v42;
  size_t v43;
  PixelBufferUtilsSession *PixelFormatType;
  size_t v45;
  size_t v46;
  OSType v47;
  uint64_t CropScaleConvertRotateSession;
  const void *v49;
  CVPixelBufferRef *v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  unsigned int v54;
  char *data;
  size_t rowBytes;
  unint64_t v57;
  unint64_t v58;
  size_t v59;
  unsigned int v60;
  char *v61;
  vImagePixelCount height;
  uint64_t v63;
  CVPixelBufferRef *v64;
  NSObject *v65;
  const char *v66;
  id v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  unint64_t v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  NSObject *v81;
  const char *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int v88;
  char *v89;
  size_t v90;
  void *v91;
  void *v92;
  void *v93;
  OSType v94;
  CVPixelBufferRef *v95;
  CVPixelBufferRef v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  OSType v101;
  size_t Width;
  int v103;
  int v104;
  char v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  BOOL v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  double v134;
  double v135;
  CVPixelBufferRef *v136;
  uint64_t v137;
  int v138;
  id v139;
  double v140;
  void *v141;
  void *v142;
  _QWORD *v147;
  void *v148;
  id v149;
  id v150;
  int v151;
  __int128 v152;
  __int128 v153;
  vImage_Buffer buf;
  uint64_t v155;
  CGSize v156;
  CGSize v157;
  CGSize v158;
  CGSize v159;

  v155 = *MEMORY[0x24BDAC8D0];
  v149 = a8;
  v16 = a9;
  v151 = 335683608;
  v152 = 0u;
  v153 = 0u;
  v148 = v16;
  kdebug_trace();
  v17 = a1;
  objc_sync_enter(v17);
  if (v17[120]
    || (v24 = CVPixelBufferGetWidth(a7),
        (v25 = objc_msgSend(v17, "prepareForColorROI:", 0.0, 0.0, (double)v24, (double)CVPixelBufferGetHeight(a7))) == 0))
  {
    if (!a7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v22 = MEMORY[0x24BDACB70];
        v23 = "Must provide input color image";
        goto LABEL_80;
      }
LABEL_20:
      v25 = -22953;
      goto LABEL_21;
    }
    if (!a10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v22 = MEMORY[0x24BDACB70];
        v23 = "Must provide a pointer to outputDepthMap";
        goto LABEL_80;
      }
      goto LABEL_20;
    }
    objc_msgSend(v17, "expectedOutputSize");
    v19 = v18;
    v21 = v20;
    if (*a10 && v18 != (double)CVPixelBufferGetWidth(*a10))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v22 = MEMORY[0x24BDACB70];
        v23 = "Output depth buffer width does not match descriptor";
LABEL_80:
        _os_log_error_impl(&dword_20B62B000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&buf, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if (a11 && *a11 && v19 != (double)CVPixelBufferGetWidth(*a11))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v22 = MEMORY[0x24BDACB70];
        v23 = "Output confidence buffer width does not match descriptor";
        goto LABEL_80;
      }
      goto LABEL_20;
    }
    objc_msgSend(*((id *)v17 + 33), "logger");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "systemUptime");
    v29 = v28;

    objc_msgSend(v142, "logPixelBuffer:name:timestamp:", a7, "inputColor", v29);
    objc_msgSend(v142, "logPointCloud:name:timestamp:", v149, "inputPointCloud", v29);
    objc_msgSend(v142, "logMatrix4x3:name:timestamp:", "jasper2ColorTransform", a2, a3, a4, a5, v29);
    objc_msgSend(v142, "logCalibration:name:timestamp:", v16, "colorCameraCalibration", v29);
    if (v17[226])
      v21 = v21 - (double)(unint64_t)(*((_QWORD *)v17 + 30) + *((_QWORD *)v17 + 29));
    v30 = objc_msgSend(v17, "numberOfExecutionSteps");
    v31 = objc_msgSend(*((id *)v17 + 33), "stepsToSkip");
    v138 = objc_msgSend(*((id *)v17 + 33), "powerMeasureMode");
    objc_msgSend(*((id *)v17 + 33), "timeProfiler");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v30 - v31;
    if (v138)
    {
      v32 = v137-- < 1;
      if (v32)
      {
        v25 = 0;
LABEL_141:

        goto LABEL_21;
      }
    }
    v136 = a11;
    kdebug_trace();
    objc_msgSend(v141, "startWithUTFString:", "preprocess jasper");
    objc_msgSend(v17, "frameExecutionStart");
    if (!v149 || (int)objc_msgSend(v149, "length") < 1)
    {
      v139 = 0;
      PixelBufferUtils::blacken(*((__CVBuffer **)v17 + 19), v33);
      goto LABEL_31;
    }
    v34 = objc_msgSend(*((id *)v17 + 27), "capacity");
    if (v34 >= (int)objc_msgSend(v149, "length"))
    {
      objc_msgSend(*((id *)v17 + 27), "resize:", 0);
    }
    else
    {
      v35 = objc_msgSend(objc_alloc(MEMORY[0x24BE06000]), "initWithCapacity:", objc_msgSend(v149, "length"));
      v36 = (void *)*((_QWORD *)v17 + 27);
      *((_QWORD *)v17 + 27) = v35;

    }
    v134 = v21;
    v135 = v19;
    v67 = v16;
    v68 = v67;
    v69 = *((double *)v17 + 1);
    v70 = *((double *)v17 + 2);
    v71 = *((double *)v17 + 3);
    v72 = *((double *)v17 + 4);
    if (v17[226])
    {
      v140 = v29;
      v73 = *((double *)v17 + 3);
      v74 = *((_QWORD *)v17 + 29);
      v75 = *((double *)v17 + 32);
      v76 = *((double *)v17 + 31);
      v77 = (void *)objc_msgSend(v67, "mutableCopy");
      objc_msgSend(v68, "referenceDimensions");
      v79 = v78;
      objc_msgSend(v68, "referenceDimensions");
      objc_msgSend(v77, "crop:", 0.0, -(double)v74 / v75, v79, v76 + v80);

      v72 = v72 + v76;
      v68 = v77;
      v71 = v73;
      v29 = v140;
    }
    v25 = objc_msgSend(*((id *)v17 + 16), "changePointCloudPOV:targetCamera:jasperToCameraTransform:outputPointCloud:", v149, v68, *((_QWORD *)v17 + 27), a2, a3, a4, a5);
    objc_msgSend(v142, "logPointCloud:name:timestamp:", *((_QWORD *)v17 + 27), "povChangedPointCloud", v29);
    if (v25)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "changePointCloudPOV failed", (uint8_t *)&buf, 2u);
      }
      v139 = 0;
LABEL_75:

      goto LABEL_140;
    }
    v83 = (void *)*((_QWORD *)v17 + 16);
    v84 = *((_QWORD *)v17 + 27);
    v85 = *((_QWORD *)v17 + 10);
    v86 = *((_QWORD *)v17 + 19);
    v150 = 0;
    v25 = objc_msgSend(v83, "projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:filteredPoints:", v84, v85, v86, &v150, v69, v70, v71, v72);
    v139 = v150;
    if (v25)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Projecting jasper points failed", (uint8_t *)&buf, 2u);
      }
      goto LABEL_75;
    }
    if (ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v87 = objc_msgSend(v149, "length");
        v88 = objc_msgSend(v139, "length");
        LODWORD(buf.data) = 67109376;
        HIDWORD(buf.data) = v87;
        LOWORD(buf.height) = 1024;
        *(_DWORD *)((char *)&buf.height + 2) = v88;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ADJasperColorV2Executor: got input point cloud of %u points, %u were used for inference", (uint8_t *)&buf, 0xEu);
        if (!v17[226])
          goto LABEL_90;
        goto LABEL_89;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    {
      v103 = objc_msgSend(v149, "length");
      v104 = objc_msgSend(v139, "length");
      LODWORD(buf.data) = 67109376;
      HIDWORD(buf.data) = v103;
      LOWORD(buf.height) = 1024;
      *(_DWORD *)((char *)&buf.height + 2) = v104;
      _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "ADJasperColorV2Executor: got input point cloud of %u points, %u were used for inference", (uint8_t *)&buf, 0xEu);
      if (!v17[226])
        goto LABEL_90;
      goto LABEL_89;
    }
    if (!v17[226])
    {
LABEL_90:

      v21 = v134;
      v19 = v135;
LABEL_31:
      objc_msgSend(v142, "logPixelBuffer:name:timestamp:", *((_QWORD *)v17 + 19), "processedJasper", v29);
      objc_msgSend(v141, "stopWithUTFString:", "preprocess jasper");
      kdebug_trace();
      if (v138)
      {
        if (v137 < 1)
          goto LABEL_139;
        --v137;
      }
      kdebug_trace();
      objc_msgSend(v141, "startWithUTFString:", "preprocess color");
      v37 = *((_QWORD *)v17 + 18);
      if (v37)
      {
        v38 = *(_DWORD *)(v37 + 40);
        v40 = *(double *)(v37 + 24);
        v39 = *(double *)(v37 + 32);
        if (v40 == (double)CVPixelBufferGetWidth(a7)
          && v39 == (double)CVPixelBufferGetHeight(a7)
          && CVPixelBufferGetPixelFormatType(a7) == v38
          && PixelBufferUtilsSession::verifyOutput(*((PixelBufferUtilsSession **)v17 + 18), *((CVPixelBufferRef *)v17 + 17)))
        {
LABEL_44:
          v50 = (CVPixelBufferRef *)(v17 + 136);
          if ((PixelBufferUtilsSession::run(*((PixelBufferUtilsSession **)v17 + 18), a7, *((__CVBuffer **)v17 + 17)) & 1) != 0)
          {
            v51 = v142;
            if (v17[226])
            {
              CVPixelBufferLockBaseAddress(*v50, 0);
              memset(&buf, 0, sizeof(buf));
              PixelBufferUtils::asVImageBuffer(*v50, *MEMORY[0x24BDBF090], &buf);
              v52 = *((_QWORD *)v17 + 29);
              if (v52)
              {
                v53 = 0;
                v54 = 1;
                data = (char *)buf.data;
                rowBytes = buf.rowBytes;
                do
                {
                  memcpy(&data[rowBytes * v53], &data[rowBytes * v52], rowBytes);
                  v53 = v54;
                  v52 = *((_QWORD *)v17 + 29);
                  ++v54;
                }
                while (v52 > v53);
              }
              v57 = *((_QWORD *)v17 + 30);
              if (v57)
              {
                v58 = 0;
                v59 = buf.rowBytes;
                v60 = 1;
                v61 = (char *)buf.data;
                height = buf.height;
                do
                {
                  memcpy(&v61[(height + ~v58) * v59], &v61[(height + ~v57) * v59], v59);
                  v58 = v60;
                  v57 = *((_QWORD *)v17 + 30);
                  ++v60;
                }
                while (v57 > v58);
              }
              CVPixelBufferUnlockBaseAddress(*v50, 0);
              v51 = v142;
            }
            objc_msgSend(v51, "logPixelBuffer:name:timestamp:", *v50, "processedColor", v29);
            objc_msgSend(v141, "stopWithUTFString:", "preprocess color");
            kdebug_trace();
            if (v138)
            {
              if (v137 < 1)
                goto LABEL_139;
              --v137;
            }
            kdebug_trace();
            objc_msgSend(v141, "startWithUTFString:", "network execution");
            if (v17[224])
            {
              objc_msgSend(v142, "logPixelBuffer:name:timestamp:", *((_QWORD *)v17 + 20), "prevDepth", v29);
              objc_msgSend(v142, "logPixelBuffer:name:timestamp:", *((_QWORD *)v17 + 21), "prevColor", v29);
              v63 = *((_QWORD *)v17 + 22);
              if (v63)
                objc_msgSend(v142, "logPixelBuffer:name:timestamp:", v63, "prevUncertainty", v29);
            }
            v25 = objc_msgSend(*((id *)v17 + 8), "execute");
            v64 = (CVPixelBufferRef *)(v17 + 184);
            objc_msgSend(v142, "logPixelBuffer:name:timestamp:", *((_QWORD *)v17 + 23), "outputDepth", v29);
            objc_msgSend(v142, "logPixelBuffer:name:timestamp:", *((_QWORD *)v17 + 24), "outputUncertainty", v29);
            if (v25)
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
LABEL_140:

                goto LABEL_141;
              }
              LOWORD(buf.data) = 0;
              v65 = MEMORY[0x24BDACB70];
              v66 = "Failed executing network";
LABEL_106:
              _os_log_error_impl(&dword_20B62B000, v65, OS_LOG_TYPE_ERROR, v66, (uint8_t *)&buf, 2u);
              goto LABEL_140;
            }
            objc_msgSend(v141, "stopWithUTFString:", "network execution");
            kdebug_trace();
            if (v138)
            {
              if (v137 < 1)
                goto LABEL_139;
              --v137;
            }
            kdebug_trace();
            objc_msgSend(v141, "startWithUTFString:", "postprocess depth");
            if (!*a10)
            {
              objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "depthOutput");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "imageDescriptor");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = objc_msgSend(v93, "pixelFormat");
              v157.width = v19;
              v157.height = v21;
              *a10 = PixelBufferUtils::createPixelBuffer(v94, v157, 1);

            }
            v95 = v136;
            v147 = v17 + 192;
            if (v136)
            {
              v96 = *v136;
              v97 = v137;
              if (*v136)
              {
LABEL_103:
                Width = CVPixelBufferGetWidth(*v64);
                v25 = objc_msgSend(*((id *)v17 + 16), "postProcessDepth:uncertainty:filteredPointCloud:outputDepth:outputUncertainty:depthRoi:", *v64, *v147, v139, *a10, v96, ((double)Width - v19) * 0.5, ((double)CVPixelBufferGetHeight(*v64) - v21) * 0.5, v19, v21);
                if (v25)
                {
                  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                    goto LABEL_140;
                  LOWORD(buf.data) = 0;
                  v65 = MEMORY[0x24BDACB70];
                  v66 = "Failed depth post processing";
                  goto LABEL_106;
                }
                objc_msgSend(v142, "logPixelBuffer:name:timestamp:", *a10, "outputProcessedDepth", v29);
                objc_msgSend(v141, "stopWithUTFString:", "postprocess depth");
                kdebug_trace();
                if (!v138 || (v32 = v97 < 1, --v97, !v32))
                {
                  kdebug_trace();
                  objc_msgSend(v141, "startWithUTFString:", "postprocess confidence");
                  if (v95)
                  {
                    v25 = objc_msgSend(*((id *)v17 + 16), "postProcessUncertainty:outputConfidence:confidenceUnits:", v96, *v95, 0);
                    if (v25)
                    {
                      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        goto LABEL_140;
                      LOWORD(buf.data) = 0;
                      v65 = MEMORY[0x24BDACB70];
                      v66 = "Failed uncertainty post processing";
                      goto LABEL_106;
                    }
                    objc_msgSend(v142, "logPixelBuffer:name:timestamp:", *v95, "outputProcessedConfidence", v29);
                  }
                  objc_msgSend(v141, "stopWithUTFString:", "postprocess confidence");
                  kdebug_trace();
                  v105 = v138;
                  if (v97 >= 1)
                    v105 = 0;
                  if ((v105 & 1) == 0)
                  {
                    kdebug_trace();
                    objc_msgSend(v141, "startWithUTFString:", "postprocess previous depth");
                    if (v17[224])
                    {
                      if (*((_QWORD *)v17 + 25) && *((_QWORD *)v17 + 26))
                      {
                        v106 = (void *)*((_QWORD *)v17 + 8);
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v107 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v107, "prevDepthInput");
                        v108 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v109 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v109, "depthFeaturesOutput");
                        v110 = (void *)objc_claimAutoreleasedReturnValue();
                        v25 = objc_msgSend(v106, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", v17 + 160, v108, v17 + 200, v110);

                        if (v25)
                        {
                          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            goto LABEL_140;
                          LOWORD(buf.data) = 0;
                          v65 = MEMORY[0x24BDACB70];
                          v66 = "Failed updating previous depth buffer";
                          goto LABEL_106;
                        }
                        v121 = (void *)*((_QWORD *)v17 + 8);
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v122 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v122, "prevColorInput");
                        v123 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v124, "colorFeaturesOutput");
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                        v25 = objc_msgSend(v121, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", v17 + 168, v123, v17 + 208, v125);

                        if (v25)
                        {
                          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            goto LABEL_140;
                          LOWORD(buf.data) = 0;
                          v65 = MEMORY[0x24BDACB70];
                          v66 = "Failed updating previous color buffer";
                          goto LABEL_106;
                        }
                      }
                      else
                      {
                        v111 = (void *)*((_QWORD *)v17 + 8);
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v112 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v112, "prevDepthInput");
                        v113 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v114 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v114, "depthOutput");
                        v115 = (void *)objc_claimAutoreleasedReturnValue();
                        v25 = objc_msgSend(v111, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", v17 + 160, v113, v17 + 184, v115);

                        if (v25)
                        {
                          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            goto LABEL_140;
                          LOWORD(buf.data) = 0;
                          v65 = MEMORY[0x24BDACB70];
                          v66 = "Failed updating previous depth buffer";
                          goto LABEL_106;
                        }
                        v116 = (void *)*((_QWORD *)v17 + 8);
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v117 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v117, "prevColorInput");
                        v118 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v119 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v119, "colorInput");
                        v120 = (void *)objc_claimAutoreleasedReturnValue();
                        v25 = objc_msgSend(v116, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", v17 + 168, v118, v17 + 136, v120);

                        if (v25)
                        {
                          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            goto LABEL_140;
                          LOWORD(buf.data) = 0;
                          v65 = MEMORY[0x24BDACB70];
                          v66 = "Failed updating previous color buffer";
                          goto LABEL_106;
                        }
                      }
                      objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                      v126 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v126, "prevUncertaintyInput");
                      v127 = (void *)objc_claimAutoreleasedReturnValue();
                      v128 = v127 == 0;

                      if (!v128)
                      {
                        v129 = (void *)*((_QWORD *)v17 + 8);
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v130, "prevUncertaintyInput");
                        v131 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
                        v132 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v132, "uncertaintyOutput");
                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                        v25 = objc_msgSend(v129, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", v17 + 176, v131, v147, v133);

                        if (v25)
                        {
                          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                            goto LABEL_140;
                          LOWORD(buf.data) = 0;
                          v65 = MEMORY[0x24BDACB70];
                          v66 = "Failed updating previous uncertainty buffer";
                          goto LABEL_106;
                        }
                      }
                    }
                    objc_msgSend(v141, "stopWithUTFString:", "postprocess previous depth");
                    kdebug_trace();
                    objc_msgSend(v17, "frameExecutionEnd");
                  }
                }
LABEL_139:
                v25 = 0;
                goto LABEL_140;
              }
              objc_msgSend(*((id *)v17 + 16), "inferenceDescriptor");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "uncertaintyOutput");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "imageDescriptor");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = objc_msgSend(v100, "pixelFormat");
              v158.width = v19;
              v158.height = v21;
              *v136 = PixelBufferUtils::createPixelBuffer(v101, v158, 1);

              v95 = v136;
              v96 = *v136;
            }
            else
            {
              v96 = 0;
            }
            v97 = v137;
            goto LABEL_103;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.data) = 0;
            v81 = MEMORY[0x24BDACB70];
            v82 = "Failed scaling color image";
            goto LABEL_100;
          }
          goto LABEL_78;
        }
        v41 = (PixelBufferUtilsSession *)*((_QWORD *)v17 + 18);
        if (v41)
        {
          PixelBufferUtilsSession::~PixelBufferUtilsSession(v41);
          MEMORY[0x20BD36498]();
        }
      }
      v42 = CVPixelBufferGetWidth(a7);
      v43 = CVPixelBufferGetHeight(a7);
      PixelFormatType = (PixelBufferUtilsSession *)CVPixelBufferGetPixelFormatType(a7);
      v45 = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v17 + 17));
      v46 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v17 + 17));
      v47 = CVPixelBufferGetPixelFormatType(*((CVPixelBufferRef *)v17 + 17));
      v156.width = (double)v42;
      v156.height = (double)v43;
      v159.height = (double)v46;
      v159.width = (double)v45;
      CropScaleConvertRotateSession = PixelBufferUtilsSession::createCropScaleConvertRotateSession(PixelFormatType, v156, v159, *(CGRect *)(v17 + 8), v47, *((_DWORD *)v17 + 20));
      *((_QWORD *)v17 + 18) = CropScaleConvertRotateSession;
      if (!CropScaleConvertRotateSession)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.data) = 0;
          v81 = MEMORY[0x24BDACB70];
          v82 = "Failed creating color scaling session";
LABEL_100:
          _os_log_error_impl(&dword_20B62B000, v81, OS_LOG_TYPE_ERROR, v82, (uint8_t *)&buf, 2u);
          v25 = -22950;
          goto LABEL_140;
        }
LABEL_78:
        v25 = -22950;
        goto LABEL_140;
      }
      v49 = *(const void **)(CropScaleConvertRotateSession + 8);
      if (v49)
      {
        if (!VTSessionSetProperty(v49, (CFStringRef)*MEMORY[0x24BDF9680], (CFTypeRef)*MEMORY[0x24BDF98E8]))
          goto LABEL_44;
      }
      else
      {
        NSLog(CFSTR("%s:%d - ERROR - session does not support scaling"), "setScalingMode", 4239);
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        v81 = MEMORY[0x24BDACB70];
        v82 = "Failed configuring color scaling session";
        goto LABEL_100;
      }
      goto LABEL_78;
    }
LABEL_89:
    CVPixelBufferLockBaseAddress(*((CVPixelBufferRef *)v17 + 19), 0);
    memset(&buf, 0, sizeof(buf));
    PixelBufferUtils::asVImageBuffer(*((PixelBufferUtils **)v17 + 19), *MEMORY[0x24BDBF090], &buf);
    v89 = (char *)buf.data;
    v90 = buf.rowBytes;
    bzero(buf.data, *((_QWORD *)v17 + 29) * buf.rowBytes);
    bzero(&v89[(buf.height - *((_QWORD *)v17 + 30)) * v90], *((_QWORD *)v17 + 30) * v90);
    CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v17 + 19), 0);
    goto LABEL_90;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.data) = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed preparing for executor for engine and ROI", (uint8_t *)&buf, 2u);
  }
LABEL_21:
  objc_sync_exit(v17);

  kdebug_trace();
  return v25;
}

- (void)dealloc
{
  PixelBufferUtilsSession *colorProcessingSession;
  objc_super v4;

  -[ADJasperColorV2Executor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  colorProcessingSession = self->_colorProcessingSession;
  if (colorProcessingSession)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
    MEMORY[0x20BD36498]();
  }
  v4.receiver = self;
  v4.super_class = (Class)ADJasperColorV2Executor;
  -[ADExecutor dealloc](&v4, sel_dealloc);
}

- (id)getIntermediates
{
  void *v3;
  __CVBuffer *itmPreProcessedColor;
  void *v5;
  ADMutableJasperPointCloud *itmPovChangedPointCloud;
  void *v7;
  __CVBuffer *itmPreProcessedJasper;
  void *v9;
  __CVBuffer *itmPrevDepth;
  void *v11;
  __CVBuffer *itmPrevColor;
  void *v13;
  __CVBuffer *itmPrevUncertainty;
  void *v15;
  __CVBuffer *itmUnprocessedDepth;
  void *v17;
  __CVBuffer *itmUnprocessedUncertainty;
  void *v19;
  __CVBuffer *itmDepthFeatures;
  void *v21;
  __CVBuffer *itmColorFeatures;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v43[0] = CFSTR("name");
    v43[1] = CFSTR("image");
    v44[0] = CFSTR("PreProcessed Color");
    v44[1] = itmPreProcessedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  itmPovChangedPointCloud = self->_itmPovChangedPointCloud;
  if (itmPovChangedPointCloud)
  {
    v41[0] = CFSTR("name");
    v41[1] = CFSTR("pointcloud");
    v42[0] = CFSTR("Pov-Changed Point Cloud");
    v42[1] = itmPovChangedPointCloud;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  itmPreProcessedJasper = self->_itmPreProcessedJasper;
  if (itmPreProcessedJasper)
  {
    v39[0] = CFSTR("name");
    v39[1] = CFSTR("image");
    v40[0] = CFSTR("PreProcessed Jasper");
    v40[1] = itmPreProcessedJasper;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  itmPrevDepth = self->_itmPrevDepth;
  if (itmPrevDepth)
  {
    v37[0] = CFSTR("name");
    v37[1] = CFSTR("image");
    v38[0] = CFSTR("Previous Depth");
    v38[1] = itmPrevDepth;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  itmPrevColor = self->_itmPrevColor;
  if (itmPrevColor)
  {
    v35[0] = CFSTR("name");
    v35[1] = CFSTR("image");
    v36[0] = CFSTR("Previous Color");
    v36[1] = itmPrevColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  itmPrevUncertainty = self->_itmPrevUncertainty;
  if (itmPrevUncertainty)
  {
    v33[0] = CFSTR("name");
    v33[1] = CFSTR("image");
    v34[0] = CFSTR("Previous Uncertainty");
    v34[1] = itmPrevUncertainty;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
  {
    v31[0] = CFSTR("name");
    v31[1] = CFSTR("image");
    v32[0] = CFSTR("Unprocessed Depth");
    v32[1] = itmUnprocessedDepth;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  itmUnprocessedUncertainty = self->_itmUnprocessedUncertainty;
  if (itmUnprocessedUncertainty)
  {
    v29[0] = CFSTR("name");
    v29[1] = CFSTR("image");
    v30[0] = CFSTR("Unprocessed Uncertainty");
    v30[1] = itmUnprocessedUncertainty;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  itmDepthFeatures = self->_itmDepthFeatures;
  if (itmDepthFeatures)
  {
    v27[0] = CFSTR("name");
    v27[1] = CFSTR("image");
    v28[0] = CFSTR("Depth features");
    v28[1] = itmDepthFeatures;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  itmColorFeatures = self->_itmColorFeatures;
  if (itmColorFeatures)
  {
    v25[0] = CFSTR("name");
    v25[1] = CFSTR("image");
    v26[0] = CFSTR("Color features");
    v26[1] = itmColorFeatures;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  return v3;
}

- (int64_t)numberOfExecutionSteps
{
  return 6;
}

- (__CVBuffer)prevDepth
{
  return self->_itmPrevDepth;
}

- (__CVBuffer)prevUncertainty
{
  return self->_itmPrevUncertainty;
}

- (__CVBuffer)prevColor
{
  return self->_itmPrevColor;
}

- (ADJasperColorV2ExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_itmPovChangedPointCloud, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
