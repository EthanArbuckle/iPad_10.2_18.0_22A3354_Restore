@implementation AVAssetTrackSegment

- (AVAssetTrackSegment)init
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[6];

  v2 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 32);
  v6[3] = v2;
  v3 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 80);
  v6[4] = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 64);
  v6[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CA2E20] + 16);
  v6[0] = *MEMORY[0x1E0CA2E20];
  v6[1] = v4;
  return (AVAssetTrackSegment *)-[AVAssetTrackSegment _initWithTimeMapping:](self, "_initWithTimeMapping:", v6);
}

- (id)_initWithTimeMapping:(id *)a3
{
  id result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAssetTrackSegment;
  result = -[AVAssetTrackSegment init](&v9, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0.var0.var0;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&a3->var0.var0.var3;
    *(_OWORD *)((char *)result + 8) = v5;
    v6 = *(_OWORD *)&a3->var0.var1.var1;
    v7 = *(_OWORD *)&a3->var1.var0.var0;
    v8 = *(_OWORD *)&a3->var1.var0.var3;
    *(_OWORD *)((char *)result + 88) = *(_OWORD *)&a3->var1.var1.var1;
    *(_OWORD *)((char *)result + 72) = v8;
    *(_OWORD *)((char *)result + 56) = v7;
    *(_OWORD *)((char *)result + 40) = v6;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  BOOL v6;
  const __CFAllocator *v7;
  const __CFString *v8;
  __int128 v9;
  __int128 v10;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[AVAssetTrackSegment isEmpty](self, "isEmpty");
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v6)
  {
    v8 = CFSTR("empty");
  }
  else
  {
    v9 = *(_OWORD *)&self->_timeMapping.source.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeMapping.source.start.value;
    *(_OWORD *)&range.start.epoch = v9;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeMapping.source.duration.timescale;
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("source = %@"), (id)CMTimeRangeCopyDescription(v7, &range));
  }
  v10 = *(_OWORD *)&self->_timeMapping.target.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeMapping.target.start.value;
  *(_OWORD *)&range.start.epoch = v10;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeMapping.target.duration.timescale;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@, target = %@>"), v5, self, v8, (id)CMTimeRangeCopyDescription(v7, &range));
}

- (BOOL)isEmpty
{
  return (self->_timeMapping.source.start.flags & 0x1D) != 1
      && (self->_timeMapping.target.start.flags & 1) != 0
      && (self->_timeMapping.target.duration.flags & 1) != 0
      && !self->_timeMapping.target.duration.epoch
      && self->_timeMapping.target.duration.value >= 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  __int128 v7;
  CMTimeRange v9;
  CMTimeRange range1;
  CMTimeRange v11;
  CMTimeRange v12;
  CMTimeRange v13[2];
  uint64_t v14;
  uint64_t v15;

  if (a3 == self)
    return 1;
  v14 = v3;
  v15 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (-[AVAssetTrackSegment isEmpty](self, "isEmpty") && (objc_msgSend(a3, "isEmpty") & 1) != 0)
    return 1;
  v7 = 0uLL;
  memset(v13, 0, sizeof(v13));
  if (self)
  {
    -[AVAssetTrackSegment timeMapping](self, "timeMapping");
    v7 = 0uLL;
  }
  *(_OWORD *)&v12.start.epoch = v7;
  *(_OWORD *)&v12.duration.timescale = v7;
  *(_OWORD *)&v11.duration.timescale = v7;
  *(_OWORD *)&v12.start.value = v7;
  *(_OWORD *)&v11.start.value = v7;
  *(_OWORD *)&v11.start.epoch = v7;
  if (a3)
    objc_msgSend(a3, "timeMapping");
  range1 = v13[0];
  v9 = v11;
  if (CMTimeRangeEqual(&range1, &v9) && (range1 = v13[1], v9 = v12, CMTimeRangeEqual(&range1, &v9)))
    return 1;
  else
    return 0;
}

- (unint64_t)hash
{
  CMTimeEpoch v4;
  CMTimeEpoch v5;
  CMTimeEpoch v6;
  CMTime v7;
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  _OWORD v11[2];

  if (-[AVAssetTrackSegment isEmpty](self, "isEmpty"))
    return 0;
  memset(v11, 0, sizeof(v11));
  v10 = 0u;
  v8 = 0u;
  memset(v9, 0, sizeof(v9));
  if (self)
    -[AVAssetTrackSegment timeMapping](self, "timeMapping");
  *(_OWORD *)&v7.value = v8;
  v7.epoch = *(_QWORD *)&v9[0];
  v4 = CMTimeHash(&v7);
  v7 = *(CMTime *)((char *)v9 + 8);
  v5 = CMTimeHash(&v7) ^ v4;
  *(_OWORD *)&v7.value = v10;
  v7.epoch = *(_QWORD *)&v11[0];
  v6 = CMTimeHash(&v7);
  v7 = *(CMTime *)((char *)v11 + 8);
  return v5 ^ v6 ^ CMTimeHash(&v7);
}

- (AVAssetTrackSegment)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  AVAssetTrackSegment *result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  CMTimeMapping v15;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), CFSTR("timeMapping"));
  memset(&v15, 0, sizeof(v15));
  CMTimeMappingMakeFromDictionary(&v15, v8);
  v14.receiver = self;
  v14.super_class = (Class)AVAssetTrackSegment;
  result = -[AVAssetTrackSegment init](&v14, sel_init);
  if (result)
  {
    v10 = *(_OWORD *)&v15.source.start.value;
    *(_OWORD *)&result->_timeMapping.source.start.epoch = *(_OWORD *)&v15.source.start.epoch;
    *(_OWORD *)&result->_timeMapping.source.start.value = v10;
    v11 = *(_OWORD *)&v15.source.duration.timescale;
    v12 = *(_OWORD *)&v15.target.start.value;
    v13 = *(_OWORD *)&v15.target.start.epoch;
    *(_OWORD *)&result->_timeMapping.target.duration.timescale = *(_OWORD *)&v15.target.duration.timescale;
    *(_OWORD *)&result->_timeMapping.target.start.epoch = v13;
    *(_OWORD *)&result->_timeMapping.target.start.value = v12;
    *(_OWORD *)&result->_timeMapping.source.duration.timescale = v11;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CMTimeMapping v4;

  if (self)
    -[AVAssetTrackSegment timeMapping](self, "timeMapping");
  else
    memset(&v4, 0, sizeof(v4));
  objc_msgSend(a3, "encodeObject:forKey:", CMTimeMappingCopyAsDictionary(&v4, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]), CFSTR("timeMapping"));
}

- (CMTimeMapping)timeMapping
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self->target.start.timescale;
  *(_OWORD *)&retstr->source.duration.timescale = *(_OWORD *)&self->source.duration.epoch;
  *(_OWORD *)&retstr->target.start.value = v3;
  v4 = *(_OWORD *)&self->target.duration.epoch;
  *(_OWORD *)&retstr->target.start.epoch = *(_OWORD *)&self->target.duration.value;
  *(_OWORD *)&retstr->target.duration.timescale = v4;
  v5 = *(_OWORD *)&self->source.duration.value;
  *(_OWORD *)&retstr->source.start.value = *(_OWORD *)&self->source.start.timescale;
  *(_OWORD *)&retstr->source.start.epoch = v5;
  return self;
}

@end
