@implementation ADJasperColorStillsExecutor

- (ADJasperColorStillsExecutor)init
{
  void *v3;
  ADJasperColorStillsExecutor *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ADJasperColorStillsExecutor initWithParameters:](self, "initWithParameters:", v3);

  return v4;
}

- (id)initForDevice:(id)a3
{
  id v4;
  id v5;
  ADJasperColorStillsExecutor *v6;

  v4 = a3;
  v5 = -[ADJasperColorStillsExecutorParameters initForDevice:]([ADJasperColorStillsExecutorParameters alloc], "initForDevice:", v4);
  v6 = -[ADJasperColorStillsExecutor initWithParameters:](self, "initWithParameters:", v5);

  return v6;
}

- (ADJasperColorStillsExecutor)initWithParameters:(id)a3
{
  id v5;
  ADJasperColorStillsExecutor *v6;
  void *v7;
  void *v8;
  ADJasperColorStillsPipeline *v9;
  ADJasperColorStillsPipeline *pipeline;
  ADEspressoRunner *correctionBackendEspressoRunner;
  ADEspressoRunner *correctionFrontendEspressoRunner;
  NSString *correctionLogString;
  ADJasperColorStillsExecutor *v14;
  uint8_t v16[8];
  objc_super v17;
  int v18;
  __int128 v19;
  __int128 v20;

  v5 = a3;
  v18 = 335679544;
  v19 = 0u;
  v20 = 0u;
  kdebug_trace();
  v17.receiver = self;
  v17.super_class = (Class)ADJasperColorStillsExecutor;
  v6 = -[ADExecutor init](&v17, sel_init);
  if (!v6)
    goto LABEL_6;
  if (!v5
    || (objc_msgSend(v5, "pipelineParameters"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to initialize jasperColorStills executor: bad executorParameters input", v16, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v5, "pipelineParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ADJasperColorStillsPipeline initWithParameters:]([ADJasperColorStillsPipeline alloc], "initWithParameters:", v8);
  pipeline = v6->_pipeline;
  v6->_pipeline = v9;

  if (!v6->_pipeline)
  {

LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_executorParameters, a3);
  v6->_itmCroppedScaledColor = 0;
  v6->_itmRotatedColor = 0;
  v6->_itmPreProcessedColor = 0;
  v6->_itmPreProcessedJasper = 0;
  v6->_itmPreProcessedJasperForCorrection = 0;
  v6->_itmUnprocessedDepth = 0;
  v6->_itmUnscaledProcessedDepth = 0;
  v6->_isPrepared = 0;
  correctionBackendEspressoRunner = v6->_correctionBackendEspressoRunner;
  v6->_correctionBackendEspressoRunner = 0;

  correctionFrontendEspressoRunner = v6->_correctionFrontendEspressoRunner;
  v6->_correctionFrontendEspressoRunner = 0;

  v6->_calibFeaturesOutput = 0;
  v6->_calibFeaturesInput = 0;
  v6->_calibAnglesOutput = 0;
  v6->_calibErrorsOutput = 0;
  correctionLogString = v6->_correctionLogString;
  v6->_correctionLogString = 0;

LABEL_6:
  v14 = v6;
LABEL_11:
  kdebug_trace();

  return v14;
}

- (void)deallocateEspressoBuffers
{
  CVPixelBufferRelease(self->_itmPreProcessedJasper);
  self->_itmPreProcessedJasper = 0;
  CVPixelBufferRelease(self->_itmUnprocessedDepth);
  self->_itmUnprocessedDepth = 0;
  CVPixelBufferRelease(self->_itmPreProcessedJasperForCorrection);
  self->_itmPreProcessedJasperForCorrection = 0;
}

- (int64_t)allocateIntermediateBuffers
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  __CVBuffer *itmPreProcessedColor;
  ADEspressoRunner *espressoRunner;
  void *v10;
  void *v11;
  int64_t v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  ADEspressoRunner *correctionBackendEspressoRunner;
  __CVBuffer *v17;
  void *v18;
  void *v19;
  ADEspressoRunner *v20;
  void *v21;
  void *v22;
  ADEspressoRunner *v23;
  void *v24;
  void *v25;
  ADEspressoRunner *v26;
  void *v27;
  void *v28;
  ADEspressoRunner *v29;
  void *v30;
  void *v31;
  ADEspressoBufferHandle *v32;
  ADEspressoBufferHandle *calibFeaturesOutputBuffer;
  ADEspressoRunner *correctionFrontendEspressoRunner;
  void *v35;
  void *v36;
  void *v37;
  ADEspressoRunner *v38;
  void *v39;
  void *v40;
  void *v41;
  ADEspressoRunner *v42;
  void *v43;
  void *v44;
  void *v45;
  __int16 v47;
  __int16 v48;

  -[ADJasperColorStillsExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
  -[ADJasperColorStillsPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sizeForLayout:", self->super._layout);
  +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", objc_msgSend(v5, "pixelFormat"), &self->_itmPreProcessedColor, v6, v7);
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    espressoRunner = self->super._espressoRunner;
    -[ADJasperColorStillsPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ADEspressoRunner registerPixelBuffer:forDescriptor:](espressoRunner, "registerPixelBuffer:forDescriptor:", itmPreProcessedColor, v11);

    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v48 = 0;
        v13 = MEMORY[0x24BDACB70];
        v14 = "Failed binding _itmPreProcessedColor for _espressoExecutor";
        v15 = (uint8_t *)&v48;
LABEL_9:
        _os_log_error_impl(&dword_20B62B000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
      }
    }
    else
    {
      correctionBackendEspressoRunner = self->_correctionBackendEspressoRunner;
      v17 = self->_itmPreProcessedColor;
      -[ADJasperColorStillsPipeline correctionBackendInferenceDescriptor](self->_pipeline, "correctionBackendInferenceDescriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "colorInput");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ADEspressoRunner registerPixelBuffer:forDescriptor:](correctionBackendEspressoRunner, "registerPixelBuffer:forDescriptor:", v17, v19);

      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v47 = 0;
          v13 = MEMORY[0x24BDACB70];
          v14 = "Failed binding _itmPreProcessedColor for _correctionBackendEspressoExecutor";
          v15 = (uint8_t *)&v47;
          goto LABEL_9;
        }
      }
      else
      {
        v20 = self->super._espressoRunner;
        -[ADJasperColorStillsPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "jasperInput");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        self->_itmPreProcessedJasper = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v20, "createAndRegisterPixelBufferForDescriptor:", v22);

        v23 = self->super._espressoRunner;
        -[ADJasperColorStillsPipeline inferenceDescriptor](self->_pipeline, "inferenceDescriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "depthOutput");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        self->_itmUnprocessedDepth = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v23, "createAndRegisterPixelBufferForDescriptor:", v25);

        v26 = self->_correctionBackendEspressoRunner;
        -[ADJasperColorStillsPipeline correctionBackendInferenceDescriptor](self->_pipeline, "correctionBackendInferenceDescriptor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "jasperInput");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        self->_itmPreProcessedJasperForCorrection = (__CVBuffer *)-[ADEspressoRunner createAndRegisterPixelBufferForDescriptor:](v26, "createAndRegisterPixelBufferForDescriptor:", v28);

        v29 = self->_correctionBackendEspressoRunner;
        -[ADJasperColorStillsPipeline correctionBackendInferenceDescriptor](self->_pipeline, "correctionBackendInferenceDescriptor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "featuresOutput");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADEspressoRunner registerDescriptor:](v29, "registerDescriptor:", v31);
        v32 = (ADEspressoBufferHandle *)objc_claimAutoreleasedReturnValue();
        calibFeaturesOutputBuffer = self->_calibFeaturesOutputBuffer;
        self->_calibFeaturesOutputBuffer = v32;

        self->_calibFeaturesOutput = (float *)-[ADEspressoBufferHandle data](self->_calibFeaturesOutputBuffer, "data");
        correctionFrontendEspressoRunner = self->_correctionFrontendEspressoRunner;
        -[ADJasperColorStillsPipeline correctionFrontendInferenceDescriptor](self->_pipeline, "correctionFrontendInferenceDescriptor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "featuresInput");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADEspressoRunner registerDescriptor:](correctionFrontendEspressoRunner, "registerDescriptor:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        self->_calibFeaturesInput = (float *)objc_msgSend(v37, "data");

        v38 = self->_correctionFrontendEspressoRunner;
        -[ADJasperColorStillsPipeline correctionFrontendInferenceDescriptor](self->_pipeline, "correctionFrontendInferenceDescriptor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "anglesOutput");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADEspressoRunner registerDescriptor:](v38, "registerDescriptor:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        self->_calibAnglesOutput = (float *)objc_msgSend(v41, "data");

        v42 = self->_correctionFrontendEspressoRunner;
        -[ADJasperColorStillsPipeline correctionFrontendInferenceDescriptor](self->_pipeline, "correctionFrontendInferenceDescriptor");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "errorsOutput");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[ADEspressoRunner registerDescriptor:](v42, "registerDescriptor:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        self->_calibErrorsOutput = (float *)objc_msgSend(v45, "data");

        if (self->_itmPreProcessedJasper && self->_itmUnprocessedDepth && self->_itmPreProcessedJasperForCorrection)
        {
          v12 = 0;
        }
        else
        {
          -[ADJasperColorStillsExecutor deallocateEspressoBuffers](self, "deallocateEspressoBuffers");
          v12 = -22971;
        }
      }
    }
  }
  else
  {
    v12 = -22965;
  }

  return v12;
}

- (int64_t)prepareForEngineType:(unint64_t)a3 inputSize:(CGSize)a4
{
  return -[ADJasperColorStillsExecutor prepareForEngineType:inputROI:](self, "prepareForEngineType:inputROI:", a3, 0.0, 0.0, a4.width, a4.height);
}

- (int64_t)prepareForEngineType:(unint64_t)a3 inputROI:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  ADJasperColorStillsExecutor *v9;
  unint64_t engineType;
  unint64_t layout;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  ADEspressoRunner *correctionBackendEspressoRunner;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  ADEspressoRunner *correctionFrontendEspressoRunner;
  uint8_t buf[8];
  int v32;
  __int128 v33;
  __int128 v34;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = self;
  objc_sync_enter(v9);
  v32 = 335682096;
  v33 = 0u;
  v34 = 0u;
  kdebug_trace();
  engineType = v9->super._engineType;
  layout = v9->super._layout;
  -[ADExecutorParameters logger](v9->_executorParameters, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ROI: Origin: (%d, %d), Size: (%d, %d)"), (int)x, (int)y, (int)width, (int)height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logString:name:priority:", v13, "inputROI", 0);

  -[ADJasperColorStillsPipeline inferenceDescriptor](v9->_pipeline, "inferenceDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorInput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ADExecutor prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:](v9, "prepareForEngineType:roi:descriptorForROI:exifOrientation:rotationPreference:inferenceDescriptor:", a3, v16, 1, 2, v14, x, y, width, height);

  if (!v17)
  {
    if (v9->super._engineType == engineType && v9->super._layout == layout && v9->_isPrepared)
    {
      if (ADDebugUtilsADVerboseLogsEnabled)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Skipping buffers re-allocation and SIP runners init as nothing relevant has changed", buf, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Skipping buffers re-allocation and SIP runners init as nothing relevant has changed", buf, 2u);
        v17 = 0;
        goto LABEL_15;
      }
      v17 = 0;
    }
    else
    {
      -[ADJasperColorStillsPipeline correctionBackendInferenceDescriptor](v9->_pipeline, "correctionBackendInferenceDescriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x24BE05FB0]);
      objc_msgSend(v18, "networkURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "absoluteString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "initWithPath:forEngine:configurationName:", v21, v9->super._engineType, 0);
      correctionBackendEspressoRunner = v9->_correctionBackendEspressoRunner;
      v9->_correctionBackendEspressoRunner = (ADEspressoRunner *)v22;

      if (v9->_correctionBackendEspressoRunner)
      {
        -[ADJasperColorStillsPipeline correctionFrontendInferenceDescriptor](v9->_pipeline, "correctionFrontendInferenceDescriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_alloc(MEMORY[0x24BE05FB0]);
        objc_msgSend(v24, "networkURL");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "absoluteString");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v25, "initWithPath:forEngine:configurationName:", v27, v9->super._engineType, 0);
        correctionFrontendEspressoRunner = v9->_correctionFrontendEspressoRunner;
        v9->_correctionFrontendEspressoRunner = (ADEspressoRunner *)v28;

        if (v9->_correctionFrontendEspressoRunner)
        {
          v17 = -[ADJasperColorStillsExecutor allocateIntermediateBuffers](v9, "allocateIntermediateBuffers");
          v9->_isPrepared = v17 == 0;
        }
        else
        {
          v17 = -22960;
        }

      }
      else
      {
        v17 = -22960;
      }

    }
  }
LABEL_15:

  kdebug_trace();
  objc_sync_exit(v9);

  return v17;
}

- (uint64_t)executeWithColor:(__n128)a3 pointCloudArray:(__n128)a4 pointCloud2ColorTransform:(__n128)a5 colorCameraCalibration:(uint64_t)a6 outDepthMap:(__CVBuffer *)a7
{
  id v14;
  unsigned __int8 *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  unsigned int i;
  void *v21;
  void *v22;
  id v23;
  size_t Width;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  uint8_t *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  __CVBuffer *v64;
  void *v65;
  OSType v66;
  PixelBufferUtils **v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  double v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  id v78;
  void *v79;
  void *v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float32x4_t v87;
  float32x4_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  float v95;
  float v96;
  CVPixelBufferRef *v97;
  float v98;
  void *v99;
  double v100;
  float v101;
  double v102;
  void *v103;
  float v104;
  double v105;
  __CVBuffer *v106;
  float v107;
  double v108;
  void *v109;
  id v110;
  id v111;
  int v112;
  __int128 v113;
  __int128 v114;
  __n128 v115;
  __n128 v116;
  __n128 v117;
  __n128 v118;
  uint8_t v119[4];
  uint64_t v120;
  uint8_t buf[16];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  CGSize v126;

  v125 = *MEMORY[0x24BDAC8D0];
  v100 = a2.n128_f64[0];
  v102 = a3.n128_f64[0];
  v115 = a2;
  v116 = a3;
  v105 = a4.n128_f64[0];
  v108 = a5.n128_f64[0];
  v117 = a4;
  v118 = a5;
  v14 = a8;
  v110 = a9;
  v15 = a1;
  objc_sync_enter(v15);
  if (v15[120]
    || (Width = CVPixelBufferGetWidth(a7),
        (v25 = objc_msgSend(v15, "prepareForEngineType:inputSize:", *((_QWORD *)v15 + 7), (double)Width, (double)CVPixelBufferGetHeight(a7))) == 0))
  {
    if (*((_QWORD *)v15 + 8))
    {
      if (a10)
      {
        v97 = a10;
        objc_msgSend(*((id *)v15 + 34), "logger");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v16;
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "systemUptime");
        v19 = v18;

        v112 = 335686268;
        v113 = 0u;
        v114 = 0u;
        kdebug_trace();
        objc_msgSend(v16, "logPixelBuffer:name:timestamp:", a7, "inputColor", v19);
        objc_msgSend(v16, "logCalibration:name:timestamp:", v110, "inputColorCameraCalibration", v19);
        objc_msgSend(v16, "logMatrix4x3:name:timestamp:", "inputPointCloud2ColorTransform", v100, v102, v105, v108, v19);
        for (i = 0; objc_msgSend(v14, "count") > (unint64_t)i; ++i)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("inputPointCloud_%d"), i);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", i);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_retainAutorelease(v21);
          objc_msgSend(v16, "logPointCloud:name:timestamp:", v22, objc_msgSend(v23, "UTF8String"), v19);

        }
        v106 = a7;
        v26 = 0;
        v27 = 0;
        v28 = MEMORY[0x24BDACB70];
        while (1)
        {
          v29 = v26;
          if (objc_msgSend(v14, "count") <= (unint64_t)v26)
            break;
          objc_msgSend(v14, "objectAtIndexedSubscript:", v26);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (int)objc_msgSend(v30, "length") > 0;

          if (v31)
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = *(_BYTE *)objc_msgSend(v32, "bankIds");

            v34 = 1 << v33;
            if ((v34 & v27) != 0 && os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "objectAtIndexedSubscript:", v29);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = *(unsigned __int8 *)objc_msgSend(v35, "bankIds");
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v36;
              _os_log_impl(&dword_20B62B000, v28, OS_LOG_TYPE_DEFAULT, "Warning: Bank %d appears in more than one input point cloud", buf, 8u);

            }
            v27 |= v34;
          }
          v26 = v29 + 1;
        }
        v37 = objc_msgSend(v15, "numberOfExecutionSteps");
        v38 = objc_msgSend(*((id *)v15 + 34), "stepsToSkip");
        v39 = objc_msgSend(*((id *)v15 + 34), "powerMeasureMode");
        objc_msgSend(*((id *)v15 + 34), "timeProfiler");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v37 - v38;
        if (v39)
        {
          v41 = v40-- < 1;
          if (v41)
            goto LABEL_83;
        }
        kdebug_trace();
        objc_msgSend(v109, "startWithUTFString:", "preprocess jasper");
        objc_msgSend(v15, "frameExecutionStart");
        mergePointCloudsUsingSameTransform(v110, &v115, v14);
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)*((_QWORD *)v15 + 24);
        *((_QWORD *)v15 + 24) = v42;

        v44 = v99;
        objc_msgSend(v99, "logPointCloud:name:timestamp:", *((_QWORD *)v15 + 24), "beforeCorrectionPointCloudTransformedUncropped", v19);
        objc_msgSend(v109, "stopWithUTFString:", "preprocess jasper");
        kdebug_trace();
        if (v39)
        {
          v41 = v40-- < 1;
          if (v41)
            goto LABEL_83;
        }
        kdebug_trace();
        objc_msgSend(v109, "startWithUTFString:", "preprocess color");
        v25 = +[ADUtils scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:](ADUtils, "scaleConvertRotateImage:rotateBy:cropBy:scaleInto:intermediateScalingBuffer:intermediateRotatingBuffer:useVT:", v106, v15[80], *((_QWORD *)v15 + 20), v15 + 144, v15 + 152, 1, *((double *)v15 + 1), *((double *)v15 + 2), *((double *)v15 + 3), *((double *)v15 + 4));
        if (v25)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
LABEL_84:

            kdebug_trace();
            goto LABEL_85;
          }
          *(_WORD *)buf = 0;
          v45 = MEMORY[0x24BDACB70];
          v46 = "failed scaling color image";
          goto LABEL_24;
        }
        objc_msgSend(v99, "logPixelBuffer:name:timestamp:", *((_QWORD *)v15 + 20), "forNetworkColorProcessed", v19);
        if (objc_msgSend(*((id *)v15 + 34), "performJasperToColorTransformCorrection"))
        {
          objc_msgSend(v109, "stopWithUTFString:", "preprocess color");
          kdebug_trace();
          if (v39)
          {
            v41 = v40-- < 1;
            if (v41)
              goto LABEL_83;
          }
          kdebug_trace();
          objc_msgSend(v109, "startWithUTFString:", "preprocess calibration");
          if ((objc_msgSend(v99, "enabled") & 1) != 0)
          {
            v48 = (void *)*((_QWORD *)v15 + 24);
            objc_msgSend(*((id *)v15 + 16), "pipelineParameters");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "pointCloudFilterForTransformCorrection");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "pointCloudByApplyingFilter:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "logPointCloud:name:timestamp:", v51, "forCorrectionPointCloudFilteredUncropped", v19);

            v44 = v99;
          }
          v25 = objc_msgSend(*((id *)v15 + 16), "projectJasperPointsForJasperToColorTransformCorrection:cropTo:rotateBy:projectedPointsBuffer:", *((_QWORD *)v15 + 24), *((_QWORD *)v15 + 10), *((_QWORD *)v15 + 22), *((double *)v15 + 1), *((double *)v15 + 2), *((double *)v15 + 3), *((double *)v15 + 4));
          if (v25)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_84;
            *(_WORD *)buf = 0;
            v45 = MEMORY[0x24BDACB70];
            v46 = "failed projecting point cloud points";
            goto LABEL_24;
          }
          objc_msgSend(v44, "logPixelBuffer:name:timestamp:", *((_QWORD *)v15 + 22), "forCorrectionPointCloudProcessed", v19);
          objc_msgSend(v109, "stopWithUTFString:", "preprocess calibration");
          kdebug_trace();
          if (v39)
          {
            v41 = v40-- < 1;
            if (v41)
              goto LABEL_83;
          }
          kdebug_trace();
          objc_msgSend(v109, "startWithUTFString:", "first network execution");
          v25 = objc_msgSend(*((id *)v15 + 27), "execute");
          if (v25)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_84;
            *(_WORD *)v119 = 0;
            v45 = MEMORY[0x24BDACB70];
            v46 = "failed executing correction backend";
            v47 = v119;
            goto LABEL_25;
          }
          objc_msgSend(v44, "logRawBuffer:size:name:timestamp:", *((_QWORD *)v15 + 30), 4 * objc_msgSend(*((id *)v15 + 29), "dimensionsProduct"), "correctionBackendCalibFeaturesOutput", v19);
          objc_msgSend(v109, "stopWithUTFString:", "first network execution");
          kdebug_trace();
          if (v39)
          {
            v41 = v40-- < 1;
            if (v41)
              goto LABEL_83;
          }
          kdebug_trace();
          objc_msgSend(v109, "startWithUTFString:", "postprocess calibration");
          v103 = (void *)*((_QWORD *)v15 + 16);
          v69 = *((_QWORD *)v15 + 30);
          v70 = *((_QWORD *)v15 + 31);
          objc_msgSend(*((id *)v15 + 29), "dimensions");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v103, "processJasperToColorCorrectionIntermediateResultWithBackendEspressoFeaturesOutput:frontendEspressoFeaturesInput:featuresDimensions:", v69, v70, v71);

          if (v25)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_84;
            *(_WORD *)v119 = 0;
            v45 = MEMORY[0x24BDACB70];
            v46 = "failed processing correction intermediate output";
            v47 = v119;
            goto LABEL_25;
          }
          objc_msgSend(v109, "stopWithUTFString:", "postprocess calibration");
          kdebug_trace();
          if (v39)
          {
            v41 = v40-- < 1;
            if (v41)
              goto LABEL_83;
          }
          kdebug_trace();
          objc_msgSend(v109, "startWithUTFString:", "second network execution");
          objc_msgSend(v99, "logRawBuffer:size:name:timestamp:", *((_QWORD *)v15 + 31), 4 * objc_msgSend(*((id *)v15 + 29), "dimensionsProduct"), "correctionFrontendCalibFeaturesInput", v19);
          v25 = objc_msgSend(*((id *)v15 + 28), "execute");
          if (v25)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_84;
            *(_WORD *)v119 = 0;
            v45 = MEMORY[0x24BDACB70];
            v46 = "failed executing correction frontend";
            v47 = v119;
            goto LABEL_25;
          }
          v73 = (double)CVPixelBufferGetWidth(*((CVPixelBufferRef *)v15 + 20)) / *((double *)v15 + 3);
          v74 = (void *)*((_QWORD *)v15 + 16);
          v75 = *((_QWORD *)v15 + 32);
          v76 = *((_QWORD *)v15 + 33);
          *(float *)&v77 = v73;
          v111 = 0;
          v25 = objc_msgSend(v74, "postProcessJasperToColorCorrectionWithAngles:errors:originalTransform:correctedTransform:colorCameraCalibration:colorImageScale:transformCorrectionResults:", v75, v76, buf, v110, &v111, v115.n128_f64[0], v116.n128_f64[0], v117.n128_f64[0], v118.n128_f64[0], v77);
          v78 = v111;
          v79 = v78;
          if (v25)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v119 = 0;
              _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed post processing correction results", v119, 2u);
            }
LABEL_89:

            goto LABEL_84;
          }
          v80 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v78, "rotation");
          v107 = v81;
          objc_msgSend(v79, "rotation");
          v104 = v82;
          objc_msgSend(v79, "rotation");
          v101 = v83;
          objc_msgSend(v79, "std");
          v98 = v84;
          objc_msgSend(v79, "std");
          v96 = v85;
          objc_msgSend(v79, "std");
          v95 = v86;
          objc_msgSend(v79, "std");
          v88 = vmulq_f32(v87, (float32x4_t)xmmword_20B6D2AA0);
          objc_msgSend(v80, "stringWithFormat:", CFSTR("rotation (%f,%f,%f) STD (%f,%f,%f) weighted STD(%f)"), v107, v104, v101, v98, v96, v95, (float)(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v88, 2), vaddq_f32(v88, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v88.f32, 1))).f32[0]/ 3.0));
          v89 = objc_claimAutoreleasedReturnValue();
          v90 = (void *)*((_QWORD *)v15 + 17);
          *((_QWORD *)v15 + 17) = v89;

          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v91 = *((_QWORD *)v15 + 17);
            *(_DWORD *)v119 = 138543362;
            v120 = v91;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "performing pointCloudToColor transform correction: %{public}@", v119, 0xCu);
          }
          objc_msgSend(v99, "logString:name:timestamp:", *((_QWORD *)v15 + 17), "correctedPointCloudToColorTransformLog", v19);
          objc_msgSend(v99, "logMatrix4x3:name:timestamp:", "correctedPointCloud2ColorTransform", *(double *)buf, *(double *)&v122, *(double *)&v123, *(double *)&v124, v19);
          mergePointCloudsUsingSameTransform(v110, buf, v14);
          v92 = objc_claimAutoreleasedReturnValue();
          v93 = (void *)*((_QWORD *)v15 + 23);
          *((_QWORD *)v15 + 23) = v92;

          v94 = *((_QWORD *)v15 + 23);
          if (!v94)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v119 = 0;
              _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed merging point clouds using corrected transform", v119, 2u);
            }
            v25 = -22950;
            goto LABEL_89;
          }
          objc_msgSend(v99, "logPointCloud:name:timestamp:", v94, "correctedPointCloudTransformedUncropped", v19);

          v52 = "second network execution";
        }
        else
        {
          objc_storeStrong((id *)v15 + 23, *((id *)v15 + 24));
          v52 = "preprocess color";
        }
        v53 = v99;
        objc_msgSend(v109, "stopWithUTFString:", v52);
        kdebug_trace();
        if (!v39 || (v41 = v40 < 1, --v40, !v41))
        {
          kdebug_trace();
          objc_msgSend(v109, "startWithUTFString:", "preprocess jasper");
          if ((objc_msgSend(v99, "enabled") & 1) != 0)
          {
            v54 = (void *)*((_QWORD *)v15 + 23);
            objc_msgSend(*((id *)v15 + 16), "pipelineParameters");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "pointCloudFilter");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "pointCloudByApplyingFilter:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "logPointCloud:name:timestamp:", v57, "forNetworkPointCloudFilteredUncropped", v19);

            v53 = v99;
          }
          v25 = objc_msgSend(*((id *)v15 + 16), "projectJasperPoints:cropTo:rotateBy:projectedPointsBuffer:", *((_QWORD *)v15 + 23), *((_QWORD *)v15 + 10), *((_QWORD *)v15 + 21), *((double *)v15 + 1), *((double *)v15 + 2), *((double *)v15 + 3), *((double *)v15 + 4));
          if (v25)
          {
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_84;
            *(_WORD *)buf = 0;
            v45 = MEMORY[0x24BDACB70];
            v46 = "failed projecting point cloud to buffer";
            goto LABEL_24;
          }
          objc_msgSend(v53, "logPixelBuffer:name:timestamp:", *((_QWORD *)v15 + 21), "forNetworkPointCloudProcessed", v19);
          objc_msgSend(v109, "stopWithUTFString:", "preprocess jasper");
          kdebug_trace();
          if (!v39 || (v41 = v40 < 1, --v40, !v41))
          {
            kdebug_trace();
            objc_msgSend(v109, "startWithUTFString:", "network execution");
            v25 = objc_msgSend(*((id *)v15 + 8), "execute");
            if (v25)
            {
              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                goto LABEL_84;
              *(_WORD *)buf = 0;
              v45 = MEMORY[0x24BDACB70];
              v46 = "failed executing espresso plan";
              goto LABEL_24;
            }
            objc_msgSend(v53, "logPixelBuffer:name:timestamp:", *((_QWORD *)v15 + 25), "output", v19);
            objc_msgSend(v109, "stopWithUTFString:", "network execution");
            kdebug_trace();
            if (v40 < 1)
              v58 = v39;
            else
              v58 = 0;
            if ((v58 & 1) == 0)
            {
              kdebug_trace();
              objc_msgSend(v109, "startWithUTFString:", "postprocess depth");
              objc_msgSend(*((id *)v15 + 16), "processedDepthOutputDescriptor");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "sizeForLayout:", *((_QWORD *)v15 + 5));
              v61 = v60;
              v63 = v62;

              v64 = *v97;
              if (!*v97)
              {
                objc_msgSend(*((id *)v15 + 16), "processedDepthOutputDescriptor");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = objc_msgSend(v65, "pixelFormat");
                v126.width = v61;
                v126.height = v63;
                *v97 = PixelBufferUtils::createPixelBuffer(v66, v126, 1);

                v64 = *v97;
              }
              if (v61 == (double)CVPixelBufferGetWidth(v64) && v63 == (double)CVPixelBufferGetHeight(*v97))
              {
                v68 = 0;
                v67 = v97;
              }
              else
              {
                v67 = (PixelBufferUtils **)(v15 + 208);
                +[ADUtils updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:](ADUtils, "updatePixelBufferAllocationWithNewSize:pixelFormat:pixelBuffer:", CVPixelBufferGetPixelFormatType(*v97), v15 + 208, v61, v63);
                v68 = 1;
              }
              v25 = objc_msgSend(*((id *)v15 + 16), "postProcessWithDepth:depthOutput:", *((_QWORD *)v15 + 25), *v67);
              if (v25)
              {
                if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  goto LABEL_84;
                *(_WORD *)buf = 0;
                v45 = MEMORY[0x24BDACB70];
                v46 = "failed postprocessing depth";
LABEL_24:
                v47 = buf;
LABEL_25:
                _os_log_error_impl(&dword_20B62B000, v45, OS_LOG_TYPE_ERROR, v46, v47, 2u);
                goto LABEL_84;
              }
              objc_msgSend(v99, "logPixelBuffer:name:timestamp:", *v67, "outputProcessed", v19);
              if (v68)
              {
                PixelBufferUtils::cropAndScalePixelBuffer(*v67, *v97, 0, *MEMORY[0x24BDBF090]);
                objc_msgSend(v99, "logPixelBuffer:name:timestamp:", *v97, "outputProcessedScaled", v19);
              }
              objc_msgSend(v109, "stopWithUTFString:", "postprocess depth");
              kdebug_trace();
              objc_msgSend(v15, "frameExecutionEnd");
            }
          }
        }
LABEL_83:
        v25 = 0;
        goto LABEL_84;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "must provide a pointer to CVPixelBufferRef", buf, 2u);
      }
      v25 = -22953;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed preparing executor", buf, 2u);
      }
      v25 = -22960;
    }
  }
LABEL_85:
  objc_sync_exit(v15);

  return v25;
}

- (void)dealloc
{
  __CVBuffer *itmCroppedScaledColor;
  __CVBuffer *itmRotatedColor;
  __CVBuffer *itmPreProcessedColor;
  __CVBuffer *itmPreProcessedJasper;
  __CVBuffer *itmPreProcessedJasperForCorrection;
  __CVBuffer *itmUnprocessedDepth;
  __CVBuffer *itmUnscaledProcessedDepth;
  objc_super v10;

  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
    CVPixelBufferRelease(itmCroppedScaledColor);
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
    CVPixelBufferRelease(itmRotatedColor);
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
    CVPixelBufferRelease(itmPreProcessedColor);
  itmPreProcessedJasper = self->_itmPreProcessedJasper;
  if (itmPreProcessedJasper)
    CVPixelBufferRelease(itmPreProcessedJasper);
  itmPreProcessedJasperForCorrection = self->_itmPreProcessedJasperForCorrection;
  if (itmPreProcessedJasperForCorrection)
    CVPixelBufferRelease(itmPreProcessedJasperForCorrection);
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
    CVPixelBufferRelease(itmUnprocessedDepth);
  itmUnscaledProcessedDepth = self->_itmUnscaledProcessedDepth;
  if (itmUnscaledProcessedDepth)
    CVPixelBufferRelease(itmUnscaledProcessedDepth);
  v10.receiver = self;
  v10.super_class = (Class)ADJasperColorStillsExecutor;
  -[ADExecutor dealloc](&v10, sel_dealloc);
}

- (id)getIntermediates
{
  void *v3;
  __CVBuffer *itmCroppedScaledColor;
  void *v5;
  __CVBuffer *itmRotatedColor;
  void *v7;
  __CVBuffer *itmPreProcessedColor;
  void *v9;
  __CVBuffer *itmPreProcessedJasper;
  void *v11;
  __CVBuffer *itmUnprocessedDepth;
  void *v13;
  __CVBuffer *itmUnscaledProcessedDepth;
  void *v15;
  __CVBuffer *itmPreProcessedJasperForCorrection;
  void *v17;
  ADJasperPointCloud *aggregatedPointCloud;
  void *v19;
  ADJasperPointCloud *aggregatedPointCloudBeforeCorrection;
  void *v21;
  NSString *correctionLogString;
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
  itmCroppedScaledColor = self->_itmCroppedScaledColor;
  if (itmCroppedScaledColor)
  {
    v43[0] = CFSTR("name");
    v43[1] = CFSTR("image");
    v44[0] = CFSTR("CroppedScaledColor");
    v44[1] = itmCroppedScaledColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  itmRotatedColor = self->_itmRotatedColor;
  if (itmRotatedColor)
  {
    v41[0] = CFSTR("name");
    v41[1] = CFSTR("image");
    v42[0] = CFSTR("RotatedColor");
    v42[1] = itmRotatedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  itmPreProcessedColor = self->_itmPreProcessedColor;
  if (itmPreProcessedColor)
  {
    v39[0] = CFSTR("name");
    v39[1] = CFSTR("image");
    v40[0] = CFSTR("PreProcessed Color");
    v40[1] = itmPreProcessedColor;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  itmPreProcessedJasper = self->_itmPreProcessedJasper;
  if (itmPreProcessedJasper)
  {
    v37[0] = CFSTR("name");
    v37[1] = CFSTR("image");
    v38[0] = CFSTR("PreProcessed Jasper");
    v38[1] = itmPreProcessedJasper;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  itmUnprocessedDepth = self->_itmUnprocessedDepth;
  if (itmUnprocessedDepth)
  {
    v35[0] = CFSTR("name");
    v35[1] = CFSTR("image");
    v36[0] = CFSTR("Unprocessed Depth");
    v36[1] = itmUnprocessedDepth;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  itmUnscaledProcessedDepth = self->_itmUnscaledProcessedDepth;
  if (itmUnscaledProcessedDepth)
  {
    v33[0] = CFSTR("name");
    v33[1] = CFSTR("image");
    v34[0] = CFSTR("Unscaled processed Depth");
    v34[1] = itmUnscaledProcessedDepth;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  itmPreProcessedJasperForCorrection = self->_itmPreProcessedJasperForCorrection;
  if (itmPreProcessedJasperForCorrection)
  {
    v31[0] = CFSTR("name");
    v31[1] = CFSTR("image");
    v32[0] = CFSTR("Unprocessed point cloud for correction");
    v32[1] = itmPreProcessedJasperForCorrection;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  aggregatedPointCloud = self->_aggregatedPointCloud;
  if (aggregatedPointCloud)
  {
    v29[0] = CFSTR("name");
    v29[1] = CFSTR("pointcloud");
    v30[0] = CFSTR("Aggregated point cloud");
    v30[1] = aggregatedPointCloud;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  aggregatedPointCloudBeforeCorrection = self->_aggregatedPointCloudBeforeCorrection;
  if (aggregatedPointCloudBeforeCorrection)
  {
    v27[0] = CFSTR("name");
    v27[1] = CFSTR("pointcloud");
    v28[0] = CFSTR("Aggregated point cloud before correction");
    v28[1] = aggregatedPointCloudBeforeCorrection;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  correctionLogString = self->_correctionLogString;
  if (correctionLogString)
  {
    v25[0] = CFSTR("name");
    v25[1] = CFSTR("string");
    v26[0] = CFSTR("Correction results");
    v26[1] = correctionLogString;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  return v3;
}

- (int64_t)numberOfExecutionSteps
{
  if (-[ADJasperColorStillsExecutorParameters performJasperToColorTransformCorrection](self->_executorParameters, "performJasperToColorTransformCorrection"))
  {
    return 9;
  }
  else
  {
    return 5;
  }
}

- (ADJasperColorStillsExecutorParameters)executorParameters
{
  return self->_executorParameters;
}

- (void)setExecutorParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorParameters, 0);
  objc_storeStrong((id *)&self->_calibFeaturesOutputBuffer, 0);
  objc_storeStrong((id *)&self->_correctionFrontendEspressoRunner, 0);
  objc_storeStrong((id *)&self->_correctionBackendEspressoRunner, 0);
  objc_storeStrong((id *)&self->_aggregatedPointCloudBeforeCorrection, 0);
  objc_storeStrong((id *)&self->_aggregatedPointCloud, 0);
  objc_storeStrong((id *)&self->_correctionLogString, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
