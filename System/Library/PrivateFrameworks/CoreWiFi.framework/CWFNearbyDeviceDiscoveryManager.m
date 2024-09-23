@implementation CWFNearbyDeviceDiscoveryManager

- (CWFNearbyDeviceDiscoveryManager)init
{
  CWFNearbyDeviceDiscoveryManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CWFNearbyDeviceDiscoveryManager *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_queue_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CWFNearbyDeviceDiscoveryManager;
  v2 = -[CWFNearbyDeviceDiscoveryManager init](&v18, sel_init);
  v6 = v2;
  if (v2)
  {
    objc_msgSend_set_didDriverCrash_(v2, v3, 0, v4, v5);
    objc_msgSend_set_currentNDDRequest_(v6, v7, 0, v8, v9);
    objc_msgSend_set_interface_(v6, v10, 0, v11, v12);
    v13 = dispatch_queue_create("com.apple.wifi.CWFNDDManager", 0);
    objc_msgSend_set_serviceQueue_(v6, v14, (uint64_t)v13, v15, v16);

  }
  return v6;
}

- (void)setSendNDDRequest:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  id sendNDDRequest;
  CWFNearbyDeviceDiscoveryParameter *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  CWFNearbyDeviceDiscoveryParameter *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  id v16;

  v6 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  sendNDDRequest = self->_sendNDDRequest;
  self->_sendNDDRequest = v6;

  v8 = objc_alloc_init(CWFNearbyDeviceDiscoveryParameter);
  v12 = v8;
  if (v8)
  {
    objc_msgSend_setOperation_(v8, v9, 2, v10, v11);
    if (objc_msgSend_handleNDDRequestWithParams_clientName_interface_(self, v13, (uint64_t)v12, 0, 0))
    {
      CWFGetOSLog();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        CWFGetOSLog();
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = MEMORY[0x1E0C81028];
        v16 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        _os_log_send_and_compose_impl();

    }
  }

}

- (int)handleEvent:(int64_t)a3 withData:(id)a4 interface:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  CWFNearbyDeviceDiscoveryManager *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _QWORD block[5];
  id v44;
  id v45;
  int v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    CWFGetOSLog();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      CWFGetOSLog();
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = MEMORY[0x1E0C81028];
      v29 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v46 = 136446722;
    v47 = "-[CWFNearbyDeviceDiscoveryManager handleEvent:withData:interface:]";
    v48 = 2082;
    v49 = "CWFNearbyDeviceDiscoveryManager.m";
    v50 = 1024;
    v51 = 105;
    goto LABEL_17;
  }
  if (a3 == 55)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend__serviceQueue(self, v16, v17, v18, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = sub_1B06DDF48;
      v37[3] = &unk_1E61333E0;
      v38 = v8;
      v39 = self;
      dispatch_sync(v20, v37);

      v15 = v38;
      goto LABEL_11;
    }
    CWFGetOSLog();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      CWFGetOSLog();
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = MEMORY[0x1E0C81028];
      v35 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v46 = 136446978;
    v47 = "-[CWFNearbyDeviceDiscoveryManager handleEvent:withData:interface:]";
    v48 = 2082;
    v49 = "CWFNearbyDeviceDiscoveryManager.m";
    v50 = 1024;
    v51 = 134;
    v52 = 2114;
    v53 = v8;
    goto LABEL_17;
  }
  if (a3 == 239)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend__serviceQueue(self, v21, v22, v23, v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = sub_1B06DDE1C;
      v40[3] = &unk_1E6133340;
      v40[4] = self;
      v41 = v8;
      v42 = v9;
      dispatch_sync(v25, v40);

      v15 = v41;
      goto LABEL_11;
    }
    CWFGetOSLog();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      CWFGetOSLog();
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = MEMORY[0x1E0C81028];
      v36 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v46 = 136446978;
    v47 = "-[CWFNearbyDeviceDiscoveryManager handleEvent:withData:interface:]";
    v48 = 2082;
    v49 = "CWFNearbyDeviceDiscoveryManager.m";
    v50 = 1024;
    v51 = 123;
    v52 = 2114;
    v53 = v8;
    goto LABEL_17;
  }
  if (a3 != 238)
  {
LABEL_19:
    v26 = -3900;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CWFGetOSLog();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      CWFGetOSLog();
      v28 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = MEMORY[0x1E0C81028];
      v34 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v46 = 136446978;
    v47 = "-[CWFNearbyDeviceDiscoveryManager handleEvent:withData:interface:]";
    v48 = 2082;
    v49 = "CWFNearbyDeviceDiscoveryManager.m";
    v50 = 1024;
    v51 = 112;
    v52 = 2114;
    v53 = v8;
LABEL_17:
    _os_log_send_and_compose_impl();
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend__serviceQueue(self, v10, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06DDCF0;
  block[3] = &unk_1E6133340;
  block[4] = self;
  v44 = v8;
  v45 = v9;
  dispatch_sync(v14, block);

  v15 = v44;
LABEL_11:

  v26 = 0;
LABEL_20:

  return v26;
}

- (int)handleRequest:(int64_t)a3 withData:(id)a4 interface:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  int v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  if (!v8)
  {
    CWFGetOSLog();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      CWFGetOSLog();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v30 = 136446722;
      v31 = "-[CWFNearbyDeviceDiscoveryManager handleRequest:withData:interface:]";
      v32 = 2082;
      v33 = "CWFNearbyDeviceDiscoveryManager.m";
      v34 = 1024;
      v35 = 163;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_18;
  }
  if (a3 != 238)
  {
    v15 = -3900;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CWFGetOSLog();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      CWFGetOSLog();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = MEMORY[0x1E0C81028];
      v21 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v30 = 136446978;
      v31 = "-[CWFNearbyDeviceDiscoveryManager handleRequest:withData:interface:]";
      v32 = 2082;
      v33 = "CWFNearbyDeviceDiscoveryManager.m";
      v34 = 1024;
      v35 = 170;
      v36 = 2114;
      v37 = v8;
      _os_log_send_and_compose_impl();
    }
LABEL_18:

    v15 = -3900;
    *((_DWORD *)v27 + 6) = -3900;
    goto LABEL_6;
  }
  objc_msgSend__serviceQueue(self, v10, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06DE338;
  block[3] = &unk_1E6135268;
  v25 = &v26;
  block[4] = self;
  v23 = v8;
  v24 = v9;
  dispatch_sync(v14, block);

  v15 = *((_DWORD *)v27 + 6);
LABEL_6:
  _Block_object_dispose(&v26, 8);

  return v15;
}

- (int)isNDDRequestValid:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  void *v59;
  id v60;
  id v61;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id v68;

  v3 = a3;
  v8 = v3;
  if (!v3)
  {
    CWFGetOSLog();
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
    {
      CWFGetOSLog();
      v49 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = MEMORY[0x1E0C81028];
      v66 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
LABEL_23:
    _os_log_send_and_compose_impl();
LABEL_24:

    v58 = -3900;
    goto LABEL_25;
  }
  if (objc_msgSend_operation(v3, v4, v5, v6, v7) < 1 || objc_msgSend_operation(v8, v9, v10, v11, v12) >= 3)
  {
    CWFGetOSLog();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      CWFGetOSLog();
      v49 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = MEMORY[0x1E0C81028];
      v65 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    goto LABEL_23;
  }
  if (objc_msgSend_operation(v8, v13, v14, v15, v16) != 2
    && (objc_msgSend_type(v8, v17, v18, v19, v20) < 1 || objc_msgSend_type(v8, v21, v22, v23, v24) >= 4))
  {
    CWFGetOSLog();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      CWFGetOSLog();
      v49 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v49 = MEMORY[0x1E0C81028];
      v61 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    goto LABEL_23;
  }
  if (objc_msgSend_operation(v8, v17, v18, v19, v20) == 1)
  {
    objc_msgSend_macIds(v8, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_count(v29, v30, v31, v32, v33))
    {

LABEL_10:
      CWFGetOSLog();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        CWFGetOSLog();
        v49 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = MEMORY[0x1E0C81028];
        v60 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      goto LABEL_23;
    }
    objc_msgSend_macIds(v8, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_count(v38, v39, v40, v41, v42);

    if (v43 >= 9)
      goto LABEL_10;
    if (objc_msgSend_type(v8, v44, v45, v46, v47) == 2
      && (objc_msgSend_channel(v8, v50, v51, v52, v53) < 1 || objc_msgSend_band(v8, v54, v55, v56, v57) <= 0))
    {
      CWFGetOSLog();
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v67)
      {
        CWFGetOSLog();
        v49 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v49 = MEMORY[0x1E0C81028];
        v68 = MEMORY[0x1E0C81028];
      }

      if (!os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  v58 = 0;
LABEL_25:

  return v58;
}

- (id)getRequestDataFromParams:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  ether_addr *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int8x8_t v62;
  void *v63;
  id v64;
  _OWORD v66[15];
  int v67;
  int v68;
  const char *v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v67 = 0;
  memset(v66, 0, sizeof(v66));
  objc_msgSend_macIds(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v8, v9, v10, v11, v12);

  if (!v13)
  {
    LODWORD(v18) = 0;
LABEL_7:
    HIDWORD(v66[0]) = v18;
    LOWORD(v66[1]) = v66[1] & 0xC700 | objc_msgSend_channel(v3, v14, v15, v16, v17) | 0x2000;
    if (objc_msgSend_band(v3, v42, v43, v44, v45) == 1)
    {
      v50 = v66[1] & 0x3FFF;
    }
    else if (objc_msgSend_band(v3, v46, v47, v48, v49) == 2)
    {
      v50 = LOWORD(v66[1]) | 0xC000;
    }
    else
    {
      if (objc_msgSend_band(v3, v46, v47, v48, v49) != 4)
      {
LABEL_16:
        if (objc_msgSend_operation(v3, v46, v47, v48, v49) == 1)
          v57 = 1;
        else
          v57 = 2;
        LODWORD(v66[0]) = v57;
        if (objc_msgSend_type(v3, v53, v54, v55, v56) == 1)
          v62 = (int8x8_t)0x12C00000001;
        else
          v62 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(objc_msgSend_type(v3, v58, v59, v60, v61) == 2), 0x1FuLL)), (int8x8_t)0x12C00000001, (int8x8_t)0x753000000002);
        *(int8x8_t *)((char *)v66 + 4) = v62;
        objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v58, (uint64_t)v66, 244, v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
      v50 = v66[1] & 0x3FFF | 0x4000;
    }
    LOWORD(v66[1]) = v50;
    goto LABEL_16;
  }
  v18 = 0;
  v19 = (char *)&v66[1] + 8;
  while (1)
  {
    objc_msgSend_macIds(v3, v14, v15, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v20, v21, v18, v22, v23);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = (const char *)objc_msgSend_UTF8String(v24, v25, v26, v27, v28);
    v30 = ether_aton(v29);

    if (!v30)
      break;
    v35 = *(_DWORD *)v30->octet;
    *((_WORD *)v19 + 7) = *(_WORD *)&v30->octet[4];
    *(_DWORD *)(v19 + 10) = v35;
    *(_DWORD *)v19 = 50;
    v19 += 28;
    ++v18;
    objc_msgSend_macIds(v3, v31, v32, v33, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend_count(v36, v37, v38, v39, v40);

    if (v18 >= v41)
      goto LABEL_7;
  }
  CWFGetOSLog();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    CWFGetOSLog();
    v52 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = MEMORY[0x1E0C81028];
    v64 = MEMORY[0x1E0C81028];
  }

  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    v68 = 136446978;
    v69 = "-[CWFNearbyDeviceDiscoveryManager getRequestDataFromParams:]";
    v70 = 2082;
    v71 = "CWFNearbyDeviceDiscoveryManager.m";
    v72 = 1024;
    v73 = 235;
    v74 = 2114;
    v75 = v3;
    _os_log_send_and_compose_impl();
  }

  v63 = 0;
LABEL_27:

  return v63;
}

- (int)handleNDDRequestWithParams:(id)a3 clientName:(id)a4 interface:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int isNDDRequestValid;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (**v33)(_QWORD, _QWORD, _QWORD);
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  char v39;
  uint64_t (**v40)(_QWORD, _QWORD);
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  id v71;
  id v72;
  id v73;
  id v74;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  isNDDRequestValid = objc_msgSend_isNDDRequestValid_(self, v11, (uint64_t)v8, v12, v13);
  if (isNDDRequestValid)
  {
    v41 = isNDDRequestValid;
    CWFGetOSLog();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      CWFGetOSLog();
      v64 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = MEMORY[0x1E0C81028];
      v71 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      _os_log_send_and_compose_impl();

    v28 = 0;
  }
  else
  {
    objc_msgSend_sendNDDRequest(self, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend_getRequestDataFromParams_(self, v20, (uint64_t)v8, v21, v22);
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v28 = (void *)v23;
        if (objc_msgSend_operation(v8, v24, v25, v26, v27) == 2
          || objc_msgSend_type(v8, v29, v30, v31, v32) == 3
          || (objc_msgSend_isNDDAllowed(self, v29, v30, v31, v32),
              v33 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
              v38 = objc_msgSend_band(v8, v34, v35, v36, v37) == 2,
              v39 = ((uint64_t (**)(_QWORD, id, _BOOL8))v33)[2](v33, v9, v38),
              v33,
              (v39 & 1) != 0))
        {
          objc_msgSend_sendNDDRequest(self, v29, v30, v31, v32);
          v40 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v41 = ((uint64_t (**)(_QWORD, void *))v40)[2](v40, v28);

          if (v41)
          {
            CWFGetOSLog();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (v69)
            {
              CWFGetOSLog();
              v70 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v70 = MEMORY[0x1E0C81028];
              v74 = MEMORY[0x1E0C81028];
            }

            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              _os_log_send_and_compose_impl();

          }
          else
          {
            if (objc_msgSend_operation(v8, v42, v43, v44, v45) == 1)
            {
              objc_msgSend_set_currentNDDRequest_(self, v46, (uint64_t)v8, v48, v49);
              objc_msgSend_set_interface_(self, v50, (uint64_t)v10, v51, v52);
            }
            else if (objc_msgSend_operation(v8, v46, v47, v48, v49) == 2)
            {
              objc_msgSend_set_currentNDDRequest_(self, v53, 0, v54, v55);
              objc_msgSend_set_interface_(self, v56, 0, v57, v58);
            }
            v41 = 0;
          }
        }
        else
        {
          CWFGetOSLog();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (v60)
          {
            CWFGetOSLog();
            v61 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v61 = MEMORY[0x1E0C81028];
            v62 = MEMORY[0x1E0C81028];
          }

          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            _os_log_send_and_compose_impl();

          v41 = -3930;
        }
      }
      else
      {
        CWFGetOSLog();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (v67)
        {
          CWFGetOSLog();
          v68 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v68 = MEMORY[0x1E0C81028];
          v73 = MEMORY[0x1E0C81028];
        }

        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          _os_log_send_and_compose_impl();

        v28 = 0;
        v41 = -3900;
      }
    }
    else
    {
      CWFGetOSLog();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        CWFGetOSLog();
        v66 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v66 = MEMORY[0x1E0C81028];
        v72 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        _os_log_send_and_compose_impl();

      v28 = 0;
      v41 = -3931;
    }
  }

  return v41;
}

- (id)getEDSResultFromReport:(id)a3
{
  id v3;
  CWFNearbyDeviceDiscoveryReport *v4;
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  uint64_t i;
  int v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v62;
  NSObject *v63;
  id v64;
  void *v65;
  id v66;

  v3 = a3;
  v4 = objc_alloc_init(CWFNearbyDeviceDiscoveryReport);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v3
    || (v6 = objc_retainAutorelease(v3), !objc_msgSend_bytes(v6, v7, v8, v9, v10))
    || objc_msgSend_length(v6, v11, v12, v13, v14) != 48)
  {
    CWFGetOSLog();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      CWFGetOSLog();
      v63 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = MEMORY[0x1E0C81028];
      v64 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
LABEL_27:
    _os_log_send_and_compose_impl();
LABEL_28:

    goto LABEL_17;
  }
  if (!v4 || !v5)
  {
    CWFGetOSLog();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      CWFGetOSLog();
      v63 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = MEMORY[0x1E0C81028];
      v66 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    goto LABEL_27;
  }
  v15 = objc_retainAutorelease(v6);
  v20 = objc_msgSend_bytes(v15, v16, v17, v18, v19);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeStamp_(v4, v26, (uint64_t)v25, v27, v28);

  v29 = (void *)MEMORY[0x1E0CB3940];
  v30 = ether_ntoa((const ether_addr *)(v20 + 22));
  objc_msgSend_stringWithUTF8String_(v29, v31, (uint64_t)v30, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMacId_(v4, v35, (uint64_t)v34, v36, v37);

  objc_msgSend_setFrameType_(v4, v38, *(unsigned int *)(v20 + 8), v39, v40);
  objc_msgSend_setBandwidth_(v4, v41, ((unint64_t)*(unsigned __int16 *)(v20 + 34) >> 11) & 7, v42, v43);
  objc_msgSend_setChannel_(v4, v44, *(unsigned __int8 *)(v20 + 34), v45, v46);
  v50 = *(unsigned __int16 *)(v20 + 34);
  if (v50 >= 0x4000)
  {
    v51 = v50 >> 14;
    if (v51 == 3)
    {
      objc_msgSend_setBand_(v4, v47, 2, v48, v49);
    }
    else if (v51 == 1)
    {
      objc_msgSend_setBand_(v4, v47, 4, v48, v49);
    }
  }
  else
  {
    objc_msgSend_setBand_(v4, v47, 1, v48, v49);
  }
  for (i = 0; i != 4; ++i)
  {
    v53 = *(unsigned __int8 *)(v20 + 2 + i);
    if ((v53 | 0x80) != 0x80)
    {
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v47, (char)v53, v48, v49);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v5, v55, (uint64_t)v54, v56, v57);

    }
  }
  objc_msgSend_setRssi_(v4, v47, (uint64_t)v5, v48, v49);
  objc_msgSend_setRateMbps_(v4, v58, *(unsigned int *)(v20 + 12), v59, v60);
LABEL_17:

  return v4;
}

- (int)handleNDDResultEvent:(id)a3 interface:(id)a4
{
  id v6;
  id v7;
  CWFXPCEvent *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (**v42)(_QWORD, _QWORD);
  int v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  const __CFString *v51;
  NSObject *v52;
  int v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CWFXPCEvent);
  objc_msgSend_sendNDDXPCEvent(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    CWFGetOSLog();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      CWFGetOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v48 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v53 = 136446722;
    v54 = "-[CWFNearbyDeviceDiscoveryManager handleNDDResultEvent:interface:]";
    v55 = 2082;
    v56 = "CWFNearbyDeviceDiscoveryManager.m";
    v57 = 1024;
    v58 = 361;
    goto LABEL_21;
  }
  if (!v6)
  {
    CWFGetOSLog();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      CWFGetOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v49 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v53 = 136446978;
    v54 = "-[CWFNearbyDeviceDiscoveryManager handleNDDResultEvent:interface:]";
    v55 = 2082;
    v56 = "CWFNearbyDeviceDiscoveryManager.m";
    v57 = 1024;
    v58 = 366;
    v59 = 2048;
    v60 = 0;
    goto LABEL_21;
  }
  objc_msgSend_getEDSResultFromReport_(self, v14, (uint64_t)v6, v15, v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    CWFGetOSLog();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      CWFGetOSLog();
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v50 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v53 = 136446978;
    v54 = "-[CWFNearbyDeviceDiscoveryManager handleNDDResultEvent:interface:]";
    v55 = 2082;
    v56 = "CWFNearbyDeviceDiscoveryManager.m";
    v57 = 1024;
    v58 = 372;
    v59 = 2048;
    v60 = v6;
LABEL_21:
    _os_log_send_and_compose_impl();
LABEL_22:
    v43 = -3931;
    goto LABEL_5;
  }
  v21 = v17;
  objc_msgSend_setType_(v8, v18, 35, v19, v20);
  objc_msgSend_date(MEMORY[0x1E0C99D68], v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimestamp_(v8, v27, (uint64_t)v26, v28, v29);

  objc_msgSend_setInterfaceName_(v8, v30, (uint64_t)v7, v31, v32);
  v51 = CFSTR("NDDResult");
  v52 = v21;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v33, (uint64_t)&v52, (uint64_t)&v51, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInfo_(v8, v35, (uint64_t)v34, v36, v37);

  objc_msgSend_sendNDDXPCEvent(self, v38, v39, v40, v41);
  v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, CWFXPCEvent *))v42)[2](v42, v8);

  v43 = 0;
LABEL_5:

  return v43;
}

- (int)handleNDDDoneEvent:(id)a3 interface:(id)a4
{
  id v6;
  id v7;
  CWFXPCEvent *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (**v46)(_QWORD, _QWORD);
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  void *v55;
  NSObject *v56;
  id v57;
  const __CFString *v58;
  void *v59;
  int v60;
  const char *v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CWFXPCEvent);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2FE0];
  v15 = objc_msgSend_integerValue(v7, v11, v12, v13, v14);

  objc_msgSend_errorWithDomain_code_userInfo_(v9, v16, v10, v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendNDDXPCEvent(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_setType_(v8, v23, 36, v24, v25);
    objc_msgSend_date(MEMORY[0x1E0C99D68], v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimestamp_(v8, v31, (uint64_t)v30, v32, v33);

    objc_msgSend_setInterfaceName_(v8, v34, (uint64_t)v6, v35, v36);
    v58 = CFSTR("NDDDone");
    v59 = v17;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)&v59, (uint64_t)&v58, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInfo_(v8, v39, (uint64_t)v38, v40, v41);

    objc_msgSend_sendNDDXPCEvent(self, v42, v43, v44, v45);
    v46 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CWFXPCEvent *))v46)[2](v46, v8);

    objc_msgSend_set_currentNDDRequest_(self, v47, 0, v48, v49);
    objc_msgSend_set_interface_(self, v50, 0, v51, v52);
    v53 = 0;
  }
  else
  {
    CWFGetOSLog();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      CWFGetOSLog();
      v56 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = MEMORY[0x1E0C81028];
      v57 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v60 = 136446722;
      v61 = "-[CWFNearbyDeviceDiscoveryManager handleNDDDoneEvent:interface:]";
      v62 = 2082;
      v63 = "CWFNearbyDeviceDiscoveryManager.m";
      v64 = 1024;
      v65 = 392;
      _os_log_send_and_compose_impl();
    }

    v53 = -3931;
  }

  return v53;
}

- (void)handleDextCrashEvent
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  id v31;

  objc_msgSend_set_didDriverCrash_(self, a2, 1, v2, v3);
  objc_msgSend__currentNDDRequest(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v14 = (void *)v9;
    objc_msgSend__currentNDDRequest(self, v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_type(v15, v16, v17, v18, v19);

    if (v20 != 3)
    {
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v21, -3931, v22, v23);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend__interface(self, v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleNDDDoneEvent_interface_(self, v29, (uint64_t)v31, (uint64_t)v28, v30);

    }
  }
}

- (void)handleDriverAvailableEvent
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
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)(_QWORD, _QWORD);
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;

  if (!objc_msgSend__didDriverCrash(self, a2, v2, v3, v4))
    goto LABEL_5;
  objc_msgSend__currentNDDRequest(self, v6, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_5;
  v12 = (void *)v10;
  objc_msgSend__currentNDDRequest(self, v6, v11, v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_type(v13, v14, v15, v16, v17);

  if (v18 != 3)
    goto LABEL_5;
  objc_msgSend_sendNDDRequest(self, v6, v19, v8, v9);
  v20 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend__currentNDDRequest(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getRequestDataFromParams_(self, v26, (uint64_t)v25, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = ((uint64_t (**)(_QWORD, void *))v20)[2](v20, v29);

  if (v30 != -3931)
  {
    CWFGetOSLog();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      CWFGetOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = MEMORY[0x1E0C81028];
      v33 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend__currentNDDRequest(self, v34, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();

    }
  }
  else
  {
LABEL_5:
    objc_msgSend_set_didDriverCrash_(self, v6, 0, v8, v9);
  }
}

- (id)sendNDDRequest
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)isNDDAllowed
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setIsNDDAllowed:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)sendNDDXPCEvent
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setSendNDDXPCEvent:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (CWFNearbyDeviceDiscoveryParameter)_currentNDDRequest
{
  return self->__currentNDDRequest;
}

- (void)set_currentNDDRequest:(id)a3
{
  objc_storeStrong((id *)&self->__currentNDDRequest, a3);
}

- (NSString)_interface
{
  return self->__interface;
}

- (void)set_interface:(id)a3
{
  objc_storeStrong((id *)&self->__interface, a3);
}

- (BOOL)_didDriverCrash
{
  return self->__didDriverCrash;
}

- (void)set_didDriverCrash:(BOOL)a3
{
  self->__didDriverCrash = a3;
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)set_serviceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__serviceQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__interface, 0);
  objc_storeStrong((id *)&self->__currentNDDRequest, 0);
  objc_storeStrong(&self->_sendNDDXPCEvent, 0);
  objc_storeStrong(&self->_isNDDAllowed, 0);
  objc_storeStrong(&self->_sendNDDRequest, 0);
}

@end
