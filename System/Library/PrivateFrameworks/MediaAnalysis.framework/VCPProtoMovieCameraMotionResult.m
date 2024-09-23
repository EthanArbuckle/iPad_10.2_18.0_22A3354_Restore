@implementation VCPProtoMovieCameraMotionResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  uint64_t v4;
  void *v5;
  VCPProtoMovieCameraMotionResult *v6;
  void *v7;
  unint64_t v8;
  __int16 v9;
  unsigned int v10;
  uint64_t v11;
  CMTimeRange v13;
  CMTimeRange v14;

  v3 = (const __CFDictionary *)a3;
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("flags"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if ((v14.start.flags & 1) == 0)
  {
    v6 = 0;
    goto LABEL_30;
  }
  v6 = 0;
  if ((v14.duration.flags & 1) != 0 && !v14.duration.epoch)
  {
    v6 = 0;
    if ((v14.duration.value & 0x8000000000000000) == 0)
    {
      if (v4)
      {
        v6 = objc_alloc_init(VCPProtoMovieCameraMotionResult);
        v13 = v14;
        +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v13);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPProtoMovieCameraMotionResult setTimeRange:](v6, "setTimeRange:", v7);

        v8 = objc_msgSend(v5, "unsignedIntegerValue");
        v9 = v8;
        -[VCPProtoMovieCameraMotionResult setIsFast:](v6, "setIsFast:", (v8 >> 16) & 1);
        v10 = v9 & 0xFFC0;
        if (v10 <= 0x3FF)
        {
          if ((v9 & 0xFFC0u) > 0xFF)
          {
            if (v10 == 256)
            {
              v11 = 3;
              goto LABEL_29;
            }
            if (v10 == 512)
            {
              v11 = 4;
              goto LABEL_29;
            }
          }
          else
          {
            if (v10 == 64)
            {
              v11 = 1;
              goto LABEL_29;
            }
            if (v10 == 128)
            {
              v11 = 2;
              goto LABEL_29;
            }
          }
        }
        else if ((v9 & 0xFFC0u) <= 0xFFF)
        {
          if (v10 == 1024)
          {
            v11 = 5;
            goto LABEL_29;
          }
          if (v10 == 2048)
          {
            v11 = 6;
            goto LABEL_29;
          }
        }
        else
        {
          switch(v10)
          {
            case 0x1000u:
              v11 = 7;
              goto LABEL_29;
            case 0x2000u:
              v11 = 8;
              goto LABEL_29;
            case 0x4000u:
              v11 = 9;
LABEL_29:
              -[VCPProtoMovieCameraMotionResult setMotionType:](v6, "setMotionType:", v11);
              goto LABEL_30;
          }
        }
        v11 = 0;
        goto LABEL_29;
      }
    }
  }
LABEL_30:

  return v6;
}

- (id)exportToLegacyDictionary
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  CMTimeRange v12;
  CMTimeRange range;

  if (-[VCPProtoMovieCameraMotionResult isFast](self, "isFast"))
    v3 = 0x10000;
  else
    v3 = 0;
  v4 = -[VCPProtoMovieCameraMotionResult motionType](self, "motionType") - 1;
  if (v4 > 8)
    v5 = 0x8000;
  else
    v5 = qword_1B6FBF378[v4];
  -[VCPProtoMovieCameraMotionResult timeRange](self, "timeRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "timeRangeValue");
  else
    memset(&v12, 0, sizeof(v12));
  range = v12;
  v8 = CMTimeRangeCopyAsDictionary(&range, 0);
  v9 = (void *)-[__CFDictionary mutableCopy](v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3 | v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("flags"));

  return v9;
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
  v8.super_class = (Class)VCPProtoMovieCameraMotionResult;
  -[VCPProtoMovieCameraMotionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieCameraMotionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_motionType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("motionType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFast);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isFast"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieCameraMotionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  VCPProtoTimeRange *timeRange;
  id v5;

  timeRange = self->_timeRange;
  v5 = a3;
  objc_msgSend(v5, "setTimeRange:", timeRange);
  *((_DWORD *)v5 + 2) = self->_motionType;
  *((_BYTE *)v5 + 24) = self->_isFast;

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

  *(_DWORD *)(v5 + 8) = self->_motionType;
  *(_BYTE *)(v5 + 24) = self->_isFast;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  VCPProtoTimeRange *timeRange;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((_QWORD *)v4 + 2)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_motionType == *((_DWORD *)v4 + 2))
  {
    if (self->_isFast)
      v6 = v4[24] != 0;
    else
      v6 = v4[24] == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_motionType) ^ -[VCPProtoTimeRange hash](self->_timeRange, "hash") ^ (2654435761 * self->_isFast);
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
    -[VCPProtoMovieCameraMotionResult setTimeRange:](self, "setTimeRange:");
    goto LABEL_6;
  }
  self->_motionType = *((_DWORD *)v4 + 2);
  self->_isFast = *((_BYTE *)v4 + 24);

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (int)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(int)a3
{
  self->_motionType = a3;
}

- (BOOL)isFast
{
  return self->_isFast;
}

- (void)setIsFast:(BOOL)a3
{
  self->_isFast = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
}

@end
