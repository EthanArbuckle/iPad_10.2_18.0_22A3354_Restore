@implementation APHTTPSession

- (NSString)name
{
  return self->_name;
}

- (id)POST:(id)a3 headers:(id)a4 body:(id)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  APHTTPRequest *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [APHTTPRequest alloc];
  v16 = (void *)objc_msgSend_initWithURL_HTTPMethod_HTTPHeaders_HTTPBody_serviceName_completionHandler_(v14, v15, (uint64_t)v13, 2, v12, v11, 0, v10);

  objc_msgSend_sendRequest_(self, v17, (uint64_t)v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)sendRequest:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v68[4];
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB37A8];
  objc_msgSend_URL(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestWithURL_(v5, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend_HTTPMethod(v4, v13, v14, v15);
  if (v16 > 2)
  {
    v53 = 0;
  }
  else
  {
    objc_msgSend_setHTTPMethod_(v12, v17, (uint64_t)off_1E8C48390[v16], v18);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend_allHTTPHeaderFields(v4, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_keyEnumerator(v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v70, (uint64_t)v76, 16);
    if (v28)
    {
      v32 = v28;
      v33 = *(_QWORD *)v71;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v71 != v33)
            objc_enumerationMutation(v26);
          v35 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v34);
          objc_msgSend_allHTTPHeaderFields(v4, v29, v30, v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v36, v37, v35, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addValue_forHTTPHeaderField_(v12, v40, (uint64_t)v39, v35);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v70, (uint64_t)v76, 16);
      }
      while (v32);
    }

    objc_msgSend_HTTPBody(v4, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHTTPBody_(v12, v45, (uint64_t)v44, v46);

    if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v47, v48, v49)
      && objc_msgSend_sendFakeResponseForRequest_(self, v50, (uint64_t)v4, v51))
    {
      APLogForCategory(0x1EuLL);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v75 = v12;
        _os_log_impl(&dword_1CF251000, v52, OS_LOG_TYPE_INFO, "APHTTPRequest will not be sent (error code will be returned): %{public}@", buf, 0xCu);
      }
      v53 = 0;
    }
    else
    {
      APLogForCategory(0x1EuLL);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v75 = v12;
        _os_log_impl(&dword_1CF251000, v54, OS_LOG_TYPE_INFO, "APHTTPRequest is about to be sent: %{public}@", buf, 0xCu);
      }

      objc_msgSend_completionHandler(v4, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_session(self, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = sub_1CF26098C;
      v68[3] = &unk_1E8C48348;
      v69 = v58;
      v52 = v58;
      objc_msgSend_dataTaskWithRequest_completionHandler_(v62, v63, (uint64_t)v12, (uint64_t)v68);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_resume(v53, v64, v65, v66);
    }

  }
  return v53;
}

- (NSURLSession)session
{
  return self->_session;
}

- (BOOL)sendFakeResponseForRequest:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  BOOL v25;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;

  v3 = a3;
  objc_msgSend_allHTTPHeaderFields(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("debug-http-status"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_allHTTPHeaderFields(v3, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("debug-communication-code"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_length(v10, v18, v19, v20) || objc_msgSend_length(v17, v21, v22, v23))
  {
    v24 = dispatch_queue_create("com.apple.ap.fake-response", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1CF274260;
    block[3] = &unk_1E8C48370;
    v28 = v10;
    v29 = v3;
    v30 = v17;
    dispatch_async(v24, block);

    v25 = 1;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (APHTTPSession)initWithSessionConfiguration:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APHTTPSession *v8;
  uint64_t v9;
  NSString *name;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSURLSession *session;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)APHTTPSession;
  v8 = -[APHTTPSession init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend__sourceApplicationBundleIdentifier(v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend_sessionWithConfiguration_(MEMORY[0x1E0CB39F0], v11, (uint64_t)v4, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    session = v8->_session;
    v8->_session = (NSURLSession *)v13;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (APHTTPSession)init
{

  return 0;
}

- (void)cancelTaskWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend_session(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1CF273F84;
  v12[3] = &unk_1E8C48320;
  v13 = v4;
  v9 = v4;
  objc_msgSend_getTasksWithCompletionHandler_(v8, v10, (uint64_t)v12, v11);

}

- (void)invalidateSessionAndCancelTasks:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  objc_msgSend_session(self, a2, a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v4)
    objc_msgSend_invalidateAndCancel(v5, v6, v7, v8);
  else
    objc_msgSend_finishTasksAndInvalidate(v5, v6, v7, v8);

}

- (id)GET:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  APHTTPRequest *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [APHTTPRequest alloc];
  v13 = (void *)objc_msgSend_initWithURL_HTTPMethod_HTTPHeaders_HTTPBody_serviceName_completionHandler_(v11, v12, (uint64_t)v10, 0, v9, 0, 0, v8);

  objc_msgSend_sendRequest_(self, v14, (uint64_t)v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)HEAD:(id)a3 headers:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  APHTTPRequest *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [APHTTPRequest alloc];
  v13 = (void *)objc_msgSend_initWithURL_HTTPMethod_HTTPHeaders_HTTPBody_serviceName_completionHandler_(v11, v12, (uint64_t)v10, 1, v9, 0, 0, v8);

  objc_msgSend_sendRequest_(self, v14, (uint64_t)v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

@end
