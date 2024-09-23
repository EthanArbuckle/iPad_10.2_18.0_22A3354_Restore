@implementation IDSQRProtoPluginControlIndication

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
  v13.super_class = (Class)IDSQRProtoPluginControlIndication;
  -[IDSQRProtoPluginControlIndication description](&v13, sel_description);
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
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_pluginOperation, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("plugin_operation"));

  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v11, self->_pluginParticipantId, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, v15, CFSTR("plugin_participant_id"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v16, self->_txnId, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v19, (uint64_t)v18, v20, CFSTR("txn_id"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPluginControlIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_pluginOperation;
  *((_QWORD *)a3 + 1) = self->_pluginParticipantId;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_txnId;
    *((_BYTE *)a3 + 28) |= 1u;
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
  id result;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  result = (id)objc_msgSend_init(v8, v9, v10, v11);
  *((_DWORD *)result + 6) = self->_pluginOperation;
  *((_QWORD *)result + 1) = self->_pluginParticipantId;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)result + 2) = self->_txnId;
    *((_BYTE *)result + 28) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    || self->_pluginOperation != *((_DWORD *)v4 + 6)
    || self->_pluginParticipantId != *((_QWORD *)v4 + 1))
  {
    goto LABEL_8;
  }
  v8 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0 && self->_txnId == *((_QWORD *)v4 + 2))
    {
      v8 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
  }
LABEL_9:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_txnId;
  else
    v2 = 0;
  return (2654435761u * self->_pluginParticipantId) ^ (2654435761 * self->_pluginOperation) ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_pluginOperation = *((_DWORD *)a3 + 6);
  self->_pluginParticipantId = *((_QWORD *)a3 + 1);
  if ((*((_BYTE *)a3 + 28) & 1) != 0)
  {
    self->_txnId = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (unsigned)pluginOperation
{
  return self->_pluginOperation;
}

- (void)setPluginOperation:(unsigned int)a3
{
  self->_pluginOperation = a3;
}

- (unint64_t)pluginParticipantId
{
  return self->_pluginParticipantId;
}

- (void)setPluginParticipantId:(unint64_t)a3
{
  self->_pluginParticipantId = a3;
}

- (unint64_t)txnId
{
  return self->_txnId;
}

@end
