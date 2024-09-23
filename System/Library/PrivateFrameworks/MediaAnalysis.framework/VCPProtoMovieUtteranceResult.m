@implementation VCPProtoMovieUtteranceResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieUtteranceResult;
  -[VCPProtoMovieUtteranceResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieUtteranceResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieUtteranceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setTimeRange:", self->_timeRange);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timeRange = self->_timeRange;
    if ((unint64_t)timeRange | v4[1])
      v6 = -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[VCPProtoTimeRange hash](self->_timeRange, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = v4[1];
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
    -[VCPProtoMovieUtteranceResult setTimeRange:](self, "setTimeRange:");
    goto LABEL_6;
  }

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  VCPProtoMovieUtteranceResult *v4;
  void *v5;
  CMTimeRange v6;
  CMTimeRange v7;

  memset(&v7, 0, sizeof(v7));
  CMTimeRangeMakeFromDictionary(&v7, (CFDictionaryRef)a3);
  if ((v7.start.flags & 1) == 0)
    return 0;
  v4 = 0;
  if ((v7.duration.flags & 1) != 0 && !v7.duration.epoch && (v7.duration.value & 0x8000000000000000) == 0)
  {
    v4 = objc_alloc_init(VCPProtoMovieUtteranceResult);
    v6 = v7;
    +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoMovieUtteranceResult setTimeRange:](v4, "setTimeRange:", v5);

  }
  return v4;
}

- (id)exportToLegacyDictionary
{
  void *v2;
  void *v3;
  CFDictionaryRef v4;
  CMTimeRange v6;
  CMTimeRange range;

  -[VCPProtoMovieUtteranceResult timeRange](self, "timeRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "timeRangeValue");
  else
    memset(&v6, 0, sizeof(v6));
  range = v6;
  v4 = CMTimeRangeCopyAsDictionary(&range, 0);

  return v4;
}

@end
