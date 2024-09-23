@implementation CKDPNotificationSyncResponse

- (BOOL)hasChangeID
{
  return self->_changeID != 0;
}

- (void)clearPushMessages
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_pushMessages, a2, v2);
}

- (void)addPushMessage:(id)a3
{
  const char *v4;
  NSMutableArray *pushMessages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  pushMessages = self->_pushMessages;
  v8 = (char *)v4;
  if (!pushMessages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_pushMessages;
    self->_pushMessages = v6;

    v4 = v8;
    pushMessages = self->_pushMessages;
  }
  objc_msgSend_addObject_(pushMessages, v4, (uint64_t)v4);

}

- (unint64_t)pushMessagesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_pushMessages, a2, v2);
}

- (id)pushMessageAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_pushMessages, a2, a3);
}

+ (Class)pushMessageType
{
  return (Class)objc_opt_class();
}

- (void)setMoreAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_moreAvailable = a3;
}

- (void)setHasMoreAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMoreAvailable
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPNotificationSyncResponse;
  -[CKDPNotificationSyncResponse description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  NSData *changeID;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  NSMutableArray *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  changeID = self->_changeID;
  if (changeID)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)changeID, CFSTR("changeID"));
  if (objc_msgSend_count(self->_pushMessages, v5, (uint64_t)changeID))
  {
    v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v12 = objc_msgSend_count(self->_pushMessages, v10, v11);
    v14 = (void *)objc_msgSend_initWithCapacity_(v9, v13, v12);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = self->_pushMessages;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v29, v33, 16);
    if (v17)
    {
      v20 = v17;
      v21 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v15);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v18, v19, (_QWORD)v29);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23);

        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v29, v33, 16);
      }
      while (v20);
    }

    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v14, CFSTR("pushMessage"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v8, self->_moreAvailable);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, CFSTR("moreAvailable"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPNotificationSyncResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_changeID)
    PBDataWriterWriteDataField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_pushMessages;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  NSData *changeID;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  _BYTE *v16;

  v16 = a3;
  changeID = self->_changeID;
  if (changeID)
    objc_msgSend_setChangeID_(v16, v4, (uint64_t)changeID);
  if (objc_msgSend_pushMessagesCount(self, v4, (uint64_t)changeID))
  {
    objc_msgSend_clearPushMessages(v16, v6, v7);
    v10 = objc_msgSend_pushMessagesCount(self, v8, v9);
    if (v10)
    {
      v12 = v10;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_pushMessageAtIndex_(self, v11, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPushMessage_(v16, v15, (uint64_t)v14);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v16[24] = self->_moreAvailable;
    v16[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_changeID, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v12;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_pushMessages;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v24, v28, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v25;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v14);
        v21 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v24 + 1) + 8 * v20), v17, (uint64_t)a3, (_QWORD)v24);
        objc_msgSend_addPushMessage_((void *)v10, v22, (uint64_t)v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v24, v28, 16);
    }
    while (v18);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 24) = self->_moreAvailable;
    *(_BYTE *)(v10 + 28) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSData *changeID;
  uint64_t v9;
  NSMutableArray *pushMessages;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_8;
  changeID = self->_changeID;
  v9 = v4[1];
  if ((unint64_t)changeID | v9)
  {
    if (!objc_msgSend_isEqual_(changeID, v7, v9))
      goto LABEL_8;
  }
  pushMessages = self->_pushMessages;
  v11 = v4[2];
  if ((unint64_t)pushMessages | v11)
  {
    if (!objc_msgSend_isEqual_(pushMessages, v7, v11))
      goto LABEL_8;
  }
  v12 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
    if (self->_moreAvailable)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v12 = 1;
  }
LABEL_9:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend_hash(self->_changeID, a2, v2);
  v7 = objc_msgSend_hash(self->_pushMessages, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_moreAvailable;
  else
    v8 = 0;
  return v7 ^ v4 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 1);
  if (v6)
    objc_msgSend_setChangeID_(self, v4, v6);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v5 + 2);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v14, v18, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend_addPushMessage_(self, v10, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v14, v18, 16);
    }
    while (v11);
  }

  if ((*((_BYTE *)v5 + 28) & 1) != 0)
  {
    self->_moreAvailable = *((_BYTE *)v5 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSData)changeID
{
  return self->_changeID;
}

- (void)setChangeID:(id)a3
{
  objc_storeStrong((id *)&self->_changeID, a3);
}

- (NSMutableArray)pushMessages
{
  return self->_pushMessages;
}

- (void)setPushMessages:(id)a3
{
  objc_storeStrong((id *)&self->_pushMessages, a3);
}

- (BOOL)moreAvailable
{
  return self->_moreAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushMessages, 0);
  objc_storeStrong((id *)&self->_changeID, 0);
}

@end
