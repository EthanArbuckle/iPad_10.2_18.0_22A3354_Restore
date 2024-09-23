@implementation VCPProtoMovieSubjectMotionResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieSubjectMotionResult;
  -[VCPProtoMovieSubjectMotionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieSubjectMotionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAction);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("hasAction"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSubjectMotionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  VCPProtoTimeRange *timeRange;
  _BYTE *v5;

  timeRange = self->_timeRange;
  v5 = a3;
  objc_msgSend(v5, "setTimeRange:", timeRange);
  v5[16] = self->_hasAction;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_BYTE *)(v5 + 16) = self->_hasAction;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  VCPProtoTimeRange *timeRange;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((_QWORD *)v4 + 1)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:")))
  {
    if (self->_hasAction)
      v6 = v4[16] != 0;
    else
      v6 = v4[16] == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_hasAction) ^ -[VCPProtoTimeRange hash](self->_timeRange, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  id v7;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 1);
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
    -[VCPProtoMovieSubjectMotionResult setTimeRange:](self, "setTimeRange:");
    goto LABEL_6;
  }
  self->_hasAction = *((_BYTE *)v4 + 16);

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (BOOL)hasAction
{
  return self->_hasAction;
}

- (void)setHasAction:(BOOL)a3
{
  self->_hasAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  uint64_t v4;
  void *v5;
  VCPProtoMovieSubjectMotionResult *v6;
  void *v7;
  CMTimeRange v9;
  CMTimeRange v10;

  v3 = (const __CFDictionary *)a3;
  memset(&v10, 0, sizeof(v10));
  CMTimeRangeMakeFromDictionary(&v10, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("flags"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if ((v10.start.flags & 1) != 0)
  {
    v6 = 0;
    if ((v10.duration.flags & 1) != 0 && !v10.duration.epoch)
    {
      v6 = 0;
      if ((v10.duration.value & 0x8000000000000000) == 0)
      {
        if (v4)
        {
          v6 = objc_alloc_init(VCPProtoMovieSubjectMotionResult);
          v9 = v10;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v9);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieSubjectMotionResult setTimeRange:](v6, "setTimeRange:", v7);

          -[VCPProtoMovieSubjectMotionResult setHasAction:](v6, "setHasAction:", ((unint64_t)objc_msgSend(v5, "unsignedIntegerValue") >> 17) & 1);
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  void *v6;
  uint64_t v7;
  void *v8;
  CMTimeRange v10;
  CMTimeRange range;

  -[VCPProtoMovieSubjectMotionResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v10, 0, sizeof(v10));
  range = v10;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  if (-[VCPProtoMovieSubjectMotionResult hasAction](self, "hasAction"))
    v7 = 0x20000;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7, *(_OWORD *)&v10.start.value, *(_OWORD *)&v10.start.epoch, *(_OWORD *)&v10.duration.timescale);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("flags"));

  return v6;
}

@end
