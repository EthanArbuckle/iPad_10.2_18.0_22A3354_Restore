@implementation CKDFetchTranscodeServerPublicKeyOperation

- (CKDFetchTranscodeServerPublicKeyOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDFetchTranscodeServerPublicKeyOperation *v9;
  uint64_t v10;
  NSString *transcodeServerHostname;
  const char *v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchTranscodeServerPublicKeyOperation;
  v9 = -[CKDOperation initWithOperationInfo:container:](&v15, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_transcodeServerHostname(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    transcodeServerHostname = v9->_transcodeServerHostname;
    v9->_transcodeServerHostname = (NSString *)v10;

    v9->_type = objc_msgSend_type(v6, v12, v13);
  }

  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/fetch-public-key", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (void)main
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  CKDFetchTranscodeServerPublicKeyOperation *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v11 = v3;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v14, 1, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v19, 0, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKPropertiesStyleString(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v13;
    v26 = 2048;
    v27 = self;
    v28 = 2114;
    v29 = v18;
    v30 = 2112;
    v31 = v23;
    _os_log_debug_impl(&dword_1BE990000, v11, OS_LOG_TYPE_DEBUG, "Starting  <%{public}@: %p; %{public}@, %@>",
      buf,
      0x2Au);

  }
  if (!objc_msgSend_type(self, v4, v5))
  {
    objc_msgSend_transcodeServerHostname(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v6, *MEMORY[0x1E0C94B20], 1017, CFSTR("Operation %@ was not provided a transcode server hostname"), self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(self, v10, (uint64_t)v9);

    }
  }
  objc_msgSend_makeStateTransition_(self, v6, 0);
}

- (void)determineTranscodeServerPublicKeyURL
{
  _QWORD *v3;
  os_log_t *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (os_log_t *)MEMORY[0x1E0C952B0];
  v5 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v19 = v5;
    objc_msgSend_transcodeServerHostname(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v22;
    _os_log_debug_impl(&dword_1BE990000, v19, OS_LOG_TYPE_DEBUG, "Determining transcode server public key URL for hostname: %{public}@", buf, 0xCu);

  }
  if (*MEMORY[0x1E0C95280]
    && (objc_msgSend_unitTestOverrides(self, v6, v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("TranscodeServerPublicKeyURL")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v10))
  {
    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Overriding transcode server public key URL to %@", buf, 0xCu);
    }
    objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v12, (uint64_t)v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTranscodeServerPublicKeyURL_(self, v14, (uint64_t)v13);

  }
  else
  {
    objc_msgSend_stateTransitionGroup(self, v6, v7);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v15);

    objc_msgSend_sharedManager(CKDServerConfigurationManager, v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1BEB6BBDC;
    v23[3] = &unk_1E7830560;
    v23[4] = self;
    objc_msgSend_configurationForOperation_completionHandler_(v10, v18, (uint64_t)self, v23);
  }

}

- (void)fetchCachedTranscodePublicKey
{
  _QWORD *v3;
  os_log_t *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  int hasExpired;
  void *v23;
  os_log_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v4 = (os_log_t *)MEMORY[0x1E0C952B0];
  v5 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v35 = v5;
    objc_msgSend_transcodeServerPublicKeyURL(self, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138543362;
    v44 = v38;
    _os_log_debug_impl(&dword_1BE990000, v35, OS_LOG_TYPE_DEBUG, "Checking for cached transcode server public key for public key URL %{public}@", (uint8_t *)&v43, 0xCu);

  }
  objc_msgSend_transcodeServerPublicKeyURL(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_deviceContext(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_metadataCache(v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publicKeyOfType_withIdentifier_(v17, v18, (uint64_t)CFSTR("transcodeServerPublicKey"), v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    hasExpired = objc_msgSend_hasExpired(v19, v20, v21);
    v23 = (void *)*MEMORY[0x1E0C952F8];
    if (hasExpired)
    {
      if (*v3 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v23);
      v24 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
      {
        v39 = v24;
        objc_msgSend_expiration(v19, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138543362;
        v44 = v42;
        _os_log_debug_impl(&dword_1BE990000, v39, OS_LOG_TYPE_DEBUG, "Found a cached transcode key, but it has expired on %{public}@. Clearing cached value and continuing with server fetch.", (uint8_t *)&v43, 0xCu);

      }
      objc_msgSend_deviceContext(self, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_metadataCache(v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPublicKey_ofType_withIdentifier_(v30, v31, 0, CFSTR("transcodeServerPublicKey"), v11);

    }
    else
    {
      if (*v3 != -1)
        dispatch_once(MEMORY[0x1E0C95300], v23);
      v33 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
      {
        v43 = 138412290;
        v44 = v19;
        _os_log_debug_impl(&dword_1BE990000, v33, OS_LOG_TYPE_DEBUG, "Found a transcode public key %@", (uint8_t *)&v43, 0xCu);
      }
      objc_msgSend_setTranscodeServerPublicKey_(self, v34, (uint64_t)v19);
    }
  }
  else
  {
    if (*v3 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v32 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v43) = 0;
      _os_log_debug_impl(&dword_1BE990000, v32, OS_LOG_TYPE_DEBUG, "Couldn't find cached transcode public key", (uint8_t *)&v43, 2u);
    }
  }

}

- (void)fetchRemoteTranscodePublicKey
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const void *TranscodeServerTrustPolicy;
  CKDSignedServerPublicKeyURLRequest *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  CKDFetchTranscodeServerPublicKeyOperation *v39;
  id v40;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v31 = v3;
    objc_msgSend_transcodeServerPublicKeyURL(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v34;
    _os_log_debug_impl(&dword_1BE990000, v31, OS_LOG_TYPE_DEBUG, "Fetching transcode server public key from URL %{public}@", (uint8_t *)location, 0xCu);

  }
  objc_msgSend_stateTransitionGroup(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v6);

  v7 = (void *)objc_opt_class();
  TranscodeServerTrustPolicy = (const void *)objc_msgSend_createTranscodeServerTrustPolicy(v7, v8, v9);
  v11 = [CKDSignedServerPublicKeyURLRequest alloc];
  objc_msgSend_transcodeServerPublicKeyURL(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_initWithOperation_plistURL_verifyWithPolicy_(v11, v15, (uint64_t)self, v14, TranscodeServerTrustPolicy);

  if (objc_msgSend_type(self, v17, v18) == 1)
  {
    objc_msgSend_setRequiresProtectionSource_(v16, v19, 1);
    objc_msgSend_setVerifyFullIntegers_(v16, v20, 1);
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v21, v22, 3600.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setExpirationDateOverride_(v16, v24, (uint64_t)v23);

  }
  if (TranscodeServerTrustPolicy)
    CFRelease(TranscodeServerTrustPolicy);
  objc_initWeak(location, v16);
  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = sub_1BEB6C584;
  v38 = &unk_1E782E4E0;
  objc_copyWeak(&v40, location);
  v39 = self;
  objc_msgSend_setCompletionBlock_(v16, v25, (uint64_t)&v35);
  objc_msgSend_setRequest_(self, v26, (uint64_t)v16, v35, v36, v37, v38);
  objc_msgSend_container(self, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v29, v30, (uint64_t)v16);

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);

}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend_determineTranscodeServerPublicKeyURL(self, v6, v7);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend_fetchCachedTranscodePublicKey(self, v8, v9);
      break;
    case 3:
      objc_msgSend_transcodeServerPublicKey(self, v4, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_5;
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend_fetchRemoteTranscodePublicKey(self, v15, v16);
      break;
    case 4:
LABEL_5:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 3)
    return off_1E7834F78[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDFetchTranscodeServerPublicKeyOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (__SecPolicy)createTranscodeServerTrustPolicy
{
  return (__SecPolicy *)SecPolicyCreateApplePinned();
}

- (CKPublicKey)transcodeServerPublicKey
{
  return (CKPublicKey *)objc_getProperty(self, a2, 448, 1);
}

- (void)setTranscodeServerPublicKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSString)transcodeServerHostname
{
  return self->_transcodeServerHostname;
}

- (NSURL)transcodeServerPublicKeyURL
{
  return self->_transcodeServerPublicKeyURL;
}

- (void)setTranscodeServerPublicKeyURL:(id)a3
{
  objc_storeStrong((id *)&self->_transcodeServerPublicKeyURL, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcodeServerPublicKeyURL, 0);
  objc_storeStrong((id *)&self->_transcodeServerHostname, 0);
  objc_storeStrong((id *)&self->_transcodeServerPublicKey, 0);
}

@end
