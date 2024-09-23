@implementation ADDensifiedLiDARFocusAssistPipeline

- (ADDensifiedLiDARFocusAssistPipeline)init
{
  uint64_t v3;

  if (objc_msgSend(MEMORY[0x24BE086D8], "hasANE"))
    v3 = 4;
  else
    v3 = 0;
  return -[ADDensifiedLiDARFocusAssistPipeline initWithEspressoEngine:](self, "initWithEspressoEngine:", v3);
}

- (ADDensifiedLiDARFocusAssistPipeline)initWithEspressoEngine:(unint64_t)a3
{
  void *v5;
  ADDensifiedLiDARFocusAssistPipeline *v6;

  v5 = (void *)objc_opt_new();
  v6 = -[ADDensifiedLiDARFocusAssistPipeline initWithEspressoEngine:andParameters:](self, "initWithEspressoEngine:andParameters:", a3, v5);

  return v6;
}

- (ADDensifiedLiDARFocusAssistPipeline)initWithEspressoEngine:(unint64_t)a3 andParameters:(id)a4
{
  id v7;
  ADDensifiedLiDARFocusAssistPipeline *v8;
  uint64_t v9;
  ADNetworkProvider *networkProvider;
  ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor *v11;
  ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor *inferenceDesc;
  ADDensifiedLiDARFocusAssistPipeline *v13;
  objc_super v15;
  int v16;
  __int128 v17;
  __int128 v18;

  v7 = a4;
  v16 = 335680992;
  v17 = 0u;
  v18 = 0u;
  kdebug_trace();
  v15.receiver = self;
  v15.super_class = (Class)ADDensifiedLiDARFocusAssistPipeline;
  v8 = -[ADDensifiedLiDARFocusAssistPipeline init](&v15, sel_init);
  if (v8)
  {
    +[ADNetworkProvider providerForNetwork:espressoEngine:](ADNetworkProvider, "providerForNetwork:espressoEngine:", CFSTR("TeleAFNet"), a3);
    v9 = objc_claimAutoreleasedReturnValue();
    networkProvider = v8->_networkProvider;
    v8->_networkProvider = (ADNetworkProvider *)v9;

    if (!v8->_networkProvider)
    {
      v13 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v8->_pipelineParameters, a4);
    v11 = -[ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor initWithNetworkProvider:espressoEngine:]([ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor alloc], "initWithNetworkProvider:espressoEngine:", v8->_networkProvider, a3);
    inferenceDesc = v8->_inferenceDesc;
    v8->_inferenceDesc = v11;

  }
  v13 = v8;
LABEL_6:
  kdebug_trace();

  return v13;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (int64_t)projectLidarPoints:(id)a3 crop:(CGRect)a4 projectedPointsBuffer:(__CVBuffer *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  NSObject *v12;
  const char *v13;
  int64_t v14;
  void *v15;
  uint8_t v17[8];
  int v18;
  __int128 v19;
  __int128 v20;
  CGRect v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v18 = 335683544;
  v19 = 0u;
  v20 = 0u;
  kdebug_trace();
  if (a5)
  {
    if (v11)
    {
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      if (!CGRectIsEmpty(v21))
      {
        -[ADDensifiedLiDARFocusAssistPipelineParameters pointCloudFilter](self->_pipelineParameters, "pointCloudFilter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v15, 0, a5, x, y, width, height);

        goto LABEL_11;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        v12 = MEMORY[0x24BDACB70];
        v13 = "Must provide a valid crop rect";
LABEL_13:
        _os_log_error_impl(&dword_20B62B000, v12, OS_LOG_TYPE_ERROR, v13, v17, 2u);
        v14 = -22953;
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      v12 = MEMORY[0x24BDACB70];
      v13 = "point cloud must not be nil";
      goto LABEL_13;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    v12 = MEMORY[0x24BDACB70];
    v13 = "Output buffer must not be nil";
    goto LABEL_13;
  }
  v14 = -22953;
LABEL_11:
  kdebug_trace();

  return v14;
}

- (uint64_t)changePointCloudPOV:(double)a3 targetCamera:(double)a4 lidarToCameraTransform:(uint64_t)a5 outputPointCloud:(uint64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint8_t buf[8];
  int v22;
  __int128 v23;
  __int128 v24;

  v11 = a7;
  v12 = a8;
  v13 = a9;
  v22 = 335683544;
  v23 = 0u;
  v24 = 0u;
  kdebug_trace();
  if (v11 && v13)
  {
    objc_msgSend(v11, "pointCloudByChangingPointOfViewByTransform:to:", v12, a1, a2, a3, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v13, "appendPointsFrom:", v14);
      v15 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed changing point cloud POV", buf, 2u);
      }
      v15 = -22950;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Jasper inputs/outputs must not be nil", buf, 2u);
    }
    v15 = -22953;
  }
  kdebug_trace();

  return v15;
}

- (int64_t)postProcessUncertainty:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5
{
  int64_t v8;

  kdebug_trace();
  v8 = +[ADUtils postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:](ADUtils, "postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:", a3, a4, 3, a5, 0);
  kdebug_trace();
  return v8;
}

- (ADDensifiedLiDARFocusAssistPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

@end
