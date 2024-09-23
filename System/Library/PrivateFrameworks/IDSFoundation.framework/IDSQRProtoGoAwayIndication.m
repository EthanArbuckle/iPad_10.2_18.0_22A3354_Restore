@implementation IDSQRProtoGoAwayIndication

- (BOOL)hasReasonString
{
  return self->_reasonString != 0;
}

- (BOOL)hasServerBlob
{
  return self->_serverBlob != 0;
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
  v13.super_class = (Class)IDSQRProtoGoAwayIndication;
  -[IDSQRProtoGoAwayIndication description](&v13, sel_description);
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
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  NSString *reasonString;
  NSData *serverBlob;
  void *v15;
  const char *v16;
  double v17;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_reasonCode, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("reason_code"));

  reasonString = self->_reasonString;
  if (reasonString)
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)reasonString, v12, CFSTR("reason_string"));
  serverBlob = self->_serverBlob;
  if (serverBlob)
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)serverBlob, v12, CFSTR("server_blob"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v11, self->_txnId, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v16, (uint64_t)v15, v17, CFSTR("txn_id"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoGoAwayIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_reasonString)
    PBDataWriterWriteStringField();
  if (self->_serverBlob)
    PBDataWriterWriteDataField();
  v4 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  double v6;
  NSString *reasonString;
  NSData *serverBlob;
  _DWORD *v9;

  v4 = a3;
  v4[4] = self->_reasonCode;
  reasonString = self->_reasonString;
  v9 = v4;
  if (reasonString)
  {
    objc_msgSend_setReasonString_(v4, v5, (uint64_t)reasonString, v6);
    v4 = v9;
  }
  serverBlob = self->_serverBlob;
  if (serverBlob)
  {
    objc_msgSend_setServerBlob_(v9, v5, (uint64_t)serverBlob, v6);
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_txnId;
    *((_BYTE *)v4 + 40) |= 1u;
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
  void *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  void *v20;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 16) = self->_reasonCode;
  v15 = objc_msgSend_copyWithZone_(self->_reasonString, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v15;

  v19 = objc_msgSend_copyWithZone_(self->_serverBlob, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v12 + 8) = self->_txnId;
    *(_BYTE *)(v12 + 40) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSString *reasonString;
  uint64_t v11;
  NSData *serverBlob;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_11;
  if (self->_reasonCode != *((_DWORD *)v4 + 4))
    goto LABEL_11;
  reasonString = self->_reasonString;
  v11 = v4[3];
  if ((unint64_t)reasonString | v11)
  {
    if (!objc_msgSend_isEqual_(reasonString, v8, v11, v9))
      goto LABEL_11;
  }
  serverBlob = self->_serverBlob;
  v13 = v4[4];
  if ((unint64_t)serverBlob | v13)
  {
    if (!objc_msgSend_isEqual_(serverBlob, v8, v13, v9))
      goto LABEL_11;
  }
  v14 = (v4[5] & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[5] & 1) != 0 && self->_txnId == v4[1])
    {
      v14 = 1;
      goto LABEL_12;
    }
LABEL_11:
    v14 = 0;
  }
LABEL_12:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  unsigned int reasonCode;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  unint64_t v11;

  reasonCode = self->_reasonCode;
  v6 = objc_msgSend_hash(self->_reasonString, a2, v2, v3);
  v10 = objc_msgSend_hash(self->_serverBlob, v7, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761u * self->_txnId;
  else
    v11 = 0;
  return v6 ^ v10 ^ v11 ^ (2654435761 * reasonCode);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  self->_reasonCode = *((_DWORD *)v4 + 4);
  v7 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (v7)
  {
    objc_msgSend_setReasonString_(self, v5, v7, v6);
    v4 = v9;
  }
  v8 = *((_QWORD *)v4 + 4);
  if (v8)
  {
    objc_msgSend_setServerBlob_(self, v5, v8, v6);
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_txnId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(unsigned int)a3
{
  self->_reasonCode = a3;
}

- (NSString)reasonString
{
  return self->_reasonString;
}

- (void)setReasonString:(id)a3
{
  objc_storeStrong((id *)&self->_reasonString, a3);
}

- (NSData)serverBlob
{
  return self->_serverBlob;
}

- (void)setServerBlob:(id)a3
{
  objc_storeStrong((id *)&self->_serverBlob, a3);
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBlob, 0);
  objc_storeStrong((id *)&self->_reasonString, 0);
}

@end
