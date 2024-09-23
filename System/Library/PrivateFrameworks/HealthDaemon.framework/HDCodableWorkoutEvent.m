@implementation HDCodableWorkoutEvent

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSwimmingStrokeStyle:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_swimmingStrokeStyle = a3;
}

- (void)setHasSwimmingStrokeStyle:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSwimmingStrokeStyle
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
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
  v8.super_class = (Class)HDCodableWorkoutEvent;
  -[HDCodableWorkoutEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HDCodableMetadataDictionary *metadataDictionary;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_type);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("date"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_swimmingStrokeStyle);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("swimmingStrokeStyle"));

  }
LABEL_5:
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    -[HDCodableMetadataDictionary dictionaryRepresentation](metadataDictionary, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("metadataDictionary"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_duration);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("duration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_4:
    PBDataWriterWriteInt64Field();
LABEL_5:
  if (self->_metadataDictionary)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_type;
    *((_BYTE *)v4 + 48) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(_QWORD *)&self->_date;
  *((_BYTE *)v4 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_swimmingStrokeStyle;
    *((_BYTE *)v4 + 48) |= 4u;
  }
LABEL_5:
  if (self->_metadataDictionary)
  {
    v6 = v4;
    objc_msgSend(v4, "setMetadataDictionary:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_duration;
    *((_BYTE *)v4 + 48) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 48) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_date;
  *(_BYTE *)(v5 + 48) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 24) = self->_swimmingStrokeStyle;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
LABEL_5:
  v8 = -[HDCodableMetadataDictionary copyWithZone:](self->_metadataDictionary, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_duration;
    *(_BYTE *)(v6 + 48) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  HDCodableMetadataDictionary *metadataDictionary;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 48);
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_type != *((_QWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_swimmingStrokeStyle != *((_QWORD *)v4 + 3))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((_QWORD *)v4 + 5))
  {
    if (!-[HDCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:"))
    {
LABEL_24:
      v8 = 0;
      goto LABEL_25;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 48);
  }
  v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_duration != *((double *)v4 + 2))
      goto LABEL_24;
    v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double date;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double duration;
  double v14;
  long double v15;
  double v16;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  date = self->_date;
  v6 = -date;
  if (date >= 0.0)
    v6 = self->_date;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
    v10 = 2654435761 * self->_swimmingStrokeStyle;
  else
    v10 = 0;
  v11 = -[HDCodableMetadataDictionary hash](self->_metadataDictionary, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    duration = self->_duration;
    v14 = -duration;
    if (duration >= 0.0)
      v14 = self->_duration;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v12 += (unint64_t)v16;
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v12 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  HDCodableMetadataDictionary *metadataDictionary;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 48);
  if ((v6 & 8) != 0)
  {
    self->_type = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 48);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_date = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
LABEL_4:
    self->_swimmingStrokeStyle = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  metadataDictionary = self->_metadataDictionary;
  v8 = *((_QWORD *)v5 + 5);
  if (metadataDictionary)
  {
    if (!v8)
      goto LABEL_14;
    v9 = v5;
    -[HDCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_14;
    v9 = v5;
    -[HDCodableWorkoutEvent setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  v5 = v9;
LABEL_14:
  if ((*((_BYTE *)v5 + 48) & 2) != 0)
  {
    self->_duration = *((double *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (int64_t)type
{
  return self->_type;
}

- (double)date
{
  return self->_date;
}

- (int64_t)swimmingStrokeStyle
{
  return self->_swimmingStrokeStyle;
}

- (HDCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDictionary, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

- (id)decodedDateIntervalStartDate
{
  void *v2;

  if (-[HDCodableWorkoutEvent hasDate](self, "hasDate"))
  {
    HDDecodeDateForValue();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
