@implementation SGDCKTimeRange

- (void)setStart:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_start = a3;
}

- (void)setHasStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStart
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setEnd:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_end = a3;
}

- (void)setHasEnd:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnd
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStartUTCOffsetSeconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_startUTCOffsetSeconds = a3;
}

- (void)setHasStartUTCOffsetSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartUTCOffsetSeconds
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEndUTCOffsetSeconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endUTCOffsetSeconds = a3;
}

- (void)setHasEndUTCOffsetSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndUTCOffsetSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFloating:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_floating = a3;
}

- (void)setHasFloating:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFloating
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)SGDCKTimeRange;
  -[SGDCKTimeRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCKTimeRange dictionaryRepresentation](self, "dictionaryRepresentation");
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
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_start);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("start"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_end);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("end"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_endUTCOffsetSeconds);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("endUTCOffsetSeconds"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_startUTCOffsetSeconds);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("startUTCOffsetSeconds"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_floating);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("floating"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGDCKTimeRangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteSint64Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteSint64Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(_QWORD *)&self->_start;
    *((_BYTE *)v4 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(_QWORD *)&self->_end;
  *((_BYTE *)v4 + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    v4[2] = self->_endUTCOffsetSeconds;
    *((_BYTE *)v4 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[4] = self->_startUTCOffsetSeconds;
  *((_BYTE *)v4 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 40) = self->_floating;
    *((_BYTE *)v4 + 44) |= 0x10u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)result + 3) = *(_QWORD *)&self->_start;
    *((_BYTE *)result + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_end;
  *((_BYTE *)result + 44) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)result + 4) = self->_startUTCOffsetSeconds;
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_QWORD *)result + 2) = self->_endUTCOffsetSeconds;
  *((_BYTE *)result + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_6:
  *((_BYTE *)result + 40) = self->_floating;
  *((_BYTE *)result + 44) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_start != *((double *)v4 + 3))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_end != *((double *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_startUTCOffsetSeconds != *((_QWORD *)v4 + 4))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_endUTCOffsetSeconds != *((_QWORD *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_24;
  }
  v5 = (*((_BYTE *)v4 + 44) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
    {
LABEL_24:
      v5 = 0;
      goto LABEL_25;
    }
    if (self->_floating)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_24;
    }
    v5 = 1;
  }
LABEL_25:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double start;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double end;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    start = self->_start;
    v6 = -start;
    if (start >= 0.0)
      v6 = self->_start;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 1) != 0)
  {
    end = self->_end;
    v11 = -end;
    if (end >= 0.0)
      v11 = self->_end;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 8) == 0)
  {
    v14 = 0;
    if ((has & 2) != 0)
      goto LABEL_19;
LABEL_22:
    v15 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_20;
LABEL_23:
    v16 = 0;
    return v9 ^ v4 ^ v14 ^ v15 ^ v16;
  }
  v14 = 2654435761 * self->_startUTCOffsetSeconds;
  if ((has & 2) == 0)
    goto LABEL_22;
LABEL_19:
  v15 = 2654435761 * self->_endUTCOffsetSeconds;
  if ((has & 0x10) == 0)
    goto LABEL_23;
LABEL_20:
  v16 = 2654435761 * self->_floating;
  return v9 ^ v4 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_start = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_end = *((double *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
LABEL_11:
    self->_endUTCOffsetSeconds = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_startUTCOffsetSeconds = *((_QWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 0x10) != 0)
  {
LABEL_6:
    self->_floating = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_7:

}

- (double)start
{
  return self->_start;
}

- (double)end
{
  return self->_end;
}

- (int64_t)startUTCOffsetSeconds
{
  return self->_startUTCOffsetSeconds;
}

- (int64_t)endUTCOffsetSeconds
{
  return self->_endUTCOffsetSeconds;
}

- (BOOL)floating
{
  return self->_floating;
}

@end
