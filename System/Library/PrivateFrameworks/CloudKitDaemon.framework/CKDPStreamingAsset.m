@implementation CKDPStreamingAsset

- (BOOL)hasAssetId
{
  return self->_assetId != 0;
}

- (BOOL)hasSaveAssetRequest
{
  return self->_saveAssetRequest != 0;
}

- (BOOL)hasSaveAssetResponse
{
  return self->_saveAssetResponse != 0;
}

- (BOOL)hasRetrieveAssetResponse
{
  return self->_retrieveAssetResponse != 0;
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
  v11.super_class = (Class)CKDPStreamingAsset;
  -[CKDPStreamingAsset description](&v11, sel_description);
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
  CKDPStreamingAssetIdentifier *assetId;
  void *v8;
  const char *v9;
  CKDPStreamingAssetSaveAssetRequest *saveAssetRequest;
  void *v11;
  const char *v12;
  CKDPStreamingAssetSaveAssetResponse *saveAssetResponse;
  void *v14;
  const char *v15;
  CKDPStreamingAssetRetrieveAssetResponse *retrieveAssetResponse;
  void *v17;
  const char *v18;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  assetId = self->_assetId;
  if (assetId)
  {
    objc_msgSend_dictionaryRepresentation(assetId, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, CFSTR("assetId"));

  }
  saveAssetRequest = self->_saveAssetRequest;
  if (saveAssetRequest)
  {
    objc_msgSend_dictionaryRepresentation(saveAssetRequest, v4, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, CFSTR("saveAssetRequest"));

  }
  saveAssetResponse = self->_saveAssetResponse;
  if (saveAssetResponse)
  {
    objc_msgSend_dictionaryRepresentation(saveAssetResponse, v4, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, CFSTR("saveAssetResponse"));

  }
  retrieveAssetResponse = self->_retrieveAssetResponse;
  if (retrieveAssetResponse)
  {
    objc_msgSend_dictionaryRepresentation(retrieveAssetResponse, v4, v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, CFSTR("retrieveAssetResponse"));

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAC111C((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_assetId)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_saveAssetRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_saveAssetResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_retrieveAssetResponse)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  const char *v5;
  CKDPStreamingAssetIdentifier *assetId;
  CKDPStreamingAssetSaveAssetRequest *saveAssetRequest;
  CKDPStreamingAssetSaveAssetResponse *saveAssetResponse;
  CKDPStreamingAssetRetrieveAssetResponse *retrieveAssetResponse;
  id v10;

  v4 = a3;
  assetId = self->_assetId;
  v10 = v4;
  if (assetId)
  {
    objc_msgSend_setAssetId_(v4, v5, (uint64_t)assetId);
    v4 = v10;
  }
  saveAssetRequest = self->_saveAssetRequest;
  if (saveAssetRequest)
  {
    objc_msgSend_setSaveAssetRequest_(v10, v5, (uint64_t)saveAssetRequest);
    v4 = v10;
  }
  saveAssetResponse = self->_saveAssetResponse;
  if (saveAssetResponse)
  {
    objc_msgSend_setSaveAssetResponse_(v10, v5, (uint64_t)saveAssetResponse);
    v4 = v10;
  }
  retrieveAssetResponse = self->_retrieveAssetResponse;
  if (retrieveAssetResponse)
  {
    objc_msgSend_setRetrieveAssetResponse_(v10, v5, (uint64_t)retrieveAssetResponse);
    v4 = v10;
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

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (_QWORD *)objc_msgSend_init(v7, v8, v9);
  v12 = objc_msgSend_copyWithZone_(self->_assetId, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  v15 = objc_msgSend_copyWithZone_(self->_saveAssetRequest, v14, (uint64_t)a3);
  v16 = (void *)v10[3];
  v10[3] = v15;

  v18 = objc_msgSend_copyWithZone_(self->_saveAssetResponse, v17, (uint64_t)a3);
  v19 = (void *)v10[4];
  v10[4] = v18;

  v21 = objc_msgSend_copyWithZone_(self->_retrieveAssetResponse, v20, (uint64_t)a3);
  v22 = (void *)v10[2];
  v10[2] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  CKDPStreamingAssetIdentifier *assetId;
  uint64_t v9;
  CKDPStreamingAssetSaveAssetRequest *saveAssetRequest;
  uint64_t v11;
  CKDPStreamingAssetSaveAssetResponse *saveAssetResponse;
  uint64_t v13;
  CKDPStreamingAssetRetrieveAssetResponse *retrieveAssetResponse;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((assetId = self->_assetId, v9 = v4[1], !((unint64_t)assetId | v9))
     || objc_msgSend_isEqual_(assetId, v7, v9))
    && ((saveAssetRequest = self->_saveAssetRequest, v11 = v4[3], !((unint64_t)saveAssetRequest | v11))
     || objc_msgSend_isEqual_(saveAssetRequest, v7, v11))
    && ((saveAssetResponse = self->_saveAssetResponse, v13 = v4[4], !((unint64_t)saveAssetResponse | v13))
     || objc_msgSend_isEqual_(saveAssetResponse, v7, v13)))
  {
    retrieveAssetResponse = self->_retrieveAssetResponse;
    v15 = v4[2];
    if ((unint64_t)retrieveAssetResponse | v15)
      isEqual = objc_msgSend_isEqual_(retrieveAssetResponse, v7, v15);
    else
      isEqual = 1;
  }
  else
  {
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

  v4 = objc_msgSend_hash(self->_assetId, a2, v2);
  v7 = objc_msgSend_hash(self->_saveAssetRequest, v5, v6) ^ v4;
  v10 = objc_msgSend_hash(self->_saveAssetResponse, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_retrieveAssetResponse, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  CKDPStreamingAssetIdentifier *assetId;
  uint64_t v6;
  CKDPStreamingAssetSaveAssetRequest *saveAssetRequest;
  uint64_t v8;
  CKDPStreamingAssetSaveAssetResponse *saveAssetResponse;
  uint64_t v10;
  CKDPStreamingAssetRetrieveAssetResponse *retrieveAssetResponse;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  assetId = self->_assetId;
  v6 = v4[1];
  v13 = v4;
  if (assetId)
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_mergeFrom_(assetId, (const char *)v4, v6);
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    objc_msgSend_setAssetId_(self, (const char *)v4, v6);
  }
  v4 = v13;
LABEL_7:
  saveAssetRequest = self->_saveAssetRequest;
  v8 = v4[3];
  if (saveAssetRequest)
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_mergeFrom_(saveAssetRequest, (const char *)v4, v8);
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    objc_msgSend_setSaveAssetRequest_(self, (const char *)v4, v8);
  }
  v4 = v13;
LABEL_13:
  saveAssetResponse = self->_saveAssetResponse;
  v10 = v4[4];
  if (saveAssetResponse)
  {
    if (!v10)
      goto LABEL_19;
    objc_msgSend_mergeFrom_(saveAssetResponse, (const char *)v4, v10);
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    objc_msgSend_setSaveAssetResponse_(self, (const char *)v4, v10);
  }
  v4 = v13;
LABEL_19:
  retrieveAssetResponse = self->_retrieveAssetResponse;
  v12 = v4[2];
  if (retrieveAssetResponse)
  {
    if (v12)
    {
      objc_msgSend_mergeFrom_(retrieveAssetResponse, (const char *)v4, v12);
LABEL_24:
      v4 = v13;
    }
  }
  else if (v12)
  {
    objc_msgSend_setRetrieveAssetResponse_(self, (const char *)v4, v12);
    goto LABEL_24;
  }

}

- (CKDPStreamingAssetIdentifier)assetId
{
  return self->_assetId;
}

- (void)setAssetId:(id)a3
{
  objc_storeStrong((id *)&self->_assetId, a3);
}

- (CKDPStreamingAssetSaveAssetRequest)saveAssetRequest
{
  return self->_saveAssetRequest;
}

- (void)setSaveAssetRequest:(id)a3
{
  objc_storeStrong((id *)&self->_saveAssetRequest, a3);
}

- (CKDPStreamingAssetSaveAssetResponse)saveAssetResponse
{
  return self->_saveAssetResponse;
}

- (void)setSaveAssetResponse:(id)a3
{
  objc_storeStrong((id *)&self->_saveAssetResponse, a3);
}

- (CKDPStreamingAssetRetrieveAssetResponse)retrieveAssetResponse
{
  return self->_retrieveAssetResponse;
}

- (void)setRetrieveAssetResponse:(id)a3
{
  objc_storeStrong((id *)&self->_retrieveAssetResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveAssetResponse, 0);
  objc_storeStrong((id *)&self->_saveAssetRequest, 0);
  objc_storeStrong((id *)&self->_retrieveAssetResponse, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
}

@end
