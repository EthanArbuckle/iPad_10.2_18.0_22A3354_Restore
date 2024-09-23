@implementation VCPProtoImageBlurResult

- (void)setFaceSharpness:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_faceSharpness = a3;
}

- (void)setHasFaceSharpness:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFaceSharpness
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
  v8.super_class = (Class)VCPProtoImageBlurResult;
  -[VCPProtoImageBlurResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageBlurResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  double v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_sharpness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sharpness"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v6 = self->_faceSharpness;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("faceSharpness"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageBlurResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteFloatField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_sharpness);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = LODWORD(self->_faceSharpness);
    *((_BYTE *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->_sharpness);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_faceSharpness);
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_sharpness != *((float *)v4 + 3))
    goto LABEL_7;
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) != 0 && self->_faceSharpness == *((float *)v4 + 2))
    {
      v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  float sharpness;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float faceSharpness;
  float v14;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;

  sharpness = self->_sharpness;
  v4 = -sharpness;
  if (sharpness >= 0.0)
    v4 = self->_sharpness;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    faceSharpness = self->_faceSharpness;
    v14 = -faceSharpness;
    if (faceSharpness >= 0.0)
      v14 = self->_faceSharpness;
    v15 = floorf(v14 + 0.5);
    v16 = (float)(v14 - v15) * 1.8447e19;
    v17 = fmodf(v15, 1.8447e19);
    v18 = 2654435761u * (unint64_t)v17;
    v19 = v18 + (unint64_t)v16;
    if (v16 <= 0.0)
      v19 = 2654435761u * (unint64_t)v17;
    v12 = v18 - (unint64_t)fabsf(v16);
    if (v16 >= 0.0)
      v12 = v19;
  }
  else
  {
    v12 = 0;
  }
  return v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_sharpness = *((float *)a3 + 3);
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_faceSharpness = *((float *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_sharpness = a3;
}

- (float)faceSharpness
{
  return self->_faceSharpness;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  VCPProtoImageBlurResult *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sharpness"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sharpnessFaces"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = objc_alloc_init(VCPProtoImageBlurResult);
    objc_msgSend(v4, "floatValue");
    -[VCPProtoImageBlurResult setSharpness:](v6, "setSharpness:");
    if (v5)
    {
      -[VCPProtoImageBlurResult setHasFaceSharpness:](v6, "setHasFaceSharpness:", 1);
      objc_msgSend(v5, "floatValue");
      -[VCPProtoImageBlurResult setFaceSharpness:](v6, "setFaceSharpness:");
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoImageBlurResult sharpness](self, "sharpness");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sharpness"));

  if (-[VCPProtoImageBlurResult hasFaceSharpness](self, "hasFaceSharpness"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoImageBlurResult faceSharpness](self, "faceSharpness");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sharpnessFaces"));

  }
  v10 = CFSTR("attributes");
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
