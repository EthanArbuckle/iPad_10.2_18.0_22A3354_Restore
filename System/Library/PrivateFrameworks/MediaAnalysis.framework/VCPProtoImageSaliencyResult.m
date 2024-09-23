@implementation VCPProtoImageSaliencyResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *v6;
  BOOL v7;
  VCPProtoImageSaliencyResult *v8;
  void *v9;
  NSRect v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("saliencyConfidence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("saliencyBounds"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_alloc_init(VCPProtoImageSaliencyResult);
    objc_msgSend(v4, "floatValue");
    -[VCPProtoImageSaliencyResult setConfidence:](v8, "setConfidence:");
    v11 = NSRectFromString(v6);
    +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoImageSaliencyResult setBounds:](v8, "setBounds:", v9);

  }
  return v8;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  const __CFString *v12;
  _QWORD v13[2];
  NSRect v14;

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("attributes");
  v10[0] = CFSTR("saliencyConfidence");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoImageSaliencyResult confidence](self, "confidence");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("saliencyBounds");
  -[VCPProtoImageSaliencyResult bounds](self, "bounds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rectValue");
  NSStringFromRect(v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  v8.super_class = (Class)VCPProtoImageSaliencyResult;
  -[VCPProtoImageSaliencyResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageSaliencyResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoBounds *bounds;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_confidence;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("confidence"));

  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("bounds"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageSaliencyResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = LODWORD(self->_confidence);
  objc_msgSend(a3, "setBounds:", self->_bounds);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 16) = self->_confidence;
  v6 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoBounds *bounds;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_confidence == *((float *)v4 + 4))
  {
    bounds = self->_bounds;
    if ((unint64_t)bounds | v4[1])
      v6 = -[VCPProtoBounds isEqual:](bounds, "isEqual:");
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
  return -[VCPProtoBounds hash](self->_bounds, "hash") ^ v11;
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  VCPProtoBounds *bounds;
  uint64_t v6;
  float *v7;

  v4 = (float *)a3;
  self->_confidence = v4[4];
  bounds = self->_bounds;
  v6 = *((_QWORD *)v4 + 1);
  if (bounds)
  {
    if (v6)
    {
      v7 = v4;
      -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[VCPProtoImageSaliencyResult setBounds:](self, "setBounds:");
    goto LABEL_6;
  }

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end
