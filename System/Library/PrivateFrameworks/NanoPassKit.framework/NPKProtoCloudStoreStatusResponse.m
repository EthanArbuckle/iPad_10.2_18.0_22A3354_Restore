@implementation NPKProtoCloudStoreStatusResponse

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

- (BOOL)hasAccountInfoData
{
  return self->_accountInfoData != 0;
}

- (void)setCloudStoreIsSetup:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cloudStoreIsSetup = a3;
}

- (void)setHasCloudStoreIsSetup:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCloudStoreIsSetup
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)NPKProtoCloudStoreStatusResponse;
  -[NPKProtoCloudStoreStatusResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCloudStoreStatusResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *accountInfoData;
  void *v6;
  NSData *errorData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pending"));

  }
  accountInfoData = self->_accountInfoData;
  if (accountInfoData)
    objc_msgSend(v3, "setObject:forKey:", accountInfoData, CFSTR("accountInfoData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cloudStoreIsSetup);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("cloudStoreIsSetup"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCloudStoreStatusResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_accountInfoData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
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

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[25] = self->_pending;
    v4[28] |= 2u;
  }
  v5 = v4;
  if (self->_accountInfoData)
  {
    objc_msgSend(v4, "setAccountInfoData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_cloudStoreIsSetup;
    v4[28] |= 1u;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 25) = self->_pending;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
  v7 = -[NSData copyWithZone:](self->_accountInfoData, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v6 + 24) = self->_cloudStoreIsSetup;
    *(_BYTE *)(v6 + 28) |= 1u;
  }
  v9 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *accountInfoData;
  char v7;
  NSData *errorData;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_17;
    if (self->_pending)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  accountInfoData = self->_accountInfoData;
  if ((unint64_t)accountInfoData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](accountInfoData, "isEqual:"))
      goto LABEL_17;
    has = (char)self->_has;
  }
  if ((has & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_23;
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if ((*((_BYTE *)v4 + 28) & 1) == 0)
    goto LABEL_17;
  if (!self->_cloudStoreIsSetup)
  {
    if (!*((_BYTE *)v4 + 24))
      goto LABEL_23;
    goto LABEL_17;
  }
  if (!*((_BYTE *)v4 + 24))
    goto LABEL_17;
LABEL_23:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 2))
    v7 = -[NSData isEqual:](errorData, "isEqual:");
  else
    v7 = 1;
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_pending;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_accountInfoData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_cloudStoreIsSetup;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSData hash](self->_errorData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[28] & 2) != 0)
  {
    self->_pending = v4[25];
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoCloudStoreStatusResponse setAccountInfoData:](self, "setAccountInfoData:");
    v4 = v5;
  }
  if ((v4[28] & 1) != 0)
  {
    self->_cloudStoreIsSetup = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoCloudStoreStatusResponse setErrorData:](self, "setErrorData:");
    v4 = v5;
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)accountInfoData
{
  return self->_accountInfoData;
}

- (void)setAccountInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_accountInfoData, a3);
}

- (BOOL)cloudStoreIsSetup
{
  return self->_cloudStoreIsSetup;
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
  objc_storeStrong((id *)&self->_accountInfoData, 0);
}

@end
