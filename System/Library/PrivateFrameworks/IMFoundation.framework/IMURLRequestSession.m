@implementation IMURLRequestSession

+ (IMURLRequestSession)sharedSession
{
  if (qword_1EE1DDD78 != -1)
    dispatch_once(&qword_1EE1DDD78, &unk_1E2C42EE8);
  return (IMURLRequestSession *)(id)qword_1EE1DDD70;
}

+ (IMURLRequestSession)sharedSessionRequiringIDSHost
{
  if (qword_1EE1DDD88 != -1)
    dispatch_once(&qword_1EE1DDD88, &unk_1E2C45D88);
  return (IMURLRequestSession *)(id)qword_1EE1DDD80;
}

+ (IMURLRequestSession)sessionWithConfiguration:(id)a3 queue:(id)a4 requiresIDSHost:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  const char *v11;
  void *v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend_initWithConfiguration_queue_requiresIDSHost_(v10, v11, (uint64_t)v9, (uint64_t)v8, v5);

  return (IMURLRequestSession *)v12;
}

- (IMURLRequestSession)initWithConfiguration:(id)a3 queue:(id)a4 requiresIDSHost:(BOOL)a5
{
  id v8;
  id v9;
  IMURLRequestSession *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IMURLRequestSession;
  v10 = -[IMURLRequestSession init](&v19, sel_init);
  v11 = (uint64_t)v10;
  if (v10)
  {
    v10->_requireIDSHost = a5;
    objc_storeStrong((id *)&v10->_sessionQueue, a4);
    v12 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    objc_msgSend_setUnderlyingQueue_(v12, v13, *(_QWORD *)(v11 + 16), v14);
    objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(MEMORY[0x1E0CB39F0], v15, (uint64_t)v8, v11, v12);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(v11 + 8);
    *(_QWORD *)(v11 + 8) = v16;

  }
  return (IMURLRequestSession *)v11;
}

- (void)finishTasksAndInvalidate
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_finishTasksAndInvalidate(self->_session, a2, v2, v3);
}

- (void)performRequest:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1906A432C;
  v9[3] = &unk_1E2C45DB0;
  v10 = v6;
  v7 = v6;
  objc_msgSend_performRequest_completionBlockWithTimingData_(self, v8, (uint64_t)a3, (uint64_t)v9);

}

- (void)performRequest:(id)a3 completionBlockWithTimingData:(id)a4
{
  id v6;
  id v7;
  NSURLSession *session;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *, void *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_1906A444C;
  v26 = sub_1906A445C;
  v27 = 0;
  session = self->_session;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = sub_1906A4464;
  v19 = &unk_1E2C45DD8;
  v21 = &v22;
  v9 = v7;
  v20 = v9;
  objc_msgSend_dataTaskWithRequest_completionHandler_(session, v10, (uint64_t)v6, (uint64_t)&v16);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v23[5];
  v23[5] = v11;

  objc_msgSend_resume((void *)v23[5], v13, v14, v15, v16, v17, v18, v19);
  _Block_object_dispose(&v22, 8);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  int v10;
  IMURLRequestSession *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (v8)
  {
    objc_msgSend_URLLoading(IMIDSLog, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_19066D000, v9, OS_LOG_TYPE_DEFAULT, "URLSession:didBecomeInvalidWithError: called with error {self: %@, error: %@}", (uint8_t *)&v10, 0x16u);
    }

  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  char isEqualToString;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  NSObject *v74;
  id v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const void *AppleIDSServiceContext;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  __SecTrust *v97;
  OSStatus v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  const char *v103;
  NSObject *v104;
  uint32_t v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  NSObject *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  __SecTrust *v127;
  NSObject *sessionQueue;
  void (**v129)(id, uint64_t, _QWORD);
  OSStatus v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  NSObject *v134;
  void *v135;
  IMURLRequestSession *v136;
  void (**v137)(id, uint64_t, _QWORD);
  _QWORD result[4];
  id v139;
  id v140;
  unint64_t v141;
  unint64_t __buf;
  uint8_t buf[4];
  _BYTE v144[18];
  __int16 v145;
  void *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  void *v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend_URLLoading(IMIDSLog, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_protectionSpace(v7, v13, v14, v15);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = self;
    objc_msgSend_realm(v135, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionSpace(v7, v20, v21, v22);
    v137 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_host(v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionSpace(v7, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protocol(v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionSpace(v7, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_authenticationMethod(v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_proposedCredential(v7, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)v144 = v19;
    *(_WORD *)&v144[8] = 2112;
    *(_QWORD *)&v144[10] = v27;
    v145 = 2112;
    v146 = v35;
    v147 = 2112;
    v148 = v43;
    v149 = 2112;
    v150 = v47;
    _os_log_impl(&dword_19066D000, v12, OS_LOG_TYPE_DEFAULT, "Received authentication challenge:\n  ---->Protection Space: <Realm: %@, Host: %@, Protocol: %@, Method: %@>\n  ---->Proposed Credential: %@\n  Performing default handling.", buf, 0x34u);

    v8 = v137;
    self = v136;

  }
  if (qword_1ECD90AD0 != -1)
    dispatch_once(&qword_1ECD90AD0, &unk_1E2C43948);
  if (byte_1ECD90AC8 != 1 || !IMGetDomainBoolForKey(CFSTR("com.apple.ids"), CFSTR("disableCertPinning")))
  {
    if (!self->_requireIDSHost)
      goto LABEL_19;
    objc_msgSend_protectionSpace(v7, v48, v49, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_authenticationMethod(v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v56, v57, *MEMORY[0x1E0CB32C8], v58);

    if ((isEqualToString & 1) == 0)
    {
LABEL_24:
      v8[2](v8, 1, 0);
      goto LABEL_39;
    }
    objc_msgSend_protectionSpace(v7, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_host(v63, v64, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v67)
    {
      objc_msgSend_URLLoading(IMIDSLog, v68, v69, v70);
      v122 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19066D000, v122, OS_LOG_TYPE_DEFAULT, "No hostname override - perform default handling", buf, 2u);
      }

      v8[2](v8, 1, 0);
      goto LABEL_38;
    }
    __buf = 0xAAAAAAAAAAAAAAAALL;
    arc4random_buf(&__buf, 8uLL);
    objc_msgSend_URLLoading(IMIDSLog, v71, v72, v73);
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v144 = v67;
      *(_WORD *)&v144[8] = 2048;
      *(_QWORD *)&v144[10] = __buf;
      _os_log_impl(&dword_19066D000, v74, OS_LOG_TYPE_DEFAULT, "Validating server trust using designated hostname: %@ {identifier: %llu}", buf, 0x16u);
    }

    v75 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v78 = (void *)objc_msgSend_initWithCapacity_(v75, v76, 1, v77);
    objc_msgSend_sharedInstance(IMLockdownManager, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_isInternalInstall(v82, v83, v84, v85);
    AppleIDSServiceContext = (const void *)SecPolicyCreateAppleIDSServiceContext();

    if (AppleIDSServiceContext)
    {
      objc_msgSend_addObject_(v78, v87, (uint64_t)AppleIDSServiceContext, v89);
      objc_msgSend_protectionSpace(v7, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = (__SecTrust *)objc_msgSend_serverTrust(v93, v94, v95, v96);
      v98 = SecTrustSetPolicies(v97, v78);

      if (!v98)
      {
        objc_msgSend_protectionSpace(v7, v99, v100, v101);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = (__SecTrust *)objc_msgSend_serverTrust(v123, v124, v125, v126);
        sessionQueue = self->_sessionQueue;
        result[0] = MEMORY[0x1E0C809B0];
        result[1] = 3221225472;
        result[2] = sub_1906A4CF4;
        result[3] = &unk_1E2C45E00;
        v141 = __buf;
        v129 = v8;
        v140 = v129;
        v139 = v7;
        v130 = SecTrustEvaluateAsyncWithError(v127, sessionQueue, result);

        CFRelease(AppleIDSServiceContext);
        if (v130)
        {
          objc_msgSend_URLLoading(IMIDSLog, v131, v132, v133);
          v134 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v144 = v130;
            *(_WORD *)&v144[4] = 2048;
            *(_QWORD *)&v144[6] = __buf;
            _os_log_impl(&dword_19066D000, v134, OS_LOG_TYPE_DEFAULT, "SecTrustEvaluateAsyncWithError() failed to start status=%d {identifier: %llu}", buf, 0x12u);
          }

          v129[2](v129, 2, 0);
        }

        goto LABEL_37;
      }
      objc_msgSend_URLLoading(IMIDSLog, v99, v100, v101);
      v102 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v144 = v98;
        *(_WORD *)&v144[4] = 2048;
        *(_QWORD *)&v144[6] = __buf;
        v103 = "Unable to set policies %d {identifier: %llu}";
        v104 = v102;
        v105 = 18;
LABEL_30:
        _os_log_impl(&dword_19066D000, v104, OS_LOG_TYPE_DEFAULT, v103, buf, v105);
      }
    }
    else
    {
      objc_msgSend_URLLoading(IMIDSLog, v87, v88, v89);
      v102 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v144 = __buf;
        v103 = "Unable to create SecPolicyRef {identifier: %llu}";
        v104 = v102;
        v105 = 12;
        goto LABEL_30;
      }
    }

    v8[2](v8, 2, 0);
LABEL_37:

LABEL_38:
    goto LABEL_39;
  }
  objc_msgSend_URLLoading(IMIDSLog, v48, v49, v50);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v51, OS_LOG_TYPE_DEFAULT, "*********** Disable certificate pinning switch is ON !! ***********", buf, 2u);
  }

LABEL_19:
  objc_msgSend_URLLoading(IMIDSLog, v48, v49, v50);
  v106 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19066D000, v106, OS_LOG_TYPE_DEFAULT, "We do not require IDS host, allowing through", buf, 2u);
  }

  if (byte_1ECD90AC8 != 1
    || !objc_msgSend_trustAnyCredential(IMUserDefaults, v107, v108, v109))
  {
    goto LABEL_24;
  }
  v113 = (void *)MEMORY[0x1E0CB39A8];
  objc_msgSend_protectionSpace(v7, v110, v111, v112);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend_serverTrust(v114, v115, v116, v117);
  objc_msgSend_credentialForTrust_(v113, v119, v118, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0, v121);

LABEL_39:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
