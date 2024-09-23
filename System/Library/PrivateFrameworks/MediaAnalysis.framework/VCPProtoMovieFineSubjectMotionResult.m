@implementation VCPProtoMovieFineSubjectMotionResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoMovieFineSubjectMotionResult;
  -[VCPProtoMovieFineSubjectMotionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieFineSubjectMotionResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  VCPProtoTimeRange *timeRange;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeRange"));

  }
  *(float *)&v4 = self->_actionScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("actionScore"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieFineSubjectMotionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  VCPProtoTimeRange *timeRange;
  float *v5;

  timeRange = self->_timeRange;
  v5 = (float *)a3;
  objc_msgSend(v5, "setTimeRange:", timeRange);
  v5[2] = self->_actionScore;

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

  *(float *)(v5 + 8) = self->_actionScore;
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
    && self->_actionScore == *((float *)v4 + 2);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  float actionScore;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  float v10;
  unint64_t v11;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  actionScore = self->_actionScore;
  v5 = -actionScore;
  if (actionScore >= 0.0)
    v5 = self->_actionScore;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  v9 = v8 + (unint64_t)v7;
  v10 = fabsf(v7);
  if (v7 <= 0.0)
    v9 = v8;
  v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0)
    v11 = v9;
  return v11 ^ v3;
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
    -[VCPProtoMovieFineSubjectMotionResult setTimeRange:](self, "setTimeRange:");
    goto LABEL_6;
  }
  self->_actionScore = *((float *)v4 + 2);

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (float)actionScore
{
  return self->_actionScore;
}

- (void)setActionScore:(float)a3
{
  self->_actionScore = a3;
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
  VCPProtoMovieFineSubjectMotionResult *v6;
  void *v7;
  CMTimeRange v9;
  CMTimeRange v10;

  v3 = (const __CFDictionary *)a3;
  memset(&v10, 0, sizeof(v10));
  CMTimeRangeMakeFromDictionary(&v10, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("quality"));
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
          v6 = objc_alloc_init(VCPProtoMovieFineSubjectMotionResult);
          v9 = v10;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v9);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieFineSubjectMotionResult setTimeRange:](v6, "setTimeRange:", v7);

          objc_msgSend(v5, "floatValue");
          -[VCPProtoMovieFineSubjectMotionResult setActionScore:](v6, "setActionScore:");
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
  void *v7;
  void *v8;
  CMTimeRange v10;
  CMTimeRange range;

  -[VCPProtoMovieFineSubjectMotionResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v10, 0, sizeof(v10));
  range = v10;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieFineSubjectMotionResult actionScore](self, "actionScore");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("quality"));

  return v6;
}

@end
