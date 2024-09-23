@implementation VCPProtoVideoSegmentCaptionResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  VCPProtoVideoSegmentCaptionResult *v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CMTimeRange v12;
  uint8_t buf[16];
  CMTimeRange v14;

  v3 = (const __CFDictionary *)a3;
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v14.start.flags & 1) != 0
    && (v14.duration.flags & 1) != 0
    && !v14.duration.epoch
    && (v14.duration.value & 0x8000000000000000) == 0
    && v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoCaptionConfidence"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("videoCaptionText"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      v6 = objc_alloc_init(VCPProtoVideoSegmentCaptionResult);
      v12 = v14;
      +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoVideoSegmentCaptionResult setTimeRange:](v6, "setTimeRange:", v11);

      objc_msgSend(v8, "floatValue");
      -[VCPProtoVideoSegmentCaptionResult setConfidence:](v6, "setConfidence:");
      -[VCPProtoVideoSegmentCaptionResult setText:](v6, "setText:", v10);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoVideoSegmentCaptionResult] confidence or text is missing", buf, 2u);
      }
      v6 = 0;
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoVideoSegmentCaptionResult] timerange is invalid or attribute is missing", buf, 2u);
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
  void *v10;
  CMTimeRange v12;
  CMTimeRange range;

  -[VCPProtoVideoSegmentCaptionResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v12, 0, sizeof(v12));
  range = v12;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoVideoSegmentCaptionResult confidence](self, "confidence");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("videoCaptionConfidence"));

  -[VCPProtoVideoSegmentCaptionResult text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("videoCaptionText"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("attributes"));
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
  v8.super_class = (Class)VCPProtoVideoSegmentCaptionResult;
  -[VCPProtoVideoSegmentCaptionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoVideoSegmentCaptionResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *text;

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

  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKey:", text, CFSTR("text"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoVideoSegmentCaptionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  VCPProtoTimeRange *timeRange;
  float *v5;

  timeRange = self->_timeRange;
  v5 = (float *)a3;
  objc_msgSend(v5, "setTimeRange:", timeRange);
  v5[2] = self->_confidence;
  objc_msgSend(v5, "setText:", self->_text);

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
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(float *)(v5 + 8) = self->_confidence;
  v8 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  NSString *text;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[3]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_confidence == *((float *)v4 + 2))
  {
    text = self->_text;
    if ((unint64_t)text | v4[2])
      v7 = -[NSString isEqual:](text, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

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
  return v12 ^ v3 ^ -[NSString hash](self->_text, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  id v7;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 3);
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
    -[VCPProtoVideoSegmentCaptionResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v7;
LABEL_7:
  self->_confidence = *((float *)v4 + 2);
  if (*((_QWORD *)v4 + 2))
  {
    -[VCPProtoVideoSegmentCaptionResult setText:](self, "setText:");
    v4 = v7;
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

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
