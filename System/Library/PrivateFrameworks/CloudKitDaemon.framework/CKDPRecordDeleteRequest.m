@implementation CKDPRecordDeleteRequest

+ (id)options
{
  if (qword_1ED7009D0 != -1)
    dispatch_once(&qword_1ED7009D0, &unk_1E7833A08);
  return (id)qword_1ED7009C8;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (void)clearPluginFields
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_pluginFields, a2, v2);
}

- (void)addPluginFields:(id)a3
{
  const char *v4;
  NSMutableArray *pluginFields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  pluginFields = self->_pluginFields;
  v8 = (char *)v4;
  if (!pluginFields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_pluginFields;
    self->_pluginFields = v6;

    v4 = v8;
    pluginFields = self->_pluginFields;
  }
  objc_msgSend_addObject_(pluginFields, v4, (uint64_t)v4);

}

- (unint64_t)pluginFieldsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_pluginFields, a2, v2);
}

- (id)pluginFieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_pluginFields, a2, a3);
}

+ (Class)pluginFieldsType
{
  return (Class)objc_opt_class();
}

- (void)setParticipantKeyLost:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_participantKeyLost = a3;
}

- (void)setHasParticipantKeyLost:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantKeyLost
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearPublicKeys
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_publicKeys, a2, v2);
}

- (void)addPublicKeys:(id)a3
{
  const char *v4;
  NSMutableArray *publicKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  publicKeys = self->_publicKeys;
  v8 = (char *)v4;
  if (!publicKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_publicKeys;
    self->_publicKeys = v6;

    v4 = v8;
    publicKeys = self->_publicKeys;
  }
  objc_msgSend_addObject_(publicKeys, v4, (uint64_t)v4);

}

- (unint64_t)publicKeysCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_publicKeys, a2, v2);
}

- (id)publicKeysAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_publicKeys, a2, a3);
}

+ (Class)publicKeysType
{
  return (Class)objc_opt_class();
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
  v11.super_class = (Class)CKDPRecordDeleteRequest;
  -[CKDPRecordDeleteRequest description](&v11, sel_description);
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
  const char *v4;
  uint64_t v5;
  void *v6;
  CKDPRecordIdentifier *recordIdentifier;
  void *v8;
  const char *v9;
  NSString *etag;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  NSMutableArray *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  NSMutableArray *publicKeys;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("recordIdentifier"));

  }
  etag = self->_etag;
  if (etag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)etag, CFSTR("etag"));
  if (objc_msgSend_count(self->_pluginFields, v4, (uint64_t)etag))
  {
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v15 = objc_msgSend_count(self->_pluginFields, v13, v14);
    v17 = (void *)objc_msgSend_initWithCapacity_(v12, v16, v15);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v18 = self->_pluginFields;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v33, v37, 16);
    if (v20)
    {
      v23 = v20;
      v24 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v18);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v33 + 1) + 8 * i), v21, v22, (_QWORD)v33);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v17, v27, (uint64_t)v26);

        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v33, v37, 16);
      }
      while (v23);
    }

    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v17, CFSTR("pluginFields"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v11, self->_participantKeyLost);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v30, (uint64_t)v29, CFSTR("participantKeyLost"));

  }
  publicKeys = self->_publicKeys;
  if (publicKeys)
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)publicKeys, CFSTR("publicKeys"));
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEB17400((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_recordIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_etag)
    PBDataWriterWriteStringField();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_pluginFields;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_publicKeys;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteDataField();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v19, v27, 16);
    }
    while (v15);
  }

}

- (unsigned)requestTypeCode
{
  return 6;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  const char *v4;
  CKDPRecordIdentifier *recordIdentifier;
  NSString *etag;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  const char *v25;
  _BYTE *v26;

  v26 = a3;
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
    objc_msgSend_setRecordIdentifier_(v26, v4, (uint64_t)recordIdentifier);
  etag = self->_etag;
  if (etag)
    objc_msgSend_setEtag_(v26, v4, (uint64_t)etag);
  if (objc_msgSend_pluginFieldsCount(self, v4, (uint64_t)etag))
  {
    objc_msgSend_clearPluginFields(v26, v7, v8);
    v11 = objc_msgSend_pluginFieldsCount(self, v9, v10);
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend_pluginFieldsAtIndex_(self, v7, i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPluginFields_(v26, v15, (uint64_t)v14);

      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v26[40] = self->_participantKeyLost;
    v26[44] |= 1u;
  }
  if (objc_msgSend_publicKeysCount(self, v7, v8))
  {
    objc_msgSend_clearPublicKeys(v26, v16, v17);
    v20 = objc_msgSend_publicKeysCount(self, v18, v19);
    if (v20)
    {
      v22 = v20;
      for (j = 0; j != v22; ++j)
      {
        objc_msgSend_publicKeysAtIndex_(self, v21, j);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPublicKeys_(v26, v25, (uint64_t)v24);

      }
    }
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
  const char *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSMutableArray *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_etag, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v15;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = self->_pluginFields;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v40, v45, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v41;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v17);
        v24 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v40 + 1) + 8 * v23), v20, (uint64_t)a3);
        objc_msgSend_addPluginFields_((void *)v10, v25, (uint64_t)v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v40, v45, 16);
    }
    while (v21);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v10 + 40) = self->_participantKeyLost;
    *(_BYTE *)(v10 + 44) |= 1u;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v26 = self->_publicKeys;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v36, v44, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v37;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v37 != v31)
          objc_enumerationMutation(v26);
        v33 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v36 + 1) + 8 * v32), v29, (uint64_t)a3, (_QWORD)v36);
        objc_msgSend_addPublicKeys_((void *)v10, v34, (uint64_t)v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v36, v44, 16);
    }
    while (v30);
  }

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v9;
  NSString *etag;
  uint64_t v11;
  NSMutableArray *pluginFields;
  uint64_t v13;
  char isEqual;
  NSMutableArray *publicKeys;
  uint64_t v17;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_12;
  recordIdentifier = self->_recordIdentifier;
  v9 = v4[4];
  if ((unint64_t)recordIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(recordIdentifier, v7, v9))
      goto LABEL_12;
  }
  etag = self->_etag;
  v11 = v4[1];
  if ((unint64_t)etag | v11)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v11))
      goto LABEL_12;
  }
  pluginFields = self->_pluginFields;
  v13 = v4[2];
  if ((unint64_t)pluginFields | v13)
  {
    if (!objc_msgSend_isEqual_(pluginFields, v7, v13))
      goto LABEL_12;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) != 0)
    {
      if (self->_participantKeyLost)
      {
        if (*((_BYTE *)v4 + 40))
          goto LABEL_18;
      }
      else if (!*((_BYTE *)v4 + 40))
      {
        goto LABEL_18;
      }
    }
LABEL_12:
    isEqual = 0;
    goto LABEL_13;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
    goto LABEL_12;
LABEL_18:
  publicKeys = self->_publicKeys;
  v17 = v4[3];
  if ((unint64_t)publicKeys | v17)
    isEqual = objc_msgSend_isEqual_(publicKeys, v7, v17);
  else
    isEqual = 1;
LABEL_13:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  v7 = objc_msgSend_hash(self->_etag, v5, v6);
  v10 = objc_msgSend_hash(self->_pluginFields, v8, v9);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v13 = 2654435761 * self->_participantKeyLost;
  else
    v13 = 0;
  return v7 ^ v4 ^ v10 ^ v13 ^ objc_msgSend_hash(self->_publicKeys, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  recordIdentifier = self->_recordIdentifier;
  v7 = *((_QWORD *)v5 + 4);
  if (recordIdentifier)
  {
    if (v7)
      objc_msgSend_mergeFrom_(recordIdentifier, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setRecordIdentifier_(self, v4, v7);
  }
  v8 = *((_QWORD *)v5 + 1);
  if (v8)
    objc_msgSend_setEtag_(self, v4, v8);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = *((id *)v5 + 2);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, v32, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_addPluginFields_(self, v12, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v27, v32, 16);
    }
    while (v13);
  }

  if ((*((_BYTE *)v5 + 44) & 1) != 0)
  {
    self->_participantKeyLost = *((_BYTE *)v5 + 40);
    *(_BYTE *)&self->_has |= 1u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = *((id *)v5 + 3);
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v23, v31, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v16);
        objc_msgSend_addPublicKeys_(self, v19, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v23, v31, 16);
    }
    while (v20);
  }

}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordIdentifier, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (NSMutableArray)pluginFields
{
  return self->_pluginFields;
}

- (void)setPluginFields:(id)a3
{
  objc_storeStrong((id *)&self->_pluginFields, a3);
}

- (BOOL)participantKeyLost
{
  return self->_participantKeyLost;
}

- (NSMutableArray)publicKeys
{
  return self->_publicKeys;
}

- (void)setPublicKeys:(id)a3
{
  objc_storeStrong((id *)&self->_publicKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeys, 0);
  objc_storeStrong((id *)&self->_pluginFields, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end
