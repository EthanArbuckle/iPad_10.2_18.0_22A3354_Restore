@implementation BWVideoDepthInferenceConfiguration

- ($2825F4736939C4A6D3AD43837233062D)inputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_inputDimensions;
}

- (unsigned)featuresPixelFormat
{
  return self->_featuresPixelFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)featuresDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_featuresDimensions;
}

- (unsigned)temporalDepthInputPixelFormat
{
  return self->_temporalDepthInputPixelFormat;
}

- (BOOL)sourceIsNuri
{
  return self->_sourceIsNuri;
}

- (float)networkBias
{
  return self->_networkBias;
}

- (MTLEvent)backpressureEvent
{
  return self->_backpressureEvent;
}

- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 requiresCroppingOfDepthBuffer:(BOOL)a6 requiresVerticalFlipOfDepthBuffer:(BOOL)a7 backpressureEvent:(id)a8
{
  BWVideoDepthInferenceConfiguration *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  float v24;
  int v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  ADEspressoStereoV2InferenceDescriptor *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float v46;
  NSString *v47;
  BOOL v49;
  BOOL v50;
  id v51;
  unint64_t v52;
  NSString *v53;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)BWVideoDepthInferenceConfiguration;
  v14 = -[BWInferenceConfiguration initWithInferenceType:](&v60, sel_initWithInferenceType_, 109);
  if (!v14)
    return v14;
  v51 = a8;
  v52 = a3;
  v49 = a6;
  v50 = a7;
  v14->_cameraInfoByPortType = (NSDictionary *)(id)objc_msgSend(a5, "cameraInfoByPortType");
  v14->_videoDepthAlgorithm = -1;
  v55 = a5;
  v14->_portType = 0;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v15 = (void *)objc_msgSend(a5, "activePortTypes");
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (!v16)
  {
    v21 = -1;
    goto LABEL_21;
  }
  v17 = v16;
  v18 = *(_QWORD *)v57;
  v19 = *MEMORY[0x1E0D05A30];
  v20 = *MEMORY[0x1E0D05A28];
  v53 = (NSString *)*MEMORY[0x1E0D05A18];
  v54 = *MEMORY[0x1E0D05A40];
  v21 = -1;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v57 != v18)
        objc_enumerationMutation(v15);
      v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      if ((objc_msgSend(v23, "isEqual:", v19) & 1) != 0)
      {
        v25 = 0;
        v21 = 1;
        goto LABEL_20;
      }
      if (!objc_msgSend(v23, "isEqual:", v20))
      {
        if ((objc_msgSend(v23, "isEqual:", v54) & 1) == 0)
          continue;
        v25 = 2;
        v21 = 2;
LABEL_20:
        v14->_videoDepthAlgorithm = v25;
        v14->_portType = (NSString *)v23;
        goto LABEL_21;
      }
      v14->_videoDepthAlgorithm = 1;
      objc_msgSend((id)objc_msgSend(v55, "zoomCommandHandler"), "requestedZoomFactorWithoutFudge");
      if (v24 == 4.0)
      {
        v14->_videoDepthAlgorithm = 3;
        v21 = 3;
      }
      else
      {
        v21 = 0;
      }
      v14->_portType = v53;
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v17)
      continue;
    break;
  }
LABEL_21:
  if (a4 == 1)
  {
    v28 = 1;
    v26 = v52;
    v27 = v55;
LABEL_25:
    if (objc_msgSend(v27, "depthType") == 3)
    {
      v29 = (id)objc_msgSend(objc_alloc((Class)getADStereoV2PipelineParametersClass()), "init");
      v30 = (ADEspressoStereoV2InferenceDescriptor *)(id)objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADStereoV2PipelineClass()), "initWithParameters:", v29), "inferenceDescriptor");
      v14->_stereoV2inferenceDescriptor = v30;
      objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor disparityOutput](v30, "disparityOutput"), "imageDescriptor"), "sizeForLayout:", 255);
      v14->_inputDimensions.width = (int)v31;
      v14->_inputDimensions.height = (int)v32;
      v14->_outputDimensions.width = (int)v31;
      v14->_outputDimensions.height = (int)v32;
      v14->_outputPixelFormat = objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor disparityOutput](v14->_stereoV2inferenceDescriptor, "disparityOutput"), "imageDescriptor"), "pixelFormat");
      v33 = (void *)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor depthFeaturesOutput](v14->_stereoV2inferenceDescriptor, "depthFeaturesOutput"), "imageDescriptor");
      objc_msgSend(v33, "sizeForLayout:", 255);
      v14->_featuresDimensions.width = (int)v34;
      v14->_featuresDimensions.height = (int)v35;
      v14->_featuresPixelFormat = objc_msgSend(v33, "pixelFormat");
    }
    else
    {
      v36 = (id)objc_msgSend(objc_alloc((Class)getADPCEDisparityColorPipelineClass()), "initForInputSource:metalDevice:", v21, 0);
      v37 = (void *)objc_msgSend(v36, "inferenceDescriptor");
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "disparityInput"), "imageDescriptor"), "sizeForLayout:", v28);
      v39 = v38;
      v41 = v40;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "disparityOutput"), "imageDescriptor"), "sizeForLayout:", v28);
      v14->_inputDimensions.width = (int)v39;
      v14->_inputDimensions.height = (int)v41;
      v14->_outputDimensions.width = (int)v42;
      v14->_outputDimensions.height = (int)v43;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "featuresOutput"), "imageDescriptor"), "sizeForLayout:", v28);
      v14->_featuresDimensions.width = (int)v44;
      v14->_featuresDimensions.height = (int)v45;
      v14->_featuresPixelFormat = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "featuresOutput"), "imageDescriptor"), "pixelFormat");
      v14->_temporalDepthInputPixelFormat = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "prevDisparityInput"), "imageDescriptor"), "pixelFormat");
      objc_msgSend((id)objc_msgSend(v36, "pipelineParameters"), "outputDisparityBias");
      v14->_networkBias = v46;
    }
    v47 = v14->_portType;
    v14->_concurrencyWidth = v26;
    v14->_videoDepthLayout = a4;
    v14->_requiresAppleDepthPostProcessing = 0;
    v14->_requiresCroppingOfDepthBuffer = v49;
    v14->_requiresVerticalFlipOfDepthBuffer = v50;
    v14->_backpressureEvent = (MTLEvent *)v51;
  }
  else
  {
    v26 = v52;
    v27 = v55;
    if (!a4)
    {
      v28 = 3;
      goto LABEL_25;
    }
    return 0;
  }
  return v14;
}

- (unint64_t)concurrencyWidth
{
  return self->_concurrencyWidth;
}

- (int)videoDepthAlgorithm
{
  return self->_videoDepthAlgorithm;
}

- (BOOL)requiresVerticalFlipOfDepthBuffer
{
  return self->_requiresVerticalFlipOfDepthBuffer;
}

- (BOOL)requiresCroppingOfDepthBuffer
{
  return self->_requiresCroppingOfDepthBuffer;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (BOOL)requiresAppleDepthPostProcessing
{
  return self->_requiresAppleDepthPostProcessing;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setSourceIsNuri:(BOOL)a3
{
  self->_sourceIsNuri = a3;
}

- (void)setRequiresAppleDepthPostProcessing:(BOOL)a3
{
  self->_requiresAppleDepthPostProcessing = a3;
}

- (int)videoDepthLayout
{
  return self->_videoDepthLayout;
}

- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 backpressureEvent:(id)a6
{
  return -[BWVideoDepthInferenceConfiguration initWithConcurrencyWidth:videoDepthLayout:captureDevice:requiresCroppingOfDepthBuffer:requiresVerticalFlipOfDepthBuffer:backpressureEvent:](self, "initWithConcurrencyWidth:videoDepthLayout:captureDevice:requiresCroppingOfDepthBuffer:requiresVerticalFlipOfDepthBuffer:backpressureEvent:", a3, *(_QWORD *)&a4, a5, 0, 0, a6);
}

- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 overrideOutputDimensions:(id)a6 backpressureEvent:(id)a7
{
  BWVideoDepthInferenceConfiguration *result;

  result = -[BWVideoDepthInferenceConfiguration initWithConcurrencyWidth:videoDepthLayout:captureDevice:backpressureEvent:](self, "initWithConcurrencyWidth:videoDepthLayout:captureDevice:backpressureEvent:", a3, *(_QWORD *)&a4, a5, a7);
  if (result)
    result->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a6;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoDepthInferenceConfiguration;
  -[BWInferenceConfiguration dealloc](&v3, sel_dealloc);
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (ADEspressoStereoV2InferenceDescriptor)stereoV2inferenceDescriptor
{
  return self->_stereoV2inferenceDescriptor;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

@end
