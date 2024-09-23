@implementation BLStoreItemMetadataRequest

- (BLStoreItemMetadataRequest)initWithRequestContext:(id)a3 mediaItem:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BLStoreItemMetadataRequest *v12;

  v7 = a3;
  v8 = a4;
  v11 = objc_msgSend_init(self, v9, v10);
  v12 = (BLStoreItemMetadataRequest *)v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 304), a3);
    objc_storeStrong((id *)&v12->_mediaItem, a4);
  }

  return v12;
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
  v10[2] = sub_2132478D0;
  v10[3] = &unk_24CF70F18;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_performRequestOnOperationQueue_withCompletionHandler_(self, v9, (uint64_t)v7, v10);

}

- (void)execute
{
  ((void (*)(BLStoreItemMetadataRequest *, char *))MEMORY[0x24BEDD108])(self, sel__performBuyProductRequest);
}

- (void)finishWithError:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BLStoreItemMetadataRequest;
  -[ICRequestOperation finishWithError:](&v3, sel_finishWithError_, a3);
}

- (void)_performBuyProductRequest
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *active;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BEC89F8]);
  active = (void *)objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v3, v4, v5);
  BLHLSKeyFetchingLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_title(self->_mediaItem, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_impl(&dword_21323F000, v7, OS_LOG_TYPE_INFO, "Starting metadata request for '%@'", buf, 0xCu);

  }
  objc_msgSend_sharedBagProvider(MEMORY[0x24BEC8A38], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_213247B4C;
  v16[3] = &unk_24CF70F68;
  v16[4] = self;
  v17 = active;
  v14 = active;
  objc_msgSend_getBagForRequestContext_withCompletionHandler_(v13, v15, (uint64_t)v14, v16);

}

- (id)_responseDictionaryForKeyCertificateURL:(id)a3 keyServerURL:(id)a4
{
  id v6;
  id v7;
  MPMediaItem *mediaItem;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  MPMediaItem *v16;
  int v18;
  MPMediaItem *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  mediaItem = self->_mediaItem;
  sub_213243BAC();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForProperty_(mediaItem, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend__isHLSPlaylistURLStringValid_(self, v12, (uint64_t)v11))
  {
    v20[0] = CFSTR("hls-playlist-url");
    v20[1] = CFSTR("hls-key-cert-url");
    v21[0] = v11;
    v21[1] = v6;
    v20[2] = CFSTR("hls-key-server-url");
    v21[2] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v21, v20, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BLHLSKeyFetchingLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = self->_mediaItem;
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_21323F000, v15, OS_LOG_TYPE_ERROR, "No stream URL available for media item %@.", (uint8_t *)&v18, 0xCu);
    }

    v14 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v14;
}

- (BOOL)_isHLSPlaylistURLStringValid:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  const char *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    BLHLSKeyFetchingLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v12) = 0;
    v10 = "playlistURLString is nil";
LABEL_14:
    _os_log_impl(&dword_21323F000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 2u);
    goto LABEL_15;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    BLHLSKeyFetchingLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v12) = 0;
    v10 = "playlistURLString is not a string";
    goto LABEL_14;
  }
  if (!objc_msgSend_length(v3, v4, v5))
  {
    BLHLSKeyFetchingLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v10 = "playlistURLString is empty";
      goto LABEL_14;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v6, (uint64_t)v3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  if (!v7)
  {
    BLHLSKeyFetchingLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = 0;
      _os_log_impl(&dword_21323F000, v9, OS_LOG_TYPE_ERROR, "playlistURLString is not a valid url: %@", (uint8_t *)&v12, 0xCu);
    }

    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_buyProductRequest, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

@end
