@implementation WCDProtoUserInfoTransfer

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasClientData
{
  return self->_clientData != 0;
}

- (BOOL)hasTransferIdentifier
{
  return self->_transferIdentifier != 0;
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
  v8.super_class = (Class)WCDProtoUserInfoTransfer;
  -[WCDProtoUserInfoTransfer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCDProtoUserInfoTransfer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *clientData;
  NSString *transferIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  clientData = self->_clientData;
  if (clientData)
    objc_msgSend(v3, "setObject:forKey:", clientData, CFSTR("clientData"));
  transferIdentifier = self->_transferIdentifier;
  if (transferIdentifier)
    objc_msgSend(v3, "setObject:forKey:", transferIdentifier, CFSTR("transferIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WCDProtoUserInfoTransferReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_clientData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_transferIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_version;
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_clientData)
  {
    objc_msgSend(v4, "setClientData:");
    v4 = v5;
  }
  if (self->_transferIdentifier)
  {
    objc_msgSend(v5, "setTransferIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_version;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_clientData, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_transferIdentifier, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *clientData;
  NSString *transferIdentifier;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  clientData = self->_clientData;
  if ((unint64_t)clientData | *((_QWORD *)v4 + 1) && !-[NSData isEqual:](clientData, "isEqual:"))
    goto LABEL_11;
  transferIdentifier = self->_transferIdentifier;
  if ((unint64_t)transferIdentifier | *((_QWORD *)v4 + 2))
    v7 = -[NSString isEqual:](transferIdentifier, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_clientData, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_transferIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[7] & 1) != 0)
  {
    self->_version = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[WCDProtoUserInfoTransfer setClientData:](self, "setClientData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[WCDProtoUserInfoTransfer setTransferIdentifier:](self, "setTransferIdentifier:");
    v4 = v5;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSData)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
  objc_storeStrong((id *)&self->_clientData, a3);
}

- (NSString)transferIdentifier
{
  return self->_transferIdentifier;
}

- (void)setTransferIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_transferIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
}

@end
