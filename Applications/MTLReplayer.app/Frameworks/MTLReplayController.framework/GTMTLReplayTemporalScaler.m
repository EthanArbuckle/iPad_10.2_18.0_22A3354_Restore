@implementation GTMTLReplayTemporalScaler

- (GTMTLReplayTemporalScaler)initWithGPUScaler:(id)a3 ANEScaler:(id)a4 executionMode:(unsigned __int8)a5
{
  id v9;
  id v10;
  GTMTLReplayTemporalScaler *v11;
  GTMTLReplayTemporalScaler *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTMTLReplayTemporalScaler;
  v11 = -[GTMTLReplayTemporalScaler init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_gpuScaler, a3);
    objc_storeStrong((id *)&v12->_aneScaler, a4);
    v12->_executionMode = a5;
  }

  return v12;
}

- (MTLFXEffectTracingDelegate)tracingDelegate
{
  return (MTLFXEffectTracingDelegate *)-[MTLFXTemporalScaler tracingDelegate](self->_gpuScaler, "tracingDelegate");
}

- (void)setTracingDelegate:(id)a3
{
  MTLFXTemporalScaler *gpuScaler;
  id v5;

  gpuScaler = self->_gpuScaler;
  v5 = a3;
  -[MTLFXTemporalScaler setTracingDelegate:](gpuScaler, "setTracingDelegate:", v5);
  -[MTLFXTemporalScaler setTracingDelegate:](self->_aneScaler, "setTracingDelegate:", v5);

}

- (unint64_t)effectID
{
  uint64_t v2;

  if (*(_BYTE *)(self + 24))
  {
    if (*(_BYTE *)(self + 24) != 1)
      return self;
    v2 = 8;
  }
  else
  {
    v2 = 16;
  }
  return (unint64_t)objc_msgSend(*(id *)(self + v2), "effectID");
}

- (unint64_t)colorTextureUsage
{
  return (unint64_t)-[MTLFXTemporalScaler colorTextureUsage](self->_gpuScaler, "colorTextureUsage");
}

- (unint64_t)depthTextureUsage
{
  return (unint64_t)-[MTLFXTemporalScaler depthTextureUsage](self->_gpuScaler, "depthTextureUsage");
}

- (unint64_t)motionTextureUsage
{
  return (unint64_t)-[MTLFXTemporalScaler motionTextureUsage](self->_gpuScaler, "motionTextureUsage");
}

- (unint64_t)outputTextureUsage
{
  return (unint64_t)-[MTLFXTemporalScaler outputTextureUsage](self->_gpuScaler, "outputTextureUsage");
}

- (unint64_t)reactiveTextureUsage
{
  return (unint64_t)-[MTLFXTemporalScaler reactiveTextureUsage](self->_gpuScaler, "reactiveTextureUsage");
}

- (unint64_t)inputContentWidth
{
  return (unint64_t)-[MTLFXTemporalScaler inputContentWidth](self->_gpuScaler, "inputContentWidth");
}

- (void)setInputContentWidth:(unint64_t)a3
{
  -[MTLFXTemporalScaler setInputContentWidth:](self->_gpuScaler, "setInputContentWidth:");
  -[MTLFXTemporalScaler setInputContentWidth:](self->_aneScaler, "setInputContentWidth:", a3);
}

- (unint64_t)inputContentHeight
{
  return (unint64_t)-[MTLFXTemporalScaler inputContentHeight](self->_gpuScaler, "inputContentHeight");
}

- (void)setInputContentHeight:(unint64_t)a3
{
  -[MTLFXTemporalScaler setInputContentHeight:](self->_gpuScaler, "setInputContentHeight:");
  -[MTLFXTemporalScaler setInputContentHeight:](self->_aneScaler, "setInputContentHeight:", a3);
}

- (MTLTexture)colorTexture
{
  return (MTLTexture *)-[MTLFXTemporalScaler colorTexture](self->_gpuScaler, "colorTexture");
}

- (void)setColorTexture:(id)a3
{
  MTLFXTemporalScaler *gpuScaler;
  id v5;

  gpuScaler = self->_gpuScaler;
  v5 = a3;
  -[MTLFXTemporalScaler setColorTexture:](gpuScaler, "setColorTexture:", v5);
  -[MTLFXTemporalScaler setColorTexture:](self->_aneScaler, "setColorTexture:", v5);

}

- (MTLTexture)depthTexture
{
  return (MTLTexture *)-[MTLFXTemporalScaler depthTexture](self->_gpuScaler, "depthTexture");
}

- (void)setDepthTexture:(id)a3
{
  MTLFXTemporalScaler *gpuScaler;
  id v5;

  gpuScaler = self->_gpuScaler;
  v5 = a3;
  -[MTLFXTemporalScaler setDepthTexture:](gpuScaler, "setDepthTexture:", v5);
  -[MTLFXTemporalScaler setDepthTexture:](self->_aneScaler, "setDepthTexture:", v5);

}

- (MTLTexture)motionTexture
{
  return (MTLTexture *)-[MTLFXTemporalScaler motionTexture](self->_gpuScaler, "motionTexture");
}

- (void)setMotionTexture:(id)a3
{
  MTLFXTemporalScaler *gpuScaler;
  id v5;

  gpuScaler = self->_gpuScaler;
  v5 = a3;
  -[MTLFXTemporalScaler setMotionTexture:](gpuScaler, "setMotionTexture:", v5);
  -[MTLFXTemporalScaler setMotionTexture:](self->_aneScaler, "setMotionTexture:", v5);

}

- (MTLTexture)outputTexture
{
  return (MTLTexture *)-[MTLFXTemporalScaler outputTexture](self->_gpuScaler, "outputTexture");
}

- (void)setOutputTexture:(id)a3
{
  MTLFXTemporalScaler *gpuScaler;
  id v5;

  gpuScaler = self->_gpuScaler;
  v5 = a3;
  -[MTLFXTemporalScaler setOutputTexture:](gpuScaler, "setOutputTexture:", v5);
  -[MTLFXTemporalScaler setOutputTexture:](self->_aneScaler, "setOutputTexture:", v5);

}

- (MTLTexture)exposureTexture
{
  return (MTLTexture *)-[MTLFXTemporalScaler exposureTexture](self->_gpuScaler, "exposureTexture");
}

- (void)setExposureTexture:(id)a3
{
  MTLFXTemporalScaler *gpuScaler;
  id v5;

  gpuScaler = self->_gpuScaler;
  v5 = a3;
  -[MTLFXTemporalScaler setExposureTexture:](gpuScaler, "setExposureTexture:", v5);
  -[MTLFXTemporalScaler setExposureTexture:](self->_aneScaler, "setExposureTexture:", v5);

}

- (MTLTexture)reactiveMaskTexture
{
  return (MTLTexture *)-[MTLFXTemporalScaler reactiveMaskTexture](self->_gpuScaler, "reactiveMaskTexture");
}

- (void)setReactiveMaskTexture:(id)a3
{
  MTLFXTemporalScaler *gpuScaler;
  id v5;

  gpuScaler = self->_gpuScaler;
  v5 = a3;
  -[MTLFXTemporalScaler setReactiveMaskTexture:](gpuScaler, "setReactiveMaskTexture:", v5);
  -[MTLFXTemporalScaler setReactiveMaskTexture:](self->_aneScaler, "setReactiveMaskTexture:", v5);

}

- (float)preExposure
{
  float result;

  -[MTLFXTemporalScaler preExposure](self->_gpuScaler, "preExposure");
  return result;
}

- (void)setPreExposure:(float)a3
{
  double v5;

  -[MTLFXTemporalScaler setPreExposure:](self->_gpuScaler, "setPreExposure:");
  *(float *)&v5 = a3;
  -[MTLFXTemporalScaler setPreExposure:](self->_aneScaler, "setPreExposure:", v5);
}

- (float)jitterOffsetX
{
  float result;

  -[MTLFXTemporalScaler jitterOffsetX](self->_gpuScaler, "jitterOffsetX");
  return result;
}

- (void)setJitterOffsetX:(float)a3
{
  double v5;

  -[MTLFXTemporalScaler setJitterOffsetX:](self->_gpuScaler, "setJitterOffsetX:");
  *(float *)&v5 = a3;
  -[MTLFXTemporalScaler setJitterOffsetX:](self->_aneScaler, "setJitterOffsetX:", v5);
}

- (float)jitterOffsetY
{
  float result;

  -[MTLFXTemporalScaler jitterOffsetY](self->_gpuScaler, "jitterOffsetY");
  return result;
}

- (void)setJitterOffsetY:(float)a3
{
  double v5;

  -[MTLFXTemporalScaler setJitterOffsetY:](self->_gpuScaler, "setJitterOffsetY:");
  *(float *)&v5 = a3;
  -[MTLFXTemporalScaler setJitterOffsetY:](self->_aneScaler, "setJitterOffsetY:", v5);
}

- (float)motionVectorScaleX
{
  float result;

  -[MTLFXTemporalScaler motionVectorScaleX](self->_gpuScaler, "motionVectorScaleX");
  return result;
}

- (void)setMotionVectorScaleX:(float)a3
{
  double v5;

  -[MTLFXTemporalScaler setMotionVectorScaleX:](self->_gpuScaler, "setMotionVectorScaleX:");
  *(float *)&v5 = a3;
  -[MTLFXTemporalScaler setMotionVectorScaleX:](self->_aneScaler, "setMotionVectorScaleX:", v5);
}

- (float)motionVectorScaleY
{
  float result;

  -[MTLFXTemporalScaler motionVectorScaleY](self->_gpuScaler, "motionVectorScaleY");
  return result;
}

- (void)setMotionVectorScaleY:(float)a3
{
  double v5;

  -[MTLFXTemporalScaler setMotionVectorScaleY:](self->_gpuScaler, "setMotionVectorScaleY:");
  *(float *)&v5 = a3;
  -[MTLFXTemporalScaler setMotionVectorScaleY:](self->_aneScaler, "setMotionVectorScaleY:", v5);
}

- (BOOL)reset
{
  return -[MTLFXTemporalScaler reset](self->_gpuScaler, "reset");
}

- (void)setReset:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MTLFXTemporalScaler setReset:](self->_gpuScaler, "setReset:");
  -[MTLFXTemporalScaler setReset:](self->_aneScaler, "setReset:", v3);
}

- (BOOL)isDepthReversed
{
  return -[MTLFXTemporalScaler isDepthReversed](self->_gpuScaler, "isDepthReversed");
}

- (void)setDepthReversed:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MTLFXTemporalScaler setDepthReversed:](self->_gpuScaler, "setDepthReversed:");
  -[MTLFXTemporalScaler setDepthReversed:](self->_aneScaler, "setDepthReversed:", v3);
}

- (unint64_t)colorTextureFormat
{
  return (unint64_t)-[MTLFXTemporalScaler colorTextureFormat](self->_gpuScaler, "colorTextureFormat");
}

- (unint64_t)depthTextureFormat
{
  return (unint64_t)-[MTLFXTemporalScaler depthTextureFormat](self->_gpuScaler, "depthTextureFormat");
}

- (unint64_t)motionTextureFormat
{
  return (unint64_t)-[MTLFXTemporalScaler motionTextureFormat](self->_gpuScaler, "motionTextureFormat");
}

- (unint64_t)outputTextureFormat
{
  return (unint64_t)-[MTLFXTemporalScaler outputTextureFormat](self->_gpuScaler, "outputTextureFormat");
}

- (unint64_t)inputWidth
{
  return (unint64_t)-[MTLFXTemporalScaler inputWidth](self->_gpuScaler, "inputWidth");
}

- (unint64_t)inputHeight
{
  return (unint64_t)-[MTLFXTemporalScaler inputHeight](self->_gpuScaler, "inputHeight");
}

- (unint64_t)outputWidth
{
  return (unint64_t)-[MTLFXTemporalScaler outputWidth](self->_gpuScaler, "outputWidth");
}

- (unint64_t)outputHeight
{
  return (unint64_t)-[MTLFXTemporalScaler outputHeight](self->_gpuScaler, "outputHeight");
}

- (float)inputContentMinScale
{
  float result;

  -[MTLFXTemporalScaler inputContentMinScale](self->_gpuScaler, "inputContentMinScale");
  return result;
}

- (float)inputContentMaxScale
{
  float result;

  -[MTLFXTemporalScaler inputContentMaxScale](self->_gpuScaler, "inputContentMaxScale");
  return result;
}

- (MTLFence)fence
{
  return (MTLFence *)-[MTLFXTemporalScaler fence](self->_gpuScaler, "fence");
}

- (void)setFence:(id)a3
{
  MTLFXTemporalScaler *gpuScaler;
  id v5;

  gpuScaler = self->_gpuScaler;
  v5 = a3;
  -[MTLFXTemporalScaler setFence:](gpuScaler, "setFence:", v5);
  -[MTLFXTemporalScaler setFence:](self->_aneScaler, "setFence:", v5);

}

- (void)encodeToCommandBuffer:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if (!self->_executionMode)
  {
    v5 = 16;
    goto LABEL_5;
  }
  if (self->_executionMode == 1)
  {
    v5 = 8;
LABEL_5:
    v6 = v4;
    objc_msgSend(*(id *)((char *)&self->super.isa + v5), "encodeToCommandBuffer:", v4);
    v4 = v6;
  }

}

- (unsigned)executionMode
{
  return self->_executionMode;
}

- (void)setExecutionMode:(unsigned __int8)a3
{
  self->_executionMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneScaler, 0);
  objc_storeStrong((id *)&self->_gpuScaler, 0);
}

@end
