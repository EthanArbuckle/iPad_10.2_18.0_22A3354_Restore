@implementation CKAssetDownloadPreauthorization

- (CKAssetDownloadPreauthorization)initWithResponseUUID:(id)a3 contentResponseHeaders:(id)a4 contentResponseBody:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CKAssetDownloadPreauthorization *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CKAssetDownloadPreauthorization *v16;
  uint64_t v17;
  NSString *responseUUID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSDictionary *contentResponseHeaders;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSData *contentResponseBody;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v30.receiver = self;
    v30.super_class = (Class)CKAssetDownloadPreauthorization;
    v16 = -[CKAssetDownloadPreauthorization init](&v30, sel_init);
    if (v16)
    {
      v17 = objc_msgSend_copy(v8, v13, v14, v15);
      responseUUID = v16->_responseUUID;
      v16->_responseUUID = (NSString *)v17;

      objc_msgSend_CKDeepCopy(v9, v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      contentResponseHeaders = v16->_contentResponseHeaders;
      v16->_contentResponseHeaders = (NSDictionary *)v22;

      v27 = objc_msgSend_copy(v11, v24, v25, v26);
      contentResponseBody = v16->_contentResponseBody;
      v16->_contentResponseBody = (NSData *)v27;

    }
    self = v16;
    v12 = self;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  CKAssetDownloadPreauthorization *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isEqualToString;
  objc_super v17;

  v4 = (CKAssetDownloadPreauthorization *)a3;
  if (v4 == self)
  {
    isEqualToString = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKAssetDownloadPreauthorization;
    if (-[CKAssetDownloadPreauthorization isEqual:](&v17, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend_responseUUID(v4, v5, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_responseUUID(self, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v8, v13, (uint64_t)v12, v14);

    }
    else
    {
      isEqualToString = 0;
    }
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_responseUUID(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSString)responseUUID
{
  return self->_responseUUID;
}

- (NSDictionary)contentResponseHeaders
{
  return self->_contentResponseHeaders;
}

- (NSData)contentResponseBody
{
  return self->_contentResponseBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentResponseBody, 0);
  objc_storeStrong((id *)&self->_contentResponseHeaders, 0);
  objc_storeStrong((id *)&self->_responseUUID, 0);
}

@end
