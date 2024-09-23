@implementation BLTPBAckInitialSequenceNumberRequest

- (void)setAssert:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_assert = a3;
}

- (void)setHasAssert:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAssert
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (void)setSessionState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionState = a3;
}

- (void)setHasSessionState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionState
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
  v8.super_class = (Class)BLTPBAckInitialSequenceNumberRequest;
  -[BLTPBAckInitialSequenceNumberRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBAckInitialSequenceNumberRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *sessionIdentifier;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_assert);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("assert"));

  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sessionState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sessionState"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBAckInitialSequenceNumberRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[20] = self->_assert;
    v4[24] |= 2u;
  }
  if (self->_sessionIdentifier)
  {
    v5 = v4;
    objc_msgSend(v4, "setSessionIdentifier:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_sessionState;
    v4[24] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 20) = self->_assert;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v7 = -[NSData copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_sessionState;
    *(_BYTE *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *sessionIdentifier;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_17;
    if (self->_assert)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_17;
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (!((unint64_t)sessionIdentifier | *((_QWORD *)v4 + 1)))
    goto LABEL_13;
  if (!-[NSData isEqual:](sessionIdentifier, "isEqual:"))
  {
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  has = (char)self->_has;
LABEL_13:
  v7 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_sessionState != *((_DWORD *)v4 + 4))
      goto LABEL_17;
    v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_assert;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_sessionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_sessionState;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    self->_assert = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[BLTPBAckInitialSequenceNumberRequest setSessionIdentifier:](self, "setSessionIdentifier:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    self->_sessionState = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)assert
{
  return self->_assert;
}

- (NSData)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (unsigned)sessionState
{
  return self->_sessionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
