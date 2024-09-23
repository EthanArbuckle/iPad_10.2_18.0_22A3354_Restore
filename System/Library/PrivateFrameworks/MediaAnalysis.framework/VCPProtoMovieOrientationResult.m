@implementation VCPProtoMovieOrientationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  VCPProtoMovieOrientationResult *v7;
  void *v8;
  CMTimeRange v10;
  CMTimeRange v11;

  v3 = (const __CFDictionary *)a3;
  memset(&v11, 0, sizeof(v11));
  CMTimeRangeMakeFromDictionary(&v11, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orientation"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((v11.start.flags & 1) != 0)
  {
    v7 = 0;
    if ((v11.duration.flags & 1) != 0 && !v11.duration.epoch)
    {
      v7 = 0;
      if ((v11.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
        {
          v7 = objc_alloc_init(VCPProtoMovieOrientationResult);
          v10 = v11;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v10);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieOrientationResult setTimeRange:](v7, "setTimeRange:", v8);

          -[VCPProtoMovieOrientationResult setOrientation:](v7, "setOrientation:", objc_msgSend(v6, "intValue"));
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  CMTimeRange v10;
  CMTimeRange range;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[VCPProtoMovieOrientationResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v10, 0, sizeof(v10));
  range = v10;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  v12 = CFSTR("orientation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoMovieOrientationResult orientation](self, "orientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("attributes"));

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieOrientationResult;
  -[VCPProtoMovieOrientationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieOrientationResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  VCPProtoTimeRange *timeRange;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_orientation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("orientation"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieOrientationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  VCPProtoTimeRange *timeRange;
  _DWORD *v5;

  timeRange = self->_timeRange;
  v5 = a3;
  objc_msgSend(v5, "setTimeRange:", timeRange);
  v5[2] = self->_orientation;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_orientation;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((_QWORD *)v4 + 2)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_orientation == *((_DWORD *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_orientation) ^ -[VCPProtoTimeRange hash](self->_timeRange, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  id v7;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 2);
  if (timeRange)
  {
    if (v6)
    {
      v7 = v4;
      -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[VCPProtoMovieOrientationResult setTimeRange:](self, "setTimeRange:");
    goto LABEL_6;
  }
  self->_orientation = *((_DWORD *)v4 + 2);

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (int)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
}

@end
