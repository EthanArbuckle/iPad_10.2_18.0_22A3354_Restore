@implementation ETPHeartbeat

- (void)setBeatsPerMinute:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_beatsPerMinute = a3;
}

- (void)setHasBeatsPerMinute:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBeatsPerMinute
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
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

- (void)setNormalizedCenterX:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_normalizedCenterX = a3;
}

- (void)setHasNormalizedCenterX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNormalizedCenterX
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setNormalizedCenterY:(float)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_normalizedCenterY = a3;
}

- (void)setHasNormalizedCenterY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNormalizedCenterY
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setRotation:(float)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rotation = a3;
}

- (void)setHasRotation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRotation
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHeartbreakTime:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_heartbreakTime = a3;
}

- (void)setHasHeartbreakTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHeartbreakTime
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ETPHeartbeat;
  -[ETPHeartbeat description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPHeartbeat dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(float *)&v4 = self->_beatsPerMinute;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("beatsPerMinute"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_duration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("duration"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *(float *)&v4 = self->_normalizedCenterX;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("normalizedCenterX"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    *(float *)&v4 = self->_rotation;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("rotation"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  *(float *)&v4 = self->_normalizedCenterY;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("normalizedCenterY"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(float *)&v4 = self->_heartbreakTime;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("heartbreakTime"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ETPHeartbeatReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteFloatField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
LABEL_7:
    PBDataWriterWriteFloatField();
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_beatsPerMinute);
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_duration;
  *((_BYTE *)result + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 5) = LODWORD(self->_normalizedCenterX);
  *((_BYTE *)result + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 6) = LODWORD(self->_normalizedCenterY);
  *((_BYTE *)result + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 7) = LODWORD(self->_rotation);
  *((_BYTE *)result + 32) |= 0x20u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_7:
  *((_DWORD *)result + 4) = LODWORD(self->_heartbreakTime);
  *((_BYTE *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_beatsPerMinute != *((float *)v4 + 2))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_31:
    v5 = 0;
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 3))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_normalizedCenterX != *((float *)v4 + 5))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0 || self->_normalizedCenterY != *((float *)v4 + 6))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) == 0 || self->_rotation != *((float *)v4 + 7))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  v5 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_heartbreakTime != *((float *)v4 + 4))
      goto LABEL_31;
    v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float beatsPerMinute;
  double v6;
  long double v7;
  double v8;
  uint64_t v9;
  float normalizedCenterX;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  float normalizedCenterY;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  float rotation;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  float heartbreakTime;
  double v27;
  long double v28;
  double v29;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    beatsPerMinute = self->_beatsPerMinute;
    v6 = beatsPerMinute;
    if (beatsPerMinute < 0.0)
      v6 = -beatsPerMinute;
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
    v9 = 2654435761 * self->_duration;
    if ((has & 8) != 0)
      goto LABEL_11;
LABEL_16:
    v14 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  if ((has & 8) == 0)
    goto LABEL_16;
LABEL_11:
  normalizedCenterX = self->_normalizedCenterX;
  v11 = normalizedCenterX;
  if (normalizedCenterX < 0.0)
    v11 = -normalizedCenterX;
  v12 = floor(v11 + 0.5);
  v13 = (v11 - v12) * 1.84467441e19;
  v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((has & 0x10) != 0)
  {
    normalizedCenterY = self->_normalizedCenterY;
    v17 = normalizedCenterY;
    if (normalizedCenterY < 0.0)
      v17 = -normalizedCenterY;
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
  if ((has & 0x20) != 0)
  {
    rotation = self->_rotation;
    v22 = rotation;
    if (rotation < 0.0)
      v22 = -rotation;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  if ((has & 4) != 0)
  {
    heartbreakTime = self->_heartbreakTime;
    v27 = heartbreakTime;
    if (heartbreakTime < 0.0)
      v27 = -heartbreakTime;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v15 ^ v20 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_beatsPerMinute = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_normalizedCenterX = *((float *)v4 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
LABEL_13:
    self->_rotation = *((float *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x20u;
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_normalizedCenterY = *((float *)v4 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x20) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v5 & 4) != 0)
  {
LABEL_7:
    self->_heartbreakTime = *((float *)v4 + 4);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_8:

}

- (float)beatsPerMinute
{
  return self->_beatsPerMinute;
}

- (unsigned)duration
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

- (float)rotation
{
  return self->_rotation;
}

- (float)heartbreakTime
{
  return self->_heartbreakTime;
}

@end
