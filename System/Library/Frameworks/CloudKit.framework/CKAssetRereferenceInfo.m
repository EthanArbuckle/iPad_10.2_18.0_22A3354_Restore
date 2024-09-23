@implementation CKAssetRereferenceInfo

- (CKAssetRereferenceInfo)initWithSourceZoneID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKAssetRereferenceInfo *v8;
  uint64_t v9;
  CKRecordZoneID *sourceZoneID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKAssetRereferenceInfo;
  v8 = -[CKAssetRereferenceInfo init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    sourceZoneID = v8->_sourceZoneID;
    v8->_sourceZoneID = (CKRecordZoneID *)v9;

  }
  return v8;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;

  v5 = a4;
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], a2, 12, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_contentBaseURL(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    if (v11)
    {
      objc_msgSend_description(v11, v12, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v17, (uint64_t)CFSTR("contentBaseURL"), (uint64_t)v16);

    }
    objc_msgSend_owner(self, v12, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    if (v18)
    {
      objc_msgSend_description(v18, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v24, (uint64_t)CFSTR("owner"), (uint64_t)v23);

    }
    objc_msgSend_requestor(self, v19, v20, v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    if (v25)
    {
      objc_msgSend_description(v25, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v31, (uint64_t)CFSTR("requestor"), (uint64_t)v30);

    }
    objc_msgSend_assetKey(self, v26, v27, v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v33, (uint64_t)CFSTR("assetKey"), (uint64_t)CFSTR("Yes"));
    objc_msgSend_referenceSignature(self, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v36;
    if (v36)
    {
      objc_msgSend_description(v36, v37, v38, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v42, (uint64_t)CFSTR("referenceSignature"), (uint64_t)v41);

    }
    objc_msgSend_downloadToken(self, v37, v38, v39);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v43;
    if (v43)
    {
      objc_msgSend_description(v43, v44, v45, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v49, (uint64_t)CFSTR("downloadToken"), (uint64_t)v48);

    }
    v50 = objc_msgSend_downloadTokenExpiration(self, v44, v45, v46);
    if (v50)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v51, (uint64_t)CFSTR("%llu"), v53, v50);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v55, (uint64_t)CFSTR("downloadTokenExpiration"), (uint64_t)v54);

    }
    objc_msgSend_error(self, v51, v52, v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v56;
    if (v56)
    {
      objc_msgSend_description(v56, v57, v58, v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_CKAddPropertySafelyForKey_value_(v10, v62, (uint64_t)CFSTR("error"), (uint64_t)v61);

    }
  }
  return v10;
}

- (id)description
{
  return (id)((uint64_t (*)(CKAssetRereferenceInfo *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (CKRecordZoneID)sourceZoneID
{
  return self->_sourceZoneID;
}

- (NSURL)contentBaseURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentBaseURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)owner
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOwner:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)requestor
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequestor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSData)assetKey
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSData)referenceSignature
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReferenceSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)downloadToken
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDownloadToken:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (unint64_t)downloadTokenExpiration
{
  return self->_downloadTokenExpiration;
}

- (void)setDownloadTokenExpiration:(unint64_t)a3
{
  self->_downloadTokenExpiration = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)destinationFieldName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDestinationFieldName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationFieldName, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadToken, 0);
  objc_storeStrong((id *)&self->_referenceSignature, 0);
  objc_storeStrong((id *)&self->_assetKey, 0);
  objc_storeStrong((id *)&self->_requestor, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_contentBaseURL, 0);
  objc_storeStrong((id *)&self->_sourceZoneID, 0);
}

@end
