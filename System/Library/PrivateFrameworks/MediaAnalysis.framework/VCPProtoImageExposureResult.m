@implementation VCPProtoImageExposureResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  VCPProtoImageExposureResult *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("quality"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(VCPProtoImageExposureResult);
    objc_msgSend(v4, "floatValue");
    -[VCPProtoImageExposureResult setExposure:](v5, "setExposure:");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("underExpose"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "floatValue");
        -[VCPProtoImageExposureResult setUnderExpose:](v5, "setUnderExpose:");
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (-[VCPProtoImageExposureResult hasUnderExpose](self, "hasUnderExpose"))
  {
    v15[0] = CFSTR("quality");
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoImageExposureResult exposure](self, "exposure");
    objc_msgSend(v3, "numberWithFloat:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    v15[1] = CFSTR("attributes");
    v13 = CFSTR("underExpose");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoImageExposureResult underExpose](self, "underExpose");
    objc_msgSend(v5, "numberWithFloat:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("quality");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoImageExposureResult exposure](self, "exposure");
    objc_msgSend(v9, "numberWithFloat:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)setUnderExpose:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_underExpose = a3;
}

- (void)setHasUnderExpose:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnderExpose
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
  v8.super_class = (Class)VCPProtoImageExposureResult;
  -[VCPProtoImageExposureResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageExposureResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  *(float *)&v4 = self->_exposure;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("exposure"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v6 = self->_underExpose;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("underExpose"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageExposureResultReadFrom((uint64_t)self, (uint64_t)a3);
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
  *((_DWORD *)a3 + 2) = LODWORD(self->_exposure);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 3) = LODWORD(self->_underExpose);
    *((_BYTE *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_exposure);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_underExpose);
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_exposure != *((float *)v4 + 2))
    goto LABEL_7;
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) != 0 && self->_underExpose == *((float *)v4 + 3))
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
  float exposure;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  float underExpose;
  float v14;
  float v15;
  float v16;
  float v17;
  unint64_t v18;
  unint64_t v19;

  exposure = self->_exposure;
  v4 = -exposure;
  if (exposure >= 0.0)
    v4 = self->_exposure;
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
    underExpose = self->_underExpose;
    v14 = -underExpose;
    if (underExpose >= 0.0)
      v14 = self->_underExpose;
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
  self->_exposure = *((float *)a3 + 2);
  if ((*((_BYTE *)a3 + 16) & 1) != 0)
  {
    self->_underExpose = *((float *)a3 + 3);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (float)exposure
{
  return self->_exposure;
}

- (void)setExposure:(float)a3
{
  self->_exposure = a3;
}

- (float)underExpose
{
  return self->_underExpose;
}

@end
