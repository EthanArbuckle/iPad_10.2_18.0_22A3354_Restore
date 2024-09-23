@implementation VCPProtoMovieHumanActionResult

- (BOOL)hasFaceId
{
  return self->_faceId != 0;
}

- (BOOL)hasBounds
{
  return self->_bounds != 0;
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
  v8.super_class = (Class)VCPProtoMovieHumanActionResult;
  -[VCPProtoMovieHumanActionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieHumanActionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  double v8;
  void *v9;
  double v10;
  void *v11;
  NSString *faceId;
  VCPProtoBounds *bounds;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeRange"));

  }
  *(float *)&v4 = self->_absoluteScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("absoluteScore"));

  *(float *)&v8 = self->_relativeScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("relativeScore"));

  *(float *)&v10 = self->_humanScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("humanScore"));

  faceId = self->_faceId;
  if (faceId)
    objc_msgSend(v3, "setObject:forKey:", faceId, CFSTR("faceId"));
  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("bounds"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieHumanActionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  if (self->_faceId)
    PBDataWriterWriteStringField();
  if (self->_bounds)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  float *v4;
  float *v5;

  v5 = (float *)a3;
  objc_msgSend(v5, "setTimeRange:", self->_timeRange);
  v4 = v5;
  v5[2] = self->_absoluteScore;
  v5[9] = self->_relativeScore;
  v5[8] = self->_humanScore;
  if (self->_faceId)
  {
    objc_msgSend(v5, "setFaceId:");
    v4 = v5;
  }
  if (self->_bounds)
  {
    objc_msgSend(v5, "setBounds:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(float *)(v5 + 8) = self->_absoluteScore;
  *(float *)(v5 + 36) = self->_relativeScore;
  *(float *)(v5 + 32) = self->_humanScore;
  v8 = -[NSString copyWithZone:](self->_faceId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  NSString *faceId;
  VCPProtoBounds *bounds;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[5]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_absoluteScore == *((float *)v4 + 2)
    && self->_relativeScore == *((float *)v4 + 9)
    && self->_humanScore == *((float *)v4 + 8)
    && ((faceId = self->_faceId, !((unint64_t)faceId | v4[3]))
     || -[NSString isEqual:](faceId, "isEqual:")))
  {
    bounds = self->_bounds;
    if ((unint64_t)bounds | v4[2])
      v8 = -[VCPProtoBounds isEqual:](bounds, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  float absoluteScore;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float relativeScore;
  float v14;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  float humanScore;
  float v23;
  float v24;
  float v25;
  float v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSUInteger v31;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  absoluteScore = self->_absoluteScore;
  v5 = -absoluteScore;
  if (absoluteScore >= 0.0)
    v5 = self->_absoluteScore;
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
  relativeScore = self->_relativeScore;
  v14 = -relativeScore;
  if (relativeScore >= 0.0)
    v14 = self->_relativeScore;
  v15 = floorf(v14 + 0.5);
  v16 = (float)(v14 - v15) * 1.8447e19;
  v17 = fmodf(v15, 1.8447e19);
  v18 = 2654435761u * (unint64_t)v17;
  v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0)
    v19 = 2654435761u * (unint64_t)v17;
  v20 = v18 - (unint64_t)fabsf(v16);
  if (v16 < 0.0)
    v21 = v20;
  else
    v21 = v19;
  humanScore = self->_humanScore;
  v23 = -humanScore;
  if (humanScore >= 0.0)
    v23 = self->_humanScore;
  v24 = floorf(v23 + 0.5);
  v25 = (float)(v23 - v24) * 1.8447e19;
  v26 = fmodf(v24, 1.8447e19);
  v27 = 2654435761u * (unint64_t)v26;
  v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0)
    v28 = 2654435761u * (unint64_t)v26;
  v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 >= 0.0)
    v29 = v28;
  v30 = v12 ^ v3 ^ v21 ^ v29;
  v31 = -[NSString hash](self->_faceId, "hash");
  return v30 ^ v31 ^ -[VCPProtoBounds hash](self->_bounds, "hash");
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
  v6 = *((_QWORD *)v4 + 5);
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
    -[VCPProtoMovieHumanActionResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v9;
LABEL_7:
  self->_absoluteScore = *((float *)v4 + 2);
  self->_relativeScore = *((float *)v4 + 9);
  self->_humanScore = *((float *)v4 + 8);
  if (*((_QWORD *)v4 + 3))
  {
    -[VCPProtoMovieHumanActionResult setFaceId:](self, "setFaceId:");
    v4 = v9;
  }
  bounds = self->_bounds;
  v8 = *((_QWORD *)v4 + 2);
  if (bounds)
  {
    if (v8)
    {
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[VCPProtoMovieHumanActionResult setBounds:](self, "setBounds:");
    goto LABEL_14;
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

- (float)absoluteScore
{
  return self->_absoluteScore;
}

- (void)setAbsoluteScore:(float)a3
{
  self->_absoluteScore = a3;
}

- (float)relativeScore
{
  return self->_relativeScore;
}

- (void)setRelativeScore:(float)a3
{
  self->_relativeScore = a3;
}

- (float)humanScore
{
  return self->_humanScore;
}

- (void)setHumanScore:(float)a3
{
  self->_humanScore = a3;
}

- (NSString)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(id)a3
{
  objc_storeStrong((id *)&self->_faceId, a3);
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_faceId, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  VCPProtoMovieHumanActionResult *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  CMTimeRange v15;
  CMTimeRange v16;
  NSRect v17;

  v3 = (const __CFDictionary *)a3;
  memset(&v16, 0, sizeof(v16));
  CMTimeRangeMakeFromDictionary(&v16, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("absoluteScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("relativeScore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanScore"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if ((v16.start.flags & 1) != 0)
  {
    v9 = 0;
    if ((v16.duration.flags & 1) != 0 && !v16.duration.epoch)
    {
      v9 = 0;
      if ((v16.duration.value & 0x8000000000000000) == 0 && v5 && v6 && v7)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanBounds"));
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_alloc_init(VCPProtoMovieHumanActionResult);
        v15 = v16;
        +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPProtoMovieHumanActionResult setTimeRange:](v9, "setTimeRange:", v12);

        objc_msgSend(v5, "floatValue");
        -[VCPProtoMovieHumanActionResult setAbsoluteScore:](v9, "setAbsoluteScore:");
        objc_msgSend(v6, "floatValue");
        -[VCPProtoMovieHumanActionResult setRelativeScore:](v9, "setRelativeScore:");
        objc_msgSend(v8, "floatValue");
        -[VCPProtoMovieHumanActionResult setHumanScore:](v9, "setHumanScore:");
        if (v10)
        {
          v17 = NSRectFromString(v10);
          +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieHumanActionResult setBounds:](v9, "setBounds:", v13);

        }
        if (v11)
          -[VCPProtoMovieHumanActionResult setFaceId:](v9, "setFaceId:", v11);

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CMTimeRange v18;
  CMTimeRange range;
  NSRect v20;

  -[VCPProtoMovieHumanActionResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v18, 0, sizeof(v18));
  range = v18;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieHumanActionResult absoluteScore](self, "absoluteScore");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("absoluteScore"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieHumanActionResult relativeScore](self, "relativeScore");
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("relativeScore"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieHumanActionResult humanScore](self, "humanScore");
  objc_msgSend(v12, "numberWithFloat:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("humanScore"));

  if (-[VCPProtoMovieHumanActionResult hasFaceId](self, "hasFaceId"))
  {
    -[VCPProtoMovieHumanActionResult faceId](self, "faceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("faceIdentifier"));

  }
  if (-[VCPProtoMovieHumanActionResult hasBounds](self, "hasBounds", *(_OWORD *)&v18.start.value, *(_OWORD *)&v18.start.epoch, *(_OWORD *)&v18.duration.timescale))
  {
    -[VCPProtoMovieHumanActionResult bounds](self, "bounds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rectValue");
    NSStringFromRect(v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("humanBounds"));

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("attributes"));

  return v6;
}

@end
