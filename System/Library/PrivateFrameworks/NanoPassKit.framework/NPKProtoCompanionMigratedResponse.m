@implementation NPKProtoCompanionMigratedResponse

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasPaymentWebServiceContextData
{
  return self->_paymentWebServiceContextData != 0;
}

- (BOOL)hasPeerPaymentWebServiceContextData
{
  return self->_peerPaymentWebServiceContextData != 0;
}

- (BOOL)hasPeerPaymentAccountData
{
  return self->_peerPaymentAccountData != 0;
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
  v8.super_class = (Class)NPKProtoCompanionMigratedResponse;
  -[NPKProtoCompanionMigratedResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCompanionMigratedResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *paymentWebServiceContextData;
  NSData *peerPaymentWebServiceContextData;
  NSData *peerPaymentAccountData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pending"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_success);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("success"));

  }
  errorData = self->_errorData;
  if (errorData)
    objc_msgSend(v3, "setObject:forKey:", errorData, CFSTR("errorData"));
  paymentWebServiceContextData = self->_paymentWebServiceContextData;
  if (paymentWebServiceContextData)
    objc_msgSend(v3, "setObject:forKey:", paymentWebServiceContextData, CFSTR("paymentWebServiceContextData"));
  peerPaymentWebServiceContextData = self->_peerPaymentWebServiceContextData;
  if (peerPaymentWebServiceContextData)
    objc_msgSend(v3, "setObject:forKey:", peerPaymentWebServiceContextData, CFSTR("peerPaymentWebServiceContextData"));
  peerPaymentAccountData = self->_peerPaymentAccountData;
  if (peerPaymentAccountData)
    objc_msgSend(v3, "setObject:forKey:", peerPaymentAccountData, CFSTR("peerPaymentAccountData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCompanionMigratedResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_paymentWebServiceContextData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_peerPaymentWebServiceContextData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_peerPaymentAccountData)
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
    v4[40] = self->_pending;
    v4[44] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[41] = self->_success;
    v4[44] |= 2u;
  }
  v6 = v4;
  if (self->_errorData)
  {
    objc_msgSend(v4, "setErrorData:");
    v4 = v6;
  }
  if (self->_paymentWebServiceContextData)
  {
    objc_msgSend(v6, "setPaymentWebServiceContextData:");
    v4 = v6;
  }
  if (self->_peerPaymentWebServiceContextData)
  {
    objc_msgSend(v6, "setPeerPaymentWebServiceContextData:");
    v4 = v6;
  }
  if (self->_peerPaymentAccountData)
  {
    objc_msgSend(v6, "setPeerPaymentAccountData:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[40] = self->_pending;
    v5[44] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[41] = self->_success;
    v5[44] |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_errorData, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  v10 = -[NSData copyWithZone:](self->_paymentWebServiceContextData, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  v12 = -[NSData copyWithZone:](self->_peerPaymentWebServiceContextData, "copyWithZone:", a3);
  v13 = (void *)v6[4];
  v6[4] = v12;

  v14 = -[NSData copyWithZone:](self->_peerPaymentAccountData, "copyWithZone:", a3);
  v15 = (void *)v6[3];
  v6[3] = v14;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *errorData;
  NSData *paymentWebServiceContextData;
  NSData *peerPaymentWebServiceContextData;
  NSData *peerPaymentAccountData;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
      goto LABEL_26;
    if (self->_pending)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_26;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_success)
      {
        if (!*((_BYTE *)v4 + 41))
          goto LABEL_26;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_18;
    }
LABEL_26:
    v9 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
    goto LABEL_26;
LABEL_18:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((_QWORD *)v4 + 1) && !-[NSData isEqual:](errorData, "isEqual:"))
    goto LABEL_26;
  paymentWebServiceContextData = self->_paymentWebServiceContextData;
  if ((unint64_t)paymentWebServiceContextData | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](paymentWebServiceContextData, "isEqual:"))
      goto LABEL_26;
  }
  peerPaymentWebServiceContextData = self->_peerPaymentWebServiceContextData;
  if ((unint64_t)peerPaymentWebServiceContextData | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](peerPaymentWebServiceContextData, "isEqual:"))
      goto LABEL_26;
  }
  peerPaymentAccountData = self->_peerPaymentAccountData;
  if ((unint64_t)peerPaymentAccountData | *((_QWORD *)v4 + 3))
    v9 = -[NSData isEqual:](peerPaymentAccountData, "isEqual:");
  else
    v9 = 1;
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_pending;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_success;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSData hash](self->_errorData, "hash");
  v6 = -[NSData hash](self->_paymentWebServiceContextData, "hash");
  v7 = v5 ^ v6 ^ -[NSData hash](self->_peerPaymentWebServiceContextData, "hash");
  return v7 ^ -[NSData hash](self->_peerPaymentAccountData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  char v5;
  _BYTE *v6;

  v4 = a3;
  v5 = v4[44];
  if ((v5 & 1) != 0)
  {
    self->_pending = v4[40];
    *(_BYTE *)&self->_has |= 1u;
    v5 = v4[44];
  }
  if ((v5 & 2) != 0)
  {
    self->_success = v4[41];
    *(_BYTE *)&self->_has |= 2u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoCompanionMigratedResponse setErrorData:](self, "setErrorData:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoCompanionMigratedResponse setPaymentWebServiceContextData:](self, "setPaymentWebServiceContextData:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NPKProtoCompanionMigratedResponse setPeerPaymentWebServiceContextData:](self, "setPeerPaymentWebServiceContextData:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoCompanionMigratedResponse setPeerPaymentAccountData:](self, "setPeerPaymentAccountData:");
    v4 = v6;
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (BOOL)success
{
  return self->_success;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
  objc_storeStrong((id *)&self->_errorData, a3);
}

- (NSData)paymentWebServiceContextData
{
  return self->_paymentWebServiceContextData;
}

- (void)setPaymentWebServiceContextData:(id)a3
{
  objc_storeStrong((id *)&self->_paymentWebServiceContextData, a3);
}

- (NSData)peerPaymentWebServiceContextData
{
  return self->_peerPaymentWebServiceContextData;
}

- (void)setPeerPaymentWebServiceContextData:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentWebServiceContextData, a3);
}

- (NSData)peerPaymentAccountData
{
  return self->_peerPaymentAccountData;
}

- (void)setPeerPaymentAccountData:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccountData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentWebServiceContextData, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountData, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceContextData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end
