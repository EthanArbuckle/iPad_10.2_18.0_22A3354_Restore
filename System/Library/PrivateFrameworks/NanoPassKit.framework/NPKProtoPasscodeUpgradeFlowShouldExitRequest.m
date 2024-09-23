@implementation NPKProtoPasscodeUpgradeFlowShouldExitRequest

- (void)setPasscodeChanged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_passcodeChanged = a3;
}

- (void)setHasPasscodeChanged:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPasscodeChanged
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NPKProtoPasscodeUpgradeFlowShouldExitRequest;
  -[NPKProtoPasscodeUpgradeFlowShouldExitRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPasscodeUpgradeFlowShouldExitRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *errorData;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_passcodeChanged);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("passcodeChanged"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("pending"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPasscodeUpgradeFlowShouldExitRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_passcodeChanged;
    v4[20] |= 1u;
  }
  if (self->_errorData)
  {
    v5 = v4;
    objc_msgSend(v4, "setErrorData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[17] = self->_pending;
    v4[20] |= 2u;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_passcodeChanged;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v6 + 17) = self->_pending;
    *(_BYTE *)(v6 + 20) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *errorData;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
      goto LABEL_15;
    if (self->_passcodeChanged)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_15;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_15;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](errorData, "isEqual:"))
      goto LABEL_15;
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) != 0)
    {
      if (self->_pending)
      {
        if (!*((_BYTE *)v4 + 17))
          goto LABEL_15;
      }
      else if (*((_BYTE *)v4 + 17))
      {
        goto LABEL_15;
      }
      v7 = 1;
      goto LABEL_16;
    }
LABEL_15:
    v7 = 0;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_passcodeChanged;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_errorData, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_pending;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[20] & 1) != 0)
  {
    self->_passcodeChanged = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[NPKProtoPasscodeUpgradeFlowShouldExitRequest setErrorData:](self, "setErrorData:");
    v4 = v5;
  }
  if ((v4[20] & 2) != 0)
  {
    self->_pending = v4[17];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (BOOL)passcodeChanged
{
  return self->_passcodeChanged;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (BOOL)pending
{
  return self->_pending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
