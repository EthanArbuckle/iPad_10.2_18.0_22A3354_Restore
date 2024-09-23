@implementation VCPProtoVideoCaptionResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoVideoCaptionResult;
  -[VCPProtoVideoCaptionResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoVideoCaptionResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *text;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("confidence"));

  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKey:", text, CFSTR("text"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoVideoCaptionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
  objc_msgSend(a3, "setText:", self->_text);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 8) = self->_confidence;
  v6 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *text;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_confidence == *((float *)v4 + 2))
  {
    text = self->_text;
    if ((unint64_t)text | v4[2])
      v6 = -[NSString isEqual:](text, "isEqual:");
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
  float confidence;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  confidence = self->_confidence;
  v4 = -confidence;
  if (confidence >= 0.0)
    v4 = self->_confidence;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  return -[NSString hash](self->_text, "hash") ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_confidence = *((float *)a3 + 2);
  if (*((_QWORD *)a3 + 2))
    -[VCPProtoVideoCaptionResult setText:](self, "setText:");
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
  objc_storeStrong((id *)&self->_text, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  VCPProtoVideoCaptionResult *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("videoCaptionConfidence"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoCaptionText"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoVideoCaptionResult] confidence or text is missing", v11, 2u);
      }
      v9 = 0;
    }
    else
    {
      v9 = objc_alloc_init(VCPProtoVideoCaptionResult);
      objc_msgSend(v5, "floatValue");
      -[VCPProtoVideoCaptionResult setConfidence:](v9, "setConfidence:");
      -[VCPProtoVideoCaptionResult setText:](v9, "setText:", v7);
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoVideoCaptionResult] attribute is missing", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoVideoCaptionResult confidence](self, "confidence");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("videoCaptionConfidence"));

  -[VCPProtoVideoCaptionResult text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("videoCaptionText"));

  v9 = CFSTR("attributes");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
