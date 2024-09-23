@implementation VCPProtoLivePhotoVariationParams

- (void)setLoopFadeLen:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_loopFadeLen = a3;
}

- (void)setHasLoopFadeLen:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLoopFadeLen
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLoopPeriod:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_loopPeriod = a3;
}

- (void)setHasLoopPeriod:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLoopPeriod
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLoopStart:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_loopStart = a3;
}

- (void)setHasLoopStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLoopStart
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)VCPProtoLivePhotoVariationParams;
  -[VCPProtoLivePhotoVariationParams description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoVariationParams dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  char has;
  void *v6;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_errorCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("errorCode"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_loopPeriod);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("loopPeriod"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_loopFadeLen);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("loopFadeLen"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_loopStart);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("loopStart"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoVariationParamsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  v4[2] = self->_errorCode;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v4[4] = self->_loopPeriod;
    *((_BYTE *)v4 + 24) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[3] = self->_loopFadeLen;
  *((_BYTE *)v4 + 24) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    v4[5] = self->_loopStart;
    *((_BYTE *)v4 + 24) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_errorCode;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 3) = self->_loopFadeLen;
    *((_BYTE *)result + 24) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_loopPeriod;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 5) = self->_loopStart;
  *((_BYTE *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_errorCode != *((_DWORD *)v4 + 2))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_loopFadeLen != *((_DWORD *)v4 + 3))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_17:
    v5 = 0;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_loopPeriod != *((_DWORD *)v4 + 4))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_17;
  }
  v5 = (*((_BYTE *)v4 + 24) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_loopStart != *((_DWORD *)v4 + 5))
      goto LABEL_17;
    v5 = 1;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_loopFadeLen;
  else
    v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_loopPeriod;
  else
    v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v4 = 2654435761 * self->_loopStart;
  else
    v4 = 0;
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_errorCode);
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;

  v4 = a3;
  self->_errorCode = v4[2];
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) == 0)
  {
    if ((v4[6] & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_loopPeriod = v4[4];
    *(_BYTE *)&self->_has |= 2u;
    if ((v4[6] & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_loopFadeLen = v4[3];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_loopStart = v4[5];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int)a3
{
  self->_errorCode = a3;
}

- (int)loopFadeLen
{
  return self->_loopFadeLen;
}

- (int)loopPeriod
{
  return self->_loopPeriod;
}

- (int)loopStart
{
  return self->_loopStart;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  VCPProtoLivePhotoVariationParams *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(VCPProtoLivePhotoVariationParams);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Params"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ErrorCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPProtoLivePhotoVariationParams setErrorCode:](v4, "setErrorCode:", objc_msgSend(v6, "intValue"));

    if (!-[VCPProtoLivePhotoVariationParams errorCode](v4, "errorCode") && v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("loopFadeLen"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoVariationParams setLoopFadeLen:](v4, "setLoopFadeLen:", objc_msgSend(v7, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("loopPeriod"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoVariationParams setLoopPeriod:](v4, "setLoopPeriod:", objc_msgSend(v8, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("loopStart"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCPProtoLivePhotoVariationParams setLoopStart:](v4, "setLoopStart:", objc_msgSend(v9, "intValue"));

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoVariationParams errorCode](self, "errorCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ErrorCode"));

  if (!-[VCPProtoLivePhotoVariationParams errorCode](self, "errorCode"))
  {
    v10[0] = CFSTR("loopFadeLen");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoVariationParams loopFadeLen](self, "loopFadeLen"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    v10[1] = CFSTR("loopPeriod");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoVariationParams loopPeriod](self, "loopPeriod"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    v10[2] = CFSTR("loopStart");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCPProtoLivePhotoVariationParams loopStart](self, "loopStart"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Params"));
  }
  return v3;
}

@end
