@implementation VCPProtoMovieFaceResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  void *v9;
  VCPProtoMovieFaceResult *v10;
  void *v12;
  unint64_t v13;
  void *v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  CMTimeRange v18;
  CMTimeRange v19;
  NSRect v20;
  NSRect v21;

  v3 = (const __CFDictionary *)a3;
  memset(&v19, 0, sizeof(v19));
  CMTimeRangeMakeFromDictionary(&v19, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("flags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("facePosition"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceBounds"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceId"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if ((v19.start.flags & 1) != 0)
  {
    v10 = 0;
    if ((v19.duration.flags & 1) != 0 && !v19.duration.epoch)
    {
      v10 = 0;
      if ((v19.duration.value & 0x8000000000000000) == 0 && v5 && v6 && v7 && v8)
      {
        v10 = objc_alloc_init(VCPProtoMovieFaceResult);
        v18 = v19;
        +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPProtoMovieFaceResult setTimeRange:](v10, "setTimeRange:", v12);

        v13 = objc_msgSend(v5, "unsignedIntegerValue");
        -[VCPProtoMovieFaceResult setMouthExpression:](v10, "setMouthExpression:", (v13 >> 1) & 1);
        -[VCPProtoMovieFaceResult setPosition:](v10, "setPosition:", objc_msgSend(v6, "intValue"));
        v20 = NSRectFromString(v7);
        +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPProtoMovieFaceResult setBounds:](v10, "setBounds:", v14);

        -[VCPProtoMovieFaceResult setIsCloseup:](v10, "setIsCloseup:", (v13 >> 4) & 1);
        -[VCPProtoMovieFaceResult setFaceID:](v10, "setFaceID:", objc_msgSend(v9, "unsignedIntValue"));
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanBounds"));
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v21 = NSRectFromString(v15);
          +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieFaceResult setHumanBounds:](v10, "setHumanBounds:", v17);

        }
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)exportToLegacyDictionary
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CFDictionaryRef v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CMTimeRange v18;
  CMTimeRange range;
  NSRect v20;
  NSRect v21;

  v3 = -[VCPProtoMovieFaceResult mouthExpression](self, "mouthExpression") == 1;
  if (-[VCPProtoMovieFaceResult isCloseup](self, "isCloseup"))
    v4 = (2 * v3) | 0x10;
  else
    v4 = 2 * v3;
  -[VCPProtoMovieFaceResult timeRange](self, "timeRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "timeRangeValue");
  else
    memset(&v18, 0, sizeof(v18));
  range = v18;
  v7 = CMTimeRangeCopyAsDictionary(&range, 0);
  v8 = (void *)-[__CFDictionary mutableCopy](v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoMovieFaceResult position](self, "position"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("facePosition"));

  -[VCPProtoMovieFaceResult bounds](self, "bounds");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rectValue");
  NSStringFromRect(v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("faceBounds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoMovieFaceResult faceID](self, "faceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("faceId"));

  if (-[VCPProtoMovieFaceResult hasHumanBounds](self, "hasHumanBounds"))
  {
    -[VCPProtoMovieFaceResult humanBounds](self, "humanBounds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rectValue");
    NSStringFromRect(v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("humanBounds"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4, *(_OWORD *)&v18.start.value, *(_OWORD *)&v18.start.epoch, *(_OWORD *)&v18.duration.timescale);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("flags"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("attributes"));
  return v8;
}

- (BOOL)hasHumanBounds
{
  return self->_humanBounds != 0;
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
  v8.super_class = (Class)VCPProtoMovieFaceResult;
  -[VCPProtoMovieFaceResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieFaceResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoBounds *bounds;
  void *v9;
  void *v10;
  void *v11;
  VCPProtoBounds *humanBounds;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mouthExpression);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("mouthExpression"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_position);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("position"));

  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("bounds"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCloseup);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isCloseup"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_faceID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("faceID"));

  humanBounds = self->_humanBounds;
  if (humanBounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](humanBounds, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("humanBounds"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieFaceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteInt32Field();
  if (self->_humanBounds)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setTimeRange:", self->_timeRange);
  *((_DWORD *)v5 + 8) = self->_mouthExpression;
  *((_DWORD *)v5 + 9) = self->_position;
  objc_msgSend(v5, "setBounds:", self->_bounds);
  v4 = v5;
  *((_BYTE *)v5 + 48) = self->_isCloseup;
  *((_DWORD *)v5 + 4) = self->_faceID;
  if (self->_humanBounds)
  {
    objc_msgSend(v5, "setHumanBounds:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 32) = self->_mouthExpression;
  *(_DWORD *)(v5 + 36) = self->_position;
  v8 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  *(_BYTE *)(v5 + 48) = self->_isCloseup;
  *(_DWORD *)(v5 + 16) = self->_faceID;
  v10 = -[VCPProtoBounds copyWithZone:](self->_humanBounds, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  VCPProtoBounds *bounds;
  VCPProtoBounds *humanBounds;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((_QWORD *)v4 + 5))
  {
    if (!-[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
      goto LABEL_15;
  }
  if (self->_mouthExpression != *((_DWORD *)v4 + 8))
    goto LABEL_15;
  if (self->_position != *((_DWORD *)v4 + 9))
    goto LABEL_15;
  bounds = self->_bounds;
  if ((unint64_t)bounds | *((_QWORD *)v4 + 1))
  {
    if (!-[VCPProtoBounds isEqual:](bounds, "isEqual:"))
      goto LABEL_15;
  }
  if (self->_isCloseup)
  {
    if (!*((_BYTE *)v4 + 48))
      goto LABEL_15;
  }
  else if (*((_BYTE *)v4 + 48))
  {
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  if (self->_faceID != *((_DWORD *)v4 + 4))
    goto LABEL_15;
  humanBounds = self->_humanBounds;
  if ((unint64_t)humanBounds | *((_QWORD *)v4 + 3))
    v8 = -[VCPProtoBounds isEqual:](humanBounds, "isEqual:");
  else
    v8 = 1;
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = (2654435761 * self->_mouthExpression) ^ -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  v4 = 2654435761 * self->_position;
  v5 = v3 ^ v4 ^ -[VCPProtoBounds hash](self->_bounds, "hash");
  v6 = (2654435761 * self->_isCloseup) ^ (2654435761 * self->_faceID);
  return v5 ^ v6 ^ -[VCPProtoBounds hash](self->_humanBounds, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  VCPProtoBounds *bounds;
  uint64_t v8;
  VCPProtoBounds *humanBounds;
  uint64_t v10;
  id v11;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 5);
  v11 = v4;
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
    -[VCPProtoMovieFaceResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v11;
LABEL_7:
  self->_mouthExpression = *((_DWORD *)v4 + 8);
  self->_position = *((_DWORD *)v4 + 9);
  bounds = self->_bounds;
  v8 = *((_QWORD *)v4 + 1);
  if (bounds)
  {
    if (!v8)
      goto LABEL_13;
    -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[VCPProtoMovieFaceResult setBounds:](self, "setBounds:");
  }
  v4 = v11;
LABEL_13:
  self->_isCloseup = *((_BYTE *)v4 + 48);
  self->_faceID = *((_DWORD *)v4 + 4);
  humanBounds = self->_humanBounds;
  v10 = *((_QWORD *)v4 + 3);
  if (humanBounds)
  {
    if (v10)
    {
      -[VCPProtoBounds mergeFrom:](humanBounds, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[VCPProtoMovieFaceResult setHumanBounds:](self, "setHumanBounds:");
    goto LABEL_18;
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

- (int)mouthExpression
{
  return self->_mouthExpression;
}

- (void)setMouthExpression:(int)a3
{
  self->_mouthExpression = a3;
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (BOOL)isCloseup
{
  return self->_isCloseup;
}

- (void)setIsCloseup:(BOOL)a3
{
  self->_isCloseup = a3;
}

- (int)faceID
{
  return self->_faceID;
}

- (void)setFaceID:(int)a3
{
  self->_faceID = a3;
}

- (VCPProtoBounds)humanBounds
{
  return self->_humanBounds;
}

- (void)setHumanBounds:(id)a3
{
  objc_storeStrong((id *)&self->_humanBounds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_humanBounds, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end
