@implementation AVScheduledParameterRamp

+ (id)defaultValue
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)a1, a2, v4);
  return 0;
}

+ (NSArray)_defaultAdditionalFigRepresentationObjects
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (AVScheduledParameterRamp)initWithTimeRange:(id *)a3
{
  AVScheduledParameterRamp *result;
  __int128 v5;
  __int128 v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVScheduledParameterRamp;
  result = -[AVScheduledParameterRamp init](&v7, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0.var0;
    v6 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = v6;
    *(_OWORD *)&result->_timeRange.start.value = v5;
  }
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (id)startValue
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (id)endValue
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSArray)_additionalFigRepresentationObjects
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)scheduledParameterRampInterpolatedToTime:(id *)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  CMTimeRange v7;
  CMTimeRange range1;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if (!self)
  {
    memset(&range1, 0, sizeof(range1));
    if (a3)
      goto LABEL_4;
LABEL_7:
    memset(&v7, 0, sizeof(v7));
    goto LABEL_8;
  }
  -[AVScheduledParameterRamp timeRange](self, "timeRange");
  if (!a3)
    goto LABEL_7;
LABEL_4:
  objc_msgSend(a3, "timeRange");
LABEL_8:
  v5 = CMTimeRangeEqual(&range1, &v7);
  if (v5)
  {
    v5 = objc_msgSend(-[AVScheduledParameterRamp startValue](self, "startValue"), "isEqual:", objc_msgSend(a3, "startValue"));
    if (v5)
    {
      v5 = objc_msgSend(-[AVScheduledParameterRamp endValue](self, "endValue"), "isEqual:", objc_msgSend(a3, "endValue"));
      if (v5)
        LOBYTE(v5) = -[NSArray isEqual:](-[AVScheduledParameterRamp _additionalFigRepresentationObjects](self, "_additionalFigRepresentationObjects"), "isEqual:", objc_msgSend(a3, "_additionalFigRepresentationObjects"));
    }
  }
  return v5;
}

- (unint64_t)hash
{
  CMTimeEpoch v3;
  CMTimeEpoch v4;
  uint64_t v5;
  uint64_t v6;
  $95D729B680665BEAEFA1D6FCA8238556 start;

  start = self->_timeRange.start;
  v3 = CMTimeHash((CMTime *)&start);
  start = self->_timeRange.duration;
  v4 = CMTimeHash((CMTime *)&start) ^ v3;
  v5 = objc_msgSend(-[AVScheduledParameterRamp startValue](self, "startValue"), "hash");
  v6 = v4 ^ v5 ^ objc_msgSend(-[AVScheduledParameterRamp endValue](self, "endValue"), "hash");
  return v6 ^ -[NSArray hash](-[AVScheduledParameterRamp _additionalFigRepresentationObjects](self, "_additionalFigRepresentationObjects"), "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const __CFAllocator *v6;
  __int128 v7;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, timeRange:%@ startValue:%@ endValue:%@ extras:%@>"), v5, self, (id)CMTimeRangeCopyDescription(v6, &range), -[AVScheduledParameterRamp startValue](self, "startValue"), -[AVScheduledParameterRamp endValue](self, "endValue"), -[AVScheduledParameterRamp _additionalFigRepresentationObjects](self, "_additionalFigRepresentationObjects"));
}

+ (id)scheduledParameterRampWithPropertyList:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPropertyList:", a3);
}

- (AVScheduledParameterRamp)initWithPropertyList:(id)a3
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v5);
  return 0;
}

- (id)propertyList
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

@end
