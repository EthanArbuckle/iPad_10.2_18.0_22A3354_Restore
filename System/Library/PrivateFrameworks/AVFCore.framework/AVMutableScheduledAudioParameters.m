@implementation AVMutableScheduledAudioParameters

+ (id)scheduledAudioParameters
{
  return objc_alloc_init(AVMutableScheduledAudioParameters);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVScheduledAudioParameters *v4;

  v4 = -[AVScheduledAudioParameters init](+[AVScheduledAudioParameters allocWithZone:](AVScheduledAudioParameters, "allocWithZone:", a3), "init");
  if (v4)
    -[AVScheduledAudioParameters _setRamps:](v4, "_setRamps:", -[AVScheduledAudioParameters _ramps](self, "_ramps"));
  return v4;
}

- (void)_setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  __int128 v6;
  _OWORD v7[3];

  v6 = *(_OWORD *)&a5->var0.var3;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  -[AVScheduledAudioParameters _setRamp:](self, "_setRamp:", +[AVScheduledVolumeRamp volumeRampWithStartVolume:endVolume:timeRange:rampMode:](AVScheduledVolumeRamp, "volumeRampWithStartVolume:endVolume:timeRange:rampMode:", v7, a6));
}

- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];

  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The timeRange of a volume ramp must have a numeric start time and a numeric duration."), v5, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0);
    objc_exception_throw(v11);
  }
  v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVMutableScheduledAudioParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v12, 0);
}

- (void)setVolume:(float)a3 atTime:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v11;
  double v12;
  void *v13;
  CMTime v14;
  CMTime start;
  CMTimeRange v16;

  if ((a4->var2 & 0x1D) != 1)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The time of a volume setting must be numeric."), v4, v5, v6, v7, v8, v14.value), 0);
    objc_exception_throw(v13);
  }
  start = *(CMTime *)a4;
  v14 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v16, &start, &v14);
  *(float *)&v11 = a3;
  *(float *)&v12 = a3;
  -[AVMutableScheduledAudioParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", &v16, 0, v11, v12);
}

- (void)setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  _OWORD v12[3];

  if ((a5->var0.var2 & 0x1D) != 1 || (a5->var1.var2 & 0x1D) != 1)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The timeRange of a volume ramp must have a numeric start time and a numeric duration."), a6, v6, v7, v8, v9, *(uint64_t *)&v12[0]), 0);
    objc_exception_throw(v11);
  }
  v10 = *(_OWORD *)&a5->var0.var3;
  v12[0] = *(_OWORD *)&a5->var0.var0;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&a5->var1.var1;
  -[AVMutableScheduledAudioParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v12, a6);
}

@end
