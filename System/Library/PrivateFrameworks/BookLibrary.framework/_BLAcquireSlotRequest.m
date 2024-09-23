@implementation _BLAcquireSlotRequest

- (_BLAcquireSlotRequest)initWithDeviceGUID:(id)a3
{
  id v4;
  _BLAcquireSlotRequest *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t active;
  ICStoreRequestContext *requestContext;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *deviceGUID;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_BLAcquireSlotRequest;
  v5 = -[ICRequestOperation init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BEC89F8]);
    active = objc_msgSend_initWithActiveAccountAllowAuthenticationOnceADay_bl(v6, v7, v8);
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)active;

    v13 = objc_msgSend_copy(v4, v11, v12);
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v13;

  }
  return v5;
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
  v7[2] = sub_213242EF8;
  v7[3] = &unk_24CF70C10;
  v7[4] = self;
  v8 = v4;
  v5 = v4;
  objc_msgSend_performRequestWithCompletionHandler_(self, v6, (uint64_t)v7);

}

- (void)execute
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  _QWORD v9[4];
  id v10;
  id location;

  objc_msgSend_defaultBag(MEMORY[0x24BE0FBF8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend_acquireSlotURL(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_213243018;
  v9[3] = &unk_24CF70C38;
  objc_copyWeak(&v10, &location);
  objc_msgSend_valueWithCompletion_(v7, v8, (uint64_t)v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_acquireSlotWithURL:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  void *v7;
  NSString *deviceGUID;
  void *v9;
  const char *v10;
  uint64_t v11;
  int isWatch;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  _BLAcquireSlotRequest *v24;
  _BLAcquireSlotRequest *v25;
  NSObject *v26;
  id v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  id v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t buf[4];
  _BLAcquireSlotRequest *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = v5;
  deviceGUID = self->_deviceGUID;
  if (deviceGUID)
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)deviceGUID, CFSTR("guid"));
  objc_msgSend_deviceInfo(self->_requestContext, v6, (uint64_t)deviceGUID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isWatch = objc_msgSend_isWatch(v9, v10, v11);

  if (isWatch)
  {
    objc_msgSend_sharedMonitor(MEMORY[0x24BEC8900], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pairedDeviceMediaGUID(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v18, v19, v20))
    {
      objc_msgSend_setObject_forKey_(v7, v21, (uint64_t)v18, CFSTR("companion-guid"));
    }
    else
    {
      BLHLSKeyFetchingLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v44 = self;
        _os_log_impl(&dword_21323F000, v22, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to obtain companion guid.", buf, 0xCu);
      }

    }
  }
  v42 = 0;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x24BDD1770], v13, (uint64_t)v7, 100, 0, &v42);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (_BLAcquireSlotRequest *)v42;
  v25 = v24;
  if (!v23 || v24)
  {
    BLHLSKeyFetchingLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v25;
      _os_log_impl(&dword_21323F000, v26, OS_LOG_TYPE_ERROR, "Failed to serialize property list for acquireSlot request! %@", buf, 0xCu);
    }

  }
  v27 = objc_alloc(MEMORY[0x24BDD16B0]);
  v29 = (void *)objc_msgSend_initWithURL_(v27, v28, (uint64_t)v4);
  objc_msgSend_setHTTPMethod_(v29, v30, (uint64_t)CFSTR("POST"));
  objc_msgSend_setHTTPBody_(v29, v31, (uint64_t)v23);
  objc_msgSend_setValue_forHTTPHeaderField_(v29, v32, *MEMORY[0x24BEC85A0], *MEMORY[0x24BEC85A8]);
  objc_initWeak((id *)buf, self);
  v33 = objc_alloc(MEMORY[0x24BEC8A00]);
  v35 = (void *)objc_msgSend_initWithURLRequest_requestContext_(v33, v34, (uint64_t)v29, self->_requestContext);
  objc_msgSend_highPrioritySession(MEMORY[0x24BEC8A50], v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = sub_21324342C;
  v40[3] = &unk_24CF70C60;
  objc_copyWeak(&v41, (id *)buf);
  objc_msgSend_enqueueDataRequest_withCompletionHandler_(v38, v39, (uint64_t)v35, v40);
  objc_destroyWeak(&v41);

  objc_destroyWeak((id *)buf);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

@end
