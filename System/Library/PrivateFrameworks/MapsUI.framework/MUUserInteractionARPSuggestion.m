@implementation MUUserInteractionARPSuggestion

- (void)setIsRatingSuggestion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isRatingSuggestion = a3;
}

- (void)setHasIsRatingSuggestion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsRatingSuggestion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIsPhotoSuggestion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isPhotoSuggestion = a3;
}

- (void)setHasIsPhotoSuggestion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsPhotoSuggestion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDidTapSuggestion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_didTapSuggestion = a3;
}

- (void)setHasDidTapSuggestion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDidTapSuggestion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDidSelectDislike:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_didSelectDislike = a3;
}

- (void)setHasDidSelectDislike:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDidSelectDislike
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDisSelectLike:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_disSelectLike = a3;
}

- (void)setHasDisSelectLike:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDisSelectLike
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
  v8.super_class = (Class)MUUserInteractionARPSuggestion;
  -[MUUserInteractionARPSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUUserInteractionARPSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRatingSuggestion);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isRatingSuggestion"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPhotoSuggestion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isPhotoSuggestion"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSelectDislike);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("didSelectDislike"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didTapSuggestion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("didTapSuggestion"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_disSelectLike);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("disSelectLike"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUUserInteractionARPSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 4) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[12] = self->_isRatingSuggestion;
    v4[16] |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[11] = self->_isPhotoSuggestion;
  v4[16] |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    v4[8] = self->_didSelectDislike;
    v4[16] |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[9] = self->_didTapSuggestion;
  v4[16] |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    v4[10] = self->_disSelectLike;
    v4[16] |= 4u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)result + 12) = self->_isRatingSuggestion;
    *((_BYTE *)result + 16) |= 0x10u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 11) = self->_isPhotoSuggestion;
  *((_BYTE *)result + 16) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)result + 9) = self->_didTapSuggestion;
  *((_BYTE *)result + 16) |= 2u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_BYTE *)result + 8) = self->_didSelectDislike;
  *((_BYTE *)result + 16) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_6:
  *((_BYTE *)result + 10) = self->_disSelectLike;
  *((_BYTE *)result + 16) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[16] & 0x10) == 0)
      goto LABEL_36;
    if (self->_isRatingSuggestion)
    {
      if (!v4[12])
        goto LABEL_36;
    }
    else if (v4[12])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[16] & 8) == 0)
      goto LABEL_36;
    if (self->_isPhotoSuggestion)
    {
      if (!v4[11])
        goto LABEL_36;
    }
    else if (v4[11])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[16] & 2) == 0)
      goto LABEL_36;
    if (self->_didTapSuggestion)
    {
      if (!v4[9])
        goto LABEL_36;
    }
    else if (v4[9])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[16] & 1) == 0)
      goto LABEL_36;
    if (self->_didSelectDislike)
    {
      if (!v4[8])
        goto LABEL_36;
    }
    else if (v4[8])
    {
      goto LABEL_36;
    }
  }
  else if ((v4[16] & 1) != 0)
  {
    goto LABEL_36;
  }
  v5 = (v4[16] & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[16] & 4) != 0)
    {
      if (self->_disSelectLike)
      {
        if (!v4[10])
          goto LABEL_36;
      }
      else if (v4[10])
      {
        goto LABEL_36;
      }
      v5 = 1;
      goto LABEL_37;
    }
LABEL_36:
    v5 = 0;
  }
LABEL_37:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v2 = 2654435761 * self->_isRatingSuggestion;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isPhotoSuggestion;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_didTapSuggestion;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_didSelectDislike;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_disSelectLike;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;

  v4 = (BOOL *)a3;
  v5 = v4[16];
  if ((v5 & 0x10) != 0)
  {
    self->_isRatingSuggestion = v4[12];
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = v4[16];
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((v4[16] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_isPhotoSuggestion = v4[11];
  *(_BYTE *)&self->_has |= 8u;
  v5 = v4[16];
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if (!v5)
      goto LABEL_5;
LABEL_11:
    self->_didSelectDislike = v4[8];
    *(_BYTE *)&self->_has |= 1u;
    if ((v4[16] & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_didTapSuggestion = v4[9];
  *(_BYTE *)&self->_has |= 2u;
  v5 = v4[16];
  if (v5)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 4) != 0)
  {
LABEL_6:
    self->_disSelectLike = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:

}

- (BOOL)isRatingSuggestion
{
  return self->_isRatingSuggestion;
}

- (BOOL)isPhotoSuggestion
{
  return self->_isPhotoSuggestion;
}

- (BOOL)didTapSuggestion
{
  return self->_didTapSuggestion;
}

- (BOOL)didSelectDislike
{
  return self->_didSelectDislike;
}

- (BOOL)disSelectLike
{
  return self->_disSelectLike;
}

@end
