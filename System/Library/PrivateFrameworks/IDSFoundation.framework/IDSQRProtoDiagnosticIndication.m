@implementation IDSQRProtoDiagnosticIndication

- (void)setPacketsRecordDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_packetsRecordDuration = a3;
}

- (void)setHasPacketsRecordDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPacketsRecordDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v13.super_class = (Class)IDSQRProtoDiagnosticIndication;
  -[IDSQRProtoDiagnosticIndication description](&v13, sel_description);
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
  NSString *failureSubtype;
  NSString *failureSubtypeContext;
  char has;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  failureSubtype = self->_failureSubtype;
  if (failureSubtype)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)failureSubtype, v7, CFSTR("failure_subtype"));
  failureSubtypeContext = self->_failureSubtypeContext;
  if (failureSubtypeContext)
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)failureSubtypeContext, v7, CFSTR("failure_subtype_context"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_packetsRecordDuration, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, v14, CFSTR("packets_record_duration"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v6, self->_txnId, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v8, v16, (uint64_t)v15, v17, CFSTR("txn_id"));

  }
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoDiagnosticIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (!self->_failureSubtype)
    sub_19BAF6948();
  v6 = v4;
  PBDataWriterWriteStringField();
  if (!self->_failureSubtypeContext)
    sub_19BAF6970();
  PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  char has;
  id v9;

  v9 = a3;
  objc_msgSend_setFailureSubtype_(v9, v4, (uint64_t)self->_failureSubtype, v5);
  objc_msgSend_setFailureSubtypeContext_(v9, v6, (uint64_t)self->_failureSubtypeContext, v7);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v9 + 8) = self->_packetsRecordDuration;
    *((_BYTE *)v9 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v9 + 1) = self->_txnId;
    *((_BYTE *)v9 + 36) |= 1u;
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
  char has;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = objc_msgSend_copyWithZone_(self->_failureSubtype, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 16);
  *(_QWORD *)(v12 + 16) = v15;

  v19 = objc_msgSend_copyWithZone_(self->_failureSubtypeContext, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v19;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 32) = self->_packetsRecordDuration;
    *(_BYTE *)(v12 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v12 + 8) = self->_txnId;
    *(_BYTE *)(v12 + 36) |= 1u;
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
  NSString *failureSubtype;
  uint64_t v11;
  NSString *failureSubtypeContext;
  uint64_t v13;
  BOOL v14;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_15;
  failureSubtype = self->_failureSubtype;
  v11 = v4[2];
  if ((unint64_t)failureSubtype | v11)
  {
    if (!objc_msgSend_isEqual_(failureSubtype, v8, v11, v9))
      goto LABEL_15;
  }
  failureSubtypeContext = self->_failureSubtypeContext;
  v13 = v4[3];
  if ((unint64_t)failureSubtypeContext | v13)
  {
    if (!objc_msgSend_isEqual_(failureSubtypeContext, v8, v13, v9))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_packetsRecordDuration != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  v14 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_txnId != v4[1])
      goto LABEL_15;
    v14 = 1;
  }
LABEL_16:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v5 = objc_msgSend_hash(self->_failureSubtype, a2, v2, v3);
  v9 = objc_msgSend_hash(self->_failureSubtypeContext, v6, v7, v8);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = 2654435761 * self->_packetsRecordDuration;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    return v9 ^ v5 ^ v10 ^ v11;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v11 = 2654435761u * self->_txnId;
  return v9 ^ v5 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;

  v4 = a3;
  v7 = *((_QWORD *)v4 + 2);
  v10 = v4;
  if (v7)
  {
    objc_msgSend_setFailureSubtype_(self, v5, v7, v6);
    v4 = v10;
  }
  v8 = *((_QWORD *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setFailureSubtypeContext_(self, v5, v8, v6);
    v4 = v10;
  }
  v9 = *((_BYTE *)v4 + 36);
  if ((v9 & 2) != 0)
  {
    self->_packetsRecordDuration = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v9 = *((_BYTE *)v4 + 36);
  }
  if ((v9 & 1) != 0)
  {
    self->_txnId = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)failureSubtype
{
  return self->_failureSubtype;
}

- (void)setFailureSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_failureSubtype, a3);
}

- (NSString)failureSubtypeContext
{
  return self->_failureSubtypeContext;
}

- (void)setFailureSubtypeContext:(id)a3
{
  objc_storeStrong((id *)&self->_failureSubtypeContext, a3);
}

- (unsigned)packetsRecordDuration
{
  return self->_packetsRecordDuration;
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureSubtypeContext, 0);
  objc_storeStrong((id *)&self->_failureSubtype, 0);
}

@end
