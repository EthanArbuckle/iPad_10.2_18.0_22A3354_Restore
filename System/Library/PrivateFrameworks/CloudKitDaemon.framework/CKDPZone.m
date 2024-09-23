@implementation CKDPZone

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasProtectionInfo
{
  return self->_protectionInfo != 0;
}

- (BOOL)hasRecordProtectionInfo
{
  return self->_recordProtectionInfo != 0;
}

- (BOOL)hasStableUrl
{
  return self->_stableUrl != 0;
}

- (BOOL)hasShareId
{
  return self->_shareId != 0;
}

- (void)clearProtectionInfoKeysToRemoves
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_protectionInfoKeysToRemoves, a2, v2);
}

- (void)addProtectionInfoKeysToRemove:(id)a3
{
  const char *v4;
  NSMutableArray *protectionInfoKeysToRemoves;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  protectionInfoKeysToRemoves = self->_protectionInfoKeysToRemoves;
  v8 = (char *)v4;
  if (!protectionInfoKeysToRemoves)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_protectionInfoKeysToRemoves;
    self->_protectionInfoKeysToRemoves = v6;

    v4 = v8;
    protectionInfoKeysToRemoves = self->_protectionInfoKeysToRemoves;
  }
  objc_msgSend_addObject_(protectionInfoKeysToRemoves, v4, (uint64_t)v4);

}

- (unint64_t)protectionInfoKeysToRemovesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_protectionInfoKeysToRemoves, a2, v2);
}

- (id)protectionInfoKeysToRemoveAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_protectionInfoKeysToRemoves, a2, a3);
}

+ (Class)protectionInfoKeysToRemoveType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasStorageExpiration
{
  return self->_storageExpiration != 0;
}

- (BOOL)hasSignedCryptoRequirements
{
  return self->_signedCryptoRequirements != 0;
}

- (BOOL)hasAppliedCryptoFeatures
{
  return self->_appliedCryptoFeatures != 0;
}

- (BOOL)hasZoneProtectionInfoKeysToRemove
{
  return self->_zoneProtectionInfoKeysToRemove != 0;
}

- (BOOL)hasRecordProtectionInfoKeysToRemove
{
  return self->_recordProtectionInfoKeysToRemove != 0;
}

- (BOOL)hasParentReference
{
  return self->_parentReference != 0;
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
  v11.super_class = (Class)CKDPZone;
  -[CKDPZone description](&v11, sel_description);
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
  CKDPRecordZoneIdentifier *zoneIdentifier;
  void *v8;
  const char *v9;
  CKDPProtectionInfo *protectionInfo;
  void *v11;
  const char *v12;
  CKDPProtectionInfo *recordProtectionInfo;
  void *v14;
  const char *v15;
  CKDPRecordStableUrl *stableUrl;
  void *v17;
  const char *v18;
  CKDPShareIdentifier *shareId;
  void *v20;
  const char *v21;
  NSMutableArray *protectionInfoKeysToRemoves;
  CKDPStorageExpiration *storageExpiration;
  void *v24;
  const char *v25;
  CKDPZoneSignedCryptoRequirements *signedCryptoRequirements;
  void *v27;
  const char *v28;
  CKDPZoneCryptoFeatureSet *appliedCryptoFeatures;
  void *v30;
  const char *v31;
  CKDPProtectionInfoKeysToRemove *zoneProtectionInfoKeysToRemove;
  void *v33;
  const char *v34;
  CKDPProtectionInfoKeysToRemove *recordProtectionInfoKeysToRemove;
  void *v36;
  const char *v37;
  CKDPZoneZoneReference *parentReference;
  void *v39;
  const char *v40;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("zoneIdentifier"));

  }
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
  {
    objc_msgSend_dictionaryRepresentation(protectionInfo, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("protectionInfo"));

  }
  recordProtectionInfo = self->_recordProtectionInfo;
  if (recordProtectionInfo)
  {
    objc_msgSend_dictionaryRepresentation(recordProtectionInfo, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("recordProtectionInfo"));

  }
  stableUrl = self->_stableUrl;
  if (stableUrl)
  {
    objc_msgSend_dictionaryRepresentation(stableUrl, v4, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("stableUrl"));

  }
  shareId = self->_shareId;
  if (shareId)
  {
    objc_msgSend_dictionaryRepresentation(shareId, v4, v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, CFSTR("shareId"));

  }
  protectionInfoKeysToRemoves = self->_protectionInfoKeysToRemoves;
  if (protectionInfoKeysToRemoves)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)protectionInfoKeysToRemoves, CFSTR("protectionInfoKeysToRemove"));
  storageExpiration = self->_storageExpiration;
  if (storageExpiration)
  {
    objc_msgSend_dictionaryRepresentation(storageExpiration, v4, (uint64_t)protectionInfoKeysToRemoves);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, CFSTR("storageExpiration"));

  }
  signedCryptoRequirements = self->_signedCryptoRequirements;
  if (signedCryptoRequirements)
  {
    objc_msgSend_dictionaryRepresentation(signedCryptoRequirements, v4, (uint64_t)protectionInfoKeysToRemoves);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v28, (uint64_t)v27, CFSTR("signedCryptoRequirements"));

  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(appliedCryptoFeatures, v4, (uint64_t)protectionInfoKeysToRemoves);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v31, (uint64_t)v30, CFSTR("appliedCryptoFeatures"));

  }
  zoneProtectionInfoKeysToRemove = self->_zoneProtectionInfoKeysToRemove;
  if (zoneProtectionInfoKeysToRemove)
  {
    objc_msgSend_dictionaryRepresentation(zoneProtectionInfoKeysToRemove, v4, (uint64_t)protectionInfoKeysToRemoves);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v34, (uint64_t)v33, CFSTR("zoneProtectionInfoKeysToRemove"));

  }
  recordProtectionInfoKeysToRemove = self->_recordProtectionInfoKeysToRemove;
  if (recordProtectionInfoKeysToRemove)
  {
    objc_msgSend_dictionaryRepresentation(recordProtectionInfoKeysToRemove, v4, (uint64_t)protectionInfoKeysToRemoves);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v37, (uint64_t)v36, CFSTR("recordProtectionInfoKeysToRemove"));

  }
  parentReference = self->_parentReference;
  if (parentReference)
  {
    objc_msgSend_dictionaryRepresentation(parentReference, v4, (uint64_t)protectionInfoKeysToRemoves);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v40, (uint64_t)v39, CFSTR("parentReference"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAB1B80((id *)&self->super.super.isa, (uint64_t)a3);
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
  if (self->_zoneIdentifier)
    PBDataWriterWriteSubmessage();
  if (self->_protectionInfo)
    PBDataWriterWriteSubmessage();
  if (self->_recordProtectionInfo)
    PBDataWriterWriteSubmessage();
  if (self->_stableUrl)
    PBDataWriterWriteSubmessage();
  if (self->_shareId)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_protectionInfoKeysToRemoves;
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
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v12, v16, 16);
    }
    while (v8);
  }

  if (self->_storageExpiration)
    PBDataWriterWriteSubmessage();
  if (self->_signedCryptoRequirements)
    PBDataWriterWriteSubmessage();
  if (self->_appliedCryptoFeatures)
    PBDataWriterWriteSubmessage();
  if (self->_zoneProtectionInfoKeysToRemove)
    PBDataWriterWriteSubmessage();
  if (self->_recordProtectionInfoKeysToRemove)
    PBDataWriterWriteSubmessage();
  if (self->_parentReference)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  const char *v4;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  CKDPProtectionInfo *protectionInfo;
  CKDPProtectionInfo *recordProtectionInfo;
  CKDPRecordStableUrl *stableUrl;
  CKDPShareIdentifier *shareId;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  const char *v18;
  CKDPStorageExpiration *storageExpiration;
  CKDPZoneSignedCryptoRequirements *signedCryptoRequirements;
  void *v21;
  CKDPZoneCryptoFeatureSet *appliedCryptoFeatures;
  CKDPProtectionInfoKeysToRemove *zoneProtectionInfoKeysToRemove;
  CKDPProtectionInfoKeysToRemove *recordProtectionInfoKeysToRemove;
  CKDPZoneZoneReference *parentReference;
  id v26;

  v26 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
    objc_msgSend_setZoneIdentifier_(v26, v4, (uint64_t)zoneIdentifier);
  protectionInfo = self->_protectionInfo;
  if (protectionInfo)
    objc_msgSend_setProtectionInfo_(v26, v4, (uint64_t)protectionInfo);
  recordProtectionInfo = self->_recordProtectionInfo;
  if (recordProtectionInfo)
    objc_msgSend_setRecordProtectionInfo_(v26, v4, (uint64_t)recordProtectionInfo);
  stableUrl = self->_stableUrl;
  if (stableUrl)
    objc_msgSend_setStableUrl_(v26, v4, (uint64_t)stableUrl);
  shareId = self->_shareId;
  if (shareId)
    objc_msgSend_setShareId_(v26, v4, (uint64_t)shareId);
  if (objc_msgSend_protectionInfoKeysToRemovesCount(self, v4, (uint64_t)shareId))
  {
    objc_msgSend_clearProtectionInfoKeysToRemoves(v26, v10, v11);
    v14 = objc_msgSend_protectionInfoKeysToRemovesCount(self, v12, v13);
    if (v14)
    {
      v15 = v14;
      for (i = 0; i != v15; ++i)
      {
        objc_msgSend_protectionInfoKeysToRemoveAtIndex_(self, v10, i);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addProtectionInfoKeysToRemove_(v26, v18, (uint64_t)v17);

      }
    }
  }
  storageExpiration = self->_storageExpiration;
  if (storageExpiration)
    objc_msgSend_setStorageExpiration_(v26, v10, (uint64_t)storageExpiration);
  signedCryptoRequirements = self->_signedCryptoRequirements;
  v21 = v26;
  if (signedCryptoRequirements)
  {
    objc_msgSend_setSignedCryptoRequirements_(v26, v10, (uint64_t)signedCryptoRequirements);
    v21 = v26;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_setAppliedCryptoFeatures_(v26, v10, (uint64_t)appliedCryptoFeatures);
    v21 = v26;
  }
  zoneProtectionInfoKeysToRemove = self->_zoneProtectionInfoKeysToRemove;
  if (zoneProtectionInfoKeysToRemove)
  {
    objc_msgSend_setZoneProtectionInfoKeysToRemove_(v26, v10, (uint64_t)zoneProtectionInfoKeysToRemove);
    v21 = v26;
  }
  recordProtectionInfoKeysToRemove = self->_recordProtectionInfoKeysToRemove;
  if (recordProtectionInfoKeysToRemove)
  {
    objc_msgSend_setRecordProtectionInfoKeysToRemove_(v26, v10, (uint64_t)recordProtectionInfoKeysToRemove);
    v21 = v26;
  }
  parentReference = self->_parentReference;
  if (parentReference)
  {
    objc_msgSend_setParentReference_(v26, v10, (uint64_t)parentReference);
    v21 = v26;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD *v10;
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
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = (void *)v10[11];
  v10[11] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_protectionInfo, v14, (uint64_t)a3);
  v16 = (void *)v10[3];
  v10[3] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_recordProtectionInfo, v17, (uint64_t)a3);
  v19 = (void *)v10[5];
  v10[5] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_stableUrl, v20, (uint64_t)a3);
  v22 = (void *)v10[9];
  v10[9] = v21;

  v24 = objc_msgSend_copyWithZone_(self->_shareId, v23, (uint64_t)a3);
  v25 = (void *)v10[7];
  v10[7] = v24;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v26 = self->_protectionInfoKeysToRemoves;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v54, v58, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v55;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v55 != v31)
          objc_enumerationMutation(v26);
        v33 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v54 + 1) + 8 * v32), v29, (uint64_t)a3, (_QWORD)v54);
        objc_msgSend_addProtectionInfoKeysToRemove_(v10, v34, (uint64_t)v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v54, v58, 16);
    }
    while (v30);
  }

  v36 = objc_msgSend_copyWithZone_(self->_storageExpiration, v35, (uint64_t)a3);
  v37 = (void *)v10[10];
  v10[10] = v36;

  v39 = objc_msgSend_copyWithZone_(self->_signedCryptoRequirements, v38, (uint64_t)a3);
  v40 = (void *)v10[8];
  v10[8] = v39;

  v42 = objc_msgSend_copyWithZone_(self->_appliedCryptoFeatures, v41, (uint64_t)a3);
  v43 = (void *)v10[1];
  v10[1] = v42;

  v45 = objc_msgSend_copyWithZone_(self->_zoneProtectionInfoKeysToRemove, v44, (uint64_t)a3);
  v46 = (void *)v10[12];
  v10[12] = v45;

  v48 = objc_msgSend_copyWithZone_(self->_recordProtectionInfoKeysToRemove, v47, (uint64_t)a3);
  v49 = (void *)v10[6];
  v10[6] = v48;

  v51 = objc_msgSend_copyWithZone_(self->_parentReference, v50, (uint64_t)a3);
  v52 = (void *)v10[2];
  v10[2] = v51;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v9;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v11;
  CKDPProtectionInfo *recordProtectionInfo;
  uint64_t v13;
  CKDPRecordStableUrl *stableUrl;
  uint64_t v15;
  CKDPShareIdentifier *shareId;
  uint64_t v17;
  NSMutableArray *protectionInfoKeysToRemoves;
  uint64_t v19;
  CKDPStorageExpiration *storageExpiration;
  uint64_t v21;
  CKDPZoneSignedCryptoRequirements *signedCryptoRequirements;
  uint64_t v23;
  CKDPZoneCryptoFeatureSet *appliedCryptoFeatures;
  uint64_t v25;
  CKDPProtectionInfoKeysToRemove *zoneProtectionInfoKeysToRemove;
  uint64_t v27;
  CKDPProtectionInfoKeysToRemove *recordProtectionInfoKeysToRemove;
  uint64_t v29;
  CKDPZoneZoneReference *parentReference;
  uint64_t v31;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_26;
  zoneIdentifier = self->_zoneIdentifier;
  v9 = v4[11];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9))
      goto LABEL_26;
  }
  protectionInfo = self->_protectionInfo;
  v11 = v4[3];
  if ((unint64_t)protectionInfo | v11)
  {
    if (!objc_msgSend_isEqual_(protectionInfo, v7, v11))
      goto LABEL_26;
  }
  recordProtectionInfo = self->_recordProtectionInfo;
  v13 = v4[5];
  if ((unint64_t)recordProtectionInfo | v13)
  {
    if (!objc_msgSend_isEqual_(recordProtectionInfo, v7, v13))
      goto LABEL_26;
  }
  stableUrl = self->_stableUrl;
  v15 = v4[9];
  if ((unint64_t)stableUrl | v15)
  {
    if (!objc_msgSend_isEqual_(stableUrl, v7, v15))
      goto LABEL_26;
  }
  shareId = self->_shareId;
  v17 = v4[7];
  if ((unint64_t)shareId | v17)
  {
    if (!objc_msgSend_isEqual_(shareId, v7, v17))
      goto LABEL_26;
  }
  protectionInfoKeysToRemoves = self->_protectionInfoKeysToRemoves;
  v19 = v4[4];
  if ((unint64_t)protectionInfoKeysToRemoves | v19)
  {
    if (!objc_msgSend_isEqual_(protectionInfoKeysToRemoves, v7, v19))
      goto LABEL_26;
  }
  storageExpiration = self->_storageExpiration;
  v21 = v4[10];
  if ((unint64_t)storageExpiration | v21)
  {
    if (!objc_msgSend_isEqual_(storageExpiration, v7, v21))
      goto LABEL_26;
  }
  signedCryptoRequirements = self->_signedCryptoRequirements;
  v23 = v4[8];
  if ((unint64_t)signedCryptoRequirements | v23)
  {
    if (!objc_msgSend_isEqual_(signedCryptoRequirements, v7, v23))
      goto LABEL_26;
  }
  if (((appliedCryptoFeatures = self->_appliedCryptoFeatures,
         v25 = v4[1],
         !((unint64_t)appliedCryptoFeatures | v25))
     || objc_msgSend_isEqual_(appliedCryptoFeatures, v7, v25))
    && ((zoneProtectionInfoKeysToRemove = self->_zoneProtectionInfoKeysToRemove,
         v27 = v4[12],
         !((unint64_t)zoneProtectionInfoKeysToRemove | v27))
     || objc_msgSend_isEqual_(zoneProtectionInfoKeysToRemove, v7, v27))
    && ((recordProtectionInfoKeysToRemove = self->_recordProtectionInfoKeysToRemove,
         v29 = v4[6],
         !((unint64_t)recordProtectionInfoKeysToRemove | v29))
     || objc_msgSend_isEqual_(recordProtectionInfoKeysToRemove, v7, v29)))
  {
    parentReference = self->_parentReference;
    v31 = v4[2];
    if ((unint64_t)parentReference | v31)
      isEqual = objc_msgSend_isEqual_(parentReference, v7, v31);
    else
      isEqual = 1;
  }
  else
  {
LABEL_26:
    isEqual = 0;
  }

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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;

  v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  v7 = objc_msgSend_hash(self->_protectionInfo, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_recordProtectionInfo, v8, v9);
  v13 = v7 ^ v10 ^ objc_msgSend_hash(self->_stableUrl, v11, v12);
  v16 = objc_msgSend_hash(self->_shareId, v14, v15);
  v19 = v16 ^ objc_msgSend_hash(self->_protectionInfoKeysToRemoves, v17, v18);
  v22 = v13 ^ v19 ^ objc_msgSend_hash(self->_storageExpiration, v20, v21);
  v25 = objc_msgSend_hash(self->_signedCryptoRequirements, v23, v24);
  v28 = v25 ^ objc_msgSend_hash(self->_appliedCryptoFeatures, v26, v27);
  v31 = v28 ^ objc_msgSend_hash(self->_zoneProtectionInfoKeysToRemove, v29, v30);
  v34 = v22 ^ v31 ^ objc_msgSend_hash(self->_recordProtectionInfoKeysToRemove, v32, v33);
  return v34 ^ objc_msgSend_hash(self->_parentReference, v35, v36);
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecordZoneIdentifier *zoneIdentifier;
  uint64_t v7;
  CKDPProtectionInfo *protectionInfo;
  uint64_t v9;
  CKDPProtectionInfo *recordProtectionInfo;
  uint64_t v11;
  CKDPRecordStableUrl *stableUrl;
  uint64_t v13;
  CKDPShareIdentifier *shareId;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  const char *v23;
  CKDPStorageExpiration *storageExpiration;
  uint64_t v25;
  CKDPZoneSignedCryptoRequirements *signedCryptoRequirements;
  uint64_t v27;
  CKDPZoneCryptoFeatureSet *appliedCryptoFeatures;
  uint64_t v29;
  CKDPProtectionInfoKeysToRemove *zoneProtectionInfoKeysToRemove;
  uint64_t v31;
  CKDPProtectionInfoKeysToRemove *recordProtectionInfoKeysToRemove;
  uint64_t v33;
  CKDPZoneZoneReference *parentReference;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v7 = *((_QWORD *)v5 + 11);
  if (zoneIdentifier)
  {
    if (v7)
      objc_msgSend_mergeFrom_(zoneIdentifier, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setZoneIdentifier_(self, v4, v7);
  }
  protectionInfo = self->_protectionInfo;
  v9 = *((_QWORD *)v5 + 3);
  if (protectionInfo)
  {
    if (v9)
      objc_msgSend_mergeFrom_(protectionInfo, v4, v9);
  }
  else if (v9)
  {
    objc_msgSend_setProtectionInfo_(self, v4, v9);
  }
  recordProtectionInfo = self->_recordProtectionInfo;
  v11 = *((_QWORD *)v5 + 5);
  if (recordProtectionInfo)
  {
    if (v11)
      objc_msgSend_mergeFrom_(recordProtectionInfo, v4, v11);
  }
  else if (v11)
  {
    objc_msgSend_setRecordProtectionInfo_(self, v4, v11);
  }
  stableUrl = self->_stableUrl;
  v13 = *((_QWORD *)v5 + 9);
  if (stableUrl)
  {
    if (v13)
      objc_msgSend_mergeFrom_(stableUrl, v4, v13);
  }
  else if (v13)
  {
    objc_msgSend_setStableUrl_(self, v4, v13);
  }
  shareId = self->_shareId;
  v15 = *((_QWORD *)v5 + 7);
  if (shareId)
  {
    if (v15)
      objc_msgSend_mergeFrom_(shareId, v4, v15);
  }
  else if (v15)
  {
    objc_msgSend_setShareId_(self, v4, v15);
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = *((id *)v5 + 4);
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v36, v40, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v16);
        objc_msgSend_addProtectionInfoKeysToRemove_(self, v19, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), (_QWORD)v36);
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v36, v40, 16);
    }
    while (v20);
  }

  storageExpiration = self->_storageExpiration;
  v25 = *((_QWORD *)v5 + 10);
  if (storageExpiration)
  {
    if (v25)
      objc_msgSend_mergeFrom_(storageExpiration, v23, v25);
  }
  else if (v25)
  {
    objc_msgSend_setStorageExpiration_(self, v23, v25);
  }
  signedCryptoRequirements = self->_signedCryptoRequirements;
  v27 = *((_QWORD *)v5 + 8);
  if (signedCryptoRequirements)
  {
    if (v27)
      objc_msgSend_mergeFrom_(signedCryptoRequirements, v23, v27);
  }
  else if (v27)
  {
    objc_msgSend_setSignedCryptoRequirements_(self, v23, v27);
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  v29 = *((_QWORD *)v5 + 1);
  if (appliedCryptoFeatures)
  {
    if (v29)
      objc_msgSend_mergeFrom_(appliedCryptoFeatures, v23, v29);
  }
  else if (v29)
  {
    objc_msgSend_setAppliedCryptoFeatures_(self, v23, v29);
  }
  zoneProtectionInfoKeysToRemove = self->_zoneProtectionInfoKeysToRemove;
  v31 = *((_QWORD *)v5 + 12);
  if (zoneProtectionInfoKeysToRemove)
  {
    if (v31)
      objc_msgSend_mergeFrom_(zoneProtectionInfoKeysToRemove, v23, v31);
  }
  else if (v31)
  {
    objc_msgSend_setZoneProtectionInfoKeysToRemove_(self, v23, v31);
  }
  recordProtectionInfoKeysToRemove = self->_recordProtectionInfoKeysToRemove;
  v33 = *((_QWORD *)v5 + 6);
  if (recordProtectionInfoKeysToRemove)
  {
    if (v33)
      objc_msgSend_mergeFrom_(recordProtectionInfoKeysToRemove, v23, v33);
  }
  else if (v33)
  {
    objc_msgSend_setRecordProtectionInfoKeysToRemove_(self, v23, v33);
  }
  parentReference = self->_parentReference;
  v35 = *((_QWORD *)v5 + 2);
  if (parentReference)
  {
    if (v35)
      objc_msgSend_mergeFrom_(parentReference, v23, v35);
  }
  else if (v35)
  {
    objc_msgSend_setParentReference_(self, v23, v35);
  }

}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIdentifier, a3);
}

- (CKDPProtectionInfo)protectionInfo
{
  return self->_protectionInfo;
}

- (void)setProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfo, a3);
}

- (CKDPProtectionInfo)recordProtectionInfo
{
  return self->_recordProtectionInfo;
}

- (void)setRecordProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_recordProtectionInfo, a3);
}

- (CKDPRecordStableUrl)stableUrl
{
  return self->_stableUrl;
}

- (void)setStableUrl:(id)a3
{
  objc_storeStrong((id *)&self->_stableUrl, a3);
}

- (CKDPShareIdentifier)shareId
{
  return self->_shareId;
}

- (void)setShareId:(id)a3
{
  objc_storeStrong((id *)&self->_shareId, a3);
}

- (NSMutableArray)protectionInfoKeysToRemoves
{
  return self->_protectionInfoKeysToRemoves;
}

- (void)setProtectionInfoKeysToRemoves:(id)a3
{
  objc_storeStrong((id *)&self->_protectionInfoKeysToRemoves, a3);
}

- (CKDPStorageExpiration)storageExpiration
{
  return self->_storageExpiration;
}

- (void)setStorageExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_storageExpiration, a3);
}

- (CKDPZoneSignedCryptoRequirements)signedCryptoRequirements
{
  return self->_signedCryptoRequirements;
}

- (void)setSignedCryptoRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_signedCryptoRequirements, a3);
}

- (CKDPZoneCryptoFeatureSet)appliedCryptoFeatures
{
  return self->_appliedCryptoFeatures;
}

- (void)setAppliedCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, a3);
}

- (CKDPProtectionInfoKeysToRemove)zoneProtectionInfoKeysToRemove
{
  return self->_zoneProtectionInfoKeysToRemove;
}

- (void)setZoneProtectionInfoKeysToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_zoneProtectionInfoKeysToRemove, a3);
}

- (CKDPProtectionInfoKeysToRemove)recordProtectionInfoKeysToRemove
{
  return self->_recordProtectionInfoKeysToRemove;
}

- (void)setRecordProtectionInfoKeysToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_recordProtectionInfoKeysToRemove, a3);
}

- (CKDPZoneZoneReference)parentReference
{
  return self->_parentReference;
}

- (void)setParentReference:(id)a3
{
  objc_storeStrong((id *)&self->_parentReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneProtectionInfoKeysToRemove, 0);
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_storageExpiration, 0);
  objc_storeStrong((id *)&self->_stableUrl, 0);
  objc_storeStrong((id *)&self->_signedCryptoRequirements, 0);
  objc_storeStrong((id *)&self->_shareId, 0);
  objc_storeStrong((id *)&self->_recordProtectionInfoKeysToRemove, 0);
  objc_storeStrong((id *)&self->_recordProtectionInfo, 0);
  objc_storeStrong((id *)&self->_protectionInfoKeysToRemoves, 0);
  objc_storeStrong((id *)&self->_protectionInfo, 0);
  objc_storeStrong((id *)&self->_parentReference, 0);
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, 0);
}

@end
