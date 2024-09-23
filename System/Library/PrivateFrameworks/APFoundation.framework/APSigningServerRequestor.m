@implementation APSigningServerRequestor

- (APSigningServerRequestor)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  APSigningServerRequestor *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)APSigningServerRequestor;
  v5 = -[APSigningServerRequestor init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend_ephemeralSessionConfiguration(MEMORY[0x1E0CB39F8], v2, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sessionWithConfiguration_(MEMORY[0x1E0CB39F0], v7, (uint64_t)v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSession_(v5, v10, (uint64_t)v9, v11);

    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_hash(v15, v16, v17, v18);
    objc_msgSend_setServerRequestorId_(v5, v20, v19, v21);

  }
  return v5;
}

- (void)sendRequestForData:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  APSigningAuthoritySettings *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  APSigningAuthoritySettings *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  unsigned int v67;
  dispatch_time_t v68;
  NSObject *v69;
  id v70;
  _QWORD block[5];
  id v72;
  id v73;
  int64_t v74;
  _QWORD v75[3];
  _QWORD v76[4];

  v76[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v10, v11, v12))
  {
    v15 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v18 = (void *)objc_msgSend_initWithSuiteName_(v15, v16, (uint64_t)CFSTR("com.apple.AdPlatforms"), v17);
    objc_msgSend_stringForKey_(v18, v19, (uint64_t)CFSTR("mockFPDIServerUrl"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v21, v22, v23, v24))
      v25 = v21;
    else
      v25 = CFSTR("https://sas.pcms.apple.com/sas/v1/auth/");

  }
  else
  {
    v25 = CFSTR("https://sas.pcms.apple.com/sas/v1/auth/");
  }
  if (a4 == 1301)
    v26 = CFSTR("init");
  else
    v26 = CFSTR("setup");
  if (a4 == 1301)
    v27 = CFSTR("x-apple-auth-init-token");
  else
    v27 = CFSTR("x-apple-auth-setup-token");
  objc_msgSend_stringByAppendingString_(v25, v13, (uint64_t)v26, v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_alloc(MEMORY[0x1E0CB37A8]);
  objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v30, (uint64_t)v28, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend_initWithURL_cachePolicy_timeoutInterval_(v29, v33, (uint64_t)v32, 0, 10.0);

  v35 = (void *)MEMORY[0x1E0CB3940];
  v39 = objc_msgSend_serverRequestorId(self, v36, v37, v38);
  objc_msgSend_stringWithFormat_(v35, v40, (uint64_t)CFSTR("%lu"), v41, v39);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v27;
  v75[1] = CFSTR("x-apple-auth-request-id");
  v76[0] = v8;
  v76[1] = v42;
  v75[2] = CFSTR("user-agent");
  objc_msgSend_userAgentString(self, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v76[2] = v46;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v47, (uint64_t)v76, (uint64_t)v75, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setAllHTTPHeaderFields_(v34, v49, (uint64_t)v48, v50);
  objc_msgSend_setHTTPMethod_(v34, v51, (uint64_t)CFSTR("GET"), v52);
  if (!objc_msgSend_isAppleInternalInstall(APSystemInternal, v53, v54, v55))
    goto LABEL_21;
  v70 = v8;
  v57 = objc_alloc_init(APSigningAuthoritySettings);
  v61 = v57;
  if (a4 == 1301)
  {
    objc_msgSend_contextServerInitDelay(v57, v58, v59, v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 1302)
    {
LABEL_20:

      v8 = v70;
LABEL_21:
      objc_msgSend_sendRequest_requestType_completionHandler_(self, v56, (uint64_t)v34, a4, v9);
      goto LABEL_22;
    }
    objc_msgSend_contextServerSetupDelay(v57, v58, v59, v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v66 = v62;
  v67 = objc_msgSend_unsignedIntValue(v62, v63, v64, v65);

  if (!v67)
    goto LABEL_20;
  v68 = dispatch_time(0, 1000000000 * v67);
  v69 = dispatch_queue_create("com.apple.ap.signingserverrequestor.delayqueue", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CF280B58;
  block[3] = &unk_1E8C48860;
  block[4] = self;
  v72 = v34;
  v74 = a4;
  v73 = v9;
  dispatch_after(v68, v69, block);

  v8 = v70;
LABEL_22:

}

- (void)sendRequest:(id)a3 requestType:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  APSigningAuthoritySettings *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  APSigningAuthoritySettings *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id *v32;
  id v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  NSObject *v44;
  id v45;
  _QWORD v46[4];
  _QWORD v47[2];
  id v48;
  int64_t v49;
  _QWORD block[4];
  id v51;
  uint8_t buf[4];
  int64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  APLogForCategory(0x2AuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v53 = a4;
    _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_DEBUG, "Attempt to send network request of type %{public}ld.", buf, 0xCu);
  }

  if (!objc_msgSend_isAppleInternalInstall(APSystemInternal, v11, v12, v13))
    goto LABEL_8;
  v17 = objc_alloc_init(APSigningAuthoritySettings);
  v21 = v17;
  if (a4 != 1302)
  {
    if (a4 != 1301)
      goto LABEL_7;
    objc_msgSend_failContextServerInit(v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);

    if ((v26 & 1) == 0)
      goto LABEL_7;
LABEL_11:
    v44 = dispatch_queue_create("com.apple.ap.signingserverrequestor.failqueue", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1CF280DC4;
    block[3] = &unk_1E8C48888;
    v32 = &v51;
    v51 = v9;
    v45 = v9;
    dispatch_async(v44, block);

    goto LABEL_9;
  }
  objc_msgSend_failContextServerSetup(v17, v18, v19, v20);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_BOOLValue(v39, v40, v41, v42);

  if (v43)
    goto LABEL_11;
LABEL_7:

LABEL_8:
  objc_msgSend_date(MEMORY[0x1E0C99D68], v14, v15, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_session(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = sub_1CF280DE4;
  v46[3] = &unk_1E8C488B0;
  v32 = (id *)v47;
  v47[0] = v27;
  v47[1] = self;
  v48 = v9;
  v49 = a4;
  v33 = v9;
  v21 = v27;
  objc_msgSend_dataTaskWithRequest_completionHandler_(v31, v34, (uint64_t)v8, (uint64_t)v46);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_resume(v35, v36, v37, v38);
LABEL_9:

}

- (BOOL)_retrieveResponse:(void *)a3 andLength:(unsigned int *)a4 fromData:(id)a5 error:(id *)a6
{
  objc_class *v9;
  id v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  id v17;
  const char *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a5;
  v11 = [v9 alloc];
  v13 = (void *)objc_msgSend_initWithData_encoding_(v11, v12, (uint64_t)v10, 4);

  objc_opt_class();
  v16 = v13;
  if (!v16)
  {
    if (a6)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v43 = CFSTR("reason");
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("%@ is nil"), v15, CFSTR("Encoded result string"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v28;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v44, (uint64_t)&v43, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v27, v31, (uint64_t)CFSTR("com.apple.ap.signingServerRequestor"), 6200, v30);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

    }
LABEL_9:

    v26 = 0;
    goto LABEL_10;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a6)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v41 = CFSTR("reason");
      v33 = (void *)MEMORY[0x1E0CB3940];
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v33, v35, (uint64_t)CFSTR("%@ is of the wrong type (%@)"), v36, CFSTR("Encoded result string"), v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v30;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)&v42, (uint64_t)&v41, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v32, v39, (uint64_t)CFSTR("com.apple.ap.signingServerRequestor"), 6200, v38);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    goto LABEL_9;
  }

  v17 = objc_alloc(MEMORY[0x1E0C99D50]);
  v19 = objc_retainAutorelease((id)objc_msgSend_initWithBase64EncodedString_options_(v17, v18, (uint64_t)v16, 0));
  *a3 = (void *)objc_msgSend_bytes(v19, v20, v21, v22);
  *a4 = objc_msgSend_length(v19, v23, v24, v25);

  v26 = 1;
LABEL_10:

  return v26;
}

- (id)userAgentString
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;

  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_deviceModel(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemNameAndVersion(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v19, (uint64_t)CFSTR("%@; %@; %@"), v20, v14, v18, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)systemNameAndVersion
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;

  v16 = 0uLL;
  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
    objc_msgSend_operatingSystemVersion(v4, v5, v6, v7);
  else
    v16 = 0uLL;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v9, (uint64_t)CFSTR("%ld.%ld.%ld"), v10, v16, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v12, (uint64_t)CFSTR("%@ %@"), v13, CFSTR("iOS"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)deviceModel
{
  NSObject *v2;
  int v3;
  int *v4;
  char *v5;
  char *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int *v12;
  char *v13;
  uint64_t v14;
  size_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  if (sysctlbyname("hw.machine", 0, &v15, 0, 0))
  {
    APLogForCategory(0x2AuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *__error();
      v4 = __error();
      v5 = strerror(*v4);
      *(_DWORD *)buf = 136446722;
      v17 = "hw.machine";
      v18 = 1026;
      v19 = v3;
      v20 = 2082;
      v21 = v5;
    }

    return CFSTR("unknown");
  }
  else
  {
    v7 = (char *)&v14 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (sysctlbyname("hw.machine", v7, &v15, 0, 0))
    {
      APLogForCategory(0x2AuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *__error();
        v12 = __error();
        v13 = strerror(*v12);
        *(_DWORD *)buf = 136446722;
        v17 = "hw.machine";
        v18 = 1026;
        v19 = v11;
        v20 = 2080;
        v21 = v13;
      }

      return CFSTR("unknown");
    }
    else
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v8, (uint64_t)v7, v9);
      return (id)objc_claimAutoreleasedReturnValue();
    }
  }
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (unint64_t)serverRequestorId
{
  return self->_serverRequestorId;
}

- (void)setServerRequestorId:(unint64_t)a3
{
  self->_serverRequestorId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
