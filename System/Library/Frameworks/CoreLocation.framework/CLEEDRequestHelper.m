@implementation CLEEDRequestHelper

- (CLEEDRequestHelper)initWithDelegate:(id)a3 andQueue:(id)a4
{
  NSObject *v7;
  CLEEDRequestHelper *v8;
  CLEEDRequestHelper *v9;
  id v10;
  const char *v11;
  NSXPCConnection *v12;
  id Weak;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  NSXPCConnection *fConnection;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  void *v65;
  _QWORD v66[5];
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  id location;
  objc_super v72;
  int v73;
  const char *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  id v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v7 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v80 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
    v81 = 2114;
    v82 = (const char *)a3;
    v83 = 2114;
    v84 = a4;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[Delegate:%{public}@,Queue:%{public}@]", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v73 = 136446722;
    v74 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
    v75 = 2114;
    v76 = (const char *)a3;
    v77 = 2114;
    v78 = a4;
    v61 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper initWithDelegate:andQueue:]", "CoreLocation: %s\n", v61);
    if (v61 != (char *)buf)
      free(v61);
  }
  v72.receiver = self;
  v72.super_class = (Class)CLEEDRequestHelper;
  v8 = -[CLEEDRequestHelper init](&v72, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_helperDelegate, a3);
    objc_storeWeak((id *)&v9->_fClientQueue, a4);
    v10 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v12 = (NSXPCConnection *)objc_msgSend_initWithMachServiceName_options_(v10, v11, (uint64_t)CFSTR("com.apple.locationd.eedhelper"), 0);
    v9->_fConnection = v12;
    if (v12)
    {
      Weak = objc_loadWeak((id *)&v9->_fClientQueue);
      objc_msgSend__setQueue_(v12, v14, (uint64_t)Weak, v15);
      v18 = (void *)objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v16, (uint64_t)&unk_1EE18FEE8, v17);
      v65 = (void *)objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], v19, (uint64_t)&unk_1EE1786B0, v20);
      v21 = (void *)MEMORY[0x1E0C99E60];
      v22 = objc_opt_class();
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      v27 = objc_opt_class();
      v28 = objc_opt_class();
      v31 = objc_msgSend_setWithObjects_(v21, v29, v22, v30, v23, v24, v25, v26, v27, v28, 0);
      objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v18, v32, v31, (uint64_t)sel_fetchAllPendingRequestsWithCompletion_, 0, 1);
      objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v18, v33, v31, (uint64_t)sel_mediaUploadList_forRequestID_completion_, 0, 0);
      objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v18, v34, v31, (uint64_t)sel_fetchMitigationsWithCompletion_, 0, 1);
      objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v65, v35, v31, (uint64_t)sel_notifyMitigationNeeded_, 0, 0);
      objc_msgSend_setExportedInterface_(v9->_fConnection, v36, (uint64_t)v65, v37);
      objc_msgSend_setExportedObject_(v9->_fConnection, v38, (uint64_t)v9, v39);
      objc_msgSend_setRemoteObjectInterface_(v9->_fConnection, v40, (uint64_t)v18, v41);
      objc_initWeak(&location, v9);
      v42 = MEMORY[0x1E0C809B0];
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = sub_18F5F83A0;
      v69[3] = &unk_1E2991488;
      objc_copyWeak(&v70, &location);
      objc_msgSend_setInvalidationHandler_(v9->_fConnection, v43, (uint64_t)v69, v44);
      v67[0] = v42;
      v67[1] = 3221225472;
      v67[2] = sub_18F5F85A8;
      v67[3] = &unk_1E2991488;
      objc_copyWeak(&v68, &location);
      objc_msgSend_setInterruptionHandler_(v9->_fConnection, v45, (uint64_t)v67, v46);
      objc_msgSend_activate(v9->_fConnection, v47, v48, v49);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v50 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v80 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        _os_log_impl(&dword_18F5B3000, v50, OS_LOG_TYPE_INFO, "#EED2FWK,%{public}s, Finished setting-up connection parameters to EEDHelperService", buf, 0xCu);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v73 = 136446210;
        v74 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        v62 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper initWithDelegate:andQueue:]", "CoreLocation: %s\n", v62);
        if (v62 != (char *)buf)
          free(v62);
      }
      fConnection = v9->_fConnection;
      v66[0] = v42;
      v66[1] = 3221225472;
      v66[2] = sub_18F5F876C;
      v66[3] = &unk_1E29912B8;
      v66[4] = v9;
      v54 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(fConnection, v51, (uint64_t)v66, v52);
      objc_msgSend_connectToEEDHelper(v54, v55, v56, v57);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v58 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v80 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        _os_log_impl(&dword_18F5B3000, v58, OS_LOG_TYPE_INFO, "#EED2FWK,%{public}s, connected to EEDHelperService", buf, 0xCu);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v73 = 136446210;
        v74 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        v63 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper initWithDelegate:andQueue:]", "CoreLocation: %s\n", v63);
        if (v63 != (char *)buf)
          free(v63);
      }
      objc_destroyWeak(&v68);
      objc_destroyWeak(&v70);
      objc_destroyWeak(&location);
    }
    else
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v59 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v80 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        v81 = 2082;
        v82 = "com.apple.locationd.eedhelper";
        _os_log_impl(&dword_18F5B3000, v59, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, connection initialization failure to %{public}s", buf, 0x16u);
      }
      if (sub_18F5C4AE0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v73 = 136446466;
        v74 = "-[CLEEDRequestHelper initWithDelegate:andQueue:]";
        v75 = 2082;
        v76 = "com.apple.locationd.eedhelper";
        v64 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDRequestHelper initWithDelegate:andQueue:]", "CoreLocation: %s\n", v64);
        if (v64 != (char *)buf)
          free(v64);
      }

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_super v8;
  int v9;
  const char *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v3 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v12 = "-[CLEEDRequestHelper dealloc]";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v9 = 136446210;
    v10 = "-[CLEEDRequestHelper dealloc]";
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper dealloc]", "CoreLocation: %s\n", v7);
    if (v7 != (char *)buf)
      free(v7);
  }
  objc_msgSend_cleanup(self, v4, v5, v6);
  v8.receiver = self;
  v8.super_class = (Class)CLEEDRequestHelper;
  -[CLEEDRequestHelper dealloc](&v8, sel_dealloc);
}

- (void)cleanup
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_helperDelegate(self, a2, v2, v3))
    objc_msgSend_setHelperDelegate_(self, v5, 0, v7);
  if (objc_msgSend_fConnection(self, v5, v6, v7))
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v8 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v18 = "-[CLEEDRequestHelper cleanup]";
      _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper cleanup]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf)
        free(v16);
    }
    v12 = (void *)objc_msgSend_fConnection(self, v9, v10, v11);
    objc_msgSend_invalidate(v12, v13, v14, v15);
  }
}

- (void)handleInterruption
{
  NSObject *v3;
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
  char *v14;
  _QWORD v15[5];
  int v16;
  const char *v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v3 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v19 = "-[CLEEDRequestHelper handleInterruption]";
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v16 = 136446210;
    v17 = "-[CLEEDRequestHelper handleInterruption]";
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper handleInterruption]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  v7 = (void *)objc_msgSend_fConnection(self, v4, v5, v6);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18F5F8D54;
  v15[3] = &unk_1E29912B8;
  v15[4] = self;
  v10 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v15, v9);
  objc_msgSend_connectToEEDHelper(v10, v11, v12, v13);
}

- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v7 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v25 = "-[CLEEDRequestHelper handleRemoteProxyError:forProcessIdentifier:]";
    v26 = 1026;
    v27 = a4;
    v28 = 2114;
    v29 = objc_msgSend_localizedDescription(a3, v8, v9, v10);
    v30 = 2114;
    v31 = objc_msgSend_localizedFailureReason(a3, v11, v12, v13);
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s[pid:%{public}d]: %{public}@ %{public}@\n", buf, 0x26u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    objc_msgSend_localizedDescription(a3, v17, v18, v19);
    objc_msgSend_localizedFailureReason(a3, v20, v21, v22);
    v23 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLEEDRequestHelper handleRemoteProxyError:forProcessIdentifier:]", "CoreLocation: %s\n", v23);
    if (v23 != (char *)buf)
      free(v23);
  }
  objc_msgSend_cleanup(self, v14, v15, v16);
}

- (void)notifyHelperInvalidation
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  CLEEDRequestHelper *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_helperDelegate(self, a2, v2, v3))
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v5 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v23 = "-[CLEEDRequestHelper notifyHelperInvalidation]";
      v24 = 2114;
      v25 = self;
      v26 = 2114;
      v27 = objc_msgSend_helperDelegate(self, v6, v7, v8);
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s [self:%{public}@, helperDelegate:%{public}@]", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      objc_msgSend_helperDelegate(self, v18, v19, v20);
      v21 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper notifyHelperInvalidation]", "CoreLocation: %s\n", v21);
      if (v21 != (char *)buf)
        free(v21);
    }
    v12 = (void *)objc_msgSend_helperDelegate(self, v9, v10, v11);
    objc_msgSend_notifyHelperInvalidation(v12, v13, v14, v15);
    objc_msgSend_setHelperDelegate_(self, v16, 0, v17);
  }
}

- (void)notifyNewRequestAvailable
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  CLEEDRequestHelper *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_helperDelegate(self, a2, v2, v3))
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v5 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v21 = "-[CLEEDRequestHelper notifyNewRequestAvailable]";
      v22 = 2114;
      v23 = self;
      v24 = 2114;
      v25 = objc_msgSend_helperDelegate(self, v6, v7, v8);
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s [self:%{public}@, helperDelegate:%{public}@]", buf, 0x20u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      objc_msgSend_helperDelegate(self, v16, v17, v18);
      v19 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper notifyNewRequestAvailable]", "CoreLocation: %s\n", v19);
      if (v19 != (char *)buf)
        free(v19);
    }
    v12 = (void *)objc_msgSend_helperDelegate(self, v9, v10, v11);
    objc_msgSend_notifyNewRequestAvailable(v12, v13, v14, v15);
  }
}

- (void)notifyMitigationNeeded:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  CLEEDRequestHelper *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_helperDelegate(self, a2, (uint64_t)a3, v3))
  {
    objc_msgSend_helperDelegate(self, v6, v7, v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v9 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v24 = "-[CLEEDRequestHelper notifyMitigationNeeded:]";
        v25 = 2114;
        v26 = self;
        v27 = 2114;
        v28 = objc_msgSend_helperDelegate(self, v10, v11, v12);
        v29 = 2114;
        v30 = a3;
        _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s [self:%{public}@, helperDelegate:%{public}@, mitigation:%{public}@]", buf, 0x2Au);
      }
      if (sub_18F5C4AE0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        objc_msgSend_helperDelegate(self, v19, v20, v21);
        v22 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper notifyMitigationNeeded:]", "CoreLocation: %s\n", v22);
        if (v22 != (char *)buf)
          free(v22);
      }
      v16 = (void *)objc_msgSend_helperDelegate(self, v13, v14, v15);
      objc_msgSend_notifyMitigationNeeded_(v16, v17, (uint64_t)a3, v18);
    }
  }
}

- (void)fetchAllPendingRequestsWithCompletion:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  char *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  uint64_t v27;
  const __CFString *v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v34 = "-[CLEEDRequestHelper fetchAllPendingRequestsWithCompletion:]";
    v35 = 2114;
    v36 = a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[completion:%{public}@]", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v29 = 136446466;
    v30 = "-[CLEEDRequestHelper fetchAllPendingRequestsWithCompletion:]";
    v31 = 2114;
    v32 = a3;
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper fetchAllPendingRequestsWithCompletion:]", "CoreLocation: %s\n", v24);
    if (v24 != (char *)buf)
      free(v24);
  }
  if (objc_msgSend_fConnection(self, v6, v7, v8))
  {
    v12 = (void *)objc_msgSend_fConnection(self, v9, v10, v11);
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18F5F98CC;
    v26[3] = &unk_1E29914B0;
    v26[4] = self;
    v26[5] = a3;
    v16 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v26, v15);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_18F5F9924;
    v25[3] = &unk_1E29914D8;
    v25[4] = self;
    v25[5] = a3;
    objc_msgSend_fetchAllPendingRequestsWithCompletion_(v16, v17, (uint64_t)v25, v18);
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Connection reset, caller needs to re-initialize");
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v28, (uint64_t)&v27, 1);
    v23 = objc_msgSend_initWithDomain_code_userInfo_(v19, v22, (uint64_t)CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 8, v21);
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v23);
  }
}

- (void)fetchCurrentMediaUploadRequestWithCompletion:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  char *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  uint64_t v27;
  const __CFString *v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v34 = "-[CLEEDRequestHelper fetchCurrentMediaUploadRequestWithCompletion:]";
    v35 = 2114;
    v36 = a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[completion:%{public}@]", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v29 = 136446466;
    v30 = "-[CLEEDRequestHelper fetchCurrentMediaUploadRequestWithCompletion:]";
    v31 = 2114;
    v32 = a3;
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper fetchCurrentMediaUploadRequestWithCompletion:]", "CoreLocation: %s\n", v24);
    if (v24 != (char *)buf)
      free(v24);
  }
  if (objc_msgSend_fConnection(self, v6, v7, v8))
  {
    v12 = (void *)objc_msgSend_fConnection(self, v9, v10, v11);
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18F5F9DF0;
    v26[3] = &unk_1E29914B0;
    v26[4] = self;
    v26[5] = a3;
    v16 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v26, v15);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_18F5F9E48;
    v25[3] = &unk_1E2991500;
    v25[4] = self;
    v25[5] = a3;
    objc_msgSend_fetchCurrentMediaUploadRequestWithCompletion_(v16, v17, (uint64_t)v25, v18);
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Connection reset, caller needs to re-initialize");
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v28, (uint64_t)&v27, 1);
    v23 = objc_msgSend_initWithDomain_code_userInfo_(v19, v22, (uint64_t)CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 8, v21);
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v23);
  }
}

- (void)fetchCurrentStreamingRequestWithCompletion:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  char *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  uint64_t v27;
  const __CFString *v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v34 = "-[CLEEDRequestHelper fetchCurrentStreamingRequestWithCompletion:]";
    v35 = 2114;
    v36 = a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[completion:%{public}@]", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v29 = 136446466;
    v30 = "-[CLEEDRequestHelper fetchCurrentStreamingRequestWithCompletion:]";
    v31 = 2114;
    v32 = a3;
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper fetchCurrentStreamingRequestWithCompletion:]", "CoreLocation: %s\n", v24);
    if (v24 != (char *)buf)
      free(v24);
  }
  if (objc_msgSend_fConnection(self, v6, v7, v8))
  {
    v12 = (void *)objc_msgSend_fConnection(self, v9, v10, v11);
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18F5FA31C;
    v26[3] = &unk_1E29914B0;
    v26[4] = self;
    v26[5] = a3;
    v16 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v26, v15);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_18F5FA374;
    v25[3] = &unk_1E2991528;
    v25[4] = self;
    v25[5] = a3;
    objc_msgSend_fetchCurrentStreamingRequestWithCompletion_(v16, v17, (uint64_t)v25, v18);
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Connection reset, caller needs to re-initialize");
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v28, (uint64_t)&v27, 1);
    v23 = objc_msgSend_initWithDomain_code_userInfo_(v19, v22, (uint64_t)CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 8, v21);
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v23);
  }
}

- (void)fetchMitigationsWithCompletion:(id)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  char *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  uint64_t v27;
  const __CFString *v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v34 = "-[CLEEDRequestHelper fetchMitigationsWithCompletion:]";
    v35 = 2114;
    v36 = a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[completion:%{public}@]", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v29 = 136446466;
    v30 = "-[CLEEDRequestHelper fetchMitigationsWithCompletion:]";
    v31 = 2114;
    v32 = a3;
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper fetchMitigationsWithCompletion:]", "CoreLocation: %s\n", v24);
    if (v24 != (char *)buf)
      free(v24);
  }
  if (objc_msgSend_fConnection(self, v6, v7, v8))
  {
    v12 = (void *)objc_msgSend_fConnection(self, v9, v10, v11);
    v13 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_18F5FA840;
    v26[3] = &unk_1E29914B0;
    v26[4] = self;
    v26[5] = a3;
    v16 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v14, (uint64_t)v26, v15);
    v25[0] = v13;
    v25[1] = 3221225472;
    v25[2] = sub_18F5FA898;
    v25[3] = &unk_1E2991550;
    v25[4] = self;
    v25[5] = a3;
    objc_msgSend_fetchMitigationsWithCompletion_(v16, v17, (uint64_t)v25, v18);
  }
  else
  {
    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v27 = *MEMORY[0x1E0CB2D50];
    v28 = CFSTR("Connection reset, caller needs to re-initialize");
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v28, (uint64_t)&v27, 1);
    v23 = objc_msgSend_initWithDomain_code_userInfo_(v19, v22, (uint64_t)CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 8, v21);
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, v23);
  }
}

- (void)mediaUploadList:(id)a3 forRequestID:(id)a4 completion:(id)a5
{
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  char *v27;
  _QWORD v28[6];
  _QWORD v29[6];
  uint64_t v30;
  const __CFString *v31;
  int v32;
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v9 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v41 = "-[CLEEDRequestHelper mediaUploadList:forRequestID:completion:]";
    v42 = 2114;
    v43 = a3;
    v44 = 2114;
    v45 = a4;
    v46 = 2114;
    v47 = a5;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[mediaUploadList:%{public}@,requestID:%{public}@,completion:%{public}@]", buf, 0x2Au);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v32 = 136446978;
    v33 = "-[CLEEDRequestHelper mediaUploadList:forRequestID:completion:]";
    v34 = 2114;
    v35 = a3;
    v36 = 2114;
    v37 = a4;
    v38 = 2114;
    v39 = a5;
    v27 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper mediaUploadList:forRequestID:completion:]", "CoreLocation: %s\n", v27);
    if (v27 != (char *)buf)
      free(v27);
  }
  if (objc_msgSend_fConnection(self, v10, v11, v12))
  {
    v16 = (void *)objc_msgSend_fConnection(self, v13, v14, v15);
    v17 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_18F5FAD98;
    v29[3] = &unk_1E29914B0;
    v29[4] = self;
    v29[5] = a5;
    v20 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v16, v18, (uint64_t)v29, v19);
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = sub_18F5FADEC;
    v28[3] = &unk_1E29914B0;
    v28[4] = self;
    v28[5] = a5;
    objc_msgSend_mediaUploadList_forRequestID_completion_(v20, v21, (uint64_t)a3, (uint64_t)a4, v28);
  }
  else
  {
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Connection reset, caller needs to re-initialize");
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)&v31, (uint64_t)&v30, 1);
    v26 = objc_msgSend_initWithDomain_code_userInfo_(v22, v25, (uint64_t)CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 8, v24);
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v26);
  }
}

- (void)streamingSessionEndedForRequestID:(id)a3 completion:(id)a4
{
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  char *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  uint64_t v28;
  const __CFString *v29;
  int v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v7 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v37 = "-[CLEEDRequestHelper streamingSessionEndedForRequestID:completion:]";
    v38 = 2114;
    v39 = a3;
    v40 = 2114;
    v41 = a4;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[request:%{public}@,completion:%{public}@]", buf, 0x20u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v30 = 136446722;
    v31 = "-[CLEEDRequestHelper streamingSessionEndedForRequestID:completion:]";
    v32 = 2114;
    v33 = a3;
    v34 = 2114;
    v35 = a4;
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper streamingSessionEndedForRequestID:completion:]", "CoreLocation: %s\n", v25);
    if (v25 != (char *)buf)
      free(v25);
  }
  if (objc_msgSend_fConnection(self, v8, v9, v10))
  {
    v14 = (void *)objc_msgSend_fConnection(self, v11, v12, v13);
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_18F5FB2AC;
    v27[3] = &unk_1E29914B0;
    v27[4] = self;
    v27[5] = a4;
    v18 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v14, v16, (uint64_t)v27, v17);
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = sub_18F5FB300;
    v26[3] = &unk_1E29914B0;
    v26[4] = self;
    v26[5] = a4;
    objc_msgSend_streamingSessionEndedForRequestID_completion_(v18, v19, (uint64_t)a3, (uint64_t)v26);
  }
  else
  {
    v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v28 = *MEMORY[0x1E0CB2D50];
    v29 = CFSTR("Connection reset, caller needs to re-initialize");
    v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v29, (uint64_t)&v28, 1);
    v24 = objc_msgSend_initWithDomain_code_userInfo_(v20, v23, (uint64_t)CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 8, v22);
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v24);
  }
}

- (void)handleResponse:(BOOL)a3 forRequest:(id)a4 completion:(id)a5
{
  _BOOL8 v7;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  char *v27;
  _QWORD v28[6];
  _QWORD v29[6];
  uint64_t v30;
  const __CFString *v31;
  int v32;
  const char *v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v7 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v9 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v41 = "-[CLEEDRequestHelper handleResponse:forRequest:completion:]";
    v42 = 1026;
    v43 = v7;
    v44 = 2114;
    v45 = a4;
    v46 = 2114;
    v47 = a5;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[response:%{public}u,ID:%{public}@,completion:%{public}@]", buf, 0x26u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v32 = 136446978;
    v33 = "-[CLEEDRequestHelper handleResponse:forRequest:completion:]";
    v34 = 1026;
    v35 = v7;
    v36 = 2114;
    v37 = a4;
    v38 = 2114;
    v39 = a5;
    v27 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLEEDRequestHelper handleResponse:forRequest:completion:]", "CoreLocation: %s\n", v27);
    if (v27 != (char *)buf)
      free(v27);
  }
  if (objc_msgSend_fConnection(self, v10, v11, v12))
  {
    v16 = (void *)objc_msgSend_fConnection(self, v13, v14, v15);
    v17 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_18F5FB7F4;
    v29[3] = &unk_1E29914B0;
    v29[4] = self;
    v29[5] = a5;
    v20 = (void *)objc_msgSend_remoteObjectProxyWithErrorHandler_(v16, v18, (uint64_t)v29, v19);
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = sub_18F5FB84C;
    v28[3] = &unk_1E2991578;
    v28[4] = self;
    v28[5] = a5;
    objc_msgSend_handleResponse_forRequest_completion_(v20, v21, v7, (uint64_t)a4, v28);
  }
  else
  {
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Connection reset, caller needs to re-initialize");
    v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)&v31, (uint64_t)&v30, 1);
    v26 = objc_msgSend_initWithDomain_code_userInfo_(v22, v25, (uint64_t)CFSTR("com.apple.CoreLocation.CLEEDHelperService"), 8, v24);
    (*((void (**)(id, _QWORD, uint64_t))a5 + 2))(a5, 0, v26);
  }
}

+ (int64_t)validateServerCertificateChallenge:(id)a3
{
  void *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __SecTrust *v23;
  const __CFArray *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFArray *v28;
  uint64_t Object;
  NSObject *v30;
  char *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  NSObject *v42;
  NSObject *v43;
  char *v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  Boolean v57;
  CFErrorRef error;
  int v59;
  const char *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  const __CFArray *v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  const __CFArray *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1940032C4](a1, a2);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v5 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    v66 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
    v67 = 2113;
    v68 = (uint64_t)a3;
    _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, Challenge:%{private}@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
    v59 = 136446467;
    v60 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
    v61 = 2113;
    v62 = (uint64_t)a3;
    v49 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v49);
    if (v49 != (char *)buf)
      free(v49);
  }
  v9 = (void *)objc_msgSend_protectionSpace(a3, v6, v7, v8);
  v13 = (void *)objc_msgSend_authenticationMethod(v9, v10, v11, v12);
  if ((objc_msgSend_isEqualToString_(v13, v14, *MEMORY[0x1E0CB32C8], v15) & 1) != 0)
  {
    error = 0;
    v19 = (void *)objc_msgSend_protectionSpace(a3, v16, v17, v18);
    v23 = (__SecTrust *)objc_msgSend_serverTrust(v19, v20, v21, v22);
    if (SecTrustEvaluateWithError(v23, &error))
    {
      v24 = SecTrustCopyCertificateChain(v23);
      if (v24)
      {
        v28 = v24;
        Object = objc_msgSend_lastObject(v24, v25, v26, v27);
        SecTrustStoreForDomain();
        if (SecTrustStoreContains())
        {
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v30 = qword_1EE172098;
          if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v66 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
            _os_log_impl(&dword_18F5B3000, v30, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, Root is system trusted, proceed with default handling", buf, 0xCu);
          }
          if (!sub_18F5C4AE0(115, 2))
            goto LABEL_24;
          bzero(buf, 0x65CuLL);
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v59 = 136446210;
          v60 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
          v31 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v31);
          if (v31 == (char *)buf)
            goto LABEL_24;
          goto LABEL_68;
        }
        v57 = 0;
        v45 = sub_18F5F56D4(CFSTR("EEDOverrideServerChallenge"), CFSTR("com.apple.locationd"), &v57);
        if (v57 && v45)
        {
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v46 = qword_1EE172098;
          if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446723;
            v66 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
            v67 = 2113;
            v68 = Object;
            v69 = 2113;
            v70 = v28;
            _os_log_impl(&dword_18F5B3000, v46, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, Root:%{private}@ is not system trusted, but EEDOverrideServerChallenge set, overriding. Chain:%{private}@", buf, 0x20u);
          }
          if (!sub_18F5C4AE0(115, 2))
            goto LABEL_24;
          bzero(buf, 0x65CuLL);
          if (qword_1EE1720A0 != -1)
            dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
          v59 = 136446723;
          v60 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
          v61 = 2113;
          v62 = Object;
          v63 = 2113;
          v64 = v28;
          v31 = (char *)_os_log_send_and_compose_impl();
          sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v31);
          if (v31 == (char *)buf)
            goto LABEL_24;
          goto LABEL_68;
        }
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v47 = qword_1EE172098;
        if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446723;
          v66 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
          v67 = 2113;
          v68 = Object;
          v69 = 2113;
          v70 = v28;
          _os_log_impl(&dword_18F5B3000, v47, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, Root:%{private}@ is not system trusted, not contained in SecurityTrustStore with system domain. Chain:%{private}@", buf, 0x20u);
        }
        if (!sub_18F5C4AE0(115, 0))
          goto LABEL_59;
        bzero(buf, 0x65CuLL);
        if (qword_1EE1720A0 != -1)
          dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
        v59 = 136446723;
        v60 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
        v61 = 2113;
        v62 = Object;
        v63 = 2113;
        v64 = v28;
        v44 = (char *)_os_log_send_and_compose_impl();
        sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v44);
        if (v44 == (char *)buf)
        {
LABEL_59:
          v41 = 2;
          goto LABEL_60;
        }
LABEL_42:
        free(v44);
        goto LABEL_59;
      }
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v43 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v66 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
        _os_log_impl(&dword_18F5B3000, v43, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, SecTrustCopyCertificateChain failed", buf, 0xCu);
      }
      if (!sub_18F5C4AE0(115, 0))
        goto LABEL_59;
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v59 = 136446210;
      v60 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
    }
    else
    {
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v42 = qword_1EE172098;
      if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v66 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
        v67 = 2114;
        v68 = (uint64_t)error;
        _os_log_impl(&dword_18F5B3000, v42, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, SecTrustEvaluateWithError returned error:%{public}@", buf, 0x16u);
      }
      if (!sub_18F5C4AE0(115, 0))
        goto LABEL_59;
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
      v59 = 136446466;
      v60 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
      v61 = 2114;
      v62 = (uint64_t)error;
    }
    v44 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v44);
    if (v44 == (char *)buf)
      goto LABEL_59;
    goto LABEL_42;
  }
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v32 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_INFO))
  {
    v36 = (void *)objc_msgSend_protectionSpace(a3, v33, v34, v35);
    v40 = objc_msgSend_authenticationMethod(v36, v37, v38, v39);
    *(_DWORD *)buf = 136446466;
    v66 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
    v67 = 2114;
    v68 = v40;
    _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_INFO, "#EED2FWK,%{public}s, Unsupported authenticationMethod:%{public}@, proceed with default handling", buf, 0x16u);
  }
  if (!sub_18F5C4AE0(115, 2))
    goto LABEL_24;
  bzero(buf, 0x65CuLL);
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990210);
  v53 = (void *)objc_msgSend_protectionSpace(a3, v50, v51, v52);
  v59 = 136446466;
  v60 = "+[CLEEDRequestHelper validateServerCertificateChallenge:]";
  v61 = 2114;
  v62 = objc_msgSend_authenticationMethod(v53, v54, v55, v56);
  v31 = (char *)_os_log_send_and_compose_impl();
  sub_18F5F2740("Generic", 1, 0, 2, "+[CLEEDRequestHelper validateServerCertificateChallenge:]", "CoreLocation: %s\n", v31);
  if (v31 == (char *)buf)
    goto LABEL_24;
LABEL_68:
  free(v31);
LABEL_24:
  v41 = 1;
LABEL_60:
  objc_autoreleasePoolPop(v4);
  return v41;
}

- (CLEEDRequestDelegate)helperDelegate
{
  return (CLEEDRequestDelegate *)objc_loadWeak((id *)&self->_helperDelegate);
}

- (void)setHelperDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_helperDelegate, a3);
}

- (NSXPCConnection)fConnection
{
  return self->_fConnection;
}

- (void)setFConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)fClientQueue
{
  return (OS_dispatch_queue *)objc_loadWeak((id *)&self->_fClientQueue);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fClientQueue);
  objc_destroyWeak((id *)&self->_helperDelegate);
}

@end
