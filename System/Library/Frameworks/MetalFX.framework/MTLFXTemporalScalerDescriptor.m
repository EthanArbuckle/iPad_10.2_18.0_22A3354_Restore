@implementation MTLFXTemporalScalerDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setVersion:", -[MTLFXTemporalScalerDescriptor version](self, "version"));
  objc_msgSend(v4, "setColorTextureFormat:", -[MTLFXTemporalScalerDescriptor colorTextureFormat](self, "colorTextureFormat"));
  objc_msgSend(v4, "setDepthTextureFormat:", -[MTLFXTemporalScalerDescriptor depthTextureFormat](self, "depthTextureFormat"));
  objc_msgSend(v4, "setMotionTextureFormat:", -[MTLFXTemporalScalerDescriptor motionTextureFormat](self, "motionTextureFormat"));
  objc_msgSend(v4, "setOutputTextureFormat:", -[MTLFXTemporalScalerDescriptor outputTextureFormat](self, "outputTextureFormat"));
  objc_msgSend(v4, "setInputWidth:", -[MTLFXTemporalScalerDescriptor inputWidth](self, "inputWidth"));
  objc_msgSend(v4, "setInputHeight:", -[MTLFXTemporalScalerDescriptor inputHeight](self, "inputHeight"));
  objc_msgSend(v4, "setOutputWidth:", -[MTLFXTemporalScalerDescriptor outputWidth](self, "outputWidth"));
  objc_msgSend(v4, "setOutputHeight:", -[MTLFXTemporalScalerDescriptor outputHeight](self, "outputHeight"));
  objc_msgSend(v4, "setAutoExposureEnabled:", -[MTLFXTemporalScalerDescriptor isAutoExposureEnabled](self, "isAutoExposureEnabled"));
  objc_msgSend(v4, "setRequiresSynchronousInitialization:", -[MTLFXTemporalScalerDescriptor requiresSynchronousInitialization](self, "requiresSynchronousInitialization"));
  objc_msgSend(v4, "setInputContentPropertiesEnabled:", -[MTLFXTemporalScalerDescriptor isInputContentPropertiesEnabled](self, "isInputContentPropertiesEnabled"));
  -[MTLFXTemporalScalerDescriptor inputContentMinScale](self, "inputContentMinScale");
  objc_msgSend(v4, "setInputContentMinScale:");
  -[MTLFXTemporalScalerDescriptor inputContentMaxScale](self, "inputContentMaxScale");
  objc_msgSend(v4, "setInputContentMaxScale:");
  objc_msgSend(v4, "setReactiveMaskTextureEnabled:", -[MTLFXTemporalScalerDescriptor isReactiveMaskTextureEnabled](self, "isReactiveMaskTextureEnabled"));
  objc_msgSend(v4, "setReactiveMaskTextureFormat:", -[MTLFXTemporalScalerDescriptor reactiveMaskTextureFormat](self, "reactiveMaskTextureFormat"));
  return v4;
}

- (void)setEnableInputContentProperties:(BOOL)a3
{
  self->inputContentPropertiesEnabled = a3;
}

- (BOOL)enableInputContentProperties
{
  return self->inputContentPropertiesEnabled;
}

- (id)newTemporalScalerWithHistoryTexture:(id)a3
{
  id v4;
  void *v5;
  _MFXTemporalScalingEffectV3 *v6;

  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MTLFXTemporalScalerDescriptor supportsDevice:](MTLFXTemporalScalerDescriptor, "supportsDevice:", v5))
  {
    if ((objc_msgSend(v5, "supportsFamily:", 1001) & 1) == 0)
      __assert_rtn("-[MTLFXTemporalScalerDescriptor newTemporalScalerWithHistoryTexture:]", "MetalFXTemporalScalingEffect.mm", 84, "appleGPU");
    v6 = -[_MFXTemporalScalingEffectV3 initWithDevice:descriptor:history:]([_MFXTemporalScalingEffectV3 alloc], "initWithDevice:descriptor:history:", v5, self, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)newTemporalScalerWithDevice:(id)device
{
  id v4;
  unsigned __int8 v5;
  _MFXTemporalScalingEffectV3 *v6;
  _MFXTemporalScalingEffectV3 *v7;
  unsigned __int8 v9;
  _MFXTemporalScalingEffectDebug *v10;
  unsigned int v11;
  int v12;

  v4 = device;
  if (+[MTLFXTemporalScalerDescriptor supportsDevice:](MTLFXTemporalScalerDescriptor, "supportsDevice:", v4))
  {
    if ((v5 & 1) == 0
    {
      v11 = 0;
      findEnvVarNum<unsigned int>("MTLFX_JITTER_MOTION_DEBUG", &v11, 0, 0);
      -[MTLFXTemporalScalerDescriptor newTemporalScalerWithDevice:]::debugMode = v11;
    }
    if (-[MTLFXTemporalScalerDescriptor newTemporalScalerWithDevice:]::debugMode)
    {
      if ((v9 & 1) == 0
      {
        v12 = 0;
        findEnvVarNum<int>("MTLFX_JITTER_VIZ_DEBUG", &v12, 1, 0);
        -[MTLFXTemporalScalerDescriptor newTemporalScalerWithDevice:]::jitterVizEnabled = v12;
      }
      if ((unint64_t)-[MTLFXTemporalScalerDescriptor newTemporalScalerWithDevice:]::debugMode >= 4)
        __assert_rtn("-[MTLFXTemporalScalerDescriptor newTemporalScalerWithDevice:]", "MetalFXTemporalScalingEffect.mm", 101, "debugMode < kMFXDebugModeNum");
      v10 = [_MFXTemporalScalingEffectDebug alloc];
      v6 = -[_MFXTemporalScalingEffectDebug initWithDevice:descriptor:mode:enableJitterViz:](v10, "initWithDevice:descriptor:mode:enableJitterViz:", v4, self, -[MTLFXTemporalScalerDescriptor newTemporalScalerWithDevice:]::debugMode, -[MTLFXTemporalScalerDescriptor newTemporalScalerWithDevice:]::jitterVizEnabled != 0);
      goto LABEL_10;
    }
    if (objc_msgSend(v4, "supportsFamily:", 1001))
    {
      if (-[MTLFXTemporalScalerDescriptor version](self, "version") != 65537)
      {
        v6 = -[_MFXTemporalScalingEffectV3 initWithDevice:descriptor:history:]([_MFXTemporalScalingEffectV3 alloc], "initWithDevice:descriptor:history:", v4, self, 0);
LABEL_10:
        v7 = v6;
        goto LABEL_11;
      }
    }
    else
    {
      -[MTLFXTemporalScalerDescriptor version](self, "version");
    }
    v6 = -[_MFXTemporalScalingEffectNRS initWithDevice:descriptor:]([_MFXTemporalScalingEffectNRS alloc], "initWithDevice:descriptor:", v4, self);
    goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

+ (float)supportedInputContentMinScaleForDevice:(id)device
{
  return 1.0;
}

+ (float)supportedInputContentMaxScaleForDevice:(id)device
{
  int v3;
  float result;

  v3 = objc_msgSend(device, "supportsFamily:", 1001);
  result = 2.0;
  if (v3)
    return 3.0;
  return result;
}

+ (BOOL)supportsDevice:(id)device
{
  id v3;
  char v4;
  char v5;

  v3 = device;
  v4 = objc_msgSend(v3, "supportsFamily:", 1001);
  v5 = objc_msgSend(v3, "supportsFamily:", 1007) | v4 ^ 1;

  return v5;
}

- (MTLPixelFormat)colorTextureFormat
{
  return self->colorTextureFormat;
}

- (void)setColorTextureFormat:(MTLPixelFormat)colorTextureFormat
{
  self->colorTextureFormat = colorTextureFormat;
}

- (MTLPixelFormat)depthTextureFormat
{
  return self->depthTextureFormat;
}

- (void)setDepthTextureFormat:(MTLPixelFormat)depthTextureFormat
{
  self->depthTextureFormat = depthTextureFormat;
}

- (MTLPixelFormat)motionTextureFormat
{
  return self->motionTextureFormat;
}

- (void)setMotionTextureFormat:(MTLPixelFormat)motionTextureFormat
{
  self->motionTextureFormat = motionTextureFormat;
}

- (NSUInteger)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(NSUInteger)inputWidth
{
  self->inputWidth = inputWidth;
}

- (NSUInteger)inputHeight
{
  return self->inputHeight;
}

- (void)setInputHeight:(NSUInteger)inputHeight
{
  self->inputHeight = inputHeight;
}

- (NSUInteger)outputWidth
{
  return self->outputWidth;
}

- (void)setOutputWidth:(NSUInteger)outputWidth
{
  self->outputWidth = outputWidth;
}

- (NSUInteger)outputHeight
{
  return self->outputHeight;
}

- (void)setOutputHeight:(NSUInteger)outputHeight
{
  self->outputHeight = outputHeight;
}

- (unint64_t)version
{
  return self->version;
}

- (void)setVersion:(unint64_t)a3
{
  self->version = a3;
}

- (BOOL)isInputContentPropertiesEnabled
{
  return self->inputContentPropertiesEnabled;
}

- (void)setInputContentPropertiesEnabled:(BOOL)inputContentPropertiesEnabled
{
  self->inputContentPropertiesEnabled = inputContentPropertiesEnabled;
}

- (float)inputContentMinScale
{
  return self->inputContentMinScale;
}

- (void)setInputContentMinScale:(float)inputContentMinScale
{
  self->inputContentMinScale = inputContentMinScale;
}

- (float)inputContentMaxScale
{
  return self->inputContentMaxScale;
}

- (void)setInputContentMaxScale:(float)inputContentMaxScale
{
  self->inputContentMaxScale = inputContentMaxScale;
}

- (BOOL)isReactiveMaskTextureEnabled
{
  return self->reactiveMaskTextureEnabled;
}

- (void)setReactiveMaskTextureEnabled:(BOOL)a3
{
  self->reactiveMaskTextureEnabled = a3;
}

- (unint64_t)reactiveMaskTextureFormat
{
  return self->reactiveMaskTextureFormat;
}

- (void)setReactiveMaskTextureFormat:(unint64_t)a3
{
  self->reactiveMaskTextureFormat = a3;
}

- (BOOL)isAutoExposureEnabled
{
  return self->autoExposureEnabled;
}

- (void)setAutoExposureEnabled:(BOOL)autoExposureEnabled
{
  self->autoExposureEnabled = autoExposureEnabled;
}

- (BOOL)requiresSynchronousInitialization
{
  return self->requiresSynchronousInitialization;
}

- (void)setRequiresSynchronousInitialization:(BOOL)a3
{
  self->requiresSynchronousInitialization = a3;
}

- (MTLPixelFormat)outputTextureFormat
{
  return self->_outputTextureFormat;
}

- (void)setOutputTextureFormat:(MTLPixelFormat)outputTextureFormat
{
  self->_outputTextureFormat = outputTextureFormat;
}

@end
