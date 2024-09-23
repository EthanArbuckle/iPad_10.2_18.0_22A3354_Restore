@implementation IDSQRProtoSessionInfoRequest

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoSessionInfoRequest;
  -[IDSQRProtoSessionInfoRequest dealloc](&v3, sel_dealloc);
}

- (unint64_t)publishedStreamIdsCount
{
  return self->_publishedStreamIds.count;
}

- (unsigned)publishedStreamIds
{
  return self->_publishedStreamIds.list;
}

- (void)clearPublishedStreamIds
{
  PBRepeatedUInt32Clear();
}

- (void)addPublishedStreamIds:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)publishedStreamIdsAtIndex:(unint64_t)a3
{
  double v3;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_publishedStreamIds;
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

  p_publishedStreamIds = &self->_publishedStreamIds;
  count = self->_publishedStreamIds.count;
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
  return p_publishedStreamIds->list[a3];
}

- (void)setPublishedStreamIds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)clearSubscribedStreams
{
  uint64_t v2;
  double v3;

  objc_msgSend_removeAllObjects(self->_subscribedStreams, a2, v2, v3);
}

- (void)addSubscribedStreams:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *subscribedStreams;
  NSMutableArray *v7;
  NSMutableArray *v8;
  char *v9;

  v4 = (const char *)a3;
  subscribedStreams = self->_subscribedStreams;
  v9 = (char *)v4;
  if (!subscribedStreams)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = self->_subscribedStreams;
    self->_subscribedStreams = v7;

    v4 = v9;
    subscribedStreams = self->_subscribedStreams;
  }
  objc_msgSend_addObject_(subscribedStreams, v4, (uint64_t)v4, v5);

}

- (unint64_t)subscribedStreamsCount
{
  uint64_t v2;
  double v3;

  return objc_msgSend_count(self->_subscribedStreams, a2, v2, v3);
}

- (id)subscribedStreamsAtIndex:(unint64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndex_(self->_subscribedStreams, a2, a3, v3);
}

+ (Class)subscribedStreamsType
{
  return (Class)objc_opt_class();
}

- (void)setAllWildcardSubscription:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_allWildcardSubscription = a3;
}

- (void)setHasAllWildcardSubscription:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAllWildcardSubscription
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setMaxConcurrentStreams:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_maxConcurrentStreams = a3;
}

- (void)setHasMaxConcurrentStreams:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMaxConcurrentStreams
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setLinkId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_linkId = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLinkId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRequestId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_requestId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasRequestId
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v13.super_class = (Class)IDSQRProtoSessionInfoRequest;
  -[IDSQRProtoSessionInfoRequest description](&v13, sel_description);
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
  uint64_t v10;
  double v11;
  const char *v12;
  double v13;
  id v14;
  const char *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  const char *v19;
  double v20;
  void *v21;
  NSMutableArray *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  char has;
  void *v38;
  const char *v39;
  double v40;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  void *v54;
  const char *v55;
  double v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, v8, CFSTR("published_stream_ids"));

  if (objc_msgSend_count(self->_subscribedStreams, v9, v10, v11))
  {
    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v18 = objc_msgSend_count(self->_subscribedStreams, v15, v16, v17);
    v21 = (void *)objc_msgSend_initWithCapacity_(v14, v19, v18, v20);
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v22 = self->_subscribedStreams;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v57, v24, v61, 16);
    if (v25)
    {
      v29 = v25;
      v30 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v58 != v30)
            objc_enumerationMutation(v22);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v57 + 1) + 8 * i), v26, v27, v28, (_QWORD)v57);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v21, v33, (uint64_t)v32, v34);

        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v26, (uint64_t)&v57, v28, v61, 16);
      }
      while (v29);
    }

    objc_msgSend_setObject_forKey_(v5, v35, (uint64_t)v21, v36, CFSTR("subscribed_streams"));
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v12, self->_allWildcardSubscription, v13);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v43, (uint64_t)v42, v44, CFSTR("all_wildcard_subscription"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_12:
      if ((has & 4) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v12, self->_maxConcurrentStreams, v13, (_QWORD)v57);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v46, (uint64_t)v45, v47, CFSTR("max_concurrent_streams"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0)
      goto LABEL_14;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v12, self->_linkId, v13, (_QWORD)v57);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v49, (uint64_t)v48, v50, CFSTR("link_id"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 1) == 0)
      goto LABEL_15;
LABEL_22:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v12, self->_commandFlags, v13, (_QWORD)v57);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v55, (uint64_t)v54, v56, CFSTR("command_flags"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v5;
    goto LABEL_16;
  }
LABEL_21:
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v12, self->_requestId, v13, (_QWORD)v57);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v5, v52, (uint64_t)v51, v53, CFSTR("request_id"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_22;
LABEL_15:
  if ((has & 2) != 0)
  {
LABEL_16:
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v12, self->_generationCounter, v13, (_QWORD)v57);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v39, (uint64_t)v38, v40, CFSTR("generation_counter"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionInfoRequestReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  NSMutableArray *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const char *v13;
  double v14;
  char has;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_publishedStreamIds.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_publishedStreamIds.count);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_subscribedStreams;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v8, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v13, (uint64_t)&v16, v14, v20, 16);
    }
    while (v10);
  }

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 1) == 0)
      goto LABEL_16;
LABEL_23:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_23;
LABEL_16:
  if ((has & 2) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:

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
  uint64_t v16;
  const char *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  const char *v31;
  double v32;
  char has;
  id v34;

  v34 = a3;
  if (objc_msgSend_publishedStreamIdsCount(self, v4, v5, v6))
  {
    objc_msgSend_clearPublishedStreamIds(v34, v7, v8, v9);
    v13 = objc_msgSend_publishedStreamIdsCount(self, v10, v11, v12);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        v16 = objc_msgSend_publishedStreamIdsAtIndex_(self, v7, i, v9);
        objc_msgSend_addPublishedStreamIds_(v34, v17, v16, v18);
      }
    }
  }
  if (objc_msgSend_subscribedStreamsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearSubscribedStreams(v34, v19, v20, v21);
    v25 = objc_msgSend_subscribedStreamsCount(self, v22, v23, v24);
    if (v25)
    {
      v28 = v25;
      for (j = 0; j != v28; ++j)
      {
        objc_msgSend_subscribedStreamsAtIndex_(self, v26, j, v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addSubscribedStreams_(v34, v31, (uint64_t)v30, v32);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v34 + 64) = self->_allWildcardSubscription;
    *((_BYTE *)v34 + 68) |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_11:
      if ((has & 4) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v34 + 11) = self->_maxConcurrentStreams;
  *((_BYTE *)v34 + 68) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v34 + 10) = self->_linkId;
  *((_BYTE *)v34 + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      goto LABEL_14;
LABEL_21:
    *((_DWORD *)v34 + 8) = self->_commandFlags;
    *((_BYTE *)v34 + 68) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_20:
  *((_DWORD *)v34 + 12) = self->_requestId;
  *((_BYTE *)v34 + 68) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_21;
LABEL_14:
  if ((has & 2) != 0)
  {
LABEL_15:
    *((_DWORD *)v34 + 9) = self->_generationCounter;
    *((_BYTE *)v34 + 68) |= 2u;
  }
LABEL_16:

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
  PBRepeatedUInt32Copy();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = self->_subscribedStreams;
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
        objc_msgSend_addSubscribedStreams_((void *)v12, v23, (uint64_t)v22, v24);

      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v17, (uint64_t)&v27, v18, v31, 16);
    }
    while (v19);
  }

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v12 + 64) = self->_allWildcardSubscription;
    *(_BYTE *)(v12 + 68) |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_10:
      if ((has & 4) == 0)
        goto LABEL_11;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v12 + 44) = self->_maxConcurrentStreams;
  *(_BYTE *)(v12 + 68) |= 8u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v12 + 40) = self->_linkId;
  *(_BYTE *)(v12 + 68) |= 4u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 1) == 0)
      goto LABEL_13;
LABEL_20:
    *(_DWORD *)(v12 + 32) = self->_commandFlags;
    *(_BYTE *)(v12 + 68) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return (id)v12;
    goto LABEL_14;
  }
LABEL_19:
  *(_DWORD *)(v12 + 48) = self->_requestId;
  *(_BYTE *)(v12 + 68) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_20;
LABEL_13:
  if ((has & 2) != 0)
  {
LABEL_14:
    *(_DWORD *)(v12 + 36) = self->_generationCounter;
    *(_BYTE *)(v12 + 68) |= 2u;
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
  NSMutableArray *subscribedStreams;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    goto LABEL_37;
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_37;
  subscribedStreams = self->_subscribedStreams;
  v11 = v4[7];
  if ((unint64_t)subscribedStreams | v11)
  {
    if (!objc_msgSend_isEqual_(subscribedStreams, v8, v11, v9))
      goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
    {
      if (self->_allWildcardSubscription)
      {
        if (!*((_BYTE *)v4 + 64))
          goto LABEL_37;
        goto LABEL_13;
      }
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_13;
    }
LABEL_37:
    v12 = 0;
    goto LABEL_38;
  }
  if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
    goto LABEL_37;
LABEL_13:
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_maxConcurrentStreams != *((_DWORD *)v4 + 11))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_linkId != *((_DWORD *)v4 + 10))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_requestId != *((_DWORD *)v4 + 12))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_37;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_commandFlags != *((_DWORD *)v4 + 8))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_37;
  }
  v12 = (*((_BYTE *)v4 + 68) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_generationCounter != *((_DWORD *)v4 + 9))
      goto LABEL_37;
    v12 = 1;
  }
LABEL_38:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = PBRepeatedUInt32Hash();
  v7 = objc_msgSend_hash(self->_subscribedStreams, v4, v5, v6);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v8 = 2654435761 * self->_allWildcardSubscription;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v9 = 2654435761 * self->_maxConcurrentStreams;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v10 = 2654435761 * self->_linkId;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v11 = 2654435761 * self->_requestId;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_12:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_7;
LABEL_13:
    v13 = 0;
    return v7 ^ v3 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_11:
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_6:
  v12 = 2654435761 * self->_commandFlags;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_13;
LABEL_7:
  v13 = 2654435761 * self->_generationCounter;
  return v7 ^ v3 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
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
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_publishedStreamIdsCount(v4, v5, v6, v7);
  if (v8)
  {
    v11 = v8;
    for (i = 0; i != v11; ++i)
    {
      v13 = objc_msgSend_publishedStreamIdsAtIndex_(v4, v9, i, v10);
      objc_msgSend_addPublishedStreamIds_(self, v14, v13, v15);
    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = *((id *)v4 + 7);
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v26, v18, v30, 16);
  if (v19)
  {
    v22 = v19;
    v23 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v16);
        objc_msgSend_addSubscribedStreams_(self, v20, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), v21, (_QWORD)v26);
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v20, (uint64_t)&v26, v21, v30, 16);
    }
    while (v22);
  }

  v25 = *((_BYTE *)v4 + 68);
  if ((v25 & 0x20) != 0)
  {
    self->_allWildcardSubscription = *((_BYTE *)v4 + 64);
    *(_BYTE *)&self->_has |= 0x20u;
    v25 = *((_BYTE *)v4 + 68);
    if ((v25 & 8) == 0)
    {
LABEL_13:
      if ((v25 & 4) == 0)
        goto LABEL_14;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)v4 + 68) & 8) == 0)
  {
    goto LABEL_13;
  }
  self->_maxConcurrentStreams = *((_DWORD *)v4 + 11);
  *(_BYTE *)&self->_has |= 8u;
  v25 = *((_BYTE *)v4 + 68);
  if ((v25 & 4) == 0)
  {
LABEL_14:
    if ((v25 & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_22;
  }
LABEL_21:
  self->_linkId = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 4u;
  v25 = *((_BYTE *)v4 + 68);
  if ((v25 & 0x10) == 0)
  {
LABEL_15:
    if ((v25 & 1) == 0)
      goto LABEL_16;
LABEL_23:
    self->_commandFlags = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 68) & 2) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_22:
  self->_requestId = *((_DWORD *)v4 + 12);
  *(_BYTE *)&self->_has |= 0x10u;
  v25 = *((_BYTE *)v4 + 68);
  if ((v25 & 1) != 0)
    goto LABEL_23;
LABEL_16:
  if ((v25 & 2) != 0)
  {
LABEL_17:
    self->_generationCounter = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_18:

}

- (NSMutableArray)subscribedStreams
{
  return self->_subscribedStreams;
}

- (void)setSubscribedStreams:(id)a3
{
  objc_storeStrong((id *)&self->_subscribedStreams, a3);
}

- (BOOL)allWildcardSubscription
{
  return self->_allWildcardSubscription;
}

- (unsigned)maxConcurrentStreams
{
  return self->_maxConcurrentStreams;
}

- (unsigned)linkId
{
  return self->_linkId;
}

- (unsigned)requestId
{
  return self->_requestId;
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
  objc_storeStrong((id *)&self->_subscribedStreams, 0);
}

@end
