@implementation BLStreamingKeyRequest

- (BLStreamingKeyRequest)initWithMediaItem:(id)a3 loadingRequest:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BLStreamingKeyRequest *v12;

  v7 = a3;
  v8 = a4;
  v11 = objc_msgSend_init(self, v9, v10);
  v12 = (BLStreamingKeyRequest *)v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 320), a3);
    objc_storeStrong((id *)&v12->_loadingRequest, a4);
  }

  return v12;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_213247368;
  v7[3] = &unk_24CF70C10;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend_performRequestWithCompletionHandler_(self, v6, (uint64_t)v7);

}

- (void)execute
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *active;
  BLStoreItemMetadataRequest *v7;
  const char *v8;
  BLStoreItemMetadataRequest *v9;
  BLStoreItemMetadataRequest *metadataRequest;
  BLStoreItemMetadataRequest *v11;
  const char *v12;
  _QWORD v13[5];

  v3 = objc_alloc(MEMORY[0x24BEC89F8]);
  active = (void *)objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v3, v4, v5);
  v7 = [BLStoreItemMetadataRequest alloc];
  v9 = (BLStoreItemMetadataRequest *)objc_msgSend_initWithRequestContext_mediaItem_(v7, v8, (uint64_t)active, self->_mediaItem);
  metadataRequest = self->_metadataRequest;
  self->_metadataRequest = v9;

  v11 = self->_metadataRequest;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_2132474A0;
  v13[3] = &unk_24CF70EC8;
  v13[4] = self;
  objc_msgSend_performRequestWithResponseHandler_(v11, v12, (uint64_t)v13);

}

- (void)_performStreamingKeyRequestForHLSAsset:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *active;
  id v10;
  const char *v11;
  ICSecureKeyDeliveryRequest *v12;
  ICSecureKeyDeliveryRequest *secureKeyRequest;
  const char *v14;
  ICSecureKeyDeliveryRequest *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  ICSecureKeyDeliveryRequest *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  ICSecureKeyDeliveryRequest *v26;
  const char *v27;
  _QWORD v28[5];

  v4 = (objc_class *)MEMORY[0x24BEC89F8];
  v5 = a3;
  v6 = [v4 alloc];
  active = (void *)objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v6, v7, v8);
  v10 = objc_alloc(MEMORY[0x24BEC8990]);
  v12 = (ICSecureKeyDeliveryRequest *)objc_msgSend_initWithRequestContext_resourceLoadingRequest_(v10, v11, (uint64_t)active, self->_loadingRequest);
  secureKeyRequest = self->_secureKeyRequest;
  self->_secureKeyRequest = v12;

  objc_msgSend_setShouldIncludeDeviceGUID_(self->_secureKeyRequest, v14, 1);
  v15 = self->_secureKeyRequest;
  objc_msgSend_keyCertificateURL(v5, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCertificateURL_(v15, v19, (uint64_t)v18);

  v20 = self->_secureKeyRequest;
  objc_msgSend_keyServerURL(v5, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setKeyServerURL_(v20, v24, (uint64_t)v23);
  objc_msgSend_setITunesStoreRequest_(self->_secureKeyRequest, v25, 1);
  v26 = self->_secureKeyRequest;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_2132476D8;
  v28[3] = &unk_24CF70EF0;
  v28[4] = self;
  objc_msgSend_performWithResponseHandler_(v26, v27, (uint64_t)v28);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingRequest, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_secureKeyRequest, 0);
  objc_storeStrong((id *)&self->_metadataRequest, 0);
}

@end
