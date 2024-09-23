@implementation MRUWaveformSettings

+ (MRUWaveformSettings)currentSettings
{
  if (currentSettings_onceToken != -1)
    dispatch_once(&currentSettings_onceToken, &__block_literal_global_0);
  return (MRUWaveformSettings *)(id)__MRUWaveformSettingsCurrent;
}

void __38__MRUWaveformSettings_currentSettings__block_invoke()
{
  id *v0;
  void *v1;

  v0 = -[MRUWaveformSettings initWithStops:]((id *)[MRUWaveformSettings alloc], &unk_1E5878450);
  v1 = (void *)__MRUWaveformSettingsCurrent;
  __MRUWaveformSettingsCurrent = (uint64_t)v0;

}

- (id)initWithStops:(id *)a1
{
  id v4;
  id *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)MRUWaveformSettings;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 11, a2);
      v6 = a1[12];
      a1[12] = &unk_1E5878480;

      *(_OWORD *)((char *)a1 + 12) = xmmword_1AAAD57B0;
      *(_OWORD *)((char *)a1 + 28) = xmmword_1AAAD57C0;
      *((_DWORD *)a1 + 11) = 1059648963;
      *((_BYTE *)a1 + 8) = MRUDeviceSupportsVariableFrameRate();
      objc_msgSend(MEMORY[0x1E0D4C650], "currentSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *((_DWORD *)a1 + 12) = objc_msgSend(v7, "waveformNonVariableFramerate");

      *(id *)((char *)a1 + 52) = (id)0x1E00000030;
      *((_DWORD *)a1 + 15) = 5;
      *((_OWORD *)a1 + 4) = xmmword_1AAAD57D0;
      a1[10] = (id)0x3F8000003F000000;
    }
  }

  return a1;
}

+ (MRUWaveformSettings)ambientSettings
{
  if (ambientSettings_onceToken != -1)
    dispatch_once(&ambientSettings_onceToken, &__block_literal_global_8);
  return (MRUWaveformSettings *)(id)__MRUWaveformSettingsAmbient;
}

void __38__MRUWaveformSettings_ambientSettings__block_invoke()
{
  id *v0;
  void *v1;

  v0 = -[MRUWaveformSettings initWithStops:]((id *)[MRUWaveformSettings alloc], &unk_1E5878468);
  v1 = (void *)__MRUWaveformSettingsAmbient;
  __MRUWaveformSettingsAmbient = (uint64_t)v0;

}

- (NSArray)stops
{
  return self->_stops;
}

- (void)setStops:(id)a3
{
  objc_storeStrong((id *)&self->_stops, a3);
}

- (float)amplitudeGain
{
  return self->_amplitudeGain;
}

- (void)setAmplitudeGain:(float)a3
{
  self->_amplitudeGain = a3;
}

- (float)exponentialGain
{
  return self->_exponentialGain;
}

- (void)setExponentialGain:(float)a3
{
  self->_exponentialGain = a3;
}

- (float)frequencyExponent
{
  return self->_frequencyExponent;
}

- (void)setFrequencyExponent:(float)a3
{
  self->_frequencyExponent = a3;
}

- (float)samplingRefreshRate
{
  return self->_samplingRefreshRate;
}

- (void)setSamplingRefreshRate:(float)a3
{
  self->_samplingRefreshRate = a3;
}

- (NSArray)adjustmentCoefficients
{
  return self->_adjustmentCoefficients;
}

- (void)setAdjustmentCoefficients:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentCoefficients, a3);
}

- (float)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(float)a3
{
  self->_animationDuration = a3;
}

- (float)springDamping
{
  return self->_springDamping;
}

- (void)setSpringDamping:(float)a3
{
  self->_springDamping = a3;
}

- (float)pausedAnimationDuration
{
  return self->_pausedAnimationDuration;
}

- (void)setPausedAnimationDuration:(float)a3
{
  self->_pausedAnimationDuration = a3;
}

- (float)pausedSpringDamping
{
  return self->_pausedSpringDamping;
}

- (void)setPausedSpringDamping:(float)a3
{
  self->_pausedSpringDamping = a3;
}

- (float)xScaleMultiplier
{
  return self->_xScaleMultiplier;
}

- (void)setXScaleMultiplier:(float)a3
{
  self->_xScaleMultiplier = a3;
}

- (BOOL)supportsVariableFramerate
{
  return self->_supportsVariableFramerate;
}

- (void)setSupportsVariableFramerate:(BOOL)a3
{
  self->_supportsVariableFramerate = a3;
}

- (int)nonVariableFramerate
{
  return self->_nonVariableFramerate;
}

- (void)setNonVariableFramerate:(int)a3
{
  self->_nonVariableFramerate = a3;
}

- (int)maximumFramerate
{
  return self->_maximumFramerate;
}

- (void)setMaximumFramerate:(int)a3
{
  self->_maximumFramerate = a3;
}

- (int)lowPowerModeMaximumFramerate
{
  return self->_lowPowerModeMaximumFramerate;
}

- (void)setLowPowerModeMaximumFramerate:(int)a3
{
  self->_lowPowerModeMaximumFramerate = a3;
}

- (int)minimumFramerate
{
  return self->_minimumFramerate;
}

- (void)setMinimumFramerate:(int)a3
{
  self->_minimumFramerate = a3;
}

- (float)framerateThreshold
{
  return self->_framerateThreshold;
}

- (void)setFramerateThreshold:(float)a3
{
  self->_framerateThreshold = a3;
}

- (float)artworkBlur
{
  return self->_artworkBlur;
}

- (void)setArtworkBlur:(float)a3
{
  self->_artworkBlur = a3;
}

- (float)artworkSaturation
{
  return self->_artworkSaturation;
}

- (void)setArtworkSaturation:(float)a3
{
  self->_artworkSaturation = a3;
}

- (float)minArtworkLuminance
{
  return self->_minArtworkLuminance;
}

- (void)setMinArtworkLuminance:(float)a3
{
  self->_minArtworkLuminance = a3;
}

- (float)maxArtworkLuminance
{
  return self->_maxArtworkLuminance;
}

- (void)setMaxArtworkLuminance:(float)a3
{
  self->_maxArtworkLuminance = a3;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentCoefficients, 0);
  objc_storeStrong((id *)&self->_stops, 0);
}

@end
