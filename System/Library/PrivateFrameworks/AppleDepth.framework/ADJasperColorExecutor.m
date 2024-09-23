@implementation ADJasperColorExecutor

- (ADJasperColorExecutor)initWithInputPrioritization:(int64_t)a3
{
  void *v5;
  ADJasperColorExecutor *v6;

  v5 = (void *)objc_opt_new();
  v6 = -[ADJasperColorExecutor initWithInputPrioritization:parameters:](self, "initWithInputPrioritization:parameters:", a3, v5);

  return v6;
}

- (ADJasperColorExecutor)initWithInputPrioritization:(int64_t)a3 parameters:(id)a4
{
  id v6;
  ADJasperColorExecutor *v7;
  ADJasperColorPipeline *v8;
  void *v9;
  uint64_t v10;
  ADJasperColorPipeline *pipeline;
  ADJasperColorExecutor *v12;
  objc_super v14;
  int v15;
  __int128 v16;
  __int128 v17;

  v6 = a4;
  v15 = 335686668;
  v16 = 0u;
  v17 = 0u;
  kdebug_trace();
  v14.receiver = self;
  v14.super_class = (Class)ADJasperColorExecutor;
  v7 = -[ADExecutor init](&v14, sel_init);
  if (v7)
  {
    if (!v6)
      v6 = (id)objc_opt_new();
    v8 = [ADJasperColorPipeline alloc];
    objc_msgSend(v6, "pipelineParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ADJasperColorPipeline initWithInputPrioritization:andParameters:](v8, "initWithInputPrioritization:andParameters:", a3, v9);
    pipeline = v7->_pipeline;
    v7->_pipeline = (ADJasperColorPipeline *)v10;

    if (!v7->_pipeline)
    {
      v12 = 0;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v7->_executorParameters, v6);
    v7->_colorProcessingSession = 0;
    v7->_itmPreProcessedColor = 0;
    v7->_itmPreProcessedJasper = 0;
    v7->_itmUnprocessedDepth = 0;
    v7->_itmPostProcessedDepth = 0;
    v7->_itmUnprocessedConf = 0;
    v7->_itmPostProcessedConf = 0;
    v7->_itmUnprocessedNormals = 0;
    v7->_itmPostProcessedNormals = 0;
    v7->_itmUnprocessedAlpha = 0;
    v7->_itmPrevProcessedFusedDepth = 0;
    v7->_itmPrevProcessedFusedConf = 0;
    v7->_itmCurrProcessedFusedConf = 0;
    v7->_itmWarpedPrevDepth = 0;
    v7->_itmWarpedPrevConf = 0;
    v7->_itmPrevProcessedFusedNormals = 0;
    v7->_itmOpticalFlow = 0;
    v7->_firstTimeExecution = 1;
    v7->_opticalFlowEnabled = 0;
  }
  v12 = v7;
LABEL_8:
  kdebug_trace();

  return v12;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedColor);
  self->_itmPreProcessedColor = 0;
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  self->_itmPreProcessedJasper = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
  CVPixelBufferRelease(self->_itmUnprocessedConf);
  self->_itmUnprocessedConf = 0;
  CVPixelBufferRelease(self->_itmUnprocessedNormals);
  self->_itmUnprocessedNormals = 0;
  CVPixelBufferRelease(self->_itmUnprocessedAlpha);
  self->_itmUnprocessedAlpha = 0;
}

- (int64_t)allocateIntermediateBuffers
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  ADEspressoRunner *espressoRunner;
  void *v39;
  void *v40;
  ADEspressoRunner *v41;
  void *v42;
  void *v43;
  ADEspressoRunner *v44;
  void *v45;
  void *v46;
  ADEspressoRunner *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  ADEspressoRunner *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  ADEspressoRunner *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v63;
  uint64_t v64;
  int v65;

  -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "depthOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sizeForLayout:", self->super._layout);
  +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v5, "pixelFormat"), &self->_itmPostProcessedDepth, v6, v7);
  -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "confidenceOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "sizeForLayout:", self->super._layout);
  +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v10, "pixelFormat"), &self->_itmPostProcessedConf, v11, v12);
  if (self->_itmPostProcessedDepth && self->_itmPostProcessedConf)
  {
    if (-[ADJasperColorExecutorParameters doComputeNormals](self->_executorParameters, "doComputeNormals"))
    {
      -[ADJasperColorPipeline processedNormalsOutputDescriptor](self->_pipeline, "processedNormalsOutputDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "sizeForLayout:", self->super._layout);
        +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v14, "pixelFormat"), &self->_itmPostProcessedNormals, v15, v16);
        v65 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v14 = 0;
    }
    v65 = 1;
LABEL_9:
    v63 = 289;
    if (self->_opticalFlowEnabled)
    {
      objc_msgSend(v5, "sizeForLayout:", self->super._layout);
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v5, "pixelFormat"), &self->_itmPrevProcessedFusedDepth, v18, v19);
      objc_msgSend(v5, "sizeForLayout:", self->super._layout);
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v5, "pixelFormat"), &self->_itmWarpedPrevDepth, v20, v21);
      objc_msgSend(v5, "sizeForLayout:", self->super._layout);
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v5, "pixelFormat"), &self->_itmCurrProcessedFusedDepth, v22, v23);
      objc_msgSend(v10, "sizeForLayout:", self->super._layout);
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v10, "pixelFormat"), &self->_itmPrevProcessedFusedConf, v24, v25);
      objc_msgSend(v10, "sizeForLayout:", self->super._layout);
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v10, "pixelFormat"), &self->_itmCurrProcessedFusedConf, v26, v27);
      objc_msgSend(v10, "sizeForLayout:", self->super._layout);
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v10, "pixelFormat"), &self->_itmWarpedPrevConf, v28, v29);
      if ((v65 & 1) == 0)
      {
        objc_msgSend(v14, "sizeForLayout:", self->super._layout);
        +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v14, "pixelFormat"), &self->_itmPrevProcessedFusedNormals, v30, v31);
        objc_msgSend(v14, "sizeForLayout:", self->super._layout);
        +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v14, "pixelFormat"), &self->_itmCurrProcessedFusedNormals, v32, v33);
      }
      -[ADJasperColorPipeline LKTTexturesDescriptor](self->_pipeline, "LKTTexturesDescriptor", 289);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "shiftmapDescriptor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "sizeForLayout:", self->super._layout);
      +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v35, "pixelFormat"), &self->_itmOpticalFlow, v36, v37);

    }
    -[ADJasperColorExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers", v63);
    espressoRunner = self->super._espressoRunner;
    -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "colorInput");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmPreProcessedColor = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](espressoRunner, "createAndRegisterPixelBufferForDescriptor:", v40);

    v41 = self->super._espressoRunner;
    -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "jasperInput");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmPreProcessedJasper = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v41, "createAndRegisterPixelBufferForDescriptor:", v43);

    v44 = self->super._espressoRunner;
    -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "depthOutput");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmUnprocessedDepth = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v44, "createAndRegisterPixelBufferForDescriptor:", v46);

    v47 = self->super._espressoRunner;
    -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "confidenceOutput");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itmUnprocessedConf = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v47, "createAndRegisterPixelBufferForDescriptor:", v49);

    if (self->_itmPreProcessedColor
      && self->_itmPreProcessedJasper
      && self->_itmUnprocessedDepth
      && self->_itmUnprocessedConf)
    {
      if (-[ADJasperColorExecutorParameters doComputeNormals](self->_executorParameters, "doComputeNormals"))
      {
        -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "normalsOutput");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          v52 = self->super._espressoRunner;
          -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "normalsOutput");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          self->_itmUnprocessedNormals = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v52, "createAndRegisterPixelBufferForDescriptor:", v54);

        }
      }
      if (!*((_BYTE *)&self->super.super.isa + v64))
      {
LABEL_27:
        if (!-[ADJasperColorExecutorParameters doComputeNormals](self->_executorParameters, "doComputeNormals")
          || v65
          && (-[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor"),
              v60 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v60, "normalsOutput"),
              v61 = (void *)objc_claimAutoreleasedReturnValue(),
              v61,
              v60,
              !v61)
          || self->_itmUnprocessedNormals
          && self->_itmPostProcessedNormals
          && (!*((_BYTE *)&self->super.super.isa + v64)
           || self->_itmCurrProcessedFusedNormals && self->_itmPrevProcessedFusedNormals))
        {
          v17 = 0;
LABEL_37:

          goto LABEL_38;
        }
LABEL_39:
        -[ADJasperColorExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
        v17 = -22965;
        goto LABEL_37;
      }
      -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "alphaMapOutput");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v56)
        goto LABEL_42;
      v57 = self->super._espressoRunner;
      -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "alphaMapOutput");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      self->_itmUnprocessedAlpha = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v57, "createAndRegisterPixelBufferForDescriptor:", v59);

      if (self->_itmUnprocessedAlpha)
      {
LABEL_42:
        if (*((_BYTE *)&self->super.super.isa + v64)
          && (!self->_itmCurrProcessedFusedDepth || !self->_itmPrevProcessedFusedDepth || !self->_itmOpticalFlow))
        {
          goto LABEL_39;
        }
        goto LABEL_27;
      }
    }
    -[ADJasperColorExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
    v17 = -22971;
    goto LABEL_37;
  }
  v17 = -22965;
LABEL_38:

  return v17;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5
{
  return -[ADJasperColorExecutor prepareForEngineType:roi:exifOrientation:rotationPreference:](self, "prepareForEngineType:roi:exifOrientation:rotationPreference:", a3, *(_QWORD *)&a5, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 useTemporalConsistency:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  uint8_t v15[16];

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "-[prepareForEngineType:roi:exifOrientation:useTemporalConsistency:] is deprecated. please use temporalConsistencyMethod property in the executor parameters instead", v15, 2u);
  }
  return -[ADJasperColorExecutor prepareForEngineType:roi:exifOrientation:useTemporalConsistency:rotationPreference:](self, "prepareForEngineType:roi:exifOrientation:useTemporalConsistency:rotationPreference:", a3, v7, v6, 0, x, y, width, height);
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 useTemporalConsistency:(BOOL)a6 rotationPreference:(unint64_t)a7
{
  _BOOL4 v7;
  uint64_t v8;
  double height;
  double width;
  double y;
  double x;
  uint64_t v15;
  uint8_t v17[16];

  v7 = a6;
  v8 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "-[prepareForEngineType:roi:exifOrientation:useTemporalConsistency:rotationPreference:] is deprecated. please use temporalConsistencyMethod property in the executor parameters instead", v17, 2u);
  }
  if (v7)
    v15 = 2;
  else
    v15 = 0;
  -[ADJasperColorExecutorParameters setTemporalConsistencyMethod:](self->_executorParameters, "setTemporalConsistencyMethod:", v15);
  return -[ADJasperColorExecutor prepareForEngineType:roi:exifOrientation:rotationPreference:](self, "prepareForEngineType:roi:exifOrientation:rotationPreference:", a3, v8, 0, x, y, width, height);
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 exifOrientation:(unsigned int)a5 rotationPreference:(unint64_t)a6
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  ADJasperColorExecutor *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  ADLKTExecutor *v19;
  ADLKTExecutor *lktExecutor;
  PixelBufferUtilsSession *colorProcessingSession;

  v7 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = self;
  objc_sync_enter(v13);
  kdebug_trace();
  -[ADJasperColorPipeline inferenceDescriptor](v13->_pipeline, "inferenceDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13->_opticalFlowEnabled = -[ADJasperColorExecutorParameters temporalConsistencyMethod](v13->_executorParameters, "temporalConsistencyMethod") == 2;
  objc_msgSend(v14, "colorInput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v13, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v16, v7, a6, v14, x, y, width, height);

  if (!v17)
  {
    v13->_firstTimeExecution = 1;
    v17 = -[ADJasperColorExecutor allocateIntermediateBuffers](v13, "allocateIntermediateBuffers");
    if (v13->_opticalFlowEnabled)
    {
      -[ADJasperColorPipeline LKTTexturesDescriptor](v13->_pipeline, "LKTTexturesDescriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[ADLKTExecutor initWithDescriptor:forLayout:]([ADLKTExecutor alloc], "initWithDescriptor:forLayout:", v18, v13->super._layout);
      lktExecutor = v13->_lktExecutor;
      v13->_lktExecutor = v19;

    }
    colorProcessingSession = v13->_colorProcessingSession;
    if (colorProcessingSession)
    {
      PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
      MEMORY[0x20BD36498]();
      v13->_colorProcessingSession = 0;
    }
  }

  kdebug_trace();
  objc_sync_exit(v13);

  return v17;
}

- (int64_t)executeWithColor:(__CVBuffer *)a3 pointCloud:(id)a4 outDepthMap:(__CVBuffer *)a5 outConfMap:(__CVBuffer *)a6
{
  return -[ADJasperColorExecutor executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:](self, "executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:", a3, a4, a5, a6, 0, 0, *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
}

- (uint64_t)executeWithColor:(uint64_t)a3 pointCloud:(uint64_t)a4 outDepthMap:(uint64_t)a5 outConfMap:(uint64_t)a6 worldToCameraTransform:(uint64_t)a7 cameraCalibration:
{
  return objc_msgSend(a1, "executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:", a3, a4, a5, a6, 0, a7);
}

- (int64_t)executeWithColor:(__CVBuffer *)a3 pointCloud:(id)a4 outDepthMap:(__CVBuffer *)a5 outConfMap:(__CVBuffer *)a6 outNormalsMap:(__CVBuffer *)a7
{
  return -[ADJasperColorExecutor executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:](self, "executeWithColor:pointCloud:outDepthMap:outConfMap:outNormalsMap:worldToCameraTransform:cameraCalibration:", a3, a4, a5, a6, a7, 0, *MEMORY[0x24BDAEE00], *(double *)(MEMORY[0x24BDAEE00] + 16), *(double *)(MEMORY[0x24BDAEE00] + 32), *(double *)(MEMORY[0x24BDAEE00] + 48));
}

- (uint64_t)executeWithColor:(double)a3 pointCloud:(double)a4 outDepthMap:(double)a5 outConfMap:(uint64_t)a6 outNormalsMap:(uint64_t)a7 worldToCameraTransform:(void *)a8 cameraCalibration:(uint64_t)a9
{
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v18 = a8;
  v19 = a12;
  if (v18)
  {
    v27[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v21 = objc_msgSend(a1, "executeWithColor:colorCameraCalibration:colorWorldToPlatformTransform:pointClouds:lidarCameraCalibration:pointCloudWorldToPlatformTransforms:outDepthMap:outConfMap:outNormalsMap:", a7, v19, v20, 0, 0, a9, a2, a3, a4, a5, a10, a11);
  if (v18)

  return v21;
}

- (uint64_t)executeWithColor:(float32x4_t)a3 colorCameraCalibration:(float32x4_t)a4 colorWorldToPlatformTransform:(float32x4_t)a5 pointClouds:(uint64_t)a6 lidarCameraCalibration:(__CVBuffer *)a7 pointCloudWorldToPlatformTransforms:(void *)a8 outDepthMap:(void *)a9 outConfMap:(void *)a10 outNormalsMap:(uint64_t)a11
{
  char *v18;
  size_t Width;
  size_t Height;
  void *v21;
  double v22;
  double v23;
  unsigned int i;
  void *v25;
  std::string *p_p;
  std::string::size_type size;
  std::string *v28;
  __int128 v29;
  uint8_t *v30;
  __int128 *v31;
  std::string *v32;
  std::string::size_type v33;
  std::string *v34;
  __int128 v35;
  uint8_t *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  int *v43;
  int *v44;
  uint64_t v45;
  int v46;
  double v47;
  double v48;
  __CVBuffer *v49;
  uint64_t v50;
  int v51;
  double v52;
  double v53;
  PixelBufferUtilsSession *v54;
  size_t v55;
  size_t v56;
  PixelBufferUtilsSession *PixelFormatType;
  size_t v58;
  size_t v59;
  OSType v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  BOOL v65;
  void *v66;
  NSObject *v67;
  const char *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  char *v73;
  void *v74;
  const char *v75;
  id v76;
  char v77;
  uint64_t v78;
  size_t v79;
  size_t v80;
  void *v81;
  const char *v82;
  NSObject *v83;
  const char *v84;
  id *v85;
  uint64_t v86;
  __CVBuffer *v87;
  void *v88;
  double v89;
  double v90;
  CGFloat v91;
  CGFloat v92;
  NSObject *v93;
  const char *v94;
  PixelBufferUtils *v95;
  unint64_t v96;
  float v97;
  __float2 v98;
  simd_float4 cosval_low;
  simd_float4 sinval_low;
  float32x4_t v101;
  float32x4_t v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  NSObject *v106;
  const char *v107;
  void *v108;
  OSType v109;
  uint64_t v110;
  PixelBufferUtils *v111;
  __CVBuffer *v112;
  __CVBuffer *RotatedPixelBuffer;
  uint64_t v114;
  __CVBuffer *v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  simd_float4 v120;
  PixelBufferUtils *v121;
  simd_float4 v122;
  id v129;
  id v130;
  char *v131;
  __int128 v132;
  PixelBufferUtils *v133;
  CVPixelBufferRef v134[2];
  __CVBuffer *v135;
  id obj[2];
  uint64_t obja;
  void *objb;
  __int128 v139;
  void *v140;
  void *v141;
  id v142;
  std::string __p;
  std::string v144;
  uint8_t buf[16];
  int64_t v146;
  int v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[3];
  simd_float4x4 v151;
  simd_float4x4 v152;
  CGSize v153;
  CGSize v154;
  CGSize v155;

  v150[1] = *MEMORY[0x24BDAC8D0];
  v129 = a8;
  v142 = a9;
  v130 = a10;
  v18 = a1;
  objc_sync_enter(v18);
  v147 = 335684428;
  v148 = 0u;
  v149 = 0u;
  v131 = v18;
  kdebug_trace();
  if (!*((_QWORD *)v18 + 8))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must call prepare before execution", buf, 2u);
    }
    v40 = -22960;
    goto LABEL_108;
  }
  if (!a12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide a pointer to CVPixelBufferRef", buf, 2u);
    }
    v40 = -22953;
    goto LABEL_108;
  }
  if (CGRectIsEmpty(*(CGRect *)(v18 + 8)))
  {
    Width = CVPixelBufferGetWidth(a7);
    Height = CVPixelBufferGetHeight(a7);
    *((_QWORD *)v18 + 1) = 0;
    *((_QWORD *)v18 + 2) = 0;
    *((double *)v18 + 3) = (double)Width;
    *((double *)v18 + 4) = (double)Height;
  }
  objc_msgSend(*((id *)v18 + 47), "logger");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "systemUptime");
  v23 = v22;

  objc_msgSend(v141, "logPixelBuffer:name:timestamp:", a7, "inputColor", v23);
  for (i = 0; objc_msgSend(v142, "count") > (unint64_t)i; ++i)
  {
    objc_msgSend(v142, "objectAtIndexedSubscript:", i);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)&v144.__r_.__value_.__s + 23) = 15;
    strcpy((char *)&v144, "inputPointCloud");
    std::to_string(&__p, i);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    v28 = std::string::append(&v144, (const std::string::value_type *)p_p, size);
    v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
    v146 = v28->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v29;
    v28->__r_.__value_.__l.__size_ = 0;
    v28->__r_.__value_.__r.__words[2] = 0;
    v28->__r_.__value_.__r.__words[0] = 0;
    if (v146 >= 0)
      v30 = buf;
    else
      v30 = *(uint8_t **)buf;
    objc_msgSend(v141, "logPointCloud:name:timestamp:", v25, v30, v23);
    if (SHIBYTE(v146) < 0)
    {
      operator delete(*(void **)buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
LABEL_35:
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v144.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_21;
        goto LABEL_36;
      }
    }
    else if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      goto LABEL_35;
    }
    if ((SHIBYTE(v144.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_21;
LABEL_36:
    operator delete(v144.__r_.__value_.__l.__data_);
LABEL_21:

    if (!a11)
      goto LABEL_7;
    v31 = (__int128 *)(a11 + ((unint64_t)i << 6));
    *(_OWORD *)obj = v31[1];
    v139 = *v31;
    v132 = v31[3];
    *(_OWORD *)v134 = v31[2];
    *((_BYTE *)&v144.__r_.__value_.__s + 23) = 19;
    strcpy((char *)&v144, "inputPointCloudPose");
    std::to_string(&__p, i);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v32 = &__p;
    else
      v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v33 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v33 = __p.__r_.__value_.__l.__size_;
    v34 = std::string::append(&v144, (const std::string::value_type *)v32, v33);
    v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    v146 = v34->__r_.__value_.__r.__words[2];
    *(_OWORD *)buf = v35;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    if (v146 >= 0)
      v36 = buf;
    else
      v36 = *(uint8_t **)buf;
    objc_msgSend(v141, "logMatrix4x4:name:timestamp:", v36, *(double *)&v139, *(double *)obj, *(double *)v134, *(double *)&v132, v23);
    if (SHIBYTE(v146) < 0)
    {
      operator delete(*(void **)buf);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_38:
        if ((SHIBYTE(v144.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_7;
        goto LABEL_39;
      }
    }
    else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_38;
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v144.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_7;
LABEL_39:
    operator delete(v144.__r_.__value_.__l.__data_);
LABEL_7:
    v18 = v131;
  }
  if (!v142)
  {
    v39 = 0;
    goto LABEL_54;
  }
  if (v130)
  {
    if (v129 && a11)
    {
      objc_msgSend(v141, "logCalibration:name:timestamp:", v130, "inputPointCloudCalibration", v23);
      objc_msgSend(v141, "logCalibration:name:timestamp:", v129, "inputColorCalibration", v23);
      objc_msgSend(v141, "logMatrix4x4:name:timestamp:", "inputColorPose", *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64, v23);
      v37 = (void *)MEMORY[0x24BE06010];
      v150[0] = v130;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v150, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "aggregatePointClouds:calibrations:worldToPlatformTransforms:projectingToCamera:worldToPlatformAtProjectionTime:", v142, v38, a11, v129, *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, *(double *)a5.i64);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v131;
      goto LABEL_54;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v69 = MEMORY[0x24BDACB70];
      v70 = "cannot aggregate and project point clouds without color calibration and world transform data";
      goto LABEL_100;
    }
    goto LABEL_87;
  }
  if (objc_msgSend(v142, "count") != 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v69 = MEMORY[0x24BDACB70];
      v70 = "cannot execute on multiple point clouds without aggregation information";
LABEL_100:
      _os_log_error_impl(&dword_20B62B000, v69, OS_LOG_TYPE_ERROR, v70, buf, 2u);
    }
LABEL_87:
    v40 = -22953;
    goto LABEL_107;
  }
  objc_msgSend(v142, "objectAtIndexedSubscript:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:
  objc_msgSend(v141, "logPointCloud:name:timestamp:", v39, "aggregatedPointCloud", v23);
  v41 = objc_msgSend(*((id *)v18 + 47), "temporalConsistencyMethod");
  if (!v41)
  {
    obja = 0;
    v42 = &OBJC_IVAR___ADJasperColorExecutor__itmPostProcessedDepth;
    v43 = &OBJC_IVAR___ADJasperColorExecutor__itmPostProcessedConf;
    v44 = &OBJC_IVAR___ADJasperColorExecutor__itmPostProcessedNormals;
LABEL_58:
    v135 = *(__CVBuffer **)&v18[*v42];
    v121 = *(PixelBufferUtils **)&v18[*v43];
    v133 = *(PixelBufferUtils **)&v18[*v44];
    v45 = *((_QWORD *)v18 + 18);
    if (v45)
    {
      if (a7)
      {
        v46 = *(_DWORD *)(v45 + 40);
        v48 = *(double *)(v45 + 24);
        v47 = *(double *)(v45 + 32);
        if (v48 == (double)CVPixelBufferGetWidth(a7)
          && v47 == (double)CVPixelBufferGetHeight(a7)
          && CVPixelBufferGetPixelFormatType(a7) == v46)
        {
          v49 = (__CVBuffer *)*((_QWORD *)v131 + 17);
          if (v49)
          {
            v50 = *((_QWORD *)v131 + 18);
            v51 = *(_DWORD *)(v50 + 64);
            v53 = *(double *)(v50 + 48);
            v52 = *(double *)(v50 + 56);
            if (v53 == (double)CVPixelBufferGetWidth(*((CVPixelBufferRef *)v131 + 17))
              && v52 == (double)CVPixelBufferGetHeight(v49)
              && CVPixelBufferGetPixelFormatType(v49) == v51)
            {
LABEL_70:
              v61 = objc_msgSend(v131, "numberOfExecutionSteps");
              v62 = objc_msgSend(*((id *)v131 + 47), "stepsToSkip");
              v63 = objc_msgSend(*((id *)v131 + 47), "powerMeasureMode");
              objc_msgSend(*((id *)v131 + 47), "timeProfiler");
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v61 - v62;
              if (v63)
              {
                v65 = v64-- < 1;
                if (v65)
                  goto LABEL_98;
              }
              kdebug_trace();
              objc_msgSend(v140, "startWithUTFString:", "preprocess color");
              objc_msgSend(v131, "frameExecutionStart");
              if ((PixelBufferUtilsSession::run(*((PixelBufferUtilsSession **)v131 + 18), a7, *((__CVBuffer **)v131 + 17)) & 1) == 0)
              {
                v66 = v39;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed scaling color image", buf, 2u);
                }
                v40 = -22950;
                goto LABEL_106;
              }
              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 17), "processedColor", v23);
              objc_msgSend(v140, "stopWithUTFString:", "preprocess color");
              kdebug_trace();
              if (v63)
              {
                v65 = v64-- < 1;
                if (v65)
                  goto LABEL_98;
              }
              kdebug_trace();
              objc_msgSend(v140, "startWithUTFString:", "preprocess jasper");
              v40 = objc_msgSend(*((id *)v131 + 15), "projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:", v39, *((_QWORD *)v131 + 10), *((_QWORD *)v131 + 19), *((double *)v131 + 1), *((double *)v131 + 2), *((double *)v131 + 3), *((double *)v131 + 4));
              if (v40)
              {
                v66 = v39;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v67 = MEMORY[0x24BDACB70];
                  v68 = "failed projecting jasper points";
LABEL_105:
                  _os_log_error_impl(&dword_20B62B000, v67, OS_LOG_TYPE_ERROR, v68, buf, 2u);
                  goto LABEL_106;
                }
                goto LABEL_106;
              }
              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 19), "processedJasper", v23);
              objc_msgSend(v140, "stopWithUTFString:", "preprocess jasper");
              kdebug_trace();
              if (v63)
              {
                v65 = v64-- < 1;
                if (v65)
                  goto LABEL_98;
              }
              kdebug_trace();
              objc_msgSend(v140, "startWithUTFString:", "network execution");
              v40 = objc_msgSend(*((id *)v131 + 8), "execute");
              if (v40)
              {
                v66 = v39;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v67 = MEMORY[0x24BDACB70];
                  v68 = "failed executing espresso plan";
                  goto LABEL_105;
                }
LABEL_106:

                goto LABEL_107;
              }
              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 20), "depthOutRaw", v23);
              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 22), "confidenceOutRaw", v23);
              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 24), "normalsOutRaw", v23);
              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 26), "alphaMapOutRaw", v23);
              objc_msgSend(v140, "stopWithUTFString:", "network execution");
              kdebug_trace();
              if (v63)
              {
                v65 = v64-- < 1;
                if (v65)
                {
LABEL_98:
                  v66 = v39;
                  v40 = 0;
                  goto LABEL_106;
                }
              }
              kdebug_trace();
              objc_msgSend(v140, "startWithUTFString:", "postprocess depth");
              v71 = *((_QWORD *)v131 + 10);
              if (v71 == 3)
              {
                v71 = 1;
              }
              else if (v71 == 1)
              {
                v71 = 3;
              }
              v40 = objc_msgSend(*((id *)v131 + 15), "postProcessWithDepth:confidence:normals:depthOutput:confidenceOutput:normalsOutput:normalsRequiredRotation:", *((_QWORD *)v131 + 20), *((_QWORD *)v131 + 22), *((_QWORD *)v131 + 24), *((_QWORD *)v131 + 21), *((_QWORD *)v131 + 23), *((_QWORD *)v131 + 25), v71);
              if (v40)
              {
                v66 = v39;
                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v67 = MEMORY[0x24BDACB70];
                  v68 = "failed postprocessing depth";
                  goto LABEL_105;
                }
                goto LABEL_106;
              }
              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 21), "depthOutProcessed", v23);
              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 23), "confidenceOutProcessed", v23);
              if (!obja)
              {
                objb = 0;
                v75 = "postprocess depth";
                v76 = v131;
                goto LABEL_116;
              }
              v73 = v131;
              if (objc_msgSend(*((id *)v131 + 47), "temporalConsistencyMethod") == 2)
              {
                v40 = objc_msgSend(*((id *)v131 + 16), "executeWithFrame:intoOpticalFlowBuffer:", *((_QWORD *)v131 + 17), *((_QWORD *)v131 + 29));
                if (v40)
                {
                  v66 = v39;
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed running lktExecutor", buf, 2u);
                  }
                  v74 = 0;
                  goto LABEL_204;
                }
                objb = 0;
                objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 29), "opticalFlow", v23);
              }
              else
              {
                if (objc_msgSend(*((id *)v131 + 47), "temporalConsistencyMethod") == 1)
                {
                  objc_msgSend(v140, "stopWithUTFString:", "postprocess depth");
                  kdebug_trace();
                  if (v63)
                  {
                    v65 = v64-- < 1;
                    if (v65)
                    {
                      v66 = v39;
                      v74 = 0;
LABEL_203:
                      v40 = 0;
                      goto LABEL_204;
                    }
                  }
                  kdebug_trace();
                  objc_msgSend(v140, "startWithUTFString:", "preprocess calibration");
                  if (!*((_QWORD *)v131 + 46))
                    v131[288] = 1;
                  v79 = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v131 + 27));
                  v80 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v131 + 27));
                  v81 = (void *)objc_msgSend(v129, "mutableCopy");
                  objc_msgSend(v81, "crop:", *((double *)v131 + 1), *((double *)v131 + 2), *((double *)v131 + 3), *((double *)v131 + 4));
                  objb = v81;
                  if ((objc_msgSend(v81, "adjustForImageRotation:", *((_QWORD *)v131 + 10)) & 1) != 0)
                  {
                    if ((objc_msgSend(v81, "scale:", (double)v79, (double)v80) & 1) != 0)
                    {
                      objc_msgSend(v141, "logCalibration:name:timestamp:", v23);
                      v82 = "preprocess calibration";
LABEL_134:
                      objc_msgSend(v140, "stopWithUTFString:", v82);
                      kdebug_trace();
                      if (v63)
                      {
                        v65 = v64-- < 1;
                        if (v65)
                          goto LABEL_144;
                      }
                      kdebug_trace();
                      objc_msgSend(v140, "startWithUTFString:", "postprocess warp n fuse");
                      if (v131[288])
                      {
                        if (!PixelBufferUtils::copyPixelBuffer(*((PixelBufferUtils **)v131 + 31), *((CVPixelBufferRef *)v131 + 21), 0))
                        {
                          if (*((_QWORD *)v131 + 34))
                          {
                            v95 = (PixelBufferUtils *)*((_QWORD *)v131 + 35);
                            if (v95)
                              PixelBufferUtils::copyPixelBuffer(v95, *((CVPixelBufferRef *)v131 + 25), 0);
                          }
                        }
                        v131[288] = 0;
                        goto LABEL_139;
                      }
                      if (objc_msgSend(*((id *)v131 + 47), "useAlphaMapForTemporalConsistency"))
                      {
                        v85 = (id *)v131;
                        v86 = *((_QWORD *)v131 + 26);
                      }
                      else
                      {
                        v86 = 0;
                        v85 = (id *)v131;
                      }
                      if (objc_msgSend(v85[47], "temporalConsistencyMethod") == 1)
                      {
                        v66 = v39;
                        v96 = *((_QWORD *)v131 + 10) - 1;
                        v97 = 0.0;
                        if (v96 <= 2)
                          v97 = flt_20B6D2C4C[v96];
                        v98 = __sincosf_stret(v97);
                        cosval_low = (simd_float4)LODWORD(v98.__cosval);
                        cosval_low.f32[1] = -v98.__sinval;
                        v120 = cosval_low;
                        sinval_low = (simd_float4)LODWORD(v98.__sinval);
                        sinval_low.i32[1] = LODWORD(v98.__cosval);
                        v122 = sinval_low;
                        v151 = __invert_f4(*(simd_float4x4 *)(v131 + 304));
                        v118 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v151.columns[1].f32[0]), a3, *(float32x2_t *)v151.columns[1].f32, 1), a4, (float32x4_t)v151.columns[1], 2), a5, (float32x4_t)v151.columns[1], 3);
                        v119 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v151.columns[0].f32[0]), a3, *(float32x2_t *)v151.columns[0].f32, 1), a4, (float32x4_t)v151.columns[0], 2), a5, (float32x4_t)v151.columns[0], 3);
                        v117 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v151.columns[2].f32[0]), a3, *(float32x2_t *)v151.columns[2].f32, 1), a4, (float32x4_t)v151.columns[2], 2), a5, (float32x4_t)v151.columns[2], 3);
                        v116 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, v151.columns[3].f32[0]), a3, *(float32x2_t *)v151.columns[3].f32, 1), a4, (float32x4_t)v151.columns[3], 2), a5, (float32x4_t)v151.columns[3], 3);
                        v151.columns[2] = (simd_float4)xmmword_20B6D29D0;
                        v151.columns[3] = (simd_float4)xmmword_20B6D2A30;
                        v151.columns[0] = v120;
                        v151.columns[1] = v122;
                        v152 = __invert_f4(v151);
                        v101 = vmlaq_f32(vmlaq_f32(vmlaq_lane_f32(vmulq_n_f32(v119, v98.__cosval), v118, *(float32x2_t *)v120.f32, 1), (float32x4_t)0, v117), (float32x4_t)0, v116);
                        v102 = vmlaq_f32(vmlaq_f32(vmlaq_lane_f32(vmulq_n_f32(v119, v98.__sinval), v118, *(float32x2_t *)v122.f32, 1), (float32x4_t)0, v117), (float32x4_t)0, v116);
                        v103 = vmlaq_f32(vmulq_f32(v119, (float32x4_t)0), (float32x4_t)0, v118);
                        v104 = vmlaq_f32(vaddq_f32(v117, v103), (float32x4_t)0, v116);
                        v105 = vaddq_f32(v116, vmlaq_f32(v103, (float32x4_t)0, v117));
                        v40 = objc_msgSend(*((id *)v131 + 15), "warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingPoseDelta:previousCalibration:currentCalibration:", *((_QWORD *)v131 + 30), *((_QWORD *)v131 + 27), *((_QWORD *)v131 + 32), *((_QWORD *)v131 + 28), 0, 0, *(double *)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v152.columns[0], v101.f32[0]), (float32x4_t)v152.columns[1], *(float32x2_t *)v101.f32, 1), (float32x4_t)v152.columns[2], v101, 2),
                                             (float32x4_t)v152.columns[3],
                                             v101,
                                             3).i64,
                                *(double *)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v152.columns[0], v102.f32[0]), (float32x4_t)v152.columns[1], *(float32x2_t *)v102.f32, 1), (float32x4_t)v152.columns[2], v102, 2), (float32x4_t)v152.columns[3], v102, 3).i64, *(double *)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v152.columns[0], v104.f32[0]), (float32x4_t)v152.columns[1], *(float32x2_t *)v104.f32, 1),
                                               (float32x4_t)v152.columns[2],
                                               v104,
                                               2),
                                             (float32x4_t)v152.columns[3],
                                             v104,
                                             3).i64,
                                *(double *)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v152.columns[0], v105.f32[0]), (float32x4_t)v152.columns[1], *(float32x2_t *)v105.f32, 1), (float32x4_t)v152.columns[2], v105, 2), (float32x4_t)v152.columns[3], v105, 3).i64, *((_QWORD *)v131 + 46), objb);
LABEL_166:
                        if (v40)
                        {
                          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          {
                            *(_WORD *)buf = 0;
                            v106 = MEMORY[0x24BDACB70];
                            v107 = "failed warping depth";
LABEL_210:
                            _os_log_error_impl(&dword_20B62B000, v106, OS_LOG_TYPE_ERROR, v107, buf, 2u);
                            v74 = objb;
                            goto LABEL_204;
                          }
                        }
                        else
                        {
                          v39 = v66;
                          objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 27), "prevWarpedDepth", v23);
                          objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *((_QWORD *)v131 + 28), "prevWarpedConf", v23);
                          v40 = objc_msgSend(*((id *)v131 + 15), "fuseCurrentDepth:previousDepth:intoOutputDepth:currentConfidence:previousConfidence:intoOutputConfidence:currentNormals:previousNormals:intoOutputNormals:usingAlpha:", *((_QWORD *)v131 + 21), *((_QWORD *)v131 + 27), *((_QWORD *)v131 + 31), *((_QWORD *)v131 + 23), *((_QWORD *)v131 + 28), *((_QWORD *)v131 + 33), 0, 0, 0, v86);
                          if (!v40)
                          {
                            v73 = v131;
LABEL_139:
                            objc_msgSend(v140, "stopWithUTFString:", "postprocess warp n fuse");
                            kdebug_trace();
                            if (v63)
                            {
                              v65 = v64-- < 1;
                              if (v65)
                                goto LABEL_144;
                            }
                            kdebug_trace();
                            objc_msgSend(v140, "startWithUTFString:", "postprocess previous depth");
                            if (PixelBufferUtils::copyPixelBuffer(*((PixelBufferUtils **)v73 + 30), *((CVPixelBufferRef *)v73 + 31), 0))
                            {
                              v66 = v39;
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                              {
                                *(_WORD *)buf = 0;
                                v83 = MEMORY[0x24BDACB70];
                                v84 = "failed storing previous depth";
LABEL_208:
                                _os_log_error_impl(&dword_20B62B000, v83, OS_LOG_TYPE_ERROR, v84, buf, 2u);
                                goto LABEL_158;
                              }
                              goto LABEL_158;
                            }
                            v66 = v39;
                            if (PixelBufferUtils::copyPixelBuffer(*((PixelBufferUtils **)v73 + 32), *((CVPixelBufferRef *)v73 + 33), 0))
                            {
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                              {
                                *(_WORD *)buf = 0;
                                v83 = MEMORY[0x24BDACB70];
                                v84 = "failed storing previous confidence";
                                goto LABEL_208;
                              }
                              goto LABEL_158;
                            }
                            v111 = (PixelBufferUtils *)*((_QWORD *)v73 + 34);
                            if (v111)
                            {
                              v112 = (__CVBuffer *)*((_QWORD *)v73 + 35);
                              if (v112)
                              {
                                if (PixelBufferUtils::copyPixelBuffer(v111, v112, 0))
                                {
                                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)buf = 0;
                                    v83 = MEMORY[0x24BDACB70];
                                    v84 = "failed storing previous normals";
                                    goto LABEL_208;
                                  }
LABEL_158:
                                  v40 = -22950;
                                  v74 = objb;
                                  goto LABEL_204;
                                }
                              }
                            }
                            *((float32x4_t *)v73 + 19) = a2;
                            *((float32x4_t *)v73 + 20) = a3;
                            *((float32x4_t *)v73 + 21) = a4;
                            *((float32x4_t *)v73 + 22) = a5;
                            objc_storeStrong((id *)v73 + 46, objb);
                            v75 = "postprocess previous depth";
                            v76 = v131;
LABEL_116:
                            objc_msgSend(v140, "stopWithUTFString:", v75);
                            kdebug_trace();
                            if (v64 < 1)
                              v77 = v63;
                            else
                              v77 = 0;
                            if ((v77 & 1) == 0)
                            {
                              kdebug_trace();
                              objc_msgSend(v140, "startWithUTFString:", "output rotation");
                              v78 = *((_QWORD *)v76 + 10);
                              if (v78 == 3)
                              {
                                v78 = 1;
                                v74 = objb;
                              }
                              else
                              {
                                v74 = objb;
                                if (v78 == 1)
                                  v78 = 3;
                              }
                              v66 = v39;
                              v87 = *a12;
                              if (!*a12)
                              {
                                objc_msgSend(*((id *)v76 + 15), "processedDepthOutputDescriptor");
                                v88 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v88, "sizeForLayout:", *((_QWORD *)v76 + 5));
                                v91 = v89;
                                if ((v78 | 2) == 3)
                                {
                                  v92 = v90;
                                }
                                else
                                {
                                  v92 = v89;
                                  v91 = v90;
                                }

                                objc_msgSend(*((id *)v131 + 15), "processedDepthOutputDescriptor");
                                v108 = (void *)objc_claimAutoreleasedReturnValue();
                                v109 = objc_msgSend(v108, "pixelFormat");
                                v154.width = v92;
                                v154.height = v91;
                                *a12 = PixelBufferUtils::createPixelBuffer(v109, v154, 1);

                                v87 = *a12;
                                v76 = v131;
                              }
                              if (PixelBufferUtils::rotatePixelBuffer(v135, v87, (__CVBuffer *)v78, 0))
                              {
                                if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed rotating depth. please verify output buffer dimensions", buf, 2u);
                                }
                                v40 = -22950;
                                goto LABEL_204;
                              }
                              objc_msgSend(v76, "convertIntrinsicsFrom:cropBy:to:", a7, *a12, *((double *)v76 + 1), *((double *)v76 + 2), *((double *)v76 + 3), *((double *)v76 + 4));
                              objc_msgSend(v141, "logPixelBuffer:name:timestamp:", *a12, "depthOutProcessedRotated", v23);
                              if (a13)
                              {
                                v110 = *((_QWORD *)v76 + 10);
                                if (v110 == 3)
                                {
                                  v110 = 1;
                                }
                                else if (v110 == 1)
                                {
                                  v110 = 3;
                                }
                                v76 = v131;
                                v74 = objb;
                                RotatedPixelBuffer = PixelBufferUtils::createRotatedPixelBuffer(v121, (__CVBuffer *)v110, 0);
                                *a13 = RotatedPixelBuffer;
                                objc_msgSend(v141, "logPixelBuffer:name:timestamp:", RotatedPixelBuffer, "confidenceOutProcessedRotated", v23);
                              }
                              if (a14)
                              {
                                v114 = *((_QWORD *)v76 + 10);
                                if (v114 == 3)
                                {
                                  v114 = 1;
                                }
                                else if (v114 == 1)
                                {
                                  v114 = 3;
                                }
                                v76 = v131;
                                v74 = objb;
                                v115 = PixelBufferUtils::createRotatedPixelBuffer(v133, (__CVBuffer *)v114, 0);
                                *a14 = v115;
                                objc_msgSend(v141, "logPixelBuffer:name:timestamp:", v115, "normalsOutProcessedRotated", v23);
                              }
                              objc_msgSend(v140, "stopWithUTFString:", "output rotation");
                              kdebug_trace();
                              objc_msgSend(v76, "frameExecutionEnd");
                              goto LABEL_203;
                            }
LABEL_144:
                            v66 = v39;
                            v40 = 0;
                            v74 = objb;
LABEL_204:

                            goto LABEL_106;
                          }
                          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          {
                            *(_WORD *)buf = 0;
                            v106 = MEMORY[0x24BDACB70];
                            v107 = "failed fusing depth";
                            goto LABEL_210;
                          }
                        }
                        v74 = objb;
                        goto LABEL_204;
                      }
                      if (objc_msgSend(*((id *)v131 + 47), "temporalConsistencyMethod") == 2)
                      {
                        v40 = objc_msgSend(*((id *)v131 + 15), "warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingOpticalFlow:", *((_QWORD *)v131 + 30), *((_QWORD *)v131 + 27), *((_QWORD *)v131 + 32), *((_QWORD *)v131 + 28), 0, 0, *((_QWORD *)v131 + 29));
                        v66 = v39;
                        goto LABEL_166;
                      }
                      v66 = v39;
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)buf = 0;
                        v93 = MEMORY[0x24BDACB70];
                        v94 = "unknown temporal consistency method";
                        goto LABEL_187;
                      }
LABEL_188:
                      v40 = -22951;
                      v74 = objb;
                      goto LABEL_204;
                    }
                    v66 = v39;
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      goto LABEL_188;
                    *(_WORD *)buf = 0;
                    v93 = MEMORY[0x24BDACB70];
                    v94 = "failed scaling calibration";
                  }
                  else
                  {
                    v66 = v39;
                    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      goto LABEL_188;
                    *(_WORD *)buf = 0;
                    v93 = MEMORY[0x24BDACB70];
                    v94 = "failed rotating calibration";
                  }
LABEL_187:
                  _os_log_error_impl(&dword_20B62B000, v93, OS_LOG_TYPE_ERROR, v94, buf, 2u);
                  goto LABEL_188;
                }
                objb = 0;
              }
              v82 = "postprocess depth";
              goto LABEL_134;
            }
          }
        }
      }
      v54 = (PixelBufferUtilsSession *)*((_QWORD *)v131 + 18);
      if (v54)
      {
        PixelBufferUtilsSession::~PixelBufferUtilsSession(v54);
        MEMORY[0x20BD36498]();
      }
    }
    v55 = CVPixelBufferGetWidth(a7);
    v56 = CVPixelBufferGetHeight(a7);
    PixelFormatType = (PixelBufferUtilsSession *)CVPixelBufferGetPixelFormatType(a7);
    v58 = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v131 + 17));
    v59 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v131 + 17));
    v60 = CVPixelBufferGetPixelFormatType(*((CVPixelBufferRef *)v131 + 17));
    v153.width = (double)v55;
    v153.height = (double)v56;
    v155.height = (double)v59;
    v155.width = (double)v58;
    *((_QWORD *)v131 + 18) = PixelBufferUtilsSession::createCropScaleConvertRotateSession(PixelFormatType, v153, v155, *(CGRect *)(v131 + 8), v60, *((_DWORD *)v131 + 20));
    goto LABEL_70;
  }
  if (v18[289])
  {
    obja = v41;
    v42 = &OBJC_IVAR___ADJasperColorExecutor__itmCurrProcessedFusedDepth;
    v43 = &OBJC_IVAR___ADJasperColorExecutor__itmCurrProcessedFusedConf;
    v44 = &OBJC_IVAR___ADJasperColorExecutor__itmCurrProcessedFusedNormals;
    goto LABEL_58;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot re-enable temporal consistency after executor was prepare without it.", buf, 2u);
  }

  v40 = -22951;
LABEL_107:

  v18 = v131;
LABEL_108:
  kdebug_trace();
  objc_sync_exit(v18);

  return v40;
}

- (void)dealloc
{
  PixelBufferUtilsSession *colorProcessingSession;
  objc_super v4;

  CVPixelBufferRelease(self->_itmPreProcessedColor);
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  CVPixelBufferRelease(self->_itmPostProcessedDepth);
  CVPixelBufferRelease(self->_itmUnprocessedConf);
  CVPixelBufferRelease(self->_itmPostProcessedConf);
  CVPixelBufferRelease(self->_itmUnprocessedNormals);
  CVPixelBufferRelease(self->_itmPostProcessedNormals);
  CVPixelBufferRelease(self->_itmUnprocessedAlpha);
  CVPixelBufferRelease(self->_itmOpticalFlow);
  CVPixelBufferRelease(self->_itmPrevProcessedFusedDepth);
  CVPixelBufferRelease(self->_itmPrevProcessedFusedConf);
  CVPixelBufferRelease(self->_itmCurrProcessedFusedConf);
  CVPixelBufferRelease(self->_itmWarpedPrevDepth);
  CVPixelBufferRelease(self->_itmWarpedPrevConf);
  CVPixelBufferRelease(self->_itmCurrProcessedFusedDepth);
  CVPixelBufferRelease(self->_itmPrevProcessedFusedNormals);
  CVPixelBufferRelease(self->_itmCurrProcessedFusedNormals);
  colorProcessingSession = self->_colorProcessingSession;
  if (colorProcessingSession)
  {
    PixelBufferUtilsSession::~PixelBufferUtilsSession(colorProcessingSession);
    MEMORY[0x20BD36498]();
  }
  v4.receiver = self;
  v4.super_class = (Class)ADJasperColorExecutor;
  -[ADExecutor dealloc](&v4, sel_dealloc);
}

- (id)getIntermediates
{
  unint64_t v3;
  void *v4;
  __CVBuffer *itmPreProcessedColor;
  void *v6;
  __CVBuffer *itmPreProcessedJasper;
  void *v8;
  __CVBuffer *itmUnprocessedDepth;
  void *v10;
  __CVBuffer *itmPostProcessedDepth;
  void *v12;
  __CVBuffer *itmUnprocessedConf;
  void *v14;
  __CVBuffer *itmPostProcessedConf;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  __CVBuffer *itmUnprocessedNormals;
  void *v21;
  __CVBuffer *itmPostProcessedNormals;
  void *v23;
  __CVBuffer *itmUnprocessedAlpha;
  void *v25;
  __CVBuffer *itmOpticalFlow;
  void *v27;
  __CVBuffer *itmPrevProcessedFusedDepth;
  void *v29;
  __CVBuffer *itmCurrProcessedFusedDepth;
  void *v31;
  __CVBuffer *itmPrevProcessedFusedConf;
  void *v33;
  __CVBuffer *itmCurrProcessedFusedConf;
  void *v35;
  __CVBuffer *itmWarpedPrevDepth;
  void *v37;
  __CVBuffer *itmWarpedPrevConf;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  __CVBuffer *itmPrevProcessedFusedNormals;
  void *v44;
  __CVBuffer *itmCurrProcessedFusedNormals;
  void *v46;
  uint8_t v48[8];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[3];

  v84[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[ADJasperColorExecutorParameters temporalConsistencyMethod](self->_executorParameters, "temporalConsistencyMethod");
  if (v3 && !self->_opticalFlowEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v48 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "cannot re-enable temporal consistency after executor was prepare without it.", v48, 2u);
    }
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_opt_new();
    itmPreProcessedColor = self->_itmPreProcessedColor;
    if (itmPreProcessedColor)
    {
      v83[0] = CFSTR("name");
      v83[1] = CFSTR("image");
      v84[0] = CFSTR("PreProcessed Color");
      v84[1] = itmPreProcessedColor;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
    itmPreProcessedJasper = self->_itmPreProcessedJasper;
    if (itmPreProcessedJasper)
    {
      v81[0] = CFSTR("name");
      v81[1] = CFSTR("image");
      v82[0] = CFSTR("PreProcessed Jasper");
      v82[1] = itmPreProcessedJasper;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    itmUnprocessedDepth = self->_itmUnprocessedDepth;
    if (itmUnprocessedDepth)
    {
      v79[0] = CFSTR("name");
      v79[1] = CFSTR("image");
      v80[0] = CFSTR("Unprocessed Depth");
      v80[1] = itmUnprocessedDepth;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
    itmPostProcessedDepth = self->_itmPostProcessedDepth;
    if (itmPostProcessedDepth)
    {
      v77[0] = CFSTR("name");
      v77[1] = CFSTR("image");
      v78[0] = CFSTR("PostProcessed Depth");
      v78[1] = itmPostProcessedDepth;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v12);

    }
    itmUnprocessedConf = self->_itmUnprocessedConf;
    if (itmUnprocessedConf)
    {
      v75[0] = CFSTR("name");
      v75[1] = CFSTR("image");
      v76[0] = CFSTR("Unprocessed Conf");
      v76[1] = itmUnprocessedConf;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

    }
    itmPostProcessedConf = self->_itmPostProcessedConf;
    if (itmPostProcessedConf)
    {
      v73[0] = CFSTR("name");
      v73[1] = CFSTR("image");
      v74[0] = CFSTR("PostProcessed Conf");
      v74[1] = itmPostProcessedConf;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

    }
    -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "normalsOutput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (!v19)
    {
      itmUnprocessedNormals = self->_itmUnprocessedNormals;
      if (itmUnprocessedNormals)
      {
        v71[0] = CFSTR("name");
        v71[1] = CFSTR("image");
        v72[0] = CFSTR("Unprocessed Normals");
        v72[1] = itmUnprocessedNormals;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v21);

      }
      itmPostProcessedNormals = self->_itmPostProcessedNormals;
      if (itmPostProcessedNormals)
      {
        v69[0] = CFSTR("name");
        v69[1] = CFSTR("image");
        v70[0] = CFSTR("PostProcessed Normals");
        v70[1] = itmPostProcessedNormals;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v23);

      }
    }
    if (v3)
    {
      itmUnprocessedAlpha = self->_itmUnprocessedAlpha;
      if (itmUnprocessedAlpha)
      {
        v67[0] = CFSTR("name");
        v67[1] = CFSTR("image");
        v68[0] = CFSTR("Unprocessed Alpha");
        v68[1] = itmUnprocessedAlpha;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v25);

      }
      itmOpticalFlow = self->_itmOpticalFlow;
      if (itmOpticalFlow)
      {
        v65[0] = CFSTR("name");
        v65[1] = CFSTR("image");
        v66[0] = CFSTR("Optical Flow");
        v66[1] = itmOpticalFlow;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v27);

      }
      itmPrevProcessedFusedDepth = self->_itmPrevProcessedFusedDepth;
      if (itmPrevProcessedFusedDepth)
      {
        v63[0] = CFSTR("name");
        v63[1] = CFSTR("image");
        v64[0] = CFSTR("Prev Processed Fused Depth");
        v64[1] = itmPrevProcessedFusedDepth;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v29);

      }
      itmCurrProcessedFusedDepth = self->_itmCurrProcessedFusedDepth;
      if (itmCurrProcessedFusedDepth)
      {
        v61[0] = CFSTR("name");
        v61[1] = CFSTR("image");
        v62[0] = CFSTR("Curr Processed Fused Depth");
        v62[1] = itmCurrProcessedFusedDepth;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v31);

      }
      itmPrevProcessedFusedConf = self->_itmPrevProcessedFusedConf;
      if (itmPrevProcessedFusedConf)
      {
        v59[0] = CFSTR("name");
        v59[1] = CFSTR("image");
        v60[0] = CFSTR("Prev Processed Fused conf");
        v60[1] = itmPrevProcessedFusedConf;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v33);

      }
      itmCurrProcessedFusedConf = self->_itmCurrProcessedFusedConf;
      if (itmCurrProcessedFusedConf)
      {
        v57[0] = CFSTR("name");
        v57[1] = CFSTR("image");
        v58[0] = CFSTR("Curr Processed Fused conf");
        v58[1] = itmCurrProcessedFusedConf;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v35);

      }
      itmWarpedPrevDepth = self->_itmWarpedPrevDepth;
      if (itmWarpedPrevDepth)
      {
        v55[0] = CFSTR("name");
        v55[1] = CFSTR("image");
        v56[0] = CFSTR("Prev Processed warped Depth");
        v56[1] = itmWarpedPrevDepth;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v37);

      }
      itmWarpedPrevConf = self->_itmWarpedPrevConf;
      if (itmWarpedPrevConf)
      {
        v53[0] = CFSTR("name");
        v53[1] = CFSTR("image");
        v54[0] = CFSTR("Prev Processed warped conf");
        v54[1] = itmWarpedPrevConf;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v39);

      }
      -[ADJasperColorPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "normalsOutput");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41 == 0;

      if (!v42)
      {
        itmPrevProcessedFusedNormals = self->_itmPrevProcessedFusedNormals;
        if (itmPrevProcessedFusedNormals)
        {
          v51[0] = CFSTR("name");
          v51[1] = CFSTR("image");
          v52[0] = CFSTR("Prev Processed Fused Normals");
          v52[1] = itmPrevProcessedFusedNormals;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v44);

        }
        itmCurrProcessedFusedNormals = self->_itmCurrProcessedFusedNormals;
        if (itmCurrProcessedFusedNormals)
        {
          v49[0] = CFSTR("name");
          v49[1] = CFSTR("image");
          v50[0] = CFSTR("Curr Processed Fused Normals");
          v50[1] = itmCurrProcessedFusedNormals;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v46);

        }
      }
    }
  }
  return v4;
}

- (int64_t)numberOfExecutionSteps
{
  if (-[ADJasperColorExecutorParameters temporalConsistencyMethod](self->_executorParameters, "temporalConsistencyMethod") == 2)return 7;
  if (-[ADJasperColorExecutorParameters temporalConsistencyMethod](self->_executorParameters, "temporalConsistencyMethod") == 1)return 8;
  return 5;
}

- (ADJasperColorExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_storeStrong((id *)&self->_executorParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_prevCamCalib, 0);
  objc_storeStrong((id *)&self->_lktExecutor, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
