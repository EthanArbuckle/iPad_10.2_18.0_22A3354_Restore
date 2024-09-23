@implementation ATXPBBlendingSessionDeviceContext

- (void)setTimeOfDay:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimeOfDay
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDayOfWeek:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDayOfWeek
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDateInWeekend:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_dateInWeekend = a3;
}

- (void)setHasDateInWeekend:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDateInWeekend
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setLastUnlockMoreThan30MinutesAgo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_lastUnlockMoreThan30MinutesAgo = a3;
}

- (void)setHasLastUnlockMoreThan30MinutesAgo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasLastUnlockMoreThan30MinutesAgo
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setLastUnlockMoreThan1HourAgo:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_lastUnlockMoreThan1HourAgo = a3;
}

- (void)setHasLastUnlockMoreThan1HourAgo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLastUnlockMoreThan1HourAgo
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (int)currentLOIType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_currentLOIType;
  else
    return 0;
}

- (void)setCurrentLOIType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_currentLOIType = a3;
}

- (void)setHasCurrentLOIType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCurrentLOIType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)currentLOITypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E82DC258[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCurrentLOIType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Home")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Work")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Gym")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSecondsBeforeBlendingUpdate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_secondsBeforeBlendingUpdate = a3;
}

- (void)setHasSecondsBeforeBlendingUpdate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSecondsBeforeBlendingUpdate
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
  v8.super_class = (Class)ATXPBBlendingSessionDeviceContext;
  -[ATXPBBlendingSessionDeviceContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBBlendingSessionDeviceContext dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v11;
  uint64_t currentLOIType;
  __CFString *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_timeOfDay);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timeOfDay"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dayOfWeek);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dayOfWeek"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dateInWeekend);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dateInWeekend"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastUnlockMoreThan30MinutesAgo);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("lastUnlockMoreThan30MinutesAgo"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_15:
    currentLOIType = self->_currentLOIType;
    if (currentLOIType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_currentLOIType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E82DC258[currentLOIType];
    }
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("currentLOIType"));

    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
    return v3;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastUnlockMoreThan1HourAgo);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("lastUnlockMoreThan1HourAgo"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsBeforeBlendingUpdate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("secondsBeforeBlendingUpdate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionDeviceContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
LABEL_8:
    PBDataWriterWriteDoubleField();
LABEL_9:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[6] = self->_timeOfDay;
    *((_BYTE *)v4 + 32) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_dayOfWeek;
  *((_BYTE *)v4 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)v4 + 28) = self->_dateInWeekend;
  *((_BYTE *)v4 + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)v4 + 30) = self->_lastUnlockMoreThan30MinutesAgo;
  *((_BYTE *)v4 + 32) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
LABEL_15:
    v4[4] = self->_currentLOIType;
    *((_BYTE *)v4 + 32) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *((_BYTE *)v4 + 29) = self->_lastUnlockMoreThan1HourAgo;
  *((_BYTE *)v4 + 32) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((has & 1) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_secondsBeforeBlendingUpdate;
    *((_BYTE *)v4 + 32) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 6) = self->_timeOfDay;
    *((_BYTE *)result + 32) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_dayOfWeek;
  *((_BYTE *)result + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 28) = self->_dateInWeekend;
  *((_BYTE *)result + 32) |= 0x10u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *((_BYTE *)result + 30) = self->_lastUnlockMoreThan30MinutesAgo;
  *((_BYTE *)result + 32) |= 0x40u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  *((_BYTE *)result + 29) = self->_lastUnlockMoreThan1HourAgo;
  *((_BYTE *)result + 32) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      return result;
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 4) = self->_currentLOIType;
  *((_BYTE *)result + 32) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_8:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_secondsBeforeBlendingUpdate;
  *((_BYTE *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_timeOfDay != *((_DWORD *)v4 + 6))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 5))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
      goto LABEL_45;
    if (self->_dateInWeekend)
    {
      if (!*((_BYTE *)v4 + 28))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 28))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x40) == 0)
      goto LABEL_45;
    if (self->_lastUnlockMoreThan30MinutesAgo)
    {
      if (!*((_BYTE *)v4 + 30))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 30))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 0x40) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
    {
      if (self->_lastUnlockMoreThan1HourAgo)
      {
        if (!*((_BYTE *)v4 + 29))
          goto LABEL_45;
        goto LABEL_36;
      }
      if (!*((_BYTE *)v4 + 29))
        goto LABEL_36;
    }
LABEL_45:
    v5 = 0;
    goto LABEL_46;
  }
  if ((*((_BYTE *)v4 + 32) & 0x20) != 0)
    goto LABEL_45;
LABEL_36:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_currentLOIType != *((_DWORD *)v4 + 4))
      goto LABEL_45;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_45;
  }
  v5 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_secondsBeforeBlendingUpdate != *((double *)v4 + 1))
      goto LABEL_45;
    v5 = 1;
  }
LABEL_46:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double secondsBeforeBlendingUpdate;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761 * self->_timeOfDay;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_dayOfWeek;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_dateInWeekend;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_lastUnlockMoreThan30MinutesAgo;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_lastUnlockMoreThan1HourAgo;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_17:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
LABEL_18:
    v12 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12;
  }
LABEL_16:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_17;
LABEL_7:
  v7 = 2654435761 * self->_currentLOIType;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_18;
LABEL_8:
  secondsBeforeBlendingUpdate = self->_secondsBeforeBlendingUpdate;
  v9 = -secondsBeforeBlendingUpdate;
  if (secondsBeforeBlendingUpdate >= 0.0)
    v9 = self->_secondsBeforeBlendingUpdate;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 8) != 0)
  {
    self->_timeOfDay = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_dayOfWeek = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  self->_dateInWeekend = *((_BYTE *)v4 + 28);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  self->_lastUnlockMoreThan30MinutesAgo = *((_BYTE *)v4 + 30);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0)
      goto LABEL_7;
LABEL_15:
    self->_currentLOIType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 32) & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  self->_lastUnlockMoreThan1HourAgo = *((_BYTE *)v4 + 29);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
    goto LABEL_15;
LABEL_7:
  if ((v5 & 1) != 0)
  {
LABEL_8:
    self->_secondsBeforeBlendingUpdate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_9:

}

- (unsigned)timeOfDay
{
  return self->_timeOfDay;
}

- (unsigned)dayOfWeek
{
  return self->_dayOfWeek;
}

- (BOOL)dateInWeekend
{
  return self->_dateInWeekend;
}

- (BOOL)lastUnlockMoreThan30MinutesAgo
{
  return self->_lastUnlockMoreThan30MinutesAgo;
}

- (BOOL)lastUnlockMoreThan1HourAgo
{
  return self->_lastUnlockMoreThan1HourAgo;
}

- (double)secondsBeforeBlendingUpdate
{
  return self->_secondsBeforeBlendingUpdate;
}

@end
