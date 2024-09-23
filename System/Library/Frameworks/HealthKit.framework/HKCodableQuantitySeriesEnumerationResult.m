@implementation HKCodableQuantitySeriesEnumerationResult

- (void)setPersistentID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_persistentID = a3;
}

- (void)setHasPersistentID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPersistentID
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDataTypeCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_dataTypeCode = a3;
}

- (void)setHasDataTypeCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDataTypeCode
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setValue:(double)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasValue
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStartTime
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setEndTime:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndTime
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSourceID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_sourceID = a3;
}

- (void)setHasSourceID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSourceID
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setSeriesIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_seriesIndex = a3;
}

- (void)setHasSeriesIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSeriesIndex
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasQuantitySample
{
  return self->_quantitySample != 0;
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
  v8.super_class = (Class)HKCodableQuantitySeriesEnumerationResult;
  -[HKCodableQuantitySeriesEnumerationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableQuantitySeriesEnumerationResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *uuid;
  $EC25E7DE26FA9107235552E23206271C v8;
  void *v9;
  void *v10;
  NSData *quantitySample;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("persistentID"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dataTypeCode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("dataTypeCode"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v8 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_value);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("value"));

  *(_BYTE *)&v8 = self->_has;
  if ((*(_BYTE *)&v8 & 1) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("count"));

    *(_BYTE *)&v8 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v8 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startTime);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("startTime"));

    *(_BYTE *)&v8 = self->_has;
    if ((*(_BYTE *)&v8 & 4) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v8 & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&v8 & 4) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endTime);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("endTime"));

  *(_BYTE *)&v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x20) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v8 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sourceID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sourceID"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_seriesIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("seriesIndex"));

  }
LABEL_15:
  quantitySample = self->_quantitySample;
  if (quantitySample)
    objc_msgSend(v3, "setObject:forKey:", quantitySample, CFSTR("quantitySample"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQuantitySeriesEnumerationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  $EC25E7DE26FA9107235552E23206271C v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt64Field();
    v4 = v7;
    *(_BYTE *)&v6 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v7;
    *(_BYTE *)&v6 = self->_has;
    if ((*(_BYTE *)&v6 & 4) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v6 & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteDoubleField();
  v4 = v7;
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  PBDataWriterWriteInt64Field();
  v4 = v7;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt64Field();
    v4 = v7;
  }
LABEL_15:
  if (self->_quantitySample)
  {
    PBDataWriterWriteDataField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  $EC25E7DE26FA9107235552E23206271C v6;
  _QWORD *v7;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_persistentID;
    *((_BYTE *)v4 + 88) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_dataTypeCode;
    *((_BYTE *)v4 + 88) |= 2u;
  }
  v7 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    v4 = v7;
  }
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v6 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  v4[8] = *(_QWORD *)&self->_value;
  *((_BYTE *)v4 + 88) |= 0x80u;
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
LABEL_9:
    v4[1] = self->_count;
    *((_BYTE *)v4 + 88) |= 1u;
    *(_BYTE *)&v6 = self->_has;
  }
LABEL_10:
  if ((*(_BYTE *)&v6 & 0x40) != 0)
  {
    v4[7] = *(_QWORD *)&self->_startTime;
    *((_BYTE *)v4 + 88) |= 0x40u;
    *(_BYTE *)&v6 = self->_has;
    if ((*(_BYTE *)&v6 & 4) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v6 & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  v4[3] = *(_QWORD *)&self->_endTime;
  *((_BYTE *)v4 + 88) |= 4u;
  *(_BYTE *)&v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x20) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v6 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  v4[6] = self->_sourceID;
  *((_BYTE *)v4 + 88) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v4[5] = self->_seriesIndex;
    *((_BYTE *)v4 + 88) |= 0x10u;
  }
LABEL_15:
  if (self->_quantitySample)
  {
    objc_msgSend(v7, "setQuantitySample:");
    v4 = v7;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  $EC25E7DE26FA9107235552E23206271C v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_persistentID;
    *(_BYTE *)(v5 + 88) |= 8u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_dataTypeCode;
    *(_BYTE *)(v5 + 88) |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v8;

  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000000) == 0)
  {
    if ((*(_BYTE *)&v10 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *(double *)(v6 + 64) = self->_value;
  *(_BYTE *)(v6 + 88) |= 0x80u;
  *(_BYTE *)&v10 = self->_has;
  if ((*(_BYTE *)&v10 & 1) != 0)
  {
LABEL_7:
    *(_QWORD *)(v6 + 8) = self->_count;
    *(_BYTE *)(v6 + 88) |= 1u;
    *(_BYTE *)&v10 = self->_has;
  }
LABEL_8:
  if ((*(_BYTE *)&v10 & 0x40) != 0)
  {
    *(double *)(v6 + 56) = self->_startTime;
    *(_BYTE *)(v6 + 88) |= 0x40u;
    *(_BYTE *)&v10 = self->_has;
    if ((*(_BYTE *)&v10 & 4) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&v10 & 0x20) == 0)
        goto LABEL_11;
LABEL_16:
      *(_QWORD *)(v6 + 48) = self->_sourceID;
      *(_BYTE *)(v6 + 88) |= 0x20u;
      if ((*(_BYTE *)&self->_has & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&v10 & 4) == 0)
  {
    goto LABEL_10;
  }
  *(double *)(v6 + 24) = self->_endTime;
  *(_BYTE *)(v6 + 88) |= 4u;
  *(_BYTE *)&v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) != 0)
    goto LABEL_16;
LABEL_11:
  if ((*(_BYTE *)&v10 & 0x10) != 0)
  {
LABEL_12:
    *(_QWORD *)(v6 + 40) = self->_seriesIndex;
    *(_BYTE *)(v6 + 88) |= 0x10u;
  }
LABEL_13:
  v11 = -[NSData copyWithZone:](self->_quantitySample, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v11;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *uuid;
  NSData *quantitySample;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0 || self->_persistentID != *((_QWORD *)v4 + 4))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_dataTypeCode != *((_QWORD *)v4 + 2))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_47;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_47;
    has = (char)self->_has;
  }
  if ((has & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x80) == 0)
      goto LABEL_17;
LABEL_47:
    v8 = 0;
    goto LABEL_48;
  }
  if ((*((_BYTE *)v4 + 88) & 0x80) == 0 || self->_value != *((double *)v4 + 8))
    goto LABEL_47;
LABEL_17:
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_count != *((_QWORD *)v4 + 1))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x40) == 0 || self->_startTime != *((double *)v4 + 7))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 88) & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_endTime != *((double *)v4 + 3))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x20) == 0 || self->_sourceID != *((_QWORD *)v4 + 6))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) == 0 || self->_seriesIndex != *((_QWORD *)v4 + 5))
      goto LABEL_47;
  }
  else if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  quantitySample = self->_quantitySample;
  if ((unint64_t)quantitySample | *((_QWORD *)v4 + 9))
    v8 = -[NSData isEqual:](quantitySample, "isEqual:");
  else
    v8 = 1;
LABEL_48:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char has;
  unint64_t v7;
  double value;
  double v9;
  long double v10;
  double v11;
  uint64_t v12;
  double startTime;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  double endTime;
  double v20;
  long double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v3 = 2654435761 * self->_persistentID;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_dataTypeCode;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSData hash](self->_uuid, "hash");
  has = (char)self->_has;
  if (has < 0)
  {
    value = self->_value;
    v9 = -value;
    if (value >= 0.0)
      v9 = self->_value;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 1) != 0)
  {
    v12 = 2654435761 * self->_count;
    if ((has & 0x40) != 0)
      goto LABEL_16;
LABEL_21:
    v17 = 0;
    goto LABEL_22;
  }
  v12 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_21;
LABEL_16:
  startTime = self->_startTime;
  v14 = -startTime;
  if (startTime >= 0.0)
    v14 = self->_startTime;
  v15 = floor(v14 + 0.5);
  v16 = (v14 - v15) * 1.84467441e19;
  v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0)
      v17 += (unint64_t)v16;
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_22:
  if ((has & 4) != 0)
  {
    endTime = self->_endTime;
    v20 = -endTime;
    if (endTime >= 0.0)
      v20 = self->_endTime;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((has & 0x20) != 0)
  {
    v23 = 2654435761 * self->_sourceID;
    if ((has & 0x10) != 0)
      goto LABEL_34;
LABEL_36:
    v24 = 0;
    return v4 ^ v3 ^ v7 ^ v12 ^ v17 ^ v18 ^ v23 ^ v24 ^ v5 ^ -[NSData hash](self->_quantitySample, "hash");
  }
  v23 = 0;
  if ((has & 0x10) == 0)
    goto LABEL_36;
LABEL_34:
  v24 = 2654435761 * self->_seriesIndex;
  return v4 ^ v3 ^ v7 ^ v12 ^ v17 ^ v18 ^ v23 ^ v24 ^ v5 ^ -[NSData hash](self->_quantitySample, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  char v5;
  int v6;
  char *v7;

  v4 = (char *)a3;
  v5 = v4[88];
  if ((v5 & 8) != 0)
  {
    self->_persistentID = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = v4[88];
  }
  if ((v5 & 2) != 0)
  {
    self->_dataTypeCode = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v7 = v4;
  if (*((_QWORD *)v4 + 10))
  {
    -[HKCodableQuantitySeriesEnumerationResult setUuid:](self, "setUuid:");
    v4 = v7;
  }
  v6 = v4[88];
  if ((v6 & 0x80000000) == 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  self->_value = *((double *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x80u;
  LOBYTE(v6) = v4[88];
  if ((v6 & 1) != 0)
  {
LABEL_9:
    self->_count = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    LOBYTE(v6) = v4[88];
  }
LABEL_10:
  if ((v6 & 0x40) != 0)
  {
    self->_startTime = *((double *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x40u;
    LOBYTE(v6) = v4[88];
    if ((v6 & 4) == 0)
    {
LABEL_12:
      if ((v6 & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_12;
  }
  self->_endTime = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  LOBYTE(v6) = v4[88];
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  self->_sourceID = *((_QWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x20u;
  if ((v4[88] & 0x10) != 0)
  {
LABEL_14:
    self->_seriesIndex = *((_QWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_15:
  if (*((_QWORD *)v4 + 9))
  {
    -[HKCodableQuantitySeriesEnumerationResult setQuantitySample:](self, "setQuantitySample:");
    v4 = v7;
  }

}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (int64_t)dataTypeCode
{
  return self->_dataTypeCode;
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (double)value
{
  return self->_value;
}

- (int64_t)count
{
  return self->_count;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (int64_t)seriesIndex
{
  return self->_seriesIndex;
}

- (NSData)quantitySample
{
  return self->_quantitySample;
}

- (void)setQuantitySample:(id)a3
{
  objc_storeStrong((id *)&self->_quantitySample, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_quantitySample, 0);
}

@end
