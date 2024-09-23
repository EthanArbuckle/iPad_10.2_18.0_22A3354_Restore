@implementation SGMIMetricsSubmodelStats

- (void)setAgeOfTheSubmodelInDays:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ageOfTheSubmodelInDays = a3;
}

- (void)setHasAgeOfTheSubmodelInDays:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAgeOfTheSubmodelInDays
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNbHighlyDiscriminantTokensForSaliency:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_nbHighlyDiscriminantTokensForSaliency = a3;
}

- (void)setHasNbHighlyDiscriminantTokensForSaliency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNbHighlyDiscriminantTokensForSaliency
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setNbHighlyDiscriminantTokensForIgnorability:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_nbHighlyDiscriminantTokensForIgnorability = a3;
}

- (void)setHasNbHighlyDiscriminantTokensForIgnorability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNbHighlyDiscriminantTokensForIgnorability
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNbExtremelyDiscriminantTokensForSaliency:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_nbExtremelyDiscriminantTokensForSaliency = a3;
}

- (void)setHasNbExtremelyDiscriminantTokensForSaliency:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNbExtremelyDiscriminantTokensForSaliency
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNbExtremelyDiscriminantTokensForIgnorability:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nbExtremelyDiscriminantTokensForIgnorability = a3;
}

- (void)setHasNbExtremelyDiscriminantTokensForIgnorability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNbExtremelyDiscriminantTokensForIgnorability
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
  v8.super_class = (Class)SGMIMetricsSubmodelStats;
  -[SGMIMetricsSubmodelStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsSubmodelStats dictionaryRepresentation](self, "dictionaryRepresentation");
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
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ageOfTheSubmodelInDays);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("ageOfTheSubmodelInDays"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nbHighlyDiscriminantTokensForSaliency);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("nbHighlyDiscriminantTokensForSaliency"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nbExtremelyDiscriminantTokensForSaliency);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("nbExtremelyDiscriminantTokensForSaliency"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nbHighlyDiscriminantTokensForIgnorability);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("nbHighlyDiscriminantTokensForIgnorability"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nbExtremelyDiscriminantTokensForIgnorability);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("nbExtremelyDiscriminantTokensForIgnorability"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsSubmodelStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_ageOfTheSubmodelInDays;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_nbHighlyDiscriminantTokensForSaliency;
  *((_BYTE *)v4 + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    v4[4] = self->_nbExtremelyDiscriminantTokensForSaliency;
    *((_BYTE *)v4 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[5] = self->_nbHighlyDiscriminantTokensForIgnorability;
  *((_BYTE *)v4 + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_nbExtremelyDiscriminantTokensForIgnorability;
    *((_BYTE *)v4 + 28) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_ageOfTheSubmodelInDays;
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_nbHighlyDiscriminantTokensForSaliency;
  *((_BYTE *)result + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_nbHighlyDiscriminantTokensForIgnorability;
  *((_BYTE *)result + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_nbExtremelyDiscriminantTokensForSaliency;
  *((_BYTE *)result + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 3) = self->_nbExtremelyDiscriminantTokensForIgnorability;
  *((_BYTE *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_ageOfTheSubmodelInDays != *((_DWORD *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) == 0 || self->_nbHighlyDiscriminantTokensForSaliency != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0 || self->_nbHighlyDiscriminantTokensForIgnorability != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_nbExtremelyDiscriminantTokensForSaliency != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_nbExtremelyDiscriminantTokensForIgnorability != *((_DWORD *)v4 + 3))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_ageOfTheSubmodelInDays;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_nbHighlyDiscriminantTokensForSaliency;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_nbHighlyDiscriminantTokensForIgnorability;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_nbExtremelyDiscriminantTokensForSaliency;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_nbExtremelyDiscriminantTokensForIgnorability;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_ageOfTheSubmodelInDays = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_nbHighlyDiscriminantTokensForSaliency = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    self->_nbExtremelyDiscriminantTokensForSaliency = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_nbHighlyDiscriminantTokensForIgnorability = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_nbExtremelyDiscriminantTokensForIgnorability = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (unsigned)ageOfTheSubmodelInDays
{
  return self->_ageOfTheSubmodelInDays;
}

- (unsigned)nbHighlyDiscriminantTokensForSaliency
{
  return self->_nbHighlyDiscriminantTokensForSaliency;
}

- (unsigned)nbHighlyDiscriminantTokensForIgnorability
{
  return self->_nbHighlyDiscriminantTokensForIgnorability;
}

- (unsigned)nbExtremelyDiscriminantTokensForSaliency
{
  return self->_nbExtremelyDiscriminantTokensForSaliency;
}

- (unsigned)nbExtremelyDiscriminantTokensForIgnorability
{
  return self->_nbExtremelyDiscriminantTokensForIgnorability;
}

@end
