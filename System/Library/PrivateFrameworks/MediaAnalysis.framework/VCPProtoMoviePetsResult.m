@implementation VCPProtoMoviePetsResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  NSString *v5;
  uint64_t v6;
  void *v7;
  VCPProtoMoviePetsResult *v8;
  BOOL v9;
  void *v10;
  void *v11;
  CMTimeRange v13;
  CMTimeRange v14;
  NSRect v15;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, (CFDictionaryRef)v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("petsBounds"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("petsConfidence"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((v14.start.flags & 1) != 0)
  {
    v8 = 0;
    if ((v14.duration.flags & 1) != 0 && !v14.duration.epoch)
    {
      v8 = 0;
      if ((v14.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
          v9 = v6 == 0;
        else
          v9 = 1;
        if (!v9)
        {
          v8 = objc_alloc_init(VCPProtoMoviePetsResult);
          v13 = v14;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMoviePetsResult setTimeRange:](v8, "setTimeRange:", v10);

          v15 = NSRectFromString(v5);
          +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMoviePetsResult setBounds:](v8, "setBounds:", v11);

          objc_msgSend(v7, "floatValue");
          -[VCPProtoMoviePetsResult setConfidence:](v8, "setConfidence:");
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  CMTimeRange v13;
  CMTimeRange range;
  _QWORD v15[2];
  _QWORD v16[3];
  NSRect v17;

  v16[2] = *MEMORY[0x1E0C80C00];
  -[VCPProtoMoviePetsResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v13, 0, sizeof(v13));
  range = v13;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  v15[0] = CFSTR("petsBounds");
  -[VCPProtoMoviePetsResult bounds](self, "bounds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rectValue");
  NSStringFromRect(v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v15[1] = CFSTR("petsConfidence");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMoviePetsResult confidence](self, "confidence");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("attributes"));

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
  v8.super_class = (Class)VCPProtoMoviePetsResult;
  -[VCPProtoMoviePetsResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMoviePetsResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoBounds *bounds;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeRange"));

  }
  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("bounds"));

  }
  *(float *)&v4 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("confidence"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMoviePetsResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
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
  objc_msgSend(v5, "setBounds:", self->_bounds);
  v5[4] = self->_confidence;

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

  v8 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  *(float *)(v5 + 16) = self->_confidence;
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
    && ((bounds = self->_bounds, !((unint64_t)bounds | *((_QWORD *)v4 + 1)))
     || -[VCPProtoBounds isEqual:](bounds, "isEqual:"))
    && self->_confidence == *((float *)v4 + 4);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  float confidence;
  float v6;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  v4 = -[VCPProtoBounds hash](self->_bounds, "hash");
  confidence = self->_confidence;
  v6 = -confidence;
  if (confidence >= 0.0)
    v6 = self->_confidence;
  v7 = floorf(v6 + 0.5);
  v8 = (float)(v6 - v7) * 1.8447e19;
  v9 = fmodf(v7, 1.8447e19);
  v10 = 2654435761u * (unint64_t)v9;
  v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0)
    v11 = 2654435761u * (unint64_t)v9;
  v12 = v10 - (unint64_t)fabsf(v8);
  if (v8 >= 0.0)
    v12 = v11;
  return v4 ^ v3 ^ v12;
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
    -[VCPProtoMoviePetsResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v9;
LABEL_7:
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
    -[VCPProtoMoviePetsResult setBounds:](self, "setBounds:");
    goto LABEL_12;
  }
  self->_confidence = *((float *)v4 + 4);

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end
