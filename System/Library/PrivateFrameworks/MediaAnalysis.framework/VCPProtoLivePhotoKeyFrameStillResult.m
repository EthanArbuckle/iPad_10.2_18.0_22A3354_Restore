@implementation VCPProtoLivePhotoKeyFrameStillResult

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoKeyFrameStillResult;
  -[VCPProtoLivePhotoKeyFrameStillResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoKeyFrameStillResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_sharpness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sharpness"));

  *(float *)&v6 = self->_textureness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("textureness"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasFlash);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("hasFlash"));

  *(float *)&v9 = self->_stillTime;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("stillTime"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoKeyFrameStillResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_sharpness);
  *((_DWORD *)a3 + 4) = LODWORD(self->_textureness);
  *((_BYTE *)a3 + 20) = self->_hasFlash;
  *((_DWORD *)a3 + 3) = LODWORD(self->_stillTime);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_sharpness);
  *((_DWORD *)result + 4) = LODWORD(self->_textureness);
  *((_BYTE *)result + 20) = self->_hasFlash;
  *((_DWORD *)result + 3) = LODWORD(self->_stillTime);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    || self->_sharpness != *((float *)v4 + 2)
    || self->_textureness != *((float *)v4 + 4))
  {
    goto LABEL_8;
  }
  if (!self->_hasFlash)
  {
    if (!*((_BYTE *)v4 + 20))
      goto LABEL_6;
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  if (!*((_BYTE *)v4 + 20))
    goto LABEL_8;
LABEL_6:
  v5 = self->_stillTime == *((float *)v4 + 3);
LABEL_9:

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
  float textureness;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 hasFlash;
  float stillTime;
  float v23;
  float v24;
  float v25;
  float v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

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
  textureness = self->_textureness;
  v13 = -textureness;
  if (textureness >= 0.0)
    v13 = self->_textureness;
  v14 = floorf(v13 + 0.5);
  v15 = (float)(v13 - v14) * 1.8447e19;
  v16 = fmodf(v14, 1.8447e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  hasFlash = self->_hasFlash;
  stillTime = self->_stillTime;
  v23 = -stillTime;
  if (stillTime >= 0.0)
    v23 = self->_stillTime;
  v24 = floorf(v23 + 0.5);
  v25 = (float)(v23 - v24) * 1.8447e19;
  v26 = fmodf(v24, 1.8447e19);
  v27 = 2654435761u * (unint64_t)v26;
  v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0)
    v28 = 2654435761u * (unint64_t)v26;
  v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 >= 0.0)
    v29 = v28;
  return v20 ^ v11 ^ (2654435761 * hasFlash) ^ v29;
}

- (void)mergeFrom:(id)a3
{
  self->_sharpness = *((float *)a3 + 2);
  self->_textureness = *((float *)a3 + 4);
  self->_hasFlash = *((_BYTE *)a3 + 20);
  self->_stillTime = *((float *)a3 + 3);
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_sharpness = a3;
}

- (float)textureness
{
  return self->_textureness;
}

- (void)setTextureness:(float)a3
{
  self->_textureness = a3;
}

- (BOOL)hasFlash
{
  return self->_hasFlash;
}

- (void)setHasFlash:(BOOL)a3
{
  self->_hasFlash = a3;
}

- (float)stillTime
{
  return self->_stillTime;
}

- (void)setStillTime:(float)a3
{
  self->_stillTime = a3;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  VCPProtoLivePhotoKeyFrameStillResult *v6;
  VCPProtoLivePhotoKeyFrameStillResult *v7;
  VCPProtoLivePhotoKeyFrameStillResult *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc_init(VCPProtoLivePhotoKeyFrameStillResult);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sharpness"));
      v7 = (VCPProtoLivePhotoKeyFrameStillResult *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        -[VCPProtoLivePhotoKeyFrameStillResult floatValue](v7, "floatValue");
        -[VCPProtoLivePhotoKeyFrameStillResult setSharpness:](v6, "setSharpness:");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("texture"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_10;
        objc_msgSend(v9, "floatValue");
        -[VCPProtoLivePhotoKeyFrameStillResult setTextureness:](v6, "setTextureness:");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flashFired"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          goto LABEL_10;
        -[VCPProtoLivePhotoKeyFrameStillResult setHasFlash:](v6, "setHasFlash:", objc_msgSend(v10, "BOOLValue"));
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stillTime"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "floatValue");
          -[VCPProtoLivePhotoKeyFrameStillResult setStillTime:](v6, "setStillTime:");
          v8 = v6;

        }
        else
        {
LABEL_10:
          v8 = 0;
        }
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
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
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[4];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = CFSTR("attributes");
  v13[0] = CFSTR("sharpness");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameStillResult sharpness](self, "sharpness");
  objc_msgSend(v3, "numberWithFloat:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("texture");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameStillResult textureness](self, "textureness");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("flashFired");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCPProtoLivePhotoKeyFrameStillResult hasFlash](self, "hasFlash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("stillTime");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameStillResult stillTime](self, "stillTime");
  objc_msgSend(v8, "numberWithFloat:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
