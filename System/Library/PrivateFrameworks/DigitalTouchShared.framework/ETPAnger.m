@implementation ETPAnger

- (void)setDuration:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNormalizedCenterX:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_normalizedCenterX = a3;
}

- (void)setHasNormalizedCenterX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNormalizedCenterX
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNormalizedCenterY:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_normalizedCenterY = a3;
}

- (void)setHasNormalizedCenterY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNormalizedCenterY
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasDelays
{
  return self->_delays != 0;
}

- (BOOL)hasPoints
{
  return self->_points != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ETPAnger;
  -[ETPAnger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPAnger dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  NSData *delays;
  NSData *points;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_duration;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("duration"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_normalizedCenterX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("normalizedCenterX"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(float *)&v4 = self->_normalizedCenterY;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("normalizedCenterY"));

  }
LABEL_5:
  delays = self->_delays;
  if (delays)
    objc_msgSend(v3, "setObject:forKey:", delays, CFSTR("delays"));
  points = self->_points;
  if (points)
    objc_msgSend(v3, "setObject:forKey:", points, CFSTR("points"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ETPAngerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_5:
  if (self->_delays)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_points)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(float *)(v5 + 20) = self->_normalizedCenterX;
    *(_BYTE *)(v5 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(float *)(v5 + 16) = self->_duration;
  *(_BYTE *)(v5 + 40) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(float *)(v5 + 24) = self->_normalizedCenterY;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
LABEL_5:
  v8 = -[NSData copyWithZone:](self->_delays, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  v10 = -[NSData copyWithZone:](self->_points, "copyWithZone:", a3);
  v11 = (void *)v6[4];
  v6[4] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *delays;
  NSData *points;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_duration != *((float *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_normalizedCenterX != *((float *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_normalizedCenterY != *((float *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  delays = self->_delays;
  if ((unint64_t)delays | *((_QWORD *)v4 + 1) && !-[NSData isEqual:](delays, "isEqual:"))
    goto LABEL_21;
  points = self->_points;
  if ((unint64_t)points | *((_QWORD *)v4 + 4))
    v7 = -[NSData isEqual:](points, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float duration;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float normalizedCenterX;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  float normalizedCenterY;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    duration = self->_duration;
    v6 = duration;
    if (duration < 0.0)
      v6 = -duration;
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
  if ((has & 2) != 0)
  {
    normalizedCenterX = self->_normalizedCenterX;
    v11 = normalizedCenterX;
    if (normalizedCenterX < 0.0)
      v11 = -normalizedCenterX;
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
  if ((has & 4) != 0)
  {
    normalizedCenterY = self->_normalizedCenterY;
    v16 = normalizedCenterY;
    if (normalizedCenterY < 0.0)
      v16 = -normalizedCenterY;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  v19 = v9 ^ v4 ^ v14 ^ -[NSData hash](self->_delays, "hash");
  return v19 ^ -[NSData hash](self->_points, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_duration = *((float *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_normalizedCenterX = *((float *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_4:
    self->_normalizedCenterY = *((float *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[ETPAnger setDelays:](self, "setDelays:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[ETPAnger setPoints:](self, "setPoints:");
    v4 = v6;
  }

}

- (float)duration
{
  return self->_duration;
}

- (float)normalizedCenterX
{
  return self->_normalizedCenterX;
}

- (float)normalizedCenterY
{
  return self->_normalizedCenterY;
}

- (NSData)delays
{
  return self->_delays;
}

- (void)setDelays:(id)a3
{
  objc_storeStrong((id *)&self->_delays, a3);
}

- (NSData)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
  objc_storeStrong((id *)&self->_points, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_delays, 0);
}

@end
