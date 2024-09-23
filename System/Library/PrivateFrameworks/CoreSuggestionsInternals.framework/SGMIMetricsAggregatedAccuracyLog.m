@implementation SGMIMetricsAggregatedAccuracyLog

- (void)setSalientPredictedAsSalient:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_salientPredictedAsSalient = a3;
}

- (void)setHasSalientPredictedAsSalient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSalientPredictedAsSalient
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSalientPredictedAsNeutral:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_salientPredictedAsNeutral = a3;
}

- (void)setHasSalientPredictedAsNeutral:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSalientPredictedAsNeutral
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSalientPredictedAsIgnorable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_salientPredictedAsIgnorable = a3;
}

- (void)setHasSalientPredictedAsIgnorable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSalientPredictedAsIgnorable
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNeutralPredictedAsSalient:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_neutralPredictedAsSalient = a3;
}

- (void)setHasNeutralPredictedAsSalient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNeutralPredictedAsSalient
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNeutralPredictedAsNeutral:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_neutralPredictedAsNeutral = a3;
}

- (void)setHasNeutralPredictedAsNeutral:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNeutralPredictedAsNeutral
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNeutralPredictedAsIgnorable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_neutralPredictedAsIgnorable = a3;
}

- (void)setHasNeutralPredictedAsIgnorable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNeutralPredictedAsIgnorable
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIgnorablePredictedAsSalient:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ignorablePredictedAsSalient = a3;
}

- (void)setHasIgnorablePredictedAsSalient:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasIgnorablePredictedAsSalient
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIgnorablePredictedAsNeutral:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ignorablePredictedAsNeutral = a3;
}

- (void)setHasIgnorablePredictedAsNeutral:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasIgnorablePredictedAsNeutral
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIgnorablePredictedAsIgnorable:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_ignorablePredictedAsIgnorable = a3;
}

- (void)setHasIgnorablePredictedAsIgnorable:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasIgnorablePredictedAsIgnorable
{
  return *(_WORD *)&self->_has & 1;
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
  v8.super_class = (Class)SGMIMetricsAggregatedAccuracyLog;
  -[SGMIMetricsAggregatedAccuracyLog description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMIMetricsAggregatedAccuracyLog dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_salientPredictedAsSalient);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("salientPredictedAsSalient"));

    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_salientPredictedAsNeutral);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("salientPredictedAsNeutral"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_salientPredictedAsIgnorable);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("salientPredictedAsIgnorable"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_neutralPredictedAsSalient);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("neutralPredictedAsSalient"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_neutralPredictedAsNeutral);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("neutralPredictedAsNeutral"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_neutralPredictedAsIgnorable);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("neutralPredictedAsIgnorable"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ignorablePredictedAsNeutral);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("ignorablePredictedAsNeutral"));

    if ((*(_WORD *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ignorablePredictedAsSalient);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ignorablePredictedAsSalient"));

  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 1) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ignorablePredictedAsIgnorable);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ignorablePredictedAsIgnorable"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsAggregatedAccuracyLogReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 1) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field();
LABEL_11:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[10] = self->_salientPredictedAsSalient;
    *((_WORD *)v4 + 22) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = self->_salientPredictedAsNeutral;
  *((_WORD *)v4 + 22) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v4[8] = self->_salientPredictedAsIgnorable;
  *((_WORD *)v4 + 22) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v4[7] = self->_neutralPredictedAsSalient;
  *((_WORD *)v4 + 22) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v4[6] = self->_neutralPredictedAsNeutral;
  *((_WORD *)v4 + 22) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v4[5] = self->_neutralPredictedAsIgnorable;
  *((_WORD *)v4 + 22) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
LABEL_19:
    v4[3] = self->_ignorablePredictedAsNeutral;
    *((_WORD *)v4 + 22) |= 2u;
    if ((*(_WORD *)&self->_has & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  v4[4] = self->_ignorablePredictedAsSalient;
  *((_WORD *)v4 + 22) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_9:
  if ((has & 1) != 0)
  {
LABEL_10:
    v4[2] = self->_ignorablePredictedAsIgnorable;
    *((_WORD *)v4 + 22) |= 1u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 10) = self->_salientPredictedAsSalient;
    *((_WORD *)result + 22) |= 0x100u;
    has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 9) = self->_salientPredictedAsNeutral;
  *((_WORD *)result + 22) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 8) = self->_salientPredictedAsIgnorable;
  *((_WORD *)result + 22) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 7) = self->_neutralPredictedAsSalient;
  *((_WORD *)result + 22) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 6) = self->_neutralPredictedAsNeutral;
  *((_WORD *)result + 22) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 5) = self->_neutralPredictedAsIgnorable;
  *((_WORD *)result + 22) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 4) = self->_ignorablePredictedAsSalient;
  *((_WORD *)result + 22) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      return result;
    goto LABEL_10;
  }
LABEL_19:
  *((_DWORD *)result + 3) = self->_ignorablePredictedAsNeutral;
  *((_WORD *)result + 22) |= 2u;
  if ((*(_WORD *)&self->_has & 1) == 0)
    return result;
LABEL_10:
  *((_DWORD *)result + 2) = self->_ignorablePredictedAsIgnorable;
  *((_WORD *)result + 22) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 22);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 22) & 0x100) == 0 || self->_salientPredictedAsSalient != *((_DWORD *)v4 + 10))
      goto LABEL_47;
  }
  else if ((*((_WORD *)v4 + 22) & 0x100) != 0)
  {
LABEL_47:
    v7 = 0;
    goto LABEL_48;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_salientPredictedAsNeutral != *((_DWORD *)v4 + 9))
      goto LABEL_47;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_salientPredictedAsIgnorable != *((_DWORD *)v4 + 8))
      goto LABEL_47;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_neutralPredictedAsSalient != *((_DWORD *)v4 + 7))
      goto LABEL_47;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_neutralPredictedAsNeutral != *((_DWORD *)v4 + 6))
      goto LABEL_47;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_neutralPredictedAsIgnorable != *((_DWORD *)v4 + 5))
      goto LABEL_47;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ignorablePredictedAsSalient != *((_DWORD *)v4 + 4))
      goto LABEL_47;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_ignorablePredictedAsNeutral != *((_DWORD *)v4 + 3))
      goto LABEL_47;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_ignorablePredictedAsIgnorable != *((_DWORD *)v4 + 2))
      goto LABEL_47;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 1) == 0;
  }
LABEL_48:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v3 = 2654435761 * self->_salientPredictedAsSalient;
    if ((has & 0x80) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_salientPredictedAsNeutral;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_salientPredictedAsIgnorable;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_neutralPredictedAsSalient;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_neutralPredictedAsNeutral;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_neutralPredictedAsIgnorable;
    if ((has & 4) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_ignorablePredictedAsSalient;
    if ((has & 2) != 0)
      goto LABEL_9;
LABEL_18:
    v10 = 0;
    if ((has & 1) != 0)
      goto LABEL_10;
LABEL_19:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  v9 = 0;
  if ((has & 2) == 0)
    goto LABEL_18;
LABEL_9:
  v10 = 2654435761 * self->_ignorablePredictedAsNeutral;
  if ((has & 1) == 0)
    goto LABEL_19;
LABEL_10:
  v11 = 2654435761 * self->_ignorablePredictedAsIgnorable;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x100) != 0)
  {
    self->_salientPredictedAsSalient = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
    v5 = *((_WORD *)v4 + 22);
    if ((v5 & 0x80) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  self->_salientPredictedAsNeutral = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_salientPredictedAsIgnorable = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_neutralPredictedAsSalient = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 22);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_neutralPredictedAsNeutral = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 22);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_neutralPredictedAsIgnorable = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 22);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
LABEL_19:
    self->_ignorablePredictedAsNeutral = *((_DWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 2u;
    if ((*((_WORD *)v4 + 22) & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  self->_ignorablePredictedAsSalient = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 22);
  if ((v5 & 2) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v5 & 1) != 0)
  {
LABEL_10:
    self->_ignorablePredictedAsIgnorable = *((_DWORD *)v4 + 2);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_11:

}

- (unsigned)salientPredictedAsSalient
{
  return self->_salientPredictedAsSalient;
}

- (unsigned)salientPredictedAsNeutral
{
  return self->_salientPredictedAsNeutral;
}

- (unsigned)salientPredictedAsIgnorable
{
  return self->_salientPredictedAsIgnorable;
}

- (unsigned)neutralPredictedAsSalient
{
  return self->_neutralPredictedAsSalient;
}

- (unsigned)neutralPredictedAsNeutral
{
  return self->_neutralPredictedAsNeutral;
}

- (unsigned)neutralPredictedAsIgnorable
{
  return self->_neutralPredictedAsIgnorable;
}

- (unsigned)ignorablePredictedAsSalient
{
  return self->_ignorablePredictedAsSalient;
}

- (unsigned)ignorablePredictedAsNeutral
{
  return self->_ignorablePredictedAsNeutral;
}

- (unsigned)ignorablePredictedAsIgnorable
{
  return self->_ignorablePredictedAsIgnorable;
}

@end
