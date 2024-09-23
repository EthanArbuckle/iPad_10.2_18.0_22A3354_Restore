@implementation IDSQRProtoSessionInfoResponse

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoSessionInfoResponse;
  -[IDSQRProtoSessionInfoResponse dealloc](&v3, sel_dealloc);
}

- (void)clearPeerPublishedStreams
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_peerPublishedStreams, a2, v2, v3);
}

- (void)addPeerPublishedStreams:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *peerPublishedStreams;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  peerPublishedStreams = self->_peerPublishedStreams;
  v9 = (char *)v4;
  if (!peerPublishedStreams)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_peerPublishedStreams;
    self->_peerPublishedStreams = v7;

    v4 = v9;
    peerPublishedStreams = self->_peerPublishedStreams;
  }
  objc_msgSend_addObject_(peerPublishedStreams, v4, (uint64_t)v4, v5);

}

- (unint64_t)peerPublishedStreamsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_peerPublishedStreams, a2, v2, v3);
}

- (id)peerPublishedStreamsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_peerPublishedStreams, a2, a3, v3);
}

+ (Class)peerPublishedStreamsType
{
  return (Class)objc_opt_class();
}

- (unint64_t)peerSubscribedStreamIdsCount
{
  return self->_peerSubscribedStreamIds.count;
}

- (unsigned)peerSubscribedStreamIds
{
  return self->_peerSubscribedStreamIds.list;
}

- (void)clearPeerSubscribedStreamIds
{
  PBRepeatedUInt32Clear();
}

- (void)addPeerSubscribedStreamIds:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)peerSubscribedStreamIdsAtIndex:(unint64_t)a3
{
  double v3;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_peerSubscribedStreamIds;
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

  p_peerSubscribedStreamIds = &self->_peerSubscribedStreamIds;
  count = self->_peerSubscribedStreamIds.count;
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
  return p_peerSubscribedStreamIds->list[a3];
}

- (void)setPeerSubscribedStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)lightweightParticipantIdListsCount
{
  return self->_lightweightParticipantIdLists.count;
}

- (unint64_t)lightweightParticipantIdLists
{
  return self->_lightweightParticipantIdLists.list;
}

- (void)clearLightweightParticipantIdLists
{
  PBRepeatedUInt64Clear();
}

- (void)addLightweightParticipantIdList:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)lightweightParticipantIdListAtIndex:(unint64_t)a3
{
  double v3;
  $D9041E0417540B7714261C3B5E8BB314 *p_lightweightParticipantIdLists;
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

  p_lightweightParticipantIdLists = &self->_lightweightParticipantIdLists;
  count = self->_lightweightParticipantIdLists.count;
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
  return p_lightweightParticipantIdLists->list[a3];
}

- (void)setLightweightParticipantIdLists:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (void)setCommandFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_commandFlags = a3;
}

- (void)setHasCommandFlags:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommandFlags
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setGenerationCounter:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_generationCounter = a3;
}

- (void)setHasGenerationCounter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenerationCounter
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
  v13.super_class = (Class)IDSQRProtoSessionInfoResponse;
  -[IDSQRProtoSessionInfoResponse description](&v13, sel_description);
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
  uint64_t v7;
  double v8;
  id v9;
  const char *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  NSMutableArray *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  const char *v38;
  double v39;
  char has;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(self->_peerPublishedStreams, v6, v7, v8))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v13 = objc_msgSend_count(self->_peerPublishedStreams, v10, v11, v12);
    v16 = (void *)objc_msgSend_initWithCapacity_(v9, v14, v13, v15);
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v17 = self->_peerPublishedStreams;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v48, v19, v52, 16);
    if (v20)
    {
      v24 = v20;
      v25 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v49 != v25)
            objc_enumerationMutation(v17);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v48 + 1) + 8 * i), v21, v22, v23, (_QWORD)v48);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v16, v28, (uint64_t)v27, v29);

        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v48, v23, v52, 16);
      }
      while (v24);
    }

    objc_msgSend_setObject_forKey_(v5, v30, (uint64_t)v16, v31, CFSTR("peer_published_streams"));
  }
  PBRepeatedUInt32NSArray();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v33, (uint64_t)v32, v34, CFSTR("peer_subscribed_stream_ids"));

  PBRepeatedUInt64NSArray();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v36, (uint64_t)v35, v37, CFSTR("lightweight_participant_id_list"));

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v38, self->_commandFlags, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v42, (uint64_t)v41, v43, CFSTR("command_flags"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v38, self->_generationCounter, v39);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v45, (uint64_t)v44, v46, CFSTR("generation_counter"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionInfoResponseReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  char has;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_peerPublishedStreams;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v17, v7, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v12, (uint64_t)&v17, v13, v21, 16);
    }
    while (v9);
  }

  if (self->_peerSubscribedStreamIds.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v14;
    }
    while (v14 < self->_peerSubscribedStreamIds.count);
  }
  if (self->_lightweightParticipantIdLists.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v15;
    }
    while (v15 < self->_lightweightParticipantIdLists.count);
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
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
  uint64_t v14;
  uint64_t i;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  const char *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  double v33;
  const char *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  const char *v43;
  double v44;
  char has;
  id v46;

  v46 = a3;
  if (objc_msgSend_peerPublishedStreamsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearPeerPublishedStreams(v46, v7, v8, v9);
    v13 = objc_msgSend_peerPublishedStreamsCount(self, v10, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        objc_msgSend_peerPublishedStreamsAtIndex_(self, v7, i, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPeerPublishedStreams_(v46, v17, (uint64_t)v16, v18);

      }
    }
  }
  if (objc_msgSend_peerSubscribedStreamIdsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearPeerSubscribedStreamIds(v46, v19, v20, v21);
    v25 = objc_msgSend_peerSubscribedStreamIdsCount(self, v22, v23, v24);
    if (v25)
    {
      v26 = v25;
      for (j = 0; j != v26; ++j)
      {
        v28 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(self, v19, j, v21);
        objc_msgSend_addPeerSubscribedStreamIds_(v46, v29, v28, v30);
      }
    }
  }
  if (objc_msgSend_lightweightParticipantIdListsCount(self, v19, v20, v21))
  {
    objc_msgSend_clearLightweightParticipantIdLists(v46, v31, v32, v33);
    v37 = objc_msgSend_lightweightParticipantIdListsCount(self, v34, v35, v36);
    if (v37)
    {
      v40 = v37;
      for (k = 0; k != v40; ++k)
      {
        v42 = objc_msgSend_lightweightParticipantIdListAtIndex_(self, v38, k, v39);
        objc_msgSend_addLightweightParticipantIdList_(v46, v43, v42, v44);
      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v46 + 14) = self->_commandFlags;
    *((_BYTE *)v46 + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v46 + 15) = self->_generationCounter;
    *((_BYTE *)v46 + 72) |= 2u;
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
  NSMutableArray *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  const char *v23;
  double v24;
  char has;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = self->_peerPublishedStreams;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, v15, v31, 16);
  if (v16)
  {
    v19 = v16;
    v20 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v13);
        v22 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i), v17, (uint64_t)a3, v18, (_QWORD)v27);
        objc_msgSend_addPeerPublishedStreams_((void *)v12, v23, (uint64_t)v22, v24);

      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v27, v18, v31, 16);
    }
    while (v19);
  }

  PBRepeatedUInt32Copy();
  PBRepeatedUInt64Copy();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v12 + 56) = self->_commandFlags;
    *(_BYTE *)(v12 + 72) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v12 + 60) = self->_generationCounter;
    *(_BYTE *)(v12 + 72) |= 2u;
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
  NSMutableArray *peerPublishedStreams;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_15;
  peerPublishedStreams = self->_peerPublishedStreams;
  v11 = v4[8];
  if ((unint64_t)peerPublishedStreams | v11)
  {
    if (!objc_msgSend_isEqual_(peerPublishedStreams, v8, v11, v9))
      goto LABEL_15;
  }
  if (!PBRepeatedUInt32IsEqual() || !PBRepeatedUInt64IsEqual())
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[9] & 1) == 0 || self->_commandFlags != *((_DWORD *)v4 + 14))
      goto LABEL_15;
  }
  else if ((v4[9] & 1) != 0)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v12 = (v4[9] & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[9] & 2) == 0 || self->_generationCounter != *((_DWORD *)v4 + 15))
      goto LABEL_15;
    v12 = 1;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = objc_msgSend_hash(self->_peerPublishedStreams, a2, v2, v3);
  v6 = PBRepeatedUInt32Hash();
  v7 = PBRepeatedUInt64Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_commandFlags;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return v6 ^ v5 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_generationCounter;
  return v6 ^ v5 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  const char *v24;
  double v25;
  uint64_t v26;
  const char *v27;
  double v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  const char *v32;
  double v33;
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = *((id *)v4 + 8);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v35, v7, v39, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend_addPeerPublishedStreams_(self, v9, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v10, (_QWORD)v35);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v35, v10, v39, 16);
    }
    while (v11);
  }

  v17 = objc_msgSend_peerSubscribedStreamIdsCount(v4, v14, v15, v16);
  if (v17)
  {
    v21 = v17;
    for (j = 0; j != v21; ++j)
    {
      v23 = objc_msgSend_peerSubscribedStreamIdsAtIndex_(v4, v18, j, v20, (_QWORD)v35);
      objc_msgSend_addPeerSubscribedStreamIds_(self, v24, v23, v25);
    }
  }
  v26 = objc_msgSend_lightweightParticipantIdListsCount(v4, v18, v19, v20, (_QWORD)v35);
  if (v26)
  {
    v29 = v26;
    for (k = 0; k != v29; ++k)
    {
      v31 = objc_msgSend_lightweightParticipantIdListAtIndex_(v4, v27, k, v28);
      objc_msgSend_addLightweightParticipantIdList_(self, v32, v31, v33);
    }
  }
  v34 = *((_BYTE *)v4 + 72);
  if ((v34 & 1) != 0)
  {
    self->_commandFlags = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
    v34 = *((_BYTE *)v4 + 72);
  }
  if ((v34 & 2) != 0)
  {
    self->_generationCounter = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSMutableArray)peerPublishedStreams
{
  return self->_peerPublishedStreams;
}

- (void)setPeerPublishedStreams:(id)a3
{
  objc_storeStrong((id *)&self->_peerPublishedStreams, a3);
}

- (unsigned)commandFlags
{
  return self->_commandFlags;
}

- (unsigned)generationCounter
{
  return self->_generationCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPublishedStreams, 0);
}

@end
