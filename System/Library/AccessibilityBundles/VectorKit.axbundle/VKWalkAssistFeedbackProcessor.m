@implementation VKWalkAssistFeedbackProcessor

+ (id)fourPitchesThresholdArray
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 15.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 20.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 25.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VKWalkAssistFeedbackProcessor)initWithToneGenerator:(id)a3
{
  id v5;
  VKWalkAssistFeedbackProcessor *v6;
  VKWalkAssistFeedbackProcessor *v7;
  void *v8;
  VKWalkAssistFeedbackProcessor *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKWalkAssistFeedbackProcessor;
  v6 = -[VKWalkAssistFeedbackProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_minProximityThreshold = 0.0;
    v6->_maxProximityThreshold = 0.0;
    objc_storeStrong((id *)&v6->_toneGenerator, a3);
    -[VKToneGenerator setUsesSoundFeedback:](v7->_toneGenerator, "setUsesSoundFeedback:", 1);
    v7->_pitchMode = 2;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__voiceOverStatusChanged, *MEMORY[0x24BDF7458], 0);

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  VKToneGenerator *toneGenerator;
  void *v4;
  objc_super v5;

  toneGenerator = self->_toneGenerator;
  self->_toneGenerator = 0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)VKWalkAssistFeedbackProcessor;
  -[VKWalkAssistFeedbackProcessor dealloc](&v5, sel_dealloc);
}

- (void)setPitchMode:(int64_t)a3
{
  self->_pitchMode = a3;
}

- (void)setShouldPlayAudio:(BOOL)a3
{
  self->_shouldPlayAudio = a3;
  if (!a3)
    -[VKToneGenerator stopPulse](self->_toneGenerator, "stopPulse");
}

- (void)stopProcessing
{
  self->_shouldPlayAudio = 0;
  -[VKToneGenerator stopPulse](self->_toneGenerator, "stopPulse");
}

- (void)processPulseFeedbackForDistance:(int)a3 shouldProcessHapticPulse:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v7;
  VKPulseFrequencyGenerator *v8;
  double v9;
  double v10;
  double v11;
  VKPulseFrequencyGenerator *v12;
  VKVolumeGenerator *v13;
  int64_t pitchMode;
  VKPitchGenerator *v15;
  void *v16;
  VKPitchGenerator *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[VKWalkAssistFeedbackProcessor _updateProximityThresholdsIfNeededForDistance:](self, "_updateProximityThresholdsIfNeededForDistance:");
  v7 = -[VKWalkAssistFeedbackProcessor _mmFromMeters:](self, "_mmFromMeters:", v5);
  -[VKWalkAssistFeedbackProcessor toneGenerator](self, "toneGenerator");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [VKPulseFrequencyGenerator alloc];
  objc_msgSend(v24, "minPulseFrequency");
  v10 = v9;
  objc_msgSend(v24, "maxPulseFrequency");
  v12 = -[VKPulseFrequencyGenerator initWithMinPulseFrequency:maxPulseFrequency:minDepth:maxDepth:](v8, "initWithMinPulseFrequency:maxPulseFrequency:minDepth:maxDepth:", (int)self->_minProximityThreshold, (int)self->_maxProximityThreshold, v10, v11);
  objc_msgSend(v24, "setShouldPlayHapticPulse:", v4);
  -[VKPulseFrequencyGenerator frequencyForDepth:](v12, "frequencyForDepth:", v7);
  objc_msgSend(v24, "setPulseFrequency:");
  v13 = objc_alloc_init(VKVolumeGenerator);
  -[VKVolumeGenerator volumeForDepth:minDistanceThreshold:maxDistanceThreshold:](v13, "volumeForDepth:minDistanceThreshold:maxDistanceThreshold:", v7, (int)self->_minProximityThreshold, (int)self->_maxProximityThreshold);
  objc_msgSend(v24, "setVolume:");
  pitchMode = self->_pitchMode;
  if (pitchMode)
  {
    if (pitchMode == 1)
    {
      v17 = -[VKPitchGenerator initWithTwoPitchesThreshold:]([VKPitchGenerator alloc], "initWithTwoPitchesThreshold:", &unk_2503CDFB8);
      goto LABEL_9;
    }
    if (pitchMode != 2)
    {
      v17 = 0;
      goto LABEL_9;
    }
    v15 = [VKPitchGenerator alloc];
    +[VKWalkAssistFeedbackProcessor fourPitchesThresholdArray](VKWalkAssistFeedbackProcessor, "fourPitchesThresholdArray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[VKPitchGenerator initWithFourPitchesThresholdArray:](v15, "initWithFourPitchesThresholdArray:", v16);
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v24, "maxPitchFactor");
    objc_msgSend(v18, "numberWithFloat:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v24, "maxPitchFactor");
    objc_msgSend(v19, "numberWithFloat:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)self->_minProximityThreshold);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)self->_maxProximityThreshold);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[VKPitchGenerator initWithMinPitch:maxPitch:minDepth:maxDepth:]([VKPitchGenerator alloc], "initWithMinPitch:maxPitch:minDepth:maxDepth:", v16, v20, v21, v22);

  }
LABEL_9:
  -[VKPitchGenerator fileForDepthInUnit:](v17, "fileForDepthInUnit:", (double)(int)v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAudioFileURL:", v23);

  -[VKPitchGenerator pitchForDepth:](v17, "pitchForDepth:", v7);
  objc_msgSend(v24, "setPitchFactor:");
  if (objc_msgSend(v24, "usesSoundFeedback") && self->_shouldPlayAudio)
    objc_msgSend(v24, "startPulse");
  else
    objc_msgSend(v24, "stopPulse");

}

- (void)_updateProximityThresholdsIfNeededForDistance:(int)a3
{
  int v4;
  double v5;
  unint64_t pitchMode;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double maxProximityThreshold;
  double v12;
  double v13;
  id v14;

  v4 = -[VKWalkAssistFeedbackProcessor _mmFromMeters:](self, "_mmFromMeters:", *(_QWORD *)&a3);
  if (self->_minProximityThreshold == 0.0)
    self->_minProximityThreshold = (double)-[VKWalkAssistFeedbackProcessor _mmFromMeters:](self, "_mmFromMeters:", (int)8.0);
  v5 = (double)v4;
  if (self->_maxProximityThreshold < (double)v4)
  {
    self->_maxProximityThreshold = v5;
    pitchMode = self->_pitchMode;
    if (pitchMode >= 2)
    {
      if (pitchMode == 2)
      {
        +[VKWalkAssistFeedbackProcessor fourPitchesThresholdArray](VKWalkAssistFeedbackProcessor, "fourPitchesThresholdArray");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastObject");
        v14 = (id)objc_claimAutoreleasedReturnValue();

        v10 = v14;
        if (v14)
        {
          maxProximityThreshold = self->_maxProximityThreshold;
          objc_msgSend(v14, "doubleValue");
          v10 = v14;
          if (maxProximityThreshold < v12)
          {
            objc_msgSend(v14, "doubleValue");
            v10 = v14;
            self->_maxProximityThreshold = v13;
          }
        }

      }
    }
    else
    {
      objc_msgSend(&unk_2503CDFB8, "doubleValue");
      if (v7 > v5)
      {
        objc_msgSend(&unk_2503CDFB8, "doubleValue");
        self->_maxProximityThreshold = v8;
      }
    }
  }
}

- (void)_voiceOverStatusChanged
{
  id v3;

  if (UIAccessibilityIsVoiceOverRunning() && self->_shouldPlayAudio)
  {
    -[VKWalkAssistFeedbackProcessor toneGenerator](self, "toneGenerator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startPulse");
  }
  else
  {
    -[VKWalkAssistFeedbackProcessor toneGenerator](self, "toneGenerator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopPulse");
  }

}

- (int)_mmFromMeters:(int)a3
{
  return 1000 * a3;
}

- (int64_t)pitchMode
{
  return self->_pitchMode;
}

- (BOOL)shouldPlayAudio
{
  return self->_shouldPlayAudio;
}

- (VKToneGenerator)toneGenerator
{
  return self->_toneGenerator;
}

- (void)setToneGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_toneGenerator, a3);
}

- (double)minProximityThreshold
{
  return self->_minProximityThreshold;
}

- (void)setMinProximityThreshold:(double)a3
{
  self->_minProximityThreshold = a3;
}

- (double)maxProximityThreshold
{
  return self->_maxProximityThreshold;
}

- (void)setMaxProximityThreshold:(double)a3
{
  self->_maxProximityThreshold = a3;
}

- (BOOL)isFacingLocation
{
  return self->_isFacingLocation;
}

- (void)setIsFacingLocation:(BOOL)a3
{
  self->_isFacingLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toneGenerator, 0);
}

@end
