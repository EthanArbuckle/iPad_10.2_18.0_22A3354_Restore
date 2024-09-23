@implementation AVAudioMixInputParameters

- (AVAudioMixInputParameters)init
{
  AVAudioMixInputParameters *v2;
  AVAudioMixInputParametersInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVAudioMixInputParameters;
  v2 = -[AVAudioMixInputParameters init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVAudioMixInputParametersInternal);
    v2->_inputParameters = v3;
    if (v3)
    {
      CFRetain(v3);
      v2->_inputParameters->scheduledAudioParameters = 0;
      v2->_inputParameters->trackID = 0;
      v2->_inputParameters->tap = 0;
      v2->_inputParameters->effects = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  AVAudioMixInputParametersInternal *inputParameters;
  opaqueMTAudioProcessingTap *tap;
  objc_super v5;

  inputParameters = self->_inputParameters;
  if (inputParameters)
  {
    tap = inputParameters->tap;
    if (tap)
    {
      CFRelease(tap);
      inputParameters = self->_inputParameters;
    }

    CFRelease(self->_inputParameters);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAudioMixInputParameters;
  -[AVAudioMixInputParameters dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, track ID = %d, audioTimePitchAlgorithm: %@, audioTapProcessor: %p, volume mix: %@>"), NSStringFromClass(v4), self, -[AVAudioMixInputParameters trackID](self, "trackID"), -[AVAudioMixInputParameters audioTimePitchAlgorithm](self, "audioTimePitchAlgorithm"), -[AVAudioMixInputParameters audioTapProcessor](self, "audioTapProcessor"), -[AVAudioMixInputParameters _volumeCurveAsString](self, "_volumeCurveAsString"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVAudioMixInputParameters *v5;
  AVAudioMixInputParameters *v6;
  NSMutableArray *effects;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[AVAudioMixInputParameters isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return self;
  v5 = -[AVAudioMixInputParameters init](+[AVAudioMixInputParameters allocWithZone:](AVAudioMixInputParameters, "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    -[AVAudioMixInputParameters setTrackID:](v5, "setTrackID:", self->_inputParameters->trackID);
    -[AVAudioMixInputParameters _setScheduledAudioParameters:](v6, "_setScheduledAudioParameters:", self->_inputParameters->scheduledAudioParameters);
    -[AVAudioMixInputParameters setAudioTimePitchAlgorithm:](v6, "setAudioTimePitchAlgorithm:", self->_inputParameters->audioTimePitchAlgorithm);
    -[AVAudioMixInputParameters setAudioTapProcessor:](v6, "setAudioTapProcessor:", self->_inputParameters->tap);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    effects = self->_inputParameters->effects;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](effects, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(effects);
          -[AVAudioMixInputParameters addEffect:](v6, "addEffect:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](effects, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
  }
  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  AVMutableAudioMixInputParameters *v4;
  AVMutableAudioMixInputParameters *v5;
  NSMutableArray *effects;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[AVAudioMixInputParameters init](+[AVMutableAudioMixInputParameters allocWithZone:](AVMutableAudioMixInputParameters, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    -[AVMutableAudioMixInputParameters setTrackID:](v4, "setTrackID:", self->_inputParameters->trackID);
    -[AVAudioMixInputParameters _setScheduledAudioParameters:](v5, "_setScheduledAudioParameters:", self->_inputParameters->scheduledAudioParameters);
    -[AVMutableAudioMixInputParameters setAudioTimePitchAlgorithm:](v5, "setAudioTimePitchAlgorithm:", self->_inputParameters->audioTimePitchAlgorithm);
    -[AVMutableAudioMixInputParameters setAudioTapProcessor:](v5, "setAudioTapProcessor:", self->_inputParameters->tap);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    effects = self->_inputParameters->effects;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](effects, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(effects);
          -[AVMutableAudioMixInputParameters addEffect:](v5, "addEffect:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](effects, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AVAudioMixInputParametersInternal *inputParameters;
  uint64_t v6;
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  uint64_t v8;
  int v9;
  NSString *audioTimePitchAlgorithm;
  _QWORD *v11;
  uint64_t v12;
  NSMutableArray *effects;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  inputParameters = self->_inputParameters;
  v6 = *((_QWORD *)a3 + 1);
  if (inputParameters->trackID != *(_DWORD *)(v6 + 8))
    goto LABEL_12;
  scheduledAudioParameters = inputParameters->scheduledAudioParameters;
  v8 = *(_QWORD *)(v6 + 16);
  if (scheduledAudioParameters)
  {
    v9 = -[AVScheduledAudioParameters isEqual:](scheduledAudioParameters, "isEqual:", v8);
    if (!v9)
      return v9;
    inputParameters = self->_inputParameters;
  }
  else if (v8)
  {
    goto LABEL_12;
  }
  audioTimePitchAlgorithm = inputParameters->audioTimePitchAlgorithm;
  v11 = (_QWORD *)*((_QWORD *)a3 + 1);
  v12 = v11[3];
  if (audioTimePitchAlgorithm)
  {
    v9 = -[NSString isEqualToString:](audioTimePitchAlgorithm, "isEqualToString:", v12);
    if (!v9)
      return v9;
    inputParameters = self->_inputParameters;
    v11 = (_QWORD *)*((_QWORD *)a3 + 1);
    goto LABEL_11;
  }
  if (v12)
  {
LABEL_12:
    LOBYTE(v9) = 0;
    return v9;
  }
LABEL_11:
  if (inputParameters->tap != (opaqueMTAudioProcessingTap *)v11[4])
    goto LABEL_12;
  effects = inputParameters->effects;
  if (effects == (NSMutableArray *)v11[5] || (v9 = -[NSMutableArray isEqual:](effects, "isEqual:")) != 0)
    LOBYTE(v9) = 1;
  return v9;
}

- (unint64_t)hash
{
  AVAudioMixInputParametersInternal *inputParameters;
  uint64_t trackID;
  uint64_t v5;
  AVAudioMixInputParametersInternal *v6;
  opaqueMTAudioProcessingTap *tap;
  CFHashCode v8;
  uint64_t v9;

  inputParameters = self->_inputParameters;
  trackID = inputParameters->trackID;
  v5 = -[AVScheduledAudioParameters hash](inputParameters->scheduledAudioParameters, "hash");
  v6 = self->_inputParameters;
  tap = v6->tap;
  if (tap)
  {
    v8 = CFHash(tap);
    v6 = self->_inputParameters;
  }
  else
  {
    v8 = 0;
  }
  v9 = v5 ^ trackID ^ v8 ^ -[NSString hash](v6->audioTimePitchAlgorithm, "hash");
  return v9 ^ -[NSMutableArray hash](self->_inputParameters->effects, "hash");
}

- (CMPersistentTrackID)trackID
{
  return self->_inputParameters->trackID;
}

- (void)setTrackID:(int)a3
{
  self->_inputParameters->trackID = a3;
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  return self->_inputParameters->audioTimePitchAlgorithm;
}

- (void)setAudioTimePitchAlgorithm:(id)a3
{
  NSString *v4;

  v4 = (NSString *)objc_msgSend(a3, "copy");

  self->_inputParameters->audioTimePitchAlgorithm = v4;
}

- (MTAudioProcessingTapRef)audioTapProcessor
{
  return self->_inputParameters->tap;
}

- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3
{
  AVAudioMixInputParametersInternal *inputParameters;
  opaqueMTAudioProcessingTap *tap;

  if (a3)
    CFRetain(a3);
  inputParameters = self->_inputParameters;
  tap = inputParameters->tap;
  if (tap)
  {
    CFRelease(tap);
    inputParameters = self->_inputParameters;
  }
  inputParameters->tap = a3;
}

- (void)checkEffectPrecondition:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (a3
    && (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0
    && (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0
    && (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Sent unknown effect type"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
}

- (id)effectParameters
{
  id result;

  result = (id)-[NSMutableArray count](self->_inputParameters->effects, "count");
  if (result)
    return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_inputParameters->effects, "objectAtIndexedSubscript:", 0);
  return result;
}

- (void)setEffectParameters:(id)a3
{
  void *v5;
  id v6;

  -[AVAudioMixInputParameters checkEffectPrecondition:](self, "checkEffectPrecondition:");
  v6 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray removeAllObjects](self->_inputParameters->effects, "removeAllObjects");
  v5 = v6;
  if (v6)
  {
    -[NSMutableArray addObject:](self->_inputParameters->effects, "addObject:", v6);
    v5 = v6;
  }

}

- (id)effects
{
  return self->_inputParameters->effects;
}

- (void)checkEffectsPrecondition:(id)a3
{
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15[5];
  char v16;

  -[AVAudioMixInputParameters checkEffectPrecondition:](self, "checkEffectPrecondition:");
  v6 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  v7 = -[AVAudioMixInputParameters effects](self, "effects");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = (uint64_t)__54__AVAudioMixInputParameters_checkEffectsPrecondition___block_invoke;
  v15[3] = (uint64_t)&unk_1E3034020;
  v16 = v6;
  v15[4] = (uint64_t)a3;
  if (objc_msgSend((id)objc_msgSend(v7, "indexesOfObjectsPassingTest:", v15), "count"))
  {
    if (v6)
      v13 = CFSTR("Sent same instance of AVAudioMixProcessingEffect multiple times");
    else
      v13 = CFSTR("Sent multiple instance of an effect type");
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v8, v9, v10, v11, v12, v15[0]), 0);
    objc_exception_throw(v14);
  }
}

uint64_t __54__AVAudioMixInputParameters_checkEffectsPrecondition___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
  else
    return objc_msgSend(*(id *)(a1 + 32), "isMemberOfClass:", objc_opt_class());
}

- (void)addEffect:(id)a3
{
  id v5;

  -[AVAudioMixInputParameters checkEffectsPrecondition:](self, "checkEffectsPrecondition:");
  v5 = (id)objc_msgSend(a3, "copy");
  -[NSMutableArray addObject:](self->_inputParameters->effects, "addObject:", v5);

}

- (void)removeEffect:(id)a3
{
  -[NSMutableArray removeObject:](self->_inputParameters->effects, "removeObject:", a3);
}

- (void)removeAllEffectParameters
{
  -[NSMutableArray removeAllObjects](self->_inputParameters->effects, "removeAllObjects");
}

- (void)_setVolumeRampFromStartVolume:(float)a3 toEndVolume:(float)a4 timeRange:(id *)a5 rampMode:(int64_t)a6
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  __int128 v12;
  _OWORD v13[2];

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  if (!scheduledAudioParameters)
  {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
    scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  }
  v12 = *(_OWORD *)&a5->var0.var3;
  v13[0] = *(_OWORD *)&a5->var0.var0;
  v13[1] = v12;
  *(float *)&v12 = a4;
  -[AVMutableScheduledAudioParameters setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](scheduledAudioParameters, "setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v13, a6 == 1, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(_QWORD *)&a5->var1.var1), LODWORD(a3))), *(double *)&v12);
}

- (void)_setVolume:(float)a3 atTime:(id *)a4
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  __int128 v8;
  int64_t var3;

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  if (!scheduledAudioParameters)
  {
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
    scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  }
  v8 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  -[AVMutableScheduledAudioParameters setVolume:atTime:](scheduledAudioParameters, "setVolume:atTime:", &v8, COERCE_DOUBLE(__PAIR64__(DWORD1(v8), LODWORD(a3))));
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
  -[AVAudioMixInputParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v12, 0);
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
  -[AVAudioMixInputParameters _setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:](self, "_setVolumeRampFromStartVolume:toEndVolume:timeRange:rampMode:", v12, a6);
}

- (void)setVolume:(float)a3 atTime:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  if ((a4->var2 & 0x1D) != 1)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The time of a volume setting must be numeric."), v4, v5, v6, v7, v8, v10.var0), 0);
    objc_exception_throw(v9);
  }
  v10 = *a4;
  -[AVAudioMixInputParameters _setVolume:atTime:](self, "_setVolume:atTime:", &v10);
}

- (BOOL)getVolumeRampForTime:(CMTime *)time startVolume:(float *)startVolume endVolume:(float *)endVolume timeRange:(CMTimeRange *)timeRange
{
  CMTime v7;

  v7 = *time;
  return -[AVAudioMixInputParameters getVolumeRampForTime:startVolume:endVolume:timeRange:rampMode:](self, "getVolumeRampForTime:startVolume:endVolume:timeRange:rampMode:", &v7, startVolume, endVolume, timeRange, 0);
}

- (BOOL)getVolumeRampForTime:(id *)a3 startVolume:(float *)a4 endVolume:(float *)a5 timeRange:(id *)a6 rampMode:(int64_t *)a7
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  uint64_t v11;

  v11 = 0;
  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  if (scheduledAudioParameters)
  {
    v10 = *a3;
    LODWORD(scheduledAudioParameters) = -[AVScheduledAudioParameters getVolumeRampForTime:startVolume:endVolume:timeRange:rampMode:](scheduledAudioParameters, "getVolumeRampForTime:startVolume:endVolume:timeRange:rampMode:", &v10, a4, a5, a6, &v11);
    if (a7)
    {
      if ((_DWORD)scheduledAudioParameters)
      {
        *a7 = v11 == 1;
        LOBYTE(scheduledAudioParameters) = 1;
      }
    }
  }
  return (char)scheduledAudioParameters;
}

- (void)setDialogLevel:(float)a3 atTime:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  CMTimeRange v16;
  CMTime time2;
  CMTime time1;

  time1 = *(CMTime *)a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0);
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters)
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  time1 = (CMTime)*a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&v13 = a3;
  *(float *)&v14 = a3;
  -[AVScheduledAudioParameters _setRamp:](self->_inputParameters->scheduledAudioParameters, "_setRamp:", +[AVDialogLevelRamp dialogLevelRampWithStartValue:endValue:timeRange:](AVDialogLevelRamp, "dialogLevelRampWithStartValue:endValue:timeRange:", &v16, v13, v14));
}

- (BOOL)getDialogLevelRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  v11 = objc_opt_class();
  v17 = *a3;
  v12 = -[AVScheduledAudioParameters _getRampOfClass:forTime:timeRange:](scheduledAudioParameters, "_getRampOfClass:forTime:timeRange:", v11, &v17, a6);
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      objc_msgSend(v12, "startFloatValue");
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      objc_msgSend(v13, "endFloatValue");
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setAmbienceLevel:(float)a3 atTime:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  CMTimeRange v16;
  CMTime time2;
  CMTime time1;

  time1 = *(CMTime *)a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0);
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters)
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  time1 = (CMTime)*a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&v13 = a3;
  *(float *)&v14 = a3;
  -[AVScheduledAudioParameters _setRamp:](self->_inputParameters->scheduledAudioParameters, "_setRamp:", +[AVAmbienceLevelRamp ambienceLevelRampWithStartValue:endValue:timeRange:](AVAmbienceLevelRamp, "ambienceLevelRampWithStartValue:endValue:timeRange:", &v16, v13, v14));
}

- (BOOL)getAmbienceLevelRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  v11 = objc_opt_class();
  v17 = *a3;
  v12 = -[AVScheduledAudioParameters _getRampOfClass:forTime:timeRange:](scheduledAudioParameters, "_getRampOfClass:forTime:timeRange:", v11, &v17, a6);
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      objc_msgSend(v12, "startFloatValue");
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      objc_msgSend(v13, "endFloatValue");
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setDialogMixBias:(float)a3 atTime:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  CMTimeRange v19;
  CMTime time2;
  CMTime time1;

  time1 = *(CMTime *)a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = "CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)";
    goto LABEL_9;
  }
  if (a3 < 0.0 || a3 > 1.0)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = "dialogMixBias >= 0.0 && dialogMixBias <= 1.0";
LABEL_9:
    v18 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)v17), 0);
    objc_exception_throw(v18);
  }
  if (!self->_inputParameters->scheduledAudioParameters)
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  time1 = (CMTime)*a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v19, &time1, &time2);
  *(float *)&v13 = a3;
  *(float *)&v14 = a3;
  -[AVScheduledAudioParameters _setRamp:](self->_inputParameters->scheduledAudioParameters, "_setRamp:", +[AVDialogMixBiasRamp dialogMixBiasRampWithStartValue:endValue:timeRange:](AVDialogMixBiasRamp, "dialogMixBiasRampWithStartValue:endValue:timeRange:", &v19, v13, v14));
}

- (BOOL)getDialogMixBiasRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  v11 = objc_opt_class();
  v17 = *a3;
  v12 = -[AVScheduledAudioParameters _getRampOfClass:forTime:timeRange:](scheduledAudioParameters, "_getRampOfClass:forTime:timeRange:", v11, &v17, a6);
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      objc_msgSend(v12, "startFloatValue");
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      objc_msgSend(v13, "endFloatValue");
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setDialogLoudness:(float)a3 atTime:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  CMTimeRange v16;
  CMTime time2;
  CMTime time1;

  time1 = *(CMTime *)a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0);
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters)
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  time1 = (CMTime)*a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&v13 = a3;
  *(float *)&v14 = a3;
  -[AVScheduledAudioParameters _setRamp:](self->_inputParameters->scheduledAudioParameters, "_setRamp:", +[AVDialogLoudnessRamp dialogLoudnessRampWithStartValue:endValue:timeRange:](AVDialogLoudnessRamp, "dialogLoudnessRampWithStartValue:endValue:timeRange:", &v16, v13, v14));
}

- (BOOL)getDialogLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  v11 = objc_opt_class();
  v17 = *a3;
  v12 = -[AVScheduledAudioParameters _getRampOfClass:forTime:timeRange:](scheduledAudioParameters, "_getRampOfClass:forTime:timeRange:", v11, &v17, a6);
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      objc_msgSend(v12, "startFloatValue");
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      objc_msgSend(v13, "endFloatValue");
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setAmbienceLoudness:(float)a3 atTime:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  CMTimeRange v16;
  CMTime time2;
  CMTime time1;

  time1 = *(CMTime *)a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0);
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters)
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  time1 = (CMTime)*a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&v13 = a3;
  *(float *)&v14 = a3;
  -[AVScheduledAudioParameters _setRamp:](self->_inputParameters->scheduledAudioParameters, "_setRamp:", +[AVAmbienceLoudnessRamp ambienceLoudnessRampWithStartValue:endValue:timeRange:](AVAmbienceLoudnessRamp, "ambienceLoudnessRampWithStartValue:endValue:timeRange:", &v16, v13, v14));
}

- (BOOL)getAmbienceLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  v11 = objc_opt_class();
  v17 = *a3;
  v12 = -[AVScheduledAudioParameters _getRampOfClass:forTime:timeRange:](scheduledAudioParameters, "_getRampOfClass:forTime:timeRange:", v11, &v17, a6);
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      objc_msgSend(v12, "startFloatValue");
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      objc_msgSend(v13, "endFloatValue");
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setRecordingLoudness:(float)a3 atTime:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  CMTimeRange v16;
  CMTime time2;
  CMTime time1;

  time1 = *(CMTime *)a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0);
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters)
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  time1 = (CMTime)*a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&v13 = a3;
  *(float *)&v14 = a3;
  -[AVScheduledAudioParameters _setRamp:](self->_inputParameters->scheduledAudioParameters, "_setRamp:", +[AVRecordingLoudnessRamp recordingLoudnessRampWithStartValue:endValue:timeRange:](AVRecordingLoudnessRamp, "recordingLoudnessRampWithStartValue:endValue:timeRange:", &v16, v13, v14));
}

- (BOOL)getRecordingLoudnessRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  v11 = objc_opt_class();
  v17 = *a3;
  v12 = -[AVScheduledAudioParameters _getRampOfClass:forTime:timeRange:](scheduledAudioParameters, "_getRampOfClass:forTime:timeRange:", v11, &v17, a6);
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      objc_msgSend(v12, "startFloatValue");
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      objc_msgSend(v13, "endFloatValue");
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)setRenderingStyle:(float)a3 atTime:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  CMTimeRange v16;
  CMTime time2;
  CMTime time1;

  time1 = *(CMTime *)a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)"CMTIME_COMPARE_INLINE(time, ==, kCMTimeZero)"), 0);
    objc_exception_throw(v15);
  }
  if (!self->_inputParameters->scheduledAudioParameters)
    self->_inputParameters->scheduledAudioParameters = objc_alloc_init(AVMutableScheduledAudioParameters);
  time1 = (CMTime)*a4;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v16, &time1, &time2);
  *(float *)&v13 = a3;
  *(float *)&v14 = a3;
  -[AVScheduledAudioParameters _setRamp:](self->_inputParameters->scheduledAudioParameters, "_setRamp:", +[AVRenderingStyleRamp renderingStyleRampWithStartValue:endValue:timeRange:](AVRenderingStyleRamp, "renderingStyleRampWithStartValue:endValue:timeRange:", &v16, v13, v14));
}

- (BOOL)getRenderingStyleRampForTime:(id *)a3 startValue:(float *)a4 endValue:(float *)a5 timeRange:(id *)a6
{
  AVMutableScheduledAudioParameters *scheduledAudioParameters;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  scheduledAudioParameters = self->_inputParameters->scheduledAudioParameters;
  v11 = objc_opt_class();
  v17 = *a3;
  v12 = -[AVScheduledAudioParameters _getRampOfClass:forTime:timeRange:](scheduledAudioParameters, "_getRampOfClass:forTime:timeRange:", v11, &v17, a6);
  v13 = v12;
  if (v12)
  {
    if (a4)
    {
      objc_msgSend(v12, "startFloatValue");
      *(_DWORD *)a4 = v14;
    }
    if (a5)
    {
      objc_msgSend(v13, "endFloatValue");
      *(_DWORD *)a5 = v15;
    }
  }
  return v13 != 0;
}

- (void)_setScheduledAudioParameters:(id)a3
{
  AVMutableScheduledAudioParameters *v4;

  v4 = (AVMutableScheduledAudioParameters *)objc_msgSend(a3, "mutableCopy");

  self->_inputParameters->scheduledAudioParameters = v4;
}

- (id)_scheduledAudioParameters
{
  return (id)-[AVMutableScheduledAudioParameters copy](self->_inputParameters->scheduledAudioParameters, "copy");
}

- (id)_audioVolumeCurve
{
  return -[AVScheduledAudioParameters _audioVolumeCurve](self->_inputParameters->scheduledAudioParameters, "_audioVolumeCurve");
}

- (id)_figProcessingEffectsScheduledParameters
{
  void *v3;
  uint64_t v4;
  _QWORD v6[6];

  v3 = (void *)-[NSMutableArray indexesOfObjectsPassingTest:](self->_inputParameters->effects, "indexesOfObjectsPassingTest:", &__block_literal_global_23);
  v4 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__AVAudioMixInputParameters__figProcessingEffectsScheduledParameters__block_invoke_2;
  v6[3] = &unk_1E3034048;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, *MEMORY[0x1E0CC3E18]);
}

uint64_t __69__AVAudioMixInputParameters__figProcessingEffectsScheduledParameters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMemberOfClass:", objc_opt_class());
}

uint64_t __69__AVAudioMixInputParameters__figProcessingEffectsScheduledParameters__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", objc_msgSend(v3, "_figSchedule"), objc_msgSend(v3, "_figIdentifier"));
}

- (id)_figAudioCurves
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[AVAudioMixInputParameters _figProcessingEffectsScheduledParameters](self, "_figProcessingEffectsScheduledParameters"));
  objc_msgSend(v3, "addEntriesFromDictionary:", -[AVScheduledAudioParameters _figAudioCurves](self->_inputParameters->scheduledAudioParameters, "_figAudioCurves"));
  return v3;
}

- (id)_volumeCurveAsString
{
  return -[AVScheduledAudioParameters _volumeCurveAsString](self->_inputParameters->scheduledAudioParameters, "_volumeCurveAsString");
}

@end
