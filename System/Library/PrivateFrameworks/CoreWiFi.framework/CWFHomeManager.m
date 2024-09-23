@implementation CWFHomeManager

+ (id)cwfHomeManagerWithDelegate:(id)a3
{
  id v3;
  CWFHomeManager *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = [CWFHomeManager alloc];
  v8 = (void *)objc_msgSend_initWithDelegate_(v4, v5, (uint64_t)v3, v6, v7);

  return v8;
}

- (BOOL)initHomeManagerInstance
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  objc_class *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v69;
  id v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE v77[24];
  void *v78;
  uint64_t *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  sub_1B06EF078();
  if (!objc_opt_class())
  {
    CWFGetOSLog();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      CWFGetOSLog();
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = MEMORY[0x1E0C81028];
      v70 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v77 = 136446722;
      *(_QWORD *)&v77[4] = "-[CWFHomeManager initHomeManagerInstance]";
      *(_WORD *)&v77[12] = 2082;
      *(_QWORD *)&v77[14] = "CWFHomeManager.m";
      *(_WORD *)&v77[22] = 1024;
      LODWORD(v78) = 90;
      _os_log_send_and_compose_impl();
    }
    v8 = 0;
    goto LABEL_11;
  }
  objc_msgSend__homeManager(self, v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v9 = (void *)qword_1ECFD6B08;
    v76 = qword_1ECFD6B08;
    if (!qword_1ECFD6B08)
    {
      *(_QWORD *)v77 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v77[8] = 3221225472;
      *(_QWORD *)&v77[16] = sub_1B06F0BB8;
      v78 = &unk_1E61329A8;
      v79 = &v73;
      sub_1B06F0BB8((uint64_t)v77);
      v9 = (void *)v74[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v73, 8);
    v11 = [v10 alloc];
    objc_msgSend_bundleWithPath_(MEMORY[0x1E0CB34D0], v12, (uint64_t)CFSTR("/System/Library/PrivateFrameworks/MobileWiFi.framework"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend_initWithBundle_(v11, v16, (uint64_t)v15, v17, v18);
    objc_msgSend_set_homeLocationAuthorization_(self, v20, (uint64_t)v19, v21, v22);

    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v23 = (void *)qword_1ECFD6B10;
    v76 = qword_1ECFD6B10;
    if (!qword_1ECFD6B10)
    {
      *(_QWORD *)v77 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v77[8] = 3221225472;
      *(_QWORD *)&v77[16] = sub_1B06F0C70;
      v78 = &unk_1E61329A8;
      v79 = &v73;
      sub_1B06F0C70((uint64_t)v77);
      v23 = (void *)v74[3];
    }
    v24 = objc_retainAutorelease(v23);
    _Block_object_dispose(&v73, 8);
    objc_msgSend_defaultPrivateConfiguration(v24, v25, v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_setOptions_(v29, v30, 576, v31, v32);
    objc_msgSend_setAdaptive_(v29, v33, 1, v34, v35);
    objc_msgSend__homeLocationAuthorization(self, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setLocationAuthorization_(v29, v41, (uint64_t)v40, v42, v43);

    objc_msgSend_setCachePolicy_(v29, v44, 0, v45, v46);
    v47 = objc_alloc((Class)sub_1B06EF078());
    v51 = (void *)objc_msgSend_initWithHomeMangerConfiguration_(v47, v48, (uint64_t)v29, v49, v50);
    objc_msgSend_set_homeManager_(self, v52, (uint64_t)v51, v53, v54);

    objc_msgSend__homeManager(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v59 != 0;

    if (v8)
    {
      objc_msgSend__homeManager(self, v60, v61, v62, v63);
      v64 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDelegate_(v64, v65, (uint64_t)self, v66, v67);
    }
    else
    {
      CWFGetOSLog();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
      {
        CWFGetOSLog();
        v64 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v64 = MEMORY[0x1E0C81028];
        v72 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v77 = 136446722;
        *(_QWORD *)&v77[4] = "-[CWFHomeManager initHomeManagerInstance]";
        *(_WORD *)&v77[12] = 2082;
        *(_QWORD *)&v77[14] = "CWFHomeManager.m";
        *(_WORD *)&v77[22] = 1024;
        LODWORD(v78) = 103;
        _os_log_send_and_compose_impl();
      }
    }

LABEL_11:
    return v8;
  }
  return 0;
}

- (CWFHomeManager)initWithDelegate:(id)a3
{
  id v4;
  CWFHomeManager *v5;
  dispatch_queue_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  id v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v70;
  void *v71;
  id v72;
  id v73;
  int *v74;
  int v75;
  objc_super v76;
  int v77;
  const char *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)CWFHomeManager;
  v5 = -[CWFHomeManager init](&v76, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.wifi.CWFHomeManager", 0);
    objc_msgSend_set_serviceQueue_(v5, v7, (uint64_t)v6, v8, v9);

    objc_msgSend_set_isHomeInformationAvailable_(v5, v10, 0, v11, v12);
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set_serviceObjects_(v5, v18, (uint64_t)v17, v19, v20);

    objc_msgSend_set_autoDataColletor_(v5, v21, 0, v22, v23);
    objc_msgSend_set_delegate_(v5, v24, (uint64_t)v4, v25, v26);
    objc_msgSend__delegate(v5, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend__delegate(v5, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getServiceEvents(v5, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_startMonitoringSupportedEvents_(v36, v42, (uint64_t)v41, v43, v44);
      v45 = objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_code(v45, v46, v47, v48, v49))
      {
        CWFGetOSLog();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          CWFGetOSLog();
          v55 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = MEMORY[0x1E0C81028];
          v56 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v77 = 136446722;
          v78 = "-[CWFHomeManager initWithDelegate:]";
          v79 = 2082;
          v80 = "CWFHomeManager.m";
          v81 = 1024;
          v82 = 131;
          v75 = 28;
          v74 = &v77;
          _os_log_send_and_compose_impl();
        }

      }
      if ((objc_msgSend_initHomeManagerInstance(v5, v50, v51, v52, v53, v74, v75) & 1) != 0)
      {
        objc_msgSend__homeManager(v5, v57, v58, v59, v60);
        v61 = objc_claimAutoreleasedReturnValue();
        objc_msgSend__beginActiveAssertionWithReason_(v61, v62, (uint64_t)CFSTR("com.apple.wifi.HMNotificationAssertion"), v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_set_activeAssertion_(v5, v66, (uint64_t)v65, v67, v68);

      }
      else
      {

        CWFGetOSLog();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71)
        {
          CWFGetOSLog();
          v61 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v61 = MEMORY[0x1E0C81028];
          v73 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v77 = 136446722;
          v78 = "-[CWFHomeManager initWithDelegate:]";
          v79 = 2082;
          v80 = "CWFHomeManager.m";
          v81 = 1024;
          v82 = 136;
          _os_log_send_and_compose_impl();
        }
        v5 = 0;
      }

    }
    else
    {
      CWFGetOSLog();
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        CWFGetOSLog();
        v45 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = MEMORY[0x1E0C81028];
        v72 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v77) = 0;
        _os_log_send_and_compose_impl();
      }
    }

  }
  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  objc_super v21;

  objc_msgSend__delegate(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend__delegate(self, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_getServiceEvents(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend_stopMonitoringSupportedEvents_(v11, v17, (uint64_t)v16, v18, v19);

  }
  v21.receiver = self;
  v21.super_class = (Class)CWFHomeManager;
  -[CWFHomeManager dealloc](&v21, sel_dealloc);
}

- (void)removeObjectForServieType:(int64_t)a3 withUUID:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v21;
  id v22;

  v6 = a4;
  objc_msgSend__serviceObjects(self, v7, v8, v9, v10);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v22, v11, (uint64_t)v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_getServiceTypeStringFor_(self, v15, a3, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v14, v19, (uint64_t)v18, v20, v21);

}

- (int)createServiceObjectFor:(int64_t)a3 withParams:(id)a4 andAccessory:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  int v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSObject *v58;
  void *v60;
  id v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD block[4];
  NSObject *v67;
  id v68;
  CWFHomeManager *v69;
  uint64_t v70;
  int v71;
  const char *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a3 == 1)
  {
    v9 = a4;
    objc_msgSend__delegate(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createCWFSensingHMADataCollectorFor_withOptions_andDelegate_(CWFSensingHMADataCollector, v15, (uint64_t)v8, (uint64_t)v9, (uint64_t)v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend__serviceQueue(self, v17, v18, v19, v20);
      v21 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B06EF9A0;
      block[3] = &unk_1E6133D40;
      v22 = v16;
      v67 = v22;
      v23 = v8;
      v68 = v23;
      v69 = self;
      v70 = 1;
      dispatch_async(v21, block);

      objc_msgSend__serviceObjects(self, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIdentifier(v23, v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v28, v34, (uint64_t)v33, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getServiceTypeStringFor_(self, v38, 1, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v37, v42, (uint64_t)v22, (uint64_t)v41, v43);

      CWFGetOSLog();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        CWFGetOSLog();
        v45 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = MEMORY[0x1E0C81028];
        v47 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_uniqueIdentifier(v23, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__serviceObjects(self, v53, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 136447234;
        v72 = "-[CWFHomeManager createServiceObjectFor:withParams:andAccessory:]";
        v73 = 2082;
        v74 = "CWFHomeManager.m";
        v75 = 1024;
        v76 = 178;
        v77 = 2114;
        v78 = v52;
        v79 = 2114;
        v80 = v57;
        _os_log_send_and_compose_impl();

      }
      v46 = 0;
      v58 = v67;
    }
    else
    {
      CWFGetOSLog();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        CWFGetOSLog();
        v58 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v58 = MEMORY[0x1E0C81028];
        v61 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_uniqueIdentifier(v8, v62, v63, v64, v65);
        v71 = 136446978;
        v72 = "-[CWFHomeManager createServiceObjectFor:withParams:andAccessory:]";
        v73 = 2082;
        v74 = "CWFHomeManager.m";
        v75 = 1024;
        v76 = 165;
        v77 = 2114;
        v78 = (id)objc_claimAutoreleasedReturnValue();
        _os_log_send_and_compose_impl();

      }
      v46 = -3931;
    }

  }
  else
  {
    v46 = -3900;
  }

  return v46;
}

- (id)getServiceTypeStringFor:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 != 1)
    return 0;
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("CWFSensingDataCollect"), v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getServiceEvents
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v11[5];

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B06EFC60;
  v11[3] = &unk_1E6135588;
  v11[4] = self;
  v7 = (void *)MEMORY[0x1B5E0A4F8](v11);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v8, (uint64_t)v7, (uint64_t)CFSTR("CWFPerformSensingDataCollect"), v9);

  return v6;
}

- (int)registerForAccessoryStateChange:(id)a3 withParams:(id)a4 forCWFHMServiceType:(int64_t)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  int isEqual;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  int ServiceObjectFor_withParams_andAccessory;
  void *v93;
  NSObject *v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  int v108;
  void *v109;
  NSObject *v110;
  id v111;
  id v113;
  id v114;
  NSObject *obj;
  id v116;
  int64_t v117;
  int v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  int v130;
  const char *v131;
  __int16 v132;
  const char *v133;
  __int16 v134;
  int v135;
  __int16 v136;
  int v137;
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v119 = a4;
  objc_msgSend__homeManager(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    CWFGetOSLog();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      CWFGetOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v105 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      goto LABEL_67;
    v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    v132 = 2082;
    v133 = "CWFHomeManager.m";
    v134 = 1024;
    v135 = 225;
LABEL_66:
    _os_log_send_and_compose_impl();
    goto LABEL_67;
  }
  objc_msgSend__delegate(self, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    CWFGetOSLog();
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      CWFGetOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v106 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      goto LABEL_67;
    v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    v132 = 2082;
    v133 = "CWFHomeManager.m";
    v134 = 1024;
    v135 = 230;
    goto LABEL_66;
  }
  if ((objc_msgSend__isHomeInformationAvailable(self, v19, v20, v21, v22) & 1) == 0)
  {
    CWFGetOSLog();
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v101)
    {
      CWFGetOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v107 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      goto LABEL_67;
    v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    v132 = 2082;
    v133 = "CWFHomeManager.m";
    v134 = 1024;
    v135 = 235;
    goto LABEL_66;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    CWFGetOSLog();
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      CWFGetOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v104 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    v132 = 2082;
    v133 = "CWFHomeManager.m";
    v134 = 1024;
    v135 = 240;
    goto LABEL_81;
  }
  if (!v119)
  {
    CWFGetOSLog();
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102)
    {
      CWFGetOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v113 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    v132 = 2082;
    v133 = "CWFHomeManager.m";
    v134 = 1024;
    v135 = 245;
    goto LABEL_81;
  }
  if (a5 >= 2)
  {
    CWFGetOSLog();
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103)
    {
      CWFGetOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v114 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    v130 = 136446722;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    v132 = 2082;
    v133 = "CWFHomeManager.m";
    v134 = 1024;
    v135 = 250;
LABEL_81:
    _os_log_send_and_compose_impl();
LABEL_82:
    v108 = -3900;
    goto LABEL_68;
  }
  v117 = a5;
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  objc_msgSend__homeManager(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_homes(v27, v28, v29, v30, v31);
  v32 = objc_claimAutoreleasedReturnValue();

  v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v126, (uint64_t)v139, 16);
  if (!v121)
  {
LABEL_67:
    v108 = -3931;
LABEL_68:
    v118 = v108;
    goto LABEL_69;
  }
  v120 = *(_QWORD *)v127;
  v118 = -3931;
  obj = v32;
  v116 = v8;
  do
  {
    for (i = 0; i != v121; ++i)
    {
      if (*(_QWORD *)v127 != v120)
        objc_enumerationMutation(obj);
      v39 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      objc_msgSend_accessories(v39, v34, v35, v36, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v122, (uint64_t)v138, 16);
      if (!v42)
        goto LABEL_27;
      v47 = v42;
      v48 = *(_QWORD *)v123;
      while (2)
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v123 != v48)
            objc_enumerationMutation(v40);
          v50 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * j);
          objc_msgSend_uniqueIdentifier(v50, v43, v44, v45, v46);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v8, v52, (uint64_t)v51, v53, v54);

          if (isEqual)
          {
            objc_msgSend__serviceObjects(self, v43, v44, v45, v46);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v56, v57, (uint64_t)v8, v58, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v60)
            {
              objc_msgSend__serviceObjects(self, v61, v62, v63, v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v66, v67, v68, v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKey_(v65, v71, (uint64_t)v70, (uint64_t)v8, v72);

            }
            objc_msgSend__serviceObjects(self, v61, v62, v63, v64);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_uniqueIdentifier(v50, v74, v75, v76, v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v73, v79, (uint64_t)v78, v80, v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_getServiceTypeStringFor_(self, v83, v117, v84, v85);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(v82, v87, (uint64_t)v86, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            if (v90)
            {
              CWFGetOSLog();
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              if (v93)
              {
                CWFGetOSLog();
                v94 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v94 = MEMORY[0x1E0C81028];
                v96 = MEMORY[0x1E0C81028];
              }
              v32 = obj;
              v8 = v116;

              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
              {
                v130 = 136446722;
                v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
                v132 = 2082;
                v133 = "CWFHomeManager.m";
                v134 = 1024;
                v135 = 261;
                goto LABEL_40;
              }
            }
            else
            {
              ServiceObjectFor_withParams_andAccessory = objc_msgSend_createServiceObjectFor_withParams_andAccessory_(self, v91, v117, (uint64_t)v119, (uint64_t)v50);
              if (!ServiceObjectFor_withParams_andAccessory)
              {
                v118 = 0;
                v8 = v116;
                goto LABEL_27;
              }
              v118 = ServiceObjectFor_withParams_andAccessory;
              CWFGetOSLog();
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = v116;
              if (v95)
              {
                CWFGetOSLog();
                v94 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v94 = MEMORY[0x1E0C81028];
                v97 = MEMORY[0x1E0C81028];
              }
              v32 = obj;

              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
              {
                v130 = 136446978;
                v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
                v132 = 2082;
                v133 = "CWFHomeManager.m";
                v134 = 1024;
                v135 = 266;
                v136 = 1024;
                v137 = v118;
LABEL_40:
                _os_log_send_and_compose_impl();
              }
            }

            goto LABEL_69;
          }
        }
        v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v122, (uint64_t)v138, 16);
        if (v47)
          continue;
        break;
      }
LABEL_27:

    }
    v32 = obj;
    v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v126, (uint64_t)v139, 16);
  }
  while (v121);
LABEL_69:

  CWFGetOSLog();
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    CWFGetOSLog();
    v110 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v110 = MEMORY[0x1E0C81028];
    v111 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    v130 = 136446978;
    v131 = "-[CWFHomeManager registerForAccessoryStateChange:withParams:forCWFHMServiceType:]";
    v132 = 2082;
    v133 = "CWFHomeManager.m";
    v134 = 1024;
    v135 = 275;
    v136 = 1024;
    v137 = v118;
    _os_log_send_and_compose_impl();
  }

  return v118;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend__serviceQueue(self, a2, (uint64_t)a3, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06F08A8;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_async(v6, block);

}

- (HMHomeManager)_homeManager
{
  return self->__homeManager;
}

- (void)set_homeManager:(id)a3
{
  objc_storeStrong((id *)&self->__homeManager, a3);
}

- (BOOL)_isHomeInformationAvailable
{
  return self->__isHomeInformationAvailable;
}

- (void)set_isHomeInformationAvailable:(BOOL)a3
{
  self->__isHomeInformationAvailable = a3;
}

- (NSMutableDictionary)_serviceObjects
{
  return self->__serviceObjects;
}

- (void)set_serviceObjects:(id)a3
{
  objc_storeStrong((id *)&self->__serviceObjects, a3);
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__serviceQueue, a3);
}

- (NSObject)_activeAssertion
{
  return self->__activeAssertion;
}

- (void)set_activeAssertion:(id)a3
{
  objc_storeStrong((id *)&self->__activeAssertion, a3);
}

- (HMFLocationAuthorization)_homeLocationAuthorization
{
  return self->__homeLocationAuthorization;
}

- (void)set_homeLocationAuthorization:(id)a3
{
  objc_storeStrong((id *)&self->__homeLocationAuthorization, a3);
}

- (CWFSensingAutoDataCollector)_autoDataColletor
{
  return self->__autoDataColletor;
}

- (void)set_autoDataColletor:(id)a3
{
  objc_storeStrong((id *)&self->__autoDataColletor, a3);
}

- (CWFHomeManagerDelegate)_delegate
{
  return self->__delegate;
}

- (void)set_delegate:(id)a3
{
  objc_storeStrong((id *)&self->__delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__delegate, 0);
  objc_storeStrong((id *)&self->__autoDataColletor, 0);
  objc_storeStrong((id *)&self->__homeLocationAuthorization, 0);
  objc_storeStrong((id *)&self->__activeAssertion, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__serviceObjects, 0);
  objc_storeStrong((id *)&self->__homeManager, 0);
}

@end
