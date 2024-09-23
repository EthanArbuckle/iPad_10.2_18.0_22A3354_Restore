@implementation VCPProtoImageFaceResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *v9;
  BOOL v10;
  VCPProtoImageFaceResult *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSRect v21;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("flags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("facePoseYaw"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("facePosition"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceBounds"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (NSString *)v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10 || v7 == 0 || v8 == 0)
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init(VCPProtoImageFaceResult);
    v14 = objc_msgSend(v5, "unsignedIntegerValue");
    v15 = v14;
    if ((v14 & 4) != 0)
      v16 = 2;
    else
      v16 = (v14 >> 3) & 1;
    -[VCPProtoImageFaceResult setEyeExpression:](v13, "setEyeExpression:", v16);
    -[VCPProtoImageFaceResult setMouthExpression:](v13, "setMouthExpression:", (v15 >> 1) & 1);
    -[VCPProtoImageFaceResult setYaw:](v13, "setYaw:", objc_msgSend(v6, "intValue"));
    -[VCPProtoImageFaceResult setPosition:](v13, "setPosition:", objc_msgSend(v7, "intValue"));
    v21 = NSRectFromString(v9);
    +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoImageFaceResult setBounds:](v13, "setBounds:", v17);

    -[VCPProtoImageFaceResult setIsCloseup:](v13, "setIsCloseup:", (v15 >> 4) & 1);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceQuality"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceQuality"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      -[VCPProtoImageFaceResult setFaceQuality:](v13, "setFaceQuality:");

    }
  }

  return v13;
}

- (id)exportToLegacyDictionary
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];
  NSRect v18;

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = -[VCPProtoImageFaceResult eyeExpression](self, "eyeExpression");
  if (v3 == 1)
    v4 = 8;
  else
    v4 = 4 * (v3 == 2);
  if (-[VCPProtoImageFaceResult mouthExpression](self, "mouthExpression") == 1)
    v4 |= 2uLL;
  if (-[VCPProtoImageFaceResult isCloseup](self, "isCloseup"))
    v5 = v4 | 0x10;
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoImageFaceResult yaw](self, "yaw"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("facePoseYaw"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoImageFaceResult position](self, "position"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("facePosition"));

  -[VCPProtoImageFaceResult bounds](self, "bounds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rectValue");
  NSStringFromRect(v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("faceBounds"));

  if (-[VCPProtoImageFaceResult hasFaceQuality](self, "hasFaceQuality"))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoImageFaceResult faceQuality](self, "faceQuality");
    objc_msgSend(v11, "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("faceQuality"));

  }
  v16[0] = CFSTR("flags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("attributes");
  v17[0] = v13;
  v17[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setFaceQuality:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_faceQuality = a3;
}

- (void)setHasFaceQuality:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFaceQuality
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
  v8.super_class = (Class)VCPProtoImageFaceResult;
  -[VCPProtoImageFaceResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoImageFaceResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  VCPProtoBounds *bounds;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_eyeExpression);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("eyeExpression"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_mouthExpression);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mouthExpression"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_yaw);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("yaw"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_position);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("position"));

  bounds = self->_bounds;
  if (bounds)
  {
    -[VCPProtoBounds dictionaryRepresentation](bounds, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("bounds"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCloseup);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isCloseup"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v11 = self->_faceQuality;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("faceQuality"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageFaceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  v4[4] = self->_eyeExpression;
  v4[6] = self->_mouthExpression;
  v4[8] = self->_yaw;
  v4[7] = self->_position;
  objc_msgSend(v4, "setBounds:", self->_bounds);
  *((_BYTE *)v4 + 36) = self->_isCloseup;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[5] = LODWORD(self->_faceQuality);
    *((_BYTE *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_eyeExpression;
  *(_DWORD *)(v5 + 24) = self->_mouthExpression;
  *(_DWORD *)(v5 + 32) = self->_yaw;
  *(_DWORD *)(v5 + 28) = self->_position;
  v6 = -[VCPProtoBounds copyWithZone:](self->_bounds, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_BYTE *)(v5 + 36) = self->_isCloseup;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v5 + 20) = self->_faceQuality;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoBounds *bounds;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if (self->_eyeExpression != *((_DWORD *)v4 + 4))
    goto LABEL_16;
  if (self->_mouthExpression != *((_DWORD *)v4 + 6))
    goto LABEL_16;
  if (self->_yaw != *((_DWORD *)v4 + 8))
    goto LABEL_16;
  if (self->_position != *((_DWORD *)v4 + 7))
    goto LABEL_16;
  bounds = self->_bounds;
  if ((unint64_t)bounds | *((_QWORD *)v4 + 1))
  {
    if (!-[VCPProtoBounds isEqual:](bounds, "isEqual:"))
      goto LABEL_16;
  }
  if (self->_isCloseup)
  {
    if (!*((_BYTE *)v4 + 36))
      goto LABEL_16;
  }
  else if (*((_BYTE *)v4 + 36))
  {
LABEL_16:
    v6 = 0;
    goto LABEL_17;
  }
  v6 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_faceQuality != *((float *)v4 + 5))
      goto LABEL_16;
    v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  uint64_t eyeExpression;
  uint64_t mouthExpression;
  uint64_t yaw;
  uint64_t position;
  unint64_t v7;
  _BOOL4 isCloseup;
  unint64_t v9;
  float faceQuality;
  float v11;
  float v12;
  float v13;

  eyeExpression = self->_eyeExpression;
  mouthExpression = self->_mouthExpression;
  yaw = self->_yaw;
  position = self->_position;
  v7 = -[VCPProtoBounds hash](self->_bounds, "hash");
  isCloseup = self->_isCloseup;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    faceQuality = self->_faceQuality;
    v11 = -faceQuality;
    if (faceQuality >= 0.0)
      v11 = self->_faceQuality;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  return (2654435761 * mouthExpression) ^ (2654435761 * eyeExpression) ^ (2654435761 * yaw) ^ (2654435761 * position) ^ v7 ^ (2654435761 * isCloseup) ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoBounds *bounds;
  uint64_t v6;
  id v7;

  v4 = a3;
  self->_eyeExpression = *((_DWORD *)v4 + 4);
  self->_mouthExpression = *((_DWORD *)v4 + 6);
  self->_yaw = *((_DWORD *)v4 + 8);
  self->_position = *((_DWORD *)v4 + 7);
  bounds = self->_bounds;
  v6 = *((_QWORD *)v4 + 1);
  if (bounds)
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v7 = v4;
    -[VCPProtoImageFaceResult setBounds:](self, "setBounds:");
  }
  v4 = v7;
LABEL_7:
  self->_isCloseup = *((_BYTE *)v4 + 36);
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_faceQuality = *((float *)v4 + 5);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (int)eyeExpression
{
  return self->_eyeExpression;
}

- (void)setEyeExpression:(int)a3
{
  self->_eyeExpression = a3;
}

- (int)mouthExpression
{
  return self->_mouthExpression;
}

- (void)setMouthExpression:(int)a3
{
  self->_mouthExpression = a3;
}

- (int)yaw
{
  return self->_yaw;
}

- (void)setYaw:(int)a3
{
  self->_yaw = a3;
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
  objc_storeStrong((id *)&self->_bounds, a3);
}

- (BOOL)isCloseup
{
  return self->_isCloseup;
}

- (void)setIsCloseup:(BOOL)a3
{
  self->_isCloseup = a3;
}

- (float)faceQuality
{
  return self->_faceQuality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end
