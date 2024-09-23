@implementation IDSQRProtoSubscribedStream

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoSubscribedStream;
  -[IDSQRProtoSubscribedStream dealloc](&v3, sel_dealloc);
}

- (void)setWildcardSubscription:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_wildcardSubscription = a3;
}

- (void)setHasWildcardSubscription:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWildcardSubscription
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPeerParticipantId:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_peerParticipantId = a3;
}

- (void)setHasPeerParticipantId:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPeerParticipantId
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)peerStreamIdsCount
{
  return self->_peerStreamIds.count;
}

- (unsigned)peerStreamIds
{
  return self->_peerStreamIds.list;
}

- (void)clearPeerStreamIds
{
  PBRepeatedUInt32Clear();
}

- (void)addPeerStreamIds:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)peerStreamIdsAtIndex:(unint64_t)a3
{
  double v3;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_peerStreamIds;
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

  p_peerStreamIds = &self->_peerStreamIds;
  count = self->_peerStreamIds.count;
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
  return p_peerStreamIds->list[a3];
}

- (void)setPeerStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setIsSeamlessTransition:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isSeamlessTransition = a3;
}

- (void)setHasIsSeamlessTransition:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsSeamlessTransition
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v13.super_class = (Class)IDSQRProtoSubscribedStream;
  -[IDSQRProtoSubscribedStream description](&v13, sel_description);
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
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v5, self->_wildcardSubscription, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, v11, CFSTR("wildcard_subscription"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_peerParticipantId, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, v14, CFSTR("peer_participant_id"));

  }
  PBRepeatedUInt32NSArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, v17, CFSTR("peer_stream_ids"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v18, self->_isSeamlessTransition, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, v22, CFSTR("is_seamless_transition"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSubscribedStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  id v7;

  v4 = a3;
  has = (char)self->_has;
  v7 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
  }
  if (self->_peerStreamIds.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < self->_peerStreamIds.count);
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  char has;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  const char *v21;
  double v22;
  _BYTE *v23;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[41] = self->_wildcardSubscription;
    v4[44] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 4) = self->_peerParticipantId;
    v4[44] |= 1u;
  }
  v23 = v4;
  if (objc_msgSend_peerStreamIdsCount(self, v5, v6, v7))
  {
    objc_msgSend_clearPeerStreamIds(v23, v9, v10, v11);
    v15 = objc_msgSend_peerStreamIdsCount(self, v12, v13, v14);
    if (v15)
    {
      v18 = v15;
      for (i = 0; i != v18; ++i)
      {
        v20 = objc_msgSend_peerStreamIdsAtIndex_(self, v16, i, v17);
        objc_msgSend_addPeerStreamIds_(v23, v21, v20, v22);
      }
    }
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v23[40] = self->_isSeamlessTransition;
    v23[44] |= 2u;
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
  _BYTE *v13;
  char has;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v13 = (_BYTE *)v12;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v12 + 41) = self->_wildcardSubscription;
    *(_BYTE *)(v12 + 44) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v12 + 32) = self->_peerParticipantId;
    *(_BYTE *)(v12 + 44) |= 1u;
  }
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v13[40] = self->_isSeamlessTransition;
    v13[44] |= 2u;
  }
  return v13;
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
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0)
      goto LABEL_18;
    if (self->_wildcardSubscription)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_18;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_peerParticipantId != *((_QWORD *)v4 + 4))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_18;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  v8 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_isSeamlessTransition)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_18;
      }
      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_18;
      }
      v8 = 1;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_wildcardSubscription;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761u * self->_peerParticipantId;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_isSeamlessTransition;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  char v8;
  uint64_t v9;
  const char *v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;
  double v16;
  BOOL *v17;

  v4 = a3;
  v8 = *((_BYTE *)v4 + 44);
  if ((v8 & 4) != 0)
  {
    self->_wildcardSubscription = *((_BYTE *)v4 + 41);
    *(_BYTE *)&self->_has |= 4u;
    v8 = *((_BYTE *)v4 + 44);
  }
  if ((v8 & 1) != 0)
  {
    self->_peerParticipantId = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  v17 = (BOOL *)v4;
  v9 = objc_msgSend_peerStreamIdsCount(v4, v5, v6, v7);
  if (v9)
  {
    v12 = v9;
    for (i = 0; i != v12; ++i)
    {
      v14 = objc_msgSend_peerStreamIdsAtIndex_(v17, v10, i, v11);
      objc_msgSend_addPeerStreamIds_(self, v15, v14, v16);
    }
  }
  if ((v17[44] & 2) != 0)
  {
    self->_isSeamlessTransition = v17[40];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (BOOL)wildcardSubscription
{
  return self->_wildcardSubscription;
}

- (unint64_t)peerParticipantId
{
  return self->_peerParticipantId;
}

- (BOOL)isSeamlessTransition
{
  return self->_isSeamlessTransition;
}

@end
