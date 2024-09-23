@implementation BLOfflineKeyRequest

- (BLOfflineKeyRequest)initWithMediaItem:(id)a3 identity:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BLOfflineKeyRequest *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v11 = objc_msgSend_init(self, v9, v10);
  v12 = (BLOfflineKeyRequest *)v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 336), a3);
    objc_storeStrong((id *)&v12->_identity, a4);
    BLHLSKeyFetchingLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_title(v12->_mediaItem, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_21323F000, v13, OS_LOG_TYPE_DEFAULT, "Creating Offline key request for '%@'.", (uint8_t *)&v18, 0xCu);

    }
  }

  return v12;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  MPMediaItem *mediaItem;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  BLHLSKeyFetchingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_title(self->_mediaItem, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_21323F000, v3, OS_LOG_TYPE_DEFAULT, "Removing Offline key request for '%@'.", buf, 0xCu);

  }
  mediaItem = self->_mediaItem;
  self->_mediaItem = 0;

  v8.receiver = self;
  v8.super_class = (Class)BLOfflineKeyRequest;
  -[BLOfflineKeyRequest dealloc](&v8, sel_dealloc);
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend_bl_sharedHLSKeyRequestOperationQueue(MEMORY[0x24BDD1710], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_21324872C;
  v10[3] = &unk_24CF70C10;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_performRequestOnOperationQueue_withCompletionHandler_(self, v9, (uint64_t)v7, v10);

}

- (void)finishWithError:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BLOfflineKeyRequest;
  -[ICRequestOperation finishWithError:](&v3, sel_finishWithError_, a3);
}

- (void)execute
{
  id v3;
  const char *v4;
  uint64_t v5;
  ICStoreRequestContext *active;
  ICStoreRequestContext *requestContext;
  BLStoreItemMetadataRequest *v8;
  const char *v9;
  BLStoreItemMetadataRequest *v10;
  BLStoreItemMetadataRequest *metadataRequest;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  BLStoreItemMetadataRequest *v16;
  const char *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEC89F8]);
  active = (ICStoreRequestContext *)objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v3, v4, v5);
  requestContext = self->_requestContext;
  self->_requestContext = active;

  v8 = [BLStoreItemMetadataRequest alloc];
  v10 = (BLStoreItemMetadataRequest *)objc_msgSend_initWithRequestContext_mediaItem_(v8, v9, (uint64_t)self->_requestContext, self->_mediaItem);
  metadataRequest = self->_metadataRequest;
  self->_metadataRequest = v10;

  BLHLSKeyFetchingLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_title(self->_mediaItem, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v15;
    _os_log_impl(&dword_21323F000, v12, OS_LOG_TYPE_DEFAULT, "Setting up metadata request for '%@'.", buf, 0xCu);

  }
  v16 = self->_metadataRequest;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_213248964;
  v18[3] = &unk_24CF70EC8;
  v18[4] = self;
  objc_msgSend_performRequestWithResponseHandler_(v16, v17, (uint64_t)v18);
}

- (void)_performOfflineKeyRequest
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BLSecureOfflineKeyDeliveryRequest *v13;
  const char *v14;
  BLSecureOfflineKeyDeliveryRequest *v15;
  BLSecureOfflineKeyDeliveryRequest *secureKeyRequest;
  BLSecureOfflineKeyDeliveryRequest *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  BLSecureOfflineKeyDeliveryRequest *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  BLSecureOfflineKeyDeliveryRequest *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  id v47;
  _QWORD v48[5];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_keyServerURL(self->_assetInfo, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = (void *)v4;
    objc_msgSend_keyCertificateURL(self->_assetInfo, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = (void *)v8;
      v12 = objc_msgSend_length(self->_identity, v9, v10);

      if (v12)
      {
        v13 = [BLSecureOfflineKeyDeliveryRequest alloc];
        v15 = (BLSecureOfflineKeyDeliveryRequest *)objc_msgSend_initWithRequestContext_(v13, v14, (uint64_t)self->_requestContext);
        secureKeyRequest = self->_secureKeyRequest;
        self->_secureKeyRequest = v15;

        v17 = self->_secureKeyRequest;
        objc_msgSend_keyCertificateURL(self->_assetInfo, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setKeyCertificateURL_(v17, v21, (uint64_t)v20);

        v22 = self->_secureKeyRequest;
        objc_msgSend_keyServerURL(self->_assetInfo, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setKeyServerURL_(v22, v26, (uint64_t)v25);

        objc_msgSend_setIdentity_(self->_secureKeyRequest, v27, (uint64_t)self->_identity);
        objc_msgSend_setMediaItem_(self->_secureKeyRequest, v28, (uint64_t)self->_mediaItem);
        BLHLSKeyFetchingLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_title(self->_mediaItem, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_keyServerURL(self->_assetInfo, v33, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_keyCertificateURL(self->_assetInfo, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v50 = v32;
          v51 = 2112;
          v52 = v35;
          v53 = 2112;
          v54 = v38;
          _os_log_impl(&dword_21323F000, v29, OS_LOG_TYPE_DEFAULT, "Setting secure offline key request for '%@' (%@, %@).", buf, 0x20u);

        }
        v39 = self->_secureKeyRequest;
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = sub_213248E4C;
        v48[3] = &unk_24CF70F90;
        v48[4] = self;
        objc_msgSend_performRequestWithResponseHandler_(v39, v40, (uint64_t)v48);
        return;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend_length(self->_identity, v5, v6))
  {
    objc_msgSend_keyServerURL(self->_assetInfo, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend_keyCertificateURL(self->_assetInfo, v44, v45);

    }
  }
  BLError();
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(self, v46, (uint64_t)v47);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentKeyData, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_secureKeyRequest, 0);
  objc_storeStrong((id *)&self->_assetInfo, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_metadataRequest, 0);
}

@end
