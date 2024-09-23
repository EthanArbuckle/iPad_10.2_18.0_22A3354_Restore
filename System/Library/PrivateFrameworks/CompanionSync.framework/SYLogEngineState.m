@implementation SYLogEngineState

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_24CC657D0[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Messaging")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FileTransfer")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DirectConnection")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSuspended:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_suspended = a3;
}

- (void)setHasSuspended:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuspended
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setInSession:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_inSession = a3;
}

- (void)setHasInSession:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInSession
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBuffersSessions:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_buffersSessions = a3;
}

- (void)setHasBuffersSessions:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBuffersSessions
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
  v8.super_class = (Class)SYLogEngineState;
  -[SYLogEngineState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLogEngineState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  char has;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_type - 1;
  if (v4 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24CC657D0[v4];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_6;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_inSession);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("inSession"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_suspended);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("suspended"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_10;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_buffersSessions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("buffersSessions"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogEngineStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
LABEL_4:
    PBDataWriterWriteBOOLField();
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  v4[2] = self->_type;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *((_BYTE *)v4 + 13) = self->_inSession;
    *((_BYTE *)v4 + 16) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_BYTE *)v4 + 14) = self->_suspended;
  *((_BYTE *)v4 + 16) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 12) = self->_buffersSessions;
    *((_BYTE *)v4 + 16) |= 1u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_type;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)result + 14) = self->_suspended;
    *((_BYTE *)result + 16) |= 4u;
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
  *((_BYTE *)result + 13) = self->_inSession;
  *((_BYTE *)result + 16) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 12) = self->_buffersSessions;
  *((_BYTE *)result + 16) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_type != *((_DWORD *)v4 + 2))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) == 0)
      goto LABEL_21;
    if (self->_suspended)
    {
      if (!*((_BYTE *)v4 + 14))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 14))
    {
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0)
      goto LABEL_21;
    if (self->_inSession)
    {
      if (!*((_BYTE *)v4 + 13))
        goto LABEL_21;
    }
    else if (*((_BYTE *)v4 + 13))
    {
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) != 0)
    {
      if (self->_buffersSessions)
      {
        if (!*((_BYTE *)v4 + 12))
          goto LABEL_21;
      }
      else if (*((_BYTE *)v4 + 12))
      {
        goto LABEL_21;
      }
      v5 = 1;
      goto LABEL_22;
    }
LABEL_21:
    v5 = 0;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v2 = 2654435761 * self->_suspended;
  else
    v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_inSession;
  else
    v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_buffersSessions;
  else
    v4 = 0;
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_type);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  self->_type = *((_DWORD *)v4 + 2);
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_inSession = *((_BYTE *)v4 + 13);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 16) & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_suspended = *((_BYTE *)v4 + 14);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 1) != 0)
  {
LABEL_4:
    self->_buffersSessions = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (BOOL)inSession
{
  return self->_inSession;
}

- (BOOL)buffersSessions
{
  return self->_buffersSessions;
}

@end
