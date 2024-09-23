@implementation BWMattingV2InferenceConfiguration

- (void)setTuningConfiguration:(int)a3
{
  self->_tuningConfiguration = a3;
}

- (void)setSensorConfigurationsByPortType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setMetalCommandQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setMainImageDownscalingFactor:(float)a3
{
  self->_mainImageDownscalingFactor = a3;
}

- (void)setEnabledMattes:(unsigned int)a3
{
  self->_enabledMattes = a3;
}

- (void)setTargetAspectRatio:(float)a3
{
  self->_targetAspectRatio = a3;
}

- (void)setAppliesFinalCropRect:(BOOL)a3
{
  self->_appliesFinalCropRect = a3;
}

- (float)mainImageDownscalingFactor
{
  return self->_mainImageDownscalingFactor;
}

- (BOOL)appliesFinalCropRect
{
  return self->_appliesFinalCropRect;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (int)tuningConfiguration
{
  return self->_tuningConfiguration;
}

- (float)targetAspectRatio
{
  return self->_targetAspectRatio;
}

- (BOOL)submitWithoutSynchronization
{
  return self->_submitWithoutSynchronization;
}

- (NSDictionary)sensorConfigurationsByPortType
{
  return self->_sensorConfigurationsByPortType;
}

- (NSDictionary)sdofRenderingTuningParameters
{
  return self->_sdofRenderingTuningParameters;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (unsigned)enabledMattes
{
  return self->_enabledMattes;
}

+ (unsigned)mattingOutputTypeForAttachedMediaKey:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E495AF58) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E495AF38) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PersonSemanticsHair")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PersonSemanticsSkin")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PersonSemanticsTeeth")) & 1) != 0)
    return 16;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PersonSemanticsGlasses")) & 1) != 0)
    return 32;
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E495B0B8) & 1) != 0)
    return 64;
  if (objc_msgSend(a3, "isEqualToString:", 0x1E495B0D8))
    return 128;
  return 0;
}

+ (id)inputAttachedMediaKeyForMattingOutputType:(unsigned int)a3
{
  return +[BWMattingV2InferenceProvider inputAttachedMediaKeyForMattingOutputType:](BWMattingV2InferenceProvider, "inputAttachedMediaKeyForMattingOutputType:", *(_QWORD *)&a3);
}

- (void)setSubmitWithoutSynchronization:(BOOL)a3
{
  self->_submitWithoutSynchronization = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMattingV2InferenceConfiguration;
  -[BWInferenceConfiguration dealloc](&v3, sel_dealloc);
}

+ (BOOL)isMattingOutputAttachedMediaKey:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a1, "mattingOutputTypeForAttachedMediaKey:", a3);
  return v3 >= 2 && v3 != 256 && v3 != 128;
}

- (void)setSdofRenderingTuningParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
