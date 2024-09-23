@implementation SYMessageHeader

- (void)setTimeout:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timeout = a3;
}

- (void)setHasTimeout:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeout
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYMessageHeader;
  -[SYMessageHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYMessageHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  SYPeer *sender;
  void *v6;
  SYVectorClock *state;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  sender = self->_sender;
  if (sender)
  {
    -[SYPeer dictionaryRepresentation](sender, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sender"));

  }
  state = self->_state;
  if (state)
  {
    -[SYVectorClock dictionaryRepresentation](state, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("state"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("version"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sequenceNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sequenceNumber"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_timeout);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("timeout"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYMessageHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_sender)
    -[SYMessageHeader writeTo:].cold.1();
  PBDataWriterWriteSubmessage();
  if (!self->_state)
    -[SYMessageHeader writeTo:].cold.2();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  v4[3] = *(_QWORD *)&self->_timestamp;
  objc_msgSend(v4, "setSender:", self->_sender);
  objc_msgSend(v4, "setState:", self->_state);
  *((_DWORD *)v4 + 12) = self->_version;
  v4[1] = self->_sequenceNumber;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = *(_QWORD *)&self->_timeout;
    *((_BYTE *)v4 + 52) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 24) = self->_timestamp;
  v6 = -[SYPeer copyWithZone:](self->_sender, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[SYVectorClock copyWithZone:](self->_state, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  *(_DWORD *)(v5 + 48) = self->_version;
  *(_QWORD *)(v5 + 8) = self->_sequenceNumber;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_timeout;
    *(_BYTE *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  SYPeer *sender;
  SYVectorClock *state;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if (self->_timestamp != *((double *)v4 + 3))
    goto LABEL_13;
  sender = self->_sender;
  if ((unint64_t)sender | *((_QWORD *)v4 + 4))
  {
    if (!-[SYPeer isEqual:](sender, "isEqual:"))
      goto LABEL_13;
  }
  state = self->_state;
  if ((unint64_t)state | *((_QWORD *)v4 + 5))
  {
    if (!-[SYVectorClock isEqual:](state, "isEqual:"))
      goto LABEL_13;
  }
  if (self->_version != *((_DWORD *)v4 + 12) || self->_sequenceNumber != *((_QWORD *)v4 + 1))
    goto LABEL_13;
  v7 = (*((_BYTE *)v4 + 52) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) != 0 && self->_timeout == *((double *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_14;
    }
LABEL_13:
    v7 = 0;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  double timestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int version;
  unint64_t sequenceNumber;
  unint64_t v16;
  double timeout;
  double v18;
  long double v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;

  timestamp = self->_timestamp;
  v4 = -timestamp;
  if (timestamp >= 0.0)
    v4 = self->_timestamp;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  v12 = -[SYPeer hash](self->_sender, "hash");
  v13 = -[SYVectorClock hash](self->_state, "hash");
  version = self->_version;
  sequenceNumber = self->_sequenceNumber;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timeout = self->_timeout;
    v18 = -timeout;
    if (timeout >= 0.0)
      v18 = self->_timeout;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v21 = fmod(v19, 1.84467441e19);
    v22 = 2654435761u * (unint64_t)v21;
    v23 = v22 + (unint64_t)v20;
    if (v20 <= 0.0)
      v23 = 2654435761u * (unint64_t)v21;
    v16 = v22 - (unint64_t)fabs(v20);
    if (v20 >= 0.0)
      v16 = v23;
  }
  else
  {
    v16 = 0;
  }
  return v12 ^ v11 ^ v13 ^ (2654435761 * version) ^ (2654435761u * sequenceNumber) ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SYPeer *sender;
  uint64_t v6;
  SYVectorClock *state;
  uint64_t v8;
  id v9;

  v4 = a3;
  self->_timestamp = *((double *)v4 + 3);
  sender = self->_sender;
  v6 = *((_QWORD *)v4 + 4);
  v9 = v4;
  if (sender)
  {
    if (!v6)
      goto LABEL_7;
    -[SYPeer mergeFrom:](sender, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[SYMessageHeader setSender:](self, "setSender:");
  }
  v4 = v9;
LABEL_7:
  state = self->_state;
  v8 = *((_QWORD *)v4 + 5);
  if (state)
  {
    if (!v8)
      goto LABEL_13;
    -[SYVectorClock mergeFrom:](state, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[SYMessageHeader setState:](self, "setState:");
  }
  v4 = v9;
LABEL_13:
  self->_version = *((_DWORD *)v4 + 12);
  self->_sequenceNumber = *((_QWORD *)v4 + 1);
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_timeout = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (SYPeer)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (SYVectorClock)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYMessageHeader writeTo:]", "SYMessageHeader.m", 159, "self->_sender != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYMessageHeader writeTo:]", "SYMessageHeader.m", 164, "self->_state != nil");
}

@end
