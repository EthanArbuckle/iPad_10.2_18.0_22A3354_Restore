@implementation IDSQRProtoErrorIndication

- (void)setChannelId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_channelId = a3;
}

- (void)setHasChannelId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannelId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasErrorReason
{
  return self->_errorReason != 0;
}

- (BOOL)hasClientAddress
{
  return self->_clientAddress != 0;
}

- (void)setTxnId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_txnId = a3;
}

- (void)setHasTxnId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTxnId
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoErrorIndication;
  -[IDSQRProtoErrorIndication description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@ %@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  const char *v5;
  void *v6;
  double v7;
  char has;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  NSString *errorReason;
  NSString *clientAddress;
  void *v17;
  const char *v18;
  double v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, self->_channelId, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, v11, CFSTR("channel_id"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v5, self->_errorCode, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, v14, CFSTR("error_code"));

  }
  errorReason = self->_errorReason;
  if (errorReason)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)errorReason, v7, CFSTR("error_reason"));
  clientAddress = self->_clientAddress;
  if (clientAddress)
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)clientAddress, v7, CFSTR("client_address"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_txnId, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, v19, CFSTR("txn_id"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoErrorIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_errorReason)
    PBDataWriterWriteStringField();
  if (self->_clientAddress)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  double v6;
  char has;
  NSString *errorReason;
  NSString *clientAddress;
  _DWORD *v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_channelId;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[8] = self->_errorCode;
    *((_BYTE *)v4 + 48) |= 4u;
  }
  errorReason = self->_errorReason;
  v10 = v4;
  if (errorReason)
  {
    objc_msgSend_setErrorReason_(v4, v5, (uint64_t)errorReason, v6);
    v4 = v10;
  }
  clientAddress = self->_clientAddress;
  if (clientAddress)
  {
    objc_msgSend_setClientAddress_(v10, v5, (uint64_t)clientAddress, v6);
    v4 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_txnId;
    *((_BYTE *)v4 + 48) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  uint64_t v15;
  char has;
  uint64_t v17;
  void *v18;
  const char *v19;
  double v20;
  uint64_t v21;
  void *v22;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = v12;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 16) = self->_channelId;
    *(_BYTE *)(v12 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v12 + 32) = self->_errorCode;
    *(_BYTE *)(v12 + 48) |= 4u;
  }
  v17 = objc_msgSend_copyWithZone_(self->_errorReason, v13, (uint64_t)a3, v14);
  v18 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v17;

  v21 = objc_msgSend_copyWithZone_(self->_clientAddress, v19, (uint64_t)a3, v20);
  v22 = *(void **)(v15 + 24);
  *(_QWORD *)(v15 + 24) = v21;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v15 + 8) = self->_txnId;
    *(_BYTE *)(v15 + 48) |= 1u;
  }
  return (id)v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSString *errorReason;
  uint64_t v11;
  NSString *clientAddress;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[6] & 2) == 0 || self->_channelId != *((_DWORD *)v4 + 4))
      goto LABEL_20;
  }
  else if ((v4[6] & 2) != 0)
  {
LABEL_20:
    v14 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[6] & 4) == 0 || self->_errorCode != *((_DWORD *)v4 + 8))
      goto LABEL_20;
  }
  else if ((v4[6] & 4) != 0)
  {
    goto LABEL_20;
  }
  errorReason = self->_errorReason;
  v11 = v4[5];
  if ((unint64_t)errorReason | v11 && !objc_msgSend_isEqual_(errorReason, v8, v11, v9))
    goto LABEL_20;
  clientAddress = self->_clientAddress;
  v13 = v4[3];
  if ((unint64_t)clientAddress | v13)
  {
    if (!objc_msgSend_isEqual_(clientAddress, v8, v13, v9))
      goto LABEL_20;
  }
  v14 = (v4[6] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[6] & 1) == 0 || self->_txnId != v4[1])
      goto LABEL_20;
    v14 = 1;
  }
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_channelId;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_errorCode;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  v7 = objc_msgSend_hash(self->_errorReason, a2, v2, v3);
  v11 = objc_msgSend_hash(self->_clientAddress, v8, v9, v10);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v12 = 2654435761u * self->_txnId;
  else
    v12 = 0;
  return v6 ^ v5 ^ v7 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 2) != 0)
  {
    self->_channelId = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((v7 & 4) != 0)
  {
    self->_errorCode = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 4u;
  }
  v8 = *((_QWORD *)v4 + 5);
  v10 = v4;
  if (v8)
  {
    objc_msgSend_setErrorReason_(self, v5, v8, v6);
    v4 = v10;
  }
  v9 = *((_QWORD *)v4 + 3);
  if (v9)
  {
    objc_msgSend_setClientAddress_(self, v5, v9, v6);
    v4 = v10;
  }
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_txnId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)channelId
{
  return self->_channelId;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSString)errorReason
{
  return self->_errorReason;
}

- (void)setErrorReason:(id)a3
{
  objc_storeStrong((id *)&self->_errorReason, a3);
}

- (NSString)clientAddress
{
  return self->_clientAddress;
}

- (void)setClientAddress:(id)a3
{
  objc_storeStrong((id *)&self->_clientAddress, a3);
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorReason, 0);
  objc_storeStrong((id *)&self->_clientAddress, 0);
}

@end
