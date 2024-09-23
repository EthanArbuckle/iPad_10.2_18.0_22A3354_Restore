@implementation MADMovieCurationScoreEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMovieCurationScoreEntry)initWithTimeRange:(id *)a3 score:(double)a4
{
  MADMovieCurationScoreEntry *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MADMovieCurationScoreEntry;
  result = -[MADMovieCurationScoreEntry init](&v9, sel_init);
  if (result)
  {
    v7 = *(_OWORD *)&a3->var0.var0;
    v8 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = v8;
    *(_OWORD *)&result->_timeRange.start.value = v7;
    result->_score = a4;
  }
  return result;
}

+ (id)entryWithTimeRange:(id *)a3 score:(double)a4
{
  id v6;
  __int128 v7;
  _OWORD v9[3];

  v6 = objc_alloc((Class)a1);
  v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  return (id)objc_msgSend(v6, "initWithTimeRange:score:", v9, a4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = a3;
  v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v6[0] = *(_OWORD *)&self->_timeRange.start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  objc_msgSend(v4, "encodeCMTimeRange:forKey:", v6, CFSTR("TimeRange"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Score"), self->_score);

}

- (MADMovieCurationScoreEntry)initWithCoder:(id)a3
{
  id v4;
  MADMovieCurationScoreEntry *v5;
  double v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADMovieCurationScoreEntry;
  v5 = -[MADMovieCurationScoreEntry init](&v11, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "decodeCMTimeRangeForKey:", CFSTR("TimeRange"));
    }
    else
    {
      v9 = 0u;
      v10 = 0u;
      v8 = 0u;
    }
    *(_OWORD *)&v5->_timeRange.start.value = v8;
    *(_OWORD *)&v5->_timeRange.start.epoch = v9;
    *(_OWORD *)&v5->_timeRange.duration.timescale = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Score"), v8, v9, v10);
    v5->_score = v6;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  Float64 Seconds;
  __int128 v7;
  CMTimeRange range;
  CMTime v10;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  time = (CMTime)self->_timeRange.start;
  Seconds = CMTimeGetSeconds(&time);
  v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  CMTimeRangeGetEnd(&v10, &range);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %-.4fs-%-.4fs, "), CFSTR("TimeRange"), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v10));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %.2f>"), CFSTR("Score"), *(_QWORD *)&self->_score);
  return v3;
}

- ($7159EBE1BBBCDCA1B95AF1FC27B9DE98)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var0;
  return self;
}

- (double)score
{
  return self->_score;
}

@end
