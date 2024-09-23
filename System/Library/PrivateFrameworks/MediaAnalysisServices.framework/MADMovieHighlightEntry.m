@implementation MADMovieHighlightEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMovieHighlightEntry)initWithTimeRange:(id *)a3 score:(double)a4 attributes:(id)a5
{
  id v9;
  char *v10;
  MADMovieHighlightEntry *v11;
  __int128 v12;
  __int128 v13;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADMovieHighlightEntry;
  v10 = -[MADMovieHighlightEntry init](&v15, sel_init);
  v11 = (MADMovieHighlightEntry *)v10;
  if (v10)
  {
    v12 = *(_OWORD *)&a3->var0.var0;
    v13 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v10 + 56) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v10 + 40) = v13;
    *(_OWORD *)(v10 + 24) = v12;
    *((double *)v10 + 1) = a4;
    objc_storeStrong((id *)v10 + 2, a5);
  }

  return v11;
}

+ (id)entryWithTimeRange:(id *)a3 score:(double)a4 attributes:(id)a5
{
  id v8;
  id v9;
  __int128 v10;
  void *v11;
  _OWORD v13[3];

  v8 = a5;
  v9 = objc_alloc((Class)a1);
  v10 = *(_OWORD *)&a3->var0.var3;
  v13[0] = *(_OWORD *)&a3->var0.var0;
  v13[1] = v10;
  v13[2] = *(_OWORD *)&a3->var1.var1;
  v11 = (void *)objc_msgSend(v9, "initWithTimeRange:score:attributes:", v13, v8, a4);

  return v11;
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
  objc_msgSend(v4, "encodeObject:forKey:", self->_attributes, CFSTR("Attributes"));

}

- (MADMovieHighlightEntry)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADMovieHighlightEntry;
  v5 = -[MADMovieHighlightEntry init](&v16, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "decodeCMTimeRangeForKey:", CFSTR("TimeRange"));
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v13 = 0u;
    }
    *(_OWORD *)(v5 + 24) = v13;
    *(_OWORD *)(v5 + 40) = v14;
    *(_OWORD *)(v5 + 56) = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Score"), v13, v14, v15);
    *((_QWORD *)v5 + 1) = v6;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("Attributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v10;

  }
  return (MADMovieHighlightEntry *)v5;
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
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("Attributes"), self->_attributes);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %.2f>"), CFSTR("Score"), *(_QWORD *)&self->_score);
  return v3;
}

- ($7159EBE1BBBCDCA1B95AF1FC27B9DE98)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var1;
  return self;
}

- (double)score
{
  return self->_score;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
