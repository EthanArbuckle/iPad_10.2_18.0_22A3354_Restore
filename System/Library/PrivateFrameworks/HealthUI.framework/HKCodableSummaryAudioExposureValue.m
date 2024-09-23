@implementation HKCodableSummaryAudioExposureValue

- (BOOL)hasLeqQuantity
{
  return self->_leqQuantity != 0;
}

- (void)setSecondsListened:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_secondsListened = a3;
}

- (void)setHasSecondsListened:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecondsListened
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDaysAggregated:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_daysAggregated = a3;
}

- (void)setHasDaysAggregated:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDaysAggregated
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setLastUpdatedDateData:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_lastUpdatedDateData = a3;
}

- (void)setHasLastUpdatedDateData:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastUpdatedDateData
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
  v8.super_class = (Class)HKCodableSummaryAudioExposureValue;
  -[HKCodableSummaryAudioExposureValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryAudioExposureValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableQuantity *leqQuantity;
  void *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  leqQuantity = self->_leqQuantity;
  if (leqQuantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](leqQuantity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("leqQuantity"));

  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_daysAggregated);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("daysAggregated"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsListened);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("secondsListened"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastUpdatedDateData);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("lastUpdatedDateData"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryAudioExposureValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_leqQuantity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    PBDataWriterWriteInt64Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_7:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_leqQuantity)
  {
    v6 = v4;
    objc_msgSend(v4, "setLeqQuantity:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
LABEL_9:
    *((_QWORD *)v4 + 1) = self->_daysAggregated;
    *((_BYTE *)v4 + 40) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_secondsListened;
  *((_BYTE *)v4 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_lastUpdatedDateData;
    *((_BYTE *)v4 + 40) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableQuantity copyWithZone:](self->_leqQuantity, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 8) = self->_daysAggregated;
    *(_BYTE *)(v5 + 40) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(double *)(v5 + 24) = self->_secondsListened;
  *(_BYTE *)(v5 + 40) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_lastUpdatedDateData;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *leqQuantity;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  leqQuantity = self->_leqQuantity;
  if ((unint64_t)leqQuantity | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](leqQuantity, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_secondsListened != *((double *)v4 + 3))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_18:
    v6 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_daysAggregated != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_18;
  }
  v6 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_lastUpdatedDateData != *((double *)v4 + 2))
      goto LABEL_18;
    v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  char has;
  unint64_t v5;
  double secondsListened;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  double lastUpdatedDateData;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;

  v3 = -[HKCodableQuantity hash](self->_leqQuantity, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    secondsListened = self->_secondsListened;
    v7 = -secondsListened;
    if (secondsListened >= 0.0)
      v7 = self->_secondsListened;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 1) != 0)
  {
    v10 = 2654435761 * self->_daysAggregated;
    if ((has & 2) != 0)
      goto LABEL_11;
LABEL_16:
    v15 = 0;
    return v5 ^ v3 ^ v10 ^ v15;
  }
  v10 = 0;
  if ((has & 2) == 0)
    goto LABEL_16;
LABEL_11:
  lastUpdatedDateData = self->_lastUpdatedDateData;
  v12 = -lastUpdatedDateData;
  if (lastUpdatedDateData >= 0.0)
    v12 = self->_lastUpdatedDateData;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableQuantity *leqQuantity;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  leqQuantity = self->_leqQuantity;
  v6 = *((_QWORD *)v4 + 4);
  if (leqQuantity)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HKCodableQuantity mergeFrom:](leqQuantity, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[HKCodableSummaryAudioExposureValue setLeqQuantity:](self, "setLeqQuantity:");
  }
  v4 = v8;
LABEL_7:
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0)
      goto LABEL_9;
LABEL_13:
    self->_daysAggregated = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 40) & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_secondsListened = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v7 = *((_BYTE *)v4 + 40);
  if ((v7 & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v7 & 2) != 0)
  {
LABEL_10:
    self->_lastUpdatedDateData = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_11:

}

- (HKCodableQuantity)leqQuantity
{
  return self->_leqQuantity;
}

- (void)setLeqQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_leqQuantity, a3);
}

- (double)secondsListened
{
  return self->_secondsListened;
}

- (int64_t)daysAggregated
{
  return self->_daysAggregated;
}

- (double)lastUpdatedDateData
{
  return self->_lastUpdatedDateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leqQuantity, 0);
}

@end
