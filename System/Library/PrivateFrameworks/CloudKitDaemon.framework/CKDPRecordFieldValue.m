@implementation CKDPRecordFieldValue

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bytesValue)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_dateValue)
    PBDataWriterWriteSubmessage();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  if (self->_locationValue)
    PBDataWriterWriteSubmessage();
  if (self->_referenceValue)
    PBDataWriterWriteSubmessage();
  if (self->_assetValue)
    PBDataWriterWriteSubmessage();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_listValues;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  if (self->_packageValue)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_appliedCryptoFeatures)
    PBDataWriterWriteSubmessage();
  if (self->_streamingAssetValue)
    PBDataWriterWriteSubmessage();
  if (self->_mergeableValue)
    PBDataWriterWriteSubmessage();
  if (self->_encryptedMergeableValue)
    PBDataWriterWriteSubmessage();

}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_streamingAssetValue, 0);
  objc_storeStrong((id *)&self->_referenceValue, 0);
  objc_storeStrong((id *)&self->_packageValue, 0);
  objc_storeStrong((id *)&self->_mergeableValue, 0);
  objc_storeStrong((id *)&self->_locationValue, 0);
  objc_storeStrong((id *)&self->_listValues, 0);
  objc_storeStrong((id *)&self->_encryptedMergeableValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
  objc_storeStrong((id *)&self->_assetValue, 0);
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, 0);
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0x1D && ((0x199FFFFFu >> v3) & 1) != 0)
  {
    v4 = off_1E7833618[v3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("(unknown: %i)"), a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("bytesType")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v5, (uint64_t)CFSTR("dateType")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, (uint64_t)CFSTR("stringType")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v8, (uint64_t)CFSTR("locationType")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v9, (uint64_t)CFSTR("referenceType")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v10, (uint64_t)CFSTR("assetType")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v11, (uint64_t)CFSTR("int64Type")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v12, (uint64_t)CFSTR("doubleType")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v13, (uint64_t)CFSTR("emptyList")) & 1) != 0)
  {
    v6 = 9;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v14, (uint64_t)CFSTR("dateListType")) & 1) != 0)
  {
    v6 = 10;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v15, (uint64_t)CFSTR("bytesListType")) & 1) != 0)
  {
    v6 = 11;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v16, (uint64_t)CFSTR("locationListType")) & 1) != 0)
  {
    v6 = 12;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v17, (uint64_t)CFSTR("referenceListType")) & 1) != 0)
  {
    v6 = 13;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v18, (uint64_t)CFSTR("assetListType")) & 1) != 0)
  {
    v6 = 14;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v19, (uint64_t)CFSTR("stringListType")) & 1) != 0)
  {
    v6 = 15;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v20, (uint64_t)CFSTR("listType")) & 1) != 0)
  {
    v6 = 16;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v21, (uint64_t)CFSTR("int64ListType")) & 1) != 0)
  {
    v6 = 17;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v22, (uint64_t)CFSTR("doubleListType")) & 1) != 0)
  {
    v6 = 18;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v23, (uint64_t)CFSTR("packageType")) & 1) != 0)
  {
    v6 = 19;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v24, (uint64_t)CFSTR("encryptedBytesType")) & 1) != 0)
  {
    v6 = 20;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v25, (uint64_t)CFSTR("encryptedBytesListType")) & 1) != 0)
  {
    v6 = 21;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v26, (uint64_t)CFSTR("streamingAsset")) & 1) != 0)
  {
    v6 = 24;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v27, (uint64_t)CFSTR("streamingAssetList")) & 1) != 0)
  {
    v6 = 25;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v28, (uint64_t)CFSTR("mergeableValueType")) & 1) != 0)
  {
    v6 = 28;
  }
  else if (objc_msgSend_isEqualToString_(v3, v29, (uint64_t)CFSTR("encryptedMergeableValueType")))
  {
    v6 = 29;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
}

- (void)setSignedValue:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_signedValue = a3;
}

- (void)setHasSignedValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignedValue
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCkDoubleValue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_ckDoubleValue = a3;
}

- (void)setHasCkDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCkDoubleValue
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasLocationValue
{
  return self->_locationValue != 0;
}

- (BOOL)hasReferenceValue
{
  return self->_referenceValue != 0;
}

- (BOOL)hasAssetValue
{
  return self->_assetValue != 0;
}

- (void)clearListValues
{
  uint64_t v2;

  objc_msgSend_removeAllObjects(self->_listValues, a2, v2);
}

- (void)addListValue:(id)a3
{
  const char *v4;
  NSMutableArray *listValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  char *v8;

  v4 = (const char *)a3;
  listValues = self->_listValues;
  v8 = (char *)v4;
  if (!listValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_listValues;
    self->_listValues = v6;

    v4 = v8;
    listValues = self->_listValues;
  }
  objc_msgSend_addObject_(listValues, v4, (uint64_t)v4);

}

- (unint64_t)listValuesCount
{
  uint64_t v2;

  return objc_msgSend_count(self->_listValues, a2, v2);
}

- (id)listValueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_listValues, a2, a3);
}

+ (Class)listValueType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPackageValue
{
  return self->_packageValue != 0;
}

- (BOOL)hasStreamingAssetValue
{
  return self->_streamingAssetValue != 0;
}

- (BOOL)hasMergeableValue
{
  return self->_mergeableValue != 0;
}

- (BOOL)hasEncryptedMergeableValue
{
  return self->_encryptedMergeableValue != 0;
}

- (void)setIsEncrypted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isEncrypted = a3;
}

- (void)setHasIsEncrypted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsEncrypted
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasAppliedCryptoFeatures
{
  return self->_appliedCryptoFeatures != 0;
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
  v11.super_class = (Class)CKDPRecordFieldValue;
  -[CKDPRecordFieldValue description](&v11, sel_description);
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
  void *v5;
  unsigned int v6;
  __CFString *v7;
  const char *v8;
  NSData *bytesValue;
  char has;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  CKDPDate *dateValue;
  void *v16;
  const char *v17;
  NSString *stringValue;
  CKDPLocationCoordinate *locationValue;
  void *v20;
  const char *v21;
  CKDPRecordReference *referenceValue;
  void *v23;
  const char *v24;
  CKDPAsset *assetValue;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  NSMutableArray *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  const char *v45;
  const char *v46;
  CKDPPackage *packageValue;
  void *v48;
  const char *v49;
  CKDPStreamingAsset *streamingAssetValue;
  void *v51;
  const char *v52;
  CKDPMergeableValue *mergeableValue;
  void *v54;
  const char *v55;
  CKDPEncryptedMergeableValue *encryptedMergeableValue;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  CKDPFieldCryptoFeatureSet *appliedCryptoFeatures;
  void *v62;
  const char *v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = self->_type - 1;
    if (v6 < 0x1D && ((0x199FFFFFu >> v6) & 1) != 0)
    {
      v7 = off_1E7833618[v6];
      objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, CFSTR("type"));
    }
    else
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v4, (uint64_t)CFSTR("(unknown: %i)"), self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, CFSTR("type"));
    }

  }
  bytesValue = self->_bytesValue;
  if (bytesValue)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)bytesValue, CFSTR("bytesValue"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_signedValue);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v12, (uint64_t)v11, CFSTR("signedValue"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v4, (uint64_t)bytesValue, self->_ckDoubleValue);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, CFSTR("ckDoubleValue"));

  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    objc_msgSend_dictionaryRepresentation(dateValue, v4, (uint64_t)bytesValue);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v17, (uint64_t)v16, CFSTR("dateValue"));

  }
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)stringValue, CFSTR("stringValue"));
  locationValue = self->_locationValue;
  if (locationValue)
  {
    objc_msgSend_dictionaryRepresentation(locationValue, v4, (uint64_t)stringValue);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v21, (uint64_t)v20, CFSTR("locationValue"));

  }
  referenceValue = self->_referenceValue;
  if (referenceValue)
  {
    objc_msgSend_dictionaryRepresentation(referenceValue, v4, (uint64_t)stringValue);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v24, (uint64_t)v23, CFSTR("referenceValue"));

  }
  assetValue = self->_assetValue;
  if (assetValue)
  {
    objc_msgSend_dictionaryRepresentation(assetValue, v4, (uint64_t)stringValue);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v27, (uint64_t)v26, CFSTR("assetValue"));

  }
  if (objc_msgSend_count(self->_listValues, v4, (uint64_t)stringValue))
  {
    v30 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v33 = objc_msgSend_count(self->_listValues, v31, v32);
    v35 = (void *)objc_msgSend_initWithCapacity_(v30, v34, v33);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v36 = self->_listValues;
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v65, v69, 16);
    if (v38)
    {
      v41 = v38;
      v42 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v66 != v42)
            objc_enumerationMutation(v36);
          objc_msgSend_dictionaryRepresentation(*(void **)(*((_QWORD *)&v65 + 1) + 8 * i), v39, v40);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v35, v45, (uint64_t)v44);

        }
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v65, v69, 16);
      }
      while (v41);
    }

    objc_msgSend_setObject_forKey_(v5, v46, (uint64_t)v35, CFSTR("listValue"));
  }
  packageValue = self->_packageValue;
  if (packageValue)
  {
    objc_msgSend_dictionaryRepresentation(packageValue, v28, v29);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v49, (uint64_t)v48, CFSTR("packageValue"));

  }
  streamingAssetValue = self->_streamingAssetValue;
  if (streamingAssetValue)
  {
    objc_msgSend_dictionaryRepresentation(streamingAssetValue, v28, v29);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v52, (uint64_t)v51, CFSTR("streamingAssetValue"));

  }
  mergeableValue = self->_mergeableValue;
  if (mergeableValue)
  {
    objc_msgSend_dictionaryRepresentation(mergeableValue, v28, v29);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v55, (uint64_t)v54, CFSTR("mergeableValue"));

  }
  encryptedMergeableValue = self->_encryptedMergeableValue;
  if (encryptedMergeableValue)
  {
    objc_msgSend_dictionaryRepresentation(encryptedMergeableValue, v28, v29);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v58, (uint64_t)v57, CFSTR("encryptedMergeableValue"));

  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v28, self->_isEncrypted);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v60, (uint64_t)v59, CFSTR("isEncrypted"));

  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_dictionaryRepresentation(appliedCryptoFeatures, v28, v29);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v63, (uint64_t)v62, CFSTR("appliedCryptoFeatures"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordFieldValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  const char *v5;
  NSData *bytesValue;
  char has;
  CKDPDate *dateValue;
  NSString *stringValue;
  CKDPLocationCoordinate *locationValue;
  CKDPRecordReference *referenceValue;
  CKDPAsset *assetValue;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const char *v21;
  CKDPPackage *packageValue;
  void *v23;
  CKDPFieldCryptoFeatureSet *appliedCryptoFeatures;
  CKDPStreamingAsset *streamingAssetValue;
  CKDPMergeableValue *mergeableValue;
  CKDPEncryptedMergeableValue *encryptedMergeableValue;
  _BYTE *v28;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[30] = self->_type;
    *((_BYTE *)v4 + 128) |= 4u;
  }
  bytesValue = self->_bytesValue;
  v28 = v4;
  if (bytesValue)
  {
    objc_msgSend_setBytesValue_(v4, v5, (uint64_t)bytesValue);
    v4 = v28;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_signedValue;
    *((_BYTE *)v4 + 128) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_ckDoubleValue;
    *((_BYTE *)v4 + 128) |= 1u;
  }
  dateValue = self->_dateValue;
  if (dateValue)
    objc_msgSend_setDateValue_(v28, v5, (uint64_t)dateValue);
  stringValue = self->_stringValue;
  if (stringValue)
    objc_msgSend_setStringValue_(v28, v5, (uint64_t)stringValue);
  locationValue = self->_locationValue;
  if (locationValue)
    objc_msgSend_setLocationValue_(v28, v5, (uint64_t)locationValue);
  referenceValue = self->_referenceValue;
  if (referenceValue)
    objc_msgSend_setReferenceValue_(v28, v5, (uint64_t)referenceValue);
  assetValue = self->_assetValue;
  if (assetValue)
    objc_msgSend_setAssetValue_(v28, v5, (uint64_t)assetValue);
  if (objc_msgSend_listValuesCount(self, v5, (uint64_t)assetValue))
  {
    objc_msgSend_clearListValues(v28, v13, v14);
    v17 = objc_msgSend_listValuesCount(self, v15, v16);
    if (v17)
    {
      v18 = v17;
      for (i = 0; i != v18; ++i)
      {
        objc_msgSend_listValueAtIndex_(self, v13, i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addListValue_(v28, v21, (uint64_t)v20);

      }
    }
  }
  packageValue = self->_packageValue;
  if (packageValue)
    objc_msgSend_setPackageValue_(v28, v13, (uint64_t)packageValue);
  v23 = v28;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v28[124] = self->_isEncrypted;
    v28[128] |= 8u;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_setAppliedCryptoFeatures_(v28, v13, (uint64_t)appliedCryptoFeatures);
    v23 = v28;
  }
  streamingAssetValue = self->_streamingAssetValue;
  if (streamingAssetValue)
  {
    objc_msgSend_setStreamingAssetValue_(v28, v13, (uint64_t)streamingAssetValue);
    v23 = v28;
  }
  mergeableValue = self->_mergeableValue;
  if (mergeableValue)
  {
    objc_msgSend_setMergeableValue_(v28, v13, (uint64_t)mergeableValue);
    v23 = v28;
  }
  encryptedMergeableValue = self->_encryptedMergeableValue;
  if (encryptedMergeableValue)
  {
    objc_msgSend_setEncryptedMergeableValue_(v28, v13, (uint64_t)encryptedMergeableValue);
    v23 = v28;
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
  uint64_t v13;
  void *v14;
  const char *v15;
  char has;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v10 + 120) = self->_type;
    *(_BYTE *)(v10 + 128) |= 4u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_bytesValue, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v13;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v12 + 16) = self->_signedValue;
    *(_BYTE *)(v12 + 128) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v12 + 8) = self->_ckDoubleValue;
    *(_BYTE *)(v12 + 128) |= 1u;
  }
  v17 = objc_msgSend_copyWithZone_(self->_dateValue, v15, (uint64_t)a3);
  v18 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v17;

  v20 = objc_msgSend_copyWithZone_(self->_stringValue, v19, (uint64_t)a3);
  v21 = *(void **)(v12 + 112);
  *(_QWORD *)(v12 + 112) = v20;

  v23 = objc_msgSend_copyWithZone_(self->_locationValue, v22, (uint64_t)a3);
  v24 = *(void **)(v12 + 72);
  *(_QWORD *)(v12 + 72) = v23;

  v26 = objc_msgSend_copyWithZone_(self->_referenceValue, v25, (uint64_t)a3);
  v27 = *(void **)(v12 + 96);
  *(_QWORD *)(v12 + 96) = v26;

  v29 = objc_msgSend_copyWithZone_(self->_assetValue, v28, (uint64_t)a3);
  v30 = *(void **)(v12 + 32);
  *(_QWORD *)(v12 + 32) = v29;

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v31 = self->_listValues;
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v56, v60, 16);
  if (v33)
  {
    v35 = v33;
    v36 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v57 != v36)
          objc_enumerationMutation(v31);
        v38 = (void *)objc_msgSend_copyWithZone_(*(void **)(*((_QWORD *)&v56 + 1) + 8 * i), v34, (uint64_t)a3, (_QWORD)v56);
        objc_msgSend_addListValue_((void *)v12, v39, (uint64_t)v38);

      }
      v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v56, v60, 16);
    }
    while (v35);
  }

  v41 = objc_msgSend_copyWithZone_(self->_packageValue, v40, (uint64_t)a3);
  v42 = *(void **)(v12 + 88);
  *(_QWORD *)(v12 + 88) = v41;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_BYTE *)(v12 + 124) = self->_isEncrypted;
    *(_BYTE *)(v12 + 128) |= 8u;
  }
  v44 = objc_msgSend_copyWithZone_(self->_appliedCryptoFeatures, v43, (uint64_t)a3, (_QWORD)v56);
  v45 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v44;

  v47 = objc_msgSend_copyWithZone_(self->_streamingAssetValue, v46, (uint64_t)a3);
  v48 = *(void **)(v12 + 104);
  *(_QWORD *)(v12 + 104) = v47;

  v50 = objc_msgSend_copyWithZone_(self->_mergeableValue, v49, (uint64_t)a3);
  v51 = *(void **)(v12 + 80);
  *(_QWORD *)(v12 + 80) = v50;

  v53 = objc_msgSend_copyWithZone_(self->_encryptedMergeableValue, v52, (uint64_t)a3);
  v54 = *(void **)(v12 + 56);
  *(_QWORD *)(v12 + 56) = v53;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  char has;
  char v9;
  NSData *bytesValue;
  uint64_t v11;
  CKDPDate *dateValue;
  uint64_t v13;
  NSString *stringValue;
  uint64_t v15;
  CKDPLocationCoordinate *locationValue;
  uint64_t v17;
  CKDPRecordReference *referenceValue;
  uint64_t v19;
  CKDPAsset *assetValue;
  uint64_t v21;
  NSMutableArray *listValues;
  uint64_t v23;
  CKDPPackage *packageValue;
  uint64_t v25;
  CKDPFieldCryptoFeatureSet *appliedCryptoFeatures;
  uint64_t v27;
  CKDPStreamingAsset *streamingAssetValue;
  uint64_t v29;
  CKDPMergeableValue *mergeableValue;
  uint64_t v31;
  CKDPEncryptedMergeableValue *encryptedMergeableValue;
  uint64_t v33;
  char isEqual;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_50;
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 128);
  if ((has & 4) != 0)
  {
    if ((v4[16] & 4) == 0 || self->_type != *((_DWORD *)v4 + 30))
      goto LABEL_50;
  }
  else if ((v4[16] & 4) != 0)
  {
    goto LABEL_50;
  }
  bytesValue = self->_bytesValue;
  v11 = v4[5];
  if ((unint64_t)bytesValue | v11)
  {
    if (!objc_msgSend_isEqual_(bytesValue, v7, v11))
      goto LABEL_50;
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 128);
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_signedValue != v4[2])
      goto LABEL_50;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_50;
  }
  if ((has & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_ckDoubleValue != *((double *)v4 + 1))
      goto LABEL_50;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_50;
  }
  dateValue = self->_dateValue;
  v13 = v4[6];
  if ((unint64_t)dateValue | v13 && !objc_msgSend_isEqual_(dateValue, v7, v13))
    goto LABEL_50;
  stringValue = self->_stringValue;
  v15 = v4[14];
  if ((unint64_t)stringValue | v15)
  {
    if (!objc_msgSend_isEqual_(stringValue, v7, v15))
      goto LABEL_50;
  }
  locationValue = self->_locationValue;
  v17 = v4[9];
  if ((unint64_t)locationValue | v17)
  {
    if (!objc_msgSend_isEqual_(locationValue, v7, v17))
      goto LABEL_50;
  }
  referenceValue = self->_referenceValue;
  v19 = v4[12];
  if ((unint64_t)referenceValue | v19)
  {
    if (!objc_msgSend_isEqual_(referenceValue, v7, v19))
      goto LABEL_50;
  }
  assetValue = self->_assetValue;
  v21 = v4[4];
  if ((unint64_t)assetValue | v21)
  {
    if (!objc_msgSend_isEqual_(assetValue, v7, v21))
      goto LABEL_50;
  }
  listValues = self->_listValues;
  v23 = v4[8];
  if ((unint64_t)listValues | v23)
  {
    if (!objc_msgSend_isEqual_(listValues, v7, v23))
      goto LABEL_50;
  }
  packageValue = self->_packageValue;
  v25 = v4[11];
  if ((unint64_t)packageValue | v25)
  {
    if (!objc_msgSend_isEqual_(packageValue, v7, v25))
      goto LABEL_50;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[16] & 8) != 0)
    {
      if (self->_isEncrypted)
      {
        if (!*((_BYTE *)v4 + 124))
          goto LABEL_50;
        goto LABEL_42;
      }
      if (!*((_BYTE *)v4 + 124))
        goto LABEL_42;
    }
LABEL_50:
    isEqual = 0;
    goto LABEL_51;
  }
  if ((v4[16] & 8) != 0)
    goto LABEL_50;
LABEL_42:
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  v27 = v4[3];
  if ((unint64_t)appliedCryptoFeatures | v27
    && !objc_msgSend_isEqual_(appliedCryptoFeatures, v7, v27))
  {
    goto LABEL_50;
  }
  streamingAssetValue = self->_streamingAssetValue;
  v29 = v4[13];
  if ((unint64_t)streamingAssetValue | v29)
  {
    if (!objc_msgSend_isEqual_(streamingAssetValue, v7, v29))
      goto LABEL_50;
  }
  mergeableValue = self->_mergeableValue;
  v31 = v4[10];
  if ((unint64_t)mergeableValue | v31)
  {
    if (!objc_msgSend_isEqual_(mergeableValue, v7, v31))
      goto LABEL_50;
  }
  encryptedMergeableValue = self->_encryptedMergeableValue;
  v33 = v4[7];
  if ((unint64_t)encryptedMergeableValue | v33)
    isEqual = objc_msgSend_isEqual_(encryptedMergeableValue, v7, v33);
  else
    isEqual = 1;
LABEL_51:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  double ckDoubleValue;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v50 = 2654435761 * self->_type;
  else
    v50 = 0;
  v49 = objc_msgSend_hash(self->_bytesValue, a2, v2);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v48 = 2654435761 * self->_signedValue;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  v48 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_6:
  ckDoubleValue = self->_ckDoubleValue;
  v7 = -ckDoubleValue;
  if (ckDoubleValue >= 0.0)
    v7 = self->_ckDoubleValue;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = fmod(v8, 1.84467441e19);
  v11 = 2654435761u * (unint64_t)v10;
  v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0)
    v12 = 2654435761u * (unint64_t)v10;
  v13 = v11 - (unint64_t)fabs(v9);
  if (v9 < 0.0)
    v14 = v13;
  else
    v14 = v12;
LABEL_15:
  v15 = objc_msgSend_hash(self->_dateValue, v4, v5);
  v18 = objc_msgSend_hash(self->_stringValue, v16, v17);
  v21 = objc_msgSend_hash(self->_locationValue, v19, v20);
  v24 = objc_msgSend_hash(self->_referenceValue, v22, v23);
  v27 = objc_msgSend_hash(self->_assetValue, v25, v26);
  v30 = objc_msgSend_hash(self->_listValues, v28, v29);
  v33 = objc_msgSend_hash(self->_packageValue, v31, v32);
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v36 = 2654435761 * self->_isEncrypted;
  else
    v36 = 0;
  v37 = v49 ^ v50 ^ v48 ^ v14 ^ v15 ^ v18 ^ v21 ^ v24 ^ v27 ^ v30 ^ v33 ^ v36;
  v38 = objc_msgSend_hash(self->_appliedCryptoFeatures, v34, v35);
  v41 = v38 ^ objc_msgSend_hash(self->_streamingAssetValue, v39, v40);
  v44 = v41 ^ objc_msgSend_hash(self->_mergeableValue, v42, v43);
  return v37 ^ v44 ^ objc_msgSend_hash(self->_encryptedMergeableValue, v45, v46);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  uint64_t v7;
  char v8;
  CKDPDate *dateValue;
  uint64_t v10;
  uint64_t v11;
  CKDPLocationCoordinate *locationValue;
  uint64_t v13;
  CKDPRecordReference *referenceValue;
  uint64_t v15;
  CKDPAsset *assetValue;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const char *v25;
  CKDPPackage *packageValue;
  uint64_t v27;
  CKDPFieldCryptoFeatureSet *appliedCryptoFeatures;
  uint64_t v29;
  CKDPStreamingAsset *streamingAssetValue;
  uint64_t v31;
  CKDPMergeableValue *mergeableValue;
  uint64_t v33;
  CKDPEncryptedMergeableValue *encryptedMergeableValue;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6 = v4;
  if ((*((_BYTE *)v4 + 128) & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 30);
    *(_BYTE *)&self->_has |= 4u;
  }
  v7 = *((_QWORD *)v4 + 5);
  if (v7)
    objc_msgSend_setBytesValue_(self, v5, v7);
  v8 = *((_BYTE *)v6 + 128);
  if ((v8 & 2) != 0)
  {
    self->_signedValue = *((_QWORD *)v6 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v8 = *((_BYTE *)v6 + 128);
  }
  if ((v8 & 1) != 0)
  {
    self->_ckDoubleValue = *((double *)v6 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  dateValue = self->_dateValue;
  v10 = *((_QWORD *)v6 + 6);
  if (dateValue)
  {
    if (v10)
      objc_msgSend_mergeFrom_(dateValue, v5, v10);
  }
  else if (v10)
  {
    objc_msgSend_setDateValue_(self, v5, v10);
  }
  v11 = *((_QWORD *)v6 + 14);
  if (v11)
    objc_msgSend_setStringValue_(self, v5, v11);
  locationValue = self->_locationValue;
  v13 = *((_QWORD *)v6 + 9);
  if (locationValue)
  {
    if (v13)
      objc_msgSend_mergeFrom_(locationValue, v5, v13);
  }
  else if (v13)
  {
    objc_msgSend_setLocationValue_(self, v5, v13);
  }
  referenceValue = self->_referenceValue;
  v15 = *((_QWORD *)v6 + 12);
  if (referenceValue)
  {
    if (v15)
      objc_msgSend_mergeFrom_(referenceValue, v5, v15);
  }
  else if (v15)
  {
    objc_msgSend_setReferenceValue_(self, v5, v15);
  }
  assetValue = self->_assetValue;
  v17 = *((_QWORD *)v6 + 4);
  if (assetValue)
  {
    if (v17)
      objc_msgSend_mergeFrom_(assetValue, v5, v17);
  }
  else if (v17)
  {
    objc_msgSend_setAssetValue_(self, v5, v17);
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = *((id *)v6 + 8);
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v36, v40, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v18);
        objc_msgSend_addListValue_(self, v21, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), (_QWORD)v36);
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v36, v40, 16);
    }
    while (v22);
  }

  packageValue = self->_packageValue;
  v27 = *((_QWORD *)v6 + 11);
  if (packageValue)
  {
    if (v27)
      objc_msgSend_mergeFrom_(packageValue, v25, v27);
  }
  else if (v27)
  {
    objc_msgSend_setPackageValue_(self, v25, v27);
  }
  if ((*((_BYTE *)v6 + 128) & 8) != 0)
  {
    self->_isEncrypted = *((_BYTE *)v6 + 124);
    *(_BYTE *)&self->_has |= 8u;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  v29 = *((_QWORD *)v6 + 3);
  if (appliedCryptoFeatures)
  {
    if (v29)
      objc_msgSend_mergeFrom_(appliedCryptoFeatures, v25, v29);
  }
  else if (v29)
  {
    objc_msgSend_setAppliedCryptoFeatures_(self, v25, v29);
  }
  streamingAssetValue = self->_streamingAssetValue;
  v31 = *((_QWORD *)v6 + 13);
  if (streamingAssetValue)
  {
    if (v31)
      objc_msgSend_mergeFrom_(streamingAssetValue, v25, v31);
  }
  else if (v31)
  {
    objc_msgSend_setStreamingAssetValue_(self, v25, v31);
  }
  mergeableValue = self->_mergeableValue;
  v33 = *((_QWORD *)v6 + 10);
  if (mergeableValue)
  {
    if (v33)
      objc_msgSend_mergeFrom_(mergeableValue, v25, v33);
  }
  else if (v33)
  {
    objc_msgSend_setMergeableValue_(self, v25, v33);
  }
  encryptedMergeableValue = self->_encryptedMergeableValue;
  v35 = *((_QWORD *)v6 + 7);
  if (encryptedMergeableValue)
  {
    if (v35)
      objc_msgSend_mergeFrom_(encryptedMergeableValue, v25, v35);
  }
  else if (v35)
  {
    objc_msgSend_setEncryptedMergeableValue_(self, v25, v35);
  }

}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void)setBytesValue:(id)a3
{
  objc_storeStrong((id *)&self->_bytesValue, a3);
}

- (int64_t)signedValue
{
  return self->_signedValue;
}

- (double)ckDoubleValue
{
  return self->_ckDoubleValue;
}

- (CKDPDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (CKDPLocationCoordinate)locationValue
{
  return self->_locationValue;
}

- (void)setLocationValue:(id)a3
{
  objc_storeStrong((id *)&self->_locationValue, a3);
}

- (CKDPRecordReference)referenceValue
{
  return self->_referenceValue;
}

- (void)setReferenceValue:(id)a3
{
  objc_storeStrong((id *)&self->_referenceValue, a3);
}

- (CKDPAsset)assetValue
{
  return self->_assetValue;
}

- (void)setAssetValue:(id)a3
{
  objc_storeStrong((id *)&self->_assetValue, a3);
}

- (NSMutableArray)listValues
{
  return self->_listValues;
}

- (void)setListValues:(id)a3
{
  objc_storeStrong((id *)&self->_listValues, a3);
}

- (CKDPPackage)packageValue
{
  return self->_packageValue;
}

- (void)setPackageValue:(id)a3
{
  objc_storeStrong((id *)&self->_packageValue, a3);
}

- (CKDPStreamingAsset)streamingAssetValue
{
  return self->_streamingAssetValue;
}

- (void)setStreamingAssetValue:(id)a3
{
  objc_storeStrong((id *)&self->_streamingAssetValue, a3);
}

- (CKDPMergeableValue)mergeableValue
{
  return self->_mergeableValue;
}

- (void)setMergeableValue:(id)a3
{
  objc_storeStrong((id *)&self->_mergeableValue, a3);
}

- (CKDPEncryptedMergeableValue)encryptedMergeableValue
{
  return self->_encryptedMergeableValue;
}

- (void)setEncryptedMergeableValue:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedMergeableValue, a3);
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (CKDPFieldCryptoFeatureSet)appliedCryptoFeatures
{
  return self->_appliedCryptoFeatures;
}

- (void)setAppliedCryptoFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, a3);
}

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3B83E24]();
  objc_msgSend_dictionaryRepresentation(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packageProcessBasePath(MEMORY[0x1E0C94FC8], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_standaloneTranslatorWithPackageStagingDirectory_databaseScope_(CKDProtocolTranslator, v14, (uint64_t)v13, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectRepresentationFromFieldValue_(v15, v16, (uint64_t)self);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if ((objc_msgSend_hasMergeableValue(self, v18, v19) & 1) != 0
      || objc_msgSend_hasEncryptedMergeableValue(self, v20, v21))
    {
      objc_msgSend_mergeableValue(self, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v22;
      if (v22)
      {
        v26 = v22;
      }
      else
      {
        objc_msgSend_encryptedMergeableValue(self, v23, v24);
        v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v26;

    }
    else
    {
      v17 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = v10;
    v27 = v7;
    sub_1BEB2D840();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v6, v29, (uint64_t)v28);

    sub_1BEB2D188();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v6, v31, (uint64_t)v30);

    sub_1BEB2D1C8(a4 + 1, v6);
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v32 = v17;
    v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v61, v65, 16);
    if (v34)
    {
      v36 = v34;
      v37 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v62 != v37)
            objc_enumerationMutation(v32);
          objc_msgSend__CKLogToFileHandle_atDepth_(*(void **)(*((_QWORD *)&v61 + 1) + 8 * i), v35, (uint64_t)v6, (a4 + 1));
          sub_1BEB2D188();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_writeData_(v6, v40, (uint64_t)v39);

        }
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v61, v65, 16);
      }
      while (v36);
    }

    sub_1BEB2D1C8(a4, v6);
    sub_1BEB2D8C0();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v6, v42, (uint64_t)v41);

    v7 = v27;
    v10 = v60;
  }
  else
  {
    sub_1BEB2E9F4();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v6, v44, (uint64_t)v43);

    objc_msgSend_objectForKeyedSubscript_(v10, v45, (uint64_t)CFSTR("type"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeString_(v6, v47, (uint64_t)v46);

    sub_1BEB2EA34();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v6, v49, (uint64_t)v48);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_37;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_37;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_37;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
LABEL_37:
      sub_1BEB2EA74();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writeData_(v6, v56, (uint64_t)v55);

      objc_msgSend__CKLogToFileHandle_atDepth_(v17, v57, (uint64_t)v6, (a4 + 1));
      sub_1BEB2EA74();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writeData_(v6, v59, (uint64_t)v58);

    }
    else
    {
LABEL_21:
      objc_msgSend__CKLogToFileHandle_atDepth_(v17, v50, (uint64_t)v6, (a4 + 1));
    }
    sub_1BEB2E4A0();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v6, v52, (uint64_t)v51);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend_removeDB(v17, v53, v54);

  objc_autoreleasePoolPop(v7);
}

@end
