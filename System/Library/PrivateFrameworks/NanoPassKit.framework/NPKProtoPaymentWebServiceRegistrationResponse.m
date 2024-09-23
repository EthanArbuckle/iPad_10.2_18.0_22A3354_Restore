@implementation NPKProtoPaymentWebServiceRegistrationResponse

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

- (void)setRegistrationResult:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_registrationResult = a3;
}

- (void)setHasRegistrationResult:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRegistrationResult
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasWebServiceContextData
{
  return self->_webServiceContextData != 0;
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
  v8.super_class = (Class)NPKProtoPaymentWebServiceRegistrationResponse;
  -[NPKProtoPaymentWebServiceRegistrationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPaymentWebServiceRegistrationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *webServiceContextData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pending"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_registrationResult);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("registrationResult"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  webServiceContextData = self->_webServiceContextData;
  if (webServiceContextData)
    objc_msgSend(v3, "setObject:forKey:", webServiceContextData, CFSTR("webServiceContextData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPaymentWebServiceRegistrationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_webServiceContextData)
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
  if ((has & 2) != 0)
  {
    v4[32] = self->_pending;
    v4[36] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_registrationResult;
    v4[36] |= 1u;
  }
  v6 = v4;
  if (self->_errorData)
  {
    objc_msgSend(v4, "setErrorData:");
    v4 = v6;
  }
  if (self->_webServiceContextData)
  {
    objc_msgSend(v6, "setWebServiceContextData:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_pending;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_registrationResult;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  v10 = -[NSData copyWithZone:](self->_webServiceContextData, "copyWithZone:", a3);
  v11 = (void *)v6[3];
  v6[3] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *errorData;
  NSData *webServiceContextData;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) != 0)
    {
      if (self->_pending)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_19;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_10;
    }
LABEL_19:
    v7 = 0;
    goto LABEL_20;
  }
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
    goto LABEL_19;
LABEL_10:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_registrationResult != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_19;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1) && !-[NSData isEqual:](errorData, "isEqual:"))
    goto LABEL_19;
  webServiceContextData = self->_webServiceContextData;
  if ((unint64_t)webServiceContextData | *((_QWORD *)v4 + 3))
    v7 = -[NSData isEqual:](webServiceContextData, "isEqual:");
  else
    v7 = 1;
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_pending;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_registrationResult;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSData hash](self->_errorData, "hash");
  return v5 ^ -[NSData hash](self->_webServiceContextData, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_pending = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_registrationResult = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoPaymentWebServiceRegistrationResponse setErrorData:](self, "setErrorData:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoPaymentWebServiceRegistrationResponse setWebServiceContextData:](self, "setWebServiceContextData:");
    v4 = v6;
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (unsigned)registrationResult
{
  return self->_registrationResult;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (NSData)webServiceContextData
{
  return self->_webServiceContextData;
}

- (void)setWebServiceContextData:(id)a3
{
  objc_storeStrong((id *)&self->_webServiceContextData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webServiceContextData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
