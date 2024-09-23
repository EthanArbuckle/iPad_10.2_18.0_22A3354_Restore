@implementation BLSecureOfflineKeyDeliveryRequest

- (BLSecureOfflineKeyDeliveryRequest)initWithRequestContext:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BLSecureOfflineKeyDeliveryRequest *v9;

  v5 = a3;
  v8 = objc_msgSend_init(self, v6, v7);
  v9 = (BLSecureOfflineKeyDeliveryRequest *)v8;
  if (v8)
    objc_storeStrong((id *)(v8 + 320), a3);

  return v9;
}

- (BLSecureOfflineKeyDeliveryRequest)init
{
  BLSecureOfflineKeyDeliveryRequest *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *keySessionQueue;
  const char *v6;
  uint64_t v7;
  AVContentKeySession *keySession;
  const char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BLSecureOfflineKeyDeliveryRequest;
  v2 = -[ICRequestOperation init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.iBooks.HLSKeySession", v3);
    keySessionQueue = v2->_keySessionQueue;
    v2->_keySessionQueue = (OS_dispatch_queue *)v4;

    objc_msgSend_contentKeySessionWithKeySystem_(MEMORY[0x24BDB2538], v6, *MEMORY[0x24BDB1BB8]);
    v7 = objc_claimAutoreleasedReturnValue();
    keySession = v2->_keySession;
    v2->_keySession = (AVContentKeySession *)v7;

    objc_msgSend_setDelegate_queue_(v2->_keySession, v9, (uint64_t)v2, v2->_keySessionQueue);
  }
  return v2;
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
  v10[2] = sub_213244C58;
  v10[3] = &unk_24CF70C10;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend_performRequestOnOperationQueue_withCompletionHandler_(self, v9, (uint64_t)v7, v10);

}

- (void)execute
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  BLSecureOfflineKeyDeliveryRequest *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  NSURL *keyCertificateURL;
  NSURL *keyServerURL;
  const char *v21;
  const char *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  BLSecureOfflineKeyDeliveryRequest *v25;
  __int16 v26;
  NSURL *v27;
  __int16 v28;
  NSURL *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (self->_keyCertificateURL && self->_keyServerURL)
  {
    BLHLSKeyFetchingLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_title(self->_mediaItem, v4, v5);
      v6 = (BLSecureOfflineKeyDeliveryRequest *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_21323F000, v3, OS_LOG_TYPE_DEFAULT, "Fetching key request certificate for '%@'", buf, 0xCu);

    }
    objc_msgSend_highPrioritySession(MEMORY[0x24BEC8A50], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BDD16B0]);
    v12 = (void *)objc_msgSend_initWithURL_(v10, v11, (uint64_t)self->_keyCertificateURL);
    objc_msgSend_setHTTPMethod_(v12, v13, (uint64_t)CFSTR("GET"));
    v14 = objc_alloc(MEMORY[0x24BEC8A00]);
    v16 = (void *)objc_msgSend_initWithURLRequest_requestContext_(v14, v15, (uint64_t)v12, self->_requestContext);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_213244F6C;
    v23[3] = &unk_24CF70DE0;
    v23[4] = self;
    objc_msgSend_enqueueDataRequest_withCompletionHandler_(v9, v17, (uint64_t)v16, v23);

  }
  else
  {
    BLHLSKeyFetchingLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      keyCertificateURL = self->_keyCertificateURL;
      keyServerURL = self->_keyServerURL;
      *(_DWORD *)buf = 138543874;
      v25 = self;
      v26 = 2114;
      v27 = keyCertificateURL;
      v28 = 2114;
      v29 = keyServerURL;
      _os_log_impl(&dword_21323F000, v18, OS_LOG_TYPE_ERROR, "[%{public}@]: Missing certificate URL: %{public}@, key server URL: %{public}@", buf, 0x20u);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v21, *MEMORY[0x24BEC8580], -7101, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v22, (uint64_t)v9);
  }

}

- (id)_deviceGUID
{
  if (qword_254B8C3B0 != -1)
    dispatch_once(&qword_254B8C3B0, &unk_24CF70E00);
  return (id)qword_254B8C3A8;
}

- (void)_createSPCData
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  BLHLSKeyFetchingLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_title(self->_mediaItem, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21323F000, v3, OS_LOG_TYPE_DEFAULT, "Creating SPC data for '%@'", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend_processContentKeyRequestWithIdentifier_initializationData_options_(self->_keySession, v7, (uint64_t)self->_identity, 0, 0);
}

- (void)_ksq_fetchCKCDataUsingSPC:(id)a3 forKeyRequest:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  int isWatch;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  NSObject *v39;
  const char *v40;
  const char *v41;
  NSObject *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  void *v47;
  const char *v48;
  void *v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  BLSecureOfflineKeyDeliveryRequest *v55;
  id v56;
  const char *v57;
  void *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  id v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  void *v70;
  const char *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  void *v77;
  void *v78;
  _QWORD v79[5];
  id v80;
  id v81;
  uint64_t v82;
  id v83;
  uint8_t buf[4];
  BLSecureOfflineKeyDeliveryRequest *v85;
  __int16 v86;
  id v87;
  void *v88;
  _QWORD v89[2];
  _QWORD v90[2];
  const __CFString *v91;
  _QWORD v92[3];

  v92[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keySessionQueue);
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCED8]);
    v10 = (void *)objc_msgSend_initWithObjectsAndKeys_(v8, v9, (uint64_t)&unk_24CF72CB8, CFSTR("id"), 0);
    objc_msgSend_identity(self, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend_setObject_forKey_(v10, v13, v15, CFSTR("uri"));
    v78 = (void *)v15;
    if (objc_msgSend_length(v6, v13, v14))
    {
      objc_msgSend_base64EncodedStringWithOptions_(v6, v16, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_length(v17, v18, v19))
        objc_msgSend_setObject_forKey_(v10, v20, (uint64_t)v17, CFSTR("spc"));

    }
    objc_msgSend_setObject_forKey_(v10, v16, MEMORY[0x24BDBD1C8], CFSTR("offline"));
    objc_msgSend__deviceGUID(self, v21, v22);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
      objc_msgSend_setObject_forKey_(v10, v23, v25, CFSTR("guid"));
    v77 = (void *)v25;
    objc_msgSend_deviceInfo(self->_requestContext, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    isWatch = objc_msgSend_isWatch(v26, v27, v28);

    if (isWatch)
    {
      objc_msgSend_sharedMonitor(MEMORY[0x24BEC8900], v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pairedDeviceMediaGUID(v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_length(v35, v36, v37))
      {
        objc_msgSend_setObject_forKey_(v10, v38, (uint64_t)v35, CFSTR("companion-guid"));
      }
      else
      {
        BLHLSKeyFetchingLog();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v85 = self;
          _os_log_impl(&dword_21323F000, v42, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to obtain companion guid.", buf, 0xCu);
        }

      }
    }
    v91 = CFSTR("fairplay-streaming-request");
    v90[0] = &unk_24CF72CD0;
    v89[0] = CFSTR("version");
    v89[1] = CFSTR("streaming-keys");
    v88 = v10;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v30, (uint64_t)&v88, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v43;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v44, (uint64_t)v90, v89, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v92[0] = v45;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v46, (uint64_t)v92, &v91, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = 0;
    objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x24BDD1608], v48, (uint64_t)v47, 0, &v81);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v81;
    BLHLSKeyFetchingLog();
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (!v49 || v50)
    {
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v85 = self;
        v86 = 2112;
        v87 = v50;
        _os_log_impl(&dword_21323F000, v52, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to serialize key server request data with error:  %@", buf, 0x16u);
      }

      v72 = (void *)MEMORY[0x24BDD1540];
      v73 = *MEMORY[0x24BE0FB88];
      if (v50)
      {
        v82 = *MEMORY[0x24BDD1398];
        v83 = v50;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v71, (uint64_t)&v83, &v82, 1);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v72, v75, v73, 2, v74);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v71, *MEMORY[0x24BE0FB88], 2, 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v70 = v77;
      objc_msgSend_finishWithError_(self, v76, (uint64_t)v58);
      v69 = v78;
    }
    else
    {
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_title(self->_mediaItem, v53, v54);
        v55 = (BLSecureOfflineKeyDeliveryRequest *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v85 = v55;
        _os_log_impl(&dword_21323F000, v52, OS_LOG_TYPE_DEFAULT, "Performing offline key request for '%@'", buf, 0xCu);

      }
      v56 = objc_alloc(MEMORY[0x24BDD16B0]);
      v58 = (void *)objc_msgSend_initWithURL_(v56, v57, (uint64_t)self->_keyServerURL);
      objc_msgSend_setHTTPBody_(v58, v59, (uint64_t)v49);
      objc_msgSend_setHTTPMethod_(v58, v60, (uint64_t)CFSTR("POST"));
      objc_msgSend_setValue_forHTTPHeaderField_(v58, v61, *MEMORY[0x24BEC8598], *MEMORY[0x24BEC85A8]);
      v62 = objc_alloc(MEMORY[0x24BEC8A00]);
      v64 = (void *)objc_msgSend_initWithURLRequest_requestContext_(v62, v63, (uint64_t)v58, self->_requestContext);
      objc_msgSend_highPrioritySession(MEMORY[0x24BEC8A50], v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x24BDAC760];
      v79[1] = 3221225472;
      v79[2] = sub_213245868;
      v79[3] = &unk_24CF70E50;
      v79[4] = self;
      v80 = v7;
      objc_msgSend_enqueueDataRequest_withCompletionHandler_(v67, v68, (uint64_t)v64, v79);

      v70 = v77;
      v69 = v78;
    }

  }
  else
  {
    BLHLSKeyFetchingLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v85 = self;
      _os_log_impl(&dword_21323F000, v39, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to generate server playback context data", buf, 0xCu);
    }

    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v40, *MEMORY[0x24BE0FB88], 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v41, (uint64_t)v10);
  }

}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  char v10;
  NSObject *v11;
  const char *v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keySessionQueue);
  BLHLSKeyFetchingLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21323F000, v7, OS_LOG_TYPE_INFO, "Content key request provided", buf, 2u);
  }

  if (self->_activeKeyRequest)
  {
    BLHLSKeyFetchingLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21323F000, v8, OS_LOG_TYPE_DEFAULT, "Skipping provided content key request", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_activeKeyRequest, a4);
    v13 = 0;
    v10 = objc_msgSend_respondByRequestingPersistableContentKeyRequestAndReturnError_(v6, v9, (uint64_t)&v13);
    v8 = v13;
    if ((v10 & 1) == 0)
    {
      BLHLSKeyFetchingLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_21323F000, v11, OS_LOG_TYPE_ERROR, "Request for persistable content key request failed with error:  %@", buf, 0xCu);
      }

      objc_msgSend_finishWithError_(self, v12, (uint64_t)v8);
    }
  }

}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSData *certificateData;
  const char *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keySessionQueue);
  BLHLSKeyFetchingLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21323F000, v7, OS_LOG_TYPE_DEFAULT, "Persistable content key request provided", buf, 2u);
  }

  if (self->_activePersistableKeyRequest)
  {
    BLHLSKeyFetchingLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21323F000, v8, OS_LOG_TYPE_DEFAULT, "Skipping provided persistable content key request", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_activePersistableKeyRequest, a4);
    objc_msgSend_dataUsingEncoding_(self->_identity, v9, 4);
    v8 = objc_claimAutoreleasedReturnValue();
    certificateData = self->_certificateData;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = sub_21324638C;
    v12[3] = &unk_24CF70E78;
    v12[4] = self;
    v13 = v6;
    objc_msgSend_makeStreamingContentKeyRequestDataForApp_contentIdentifier_options_completionHandler_(v13, v11, (uint64_t)certificateData, v8, 0, v12);

  }
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  AVPersistableContentKeyRequest *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = (AVPersistableContentKeyRequest *)a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keySessionQueue);
  if ((AVPersistableContentKeyRequest *)self->_activeKeyRequest == v7 || self->_activePersistableKeyRequest == v7)
  {
    BLHLSKeyFetchingLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_title(self->_mediaItem, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_21323F000, v9, OS_LOG_TYPE_ERROR, "Content key request failed for '%@' with error:  %@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend_finishWithError_(self, v13, (uint64_t)v8);
  }

}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (void)setKeyCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (void)setKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_activePersistableKeyRequest, 0);
  objc_storeStrong((id *)&self->_activeKeyRequest, 0);
  objc_storeStrong((id *)&self->_slotRequest, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_persistentKeyData, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_keySessionQueue, 0);
  objc_storeStrong((id *)&self->_keySession, 0);
}

@end
