@implementation HKCodableCondensedWorkout

- (void)setPersistentID:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_persistentID = a3;
}

- (void)setHasPersistentID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPersistentID
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCreationDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCondenserVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_condenserVersion = a3;
}

- (void)setHasCondenserVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCondenserVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCondenserDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_condenserDate = a3;
}

- (void)setHasCondenserDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCondenserDate
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
  v8.super_class = (Class)HKCodableCondensedWorkout;
  -[HKCodableCondensedWorkout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableCondensedWorkout dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *uuid;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_persistentID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("persistentID"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("creationDate"));

    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("startDate"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("endDate"));

  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("type"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_condenserVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("condenserVersion"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("duration"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_11:
  if ((has & 1) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_condenserDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("condenserDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableCondensedWorkoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_uuid)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
LABEL_19:
    PBDataWriterWriteInt64Field();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_11:
  if ((has & 1) != 0)
LABEL_12:
    PBDataWriterWriteDoubleField();
LABEL_13:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v4[6] = self->_persistentID;
    *((_BYTE *)v4 + 80) |= 0x20u;
  }
  if (self->_uuid)
  {
    v6 = v4;
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v4 + 80) |= 4u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  v4[7] = *(_QWORD *)&self->_startDate;
  *((_BYTE *)v4 + 80) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  v4[5] = *(_QWORD *)&self->_endDate;
  *((_BYTE *)v4 + 80) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v4[8] = self->_type;
  *((_BYTE *)v4 + 80) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
LABEL_19:
    v4[2] = self->_condenserVersion;
    *((_BYTE *)v4 + 80) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  v4[4] = *(_QWORD *)&self->_duration;
  *((_BYTE *)v4 + 80) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_19;
LABEL_11:
  if ((has & 1) != 0)
  {
LABEL_12:
    v4[1] = *(_QWORD *)&self->_condenserDate;
    *((_BYTE *)v4 + 80) |= 1u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 48) = self->_persistentID;
    *(_BYTE *)(v5 + 80) |= 0x20u;
  }
  v7 = -[NSData copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v7;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v6 + 24) = self->_creationDate;
    *(_BYTE *)(v6 + 80) |= 4u;
    has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v6 + 56) = self->_startDate;
  *(_BYTE *)(v6 + 80) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *(double *)(v6 + 40) = self->_endDate;
  *(_BYTE *)(v6 + 80) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  *(_QWORD *)(v6 + 64) = self->_type;
  *(_BYTE *)(v6 + 80) |= 0x80u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
LABEL_17:
    *(_QWORD *)(v6 + 16) = self->_condenserVersion;
    *(_BYTE *)(v6 + 80) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v6;
    goto LABEL_10;
  }
LABEL_16:
  *(double *)(v6 + 32) = self->_duration;
  *(_BYTE *)(v6 + 80) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_17;
LABEL_9:
  if ((has & 1) != 0)
  {
LABEL_10:
    *(double *)(v6 + 8) = self->_condenserDate;
    *(_BYTE *)(v6 + 80) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *uuid;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x20) == 0 || self->_persistentID != *((_QWORD *)v4 + 6))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 9))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:"))
      goto LABEL_44;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_creationDate != *((double *)v4 + 3))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x40) == 0 || self->_startDate != *((double *)v4 + 7))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) == 0 || self->_endDate != *((double *)v4 + 5))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x80) == 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x80) == 0)
      goto LABEL_27;
LABEL_44:
    v7 = 0;
    goto LABEL_45;
  }
  if ((*((_BYTE *)v4 + 80) & 0x80) == 0 || self->_type != *((_QWORD *)v4 + 8))
    goto LABEL_44;
LABEL_27:
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_duration != *((double *)v4 + 4))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_condenserVersion != *((_QWORD *)v4 + 2))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_44;
  }
  v7 = (*((_BYTE *)v4 + 80) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_condenserDate != *((double *)v4 + 1))
      goto LABEL_44;
    v7 = 1;
  }
LABEL_45:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  unint64_t v5;
  double creationDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  double startDate;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double endDate;
  double v17;
  long double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  double duration;
  double v23;
  long double v24;
  double v25;
  uint64_t v26;
  double condenserDate;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  uint64_t v33;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v33 = 2654435761 * self->_persistentID;
  else
    v33 = 0;
  v3 = -[NSData hash](self->_uuid, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    creationDate = self->_creationDate;
    v7 = -creationDate;
    if (creationDate >= 0.0)
      v7 = self->_creationDate;
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
  if ((has & 0x40) != 0)
  {
    startDate = self->_startDate;
    v12 = -startDate;
    if (startDate >= 0.0)
      v12 = self->_startDate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 0x10) != 0)
  {
    endDate = self->_endDate;
    v17 = -endDate;
    if (endDate >= 0.0)
      v17 = self->_endDate;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if (has < 0)
  {
    v20 = 2654435761 * self->_type;
    if ((has & 8) == 0)
      goto LABEL_30;
  }
  else
  {
    v20 = 0;
    if ((has & 8) == 0)
    {
LABEL_30:
      v21 = 0;
      goto LABEL_38;
    }
  }
  duration = self->_duration;
  v23 = -duration;
  if (duration >= 0.0)
    v23 = self->_duration;
  v24 = floor(v23 + 0.5);
  v25 = (v23 - v24) * 1.84467441e19;
  v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0)
      v21 += (unint64_t)v25;
  }
  else
  {
    v21 -= (unint64_t)fabs(v25);
  }
LABEL_38:
  if ((has & 2) != 0)
  {
    v26 = 2654435761 * self->_condenserVersion;
    if ((has & 1) != 0)
      goto LABEL_40;
LABEL_45:
    v31 = 0;
    return v3 ^ v33 ^ v5 ^ v10 ^ v15 ^ v20 ^ v21 ^ v26 ^ v31;
  }
  v26 = 0;
  if ((has & 1) == 0)
    goto LABEL_45;
LABEL_40:
  condenserDate = self->_condenserDate;
  v28 = -condenserDate;
  if (condenserDate >= 0.0)
    v28 = self->_condenserDate;
  v29 = floor(v28 + 0.5);
  v30 = (v28 - v29) * 1.84467441e19;
  v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0)
      v31 += (unint64_t)v30;
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
  return v3 ^ v33 ^ v5 ^ v10 ^ v15 ^ v20 ^ v21 ^ v26 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 80) & 0x20) != 0)
  {
    self->_persistentID = *((_QWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    v6 = v4;
    -[HKCodableCondensedWorkout setUuid:](self, "setUuid:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 4) != 0)
  {
    self->_creationDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 80);
    if ((v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_startDate = *((double *)v4 + 7);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  self->_endDate = *((double *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  self->_type = *((_QWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x80u;
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0)
      goto LABEL_11;
LABEL_19:
    self->_condenserVersion = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 80) & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_18:
  self->_duration = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 2) != 0)
    goto LABEL_19;
LABEL_11:
  if ((v5 & 1) != 0)
  {
LABEL_12:
    self->_condenserDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_13:

}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (int64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)condenserVersion
{
  return self->_condenserVersion;
}

- (double)condenserDate
{
  return self->_condenserDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
