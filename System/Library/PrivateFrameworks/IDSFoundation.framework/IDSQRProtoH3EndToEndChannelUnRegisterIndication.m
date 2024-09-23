@implementation IDSQRProtoH3EndToEndChannelUnRegisterIndication

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
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelUnRegisterIndication;
  -[IDSQRProtoH3EndToEndChannelUnRegisterIndication description](&v13, sel_description);
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
  NSData *e2eChannelUuid;
  void *v10;
  const char *v11;
  double v12;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  e2eChannelUuid = self->_e2eChannelUuid;
  if (e2eChannelUuid)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)e2eChannelUuid, v7, CFSTR("e2e_channel_uuid"));
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, self->_txnId, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, v12, CFSTR("txn_id"));

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelUnRegisterIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_e2eChannelUuid)
    sub_19BAF5C3C();
  v5 = v4;
  PBDataWriterWriteDataField();
  PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  NSData *e2eChannelUuid;
  const char *v5;
  double v6;
  _QWORD *v7;

  e2eChannelUuid = self->_e2eChannelUuid;
  v7 = a3;
  objc_msgSend_setE2eChannelUuid_(v7, v5, (uint64_t)e2eChannelUuid, v6);
  v7[1] = self->_txnId;

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
  _QWORD *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  void *v16;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (_QWORD *)objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_e2eChannelUuid, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[2];
  v12[2] = v15;

  v12[1] = self->_txnId;
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  NSData *e2eChannelUuid;
  uint64_t v11;
  BOOL v12;

  v4 = a3;
  v5 = objc_opt_class();
  v12 = objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
     && ((e2eChannelUuid = self->_e2eChannelUuid, v11 = v4[2], !((unint64_t)e2eChannelUuid | v11))
      || objc_msgSend_isEqual_(e2eChannelUuid, v8, v11, v9))
     && self->_txnId == v4[1];

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;

  return (2654435761u * self->_txnId) ^ objc_msgSend_hash(self->_e2eChannelUuid, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  const char *v5;
  double v6;
  uint64_t v7;
  unint64_t *v8;

  v4 = (unint64_t *)a3;
  v7 = v4[2];
  if (v7)
  {
    v8 = v4;
    objc_msgSend_setE2eChannelUuid_(self, v5, v7, v6);
    v4 = v8;
  }
  self->_txnId = v4[1];

}

- (NSData)e2eChannelUuid
{
  return self->_e2eChannelUuid;
}

- (void)setE2eChannelUuid:(id)a3
{
  objc_storeStrong((id *)&self->_e2eChannelUuid, a3);
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void)setTxnId:(unint64_t)a3
{
  self->_txnId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_e2eChannelUuid, 0);
}

@end
