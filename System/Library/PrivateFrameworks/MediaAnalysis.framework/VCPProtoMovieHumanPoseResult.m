@implementation VCPProtoMovieHumanPoseResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  VCPProtoMovieHumanPoseResult *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CMTimeRange v14;
  CMTimeRange v15;
  NSRect v16;

  v3 = (const __CFDictionary *)a3;
  memset(&v15, 0, sizeof(v15));
  CMTimeRangeMakeFromDictionary(&v15, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("flags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanConfidence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanBounds"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (NSString *)v7;
  if ((v15.start.flags & 1) != 0)
  {
    v9 = 0;
    if ((v15.duration.flags & 1) != 0 && !v15.duration.epoch)
    {
      v9 = 0;
      if ((v15.duration.value & 0x8000000000000000) == 0 && v6 && v7 && v5)
      {
        v10 = objc_msgSend(v5, "unsignedIntegerValue");
        v9 = objc_alloc_init(VCPProtoMovieHumanPoseResult);
        v14 = v15;
        +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPProtoMovieHumanPoseResult setTimeRange:](v9, "setTimeRange:", v11);

        objc_msgSend(v6, "floatValue");
        -[VCPProtoMovieHumanPoseResult setConfidence:](v9, "setConfidence:");
        v16 = NSRectFromString(v8);
        +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPProtoMovieHumanPoseResult setBounds:](v9, "setBounds:", v12);

        -[VCPProtoMovieHumanPoseResult setFlags:](v9, "setFlags:", v10);
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CMTimeRange v14;
  CMTimeRange range;
  _QWORD v16[2];
  _QWORD v17[3];
  NSRect v18;

  v17[2] = *MEMORY[0x1E0C80C00];
  -[VCPProtoMovieHumanPoseResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v14, 0, sizeof(v14));
  range = v14;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoMovieHumanPoseResult flags](self, "flags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("flags"));

  v16[0] = CFSTR("humanConfidence");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieHumanPoseResult confidence](self, "confidence");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v16[1] = CFSTR("humanBounds");
  -[VCPProtoMovieHumanPoseResult bounds](self, "bounds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rectValue");
  NSStringFromRect(v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("attributes"));

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
  v8.super_class = (Class)VCPProtoMovieHumanPoseResult;
  -[VCPProtoMovieHumanPoseResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieHumanPoseResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoBounds *bounds;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeRange"));

  }
  *(float *)&v4 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("confidence"));

  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("bounds"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_flags);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("flags"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieHumanPoseResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  VCPProtoTimeRange *timeRange;
  id v5;

  timeRange = self->_timeRange;
  v5 = a3;
  objc_msgSend(v5, "setTimeRange:", timeRange);
  *((_DWORD *)v5 + 4) = LODWORD(self->_confidence);
  objc_msgSend(v5, "setBounds:", self->_bounds);
  *((_DWORD *)v5 + 5) = self->_flags;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(float *)(v5 + 16) = self->_confidence;
  v8 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  *(_DWORD *)(v5 + 20) = self->_flags;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  VCPProtoBounds *bounds;
  BOOL v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | *((_QWORD *)v4 + 3)))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_confidence == *((float *)v4 + 4)
    && ((bounds = self->_bounds, !((unint64_t)bounds | *((_QWORD *)v4 + 1)))
     || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && self->_flags == *((_DWORD *)v4 + 5);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  float confidence;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  confidence = self->_confidence;
  v5 = -confidence;
  if (confidence >= 0.0)
    v5 = self->_confidence;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = fmodf(v6, 1.8447e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  return v12 ^ v3 ^ -[VCPProtoBounds hash](self->_bounds, "hash") ^ (2654435761 * self->_flags);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  VCPProtoBounds *bounds;
  uint64_t v8;
  id v9;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (timeRange)
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoMovieHumanPoseResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v9;
LABEL_7:
  self->_confidence = *((float *)v4 + 4);
  bounds = self->_bounds;
  v8 = *((_QWORD *)v4 + 1);
  if (bounds)
  {
    if (v8)
    {
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[VCPProtoMovieHumanPoseResult setBounds:](self, "setBounds:");
    goto LABEL_12;
  }
  self->_flags = *((_DWORD *)v4 + 5);

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end
