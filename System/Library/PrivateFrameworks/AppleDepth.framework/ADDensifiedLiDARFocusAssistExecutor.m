@implementation ADDensifiedLiDARFocusAssistExecutor

- (ADDensifiedLiDARFocusAssistExecutor)init
{
  uint64_t v3;

  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
    v3 = 4;
  else
    v3 = 0;
  return -[ADDensifiedLiDARFocusAssistExecutor initWithEngineType:](self, "initWithEngineType:", v3);
}

- (ADDensifiedLiDARFocusAssistExecutor)initWithEngineType:(unint64_t)a3
{
  ADDensifiedLiDARFocusAssistExecutor *v5;
  ADDensifiedLiDARFocusAssistPipeline *v6;
  ADDensifiedLiDARFocusAssistPipeline *pipeline;
  ADDensifiedLiDARFocusAssistExecutorParameters *v8;
  ADDensifiedLiDARFocusAssistExecutorParameters *executorParameters;
  ADMutableJasperPointCloud *itmPovChangedPointCloud;
  ADDensifiedLiDARFocusAssistExecutor *v11;
  objc_super v13;
  int v14;
  __int128 v15;
  __int128 v16;

  v14 = 335686432;
  v15 = 0u;
  v16 = 0u;
  kdebug_trace();
  v13.receiver = self;
  v13.super_class = (Class)ADDensifiedLiDARFocusAssistExecutor;
  v5 = -[ADExecutor init](&v13, sel_init);
  if (v5)
  {
    v6 = -[ADDensifiedLiDARFocusAssistPipeline initWithEspressoEngine:]([ADDensifiedLiDARFocusAssistPipeline alloc], "initWithEspressoEngine:", a3);
    pipeline = v5->_pipeline;
    v5->_pipeline = v6;

    if (!v5->_pipeline
      || (v8 = -[ADDensifiedLiDARFocusAssistExecutorParameters initForPipeline:]([ADDensifiedLiDARFocusAssistExecutorParameters alloc], "initForPipeline:", v5->_pipeline), executorParameters = v5->_executorParameters, v5->_executorParameters = v8, executorParameters, !v5->_executorParameters))
    {
      v11 = 0;
      goto LABEL_7;
    }
    v5->super._engineType = a3;
    v5->_itmPreProcessedColor = 0;
    v5->_colorProcessingSession = 0;
    v5->_itmUnprocessedDepth = 0;
    v5->_itmUnprocessedUncertainty = 0;
    itmPovChangedPointCloud = v5->_itmPovChangedPointCloud;
    v5->_itmPovChangedPointCloud = 0;

    v5->_isPrepared = 0;
  }
  v11 = v5;
LABEL_7:
  kdebug_trace();

  return v11;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedLidar);
  self->_itmPreProcessedLidar = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
  CVPixelBufferRelease(self->_itmUnprocessedUncertainty);
  self->_itmUnprocessedUncertainty = 0;
}

- (int64_t)allocateIntermediateBuffers
{
  ADEspressoRunner *espressoRunner;
  void *v4;
  void *v5;
  ADEspressoRunner *v6;
  void *v7;
  void *v8;
  ADMutableJasperPointCloud *v9;
  ADMutableJasperPointCloud *itmPovChangedPointCloud;
  ADEspressoRunner *v11;
  void *v12;
  void *v13;

  -[ADDensifiedLiDARFocusAssistExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  espressoRunner = self->super._espressoRunner;
  -[ADDensifiedLiDARFocusAssistPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](espressoRunner, "createAndRegisterPixelBufferForDescriptor:", v5);

  v6 = self->super._espressoRunner;
  -[ADDensifiedLiDARFocusAssistPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lidarInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmPreProcessedLidar = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v6, "createAndRegisterPixelBufferForDescriptor:", v8);

  v9 = (ADMutableJasperPointCloud *)objc_msgSend(objc_alloc(MEMORY[0x24BE06000]), "initWithCapacity:", 576);
  itmPovChangedPointCloud = self->_itmPovChangedPointCloud;
  self->_itmPovChangedPointCloud = v9;

  v11 = self->super._espressoRunner;
  -[ADDensifiedLiDARFocusAssistPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uncertaintyOutput");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_itmUnprocessedUncertainty = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v11, "createAndRegisterPixelBufferForDescriptor:", v13);

  if (self->_itmPreProcessedColor
    && self->_itmPreProcessedLidar
    && self->_itmPovChangedPointCloud
    && self->_itmUnprocessedUncertainty)
  {
    return 0;
  }
  -[ADDensifiedLiDARFocusAssistExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  return -22971;
}

- (int64_t)prepareForColorROI:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ADDensifiedLiDARFocusAssistExecutor *v8;
  void *v9;
  unint64_t engineType;
  void *v11;
  void *v12;
  int64_t v13;
  PixelBufferUtilsSession *colorProcessingSession;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  kdebug_trace();
  v8 = self;
  objc_sync_enter(v8);
  -[ADDensifiedLiDARFocusAssistPipeline inferenceDescriptor](v8->_pipeline, "inferenceDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  engineType = v8->super._engineType;
  objc_msgSend(v9, "colorInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v8, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", engineType, v12, 1, 2, v9, x, y, width, height);

  if (!v13)
  {
    v13 = -[ADDensifiedLiDARFocusAssistExecutor allocateIntermediateBuffers](v8, "allocateIntermediateBuffers");
    if (!v13)
    {
      colorProcessingSession = v8->_colorProcessingSession;
      if (colorProcessingSession)
      {
        PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
        MEMORY[0x20BD36498]();
      }
      v13 = 0;
      v8->_colorProcessingSession = 0;
      v8->_isPrepared = 1;
    }
  }

  objc_sync_exit(v8);
  kdebug_trace();
  return v13;
}

- (int64_t)prepare
{
  return -[ADDensifiedLiDARFocusAssistExecutor prepareForColorROI:](self, "prepareForColorROI:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

- (int64_t)updateColorROI:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t result;
  int v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v24 = *MEMORY[0x24BDAC8D0];
  if (CGRectIsEmpty(a3))
    goto LABEL_7;
  -[ADDensifiedLiDARFocusAssistPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeForLayout:", self->super._layout);
  v12 = v11;
  v14 = v13;

  if (fabs(height * v12 - width * v14) <= width * 0.001 * v12)
  {

LABEL_7:
    result = 0;
    self->super._inputRoi.origin.x = x;
    self->super._inputRoi.origin.y = y;
    self->super._inputRoi.size.width = width;
    self->super._inputRoi.size.height = height;
    return result;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218752;
    v17 = width;
    v18 = 2048;
    v19 = height;
    v20 = 2048;
    v21 = v12;
    v22 = 2048;
    v23 = v14;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to update color ROI: aspect ratio (%fx%f) differs from the one used during prepare (%fx%f)", (uint8_t *)&v16, 0x2Au);
  }

  return -22957;
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

  -[ADDensifiedLiDARFocusAssistPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
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

- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 lidarToColorTransform:(double)a5 colorCameraCalibration:(uint64_t)a6 outputDepthMap:(__CVBuffer *)a7 outputConfidenceMap:(void *)a8 outputCalibration:(void *)a9
{
  id v18;
  char *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  int v35;
  double v36;
  double v37;
  PixelBufferUtilsSession *CropScaleConvertRotateSession;
  PixelBufferUtilsSession *v39;
  size_t Width;
  size_t Height;
  PixelBufferUtilsSession *PixelFormatType;
  size_t v43;
  size_t v44;
  OSType v45;
  int v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  OSType v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  __CVBuffer **v62;
  void *v63;
  void *v64;
  void *v65;
  OSType v66;
  void *v67;
  __CVBuffer *v68;
  void *v69;
  void *v70;
  void *v71;
  char v72;
  CVPixelBufferRef v73;
  void *v74;
  void *v75;
  void *v76;
  OSType v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  size_t v82;
  id v83;
  _QWORD *v84;
  CVPixelBufferRef *v85;
  uint64_t v86;
  int v87;
  void *v88;
  void *v89;
  _BOOL4 v94;
  id v95;
  uint8_t buf[16];
  int v97;
  __int128 v98;
  __int128 v99;
  CGSize v100;
  CGSize v101;
  CGSize v102;
  CGSize v103;
  CGRect v104;

  v18 = a8;
  v95 = a9;
  v97 = 335686992;
  v98 = 0u;
  v99 = 0u;
  kdebug_trace();
  v19 = a1;
  objc_sync_enter(v19);
  if (v19[120]
    || (v26 = objc_msgSend(v19, "prepareForColorROI:", *((double *)v19 + 1), *((double *)v19 + 2), *((double *)v19 + 3), *((double *)v19 + 4))) == 0)
  {
    if (!a7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = MEMORY[0x24BDACB70];
        v25 = "Must provide input color image";
        goto LABEL_63;
      }
LABEL_24:
      v26 = -22953;
      goto LABEL_25;
    }
    if (!v18)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = MEMORY[0x24BDACB70];
        v25 = "Must provide point cloud";
        goto LABEL_63;
      }
      goto LABEL_24;
    }
    if (!a10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = MEMORY[0x24BDACB70];
        v25 = "Must provide a pointer to outputDepthMap";
        goto LABEL_63;
      }
      goto LABEL_24;
    }
    objc_msgSend(v19, "expectedOutputSize");
    v21 = v20;
    v23 = v22;
    if (*a10 && (v20 != (double)CVPixelBufferGetWidth(*a10) || v23 != (double)CVPixelBufferGetHeight(*a10)))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = MEMORY[0x24BDACB70];
        v25 = "Output depth buffer size does not match descriptor";
LABEL_63:
        _os_log_error_impl(&dword_20B62B000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
        v26 = -22953;
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    if (a11 && *a11 && (v21 != (double)CVPixelBufferGetWidth(*a11) || v23 != (double)CVPixelBufferGetHeight(*a11)))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v24 = MEMORY[0x24BDACB70];
        v25 = "Output confidence buffer width does not match descriptor";
        goto LABEL_63;
      }
      goto LABEL_24;
    }
    objc_msgSend(*((id *)v19 + 23), "logger");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "systemUptime");
    v30 = v29;

    objc_msgSend(v88, "logPixelBuffer:name:timestamp:", a7, "inputColor", v30);
    objc_msgSend(v88, "logPointCloud:name:timestamp:", v18, "inputPointCloud", v30);
    objc_msgSend(v88, "logMatrix4x3:name:timestamp:", "lidarToColorTransform", a2, a3, a4, a5, v30);
    objc_msgSend(v88, "logCalibration:name:timestamp:", v95, "colorCameraCalibration", v30);
    v31 = objc_msgSend(v19, "numberOfExecutionSteps");
    v32 = objc_msgSend(*((id *)v19 + 23), "stepsToSkip");
    v87 = objc_msgSend(*((id *)v19 + 23), "powerMeasureMode");
    objc_msgSend(*((id *)v19 + 23), "timeProfiler");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v31 - v32;
    if (v87)
    {
      v33 = v86-- < 1;
      if (v33)
        goto LABEL_95;
    }
    v84 = a12;
    v85 = a11;
    kdebug_trace();
    objc_msgSend(v89, "startWithUTFString:", "preprocess color");
    objc_msgSend(v19, "frameExecutionStart");
    v34 = *((_QWORD *)v19 + 18);
    if (v34)
    {
      v35 = *(_DWORD *)(v34 + 40);
      v37 = *(double *)(v34 + 24);
      v36 = *(double *)(v34 + 32);
      if (v37 == (double)CVPixelBufferGetWidth(a7)
        && v36 == (double)CVPixelBufferGetHeight(a7)
        && CVPixelBufferGetPixelFormatType(a7) == v35
        && PixelBufferUtilsSession::verifyOutput(*((PixelBufferUtilsSession **)v19 + 18), *((CVPixelBufferRef *)v19 + 17)))
      {
        CropScaleConvertRotateSession = (PixelBufferUtilsSession *)*((_QWORD *)v19 + 18);
        goto LABEL_37;
      }
      v39 = (PixelBufferUtilsSession *)*((_QWORD *)v19 + 18);
      if (v39)
      {
        PixelBufferUtilsSession::~PixelBufferUtilsSession(v39);
        MEMORY[0x20BD36498]();
      }
    }
    Width = CVPixelBufferGetWidth(a7);
    Height = CVPixelBufferGetHeight(a7);
    PixelFormatType = (PixelBufferUtilsSession *)CVPixelBufferGetPixelFormatType(a7);
    v43 = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v19 + 17));
    v44 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v19 + 17));
    v45 = CVPixelBufferGetPixelFormatType(*((CVPixelBufferRef *)v19 + 17));
    v100.width = (double)Width;
    v100.height = (double)Height;
    v103.height = (double)v44;
    v103.width = (double)v43;
    CropScaleConvertRotateSession = (PixelBufferUtilsSession *)PixelBufferUtilsSession::createCropScaleConvertRotateSession(PixelFormatType, v100, v103, *(CGRect *)(v19 + 8), v45, *((_DWORD *)v19 + 20));
    *((_QWORD *)v19 + 18) = CropScaleConvertRotateSession;
    if (!CropScaleConvertRotateSession)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_52;
      *(_WORD *)buf = 0;
      v49 = MEMORY[0x24BDACB70];
      v50 = "Failed creating color scaling session";
      goto LABEL_51;
    }
LABEL_37:
    if ((PixelBufferUtilsSession::updateCrop(CropScaleConvertRotateSession, *(CGRect *)(v19 + 8)) & 1) != 0)
    {
      if ((PixelBufferUtilsSession::run(*((PixelBufferUtilsSession **)v19 + 18), a7, *((__CVBuffer **)v19 + 17)) & 1) != 0)
      {
        objc_msgSend(v88, "logPixelBuffer:name:timestamp:", *((_QWORD *)v19 + 17), "processedColor", v30);
        objc_msgSend(v89, "stopWithUTFString:", "preprocess color");
        kdebug_trace();
        if (v87)
        {
          v33 = v86-- < 1;
          if (v33)
            goto LABEL_95;
        }
        kdebug_trace();
        objc_msgSend(v89, "startWithUTFString:", "preprocess jasper");
        v46 = objc_msgSend(*((id *)v19 + 22), "capacity");
        if (v46 >= (int)objc_msgSend(v18, "length"))
        {
          objc_msgSend(*((id *)v19 + 22), "resize:", 0);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "increasing point cloud capacity", buf, 2u);
          }
          v47 = objc_msgSend(objc_alloc(MEMORY[0x24BE06000]), "initWithCapacity:", objc_msgSend(v18, "length"));
          v48 = (void *)*((_QWORD *)v19 + 22);
          *((_QWORD *)v19 + 22) = v47;

        }
        v26 = objc_msgSend(*((id *)v19 + 16), "changePointCloudPOV:targetCamera:lidarToCameraTransform:outputPointCloud:", v18, v95, *((_QWORD *)v19 + 22), a2, a3, a4, a5);
        objc_msgSend(v88, "logPointCloud:name:timestamp:", *((_QWORD *)v19 + 22), "povChangedPointCloud", v30);
        if (v26)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v51 = MEMORY[0x24BDACB70];
            v52 = "changePointCloudPOV failed";
LABEL_77:
            _os_log_error_impl(&dword_20B62B000, v51, OS_LOG_TYPE_ERROR, v52, buf, 2u);
            goto LABEL_96;
          }
          goto LABEL_96;
        }
        v53 = *((double *)v19 + 1);
        v54 = *((double *)v19 + 2);
        v55 = *((double *)v19 + 3);
        v56 = *((double *)v19 + 4);
        v104.origin.x = v53;
        v104.origin.y = v54;
        v104.size.width = v55;
        v104.size.height = v56;
        if (CGRectIsEmpty(v104))
        {
          v55 = (double)CVPixelBufferGetWidth(a7);
          v56 = (double)CVPixelBufferGetHeight(a7);
          v53 = 0.0;
          v54 = 0.0;
        }
        v26 = objc_msgSend(*((id *)v19 + 16), "projectLidarPoints:crop:projectedPointsBuffer:", *((_QWORD *)v19 + 22), *((_QWORD *)v19 + 19), v53 - v55 * 0.5, v54 - v56 * 0.5, v55 + v55, v56 + v56);
        if (v26)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v51 = MEMORY[0x24BDACB70];
            v52 = "Projecting jasper points failed";
            goto LABEL_77;
          }
LABEL_96:

          goto LABEL_25;
        }
        objc_msgSend(v88, "logPixelBuffer:name:timestamp:", *((_QWORD *)v19 + 19), "processedJasper", v30);
        v94 = *a10 != 0;
        if (*a10)
        {
          v57 = CVPixelBufferGetPixelFormatType(*a10);
          objc_msgSend(*((id *)v19 + 16), "inferenceDescriptor");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "depthOutput");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "imageDescriptor");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "pixelFormat");

          if (v57 == v61)
          {
            v94 = 0;
            v62 = a10;
LABEL_72:
            v68 = *v62;
            v69 = (void *)*((_QWORD *)v19 + 8);
            objc_msgSend(*((id *)v19 + 16), "inferenceDescriptor");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "depthOutput");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "registerPixelBuffer:forDescriptor:", v68, v71);

            objc_msgSend(v89, "stopWithUTFString:", "preprocess jasper");
            kdebug_trace();
            if (!v87 || (v33 = v86 < 1, --v86, !v33))
            {
              kdebug_trace();
              objc_msgSend(v89, "startWithUTFString:", "network execution");
              v26 = objc_msgSend(*((id *)v19 + 8), "execute");
              objc_msgSend(v88, "logPixelBuffer:name:timestamp:", v68, "outputDepth", v30);
              objc_msgSend(v88, "logPixelBuffer:name:timestamp:", *((_QWORD *)v19 + 21), "outputUncertainty", v30);
              if (v26)
              {
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v51 = MEMORY[0x24BDACB70];
                  v52 = "Failed executing network";
                  goto LABEL_77;
                }
                goto LABEL_96;
              }
              objc_msgSend(v89, "stopWithUTFString:", "network execution");
              kdebug_trace();
              if (!v87 || (v33 = v86 < 1, --v86, !v33))
              {
                kdebug_trace();
                objc_msgSend(v89, "startWithUTFString:", "postprocess depth");
                if (v94)
                {
                  +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", v68, *a10);
                  objc_msgSend(v88, "logPixelBuffer:name:timestamp:", *a10, "outputProcessedDepth", v30);
                }
                objc_msgSend(v89, "stopWithUTFString:", "postprocess depth");
                kdebug_trace();
                v72 = v87;
                if (v86 >= 1)
                  v72 = 0;
                if ((v72 & 1) == 0)
                {
                  kdebug_trace();
                  objc_msgSend(v89, "startWithUTFString:", "postprocess confidence");
                  if (v85)
                  {
                    v73 = *v85;
                    if (!*v85)
                    {
                      objc_msgSend(*((id *)v19 + 16), "inferenceDescriptor");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "uncertaintyOutput");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "imageDescriptor");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      v77 = objc_msgSend(v76, "pixelFormat");
                      v102.width = v21;
                      v102.height = v23;
                      *v85 = PixelBufferUtils::createPixelBuffer(v77, v102, 1);

                      v73 = *v85;
                    }
                    v78 = (void *)*((_QWORD *)v19 + 16);
                    v79 = *((_QWORD *)v19 + 21);
                    objc_msgSend(*((id *)v19 + 23), "pipelineParameters");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    v26 = objc_msgSend(v78, "postProcessUncertainty:outputConfidence:confidenceUnits:", v79, v73, objc_msgSend(v80, "confidenceUnits"));

                    if (v26)
                    {
                      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        goto LABEL_96;
                      *(_WORD *)buf = 0;
                      v51 = MEMORY[0x24BDACB70];
                      v52 = "Failed uncertainty post processing";
                      goto LABEL_77;
                    }
                    objc_msgSend(v88, "logPixelBuffer:name:timestamp:", *v85, "outputProcessedConfidence", v30);
                  }
                  if (v84)
                  {
                    v81 = (void *)objc_msgSend(v95, "mutableCopy");
                    objc_msgSend(v81, "crop:", v53, v54, v55, v56);
                    v82 = CVPixelBufferGetWidth(v68);
                    objc_msgSend(v81, "scale:", (double)v82, (double)CVPixelBufferGetHeight(v68));
                    v83 = objc_retainAutorelease(v81);
                    *v84 = v83;

                  }
                  objc_msgSend(v89, "stopWithUTFString:", "postprocess confidence");
                  kdebug_trace();
                  objc_msgSend(v19, "frameExecutionEnd");
                }
              }
            }
LABEL_95:
            v26 = 0;
            goto LABEL_96;
          }
          v62 = (__CVBuffer **)(v19 + 160);
          if (*((_QWORD *)v19 + 20))
          {
            v94 = 1;
            goto LABEL_72;
          }
          v67 = (void *)*((_QWORD *)v19 + 8);
          objc_msgSend(*((id *)v19 + 16), "inferenceDescriptor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "depthOutput");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *v62 = (__CVBuffer *)objc_msgSend(v67, "createAndRegisterPixelBufferForDescriptor:", v64);
        }
        else
        {
          objc_msgSend(*((id *)v19 + 16), "inferenceDescriptor");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "depthOutput");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "imageDescriptor");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "pixelFormat");
          v101.width = v21;
          v101.height = v23;
          *a10 = PixelBufferUtils::createPixelBuffer(v66, v101, 1);

          v62 = a10;
        }

        goto LABEL_72;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v49 = MEMORY[0x24BDACB70];
        v50 = "Failed scaling color image";
        goto LABEL_51;
      }
LABEL_52:
      v26 = -22950;
      goto LABEL_96;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v49 = MEMORY[0x24BDACB70];
    v50 = "Failed configuring color scaling session";
LABEL_51:
    _os_log_error_impl(&dword_20B62B000, v49, OS_LOG_TYPE_ERROR, v50, buf, 2u);
    goto LABEL_52;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed preparing for executor for engine and ROI", buf, 2u);
  }
LABEL_25:
  objc_sync_exit(v19);

  kdebug_trace();
  return v26;
}

- (void)dealloc
{
  PixelBufferUtilsSession *colorProcessingSession;
  objc_super v4;

  -[ADDensifiedLiDARFocusAssistExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  colorProcessingSession = self->_colorProcessingSession;
  if (colorProcessingSession)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
    MEMORY[0x20BD36498]();
  }
  v4.receiver = self;
  v4.super_class = (Class)ADDensifiedLiDARFocusAssistExecutor;
  -[ADExecutor dealloc](&v4, sel_dealloc);
}

- (id)getIntermediates
{
  void *v3;
  __CVBuffer *itmPreProcessedColor;
  void *v5;
  __CVBuffer *itmPreProcessedLidar;
  void *v7;
  __CVBuffer *itmUnprocessedDepth;
  void *v9;
  __CVBuffer *itmUnprocessedUncertainty;
  void *v11;
  ADMutableJasperPointCloud *itmPovChangedPointCloud;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v23[0] = CFSTR("name");
    v23[1] = CFSTR("image");
    v24[0] = CFSTR("PreProcessed Color");
    v24[1] = itmPreProcessedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  itmPreProcessedLidar = self->_itmPreProcessedLidar;
  if (itmPreProcessedLidar)
  {
    v21[0] = CFSTR("name");
    v21[1] = CFSTR("image");
    v22[0] = CFSTR("PreProcessed Jasper");
    v22[1] = itmPreProcessedLidar;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
  {
    v19[0] = CFSTR("name");
    v19[1] = CFSTR("image");
    v20[0] = CFSTR("Unprocessed Depth");
    v20[1] = itmUnprocessedDepth;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  itmUnprocessedUncertainty = self->_itmUnprocessedUncertainty;
  if (itmUnprocessedUncertainty)
  {
    v17[0] = CFSTR("name");
    v17[1] = CFSTR("image");
    v18[0] = CFSTR("Unprocessed Uncertainty");
    v18[1] = itmUnprocessedUncertainty;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  itmPovChangedPointCloud = self->_itmPovChangedPointCloud;
  if (itmPovChangedPointCloud)
  {
    v15[0] = CFSTR("name");
    v15[1] = CFSTR("pointcloud");
    v16[0] = CFSTR("Pov-Changed Point Cloud");
    v16[1] = itmPovChangedPointCloud;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  return v3;
}

- (int64_t)numberOfExecutionSteps
{
  return 5;
}

- (ADDensifiedLiDARFocusAssistExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_itmPovChangedPointCloud, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
