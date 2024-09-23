@implementation CellularLteCdrxConfig

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCellStatus:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cellStatus = a3;
}

- (void)setHasCellStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setOnDurationMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_onDurationMs = a3;
}

- (void)setHasOnDurationMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasOnDurationMs
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDrxInactivityMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_drxInactivityMs = a3;
}

- (void)setHasDrxInactivityMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDrxInactivityMs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setDrxRetxTimerMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_drxRetxTimerMs = a3;
}

- (void)setHasDrxRetxTimerMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDrxRetxTimerMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLongDrxCycleMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_longDrxCycleMs = a3;
}

- (void)setHasLongDrxCycleMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasLongDrxCycleMs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setShortDrxCycleMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_shortDrxCycleMs = a3;
}

- (void)setHasShortDrxCycleMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasShortDrxCycleMs
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setDrxShortCycleNum:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_drxShortCycleNum = a3;
}

- (void)setHasDrxShortCycleNum:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasDrxShortCycleNum
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteCdrxConfig;
  v3 = -[CellularLteCdrxConfig description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteCdrxConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

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
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellStatus));
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cell_status"));

  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_onDurationMs));
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("on_duration_ms"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drxInactivityMs));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("drx_inactivity_ms"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drxRetxTimerMs));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("drx_retx_timer_ms"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_shortDrxCycleMs));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("short_drx_cycle_ms"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_9;
  }
LABEL_16:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_longDrxCycleMs));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("long_drx_cycle_ms"));

  has = (char)self->_has;
  if (has < 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_drxShortCycleNum));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("drx_short_cycle_num"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009B700((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v5, self->_timestamp, 1);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_cellStatus, 2);
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field(v5, self->_onDurationMs, 3);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field(v5, self->_drxInactivityMs, 4);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field(v5, self->_drxRetxTimerMs, 5);
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteUint32Field(v5, self->_shortDrxCycleMs, 10);
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteUint32Field(v5, self->_longDrxCycleMs, 7);
  has = (char)self->_has;
  if (has < 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x10) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field(v5, self->_drxShortCycleNum, 11);
LABEL_10:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_cellStatus;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v4 + 9) = self->_onDurationMs;
  *((_BYTE *)v4 + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 5) = self->_drxInactivityMs;
  *((_BYTE *)v4 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 6) = self->_drxRetxTimerMs;
  *((_BYTE *)v4 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    *((_DWORD *)v4 + 10) = self->_shortDrxCycleMs;
    *((_BYTE *)v4 + 44) |= 0x80u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *((_DWORD *)v4 + 8) = self->_longDrxCycleMs;
  *((_BYTE *)v4 + 44) |= 0x20u;
  has = (char)self->_has;
  if (has < 0)
    goto LABEL_17;
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 7) = self->_drxShortCycleNum;
    *((_BYTE *)v4 + 44) |= 0x10u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 44) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_cellStatus;
  *((_BYTE *)result + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 9) = self->_onDurationMs;
  *((_BYTE *)result + 44) |= 0x40u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 5) = self->_drxInactivityMs;
  *((_BYTE *)result + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 6) = self->_drxRetxTimerMs;
  *((_BYTE *)result + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 8) = self->_longDrxCycleMs;
  *((_BYTE *)result + 44) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_shortDrxCycleMs;
  *((_BYTE *)result + 44) |= 0x80u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_9:
  *((_DWORD *)result + 7) = self->_drxShortCycleNum;
  *((_BYTE *)result + 44) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_40;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_cellStatus != *((_DWORD *)v4 + 4))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x40) == 0 || self->_onDurationMs != *((_DWORD *)v4 + 9))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x40) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_drxInactivityMs != *((_DWORD *)v4 + 5))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_drxRetxTimerMs != *((_DWORD *)v4 + 6))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x20) == 0 || self->_longDrxCycleMs != *((_DWORD *)v4 + 8))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x80) == 0 || self->_shortDrxCycleMs != *((_DWORD *)v4 + 10))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 44) & 0x80) != 0)
  {
LABEL_40:
    v6 = 0;
    goto LABEL_41;
  }
  v6 = (*((_BYTE *)v4 + 44) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0 || self->_drxShortCycleNum != *((_DWORD *)v4 + 7))
      goto LABEL_40;
    v6 = 1;
  }
LABEL_41:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_cellStatus;
      if ((*(_BYTE *)&self->_has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_onDurationMs;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_drxInactivityMs;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_drxRetxTimerMs;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_longDrxCycleMs;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_8;
LABEL_16:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_9;
LABEL_17:
    v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x80) == 0)
    goto LABEL_16;
LABEL_8:
  v8 = 2654435761 * self->_shortDrxCycleMs;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_9:
  v9 = 2654435761 * self->_drxShortCycleNum;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_cellStatus = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_onDurationMs = *((_DWORD *)v4 + 9);
  *(_BYTE *)&self->_has |= 0x40u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_drxInactivityMs = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_drxRetxTimerMs = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0)
      goto LABEL_8;
LABEL_17:
    self->_shortDrxCycleMs = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x80u;
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_longDrxCycleMs = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 0x20u;
  v5 = *((_BYTE *)v4 + 44);
  if (v5 < 0)
    goto LABEL_17;
LABEL_8:
  if ((v5 & 0x10) != 0)
  {
LABEL_9:
    self->_drxShortCycleNum = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_10:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)cellStatus
{
  return self->_cellStatus;
}

- (unsigned)onDurationMs
{
  return self->_onDurationMs;
}

- (unsigned)drxInactivityMs
{
  return self->_drxInactivityMs;
}

- (unsigned)drxRetxTimerMs
{
  return self->_drxRetxTimerMs;
}

- (unsigned)longDrxCycleMs
{
  return self->_longDrxCycleMs;
}

- (unsigned)shortDrxCycleMs
{
  return self->_shortDrxCycleMs;
}

- (unsigned)drxShortCycleNum
{
  return self->_drxShortCycleNum;
}

@end
