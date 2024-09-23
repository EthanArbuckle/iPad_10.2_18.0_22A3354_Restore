@implementation CPLSuggestionAssetFlag

- (void)setIsRepresentative:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isRepresentative = a3;
}

- (void)setHasIsRepresentative:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsRepresentative
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsKeyAsset:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isKeyAsset = a3;
}

- (void)setHasIsKeyAsset:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsKeyAsset
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
  v8.super_class = (Class)CPLSuggestionAssetFlag;
  -[CPLSuggestionAssetFlag description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLSuggestionAssetFlag dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRepresentative);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isRepresentative"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isKeyAsset);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isKeyAsset"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLSuggestionAssetFlagReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_isRepresentative;
    v4[12] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[8] = self->_isKeyAsset;
    v4[12] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 9) = self->_isRepresentative;
    *((_BYTE *)result + 12) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_BYTE *)result + 8) = self->_isKeyAsset;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0)
      goto LABEL_12;
    if (self->_isRepresentative)
    {
      if (!v4[9])
        goto LABEL_12;
    }
    else if (v4[9])
    {
      goto LABEL_12;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
    goto LABEL_12;
  }
  v5 = (v4[12] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[12] & 1) != 0)
    {
      if (self->_isKeyAsset)
      {
        if (!v4[8])
          goto LABEL_12;
      }
      else if (v4[8])
      {
        goto LABEL_12;
      }
      v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_isRepresentative;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_isKeyAsset;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;

  v4 = (BOOL *)a3;
  v5 = v4[12];
  if ((v5 & 2) != 0)
  {
    self->_isRepresentative = v4[9];
    *(_BYTE *)&self->_has |= 2u;
    v5 = v4[12];
  }
  if (v5)
  {
    self->_isKeyAsset = v4[8];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)isRepresentative
{
  return self->_isRepresentative;
}

- (BOOL)isKeyAsset
{
  return self->_isKeyAsset;
}

@end
