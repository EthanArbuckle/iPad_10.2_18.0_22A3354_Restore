@implementation IDSQRProtoParticipantUpdateIndication

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoParticipantUpdateIndication;
  -[IDSQRProtoParticipantUpdateIndication dealloc](&v3, sel_dealloc);
}

- (unint64_t)participantIdListsCount
{
  return self->_participantIdLists.count;
}

- (unint64_t)participantIdLists
{
  return self->_participantIdLists.list;
}

- (void)clearParticipantIdLists
{
  PBRepeatedUInt64Clear();
}

- (void)addParticipantIdList:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)participantIdListAtIndex:(unint64_t)a3
{
  double v3;
  $D9041E0417540B7714261C3B5E8BB314 *p_participantIdLists;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;

  p_participantIdLists = &self->_participantIdLists;
  count = self->_participantIdLists.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("idx (%lu) is out of range (%lu)"), v3, a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise(v12, v13, v14, v15);

  }
  return p_participantIdLists->list[a3];
}

- (void)setParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (void)setOperationFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_operationFlags = a3;
}

- (void)setHasOperationFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOperationFlags
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

- (void)setSessionStateCounter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sessionStateCounter = a3;
}

- (void)setHasSessionStateCounter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionStateCounter
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v13.super_class = (Class)IDSQRProtoParticipantUpdateIndication;
  -[IDSQRProtoParticipantUpdateIndication description](&v13, sel_description);
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
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  char has;
  void *v12;
  const char *v13;
  double v14;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt64NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, v8, CFSTR("participant_id_list"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v9, self->_txnId, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v20, (uint64_t)v19, v21, CFSTR("txn_id"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v5;
    goto LABEL_4;
  }
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, self->_operationFlags, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v17, (uint64_t)v16, v18, CFSTR("operation_flags"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, self->_sessionStateCounter, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v13, (uint64_t)v12, v14, CFSTR("session_state_counter"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoParticipantUpdateIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char has;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_participantIdLists.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_participantIdLists.count);
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_6;
LABEL_10:
    PBDataWriterWriteUint64Field();
    v4 = v7;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  v4 = v7;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_10;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    v4 = v7;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  const char *v19;
  double v20;
  char has;
  id v22;

  v22 = a3;
  if (objc_msgSend_participantIdListsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearParticipantIdLists(v22, v7, v8, v9);
    v13 = objc_msgSend_participantIdListsCount(self, v10, v11, v12);
    if (v13)
    {
      v16 = v13;
      for (i = 0; i != v16; ++i)
      {
        v18 = objc_msgSend_participantIdListAtIndex_(self, v14, i, v15);
        objc_msgSend_addParticipantIdList_(v22, v19, v18, v20);
      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
LABEL_11:
    *((_QWORD *)v22 + 4) = self->_txnId;
    *((_BYTE *)v22 + 48) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_DWORD *)v22 + 10) = self->_operationFlags;
  *((_BYTE *)v22 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v22 + 11) = self->_sessionStateCounter;
    *((_BYTE *)v22 + 48) |= 4u;
  }
LABEL_9:

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
  char has;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  PBRepeatedUInt64Copy();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v12 + 32) = self->_txnId;
    *(_BYTE *)(v12 + 48) |= 1u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v12;
    goto LABEL_4;
  }
  *(_DWORD *)(v12 + 40) = self->_operationFlags;
  *(_BYTE *)(v12 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v12 + 44) = self->_sessionStateCounter;
    *(_BYTE *)(v12 + 48) |= 4u;
  }
  return (id)v12;
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
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) || !PBRepeatedUInt64IsEqual())
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_operationFlags != *((_DWORD *)v4 + 10))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_txnId != *((_QWORD *)v4 + 4))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_17;
  }
  v8 = (*((_BYTE *)v4 + 48) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_sessionStateCounter != *((_DWORD *)v4 + 11))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = PBRepeatedUInt64Hash();
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v4 = 2654435761 * self->_operationFlags;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761u * self->_txnId;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v6 = 2654435761 * self->_sessionStateCounter;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  const char *v13;
  double v14;
  char v15;
  id v16;

  v16 = a3;
  v7 = objc_msgSend_participantIdListsCount(v16, v4, v5, v6);
  if (v7)
  {
    v10 = v7;
    for (i = 0; i != v10; ++i)
    {
      v12 = objc_msgSend_participantIdListAtIndex_(v16, v8, i, v9);
      objc_msgSend_addParticipantIdList_(self, v13, v12, v14);
    }
  }
  v15 = *((_BYTE *)v16 + 48);
  if ((v15 & 2) == 0)
  {
    if ((*((_BYTE *)v16 + 48) & 1) == 0)
      goto LABEL_6;
LABEL_10:
    self->_txnId = *((_QWORD *)v16 + 4);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v16 + 48) & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  self->_operationFlags = *((_DWORD *)v16 + 10);
  *(_BYTE *)&self->_has |= 2u;
  v15 = *((_BYTE *)v16 + 48);
  if ((v15 & 1) != 0)
    goto LABEL_10;
LABEL_6:
  if ((v15 & 4) != 0)
  {
LABEL_7:
    self->_sessionStateCounter = *((_DWORD *)v16 + 11);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_8:

}

- (unsigned)operationFlags
{
  return self->_operationFlags;
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (unsigned)sessionStateCounter
{
  return self->_sessionStateCounter;
}

@end
