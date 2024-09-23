@implementation FigCaptureBaseStillImageSinkPipelineConfiguration

- (BOOL)clientIsCameraOrDerivative
{
  return self->_clientIsCameraOrDerivative;
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (void)setUsesHighEncodingPriority:(BOOL)a3
{
  self->_usesHighEncodingPriority = a3;
}

- (void)setStillImageStabilizationSupported:(BOOL)a3
{
  self->_stillImageStabilizationSupported = a3;
}

- (void)setSinkConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setPortraitEffectsMatteMainImageDownscalingFactor:(float)a3
{
  self->_portraitEffectsMatteMainImageDownscalingFactor = a3;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (void)setNoiseReductionAndFusionScheme:(int)a3
{
  self->_noiseReductionAndFusionScheme = a3;
}

- (void)setMotionAttachmentsSource:(int)a3
{
  self->_motionAttachmentsSource = a3;
}

- (void)setMaxSupportedFrameRate:(float)a3
{
  self->_maxSupportedFrameRate = a3;
}

- (void)setInputIs10Bit:(BOOL)a3
{
  self->_inputIs10Bit = a3;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (void)setDepthDataDimensions:(id)a3
{
  self->_depthDataDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setClientIsCameraOrDerivative:(BOOL)a3
{
  self->_clientIsCameraOrDerivative = a3;
}

- (void)setAllowsMultipleInflightCaptures:(BOOL)a3
{
  self->_allowsMultipleInflightCaptures = a3;
}

- (void)setAllowedToModifyInputBuffers:(BOOL)a3
{
  self->_allowedToModifyInputBuffers = a3;
}

- (FigCaptureSinkConfiguration)sinkConfiguration
{
  return self->_sinkConfiguration;
}

- (BOOL)cinematicFramingWarpingRequired
{
  return self->_cinematicFramingWarpingRequired;
}

- (BOOL)usesHighEncodingPriority
{
  return self->_usesHighEncodingPriority;
}

- (void)setCinematicFramingWarpingRequired:(BOOL)a3
{
  self->_cinematicFramingWarpingRequired = a3;
}

- (float)portraitEffectsMatteMainImageDownscalingFactor
{
  return self->_portraitEffectsMatteMainImageDownscalingFactor;
}

- ($2825F4736939C4A6D3AD43837233062D)depthDataDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_depthDataDimensions;
}

- (int)noiseReductionAndFusionScheme
{
  return self->_noiseReductionAndFusionScheme;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (BOOL)stillImageStabilizationSupported
{
  return self->_stillImageStabilizationSupported;
}

- (int)outputColorSpaceProperties
{
  return self->_outputColorSpaceProperties;
}

- (BOOL)inputIs10Bit
{
  return self->_inputIs10Bit;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (BOOL)allowsMultipleInflightCaptures
{
  return self->_allowsMultipleInflightCaptures;
}

- (BOOL)allowedToModifyInputBuffers
{
  return self->_allowedToModifyInputBuffers;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureBaseStillImageSinkPipelineConfiguration;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureIrisSinkConfiguration)irisSinkConfiguration
{
  if (-[FigCaptureSinkConfiguration sinkType](self->_sinkConfiguration, "sinkType") == 10)
    return (FigCaptureIrisSinkConfiguration *)self->_sinkConfiguration;
  else
    return 0;
}

- (FigCaptureBaseStillImageSinkPipelineConfiguration)initWithCoder:(id)a3
{
  FigCaptureBaseStillImageSinkPipelineConfiguration *v4;
  float v5;
  float v6;

  v4 = -[FigCaptureBaseStillImageSinkPipelineConfiguration init](self, "init");
  if (v4)
  {
    v4->_allowsMultipleInflightCaptures = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowsMultipleInflightCaptures"));
    v4->_clientIsCameraOrDerivative = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("clientIsCameraOrDerivative"));
    v4->_allowedToModifyInputBuffers = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowedToModifyInputBuffers"));
    v4->_inputIs10Bit = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("inputIs10Bit"));
    v4->_horizontalSensorBinningFactor = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("horizontalSensorBinningFactor"));
    v4->_verticalSensorBinningFactor = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("verticalSensorBinningFactor"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("maxSupportedFrameRate"));
    v4->_maxSupportedFrameRate = v5;
    v4->_motionAttachmentsSource = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("motionAttachmentsSource"));
    v4->_sinkConfiguration = (FigCaptureSinkConfiguration *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sinkConfiguration"));
    v4->_usesHighEncodingPriority = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("usesHighEncodingPriority"));
    v4->_outputPixelFormat = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputPixelFormat"));
    v4->_outputColorSpaceProperties = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("outputColorSpacePropertiesKey"));
    v4->_stillImageStabilizationSupported = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("stillImageStabilizationSupported"));
    v4->_noiseReductionAndFusionScheme = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("noiseReductionAndFusionScheme"));
    v4->_depthDataDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("depthDataDimensionsWidth"));
    v4->_depthDataDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("depthDataDimensionsHeight"));
    objc_msgSend(a3, "decodeFloatForKey:", CFSTR("portraitEffectsMatteMainImageDownscalingFactor"));
    v4->_portraitEffectsMatteMainImageDownscalingFactor = v6;
    v4->_cinematicFramingWarpingRequired = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("cinematicFramingWarpingRequiredKey"));
    v4->_cinematicFramingWarpingOutputDimensions.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("cinematicFramingWarpingOutputDimensionsWidth"));
    v4->_cinematicFramingWarpingOutputDimensions.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("cinematicFramingWarpingOutputDimensionsHeight"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  double v6;

  objc_msgSend(a3, "encodeBool:forKey:", self->_allowsMultipleInflightCaptures, CFSTR("allowsMultipleInflightCaptures"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_clientIsCameraOrDerivative, CFSTR("clientIsCameraOrDerivative"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_allowedToModifyInputBuffers, CFSTR("allowedToModifyInputBuffers"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_inputIs10Bit, CFSTR("inputIs10Bit"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_horizontalSensorBinningFactor, CFSTR("horizontalSensorBinningFactor"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_verticalSensorBinningFactor, CFSTR("verticalSensorBinningFactor"));
  *(float *)&v5 = self->_maxSupportedFrameRate;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("maxSupportedFrameRate"), v5);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_motionAttachmentsSource, CFSTR("motionAttachmentsSource"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sinkConfiguration, CFSTR("sinkConfiguration"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_usesHighEncodingPriority, CFSTR("usesHighEncodingPriority"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputPixelFormat, CFSTR("outputPixelFormat"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_outputColorSpaceProperties, CFSTR("outputColorSpacePropertiesKey"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_stillImageStabilizationSupported, CFSTR("stillImageStabilizationSupported"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_noiseReductionAndFusionScheme, CFSTR("noiseReductionAndFusionScheme"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_depthDataDimensions.width, CFSTR("depthDataDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_depthDataDimensions.height, CFSTR("depthDataDimensionsHeight"));
  *(float *)&v6 = self->_portraitEffectsMatteMainImageDownscalingFactor;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("portraitEffectsMatteMainImageDownscalingFactor"), v6);
  objc_msgSend(a3, "encodeBool:forKey:", self->_cinematicFramingWarpingRequired, CFSTR("cinematicFramingWarpingRequiredKey"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_cinematicFramingWarpingOutputDimensions.width, CFSTR("cinematicFramingWarpingOutputDimensionsWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_cinematicFramingWarpingOutputDimensions.height, CFSTR("cinematicFramingWarpingOutputDimensionsHeight"));
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  float v19;
  float v20;
  float v21;
  int v22;
  FigCaptureSinkConfiguration *v23;
  _BOOL4 v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  unint64_t v31;
  float v32;
  float v33;
  float v34;
  int v35;
  int v36;
  unint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if (a3 == self)
  {
    LOBYTE(v24) = 1;
    return v24;
  }
  v39 = v9;
  v40 = v5;
  v41 = v4;
  v42 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  v13 = -[FigCaptureBaseStillImageSinkPipelineConfiguration allowsMultipleInflightCaptures](self, "allowsMultipleInflightCaptures");
  if (v13 != objc_msgSend(a3, "allowsMultipleInflightCaptures"))
    goto LABEL_24;
  v14 = -[FigCaptureBaseStillImageSinkPipelineConfiguration clientIsCameraOrDerivative](self, "clientIsCameraOrDerivative");
  if (v14 != objc_msgSend(a3, "clientIsCameraOrDerivative"))
    goto LABEL_24;
  v15 = -[FigCaptureBaseStillImageSinkPipelineConfiguration allowedToModifyInputBuffers](self, "allowedToModifyInputBuffers");
  if (v15 != objc_msgSend(a3, "allowedToModifyInputBuffers"))
    goto LABEL_24;
  v16 = -[FigCaptureBaseStillImageSinkPipelineConfiguration inputIs10Bit](self, "inputIs10Bit");
  if (v16 != objc_msgSend(a3, "inputIs10Bit"))
    goto LABEL_24;
  v17 = -[FigCaptureBaseStillImageSinkPipelineConfiguration horizontalSensorBinningFactor](self, "horizontalSensorBinningFactor");
  if (v17 != objc_msgSend(a3, "horizontalSensorBinningFactor"))
    goto LABEL_24;
  v18 = -[FigCaptureBaseStillImageSinkPipelineConfiguration verticalSensorBinningFactor](self, "verticalSensorBinningFactor");
  if (v18 != objc_msgSend(a3, "verticalSensorBinningFactor"))
    goto LABEL_24;
  -[FigCaptureBaseStillImageSinkPipelineConfiguration maxSupportedFrameRate](self, "maxSupportedFrameRate");
  v20 = v19;
  objc_msgSend(a3, "maxSupportedFrameRate");
  if (v20 != v21)
    goto LABEL_24;
  v22 = -[FigCaptureBaseStillImageSinkPipelineConfiguration motionAttachmentsSource](self, "motionAttachmentsSource");
  if (v22 != objc_msgSend(a3, "motionAttachmentsSource"))
    goto LABEL_24;
  v23 = -[FigCaptureBaseStillImageSinkPipelineConfiguration sinkConfiguration](self, "sinkConfiguration");
  if (v23 == (FigCaptureSinkConfiguration *)objc_msgSend(a3, "sinkConfiguration")
    || (v24 = -[FigCaptureSinkConfiguration isEqual:](-[FigCaptureBaseStillImageSinkPipelineConfiguration sinkConfiguration](self, "sinkConfiguration"), "isEqual:", objc_msgSend(a3, "sinkConfiguration"))))
  {
    v25 = -[FigCaptureBaseStillImageSinkPipelineConfiguration usesHighEncodingPriority](self, "usesHighEncodingPriority", v10, v39, v6, v40, v41, v42, v7, v8);
    if (v25 == objc_msgSend(a3, "usesHighEncodingPriority"))
    {
      v26 = -[FigCaptureBaseStillImageSinkPipelineConfiguration outputPixelFormat](self, "outputPixelFormat");
      if (v26 == objc_msgSend(a3, "outputPixelFormat"))
      {
        v27 = -[FigCaptureBaseStillImageSinkPipelineConfiguration outputColorSpaceProperties](self, "outputColorSpaceProperties");
        if (v27 == objc_msgSend(a3, "outputColorSpaceProperties"))
        {
          v28 = -[FigCaptureBaseStillImageSinkPipelineConfiguration stillImageStabilizationSupported](self, "stillImageStabilizationSupported");
          if (v28 == objc_msgSend(a3, "stillImageStabilizationSupported"))
          {
            v29 = -[FigCaptureBaseStillImageSinkPipelineConfiguration noiseReductionAndFusionScheme](self, "noiseReductionAndFusionScheme");
            if (v29 == objc_msgSend(a3, "noiseReductionAndFusionScheme"))
            {
              v30 = (int)-[FigCaptureBaseStillImageSinkPipelineConfiguration depthDataDimensions](self, "depthDataDimensions");
              if (v30 == objc_msgSend(a3, "depthDataDimensions"))
              {
                v31 = (unint64_t)-[FigCaptureBaseStillImageSinkPipelineConfiguration depthDataDimensions](self, "depthDataDimensions") >> 32;
                if ((_DWORD)v31 == (unint64_t)objc_msgSend(a3, "depthDataDimensions") >> 32)
                {
                  -[FigCaptureBaseStillImageSinkPipelineConfiguration portraitEffectsMatteMainImageDownscalingFactor](self, "portraitEffectsMatteMainImageDownscalingFactor");
                  v33 = v32;
                  objc_msgSend(a3, "portraitEffectsMatteMainImageDownscalingFactor");
                  if (v33 == v34)
                  {
                    v35 = -[FigCaptureBaseStillImageSinkPipelineConfiguration cinematicFramingWarpingRequired](self, "cinematicFramingWarpingRequired");
                    if (v35 == objc_msgSend(a3, "cinematicFramingWarpingRequired"))
                    {
                      v36 = (int)-[FigCaptureBaseStillImageSinkPipelineConfiguration cinematicFramingWarpingOutputDimensions](self, "cinematicFramingWarpingOutputDimensions");
                      if (v36 == objc_msgSend(a3, "cinematicFramingWarpingOutputDimensions"))
                      {
                        v37 = (unint64_t)-[FigCaptureBaseStillImageSinkPipelineConfiguration cinematicFramingWarpingOutputDimensions](self, "cinematicFramingWarpingOutputDimensions") >> 32;
                        LOBYTE(v24) = (_DWORD)v37 == (unint64_t)objc_msgSend(a3, "cinematicFramingWarpingOutputDimensions") >> 32;
                        return v24;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_24:
    LOBYTE(v24) = 0;
  }
  return v24;
}

- (unint64_t)hash
{
  return -[FigCaptureSinkConfiguration hash](self->_sinkConfiguration, "hash");
}

- (float)maxSupportedFrameRate
{
  return self->_maxSupportedFrameRate;
}

- (int)motionAttachmentsSource
{
  return self->_motionAttachmentsSource;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputColorSpaceProperties:(int)a3
{
  self->_outputColorSpaceProperties = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)cinematicFramingWarpingOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_cinematicFramingWarpingOutputDimensions;
}

- (void)setCinematicFramingWarpingOutputDimensions:(id)a3
{
  self->_cinematicFramingWarpingOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end
