@implementation VCPProtoImageJunkResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  VCPProtoImageJunkResult *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("junk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(VCPProtoImageJunkResult);
    objc_msgSend(v4, "floatValue");
    -[VCPProtoImageJunkResult setConfidence:](v5, "setConfidence:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("attributes");
  v7 = CFSTR("junk");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoImageJunkResult confidence](self, "confidence");
  objc_msgSend(v2, "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  v8.super_class = (Class)VCPProtoImageJunkResult;
  -[VCPProtoImageJunkResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageJunkResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("confidence"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageJunkResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_confidence);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  float *v4;
  BOOL v5;

  v4 = (float *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = self->_confidence == v4[2];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  float confidence;
  float v3;
  float v4;
  float v5;
  float v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  confidence = self->_confidence;
  v3 = -confidence;
  if (confidence >= 0.0)
    v3 = self->_confidence;
  v4 = floorf(v3 + 0.5);
  v5 = (float)(v3 - v4) * 1.8447e19;
  v6 = fmodf(v4, 1.8447e19);
  v7 = 2654435761u * (unint64_t)v6;
  v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0)
    v8 = 2654435761u * (unint64_t)v6;
  v9 = v7 - (unint64_t)fabsf(v5);
  if (v5 < 0.0)
    return v9;
  else
    return v8;
}

- (void)mergeFrom:(id)a3
{
  self->_confidence = *((float *)a3 + 2);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end
