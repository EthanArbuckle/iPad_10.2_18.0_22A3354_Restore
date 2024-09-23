@implementation CKDPRecordRetrieveRequest

+ (id)options
{
  if (qword_1ED700890 != -1)
    dispatch_once(&qword_1ED700890, &unk_1E782F010);
  return (id)qword_1ED700888;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
}

- (BOOL)hasVersionETag
{
  return self->_versionETag != 0;
}

- (BOOL)hasClientVersionETag
{
  return self->_clientVersionETag != 0;
}

- (BOOL)hasGetAssetURL
{
  return self->_getAssetURL != 0;
}

- (BOOL)hasAssetsToDownload
{
  return self->_assetsToDownload != 0;
}

- (void)setShouldFailBatch:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shouldFailBatch = a3;
}

- (void)setHasShouldFailBatch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldFailBatch
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requestEncryptedAssetOwnerIdentifier = a3;
}

- (void)setHasRequestEncryptedAssetOwnerIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestEncryptedAssetOwnerIdentifier
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
  v11.super_class = (Class)CKDPRecordRetrieveRequest;
  -[CKDPRecordRetrieveRequest description](&v11, sel_description);
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
  CKDPRequestedFields *requestedFields;
  void *v11;
  const char *v12;
  NSString *versionETag;
  NSString *clientVersionETag;
  CKDPRecordRetrieveRequestRetrieveAssetURL *getAssetURL;
  void *v16;
  const char *v17;
  CKDPAssetsToDownload *assetsToDownload;
  void *v19;
  const char *v20;
  char has;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    objc_msgSend_dictionaryRepresentation(recordIdentifier, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("recordIdentifier"));

  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_dictionaryRepresentation(requestedFields, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("requestedFields"));

  }
  versionETag = self->_versionETag;
  if (versionETag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)versionETag, CFSTR("versionETag"));
  clientVersionETag = self->_clientVersionETag;
  if (clientVersionETag)
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)clientVersionETag, CFSTR("clientVersionETag"));
  getAssetURL = self->_getAssetURL;
  if (getAssetURL)
  {
    objc_msgSend_dictionaryRepresentation(getAssetURL, v4, (uint64_t)clientVersionETag);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, CFSTR("getAssetURL"));

  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_dictionaryRepresentation(assetsToDownload, v4, (uint64_t)clientVersionETag);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, CFSTR("assetsToDownload"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_shouldFailBatch);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v23, (uint64_t)v22, CFSTR("shouldFailBatch"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v4, self->_requestEncryptedAssetOwnerIdentifier);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v25, (uint64_t)v24, CFSTR("requestEncryptedAssetOwnerIdentifier"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEA1C684((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_versionETag)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_clientVersionETag)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_getAssetURL)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }

}

- (unsigned)requestTypeCode
{
  return 4;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  const char *v5;
  CKDPRecordIdentifier *recordIdentifier;
  CKDPRequestedFields *requestedFields;
  NSString *versionETag;
  NSString *clientVersionETag;
  CKDPRecordRetrieveRequestRetrieveAssetURL *getAssetURL;
  CKDPAssetsToDownload *assetsToDownload;
  char has;
  _BYTE *v13;

  v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  v13 = v4;
  if (recordIdentifier)
  {
    objc_msgSend_setRecordIdentifier_(v4, v5, (uint64_t)recordIdentifier);
    v4 = v13;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v13, v5, (uint64_t)requestedFields);
    v4 = v13;
  }
  versionETag = self->_versionETag;
  if (versionETag)
  {
    objc_msgSend_setVersionETag_(v13, v5, (uint64_t)versionETag);
    v4 = v13;
  }
  clientVersionETag = self->_clientVersionETag;
  if (clientVersionETag)
  {
    objc_msgSend_setClientVersionETag_(v13, v5, (uint64_t)clientVersionETag);
    v4 = v13;
  }
  getAssetURL = self->_getAssetURL;
  if (getAssetURL)
  {
    objc_msgSend_setGetAssetURL_(v13, v5, (uint64_t)getAssetURL);
    v4 = v13;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v13, v5, (uint64_t)assetsToDownload);
    v4 = v13;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[57] = self->_shouldFailBatch;
    v4[60] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[56] = self->_requestEncryptedAssetOwnerIdentifier;
    v4[60] |= 1u;
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
  const char *v26;
  uint64_t v27;
  void *v28;
  char has;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = v12;

  v15 = objc_msgSend_copyWithZone_(self->_requestedFields, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v15;

  v18 = objc_msgSend_copyWithZone_(self->_versionETag, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v18;

  v21 = objc_msgSend_copyWithZone_(self->_clientVersionETag, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = v21;

  v24 = objc_msgSend_copyWithZone_(self->_getAssetURL, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = v24;

  v27 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v26, (uint64_t)a3);
  v28 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v27;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v10 + 57) = self->_shouldFailBatch;
    *(_BYTE *)(v10 + 60) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v10 + 56) = self->_requestEncryptedAssetOwnerIdentifier;
    *(_BYTE *)(v10 + 60) |= 1u;
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
  CKDPRequestedFields *requestedFields;
  uint64_t v11;
  NSString *versionETag;
  uint64_t v13;
  NSString *clientVersionETag;
  uint64_t v15;
  CKDPRecordRetrieveRequestRetrieveAssetURL *getAssetURL;
  uint64_t v17;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v19;
  BOOL v20;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_24;
  recordIdentifier = self->_recordIdentifier;
  v9 = v4[4];
  if ((unint64_t)recordIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(recordIdentifier, v7, v9))
      goto LABEL_24;
  }
  requestedFields = self->_requestedFields;
  v11 = v4[5];
  if ((unint64_t)requestedFields | v11)
  {
    if (!objc_msgSend_isEqual_(requestedFields, v7, v11))
      goto LABEL_24;
  }
  versionETag = self->_versionETag;
  v13 = v4[6];
  if ((unint64_t)versionETag | v13)
  {
    if (!objc_msgSend_isEqual_(versionETag, v7, v13))
      goto LABEL_24;
  }
  clientVersionETag = self->_clientVersionETag;
  v15 = v4[2];
  if ((unint64_t)clientVersionETag | v15)
  {
    if (!objc_msgSend_isEqual_(clientVersionETag, v7, v15))
      goto LABEL_24;
  }
  getAssetURL = self->_getAssetURL;
  v17 = v4[3];
  if ((unint64_t)getAssetURL | v17)
  {
    if (!objc_msgSend_isEqual_(getAssetURL, v7, v17))
      goto LABEL_24;
  }
  assetsToDownload = self->_assetsToDownload;
  v19 = v4[1];
  if ((unint64_t)assetsToDownload | v19)
  {
    if (!objc_msgSend_isEqual_(assetsToDownload, v7, v19))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0)
      goto LABEL_24;
    if (self->_shouldFailBatch)
    {
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 57))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_24;
  }
  v20 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) != 0)
    {
      if (self->_requestEncryptedAssetOwnerIdentifier)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_24;
      }
      else if (*((_BYTE *)v4 + 56))
      {
        goto LABEL_24;
      }
      v20 = 1;
      goto LABEL_25;
    }
LABEL_24:
    v20 = 0;
  }
LABEL_25:

  return v20;
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
  uint64_t v20;
  uint64_t v21;

  v4 = objc_msgSend_hash(self->_recordIdentifier, a2, v2);
  v7 = objc_msgSend_hash(self->_requestedFields, v5, v6);
  v10 = objc_msgSend_hash(self->_versionETag, v8, v9);
  v13 = objc_msgSend_hash(self->_clientVersionETag, v11, v12);
  v16 = objc_msgSend_hash(self->_getAssetURL, v14, v15);
  v19 = objc_msgSend_hash(self->_assetsToDownload, v17, v18);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v20 = 2654435761 * self->_shouldFailBatch;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
  }
  v20 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v21 = 2654435761 * self->_requestEncryptedAssetOwnerIdentifier;
  return v7 ^ v4 ^ v10 ^ v13 ^ v16 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  CKDPRecordIdentifier *recordIdentifier;
  uint64_t v6;
  CKDPRequestedFields *requestedFields;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CKDPRecordRetrieveRequestRetrieveAssetURL *getAssetURL;
  uint64_t v12;
  CKDPAssetsToDownload *assetsToDownload;
  uint64_t v14;
  char v15;
  id v16;

  v4 = a3;
  recordIdentifier = self->_recordIdentifier;
  v6 = *((_QWORD *)v4 + 4);
  v16 = v4;
  if (recordIdentifier)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(recordIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setRecordIdentifier_(self, (const char *)v4, v6);
  }
  v4 = v16;
LABEL_7:
  requestedFields = self->_requestedFields;
  v8 = *((_QWORD *)v4 + 5);
  if (requestedFields)
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(requestedFields, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_setRequestedFields_(self, (const char *)v4, v8);
  }
  v4 = v16;
LABEL_13:
  v9 = *((_QWORD *)v4 + 6);
  if (v9)
  {
    objc_msgSend_setVersionETag_(self, (const char *)v4, v9);
    v4 = v16;
  }
  v10 = *((_QWORD *)v4 + 2);
  if (v10)
  {
    objc_msgSend_setClientVersionETag_(self, (const char *)v4, v10);
    v4 = v16;
  }
  getAssetURL = self->_getAssetURL;
  v12 = *((_QWORD *)v4 + 3);
  if (getAssetURL)
  {
    if (!v12)
      goto LABEL_23;
    objc_msgSend_mergeFrom_(getAssetURL, (const char *)v4, v12);
  }
  else
  {
    if (!v12)
      goto LABEL_23;
    objc_msgSend_setGetAssetURL_(self, (const char *)v4, v12);
  }
  v4 = v16;
LABEL_23:
  assetsToDownload = self->_assetsToDownload;
  v14 = *((_QWORD *)v4 + 1);
  if (assetsToDownload)
  {
    if (!v14)
      goto LABEL_29;
    objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v14);
  }
  else
  {
    if (!v14)
      goto LABEL_29;
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v14);
  }
  v4 = v16;
LABEL_29:
  v15 = *((_BYTE *)v4 + 60);
  if ((v15 & 2) != 0)
  {
    self->_shouldFailBatch = *((_BYTE *)v4 + 57);
    *(_BYTE *)&self->_has |= 2u;
    v15 = *((_BYTE *)v4 + 60);
  }
  if ((v15 & 1) != 0)
  {
    self->_requestEncryptedAssetOwnerIdentifier = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 1u;
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

- (CKDPRequestedFields)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFields, a3);
}

- (NSString)versionETag
{
  return self->_versionETag;
}

- (void)setVersionETag:(id)a3
{
  objc_storeStrong((id *)&self->_versionETag, a3);
}

- (NSString)clientVersionETag
{
  return self->_clientVersionETag;
}

- (void)setClientVersionETag:(id)a3
{
  objc_storeStrong((id *)&self->_clientVersionETag, a3);
}

- (CKDPRecordRetrieveRequestRetrieveAssetURL)getAssetURL
{
  return self->_getAssetURL;
}

- (void)setGetAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_getAssetURL, a3);
}

- (CKDPAssetsToDownload)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToDownload, a3);
}

- (BOOL)shouldFailBatch
{
  return self->_shouldFailBatch;
}

- (BOOL)requestEncryptedAssetOwnerIdentifier
{
  return self->_requestEncryptedAssetOwnerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionETag, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_recordIdentifier, 0);
  objc_storeStrong((id *)&self->_getAssetURL, 0);
  objc_storeStrong((id *)&self->_clientVersionETag, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

@end
