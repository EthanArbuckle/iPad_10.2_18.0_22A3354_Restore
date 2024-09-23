@implementation VCPProtoLivePhotoSharpnessResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  VCPProtoLivePhotoSharpnessResult *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("quality"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(VCPProtoLivePhotoSharpnessResult);
    objc_msgSend(v3, "floatValue");
    -[VCPProtoLivePhotoSharpnessResult setSharpness:](v4, "setSharpness:");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)exportToLegacyDictionary
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("quality");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoSharpnessResult sharpness](self, "sharpness");
  objc_msgSend(v2, "numberWithFloat:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  v8.super_class = (Class)VCPProtoLivePhotoSharpnessResult;
  -[VCPProtoLivePhotoSharpnessResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoSharpnessResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  *(float *)&v4 = self->_sharpness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sharpness"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoSharpnessResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_sharpness);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_sharpness);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  float *v4;
  BOOL v5;

  v4 = (float *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = self->_sharpness == v4[2];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  float sharpness;
  float v3;
  float v4;
  float v5;
  float v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  sharpness = self->_sharpness;
  v3 = -sharpness;
  if (sharpness >= 0.0)
    v3 = self->_sharpness;
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
  self->_sharpness = *((float *)a3 + 2);
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_sharpness = a3;
}

@end
