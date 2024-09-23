@implementation CellularRfTunerEvent

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

- (BOOL)hasOldState
{
  return self->_oldState != 0;
}

- (BOOL)hasNewState
{
  return self->_thenewState != 0;
}

- (void)setElapsedMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_elapsedMs = a3;
}

- (void)setHasElapsedMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasElapsedMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTimeoutMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timeoutMs = a3;
}

- (void)setHasTimeoutMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimeoutMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularRfTunerEvent;
  v3 = -[CellularRfTunerEvent description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularRfTunerEvent dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  TunerState *oldState;
  void *v6;
  TunerState *thenewState;
  void *v8;
  char has;
  void *v10;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  oldState = self->_oldState;
  if (oldState)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TunerState dictionaryRepresentation](oldState, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("old_state"));

  }
  thenewState = self->_thenewState;
  if (thenewState)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TunerState dictionaryRepresentation](thenewState, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("new_state"));

  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_timeoutMs));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("timeout_ms"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_elapsedMs));
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("elapsed_ms"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000811D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  TunerState *oldState;
  TunerState *thenewState;
  char has;
  id v7;

  v7 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v7, self->_timestamp, 1);
  oldState = self->_oldState;
  if (oldState)
    PBDataWriterWriteSubmessage(v7, oldState, 3);
  thenewState = self->_thenewState;
  if (thenewState)
    PBDataWriterWriteSubmessage(v7, thenewState, 4);
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    PBDataWriterWriteUint32Field(v7, self->_timeoutMs, 6);
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field(v7, self->_elapsedMs, 5);
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 4) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field(v7, self->_subsId, 15);
LABEL_11:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v6 = v4;
  if (self->_oldState)
  {
    objc_msgSend(v4, "setOldState:");
    v4 = v6;
  }
  if (self->_thenewState)
  {
    objc_msgSend(v6, "setThenewState:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_13:
    *((_DWORD *)v4 + 11) = self->_timeoutMs;
    *((_BYTE *)v4 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_DWORD *)v4 + 4) = self->_elapsedMs;
  *((_BYTE *)v4 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 10) = self->_subsId;
    *((_BYTE *)v4 + 48) |= 4u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v7 = -[TunerState copyWithZone:](self->_oldState, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v9 = -[TunerState copyWithZone:](self->_thenewState, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_5;
LABEL_9:
    *((_DWORD *)v6 + 11) = self->_timeoutMs;
    *((_BYTE *)v6 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v6;
    goto LABEL_6;
  }
  *((_DWORD *)v6 + 4) = self->_elapsedMs;
  *((_BYTE *)v6 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *((_DWORD *)v6 + 10) = self->_subsId;
    *((_BYTE *)v6 + 48) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  TunerState *oldState;
  TunerState *thenewState;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_25:
    v8 = 0;
    goto LABEL_26;
  }
  oldState = self->_oldState;
  if ((unint64_t)oldState | *((_QWORD *)v4 + 4) && !-[TunerState isEqual:](oldState, "isEqual:"))
    goto LABEL_25;
  thenewState = self->_thenewState;
  if ((unint64_t)thenewState | *((_QWORD *)v4 + 3))
  {
    if (!-[TunerState isEqual:](thenewState, "isEqual:"))
      goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_elapsedMs != *((_DWORD *)v4 + 4))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0 || self->_timeoutMs != *((_DWORD *)v4 + 11))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_25;
  }
  v8 = (*((_BYTE *)v4 + 48) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 10))
      goto LABEL_25;
    v8 = 1;
  }
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[TunerState hash](self->_oldState, "hash");
  v5 = -[TunerState hash](self->_thenewState, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_7;
LABEL_10:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  v6 = 2654435761 * self->_elapsedMs;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_6:
  v7 = 2654435761 * self->_timeoutMs;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_7:
  v8 = 2654435761 * self->_subsId;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  TunerState *oldState;
  uint64_t v7;
  TunerState *thenewState;
  uint64_t v9;
  char v10;
  id v11;

  v4 = a3;
  v5 = v4;
  if ((v4[6] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  oldState = self->_oldState;
  v7 = *((_QWORD *)v5 + 4);
  v11 = v5;
  if (oldState)
  {
    if (!v7)
      goto LABEL_9;
    -[TunerState mergeFrom:](oldState, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[CellularRfTunerEvent setOldState:](self, "setOldState:");
  }
  v5 = v11;
LABEL_9:
  thenewState = self->_thenewState;
  v9 = *((_QWORD *)v5 + 3);
  if (thenewState)
  {
    if (!v9)
      goto LABEL_15;
    -[TunerState mergeFrom:](thenewState, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_15;
    -[CellularRfTunerEvent setThenewState:](self, "setThenewState:");
  }
  v5 = v11;
LABEL_15:
  v10 = *((_BYTE *)v5 + 48);
  if ((v10 & 2) == 0)
  {
    if ((*((_BYTE *)v5 + 48) & 8) == 0)
      goto LABEL_17;
LABEL_21:
    self->_timeoutMs = *((_DWORD *)v5 + 11);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v5 + 48) & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  self->_elapsedMs = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v10 = *((_BYTE *)v5 + 48);
  if ((v10 & 8) != 0)
    goto LABEL_21;
LABEL_17:
  if ((v10 & 4) != 0)
  {
LABEL_18:
    self->_subsId = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_19:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (TunerState)oldState
{
  return self->_oldState;
}

- (void)setOldState:(id)a3
{
  objc_storeStrong((id *)&self->_oldState, a3);
}

- (TunerState)thenewState
{
  return self->_thenewState;
}

- (void)setThenewState:(id)a3
{
  objc_storeStrong((id *)&self->_thenewState, a3);
}

- (unsigned)elapsedMs
{
  return self->_elapsedMs;
}

- (unsigned)timeoutMs
{
  return self->_timeoutMs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldState, 0);
  objc_storeStrong((id *)&self->_thenewState, 0);
}

@end
