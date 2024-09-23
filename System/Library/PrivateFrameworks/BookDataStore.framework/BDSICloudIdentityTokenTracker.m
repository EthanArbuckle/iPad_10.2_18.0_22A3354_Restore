@implementation BDSICloudIdentityTokenTracker

- (void)acknowledgeiCloudIdentity
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id buf[2];

  BDSCloudKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_DEFAULT, "acknowledgeiCloudIdentity", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  objc_msgSend_dispatchQueue(self, v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_227D688D8;
  v9[3] = &unk_24F08A5F0;
  objc_copyWeak(&v10, buf);
  v9[4] = self;
  dispatch_sync(v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (BOOL)didUnacknowledgediCloudLogoutOccur
{
  BDSICloudIdentityTokenTracker *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v9[6];
  id v10;
  id location;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v2 = self;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_initWeak(&location, self);
  objc_msgSend_dispatchQueue(v2, v3, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_227D68ACC;
  v9[3] = &unk_24F08A5C8;
  objc_copyWeak(&v10, &location);
  v9[4] = v2;
  v9[5] = &v12;
  dispatch_sync(v7, v9);

  LOBYTE(v2) = *((_BYTE *)v13 + 24);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);
  return (char)v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)fetchCurrentToken
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BDSICloudIdentityToken *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;

  if ((objc_msgSend_trackLiverpool(self, a2, v2, v3, v4) & 1) != 0)
  {
    objc_msgSend_tokenForCurrentIdentityIfCloudKitEnabled(BDSICloudIdentityToken, v6, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = [BDSICloudIdentityToken alloc];
    v10 = objc_msgSend_initWithCurrentIdentity(v13, v14, v15, v16, v17);
  }
  v18 = (char *)v10;
  objc_msgSend_setCurrentToken_(self, v18, (uint64_t)v18, v11, v12);

}

- (BOOL)trackLiverpool
{
  return self->_trackLiverpool;
}

- (void)setCurrentToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentToken, a3);
}

- (NSMutableDictionary)plistContents
{
  return self->_plistContents;
}

- (BDSICloudIdentityToken)currentToken
{
  return self->_currentToken;
}

- (BDSICloudIdentityTokenTracker)initWithContainerURL:(id)a3 trackingLiverpool:(BOOL)a4
{
  id v6;
  BDSICloudIdentityTokenTracker *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  BDSICloudIdentityTokenTracker *v11;
  uint64_t v12;
  NSURL *plistURL;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *dispatchQueue;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *plistContents;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BDSICloudIdentityTokenTracker;
  v7 = -[BDSICloudIdentityTokenTracker init](&v31, sel_init);
  v11 = v7;
  if (v7)
  {
    v7->_trackLiverpool = a4;
    objc_msgSend_URLByAppendingPathComponent_(v6, v8, (uint64_t)CFSTR("BDSICloudIdentityToken.plist"), v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    plistURL = v11->_plistURL;
    v11->_plistURL = (NSURL *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_DEFAULT, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.iBooks.BDSICloudStatusMonitor.dispatchQueue", v15);
    dispatchQueue = v11->_dispatchQueue;
    v11->_dispatchQueue = (OS_dispatch_queue *)v16;

    objc_msgSend_dictionaryWithContentsOfURL_(MEMORY[0x24BDBCE70], v18, (uint64_t)v11->_plistURL, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend_mutableCopy(v21, v22, v23, v24, v25);
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = (NSMutableDictionary *)objc_opt_new();
    plistContents = v11->_plistContents;
    v11->_plistContents = v28;

  }
  return v11;
}

- (void)forceUpdateTokenWithString:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  BDSICloudIdentityToken *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  if (v15)
  {
    v7 = [BDSICloudIdentityToken alloc];
    v11 = (void *)objc_msgSend_initWithToken_(v7, v8, (uint64_t)v15, v9, v10);
    objc_msgSend_setCurrentToken_(self, v12, (uint64_t)v11, v13, v14);

  }
  else
  {
    objc_msgSend_setCurrentToken_(self, v4, 0, v5, v6);
  }

}

- (void)setPlistContents:(id)a3
{
  objc_storeStrong((id *)&self->_plistContents, a3);
}

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (void)setPlistURL:(id)a3
{
  objc_storeStrong((id *)&self->_plistURL, a3);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)setTrackLiverpool:(BOOL)a3
{
  self->_trackLiverpool = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);
  objc_storeStrong((id *)&self->_plistContents, 0);
}

@end
