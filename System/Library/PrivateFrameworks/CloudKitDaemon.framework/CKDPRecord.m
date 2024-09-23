@implementation CKDPRecord

- (void)_inflateFieldsFromData:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  const char *v8;
  _BYTE *v9;
  int *v10;
  int *v11;
  int *v12;
  int *v13;
  char v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  unsigned int v21;
  int v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  NSObject *v30;
  NSObject *v31;
  uint8_t v32[16];
  uint8_t buf[8];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_msgSend_clearFields(self, v4, v5);
    v7 = objc_alloc(MEMORY[0x1E0D82B90]);
    v9 = (_BYTE *)objc_msgSend_initWithData_(v7, v8, (uint64_t)v6);
    v10 = (int *)MEMORY[0x1E0D82BF0];
    v11 = (int *)MEMORY[0x1E0D82BD8];
    if (*(_QWORD *)&v9[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v9[*MEMORY[0x1E0D82BD8]])
    {
      v12 = (int *)MEMORY[0x1E0D82BC8];
      v13 = (int *)MEMORY[0x1E0D82BB8];
      while (1)
      {
        if (v9[*v12])
          goto LABEL_41;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        while (1)
        {
          v17 = *v10;
          v18 = *(_QWORD *)&v9[v17];
          if (v18 == -1 || v18 >= *(_QWORD *)&v9[*v11])
            break;
          v19 = *(_BYTE *)(*(_QWORD *)&v9[*v13] + v18);
          *(_QWORD *)&v9[v17] = v18 + 1;
          v16 |= (unint64_t)(v19 & 0x7F) << v14;
          if ((v19 & 0x80) == 0)
            goto LABEL_13;
          v14 += 7;
          if (v15++ >= 9)
          {
            v21 = 0;
            v22 = v9[*v12];
            goto LABEL_16;
          }
        }
        v9[*v12] = 1;
LABEL_13:
        v22 = v9[*v12];
        v21 = v9[*v12] ? 0 : v16;
LABEL_16:
        if (v22)
          break;
        if ((v21 & 7) == 4)
          goto LABEL_41;
        if ((*(_QWORD *)&v21 & 0x7FFF8) != 0x18)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v30 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = (unsigned __int16)(v21 >> 3);
            v27 = "Warn: Found an unexpected field tag: %d";
            v28 = v30;
            v29 = 8;
            goto LABEL_35;
          }
          goto LABEL_41;
        }
        v23 = (void *)objc_opt_new();
        objc_msgSend_addFields_(self, v24, (uint64_t)v23);
        *(_QWORD *)buf = 0;
        v34 = 0;
        if ((PBReaderPlaceMark() & 1) == 0)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v31 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1BE990000, v31, OS_LOG_TYPE_INFO, "Warn: Couldn't place a reader mark", v32, 2u);
          }

          goto LABEL_41;
        }
        if (!CKDPRecordFieldReadFrom((id *)v23, (uint64_t)v9))
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v25 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1BE990000, v25, OS_LOG_TYPE_INFO, "Warn: Couldn't read field", v32, 2u);
          }
        }
        PBReaderRecallMark();

        if (*(_QWORD *)&v9[*v10] >= *(_QWORD *)&v9[*v11])
          goto LABEL_41;
      }
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v26 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v27 = "Warn: Hit an error while decoding fields for a record";
        v28 = v26;
        v29 = 2;
LABEL_35:
        _os_log_impl(&dword_1BE990000, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
      }
    }
LABEL_41:

  }
}

- (id)fieldData
{
  void *v3;
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_fields;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v11 = (void *)objc_opt_new();
        objc_msgSend_writeTo_(v10, v12, (uint64_t)v11, (_QWORD)v22);
        objc_msgSend_data(v11, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_writeData_forTag_(v3, v16, (uint64_t)v15, 3);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v17, (uint64_t)&v22, v26, 16);
    }
    while (v7);
  }

  objc_msgSend_data(v3, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)fieldForKey:(id)a3
{
  id v4;
  NSMutableArray *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  int isEqualToString;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_fields;
  v9 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend_identifier(v12, v7, v8, (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v4);

        if (isEqualToString)
        {
          v9 = v12;
          goto LABEL_11;
        }
      }
      v9 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v20, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

+ (id)recordFromData:(id)a3
{
  id v3;
  CKDPRecord *v4;
  id v5;
  const char *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(CKDPRecord);
  v5 = objc_alloc(MEMORY[0x1E0D82B90]);
  v7 = (void *)objc_msgSend_initWithData_(v5, v6, (uint64_t)v3);

  CKDPRecordReadFrom((uint64_t)v4, (uint64_t)v7);
  return v4;
}

- (id)dataRepresentation
{
  id v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  objc_msgSend_writeTo_(self, v4, (uint64_t)v3);
  objc_msgSend_data(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasCreatedBy
{
  return self->_createdBy != 0;
}

- (BOOL)hasTimeStatistics
{
  return self->_timeStatistics != 0;
}

- (void)clearFields
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_fields, a2, v2);
}

- (void)addFields:(id)a3
{
  const char *v4;
  NSMutableArray *fields;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  fields = self->_fields;
  v8 = (char *)v4;
  if (!fields)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fields;
    self->_fields = v6;

    v4 = v8;
    fields = self->_fields;
  }
  objc_msgSend_addObject_(fields, v4, (uint64_t)v4);

}

- (unint64_t)fieldsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_fields, a2, v2);
}

- (id)fieldsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fields, a2, a3);
}

+ (Class)fieldsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (BOOL)hasModifiedBy
{
  return self->_modifiedBy != 0;
}

- (void)clearConflictLoserEtags
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_conflictLoserEtags, a2, v2);
}

- (void)addConflictLoserEtags:(id)a3
{
  const char *v4;
  NSMutableArray *conflictLoserEtags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  conflictLoserEtags = self->_conflictLoserEtags;
  v8 = (char *)v4;
  if (!conflictLoserEtags)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_conflictLoserEtags;
    self->_conflictLoserEtags = v6;

    v4 = v8;
    conflictLoserEtags = self->_conflictLoserEtags;
  }
  objc_msgSend_addObject_(conflictLoserEtags, v4, (uint64_t)v4);

}

- (unint64_t)conflictLoserEtagsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_conflictLoserEtags, a2, v2);
}

- (id)conflictLoserEtagsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_conflictLoserEtags, a2, a3);
}

+ (Class)conflictLoserEtagsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasModifiedByDevice
{
  return self->_modifiedByDevice != 0;
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

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (int)permission
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_permission;
  else
    return 1;
}

- (void)setPermission:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_permission = a3;
}

- (void)setHasPermission:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPermission
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)permissionAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("readOnly");
  if (a3 == 2)
  {
    v3 = CFSTR("readWrite");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPermission:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;

  v3 = a3;
  v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("readOnly")) & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("readWrite")))
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)hasShareInfo
{
  return self->_shareInfo != 0;
}

- (BOOL)hasChainPrivateKey
{
  return self->_chainPrivateKey != 0;
}

- (BOOL)hasChainProtectionInfo
{
  return self->_chainProtectionInfo != 0;
}

- (BOOL)hasChainParent
{
  return self->_chainParent != 0;
}

- (BOOL)hasStableUrl
{
  return self->_stableUrl != 0;
}

- (void)clearTombstonedPublicKeyIDs
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_tombstonedPublicKeyIDs, a2, v2);
}

- (void)addTombstonedPublicKeyIDs:(id)a3
{
  const char *v4;
  NSMutableArray *tombstonedPublicKeyIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  tombstonedPublicKeyIDs = self->_tombstonedPublicKeyIDs;
  v8 = (char *)v4;
  if (!tombstonedPublicKeyIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_tombstonedPublicKeyIDs;
    self->_tombstonedPublicKeyIDs = v6;

    v4 = v8;
    tombstonedPublicKeyIDs = self->_tombstonedPublicKeyIDs;
  }
  objc_msgSend_addObject_(tombstonedPublicKeyIDs, v4, (uint64_t)v4);

}

- (unint64_t)tombstonedPublicKeyIDsCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_tombstonedPublicKeyIDs, a2, v2);
}

- (id)tombstonedPublicKeyIDsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_tombstonedPublicKeyIDs, a2, a3);
}

+ (Class)tombstonedPublicKeyIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasZoneishPrimaryKeyId
{
  return self->_zoneishPrimaryKeyId != 0;
}

- (BOOL)hasStorageExpiration
{
  return self->_storageExpiration != 0;
}

- (void)setExpired:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expired = a3;
}

- (void)setHasExpired:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpired
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasExpirationTime
{
  return self->_expirationTime != 0;
}

- (BOOL)hasAppliedCryptoFeatures
{
  return self->_appliedCryptoFeatures != 0;
}

- (BOOL)hasProtectionInfoKeysToRemove
{
  return self->_protectionInfoKeysToRemove != 0;
}

- (BOOL)hasOneTimeStableUrlInfo
{
  return self->_oneTimeStableUrlInfo != 0;
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
  v11.super_class = (Class)CKDPRecord;
  -[CKDPRecord description](&v11, sel_description);
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
  NSString *etag;
  CKDPRecordIdentifier *recordIdentifier;
  void *v9;
  const char *v10;
  CKDPRecordType *type;
  void *v12;
  const char *v13;
  CKDPIdentifier *createdBy;
  void *v15;
  const char *v16;
  CKDPDateStatistics *timeStatistics;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  NSMutableArray *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  const char *v37;
  const char *v38;
  CKDPShareIdentifier *shareId;
  void *v40;
  const char *v41;
  CKDPIdentifier *modifiedBy;
  void *v43;
  const char *v44;
  NSMutableArray *conflictLoserEtags;
  NSString *modifiedByDevice;
  const char *v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  NSMutableArray *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  const char *v64;
  const char *v65;
  CKDPProtectionInfo *protectionInfo;
  void *v67;
  const char *v68;
  int permission;
  __CFString *v70;
  const char *v71;
  CKDPShare *shareInfo;
  void *v73;
  const char *v74;
  NSData *chainPrivateKey;
  CKDPProtectionInfo *chainProtectionInfo;
  void *v77;
  const char *v78;
  CKDPRecordChainParent *chainParent;
  void *v80;
  const char *v81;
  CKDPRecordStableUrl *stableUrl;
  void *v83;
  const char *v84;
  NSMutableArray *tombstonedPublicKeyIDs;
  NSData *zoneishPrimaryKeyId;
  CKDPStorageExpiration *storageExpiration;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  CKDPDate *expirationTime;
  void *v93;
  const char *v94;
  CKDPRecordCryptoFeatureSet *appliedCryptoFeatures;
  void *v96;
  const char *v97;
  CKDPProtectionInfoKeysToRemove *protectionInfoKeysToRemove;
  void *v99;
  const char *v100;
  CKDPRecordOneTimeStableUrlInfo *oneTimeStableUrlInfo;
  void *v102;
  const char *v103;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  etag = self->_etag;
  if (etag)
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)etag, CFSTR("etag"));
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(recordIdentifier, v5, (uint64_t)etag);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, CFSTR("recordIdentifier"));

  }
  type = self->_type;
  if (type)
  {
    objc_msgSend_dictionaryRepresentation(type, v5, (uint64_t)etag);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, CFSTR("type"));

  }
  createdBy = self->_createdBy;
  if (createdBy)
  {
    objc_msgSend_dictionaryRepresentation(createdBy, v5, (uint64_t)etag);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, CFSTR("createdBy"));

  }
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
  {
    objc_msgSend_dictionaryRepresentation(timeStatistics, v5, (uint64_t)etag);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, CFSTR("timeStatistics"));

  }
  if (objc_msgSend_count(self->_fields, v5, (uint64_t)etag))
  {
    v22 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v25 = objc_msgSend_count(self->_fields, v23, v24);
    v27 = (void *)objc_msgSend_initWithCapacity_(v22, v26, v25);
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v28 = self->_fields;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v109, v114, 16);
    if (v30)
    {
      v33 = v30;
      v34 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v110 != v34)
            objc_enumerationMutation(v28);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v109 + 1) + 8 * i), v31, v32);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v27, v37, (uint64_t)v36);

        }
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v109, v114, 16);
      }
      while (v33);
    }

    objc_msgSend_setObject_forKey_(v6, v38, (uint64_t)v27, CFSTR("fields"));
  }
  shareId = self->_shareId;
  if (shareId)
  {
    objc_msgSend_dictionaryRepresentation(shareId, v20, v21);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v41, (uint64_t)v40, CFSTR("shareId"));

  }
  modifiedBy = self->_modifiedBy;
  if (modifiedBy)
  {
    objc_msgSend_dictionaryRepresentation(modifiedBy, v20, v21);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v44, (uint64_t)v43, CFSTR("modifiedBy"));

  }
  conflictLoserEtags = self->_conflictLoserEtags;
  if (conflictLoserEtags)
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)conflictLoserEtags, CFSTR("conflictLoserEtags"));
  modifiedByDevice = self->_modifiedByDevice;
  if (modifiedByDevice)
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)modifiedByDevice, CFSTR("modifiedByDevice"));
  if (objc_msgSend_count(self->_pluginFields, v20, (uint64_t)modifiedByDevice))
  {
    v49 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v52 = objc_msgSend_count(self->_pluginFields, v50, v51);
    v54 = (void *)objc_msgSend_initWithCapacity_(v49, v53, v52);
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v55 = self->_pluginFields;
    v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v105, v113, 16);
    if (v57)
    {
      v60 = v57;
      v61 = *(_QWORD *)v106;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v106 != v61)
            objc_enumerationMutation(v55);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v105 + 1) + 8 * j), v58, v59);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v54, v64, (uint64_t)v63);

        }
        v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v105, v113, 16);
      }
      while (v60);
    }

    objc_msgSend_setObject_forKey_(v6, v65, (uint64_t)v54, CFSTR("pluginFields"));
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_dictionaryRepresentation(protectionInfo, v47, v48);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v68, (uint64_t)v67, CFSTR("protectionInfo"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    permission = self->_permission;
    if (permission == 1)
    {
      v70 = CFSTR("readOnly");
      objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)CFSTR("readOnly"), CFSTR("permission"));
    }
    else if (permission == 2)
    {
      v70 = CFSTR("readWrite");
      objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)CFSTR("readWrite"), CFSTR("permission"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v47, (uint64_t)CFSTR("(unknown: %i)"), self->_permission);
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v71, (uint64_t)v70, CFSTR("permission"));
    }

  }
  shareInfo = self->_shareInfo;
  if (shareInfo)
  {
    objc_msgSend_dictionaryRepresentation(shareInfo, v47, v48);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v74, (uint64_t)v73, CFSTR("shareInfo"));

  }
  chainPrivateKey = self->_chainPrivateKey;
  if (chainPrivateKey)
    objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)chainPrivateKey, CFSTR("chainPrivateKey"));
  chainProtectionInfo = self->_chainProtectionInfo;
  if (chainProtectionInfo)
  {
    objc_msgSend_dictionaryRepresentation(chainProtectionInfo, v47, (uint64_t)chainPrivateKey);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v78, (uint64_t)v77, CFSTR("chainProtectionInfo"));

  }
  chainParent = self->_chainParent;
  if (chainParent)
  {
    objc_msgSend_dictionaryRepresentation(chainParent, v47, (uint64_t)chainPrivateKey);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v81, (uint64_t)v80, CFSTR("chainParent"));

  }
  stableUrl = self->_stableUrl;
  if (stableUrl)
  {
    objc_msgSend_dictionaryRepresentation(stableUrl, v47, (uint64_t)chainPrivateKey);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v84, (uint64_t)v83, CFSTR("stableUrl"));

  }
  tombstonedPublicKeyIDs = self->_tombstonedPublicKeyIDs;
  if (tombstonedPublicKeyIDs)
    objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)tombstonedPublicKeyIDs, CFSTR("tombstonedPublicKeyIDs"));
  zoneishPrimaryKeyId = self->_zoneishPrimaryKeyId;
  if (zoneishPrimaryKeyId)
    objc_msgSend_setObject_forKey_(v6, v47, (uint64_t)zoneishPrimaryKeyId, CFSTR("zoneishPrimaryKeyId"));
  storageExpiration = self->_storageExpiration;
  if (storageExpiration)
  {
    objc_msgSend_dictionaryRepresentation(storageExpiration, v47, (uint64_t)zoneishPrimaryKeyId);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v89, (uint64_t)v88, CFSTR("storageExpiration"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v47, self->_expired);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v91, (uint64_t)v90, CFSTR("expired"));

  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_dictionaryRepresentation(expirationTime, v47, (uint64_t)zoneishPrimaryKeyId);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v94, (uint64_t)v93, CFSTR("expirationTime"));

  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(appliedCryptoFeatures, v47, (uint64_t)zoneishPrimaryKeyId);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v97, (uint64_t)v96, CFSTR("appliedCryptoFeatures"));

  }
  protectionInfoKeysToRemove = self->_protectionInfoKeysToRemove;
  if (protectionInfoKeysToRemove)
  {
    objc_msgSend_dictionaryRepresentation(protectionInfoKeysToRemove, v47, (uint64_t)zoneishPrimaryKeyId);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v100, (uint64_t)v99, CFSTR("protectionInfoKeysToRemove"));

  }
  oneTimeStableUrlInfo = self->_oneTimeStableUrlInfo;
  if (oneTimeStableUrlInfo)
  {
    objc_msgSend_dictionaryRepresentation(oneTimeStableUrlInfo, v47, (uint64_t)zoneishPrimaryKeyId);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v103, (uint64_t)v102, CFSTR("oneTimeStableUrlInfo"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  NSMutableArray *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_etag)
    PBDataWriterWriteStringField();
  if (self->_recordIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_type)
    PBDataWriterWriteSubmessage();
  if (self->_createdBy)
    PBDataWriterWriteSubmessage();
  if (self->_timeStatistics)
    PBDataWriterWriteSubmessage();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v5 = self->_fields;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v45, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v45, v52, 16);
    }
    while (v8);
  }

  if (self->_shareId)
    PBDataWriterWriteSubmessage();
  if (self->_modifiedBy)
    PBDataWriterWriteSubmessage();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = self->_conflictLoserEtags;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v12);
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v41, v51, 16);
    }
    while (v15);
  }

  if (self->_modifiedByDevice)
    PBDataWriterWriteStringField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = self->_pluginFields;
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v37, v50, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v25, (uint64_t)&v37, v50, 16);
    }
    while (v22);
  }

  if (self->_protectionInfo)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_shareInfo)
    PBDataWriterWriteSubmessage();
  if (self->_chainPrivateKey)
    PBDataWriterWriteDataField();
  if (self->_chainProtectionInfo)
    PBDataWriterWriteSubmessage();
  if (self->_chainParent)
    PBDataWriterWriteSubmessage();
  if (self->_stableUrl)
    PBDataWriterWriteSubmessage();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = self->_tombstonedPublicKeyIDs;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v33, v49, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v34;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v26);
        PBDataWriterWriteDataField();
        ++v31;
      }
      while (v29 != v31);
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v32, (uint64_t)&v33, v49, 16);
    }
    while (v29);
  }

  if (self->_zoneishPrimaryKeyId)
    PBDataWriterWriteDataField();
  if (self->_storageExpiration)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_expirationTime)
    PBDataWriterWriteSubmessage();
  if (self->_appliedCryptoFeatures)
    PBDataWriterWriteSubmessage();
  if (self->_protectionInfoKeysToRemove)
    PBDataWriterWriteSubmessage();
  if (self->_oneTimeStableUrlInfo)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  NSString *etag;
  CKDPRecordIdentifier *recordIdentifier;
  CKDPRecordType *type;
  CKDPIdentifier *createdBy;
  CKDPDateStatistics *timeStatistics;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  CKDPShareIdentifier *shareId;
  CKDPIdentifier *modifiedBy;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  const char *v29;
  NSString *modifiedByDevice;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  const char *v39;
  CKDPProtectionInfo *protectionInfo;
  CKDPShare *shareInfo;
  NSData *chainPrivateKey;
  CKDPProtectionInfo *chainProtectionInfo;
  CKDPRecordChainParent *chainParent;
  CKDPRecordStableUrl *stableUrl;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  const char *v54;
  NSData *zoneishPrimaryKeyId;
  CKDPStorageExpiration *storageExpiration;
  _BYTE *v57;
  CKDPDate *expirationTime;
  CKDPRecordCryptoFeatureSet *appliedCryptoFeatures;
  CKDPProtectionInfoKeysToRemove *protectionInfoKeysToRemove;
  CKDPRecordOneTimeStableUrlInfo *oneTimeStableUrlInfo;
  id v62;

  v62 = a3;
  etag = self->_etag;
  if (etag)
    objc_msgSend_setEtag_(v62, v4, (uint64_t)etag);
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
    objc_msgSend_setRecordIdentifier_(v62, v4, (uint64_t)recordIdentifier);
  type = self->_type;
  if (type)
    objc_msgSend_setType_(v62, v4, (uint64_t)type);
  createdBy = self->_createdBy;
  if (createdBy)
    objc_msgSend_setCreatedBy_(v62, v4, (uint64_t)createdBy);
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
    objc_msgSend_setTimeStatistics_(v62, v4, (uint64_t)timeStatistics);
  if (objc_msgSend_fieldsCount(self, v4, (uint64_t)timeStatistics))
  {
    objc_msgSend_clearFields(v62, v10, v11);
    v14 = objc_msgSend_fieldsCount(self, v12, v13);
    if (v14)
    {
      v15 = v14;
      for (i = 0; i != v15; ++i)
      {
        objc_msgSend_fieldsAtIndex_(self, v10, i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFields_(v62, v18, (uint64_t)v17);

      }
    }
  }
  shareId = self->_shareId;
  if (shareId)
    objc_msgSend_setShareId_(v62, v10, (uint64_t)shareId);
  modifiedBy = self->_modifiedBy;
  if (modifiedBy)
    objc_msgSend_setModifiedBy_(v62, v10, (uint64_t)modifiedBy);
  if (objc_msgSend_conflictLoserEtagsCount(self, v10, (uint64_t)modifiedBy))
  {
    objc_msgSend_clearConflictLoserEtags(v62, v21, v22);
    v25 = objc_msgSend_conflictLoserEtagsCount(self, v23, v24);
    if (v25)
    {
      v26 = v25;
      for (j = 0; j != v26; ++j)
      {
        objc_msgSend_conflictLoserEtagsAtIndex_(self, v21, j);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addConflictLoserEtags_(v62, v29, (uint64_t)v28);

      }
    }
  }
  modifiedByDevice = self->_modifiedByDevice;
  if (modifiedByDevice)
    objc_msgSend_setModifiedByDevice_(v62, v21, (uint64_t)modifiedByDevice);
  if (objc_msgSend_pluginFieldsCount(self, v21, (uint64_t)modifiedByDevice))
  {
    objc_msgSend_clearPluginFields(v62, v31, v32);
    v35 = objc_msgSend_pluginFieldsCount(self, v33, v34);
    if (v35)
    {
      v36 = v35;
      for (k = 0; k != v36; ++k)
      {
        objc_msgSend_pluginFieldsAtIndex_(self, v31, k);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addPluginFields_(v62, v39, (uint64_t)v38);

      }
    }
  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
    objc_msgSend_setProtectionInfo_(v62, v31, (uint64_t)protectionInfo);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v62 + 26) = self->_permission;
    *((_BYTE *)v62 + 212) |= 1u;
  }
  shareInfo = self->_shareInfo;
  if (shareInfo)
    objc_msgSend_setShareInfo_(v62, v31, (uint64_t)shareInfo);
  chainPrivateKey = self->_chainPrivateKey;
  if (chainPrivateKey)
    objc_msgSend_setChainPrivateKey_(v62, v31, (uint64_t)chainPrivateKey);
  chainProtectionInfo = self->_chainProtectionInfo;
  if (chainProtectionInfo)
    objc_msgSend_setChainProtectionInfo_(v62, v31, (uint64_t)chainProtectionInfo);
  chainParent = self->_chainParent;
  if (chainParent)
    objc_msgSend_setChainParent_(v62, v31, (uint64_t)chainParent);
  stableUrl = self->_stableUrl;
  if (stableUrl)
    objc_msgSend_setStableUrl_(v62, v31, (uint64_t)stableUrl);
  if (objc_msgSend_tombstonedPublicKeyIDsCount(self, v31, (uint64_t)stableUrl))
  {
    objc_msgSend_clearTombstonedPublicKeyIDs(v62, v46, v47);
    v50 = objc_msgSend_tombstonedPublicKeyIDsCount(self, v48, v49);
    if (v50)
    {
      v51 = v50;
      for (m = 0; m != v51; ++m)
      {
        objc_msgSend_tombstonedPublicKeyIDsAtIndex_(self, v46, m);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addTombstonedPublicKeyIDs_(v62, v54, (uint64_t)v53);

      }
    }
  }
  zoneishPrimaryKeyId = self->_zoneishPrimaryKeyId;
  if (zoneishPrimaryKeyId)
    objc_msgSend_setZoneishPrimaryKeyId_(v62, v46, (uint64_t)zoneishPrimaryKeyId);
  storageExpiration = self->_storageExpiration;
  v57 = v62;
  if (storageExpiration)
  {
    objc_msgSend_setStorageExpiration_(v62, v46, (uint64_t)storageExpiration);
    v57 = v62;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v57[208] = self->_expired;
    v57[212] |= 2u;
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_setExpirationTime_(v62, v46, (uint64_t)expirationTime);
    v57 = v62;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_setAppliedCryptoFeatures_(v62, v46, (uint64_t)appliedCryptoFeatures);
    v57 = v62;
  }
  protectionInfoKeysToRemove = self->_protectionInfoKeysToRemove;
  if (protectionInfoKeysToRemove)
  {
    objc_msgSend_setProtectionInfoKeysToRemove_(v62, v46, (uint64_t)protectionInfoKeysToRemove);
    v57 = v62;
  }
  oneTimeStableUrlInfo = self->_oneTimeStableUrlInfo;
  if (oneTimeStableUrlInfo)
  {
    objc_msgSend_setOneTimeStableUrlInfo_(v62, v46, (uint64_t)oneTimeStableUrlInfo);
    v57 = v62;
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
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  NSMutableArray *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  NSMutableArray *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  NSMutableArray *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_etag, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 56);
  *(_QWORD *)(v10 + 56) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 136);
  *(_QWORD *)(v10 + 136) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_type, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 192);
  *(_QWORD *)(v10 + 192) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_createdBy, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v21;

  v24 = objc_msgSend_copyWithZone_(self->_timeStatistics, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 176);
  *(_QWORD *)(v10 + 176) = v24;

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v26 = self->_fields;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v120, v127, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v121;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v121 != v31)
          objc_enumerationMutation(v26);
        v33 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v120 + 1) + 8 * v32), v29, (uint64_t)a3);
        objc_msgSend_addFields_((void *)v10, v34, (uint64_t)v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v120, v127, 16);
    }
    while (v30);
  }

  v36 = objc_msgSend_copyWithZone_(self->_shareId, v35, (uint64_t)a3);
  v37 = *(void **)(v10 + 144);
  *(_QWORD *)(v10 + 144) = v36;

  v39 = objc_msgSend_copyWithZone_(self->_modifiedBy, v38, (uint64_t)a3);
  v40 = *(void **)(v10 + 80);
  *(_QWORD *)(v10 + 80) = v39;

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v41 = self->_conflictLoserEtags;
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v116, v126, 16);
  if (v43)
  {
    v45 = v43;
    v46 = *(_QWORD *)v117;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v117 != v46)
          objc_enumerationMutation(v41);
        v48 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v116 + 1) + 8 * v47), v44, (uint64_t)a3);
        objc_msgSend_addConflictLoserEtags_((void *)v10, v49, (uint64_t)v48);

        ++v47;
      }
      while (v45 != v47);
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v116, v126, 16);
    }
    while (v45);
  }

  v51 = objc_msgSend_copyWithZone_(self->_modifiedByDevice, v50, (uint64_t)a3);
  v52 = *(void **)(v10 + 88);
  *(_QWORD *)(v10 + 88) = v51;

  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v53 = self->_pluginFields;
  v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v112, v125, 16);
  if (v55)
  {
    v57 = v55;
    v58 = *(_QWORD *)v113;
    do
    {
      v59 = 0;
      do
      {
        if (*(_QWORD *)v113 != v58)
          objc_enumerationMutation(v53);
        v60 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v112 + 1) + 8 * v59), v56, (uint64_t)a3);
        objc_msgSend_addPluginFields_((void *)v10, v61, (uint64_t)v60);

        ++v59;
      }
      while (v57 != v59);
      v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v112, v125, 16);
    }
    while (v57);
  }

  v63 = objc_msgSend_copyWithZone_(self->_protectionInfo, v62, (uint64_t)a3);
  v64 = *(void **)(v10 + 120);
  *(_QWORD *)(v10 + 120) = v63;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 104) = self->_permission;
    *(_BYTE *)(v10 + 212) |= 1u;
  }
  v66 = objc_msgSend_copyWithZone_(self->_shareInfo, v65, (uint64_t)a3);
  v67 = *(void **)(v10 + 152);
  *(_QWORD *)(v10 + 152) = v66;

  v69 = objc_msgSend_copyWithZone_(self->_chainPrivateKey, v68, (uint64_t)a3);
  v70 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v69;

  v72 = objc_msgSend_copyWithZone_(self->_chainProtectionInfo, v71, (uint64_t)a3);
  v73 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v72;

  v75 = objc_msgSend_copyWithZone_(self->_chainParent, v74, (uint64_t)a3);
  v76 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v75;

  v78 = objc_msgSend_copyWithZone_(self->_stableUrl, v77, (uint64_t)a3);
  v79 = *(void **)(v10 + 160);
  *(_QWORD *)(v10 + 160) = v78;

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v80 = self->_tombstonedPublicKeyIDs;
  v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v108, v124, 16);
  if (v82)
  {
    v84 = v82;
    v85 = *(_QWORD *)v109;
    do
    {
      v86 = 0;
      do
      {
        if (*(_QWORD *)v109 != v85)
          objc_enumerationMutation(v80);
        v87 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v108 + 1) + 8 * v86), v83, (uint64_t)a3, (_QWORD)v108);
        objc_msgSend_addTombstonedPublicKeyIDs_((void *)v10, v88, (uint64_t)v87);

        ++v86;
      }
      while (v84 != v86);
      v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v83, (uint64_t)&v108, v124, 16);
    }
    while (v84);
  }

  v90 = objc_msgSend_copyWithZone_(self->_zoneishPrimaryKeyId, v89, (uint64_t)a3);
  v91 = *(void **)(v10 + 200);
  *(_QWORD *)(v10 + 200) = v90;

  v93 = objc_msgSend_copyWithZone_(self->_storageExpiration, v92, (uint64_t)a3);
  v94 = *(void **)(v10 + 168);
  *(_QWORD *)(v10 + 168) = v93;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v10 + 208) = self->_expired;
    *(_BYTE *)(v10 + 212) |= 2u;
  }
  v96 = objc_msgSend_copyWithZone_(self->_expirationTime, v95, (uint64_t)a3, (_QWORD)v108);
  v97 = *(void **)(v10 + 64);
  *(_QWORD *)(v10 + 64) = v96;

  v99 = objc_msgSend_copyWithZone_(self->_appliedCryptoFeatures, v98, (uint64_t)a3);
  v100 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v99;

  v102 = objc_msgSend_copyWithZone_(self->_protectionInfoKeysToRemove, v101, (uint64_t)a3);
  v103 = *(void **)(v10 + 128);
  *(_QWORD *)(v10 + 128) = v102;

  v105 = objc_msgSend_copyWithZone_(self->_oneTimeStableUrlInfo, v104, (uint64_t)a3);
  v106 = *(void **)(v10 + 96);
  *(_QWORD *)(v10 + 96) = v105;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  NSString *etag;
  uint64_t v9;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v11;
  CKDPRecordType *type;
  uint64_t v13;
  CKDPIdentifier *createdBy;
  uint64_t v15;
  CKDPDateStatistics *timeStatistics;
  uint64_t v17;
  NSMutableArray *fields;
  uint64_t v19;
  CKDPShareIdentifier *shareId;
  uint64_t v21;
  CKDPIdentifier *modifiedBy;
  uint64_t v23;
  NSMutableArray *conflictLoserEtags;
  uint64_t v25;
  NSString *modifiedByDevice;
  uint64_t v27;
  NSMutableArray *pluginFields;
  uint64_t v29;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v31;
  CKDPShare *shareInfo;
  uint64_t v33;
  NSData *chainPrivateKey;
  uint64_t v35;
  CKDPProtectionInfo *chainProtectionInfo;
  uint64_t v37;
  CKDPRecordChainParent *chainParent;
  uint64_t v39;
  CKDPRecordStableUrl *stableUrl;
  uint64_t v41;
  NSMutableArray *tombstonedPublicKeyIDs;
  uint64_t v43;
  NSData *zoneishPrimaryKeyId;
  uint64_t v45;
  CKDPStorageExpiration *storageExpiration;
  uint64_t v47;
  CKDPDate *expirationTime;
  uint64_t v49;
  CKDPRecordCryptoFeatureSet *appliedCryptoFeatures;
  uint64_t v51;
  CKDPProtectionInfoKeysToRemove *protectionInfoKeysToRemove;
  uint64_t v53;
  CKDPRecordOneTimeStableUrlInfo *oneTimeStableUrlInfo;
  uint64_t v55;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_63;
  etag = self->_etag;
  v9 = v4[7];
  if ((unint64_t)etag | v9)
  {
    if (!objc_msgSend_isEqual_(etag, v7, v9))
      goto LABEL_63;
  }
  recordIdentifier = self->_recordIdentifier;
  v11 = v4[17];
  if ((unint64_t)recordIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(recordIdentifier, v7, v11))
      goto LABEL_63;
  }
  type = self->_type;
  v13 = v4[24];
  if ((unint64_t)type | v13)
  {
    if (!objc_msgSend_isEqual_(type, v7, v13))
      goto LABEL_63;
  }
  createdBy = self->_createdBy;
  v15 = v4[6];
  if ((unint64_t)createdBy | v15)
  {
    if (!objc_msgSend_isEqual_(createdBy, v7, v15))
      goto LABEL_63;
  }
  timeStatistics = self->_timeStatistics;
  v17 = v4[22];
  if ((unint64_t)timeStatistics | v17)
  {
    if (!objc_msgSend_isEqual_(timeStatistics, v7, v17))
      goto LABEL_63;
  }
  fields = self->_fields;
  v19 = v4[9];
  if ((unint64_t)fields | v19)
  {
    if (!objc_msgSend_isEqual_(fields, v7, v19))
      goto LABEL_63;
  }
  shareId = self->_shareId;
  v21 = v4[18];
  if ((unint64_t)shareId | v21)
  {
    if (!objc_msgSend_isEqual_(shareId, v7, v21))
      goto LABEL_63;
  }
  modifiedBy = self->_modifiedBy;
  v23 = v4[10];
  if ((unint64_t)modifiedBy | v23)
  {
    if (!objc_msgSend_isEqual_(modifiedBy, v7, v23))
      goto LABEL_63;
  }
  conflictLoserEtags = self->_conflictLoserEtags;
  v25 = v4[5];
  if ((unint64_t)conflictLoserEtags | v25)
  {
    if (!objc_msgSend_isEqual_(conflictLoserEtags, v7, v25))
      goto LABEL_63;
  }
  modifiedByDevice = self->_modifiedByDevice;
  v27 = v4[11];
  if ((unint64_t)modifiedByDevice | v27)
  {
    if (!objc_msgSend_isEqual_(modifiedByDevice, v7, v27))
      goto LABEL_63;
  }
  pluginFields = self->_pluginFields;
  v29 = v4[14];
  if ((unint64_t)pluginFields | v29)
  {
    if (!objc_msgSend_isEqual_(pluginFields, v7, v29))
      goto LABEL_63;
  }
  protectionInfo = self->_protectionInfo;
  v31 = v4[15];
  if ((unint64_t)protectionInfo | v31)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v31))
      goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 212) & 1) == 0 || self->_permission != *((_DWORD *)v4 + 26))
      goto LABEL_63;
  }
  else if ((*((_BYTE *)v4 + 212) & 1) != 0)
  {
    goto LABEL_63;
  }
  shareInfo = self->_shareInfo;
  v33 = v4[19];
  if ((unint64_t)shareInfo | v33 && !objc_msgSend_isEqual_(shareInfo, v7, v33))
    goto LABEL_63;
  chainPrivateKey = self->_chainPrivateKey;
  v35 = v4[3];
  if ((unint64_t)chainPrivateKey | v35)
  {
    if (!objc_msgSend_isEqual_(chainPrivateKey, v7, v35))
      goto LABEL_63;
  }
  chainProtectionInfo = self->_chainProtectionInfo;
  v37 = v4[4];
  if ((unint64_t)chainProtectionInfo | v37)
  {
    if (!objc_msgSend_isEqual_(chainProtectionInfo, v7, v37))
      goto LABEL_63;
  }
  chainParent = self->_chainParent;
  v39 = v4[2];
  if ((unint64_t)chainParent | v39)
  {
    if (!objc_msgSend_isEqual_(chainParent, v7, v39))
      goto LABEL_63;
  }
  stableUrl = self->_stableUrl;
  v41 = v4[20];
  if ((unint64_t)stableUrl | v41)
  {
    if (!objc_msgSend_isEqual_(stableUrl, v7, v41))
      goto LABEL_63;
  }
  tombstonedPublicKeyIDs = self->_tombstonedPublicKeyIDs;
  v43 = v4[23];
  if ((unint64_t)tombstonedPublicKeyIDs | v43)
  {
    if (!objc_msgSend_isEqual_(tombstonedPublicKeyIDs, v7, v43))
      goto LABEL_63;
  }
  zoneishPrimaryKeyId = self->_zoneishPrimaryKeyId;
  v45 = v4[25];
  if ((unint64_t)zoneishPrimaryKeyId | v45)
  {
    if (!objc_msgSend_isEqual_(zoneishPrimaryKeyId, v7, v45))
      goto LABEL_63;
  }
  storageExpiration = self->_storageExpiration;
  v47 = v4[21];
  if ((unint64_t)storageExpiration | v47)
  {
    if (!objc_msgSend_isEqual_(storageExpiration, v7, v47))
      goto LABEL_63;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 212) & 2) != 0)
    {
      if (self->_expired)
      {
        if (!*((_BYTE *)v4 + 208))
          goto LABEL_63;
        goto LABEL_55;
      }
      if (!*((_BYTE *)v4 + 208))
        goto LABEL_55;
    }
LABEL_63:
    isEqual = 0;
    goto LABEL_64;
  }
  if ((*((_BYTE *)v4 + 212) & 2) != 0)
    goto LABEL_63;
LABEL_55:
  expirationTime = self->_expirationTime;
  v49 = v4[8];
  if ((unint64_t)expirationTime | v49 && !objc_msgSend_isEqual_(expirationTime, v7, v49))
    goto LABEL_63;
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  v51 = v4[1];
  if ((unint64_t)appliedCryptoFeatures | v51)
  {
    if (!objc_msgSend_isEqual_(appliedCryptoFeatures, v7, v51))
      goto LABEL_63;
  }
  protectionInfoKeysToRemove = self->_protectionInfoKeysToRemove;
  v53 = v4[16];
  if ((unint64_t)protectionInfoKeysToRemove | v53)
  {
    if (!objc_msgSend_isEqual_(protectionInfoKeysToRemove, v7, v53))
      goto LABEL_63;
  }
  oneTimeStableUrlInfo = self->_oneTimeStableUrlInfo;
  v55 = v4[12];
  if ((unint64_t)oneTimeStableUrlInfo | v55)
    isEqual = objc_msgSend_isEqual_(oneTimeStableUrlInfo, v7, v55);
  else
    isEqual = 1;
LABEL_64:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;

  v77 = objc_msgSend_hash(self->_etag, a2, v2);
  v76 = objc_msgSend_hash(self->_recordIdentifier, v4, v5);
  v75 = objc_msgSend_hash(self->_type, v6, v7);
  v74 = objc_msgSend_hash(self->_createdBy, v8, v9);
  v73 = objc_msgSend_hash(self->_timeStatistics, v10, v11);
  v72 = objc_msgSend_hash(self->_fields, v12, v13);
  v71 = objc_msgSend_hash(self->_shareId, v14, v15);
  v70 = objc_msgSend_hash(self->_modifiedBy, v16, v17);
  v69 = objc_msgSend_hash(self->_conflictLoserEtags, v18, v19);
  v68 = objc_msgSend_hash(self->_modifiedByDevice, v20, v21);
  v67 = objc_msgSend_hash(self->_pluginFields, v22, v23);
  v65 = objc_msgSend_hash(self->_protectionInfo, v24, v25);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v28 = 2654435761 * self->_permission;
  else
    v28 = 0;
  v29 = objc_msgSend_hash(self->_shareInfo, v26, v27, v65);
  v32 = objc_msgSend_hash(self->_chainPrivateKey, v30, v31);
  v35 = objc_msgSend_hash(self->_chainProtectionInfo, v33, v34);
  v38 = objc_msgSend_hash(self->_chainParent, v36, v37);
  v41 = objc_msgSend_hash(self->_stableUrl, v39, v40);
  v44 = objc_msgSend_hash(self->_tombstonedPublicKeyIDs, v42, v43);
  v47 = objc_msgSend_hash(self->_zoneishPrimaryKeyId, v45, v46);
  v50 = objc_msgSend_hash(self->_storageExpiration, v48, v49);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v53 = 2654435761 * self->_expired;
  else
    v53 = 0;
  v54 = v76 ^ v77 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v28 ^ v29 ^ v32 ^ v35 ^ v38 ^ v41 ^ v44 ^ v47 ^ v50 ^ v53;
  v55 = objc_msgSend_hash(self->_expirationTime, v51, v52);
  v58 = v55 ^ objc_msgSend_hash(self->_appliedCryptoFeatures, v56, v57);
  v61 = v58 ^ objc_msgSend_hash(self->_protectionInfoKeysToRemove, v59, v60);
  return v54 ^ v61 ^ objc_msgSend_hash(self->_oneTimeStableUrlInfo, v62, v63);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  uint64_t v6;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v8;
  CKDPRecordType *type;
  uint64_t v10;
  CKDPIdentifier *createdBy;
  uint64_t v12;
  CKDPDateStatistics *timeStatistics;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  const char *v22;
  CKDPShareIdentifier *shareId;
  uint64_t v24;
  CKDPIdentifier *modifiedBy;
  uint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  const char *v34;
  uint64_t v35;
  id v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  const char *v43;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v45;
  CKDPShare *shareInfo;
  uint64_t v47;
  uint64_t v48;
  CKDPProtectionInfo *chainProtectionInfo;
  uint64_t v50;
  CKDPRecordChainParent *chainParent;
  uint64_t v52;
  CKDPRecordStableUrl *stableUrl;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  const char *v62;
  uint64_t v63;
  CKDPStorageExpiration *storageExpiration;
  uint64_t v65;
  CKDPDate *expirationTime;
  uint64_t v67;
  CKDPRecordCryptoFeatureSet *appliedCryptoFeatures;
  uint64_t v69;
  CKDPProtectionInfoKeysToRemove *protectionInfoKeysToRemove;
  uint64_t v71;
  CKDPRecordOneTimeStableUrlInfo *oneTimeStableUrlInfo;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *((_QWORD *)v5 + 7);
  if (v6)
    objc_msgSend_setEtag_(self, v4, v6);
  recordIdentifier = self->_recordIdentifier;
  v8 = *((_QWORD *)v5 + 17);
  if (recordIdentifier)
  {
    if (v8)
      objc_msgSend_mergeFrom_(recordIdentifier, v4, v8);
  }
  else if (v8)
  {
    objc_msgSend_setRecordIdentifier_(self, v4, v8);
  }
  type = self->_type;
  v10 = *((_QWORD *)v5 + 24);
  if (type)
  {
    if (v10)
      objc_msgSend_mergeFrom_(type, v4, v10);
  }
  else if (v10)
  {
    objc_msgSend_setType_(self, v4, v10);
  }
  createdBy = self->_createdBy;
  v12 = *((_QWORD *)v5 + 6);
  if (createdBy)
  {
    if (v12)
      objc_msgSend_mergeFrom_(createdBy, v4, v12);
  }
  else if (v12)
  {
    objc_msgSend_setCreatedBy_(self, v4, v12);
  }
  timeStatistics = self->_timeStatistics;
  v14 = *((_QWORD *)v5 + 22);
  if (timeStatistics)
  {
    if (v14)
      objc_msgSend_mergeFrom_(timeStatistics, v4, v14);
  }
  else if (v14)
  {
    objc_msgSend_setTimeStatistics_(self, v4, v14);
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v15 = *((id *)v5 + 9);
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v86, v93, 16);
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v87 != v20)
          objc_enumerationMutation(v15);
        objc_msgSend_addFields_(self, v18, *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i));
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v86, v93, 16);
    }
    while (v19);
  }

  shareId = self->_shareId;
  v24 = *((_QWORD *)v5 + 18);
  if (shareId)
  {
    if (v24)
      objc_msgSend_mergeFrom_(shareId, v22, v24);
  }
  else if (v24)
  {
    objc_msgSend_setShareId_(self, v22, v24);
  }
  modifiedBy = self->_modifiedBy;
  v26 = *((_QWORD *)v5 + 10);
  if (modifiedBy)
  {
    if (v26)
      objc_msgSend_mergeFrom_(modifiedBy, v22, v26);
  }
  else if (v26)
  {
    objc_msgSend_setModifiedBy_(self, v22, v26);
  }
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v27 = *((id *)v5 + 5);
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v82, v92, 16);
  if (v29)
  {
    v31 = v29;
    v32 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v83 != v32)
          objc_enumerationMutation(v27);
        objc_msgSend_addConflictLoserEtags_(self, v30, *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j));
      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v82, v92, 16);
    }
    while (v31);
  }

  v35 = *((_QWORD *)v5 + 11);
  if (v35)
    objc_msgSend_setModifiedByDevice_(self, v34, v35);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v36 = *((id *)v5 + 14);
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v78, v91, 16);
  if (v38)
  {
    v40 = v38;
    v41 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v40; ++k)
      {
        if (*(_QWORD *)v79 != v41)
          objc_enumerationMutation(v36);
        objc_msgSend_addPluginFields_(self, v39, *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k));
      }
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v78, v91, 16);
    }
    while (v40);
  }

  protectionInfo = self->_protectionInfo;
  v45 = *((_QWORD *)v5 + 15);
  if (protectionInfo)
  {
    if (v45)
      objc_msgSend_mergeFrom_(protectionInfo, v43, v45);
  }
  else if (v45)
  {
    objc_msgSend_setProtectionInfo_(self, v43, v45);
  }
  if ((*((_BYTE *)v5 + 212) & 1) != 0)
  {
    self->_permission = *((_DWORD *)v5 + 26);
    *(_BYTE *)&self->_has |= 1u;
  }
  shareInfo = self->_shareInfo;
  v47 = *((_QWORD *)v5 + 19);
  if (shareInfo)
  {
    if (v47)
      objc_msgSend_mergeFrom_(shareInfo, v43, v47);
  }
  else if (v47)
  {
    objc_msgSend_setShareInfo_(self, v43, v47);
  }
  v48 = *((_QWORD *)v5 + 3);
  if (v48)
    objc_msgSend_setChainPrivateKey_(self, v43, v48);
  chainProtectionInfo = self->_chainProtectionInfo;
  v50 = *((_QWORD *)v5 + 4);
  if (chainProtectionInfo)
  {
    if (v50)
      objc_msgSend_mergeFrom_(chainProtectionInfo, v43, v50);
  }
  else if (v50)
  {
    objc_msgSend_setChainProtectionInfo_(self, v43, v50);
  }
  chainParent = self->_chainParent;
  v52 = *((_QWORD *)v5 + 2);
  if (chainParent)
  {
    if (v52)
      objc_msgSend_mergeFrom_(chainParent, v43, v52);
  }
  else if (v52)
  {
    objc_msgSend_setChainParent_(self, v43, v52);
  }
  stableUrl = self->_stableUrl;
  v54 = *((_QWORD *)v5 + 20);
  if (stableUrl)
  {
    if (v54)
      objc_msgSend_mergeFrom_(stableUrl, v43, v54);
  }
  else if (v54)
  {
    objc_msgSend_setStableUrl_(self, v43, v54);
  }
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v55 = *((id *)v5 + 23);
  v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v74, v90, 16);
  if (v57)
  {
    v59 = v57;
    v60 = *(_QWORD *)v75;
    do
    {
      for (m = 0; m != v59; ++m)
      {
        if (*(_QWORD *)v75 != v60)
          objc_enumerationMutation(v55);
        objc_msgSend_addTombstonedPublicKeyIDs_(self, v58, *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m), (_QWORD)v74);
      }
      v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v74, v90, 16);
    }
    while (v59);
  }

  v63 = *((_QWORD *)v5 + 25);
  if (v63)
    objc_msgSend_setZoneishPrimaryKeyId_(self, v62, v63);
  storageExpiration = self->_storageExpiration;
  v65 = *((_QWORD *)v5 + 21);
  if (storageExpiration)
  {
    if (v65)
      objc_msgSend_mergeFrom_(storageExpiration, v62, v65);
  }
  else if (v65)
  {
    objc_msgSend_setStorageExpiration_(self, v62, v65);
  }
  if ((*((_BYTE *)v5 + 212) & 2) != 0)
  {
    self->_expired = *((_BYTE *)v5 + 208);
    *(_BYTE *)&self->_has |= 2u;
  }
  expirationTime = self->_expirationTime;
  v67 = *((_QWORD *)v5 + 8);
  if (expirationTime)
  {
    if (v67)
      objc_msgSend_mergeFrom_(expirationTime, v62, v67);
  }
  else if (v67)
  {
    objc_msgSend_setExpirationTime_(self, v62, v67);
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  v69 = *((_QWORD *)v5 + 1);
  if (appliedCryptoFeatures)
  {
    if (v69)
      objc_msgSend_mergeFrom_(appliedCryptoFeatures, v62, v69);
  }
  else if (v69)
  {
    objc_msgSend_setAppliedCryptoFeatures_(self, v62, v69);
  }
  protectionInfoKeysToRemove = self->_protectionInfoKeysToRemove;
  v71 = *((_QWORD *)v5 + 16);
  if (protectionInfoKeysToRemove)
  {
    if (v71)
      objc_msgSend_mergeFrom_(protectionInfoKeysToRemove, v62, v71);
  }
  else if (v71)
  {
    objc_msgSend_setProtectionInfoKeysToRemove_(self, v62, v71);
  }
  oneTimeStableUrlInfo = self->_oneTimeStableUrlInfo;
  v73 = *((_QWORD *)v5 + 12);
  if (oneTimeStableUrlInfo)
  {
    if (v73)
      objc_msgSend_mergeFrom_(oneTimeStableUrlInfo, v62, v73);
  }
  else if (v73)
  {
    objc_msgSend_setOneTimeStableUrlInfo_(self, v62, v73);
  }

}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_recordIdentifier, a3);
}

- (CKDPRecordType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (CKDPIdentifier)createdBy
{
  return self->_createdBy;
}

- (void)setCreatedBy:(id)a3
{
  objc_storeStrong((id *)&self->_createdBy, a3);
}

- (CKDPDateStatistics)timeStatistics
{
  return self->_timeStatistics;
}

- (void)setTimeStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_timeStatistics, a3);
}

- (NSMutableArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
  objc_storeStrong((id *)&self->_fields, a3);
}

- (CKDPShareIdentifier)shareId
{
  return self->_shareId;
}

- (void)setShareId:(id)a3
{
  objc_storeStrong((id *)&self->_shareId, a3);
}

- (CKDPIdentifier)modifiedBy
{
  return self->_modifiedBy;
}

- (void)setModifiedBy:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedBy, a3);
}

- (NSMutableArray)conflictLoserEtags
{
  return self->_conflictLoserEtags;
}

- (void)setConflictLoserEtags:(id)a3
{
  objc_storeStrong((id *)&self->_conflictLoserEtags, a3);
}

- (NSString)modifiedByDevice
{
  return self->_modifiedByDevice;
}

- (void)setModifiedByDevice:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedByDevice, a3);
}

- (NSMutableArray)pluginFields
{
  return self->_pluginFields;
}

- (void)setPluginFields:(id)a3
{
  objc_storeStrong((id *)&self->_pluginFields, a3);
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfo, a3);
}

- (CKDPShare)shareInfo
{
  return self->_shareInfo;
}

- (void)setShareInfo:(id)a3
{
  objc_storeStrong((id *)&self->_shareInfo, a3);
}

- (NSData)chainPrivateKey
{
  return self->_chainPrivateKey;
}

- (void)setChainPrivateKey:(id)a3
{
  objc_storeStrong((id *)&self->_chainPrivateKey, a3);
}

- (CKDPProtectionInfo)chainProtectionInfo
{
  return self->_chainProtectionInfo;
}

- (void)setChainProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_chainProtectionInfo, a3);
}

- (CKDPRecordChainParent)chainParent
{
  return self->_chainParent;
}

- (void)setChainParent:(id)a3
{
  objc_storeStrong((id *)&self->_chainParent, a3);
}

- (CKDPRecordStableUrl)stableUrl
{
  return self->_stableUrl;
}

- (void)setStableUrl:(id)a3
{
  objc_storeStrong((id *)&self->_stableUrl, a3);
}

- (NSMutableArray)tombstonedPublicKeyIDs
{
  return self->_tombstonedPublicKeyIDs;
}

- (void)setTombstonedPublicKeyIDs:(id)a3
{
  objc_storeStrong((id *)&self->_tombstonedPublicKeyIDs, a3);
}

- (NSData)zoneishPrimaryKeyId
{
  return self->_zoneishPrimaryKeyId;
}

- (void)setZoneishPrimaryKeyId:(id)a3
{
  objc_storeStrong((id *)&self->_zoneishPrimaryKeyId, a3);
}

- (CKDPStorageExpiration)storageExpiration
{
  return self->_storageExpiration;
}

- (void)setStorageExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_storageExpiration, a3);
}

- (BOOL)expired
{
  return self->_expired;
}

- (CKDPDate)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(id)a3
{
  objc_storeStrong((id *)&self->_expirationTime, a3);
}

- (CKDPRecordCryptoFeatureSet)appliedCryptoFeatures
{
  return self->_appliedCryptoFeatures;
}

- (void)setAppliedCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, a3);
}

- (CKDPProtectionInfoKeysToRemove)protectionInfoKeysToRemove
{
  return self->_protectionInfoKeysToRemove;
}

- (void)setProtectionInfoKeysToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfoKeysToRemove, a3);
}

- (CKDPRecordOneTimeStableUrlInfo)oneTimeStableUrlInfo
{
  return self->_oneTimeStableUrlInfo;
}

- (void)setOneTimeStableUrlInfo:(id)a3
{
  objc_storeStrong((id *)&self->_oneTimeStableUrlInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneishPrimaryKeyId, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_tombstonedPublicKeyIDs, 0);
  objc_storeStrong((id *)&self->_timeStatistics, 0);
  objc_storeStrong((id *)&self->_storageExpiration, 0);
  objc_storeStrong((id *)&self->_stableUrl, 0);
  objc_storeStrong((id *)&self->_shareInfo, 0);
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_protectionInfoKeysToRemove, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_pluginFields, 0);
  objc_storeStrong((id *)&self->_oneTimeStableUrlInfo, 0);
  objc_storeStrong((id *)&self->_modifiedByDevice, 0);
  objc_storeStrong((id *)&self->_modifiedBy, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);
  objc_storeStrong((id *)&self->_conflictLoserEtags, 0);
  objc_storeStrong((id *)&self->_chainProtectionInfo, 0);
  objc_storeStrong((id *)&self->_chainPrivateKey, 0);
  objc_storeStrong((id *)&self->_chainParent, 0);
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, 0);
}

- (id)_permissionAsString
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  v3 = objc_msgSend_permission(self, a2, v2);
  if ((_DWORD)v3 == 1)
    return CFSTR("readOnly");
  if ((_DWORD)v3 == 2)
    return CFSTR("readWrite");
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
