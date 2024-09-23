@implementation NRPBSwitchRecord

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NRPBSwitchRecord;
  -[NRPBSwitchRecord description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBSwitchRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *deviceIDBytes;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  deviceIDBytes = self->_deviceIDBytes;
  if (deviceIDBytes)
    objc_msgSend(v3, "setObject:forKey:", deviceIDBytes, CFSTR("deviceIDBytes"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateTimeInterval);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("dateTimeInterval"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_switchIndex);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("switchIndex"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBSwitchRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_deviceIDBytes)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_deviceIDBytes, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_dateTimeInterval;
    *(_BYTE *)(v5 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_switchIndex;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *deviceIDBytes;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  deviceIDBytes = self->_deviceIDBytes;
  if ((unint64_t)deviceIDBytes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](deviceIDBytes, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_dateTimeInterval != *((double *)v4 + 1))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_switchIndex != *((_DWORD *)v4 + 6))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  unint64_t v5;
  double dateTimeInterval;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;

  v3 = -[NSData hash](self->_deviceIDBytes, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    dateTimeInterval = self->_dateTimeInterval;
    v7 = -dateTimeInterval;
    if (dateTimeInterval >= 0.0)
      v7 = self->_dateTimeInterval;
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
  if ((has & 2) != 0)
    v10 = 2654435761 * self->_switchIndex;
  else
    v10 = 0;
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  char v5;
  _QWORD *v6;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)v3[2];
    if (v4)
    {
      v6 = v3;
      objc_storeStrong((id *)(a1 + 16), v4);
      v3 = v6;
    }
    v5 = *((_BYTE *)v3 + 28);
    if ((v5 & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = v3[1];
      *(_BYTE *)(a1 + 28) |= 1u;
      v5 = *((_BYTE *)v3 + 28);
    }
    if ((v5 & 2) != 0)
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(_BYTE *)(a1 + 28) |= 2u;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIDBytes, 0);
}

@end
