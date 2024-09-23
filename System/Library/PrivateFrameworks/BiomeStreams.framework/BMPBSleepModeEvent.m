@implementation BMPBSleepModeEvent

- (int)sleepModeState
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_sleepModeState;
  else
    return 0;
}

- (void)setSleepModeState:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sleepModeState = a3;
}

- (void)setHasSleepModeState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSleepModeState
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)sleepModeStateAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E2648768 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSleepModeState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Off")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WindDown")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Bedtime")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)sleepModeChangeReason
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_sleepModeChangeReason;
  else
    return 0;
}

- (void)setSleepModeChangeReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sleepModeChangeReason = a3;
}

- (void)setHasSleepModeChangeReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSleepModeChangeReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)sleepModeChangeReasonAsString:(int)a3
{
  if (a3 < 0xA)
    return *(&off_1E2648780 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSleepModeChangeReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserRequested")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Expected")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSynced")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncedUserRequested")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NanoSynced")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TurnedOffDND")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Other")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Automation")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CloudSyncedAutomation")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setExpectedEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_expectedEndDate = a3;
}

- (void)setHasExpectedEndDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpectedEndDate
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
  v8.super_class = (Class)BMPBSleepModeEvent;
  -[BMPBSleepModeEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSleepModeEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t sleepModeState;
  void *v8;
  uint64_t sleepModeChangeReason;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_10:
    sleepModeChangeReason = self->_sleepModeChangeReason;
    if (sleepModeChangeReason >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sleepModeChangeReason);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = *(&off_1E2648780 + sleepModeChangeReason);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sleepModeChangeReason"));

    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
    return v3;
  }
  sleepModeState = self->_sleepModeState;
  if (sleepModeState >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_sleepModeState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *(&off_1E2648768 + sleepModeState);
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sleepModeState"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_10;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expectedEndDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("expectedEndDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSleepModeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v4[4] = self->_sleepModeChangeReason;
    *((_BYTE *)v4 + 24) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[5] = self->_sleepModeState;
  *((_BYTE *)v4 + 24) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_expectedEndDate;
    *((_BYTE *)v4 + 24) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = self->_sleepModeState;
    *((_BYTE *)result + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_sleepModeChangeReason;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_expectedEndDate;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0 || self->_sleepModeState != *((_DWORD *)v4 + 5))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_sleepModeChangeReason != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_expectedEndDate != *((double *)v4 + 1))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  double expectedEndDate;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_9:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v8 = 0;
    return v3 ^ v2 ^ v8;
  }
  v2 = 2654435761 * self->_sleepModeState;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_3:
  v3 = 2654435761 * self->_sleepModeChangeReason;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  expectedEndDate = self->_expectedEndDate;
  v5 = -expectedEndDate;
  if (expectedEndDate >= 0.0)
    v5 = self->_expectedEndDate;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return v3 ^ v2 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_sleepModeChangeReason = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 24) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_sleepModeState = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 1) != 0)
  {
LABEL_4:
    self->_expectedEndDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:

}

- (double)expectedEndDate
{
  return self->_expectedEndDate;
}

@end
