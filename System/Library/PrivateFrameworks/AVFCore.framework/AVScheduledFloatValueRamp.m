@implementation AVScheduledFloatValueRamp

+ (id)defaultValue
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "defaultFloatValue");
  return (id)objc_msgSend(v2, "numberWithFloat:");
}

+ (float)defaultFloatValue
{
  return 1.0;
}

+ (id)scheduledFloatValueRampWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5
{
  id v8;
  __int128 v9;
  _OWORD v11[2];

  v8 = objc_alloc((Class)objc_opt_class());
  v9 = *(_OWORD *)&a5->var0.var3;
  v11[0] = *(_OWORD *)&a5->var0.var0;
  v11[1] = v9;
  *(float *)&v9 = a4;
  return (id)objc_msgSend(v8, "initWithStartValue:endValue:timeRange:", v11, COERCE_DOUBLE(__PAIR64__(HIDWORD(*(_QWORD *)&a5->var1.var1), LODWORD(a3))), *(double *)&v9);
}

- (AVScheduledFloatValueRamp)initWithStartValue:(float)a3 endValue:(float)a4 timeRange:(id *)a5
{
  __int128 v7;
  AVScheduledFloatValueRamp *v8;
  void *v9;
  double v10;
  float v11;
  void *v12;
  double v13;
  float v14;
  _OWORD v16[3];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVScheduledFloatValueRamp;
  v7 = *(_OWORD *)&a5->var0.var3;
  v16[0] = *(_OWORD *)&a5->var0.var0;
  v16[1] = v7;
  v16[2] = *(_OWORD *)&a5->var1.var1;
  v8 = -[AVScheduledParameterRamp initWithTimeRange:](&v17, sel_initWithTimeRange_, v16);
  if (v8)
  {
    v9 = (void *)objc_opt_class();
    *(float *)&v10 = a3;
    objc_msgSend(v9, "boundsAdjustedFloatValue:", v10);
    v8->_startValue = v11;
    v12 = (void *)objc_opt_class();
    *(float *)&v13 = a4;
    objc_msgSend(v12, "boundsAdjustedFloatValue:", v13);
    v8->_endValue = v14;
  }
  return v8;
}

- (id)startValue
{
  double v2;

  *(float *)&v2 = self->_startValue;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
}

- (float)startFloatValue
{
  return self->_startValue;
}

- (id)endValue
{
  double v2;

  *(float *)&v2 = self->_endValue;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
}

- (float)endFloatValue
{
  return self->_endValue;
}

- (int64_t)_parameterRampMode
{
  return 0;
}

- (float)_interpolatedValueAtTime:(id *)a3
{
  double Seconds;
  double v6;
  int64_t v7;
  double v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  CMTime v17;
  CMTime v18;
  CMTime time;
  __int128 v20;
  _OWORD v21[2];

  memset(v21, 0, sizeof(v21));
  v20 = 0u;
  if (self && (-[AVScheduledParameterRamp timeRange](self, "timeRange"), (BYTE4(v21[1]) & 0x1D) == 1))
  {
    time = *(CMTime *)((char *)v21 + 8);
    Seconds = CMTimeGetSeconds(&time);
    time = (CMTime)*a3;
    *(_OWORD *)&v17.value = v20;
    v17.epoch = *(_QWORD *)&v21[0];
    CMTimeSubtract(&v18, &time, &v17);
    v6 = CMTimeGetSeconds(&v18) / Seconds;
    v7 = -[AVScheduledFloatValueRamp _parameterRampMode](self, "_parameterRampMode");
    if (!v7)
    {
LABEL_9:
      -[AVScheduledFloatValueRamp endFloatValue](self, "endFloatValue");
      v13 = v12;
      -[AVScheduledFloatValueRamp startFloatValue](self, "startFloatValue");
      v15 = (float)(v13 - v14);
      -[AVScheduledFloatValueRamp startFloatValue](self, "startFloatValue");
      *(float *)&v8 = *(float *)&v8 + v15 * v6;
      return *(float *)&v8;
    }
    LODWORD(v8) = 0;
    if (v7 == 1)
    {
      -[AVScheduledFloatValueRamp endFloatValue](self, "endFloatValue", v8);
      v10 = v9;
      -[AVScheduledFloatValueRamp startFloatValue](self, "startFloatValue");
      if (v10 <= v11)
        v6 = sin((v6 + -1.0) * 0.5 * 3.14159265) + 1.0;
      else
        v6 = sin(v6 * 0.5 * 3.14159265);
      goto LABEL_9;
    }
  }
  else
  {
    -[AVScheduledFloatValueRamp endFloatValue](self, "endFloatValue", a3);
  }
  return *(float *)&v8;
}

- (id)_makeRampWithTruncatedTimeRange:(id *)a3 endValue:(float)a4
{
  void *v6;
  __int128 v7;
  _OWORD v9[3];

  v6 = (void *)objc_opt_class();
  -[AVScheduledFloatValueRamp startFloatValue](self, "startFloatValue");
  v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  return (id)objc_msgSend(v6, "scheduledFloatValueRampWithStartValue:endValue:timeRange:", v9);
}

- (id)scheduledParameterRampInterpolatedToTime:(id *)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  void *v14;
  CMTime start;
  CMTime time;
  CMTimeRange range;
  CMTime time2;
  CMTimeRange v19;

  memset(&v19, 0, sizeof(v19));
  if (self)
    -[AVScheduledParameterRamp timeRange](self, "timeRange");
  range = v19;
  CMTimeRangeGetEnd(&time2, &range);
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
  range.start.epoch = a3->var3;
  if (!CMTimeCompare(&range.start, &time2))
    return (id)-[AVScheduledFloatValueRamp copy](self, "copy");
  range = v19;
  time = (CMTime)*a3;
  if (!CMTimeRangeContainsTime(&range, &time))
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("can't interpolate outside of the timeRange of the receiver"), v6, v7, v8, v9, v10, start.value), 0);
    objc_exception_throw(v14);
  }
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0;
  range.start.epoch = a3->var3;
  -[AVScheduledFloatValueRamp _interpolatedValueAtTime:](self, "_interpolatedValueAtTime:", &range);
  v12 = v11;
  time = (CMTime)*a3;
  start = v19.start;
  CMTimeSubtract(&range.start, &time, &start);
  v19.duration = range.start;
  range = v19;
  return -[AVScheduledFloatValueRamp _makeRampWithTruncatedTimeRange:endValue:](self, "_makeRampWithTruncatedTimeRange:endValue:", &range, COERCE_DOUBLE(__PAIR64__(v19.duration.flags, v12)));
}

- (AVScheduledFloatValueRamp)initWithPropertyList:(id)a3
{
  uint64_t v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  CMTimeValue v11;
  double v12;
  CMTimeEpoch v13;
  int v14;
  double v15;
  AVScheduledFloatValueRamp *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  AVScheduledFloatValueRamp *v26;
  void *v27;
  double v28;
  CMTime duration;
  CMTime start;
  CMTimeRange v31;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = self;
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = "[propertyList isKindOfClass:[NSDictionary class]]";
LABEL_15:
    v27 = (void *)objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v18, v19, v20, v21, v22, (uint64_t)v25), 0);
    objc_exception_throw(v27);
  }
  v6 = MEMORY[0x1E0CA2E40];
  value = *MEMORY[0x1E0CA2E40];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
  v7 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("timeRange"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CMTimeRangeMakeFromDictionary(&v31, v7);
    goto LABEL_6;
  }
  v8 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("time"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CMTimeMakeFromDictionary(&start, v8);
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
    CMTimeRangeMake(&v31, &start, &duration);
LABEL_6:
    value = v31.start.value;
    flags = v31.start.flags;
    timescale = v31.start.timescale;
    epoch = v31.start.epoch;
    v11 = v31.duration.value;
    v12 = *(double *)&v31.duration.timescale;
    v13 = v31.duration.epoch;
    if ((v31.start.flags & 1) == 0)
      goto LABEL_13;
    goto LABEL_9;
  }
  flags = *(_DWORD *)(v6 + 12);
  epoch = *(_QWORD *)(v6 + 16);
  v11 = *(_QWORD *)(v6 + 24);
  v12 = *(double *)(v6 + 32);
  v13 = *(_QWORD *)(v6 + 40);
  if ((flags & 1) == 0)
  {
LABEL_13:
    v17 = self;
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v25 = "CMTIMERANGE_IS_VALID(timeRange)";
    goto LABEL_15;
  }
LABEL_9:
  if ((BYTE4(v12) & 1) == 0 || v13 || v11 < 0)
    goto LABEL_13;
  v28 = v12;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("startValue")), "floatValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("endValue")), "floatValue");
  LODWORD(v15) = v14;
  v31.start.value = value;
  v31.start.timescale = timescale;
  v31.start.flags = flags;
  v31.start.epoch = epoch;
  v31.duration.value = v11;
  *(double *)&v31.duration.timescale = v28;
  v31.duration.epoch = 0;
  return -[AVScheduledFloatValueRamp initWithStartValue:endValue:timeRange:](self, "initWithStartValue:endValue:timeRange:", &v31, v28, v15);
}

- (id)propertyList
{
  _BOOL4 v3;
  void *v4;
  id v5;
  id v6;
  CFDictionaryRef v7;
  const __CFString *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  if (self)
  {
    -[AVScheduledParameterRamp timeRange](self, "timeRange");
    v3 = (BYTE4(v15) & 0x1D) == 1;
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = -[AVScheduledFloatValueRamp startValue](self, "startValue");
  v6 = -[AVScheduledFloatValueRamp endValue](self, "endValue");
  if (v3)
  {
    v10 = v13;
    v11 = v14;
    v12 = v15;
    v7 = AVDictionaryWithTimeRange(&v10);
    v8 = CFSTR("timeRange");
  }
  else
  {
    v10 = v13;
    *(_QWORD *)&v11 = v14;
    v7 = AVDictionaryWithTime((CMTime *)&v10);
    v8 = CFSTR("time");
  }
  return (id)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, CFSTR("startValue"), v6, CFSTR("endValue"), v7, v8, 0);
}

@end
