@implementation VCAudioPowerLevelMonitor

- (VCAudioPowerLevelMonitor)init
{
  VCAudioPowerLevelMonitor *v2;
  int v3;
  int v4;
  float v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioPowerLevelMonitor;
  v2 = -[VCAudioPowerLevelMonitor init](&v7, sel_init);
  if (v2)
  {
    v3 = -[VCDefaults forceAudioPowerTimeInterval](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPowerTimeInterval");
    v2->audioLowPowerTimeInterval = 24000 * v3;
    if (v3 >= 1)
    {
      v4 = 50 * v3;
      -[VCDefaults forceAudioPowerThreshold](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPowerThreshold");
      v2->audioPowerThreshold = v5;
      v2->currentAudioAverage = -120.0;
      v2->isAudioPowerMovingAverage = v5 > -120.0;
      v2->audioPowerMovingAverageCoefficient = 1.0 / (float)v4;
      v2->isAudioPowerBelowThreshold = 0;
    }
  }
  return v2;
}

- (void)detectRemoteAveragePowerLevel:(float)a3 timestamp:(unsigned int)a4
{
  unsigned int audioLowPowerTimeInterval;

  audioLowPowerTimeInterval = self->audioLowPowerTimeInterval;
  if (audioLowPowerTimeInterval)
  {
    if (self->isAudioPowerMovingAverage)
      a3 = (float)((float)(1.0 - self->audioPowerMovingAverageCoefficient) * self->currentAudioAverage)
         + (float)(self->audioPowerMovingAverageCoefficient * fmaxf(a3, -120.0));
    self->currentAudioAverage = a3;
    if (a3 <= self->audioPowerThreshold)
    {
      if (a4 - self->startDetectRemoteAudioLowPowerTime > audioLowPowerTimeInterval)
      {
        self->startDetectRemoteAudioLowPowerTime = a4;
        -[VCAudioPowerLevelMonitorDelegate vcAudioPowerLevelMonitor:isAudioBelowThreshold:](-[VCAudioPowerLevelMonitor delegate](self, "delegate"), "vcAudioPowerLevelMonitor:isAudioBelowThreshold:", self, 1);
        self->isAudioPowerBelowThreshold = 1;
      }
    }
    else
    {
      self->startDetectRemoteAudioLowPowerTime = a4;
      if (self->isAudioPowerBelowThreshold)
      {
        self->isAudioPowerBelowThreshold = 0;
        -[VCAudioPowerLevelMonitorDelegate vcAudioPowerLevelMonitor:isAudioBelowThreshold:](-[VCAudioPowerLevelMonitor delegate](self, "delegate"), "vcAudioPowerLevelMonitor:isAudioBelowThreshold:", self, 0);
      }
    }
  }
}

- (VCAudioPowerLevelMonitorDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (VCAudioPowerLevelMonitorDelegate *)a3;
}

@end
