@implementation CPLMemoryAssetFlag

- (void)setIsRepresentative:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isRepresentative = a3;
}

- (void)setHasIsRepresentative:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsRepresentative
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIsCurated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isCurated = a3;
}

- (void)setHasIsCurated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsCurated
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsMovieCurated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isMovieCurated = a3;
}

- (void)setHasIsMovieCurated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsMovieCurated
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsKeyAsset:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isKeyAsset = a3;
}

- (void)setHasIsKeyAsset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsKeyAsset
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsExtendedCurated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isExtendedCurated = a3;
}

- (void)setHasIsExtendedCurated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsExtendedCurated
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsUserCurated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_isUserCurated = a3;
}

- (void)setHasIsUserCurated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsUserCurated
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setIsCustomUserAsset:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isCustomUserAsset = a3;
}

- (void)setHasIsCustomUserAsset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsCustomUserAsset
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)CPLMemoryAssetFlag;
  -[CPLMemoryAssetFlag description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLMemoryAssetFlag dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRepresentative);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isRepresentative"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCurated);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isCurated"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMovieCurated);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isMovieCurated"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isKeyAsset);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("isKeyAsset"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUserCurated);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("isUserCurated"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExtendedCurated);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("isExtendedCurated"));

  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCustomUserAsset);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isCustomUserAsset"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLMemoryAssetFlagReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 2) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[13] = self->_isRepresentative;
    v4[16] |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_isCurated;
  v4[16] |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4[12] = self->_isMovieCurated;
  v4[16] |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v4[11] = self->_isKeyAsset;
  v4[16] |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    v4[14] = self->_isUserCurated;
    v4[16] |= 0x40u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  v4[10] = self->_isExtendedCurated;
  v4[16] |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    v4[9] = self->_isCustomUserAsset;
    v4[16] |= 2u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)result + 13) = self->_isRepresentative;
    *((_BYTE *)result + 16) |= 0x20u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 8) = self->_isCurated;
  *((_BYTE *)result + 16) |= 1u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 12) = self->_isMovieCurated;
  *((_BYTE *)result + 16) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 11) = self->_isKeyAsset;
  *((_BYTE *)result + 16) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)result + 10) = self->_isExtendedCurated;
  *((_BYTE *)result + 16) |= 4u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 2) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_BYTE *)result + 14) = self->_isUserCurated;
  *((_BYTE *)result + 16) |= 0x40u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_8:
  *((_BYTE *)result + 9) = self->_isCustomUserAsset;
  *((_BYTE *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[16] & 0x20) == 0)
      goto LABEL_52;
    if (self->_isRepresentative)
    {
      if (!v4[13])
        goto LABEL_52;
    }
    else if (v4[13])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[16] & 1) == 0)
      goto LABEL_52;
    if (self->_isCurated)
    {
      if (!v4[8])
        goto LABEL_52;
    }
    else if (v4[8])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[16] & 0x10) == 0)
      goto LABEL_52;
    if (self->_isMovieCurated)
    {
      if (!v4[12])
        goto LABEL_52;
    }
    else if (v4[12])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[16] & 8) == 0)
      goto LABEL_52;
    if (self->_isKeyAsset)
    {
      if (!v4[11])
        goto LABEL_52;
    }
    else if (v4[11])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[16] & 4) == 0)
      goto LABEL_52;
    if (self->_isExtendedCurated)
    {
      if (!v4[10])
        goto LABEL_52;
    }
    else if (v4[10])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[16] & 0x40) == 0)
      goto LABEL_52;
    if (self->_isUserCurated)
    {
      if (!v4[14])
        goto LABEL_52;
    }
    else if (v4[14])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 0x40) != 0)
  {
    goto LABEL_52;
  }
  v5 = (v4[16] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[16] & 2) != 0)
    {
      if (self->_isCustomUserAsset)
      {
        if (!v4[9])
          goto LABEL_52;
      }
      else if (v4[9])
      {
        goto LABEL_52;
      }
      v5 = 1;
      goto LABEL_53;
    }
LABEL_52:
    v5 = 0;
  }
LABEL_53:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v2 = 2654435761 * self->_isRepresentative;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isCurated;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isMovieCurated;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isKeyAsset;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_isExtendedCurated;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_isUserCurated;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_isCustomUserAsset;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;

  v4 = (BOOL *)a3;
  v5 = v4[16];
  if ((v5 & 0x20) != 0)
  {
    self->_isRepresentative = v4[13];
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = v4[16];
    if (!v5)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if (!v4[16])
  {
    goto LABEL_3;
  }
  self->_isCurated = v4[8];
  *(_BYTE *)&self->_has |= 1u;
  v5 = v4[16];
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_isMovieCurated = v4[12];
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = v4[16];
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_isKeyAsset = v4[11];
  *(_BYTE *)&self->_has |= 8u;
  v5 = v4[16];
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
LABEL_15:
    self->_isUserCurated = v4[14];
    *(_BYTE *)&self->_has |= 0x40u;
    if ((v4[16] & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_isExtendedCurated = v4[10];
  *(_BYTE *)&self->_has |= 4u;
  v5 = v4[16];
  if ((v5 & 0x40) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 2) != 0)
  {
LABEL_8:
    self->_isCustomUserAsset = v4[9];
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_9:

}

- (BOOL)isRepresentative
{
  return self->_isRepresentative;
}

- (BOOL)isCurated
{
  return self->_isCurated;
}

- (BOOL)isMovieCurated
{
  return self->_isMovieCurated;
}

- (BOOL)isKeyAsset
{
  return self->_isKeyAsset;
}

- (BOOL)isExtendedCurated
{
  return self->_isExtendedCurated;
}

- (BOOL)isUserCurated
{
  return self->_isUserCurated;
}

- (BOOL)isCustomUserAsset
{
  return self->_isCustomUserAsset;
}

@end
