@implementation VCPProtoMovieTorsoResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  NSString *v5;
  void *v6;
  unint64_t v7;
  VCPProtoMovieTorsoResult *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  CMTimeRange v14;
  CMTimeRange v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;
  NSRect v23;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFDictionary *)a3;
  memset(&v15, 0, sizeof(v15));
  CMTimeRangeMakeFromDictionary(&v15, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanBounds"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 == 0;

    if (!v12)
    {
      if (+[VCPProtoMovieTorsoResult(LegacyConversion) resultFromLegacyDictionary:]::onceToken == -1)
      {
        v8 = 0;
        goto LABEL_21;
      }
      dispatch_once(&+[VCPProtoMovieTorsoResult(LegacyConversion) resultFromLegacyDictionary:]::onceToken, &__block_literal_global_51);
LABEL_20:
      v8 = 0;
      goto LABEL_21;
    }
  }
  if ((v15.start.flags & 1) == 0
    || (v15.duration.flags & 1) == 0
    || v15.duration.epoch
    || !v6
    || v15.duration.value < 0
    || !v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      if ((v15.start.flags & 1) != 0)
      {
        LODWORD(v7) = 1;
        if ((v15.duration.flags & 1) != 0 && !v15.duration.epoch)
          v7 = (unint64_t)v15.duration.value >> 63;
      }
      else
      {
        LODWORD(v7) = 1;
      }
      *(_DWORD *)buf = 67109632;
      v17 = v7;
      v18 = 1024;
      v19 = v5 == 0;
      v20 = 1024;
      v21 = v6 == 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoMovieTorsoResult] Invalid time range (%d) / boundsValue (%d) / faceIdValue (%d)", buf, 0x14u);
    }
    goto LABEL_20;
  }
  v8 = objc_alloc_init(VCPProtoMovieTorsoResult);
  v14 = v15;
  +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieTorsoResult setTimeRange:](v8, "setTimeRange:", v9);

  v23 = NSRectFromString(v5);
  +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieTorsoResult setBounds:](v8, "setBounds:", v10);

  -[VCPProtoMovieTorsoResult setFaceId:](v8, "setFaceId:", objc_msgSend(v6, "unsignedIntValue"));
LABEL_21:

  return v8;
}

void __73__VCPProtoMovieTorsoResult_LegacyConversion__resultFromLegacyDictionary___block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    __73__VCPProtoMovieTorsoResult_LegacyConversion__resultFromLegacyDictionary___block_invoke_cold_1();
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFDictionaryRef v9;
  void *v10;
  CMTimeRange v12;
  CMTimeRange range;
  NSRect v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieTorsoResult bounds](self, "bounds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rectValue");
  NSStringFromRect(v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("humanBounds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoMovieTorsoResult faceId](self, "faceId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("faceId"));

  -[VCPProtoMovieTorsoResult timeRange](self, "timeRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "timeRangeValue");
  else
    memset(&v12, 0, sizeof(v12));
  range = v12;
  v9 = CMTimeRangeCopyAsDictionary(&range, 0);
  v10 = (void *)-[__CFDictionary mutableCopy](v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, CFSTR("attributes"));
  return v10;
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
  v8.super_class = (Class)VCPProtoMovieTorsoResult;
  -[VCPProtoMovieTorsoResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieTorsoResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoBounds *bounds;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timeRange"));

  }
  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("bounds"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_faceId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("faceId"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieTorsoResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  VCPProtoTimeRange *timeRange;
  _DWORD *v5;

  timeRange = self->_timeRange;
  v5 = a3;
  objc_msgSend(v5, "setTimeRange:", timeRange);
  objc_msgSend(v5, "setBounds:", self->_bounds);
  v5[4] = self->_faceId;

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

  *(_DWORD *)(v5 + 16) = self->_faceId;
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
    && self->_faceId == *((_DWORD *)v4 + 4);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  return -[VCPProtoBounds hash](self->_bounds, "hash") ^ v3 ^ (2654435761 * self->_faceId);
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
    -[VCPProtoMovieTorsoResult setTimeRange:](self, "setTimeRange:");
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
    -[VCPProtoMovieTorsoResult setBounds:](self, "setBounds:");
    goto LABEL_12;
  }
  self->_faceId = *((_DWORD *)v4 + 4);

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

- (unsigned)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(unsigned int)a3
{
  self->_faceId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

void __73__VCPProtoMovieTorsoResult_LegacyConversion__resultFromLegacyDictionary___block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Previous media analysis database restore causes missing MediaAnalysisResultFaceIDAttributeKey (present as MediaAnalysisResultFaceIdentifierAttributeKey) in movie torso results", v0, 2u);
}

@end
