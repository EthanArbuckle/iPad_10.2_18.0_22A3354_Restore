@implementation ADPCEDisparityColorPipeline

- (id)initForInputSource:(unint64_t)a3 metalDevice:(id)a4
{
  return -[ADPCEDisparityColorPipeline initWithParameters:inputSource:metalDevice:](self, "initWithParameters:inputSource:metalDevice:", 0, a3, a4);
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (float)disparityScaleForLayout:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  float v8;
  float v9;

  if (-[ADPCEDisparityColorPipelineParameters trainingWidth](self->_pipelineParameters, "trainingWidth"))
  {
    -[ADEspressoPCEDisparityColorInferenceDescriptor colorInput](self->_inferenceDesc, "colorInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeForLayout:", a3);
    v8 = v7 / (double)-[ADPCEDisparityColorPipelineParameters trainingWidth](self->_pipelineParameters, "trainingWidth");

  }
  else
  {
    v8 = 1.0;
  }
  -[ADPCEDisparityColorPipelineParameters disparityScaleForModelZoom](self->_pipelineParameters, "disparityScaleForModelZoom");
  return v8 * v9;
}

- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3 inputSource:(unint64_t)a4 metalDevice:(id)a5
{
  id v8;
  id v9;
  ADPCEDisparityColorPipeline *v10;
  ADPCEDisparityColorPipeline *v11;
  id *p_pipelineParameters;
  uint64_t v13;
  ADNetworkProvider *networkProvider;
  float v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  float v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  float v25;
  ADPCEDisparityColorPipeline *v26;
  float v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  float v33;
  objc_super v34;
  int v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  double v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v35 = 335686912;
  v36 = 0u;
  v37 = 0u;
  kdebug_trace();
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = a4;
      _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Initializing ADPCEDisparityColorPipeline for input source #%d", buf, 8u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v39) = a4;
    _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Initializing ADPCEDisparityColorPipeline for input source #%d", buf, 8u);
  }
  v34.receiver = self;
  v34.super_class = (Class)ADPCEDisparityColorPipeline;
  v10 = -[ADPCEDisparityColorPipeline init](&v34, sel_init);
  v11 = v10;
  if (v10)
  {
    if (!v8)
      v8 = (id)objc_opt_new();
    p_pipelineParameters = (id *)&v10->_pipelineParameters;
    objc_storeStrong((id *)&v10->_pipelineParameters, v8);
    switch(a4)
    {
      case 0uLL:
        +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", CFSTR("CinVidStereoWideSuperwide"));
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 1uLL:
      case 3uLL:
        +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", CFSTR("CinVidStereoTeleWide"));
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 2uLL:
        +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", CFSTR("CinVidPearl"));
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        networkProvider = v10->_networkProvider;
        v10->_networkProvider = (ADNetworkProvider *)v13;

        if (!v10->_networkProvider)
          goto LABEL_55;
        objc_msgSend(*p_pipelineParameters, "pceBias");
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*p_pipelineParameters, "pceBias");
            *(_DWORD *)buf = 134217984;
            v39 = v15;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Init with PCE bias value: %f", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*p_pipelineParameters, "pceBias");
          *(_DWORD *)buf = 134217984;
          v39 = v28;
          _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Init with PCE bias value: %f", buf, 0xCu);
        }
        objc_msgSend(*p_pipelineParameters, "outputDisparityBias");
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*p_pipelineParameters, "outputDisparityBias");
            *(_DWORD *)buf = 134217984;
            v39 = v19;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Init with output disparity bias value: %f", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*p_pipelineParameters, "outputDisparityBias");
          *(_DWORD *)buf = 134217984;
          v39 = v29;
          _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Init with output disparity bias value: %f", buf, 0xCu);
        }
        if (objc_msgSend(*p_pipelineParameters, "trainingWidth") == -1)
        {
          -[ADNetworkProvider metadataForKey:](v10->_networkProvider, "metadataForKey:", TRAINING_WIDTH_METADATA_KEY);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            objc_msgSend(*p_pipelineParameters, "setTrainingWidth:", objc_msgSend(v20, "unsignedLongValue"));
            if (ADDebugUtilsADVerboseLogsEnabled)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Reading training width from network", buf, 2u);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Reading training width from network", buf, 2u);
            }
          }
          else
          {
            objc_msgSend(*p_pipelineParameters, "setTrainingWidth:", 0);
          }

        }
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_msgSend(*p_pipelineParameters, "trainingWidth");
            v23 = objc_msgSend(*p_pipelineParameters, "trainingWidth");
            v24 = "";
            if (!v23)
              v24 = " (no scaling)";
            *(_DWORD *)buf = 134218242;
            v39 = *(double *)&v22;
            v40 = 2080;
            v41 = v24;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Init with reference training width value: %ld%s", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          v30 = objc_msgSend(*p_pipelineParameters, "trainingWidth");
          v31 = objc_msgSend(*p_pipelineParameters, "trainingWidth");
          v32 = "";
          if (!v31)
            v32 = " (no scaling)";
          *(_DWORD *)buf = 134218242;
          v39 = *(double *)&v30;
          v40 = 2080;
          v41 = v32;
          _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Init with reference training width value: %ld%s", buf, 0x16u);
        }
        objc_msgSend(*p_pipelineParameters, "disparityScaleForModelZoom");
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*p_pipelineParameters, "disparityScaleForModelZoom");
            *(_DWORD *)buf = 134217984;
            v39 = v25;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Init with disparityScaleForModelZoom value: %f", buf, 0xCu);
            if (v9)
              goto LABEL_53;
            goto LABEL_47;
          }
          goto LABEL_46;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
LABEL_46:
          if (v9)
            goto LABEL_53;
          goto LABEL_47;
        }
        objc_msgSend(*p_pipelineParameters, "disparityScaleForModelZoom");
        *(_DWORD *)buf = 134217984;
        v39 = v33;
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Init with disparityScaleForModelZoom value: %f", buf, 0xCu);
        if (v9)
          goto LABEL_53;
LABEL_47:
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Metal device not provided, using default device", buf, 2u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Metal device not provided, using default device", buf, 2u);
        }
        v9 = MTLCreateSystemDefaultDevice();
        if (!v9)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot create default metal device", buf, 2u);
          }
          v9 = 0;
          v26 = 0;
          break;
        }
LABEL_53:
        objc_storeStrong((id *)&v10->_metalDevice, v9);
        if (!-[ADPCEDisparityColorPipeline adjustForEngine:](v10, "adjustForEngine:", 3))
          goto LABEL_56;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v16 = MEMORY[0x24BDACB70];
          v17 = "adjustForEngine failed";
          v18 = 2;
LABEL_62:
          _os_log_error_impl(&dword_20B62B000, v16, OS_LOG_TYPE_ERROR, v17, buf, v18);
          v26 = 0;
        }
        else
        {
LABEL_55:
          v26 = 0;
        }
        break;
      default:
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_55;
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = a4;
        v16 = MEMORY[0x24BDACB70];
        v17 = "Unsupported input source: %d";
        v18 = 8;
        goto LABEL_62;
    }
  }
  else
  {
LABEL_56:
    v26 = v10;
  }
  kdebug_trace();

  return v26;
}

- (int64_t)adjustForEngine:(unint64_t)a3
{
  unint64_t v4;
  ADEspressoPCEDisparityColorInferenceDescriptor *v5;
  uint64_t v6;
  ADEspressoPCEDisparityColorInferenceDescriptor *v7;
  ADEspressoPCEDisparityColorInferenceDescriptor *inferenceDesc;

  v4 = a3 - 3;
  v5 = [ADEspressoPCEDisparityColorInferenceDescriptor alloc];
  if (v4 >= 2)
    v6 = 1717856627;
  else
    v6 = 1751411059;
  v7 = -[ADEspressoPCEDisparityColorInferenceDescriptor initWithNetworkProvider:inputColorFormat:disparityFormat:](v5, "initWithNetworkProvider:inputColorFormat:disparityFormat:", self->_networkProvider, 1111970369, v6);
  inferenceDesc = self->_inferenceDesc;
  self->_inferenceDesc = v7;

  return -[ADPCEDisparityColorPipeline rebuildMetalPreprocessingKernels](self, "rebuildMetalPreprocessingKernels");
}

- (int64_t)rebuildMetalPreprocessingKernels
{
  void *v3;
  void *v4;
  MTLDevice *metalDevice;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  MTLDevice *v15;
  MTLComputePipelineState *v16;
  id v17;
  MTLComputePipelineState *v18;
  int64_t v19;
  void *v20;
  MTLDevice *v21;
  MTLComputePipelineState *v22;
  MTLComputePipelineState *v23;
  MTLDevice *v24;
  MTLComputePipelineState *v25;
  MTLComputePipelineState *v26;
  MTLDevice *v27;
  MTLComputePipelineState *v28;
  MTLComputePipelineState *v29;
  MTLDevice *v30;
  MTLComputePipelineState *v31;
  MTLComputePipelineState *v32;
  MTLDevice *v33;
  MTLComputePipelineState *v34;
  MTLComputePipelineState *v35;
  MTLDevice *v36;
  MTLComputePipelineState *v37;
  MTLComputePipelineState *v38;
  MTLDevice *v39;
  MTLComputePipelineState *v40;
  MTLComputePipelineState *v41;
  void *v42;
  void *v43;
  id v44;
  MTLDevice *v45;
  MTLComputePipelineState *v46;
  MTLComputePipelineState *postprocessPipeline;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int128 v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:subdirectory:", CFSTR("default"), CFSTR("metallib"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  metalDevice = self->_metalDevice;
  v63 = 0;
  v6 = (void *)-[MTLDevice newLibraryWithURL:error:](metalDevice, "newLibraryWithURL:error:", v4, &v63);
  v7 = v63;
  if (v6)
  {
    -[ADEspressoPCEDisparityColorInferenceDescriptor disparityInput](self->_inferenceDesc, "disparityInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "pixelFormat") == 1751411059)
      v10 = 16;
    else
      v10 = 32;

    v68 = xmmword_20B6D2A50;
    v11 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ADPCEDisparityColorPipelineUtils::preprocessPCEDisparityToF%d"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ADPCEDisparityColorPipelineUtils::preprocessF%dPCEDisparity"), v10);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstantValue:type:withName:", &v68, 33, CFSTR("RotationMode"));
    v62 = v7;
    v13 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v12, v11, &v62);
    v14 = v62;

    if (v13)
    {
      v15 = self->_metalDevice;
      v61 = v14;
      v16 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v15, "newComputePipelineStateWithFunction:error:", v13, &v61);
      v17 = v61;

      v18 = self->_preprocessPipelineForRawPCE[0];
      self->_preprocessPipelineForRawPCE[0] = v16;

      if (v17)
      {
LABEL_7:
        v14 = v17;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "description");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v65 = v12;
          v66 = 2112;
          v67 = v52;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot create compute pipeline for %@: %@", buf, 0x16u);

        }
        goto LABEL_44;
      }
      v60 = 0;
      v20 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v56, v11, &v60);
      v14 = v60;

      if (!v20 || v14)
        goto LABEL_41;
      v21 = self->_metalDevice;
      v59 = 0;
      v22 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v21, "newComputePipelineStateWithFunction:error:", v20, &v59);
      v14 = v59;
      v23 = self->_preprocessPipelineForFloatPCE[0];
      self->_preprocessPipelineForFloatPCE[0] = v22;

      if (v14)
        goto LABEL_16;

      objc_msgSend(v11, "setConstantValue:type:withName:", (char *)&v68 + 4, 33, CFSTR("RotationMode"));
      v62 = 0;
      v13 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v12, v11, &v62);
      v14 = v62;
      if (v13)
      {
        v24 = self->_metalDevice;
        v61 = v14;
        v25 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v24, "newComputePipelineStateWithFunction:error:", v13, &v61);
        v17 = v61;

        v26 = self->_preprocessPipelineForRawPCE[1];
        self->_preprocessPipelineForRawPCE[1] = v25;

        if (v17)
          goto LABEL_7;
        v60 = 0;
        v20 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v56, v11, &v60);
        v14 = v60;

        if (!v20 || v14)
          goto LABEL_41;
        v27 = self->_metalDevice;
        v59 = 0;
        v28 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v27, "newComputePipelineStateWithFunction:error:", v20, &v59);
        v14 = v59;
        v29 = self->_preprocessPipelineForFloatPCE[1];
        self->_preprocessPipelineForFloatPCE[1] = v28;

        if (v14)
          goto LABEL_16;

        objc_msgSend(v11, "setConstantValue:type:withName:", (char *)&v68 + 8, 33, CFSTR("RotationMode"));
        v62 = 0;
        v13 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v12, v11, &v62);
        v14 = v62;
        if (v13)
        {
          v30 = self->_metalDevice;
          v61 = v14;
          v31 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v30, "newComputePipelineStateWithFunction:error:", v13, &v61);
          v17 = v61;

          v32 = self->_preprocessPipelineForRawPCE[2];
          self->_preprocessPipelineForRawPCE[2] = v31;

          if (v17)
            goto LABEL_7;
          v60 = 0;
          v20 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v56, v11, &v60);
          v14 = v60;

          if (!v20 || v14)
            goto LABEL_41;
          v33 = self->_metalDevice;
          v59 = 0;
          v34 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v33, "newComputePipelineStateWithFunction:error:", v20, &v59);
          v14 = v59;
          v35 = self->_preprocessPipelineForFloatPCE[2];
          self->_preprocessPipelineForFloatPCE[2] = v34;

          if (v14)
            goto LABEL_16;

          objc_msgSend(v11, "setConstantValue:type:withName:", (unint64_t)&v68 | 0xC, 33, CFSTR("RotationMode"));
          v62 = 0;
          v13 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v12, v11, &v62);
          v14 = v62;
          if (v13)
          {
            v36 = self->_metalDevice;
            v61 = v14;
            v37 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v36, "newComputePipelineStateWithFunction:error:", v13, &v61);
            v17 = v61;

            v38 = self->_preprocessPipelineForRawPCE[3];
            self->_preprocessPipelineForRawPCE[3] = v37;

            if (v17)
              goto LABEL_7;
            v60 = 0;
            v20 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v56, v11, &v60);
            v14 = v60;

            if (v20 && !v14)
            {
              v39 = self->_metalDevice;
              v59 = 0;
              v40 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v39, "newComputePipelineStateWithFunction:error:", v20, &v59);
              v14 = v59;
              v41 = self->_preprocessPipelineForFloatPCE[3];
              self->_preprocessPipelineForFloatPCE[3] = v40;

              if (!v14)
              {

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ADPCEDisparityColorPipelineUtils::postprocessF%dDisparity"), v10);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = 0;
                v43 = (void *)objc_msgSend(v6, "newFunctionWithName:constantValues:error:", v42, v11, &v58);
                v44 = v58;
                v14 = v44;
                if (!v43 || v44)
                {
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v14, "description");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v65 = v42;
                    v66 = 2112;
                    v67 = v55;
                    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot find metal function %@: %@", buf, 0x16u);

                  }
                }
                else
                {
                  v45 = self->_metalDevice;
                  v57 = 0;
                  v46 = (MTLComputePipelineState *)-[MTLDevice newComputePipelineStateWithFunction:error:](v45, "newComputePipelineStateWithFunction:error:", v43, &v57);
                  v14 = v57;
                  postprocessPipeline = self->_postprocessPipeline;
                  self->_postprocessPipeline = v46;

                  if (!v14)
                  {
                    v19 = 0;
                    goto LABEL_50;
                  }
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v14, "description");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v65 = v42;
                    v66 = 2112;
                    v67 = v48;
                    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot create compute pipeline for %@: %@", buf, 0x16u);

                  }
                }
                v19 = -22950;
LABEL_50:

                goto LABEL_45;
              }
LABEL_16:
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v14, "description");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v65 = v56;
                v66 = 2112;
                v67 = v54;
                _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot create compute pipeline for %@: %@", buf, 0x16u);

              }
LABEL_43:

LABEL_44:
              v19 = -22950;
LABEL_45:

              v7 = v14;
              goto LABEL_46;
            }
LABEL_41:
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "description");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v65 = v56;
              v66 = 2112;
              v67 = v53;
              _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot find metal function %@: %@", buf, 0x16u);

            }
            goto LABEL_43;
          }
        }
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "description");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v65 = v12;
      v66 = 2112;
      v67 = v49;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot find metal function %@: %@", buf, 0x16u);

    }
    goto LABEL_44;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "description");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v65 = v51;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot load metal library: %@", buf, 0xCu);

  }
  v19 = -22950;
LABEL_46:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_postprocessPipeline, 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForFloatPCE[3], 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForFloatPCE[2], 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForFloatPCE[1], 0);
  objc_storeStrong((id *)self->_preprocessPipelineForFloatPCE, 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForRawPCE[3], 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForRawPCE[2], 0);
  objc_storeStrong((id *)&self->_preprocessPipelineForRawPCE[1], 0);
  objc_storeStrong((id *)self->_preprocessPipelineForRawPCE, 0);
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

- (ADPCEDisparityColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (ADPCEDisparityColorPipeline)init
{
  return -[ADPCEDisparityColorPipeline initWithParameters:](self, "initWithParameters:", 0);
}

- (id)initForInputSource:(unint64_t)a3
{
  return -[ADPCEDisparityColorPipeline initWithParameters:inputSource:metalDevice:](self, "initWithParameters:inputSource:metalDevice:", 0, a3, 0);
}

- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3
{
  return -[ADPCEDisparityColorPipeline initWithParameters:inputSource:metalDevice:](self, "initWithParameters:inputSource:metalDevice:", a3, 0, 0);
}

- (ADPCEDisparityColorPipeline)initWithParameters:(id)a3 inputSource:(unint64_t)a4
{
  return -[ADPCEDisparityColorPipeline initWithParameters:inputSource:metalDevice:](self, "initWithParameters:inputSource:metalDevice:", a3, a4, 0);
}

- (int64_t)encodeDisparityPreprocessingToCommandBuffer:(id)a3 input:(id)a4 normalizationMultiplier:(float)a5 normalizationOffset:(float)a6 invalidValue:(unsigned __int16)a7 rotation:(int64_t)a8 output:(id)a9
{
  id v16;
  id v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  int v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  MTLComputePipelineState **preprocessPipelineForRawPCE;
  MTLComputePipelineState *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  int v39;
  uint8_t *v40;
  int v41;
  uint8_t *v42;
  id v43;
  uint64_t v44;
  uint8_t buf[8];
  uint64_t v46;
  unsigned __int16 v47;
  int v48;
  int v49;
  uint8_t v50[4];
  uint8_t *v51;
  __int16 v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v16 = a4;
  v17 = a9;
  LODWORD(v44) = 335681660;
  kdebug_trace();
  v18 = objc_msgSend(v16, "pixelFormat");
  if (objc_msgSend(v16, "pixelFormat") == 25)
  {
    v19 = 1;
  }
  else
  {
    v24 = objc_msgSend(v16, "pixelFormat");
    v19 = v24 == 55;
    if (v18 != 23 && v24 != 55)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = objc_msgSend(v16, "pixelFormat");
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported input texture format %d", buf, 8u);
      }
      v23 = -22951;
      goto LABEL_27;
    }
  }
  -[ADEspressoPCEDisparityColorInferenceDescriptor disparityInput](self->_inferenceDesc, "disparityInput", v43, v44, 0, 0, 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "pixelFormat");

  if (v22 == 1751411059)
  {
    if (objc_msgSend(v17, "pixelFormat") != 25)
      goto LABEL_5;
  }
  else if (objc_msgSend(v17, "pixelFormat") != 55)
  {
LABEL_5:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ADEspressoPCEDisparityColorInferenceDescriptor disparityInput](self->_inferenceDesc, "disparityInput");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "imageDescriptor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      PixelBufferUtils::pixelFormatAsString(objc_msgSend(v38, "pixelFormat"), (char *)buf);
      v39 = SHIBYTE(v48);
      v40 = *(uint8_t **)buf;
      v41 = objc_msgSend(v17, "pixelFormat");
      v42 = buf;
      if (v39 < 0)
        v42 = v40;
      *(_DWORD *)v50 = 136446466;
      v51 = v42;
      v52 = 1024;
      v53 = v41;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Expected output pixelbuffer format (%{public}s) does not match provided texture format (%d)", v50, 0x12u);
      if (SHIBYTE(v48) < 0)
        operator delete(*(void **)buf);

    }
LABEL_6:
    v23 = -22953;
    goto LABEL_27;
  }
  if (v19)
  {
    v25 = objc_msgSend(v16, "pixelFormat");
    if (v25 != objc_msgSend(v17, "pixelFormat"))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = objc_msgSend(v16, "pixelFormat");
        LOWORD(v46) = 1024;
        *(_DWORD *)((char *)&v46 + 2) = objc_msgSend(v17, "pixelFormat");
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Input texture format (%d) does not match output texture format (%d)", buf, 0xEu);
      }
      goto LABEL_6;
    }
  }
  v26 = 1;
  v27 = (int)a8;
  if (a8 == 1)
    v27 = 3;
  if (a8 != 3)
    v26 = v27;
  preprocessPipelineForRawPCE = self->_preprocessPipelineForRawPCE;
  if (v18 != 23)
    preprocessPipelineForRawPCE = self->_preprocessPipelineForFloatPCE;
  v29 = preprocessPipelineForRawPCE[v26];
  -[ADPCEDisparityColorPipelineParameters minDisparity](self->_pipelineParameters, "minDisparity");
  LODWORD(v46) = v30;
  -[ADPCEDisparityColorPipelineParameters maxDisparity](self->_pipelineParameters, "maxDisparity");
  HIDWORD(v46) = v31;
  *(float *)buf = a5;
  *(float *)&buf[4] = a6;
  v47 = a7;
  -[ADPCEDisparityColorPipelineParameters pceBias](self->_pipelineParameters, "pceBias");
  v48 = v32;
  -[ADPCEDisparityColorPipeline disparityScaleForLayout:](self, "disparityScaleForLayout:", objc_msgSend(MEMORY[0x24BE05FF0], "layoutForSize:", (double)(unint64_t)objc_msgSend(v17, "width"), (double)(unint64_t)objc_msgSend(v17, "height")));
  v49 = v33;
  objc_msgSend(v43, "computeCommandEncoder");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    objc_msgSend(v34, "setComputePipelineState:", v29);
    objc_msgSend(v35, "setTexture:atIndex:", v16, 0);
    objc_msgSend(v35, "setTexture:atIndex:", v17, 1);
    objc_msgSend(v35, "setBytes:length:atIndex:", buf, 28, 0);
    +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v35, v29, objc_msgSend(v17, "width"), objc_msgSend(v17, "height"));
    objc_msgSend(v35, "endEncoding");
    v23 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v50 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed getting command encoder", v50, 2u);
    }
    v23 = -22950;
  }

LABEL_27:
  kdebug_trace();

  return v23;
}

- (int64_t)encodeDisparityPostprocessingToCommandBuffer:(id)a3 input:(id)a4 output:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void **v17;
  int v18;
  void **p_p;
  uint64_t v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  int64_t v25;
  void *__p;
  __int16 v28;
  int v29;
  int v30;
  int v31;
  uint8_t buf[4];
  void **v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  -[ADEspressoPCEDisparityColorInferenceDescriptor disparityOutput](self->_inferenceDesc, "disparityOutput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "pixelFormat");

  if (v13 == 1751411059)
  {
    if (objc_msgSend(v9, "pixelFormat") != 25)
      goto LABEL_3;
  }
  else if (objc_msgSend(v9, "pixelFormat") != 55)
  {
LABEL_3:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ADEspressoPCEDisparityColorInferenceDescriptor disparityOutput](self->_inferenceDesc, "disparityOutput");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PixelBufferUtils::pixelFormatAsString(objc_msgSend(v15, "pixelFormat"), (char *)&__p);
      v16 = SHIBYTE(v30);
      v17 = (void **)__p;
      v18 = objc_msgSend(v9, "pixelFormat");
      p_p = &__p;
      if (v16 < 0)
        p_p = v17;
      *(_DWORD *)buf = 136446466;
      v33 = p_p;
      v34 = 1024;
      v35 = v18;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Expected output pixelbuffer format (%{public}s) does not match provided texture format (%d)", buf, 0x12u);
      if (SHIBYTE(v30) < 0)
        operator delete(__p);

    }
LABEL_15:
    v25 = -22953;
    goto LABEL_20;
  }
  v20 = objc_msgSend(v9, "pixelFormat");
  if (v20 != objc_msgSend(v10, "pixelFormat"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 67109376;
      HIDWORD(__p) = objc_msgSend(v9, "pixelFormat");
      v28 = 1024;
      v29 = objc_msgSend(v10, "pixelFormat");
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Input texture format (%d) does not match output texture format (%d)", (uint8_t *)&__p, 0xEu);
    }
    goto LABEL_15;
  }
  -[ADPCEDisparityColorPipelineParameters outputDisparityBias](self->_pipelineParameters, "outputDisparityBias");
  v30 = v21;
  -[ADPCEDisparityColorPipeline disparityScaleForLayout:](self, "disparityScaleForLayout:", objc_msgSend(MEMORY[0x24BE05FF0], "layoutForSize:", (double)(unint64_t)objc_msgSend(v10, "width"), (double)(unint64_t)objc_msgSend(v10, "height")));
  v31 = v22;
  objc_msgSend(v8, "computeCommandEncoder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "setComputePipelineState:", self->_postprocessPipeline);
    objc_msgSend(v24, "setTexture:atIndex:", v9, 0);
    objc_msgSend(v24, "setTexture:atIndex:", v10, 1);
    objc_msgSend(v24, "setBytes:length:atIndex:", &__p, 28, 0);
    +[ADMetalUtils dispatchCommandEncoder:pipeline:width:height:](ADMetalUtils, "dispatchCommandEncoder:pipeline:width:height:", v24, self->_postprocessPipeline, objc_msgSend(v10, "width"), objc_msgSend(v10, "height"));
    objc_msgSend(v24, "endEncoding");
    v25 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed getting command encoder", buf, 2u);
    }
    v25 = -22950;
  }

LABEL_20:
  kdebug_trace();

  return v25;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

@end
