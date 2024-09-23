@implementation BWStreamingCVAFilterRendererAnimator

+ (void)initialize
{
  objc_opt_class();
}

- (BWStreamingCVAFilterRendererAnimator)init
{
  return -[BWStreamingCVAFilterRendererAnimator initWithEffectStatus:overCaptureEnabled:](self, "initWithEffectStatus:overCaptureEnabled:", 0, 0);
}

- (BWStreamingCVAFilterRendererAnimator)initWithEffectStatus:(int)a3 overCaptureEnabled:(BOOL)a4
{
  BWStreamingCVAFilterRendererAnimator *v6;
  BWStreamingCVAFilterRendererAnimator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWStreamingCVAFilterRendererAnimator;
  v6 = -[BWStreamingCVAFilterRendererAnimator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_mostRecentEffectStatus = a3;
    v6->_simulatedApertureRamp = -[BWRamp initWithName:]([BWRamp alloc], "initWithName:", CFSTR("SimulatedApertureRamp"));
    v7->_overCaptureEnabled = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStreamingCVAFilterRendererAnimator;
  -[BWStreamingCVAFilterRendererAnimator dealloc](&v3, sel_dealloc);
}

- ($3BA783FF50B239963188BE194EBFFEBA)simulateNextFrameWithEffectStatus:(int)a3 portraitStability:(float)a4 clientSuppliedSimulatedAperture:(float)a5
{
  float v7;
  float v8;
  $BC557994D65C399205E971F02FEC800B *p_currentFrame;

  if (a3 > 0xE || (v7 = a5, ((1 << a3) & 0x6202) == 0))
    v7 = 1000.0;
  if (self->_mostRecentEffectStatus != a3)
    -[BWStreamingCVAFilterRendererAnimator _resetSimulatedApertureRampWithEffectStatus:clientSuppliedSimulatedAperture:]((uint64_t)self, a3, a5);
  if (-[BWRamp isRamping](self->_simulatedApertureRamp, "isRamping"))
  {
    -[BWRamp updateRampForNextIteration](self->_simulatedApertureRamp, "updateRampForNextIteration");
    v7 = v8;
  }
  self->_currentFrame.simulatedAperture = v7;
  p_currentFrame = &self->_currentFrame;
  LODWORD(p_currentFrame[1].simulatedAperture) = a3;
  return ($3BA783FF50B239963188BE194EBFFEBA *)p_currentFrame;
}

- (uint64_t)_resetSimulatedApertureRampWithEffectStatus:(float)a3 clientSuppliedSimulatedAperture:
{
  uint64_t v5;
  double v6;
  double v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (!result)
    return result;
  v5 = result;
  result = objc_msgSend(*(id *)(result + 16), "isRamping");
  v8 = (*(_DWORD *)(v5 + 12) < 0xFu) & (0x6202u >> *(_DWORD *)(v5 + 12));
  if (a2 > 0xE || ((1 << a2) & 0x6202) == 0)
  {
    if (((*(_DWORD *)(v5 + 12) < 0xFu) & (0x6202u >> *(_DWORD *)(v5 + 12))) == 0)
      return result;
    v10 = *(void **)(v5 + 16);
    LODWORD(v7) = 16.0;
    *(float *)&v6 = a3;
    v9 = 4;
    v11 = 1;
    return objc_msgSend(v10, "startRampFrom:to:iterations:shape:", v9, v11, v6, v7);
  }
  if (!*(_BYTE *)(v5 + 24))
  {
    v9 = 3;
    LODWORD(v6) = 1148846080;
    if (((*(_DWORD *)(v5 + 12) < 0xFu) & (0x6202u >> *(_DWORD *)(v5 + 12))) != 0)
      return result;
    goto LABEL_10;
  }
  LODWORD(v6) = 25.0;
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(v5 + 16), "updateRampForNextIteration", v6);
  v9 = (int)(float)(40.0 - (float)((float)(25.0 - *(float *)&v6) / 40.0));
  if ((v8 & 1) == 0)
  {
LABEL_10:
    v10 = *(void **)(v5 + 16);
    *(float *)&v7 = a3;
    v11 = 2;
    return objc_msgSend(v10, "startRampFrom:to:iterations:shape:", v9, v11, v6, v7);
  }
  return result;
}

- (BOOL)isDepthAvailable
{
  return (self->_mostRecentEffectStatus < 0xFu) & (0x6202u >> self->_mostRecentEffectStatus);
}

@end
