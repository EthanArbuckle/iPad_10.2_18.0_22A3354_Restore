@implementation IDSQRProtoPeerPublishedStream

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoPeerPublishedStream;
  -[IDSQRProtoPeerPublishedStream dealloc](&v3, sel_dealloc);
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
  v13.super_class = (Class)IDSQRProtoPeerPublishedStream;
  -[IDSQRProtoPeerPublishedStream description](&v13, sel_description);
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
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v5, self->_peerParticipantId, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, v10, CFSTR("peer_participant_id"));

  }
  PBRepeatedUInt32NSArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, v13, CFSTR("peer_stream_ids"));

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPeerPublishedStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_peerStreamIds;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v7;
  }
  p_peerStreamIds = &self->_peerStreamIds;
  if (p_peerStreamIds->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v7;
      ++v6;
    }
    while (v6 < p_peerStreamIds->count);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  const char *v20;
  double v21;
  id v22;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_peerParticipantId;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v22 = v4;
  if (objc_msgSend_peerStreamIdsCount(self, v5, v6, v7))
  {
    objc_msgSend_clearPeerStreamIds(v22, v8, v9, v10);
    v14 = objc_msgSend_peerStreamIdsCount(self, v11, v12, v13);
    if (v14)
    {
      v17 = v14;
      for (i = 0; i != v17; ++i)
      {
        v19 = objc_msgSend_peerStreamIdsAtIndex_(self, v15, i, v16);
        objc_msgSend_addPeerStreamIds_(v22, v20, v19, v21);
      }
    }
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
  void *v13;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v13 = (void *)v12;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v12 + 32) = self->_peerParticipantId;
    *(_BYTE *)(v12 + 40) |= 1u;
  }
  PBRepeatedUInt32Copy();
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  char IsEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_8;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_peerParticipantId != *((_QWORD *)v4 + 4))
      goto LABEL_8;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_8:
    IsEqual = 0;
    goto LABEL_9;
  }
  IsEqual = PBRepeatedUInt32IsEqual();
LABEL_9:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_peerParticipantId;
  else
    v2 = 0;
  return PBRepeatedUInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
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
  id v16;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_peerParticipantId = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v16 = v4;
  v8 = objc_msgSend_peerStreamIdsCount(v4, v5, v6, v7);
  if (v8)
  {
    v11 = v8;
    for (i = 0; i != v11; ++i)
    {
      v13 = objc_msgSend_peerStreamIdsAtIndex_(v16, v9, i, v10);
      objc_msgSend_addPeerStreamIds_(self, v14, v13, v15);
    }
  }

}

- (unint64_t)peerParticipantId
{
  return self->_peerParticipantId;
}

@end
