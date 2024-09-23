@implementation VCPProtoAudioFusedVideoEmbeddingResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  uint64_t v4;
  void *v5;
  VCPProtoAudioFusedVideoEmbeddingResult *v6;
  VCPProtoAudioFusedVideoEmbeddingResult *v8;
  void *v9;
  void *v10;
  void *v11;
  CMTimeRange v12;
  uint8_t buf[16];
  CMTimeRange v14;

  v3 = (const __CFDictionary *)a3;
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if ((v14.start.flags & 1) != 0
    && (v14.duration.flags & 1) != 0
    && !v14.duration.epoch
    && (v14.duration.value & 0x8000000000000000) == 0
    && v4)
  {
    v8 = objc_alloc_init(VCPProtoAudioFusedVideoEmbeddingResult);
    v12 = v14;
    +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoAudioFusedVideoEmbeddingResult setTimeRange:](v8, "setTimeRange:", v9);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("embeddings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[VCPProtoAudioFusedVideoEmbeddingResult setEmbeddingBlob:](v8, "setEmbeddingBlob:", v10);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("embeddingVersion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[VCPProtoAudioFusedVideoEmbeddingResult setHasVersion:](v8, "setHasVersion:", 1);
        -[VCPProtoAudioFusedVideoEmbeddingResult setVersion:](v8, "setVersion:", objc_msgSend(v11, "unsignedIntValue"));
      }
      v6 = v8;

    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoAudioFusedVideoEmbeddingResult] embeddingValue is missing", buf, 2u);
      }
      v6 = 0;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoAudioFusedVideoEmbeddingResult] timerange is invalid or attribute is missing", buf, 2u);
    }
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
  void *v9;
  CMTimeRange v11;
  CMTimeRange range;

  -[VCPProtoAudioFusedVideoEmbeddingResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v11, 0, sizeof(v11));
  range = v11;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoAudioFusedVideoEmbeddingResult embeddingBlob](self, "embeddingBlob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("embeddings"));

  if (-[VCPProtoAudioFusedVideoEmbeddingResult hasVersion](self, "hasVersion"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCPProtoAudioFusedVideoEmbeddingResult version](self, "version"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("embeddingVersion"));

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("attributes"), *(_OWORD *)&v11.start.value, *(_OWORD *)&v11.start.epoch, *(_OWORD *)&v11.duration.timescale);

  return v6;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)VCPProtoAudioFusedVideoEmbeddingResult;
  -[VCPProtoAudioFusedVideoEmbeddingResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoAudioFusedVideoEmbeddingResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *embeddingBlob;
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
  embeddingBlob = self->_embeddingBlob;
  if (embeddingBlob)
    objc_msgSend(v3, "setObject:forKey:", embeddingBlob, CFSTR("embeddingBlob"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("version"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoAudioFusedVideoEmbeddingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setTimeRange:", self->_timeRange);
  objc_msgSend(v4, "setEmbeddingBlob:", self->_embeddingBlob);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_version;
    *((_BYTE *)v4 + 28) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSData copyWithZone:](self->_embeddingBlob, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_version;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  NSData *embeddingBlob;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((_QWORD *)v4 + 2))
  {
    if (!-[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
      goto LABEL_10;
  }
  embeddingBlob = self->_embeddingBlob;
  if ((unint64_t)embeddingBlob | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](embeddingBlob, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_version == *((_DWORD *)v4 + 6))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  v4 = -[NSData hash](self->_embeddingBlob, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_version;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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
  v7 = v4;
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
    -[VCPProtoAudioFusedVideoEmbeddingResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 1))
  {
    -[VCPProtoAudioFusedVideoEmbeddingResult setEmbeddingBlob:](self, "setEmbeddingBlob:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
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

- (NSData)embeddingBlob
{
  return self->_embeddingBlob;
}

- (void)setEmbeddingBlob:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingBlob, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_embeddingBlob, 0);
}

@end
