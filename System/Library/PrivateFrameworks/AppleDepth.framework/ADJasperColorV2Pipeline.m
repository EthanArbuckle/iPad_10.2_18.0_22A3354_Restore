@implementation ADJasperColorV2Pipeline

- (ADJasperColorV2Pipeline)initWithInputPrioritization:(int64_t)a3 espressoEngine:(unint64_t)a4
{
  return -[ADJasperColorV2Pipeline initWithInputPrioritization:espressoEngine:andParameters:](self, "initWithInputPrioritization:espressoEngine:andParameters:", a3, a4, 0);
}

- (ADJasperColorV2Pipeline)initWithInputPrioritization:(int64_t)a3 espressoEngine:(unint64_t)a4 andParameters:(id)a5
{
  id v8;
  ADJasperColorV2Pipeline *v9;
  ADJasperColorV2PipelineParameters *v10;
  ADJasperColorV2PipelineParameters *pipelineParameters;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  ADNetworkProvider *networkProvider;
  ADEspressoJasperColorV2InferenceDescriptor *v18;
  ADEspressoJasperColorV2InferenceDescriptor *inferenceDesc;
  ADJasperColorV2Pipeline *v20;
  objc_super v22;
  int v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v23 = 335684564;
  v24 = a3;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  kdebug_trace();
  v22.receiver = self;
  v22.super_class = (Class)ADJasperColorV2Pipeline;
  v9 = -[ADJasperColorV2Pipeline init](&v22, sel_init);
  if (!v9)
    goto LABEL_18;
  if (v8)
    v10 = (ADJasperColorV2PipelineParameters *)v8;
  else
    v10 = (ADJasperColorV2PipelineParameters *)objc_opt_new();
  pipelineParameters = v9->_pipelineParameters;
  v9->_pipelineParameters = v10;

  -[ADPipelineParameters deviceName](v9->_pipelineParameters, "deviceName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[ADDeviceConfiguration getLidarType:](ADDeviceConfiguration, "getLidarType:", v12);

  if (v13 == 2)
  {
    if (a3 != 2)
    {
      if (a3 == 3)
      {
        v14 = CFSTR("D3PQuality");
        goto LABEL_16;
      }
LABEL_12:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        +[ADUtils prioritizationAsString:](ADUtils, "prioritizationAsString:", a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v15;
        _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "did not find network for pipeline ADJasperColorV2Pipeline prioritization %@", buf, 0xCu);

      }
      goto LABEL_19;
    }
    v14 = CFSTR("D3PBalanced");
  }
  else if (a3 == 2)
  {
    v14 = CFSTR("DAPIBalanced");
  }
  else
  {
    if (a3 != 3)
      goto LABEL_12;
    v14 = CFSTR("DAPIQuality");
  }
LABEL_16:
  -[ADJasperColorV2PipelineParameters uncertaintyThreshold](v9->_pipelineParameters, "uncertaintyThreshold");
  +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", v14);
  v16 = objc_claimAutoreleasedReturnValue();
  networkProvider = v9->_networkProvider;
  v9->_networkProvider = (ADNetworkProvider *)v16;

  if (!v9->_networkProvider)
  {
LABEL_19:
    v20 = 0;
    goto LABEL_20;
  }
  v18 = -[ADEspressoJasperColorV2InferenceDescriptor initWithNetworkProvider:espressoEngine:lidarType:]([ADEspressoJasperColorV2InferenceDescriptor alloc], "initWithNetworkProvider:espressoEngine:lidarType:", v9->_networkProvider, a4, v13);
  inferenceDesc = v9->_inferenceDesc;
  v9->_inferenceDesc = v18;

LABEL_18:
  v20 = v9;
LABEL_20:
  kdebug_trace();

  return v20;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6 filteredPoints:(id *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  __CVBuffer *v16;
  void *v17;
  void *v18;
  int64_t v19;
  uint8_t v21[8];
  int v22;
  __int128 v23;
  __int128 v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a3;
  v22 = 335679632;
  v23 = 0u;
  v24 = 0u;
  kdebug_trace();
  if (a6)
  {
    if (v15)
    {
      -[ADJasperColorV2PipelineParameters pointCloudFilter](self->_pipelineParameters, "pointCloudFilter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pointCloudByApplyingFilter:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (a7)
        *a7 = objc_retainAutorelease(v18);
      v19 = objc_msgSend(v18, "projectJasperPointsCroppedBy:rotatedBy:andScaledInto:", a5, a6, x, y, width, height);
      v15 = v18;
    }
    else
    {
      PixelBufferUtils::blacken(a6, v16);
      v19 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Output buffer must not be nil", v21, 2u);
    }
    v19 = -22953;
  }
  kdebug_trace();

  return v19;
}

- (uint64_t)changePointCloudPOV:(double)a3 targetCamera:(double)a4 jasperToCameraTransform:(uint64_t)a5 outputPointCloud:(uint64_t)a6
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
  v22 = 335679632;
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

- (int64_t)postProcessDepth:(__CVBuffer *)a3 uncertainty:(__CVBuffer *)a4 filteredPointCloud:(id)a5 outputDepth:(__CVBuffer *)a6 outputUncertainty:(__CVBuffer *)a7 depthRoi:(CGRect)a8
{
  double height;
  double width;
  double y;
  double x;
  size_t v16;
  size_t v17;
  size_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  NSObject *v22;
  const char *v23;
  int64_t v24;
  unint64_t v26;
  PixelBufferUtils *v27;
  unint64_t v28;
  PixelBufferUtils *v29;
  BOOL v30;
  char v31;
  _BYTE *v32;
  unint64_t v33;
  void **v34;
  NSObject *v35;
  const char *v36;
  _BYTE *v37;
  unint64_t v38;
  void **v39;
  int v40;
  _BYTE *v41;
  _BYTE *v42;
  void **v43;
  OSType v44;
  OSType PixelFormatType;
  id v47;
  void *__p[2];
  char v49;
  int v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[4];
  _BYTE *v54;
  __int16 v55;
  void **v56;
  _BYTE buf[12];
  __int16 v58;
  size_t v59;
  __int16 v60;
  __CVBuffer *v61;
  __int16 v62;
  double v63;
  __int16 v64;
  size_t v65;
  __int16 v66;
  size_t v67;
  uint64_t v68;
  CGRect v69;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v68 = *MEMORY[0x24BDAC8D0];
  v47 = a5;
  v50 = 335687404;
  v51 = 0u;
  v52 = 0u;
  kdebug_trace();
  if (!a3 || !a4 || !a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = a3;
      v58 = 2048;
      v59 = (size_t)a4;
      v60 = 2048;
      v61 = a6;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Function arguments depth, uncertainty, outputDepth must not be nil (%p,%p,%p)", buf, 0x20u);
    }
    v24 = -22953;
    goto LABEL_28;
  }
  v16 = CVPixelBufferGetWidth(a3);
  v17 = CVPixelBufferGetHeight(a3);
  v18 = CVPixelBufferGetWidth(a4);
  v19 = CVPixelBufferGetHeight(a4);
  v20 = CVPixelBufferGetWidth(a6);
  v21 = CVPixelBufferGetHeight(a6);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v44 = CVPixelBufferGetPixelFormatType(a6);
  if (v17 != v19 || v16 != v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = v16;
      v58 = 2048;
      v59 = v17;
      v60 = 2048;
      v61 = (__CVBuffer *)v18;
      v62 = 2048;
      v63 = *(double *)&v19;
      v22 = MEMORY[0x24BDACB70];
      v23 = "Depth dimensions (%lu,%lu) do not match uncertainty dimensions (%lu,%lu)";
      goto LABEL_22;
    }
LABEL_27:
    v24 = -22957;
    goto LABEL_28;
  }
  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = width;
  v69.size.height = height;
  if (CGRectIsEmpty(v69))
  {
    x = *MEMORY[0x24BDBEFB0];
    y = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    width = (double)CVPixelBufferGetWidth(a3);
    height = (double)CVPixelBufferGetHeight(a3);
  }
  if (width > (double)v20 || height > (double)v21)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = v20;
      v58 = 2048;
      v59 = v21;
      v60 = 2048;
      v61 = *(__CVBuffer **)&width;
      v62 = 2048;
      v63 = height;
      v22 = MEMORY[0x24BDACB70];
      v23 = "Output depth dimensions (%lu,%lu) are smaller than ROI (%f,%f)";
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  if (a7 && (width > (double)CVPixelBufferGetWidth(a7) || height > (double)CVPixelBufferGetHeight(a7)))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      *(_QWORD *)&buf[4] = CVPixelBufferGetWidth(a7);
      v58 = 2048;
      v59 = CVPixelBufferGetHeight(a7);
      v60 = 2048;
      v61 = *(__CVBuffer **)&width;
      v62 = 2048;
      v63 = height;
      v22 = MEMORY[0x24BDACB70];
      v23 = "Output uncertainty dimensions (%lu,%lu) are smaller than ROI (%f,%f)";
LABEL_22:
      _os_log_error_impl(&dword_20B62B000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x2Au);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (x + width > (double)v16 || y + height > (double)v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219264;
      *(double *)&buf[4] = x;
      v58 = 2048;
      v59 = *(_QWORD *)&y;
      v60 = 2048;
      v61 = *(__CVBuffer **)&width;
      v62 = 2048;
      v63 = height;
      v64 = 2048;
      v65 = v16;
      v66 = 2048;
      v67 = v17;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ROI (%f,%f,%f,%f) does not fit into depth image (%lu,%lu)", buf, 0x3Eu);
    }
    goto LABEL_27;
  }
  v26 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)PixelFormatType, 0);
  v27 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a4);
  if (v26 != PixelBufferUtils::pixelSizeForPixelFormat(v27, 0))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    v32 = buf;
    PixelBufferUtils::pixelFormatAsString(PixelFormatType, buf);
    if (v60 < 0)
      v32 = *(_BYTE **)buf;
    v33 = CVPixelBufferGetPixelFormatType(a4);
    PixelBufferUtils::pixelFormatAsString(v33, (char *)__p);
    if (v49 >= 0)
      v34 = __p;
    else
      v34 = (void **)__p[0];
    *(_DWORD *)v53 = 136315394;
    v54 = v32;
    v55 = 2080;
    v56 = v34;
    v35 = MEMORY[0x24BDACB70];
    v36 = "Input depth (%s) and uncertainty (%s) bits per pixel do not match";
LABEL_54:
    _os_log_error_impl(&dword_20B62B000, v35, OS_LOG_TYPE_ERROR, v36, v53, 0x16u);
    if (v49 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v60) < 0)
      operator delete(*(void **)buf);
    goto LABEL_27;
  }
  if (a7)
  {
    v28 = PixelBufferUtils::pixelSizeForPixelFormat((PixelBufferUtils *)v44, 0);
    v29 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a7);
    if (v28 != PixelBufferUtils::pixelSizeForPixelFormat(v29, 0))
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v37 = buf;
      PixelBufferUtils::pixelFormatAsString(v44, buf);
      if (v60 < 0)
        v37 = *(_BYTE **)buf;
      v38 = CVPixelBufferGetPixelFormatType(a7);
      PixelBufferUtils::pixelFormatAsString(v38, (char *)__p);
      if (v49 >= 0)
        v39 = __p;
      else
        v39 = (void **)__p[0];
      *(_DWORD *)v53 = 136315394;
      v54 = v37;
      v55 = 2080;
      v56 = v39;
      v35 = MEMORY[0x24BDACB70];
      v36 = "Output depth (%s) and uncertainty (%s) bits per pixel do not match";
      goto LABEL_54;
    }
  }
  v30 = -[ADJasperColorV2PipelineParameters outputHighConfidencePixelsOnly](self->_pipelineParameters, "outputHighConfidencePixelsOnly");
  if (a7)
    v31 = 1;
  else
    v31 = v30;
  if ((v31 & 1) == 0)
  {
    v24 = +[ADUtils postProcessDepth:depthOutput:inputRoi:](ADUtils, "postProcessDepth:depthOutput:inputRoi:", a3, a6, x, y, width, height);
    goto LABEL_28;
  }
  if (PixelFormatType == 1717855600 && v44 == 1717855600)
  {
    filterDepthAndUncertainty<float,float,false>(a3, a4, a6, a7, v47, self, x, y, width, height);
LABEL_79:
    v24 = 0;
    goto LABEL_28;
  }
  if (PixelFormatType == 1717855600 && v44 == 1751410032)
  {
    filterDepthAndUncertainty<float,half,false>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1717855600 && v44 == 1717856627)
  {
    filterDepthAndUncertainty<float,float,true>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1717855600 && v44 == 1751411059)
  {
    filterDepthAndUncertainty<float,half,true>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1751410032 && v44 == 1717855600)
  {
    filterDepthAndUncertainty<half,float,false>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1751410032 && v44 == 1751410032)
  {
    filterDepthAndUncertainty<half,half,false>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1751410032 && v44 == 1717856627)
  {
    filterDepthAndUncertainty<half,float,true>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (PixelFormatType == 1751410032 && v44 == 1751411059)
  {
    filterDepthAndUncertainty<half,half,true>(a3, a4, a6, a7, v47, self, x, y, width, height);
    goto LABEL_79;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    PixelBufferUtils::pixelFormatAsString(PixelFormatType, buf);
    v40 = SHIBYTE(v60);
    v41 = *(_BYTE **)buf;
    PixelBufferUtils::pixelFormatAsString(v44, (char *)__p);
    v42 = buf;
    if (v40 < 0)
      v42 = v41;
    if (v49 >= 0)
      v43 = __p;
    else
      v43 = (void **)__p[0];
    *(_DWORD *)v53 = 136315394;
    v54 = v42;
    v55 = 2080;
    v56 = v43;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported input (%s) and output (%s) formats combination", v53, 0x16u);
    if (v49 < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v60) < 0)
      operator delete(*(void **)buf);
  }
  v24 = -22956;
LABEL_28:
  kdebug_trace();

  return v24;
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 output:(__CVBuffer *)a4
{
  return -[ADJasperColorV2Pipeline postProcessDepth:output:depthRoi:](self, "postProcessDepth:output:depthRoi:", a3, a4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 output:(__CVBuffer *)a4 depthRoi:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  int64_t v11;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  kdebug_trace();
  v11 = +[ADUtils postProcessDepth:depthOutput:inputRoi:](ADUtils, "postProcessDepth:depthOutput:inputRoi:", a3, a4, x, y, width, height);
  kdebug_trace();
  return v11;
}

- (int64_t)postProcessUncertainty:(__CVBuffer *)a3 outputConfidence:(__CVBuffer *)a4 confidenceUnits:(unint64_t)a5
{
  int64_t v8;

  kdebug_trace();
  v8 = +[ADUtils postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:](ADUtils, "postProcessConfidence:confidenceOutput:rawConfidenceUnits:outConfidenceUnits:confidenceLevelRanges:", a3, a4, 3, a5, 0);
  kdebug_trace();
  return v8;
}

- (ADJasperColorV2PipelineParameters)pipelineParameters
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
