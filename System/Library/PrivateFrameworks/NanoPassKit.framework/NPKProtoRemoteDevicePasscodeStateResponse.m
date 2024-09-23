@implementation NPKProtoRemoteDevicePasscodeStateResponse

- (void)setHasPasscodeSet:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasPasscodeSet = a3;
}

- (void)setHasHasPasscodeSet:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasPasscodeSet
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsPasscodeLocked:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isPasscodeLocked = a3;
}

- (void)setHasIsPasscodeLocked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPasscodeLocked
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
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
  v8.super_class = (Class)NPKProtoRemoteDevicePasscodeStateResponse;
  -[NPKProtoRemoteDevicePasscodeStateResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemoteDevicePasscodeStateResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasPasscodeSet);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("hasPasscodeSet"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPasscodeLocked);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isPasscodeLocked"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemoteDevicePasscodeStateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  _BYTE *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[16] = self->_hasPasscodeSet;
    v4[20] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[17] = self->_isPasscodeLocked;
    v4[20] |= 2u;
  }
  if (self->_errorData)
  {
    v6 = v4;
    objc_msgSend(v4, "setErrorData:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[16] = self->_hasPasscodeSet;
    v5[20] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[17] = self->_isPasscodeLocked;
    v5[20] |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSData *errorData;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0)
      goto LABEL_14;
    if (self->_hasPasscodeSet)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_20;
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 20) & 2) == 0)
    goto LABEL_14;
  if (!self->_isPasscodeLocked)
  {
    if (!*((_BYTE *)v4 + 17))
      goto LABEL_20;
    goto LABEL_14;
  }
  if (!*((_BYTE *)v4 + 17))
    goto LABEL_14;
LABEL_20:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1))
    v5 = -[NSData isEqual:](errorData, "isEqual:");
  else
    v5 = 1;
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_hasPasscodeSet;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSData hash](self->_errorData, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_isPasscodeLocked;
  return v3 ^ v2 ^ -[NSData hash](self->_errorData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  char v5;
  _BYTE *v6;

  v4 = a3;
  v5 = v4[20];
  if ((v5 & 1) != 0)
  {
    self->_hasPasscodeSet = v4[16];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[20];
  }
  if ((v5 & 2) != 0)
  {
    self->_isPasscodeLocked = v4[17];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[NPKProtoRemoteDevicePasscodeStateResponse setErrorData:](self, "setErrorData:");
    v4 = v6;
  }

}

- (BOOL)hasPasscodeSet
{
  return self->_hasPasscodeSet;
}

- (BOOL)isPasscodeLocked
{
  return self->_isPasscodeLocked;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
