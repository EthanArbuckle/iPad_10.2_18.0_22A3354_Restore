@implementation JFXEffectContinousPreviewOptions

- (id)initContinousPreviewOptions
{
  _QWORD *v2;
  __int128 v3;
  CMTime v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)JFXEffectContinousPreviewOptions;
  v2 = -[JFXEffectPreviewOptions initPreviewOptions](&v6, sel_initPreviewOptions);
  if (v2)
  {
    CMTimeMakeWithSeconds(&v5, 1.0, 30);
    v3 = *(_OWORD *)&v5.value;
    v2[10] = v5.epoch;
    *((_OWORD *)v2 + 4) = v3;
    *((_BYTE *)v2 + 32) = 1;
    v2[5] = 0;
    *((_DWORD *)v2 + 9) = 2;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)JFXEffectContinousPreviewOptions;
  v4 = -[JFXEffectPreviewOptions copyWithZone:](&v11, sel_copyWithZone_, a3);
  v5 = *(_OWORD *)&self->_effectAnimationDuration.value;
  v4[10] = self->_effectAnimationDuration.epoch;
  *((_OWORD *)v4 + 4) = v5;
  *((_BYTE *)v4 + 32) = self->_loopAnimation;
  v4[5] = self->_backgroundType;
  v6 = MEMORY[0x2276A1F6C](self->_renderPropertiesConfigurationBlock);
  v7 = (void *)v4[7];
  v4[7] = v6;

  v8 = -[NSArray copy](self->_effectsToApplyToBackground, "copy");
  v9 = (void *)v4[6];
  v4[6] = v8;

  return v4;
}

- (unint64_t)backgroundType
{
  return self->_backgroundType;
}

- (void)setBackgroundType:(unint64_t)a3
{
  self->_backgroundType = a3;
}

- (NSArray)effectsToApplyToBackground
{
  return self->_effectsToApplyToBackground;
}

- (void)setEffectsToApplyToBackground:(id)a3
{
  objc_storeStrong((id *)&self->_effectsToApplyToBackground, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)effectAnimationDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setEffectAnimationDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_effectAnimationDuration.value = *(_OWORD *)&a3->var0;
  self->_effectAnimationDuration.epoch = var3;
}

- (BOOL)loopAnimation
{
  return self->_loopAnimation;
}

- (void)setLoopAnimation:(BOOL)a3
{
  self->_loopAnimation = a3;
}

- (unsigned)maxFramesRenderedAtATime
{
  return self->_maxFramesRenderedAtATime;
}

- (void)setMaxFramesRenderedAtATime:(unsigned int)a3
{
  self->_maxFramesRenderedAtATime = a3;
}

- (id)renderPropertiesConfigurationBlock
{
  return self->_renderPropertiesConfigurationBlock;
}

- (void)setRenderPropertiesConfigurationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderPropertiesConfigurationBlock, 0);
  objc_storeStrong((id *)&self->_effectsToApplyToBackground, 0);
}

@end
