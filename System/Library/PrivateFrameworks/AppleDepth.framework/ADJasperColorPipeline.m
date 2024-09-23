@implementation ADJasperColorPipeline

- (ADJasperColorPipeline)initWithInputPrioritization:(int64_t)a3
{
  void *v5;
  ADJasperColorPipeline *v6;

  v5 = (void *)objc_opt_new();
  v6 = -[ADJasperColorPipeline initWithInputPrioritization:andParameters:](self, "initWithInputPrioritization:andParameters:", a3, v5);

  return v6;
}

- (ADJasperColorPipeline)initWithInputPrioritization:(int64_t)a3 andParameters:(id)a4
{
  id v7;
  ADJasperColorPipeline *v8;
  ADJasperColorPipeline *v9;
  id *p_pipelineParameters;
  int64_t prioritization;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  ADNetworkProvider *networkProvider;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  int v38;
  double v39;
  ADEspressoJasperColorInferenceDescriptor *v40;
  ADEspressoJasperColorInferenceDescriptor *inferenceDesc;
  void *v42;
  void *v43;
  uint64_t v44;
  ADImageDescriptor *processedDepthDesc;
  void *v46;
  void *v47;
  uint64_t v48;
  ADImageDescriptor *processedConfDesc;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  ADImageDescriptor *processedNormalsDesc;
  uint64_t v55;
  ADReprojection *depthReprojector;
  ADJasperColorPipeline *v57;
  __int16 v60;
  objc_super v61;
  int v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v7 = a4;
  v62 = 335682780;
  v63 = a3;
  v64 = 0;
  v65 = 0;
  v66 = 0;
  kdebug_trace();
  v61.receiver = self;
  v61.super_class = (Class)ADJasperColorPipeline;
  v8 = -[ADJasperColorPipeline init](&v61, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_prioritization = a3;
    p_pipelineParameters = (id *)&v8->_pipelineParameters;
    objc_storeStrong((id *)&v8->_pipelineParameters, a4);
    prioritization = v9->_prioritization;
    if (prioritization != 1 && prioritization != 4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v60 = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADJasperColorPipeline only supports speed prioritization", (uint8_t *)&v60, 2u);
      }
LABEL_23:
      v57 = 0;
      goto LABEL_24;
    }
    objc_msgSend(*p_pipelineParameters, "deviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[ADDeviceConfiguration getLidarType:](ADDeviceConfiguration, "getLidarType:", v13);

    if (v14 == 2)
      v15 = CFSTR("DARP");
    else
      v15 = CFSTR("DSD");
    +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    networkProvider = v9->_networkProvider;
    v9->_networkProvider = (ADNetworkProvider *)v16;

    if (!v9->_networkProvider)
      goto LABEL_23;
    objc_msgSend(*p_pipelineParameters, "confidenceLevelRanges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      -[ADNetworkProvider confidenceLevelRanges](v9->_networkProvider, "confidenceLevelRanges");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_pipelineParameters, "setConfidenceLevelRanges:", v19);

    }
    objc_msgSend(*p_pipelineParameters, "confidenceBucketingLowThreshold");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v60 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "pipelinePrameters.confidenceBucketingLowThreshold is deprecated. please use confidenceLevelRanges instead", (uint8_t *)&v60, 2u);
    }
    objc_msgSend(*p_pipelineParameters, "confidenceLevelRanges");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "highLevel");
    v22 = v21;

    objc_msgSend(*p_pipelineParameters, "confidenceBucketingLowThreshold");
    v24 = v23;
    objc_msgSend(*p_pipelineParameters, "confidenceLevelRanges");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = v24;
    LODWORD(v27) = v22;
    objc_msgSend(v25, "setHighLevel:", v26, v27);

    objc_msgSend(*p_pipelineParameters, "confidenceBucketingHighThreshold");
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v60 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "pipelinePrameters.confidenceBucketingHighThreshold is deprecated. please use confidenceLevelRanges instead", (uint8_t *)&v60, 2u);
    }
    objc_msgSend(*p_pipelineParameters, "confidenceLevelRanges");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lowLevel");
    v30 = v29;

    objc_msgSend(*p_pipelineParameters, "confidenceBucketingHighThreshold");
    v32 = v31;
    objc_msgSend(*p_pipelineParameters, "confidenceLevelRanges");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = v30;
    LODWORD(v35) = v32;
    objc_msgSend(v33, "setLowLevel:", v34, v35);

    objc_msgSend(*p_pipelineParameters, "confidenceLevelRanges");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "highLevel");
    objc_msgSend(*p_pipelineParameters, "setConfidenceBucketingLowThreshold:");

    objc_msgSend(*p_pipelineParameters, "confidenceLevelRanges");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "lowLevel");
    LODWORD(v39) = v38;
    objc_msgSend(*p_pipelineParameters, "setConfidenceBucketingHighThreshold:", v39);

    v40 = -[ADEspressoJasperColorInferenceDescriptor initWithNetworkProvider:]([ADEspressoJasperColorInferenceDescriptor alloc], "initWithNetworkProvider:", v9->_networkProvider);
    inferenceDesc = v9->_inferenceDesc;
    v9->_inferenceDesc = v40;

    -[ADEspressoJasperColorInferenceDescriptor depthOutput](v9->_inferenceDesc, "depthOutput");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "imageDescriptor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "cloneWithDifferentFormat:", 1717855600);
    v44 = objc_claimAutoreleasedReturnValue();
    processedDepthDesc = v9->_processedDepthDesc;
    v9->_processedDepthDesc = (ADImageDescriptor *)v44;

    -[ADEspressoJasperColorInferenceDescriptor confidenceOutput](v9->_inferenceDesc, "confidenceOutput");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "imageDescriptor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "cloneWithDifferentFormat:", 1278226534);
    v48 = objc_claimAutoreleasedReturnValue();
    processedConfDesc = v9->_processedConfDesc;
    v9->_processedConfDesc = (ADImageDescriptor *)v48;

    -[ADEspressoJasperColorInferenceDescriptor normalsOutput](v9->_inferenceDesc, "normalsOutput");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      -[ADEspressoJasperColorInferenceDescriptor normalsOutput](v9->_inferenceDesc, "normalsOutput");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "imageDescriptor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "cloneWithDifferentFormat:", 1380410945);
      v53 = objc_claimAutoreleasedReturnValue();
      processedNormalsDesc = v9->_processedNormalsDesc;
      v9->_processedNormalsDesc = (ADImageDescriptor *)v53;

    }
    v55 = objc_opt_new();
    depthReprojector = v9->_depthReprojector;
    v9->_depthReprojector = (ADReprojection *)v55;

  }
  v57 = v9;
LABEL_24:
  kdebug_trace();

  return v57;
}

- (id)LKTTexturesDescriptor
{
  int64_t prioritization;
  uint64_t v4;
  uint64_t v6;
  ADLKTTexturesDescriptor *v7;
  ADNetworkProvider *networkProvider;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[2];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  uint64_t v21;

  +[ADLKTOpticalFlow defaultConfig](ADLKTOpticalFlow, "defaultConfig");
  prioritization = self->_prioritization;
  v4 = 5;
  if (prioritization != 2)
    v4 = 6;
  if (prioritization == 1 || prioritization == 4)
    v6 = 3;
  else
    v6 = v4;
  v18 = v6;
  v7 = [ADLKTTexturesDescriptor alloc];
  networkProvider = self->_networkProvider;
  -[ADNetworkProvider bufferNameForOutputType:](networkProvider, "bufferNameForOutputType:", kADEspressoBufferIDDepth);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADEspressoJasperColorInferenceDescriptor depthOutput](self->_inferenceDesc, "depthOutput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADNetworkProvider supportedSizesForOutput:expectedPixelFormat:](networkProvider, "supportedSizesForOutput:expectedPixelFormat:", v9, objc_msgSend(v11, "pixelFormat"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v18;
  v13 = v19;
  v15[1] = v13;
  v16 = v20;
  v17 = v21;
  if (v7)
    v7 = -[ADLKTTexturesDescriptor initForSupportedSizes:config:](v7, "initForSupportedSizes:config:", v12, v15);
  else

  return v7;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (id)processedDepthOutputDescriptor
{
  return self->_processedDepthDesc;
}

- (id)processedConfidenceOutputDescriptor
{
  return self->_processedConfDesc;
}

- (id)processedNormalsOutputDescriptor
{
  return self->_processedNormalsDesc;
}

- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  int64_t v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  kdebug_trace();
  -[ADJasperColorPipelineParameters pointCloudFilter](self->_pipelineParameters, "pointCloudFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v14, a5, a6, x, y, width, height);

  kdebug_trace();
  return v15;
}

- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 depthOutput:(__CVBuffer *)a5 confidenceOutput:(__CVBuffer *)a6
{
  return -[ADJasperColorPipeline postProcessWithDepth:confidence:normals:depthOutput:confidenceOutput:normalsOutput:normalsRequiredRotation:](self, "postProcessWithDepth:confidence:normals:depthOutput:confidenceOutput:normalsOutput:normalsRequiredRotation:", a3, a4, 0, a5, a6, 0, 0);
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4
{
  int64_t v6;

  kdebug_trace();
  v6 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", a3, a4);
  kdebug_trace();
  return v6;
}

- (int64_t)postProcessConfidence:(__CVBuffer *)a3 confidenceOutput:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5
{
  void *v9;
  int64_t v10;

  kdebug_trace();
  -[ADJasperColorPipelineParameters confidenceLevelRanges](self->_pipelineParameters, "confidenceLevelRanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[ADUtils postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:](ADUtils, "postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:", a3, a4, 3, a5, v9);

  kdebug_trace();
  return v10;
}

- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 confidence:(__CVBuffer *)a4 normals:(__CVBuffer *)a5 depthOutput:(__CVBuffer *)a6 confidenceOutput:(__CVBuffer *)a7 normalsOutput:(__CVBuffer *)a8 normalsRequiredRotation:(int64_t)a9
{
  unint64_t v16;
  void *v17;
  int64_t v18;

  kdebug_trace();
  v16 = -[ADJasperColorPipelineParameters confidenceUnits](self->_pipelineParameters, "confidenceUnits");
  -[ADJasperColorPipelineParameters confidenceLevelRanges](self->_pipelineParameters, "confidenceLevelRanges");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = +[ADUtils postProcessWithDepth:confidence:normals:depthOutput:confidenceOutput:normalsOutput:normalsRotation:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:](ADUtils, "postProcessWithDepth:confidence:normals:depthOutput:confidenceOutput:normalsOutput:normalsRotation:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:", a3, a4, a5, a6, a7, a8, a9, 3, v16, v17);

  kdebug_trace();
  return v18;
}

- (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 opticalFlow:(__CVBuffer *)a5 alphaMap:(__CVBuffer *)a6 depthOutput:(__CVBuffer *)a7
{
  int64_t v13;

  kdebug_trace();
  -[ADJasperColorPipelineParameters defaultAlphaForDepthWarping](self->_pipelineParameters, "defaultAlphaForDepthWarping");
  v13 = +[ADUtils warpAndFuseWithCurrDepth:prevDepth:currNormals:prevNormals:opticalFlow:alphaMap:defaultAlpha:depthOutput:normalsOutput:](ADUtils, "warpAndFuseWithCurrDepth:prevDepth:currNormals:prevNormals:opticalFlow:alphaMap:defaultAlpha:depthOutput:normalsOutput:", a3, a4, 0, 0, a5, a6, a7, 0);
  kdebug_trace();
  return v13;
}

- (int64_t)warpAndFuseWithCurrDepth:(__CVBuffer *)a3 prevDepth:(__CVBuffer *)a4 currNormals:(__CVBuffer *)a5 prevNormals:(__CVBuffer *)a6 opticalFlow:(__CVBuffer *)a7 alphaMap:(__CVBuffer *)a8 depthOutput:(__CVBuffer *)a9 normalsOutput:(__CVBuffer *)a10
{
  int64_t v17;

  kdebug_trace();
  -[ADJasperColorPipelineParameters defaultAlphaForDepthWarping](self->_pipelineParameters, "defaultAlphaForDepthWarping");
  v17 = +[ADUtils warpAndFuseWithCurrDepth:prevDepth:currNormals:prevNormals:opticalFlow:alphaMap:defaultAlpha:depthOutput:normalsOutput:](ADUtils, "warpAndFuseWithCurrDepth:prevDepth:currNormals:prevNormals:opticalFlow:alphaMap:defaultAlpha:depthOutput:normalsOutput:", a3, a4, a5, a6, a7, a8, a9, a10);
  kdebug_trace();
  return v17;
}

- (int64_t)warpPreviousDepth:(__CVBuffer *)a3 intoCurrentDepth:(__CVBuffer *)a4 previousConfidence:(__CVBuffer *)a5 intoCurrentConfidence:(__CVBuffer *)a6 previousNormals:(__CVBuffer *)a7 intoCurrentNormals:(__CVBuffer *)a8 usingOpticalFlow:(__CVBuffer *)a9
{
  int64_t v15;
  uint64_t v17;

  LODWORD(v17) = 335680196;
  kdebug_trace();
  v15 = +[ADUtils warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingOpticalFlow:](ADUtils, "warpPreviousDepth:intoCurrentDepth:previousConfidence:intoCurrentConfidence:previousNormals:intoCurrentNormals:usingOpticalFlow:", a3, a4, a5, a6, a7, a8, a9, v17, 0, 0, 0, 0);
  kdebug_trace();
  return v15;
}

- (int64_t)fuseCurrentDepth:(__CVBuffer *)a3 previousDepth:(__CVBuffer *)a4 intoOutputDepth:(__CVBuffer *)a5 currentConfidence:(__CVBuffer *)a6 previousConfidence:(__CVBuffer *)a7 intoOutputConfidence:(__CVBuffer *)a8 currentNormals:(__CVBuffer *)a9 previousNormals:(__CVBuffer *)a10 intoOutputNormals:(__CVBuffer *)a11 usingAlpha:(__CVBuffer *)a12
{
  int v19;
  int v20;
  unint64_t v21;
  double v22;
  int64_t v23;
  uint64_t v25;

  LODWORD(v25) = 335680196;
  kdebug_trace();
  -[ADJasperColorPipelineParameters defaultAlphaForDepthWarping](self->_pipelineParameters, "defaultAlphaForDepthWarping");
  v20 = v19;
  v21 = -[ADJasperColorPipelineParameters confidenceUnits](self->_pipelineParameters, "confidenceUnits");
  LODWORD(v22) = v20;
  v23 = +[ADUtils fuseCurrentDepth:previousDepth:intoOutputDepth:currentConfidence:previousConfidence:intoOutputConfidence:currentNormals:previousNormals:intoOutputNormals:usingAlpha:defaultAlpha:confidenceUnits:](ADUtils, "fuseCurrentDepth:previousDepth:intoOutputDepth:currentConfidence:previousConfidence:intoOutputConfidence:currentNormals:previousNormals:intoOutputNormals:usingAlpha:defaultAlpha:confidenceUnits:", a3, a4, a5, a6, a7, a8, v22, a9, a10, a11, a12, v21, v25, 0, 0, 0,
          0);
  kdebug_trace();
  return v23;
}

- (uint64_t)warpPreviousDepth:(double)a3 intoCurrentDepth:(double)a4 previousConfidence:(double)a5 intoCurrentConfidence:(uint64_t)a6 previousNormals:(uint64_t)a7 intoCurrentNormals:(uint64_t)a8 usingPoseDelta:(uint64_t)a9 previousCalibration:(uint64_t)a10 currentCalibration:(uint64_t)a11
{
  id v21;
  id v22;
  uint64_t v23;

  v21 = a13;
  v22 = a14;
  kdebug_trace();
  v23 = objc_msgSend(*(id *)(a1 + 56), "updateWarpMapWithDepth:srcCalibration:dstCalibration:sourceToDestinationTransform:warpedDepth:", a7, v21, v22, a8, a2, a3, a4, a5);
  if (!v23
    && (!a9 || !a10 || (v23 = objc_msgSend(*(id *)(a1 + 56), "warpImage:intoImage:", a9, a10)) == 0)
    && (!a10 || !a11 || (v23 = objc_msgSend(*(id *)(a1 + 56), "warpImage:intoImage:", a11, a12)) == 0))
  {
    v23 = 0;
  }
  kdebug_trace();

  return v23;
}

- (ADJasperColorPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_depthReprojector, 0);
  objc_storeStrong((id *)&self->_processedNormalsDesc, 0);
  objc_storeStrong((id *)&self->_processedConfDesc, 0);
  objc_storeStrong((id *)&self->_processedDepthDesc, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

@end
