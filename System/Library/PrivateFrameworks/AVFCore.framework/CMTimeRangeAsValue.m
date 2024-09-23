@implementation CMTimeRangeAsValue

+ (id)valueWithCMTimeRange:(id *)a3
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = objc_msgSend(objc_allocWithZone((Class)a1), "init");
  v6 = *(_OWORD *)&a3->var0.var3;
  v5 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)(v4 + 24) = v6;
  *(_OWORD *)(v4 + 40) = v5;
  return (id)v4;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)CMTimeRangeValue
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (void)getValue:(void *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&self->_timeRange.start.epoch;
  v3 = *(_OWORD *)&self->_timeRange.duration.timescale;
  *(_OWORD *)a3 = *(_OWORD *)&self->_timeRange.start.value;
  *((_OWORD *)a3 + 1) = v4;
  *((_OWORD *)a3 + 2) = v3;
}

- (const)objCType
{
  return "{?={?=qiIq}{?=qiIq}}";
}

- (id)description
{
  void *v2;
  const __CFAllocator *v3;
  CMTimeRange range;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (self)
    -[CMTimeRangeAsValue CMTimeRangeValue](self, "CMTimeRangeValue");
  else
    memset(&range, 0, sizeof(range));
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("CMTimeRange: %@"), (id)CMTimeRangeCopyDescription(v3, &range));
}

- (BOOL)isEqualToValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  $11E8FAD63EF01618BAA11C8CE4E61C06 *p_timeRange;
  __int128 v9;
  CMTimeRange v10;
  CMTimeRange range2;
  uint64_t v12;
  uint64_t v13;

  if (self == a3)
    return 1;
  v12 = v3;
  v13 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  p_timeRange = &self->_timeRange;
  if (a3)
    objc_msgSend(a3, "CMTimeRangeValue");
  else
    memset(&range2, 0, sizeof(range2));
  v9 = *(_OWORD *)&p_timeRange->start.epoch;
  *(_OWORD *)&v10.start.value = *(_OWORD *)&p_timeRange->start.value;
  *(_OWORD *)&v10.start.epoch = v9;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)&p_timeRange->duration.timescale;
  return CMTimeRangeEqual(&v10, &range2) != 0;
}

- (unint64_t)hash
{
  $11E8FAD63EF01618BAA11C8CE4E61C06 *p_timeRange;
  CMTimeEpoch v3;
  $95D729B680665BEAEFA1D6FCA8238556 start;

  p_timeRange = &self->_timeRange;
  start = self->_timeRange.start;
  v3 = CMTimeHash((CMTime *)&start);
  start = p_timeRange->duration;
  return CMTimeHash((CMTime *)&start) ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int128 v4;
  _OWORD v6[3];

  if (NSShouldRetainWithZone(self, a3))
    return self;
  v4 = *(_OWORD *)&self->_timeRange.start.epoch;
  v6[0] = *(_OWORD *)&self->_timeRange.start.value;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  return +[CMTimeRangeAsValue valueWithCMTimeRange:](CMTimeRangeAsValue, "valueWithCMTimeRange:", v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMTimeRangeAsValue)initWithCoder:(id)a3
{
  char *v6;
  CMTimeRangeAsValue *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v8 = self;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"[coder allowsKeyedCoding]"), 0);
    objc_exception_throw(v14);
  }
  v18.receiver = self;
  v18.super_class = (Class)CMTimeRangeAsValue;
  v6 = -[CMTimeRangeAsValue init](&v18, sel_init);
  if (v6)
  {
    if (a3)
    {
      objc_msgSend(a3, "decodeCMTimeRangeForKey:", CFSTR("CMTimeRange"));
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
      v15 = 0u;
    }
    *(_OWORD *)(v6 + 24) = v16;
    *(_OWORD *)(v6 + 40) = v17;
    *(_OWORD *)(v6 + 8) = v15;
  }
  return (CMTimeRangeAsValue *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  _OWORD v13[3];

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)"[coder allowsKeyedCoding]"), 0);
    objc_exception_throw(v12);
  }
  v11 = *(_OWORD *)&self->_timeRange.start.epoch;
  v13[0] = *(_OWORD *)&self->_timeRange.start.value;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  objc_msgSend(a3, "encodeCMTimeRange:forKey:", v13, CFSTR("CMTimeRange"));
}

@end
