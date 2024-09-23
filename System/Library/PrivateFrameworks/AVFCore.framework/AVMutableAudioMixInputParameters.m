@implementation AVMutableAudioMixInputParameters

+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithTrack:(AVAssetTrack *)track
{
  AVMutableAudioMixInputParameters *v4;

  v4 = objc_alloc_init(AVMutableAudioMixInputParameters);
  if (track)
    -[AVMutableAudioMixInputParameters setTrackID:](v4, "setTrackID:", -[AVAssetTrack trackID](track, "trackID"));
  return v4;
}

+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithTrack:(id)a3 scheduledAudioParameters:(id)a4
{
  AVMutableAudioMixInputParameters *v5;

  v5 = +[AVMutableAudioMixInputParameters audioMixInputParametersWithTrack:](AVMutableAudioMixInputParameters, "audioMixInputParametersWithTrack:", a3);
  -[AVAudioMixInputParameters _setScheduledAudioParameters:](v5, "_setScheduledAudioParameters:", a4);
  return v5;
}

+ (AVMutableAudioMixInputParameters)audioMixInputParameters
{
  return objc_alloc_init(AVMutableAudioMixInputParameters);
}

- (CMPersistentTrackID)trackID
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  return -[AVAudioMixInputParameters trackID](&v3, sel_trackID);
}

- (void)setTrackID:(CMPersistentTrackID)trackID
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  -[AVAudioMixInputParameters setTrackID:](&v3, sel_setTrackID_, *(_QWORD *)&trackID);
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  return -[AVAudioMixInputParameters audioTimePitchAlgorithm](&v3, sel_audioTimePitchAlgorithm);
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  -[AVAudioMixInputParameters setAudioTimePitchAlgorithm:](&v3, sel_setAudioTimePitchAlgorithm_, audioTimePitchAlgorithm);
}

- (MTAudioProcessingTapRef)audioTapProcessor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  return -[AVAudioMixInputParameters audioTapProcessor](&v3, sel_audioTapProcessor);
}

- (void)setAudioTapProcessor:(MTAudioProcessingTapRef)audioTapProcessor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  -[AVAudioMixInputParameters setAudioTapProcessor:](&v3, sel_setAudioTapProcessor_, audioTapProcessor);
}

- (void)setVolumeRampFromStartVolume:(float)startVolume toEndVolume:(float)endVolume timeRange:(CMTimeRange *)timeRange
{
  __int128 v5;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMutableAudioMixInputParameters;
  v5 = *(_OWORD *)&timeRange->start.epoch;
  v6[0] = *(_OWORD *)&timeRange->start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:](&v7, sel_setVolumeRampFromStartVolume_toEndVolume_timeRange_, v6);
}

- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  __int128 v6;
  _OWORD v7[3];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMutableAudioMixInputParameters;
  v6 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  -[AVAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](&v8, sel_setVolumeRampFromStartVolume_toEndVolume_timeRange_rampMode_, v7, a6);
}

- (void)setVolume:(float)volume atTime:(CMTime *)time
{
  CMTime v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMutableAudioMixInputParameters;
  v4 = *time;
  -[AVAudioMixInputParameters setVolume:atTime:](&v5, sel_setVolume_atTime_, &v4);
}

- (void)setDialogLevel:(float)a3 atTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMutableAudioMixInputParameters;
  v4 = *a4;
  -[AVAudioMixInputParameters setDialogLevel:atTime:](&v5, sel_setDialogLevel_atTime_, &v4);
}

- (void)setAmbienceLevel:(float)a3 atTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMutableAudioMixInputParameters;
  v4 = *a4;
  -[AVAudioMixInputParameters setAmbienceLevel:atTime:](&v5, sel_setAmbienceLevel_atTime_, &v4);
}

- (void)setDialogMixBias:(float)a3 atTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMutableAudioMixInputParameters;
  v4 = *a4;
  -[AVAudioMixInputParameters setDialogMixBias:atTime:](&v5, sel_setDialogMixBias_atTime_, &v4);
}

- (void)addEffect:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  -[AVAudioMixInputParameters addEffect:](&v3, sel_addEffect_, a3);
}

- (void)removeEffectParameters:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMutableAudioMixInputParameters;
  -[AVAudioMixInputParameters removeEffect:](&v3, sel_removeEffect_, a3);
}

- (void)removeAllEffects
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVMutableAudioMixInputParameters;
  -[AVAudioMixInputParameters removeAllEffectParameters](&v2, sel_removeAllEffectParameters);
}

+ (AVMutableAudioMixInputParameters)audioMixInputParametersWithAssetTrack:(id)a3 introFadeDuration:(id *)a4 fadeOutStart:(id *)a5 fadeOutDuration:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  CMTimeEpoch v14;
  AVMutableAudioMixInputParameters *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  __int128 v25;
  CMTimeRange v26;
  CMTimeRange v27;
  CMTime time2;
  CMTime time1;

  if ((a4->var2 & 0x1D) != 1
    || (time1 = *(CMTime *)a4,
        v25 = *MEMORY[0x1E0CA2E68],
        *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E68],
        v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16),
        time2.epoch = v14,
        CMTimeCompare(&time1, &time2) < 0))
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("introFadeDuration must be numeric and >= 0");
    goto LABEL_17;
  }
  if ((a5->var2 & 0x1D) == 1)
  {
    time1 = (CMTime)*a5;
    *(_OWORD *)&time2.value = v25;
    time2.epoch = v14;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v23 = CFSTR("fadeOutStart must be >= 0 if numeric");
LABEL_17:
      v24 = (void *)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)v23, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7, v25), 0);
      objc_exception_throw(v24);
    }
  }
  if ((a6->var2 & 0x1D) != 1
    || (time1 = (CMTime)*a6, *(_OWORD *)&time2.value = v25, time2.epoch = v14, CMTimeCompare(&time1, &time2) < 0))
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("fadeOutDuration must be numeric and >= 0");
    goto LABEL_17;
  }
  v15 = objc_alloc_init(AVMutableAudioMixInputParameters);
  if (v15)
  {
    -[AVMutableAudioMixInputParameters setTrackID:](v15, "setTrackID:", objc_msgSend(a3, "trackID"));
    time1 = (CMTime)*a4;
    *(_OWORD *)&time2.value = v25;
    time2.epoch = v14;
    if (CMTimeCompare(&time1, &time2) >= 1)
    {
      *(_OWORD *)&time1.value = v25;
      time1.epoch = v14;
      time2 = (CMTime)*a4;
      CMTimeRangeMake(&v27, &time1, &time2);
      LODWORD(v16) = 0;
      LODWORD(v17) = 1.0;
      -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](v15, "setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", &v27, 1, v16, v17);
    }
    if ((a5->var2 & 0x1D) == 1)
    {
      time1 = (CMTime)*a6;
      *(_OWORD *)&time2.value = v25;
      time2.epoch = v14;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        time1 = (CMTime)*a5;
        time2 = (CMTime)*a6;
        CMTimeRangeMake(&v26, &time1, &time2);
        LODWORD(v18) = 1.0;
        LODWORD(v19) = 0;
        -[AVMutableAudioMixInputParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](v15, "setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", &v26, 1, v18, v19);
      }
    }
  }
  return v15;
}

@end
