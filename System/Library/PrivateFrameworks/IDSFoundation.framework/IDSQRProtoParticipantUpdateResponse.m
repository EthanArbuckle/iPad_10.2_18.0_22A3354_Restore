@implementation IDSQRProtoParticipantUpdateResponse

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoParticipantUpdateResponse;
  -[IDSQRProtoParticipantUpdateResponse dealloc](&v3, sel_dealloc);
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

- (void)setSessionStateCounter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionStateCounter = a3;
}

- (void)setHasSessionStateCounter:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionStateCounter
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
  v13.super_class = (Class)IDSQRProtoParticipantUpdateResponse;
  -[IDSQRProtoParticipantUpdateResponse description](&v13, sel_description);
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
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v6, self->_operationFlags, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, CFSTR("operation_flags"));

  PBRepeatedUInt64NSArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v12, (uint64_t)v11, v13, CFSTR("participant_id_list"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v14, self->_sessionStateCounter, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v17, (uint64_t)v16, v18, CFSTR("session_state_counter"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoParticipantUpdateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_participantIdLists.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v4;
    }
    while (v4 < self->_participantIdLists.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();

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
  _DWORD *v21;

  v21 = a3;
  v21[8] = self->_operationFlags;
  if (objc_msgSend_participantIdListsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearParticipantIdLists(v21, v7, v8, v9);
    v13 = objc_msgSend_participantIdListsCount(self, v10, v11, v12);
    if (v13)
    {
      v16 = v13;
      for (i = 0; i != v16; ++i)
      {
        v18 = objc_msgSend_participantIdListAtIndex_(self, v14, i, v15);
        objc_msgSend_addParticipantIdList_(v21, v19, v18, v20);
      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v21[9] = self->_sessionStateCounter;
    *((_BYTE *)v21 + 40) |= 1u;
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

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 32) = self->_operationFlags;
  PBRepeatedUInt64Copy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v12 + 36) = self->_sessionStateCounter;
    *(_BYTE *)(v12 + 40) |= 1u;
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
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    || self->_operationFlags != *((_DWORD *)v4 + 8)
    || !PBRepeatedUInt64IsEqual())
  {
    goto LABEL_8;
  }
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) != 0 && self->_sessionStateCounter == *((_DWORD *)v4 + 9))
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
  unsigned int operationFlags;
  uint64_t v4;
  uint64_t v5;

  operationFlags = self->_operationFlags;
  v4 = PBRepeatedUInt64Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_sessionStateCounter;
  else
    v5 = 0;
  return (2654435761 * operationFlags) ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  const char *v14;
  double v15;
  unsigned int *v16;

  v4 = (unsigned int *)a3;
  self->_operationFlags = v4[8];
  v16 = v4;
  v8 = objc_msgSend_participantIdListsCount(v4, v5, v6, v7);
  if (v8)
  {
    v11 = v8;
    for (i = 0; i != v11; ++i)
    {
      v13 = objc_msgSend_participantIdListAtIndex_(v16, v9, i, v10);
      objc_msgSend_addParticipantIdList_(self, v14, v13, v15);
    }
  }
  if ((v16[10] & 1) != 0)
  {
    self->_sessionStateCounter = v16[9];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)operationFlags
{
  return self->_operationFlags;
}

- (void)setOperationFlags:(unsigned int)a3
{
  self->_operationFlags = a3;
}

- (unsigned)sessionStateCounter
{
  return self->_sessionStateCounter;
}

@end
