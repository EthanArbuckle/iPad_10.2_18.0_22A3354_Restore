@implementation CMTimeMappingAsValue

+ (id)valueWithCMTimeMapping:(id *)a3
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = objc_msgSend(objc_allocWithZone((Class)a1), "init");
  v5 = *(_OWORD *)&a3->var0.var0.var3;
  *(_OWORD *)(v4 + 8) = *(_OWORD *)&a3->var0.var0.var0;
  *(_OWORD *)(v4 + 24) = v5;
  v6 = *(_OWORD *)&a3->var1.var1.var1;
  v8 = *(_OWORD *)&a3->var0.var1.var1;
  v7 = *(_OWORD *)&a3->var1.var0.var0;
  *(_OWORD *)(v4 + 72) = *(_OWORD *)&a3->var1.var0.var3;
  *(_OWORD *)(v4 + 88) = v6;
  *(_OWORD *)(v4 + 40) = v8;
  *(_OWORD *)(v4 + 56) = v7;
  return (id)v4;
}

- ($4C6D1E162277694FB76656457146213A)CMTimeMappingValue
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self->var1.var0.var1;
  *(_OWORD *)&retstr->var0.var1.var1 = *(_OWORD *)&self->var0.var1.var3;
  *(_OWORD *)&retstr->var1.var0.var0 = v3;
  v4 = *(_OWORD *)&self->var1.var1.var3;
  *(_OWORD *)&retstr->var1.var0.var3 = *(_OWORD *)&self->var1.var1.var0;
  *(_OWORD *)&retstr->var1.var1.var1 = v4;
  v5 = *(_OWORD *)&self->var0.var1.var0;
  *(_OWORD *)&retstr->var0.var0.var0 = *(_OWORD *)&self->var0.var0.var1;
  *(_OWORD *)&retstr->var0.var0.var3 = v5;
  return self;
}

- (void)getValue:(void *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->_timeMapping.source.start.epoch;
  *(_OWORD *)a3 = *(_OWORD *)&self->_timeMapping.source.start.value;
  *((_OWORD *)a3 + 1) = v3;
  v4 = *(_OWORD *)&self->_timeMapping.target.duration.timescale;
  v6 = *(_OWORD *)&self->_timeMapping.source.duration.timescale;
  v5 = *(_OWORD *)&self->_timeMapping.target.start.value;
  *((_OWORD *)a3 + 4) = *(_OWORD *)&self->_timeMapping.target.start.epoch;
  *((_OWORD *)a3 + 5) = v4;
  *((_OWORD *)a3 + 2) = v6;
  *((_OWORD *)a3 + 3) = v5;
}

- (const)objCType
{
  return "{?={?={?=qiIq}{?=qiIq}}{?={?=qiIq}{?=qiIq}}}";
}

- (id)description
{
  void *v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  CMTimeRange range;
  CMTimeRange v7[2];

  memset(v7, 0, sizeof(v7));
  if (self)
    -[CMTimeMappingAsValue CMTimeMappingValue](self, "CMTimeMappingValue");
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  range = v7[0];
  v4 = (id)CMTimeRangeCopyDescription(v3, &range);
  range = v7[1];
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("CMTimeMapping: {%@, %@}"), v4, (id)CMTimeRangeCopyDescription(v3, &range));
}

- (BOOL)isEqualToValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  $4CFA47595F7F9D30DB71D4F6F9F20BC9 *p_timeMapping;
  __int128 v8;
  int v9;
  __int128 v10;
  CMTimeRange v12;
  CMTimeRange range1;
  CMTimeRange v14[2];
  uint64_t v15;
  uint64_t v16;

  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v15 = v3;
    v16 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(v14, 0, sizeof(v14));
      if (a3)
        objc_msgSend(a3, "CMTimeMappingValue");
      p_timeMapping = &self->_timeMapping;
      v8 = *(_OWORD *)&p_timeMapping->source.start.epoch;
      *(_OWORD *)&range1.start.value = *(_OWORD *)&p_timeMapping->source.start.value;
      *(_OWORD *)&range1.start.epoch = v8;
      *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&p_timeMapping->source.duration.timescale;
      v12 = v14[0];
      v9 = CMTimeRangeEqual(&range1, &v12);
      if (v9)
      {
        v10 = *(_OWORD *)&p_timeMapping->target.start.epoch;
        *(_OWORD *)&range1.start.value = *(_OWORD *)&p_timeMapping->target.start.value;
        *(_OWORD *)&range1.start.epoch = v10;
        *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&p_timeMapping->target.duration.timescale;
        v12 = v14[1];
        LOBYTE(v9) = CMTimeRangeEqual(&range1, &v12) != 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  $4CFA47595F7F9D30DB71D4F6F9F20BC9 *p_timeMapping;
  CMTimeEpoch v3;
  CMTimeEpoch v4;
  CMTimeEpoch v5;
  $95D729B680665BEAEFA1D6FCA8238556 start;

  p_timeMapping = &self->_timeMapping;
  start = self->_timeMapping.source.start;
  v3 = CMTimeHash((CMTime *)&start);
  start = p_timeMapping->source.duration;
  v4 = CMTimeHash((CMTime *)&start) ^ v3;
  start = p_timeMapping->target.start;
  v5 = CMTimeHash((CMTime *)&start);
  start = p_timeMapping->target.duration;
  return v4 ^ v5 ^ CMTimeHash((CMTime *)&start);
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[6];

  if (NSShouldRetainWithZone(self, a3))
    return self;
  v4 = *(_OWORD *)&self->_timeMapping.target.start.value;
  v8[2] = *(_OWORD *)&self->_timeMapping.source.duration.timescale;
  v8[3] = v4;
  v5 = *(_OWORD *)&self->_timeMapping.target.duration.timescale;
  v8[4] = *(_OWORD *)&self->_timeMapping.target.start.epoch;
  v8[5] = v5;
  v6 = *(_OWORD *)&self->_timeMapping.source.start.epoch;
  v8[0] = *(_OWORD *)&self->_timeMapping.source.start.value;
  v8[1] = v6;
  return +[CMTimeMappingAsValue valueWithCMTimeMapping:](CMTimeMappingAsValue, "valueWithCMTimeMapping:", v8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMTimeMappingAsValue)initWithCoder:(id)a3
{
  CMTimeMappingAsValue *v6;
  CMTimeMappingAsValue *v7;
  $4CFA47595F7F9D30DB71D4F6F9F20BC9 *p_timeMapping;
  CMTimeMappingAsValue *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v10 = self;
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v11, v12, v13, v14, v15, (uint64_t)"[coder allowsKeyedCoding]"), 0);
    objc_exception_throw(v16);
  }
  v23.receiver = self;
  v23.super_class = (Class)CMTimeMappingAsValue;
  v6 = -[CMTimeMappingAsValue init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    p_timeMapping = &v6->_timeMapping;
    if (a3)
    {
      objc_msgSend(a3, "decodeCMTimeMappingForKey:", CFSTR("CMTimeMapping"));
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
    }
    *(_OWORD *)&p_timeMapping->source.start.value = v17;
    *(_OWORD *)&v7->_timeMapping.source.start.epoch = v18;
    *(_OWORD *)&v7->_timeMapping.target.start.epoch = v21;
    *(_OWORD *)&v7->_timeMapping.target.duration.timescale = v22;
    *(_OWORD *)&v7->_timeMapping.source.duration.timescale = v19;
    *(_OWORD *)&v7->_timeMapping.target.start.value = v20;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *v14;
  _OWORD v15[6];

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)"[coder allowsKeyedCoding]"), 0);
    objc_exception_throw(v14);
  }
  v11 = *(_OWORD *)&self->_timeMapping.target.start.value;
  v15[2] = *(_OWORD *)&self->_timeMapping.source.duration.timescale;
  v15[3] = v11;
  v12 = *(_OWORD *)&self->_timeMapping.target.duration.timescale;
  v15[4] = *(_OWORD *)&self->_timeMapping.target.start.epoch;
  v15[5] = v12;
  v13 = *(_OWORD *)&self->_timeMapping.source.start.epoch;
  v15[0] = *(_OWORD *)&self->_timeMapping.source.start.value;
  v15[1] = v13;
  objc_msgSend(a3, "encodeCMTimeMapping:forKey:", v15, CFSTR("CMTimeMapping"));
}

@end
