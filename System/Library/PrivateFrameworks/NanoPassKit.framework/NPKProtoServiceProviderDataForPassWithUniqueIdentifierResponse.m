@implementation NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse

- (BOOL)hasServiceProviderData
{
  return self->_serviceProviderData != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (void)setEncrypted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_encrypted = a3;
}

- (void)setHasEncrypted:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEncrypted
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
  v8.super_class = (Class)NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse;
  -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *serviceProviderData;
  NSData *errorData;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  serviceProviderData = self->_serviceProviderData;
  if (serviceProviderData)
    objc_msgSend(v3, "setObject:forKey:", serviceProviderData, CFSTR("serviceProviderData"));
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v4, "setObject:forKey:", errorData, CFSTR("errorData"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_encrypted);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("encrypted"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_serviceProviderData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
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
  v5 = v4;
  if (self->_serviceProviderData)
  {
    objc_msgSend(v4, "setServiceProviderData:");
    v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_encrypted;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_serviceProviderData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_encrypted;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *serviceProviderData;
  NSData *errorData;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  serviceProviderData = self->_serviceProviderData;
  if ((unint64_t)serviceProviderData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](serviceProviderData, "isEqual:"))
      goto LABEL_8;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](errorData, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_encrypted)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSData hash](self->_serviceProviderData, "hash");
  v4 = -[NSData hash](self->_errorData, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_encrypted;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse setServiceProviderData:](self, "setServiceProviderData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoServiceProviderDataForPassWithUniqueIdentifierResponse setErrorData:](self, "setErrorData:");
    v4 = v5;
  }
  if (v4[28])
  {
    self->_encrypted = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void)setServiceProviderData:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderData, a3);
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
