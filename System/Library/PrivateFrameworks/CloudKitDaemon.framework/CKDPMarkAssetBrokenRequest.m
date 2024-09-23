@implementation CKDPMarkAssetBrokenRequest

+ (id)options
{
  if (qword_1ED700A90 != -1)
    dispatch_once(&qword_1ED700A90, &unk_1E78362E0);
  return (id)qword_1ED700A88;
}

- (BOOL)hasBrokenAssetRecordID
{
  return self->_brokenAssetRecordID != 0;
}

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (void)setListIndex:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_listIndex = a3;
}

- (void)setHasListIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasListIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearFileSignatures
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_fileSignatures, a2, v2);
}

- (void)addFileSignature:(id)a3
{
  const char *v4;
  NSMutableArray *fileSignatures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  fileSignatures = self->_fileSignatures;
  v8 = (char *)v4;
  if (!fileSignatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_fileSignatures;
    self->_fileSignatures = v6;

    v4 = v8;
    fileSignatures = self->_fileSignatures;
  }
  objc_msgSend_addObject_(fileSignatures, v4, (uint64_t)v4);

}

- (unint64_t)fileSignaturesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_fileSignatures, a2, v2);
}

- (id)fileSignatureAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_fileSignatures, a2, a3);
}

+ (Class)fileSignatureType
{
  return (Class)objc_opt_class();
}

- (void)clearReferenceSignatures
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_referenceSignatures, a2, v2);
}

- (void)addReferenceSignature:(id)a3
{
  const char *v4;
  NSMutableArray *referenceSignatures;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  referenceSignatures = self->_referenceSignatures;
  v8 = (char *)v4;
  if (!referenceSignatures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_referenceSignatures;
    self->_referenceSignatures = v6;

    v4 = v8;
    referenceSignatures = self->_referenceSignatures;
  }
  objc_msgSend_addObject_(referenceSignatures, v4, (uint64_t)v4);

}

- (unint64_t)referenceSignaturesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_referenceSignatures, a2, v2);
}

- (id)referenceSignatureAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_referenceSignatures, a2, a3);
}

+ (Class)referenceSignatureType
{
  return (Class)objc_opt_class();
}

- (void)setIsPackage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isPackage = a3;
}

- (void)setHasIsPackage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsPackage
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAffectedRecordType
{
  return self->_affectedRecordType != 0;
}

- (void)setSkipWriteMissingAssetStatusRecord:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_skipWriteMissingAssetStatusRecord = a3;
}

- (void)setHasSkipWriteMissingAssetStatusRecord:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSkipWriteMissingAssetStatusRecord
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v11.super_class = (Class)CKDPMarkAssetBrokenRequest;
  -[CKDPMarkAssetBrokenRequest description](&v11, sel_description);
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
  CKDPRecordIdentifier *brokenAssetRecordID;
  void *v8;
  const char *v9;
  NSString *fieldName;
  void *v11;
  const char *v12;
  NSMutableArray *fileSignatures;
  NSMutableArray *referenceSignatures;
  void *v15;
  const char *v16;
  NSString *affectedRecordType;
  void *v18;
  const char *v19;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brokenAssetRecordID = self->_brokenAssetRecordID;
  if (brokenAssetRecordID)
  {
    objc_msgSend_dictionaryRepresentation(brokenAssetRecordID, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("brokenAssetRecordID"));

  }
  fieldName = self->_fieldName;
  if (fieldName)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)fieldName, CFSTR("fieldName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v4, self->_listIndex);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("listIndex"));

  }
  fileSignatures = self->_fileSignatures;
  if (fileSignatures)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)fileSignatures, CFSTR("fileSignature"));
  referenceSignatures = self->_referenceSignatures;
  if (referenceSignatures)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)referenceSignatures, CFSTR("referenceSignature"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_isPackage);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, CFSTR("isPackage"));

  }
  affectedRecordType = self->_affectedRecordType;
  if (affectedRecordType)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)affectedRecordType, CFSTR("affectedRecordType"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_skipWriteMissingAssetStatusRecord);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, CFSTR("skipWriteMissingAssetStatusRecord"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEBADFC8((uint64_t)self, (uint64_t)a3);
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
  if (self->_brokenAssetRecordID)
    PBDataWriterWriteSubmessage();
  if (self->_fieldName)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_fileSignatures;
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
        PBDataWriterWriteDataField();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_referenceSignatures;
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

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_affectedRecordType)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteBOOLField();

}

- (unsigned)requestTypeCode
{
  return 84;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPRecordIdentifier *brokenAssetRecordID;
  NSString *fieldName;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  const char *v25;
  _BYTE *v26;
  NSString *affectedRecordType;
  _BYTE *v28;

  v4 = a3;
  brokenAssetRecordID = self->_brokenAssetRecordID;
  v28 = v4;
  if (brokenAssetRecordID)
  {
    objc_msgSend_setBrokenAssetRecordID_(v4, v5, (uint64_t)brokenAssetRecordID);
    v4 = v28;
  }
  fieldName = self->_fieldName;
  if (fieldName)
  {
    objc_msgSend_setFieldName_(v28, v5, (uint64_t)fieldName);
    v4 = v28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_listIndex;
    v4[60] |= 1u;
  }
  if (objc_msgSend_fileSignaturesCount(self, v5, (uint64_t)fieldName))
  {
    objc_msgSend_clearFileSignatures(v28, v8, v9);
    v12 = objc_msgSend_fileSignaturesCount(self, v10, v11);
    if (v12)
    {
      v13 = v12;
      for (i = 0; i != v13; ++i)
      {
        objc_msgSend_fileSignatureAtIndex_(self, v8, i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addFileSignature_(v28, v16, (uint64_t)v15);

      }
    }
  }
  if (objc_msgSend_referenceSignaturesCount(self, v8, v9))
  {
    objc_msgSend_clearReferenceSignatures(v28, v17, v18);
    v21 = objc_msgSend_referenceSignaturesCount(self, v19, v20);
    if (v21)
    {
      v22 = v21;
      for (j = 0; j != v22; ++j)
      {
        objc_msgSend_referenceSignatureAtIndex_(self, v17, j);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addReferenceSignature_(v28, v25, (uint64_t)v24);

      }
    }
  }
  v26 = v28;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v28[56] = self->_isPackage;
    v28[60] |= 2u;
  }
  affectedRecordType = self->_affectedRecordType;
  if (affectedRecordType)
  {
    objc_msgSend_setAffectedRecordType_(v28, v17, (uint64_t)affectedRecordType);
    v26 = v28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v26[57] = self->_skipWriteMissingAssetStatusRecord;
    v26[60] |= 4u;
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
  uint64_t i;
  void *v24;
  const char *v25;
  NSMutableArray *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_brokenAssetRecordID, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_fieldName, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v10 + 40) = self->_listIndex;
    *(_BYTE *)(v10 + 60) |= 1u;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v17 = self->_fileSignatures;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v43, v48, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v44 != v22)
          objc_enumerationMutation(v17);
        v24 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v43 + 1) + 8 * i), v20, (uint64_t)a3);
        objc_msgSend_addFileSignature_((void *)v10, v25, (uint64_t)v24);

      }
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v43, v48, 16);
    }
    while (v21);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v26 = self->_referenceSignatures;
  v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v39, v47, 16);
  if (v28)
  {
    v30 = v28;
    v31 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(v26);
        v33 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v39 + 1) + 8 * j), v29, (uint64_t)a3, (_QWORD)v39);
        objc_msgSend_addReferenceSignature_((void *)v10, v34, (uint64_t)v33);

      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v39, v47, 16);
    }
    while (v30);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v10 + 56) = self->_isPackage;
    *(_BYTE *)(v10 + 60) |= 2u;
  }
  v36 = objc_msgSend_copyWithZone_(self->_affectedRecordType, v35, (uint64_t)a3, (_QWORD)v39);
  v37 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v36;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v10 + 57) = self->_skipWriteMissingAssetStatusRecord;
    *(_BYTE *)(v10 + 60) |= 4u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPRecordIdentifier *brokenAssetRecordID;
  uint64_t v9;
  NSString *fieldName;
  uint64_t v11;
  NSMutableArray *fileSignatures;
  uint64_t v13;
  NSMutableArray *referenceSignatures;
  uint64_t v15;
  char has;
  char v17;
  NSString *affectedRecordType;
  uint64_t v19;
  BOOL v20;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_28;
  brokenAssetRecordID = self->_brokenAssetRecordID;
  v9 = v4[2];
  if ((unint64_t)brokenAssetRecordID | v9)
  {
    if (!objc_msgSend_isEqual_(brokenAssetRecordID, v7, v9))
      goto LABEL_28;
  }
  fieldName = self->_fieldName;
  v11 = v4[3];
  if ((unint64_t)fieldName | v11)
  {
    if (!objc_msgSend_isEqual_(fieldName, v7, v11))
      goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_listIndex != *((_DWORD *)v4 + 10))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_28;
  }
  fileSignatures = self->_fileSignatures;
  v13 = v4[4];
  if ((unint64_t)fileSignatures | v13 && !objc_msgSend_isEqual_(fileSignatures, v7, v13))
    goto LABEL_28;
  referenceSignatures = self->_referenceSignatures;
  v15 = v4[6];
  if ((unint64_t)referenceSignatures | v15)
  {
    if (!objc_msgSend_isEqual_(referenceSignatures, v7, v15))
      goto LABEL_28;
  }
  has = (char)self->_has;
  v17 = *((_BYTE *)v4 + 60);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0)
      goto LABEL_28;
    if (self->_isPackage)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  affectedRecordType = self->_affectedRecordType;
  v19 = v4[1];
  if ((unint64_t)affectedRecordType | v19)
  {
    if (!objc_msgSend_isEqual_(affectedRecordType, v7, v19))
      goto LABEL_28;
    has = (char)self->_has;
    v17 = *((_BYTE *)v4 + 60);
  }
  v20 = (v17 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v17 & 4) != 0)
    {
      if (self->_skipWriteMissingAssetStatusRecord)
      {
        if (!*((_BYTE *)v4 + 57))
          goto LABEL_28;
      }
      else if (*((_BYTE *)v4 + 57))
      {
        goto LABEL_28;
      }
      v20 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v20 = 0;
  }
LABEL_29:

  return v20;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = objc_msgSend_hash(self->_brokenAssetRecordID, a2, v2);
  v9 = objc_msgSend_hash(self->_fieldName, v5, v6);
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v10 = 2654435761 * self->_listIndex;
  else
    v10 = 0;
  v11 = objc_msgSend_hash(self->_fileSignatures, v7, v8);
  v16 = objc_msgSend_hash(self->_referenceSignatures, v12, v13);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v17 = 2654435761 * self->_isPackage;
  else
    v17 = 0;
  v18 = objc_msgSend_hash(self->_affectedRecordType, v14, v15);
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v19 = 2654435761 * self->_skipWriteMissingAssetStatusRecord;
  else
    v19 = 0;
  return v9 ^ v4 ^ v10 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  const char *v4;
  id v5;
  CKDPRecordIdentifier *brokenAssetRecordID;
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
  const char *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  brokenAssetRecordID = self->_brokenAssetRecordID;
  v7 = *((_QWORD *)v5 + 2);
  if (brokenAssetRecordID)
  {
    if (v7)
      objc_msgSend_mergeFrom_(brokenAssetRecordID, v4, v7);
  }
  else if (v7)
  {
    objc_msgSend_setBrokenAssetRecordID_(self, v4, v7);
  }
  v8 = *((_QWORD *)v5 + 3);
  if (v8)
    objc_msgSend_setFieldName_(self, v4, v8);
  if ((*((_BYTE *)v5 + 60) & 1) != 0)
  {
    self->_listIndex = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = *((id *)v5 + 4);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v29, v34, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend_addFileSignature_(self, v12, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v29, v34, 16);
    }
    while (v13);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = *((id *)v5 + 6);
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v25, v33, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v16);
        objc_msgSend_addReferenceSignature_(self, v19, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v25, v33, 16);
    }
    while (v20);
  }

  if ((*((_BYTE *)v5 + 60) & 2) != 0)
  {
    self->_isPackage = *((_BYTE *)v5 + 56);
    *(_BYTE *)&self->_has |= 2u;
  }
  v24 = *((_QWORD *)v5 + 1);
  if (v24)
    objc_msgSend_setAffectedRecordType_(self, v23, v24);
  if ((*((_BYTE *)v5 + 60) & 4) != 0)
  {
    self->_skipWriteMissingAssetStatusRecord = *((_BYTE *)v5 + 57);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (CKDPRecordIdentifier)brokenAssetRecordID
{
  return self->_brokenAssetRecordID;
}

- (void)setBrokenAssetRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_brokenAssetRecordID, a3);
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (void)setFieldName:(id)a3
{
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (int)listIndex
{
  return self->_listIndex;
}

- (NSMutableArray)fileSignatures
{
  return self->_fileSignatures;
}

- (void)setFileSignatures:(id)a3
{
  objc_storeStrong((id *)&self->_fileSignatures, a3);
}

- (NSMutableArray)referenceSignatures
{
  return self->_referenceSignatures;
}

- (void)setReferenceSignatures:(id)a3
{
  objc_storeStrong((id *)&self->_referenceSignatures, a3);
}

- (BOOL)isPackage
{
  return self->_isPackage;
}

- (NSString)affectedRecordType
{
  return self->_affectedRecordType;
}

- (void)setAffectedRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_affectedRecordType, a3);
}

- (BOOL)skipWriteMissingAssetStatusRecord
{
  return self->_skipWriteMissingAssetStatusRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceSignatures, 0);
  objc_storeStrong((id *)&self->_fileSignatures, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_brokenAssetRecordID, 0);
  objc_storeStrong((id *)&self->_affectedRecordType, 0);
}

@end
