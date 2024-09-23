@implementation VCPProtoVideoCaptionPreferenceResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoVideoCaptionPreferenceResult;
  -[VCPProtoVideoCaptionPreferenceResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoVideoCaptionPreferenceResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preference);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("preference"));

  *(float *)&v5 = self->_score;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("score"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoVideoCaptionPreferenceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  *((_BYTE *)a3 + 12) = self->_preference;
  *((_DWORD *)a3 + 2) = LODWORD(self->_score);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_BYTE *)result + 12) = self->_preference;
  *((_DWORD *)result + 2) = LODWORD(self->_score);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  if (!self->_preference)
  {
    if (!*((_BYTE *)v4 + 12))
      goto LABEL_4;
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if (!*((_BYTE *)v4 + 12))
    goto LABEL_6;
LABEL_4:
  v5 = self->_score == *((float *)v4 + 2);
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  _BOOL4 preference;
  float score;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  preference = self->_preference;
  score = self->_score;
  v4 = -score;
  if (score >= 0.0)
    v4 = self->_score;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 >= 0.0)
    v10 = v9;
  return v10 ^ (2654435761 * preference);
}

- (void)mergeFrom:(id)a3
{
  self->_preference = *((_BYTE *)a3 + 12);
  self->_score = *((float *)a3 + 2);
}

- (BOOL)preference
{
  return self->_preference;
}

- (void)setPreference:(BOOL)a3
{
  self->_preference = a3;
}

- (float)score
{
  return self->_score;
}

- (void)setScore:(float)a3
{
  self->_score = a3;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  VCPProtoVideoCaptionPreferenceResult *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("videoCaptionPreference"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoCaptionPreferenceScore"));
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
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoVideoCaptionPreferenceResult] preference or score is missing", v11, 2u);
      }
      v9 = 0;
    }
    else
    {
      v9 = objc_alloc_init(VCPProtoVideoCaptionPreferenceResult);
      -[VCPProtoVideoCaptionPreferenceResult setPreference:](v9, "setPreference:", objc_msgSend(v5, "BOOLValue"));
      objc_msgSend(v7, "floatValue");
      -[VCPProtoVideoCaptionPreferenceResult setScore:](v9, "setScore:");
    }

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPProtoVideoCaptionPreferenceResult] attribute is missing", buf, 2u);
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCPProtoVideoCaptionPreferenceResult preference](self, "preference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("videoCaptionPreference"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoVideoCaptionPreferenceResult score](self, "score");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("videoCaptionPreferenceScore"));

  v9 = CFSTR("attributes");
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
